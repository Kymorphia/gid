/// Module for [AttrColor] class
module pango.attr_color;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.color;
import pango.types;

/**
    The [pango.attr_color.AttrColor] structure is used to represent attributes that
    are colors.
*/
class AttrColor
{
  PangoAttrColor _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_color.AttrColor");

    _cInstance = *cast(PangoAttrColor*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrColor*)this._cPtr).attr);
  }

  /**
      Get `color` field.
      Returns: the [pango.color.Color] which is the value of the attribute
  */
  @property pango.color.Color color()
  {
    return cToD!(pango.color.Color)(cast(void*)&(cast(PangoAttrColor*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the [pango.color.Color] which is the value of the attribute
  */
  @property void color(pango.color.Color propval)
  {
    (cast(PangoAttrColor*)this._cPtr).color = cast(PangoColor)propval;
  }
}
