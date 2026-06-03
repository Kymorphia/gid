/// Module for [Role] enum namespace
module atk.role;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/// Namespace for [Role] enum
struct Role
{
  alias Enum = atk.types.Role; ///

  /**
      Get the #AtkRole type corresponding to a rolew name.
  
      Params:
        name = a string which is the (non-localized) name of an ATK role.
      Returns: the #AtkRole enumerated type corresponding to the specified name,
                 or #ATK_ROLE_INVALID if no matching role is found.
  */
  static atk.types.Role forName(string name) nothrow
  {
    AtkRole _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_role_for_name(_name);
    atk.types.Role _retval = cast(atk.types.Role)_cretval;
    return _retval;
  }

  /**
      Gets the localized description string describing the #AtkRole role.
  
      Params:
        role = The #AtkRole whose localized name is required
      Returns: the localized string describing the AtkRole
  */
  static string getLocalizedName(atk.types.Role role) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_role_get_localized_name(role);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the description string describing the #AtkRole role.
  
      Params:
        role = The #AtkRole whose name is required
      Returns: the string describing the AtkRole
  */
  static string getName(atk.types.Role role) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_role_get_name(role);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Registers the role specified by name. name must be a meaningful
      name. So it should not be empty, or consisting on whitespaces.
  
      Params:
        name = a character string describing the new role.
      Returns: an #AtkRole for the new role if added
        properly. ATK_ROLE_INVALID in case of error.
  
      Deprecated: Since 2.12. If your application/toolkit doesn't find a
        suitable role for a specific object defined at #AtkRole, please
        submit a bug in order to add a new role to the specification.
  */
  static atk.types.Role register(string name) nothrow
  {
    AtkRole _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_role_register(_name);
    atk.types.Role _retval = cast(atk.types.Role)_cretval;
    return _retval;
  }
}
