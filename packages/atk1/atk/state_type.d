/// Module for [StateType] enum namespace
module atk.state_type;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/// Namespace for [StateType] enum
struct StateType
{
  alias Enum = atk.types.StateType; ///

  /**
      Gets the #AtkStateType corresponding to the description string name.
  
      Params:
        name = a character string state name
      Returns: an #AtkStateType corresponding to name
  */
  static atk.types.StateType forName(string name) nothrow
  {
    AtkStateType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_state_type_for_name(_name);
    atk.types.StateType _retval = cast(atk.types.StateType)_cretval;
    return _retval;
  }

  /**
      Gets the description string describing the #AtkStateType type.
  
      Params:
        type = The #AtkStateType whose name is required
      Returns: the string describing the AtkStateType
  */
  static string getName(atk.types.StateType type) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_state_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Register a new object state.
  
      Params:
        name = a character string describing the new state.
      Returns: an #AtkState value for the new state.
  */
  static atk.types.StateType register(string name) nothrow
  {
    AtkStateType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_state_type_register(_name);
    atk.types.StateType _retval = cast(atk.types.StateType)_cretval;
    return _retval;
  }
}
