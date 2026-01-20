/// Module for [AttrInt] class
module pango.attr_int;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_int.AttrInt] structure is used to represent attributes with
    an integer or enumeration value.
*/
class AttrInt
{
  PangoAttrInt _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_int.AttrInt");

    _cInstance = *cast(PangoAttrInt*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrInt*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute
  */
  @property int value()
  {
    return (cast(PangoAttrInt*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute
  */
  @property void value(int propval)
  {
    (cast(PangoAttrInt*)this._cPtr).value = propval;
  }
}
