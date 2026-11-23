/// Module for [Renderer] class
module gid.gsk4.renderer;

public import gid.core.basictypes;
import gid.cairo1.region;
import gid.core.utils;
import gid.gdk4.display;
import gid.gdk4.surface;
import gid.gdk4.texture;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    Renders a scene graph defined via a tree of [gid.gsk4.render_node.RenderNode] instances.
    
    Typically you will use a [gid.gsk4.renderer.Renderer] instance to repeatedly call
    [gid.gsk4.renderer.Renderer.render] to update the contents of its associated
    [gid.gdk4.surface.Surface].
    
    It is necessary to realize a [gid.gsk4.renderer.Renderer] instance using
    [gid.gsk4.renderer.Renderer.realize] before calling [gid.gsk4.renderer.Renderer.render],
    in order to create the appropriate windowing system resources needed
    to render the scene.
*/
class Renderer : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gsk_renderer_get_type != &gidSymbolNotFound ? gsk_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GskRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Renderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsk4.renderer.Renderer]
      Returns: New builder object
  */
  static RendererGidBuilder builder() nothrow
  {
    return new RendererGidBuilder;
  }

  /**
      Get `realized` property.
      Returns: Whether the renderer has been associated with a surface or draw context.
  */
  @property bool realized() nothrow
  {
    return isRealized();
  }

  /**
      Get `surface` property.
      Returns: The surface associated with renderer.
  */
  @property gid.gdk4.surface.Surface surface() nothrow
  {
    return getSurface();
  }

  /**
      Creates an appropriate [gid.gsk4.renderer.Renderer] instance for the given surface.
      
      If the `GSK_RENDERER` environment variable is set, GSK will
      try that renderer first, before trying the backend-specific
      default. The ultimate fallback is the cairo renderer.
      
      The renderer will be realized before it is returned.
  
      Params:
        surface = a surface
      Returns: the realized renderer
  */
  static gid.gsk4.renderer.Renderer newForSurface(gid.gdk4.surface.Surface surface) nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_renderer_new_for_surface(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gsk4.renderer.Renderer)(cast(GskRenderer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the surface that the renderer is associated with.
      
      If the renderer has not been realized yet, `NULL` will be returned.
      Returns: the surface
  */
  gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gsk_renderer_get_surface(cast(GskRenderer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the renderer is realized or not.
      Returns: true if the renderer was realized, false otherwise
  */
  bool isRealized() nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_renderer_is_realized(cast(GskRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Creates the resources needed by the renderer.
      
      Since GTK 4.6, the surface may be `NULL`, which allows using
      renderers without having to create a surface. Since GTK 4.14,
      it is recommended to use [gid.gsk4.renderer.Renderer.realizeForDisplay]
      for this case.
      
      Note that it is mandatory to call [gid.gsk4.renderer.Renderer.unrealize]
      before destroying the renderer.
  
      Params:
        surface = the surface that renderer will be used on
      Returns: whether the renderer was successfully realized
      Throws: [ErrorWrap]
  */
  bool realize(gid.gdk4.surface.Surface surface = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gsk_renderer_realize(cast(GskRenderer*)this._cPtr, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Creates the resources needed by the renderer.
      
      Note that it is mandatory to call [gid.gsk4.renderer.Renderer.unrealize]
      before destroying the renderer.
  
      Params:
        display = the display that the renderer will be used on
      Returns: whether the renderer was successfully realized
      Throws: [ErrorWrap]
  */
  bool realizeForDisplay(gid.gdk4.display.Display display)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gsk_renderer_realize_for_display(cast(GskRenderer*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Renders the scene graph, described by a tree of [gid.gsk4.render_node.RenderNode] instances
      to the renderer's surface, ensuring that the given region gets redrawn.
      
      If the renderer has no associated surface, this function does nothing.
      
      Renderers must ensure that changes of the contents given by the root
      node as well as the area given by region are redrawn. They are however
      free to not redraw any pixel outside of region if they can guarantee that
      it didn't change.
      
      The renderer will acquire a reference on the [gid.gsk4.render_node.RenderNode] tree while
      the rendering is in progress.
  
      Params:
        root = the render node to render
        region = the [gid.cairo1.region.Region] that must be redrawn or `NULL`
            for the whole surface
  */
  void render(gid.gsk4.render_node.RenderNode root, gid.cairo1.region.Region region = null) nothrow
  {
    gsk_renderer_render(cast(GskRenderer*)this._cPtr, root ? cast(GskRenderNode*)root._cPtr(No.Dup) : null, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Renders a scene graph, described by a tree of [gid.gsk4.render_node.RenderNode] instances,
      to a texture.
      
      The renderer will acquire a reference on the [gid.gsk4.render_node.RenderNode] tree while
      the rendering is in progress.
      
      If you want to apply any transformations to root, you should put it into a
      transform node and pass that node instead.
  
      Params:
        root = the render node to render
        viewport = the section to draw or `NULL` to use root's bounds
      Returns: a texture with the rendered contents of root
  */
  gid.gdk4.texture.Texture renderTexture(gid.gsk4.render_node.RenderNode root, gid.graphene1.rect.Rect viewport = null) nothrow
  {
    GdkTexture* _cretval;
    _cretval = gsk_renderer_render_texture(cast(GskRenderer*)this._cPtr, root ? cast(GskRenderNode*)root._cPtr(No.Dup) : null, viewport ? cast(const(graphene_rect_t)*)viewport._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Releases all the resources created by [gid.gsk4.renderer.Renderer.realize].
  */
  void unrealize() nothrow
  {
    gsk_renderer_unrealize(cast(GskRenderer*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gsk4.renderer.Renderer]
class RendererGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsk4.renderer.Renderer]
final class RendererGidBuilder : RendererGidBuilderImpl!RendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Renderer build() nothrow
  {
    return new Renderer(cast(void*)createGObject(Renderer._getGType), Yes.Take);
  }
}
