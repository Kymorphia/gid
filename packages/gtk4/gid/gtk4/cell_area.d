/// Module for [CellArea] class
module gid.gtk4.cell_area;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.event;
import gid.gdk4.rectangle;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gobject2.param_spec;
import gid.gobject2.value;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_area_context;
import gid.gtk4.cell_editable;
import gid.gtk4.cell_layout;
import gid.gtk4.cell_layout_mixin;
import gid.gtk4.cell_renderer;
import gid.gtk4.snapshot;
import gid.gtk4.tree_iter;
import gid.gtk4.tree_model;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    An abstract class for laying out [gid.gtk4.cell_renderer.CellRenderer]s
    
    The [gid.gtk4.cell_area.CellArea] is an abstract class for [gid.gtk4.cell_layout.CellLayout]
    widgets (also referred to as "layouting widgets") to interface with
    an arbitrary number of [gid.gtk4.cell_renderer.CellRenderer]s and interact with the user
    for a given [gid.gtk4.tree_model.TreeModel] row.
    
    The cell area handles events, focus navigation, drawing and
    size requests and allocations for a given row of data.
    
    Usually users dont have to interact with the [gid.gtk4.cell_area.CellArea] directly
    unless they are implementing a cell-layouting widget themselves.
    
    ## Requesting area sizes
    
    As outlined in
    [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management),
    GTK uses a height-for-width
    geometry management system to compute the sizes of widgets and user
    interfaces. [gid.gtk4.cell_area.CellArea] uses the same semantics to calculate the
    size of an area for an arbitrary number of [gid.gtk4.tree_model.TreeModel] rows.
    
    When requesting the size of a cell area one needs to calculate
    the size for a handful of rows, and this will be done differently by
    different layouting widgets. For instance a [gid.gtk4.tree_view_column.TreeViewColumn]
    always lines up the areas from top to bottom while a [gid.gtk4.icon_view.IconView]
    on the other hand might enforce that all areas received the same
    width and wrap the areas around, requesting height for more cell
    areas when allocated less width.
    
    It’s also important for areas to maintain some cell
    alignments with areas rendered for adjacent rows (cells can
    appear “columnized” inside an area even when the size of
    cells are different in each row). For this reason the [gid.gtk4.cell_area.CellArea]
    uses a [gid.gtk4.cell_area_context.CellAreaContext] object to store the alignments
    and sizes along the way (as well as the overall largest minimum
    and natural size for all the rows which have been calculated
    with the said context).
    
    The [gid.gtk4.cell_area_context.CellAreaContext] is an opaque object specific to the
    [gid.gtk4.cell_area.CellArea] which created it (see [gid.gtk4.cell_area.CellArea.createContext]).
    
    The owning cell-layouting widget can create as many contexts as
    it wishes to calculate sizes of rows which should receive the
    same size in at least one orientation (horizontally or vertically),
    However, it’s important that the same [gid.gtk4.cell_area_context.CellAreaContext] which
    was used to request the sizes for a given [gid.gtk4.tree_model.TreeModel] row be
    used when rendering or processing events for that row.
    
    In order to request the width of all the rows at the root level
    of a [gid.gtk4.tree_model.TreeModel] one would do the following:
    
    ```c
    GtkTreeIter iter;
    int minimum_width;
    int natural_width;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_get_preferred_width (area, context, widget, NULL, NULL);
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    
    gtk_cell_area_context_get_preferred_width (context, &minimum_width, &natural_width);
    ```
    
    Note that in this example it’s not important to observe the
    returned minimum and natural width of the area for each row
    unless the cell-layouting object is actually interested in the
    widths of individual rows. The overall width is however stored
    in the accompanying [gid.gtk4.cell_area_context.CellAreaContext] object and can be consulted
    at any time.
    
    This can be useful since [gid.gtk4.cell_layout.CellLayout] widgets usually have to
    support requesting and rendering rows in treemodels with an
    exceedingly large amount of rows. The [gid.gtk4.cell_layout.CellLayout] widget in
    that case would calculate the required width of the rows in an
    idle or timeout source (see `func@GLib.timeout_add`) and when the widget
    is requested its actual width in `vfunc@Gtk.Widget.measure`
    it can simply consult the width accumulated so far in the
    [gid.gtk4.cell_area_context.CellAreaContext] object.
    
    A simple example where rows are rendered from top to bottom and
    take up the full width of the layouting widget would look like:
    
    ```c
    static void
    foo_get_preferred_width (GtkWidget *widget,
                             int       *minimum_size,
                             int       *natural_size)
    {
      Foo *self = FOO (widget);
      FooPrivate *priv = foo_get_instance_private (self);
    
      foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);
    
      gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
    }
    ```
    
    In the above example the `Foo` widget has to make sure that some
    row sizes have been calculated (the amount of rows that `Foo` judged
    was appropriate to request space for in a single timeout iteration)
    before simply returning the amount of space required by the area via
    the [gid.gtk4.cell_area_context.CellAreaContext].
    
    Requesting the height for width (or width for height) of an area is
    a similar task except in this case the [gid.gtk4.cell_area_context.CellAreaContext] does not
    store the data (actually, it does not know how much space the layouting
    widget plans to allocate it for every row. It’s up to the layouting
    widget to render each row of data with the appropriate height and
    width which was requested by the [gid.gtk4.cell_area.CellArea]).
    
    In order to request the height for width of all the rows at the
    root level of a [gid.gtk4.tree_model.TreeModel] one would do the following:
    
    ```c
    GtkTreeIter iter;
    int minimum_height;
    int natural_height;
    int full_minimum_height = 0;
    int full_natural_height = 0;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_get_preferred_height_for_width (area, context, widget,
                                                      width, &minimum_height, &natural_height);
    
        if (width_is_for_allocation)
           cache_row_height (&iter, minimum_height, natural_height);
    
        full_minimum_height += minimum_height;
        full_natural_height += natural_height;
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    ```
    
    Note that in the above example we would need to cache the heights
    returned for each row so that we would know what sizes to render the
    areas for each row. However we would only want to really cache the
    heights if the request is intended for the layouting widgets real
    allocation.
    
    In some cases the layouting widget is requested the height for an
    arbitrary for_width, this is a special case for layouting widgets
    who need to request size for tens of thousands  of rows. For this
    case it’s only important that the layouting widget calculate
    one reasonably sized chunk of rows and return that height
    synchronously. The reasoning here is that any layouting widget is
    at least capable of synchronously calculating enough height to fill
    the screen height (or scrolled window height) in response to a single
    call to `vfunc@Gtk.Widget.measure`. Returning
    a perfect height for width that is larger than the screen area is
    inconsequential since after the layouting receives an allocation
    from a scrolled window it simply continues to drive the scrollbar
    values while more and more height is required for the row heights
    that are calculated in the background.
    
    ## Rendering Areas
    
    Once area sizes have been acquired at least for the rows in the
    visible area of the layouting widget they can be rendered at
    `vfunc@Gtk.Widget.snapshot` time.
    
    A crude example of how to render all the rows at the root level
    runs as follows:
    
    ```c
    GtkAllocation allocation;
    GdkRectangle cell_area = { 0, };
    GtkTreeIter iter;
    int minimum_width;
    int natural_width;
    
    gtk_widget_get_allocation (widget, &allocation);
    cell_area.width = allocation.width;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        cell_area.height = get_cached_height_for_row (&iter);
    
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_render (area, context, widget, cr,
                              &cell_area, &cell_area, state_flags, FALSE);
    
        cell_area.y += cell_area.height;
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    ```
    
    Note that the cached height in this example really depends on how
    the layouting widget works. The layouting widget might decide to
    give every row its minimum or natural height or, if the model content
    is expected to fit inside the layouting widget without scrolling, it
    would make sense to calculate the allocation for each row at
    the time the widget is allocated using `func@Gtk.distribute_natural_allocation`.
    
    ## Handling Events and Driving Keyboard Focus
    
    Passing events to the area is as simple as handling events on any
    normal widget and then passing them to the [gid.gtk4.cell_area.CellArea.event]
    API as they come in. Usually [gid.gtk4.cell_area.CellArea] is only interested in
    button events, however some customized derived areas can be implemented
    who are interested in handling other events. Handling an event can
    trigger the [gid.gtk4.cell_area.CellArea.focusChanged] signal to fire; as well
    as [gid.gtk4.cell_area.CellArea.addEditable] in the case that an editable cell
    was clicked and needs to start editing. You can call
    [gid.gtk4.cell_area.CellArea.stopEditing] at any time to cancel any cell editing
    that is currently in progress.
    
    The [gid.gtk4.cell_area.CellArea] drives keyboard focus from cell to cell in a way
    similar to [gid.gtk4.widget.Widget]. For layouting widgets that support giving
    focus to cells it’s important to remember to pass [gid.gtk4.types.CellRendererState.Focused]
    to the area functions for the row that has focus and to tell the
    area to paint the focus at render time.
    
    Layouting widgets that accept focus on cells should implement the
    `vfunc@Gtk.Widget.focus` virtual method. The layouting widget is always
    responsible for knowing where [gid.gtk4.tree_model.TreeModel] rows are rendered inside
    the widget, so at `vfunc@Gtk.Widget.focus` time the layouting widget
    should use the [gid.gtk4.cell_area.CellArea] methods to navigate focus inside the area
    and then observe the [gid.gtk4.types.DirectionType] to pass the focus to adjacent
    rows and areas.
    
    A basic example of how the `vfunc@Gtk.Widget.focus` virtual method
    should be implemented:
    
    ```
    static gboolean
    foo_focus (GtkWidget       *widget,
               GtkDirectionType direction)
    {
      Foo *self = FOO (widget);
      FooPrivate *priv = foo_get_instance_private (self);
      int focus_row = priv->focus_row;
      gboolean have_focus = FALSE;
    
      if (!gtk_widget_has_focus (widget))
        gtk_widget_grab_focus (widget);
    
      valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, priv->focus_row);
      while (valid)
        {
          gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, FALSE, FALSE);
    
          if (gtk_cell_area_focus (priv->area, direction))
            {
               priv->focus_row = focus_row;
               have_focus = TRUE;
               break;
            }
          else
            {
              if (direction == GTK_DIR_RIGHT ||
                  direction == GTK_DIR_LEFT)
                break;
              else if (direction == GTK_DIR_UP ||
                       direction == GTK_DIR_TAB_BACKWARD)
               {
                  if (focus_row == 0)
                    break;
                  else
                   {
                      focus_row--;
                      valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, focus_row);
                   }
                }
              else
                {
                  if (focus_row == last_row)
                    break;
                  else
                    {
                      focus_row++;
                      valid = gtk_tree_model_iter_next (priv->model, &iter);
                    }
                }
            }
        }
        return have_focus;
    }
    ```
    
    Note that the layouting widget is responsible for matching the
    [gid.gtk4.types.DirectionType] values to the way it lays out its cells.
    
    ## Cell Properties
    
    The [gid.gtk4.cell_area.CellArea] introduces cell properties for [gid.gtk4.cell_renderer.CellRenderer]s.
    This provides some general interfaces for defining the relationship
    cell areas have with their cells. For instance in a [gid.gtk4.cell_area_box.CellAreaBox]
    a cell might “expand” and receive extra space when the area is allocated
    more than its full natural request, or a cell might be configured to “align”
    with adjacent rows which were requested and rendered with the same
    [gid.gtk4.cell_area_context.CellAreaContext].
    
    Use [gid.gtk4.cell_area_class.CellAreaClass.installCellProperty] to install cell
    properties for a cell area class and [gid.gtk4.cell_area_class.CellAreaClass.findCellProperty]
    or [gid.gtk4.cell_area_class.CellAreaClass.listCellProperties] to get information about
    existing cell properties.
    
    To set the value of a cell property, use [gid.gtk4.cell_area.CellArea.cellSetProperty],
    [gid.gtk4.cell_area.CellArea.cellSet] or [gid.gtk4.cell_area.CellArea.cellSetValist]. To obtain
    the value of a cell property, use [gid.gtk4.cell_area.CellArea.cellGetProperty]
    [gid.gtk4.cell_area.CellArea.cellGet] or [gid.gtk4.cell_area.CellArea.cellGetValist].

    Deprecated: List views use widgets for displaying their
        contents
