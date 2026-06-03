/// Module for [AttrType] enum namespace
module pango.attr_type;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.types;

/// Namespace for [AttrType] enum
struct AttrType
{
  alias Enum = pango.types.AttrType; ///

  /**
      Fetches the attribute type name.
      
      The attribute type name is the string passed in
      when registering the type using
      `funcPango.AttrType.register`.
      
      The returned value is an interned string (see
      [glib.global.internString] for what that means) that should
      not be modified or freed.
  
      Params:
        type = an attribute type ID to fetch the name for
      Returns: the type ID name (which
          may be null), or null if type is a built-in Pango
          attribute type or invalid.
  */
  static string getName(pango.types.AttrType type) nothrow
  {
    const(char)* _cretval;
    _cretval = pango_attr_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Allocate a new attribute type ID.
      
      The attribute type name can be accessed later
      by using `funcPango.AttrType.get_name`.
  
      Params:
        name = an identifier for the type
      Returns: the new type ID.
  */
  static pango.types.AttrType register(string name) nothrow
  {
    PangoAttrType _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_attr_type_register(_name);
    pango.types.AttrType _retval = cast(pango.types.AttrType)_cretval;
    return _retval;
  }
}
