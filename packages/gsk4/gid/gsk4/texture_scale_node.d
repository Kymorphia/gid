/// Module for [TextureScaleNode] class
module gid.gsk4.texture_scale_node;

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
    A render node for a [gid.gdk4.texture.Texture], with control over scaling.
*/
@gidGir("TextureScaleNode")
class TextureScaleNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_texture_scale_node_get_type != &gidSymbolNotFound ? gsk_texture_scale_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gdk4.texture.Texture texture, gid.graphene1.rect.Rect bounds, gid.gsk4.types.ScalingFilter filter) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_texture_scale_node_new(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, filter);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the [gid.gsk4.types.ScalingFilter] used when creating this [gid.gsk4.render_node.RenderNode].
      Returns: the [gid.gsk4.types.ScalingFilter]
  */
  gid.gsk4.types.ScalingFilter getFilter() nothrow
  {
    GskScalingFilter _cretval;
    _cretval = gsk_texture_scale_node_get_filter(cast(const(GskRenderNode)*)this._cPtr);
    gid.gsk4.types.ScalingFilter _retval = cast(gid.gsk4.types.ScalingFilter)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gid.gdk4.texture.Texture] used when creating this [gid.gsk4.render_node.RenderNode].
      Returns: the [gid.gdk4.texture.Texture]
  */
  gid.gdk4.texture.Texture getTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gsk_texture_scale_node_get_texture(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}
