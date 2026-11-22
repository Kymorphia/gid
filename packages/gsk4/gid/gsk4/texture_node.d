/// Module for [TextureNode] class
module gid.gsk4.texture_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.texture;
import gid.gobject2.object;
import gid.graphene1.rect;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;

/**
    A render node for a [gid.gdk4.texture.Texture].
*/
class TextureNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_texture_node_get_type != &gidSymbolNotFound ? gsk_texture_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will render the given
      texture into the area given by bounds.
      
      Note that GSK applies linear filtering when textures are
      scaled and transformed. See [gid.gsk4.texture_scale_node.TextureScaleNode]
      for a way to influence filtering.
  
      Params:
        texture = the [gid.gdk4.texture.Texture]
        bounds = the rectangle to render the texture into
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gdk4.texture.Texture texture, gid.graphene1.rect.Rect bounds) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_node_new(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the [gid.gdk4.texture.Texture] used when creating this [gid.gsk4.render_node.RenderNode].
      Returns: the [gid.gdk4.texture.Texture]
  */
  gid.gdk4.texture.Texture getTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_node_get_texture(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
