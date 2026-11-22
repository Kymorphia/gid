/// Module for [StateType] enum namespace
module gid.atk1.state_type;

import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;

/// Namespace for [StateType] enum
struct StateType
{
  alias Enum = gid.atk1.types.StateType; ///

  /**
      Gets the #AtkStateType corresponding to the description string name.
  
      Params:
        name = a character string state name
      Returns: an #AtkStateType corresponding to name
  */
  static gid.atk1.types.StateType forName(string name) nothrow
  {
    AtkStateType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_state_type_for_name(_name);
    gid.atk1.types.StateType _retval = cast(gid.atk1.types.StateType)_cretval;
    return _retval;
  }

  /**
      Gets the description string describing the #AtkStateType type.
  
      Params:
        type = The #AtkStateType whose name is required
      Returns: the string describing the AtkStateType
  */
  static string getName(gid.atk1.types.StateType type) nothrow
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
  static gid.atk1.types.StateType register(string name) nothrow
  {
    AtkStateType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_state_type_register(_name);
    gid.atk1.types.StateType _retval = cast(gid.atk1.types.StateType)_cretval;
    return _retval;
  }
}
