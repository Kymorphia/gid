/// Module for [GutterRenderer] class
module gtksource.gutter_renderer;

import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.text_iter;
import gtk.text_view;
import gtk.widget;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_lines;
import gtksource.types;
import gtksource.view;

/**
    Gutter cell renderer.
    
    A [gtksource.gutter_renderer.GutterRenderer] represents a column in a `class@Gutter`. The
    column contains one cell for each visible line of the [gtk.text_buffer.TextBuffer]. Due to
    text wrapping, a cell can thus span multiple lines of the [gtk.text_view.TextView]. In
    this case, `enum@GutterRendererAlignmentMode` controls the alignment of
    the cell.
    
    The gutter renderer is a [gtk.widget.Widget] and is measured using the normal widget
    measurement facilities. The width of the gutter will be determined by the
    measurements of the gutter renderers.
    
    The width of a gutter renderer generally takes into account the entire text
    buffer. For instance, to display the line numbers, if the buffer contains 100
    lines, the gutter renderer will always set its width such as three digits can
    be printed, even if only the first 20 lines are shown. Another strategy is to
    take into account only the visible lines.  In this case, only two digits are
    necessary to display the line numbers of the first 20 lines. To take another
    example, the gutter renderer for `class@Mark`s doesn't need to take
    into account the text buffer to announce its width. It only depends on the
    icons size displayed in the gutter column.
    
    When the available size to render a cell is greater than the required size to
    render the cell contents, the cell contents can be aligned horizontally and
    vertically with [gtksource.gutter_renderer.GutterRenderer.setAlignmentMode].
    
    The cells rendering occurs using `vfunc@Gtk.Widget.snapshot`. Implementations
    should use `gtk_source_gutter_renderer_get_lines()` to retrieve information
    about the lines to be rendered. To help with aligning content which takes
    into account the padding and alignment of a cell, implementations may call
    [gtksource.gutter_renderer.GutterRenderer.alignCell] for a given line number with the
    width and height measurement of the content they width to render.
*/
class GutterRenderer : gtk.widget.Widget
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
      Returns: The alignment mode of the renderer.
        
        This can be used to indicate that in the case a cell spans multiple lines (due to text wrapping)
        the alignment should work on either the full cell, the first line or the last line.
  */
  @property gtksource.types.GutterRendererAlignmentMode alignmentMode()
  {
    return getAlignmentMode();
  }

  /**
      Set `alignmentMode` property.
      Params:
        propval = The alignment mode of the renderer.
          
          This can be used to indicate that in the case a cell spans multiple lines (due to text wrapping)
          the alignment should work on either the full cell, the first line or the last line.
  */
  @property void alignmentMode(gtksource.types.GutterRendererAlignmentMode propval)
  {
    return setAlignmentMode(propval);
  }

  /**
      Get `lines` property.
      Returns: Contains information about the lines to be rendered.
        
        It should be used by #GtkSourceGutterRenderer implementations from `vfunc@Gtk.Widget.snapshot`.
  */
  @property gtksource.gutter_lines.GutterLines lines()
  {
    return gobject.object.ObjectWrap.getProperty!(gtksource.gutter_lines.GutterLines)("lines");
  }

  /**
      Get `view` property.
      Returns: The view on which the renderer is placed.
  */
  @property gtk.text_view.TextView view()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.text_view.TextView)("view");
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the renderer.
        
        Set to 0 for a left alignment. 1 for a right alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float xalign()
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the renderer.
          
          Set to 0 for a left alignment. 1 for a right alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void xalign(float propval)
  {
    return setXalign(propval);
  }

  /**
      Get `xpad` property.
      Returns: The left and right padding of the renderer.
  */
  @property int xpad()
  {
    return getXpad();
  }

  /**
      Set `xpad` property.
      Params:
        propval = The left and right padding of the renderer.
  */
  @property void xpad(int propval)
  {
    return setXpad(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the renderer.
        
        Set to 0 for a top alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float yalign()
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the renderer.
          
          Set to 0 for a top alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
          A value lower than 0 doesn't modify the alignment.
  */
  @property void yalign(float propval)
  {
    return setYalign(propval);
  }

  /**
      Get `ypad` property.
      Returns: The top and bottom padding of the renderer.
  */
  @property int ypad()
  {
    return getYpad();
  }

  /**
      Set `ypad` property.
      Params:
        propval = The top and bottom padding of the renderer.
  */
  @property void ypad(int propval)
  {
    return setYpad(propval);
  }

  alias activate = gtk.widget.Widget.activate;

  /**
      Emits the `signalGutterRenderer::activate` signal of the renderer. This is
      called from `classGutter` and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated
        area = a #GdkRectangle of the cell area where the renderer is activated
        button = the button that was pressed
        state = a #GdkModifierType
        nPresses = the number of button presses
  */
  void activate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, uint button, gdk.types.ModifierType state, int nPresses)
  {
    gtk_source_gutter_renderer_activate(cast(GtkSourceGutterRenderer*)this._cPtr, cast(const(GtkTextIter)*)&iter, cast(const(GdkRectangle)*)&area, button, state, nPresses);
  }

  /**
      Locates where to render content that is width x height based on
      the renderers alignment and padding.
      
      The location will be placed into `x` and `y` and is relative to the
      renderer's coordinates.
      
      It is encouraged that renderers use this function when snappshotting
      to ensure consistent placement of their contents.
  
      Params:
        line = the line number for content
        width = the width of the content to draw
        height = the height of the content to draw
        x = the X position to render the content
        y = the Y position to render the content
  */
  void alignCell(uint line, float width, float height, out float x, out float y)
  {
    gtk_source_gutter_renderer_align_cell(cast(GtkSourceGutterRenderer*)this._cPtr, line, width, height, cast(float*)&x, cast(float*)&y);
  }

  /**
      Get the alignment mode.
      
      The alignment mode describes the manner in which the
      renderer is aligned (see `propertyGutterRenderer:xalign` and
      `propertyGutterRenderer:yalign`).
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
      Gets the `classBuffer` for which the gutter renderer is drawing.
      Returns: a #GtkTextBuffer or null
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_gutter_renderer_get_buffer(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the view associated to the gutter renderer
      Returns: a #GtkSourceView
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `xalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
      Returns: 
  */
  float getXalign()
  {
    float _retval;
    _retval = gtk_source_gutter_renderer_get_xalign(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `xpad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
      Returns: 
  */
  int getXpad()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_xpad(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `yalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
      Returns: 
  */
  float getYalign()
  {
    float _retval;
    _retval = gtk_source_gutter_renderer_get_yalign(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `ypad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
      Returns: 
  */
  int getYpad()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_ypad(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the renderer is activatable at the location provided. This is
      called from `classGutter` to determine whether a renderer is activatable
      using the mouse pointer.
  
      Params:
        iter = a #GtkTextIter at the start of the line to be activated
        area = a #GdkRectangle of the cell area to be activated
      Returns: true if the renderer can be activated, false otherwise
  */
  bool queryActivatable(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_query_activatable(cast(GtkSourceGutterRenderer*)this._cPtr, cast(const(GtkTextIter)*)&iter, cast(const(GdkRectangle)*)&area);
    return _retval;
  }

  /**
      Set the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see `propertyGutterRenderer:xalign` and
      `propertyGutterRenderer:yalign`).
  
      Params:
        mode = a #GtkSourceGutterRendererAlignmentMode
  */
  void setAlignmentMode(gtksource.types.GutterRendererAlignmentMode mode)
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr, mode);
  }

  /**
      Adjusts the `xalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
  
      Params:
        xalign = the Y padding for the drawing cell
  */
  void setXalign(float xalign)
  {
    gtk_source_gutter_renderer_set_xalign(cast(GtkSourceGutterRenderer*)this._cPtr, xalign);
  }

  /**
      Adjusts the `xpad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
  
      Params:
        xpad = the Y padding for the drawing cell
  */
  void setXpad(int xpad)
  {
    gtk_source_gutter_renderer_set_xpad(cast(GtkSourceGutterRenderer*)this._cPtr, xpad);
  }

  /**
      Adjusts the `yalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
  
      Params:
        yalign = the Y padding for the drawing cell
  */
  void setYalign(float yalign)
  {
    gtk_source_gutter_renderer_set_yalign(cast(GtkSourceGutterRenderer*)this._cPtr, yalign);
  }

  /**
      Adjusts the `ypad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
  
      Params:
        ypad = the Y padding for the drawing cell
  */
  void setYpad(int ypad)
  {
    gtk_source_gutter_renderer_set_ypad(cast(GtkSourceGutterRenderer*)this._cPtr, ypad);
  }

  /**
      Connect to `Activate` signal.
  
      The signal is emitted when the renderer is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, uint button, gdk.types.ModifierType state, int nPresses, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `button` the button that was pressed (optional)
  
          `state` a #GdkModifierType of state (optional)
  
          `nPresses` the number of button presses (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gdk.types.ModifierType)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == int)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `QueryActivatable` signal.
  
      The signal is emitted when the renderer can possibly be activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.gutter_renderer.GutterRenderer)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-activatable", closure, after);
  }

  /**
      Connect to `QueryData` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, uint p0, gtksource.gutter_renderer.GutterRenderer gutterRenderer))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtksource.gutter_renderer.GutterRenderer)))
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
    return connectSignalClosure("query-data", closure, after);
  }
}
