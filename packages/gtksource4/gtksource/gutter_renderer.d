/// Module for [GutterRenderer] class
module gtksource.gutter_renderer;

import cairo.context;
import gdk.event;
import gdk.rectangle;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gtk.text_iter;
import gtk.text_view;
import gtk.tooltip;
import gtk.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class GutterRenderer : gobject.initially_unowned.InitiallyUnowned
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
    return cast(void function())gtk_source_gutter_renderer_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRenderer self()
  {
    return this;
  }

  /**
      Get `alignmentMode` property.
      Returns: The alignment mode of the renderer. This can be used to indicate
        that in the case a cell spans multiple lines (due to text wrapping)
        the alignment should work on either the full cell, the first line
        or the last line.
  */
  @property gtksource.types.GutterRendererAlignmentMode alignmentMode()
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
  @property void alignmentMode(gtksource.types.GutterRendererAlignmentMode propval)
  {
    return setAlignmentMode(propval);
  }

  /** */
  @property gdk.rgba.RGBA backgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /** */
  @property void backgroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /** */
  @property int size()
  {
    return getSize();
  }

  /** */
  @property void size(int propval)
  {
    return setSize(propval);
  }

  /**
      Get `view` property.
      Returns: The view on which the renderer is placed.
  */
  @property gtk.text_view.TextView view()
  {
    return getView();
  }

  /**
      Get `visible` property.
      Returns: The visibility of the renderer.
  */
  @property bool visible()
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = The visibility of the renderer.
  */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /**
      Get `windowType` property.
      Returns: The window type of the view on which the renderer is placed (left,
        or right).
  */
  @property gtk.types.TextWindowType windowType()
  {
    return getWindowType();
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the renderer. Set to 0 for a left
        alignment. 1 for a right alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float xalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the renderer. Set to 0 for a left
          alignment. 1 for a right alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void xalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `xpad` property.
      Returns: The left and right padding of the renderer.
  */
  @property int xpad()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("xpad");
  }

  /**
      Set `xpad` property.
      Params:
        propval = The left and right padding of the renderer.
  */
  @property void xpad(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("xpad", propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the renderer. Set to 0 for a top
        alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float yalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the renderer. Set to 0 for a top
          alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void yalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  /**
      Get `ypad` property.
      Returns: The top and bottom padding of the renderer.
  */
  @property int ypad()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("ypad");
  }

  /**
      Set `ypad` property.
      Params:
        propval = The top and bottom padding of the renderer.
  */
  @property void ypad(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("ypad", propval);
  }

  /**
      Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
      called from #GtkSourceGutter and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated
        area = a #GdkRectangle of the cell area where the renderer is activated
        event = the event that triggered the activation
  */
  void activate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event)
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
  void begin(cairo.context.Context cr, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
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
  void draw(cairo.context.Context cr, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state)
  {
    gtk_source_gutter_renderer_draw(cast(GtkSourceGutterRenderer*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&backgroundArea, cast(GdkRectangle*)&cellArea, start ? cast(GtkTextIter*)start._cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end._cPtr(No.Dup) : null, state);
  }

  /**
      Called when drawing a region of lines has ended.
  */
  void end()
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
  void getAlignment(out float xalign, out float yalign)
  {
    gtk_source_gutter_renderer_get_alignment(cast(GtkSourceGutterRenderer*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Get the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see :xalign and :yalign).
      Returns: a #GtkSourceGutterRendererAlignmentMode
  */
  gtksource.types.GutterRendererAlignmentMode getAlignmentMode()
  {
    GtkSourceGutterRendererAlignmentMode _cretval;
    _cretval = gtk_source_gutter_renderer_get_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr);
    gtksource.types.GutterRendererAlignmentMode _retval = cast(gtksource.types.GutterRendererAlignmentMode)_cretval;
    return _retval;
  }

  /**
      Get the background color of the renderer.
  
      Params:
        color = return value for a #GdkRGBA
      Returns: true if the background color is set, false otherwise
  */
  bool getBackground(out gdk.rgba.RGBA color)
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
  void getPadding(out int xpad, out int ypad)
  {
    gtk_source_gutter_renderer_get_padding(cast(GtkSourceGutterRenderer*)this._cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Get the size of the renderer.
      Returns: the size of the renderer.
  */
  int getSize()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_size(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get the view associated to the gutter renderer
      Returns: a #GtkTextView
  */
  gtk.text_view.TextView getView()
  {
    GtkTextView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_view.TextView)(cast(GtkTextView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether the gutter renderer is visible.
      Returns: true if the renderer is visible, false otherwise
  */
  bool getVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_get_visible(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GtkTextWindowType associated with the gutter renderer.
      Returns: a #GtkTextWindowType
  */
  gtk.types.TextWindowType getWindowType()
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_source_gutter_renderer_get_window_type(cast(GtkSourceGutterRenderer*)this._cPtr);
    gtk.types.TextWindowType _retval = cast(gtk.types.TextWindowType)_cretval;
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
  bool queryActivatable(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event)
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
  void queryData(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state)
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
  bool queryTooltip(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, int x, int y, gtk.tooltip.Tooltip tooltip)
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
  void queueDraw()
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
  void setAlignment(float xalign, float yalign)
  {
    gtk_source_gutter_renderer_set_alignment(cast(GtkSourceGutterRenderer*)this._cPtr, xalign, yalign);
  }

  /**
      Set the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see :xalign and :yalign).
  
      Params:
        mode = a #GtkSourceGutterRendererAlignmentMode
  */
  void setAlignmentMode(gtksource.types.GutterRendererAlignmentMode mode)
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr, mode);
  }

  /**
      Set the background color of the renderer. If color is set to null, the
      renderer will not have a background color.
  
      Params:
        color = a #GdkRGBA or null
  */
  void setBackground(gdk.rgba.RGBA color)
  {
    gtk_source_gutter_renderer_set_background(cast(GtkSourceGutterRenderer*)this._cPtr, cast(const(GdkRGBA)*)&color);
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
  void setPadding(int xpad, int ypad)
  {
    gtk_source_gutter_renderer_set_padding(cast(GtkSourceGutterRenderer*)this._cPtr, xpad, ypad);
  }

  /**
      Sets the size of the renderer. A value of -1 specifies that the size
      is to be determined dynamically.
  
      Params:
        size = the size
  */
  void setSize(int size)
  {
    gtk_source_gutter_renderer_set_size(cast(GtkSourceGutterRenderer*)this._cPtr, size);
  }

  /**
      Set whether the gutter renderer is visible.
  
      Params:
        visible = the visibility
  */
  void setVisible(bool visible)
  {
    gtk_source_gutter_renderer_set_visible(cast(GtkSourceGutterRenderer*)this._cPtr, visible);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal is emitted when the renderer is
        activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `event` the event that caused the activation (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.event.Event)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtksource.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `event` the #GdkEvent that is causing the activatable query (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryActivatable(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.event.Event)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtksource.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `start` a #GtkTextIter (optional)
  
          `end` a #GtkTextIter (optional)
  
          `state` the renderer state (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtksource.types.GutterRendererState)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtksource.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, int x, int y, gtk.tooltip.Tooltip tooltip, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
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
  ulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == int)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.tooltip.Tooltip)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gtksource.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
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
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[5]);

      static if (Parameters!T.length > 5)
        _paramTuple[5] = getVal!(Parameters!T[5])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `QueueDraw` signal.
  
      The ::queue-draw signal is emitted when the renderer needs
        to be redrawn. Use [gtksource.gutter_renderer.GutterRenderer.queueDraw]
        to emit this signal from an implementation of the
        #GtkSourceGutterRenderer interface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueueDraw(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("queue-draw", closure, after);
  }
}
