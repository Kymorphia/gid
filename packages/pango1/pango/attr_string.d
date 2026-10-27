/// Module for [AttrString] class
module pango.attr_string;

public import gid.basictypes;
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
  PangoAttrString _cInstance;

  /**
      Create a `attr_string.AttrString` wrap type.
      Params:
        value = the string which is the value of the attribute
  */
  this(string value = string.init) nothrow
  {
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrString*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrString*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the string which is the value of the attribute
  */
  @property string value() nothrow
  {
    return cToD!(string)(cast(void*)(cast(PangoAttrString*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the string which is the value of the attribute
  */
  @property void value(string propval) nothrow
  {
    (cast(PangoAttrString*)this._cPtr).value = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
