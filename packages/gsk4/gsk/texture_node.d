/// Module for [TextureNode] class
module gsk.texture_node;

public import gid.basictypes;
import gdk.texture;
import gid.gid;
import gobject.object;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.types;

/**
    A render node for a [gdk.texture.Texture].
*/
class TextureNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will render the given
      texture into the area given by bounds.
      
      Note that GSK applies linear filtering when textures are
      scaled and transformed. See [gsk.texture_scale_node.TextureScaleNode]
      for a way to influence filtering.
  
      Params:
        texture = the [gdk.texture.Texture]
        bounds = the rectangle to render the texture into
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gdk.texture.Texture texture, graphene.rect.Rect bounds) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_node_new(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the [gdk.texture.Texture] used when creating this [gsk.render_node.RenderNode].
      Returns: the [gdk.texture.Texture]
  */
  gdk.texture.Texture getTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_node_get_texture(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
