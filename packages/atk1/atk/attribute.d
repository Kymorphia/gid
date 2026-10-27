/// Module for [Attribute] class
module atk.attribute;

public import gid.basictypes;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
    AtkAttribute is a string name/value pair representing a generic
    attribute. This can be used to expose additional information from
    an accessible object as a whole (see [atk.object.ObjectWrap.getAttributes])
    or an document (see [atk.document.Document.getAttributes]). In the case of
    text attributes (see [atk.text.Text.getDefaultAttributes]),
    #AtkTextAttribute enum defines all the possible text attribute
    names. You can use [atk.global.textAttributeGetName] to get the string
    name from the enum value. See also [atk.global.textAttributeForName]
    and [atk.global.textAttributeGetValue] for more information.
    
    A string name/value pair representing a generic attribute.
*/
class Attribute
{
  AtkAttribute _cInstance;

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
    _cInstance = *cast(AtkAttribute*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

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
    (cast(AtkAttribute*)this._cPtr).name = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

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
    (cast(AtkAttribute*)this._cPtr).value = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
