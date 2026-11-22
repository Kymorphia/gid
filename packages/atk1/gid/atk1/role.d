/// Module for [Role] enum namespace
module gid.atk1.role;

import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;

/// Namespace for [Role] enum
struct Role
{
  alias Enum = gid.atk1.types.Role; ///

  /**
      Get the #AtkRole type corresponding to a rolew name.
  
      Params:
        name = a string which is the (non-localized) name of an ATK role.
      Returns: the #AtkRole enumerated type corresponding to the specified name,
                 or #ATK_ROLE_INVALID if no matching role is found.
  */
  static gid.atk1.types.Role forName(string name) nothrow
  {
    AtkRole _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_role_for_name(_name);
    gid.atk1.types.Role _retval = cast(gid.atk1.types.Role)_cretval;
    return _retval;
  }

  /**
      Gets the localized description string describing the #AtkRole role.
  
      Params:
        role = The #AtkRole whose localized name is required
      Returns: the localized string describing the AtkRole
  */
  static string getLocalizedName(gid.atk1.types.Role role) nothrow
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
  static string getName(gid.atk1.types.Role role) nothrow
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
  static gid.atk1.types.Role register(string name) nothrow
  {
    AtkRole _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_role_register(_name);
    gid.atk1.types.Role _retval = cast(gid.atk1.types.Role)_cretval;
    return _retval;
  }
}
