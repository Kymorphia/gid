/// Module for [RelationType] enum namespace
module gid.atk1.relation_type;

import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.gid;

/// Namespace for [RelationType] enum
struct RelationType
{
  alias Enum = gid.atk1.types.RelationType; ///

  /**
      Get the #AtkRelationType type corresponding to a relation name.
  
      Params:
        name = a string which is the (non-localized) name of an ATK relation type.
      Returns: the #AtkRelationType enumerated type corresponding to the specified name,
                 or #ATK_RELATION_NULL if no matching relation type is found.
  */
  static gid.atk1.types.RelationType forName(string name) nothrow
  {
    AtkRelationType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_relation_type_for_name(_name);
    gid.atk1.types.RelationType _retval = cast(gid.atk1.types.RelationType)_cretval;
    return _retval;
  }

  /**
      Gets the description string describing the #AtkRelationType type.
  
      Params:
        type = The #AtkRelationType whose name is required
      Returns: the string describing the AtkRelationType
  */
  static string getName(gid.atk1.types.RelationType type) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_relation_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Associate name with a new #AtkRelationType
  
      Params:
        name = a name string
      Returns: an #AtkRelationType associated with name
  */
  static gid.atk1.types.RelationType register(string name) nothrow
  {
    AtkRelationType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_relation_type_register(_name);
    gid.atk1.types.RelationType _retval = cast(gid.atk1.types.RelationType)_cretval;
    return _retval;
  }
}
