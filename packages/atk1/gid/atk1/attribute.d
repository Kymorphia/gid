/// Module for [Attribute] class
module gid.atk1.attribute;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;

/**
    AtkAttribute is a string name/value pair representing a generic
    attribute. This can be used to expose additional information from
    an accessible object as a whole (see [gid.atk1.object.ObjectWrap.getAttributes])
    or an document (see [gid.atk1.document.Document.getAttributes]). In the case of
    text attributes (see [gid.atk1.text.Text.getDefaultAttributes]),
    #AtkTextAttribute enum defines all the possible text attribute
    names. You can use [gid.atk1.global.textAttributeGetName] to get the string
    name from the enum value. See also [gid.atk1.global.textAttributeForName]
    and [gid.atk1.global.textAttributeGetValue] for more information.
    
    A string name/value pair representing a generic attribute.
*/
class Attribute : StructWrap!(AtkAttribute)
{
  /**
      Create a `attribute.Attribute` wrap type.
      Params:
        name = The attribute name.
        value = the value of the attribute, represented as a string.
  */
  this(string name = string.init, string value = string.init) nothrow
  {
    this.name = name;
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

  private const(char)* _nameRef; // Keeps borrowed GC string alive

  /**
      Get `name` field.
      Returns: The attribute name.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The attribute name.
  */
  @property void name(string propval) nothrow
  {
    if (_refuseBorrowedStore("name"))
      return;

    _nameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(AtkAttribute*)this._cPtr).name = cast(char*)_nameRef;
  }

  private const(char)* _valueRef; // Keeps borrowed GC string alive

  /**
      Get `value` field.
      Returns: the value of the attribute, represented as a string.
  */
  @property string value() nothrow
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute, represented as a string.
  */
  @property void value(string propval) nothrow
  {
    if (_refuseBorrowedStore("value"))
      return;

    _valueRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(AtkAttribute*)this._cPtr).value = cast(char*)_valueRef;
  }
}
