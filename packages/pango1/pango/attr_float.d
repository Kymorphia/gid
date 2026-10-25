/// Module for [AttrFloat] class
module pango.attr_float;

public import gid.basictypes;
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

  /**
      Create a `attr_float.AttrFloat` wrap type.
      Params:
        value = the value of the attribute
  */
  this(double value = 0.0) nothrow
  {
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrFloat*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr() nothrow
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFloat*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute
  */
  @property double value() nothrow
  {
    return (cast(PangoAttrFloat*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute
  */
  @property void value(double propval) nothrow
  {
    (cast(PangoAttrFloat*)this._cPtr).value = propval;
  }
}
