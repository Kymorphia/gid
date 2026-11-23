/// Module for [GutterRenderer] class
module gid.gtksource4.gutter_renderer;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.core.utils;
import gid.gdk3.event;
import gid.gdk3.rectangle;
import gid.gdk3.rgba;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk3.text_buffer;
import gid.gtk3.text_iter;
import gid.gtk3.text_view;
import gid.gtk3.tooltip;
import gid.gtk3.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/** */
class GutterRenderer : gid.gobject2.initially_unowned.InitiallyUnowned
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
    return cast(void function())gtk_source_gutter_renderer_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceGutterRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.gutter_renderer.GutterRenderer]
      Returns: New builder object
  */
  static GutterRendererGidBuilder builder() nothrow
  {
    return new GutterRendererGidBuilder;
  }

  /**
      Get `alignmentMode` property.
      Returns: The alignment mode of the renderer. This can be used to indicate
        that in the case a cell spans multiple lines (due to text wrapping)
        the alignment should work on either the full cell, the first line
        or the last line.
  */
  @property gid.gtksource4.types.GutterRendererAlignmentMode alignmentMode() nothrow
  {
    return getAlignmentMode();
  }

  /**
      Set `alignmentMode` property.
      Params:
        propval = The alignment mode of the renderer. This can be used to indicate
          that in the case a cell spans multiple lines (due to text wrapping)
          the alignment should work on either the full cell, the first line
          or the last line.
  */
  @property void alignmentMode(gid.gtksource4.types.GutterRendererAlignmentMode propval) nothrow
  {
    setAlignmentMode(propval);
  }

  /** */
  @property gid.gdk3.rgba.RGBA backgroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.rgba.RGBA)("background-rgba");
  }

  /** */
  @property void backgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /** */
  @property int size() nothrow
  {
    return getSize();
  }

  /** */
  @property void size(int propval) nothrow
  {
    setSize(propval);
  }

  /**
      Get `view` property.
      Returns: The view on which the renderer is placed.
  */
  @property gid.gtk3.text_view.TextView view() nothrow
  {
    return getView();
  }

  /**
      Get `visible` property.
      Returns: The visibility of the renderer.
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = The visibility of the renderer.
  */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /**
      Get `windowType` property.
      Returns: The window type of the view on which the renderer is placed (left,
        or right).
  */
  @property gid.gtk3.types.TextWindowType windowType() nothrow
  {
    return getWindowType();
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the renderer. Set to 0 for a left
        alignment. 1 for a right alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float xalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the renderer. Set to 0 for a left
          alignment. 1 for a right alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void xalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `xpad` property.
      Returns: The left and right padding of the renderer.
  */
  @property int xpad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("xpad");
  }

  /**
      Set `xpad` property.
      Params:
        propval = The left and right padding of the renderer.
  */
  @property void xpad(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("xpad", propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the renderer. Set to 0 for a top
        alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float yalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the renderer. Set to 0 for a top
          alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void yalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /**
      Get `ypad` property.
      Returns: The top and bottom padding of the renderer.
  */
  @property int ypad() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("ypad");
  }

  /**
      Set `ypad` property.
      Params:
        propval = The top and bottom padding of the renderer.
  */
  @property void ypad(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("ypad", propval);
  }

  /**
      Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
      called from #GtkSourceGutter and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated (modified in place, changes are seen by the caller)
        area = a #GdkRectangle of the cell area where the renderer is activated
        event = the event that triggered the activation (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivate(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Called when drawing a region begins. The region to be drawn is indicated
      by start and end. The purpose is to allow the implementation to precompute
      some state before the draw method is called for each cell.
  
      Params:
        cr = a #cairo_t (modified in place, changes are seen by the caller)
        backgroundArea = a #GdkRectangle
        cellArea = a #GdkRectangle
        start = a #GtkTextIter (modified in place, changes are seen by the caller)
        end = a #GtkTextIter (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncBegin` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncBegin(gid.cairo1.context.Context cr, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.begin)
      return;

    _klass.begin(cast(GtkSourceGutterRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&backgroundArea, cast(GdkRectangle*)&cellArea, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      This is called when the text buffer changes for renderer.
  
      Params:
        oldBuffer = the old #GtkTextBuffer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChangeBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChangeBuffer(gid.gtk3.text_buffer.TextBuffer oldBuffer = null)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.changeBuffer)
      return;

    _klass.changeBuffer(cast(GtkSourceGutterRenderer*)this._cPtr, oldBuffer ? cast(GtkTextBuffer*)oldBuffer._cPtr(No.Dup) : null);
  }

  /**
      This is called when the text view changes for renderer.
  
      Params:
        oldView = the old #GtkTextView.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChangeView` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChangeView(gid.gtk3.text_view.TextView oldView = null)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.changeView)
      return;

    _klass.changeView(cast(GtkSourceGutterRenderer*)this._cPtr, oldView ? cast(GtkTextView*)oldView._cPtr(No.Dup) : null);
  }

  /**
      Main renderering method. Implementations should implement this method to draw
      onto the cairo context. The background_area indicates the total area of the
      cell to be drawn. The cell_area indicates the area where content can be
      drawn (text, images, etc).
      
      The background_area is the cell_area plus the padding on each side (two
      times the #GtkSourceGutterRenderer:xpad horizontally and two times the
      #GtkSourceGutterRenderer:ypad vertically, so that the cell_area is centered
      inside background_area).
      
      The state argument indicates the current state of the renderer and should
      be taken into account to properly draw the different possible states
      (cursor, prelit, selected) if appropriate.
  
      Params:
        cr = the cairo render context (modified in place, changes are seen by the caller)
        backgroundArea = a #GdkRectangle indicating the total area to be drawn
        cellArea = a #GdkRectangle indicating the area to draw content
        start = a #GtkTextIter (modified in place, changes are seen by the caller)
        end = a #GtkTextIter (modified in place, changes are seen by the caller)
        state = a #GtkSourceGutterRendererState
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDraw` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDraw(gid.cairo1.context.Context cr, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.GutterRendererState state)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.draw)
      return;

    _klass.draw(cast(GtkSourceGutterRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&backgroundArea, cast(GdkRectangle*)&cellArea, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, state);
  }

  /**
      Called when drawing a region of lines has ended.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncEnd()
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.end)
      return;

    _klass.end(cast(GtkSourceGutterRenderer*)this._cPtr);
  }

  /**
      Get whether the renderer is activatable at the location in event. This is
      called from #GtkSourceGutter to determine whether a renderer is activatable
      using the mouse pointer.
  
      Params:
        iter = a #GtkTextIter at the start of the line to be activated (modified in place, changes are seen by the caller)
        area = a #GdkRectangle of the cell area to be activated
        event = the event that triggered the query (modified in place, changes are seen by the caller)
      Returns: true if the renderer can be activated, false otherwise
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryActivatable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncQueryActivatable(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queryActivatable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryActivatable(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Emit the #GtkSourceGutterRenderer::query-data signal. This function is called
      to query for data just before rendering a cell. This is called from the
      #GtkSourceGutter.  Implementations can override the default signal handler or
      can connect a signal handler externally to the
      #GtkSourceGutterRenderer::query-data signal.
  
      Params:
        start = a #GtkTextIter. (modified in place, changes are seen by the caller)
        end = a #GtkTextIter. (modified in place, changes are seen by the caller)
        state = a #GtkSourceGutterRendererState.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryData` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQueryData(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.GutterRendererState state)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queryData)
      return;

    _klass.queryData(cast(GtkSourceGutterRenderer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, state);
  }

  /**
      Emits the #GtkSourceGutterRenderer::query-tooltip signal. This function is
      called from #GtkSourceGutter. Implementations can override the default signal
      handler or can connect to the signal externally.
  
      Params:
        iter = a #GtkTextIter. (modified in place, changes are seen by the caller)
        area = a #GdkRectangle.
        x = The x position of the tooltip.
        y = The y position of the tooltip.
        tooltip = a #GtkTooltip.
      Returns: true if the tooltip has been set, false otherwise
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryTooltip` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncQueryTooltip(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, int x, int y, gid.gtk3.tooltip.Tooltip tooltip)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queryTooltip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryTooltip(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, x, y, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Emits the #GtkSourceGutterRenderer::queue-draw signal of the renderer. Call
      this from an implementation to inform that the renderer has changed such that
      it needs to redraw.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueueDraw` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQueueDraw()
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queueDraw)
      return;

    _klass.queueDraw(cast(GtkSourceGutterRenderer*)this._cPtr);
  }

  /**
      Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
      called from #GtkSourceGutter and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated
        area = a #GdkRectangle of the cell area where the renderer is activated
        event = the event that triggered the activation
  */
  void activate(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event) nothrow
  {
    gtk_source_gutter_renderer_activate(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Called when drawing a region begins. The region to be drawn is indicated
      by start and end. The purpose is to allow the implementation to precompute
      some state before the draw method is called for each cell.
  
      Params:
        cr = a #cairo_t
        backgroundArea = a #GdkRectangle
        cellArea = a #GdkRectangle
        start = a #GtkTextIter
        end = a #GtkTextIter
  */
  void begin(gid.cairo1.context.Context cr, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end) nothrow
  {
    gtk_source_gutter_renderer_begin(cast(GtkSourceGutterRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&backgroundArea, cast(GdkRectangle*)&cellArea, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null);
  }

  /**
      Main renderering method. Implementations should implement this method to draw
      onto the cairo context. The background_area indicates the total area of the
      cell to be drawn. The cell_area indicates the area where content can be
      drawn (text, images, etc).
      
      The background_area is the cell_area plus the padding on each side (two
      times the #GtkSourceGutterRenderer:xpad horizontally and two times the
      #GtkSourceGutterRenderer:ypad vertically, so that the cell_area is centered
      inside background_area).
      
      The state argument indicates the current state of the renderer and should
      be taken into account to properly draw the different possible states
      (cursor, prelit, selected) if appropriate.
  
      Params:
        cr = the cairo render context
        backgroundArea = a #GdkRectangle indicating the total area to be drawn
        cellArea = a #GdkRectangle indicating the area to draw content
        start = a #GtkTextIter
        end = a #GtkTextIter
        state = a #GtkSourceGutterRendererState
  */
  void draw(gid.cairo1.context.Context cr, gid.gdk3.rectangle.Rectangle backgroundArea, gid.gdk3.rectangle.Rectangle cellArea, gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.GutterRendererState state) nothrow
  {
    gtk_source_gutter_renderer_draw(cast(GtkSourceGutterRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&backgroundArea, cast(GdkRectangle*)&cellArea, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, state);
  }

  /**
      Called when drawing a region of lines has ended.
  */
  void end() nothrow
  {
    gtk_source_gutter_renderer_end(cast(GtkSourceGutterRenderer*)this._cPtr);
  }

  /**
      Get the x-alignment and y-alignment of the gutter renderer.
  
      Params:
        xalign = return location for the x-alignment,
            or null to ignore.
        yalign = return location for the y-alignment,
            or null to ignore.
  */
  void getAlignment(out float xalign, out float yalign) nothrow
  {
    gtk_source_gutter_renderer_get_alignment(cast(GtkSourceGutterRenderer*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Get the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see :xalign and :yalign).
      Returns: a #GtkSourceGutterRendererAlignmentMode
  */
  gid.gtksource4.types.GutterRendererAlignmentMode getAlignmentMode() nothrow
  {
    GtkSourceGutterRendererAlignmentMode _cretval;
    _cretval = gtk_source_gutter_renderer_get_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr);
    gid.gtksource4.types.GutterRendererAlignmentMode _retval = cast(gid.gtksource4.types.GutterRendererAlignmentMode)_cretval;
    return _retval;
  }

  /**
      Get the background color of the renderer.
  
      Params:
        color = return value for a #GdkRGBA
      Returns: true if the background color is set, false otherwise
  */
  bool getBackground(out gid.gdk3.rgba.RGBA color) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_get_background(cast(GtkSourceGutterRenderer*)this._cPtr, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Get the x-padding and y-padding of the gutter renderer.
  
      Params:
        xpad = return location for the x-padding,
            or null to ignore.
        ypad = return location for the y-padding,
            or null to ignore.
  */
  void getPadding(out int xpad, out int ypad) nothrow
  {
    gtk_source_gutter_renderer_get_padding(cast(GtkSourceGutterRenderer*)this._cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Get the size of the renderer.
      Returns: the size of the renderer.
  */
  int getSize() nothrow
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_size(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get the view associated to the gutter renderer
      Returns: a #GtkTextView
  */
  gid.gtk3.text_view.TextView getView() nothrow
  {
    GtkTextView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_view.TextView)(cast(GtkTextView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether the gutter renderer is visible.
      Returns: true if the renderer is visible, false otherwise
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_get_visible(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GtkTextWindowType associated with the gutter renderer.
      Returns: a #GtkTextWindowType
  */
  gid.gtk3.types.TextWindowType getWindowType() nothrow
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_source_gutter_renderer_get_window_type(cast(GtkSourceGutterRenderer*)this._cPtr);
    gid.gtk3.types.TextWindowType _retval = cast(gid.gtk3.types.TextWindowType)_cretval;
    return _retval;
  }

  /**
      Get whether the renderer is activatable at the location in event. This is
      called from #GtkSourceGutter to determine whether a renderer is activatable
      using the mouse pointer.
  
      Params:
        iter = a #GtkTextIter at the start of the line to be activated
        area = a #GdkRectangle of the cell area to be activated
        event = the event that triggered the query
      Returns: true if the renderer can be activated, false otherwise
  */
  bool queryActivatable(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_query_activatable(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Emit the #GtkSourceGutterRenderer::query-data signal. This function is called
      to query for data just before rendering a cell. This is called from the
      #GtkSourceGutter.  Implementations can override the default signal handler or
      can connect a signal handler externally to the
      #GtkSourceGutterRenderer::query-data signal.
  
      Params:
        start = a #GtkTextIter.
        end = a #GtkTextIter.
        state = a #GtkSourceGutterRendererState.
  */
  void queryData(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.GutterRendererState state) nothrow
  {
    gtk_source_gutter_renderer_query_data(cast(GtkSourceGutterRenderer*)this._cPtr, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, state);
  }

  /**
      Emits the #GtkSourceGutterRenderer::query-tooltip signal. This function is
      called from #GtkSourceGutter. Implementations can override the default signal
      handler or can connect to the signal externally.
  
      Params:
        iter = a #GtkTextIter.
        area = a #GdkRectangle.
        x = The x position of the tooltip.
        y = The y position of the tooltip.
        tooltip = a #GtkTooltip.
      Returns: true if the tooltip has been set, false otherwise
  */
  bool queryTooltip(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, int x, int y, gid.gtk3.tooltip.Tooltip tooltip) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_query_tooltip(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, x, y, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Emits the #GtkSourceGutterRenderer::queue-draw signal of the renderer. Call
      this from an implementation to inform that the renderer has changed such that
      it needs to redraw.
  */
  void queueDraw() nothrow
  {
    gtk_source_gutter_renderer_queue_draw(cast(GtkSourceGutterRenderer*)this._cPtr);
  }

  /**
      Set the alignment of the gutter renderer. Both xalign and yalign can be
      -1, which means the values will not be changed (this allows changing only
      one of the values).
      
      xalign is the horizontal alignment. Set to 0 for a left alignment. 1 for a
      right alignment. And 0.5 for centering the cells. yalign is the vertical
      alignment. Set to 0 for a top alignment. 1 for a bottom alignment.
  
      Params:
        xalign = the x-alignment
        yalign = the y-alignment
  */
  void setAlignment(float xalign, float yalign) nothrow
  {
    gtk_source_gutter_renderer_set_alignment(cast(GtkSourceGutterRenderer*)this._cPtr, xalign, yalign);
  }

  /**
      Set the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see :xalign and :yalign).
  
      Params:
        mode = a #GtkSourceGutterRendererAlignmentMode
  */
  void setAlignmentMode(gid.gtksource4.types.GutterRendererAlignmentMode mode) nothrow
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr, mode);
  }

  /**
      Set the background color of the renderer. If color is set to null, the
      renderer will not have a background color.
  
      Params:
        color = a #GdkRGBA or null
  */
  void setBackground(gid.gdk3.rgba.RGBA* color = null) nothrow
  {
    gtk_source_gutter_renderer_set_background(cast(GtkSourceGutterRenderer*)this._cPtr, cast(const(GdkRGBA)*)color);
  }

  /**
      Set the padding of the gutter renderer. Both xpad and ypad can be
      -1, which means the values will not be changed (this allows changing only
      one of the values).
      
      xpad is the left and right padding. ypad is the top and bottom padding.
  
      Params:
        xpad = the x-padding
        ypad = the y-padding
  */
  void setPadding(int xpad, int ypad) nothrow
  {
    gtk_source_gutter_renderer_set_padding(cast(GtkSourceGutterRenderer*)this._cPtr, xpad, ypad);
  }

  /**
      Sets the size of the renderer. A value of -1 specifies that the size
      is to be determined dynamically.
  
      Params:
        size = the size
  */
  void setSize(int size) nothrow
  {
    gtk_source_gutter_renderer_set_size(cast(GtkSourceGutterRenderer*)this._cPtr, size);
  }

  /**
      Set whether the gutter renderer is visible.
  
      Params:
        visible = the visibility
  */
  void setVisible(bool visible) nothrow
  {
    gtk_source_gutter_renderer_set_visible(cast(GtkSourceGutterRenderer*)this._cPtr, visible);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal is emitted when the renderer is
        activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event, gid.gtksource4.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `event` the event that caused the activation (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtksource4.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `QueryActivatable` signal.
  
      The ::query-activatable signal is emitted when the renderer
        can possibly be activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, gid.gdk3.event.Event event, gid.gtksource4.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `event` the #GdkEvent that is causing the activatable query (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryActivatable(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gdk3.event.Event)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtksource4.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.queryActivatable");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-activatable", closure, after);
  }

  /**
      Connect to `QueryData` signal.
  
      The ::query-data signal is emitted when the renderer needs
        to be filled with data just before a cell is drawn. This can
        be used by general renderer implementations to allow render
        data to be filled in externally.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.text_iter.TextIter start, gid.gtk3.text_iter.TextIter end, gid.gtksource4.types.GutterRendererState state, gid.gtksource4.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `start` a #GtkTextIter (optional)
  
          `end` a #GtkTextIter (optional)
  
          `state` the renderer state (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gid.gtksource4.types.GutterRendererState)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtksource4.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.queryData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-data", closure, after);
  }

  /**
      Connect to `QueryTooltip` signal.
  
      The ::query-tooltip signal is emitted when the renderer can
        show a tooltip.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.text_iter.TextIter iter, gid.gdk3.rectangle.Rectangle area, int x, int y, gid.gtk3.tooltip.Tooltip tooltip, gid.gtksource4.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `x` the x position (in window coordinates) (optional)
  
          `y` the y position (in window coordinates) (optional)
  
          `tooltip` a #GtkTooltip (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == int)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.tooltip.Tooltip)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gid.gtksource4.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[5]);

      static if (Parameters!T.length > 5)
        _paramTuple[5] = getVal!(Parameters!T[5])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.queryTooltip");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `QueueDraw` signal.
  
      The ::queue-draw signal is emitted when the renderer needs
        to be redrawn. Use [gid.gtksource4.gutter_renderer.GutterRenderer.queueDraw]
        to emit this signal from an implementation of the
        #GtkSourceGutterRenderer interface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtksource4.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueueDraw(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource4.gutter_renderer.GutterRenderer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.queueDraw");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("queue-draw", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GutterRenderer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtksource4.gutter_renderer.GutterRenderer), T.stringof ~ " is not derived from gid.gtksource4.gutter_renderer.GutterRenderer");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBegin", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "begin");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeBuffer", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "change_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeView", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "change_view");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDraw", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "draw");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEnd", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryActivatable", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "query_activatable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryData", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "query_data");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryTooltip", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "query_tooltip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueueDraw", true)[0]) == gid.gtksource4.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "queue_draw");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(renderer, iter, area, event);
            return;
          }

          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;
          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncActivate(_iter, *cast(gid.gdk3.rectangle.Rectangle*)area, _event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncActivate");
          }
          if (_iter)
            _iter._cUnborrow;
          if (_event)
            _event._cUnborrow;

        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "begin":
      {
        static extern(C) void _vfuncBeginTramp(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.begin)
              return (cast(typeof(&_vfuncBeginTramp))_klass.begin)(renderer, cr, backgroundArea, cellArea, start, end);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          auto _start = start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncBegin(_cr, *cast(gid.gdk3.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, _start, _end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncBegin");
          }
          if (_cr)
            _cr._cUnborrow;
          if (_start)
            _start._cUnborrow;
          if (_end)
            _end._cUnborrow;

        }

        _klass.begin = cast(typeof(_klass.begin))&_vfuncBeginTramp;
        break;
      }
      case "change_buffer":
      {
        static extern(C) void _vfuncChangeBufferTramp(GtkSourceGutterRenderer* renderer, GtkTextBuffer* oldBuffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.changeBuffer)
              return (cast(typeof(&_vfuncChangeBufferTramp))_klass.changeBuffer)(renderer, oldBuffer);
            return;
          }

          try
          {
            _obj.vfuncChangeBuffer(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_buffer.TextBuffer)(cast(void*)oldBuffer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncChangeBuffer");
          }
        }

        _klass.changeBuffer = cast(typeof(_klass.changeBuffer))&_vfuncChangeBufferTramp;
        break;
      }
      case "change_view":
      {
        static extern(C) void _vfuncChangeViewTramp(GtkSourceGutterRenderer* renderer, GtkTextView* oldView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.changeView)
              return (cast(typeof(&_vfuncChangeViewTramp))_klass.changeView)(renderer, oldView);
            return;
          }

          try
          {
            _obj.vfuncChangeView(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.text_view.TextView)(cast(void*)oldView, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncChangeView");
          }
        }

        _klass.changeView = cast(typeof(_klass.changeView))&_vfuncChangeViewTramp;
        break;
      }
      case "draw":
      {
        static extern(C) void _vfuncDrawTramp(GtkSourceGutterRenderer* renderer, cairo_t* cr, GdkRectangle* backgroundArea, GdkRectangle* cellArea, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.draw)
              return (cast(typeof(&_vfuncDrawTramp))_klass.draw)(renderer, cr, backgroundArea, cellArea, start, end, state);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          auto _start = start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncDraw(_cr, *cast(gid.gdk3.rectangle.Rectangle*)backgroundArea, *cast(gid.gdk3.rectangle.Rectangle*)cellArea, _start, _end, state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncDraw");
          }
          if (_cr)
            _cr._cUnborrow;
          if (_start)
            _start._cUnborrow;
          if (_end)
            _end._cUnborrow;

        }

        _klass.draw = cast(typeof(_klass.draw))&_vfuncDrawTramp;
        break;
      }
      case "end":
      {
        static extern(C) void _vfuncEndTramp(GtkSourceGutterRenderer* renderer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.end)
              return (cast(typeof(&_vfuncEndTramp))_klass.end)(renderer);
            return;
          }

          try
          {
            _obj.vfuncEnd();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncEnd");
          }
        }

        _klass.end = cast(typeof(_klass.end))&_vfuncEndTramp;
        break;
      }
      case "query_activatable":
      {
        static extern(C) gboolean _vfuncQueryActivatableTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queryActivatable)
              return (cast(typeof(&_vfuncQueryActivatableTramp))_klass.queryActivatable)(renderer, iter, area, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;
          auto _event = event ? new gid.gdk3.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQueryActivatable(_iter, *cast(gid.gdk3.rectangle.Rectangle*)area, _event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncQueryActivatable");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;
          if (_event)
            _event._cUnborrow;

          return _retval;
        }

        _klass.queryActivatable = cast(typeof(_klass.queryActivatable))&_vfuncQueryActivatableTramp;
        break;
      }
      case "query_data":
      {
        static extern(C) void _vfuncQueryDataTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* start, GtkTextIter* end, GtkSourceGutterRendererState state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queryData)
              return (cast(typeof(&_vfuncQueryDataTramp))_klass.queryData)(renderer, start, end, state);
            return;
          }

          auto _start = start ? new gid.gtk3.text_iter.TextIter(cast(void*)start, Yes.Take)._cBorrow : null;
          auto _end = end ? new gid.gtk3.text_iter.TextIter(cast(void*)end, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncQueryData(_start, _end, state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncQueryData");
          }
          if (_start)
            _start._cUnborrow;
          if (_end)
            _end._cUnborrow;

        }

        _klass.queryData = cast(typeof(_klass.queryData))&_vfuncQueryDataTramp;
        break;
      }
      case "query_tooltip":
      {
        static extern(C) gboolean _vfuncQueryTooltipTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, int x, int y, GtkTooltip* tooltip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queryTooltip)
              return (cast(typeof(&_vfuncQueryTooltipTramp))_klass.queryTooltip)(renderer, iter, area, x, y, tooltip);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk3.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQueryTooltip(_iter, *cast(gid.gdk3.rectangle.Rectangle*)area, x, y, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tooltip.Tooltip)(cast(void*)tooltip, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncQueryTooltip");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.queryTooltip = cast(typeof(_klass.queryTooltip))&_vfuncQueryTooltipTramp;
        break;
      }
      case "queue_draw":
      {
        static extern(C) void _vfuncQueueDrawTramp(GtkSourceGutterRenderer* renderer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource4.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queueDraw)
              return (cast(typeof(&_vfuncQueueDrawTramp))_klass.queueDraw)(renderer);
            return;
          }

          try
          {
            _obj.vfuncQueueDraw();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.gutter_renderer.GutterRenderer.vfuncQueueDraw");
          }
        }

        _klass.queueDraw = cast(typeof(_klass.queueDraw))&_vfuncQueueDrawTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.gutter_renderer.GutterRenderer]
class GutterRendererGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /**
      Set `alignmentMode` property.
      Params:
        propval = The alignment mode of the renderer. This can be used to indicate
          that in the case a cell spans multiple lines (due to text wrapping)
          the alignment should work on either the full cell, the first line
          or the last line.
      Returns: Builder instance for fluent chaining
  */
  T alignmentMode(gid.gtksource4.types.GutterRendererAlignmentMode propval) nothrow
  {
    return setProperty("alignment-mode", propval);
  }

  /** */
  T backgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    return setProperty("background-rgba", propval);
  }

  /** */
  T backgroundSet(bool propval) nothrow
  {
    return setProperty("background-set", propval);
  }

  /** */
  T size(int propval) nothrow
  {
    return setProperty("size", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = The visibility of the renderer.
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the renderer. Set to 0 for a left
          alignment. 1 for a right alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
      Returns: Builder instance for fluent chaining
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `xpad` property.
      Params:
        propval = The left and right padding of the renderer.
      Returns: Builder instance for fluent chaining
  */
  T xpad(int propval) nothrow
  {
    return setProperty("xpad", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the renderer. Set to 0 for a top
          alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
      Returns: Builder instance for fluent chaining
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }

  /**
      Set `ypad` property.
      Params:
        propval = The top and bottom padding of the renderer.
      Returns: Builder instance for fluent chaining
  */
  T ypad(int propval) nothrow
  {
    return setProperty("ypad", propval);
  }
}

/// Fluent builder for [gid.gtksource4.gutter_renderer.GutterRenderer]
final class GutterRendererGidBuilder : GutterRendererGidBuilderImpl!GutterRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GutterRenderer build() nothrow
  {
    return new GutterRenderer(cast(void*)createGObject(GutterRenderer._getGType), Yes.Take);
  }
}
