/// Module for [CellArea] class
module gtk.cell_area;

import cairo.context;
import gdk.event;
import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gobject.value;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area_context;
import gtk.cell_editable;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.cell_renderer;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;
import gtk.widget;

/**
    The #GtkCellArea is an abstract class for #GtkCellLayout widgets
    (also referred to as "layouting widgets") to interface with an
    arbitrary number of #GtkCellRenderers and interact with the user
    for a given #GtkTreeModel row.
    
    The cell area handles events, focus navigation, drawing and
    size requests and allocations for a given row of data.
    
    Usually users dont have to interact with the #GtkCellArea directly
    unless they are implementing a cell-layouting widget themselves.
    
    # Requesting area sizes
    
    As outlined in
    [GtkWidget’s geometry management section][geometry-management],
    GTK+ uses a height-for-width
    geometry management system to compute the sizes of widgets and user
    interfaces. #GtkCellArea uses the same semantics to calculate the
    size of an area for an arbitrary number of #GtkTreeModel rows.
    
    When requesting the size of a cell area one needs to calculate
    the size for a handful of rows, and this will be done differently by
    different layouting widgets. For instance a #GtkTreeViewColumn
    always lines up the areas from top to bottom while a #GtkIconView
    on the other hand might enforce that all areas received the same
    width and wrap the areas around, requesting height for more cell
    areas when allocated less width.
    
    It’s also important for areas to maintain some cell
    alignments with areas rendered for adjacent rows (cells can
    appear “columnized” inside an area even when the size of
    cells are different in each row). For this reason the #GtkCellArea
    uses a #GtkCellAreaContext object to store the alignments
    and sizes along the way (as well as the overall largest minimum
    and natural size for all the rows which have been calculated
    with the said context).
    
    The #GtkCellAreaContext is an opaque object specific to the
    #GtkCellArea which created it (see [gtk.cell_area.CellArea.createContext]).
    The owning cell-layouting widget can create as many contexts as
    it wishes to calculate sizes of rows which should receive the
    same size in at least one orientation (horizontally or vertically),
    However, it’s important that the same #GtkCellAreaContext which
    was used to request the sizes for a given #GtkTreeModel row be
    used when rendering or processing events for that row.
    
    In order to request the width of all the rows at the root level
    of a #GtkTreeModel one would do the following:
    
    ```c
    GtkTreeIter iter;
    gint        minimum_width;
    gint        natural_width;
    
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
    in the accompanying #GtkCellAreaContext object and can be consulted
    at any time.
    
    This can be useful since #GtkCellLayout widgets usually have to
    support requesting and rendering rows in treemodels with an
    exceedingly large amount of rows. The #GtkCellLayout widget in
    that case would calculate the required width of the rows in an
    idle or timeout source (see [glib.global.timeoutAdd]) and when the widget
    is requested its actual width in #GtkWidgetClass.get_preferred_width()
    it can simply consult the width accumulated so far in the
    #GtkCellAreaContext object.
    
    A simple example where rows are rendered from top to bottom and
    take up the full width of the layouting widget would look like:
    
    ```c
    static void
    foo_get_preferred_width (GtkWidget       *widget,
                             gint            *minimum_size,
                             gint            *natural_size)
    {
      Foo        *foo  = FOO (widget);
      FooPrivate *priv = foo->priv;
    
      foo_ensure_at_least_one_handfull_of_rows_have_been_requested (foo);
    
      gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
    }
    ```
    
    In the above example the Foo widget has to make sure that some
    row sizes have been calculated (the amount of rows that Foo judged
    was appropriate to request space for in a single timeout iteration)
    before simply returning the amount of space required by the area via
    the #GtkCellAreaContext.
    
    Requesting the height for width (or width for height) of an area is
    a similar task except in this case the #GtkCellAreaContext does not
    store the data (actually, it does not know how much space the layouting
    widget plans to allocate it for every row. It’s up to the layouting
    widget to render each row of data with the appropriate height and
    width which was requested by the #GtkCellArea).
    
    In order to request the height for width of all the rows at the
    root level of a #GtkTreeModel one would do the following:
    
    ```c
    GtkTreeIter iter;
    gint        minimum_height;
    gint        natural_height;
    gint        full_minimum_height = 0;
    gint        full_natural_height = 0;
    
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
    call to #GtkWidgetClass.get_preferred_height_for_width(). Returning
    a perfect height for width that is larger than the screen area is
    inconsequential since after the layouting receives an allocation
    from a scrolled window it simply continues to drive the scrollbar
    values while more and more height is required for the row heights
    that are calculated in the background.
    
    # Rendering Areas
    
    Once area sizes have been aquired at least for the rows in the
    visible area of the layouting widget they can be rendered at
    #GtkWidgetClass.draw() time.
    
    A crude example of how to render all the rows at the root level
    runs as follows:
    
    ```c
    GtkAllocation allocation;
    GdkRectangle  cell_area = { 0, };
    GtkTreeIter   iter;
    gint          minimum_width;
    gint          natural_width;
    
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
    #GtkWidget::size-allocate time using [gtk.global.distributeNaturalAllocation].
    
    # Handling Events and Driving Keyboard Focus
    
    Passing events to the area is as simple as handling events on any
    normal widget and then passing them to the [gtk.cell_area.CellArea.event]
    API as they come in. Usually #GtkCellArea is only interested in
    button events, however some customized derived areas can be implemented
    who are interested in handling other events. Handling an event can
    trigger the #GtkCellArea::focus-changed signal to fire; as well as
    #GtkCellArea::add-editable in the case that an editable cell was
    clicked and needs to start editing. You can call
    [gtk.cell_area.CellArea.stopEditing] at any time to cancel any cell editing
    that is currently in progress.
    
    The #GtkCellArea drives keyboard focus from cell to cell in a way
    similar to #GtkWidget. For layouting widgets that support giving
    focus to cells it’s important to remember to pass [gtk.types.CellRendererState.Focused]
    to the area functions for the row that has focus and to tell the
    area to paint the focus at render time.
    
    Layouting widgets that accept focus on cells should implement the
    #GtkWidgetClass.focus() virtual method. The layouting widget is always
    responsible for knowing where #GtkTreeModel rows are rendered inside
    the widget, so at #GtkWidgetClass.focus() time the layouting widget
    should use the #GtkCellArea methods to navigate focus inside the area
    and then observe the GtkDirectionType to pass the focus to adjacent
    rows and areas.
    
    A basic example of how the #GtkWidgetClass.focus() virtual method
    should be implemented:
    
    ```c
    static gboolean
    foo_focus (GtkWidget       *widget,
               GtkDirectionType direction)
    {
      Foo        *foo  = FOO (widget);
      FooPrivate *priv = foo->priv;
      gint        focus_row;
      gboolean    have_focus = FALSE;
    
      focus_row = priv->focus_row;
    
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
    GtkDirectionType values to the way it lays out its cells.
    
    # Cell Properties
    
    The #GtkCellArea introduces cell properties for #GtkCellRenderers
    in very much the same way that #GtkContainer introduces
    [child properties][child-properties]
    for #GtkWidgets. This provides some general interfaces for defining
    the relationship cell areas have with their cells. For instance in a
    #GtkCellAreaBox a cell might “expand” and receive extra space when
    the area is allocated more than its full natural request, or a cell
    might be configured to “align” with adjacent rows which were requested
    and rendered with the same #GtkCellAreaContext.
    
    Use [gtk.cell_area_class.CellAreaClass.installCellProperty] to install cell
    properties for a cell area class and [gtk.cell_area_class.CellAreaClass.findCellProperty]
    or [gtk.cell_area_class.CellAreaClass.listCellProperties] to get information about
    existing cell properties.
    
    To set the value of a cell property, use [gtk.cell_area.CellArea.cellSetProperty],
    [gtk.cell_area.CellArea.cellSet] or [gtk.cell_area.CellArea.cellSetValist]. To obtain
    the value of a cell property, use [gtk.cell_area.CellArea.cellGetProperty],
    [gtk.cell_area.CellArea.cellGet] or [gtk.cell_area.CellArea.cellGetValist].
*/
class CellArea : gobject.initially_unowned.InitiallyUnowned, gtk.buildable.Buildable, gtk.cell_layout.CellLayout
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_area_get_type != &gidSymbolNotFound ? gtk_cell_area_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellArea self()
  {
    return this;
  }

  /**
      Get `editWidget` property.
      Returns: The widget currently editing the edited cell
      
      This property is read-only and only changes as
      a result of a call [gtk.cell_area.CellArea.activateCell].
  */
  @property gtk.cell_editable.CellEditable editWidget()
  {
    return getEditWidget();
  }

  /**
      Get `editedCell` property.
      Returns: The cell in the area that is currently edited
      
      This property is read-only and only changes as
      a result of a call [gtk.cell_area.CellArea.activateCell].
  */
  @property gtk.cell_renderer.CellRenderer editedCell()
  {
    return getEditedCell();
  }

  /**
      Get `focusCell` property.
      Returns: The cell in the area that currently has focus
  */
  @property gtk.cell_renderer.CellRenderer focusCell()
  {
    return getFocusCell();
  }

  /**
      Set `focusCell` property.
      Params:
        propval = The cell in the area that currently has focus
  */
  @property void focusCell(gtk.cell_renderer.CellRenderer propval)
  {
    return setFocusCell(propval);
  }

  mixin BuildableT!();
  mixin CellLayoutT!();

  /**
      Activates area, usually by activating the currently focused
      cell, however some subclasses which embed widgets in the area
      can also activate a widget if it currently has the focus.
  
      Params:
        context = the #GtkCellAreaContext in context with the current row data
        widget = the #GtkWidget that area is rendering on
        cellArea = the size and location of area relative to widget’s allocation
        flags = the #GtkCellRendererState flags for area for this row of data.
        editOnly = if true then only cell renderers that are [gtk.types.CellRendererMode.Editable]
                      will be activated.
      Returns: Whether area was successfully activated.
  */
  bool activate(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags, bool editOnly)
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_activate(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, flags, editOnly);
    return _retval;
  }

  /**
      This is used by #GtkCellArea subclasses when handling events
      to activate cells, the base #GtkCellArea class activates cells
      for keyboard events for free in its own GtkCellArea->activate()
      implementation.
  
      Params:
        widget = the #GtkWidget that area is rendering onto
        renderer = the #GtkCellRenderer in area to activate
        event = the #GdkEvent for which cell activation should occur
        cellArea = the #GdkRectangle in widget relative coordinates
                      of renderer for the current row.
        flags = the #GtkCellRendererState for renderer
      Returns: whether cell activation was successful
  */
  bool activateCell(gtk.widget.Widget widget, gtk.cell_renderer.CellRenderer renderer, gdk.event.Event event, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags)
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_activate_cell(cast(GtkCellArea*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Adds renderer to area with the default child cell properties.
  
      Params:
        renderer = the #GtkCellRenderer to add to area
  */
  void add(gtk.cell_renderer.CellRenderer renderer)
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
        renderer = the #GtkCellRenderer expected to have focus
        sibling = the #GtkCellRenderer to add to renderer’s focus area
  */
  void addFocusSibling(gtk.cell_renderer.CellRenderer renderer, gtk.cell_renderer.CellRenderer sibling)
  {
    gtk_cell_area_add_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Applies any connected attributes to the renderers in
      area by pulling the values from tree_model.
  
      Params:
        treeModel = the #GtkTreeModel to pull values from
        iter = the #GtkTreeIter in tree_model to apply values for
        isExpander = whether iter has children
        isExpanded = whether iter is expanded in the view and
                        children are visible
  */
  void applyAttributes(gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter, bool isExpander, bool isExpanded)
  {
    gtk_cell_area_apply_attributes(cast(GtkCellArea*)this._cPtr, treeModel ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, isExpander, isExpanded);
  }

  /**
      Connects an attribute to apply values from column for the
      #GtkTreeModel in use.
  
      Params:
        renderer = the #GtkCellRenderer to connect an attribute for
        attribute = the attribute name
        column = the #GtkTreeModel column to fetch attribute values from
  */
  void attributeConnect(gtk.cell_renderer.CellRenderer renderer, string attribute, int column)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    gtk_cell_area_attribute_connect(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute, column);
  }

  /**
      Disconnects attribute for the renderer in area so that
      attribute will no longer be updated with values from the
      model.
  
      Params:
        renderer = the #GtkCellRenderer to disconnect an attribute for
        attribute = the attribute name
  */
  void attributeDisconnect(gtk.cell_renderer.CellRenderer renderer, string attribute)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    gtk_cell_area_attribute_disconnect(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute);
  }

  /**
      Returns the model column that an attribute has been mapped to,
      or -1 if the attribute is not mapped.
  
      Params:
        renderer = a #GtkCellRenderer
        attribute = an attribute on the renderer
      Returns: the model column, or -1
  */
  int attributeGetColumn(gtk.cell_renderer.CellRenderer renderer, string attribute)
  {
    int _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _retval = gtk_cell_area_attribute_get_column(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _attribute);
    return _retval;
  }

  /**
      Gets the value of a cell property for renderer in area.
  
      Params:
        renderer = a #GtkCellRenderer inside area
        propertyName = the name of the property to get
        value = a location to return the value
  */
  void cellGetProperty(gtk.cell_renderer.CellRenderer renderer, string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gtk_cell_area_cell_get_property(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets a cell property for renderer in area.
  
      Params:
        renderer = a #GtkCellRenderer inside area
        propertyName = the name of the cell property to set
        value = the value to set the cell property to
  */
  void cellSetProperty(gtk.cell_renderer.CellRenderer renderer, string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gtk_cell_area_cell_set_property(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      This is sometimes needed for cases where rows need to share
      alignments in one orientation but may be separately grouped
      in the opposing orientation.
      
      For instance, #GtkIconView creates all icons (rows) to have
      the same width and the cells theirin to have the same
      horizontal alignments. However each row of icons may have
      a separate collective height. #GtkIconView uses this to
      request the heights of each row based on a context which
      was already used to request all the row widths that are
      to be displayed.
  
      Params:
        context = the #GtkCellAreaContext to copy
      Returns: a newly created #GtkCellAreaContext copy of context.
  */
  gtk.cell_area_context.CellAreaContext copyContext(gtk.cell_area_context.CellAreaContext context)
  {
    GtkCellAreaContext* _cretval;
    _cretval = gtk_cell_area_copy_context(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GtkCellAreaContext to be used with area for
      all purposes. #GtkCellAreaContext stores geometry information
      for rows for which it was operated on, it is important to use
      the same context for the same row of data at all times (i.e.
      one should render and handle events with the same #GtkCellAreaContext
      which was used to request the size of those rows of data).
      Returns: a newly created #GtkCellAreaContext which can be used with area.
  */
  gtk.cell_area_context.CellAreaContext createContext()
  {
    GtkCellAreaContext* _cretval;
    _cretval = gtk_cell_area_create_context(cast(GtkCellArea*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_area_context.CellAreaContext)(cast(GtkCellAreaContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Delegates event handling to a #GtkCellArea.
  
      Params:
        context = the #GtkCellAreaContext for this row of data.
        widget = the #GtkWidget that area is rendering to
        event = the #GdkEvent to handle
        cellArea = the widget relative coordinates for area
        flags = the #GtkCellRendererState for area in this row.
      Returns: true if the event was handled by area.
  */
  int event(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, gdk.event.Event event, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags)
  {
    int _retval;
    _retval = gtk_cell_area_event(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      This should be called by the area’s owning layout widget
      when focus is to be passed to area, or moved within area
      for a given direction and row data.
      
      Implementing #GtkCellArea classes should implement this
      method to receive and navigate focus in its own way particular
      to how it lays out cells.
  
      Params:
        direction = the #GtkDirectionType
      Returns: true if focus remains inside area as a result of this call.
  */
  bool focus(gtk.types.DirectionType direction)
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_focus(cast(GtkCellArea*)this._cPtr, direction);
    return _retval;
  }

  /**
      Calls callback for every #GtkCellRenderer in area.
  
      Params:
        callback = the #GtkCellCallback to call
  */
  void foreach_(gtk.types.CellCallback callback)
  {
    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, void* data)
    {
      auto _dlg = cast(gtk.types.CellCallback*)data;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take));
      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_cell_area_foreach(cast(GtkCellArea*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Calls callback for every #GtkCellRenderer in area with the
      allocated rectangle inside cell_area.
  
      Params:
        context = the #GtkCellAreaContext for this row of data.
        widget = the #GtkWidget that area is rendering to
        cellArea = the widget relative coordinates and size for area
        backgroundArea = the widget relative coordinates of the background area
        callback = the #GtkCellAllocCallback to call
  */
  void foreachAlloc(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, gdk.rectangle.Rectangle cellArea, gdk.rectangle.Rectangle backgroundArea, gtk.types.CellAllocCallback callback)
  {
    extern(C) gboolean _callbackCallback(GtkCellRenderer* renderer, const(GdkRectangle)* cellArea, const(GdkRectangle)* cellBackground, void* data)
    {
      auto _dlg = cast(gtk.types.CellAllocCallback*)data;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(void*)renderer, No.Take), cellArea ? new gdk.rectangle.Rectangle(cast(void*)cellArea, No.Take) : null, cellBackground ? new gdk.rectangle.Rectangle(cast(void*)cellBackground, No.Take) : null);
      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? cast(void*)&(callback) : null;
    gtk_cell_area_foreach_alloc(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, backgroundArea ? cast(const(GdkRectangle)*)backgroundArea._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Derives the allocation of renderer inside area if area
      were to be renderered in cell_area.
  
      Params:
        context = the #GtkCellAreaContext used to hold sizes for area.
        widget = the #GtkWidget that area is rendering on
        renderer = the #GtkCellRenderer to get the allocation for
        cellArea = the whole allocated area for area in widget
                      for this row
        allocation = where to store the allocation for renderer
  */
  void getCellAllocation(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, gtk.cell_renderer.CellRenderer renderer, gdk.rectangle.Rectangle cellArea, out gdk.rectangle.Rectangle allocation)
  {
    GdkRectangle _allocation;
    gtk_cell_area_get_cell_allocation(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, &_allocation);
    allocation = new gdk.rectangle.Rectangle(cast(void*)&_allocation, No.Take);
  }

  /**
      Gets the #GtkCellRenderer at `x` and `y` coordinates inside area and optionally
      returns the full cell allocation for it inside cell_area.
  
      Params:
        context = the #GtkCellAreaContext used to hold sizes for area.
        widget = the #GtkWidget that area is rendering on
        cellArea = the whole allocated area for area in widget
                      for this row
        x = the x position
        y = the y position
        allocArea = where to store the inner allocated area of the
                                           returned cell renderer, or null.
      Returns: the #GtkCellRenderer at `x` and `y`.
  */
  gtk.cell_renderer.CellRenderer getCellAtPosition(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, gdk.rectangle.Rectangle cellArea, int x, int y, out gdk.rectangle.Rectangle allocArea)
  {
    GtkCellRenderer* _cretval;
    GdkRectangle _allocArea;
    _cretval = gtk_cell_area_get_cell_at_position(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, x, y, &_allocArea);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    allocArea = new gdk.rectangle.Rectangle(cast(void*)&_allocArea, No.Take);
    return _retval;
  }

  /**
      Gets the current #GtkTreePath string for the currently
      applied #GtkTreeIter, this is implicitly updated when
      [gtk.cell_area.CellArea.applyAttributes] is called and can be
      used to interact with renderers from #GtkCellArea
      subclasses.
      Returns: The current #GtkTreePath string for the current
        attributes applied to area. This string belongs to the area and
        should not be freed.
  */
  string getCurrentPathString()
  {
    const(char)* _cretval;
    _cretval = gtk_cell_area_get_current_path_string(cast(GtkCellArea*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GtkCellEditable widget currently used
      to edit the currently edited cell.
      Returns: The currently active #GtkCellEditable widget
  */
  gtk.cell_editable.CellEditable getEditWidget()
  {
    GtkCellEditable* _cretval;
    _cretval = gtk_cell_area_get_edit_widget(cast(GtkCellArea*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkCellRenderer in area that is currently
      being edited.
      Returns: The currently edited #GtkCellRenderer
  */
  gtk.cell_renderer.CellRenderer getEditedCell()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_edited_cell(cast(GtkCellArea*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the currently focused cell for area
      Returns: the currently focused cell in area.
  */
  gtk.cell_renderer.CellRenderer getFocusCell()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_focus_cell(cast(GtkCellArea*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkCellRenderer which is expected to be focusable
      for which renderer is, or may be a sibling.
      
      This is handy for #GtkCellArea subclasses when handling events,
      after determining the renderer at the event location it can
      then chose to activate the focus cell for which the event
      cell may have been a sibling.
  
      Params:
        renderer = the #GtkCellRenderer
      Returns: the #GtkCellRenderer for which renderer
           is a sibling, or null.
  */
  gtk.cell_renderer.CellRenderer getFocusFromSibling(gtk.cell_renderer.CellRenderer renderer)
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_area_get_focus_from_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(GtkCellRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the focus sibling cell renderers for renderer.
  
      Params:
        renderer = the #GtkCellRenderer expected to have focus
      Returns: A #GList of #GtkCellRenderers.
              The returned list is internal and should not be freed.
  */
  gtk.cell_renderer.CellRenderer[] getFocusSiblings(gtk.cell_renderer.CellRenderer renderer)
  {
    const(GList)* _cretval;
    _cretval = gtk_cell_area_get_focus_siblings(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    auto _retval = gListToD!(gtk.cell_renderer.CellRenderer, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves a cell area’s initial minimum and natural height.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_height and natural_height of this call but rather to
      consult [gtk.cell_area_context.CellAreaContext.getPreferredHeight] after a series of
      requests.
  
      Params:
        context = the #GtkCellAreaContext to perform this request with
        widget = the #GtkWidget where area will be rendering
        minimumHeight = location to store the minimum height, or null
        naturalHeight = location to store the natural height, or null
  */
  void getPreferredHeight(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, out int minimumHeight, out int naturalHeight)
  {
    gtk_cell_area_get_preferred_height(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s minimum and natural height if it would be given
      the specified width.
      
      area stores some geometrical information in context along the way
      while calling [gtk.cell_area.CellArea.getPreferredWidth]. It’s important to
      perform a series of [gtk.cell_area.CellArea.getPreferredWidth] requests with
      context first and then call [gtk.cell_area.CellArea.getPreferredHeightForWidth]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the width of a single row changes, it should be
      requested with [gtk.cell_area.CellArea.getPreferredWidth] again and then
      the full width of the requested rows checked again with
      [gtk.cell_area_context.CellAreaContext.getPreferredWidth].
  
      Params:
        context = the #GtkCellAreaContext which has already been requested for widths.
        widget = the #GtkWidget where area will be rendering
        width = the width for which to check the height of this area
        minimumHeight = location to store the minimum height, or null
        naturalHeight = location to store the natural height, or null
  */
  void getPreferredHeightForWidth(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight)
  {
    gtk_cell_area_get_preferred_height_for_width(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a cell area’s initial minimum and natural width.
      
      area will store some geometrical information in context along the way;
      when requesting sizes over an arbitrary number of rows, it’s not important
      to check the minimum_width and natural_width of this call but rather to
      consult [gtk.cell_area_context.CellAreaContext.getPreferredWidth] after a series of
      requests.
  
      Params:
        context = the #GtkCellAreaContext to perform this request with
        widget = the #GtkWidget where area will be rendering
        minimumWidth = location to store the minimum width, or null
        naturalWidth = location to store the natural width, or null
  */
  void getPreferredWidth(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, out int minimumWidth, out int naturalWidth)
  {
    gtk_cell_area_get_preferred_width(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Retrieves a cell area’s minimum and natural width if it would be given
      the specified height.
      
      area stores some geometrical information in context along the way
      while calling [gtk.cell_area.CellArea.getPreferredHeight]. It’s important to
      perform a series of [gtk.cell_area.CellArea.getPreferredHeight] requests with
      context first and then call [gtk.cell_area.CellArea.getPreferredWidthForHeight]
      on each cell area individually to get the height for width of each
      fully requested row.
      
      If at some point, the height of a single row changes, it should be
      requested with [gtk.cell_area.CellArea.getPreferredHeight] again and then
      the full height of the requested rows checked again with
      [gtk.cell_area_context.CellAreaContext.getPreferredHeight].
  
      Params:
        context = the #GtkCellAreaContext which has already been requested for widths.
        widget = the #GtkWidget where area will be rendering
        height = the height for which to check the width of this area
        minimumWidth = location to store the minimum width, or null
        naturalWidth = location to store the natural width, or null
  */
  void getPreferredWidthForHeight(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth)
  {
    gtk_cell_area_get_preferred_width_for_height(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the area prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The #GtkSizeRequestMode preferred by area.
  */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_cell_area_get_request_mode(cast(GtkCellArea*)this._cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Checks if area contains renderer.
  
      Params:
        renderer = the #GtkCellRenderer to check
      Returns: true if renderer is in the area.
  */
  bool hasRenderer(gtk.cell_renderer.CellRenderer renderer)
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_has_renderer(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This is a convenience function for #GtkCellArea implementations
      to get the inner area where a given #GtkCellRenderer will be
      rendered. It removes any padding previously added by [gtk.cell_area.CellArea.requestRenderer].
  
      Params:
        widget = the #GtkWidget that area is rendering onto
        cellArea = the widget relative coordinates where one of area’s cells
                      is to be placed
        innerArea = the return location for the inner cell area
  */
  void innerCellArea(gtk.widget.Widget widget, gdk.rectangle.Rectangle cellArea, out gdk.rectangle.Rectangle innerArea)
  {
    GdkRectangle _innerArea;
    gtk_cell_area_inner_cell_area(cast(GtkCellArea*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, &_innerArea);
    innerArea = new gdk.rectangle.Rectangle(cast(void*)&_innerArea, No.Take);
  }

  /**
      Returns whether the area can do anything when activated,
      after applying new attributes to area.
      Returns: whether area can do anything when activated.
  */
  bool isActivatable()
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_is_activatable(cast(GtkCellArea*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether sibling is one of renderer’s focus siblings
      (see [gtk.cell_area.CellArea.addFocusSibling]).
  
      Params:
        renderer = the #GtkCellRenderer expected to have focus
        sibling = the #GtkCellRenderer to check against renderer’s sibling list
      Returns: true if sibling is a focus sibling of renderer
  */
  bool isFocusSibling(gtk.cell_renderer.CellRenderer renderer, gtk.cell_renderer.CellRenderer sibling)
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_area_is_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes renderer from area.
  
      Params:
        renderer = the #GtkCellRenderer to remove from area
  */
  void remove(gtk.cell_renderer.CellRenderer renderer)
  {
    gtk_cell_area_remove(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Removes sibling from renderer’s focus sibling list
      (see [gtk.cell_area.CellArea.addFocusSibling]).
  
      Params:
        renderer = the #GtkCellRenderer expected to have focus
        sibling = the #GtkCellRenderer to remove from renderer’s focus area
  */
  void removeFocusSibling(gtk.cell_renderer.CellRenderer renderer, gtk.cell_renderer.CellRenderer sibling)
  {
    gtk_cell_area_remove_focus_sibling(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, sibling ? cast(GtkCellRenderer*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Renders area’s cells according to area’s layout onto widget at
      the given coordinates.
  
      Params:
        context = the #GtkCellAreaContext for this row of data.
        widget = the #GtkWidget that area is rendering to
        cr = the #cairo_t to render with
        backgroundArea = the widget relative coordinates for area’s background
        cellArea = the widget relative coordinates for area
        flags = the #GtkCellRendererState for area in this row.
        paintFocus = whether area should paint focus on focused cells for focused rows or not.
  */
  void render(gtk.cell_area_context.CellAreaContext context, gtk.widget.Widget widget, cairo.context.Context cr, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags, bool paintFocus)
  {
    gtk_cell_area_render(cast(GtkCellArea*)this._cPtr, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, backgroundArea ? cast(const(GdkRectangle)*)backgroundArea._cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea._cPtr(No.Dup) : null, flags, paintFocus);
  }

  /**
      This is a convenience function for #GtkCellArea implementations
      to request size for cell renderers. It’s important to use this
      function to request size and then use [gtk.cell_area.CellArea.innerCellArea]
      at render and event time since this function will add padding
      around the cell for focus painting.
  
      Params:
        renderer = the #GtkCellRenderer to request size for
        orientation = the #GtkOrientation in which to request size
        widget = the #GtkWidget that area is rendering onto
        forSize = the allocation contextual size to request for, or -1 if
          the base request for the orientation is to be returned.
        minimumSize = location to store the minimum size, or null
        naturalSize = location to store the natural size, or null
  */
  void requestRenderer(gtk.cell_renderer.CellRenderer renderer, gtk.types.Orientation orientation, gtk.widget.Widget widget, int forSize, out int minimumSize, out int naturalSize)
  {
    gtk_cell_area_request_renderer(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null, orientation, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, forSize, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Explicitly sets the currently focused cell to renderer.
      
      This is generally called by implementations of
      #GtkCellAreaClass.focus() or #GtkCellAreaClass.event(),
      however it can also be used to implement functions such
      as [gtk.tree_view.TreeView.setCursorOnCell].
  
      Params:
        renderer = the #GtkCellRenderer to give focus to
  */
  void setFocusCell(gtk.cell_renderer.CellRenderer renderer)
  {
    gtk_cell_area_set_focus_cell(cast(GtkCellArea*)this._cPtr, renderer ? cast(GtkCellRenderer*)renderer._cPtr(No.Dup) : null);
  }

  /**
      Explicitly stops the editing of the currently edited cell.
      
      If canceled is true, the currently edited cell renderer
      will emit the ::editing-canceled signal, otherwise the
      the ::editing-done signal will be emitted on the current
      edit widget.
      
      See [gtk.cell_area.CellArea.getEditedCell] and [gtk.cell_area.CellArea.getEditWidget].
  
      Params:
        canceled = whether editing was canceled.
  */
  void stopEditing(bool canceled)
  {
    gtk_cell_area_stop_editing(cast(GtkCellArea*)this._cPtr, canceled);
  }

  /**
      Connect to `AddEditable` signal.
  
      Indicates that editing has started on renderer and that editable
      should be added to the owning cell-layouting widget at cell_area.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.cell_renderer.CellRenderer renderer, gtk.cell_editable.CellEditable editable, gdk.rectangle.Rectangle cellArea, string path, gtk.cell_area.CellArea cellArea))
  
          `renderer` the #GtkCellRenderer that started the edited (optional)
  
          `editable` the #GtkCellEditable widget to add (optional)
  
          `cellArea` the #GtkWidget relative #GdkRectangle coordinates
                      where editable should be added (optional)
  
          `path` the #GtkTreePath string this edit was initiated for (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAddEditable(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.cell_editable.CellEditable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == string)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.cell_area.CellArea)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-editable", closure, after);
  }

  /**
      Connect to `ApplyAttributes` signal.
  
      This signal is emitted whenever applying attributes to area from model
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, bool isExpander, bool isExpanded, gtk.cell_area.CellArea cellArea))
  
          `model` the #GtkTreeModel to apply the attributes from (optional)
  
          `iter` the #GtkTreeIter indicating which row to apply the attributes of (optional)
  
          `isExpander` whether the view shows children for this row (optional)
  
          `isExpanded` whether the view is currently showing the children of this row (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApplyAttributes(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_model.TreeModel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.cell_area.CellArea)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.cell_renderer.CellRenderer renderer, string path, gtk.cell_area.CellArea cellArea))
  
          `renderer` the #GtkCellRenderer that has focus (optional)
  
          `path` the current #GtkTreePath string set for area (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocusChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.cell_area.CellArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.cell_renderer.CellRenderer renderer, gtk.cell_editable.CellEditable editable, gtk.cell_area.CellArea cellArea))
  
          `renderer` the #GtkCellRenderer that finished editeding (optional)
  
          `editable` the #GtkCellEditable widget to remove (optional)
  
          `cellArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRemoveEditable(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.cell_renderer.CellRenderer)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.cell_editable.CellEditable)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.cell_area.CellArea)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("remove-editable", closure, after);
  }
}
