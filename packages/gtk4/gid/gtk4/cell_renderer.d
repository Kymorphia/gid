/// Module for [CellRenderer] class
module gid.gtk4.cell_renderer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.event;
import gid.gdk4.rectangle;
import gid.gdk4.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_editable;
import gid.gtk4.requisition;
import gid.gtk4.snapshot;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    An object for rendering a single cell
    
    The [gid.gtk4.cell_renderer.CellRenderer] is a base class of a set of objects used for
    rendering a cell to a [gid.cairo1.context.Context].  These objects are used primarily by
    the [gid.gtk4.tree_view.TreeView] widget, though they aren’t tied to them in any
    specific way.  It is worth noting that [gid.gtk4.cell_renderer.CellRenderer] is not a
    [gid.gtk4.widget.Widget] and cannot be treated as such.
    
    The primary use of a [gid.gtk4.cell_renderer.CellRenderer] is for drawing a certain graphical
    elements on a [gid.cairo1.context.Context]. Typically, one cell renderer is used to
    draw many cells on the screen.  To this extent, it isn’t expected that a
    CellRenderer keep any permanent state around.  Instead, any state is set
    just prior to use using [gid.gobject2.object.ObjectWrap]s property system.  Then, the
    cell is measured using [gid.gtk4.cell_renderer.CellRenderer.getPreferredSize]. Finally, the cell
    is rendered in the correct location using [gid.gtk4.cell_renderer.CellRenderer.snapshot].
    
    There are a number of rules that must be followed when writing a new
    [gid.gtk4.cell_renderer.CellRenderer].  First and foremost, it’s important that a certain set
    of properties will always yield a cell renderer of the same size,
    barring a style change. The [gid.gtk4.cell_renderer.CellRenderer] also has a number of
    generic properties that are expected to be honored by all children.
    
    Beyond merely rendering a cell, cell renderers can optionally
    provide active user interface elements. A cell renderer can be
    “activatable” like [gid.gtk4.cell_renderer.CellRenderer]Toggle,
    which toggles when it gets activated by a mouse click, or it can be
    “editable” like [gid.gtk4.cell_renderer.CellRenderer]Text, which
    allows the user to edit the text using a widget implementing the
    [gid.gtk4.cell_editable.CellEditable] interface, e.g. [gid.gtk4.entry.Entry].
    To make a cell renderer activatable or editable, you have to
    implement the [gid.gtk4.cell_renderer.CellRenderer]Class.activate or
    [gid.gtk4.cell_renderer.CellRenderer]Class.start_editing virtual functions, respectively.
    
    Many properties of [gid.gtk4.cell_renderer.CellRenderer] and its subclasses have a
    corresponding “set” property, e.g. “cell-background-set” corresponds
    to “cell-background”. These “set” properties reflect whether a property
    has been set or not. You should not set them independently.

    Deprecated: List views use widgets for displaying their
        contents
