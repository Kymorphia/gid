/// Module for [AttrInt] class
module pango.attr_int;

public import gid.basictypes;
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

  /**
      Create a `attr_int.AttrInt` wrap type.
      Params:
        value = the value of the attribute
  */
  this(int value = int.init) nothrow
  {
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrInt*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrInt*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute
  */
  @property int value() nothrow
  {
    return (cast(PangoAttrInt*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute
  */
  @property void value(int propval) nothrow
  {
    (cast(PangoAttrInt*)this._cPtr).value = propval;
  }
}
