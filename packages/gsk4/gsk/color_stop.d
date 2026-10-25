/// Module for [ColorStop] class
module gsk.color_stop;

public import gid.basictypes;
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

  /**
      Create a `color_stop.ColorStop` wrap type.
      Params:
        offset = the offset of the color stop
        color = the color at the given offset
  */
  this(float offset = 0.0, gdk.rgba.RGBA color = gdk.rgba.RGBA.init) nothrow
  {
    this.offset = offset;
    this.color = color;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GskColorStop*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `offset` field.
      Returns: the offset of the color stop
  */
  @property float offset() nothrow
  {
    return (cast(GskColorStop*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset of the color stop
  */
  @property void offset(float propval) nothrow
  {
    (cast(GskColorStop*)this._cPtr).offset = propval;
  }

  /**
      Get `color` field.
      Returns: the color at the given offset
  */
  @property gdk.rgba.RGBA color() nothrow
  {
    return cToD!(gdk.rgba.RGBA)(cast(void*)&(cast(GskColorStop*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the color at the given offset
  */
  @property void color(gdk.rgba.RGBA propval) nothrow
  {
    (cast(GskColorStop*)this._cPtr).color = cast(GdkRGBA)propval;
  }
}
