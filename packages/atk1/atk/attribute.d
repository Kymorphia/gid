/// Module for [Attribute] class
module atk.attribute;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for atk.attribute.Attribute");

    _cInstance = *cast(AtkAttribute*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: The attribute name.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The attribute name.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(AtkAttribute*)this._cPtr).name);
  }

  /**
      Get `value` field.
      Returns: the value of the attribute, represented as a string.
  */
  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the value of the attribute, represented as a string.
  */
  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkAttribute*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(AtkAttribute*)this._cPtr).value);
  }
}
