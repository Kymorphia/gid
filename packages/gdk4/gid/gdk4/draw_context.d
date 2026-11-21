/// Module for [DrawContext] class
module gid.gdk4.draw_context;

public import gid.core.basictypes;
import gid.cairo1.region;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.display;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base class for objects implementing different rendering methods.
    
    [gid.gdk4.draw_context.DrawContext] is the base object used by contexts implementing different
    rendering methods, such as [gid.gdk4.cairo_context.CairoContext] or [gid.gdk4.glcontext.GLContext].
    It provides shared functionality between those contexts.
    
    You will always interact with one of those subclasses.
    
    A [gid.gdk4.draw_context.DrawContext] is always associated with a single toplevel surface.
*/
class DrawContext : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_draw_context_get_type != &gidSymbolNotFound ? gdk_draw_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDrawContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.draw_context.DrawContext]
      Returns: New builder object
  */
  static DrawContextGidBuilder builder() nothrow
  {
    return new DrawContextGidBuilder;
  }

  /**
      Get `display` property.
      Returns: The [gid.gdk4.display.Display] used to create the [gid.gdk4.draw_context.DrawContext].
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `surface` property.
      Returns: The [gid.gdk4.surface.Surface] the context is bound to.
  */
  @property gid.gdk4.surface.Surface surface() nothrow
  {
    return getSurface();
  }

  /**
      Indicates that you are beginning the process of redrawing region
      on the context's surface.
      
      Calling this function begins a drawing operation using context on the
      surface that context was created from. The actual requirements and
      guarantees for the drawing operation vary for different implementations
      of drawing, so a [gid.gdk4.cairo_context.CairoContext] and a [gid.gdk4.glcontext.GLContext]
      need to be treated differently.
      
      A call to this function is a requirement for drawing and must be
      followed by a call to [gid.gdk4.draw_context.DrawContext.endFrame], which will
      complete the drawing operation and ensure the contents become visible
      on screen.
      
      Note that the region passed to this function is the minimum region that
      needs to be drawn and depending on implementation, windowing system and
      hardware in use, it might be necessary to draw a larger region. Drawing
      implementation must use [gid.gdk4.draw_context.DrawContext.getFrameRegion] to
      query the region that must be drawn.
      
      When using GTK, the widget system automatically places calls to
      [gid.gdk4.draw_context.DrawContext.beginFrame] and [gid.gdk4.draw_context.DrawContext.endFrame] via the
      use of [GskRenderer](../gsk4/class.Renderer.html)s, so application code
      does not need to call these functions explicitly.
  
      Params:
        region = minimum region that should be drawn
  
      Deprecated: Drawing directly to the surface is no longer recommended.
          Use [gid.gsk4.render_node.RenderNode] and [gid.gsk4.renderer.Renderer].
  */
  void beginFrame(gid.cairo1.region.Region region) nothrow
  {
    gdk_draw_context_begin_frame(cast(GdkDrawContext*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Ends a drawing operation started with [gid.gdk4.draw_context.DrawContext.beginFrame].
      
      This makes the drawing available on screen.
      See [gid.gdk4.draw_context.DrawContext.beginFrame] for more details about drawing.
      
      When using a [gid.gdk4.glcontext.GLContext], this function may call `glFlush()`
      implicitly before returning; it is not recommended to call `glFlush()`
      explicitly before calling this function.
  
      Deprecated: Drawing directly to the surface is no longer recommended.
          Use [gid.gsk4.render_node.RenderNode] and [gid.gsk4.renderer.Renderer].
  */
  void endFrame() nothrow
  {
    gdk_draw_context_end_frame(cast(GdkDrawContext*)this._cPtr);
  }

  /**
      Retrieves the [gid.gdk4.display.Display] the context is created for
      Returns: the [gid.gdk4.display.Display]
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_draw_context_get_display(cast(GdkDrawContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the region that is currently being repainted.
      
      After a call to [gid.gdk4.draw_context.DrawContext.beginFrame] this function will
      return a union of the region passed to that function and the area of the
      surface that the context determined needs to be repainted.
      
      If context is not in between calls to [gid.gdk4.draw_context.DrawContext.beginFrame]
      and [gid.gdk4.draw_context.DrawContext.endFrame], null will be returned.
      Returns: a Cairo region
  
      Deprecated: Drawing directly to the surface is no longer recommended.
          Use [gid.gsk4.render_node.RenderNode] and [gid.gsk4.renderer.Renderer].
  */
  gid.cairo1.region.Region getFrameRegion() nothrow
  {
    const(cairo_region_t)* _cretval;
    _cretval = gdk_draw_context_get_frame_region(cast(GdkDrawContext*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.region.Region(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the surface that context is bound to.
      Returns: a [gid.gdk4.surface.Surface]
  */
  gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_draw_context_get_surface(cast(GdkDrawContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if context is in the process of drawing to its surface.
      
      This is the case between calls to [gid.gdk4.draw_context.DrawContext.beginFrame]
      and [gid.gdk4.draw_context.DrawContext.endFrame]. In this situation, drawing commands
      may be effecting the contents of the context's surface.
      Returns: true if the context is between [gid.gdk4.draw_context.DrawContext.beginFrame]
          and [gid.gdk4.draw_context.DrawContext.endFrame] calls.
  
      Deprecated: Drawing directly to the surface is no longer recommended.
          Use [gid.gsk4.render_node.RenderNode] and [gid.gsk4.renderer.Renderer].
  */
  bool isInFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_draw_context_is_in_frame(cast(GdkDrawContext*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.draw_context.DrawContext]
class DrawContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `display` property.
      Params:
        propval = The [gid.gdk4.display.Display] used to create the [gid.gdk4.draw_context.DrawContext].
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }

  /**
      Set `surface` property.
      Params:
        propval = The [gid.gdk4.surface.Surface] the context is bound to.
      Returns: Builder instance for fluent chaining
  */
  T surface(gid.gdk4.surface.Surface propval) nothrow
  {
    return setProperty("surface", propval);
  }
}

/// Fluent builder for [gid.gdk4.draw_context.DrawContext]
final class DrawContextGidBuilder : DrawContextGidBuilderImpl!DrawContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DrawContext build() nothrow
  {
    return new DrawContext(cast(void*)createGObject(DrawContext._getGType), Yes.Take);
  }
}
