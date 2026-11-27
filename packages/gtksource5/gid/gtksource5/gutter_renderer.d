/// Module for [GutterRenderer] class
module gid.gtksource5.gutter_renderer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rectangle;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.snapshot;
import gid.gtk4.text_iter;
import gid.gtk4.text_view;
import gid.gtk4.widget;
import gid.gtksource5.buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.gutter_lines;
import gid.gtksource5.types;
import gid.gtksource5.view;

/**
    Gutter cell renderer.
    
    A [gid.gtksource5.gutter_renderer.GutterRenderer] represents a column in a [gid.gtksource5.gutter.Gutter]. The
    column contains one cell for each visible line of the [gid.gtk4.text_buffer.TextBuffer]. Due to
    text wrapping, a cell can thus span multiple lines of the [gid.gtk4.text_view.TextView]. In
    this case, [gid.gtksource5.types.GutterRendererAlignmentMode] controls the alignment of
    the cell.
    
    The gutter renderer is a [gid.gtk4.widget.Widget] and is measured using the normal widget
    measurement facilities. The width of the gutter will be determined by the
    measurements of the gutter renderers.
    
    The width of a gutter renderer generally takes into account the entire text
    buffer. For instance, to display the line numbers, if the buffer contains 100
    lines, the gutter renderer will always set its width such as three digits can
    be printed, even if only the first 20 lines are shown. Another strategy is to
    take into account only the visible lines.  In this case, only two digits are
    necessary to display the line numbers of the first 20 lines. To take another
    example, the gutter renderer for [gid.gtksource5.mark.Mark]s doesn't need to take
    into account the text buffer to announce its width. It only depends on the
    icons size displayed in the gutter column.
    
    When the available size to render a cell is greater than the required size to
    render the cell contents, the cell contents can be aligned horizontally and
    vertically with [gid.gtksource5.gutter_renderer.GutterRenderer.setAlignmentMode].
    
    The cells rendering occurs using `vfunc@Gtk.Widget.snapshot`. Implementations
    should use `gtk_source_gutter_renderer_get_lines()` to retrieve information
    about the lines to be rendered. To help with aligning content which takes
    into account the padding and alignment of a cell, implementations may call
    [gid.gtksource5.gutter_renderer.GutterRenderer.alignCell] for a given line number with the
    width and height measurement of the content they width to render.
*/
@gidGir("GutterRenderer", "GutterRendererClass")
class GutterRenderer : gid.gtk4.widget.Widget
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
      Get builder for [gid.gtksource5.gutter_renderer.GutterRenderer]
      Returns: New builder object
  */
  static GutterRendererGidBuilder builder() nothrow
  {
    return new GutterRendererGidBuilder;
  }

  /**
      Get `alignmentMode` property.
      Returns: The alignment mode of the renderer.
        
        This can be used to indicate that in the case a cell spans multiple lines (due to text wrapping)
        the alignment should work on either the full cell, the first line or the last line.
  */
  @property gid.gtksource5.types.GutterRendererAlignmentMode alignmentMode() nothrow
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
  @property void alignmentMode(gid.gtksource5.types.GutterRendererAlignmentMode propval) nothrow
  {
    setAlignmentMode(propval);
  }

  /**
      Get `lines` property.
      Returns: Contains information about the lines to be rendered.
        
        It should be used by #GtkSourceGutterRenderer implementations from `vfunc@Gtk.Widget.snapshot`.
  */
  @property gid.gtksource5.gutter_lines.GutterLines lines() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtksource5.gutter_lines.GutterLines)("lines");
  }

  /**
      Get `view` property.
      Returns: The view on which the renderer is placed.
  */
  @property gid.gtk4.text_view.TextView view() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.text_view.TextView)("view");
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the renderer.
        
        Set to 0 for a left alignment. 1 for a right alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float xalign() nothrow
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
  @property void xalign(float propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `xpad` property.
      Returns: The left and right padding of the renderer.
  */
  @property int xpad() nothrow
  {
    return getXpad();
  }

  /**
      Set `xpad` property.
      Params:
        propval = The left and right padding of the renderer.
  */
  @property void xpad(int propval) nothrow
  {
    setXpad(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the renderer.
        
        Set to 0 for a top alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
        A value lower than 0 doesn't modify the alignment.
  */
  @property float yalign() nothrow
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
  @property void yalign(float propval) nothrow
  {
    setYalign(propval);
  }

  /**
      Get `ypad` property.
      Returns: The top and bottom padding of the renderer.
  */
  @property int ypad() nothrow
  {
    return getYpad();
  }

  /**
      Set `ypad` property.
      Params:
        propval = The top and bottom padding of the renderer.
  */
  @property void ypad(int propval) nothrow
  {
    setYpad(propval);
  }

  /**
      Emits the [gid.gtksource5.gutter_renderer.GutterRenderer.activate] signal of the renderer. This is
      called from [gid.gtksource5.gutter.Gutter] and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated (modified in place, changes are seen by the caller)
        area = a #GdkRectangle of the cell area where the renderer is activated
        button = the button that was pressed
        state = a #GdkModifierType
        nPresses = the number of button presses
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivate(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area, uint button, gid.gdk4.types.ModifierType state, int nPresses)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area, button, state, nPresses);
  }

  /** */
  protected void vfuncBegin(gid.gtksource5.gutter_lines.GutterLines lines)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.begin)
      return;

    _klass.begin(cast(GtkSourceGutterRenderer*)this._cPtr, lines ? cast(GtkSourceGutterLines*)lines._cPtr(No.Dup) : null);
  }

  /**
      This is called when the text buffer changes for renderer.
  
      Params:
        oldBuffer = the old #GtkTextBuffer.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChangeBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChangeBuffer(gid.gtksource5.buffer.Buffer oldBuffer = null)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.changeBuffer)
      return;

    _klass.changeBuffer(cast(GtkSourceGutterRenderer*)this._cPtr, oldBuffer ? cast(GtkSourceBuffer*)oldBuffer._cPtr(No.Dup) : null);
  }

  /**
      This is called when the text view changes for renderer.
  
      Params:
        oldView = the old #GtkTextView.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChangeView` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChangeView(gid.gtksource5.view.View oldView = null)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.changeView)
      return;

    _klass.changeView(cast(GtkSourceGutterRenderer*)this._cPtr, oldView ? cast(GtkSourceView*)oldView._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncEnd()
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.end)
      return;

    _klass.end(cast(GtkSourceGutterRenderer*)this._cPtr);
  }

  /**
      Get whether the renderer is activatable at the location provided. This is
      called from [gid.gtksource5.gutter.Gutter] to determine whether a renderer is activatable
      using the mouse pointer.
  
      Params:
        iter = a #GtkTextIter at the start of the line to be activated (modified in place, changes are seen by the caller)
        area = a #GdkRectangle of the cell area to be activated
      Returns: true if the renderer can be activated, false otherwise
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueryActivatable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncQueryActivatable(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queryActivatable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryActivatable(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null, cast(GdkRectangle*)&area);
    return _retval;
  }

  /** */
  protected void vfuncQueryData(gid.gtksource5.gutter_lines.GutterLines lines, uint line)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.queryData)
      return;

    _klass.queryData(cast(GtkSourceGutterRenderer*)this._cPtr, lines ? cast(GtkSourceGutterLines*)lines._cPtr(No.Dup) : null, line);
  }

  /** */
  protected void vfuncSnapshotLine(gid.gtk4.snapshot.Snapshot snapshot, gid.gtksource5.gutter_lines.GutterLines lines, uint line)
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)_vfuncClass;
    if (!_klass.snapshotLine)
      return;

    _klass.snapshotLine(cast(GtkSourceGutterRenderer*)this._cPtr, snapshot ? cast(GtkSnapshot*)snapshot._cPtr(No.Dup) : null, lines ? cast(GtkSourceGutterLines*)lines._cPtr(No.Dup) : null, line);
  }

  alias activate = gid.gtk4.widget.Widget.activate;

  /**
      Emits the [gid.gtksource5.gutter_renderer.GutterRenderer.activate] signal of the renderer. This is
      called from [gid.gtksource5.gutter.Gutter] and should never have to be called manually.
  
      Params:
        iter = a #GtkTextIter at the start of the line where the renderer is activated
        area = a #GdkRectangle of the cell area where the renderer is activated
        button = the button that was pressed
        state = a #GdkModifierType
        nPresses = the number of button presses
  */
  void activate(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area, uint button, gid.gdk4.types.ModifierType state, int nPresses) nothrow
  {
    gtk_source_gutter_renderer_activate(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&area, button, state, nPresses);
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
  void alignCell(uint line, float width, float height, out float x, out float y) nothrow
  {
    gtk_source_gutter_renderer_align_cell(cast(GtkSourceGutterRenderer*)this._cPtr, line, width, height, cast(float*)&x, cast(float*)&y);
  }

  /**
      Get the alignment mode.
      
      The alignment mode describes the manner in which the
      renderer is aligned (see [gid.gtksource5.gutter_renderer.GutterRenderer.xalign] and
      [gid.gtksource5.gutter_renderer.GutterRenderer.yalign]).
      Returns: a #GtkSourceGutterRendererAlignmentMode
  */
  gid.gtksource5.types.GutterRendererAlignmentMode getAlignmentMode() nothrow
  {
    GtkSourceGutterRendererAlignmentMode _cretval;
    _cretval = gtk_source_gutter_renderer_get_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr);
    gid.gtksource5.types.GutterRendererAlignmentMode _retval = cast(gid.gtksource5.types.GutterRendererAlignmentMode)_cretval;
    return _retval;
  }

  /**
      Gets the [gid.gtksource5.buffer.Buffer] for which the gutter renderer is drawing.
      Returns: a #GtkTextBuffer or null
  */
  gid.gtksource5.buffer.Buffer getBuffer() nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_gutter_renderer_get_buffer(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the view associated to the gutter renderer
      Returns: a #GtkSourceView
  */
  gid.gtksource5.view.View getView() nothrow
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(GtkSourceView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `xalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
      Returns: 
  */
  float getXalign() nothrow
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
  int getXpad() nothrow
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
  float getYalign() nothrow
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
  int getYpad() nothrow
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_ypad(cast(GtkSourceGutterRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the renderer is activatable at the location provided. This is
      called from [gid.gtksource5.gutter.Gutter] to determine whether a renderer is activatable
      using the mouse pointer.
  
      Params:
        iter = a #GtkTextIter at the start of the line to be activated
        area = a #GdkRectangle of the cell area to be activated
      Returns: true if the renderer can be activated, false otherwise
  */
  bool queryActivatable(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_gutter_renderer_query_activatable(cast(GtkSourceGutterRenderer*)this._cPtr, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&area);
    return _retval;
  }

  /**
      Set the alignment mode. The alignment mode describes the manner in which the
      renderer is aligned (see [gid.gtksource5.gutter_renderer.GutterRenderer.xalign] and
      [gid.gtksource5.gutter_renderer.GutterRenderer.yalign]).
  
      Params:
        mode = a #GtkSourceGutterRendererAlignmentMode
  */
  void setAlignmentMode(gid.gtksource5.types.GutterRendererAlignmentMode mode) nothrow
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)this._cPtr, mode);
  }

  /**
      Adjusts the `xalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
  
      Params:
        xalign = the Y padding for the drawing cell
  */
  void setXalign(float xalign) nothrow
  {
    gtk_source_gutter_renderer_set_xalign(cast(GtkSourceGutterRenderer*)this._cPtr, xalign);
  }

  /**
      Adjusts the `xpad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
  
      Params:
        xpad = the Y padding for the drawing cell
  */
  void setXpad(int xpad) nothrow
  {
    gtk_source_gutter_renderer_set_xpad(cast(GtkSourceGutterRenderer*)this._cPtr, xpad);
  }

  /**
      Adjusts the `yalign` property.
      
      This may be used to adjust where within the cell rectangle the renderer will draw.
  
      Params:
        yalign = the Y padding for the drawing cell
  */
  void setYalign(float yalign) nothrow
  {
    gtk_source_gutter_renderer_set_yalign(cast(GtkSourceGutterRenderer*)this._cPtr, yalign);
  }

  /**
      Adjusts the `ypad` property.
      
      This may be used to adjust the cell rectangle that the renderer will use to draw.
  
      Params:
        ypad = the Y padding for the drawing cell
  */
  void setYpad(int ypad) nothrow
  {
    gtk_source_gutter_renderer_set_ypad(cast(GtkSourceGutterRenderer*)this._cPtr, ypad);
  }

  /**
      Connect to `Activate` signal.
  
      The signal is emitted when the renderer is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area, uint button, gid.gdk4.types.ModifierType state, int nPresses, gid.gtksource5.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `button` the button that was pressed (optional)
  
          `state` a #GdkModifierType of state (optional)
  
          `nPresses` the number of button presses (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk4.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == uint)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gid.gdk4.types.ModifierType)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] == int)))
  && (Parameters!T.length < 6 || (ParameterStorageClassTuple!T[5] == ParameterStorageClass.none && is(Parameters!T[5] : gid.gtksource5.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 7)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `QueryActivatable` signal.
  
      The signal is emitted when the renderer can possibly be activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.text_iter.TextIter iter, gid.gdk4.rectangle.Rectangle area, gid.gtksource5.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `iter` a #GtkTextIter (optional)
  
          `area` a #GdkRectangle (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryActivatable(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.text_iter.TextIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk4.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.gutter_renderer.GutterRenderer)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.queryActivatable");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-activatable", closure, after);
  }

  /**
      Connect to `QueryData` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gobject2.object.ObjectWrap object, uint p0, gid.gtksource5.gutter_renderer.GutterRenderer gutterRenderer)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gutterRenderer` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gobject2.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtksource5.gutter_renderer.GutterRenderer)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.queryData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-data", closure, after);
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
    static assert(is(T : gid.gtksource5.gutter_renderer.GutterRenderer), T.stringof ~ " is not derived from gid.gtksource5.gutter_renderer.GutterRenderer");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBegin", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "begin");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeBuffer", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "change_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeView", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "change_view");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEnd", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryActivatable", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "query_activatable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryData", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "query_data");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSnapshotLine", true)[0]) == gid.gtksource5.gutter_renderer.GutterRenderer))
      _installVfunc(klass, "snapshot_line");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceGutterRendererClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, uint button, GdkModifierType state, int nPresses) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(renderer, iter, area, button, state, nPresses);
            return;
          }

          auto _iter = iter ? new gid.gtk4.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncActivate(_iter, *cast(gid.gdk4.rectangle.Rectangle*)area, button, state, nPresses);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncActivate");
          }
          if (_iter)
            _iter._cUnborrow;

        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "begin":
      {
        static extern(C) void _vfuncBeginTramp(GtkSourceGutterRenderer* renderer, GtkSourceGutterLines* lines) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.begin)
              return (cast(typeof(&_vfuncBeginTramp))_klass.begin)(renderer, lines);
            return;
          }

          try
          {
            _obj.vfuncBegin(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.gutter_lines.GutterLines)(cast(void*)lines, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncBegin");
          }
        }

        _klass.begin = cast(typeof(_klass.begin))&_vfuncBeginTramp;
        break;
      }
      case "change_buffer":
      {
        static extern(C) void _vfuncChangeBufferTramp(GtkSourceGutterRenderer* renderer, GtkSourceBuffer* oldBuffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.changeBuffer)
              return (cast(typeof(&_vfuncChangeBufferTramp))_klass.changeBuffer)(renderer, oldBuffer);
            return;
          }

          try
          {
            _obj.vfuncChangeBuffer(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(void*)oldBuffer, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncChangeBuffer");
          }
        }

        _klass.changeBuffer = cast(typeof(_klass.changeBuffer))&_vfuncChangeBufferTramp;
        break;
      }
      case "change_view":
      {
        static extern(C) void _vfuncChangeViewTramp(GtkSourceGutterRenderer* renderer, GtkSourceView* oldView) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.changeView)
              return (cast(typeof(&_vfuncChangeViewTramp))_klass.changeView)(renderer, oldView);
            return;
          }

          try
          {
            _obj.vfuncChangeView(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.view.View)(cast(void*)oldView, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncChangeView");
          }
        }

        _klass.changeView = cast(typeof(_klass.changeView))&_vfuncChangeViewTramp;
        break;
      }
      case "end":
      {
        static extern(C) void _vfuncEndTramp(GtkSourceGutterRenderer* renderer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncEnd");
          }
        }

        _klass.end = cast(typeof(_klass.end))&_vfuncEndTramp;
        break;
      }
      case "query_activatable":
      {
        static extern(C) gboolean _vfuncQueryActivatableTramp(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queryActivatable)
              return (cast(typeof(&_vfuncQueryActivatableTramp))_klass.queryActivatable)(renderer, iter, area);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk4.text_iter.TextIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncQueryActivatable(_iter, *cast(gid.gdk4.rectangle.Rectangle*)area);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncQueryActivatable");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.queryActivatable = cast(typeof(_klass.queryActivatable))&_vfuncQueryActivatableTramp;
        break;
      }
      case "query_data":
      {
        static extern(C) void _vfuncQueryDataTramp(GtkSourceGutterRenderer* renderer, GtkSourceGutterLines* lines, uint line) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.queryData)
              return (cast(typeof(&_vfuncQueryDataTramp))_klass.queryData)(renderer, lines, line);
            return;
          }

          try
          {
            _obj.vfuncQueryData(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.gutter_lines.GutterLines)(cast(void*)lines, No.Take), line);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncQueryData");
          }
        }

        _klass.queryData = cast(typeof(_klass.queryData))&_vfuncQueryDataTramp;
        break;
      }
      case "snapshot_line":
      {
        static extern(C) void _vfuncSnapshotLineTramp(GtkSourceGutterRenderer* renderer, GtkSnapshot* snapshot, GtkSourceGutterLines* lines, uint line) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtksource5.gutter_renderer.GutterRenderer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)renderer);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceGutterRendererClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)renderer);
            if (_klass.snapshotLine)
              return (cast(typeof(&_vfuncSnapshotLineTramp))_klass.snapshotLine)(renderer, snapshot, lines, line);
            return;
          }

          try
          {
            _obj.vfuncSnapshotLine(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.gutter_lines.GutterLines)(cast(void*)lines, No.Take), line);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.gutter_renderer.GutterRenderer.vfuncSnapshotLine");
          }
        }

        _klass.snapshotLine = cast(typeof(_klass.snapshotLine))&_vfuncSnapshotLineTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.gutter_renderer.GutterRenderer]
class GutterRendererGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `alignmentMode` property.
      Params:
        propval = The alignment mode of the renderer.
          
          This can be used to indicate that in the case a cell spans multiple lines (due to text wrapping)
          the alignment should work on either the full cell, the first line or the last line.
      Returns: Builder instance for fluent chaining
  */
  T alignmentMode(gid.gtksource5.types.GutterRendererAlignmentMode propval) nothrow
  {
    return setProperty("alignment-mode", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the renderer.
          
          Set to 0 for a left alignment. 1 for a right alignment. And 0.5 for centering the cells.
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
        propval = The vertical alignment of the renderer.
          
          Set to 0 for a top alignment. 1 for a bottom alignment. And 0.5 for centering the cells.
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

/// Fluent builder for [gid.gtksource5.gutter_renderer.GutterRenderer]
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
