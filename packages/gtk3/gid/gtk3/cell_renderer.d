/// Module for [CellRenderer] class
module gid.gtk3.cell_renderer;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.core.utils;
import gid.gdk3.color;
import gid.gdk3.event;
import gid.gdk3.rectangle;
import gid.gdk3.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_editable;
import gid.gtk3.requisition;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkCellRenderer is a base class of a set of objects used for
    rendering a cell to a #cairo_t.  These objects are used primarily by
    the #GtkTreeView widget, though they aren’t tied to them in any
    specific way.  It is worth noting that #GtkCellRenderer is not a
    #GtkWidget and cannot be treated as such.
    
    The primary use of a #GtkCellRenderer is for drawing a certain graphical
    elements on a #cairo_t. Typically, one cell renderer is used to
    draw many cells on the screen.  To this extent, it isn’t expected that a
    CellRenderer keep any permanent state around.  Instead, any state is set
    just prior to use using #GObjects property system.  Then, the
    cell is measured using [gid.gtk3.cell_renderer.CellRenderer.getSize]. Finally, the cell
    is rendered in the correct location using [gid.gtk3.cell_renderer.CellRenderer.render].
    
    There are a number of rules that must be followed when writing a new
    #GtkCellRenderer.  First and foremost, it’s important that a certain set
    of properties will always yield a cell renderer of the same size,
    barring a #GtkStyle change.  The #GtkCellRenderer also has a number of
    generic properties that are expected to be honored by all children.
    
    Beyond merely rendering a cell, cell renderers can optionally
    provide active user interface elements. A cell renderer can be
    “activatable” like #GtkCellRendererToggle,
    which toggles when it gets activated by a mouse click, or it can be
    “editable” like #GtkCellRendererText, which
    allows the user to edit the text using a widget implementing the
    #GtkCellEditable interface, e.g. #GtkEntry.
    To make a cell renderer activatable or editable, you have to
    implement the #GtkCellRendererClass.activate or
    #GtkCellRendererClass.start_editing virtual functions, respectively.
    
    Many properties of #GtkCellRenderer and its subclasses have a
    corresponding “set” property, e.g. “cell-background-set” corresponds
    to “cell-background”. These “set” properties reflect whether a property
    has been set or not. You should not set them independently.
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
      [gobject.object.GObjectSubclass]).
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
      Get builder for [gid.gtk3.cell_renderer.CellRenderer]
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
      Get `cellBackgroundGdk` property.
      Returns: Cell background as a #GdkColor
  
      Deprecated: Use #GtkCellRenderer:cell-background-rgba instead.
  */
  @property gid.gdk3.color.Color cellBackgroundGdk() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.color.Color)("cell-background-gdk");
  }

  /**
      Set `cellBackgroundGdk` property.
      Params:
        propval = Cell background as a #GdkColor
  
      Deprecated: Use #GtkCellRenderer:cell-background-rgba instead.
  */
  @property void cellBackgroundGdk(gid.gdk3.color.Color propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.color.Color)("cell-background-gdk", propval);
  }

  /**
      Get `cellBackgroundRgba` property.
      Returns: Cell background as a #GdkRGBA
  */
  @property gid.gdk3.rgba.RGBA cellBackgroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.rgba.RGBA)("cell-background-rgba");
  }

  /**
      Set `cellBackgroundRgba` property.
      Params:
        propval = Cell background as a #GdkRGBA
  */
  @property void cellBackgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.rgba.RGBA)("cell-background-rgba", propval);
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
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("is-expanded");
  }

  /** */
  @property void isExpanded(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("is-expanded", propval);
  }

  /** */
  @property bool isExpander() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("is-expander");
  }

  /** */
  @property void isExpander(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("is-expander", propval);
  }

  /** */
  @property gid.gtk3.types.CellRendererMode mode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.CellRendererMode)("mode");
  }

  /** */
  @property void mode(gid.gtk3.types.CellRendererMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.CellRendererMode)("mode", propval);
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
      Some cell renderers may use events; for example, #GtkCellRendererToggle
      toggles when it gets a mouse click.
  
      Params:
        event = a #GdkEvent (modified in place, changes are seen by the caller)
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for #GtkTreeView, a string representation of #GtkTreePath
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: true if the event was consumed/handled
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncActivate(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget, string path, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags)
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
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
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
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncEditingStarted(gid.gtk3.cell_editable.CellEditable editable, string path)
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
        widget = the #GtkWidget this cell will be rendering to
        flags = render flags
        cellArea = cell area which would be passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        alignedArea = the return location for the space inside cell_area
                         that would acually be used to render.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetAlignedArea` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetAlignedArea(gid.gtk3.widget.Widget widget, gid.gtk3.types.CellRendererState flags, gid.gdk3.rectangle.Rectangle cellArea, out gid.gdk3.rectangle.Rectangle alignedArea)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getAlignedArea)
      return;

    _klass.getAlignedArea(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&alignedArea);
  }

  /**
      Retreives a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        minimumSize = location to store the minimum size, or null
        naturalSize = location to store the natural size, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeight(gid.gtk3.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredHeight)
      return;

    _klass.getPreferredHeight(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retreives a cell renderers’s minimum and natural height if it were rendered to
      widget with the specified width.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        width = the size which is available for allocation
        minimumHeight = location for storing the minimum size, or null
        naturalHeight = location for storing the preferred size, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredHeightForWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredHeightForWidth(gid.gtk3.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredHeightForWidth)
      return;

    _klass.getPreferredHeightForWidth(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retreives a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        minimumSize = location to store the minimum size, or null
        naturalSize = location to store the natural size, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidth` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidth(gid.gtk3.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredWidth)
      return;

    _klass.getPreferredWidth(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retreives a cell renderers’s minimum and natural width if it were rendered to
      widget with the specified height.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        height = the size which is available for allocation
        minimumWidth = location for storing the minimum size, or null
        naturalWidth = location for storing the preferred size, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreferredWidthForHeight` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetPreferredWidthForHeight(gid.gtk3.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getPreferredWidthForHeight)
      return;

    _klass.getPreferredWidthForHeight(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the cell renderer prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The #GtkSizeRequestMode preferred by this renderer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gtk3.types.SizeRequestMode vfuncGetRequestMode()
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkCellRenderer*)this._cPtr);
    gid.gtk3.types.SizeRequestMode _retval = cast(gid.gtk3.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Obtains the width and height needed to render the cell. Used by view
      widgets to determine the appropriate size for the cell_area passed to
      [gid.gtk3.cell_renderer.CellRenderer.render].  If cell_area is not null, fills in the
      x and y offsets (if set) of the cell relative to this location.
      
      Please note that the values set in width and height, as well as those
      in x_offset and y_offset are inclusive of the xpad and ypad properties.
  
      Params:
        widget = the widget the renderer is rendering to
        cellArea = The area a cell will be allocated, or null
        xOffset = location to return x offset of cell relative to cell_area, or null
        yOffset = location to return y offset of cell relative to cell_area, or null
        width = location to return width needed to render a cell, or null
        height = location to return height needed to render a cell, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.cell_renderer.CellRenderer.getPreferredSize] instead.
  */
  protected void vfuncGetSize(gid.gtk3.widget.Widget widget, gid.gdk3.rectangle.Rectangle* cellArea, out int xOffset, out int yOffset, out int width, out int height)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.getSize)
      return;

    _klass.getSize(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)cellArea, cast(int*)&xOffset, cast(int*)&yOffset, cast(int*)&width, cast(int*)&height);
  }

  /**
      Invokes the virtual render function of the #GtkCellRenderer. The three
      passed-in rectangles are areas in cr. Most renderers will draw within
      cell_area; the xalign, yalign, xpad, and ypad fields of the #GtkCellRenderer
      should be honored with respect to cell_area. background_area includes the
      blank space around the cell, and also the area containing the tree expander;
      so the background_area rectangles for all cells tile to cover the entire
      window.
  
      Params:
        cr = a cairo context to draw to (modified in place, changes are seen by the caller)
        widget = the widget owning window
        backgroundArea = entire cell area (including tree expanders and maybe
             padding on the sides)
        cellArea = area normally rendered by a cell renderer
        flags = flags that affect rendering
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRender` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncRender(gid.cairo1.context.Context cr, gid.gtk3.widget.Widget widget, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.render)
      return;

    _klass.render(cast(GtkCellRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
  }

  /**
      Starts editing the contents of this cell, through a new #GtkCellEditable
      widget created by the #GtkCellRendererClass.start_editing virtual function.
  
      Params:
        event = a #GdkEvent (modified in place, changes are seen by the caller)
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for #GtkTreeView, a string representation of #GtkTreePath
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: A new #GtkCellEditable for editing this
          cell, or null if editing is not possible
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStartEditing` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gtk3.cell_editable.CellEditable vfuncStartEditing(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget, string path, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags)
  {
    auto _klass = cast(GtkCellRendererClass*)_vfuncClass;
    if (!_klass.startEditing)
      return typeof(return).init;

    GtkCellEditable* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.startEditing(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Passes an activate event to the cell renderer for possible processing.
      Some cell renderers may use events; for example, #GtkCellRendererToggle
      toggles when it gets a mouse click.
  
      Params:
        event = a #GdkEvent
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for #GtkTreeView, a string representation of #GtkTreePath
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: true if the event was consumed/handled
  */
  bool activate(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget, string path, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags) nothrow
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
        widget = the #GtkWidget this cell will be rendering to
        flags = render flags
        cellArea = cell area which would be passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        alignedArea = the return location for the space inside cell_area
                         that would acually be used to render.
  */
  void getAlignedArea(gid.gtk3.widget.Widget widget, gid.gtk3.types.CellRendererState flags, gid.gdk3.rectangle.Rectangle cellArea, out gid.gdk3.rectangle.Rectangle alignedArea) nothrow
  {
    gtk_cell_renderer_get_aligned_area(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags, cast(const(GdkRectangle)*)&cellArea, cast(GdkRectangle*)&alignedArea);
  }

  /**
      Fills in xalign and yalign with the appropriate values of cell.
  
      Params:
        xalign = location to fill in with the x alignment of the cell, or null
        yalign = location to fill in with the y alignment of the cell, or null
  */
  void getAlignment(out float xalign, out float yalign) nothrow
  {
    gtk_cell_renderer_get_alignment(cast(GtkCellRenderer*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Fills in width and height with the appropriate size of cell.
  
      Params:
        width = location to fill in with the fixed width of the cell, or null
        height = location to fill in with the fixed height of the cell, or null
  */
  void getFixedSize(out int width, out int height) nothrow
  {
    gtk_cell_renderer_get_fixed_size(cast(GtkCellRenderer*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Fills in xpad and ypad with the appropriate values of cell.
  
      Params:
        xpad = location to fill in with the x padding of the cell, or null
        ypad = location to fill in with the y padding of the cell, or null
  */
  void getPadding(out int xpad, out int ypad) nothrow
  {
    gtk_cell_renderer_get_padding(cast(GtkCellRenderer*)this._cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Retreives a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        minimumSize = location to store the minimum size, or null
        naturalSize = location to store the natural size, or null
  */
  void getPreferredHeight(gid.gtk3.widget.Widget widget, out int minimumSize, out int naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_height(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retreives a cell renderers’s minimum and natural height if it were rendered to
      widget with the specified width.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        width = the size which is available for allocation
        minimumHeight = location for storing the minimum size, or null
        naturalHeight = location for storing the preferred size, or null
  */
  void getPreferredHeightForWidth(gid.gtk3.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight) nothrow
  {
    gtk_cell_renderer_get_preferred_height_for_width(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves the minimum and natural size of a cell taking
      into account the widget’s preference for height-for-width management.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        minimumSize = location for storing the minimum size, or null
        naturalSize = location for storing the natural size, or null
  */
  void getPreferredSize(gid.gtk3.widget.Widget widget, out gid.gtk3.requisition.Requisition minimumSize, out gid.gtk3.requisition.Requisition naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_size(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(GtkRequisition*)&minimumSize, cast(GtkRequisition*)&naturalSize);
  }

  /**
      Retreives a renderer’s natural size when rendered to widget.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        minimumSize = location to store the minimum size, or null
        naturalSize = location to store the natural size, or null
  */
  void getPreferredWidth(gid.gtk3.widget.Widget widget, out int minimumSize, out int naturalSize) nothrow
  {
    gtk_cell_renderer_get_preferred_width(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retreives a cell renderers’s minimum and natural width if it were rendered to
      widget with the specified height.
  
      Params:
        widget = the #GtkWidget this cell will be rendering to
        height = the size which is available for allocation
        minimumWidth = location for storing the minimum size, or null
        naturalWidth = location for storing the preferred size, or null
  */
  void getPreferredWidthForHeight(gid.gtk3.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth) nothrow
  {
    gtk_cell_renderer_get_preferred_width_for_height(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the cell renderer prefers a height-for-width layout
      or a width-for-height layout.
      Returns: The #GtkSizeRequestMode preferred by this renderer.
  */
  gid.gtk3.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_cell_renderer_get_request_mode(cast(GtkCellRenderer*)this._cPtr);
    gid.gtk3.types.SizeRequestMode _retval = cast(gid.gtk3.types.SizeRequestMode)_cretval;
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
      Obtains the width and height needed to render the cell. Used by view
      widgets to determine the appropriate size for the cell_area passed to
      [gid.gtk3.cell_renderer.CellRenderer.render].  If cell_area is not null, fills in the
      x and y offsets (if set) of the cell relative to this location.
      
      Please note that the values set in width and height, as well as those
      in x_offset and y_offset are inclusive of the xpad and ypad properties.
  
      Params:
        widget = the widget the renderer is rendering to
        cellArea = The area a cell will be allocated, or null
        xOffset = location to return x offset of cell relative to cell_area, or null
        yOffset = location to return y offset of cell relative to cell_area, or null
        width = location to return width needed to render a cell, or null
        height = location to return height needed to render a cell, or null
  
      Deprecated: Use [gid.gtk4.cell_renderer.CellRenderer.getPreferredSize] instead.
  */
  void getSize(gid.gtk3.widget.Widget widget, gid.gdk3.rectangle.Rectangle* cellArea, out int xOffset, out int yOffset, out int width, out int height) nothrow
  {
    gtk_cell_renderer_get_size(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)cellArea, cast(int*)&xOffset, cast(int*)&yOffset, cast(int*)&width, cast(int*)&height);
  }

  /**
      Translates the cell renderer state to #GtkStateFlags,
      based on the cell renderer and widget sensitivity, and
      the given #GtkCellRendererState.
  
      Params:
        widget = a #GtkWidget, or null
        cellState = cell renderer state
      Returns: the widget state flags applying to cell
  */
  gid.gtk3.types.StateFlags getState(gid.gtk3.widget.Widget widget, gid.gtk3.types.CellRendererState cellState) nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_cell_renderer_get_state(cast(GtkCellRenderer*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cellState);
    gid.gtk3.types.StateFlags _retval = cast(gid.gtk3.types.StateFlags)_cretval;
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
      Invokes the virtual render function of the #GtkCellRenderer. The three
      passed-in rectangles are areas in cr. Most renderers will draw within
      cell_area; the xalign, yalign, xpad, and ypad fields of the #GtkCellRenderer
      should be honored with respect to cell_area. background_area includes the
      blank space around the cell, and also the area containing the tree expander;
      so the background_area rectangles for all cells tile to cover the entire
      window.
  
      Params:
        cr = a cairo context to draw to
        widget = the widget owning window
        backgroundArea = entire cell area (including tree expanders and maybe
             padding on the sides)
        cellArea = area normally rendered by a cell renderer
        flags = flags that affect rendering
  */
  void render(gid.cairo1.context.Context cr, gid.gtk3.widget.Widget widget, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags) nothrow
  {
    gtk_cell_renderer_render(cast(GtkCellRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
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
      Starts editing the contents of this cell, through a new #GtkCellEditable
      widget created by the #GtkCellRendererClass.start_editing virtual function.
  
      Params:
        event = a #GdkEvent
        widget = widget that received the event
        path = widget-dependent string representation of the event location;
             e.g. for #GtkTreeView, a string representation of #GtkTreePath
        backgroundArea = background area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        cellArea = cell area as passed to [gid.gtk3.cell_renderer.CellRenderer.render]
        flags = render flags
      Returns: A new #GtkCellEditable for editing this
          cell, or null if editing is not possible
  */
  gid.gtk3.cell_editable.CellEditable startEditing(gid.gdk3.event.Event event, gid.gtk3.widget.Widget widget, string path, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.types.CellRendererState flags) nothrow
  {
    GtkCellEditable* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_renderer_start_editing(cast(GtkCellRenderer*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _path, cast(const(GdkRectangle)*)&backgroundArea, cast(const(GdkRectangle)*)&cellArea, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Informs the cell renderer that the editing is stopped.
      If canceled is true, the cell renderer will emit the
      #GtkCellRenderer::editing-canceled signal.
      
      This function should be called by cell renderer implementations
      in response to the #GtkCellEditable::editing-done signal of
      #GtkCellEditable.
  
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
  
          `void callback(gid.gtk3.cell_renderer.CellRenderer cellRenderer)`
  
          `cellRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEditingCanceled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.cell_renderer.CellRenderer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.editingCanceled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-canceled", closure, after);
  }

  /**
      Connect to `EditingStarted` signal.
  
      This signal gets emitted when a cell starts to be edited.
        The intended use of this signal is to do special setup
        on editable, e.g. adding a #GtkEntryCompletion or setting
        up additional columns in a #GtkComboBox.
        
        See [gid.gtk4.cell_editable.CellEditable.startEditing] for information on the lifecycle of
        the editable and a way to do setup that doesn’t depend on the renderer.
        
        Note that GTK+ doesn't guarantee that cell renderers will
        continue to use the same kind of widget for editing in future
        releases, therefore you should check the type of editable
        before doing any specific setup, as in the following example:
        ```c
        static void
        text_editing_started (GtkCellRenderer *cell,
                              GtkCellEditable *editable,
                              const gchar     *path,
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
  
          `void callback(gid.gtk3.cell_editable.CellEditable editable, string path, gid.gtk3.cell_renderer.CellRenderer cellRenderer)`
  
          `editable` the #GtkCellEditable (optional)
  
          `path` the path identifying the edited cell (optional)
  
          `cellRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEditingStarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.cell_editable.CellEditable)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.cell_renderer.CellRenderer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.editingStarted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-started", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellRenderer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.cell_renderer.CellRenderer), T.stringof ~ " is not derived from gid.gtk3.cell_renderer.CellRenderer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEditingCanceled", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "editing_canceled");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEditingStarted", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "editing_started");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetAlignedArea", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_aligned_area");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeight", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredHeightForWidth", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_height_for_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidth", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_width");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreferredWidthForHeight", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_preferred_width_for_height");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSize", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "get_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRender", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
      _installVfunc(klass, "render");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStartEditing", true)[0]) == gid.gtk3.cell_renderer.CellRenderer))
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(cell, event, widget, path, backgroundArea, cellArea, flags);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncActivate(_event, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _path, *cast(gid.gdk3.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncActivate");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_event)
            _event._cUnborrow;

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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncEditingCanceled");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            _obj.vfuncEditingStarted(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_editable.CellEditable)(cast(void*)editable, No.Take), _path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncEditingStarted");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getAlignedArea)
              return (cast(typeof(&_vfuncGetAlignedAreaTramp))_klass.getAlignedArea)(cell, widget, flags, cellArea, alignedArea);
            return;
          }

          try
          {
            _obj.vfuncGetAlignedArea(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), flags, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, *cast(gid.gdk3.rectangle.Rectangle*)alignedArea);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetAlignedArea");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            _obj.vfuncGetPreferredHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), *minimumSize, *naturalSize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetPreferredHeight");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            _obj.vfuncGetPreferredHeightForWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), width, *minimumHeight, *naturalHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetPreferredHeightForWidth");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            _obj.vfuncGetPreferredWidth(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), *minimumSize, *naturalSize);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetPreferredWidth");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
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
            _obj.vfuncGetPreferredWidthForHeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), height, *minimumWidth, *naturalWidth);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetPreferredWidthForHeight");
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
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(cell);
            return typeof(return).init;
          }

          gid.gtk3.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "get_size":
      {
        static extern(C) void _vfuncGetSizeTramp(GtkCellRenderer* cell, GtkWidget* widget, const(GdkRectangle)* cellArea, int* xOffset, int* yOffset, int* width, int* height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.getSize)
              return (cast(typeof(&_vfuncGetSizeTramp))_klass.getSize)(cell, widget, cellArea, xOffset, yOffset, width, height);
            return;
          }

          typeof(*xOffset) _xOffsetNull;
          if (!xOffset)
            xOffset = &_xOffsetNull;

          typeof(*yOffset) _yOffsetNull;
          if (!yOffset)
            yOffset = &_yOffsetNull;

          typeof(*width) _widthNull;
          if (!width)
            width = &_widthNull;

          typeof(*height) _heightNull;
          if (!height)
            height = &_heightNull;

          try
          {
            _obj.vfuncGetSize(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), cast(gid.gdk3.rectangle.Rectangle*)cellArea, *xOffset, *yOffset, *width, *height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncGetSize");
          }
        }

        _klass.getSize = cast(typeof(_klass.getSize))&_vfuncGetSizeTramp;
        break;
      }
      case "render":
      {
        static extern(C) void _vfuncRenderTramp(GtkCellRenderer* cell, cairo_t* cr, GtkWidget* widget, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.render)
              return (cast(typeof(&_vfuncRenderTramp))_klass.render)(cell, cr, widget, backgroundArea, cellArea, flags);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRender(_cr, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), *cast(gid.gdk3.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncRender");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.render = cast(typeof(_klass.render))&_vfuncRenderTramp;
        break;
      }
      case "start_editing":
      {
        static extern(C) GtkCellEditable* _vfuncStartEditingTramp(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_renderer.CellRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.startEditing)
              return (cast(typeof(&_vfuncStartEditingTramp))_klass.startEditing)(cell, event, widget, path, backgroundArea, cellArea, flags);
            return typeof(return).init;
          }

          gid.gtk3.cell_editable.CellEditable _dretval;
          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;
          string _path = path.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncStartEditing(_event, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), _path, *cast(gid.gdk3.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_renderer.CellRenderer.vfuncStartEditing");
          }
          auto _retval = _dretval ? cast(GtkCellEditable*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;
          if (_event)
            _event._cUnborrow;

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

/// Fluent builder implementation template for [gid.gtk3.cell_renderer.CellRenderer]
class CellRendererGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /** */
  T cellBackground(string propval) nothrow
  {
    return setProperty("cell-background", propval);
  }

  /**
      Set `cellBackgroundGdk` property.
      Params:
        propval = Cell background as a #GdkColor
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkCellRenderer:cell-background-rgba instead.
  */
  T cellBackgroundGdk(gid.gdk3.color.Color propval) nothrow
  {
    return setProperty("cell-background-gdk", propval);
  }

  /**
      Set `cellBackgroundRgba` property.
      Params:
        propval = Cell background as a #GdkRGBA
      Returns: Builder instance for fluent chaining
  */
  T cellBackgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
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
  T mode(gid.gtk3.types.CellRendererMode propval) nothrow
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

/// Fluent builder for [gid.gtk3.cell_renderer.CellRenderer]
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
