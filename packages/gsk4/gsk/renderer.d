/// Module for [Renderer] class
module gsk.renderer;

import cairo.region;
import gdk.display;
import gdk.surface;
import gdk.texture;
import gid.gid;
import glib.error;
import gobject.object;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    [gsk.renderer.Renderer] is a class that renders a scene graph defined via a
    tree of [gsk.render_node.RenderNode] instances.
    
    Typically you will use a [gsk.renderer.Renderer] instance to repeatedly call
    [gsk.renderer.Renderer.render] to update the contents of its associated
    [gdk.surface.Surface].
    
    It is necessary to realize a [gsk.renderer.Renderer] instance using
    [gsk.renderer.Renderer.realize] before calling [gsk.renderer.Renderer.render],
    in order to create the appropriate windowing system resources needed
    to render the scene.
*/
class Renderer : gobject.object.ObjectWrap
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
    return cast(void function())gsk_renderer_get_type != &gidSymbolNotFound ? gsk_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Renderer self()
  {
    return this;
  }

  /**
      Get `realized` property.
      Returns: Whether the renderer has been associated with a surface or draw context.
  */
  @property bool realized()
  {
    return isRealized();
  }

  /**
      Get `surface` property.
      Returns: The surface associated with renderer.
  */
  @property gdk.surface.Surface surface()
  {
    return getSurface();
  }

  /**
      Creates an appropriate [gsk.renderer.Renderer] instance for the given surface.
      
      If the `GSK_RENDERER` environment variable is set, GSK will
      try that renderer first, before trying the backend-specific
      default. The ultimate fallback is the cairo renderer.
      
      The renderer will be realized before it is returned.
  
      Params:
        surface = a [gdk.surface.Surface]
      Returns: a [gsk.renderer.Renderer]
  */
  static gsk.renderer.Renderer newForSurface(gdk.surface.Surface surface)
  {
    GskRenderer* _cretval;
    _cretval = gsk_renderer_new_for_surface(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gsk.renderer.Renderer)(cast(GskRenderer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the [gdk.surface.Surface] set using gsk_enderer_realize().
      
      If the renderer has not been realized yet, null will be returned.
      Returns: a [gdk.surface.Surface]
  */
  gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gsk_renderer_get_surface(cast(GskRenderer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the renderer is realized or not.
      Returns: true if the [gsk.renderer.Renderer] was realized, and false otherwise
  */
  bool isRealized()
  {
    bool _retval;
    _retval = cast(bool)gsk_renderer_is_realized(cast(GskRenderer*)this._cPtr);
    return _retval;
  }

  /**
      Creates the resources needed by the renderer to render the scene
      graph.
      
      Since GTK 4.6, the surface may be `NULL`, which allows using
      renderers without having to create a surface.
      Since GTK 4.14, it is recommended to use [gsk.renderer.Renderer.realizeForDisplay]
      instead.
      
      Note that it is mandatory to call [gsk.renderer.Renderer.unrealize] before
      destroying the renderer.
  
      Params:
        surface = the [gdk.surface.Surface] renderer will be used on
      Returns: Whether the renderer was successfully realized
      Throws: [ErrorWrap]
  */
  bool realize(gdk.surface.Surface surface = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gsk_renderer_realize(cast(GskRenderer*)this._cPtr, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates the resources needed by the renderer to render the scene
      graph.
      
      Note that it is mandatory to call [gsk.renderer.Renderer.unrealize] before
      destroying the renderer.
  
      Params:
        display = the [gdk.display.Display] renderer will be used on
      Returns: Whether the renderer was successfully realized
      Throws: [ErrorWrap]
  */
  bool realizeForDisplay(gdk.display.Display display)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gsk_renderer_realize_for_display(cast(GskRenderer*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Renders the scene graph, described by a tree of [gsk.render_node.RenderNode] instances
      to the renderer's surface,  ensuring that the given region gets redrawn.
      
      If the renderer has no associated surface, this function does nothing.
      
      Renderers must ensure that changes of the contents given by the root
      node as well as the area given by region are redrawn. They are however
      free to not redraw any pixel outside of region if they can guarantee that
      it didn't change.
      
      The renderer will acquire a reference on the [gsk.render_node.RenderNode] tree while
      the rendering is in progress.
  
      Params:
        root = a [gsk.render_node.RenderNode]
        region = the [cairo.region.Region] that must be redrawn or null
            for the whole window
  */
  void render(gsk.render_node.RenderNode root, cairo.region.Region region = null)
  {
    gsk_renderer_render(cast(GskRenderer*)this._cPtr, root ? cast(GskRenderNode*)root._cPtr(No.Dup) : null, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Renders the scene graph, described by a tree of [gsk.render_node.RenderNode] instances,
      to a [gdk.texture.Texture].
      
      The renderer will acquire a reference on the [gsk.render_node.RenderNode] tree while
      the rendering is in progress.
      
      If you want to apply any transformations to root, you should put it into a
      transform node and pass that node instead.
  
      Params:
        root = a [gsk.render_node.RenderNode]
        viewport = the section to draw or null to use root's bounds
      Returns: a [gdk.texture.Texture] with the rendered contents of root.
  */
  gdk.texture.Texture renderTexture(gsk.render_node.RenderNode root, graphene.rect.Rect viewport = null)
  {
    GdkTexture* _cretval;
    _cretval = gsk_renderer_render_texture(cast(GskRenderer*)this._cPtr, root ? cast(GskRenderNode*)root._cPtr(No.Dup) : null, viewport ? cast(const(graphene_rect_t)*)viewport._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Releases all the resources created by [gsk.renderer.Renderer.realize].
  */
  void unrealize()
  {
    gsk_renderer_unrealize(cast(GskRenderer*)this._cPtr);
  }
}
