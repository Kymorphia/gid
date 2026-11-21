/// Module for [AttrString] class
module gid.pango1.attr_string;

public import gid.core.basictypes;
import gid.core.gid;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    The [gid.pango1.attr_string.AttrString] structure is used to represent attributes with
    a string value.
*/
class AttrString : StructWrap!(PangoAttrString)
{
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
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property gid.pango1.attribute.Attribute attr() nothrow
  {
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrString*)this._cPtr).attr);
  }

  private const(char)* _valueRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("value"))
      return;

    _valueRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(PangoAttrString*)this._cPtr).value = cast(char*)_valueRef;
  }
}
