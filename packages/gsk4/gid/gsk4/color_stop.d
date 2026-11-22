/// Module for [ColorStop] class
module gid.gsk4.color_stop;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rgba;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.types;

/**
    A color stop in a gradient node.
*/
class ColorStop : StructWrap!(GskColorStop)
{
  /**
      Create a `color_stop.ColorStop` wrap type.
      Params:
        offset = the offset of the color stop
        color = the color at the given offset
  */
  this(float offset = 0.0, gid.gdk4.rgba.RGBA color = gid.gdk4.rgba.RGBA.init) nothrow
  {
    this.offset = offset;
    this.color = color;
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
  @property gid.gdk4.rgba.RGBA color() nothrow
  {
    return cToD!(gid.gdk4.rgba.RGBA)(cast(void*)&(cast(GskColorStop*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the color at the given offset
  */
  @property void color(gid.gdk4.rgba.RGBA propval) nothrow
  {
    (cast(GskColorStop*)this._cPtr).color = cast(GdkRGBA)propval;
  }
}