*/
class CellRenderer : gid.gobject2.initially_unowned.InitiallyUnowned
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
    return cast(void function())gtk_cell_renderer_get_type != &gidSymbolNotFound ? gtk_cell_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.cell_renderer.CellRenderer]
      Returns: New builder object
  */
  static CellRendererGidBuilder builder() nothrow
  {
    return new CellRendererGidBuilder;
  }

  /** */
  @property void cellBackground(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("cell-background", propval);
  }

  /**
      Get `cellBackgroundRgba` property.
      Returns: Cell background as a [gid.gdk4.rgba.RGBA]
  */
  @property gid.gdk4.rgba.RGBA cellBackgroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.rgba.RGBA)("cell-background-rgba");
  }

  /**
      Set `cellBackgroundRgba` property.
      Params:
        propval = Cell background as a [gid.gdk4.rgba.RGBA]
  */
  @property void cellBackgroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.rgba.RGBA)("cell-background-rgba", propval);
  }

  /** */
  @property bool cellBackgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("cell-background-set");
  }

  /** */
  @property void cellBackgroundSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("cell-background-set", propval);
  }

  /** */
  @property bool editing() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("editing");
  }

  /** */
  @property int height() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("height");
  }

  /** */
  @property void height(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("height", propval);
  }

  /** */
  @property bool isExpanded() nothrow
  {
    return getIsExpanded();
  }

  /** */
  @property void isExpanded(bool propval) nothrow
  {
    setIsExpanded(propval);
  }

  /** */
  @property bool isExpander() nothrow
  {
    return getIsExpander();
  }

  /** */
  @property void isExpander(bool propval) nothrow
  {
    setIsExpander(propval);
  }

  /** */
  @property gid.gtk4.types.CellRendererMode mode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.CellRendererMode)("mode");
  }

  /** */
  @property void mode(gid.gtk4.types.CellRendererMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.CellRendererMode)("mode", propval);
  }

  /** */
  @property bool sensitive() nothrow
  {
    return getSensitive();
  }

  /** */
  @property void sensitive(bool propval) nothrow
  {
    setSensitive(propval);
  }

  /** */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /** */
  @property int width() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("width");
  }

  /** */
  @property void width(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("width", propval);
  }

  /** */
  @property float xalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /** */
  @property void xalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /** */
  @property uint xpad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("xpad");
  }

  /** */
  @property void xpad(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("xpad", propval);
  }

  /** */
  @property float yalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /** */
  @property void yalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /** */
  @property uint ypad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("ypad");
  }

  /** */
  @property void ypad(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("ypad", propval);
  }

  /**
      Passes an activate event to the cell renderer for possible processing.
      Some cell renderers may use events; for example, [gid.gtk4.cell_renderer_toggle.CellRendererToggle]
      toggles when it gets a mouse click.
  
      Params:
        event = a [gid.gdk4.event.Event]
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for [gid.gtk4.tree_view.TreeView], a string representation of [gid.gtk4.tree_path.TreePath]
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: true if the event was consumed/handled
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncActivate(gid.gdk4.event.Event event, gid.gtk4.widget.Widget widget, string path, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.activate)
      return typeof(return).init;

    bool _retval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.activate(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    return _retval;
  }

  /**
      Signal gets emitted when the user cancels the process of editing a cell.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEditingCanceled` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncEditingCanceled()
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.editingCanceled)
      return;

    _klass.editingCanceled(cast(GtkCellRenderer*)this._cPtr);
  }

  /**
      Signal gets emitted when a cell starts to be edited.
  
      Params:
        editable = 
        path = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEditingStarted` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncEditingStarted(gid.gtk4.cell_editable.CellEditable editable, string path)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.editingStarted)
      return;

    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _klass.editingStarted(cast(GtkCellRenderer*)this._cPtr, editable ? cast(GtkCellEditable*)(cast(gid.gobject2.object.ObjectWrap)editable)._cPtr(No.Dup) : null, _path);
  }

  /**
      Gets the aligned area used by cell inside cell_area. Used for finding
      the appropriate edit and focus rectangle.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        flags = render flags
        cellArea = cell area which would be passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        alignedArea = the return location for the space inside cell_area
                         that would actually be used to render.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetAlignedArea` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetAlignedArea(gid.gtk4.widget.Widget widget, gid.gtk4.types.CellRendererState flags, gid.gdk4.rectangle.Rectangle cellArea, out gid.gdk4.rectangle.Rectangle alignedArea)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getAlignedArea)
      return;

    _klass.getAlignedArea(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&alignedArea);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        minimumSize = location to store the minimum size
        naturalSize = location to store the natural size
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeight(gid.gtk4.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredHeight)
      return;

    _klass.getPreferredHeight(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural height if it were rendered to
      widget with the specified width.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        width = the size which is available for allocation
        minimumHeight = location for storing the minimum size
        naturalHeight = location for storing the preferred size
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightForWidth(gid.gtk4.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredHeightForWidth)
      return;

    _klass.getPreferredHeightForWidth(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        minimumSize = location to store the minimum size
        naturalSize = location to store the natural size
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidth(gid.gtk4.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredWidth)
      return;

    _klass.getPreferredWidth(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural width if it were rendered to
      widget with the specified height.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        height = the size which is available for allocation
        minimumWidth = location for storing the minimum size
        naturalWidth = location for storing the preferred size
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidthForHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidthForHeight(gid.gtk4.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredWidthForHeight)
      return;

    _klass.getPreferredWidthForHeight(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the cell renderer prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by this renderer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.types.SizeRequestMode vfuncGetRequestMode()
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkCellRenderer*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Invokes the virtual render function of the [gid.gtk4.cell_renderer.CellRenderer]. The three
      passed-in rectangles are areas in cr. Most renderers will draw within
      cell_area; the xalign, yalign, xpad, and ypad fields of the [gid.gtk4.cell_renderer.CellRenderer]
      should be honored with respect to cell_area. background_area includes the
      blank space around the cell, and also the area containing the tree expander;
      so the background_area rectangles for all cells tile to cover the entire
      window.
  
      Params:
        snapshot = a [gid.gtk4.snapshot.Snapshot] to draw to
        widget = the widget owning window
        backgroundArea = entire cell area (including tree expanders and maybe
             padding on the sides)
        cellArea = area normally rendered by a cell renderer
        flags = flags that affect rendering
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSnapshot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSnapshot(gid.gtk4.snapshot.Snapshot snapshot, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.snapshot)
      return;

    _klass.snapshot(cast(GtkCellRenderer*)this._cPtr, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
  }

  /**
      Starts editing the contents of this cell, through a new [gid.gtk4.cell_editable.CellEditable]
      widget created by the [gid.gtk4.cell_renderer.CellRenderer]Class.start_editing virtual function.
  
      Params:
        event = a [gid.gdk4.event.Event]
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for [gid.gtk4.tree_view.TreeView], a string representation of [gid.gtk4.tree_path.TreePath]
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: A new [gid.gtk4.cell_editable.CellEditable] for editing this
          cell, or null if editing is not possible
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStartEditing` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.cell_editable.CellEditable vfuncStartEditing(gid.gdk4.event.Event event, gid.gtk4.widget.Widget widget, string path, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.startEditing)
      return typeof(return).init;

    GtkCellEditable* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.startEditing(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Passes an activate event to the cell renderer for possible processing.
      Some cell renderers may use events; for example, [gid.gtk4.cell_renderer_toggle.CellRendererToggle]
      toggles when it gets a mouse click.
  
      Params:
        event = a [gid.gdk4.event.Event]
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for [gid.gtk4.tree_view.TreeView], a string representation of [gid.gtk4.tree_path.TreePath]
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: true if the event was consumed/handled
  */
  bool activate(gid.gdk4.event.Event event, gid.gtk4.widget.Widget widget, string path, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags) nothrow
  {
    bool _retval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_cell_renderer_activate(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    return _retval;
  }

  /**
      Gets the aligned area used by cell inside cell_area. Used for finding
      the appropriate edit and focus rectangle.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        flags = render flags
        cellArea = cell area which would be passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        alignedArea = the return location for the space inside cell_area
                         that would actually be used to render.
  */
  void getAlignedArea(gid.gtk4.widget.Widget widget, gid.gtk4.types.CellRendererState flags, gid.gdk4.rectangle.Rectangle cellArea, out gid.gdk4.rectangle.Rectangle alignedArea) nothrow
  {
    gtk_cell_renderer_get_aligned_area(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&alignedArea);
  }

  /**
      Fills in xalign and yalign with the appropriate values of cell.
  
      Params:
        xalign = location to fill in with the x alignment of the cell
        yalign = location to fill in with the y alignment of the cell
  */
  void getAlignment(out float xalign, out float yalign) nothrow
  {
    gtk_cell_renderer_get_alignment(cast(GtkCellRenderer*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Fills in width and height with the appropriate size of cell.
  
      Params:
        width = location to fill in with the fixed width of the cell
        height = location to fill in with the fixed height of the cell
  */
  void getFixedSize(out int width, out int height) nothrow
  {
    gtk_cell_renderer_get_fixed_size(cast(GtkCellRenderer*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Checks whether the given [gid.gtk4.cell_renderer.CellRenderer] is expanded.
      Returns: true if the cell renderer is expanded
  */
  bool getIsExpanded() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_get_is_expanded(cast(GtkCellRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the given [gid.gtk4.cell_renderer.CellRenderer] is an expander.
      Returns: true if cell is an expander, and false otherwise
  */
  bool getIsExpander() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_get_is_expander(cast(GtkCellRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Fills in xpad and ypad with the appropriate values of cell.
  
      Params:
        xpad = location to fill in with the x padding of the cell
        ypad = location to fill in with the y padding of the cell
  */
  void getPadding(out int xpad, out int ypad) nothrow
  {
    gtk_cell_renderer_get_padding(cast(GtkCellRenderer*)this._cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        minimumSize = location to store the minimum size
        naturalSize = location to store the natural size
  */
  void getPreferredHeight(gid.gtk4.widget.Widget widget, out int minimumSize, out int naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_height(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural height if it were rendered to
      widget with the specified width.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        width = the size which is available for allocation
        minimumHeight = location for storing the minimum size
        naturalHeight = location for storing the preferred size
  */
  void getPreferredHeightForWidth(gid.gtk4.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_renderer_get_preferred_height_for_width(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves the minimum and natural size of a cell taking
      into account the widget’s preference for height-for-width management.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        minimumSize = location for storing the minimum size
        naturalSize = location for storing the natural size
  */
  void getPreferredSize(gid.gtk4.widget.Widget widget, out gid.gtk4.requisition.Requisition minimumSize, out gid.gtk4.requisition.Requisition naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_size(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(GtkRequisition*)&minimumSize, cast(GtkRequisition*)&naturalSize);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        minimumSize = location to store the minimum size
        naturalSize = location to store the natural size
  */
  void getPreferredWidth(gid.gtk4.widget.Widget widget, out int minimumSize, out int naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_width(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural width if it were rendered to
      widget with the specified height.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] this cell will be rendering to
        height = the size which is available for allocation
        minimumWidth = location for storing the minimum size
        naturalWidth = location for storing the preferred size
  */
  void getPreferredWidthForHeight(gid.gtk4.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_renderer_get_preferred_width_for_height(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the cell renderer prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The [gid.gtk4.types.SizeRequestMode] preferred by this renderer.
  */
  gid.gtk4.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_cell_renderer_get_request_mode(cast(GtkCellRenderer*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Returns the cell renderer’s sensitivity.
      Returns: true if the cell renderer is sensitive
  */
  bool getSensitive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_get_sensitive(cast(GtkCellRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Translates the cell renderer state to [gid.gtk4.types.StateFlags],
      based on the cell renderer and widget sensitivity, and
      the given [gid.gtk4.cell_renderer.CellRenderer]State.
  
      Params:
        widget = a [gid.gtk4.widget.Widget]
        cellState = cell renderer state
      Returns: the widget state flags applying to cell
  */
  gid.gtk4.types.StateFlags getState(gid.gtk4.widget.Widget widget, gid.gtk4.types.CellRendererState cellState) nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_cell_renderer_get_state(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellState);
    gid.gtk4.types.StateFlags _retval = cast(gid.gtk4.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns the cell renderer’s visibility.
      Returns: true if the cell renderer is visible
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_get_visible(cast(GtkCellRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the cell renderer can do something when activated.
      Returns: true if the cell renderer can do anything when activated
  */
  bool isActivatable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_renderer_is_activatable(cast(GtkCellRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Sets the renderer’s alignment within its available space.
  
      Params:
        xalign = the x alignment of the cell renderer
        yalign = the y alignment of the cell renderer
  */
  void setAlignment(float xalign, float yalign) nothrow
  {
    gtk_cell_renderer_set_alignment(cast(GtkCellRenderer*)this._cPtr, xalign, yalign);
  }

  /**
      Sets the renderer size to be explicit, independent of the properties set.
  
      Params:
        width = the width of the cell renderer, or -1
        height = the height of the cell renderer, or -1
  */
  void setFixedSize(int width, int height) nothrow
  {
    gtk_cell_renderer_set_fixed_size(cast(GtkCellRenderer*)this._cPtr, width, height);
  }

  /**
      Sets whether the given [gid.gtk4.cell_renderer.CellRenderer] is expanded.
  
      Params:
        isExpanded = whether cell should be expanded
  */
  void setIsExpanded(bool isExpanded) nothrow
  {
    gtk_cell_renderer_set_is_expanded(cast(GtkCellRenderer*)this._cPtr, isExpanded);
  }

  /**
      Sets whether the given [gid.gtk4.cell_renderer.CellRenderer] is an expander.
  
      Params:
        isExpander = whether cell is an expander
  */
  void setIsExpander(bool isExpander) nothrow
  {
    gtk_cell_renderer_set_is_expander(cast(GtkCellRenderer*)this._cPtr, isExpander);
  }

  /**
      Sets the renderer’s padding.
  
      Params:
        xpad = the x padding of the cell renderer
        ypad = the y padding of the cell renderer
  */
  void setPadding(int xpad, int ypad) nothrow
  {
    gtk_cell_renderer_set_padding(cast(GtkCellRenderer*)this._cPtr, xpad, ypad);
  }

  /**
      Sets the cell renderer’s sensitivity.
  
      Params:
        sensitive = the sensitivity of the cell
  */
  void setSensitive(bool sensitive) nothrow
  {
    gtk_cell_renderer_set_sensitive(cast(GtkCellRenderer*)this._cPtr, sensitive);
  }

  /**
      Sets the cell renderer’s visibility.
  
      Params:
        visible = the visibility of the cell
  */
  void setVisible(bool visible) nothrow
  {
    gtk_cell_renderer_set_visible(cast(GtkCellRenderer*)this._cPtr, visible);
  }

  /**
      Invokes the virtual render function of the [gid.gtk4.cell_renderer.CellRenderer]. The three
      passed-in rectangles are areas in cr. Most renderers will draw within
      cell_area; the xalign, yalign, xpad, and ypad fields of the [gid.gtk4.cell_renderer.CellRenderer]
      should be honored with respect to cell_area. background_area includes the
      blank space around the cell, and also the area containing the tree expander;
      so the background_area rectangles for all cells tile to cover the entire
      window.
  
      Params:
        snapshot = a [gid.gtk4.snapshot.Snapshot] to draw to
        widget = the widget owning window
        backgroundArea = entire cell area (including tree expanders and maybe
             padding on the sides)
        cellArea = area normally rendered by a cell renderer
        flags = flags that affect rendering
  */
  void snapshot(gid.gtk4.snapshot.Snapshot snapshot, gid.gtk4.widget.Widget widget, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags) nothrow
  {
    gtk_cell_renderer_snapshot(cast(GtkCellRenderer*)this._cPtr, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
  }

  /**
      Starts editing the contents of this cell, through a new [gid.gtk4.cell_editable.CellEditable]
      widget created by the [gid.gtk4.cell_renderer.CellRenderer]Class.start_editing virtual function.
  
      Params:
        event = a [gid.gdk4.event.Event]
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for [gid.gtk4.tree_view.TreeView], a string representation of [gid.gtk4.tree_path.TreePath]
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: A new [gid.gtk4.cell_editable.CellEditable] for editing this
          cell, or null if editing is not possible
  */
  gid.gtk4.cell_editable.CellEditable startEditing(gid.gdk4.event.Event event, gid.gtk4.widget.Widget widget, string path, gid.gdk4.rectangle.Rectangle backgroundArea, gid.gdk4.rectangle.Rectangle cellArea, gid.gtk4.types.CellRendererState flags) nothrow
  {
    GtkCellEditable* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_renderer_start_editing(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Informs the cell renderer that the editing is stopped.
      If canceled is true, the cell renderer will emit the
      [gid.gtk4.cell_renderer.CellRenderer]::editing-canceled signal.
      
      This function should be called by cell renderer implementations
      in response to the `GtkCellEditable::editing-done` signal of
      [gid.gtk4.cell_editable.CellEditable].
  
      Params:
        canceled = true if the editing has been canceled
  */
  void stopEditing(bool canceled) nothrow
  {
    gtk_cell_renderer_stop_editing(cast(GtkCellRenderer*)this._cPtr, canceled);
  }

  /**
      Connect to `EditingCanceled` signal.
  
      This signal gets emitted when the user cancels the process of editing a
        cell.  For example, an editable cell renderer could be written to cancel
        editing when the user presses Escape.
        
        See also: [gid.gtk4.cell_renderer.CellRenderer.stopEditing].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.cell_renderer.CellRenderer cellRenderer)`
  
          `cellRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEditingCanceled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.cell_renderer.CellRenderer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.editingCanceled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-canceled", closure, after);
  }

  /**
      Connect to `EditingStarted` signal.
  
      This signal gets emitted when a cell starts to be edited.
        The intended use of this signal is to do special setup
        on editable, e.g. adding a [gid.gtk4.entry_completion.EntryCompletion] or setting
        up additional columns in a [gid.gtk4.combo_box.ComboBox].
        
        See [gid.gtk4.cell_editable.CellEditable.startEditing] for information on the lifecycle of
        the editable and a way to do setup that doesn’t depend on the renderer.
        
        Note that GTK doesn't guarantee that cell renderers will
        continue to use the same kind of widget for editing in future
        releases, therefore you should check the type of editable
        before doing any specific setup, as in the following example:
        
        ```c
        static void
        text_editing_started (GtkCellRenderer *cell,
                              GtkCellEditable *editable,
                              const char      *path,
                              gpointer         data)
        {
          if (GTK_IS_ENTRY (editable))
            {
              GtkEntry *entry = GTK_ENTRY (editable);
        
              // ... create a GtkEntryCompletion
        
              gtk_entry_set_completion (entry, completion);
            }
        }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.cell_editable.CellEditable editable, string path, gid.gtk4.cell_renderer.CellRenderer cellRenderer)`
  
          `editable` the [gid.gtk4.cell_editable.CellEditable] (optional)
  
          `path` the path identifying the edited cell (optional)
  
          `cellRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEditingStarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.cell_editable.CellEditable)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.cell_renderer.CellRenderer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.editingStarted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-started", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellRenderer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.cell_renderer.CellRenderer), T.stringof ~ " is not derived from gid.gtk4.cell_renderer.CellRenderer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEditingCanceled", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "editing_canceled");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEditingStarted", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "editing_started");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetAlignedArea", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_aligned_area");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeight", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightForWidth", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_height_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidth", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidthForHeight", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_width_for_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSnapshot", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "snapshot");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStartEditing", true)[0]) == gid.gtk4.cell_renderer.CellRenderer))
      _installVfunc(klass, "start_editing");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellRendererClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) gboolean _vfuncActivateTramp(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(cell, event, widget, path, backgroundArea, cellArea, flags);
            return typeof(return).init;
          }

          bool _dretval;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncActivate(event ? new gid.gdk4.event.Event(cast(void*)event, No.Take) : null, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), _path, *cast(gid.gdk4.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncActivate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "editing_canceled":
      {
        static extern(C) void _vfuncEditingCanceledTramp(GtkCellRenderer* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.editingCanceled)
              return (cast(typeof(&_vfuncEditingCanceledTramp))_klass.editingCanceled)(cell);
            return;
          }

          try
          {
            _obj.vfuncEditingCanceled();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncEditingCanceled");
          }
        }

        _klass.editingCanceled = cast(typeof(_klass.editingCanceled))&_vfuncEditingCanceledTramp;
        break;
      }
      case "editing_started":
      {
        static extern(C) void _vfuncEditingStartedTramp(GtkCellRenderer* cell, GtkCellEditable* editable, const(char)* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.editingStarted)
              return (cast(typeof(&_vfuncEditingStartedTramp))_klass.editingStarted)(cell, editable, path);
            return;
          }

          string _path = path.fromCString!(No.Free);

          try
          {
            _obj.vfuncEditingStarted(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_editable.CellEditable)(cast(void*)editable, No.Take), _path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncEditingStarted");
          }
        }

        _klass.editingStarted = cast(typeof(_klass.editingStarted))&_vfuncEditingStartedTramp;
        break;
      }
      case "get_aligned_area":
      {
        static extern(C) void _vfuncGetAlignedAreaTramp(GtkCellRenderer* cell, GtkWidget* widget, GtkCellRendererState flags, const(GdkRectangle)* cellArea, GdkRectangle* alignedArea) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getAlignedArea)
              return (cast(typeof(&_vfuncGetAlignedAreaTramp))_klass.getAlignedArea)(cell, widget, flags, cellArea, alignedArea);
            return;
          }

          try
          {
            _obj.vfuncGetAlignedArea(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), flags, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, *cast(gid.gdk4.rectangle.Rectangle*)alignedArea);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetAlignedArea");
          }
        }

        _klass.getAlignedArea = cast(typeof(_klass.getAlignedArea))&_vfuncGetAlignedAreaTramp;
        break;
      }
      case "get_preferred_height":
      {
        static extern(C) void _vfuncGetPreferredHeightTramp(GtkCellRenderer* cell, GtkWidget* widget, int* minimumSize, int* naturalSize) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getPreferredHeight)
              return (cast(typeof(&_vfuncGetPreferredHeightTramp))_klass.getPreferredHeight)(cell, widget, minimumSize, naturalSize);
            return;
          }

          typeof(*minimumSize) _minimumSizeNull;
          if (!minimumSize)
            minimumSize = &_minimumSizeNull;

          typeof(*naturalSize) _naturalSizeNull;
          if (!naturalSize)
            naturalSize = &_naturalSizeNull;

          try
          {
            _obj.vfuncGetPreferredHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *minimumSize, *naturalSize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetPreferredHeight");
          }
        }

        _klass.getPreferredHeight = cast(typeof(_klass.getPreferredHeight))&_vfuncGetPreferredHeightTramp;
        break;
      }
      case "get_preferred_height_for_width":
      {
        static extern(C) void _vfuncGetPreferredHeightForWidthTramp(GtkCellRenderer* cell, GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getPreferredHeightForWidth)
              return (cast(typeof(&_vfuncGetPreferredHeightForWidthTramp))_klass.getPreferredHeightForWidth)(cell, widget, width, minimumHeight, naturalHeight);
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
            _obj.vfuncGetPreferredHeightForWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), width, *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetPreferredHeightForWidth");
          }
        }

        _klass.getPreferredHeightForWidth = cast(typeof(_klass.getPreferredHeightForWidth))&_vfuncGetPreferredHeightForWidthTramp;
        break;
      }
      case "get_preferred_width":
      {
        static extern(C) void _vfuncGetPreferredWidthTramp(GtkCellRenderer* cell, GtkWidget* widget, int* minimumSize, int* naturalSize) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getPreferredWidth)
              return (cast(typeof(&_vfuncGetPreferredWidthTramp))_klass.getPreferredWidth)(cell, widget, minimumSize, naturalSize);
            return;
          }

          typeof(*minimumSize) _minimumSizeNull;
          if (!minimumSize)
            minimumSize = &_minimumSizeNull;

          typeof(*naturalSize) _naturalSizeNull;
          if (!naturalSize)
            naturalSize = &_naturalSizeNull;

          try
          {
            _obj.vfuncGetPreferredWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *minimumSize, *naturalSize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetPreferredWidth");
          }
        }

        _klass.getPreferredWidth = cast(typeof(_klass.getPreferredWidth))&_vfuncGetPreferredWidthTramp;
        break;
      }
      case "get_preferred_width_for_height":
      {
        static extern(C) void _vfuncGetPreferredWidthForHeightTramp(GtkCellRenderer* cell, GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getPreferredWidthForHeight)
              return (cast(typeof(&_vfuncGetPreferredWidthForHeightTramp))_klass.getPreferredWidthForHeight)(cell, widget, height, minimumWidth, naturalWidth);
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
            _obj.vfuncGetPreferredWidthForHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), height, *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetPreferredWidthForHeight");
          }
        }

        _klass.getPreferredWidthForHeight = cast(typeof(_klass.getPreferredWidthForHeight))&_vfuncGetPreferredWidthForHeightTramp;
        break;
      }
      case "get_request_mode":
      {
        static extern(C) GtkSizeRequestMode _vfuncGetRequestModeTramp(GtkCellRenderer* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(cell);
            return typeof(return).init;
          }

          gid.gtk4.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "snapshot":
      {
        static extern(C) void _vfuncSnapshotTramp(GtkCellRenderer* cell, GtkSnapshot* snapshot, GtkWidget* widget, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.snapshot)
              return (cast(typeof(&_vfuncSnapshotTramp))_klass.snapshot)(cell, snapshot, widget, backgroundArea, cellArea, flags);
            return;
          }

          try
          {
            _obj.vfuncSnapshot(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), *cast(gid.gdk4.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncSnapshot");
          }
        }

        _klass.snapshot = cast(typeof(_klass.snapshot))&_vfuncSnapshotTramp;
        break;
      }
      case "start_editing":
      {
        static extern(C) GtkCellEditable* _vfuncStartEditingTramp(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.startEditing)
              return (cast(typeof(&_vfuncStartEditingTramp))_klass.startEditing)(cell, event, widget, path, backgroundArea, cellArea, flags);
            return typeof(return).init;
          }

          gid.gtk4.cell_editable.CellEditable _dretval;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncStartEditing(event ? new gid.gdk4.event.Event(cast(void*)event, No.Take) : null, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), _path, *cast(gid.gdk4.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk4.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.cell_renderer.CellRenderer.vfuncStartEditing");
          }
          auto _retval = _dretval ? cast(GtkCellEditable*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.startEditing = cast(typeof(_klass.startEditing))&_vfuncStartEditingTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.cell_renderer.CellRenderer]
class CellRendererGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /** */
  T cellBackground(string propval) nothrow
  {
    return setProperty("cell-background", propval);
  }

  /**
      Set `cellBackgroundRgba` property.
      Params:
        propval = Cell background as a [gid.gdk4.rgba.RGBA]
      Returns: Builder instance for fluent chaining
  */
  T cellBackgroundRgba(gid.gdk4.rgba.RGBA propval) nothrow
  {
    return setProperty("cell-background-rgba", propval);
  }

  /** */
  T cellBackgroundSet(bool propval) nothrow
  {
    return setProperty("cell-background-set", propval);
  }

  /** */
  T height(int propval) nothrow
  {
    return setProperty("height", propval);
  }

  /** */
  T isExpanded(bool propval) nothrow
  {
    return setProperty("is-expanded", propval);
  }

  /** */
  T isExpander(bool propval) nothrow
  {
    return setProperty("is-expander", propval);
  }

  /** */
  T mode(gid.gtk4.types.CellRendererMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /** */
  T sensitive(bool propval) nothrow
  {
    return setProperty("sensitive", propval);
  }

  /** */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }

  /** */
  T width(int propval) nothrow
  {
    return setProperty("width", propval);
  }

  /** */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /** */
  T xpad(uint propval) nothrow
  {
    return setProperty("xpad", propval);
  }

  /** */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }

  /** */
  T ypad(uint propval) nothrow
  {
    return setProperty("ypad", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_renderer.CellRenderer]
final class CellRendererGidBuilder : CellRendererGidBuilderImpl!CellRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRenderer build() nothrow
  {
    return new CellRenderer(cast(void*)createGObject(CellRenderer._getGType), Yes.Take);
  }
}
