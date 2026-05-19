/// Module for [TextureScaleNode] class
module gsk.texture_scale_node;

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
class TextureScaleNode : gsk.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.texture_scale_node.TextureScaleNode");

    super(cast(GskRenderNode*)ptr, take);
  }

  /**
      Creates a node that scales the texture to the size given by the
      bounds using the filter and then places it at the bounds' position.
      
      Note that further scaling and other transformations which are
      applied to the node will apply linear filtering to the resulting
      texture, as usual.
      
      This node is intended for tight control over scaling applied
      to a texture, such as in image editors and requires the
      application to be aware of the whole render tree as further
      transforms may be applied that conflict with the desired effect
      of this node.
  
      Params:
        texture = the texture to scale
        bounds = the size of the texture to scale to
        filter = how to scale the texture
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gdk.texture.Texture texture, graphene.rect.Rect bounds, gsk.types.ScalingFilter filter)
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_scale_node_new(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, filter);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the [gsk.types.ScalingFilter] used when creating this [gsk.render_node.RenderNode].
      Returns: the [gsk.types.ScalingFilter]
  */
  gsk.types.ScalingFilter getFilter()
  {
    GskScalingFilter _cretval;
    _cretval = gsk_texture_scale_node_get_filter(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.ScalingFilter _retval = cast(gsk.types.ScalingFilter)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gdk.texture.Texture] used when creating this [gsk.render_node.RenderNode].
      Returns: the [gdk.texture.Texture]
  */
  gdk.texture.Texture getTexture()
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_scale_node_get_texture(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
