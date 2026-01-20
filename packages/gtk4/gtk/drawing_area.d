/// Module for [DrawingArea] class
module gtk.drawing_area;

import cairo.context;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.drawing_area.DrawingArea] is a widget that allows drawing with cairo.
    
    ![An example GtkDrawingArea](drawingarea.png)
    
    It’s essentially a blank widget; you can draw on it. After
    creating a drawing area, the application may want to connect to:
    
    $(LIST
      * The [gtk.widget.Widget.realize] signal to take any necessary actions
        when the widget is instantiated on a particular display.
        (Create GDK resources in response to this signal.)
      
      * The [gtk.drawing_area.DrawingArea.resize] signal to take any necessary
        actions when the widget changes size.
      
      * Call [gtk.drawing_area.DrawingArea.setDrawFunc] to handle redrawing the
        contents of the widget.
    )
      
    The following code portion demonstrates using a drawing
    area to display a circle in the normal widget foreground
    color.
    
    ## Simple GtkDrawingArea usage
    
    ```c
    static void
    draw_function (GtkDrawingArea *area,
                   cairo_t        *cr,
                   int             width,
                   int             height,
                   gpointer        data)
    {
      GdkRGBA color;
    
      cairo_arc (cr,
                 width / 2.0, height / 2.0,
                 MIN (width, height) / 2.0,
                 0, 2 * G_PI);
    
      gtk_widget_get_color (GTK_WIDGET (area),
                            &color);
      gdk_cairo_set_source_rgba (cr, &color);
    
      cairo_fill (cr);
    }
    
    int
    main (int argc, char **argv)
    {
      gtk_init ();
    
      GtkWidget *area = gtk_drawing_area_new ();
      gtk_drawing_area_set_content_width (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_content_height (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_draw_func (GTK_DRAWING_AREA (area),
                                      draw_function,
                                      NULL, NULL);
      return 0;
    }
    ```
    
    The draw function is normally called when a drawing area first comes
    onscreen, or when it’s covered by another window and then uncovered.
    You can also force a redraw by adding to the “damage region” of the
    drawing area’s window using [gtk.widget.Widget.queueDraw].
    This will cause the drawing area to call the draw function again.
    
    The available routines for drawing are documented in the
    [Cairo documentation](https://www.cairographics.org/manual/); GDK
    offers additional API to integrate with Cairo, like `func@Gdk.cairo_set_source_rgba`
    or `func@Gdk.cairo_set_source_pixbuf`.
    
    To receive mouse events on a drawing area, you will need to use
    event controllers. To receive keyboard events, you will need to set
    the “can-focus” property on the drawing area, and you should probably
    draw some user-visible indication that the drawing area is focused.
    
    If you need more complex control over your widget, you should consider
    creating your own [gtk.widget.Widget] subclass.
*/
class DrawingArea : gtk.widget.Widget
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
    return cast(void function())gtk_drawing_area_get_type != &gidSymbolNotFound ? gtk_drawing_area_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawingArea self()
  {
    return this;
  }

  /**
      Get `contentHeight` property.
      Returns: The content height.
  */
  @property int contentHeight()
  {
    return getContentHeight();
  }

  /**
      Set `contentHeight` property.
      Params:
        propval = The content height.
  */
  @property void contentHeight(int propval)
  {
    return setContentHeight(propval);
  }

  /**
      Get `contentWidth` property.
      Returns: The content width.
  */
  @property int contentWidth()
  {
    return getContentWidth();
  }

  /**
      Set `contentWidth` property.
      Params:
        propval = The content width.
  */
  @property void contentWidth(int propval)
  {
    return setContentWidth(propval);
  }

  /**
      Creates a new drawing area.
      Returns: a new [gtk.drawing_area.DrawingArea]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_drawing_area_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the content height of the [gtk.drawing_area.DrawingArea].
      Returns: The height requested for content of the drawing area
  */
  int getContentHeight()
  {
    int _retval;
    _retval = gtk_drawing_area_get_content_height(cast(GtkDrawingArea*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the content width of the [gtk.drawing_area.DrawingArea].
      Returns: The width requested for content of the drawing area
  */
  int getContentWidth()
  {
    int _retval;
    _retval = gtk_drawing_area_get_content_width(cast(GtkDrawingArea*)this._cPtr);
    return _retval;
  }

  /**
      Sets the desired height of the contents of the drawing area.
      
      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual height passed to your draw
      function is larger than the height set here. You can use
      [gtk.widget.Widget.setValign] to avoid that.
      
      If the height is set to 0 (the default), the drawing area may disappear.
  
      Params:
        height = the height of contents
  */
  void setContentHeight(int height)
  {
    gtk_drawing_area_set_content_height(cast(GtkDrawingArea*)this._cPtr, height);
  }

  /**
      Sets the desired width of the contents of the drawing area.
      
      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual width passed to your draw
      function is larger than the width set here. You can use
      [gtk.widget.Widget.setHalign] to avoid that.
      
      If the width is set to 0 (the default), the drawing area may disappear.
  
      Params:
        width = the width of contents
  */
  void setContentWidth(int width)
  {
    gtk_drawing_area_set_content_width(cast(GtkDrawingArea*)this._cPtr, width);
  }

  /**
      Setting a draw function is the main thing you want to do when using
      a drawing area.
      
      The draw function is called whenever GTK needs to draw the contents
      of the drawing area to the screen.
      
      The draw function will be called during the drawing stage of GTK.
      In the drawing stage it is not allowed to change properties of any
      GTK widgets or call any functions that would cause any properties
      to be changed. You should restrict yourself exclusively to drawing
      your contents in the draw function.
      
      If what you are drawing does change, call [gtk.widget.Widget.queueDraw]
      on the drawing area. This will cause a redraw and will call draw_func again.
  
      Params:
        drawFunc = callback that lets you draw
            the drawing area's contents
  */
  void setDrawFunc(gtk.types.DrawingAreaDrawFunc drawFunc = null)
  {
    extern(C) void _drawFuncCallback(GtkDrawingArea* drawingArea, cairo_t* cr, int width, int height, void* userData)
    {
      auto _dlg = cast(gtk.types.DrawingAreaDrawFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.drawing_area.DrawingArea)(cast(void*)drawingArea, No.Take), cr ? new cairo.context.Context(cast(void*)cr, No.Take) : null, width, height);
    }
    auto _drawFuncCB = drawFunc ? &_drawFuncCallback : null;
    auto _drawFunc = drawFunc ? freezeDelegate(cast(void*)&drawFunc) : null;
    GDestroyNotify _drawFuncDestroyCB = drawFunc ? &thawDelegate : null;
    gtk_drawing_area_set_draw_func(cast(GtkDrawingArea*)this._cPtr, _drawFuncCB, _drawFunc, _drawFuncDestroyCB);
  }

  /**
      Connect to `Resize` signal.
  
      Emitted once when the widget is realized, and then each time the widget
        is changed while realized.
        
        This is useful in order to keep state up to date with the widget size,
        like for instance a backing surface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int width, int height, gtk.drawing_area.DrawingArea drawingArea))
  
          `width` the width of the viewport (optional)
  
          `height` the height of the viewport (optional)
  
          `drawingArea` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drawing_area.DrawingArea)))
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
    return connectSignalClosure("resize", closure, after);
  }
}
