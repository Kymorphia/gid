/// Module for [ValueType] enum namespace
module gid.atk1.value_type;

import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;

/// Namespace for [ValueType] enum
struct ValueType
{
  alias Enum = gid.atk1.types.ValueType; ///

  /**
      Gets the localized description string describing the #AtkValueType value_type.
  
      Params:
        valueType = The #AtkValueType whose localized name is required
      Returns: the localized string describing the #AtkValueType
  */
  static string getLocalizedName(gid.atk1.types.ValueType valueType) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_value_type_get_localized_name(valueType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the description string describing the #AtkValueType value_type.
  
      Params:
        valueType = The #AtkValueType whose name is required
      Returns: the string describing the #AtkValueType
  */
  static string getName(gid.atk1.types.ValueType valueType) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_value_type_get_name(valueType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
