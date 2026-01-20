/// Module for [AttrFloat] class
module pango.attr_float;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_float.AttrFloat] structure is used to represent attributes with
    a float or double value.
*/
class AttrFloat
{
  PangoAttrFloat _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_float.AttrFloat");

    _cInstance = *cast(PangoAttrFloat*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFloat*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute
  */
  @property double value()
  {
    return (cast(PangoAttrFloat*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute
  */
  @property void value(double propval)
  {
    (cast(PangoAttrFloat*)this._cPtr).value = propval;
  }
}
