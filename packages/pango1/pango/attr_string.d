/// Module for [AttrString] class
module pango.attr_string;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_string.AttrString] structure is used to represent attributes with
    a string value.
*/
class AttrString
{
  PangoAttrString cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_string.AttrString");

    cInstance = *cast(PangoAttrString*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrString*)cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the string which is the value of the attribute
  */
  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(PangoAttrString*)cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the string which is the value of the attribute
  */
  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(PangoAttrString*)cPtr).value);
    dToC(propval, cast(void*)&(cast(PangoAttrString*)cPtr).value);
  }
}
