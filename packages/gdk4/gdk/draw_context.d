/// Module for [DrawContext] class
module gdk.draw_context;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.object;

/**
    Base class for objects implementing different rendering methods.
    
    [gdk.draw_context.DrawContext] is the base object used by contexts implementing different
    rendering methods, such as [gdk.cairo_context.CairoContext] or [gdk.glcontext.GLContext].
    It provides shared functionality between those contexts.
    
    You will always interact with one of those subclasses.
    
    A [gdk.draw_context.DrawContext] is always associated with a single toplevel surface.
*/
class DrawContext : gobject.object.ObjectWrap
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
    return cast(void function())gdk_draw_context_get_type != &gidSymbolNotFound ? gdk_draw_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawContext self()
  {
    return this;
  }

  /**
      Indicates that you are beginning the process of redrawing region
      on the context's surface.
      
      Calling this function begins a drawing operation using context on the
      surface that context was created from. The actual requirements and
      guarantees for the drawing operation vary for different implementations
      of drawing, so a [gdk.cairo_context.CairoContext] and a [gdk.glcontext.GLContext]
      need to be treated differently.
      
      A call to this function is a requirement for drawing and must be
      followed by a call to [gdk.draw_context.DrawContext.endFrame], which will
      complete the drawing operation and ensure the contents become visible
      on screen.
      
      Note that the region passed to this function is the minimum region that
      needs to be drawn and depending on implementation, windowing system and
      hardware in use, it might be necessary to draw a larger region. Drawing
      implementation must use [gdk.draw_context.DrawContext.getFrameRegion] to
      query the region that must be drawn.
      
      When using GTK, the widget system automatically places calls to
      [gdk.draw_context.DrawContext.beginFrame] and [gdk.draw_context.DrawContext.endFrame] via the
      use of [GskRenderer](../gsk4/class.Renderer.html)s, so application code
      does not need to call these functions explicitly.
  
      Params:
        region = minimum region that should be drawn
  */
  void beginFrame(cairo.region.Region region)
  {
    gdk_draw_context_begin_frame(cast(GdkDrawContext*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Ends a drawing operation started with [gdk.draw_context.DrawContext.beginFrame].
      
      This makes the drawing available on screen.
      See [gdk.draw_context.DrawContext.beginFrame] for more details about drawing.
      
      When using a [gdk.glcontext.GLContext], this function may call `glFlush()`
      implicitly before returning; it is not recommended to call `glFlush()`
      explicitly before calling this function.
  */
  void endFrame()
  {
    gdk_draw_context_end_frame(cast(GdkDrawContext*)this._cPtr);
  }

  /**
      Retrieves the [gdk.display.Display] the context is created for
      Returns: the [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_draw_context_get_display(cast(GdkDrawContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the region that is currently being repainted.
      
      After a call to [gdk.draw_context.DrawContext.beginFrame] this function will
      return a union of the region passed to that function and the area of the
      surface that the context determined needs to be repainted.
      
      If context is not in between calls to [gdk.draw_context.DrawContext.beginFrame]
      and [gdk.draw_context.DrawContext.endFrame], null will be returned.
      Returns: a Cairo region
  */
  cairo.region.Region getFrameRegion()
  {
    const(cairo_region_t)* _cretval;
    _cretval = gdk_draw_context_get_frame_region(cast(GdkDrawContext*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the surface that context is bound to.
      Returns: a [gdk.surface.Surface]
  */
  gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_draw_context_get_surface(cast(GdkDrawContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if context is in the process of drawing to its surface.
      
      This is the case between calls to [gdk.draw_context.DrawContext.beginFrame]
      and [gdk.draw_context.DrawContext.endFrame]. In this situation, drawing commands
      may be effecting the contents of the context's surface.
      Returns: true if the context is between [gdk.draw_context.DrawContext.beginFrame]
          and [gdk.draw_context.DrawContext.endFrame] calls.
  */
  bool isInFrame()
  {
    bool _retval;
    _retval = cast(bool)gdk_draw_context_is_in_frame(cast(GdkDrawContext*)this._cPtr);
    return _retval;
  }
}