*/
@gidGir("CellArea", "CellAreaClass")
class CellArea : gid.gobject2.initially_unowned.InitiallyUnowned, gid.gtk4.buildable.Buildable, gid.gtk4.cell_layout.CellLayout
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_area_get_type != &gidSymbolNotFound ? gtk_cell_area_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellArea";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellArea self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.cell_area.CellArea]
      Returns: New builder object
  */
  static CellAreaGidBuilder builder() nothrow
  {
    return new CellAreaGidBuilder;
  }

  /**
      Get `editWidget` property.
      Returns: The widget currently editing the edited cell
        
        This property is read-only and only changes as
        a result of a call [gid.gtk4.cell_area.CellArea.activateCell].
  */
  @property gid.gtk4.cell_editable.CellEditable editWidget() nothrow
  {
    return getEditWidget();
  }

  /**
      Get `editedCell` property.
      Returns: The cell in the area that is currently edited
        
        This property is read-only and only changes as
        a result of a call [gid.gtk4.cell_area.CellArea.activateCell].
  */
  @property gid.gtk4.cell_renderer.CellRenderer editedCell() nothrow
  {
    return getEditedCell();
  }

  /**
      Get `focusCell` property.
      Returns: The cell in the area that currently has focus
  */
  @property gid.gtk4.cell_renderer.CellRenderer focusCell() nothrow
  {
    return getFocusCell();
  }

  /**
      Set `focusCell` property.
      Params:
        propval = The cell in the area that currently has focus
  */
  @property void focusCell(gid.gtk4.cell_renderer.CellRenderer propval) nothrow
  {
    setFocusCell(propval);
  }

  mixin BuildableT!();
  mixin CellLayoutT!();

  /**
      Activates area, usually by activating the currently focused
      cell, however some subclasses which embed widgets in the area
      can also activate a widget if it currently has the focus.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context in context with the current row data
        widget = the [gid.gtk4.widget.Widget] that area is rendering on
        cellArea = the size and location of area relative to widget’s allocation
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State flags for area for this row of data.
        editOnly = if true then only cell renderers that are [gid.gtk4.types.CellRendererMode.Editable]
                      will be activated.
      Returns: Whether area was successfully activated.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncActivate(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags, bool editOnly)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.activate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activate(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, flags, editOnly);
    return _retval;
  }

  /**
      Adds renderer to area with the default child cell properties.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to add to area
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAdd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAdd(gid.gtk4.cell_renderer.CellRenderer renderer)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.add)
      return;

    _klass.add(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Applies any connected attributes to the renderers in
      area by pulling the values from tree_model.
  
      Params:
        treeModel = the [gid.gtk4.tree_model.TreeModel] to pull values from
        iter = the [gid.gtk4.tree_iter.TreeIter] in tree_model to apply values for (modified in place, changes are seen by the caller)
        isExpander = whether iter has children
        isExpanded = whether iter is expanded in the view and
                        children are visible
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncApplyAttributes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncApplyAttributes(gid.gtk4.tree_model.TreeModel treeModel, gid.gtk4.tree_iter.TreeIter iter, bool isExpander, bool isExpanded)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.applyAttributes)
      return;

    _klass.applyAttributes(cast(GtkCellArea*)this._cPtr, treeModel ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, isExpander, isExpanded);
  }

  /**
      This is sometimes needed for cases where rows need to share
      alignments in one orientation but may be separately grouped
      in the opposing orientation.
      
      For instance, [gid.gtk4.icon_view.IconView] creates all icons (rows) to have
      the same width and the cells theirin to have the same
      horizontal alignments. However each row of icons may have
      a separate collective height. [gid.gtk4.icon_view.IconView] uses this to
      request the heights of each row based on a context which
      was already used to request all the row widths that are
      to be displayed.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to copy
      Returns: a newly created [gid.gtk4.cell_area.CellArea]Context copy of context.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopyContext` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.cell_area_context.CellAreaContext vfuncCopyContext(gid.gtk4.cell_area_context.CellAreaContext context)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.copyContext)
      return typeof(return).init;

    GtkCellAreaContext* _cretval;
    _cretval = _klass.copyContext(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.cell_area.CellArea]Context to be used with area for
      all purposes. [gid.gtk4.cell_area.CellArea]Context stores geometry information
      for rows for which it was operated on, it is important to use
      the same context for the same row of data at all times (i.e.
      one should render and handle events with the same [gid.gtk4.cell_area.CellArea]Context
      which was used to request the size of those rows of data).
      Returns: a newly created [gid.gtk4.cell_area.CellArea]Context which can be used with area.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateContext` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.cell_area_context.CellAreaContext vfuncCreateContext()
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.createContext)
      return typeof(return).init;

    GtkCellAreaContext* _cretval;
    _cretval = _klass.createContext(cast(GtkCellArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Delegates event handling to a [gid.gtk4.cell_area.CellArea].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        event = the [gid.gdk4.event.Event] to handle
        cellArea = the widget relative coordinates for area
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State for area in this row.
      Returns: true if the event was handled by area.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncEvent(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.event.Event event, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.event)
      return typeof(return).init;

    int _retval;
    _retval = _klass.event(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, flags);
    return _retval;
  }

  /**
      This should be called by the area’s owning layout widget
      when focus is to be passed to area, or moved within area
      for a given direction and row data.
      
      Implementing [gid.gtk4.cell_area.CellArea] classes should implement this
      method to receive and navigate focus in its own way particular
      to how it lays out cells.
  
      Params:
        direction = the [gid.gtk4.types.DirectionType]
      Returns: true if focus remains inside area as a result of this call.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFocus(gid.gtk4.types.DirectionType direction)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.focus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.focus(cast(GtkCellArea*)this._cPtr, direction);
    return _retval;
  }

  /**
      Calls callback for every [gid.gtk4.cell_renderer.CellRenderer] in area.
  
      Params:
        callback = the [gid.gtk4.types.CellCallback] to call
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncForeach` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncForeach(gid.gtk4.types.CellCallback callback)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.foreach_)
      return;

    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.CellCallback*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CellCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    _klass.foreach_(cast(GtkCellArea*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Calls callback for every [gid.gtk4.cell_renderer.CellRenderer] in area with the
      allocated rectangle inside cell_area.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        cellArea = the widget relative coordinates and size for area
        backgroundArea = the widget relative coordinates of the background area
        callback = the [gid.gtk4.types.CellAllocCallback] to call
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncForeachAlloc` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncForeachAlloc(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gtk4.types.CellAllocCallback callback)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.foreachAlloc)
      return;

    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, const(GdkRectangle)* cellArea, const(GdkRectangle)* cellBackground, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.CellAllocCallback*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take), *cast(gid.gdk4.rectangle.Rectangle*)cellArea, *cast(gid.gdk4.rectangle.Rectangle*)cellBackground);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CellAllocCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    _klass.foreachAlloc(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, cast(const(GdkRectangle)*)&backgroundArea, _callbackCB, _callback);
  }

  /**
      This should be implemented to report the values of
        child cell properties for a given child [gid.gtk4.cell_renderer.CellRenderer].
  
      Params:
        renderer = 
        propertyId = 
        value =  (modified in place, changes are seen by the caller)
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCellProperty` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetCellProperty(gid.gtk4.cell_renderer.CellRenderer renderer, uint propertyId, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getCellProperty)
      return;

    _klass.getCellProperty(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, propertyId, value ? cast(GValue*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Retrieves a cell area’s initial minimum and natural height.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_height and natural_height of this call but rather to
      consult [gid.gtk4.cell_area_context.CellAreaContext.getPreferredHeight] after a series of
      requests.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to perform this request with
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        minimumHeight = location to store the minimum height
        naturalHeight = location to store the natural height
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeight(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getPreferredHeight)
      return;

    _klass.getPreferredHeight(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s minimum and natural height if it would be given
      the specified width.
      
      area stores some geometrical information in context along the way
      while calling [gid.gtk4.cell_area.CellArea.getPreferredWidth]. It’s important to
      perform a series of [gid.gtk4.cell_area.CellArea.getPreferredWidth] requests with
      context first and then call [gid.gtk4.cell_area.CellArea.getPreferredHeightForWidth]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the width of a single row changes, it should be
      requested with [gid.gtk4.cell_area.CellArea.getPreferredWidth] again and then
      the full width of the requested rows checked again with
      [gid.gtk4.cell_area_context.CellAreaContext.getPreferredWidth].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context which has already been requested for widths.
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        width = the width for which to check the height of this area
        minimumHeight = location to store the minimum height
        naturalHeight = location to store the natural height
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightForWidth(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getPreferredHeightForWidth)
      return;

    _klass.getPreferredHeightForWidth(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s initial minimum and natural width.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_width and natural_width of this call but rather to
      consult [gid.gtk4.cell_area_context.CellAreaContext.getPreferredWidth] after a series of
      requests.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to perform this request with
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        minimumWidth = location to store the minimum width
        naturalWidth = location to store the natural width
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidth(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getPreferredWidth)
      return;

    _klass.getPreferredWidth(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Retrieves a cell area’s minimum and natural width if it would be given
      the specified height.
      
      area stores some geometrical information in context along the way
      while calling [gid.gtk4.cell_area.CellArea.getPreferredHeight]. It’s important to
      perform a series of [gid.gtk4.cell_area.CellArea.getPreferredHeight] requests with
      context first and then call [gid.gtk4.cell_area.CellArea.getPreferredWidthForHeight]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the height of a single row changes, it should be
      requested with [gid.gtk4.cell_area.CellArea.getPreferredHeight] again and then
      the full height of the requested rows checked again with
      [gid.gtk4.cell_area_context.CellAreaContext.getPreferredHeight].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context which has already been requested for widths.
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        height = the height for which to check the width of this area
        minimumWidth = location to store the minimum width
        naturalWidth = location to store the natural width
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidthForHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidthForHeight(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getPreferredWidthForHeight)
      return;

    _klass.getPreferredWidthForHeight(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the area prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by area.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.types.SizeRequestMode vfuncGetRequestMode()
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkCellArea*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Returns whether the area can do anything when activated,
      after applying new attributes to area.
      Returns: whether area can do anything when activated.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsActivatable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsActivatable()
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.isActivatable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isActivatable(cast(GtkCellArea*)this._cPtr);
    return _retval;
  }

  /**
      Removes renderer from area.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to remove from area
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRemove` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRemove(gid.gtk4.cell_renderer.CellRenderer renderer)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.remove)
      return;

    _klass.remove(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      This should be implemented to handle changes in child
        cell properties for a given [gid.gtk4.cell_renderer.CellRenderer] that were previously
        installed on the [gid.gtk4.cell_area_class.CellAreaClass] with [gid.gtk4.cell_area_class.CellAreaClass.installCellProperty].
  
      Params:
        renderer = 
        propertyId = 
        value = 
        pspec = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCellProperty` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetCellProperty(gid.gtk4.cell_renderer.CellRenderer renderer, uint propertyId, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.setCellProperty)
      return;

    _klass.setCellProperty(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, propertyId, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Snapshots area’s cells according to area’s layout onto at
      the given coordinates.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        snapshot = the [gid.gtk4.snapshot.Snapshot] to draw to
        backgroundArea = the widget relative coordinates for area’s background
        cellArea = the widget relative coordinates for area
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State for area in this row.
        paintFocus = whether area should paint focus on focused cells for focused rows or not.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSnapshot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSnapshot(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gtk4.snapshot.Snapshot snapshot, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags, bool paintFocus)
  {
    auto _klass = cast(GtkCellAreaClass*)_vfuncClass;
    if (!_klass.snapshot)
      return;

    _klass.snapshot(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags, paintFocus);
  }

  /**
      Activates area, usually by activating the currently focused
      cell, however some subclasses which embed widgets in the area
      can also activate a widget if it currently has the focus.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context in context with the current row data
        widget = the [gid.gtk4.widget.Widget] that area is rendering on
        cellArea = the size and location of area relative to widget’s allocation
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State flags for area for this row of data.
        editOnly = if true then only cell renderers that are [gid.gtk4.types.CellRendererMode.Editable]
                      will be activated.
      Returns: Whether area was successfully activated.
  */
  bool activate(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags, bool editOnly) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_activate(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, flags, editOnly);
    return _retval;
  }

  /**
      This is used by [gid.gtk4.cell_area.CellArea] subclasses when handling events
      to activate cells, the base [gid.gtk4.cell_area.CellArea] class activates cells
      for keyboard events for free in its own GtkCellArea->activate()
      implementation.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] that area is rendering onto
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] in area to activate
        event = the [gid.gdk4.event.Event] for which cell activation should occur
        cellArea = the [gid.gtk4.types.Rectangle] in widget relative coordinates
                      of renderer for the current row.
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State for renderer
      Returns: whether cell activation was successful
  */
  bool activateCell(gid.gtk4.widget.Widget widget, gid.gtk4.cell_renderer.CellRenderer renderer, gid.gdk4.event.Event event, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_activate_cell(cast(GtkCellArea*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, flags);
    return _retval;
  }

  /**
      Adds renderer to area with the default child cell properties.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to add to area
  */
  void add(gid.gtk4.cell_renderer.CellRenderer renderer) nothrow
  {
    gtk_cell_area_add(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Adds sibling to renderer’s focusable area, focus will be drawn
      around renderer and all of its siblings if renderer can
      focus for a given row.
      
      Events handled by focus siblings can also activate the given
      focusable renderer.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] expected to have focus
        sibling = the [gid.gtk4.cell_renderer.CellRenderer] to add to renderer’s focus area
  */
  void addFocusSibling(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.cell_renderer.CellRenderer sibling) nothrow
  {
    gtk_cell_area_add_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Applies any connected attributes to the renderers in
      area by pulling the values from tree_model.
  
      Params:
        treeModel = the [gid.gtk4.tree_model.TreeModel] to pull values from
        iter = the [gid.gtk4.tree_iter.TreeIter] in tree_model to apply values for
        isExpander = whether iter has children
        isExpanded = whether iter is expanded in the view and
                        children are visible
  */
  void applyAttributes(gid.gtk4.tree_model.TreeModel treeModel, gid.gtk4.tree_iter.TreeIter iter, bool isExpander, bool isExpanded) nothrow
  {
    gtk_cell_area_apply_attributes(cast(GtkCellArea*)this._cPtr, treeModel ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, isExpander, isExpanded);
  }

  /**
      Connects an attribute to apply values from column for the
      [gid.gtk4.tree_model.TreeModel] in use.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to connect an attribute for
        attribute = the attribute name
        column = the [gid.gtk4.tree_model.TreeModel] column to fetch attribute values from
  */
  void attributeConnect(gid.gtk4.cell_renderer.CellRenderer renderer, string attribute, int column) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    gtk_cell_area_attribute_connect(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute, column);
  }

  /**
      Disconnects attribute for the renderer in area so that
      attribute will no longer be updated with values from the
      model.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to disconnect an attribute for
        attribute = the attribute name
  */
  void attributeDisconnect(gid.gtk4.cell_renderer.CellRenderer renderer, string attribute) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    gtk_cell_area_attribute_disconnect(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute);
  }

  /**
      Returns the model column that an attribute has been mapped to,
      or -1 if the attribute is not mapped.
  
      Params:
        renderer = a [gid.gtk4.cell_renderer.CellRenderer]
        attribute = an attribute on the renderer
      Returns: the model column, or -1
  */
  int attributeGetColumn(gid.gtk4.cell_renderer.CellRenderer renderer, string attribute) nothrow
  {
    int _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = gtk_cell_area_attribute_get_column(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute);
    return _retval;
  }

  /**
      Gets the value of a cell property for renderer in area.
  
      Params:
        renderer = a [gid.gtk4.cell_renderer.CellRenderer] inside area
        propertyName = the name of the property to get
        value = a location to return the value
  */
  void cellGetProperty(gid.gtk4.cell_renderer.CellRenderer renderer, string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    gtk_cell_area_cell_get_property(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets a cell property for renderer in area.
  
      Params:
        renderer = a [gid.gtk4.cell_renderer.CellRenderer] inside area
        propertyName = the name of the cell property to set
        value = the value to set the cell property to
  */
  void cellSetProperty(gid.gtk4.cell_renderer.CellRenderer renderer, string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    gtk_cell_area_cell_set_property(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      This is sometimes needed for cases where rows need to share
      alignments in one orientation but may be separately grouped
      in the opposing orientation.
      
      For instance, [gid.gtk4.icon_view.IconView] creates all icons (rows) to have
      the same width and the cells theirin to have the same
      horizontal alignments. However each row of icons may have
      a separate collective height. [gid.gtk4.icon_view.IconView] uses this to
      request the heights of each row based on a context which
      was already used to request all the row widths that are
      to be displayed.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to copy
      Returns: a newly created [gid.gtk4.cell_area.CellArea]Context copy of context.
  */
  gid.gtk4.cell_area_context.CellAreaContext copyContext(gid.gtk4.cell_area_context.CellAreaContext context) nothrow
  {
    GtkCellAreaContext* _cretval;
    _cretval = gtk_cell_area_copy_context(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.cell_area.CellArea]Context to be used with area for
      all purposes. [gid.gtk4.cell_area.CellArea]Context stores geometry information
      for rows for which it was operated on, it is important to use
      the same context for the same row of data at all times (i.e.
      one should render and handle events with the same [gid.gtk4.cell_area.CellArea]Context
      which was used to request the size of those rows of data).
      Returns: a newly created [gid.gtk4.cell_area.CellArea]Context which can be used with area.
  */
  gid.gtk4.cell_area_context.CellAreaContext createContext() nothrow
  {
    GtkCellAreaContext* _cretval;
    _cretval = gtk_cell_area_create_context(cast(GtkCellArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Delegates event handling to a [gid.gtk4.cell_area.CellArea].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        event = the [gid.gdk4.event.Event] to handle
        cellArea = the widget relative coordinates for area
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State for area in this row.
      Returns: true if the event was handled by area.
  */
  int event(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.event.Event event, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags) nothrow
  {
    int _retval;
    _retval = gtk_cell_area_event(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, flags);
    return _retval;
  }

  /**
      This should be called by the area’s owning layout widget
      when focus is to be passed to area, or moved within area
      for a given direction and row data.
      
      Implementing [gid.gtk4.cell_area.CellArea] classes should implement this
      method to receive and navigate focus in its own way particular
      to how it lays out cells.
  
      Params:
        direction = the [gid.gtk4.types.DirectionType]
      Returns: true if focus remains inside area as a result of this call.
  */
  bool focus(gid.gtk4.types.DirectionType direction) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_focus(cast(GtkCellArea*)this._cPtr, direction);
    return _retval;
  }

  /**
      Calls callback for every [gid.gtk4.cell_renderer.CellRenderer] in area.
  
      Params:
        callback = the [gid.gtk4.types.CellCallback] to call
  */
  void foreach_(gid.gtk4.types.CellCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.CellCallback*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CellCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_cell_area_foreach(cast(GtkCellArea*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Calls callback for every [gid.gtk4.cell_renderer.CellRenderer] in area with the
      allocated rectangle inside cell_area.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        cellArea = the widget relative coordinates and size for area
        backgroundArea = the widget relative coordinates of the background area
        callback = the [gid.gtk4.types.CellAllocCallback] to call
  */
  void foreachAlloc(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gtk4.types.CellAllocCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, const(GdkRectangle)* cellArea, const(GdkRectangle)* cellBackground, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.CellAllocCallback*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take), *cast(gid.gdk4.rectangle.Rectangle*)cellArea, *cast(gid.gdk4.rectangle.Rectangle*)cellBackground);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.CellAllocCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_cell_area_foreach_alloc(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, cast(const(GdkRectangle)*)&backgroundArea, _callbackCB, _callback);
  }

  /**
      Derives the allocation of renderer inside area if area
      were to be rendered in cell_area.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context used to hold sizes for area.
        widget = the [gid.gtk4.widget.Widget] that area is rendering on
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to get the allocation for
        cellArea = the whole allocated area for area in widget
                      for this row
        allocation = where to store the allocation for renderer
  */
  void getCellAllocation(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gtk4.cell_renderer.CellRenderer renderer, gid.gdk4.rectangle.Rectangle cellArea, out gid.gdk4.rectangle.Rectangle allocation) nothrow
  {
    gtk_cell_area_get_cell_allocation(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&allocation);
  }

  /**
      Gets the [gid.gtk4.cell_renderer.CellRenderer] at `x` and `y` coordinates inside area and optionally
      returns the full cell allocation for it inside cell_area.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context used to hold sizes for area.
        widget = the [gid.gtk4.widget.Widget] that area is rendering on
        cellArea = the whole allocated area for area in widget
            for this row
        x = the x position
        y = the y position
        allocArea = where to store the inner allocated area of the
            returned cell renderer
      Returns: the [gid.gtk4.cell_renderer.CellRenderer] at `x` and `y`.
  */
  gid.gtk4.cell_renderer.CellRenderer getCellAtPosition(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, int x, int y, out gid.gdk4.rectangle.Rectangle allocArea) nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_cell_at_position(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, x, y, cast(GdkRectangle*)&allocArea);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current [gid.gtk4.tree_path.TreePath] string for the currently
      applied [gid.gtk4.tree_iter.TreeIter], this is implicitly updated when
      [gid.gtk4.cell_area.CellArea.applyAttributes] is called and can be
      used to interact with renderers from [gid.gtk4.cell_area.CellArea]
      subclasses.
      Returns: The current [gid.gtk4.tree_path.TreePath] string for the current
        attributes applied to area. This string belongs to the area and
        should not be freed.
  */
  string getCurrentPathString() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_cell_area_get_current_path_string(cast(GtkCellArea*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the [gid.gtk4.cell_editable.CellEditable] widget currently used
      to edit the currently edited cell.
      Returns: The currently active [gid.gtk4.cell_editable.CellEditable] widget
  */
  gid.gtk4.cell_editable.CellEditable getEditWidget() nothrow
  {
    GtkCellEditable* _cretval;
    _cretval = gtk_cell_area_get_edit_widget(cast(GtkCellArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gtk4.cell_renderer.CellRenderer] in area that is currently
      being edited.
      Returns: The currently edited [gid.gtk4.cell_renderer.CellRenderer]
  */
  gid.gtk4.cell_renderer.CellRenderer getEditedCell() nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_edited_cell(cast(GtkCellArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the currently focused cell for area
      Returns: the currently focused cell in area.
  */
  gid.gtk4.cell_renderer.CellRenderer getFocusCell() nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_focus_cell(cast(GtkCellArea*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gtk4.cell_renderer.CellRenderer] which is expected to be focusable
      for which renderer is, or may be a sibling.
      
      This is handy for [gid.gtk4.cell_area.CellArea] subclasses when handling events,
      after determining the renderer at the event location it can
      then chose to activate the focus cell for which the event
      cell may have been a sibling.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer]
      Returns: the [gid.gtk4.cell_renderer.CellRenderer]
          for which renderer is a sibling
  */
  gid.gtk4.cell_renderer.CellRenderer getFocusFromSibling(gid.gtk4.cell_renderer.CellRenderer renderer) nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_focus_from_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the focus sibling cell renderers for renderer.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] expected to have focus
      Returns: A [gid.glib2.list.List] of [gid.gtk4.cell_renderer.CellRenderer]s.
              The returned list is internal and should not be freed.
  */
  gid.gtk4.cell_renderer.CellRenderer[] getFocusSiblings(gid.gtk4.cell_renderer.CellRenderer renderer) nothrow
  {
    const(GList)* _cretval;
    _cretval = gtk_cell_area_get_focus_siblings(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    auto _retval = gListToD!(gid.gtk4.cell_renderer.CellRenderer, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves a cell area’s initial minimum and natural height.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_height and natural_height of this call but rather to
      consult [gid.gtk4.cell_area_context.CellAreaContext.getPreferredHeight] after a series of
      requests.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to perform this request with
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        minimumHeight = location to store the minimum height
        naturalHeight = location to store the natural height
  */
  void getPreferredHeight(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_area_get_preferred_height(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s minimum and natural height if it would be given
      the specified width.
      
      area stores some geometrical information in context along the way
      while calling [gid.gtk4.cell_area.CellArea.getPreferredWidth]. It’s important to
      perform a series of [gid.gtk4.cell_area.CellArea.getPreferredWidth] requests with
      context first and then call [gid.gtk4.cell_area.CellArea.getPreferredHeightForWidth]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the width of a single row changes, it should be
      requested with [gid.gtk4.cell_area.CellArea.getPreferredWidth] again and then
      the full width of the requested rows checked again with
      [gid.gtk4.cell_area_context.CellAreaContext.getPreferredWidth].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context which has already been requested for widths.
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        width = the width for which to check the height of this area
        minimumHeight = location to store the minimum height
        naturalHeight = location to store the natural height
  */
  void getPreferredHeightForWidth(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_area_get_preferred_height_for_width(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s initial minimum and natural width.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_width and natural_width of this call but rather to
      consult [gid.gtk4.cell_area_context.CellAreaContext.getPreferredWidth] after a series of
      requests.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context to perform this request with
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        minimumWidth = location to store the minimum width
        naturalWidth = location to store the natural width
  */
  void getPreferredWidth(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_area_get_preferred_width(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Retrieves a cell area’s minimum and natural width if it would be given
      the specified height.
      
      area stores some geometrical information in context along the way
      while calling [gid.gtk4.cell_area.CellArea.getPreferredHeight]. It’s important to
      perform a series of [gid.gtk4.cell_area.CellArea.getPreferredHeight] requests with
      context first and then call [gid.gtk4.cell_area.CellArea.getPreferredWidthForHeight]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the height of a single row changes, it should be
      requested with [gid.gtk4.cell_area.CellArea.getPreferredHeight] again and then
      the full height of the requested rows checked again with
      [gid.gtk4.cell_area_context.CellAreaContext.getPreferredHeight].
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context which has already been requested for widths.
        widget = the [gid.gtk4.widget.Widget] where area will be rendering
        height = the height for which to check the width of this area
        minimumWidth = location to store the minimum width
        naturalWidth = location to store the natural width
  */
  void getPreferredWidthForHeight(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_area_get_preferred_width_for_height(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the area prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by area.
  */
  gid.gtk4.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_cell_area_get_request_mode(cast(GtkCellArea*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Checks if area contains renderer.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to check
      Returns: true if renderer is in the area.
  */
  bool hasRenderer(gid.gtk4.cell_renderer.CellRenderer renderer) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_has_renderer(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This is a convenience function for [gid.gtk4.cell_area.CellArea] implementations
      to get the inner area where a given [gid.gtk4.cell_renderer.CellRenderer] will be
      rendered. It removes any padding previously added by [gid.gtk4.cell_area.CellArea.requestRenderer].
  
      Params:
        widget = the [gid.gtk4.widget.Widget] that area is rendering onto
        cellArea = the widget relative coordinates where one of area’s cells
                      is to be placed
        innerArea = the return location for the inner cell area
  */
  void innerCellArea(gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle cellArea, out gid.gdk4.rectangle.Rectangle innerArea) nothrow
  {
    gtk_cell_area_inner_cell_area(cast(GtkCellArea*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&innerArea);
  }

  /**
      Returns whether the area can do anything when activated,
      after applying new attributes to area.
      Returns: whether area can do anything when activated.
  */
  bool isActivatable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_is_activatable(cast(GtkCellArea*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether sibling is one of renderer’s focus siblings
      (see [gid.gtk4.cell_area.CellArea.addFocusSibling]).
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] expected to have focus
        sibling = the [gid.gtk4.cell_renderer.CellRenderer] to check against renderer’s sibling list
      Returns: true if sibling is a focus sibling of renderer
  */
  bool isFocusSibling(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.cell_renderer.CellRenderer sibling) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_is_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes renderer from area.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to remove from area
  */
  void remove(gid.gtk4.cell_renderer.CellRenderer renderer) nothrow
  {
    gtk_cell_area_remove(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Removes sibling from renderer’s focus sibling list
      (see [gid.gtk4.cell_area.CellArea.addFocusSibling]).
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] expected to have focus
        sibling = the [gid.gtk4.cell_renderer.CellRenderer] to remove from renderer’s focus area
  */
  void removeFocusSibling(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.cell_renderer.CellRenderer sibling) nothrow
  {
    gtk_cell_area_remove_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
  }

  /**
      This is a convenience function for [gid.gtk4.cell_area.CellArea] implementations
      to request size for cell renderers. It’s important to use this
      function to request size and then use [gid.gtk4.cell_area.CellArea.innerCellArea]
      at render and event time since this function will add padding
      around the cell for focus painting.
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to request size for
        orientation = the [gid.gtk4.types.Orientation] in which to request size
        widget = the [gid.gtk4.widget.Widget] that area is rendering onto
        forSize = the allocation contextual size to request for, or -1 if
          the base request for the orientation is to be returned.
        minimumSize = location to store the minimum size
        naturalSize = location to store the natural size
  */
  void requestRenderer(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.types.Orientation orientation, gid.gtk4.widget.Widget widget, int forSize, out int minimumSize, out int naturalSize) nothrow
  {
    gtk_cell_area_request_renderer(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, orientation, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, forSize, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Explicitly sets the currently focused cell to renderer.
      
      This is generally called by implementations of
      `GtkCellAreaClass.focus()` or `GtkCellAreaClass.event()`,
      however it can also be used to implement functions such
      as [gid.gtk4.tree_view.TreeView.setCursorOnCell].
  
      Params:
        renderer = the [gid.gtk4.cell_renderer.CellRenderer] to give focus to
  */
  void setFocusCell(gid.gtk4.cell_renderer.CellRenderer renderer = null) nothrow
  {
    gtk_cell_area_set_focus_cell(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Snapshots area’s cells according to area’s layout onto at
      the given coordinates.
  
      Params:
        context = the [gid.gtk4.cell_area.CellArea]Context for this row of data.
        widget = the [gid.gtk4.widget.Widget] that area is rendering to
        snapshot = the [gid.gtk4.snapshot.Snapshot] to draw to
        backgroundArea = the widget relative coordinates for area’s background
        cellArea = the widget relative coordinates for area
        flags = the [gid.gtk4.cell_renderer.CellRenderer]State for area in this row.
        paintFocus = whether area should paint focus on focused cells for focused rows or not.
  */
  void snapshot(gid.gtk4.cell_area_context.CellAreaContext context, gid.gtk4.widget.Widget widget, gid.gtk4.snapshot.Snapshot snapshot, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags, bool paintFocus) nothrow
  {
    gtk_cell_area_snapshot(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags, paintFocus);
  }

  /**
      Explicitly stops the editing of the currently edited cell.
      
      If canceled is true, the currently edited cell renderer
      will emit the ::editing-canceled signal, otherwise the
      the ::editing-done signal will be emitted on the current
      edit widget.
      
      See [gid.gtk4.cell_area.CellArea.getEditedCell] and [gid.gtk4.cell_area.CellArea.getEditWidget].
  
      Params:
        canceled = whether editing was canceled.
  */
  void stopEditing(bool canceled) nothrow
  {
    gtk_cell_area_stop_editing(cast(GtkCellArea*)this._cPtr, canceled);
  }

  /**
      Connect to `AddEditable` signal.
  
      Indicates that editing has started on renderer and that editable
        should be added to the owning cell-layouting widget at cell_area.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.cell_editable.CellEditable editable, gid.gdk4.rectangle.Rectangle area, string path, gid.gtk4.cell_area.CellArea cellArea)`
  
          `renderer` the [gid.gtk4.cell_renderer.CellRenderer] that started the edited (optional)
  
          `editable` the [gid.gtk4.cell_editable.CellEditable] widget to add (optional)
  
          `area` the [gid.gtk4.widget.Widget] relative [gid.gtk4.types.Rectangle] coordinates
                        where editable should be added (optional)
  
          `path` the [gid.gtk4.tree_path.TreePath] string this edit was initiated for (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAddEditable(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.cell_editable.CellEditable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk4.rectangle.Rectangle)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.cell_area.CellArea)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.addEditable");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-editable", closure, after);
  }

  /**
      Connect to `ApplyAttributes` signal.
  
      This signal is emitted whenever applying attributes to area from model
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_iter.TreeIter iter, bool isExpander, bool isExpanded, gid.gtk4.cell_area.CellArea cellArea)`
  
          `model` the [gid.gtk4.tree_model.TreeModel] to apply the attributes from (optional)
  
          `iter` the [gid.gtk4.tree_iter.TreeIter] indicating which row to apply the attributes of (optional)
  
          `isExpander` whether the view shows children for this row (optional)
  
          `isExpanded` whether the view is currently showing the children of this row (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectApplyAttributes(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.tree_model.TreeModel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk4.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.cell_area.CellArea)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.applyAttributes");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("apply-attributes", closure, after);
  }

  /**
      Connect to `FocusChanged` signal.
  
      Indicates that focus changed on this area. This signal
        is emitted either as a result of focus handling or event
        handling.
        
        It's possible that the signal is emitted even if the
        currently focused renderer did not change, this is
        because focus may change to the same renderer in the
        same cell area for a different row of data.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.cell_renderer.CellRenderer renderer, string path, gid.gtk4.cell_area.CellArea cellArea)`
  
          `renderer` the [gid.gtk4.cell_renderer.CellRenderer] that has focus (optional)
  
          `path` the current [gid.gtk4.tree_path.TreePath] string set for area (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.cell_area.CellArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.focusChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-changed", closure, after);
  }

  /**
      Connect to `RemoveEditable` signal.
  
      Indicates that editing finished on renderer and that editable
        should be removed from the owning cell-layouting widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gtk4.cell_editable.CellEditable editable, gid.gtk4.cell_area.CellArea cellArea)`
  
          `renderer` the [gid.gtk4.cell_renderer.CellRenderer] that finished editeding (optional)
  
          `editable` the [gid.gtk4.cell_editable.CellEditable] widget to remove (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRemoveEditable(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.cell_editable.CellEditable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.cell_area.CellArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.removeEditable");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-editable", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellArea
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.cell_area.CellArea), T.stringof ~ " is not derived from gid.gtk4.cell_area.CellArea");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAdd", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "add");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncApplyAttributes", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "apply_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyContext", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "copy_context");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateContext", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "create_context");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEvent", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocus", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncForeach", true)[0]) == gid.gtk4.cell_area.CellArea))
      static assert(0, "Overriding gid.gtk4.cell_area.CellArea.vfuncForeach is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncForeachAlloc", true)[0]) == gid.gtk4.cell_area.CellArea))
      static assert(0, "Overriding gid.gtk4.cell_area.CellArea.vfuncForeachAlloc is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCellProperty", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_cell_property");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeight", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_preferred_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightForWidth", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_preferred_height_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidth", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_preferred_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidthForHeight", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_preferred_width_for_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsActivatable", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "is_activatable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRemove", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "remove");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCellProperty", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "set_cell_property");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSnapshot", true)[0]) == gid.gtk4.cell_area.CellArea))
      _installVfunc(klass, "snapshot");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellAreaClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) gboolean _vfuncActivateTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean editOnly) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(area, context, widget, cellArea, flags, editOnly);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags, cast(bool)editOnly);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "add":
      {
        static extern(C) void _vfuncAddTramp(GtkCellArea* area, GtkCellRenderer* renderer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.add)
              return (cast(typeof(&_vfuncAddTramp))_klass.add)(area, renderer);
            return;
          }

          try
          {
            _obj.vfuncAdd(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncAdd");
          }
        }

        _klass.add = cast(typeof(_klass.add))&_vfuncAddTramp;
        break;
      }
      case "apply_attributes":
      {
        static extern(C) void _vfuncApplyAttributesTramp(GtkCellArea* area, GtkTreeModel* treeModel, GtkTreeIter* iter, gboolean isExpander, gboolean isExpanded) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.applyAttributes)
              return (cast(typeof(&_vfuncApplyAttributesTramp))_klass.applyAttributes)(area, treeModel, iter, isExpander, isExpanded);
            return;
          }

          auto _iter = iter ? new gid.gtk4.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncApplyAttributes(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(void*)treeModel, No.Take), _iter, cast(bool)isExpander, cast(bool)isExpanded);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncApplyAttributes");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.applyAttributes = cast(typeof(_klass.applyAttributes))&_vfuncApplyAttributesTramp;
        break;
      }
      case "copy_context":
      {
        static extern(C) GtkCellAreaContext* _vfuncCopyContextTramp(GtkCellArea* area, GtkCellAreaContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.copyContext)
              return (cast(typeof(&_vfuncCopyContextTramp))_klass.copyContext)(area, context);
            return typeof(return).init;
          }

          gid.gtk4.cell_area_context.CellAreaContext _dretval;

          try
          {
            _dretval = _obj.vfuncCopyContext(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncCopyContext");
          }
          auto _retval = _dretval ? cast(GtkCellAreaContext*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.copyContext = cast(typeof(_klass.copyContext))&_vfuncCopyContextTramp;
        break;
      }
      case "create_context":
      {
        static extern(C) GtkCellAreaContext* _vfuncCreateContextTramp(GtkCellArea* area) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.createContext)
              return (cast(typeof(&_vfuncCreateContextTramp))_klass.createContext)(area);
            return typeof(return).init;
          }

          gid.gtk4.cell_area_context.CellAreaContext _dretval;

          try
          {
            _dretval = _obj.vfuncCreateContext();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncCreateContext");
          }
          auto _retval = _dretval ? cast(GtkCellAreaContext*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createContext = cast(typeof(_klass.createContext))&_vfuncCreateContextTramp;
        break;
      }
      case "event":
      {
        static extern(C) int _vfuncEventTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, GdkEvent* event, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.event)
              return (cast(typeof(&_vfuncEventTramp))_klass.event)(area, context, widget, event, cellArea, flags);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncEvent(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), event ? new gid.gdk4.event.Event(cast(void*)event, No.Take) : null, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncEvent");
          }
          return _retval;
        }

        _klass.event = cast(typeof(_klass.event))&_vfuncEventTramp;
        break;
      }
      case "focus":
      {
        static extern(C) gboolean _vfuncFocusTramp(GtkCellArea* area, GtkDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.focus)
              return (cast(typeof(&_vfuncFocusTramp))_klass.focus)(area, direction);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFocus(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.focus = cast(typeof(_klass.focus))&_vfuncFocusTramp;
        break;
      }
      case "get_cell_property":
      {
        static extern(C) void _vfuncGetCellPropertyTramp(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, GValue* value, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getCellProperty)
              return (cast(typeof(&_vfuncGetCellPropertyTramp))_klass.getCellProperty)(area, renderer, propertyId, value, pspec);
            return;
          }

          auto _value = value ? new gid.gobject2.value.Value(cast(void*)value, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncGetCellProperty(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take), propertyId, _value, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetCellProperty");
          }
          if (_value)
            _value._cUnborrow;

        }

        _klass.getCellProperty = cast(typeof(_klass.getCellProperty))&_vfuncGetCellPropertyTramp;
        break;
      }
      case "get_preferred_height":
      {
        static extern(C) void _vfuncGetPreferredHeightTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getPreferredHeight)
              return (cast(typeof(&_vfuncGetPreferredHeightTramp))_klass.getPreferredHeight)(area, context, widget, minimumHeight, naturalHeight);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          try
          {
            _obj.vfuncGetPreferredHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetPreferredHeight");
          }
        }

        _klass.getPreferredHeight = cast(typeof(_klass.getPreferredHeight))&_vfuncGetPreferredHeightTramp;
        break;
      }
      case "get_preferred_height_for_width":
      {
        static extern(C) void _vfuncGetPreferredHeightForWidthTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getPreferredHeightForWidth)
              return (cast(typeof(&_vfuncGetPreferredHeightForWidthTramp))_klass.getPreferredHeightForWidth)(area, context, widget, width, minimumHeight, naturalHeight);
            return;
          }

          typeof(*minimumHeight) _minimumHeightNull;
          if (!minimumHeight)
            minimumHeight = &_minimumHeightNull;

          typeof(*naturalHeight) _naturalHeightNull;
          if (!naturalHeight)
            naturalHeight = &_naturalHeightNull;

          try
          {
            _obj.vfuncGetPreferredHeightForWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), width, *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetPreferredHeightForWidth");
          }
        }

        _klass.getPreferredHeightForWidth = cast(typeof(_klass.getPreferredHeightForWidth))&_vfuncGetPreferredHeightForWidthTramp;
        break;
      }
      case "get_preferred_width":
      {
        static extern(C) void _vfuncGetPreferredWidthTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getPreferredWidth)
              return (cast(typeof(&_vfuncGetPreferredWidthTramp))_klass.getPreferredWidth)(area, context, widget, minimumWidth, naturalWidth);
            return;
          }

          typeof(*minimumWidth) _minimumWidthNull;
          if (!minimumWidth)
            minimumWidth = &_minimumWidthNull;

          typeof(*naturalWidth) _naturalWidthNull;
          if (!naturalWidth)
            naturalWidth = &_naturalWidthNull;

          try
          {
            _obj.vfuncGetPreferredWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetPreferredWidth");
          }
        }

        _klass.getPreferredWidth = cast(typeof(_klass.getPreferredWidth))&_vfuncGetPreferredWidthTramp;
        break;
      }
      case "get_preferred_width_for_height":
      {
        static extern(C) void _vfuncGetPreferredWidthForHeightTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getPreferredWidthForHeight)
              return (cast(typeof(&_vfuncGetPreferredWidthForHeightTramp))_klass.getPreferredWidthForHeight)(area, context, widget, height, minimumWidth, naturalWidth);
            return;
          }

          typeof(*minimumWidth) _minimumWidthNull;
          if (!minimumWidth)
            minimumWidth = &_minimumWidthNull;

          typeof(*naturalWidth) _naturalWidthNull;
          if (!naturalWidth)
            naturalWidth = &_naturalWidthNull;

          try
          {
            _obj.vfuncGetPreferredWidthForHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), height, *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetPreferredWidthForHeight");
          }
        }

        _klass.getPreferredWidthForHeight = cast(typeof(_klass.getPreferredWidthForHeight))&_vfuncGetPreferredWidthForHeightTramp;
        break;
      }
      case "get_request_mode":
      {
        static extern(C) GtkSizeRequestMode _vfuncGetRequestModeTramp(GtkCellArea* area) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(area);
            return typeof(return).init;
          }

          gid.gtk4.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "is_activatable":
      {
        static extern(C) gboolean _vfuncIsActivatableTramp(GtkCellArea* area) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.isActivatable)
              return (cast(typeof(&_vfuncIsActivatableTramp))_klass.isActivatable)(area);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsActivatable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncIsActivatable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isActivatable = cast(typeof(_klass.isActivatable))&_vfuncIsActivatableTramp;
        break;
      }
      case "remove":
      {
        static extern(C) void _vfuncRemoveTramp(GtkCellArea* area, GtkCellRenderer* renderer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.remove)
              return (cast(typeof(&_vfuncRemoveTramp))_klass.remove)(area, renderer);
            return;
          }

          try
          {
            _obj.vfuncRemove(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncRemove");
          }
        }

        _klass.remove = cast(typeof(_klass.remove))&_vfuncRemoveTramp;
        break;
      }
      case "set_cell_property":
      {
        static extern(C) void _vfuncSetCellPropertyTramp(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, const(GValue)* value, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.setCellProperty)
              return (cast(typeof(&_vfuncSetCellPropertyTramp))_klass.setCellProperty)(area, renderer, propertyId, value, pspec);
            return;
          }

          try
          {
            _obj.vfuncSetCellProperty(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take), propertyId, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncSetCellProperty");
          }
        }

        _klass.setCellProperty = cast(typeof(_klass.setCellProperty))&_vfuncSetCellPropertyTramp;
        break;
      }
      case "snapshot":
      {
        static extern(C) void _vfuncSnapshotTramp(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, GtkSnapshot* snapshot, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean paintFocus) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_area.CellArea)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)area);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAreaClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)area);
            if (_klass.snapshot)
              return (cast(typeof(&_vfuncSnapshotTramp))_klass.snapshot)(area, context, widget, snapshot, backgroundArea, cellArea, flags, paintFocus);
            return;
          }

          try
          {
            _obj.vfuncSnapshot(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_area_context.CellAreaContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), *cast(gid.gdk4.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags, cast(bool)paintFocus);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_area.CellArea.vfuncSnapshot");
          }
        }

        _klass.snapshot = cast(typeof(_klass.snapshot))&_vfuncSnapshotTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.cell_area.CellArea]
class CellAreaGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T, gid.gtk4.cell_layout.CellLayoutGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
  mixin CellLayoutGidBuilderT!();

  /**
      Set `focusCell` property.
      Params:
        propval = The cell in the area that currently has focus
      Returns: Builder instance for fluent chaining
  */
  T focusCell(gid.gtk4.cell_renderer.CellRenderer propval) nothrow
  {
    return setProperty("focus-cell", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_area.CellArea]
final class CellAreaGidBuilder : CellAreaGidBuilderImpl!CellAreaGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellArea build() nothrow
  {
    return new CellArea(cast(void*)createGObject(CellArea._getGType), Yes.Take);
  }
}
