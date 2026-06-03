/// Module for [ValueType] enum namespace
module atk.value_type;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/// Namespace for [ValueType] enum
struct ValueType
{
  alias Enum = atk.types.ValueType; ///

  /**
      Gets the localized description string describing the #AtkValueType value_type.
  
      Params:
        valueType = The #AtkValueType whose localized name is required
      Returns: the localized string describing the #AtkValueType
  */
  static string getLocalizedName(atk.types.ValueType valueType) nothrow
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
  static string getName(atk.types.ValueType valueType) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_value_type_get_name(valueType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
