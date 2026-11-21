/// Module for [TextAttribute] enum namespace
module gid.atk1.text_attribute;

import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.gid;

/// Namespace for [TextAttribute] enum
struct TextAttribute
{
  alias Enum = gid.atk1.types.TextAttribute; ///

  /**
      Get the #AtkTextAttribute type corresponding to a text attribute name.
  
      Params:
        name = a string which is the (non-localized) name of an ATK text attribute.
      Returns: the #AtkTextAttribute enumerated type corresponding to the specified
                 name, or #ATK_TEXT_ATTRIBUTE_INVALID if no matching text attribute
                 is found.
  */
  static gid.atk1.types.TextAttribute forName(string name) nothrow
  {
    AtkTextAttribute _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_text_attribute_for_name(_name);
    gid.atk1.types.TextAttribute _retval = cast(gid.atk1.types.TextAttribute)_cretval;
    return _retval;
  }

  /**
      Gets the name corresponding to the #AtkTextAttribute
  
      Params:
        attr = The #AtkTextAttribute whose name is required
      Returns: a string containing the name; this string should not be freed
  */
  static string getName(gid.atk1.types.TextAttribute attr) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_text_attribute_get_name(attr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value for the index of the #AtkTextAttribute
  
      Params:
        attr = The #AtkTextAttribute for which a value is required
        index = The index of the required value
      Returns: a string containing the value; this string
        should not be freed; null is returned if there are no values
        maintained for the attr value.
  */
  static string getValue(gid.atk1.types.TextAttribute attr, int index) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_text_attribute_get_value(attr, index);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Associate name with a new #AtkTextAttribute
  
      Params:
        name = a name string
      Returns: an #AtkTextAttribute associated with name
  */
  static gid.atk1.types.TextAttribute register(string name) nothrow
  {
    AtkTextAttribute _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_text_attribute_register(_name);
    gid.atk1.types.TextAttribute _retval = cast(gid.atk1.types.TextAttribute)_cretval;
    return _retval;
  }
}
