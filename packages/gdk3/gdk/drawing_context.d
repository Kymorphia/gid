/// Module for [DrawingContext] class
module gdk.drawing_context;

import cairo.context;
import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    #GdkDrawingContext is an object that represents the current drawing
    state of a #GdkWindow.
    
    It's possible to use a #GdkDrawingContext to draw on a #GdkWindow
    via rendering API like Cairo or OpenGL.
    
    A #GdkDrawingContext can only be created by calling [gdk.window.Window.beginDrawFrame]
    and will be valid until a call to [gdk.window.Window.endDrawFrame].
    
    #GdkDrawingContext is available since GDK 3.22
*/
class DrawingContext : gobject.object.ObjectWrap
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
    return cast(void function())gdk_drawing_context_get_type != &gidSymbolNotFound ? gdk_drawing_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawingContext self()
  {
    return this;
  }

  /**
      Retrieves a Cairo context to be used to draw on the #GdkWindow
      that created the #GdkDrawingContext.
      
      The returned context is guaranteed to be valid as long as the
      #GdkDrawingContext is valid, that is between a call to
      [gdk.window.Window.beginDrawFrame] and [gdk.window.Window.endDrawFrame].
      Returns: a Cairo context to be used to draw
          the contents of the #GdkWindow. The context is owned by the
          #GdkDrawingContext and should not be destroyed
  */
  cairo.context.Context getCairoContext()
  {
    cairo_t* _cretval;
    _cretval = gdk_drawing_context_get_cairo_context(cast(GdkDrawingContext*)this._cPtr);
    auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves a copy of the clip region used when creating the context.
      Returns: a Cairo region
  */
  cairo.region.Region getClip()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_drawing_context_get_clip(cast(GdkDrawingContext*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the window that created the drawing context.
      Returns: a #GdkWindow
  */
  gdk.window.Window getWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drawing_context_get_window(cast(GdkDrawingContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the given #GdkDrawingContext is valid.
      Returns: true if the context is valid
  */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)gdk_drawing_context_is_valid(cast(GdkDrawingContext*)this._cPtr);
    return _retval;
  }
}
