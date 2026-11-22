/// Module for [OutsetShadowNode] class
module gid.gsk4.outset_shadow_node;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.rounded_rect;
import gid.gsk4.types;

/**
    A render node for an outset shadow.
*/
class OutsetShadowNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_outset_shadow_node_get_type != &gidSymbolNotFound ? gsk_outset_shadow_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will render an outset shadow
      around the box given by outline.
  
      Params:
        outline = outline of the region surrounded by shadow
        color = color of the shadow
        dx = horizontal offset of shadow
        dy = vertical offset of shadow
        spread = how far the shadow spreads towards the inside
        blurRadius = how much blur to apply to the shadow
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.rounded_rect.RoundedRect outline, gid.gdk4.rgba.RGBA color, float dx, float dy, float spread, float blurRadius) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_outset_shadow_node_new(outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, cast(const(GdkRGBA)*)&color, dx, dy, spread, blurRadius);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the blur radius of the shadow.
      Returns: the blur radius, in pixels
  */
  float getBlurRadius() nothrow
  {
    float _retval;
    _retval = gsk_outset_shadow_node_get_blur_radius(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the color of the outset shadow.
      
      The value returned by this function will not be correct
      if the render node was created for a non-sRGB color.
      Returns: a color
  */
  gid.gdk4.rgba.RGBA getColor() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_outset_shadow_node_get_color(cast(const(GskRenderNode)*)this._cPtr);
    gid.gdk4.rgba.RGBA _retval;
    if (_cretval)
      _retval = *cast(gid.gdk4.rgba.RGBA*)_cretval;
    return _retval;
  }

  /**
      Retrieves the horizontal offset of the outset shadow.
      Returns: an offset, in pixels
  */
  float getDx() nothrow
  {
    float _retval;
    _retval = gsk_outset_shadow_node_get_dx(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the vertical offset of the outset shadow.
      Returns: an offset, in pixels
  */
  float getDy() nothrow
  {
    float _retval;
    _retval = gsk_outset_shadow_node_get_dy(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the outline rectangle of the outset shadow.
      Returns: a rounded rectangle
  */
  gid.gsk4.rounded_rect.RoundedRect getOutline() nothrow
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_outset_shadow_node_get_outline(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Retrieves how much the shadow spreads outwards.
      Returns: the size of the shadow, in pixels
  */
  float getSpread() nothrow
  {
    float _retval;
    _retval = gsk_outset_shadow_node_get_spread(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
