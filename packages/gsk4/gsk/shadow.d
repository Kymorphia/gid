/// Module for [Shadow] class
module gsk.shadow;

public import gid.basictypes;
import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    The shadow parameters in a shadow node.
*/
class Shadow
{
  GskShadow _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GskShadow*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `color` field.
      Returns: the color of the shadow
  */
  @property gdk.rgba.RGBA color() nothrow
  {
    return cToD!(gdk.rgba.RGBA)(cast(void*)&(cast(GskShadow*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the color of the shadow
  */
  @property void color(gdk.rgba.RGBA propval) nothrow
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
