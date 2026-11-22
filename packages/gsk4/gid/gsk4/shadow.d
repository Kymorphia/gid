/// Module for [Shadow] class
module gid.gsk4.shadow;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.types;

/**
    The shadow parameters in a shadow node.
*/
class Shadow : StructWrap!(GskShadow)
{
  /**
      Create a `shadow.Shadow` wrap type.
      Params:
        color = the color of the shadow
        dx = the horizontal offset of the shadow
        dy = the vertical offset of the shadow
        radius = the radius of the shadow
  */
  this(gid.gdk4.rgba.RGBA color = gid.gdk4.rgba.RGBA.init, float dx = 0.0, float dy = 0.0, float radius = 0.0) nothrow
  {
    this.color = color;
    this.dx = dx;
    this.dy = dy;
    this.radius = radius;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `color` field.
      Returns: the color of the shadow
  */
  @property gid.gdk4.rgba.RGBA color() nothrow
  {
    return cToD!(gid.gdk4.rgba.RGBA)(cast(void*)&(cast(GskShadow*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the color of the shadow
  */
  @property void color(gid.gdk4.rgba.RGBA propval) nothrow
  {
    (cast(GskShadow*)this._cPtr).color = cast(GdkRGBA)propval;
  }

  /**
      Get `dx` field.
      Returns: the horizontal offset of the shadow
  */
  @property float dx() nothrow
  {
    return (cast(GskShadow*)this._cPtr).dx;
  }

  /**
      Set `dx` field.
      Params:
        propval = the horizontal offset of the shadow
  */
  @property void dx(float propval) nothrow
  {
    (cast(GskShadow*)this._cPtr).dx = propval;
  }

  /**
      Get `dy` field.
      Returns: the vertical offset of the shadow
  */
  @property float dy() nothrow
  {
    return (cast(GskShadow*)this._cPtr).dy;
  }

  /**
      Set `dy` field.
      Params:
        propval = the vertical offset of the shadow
  */
  @property void dy(float propval) nothrow
  {
    (cast(GskShadow*)this._cPtr).dy = propval;
  }

  /**
      Get `radius` field.
      Returns: the radius of the shadow
  */
  @property float radius() nothrow
  {
    return (cast(GskShadow*)this._cPtr).radius;
  }

  /**
      Set `radius` field.
      Params:
        propval = the radius of the shadow
  */
  @property void radius(float propval) nothrow
  {
    (cast(GskShadow*)this._cPtr).radius = propval;
  }
}
