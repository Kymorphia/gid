/// Module for [ColorStop] class
module gsk.color_stop;

import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    A color stop in a gradient node.
*/
class ColorStop
{
  GskColorStop _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.color_stop.ColorStop");

    _cInstance = *cast(GskColorStop*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `offset` field.
      Returns: the offset of the color stop
  */
  @property float offset()
  {
    return (cast(GskColorStop*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset of the color stop
  */
  @property void offset(float propval)
  {
    (cast(GskColorStop*)this._cPtr).offset = propval;
  }

  /**
      Get `color` field.
      Returns: the color at the given offset
  */
  @property gdk.rgba.RGBA color()
  {
    return cToD!(gdk.rgba.RGBA)(cast(void*)&(cast(GskColorStop*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the color at the given offset
  */
  @property void color(gdk.rgba.RGBA propval)
  {
    (cast(GskColorStop*)this._cPtr).color = cast(GdkRGBA)propval;
  }
}
