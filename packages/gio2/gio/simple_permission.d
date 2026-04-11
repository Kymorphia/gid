/// Module for [SimplePermission] class
module gio.simple_permission;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.permission;
import gio.types;
import gobject.gid_builder;

/**
    [gio.simple_permission.SimplePermission] is a trivial implementation of [gio.permission.Permission]
    that represents a permission that is either always or never allowed.  The
    value is given at construction and doesn’t change.
    
    Calling [gio.permission.Permission.acquire] or [gio.permission.Permission.release]
    on a [gio.simple_permission.SimplePermission] will result in errors.
*/
class SimplePermission : gio.permission.Permission
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_simple_permission_get_type != &gidSymbolNotFound ? g_simple_permission_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimplePermission self()
  {
    return this;
  }

  /**
      Get builder for [gio.simple_permission.SimplePermission]
      Returns: New builder object
  */
  static SimplePermissionGidBuilder builder()
  {
    return new SimplePermissionGidBuilder;
  }

  /**
      Creates a new #GPermission instance that represents an action that is
      either always or never allowed.
  
      Params:
        allowed = true if the action is allowed
      Returns: the #GSimplePermission, as a #GPermission
  */
  this(bool allowed)
  {
    GPermission* _cretval;
    _cretval = g_simple_permission_new(allowed);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gio.simple_permission.SimplePermission]
class SimplePermissionGidBuilderImpl(T) : gio.permission.PermissionGidBuilderImpl!T
{
}

/// Fluent builder for [gio.simple_permission.SimplePermission]
final class SimplePermissionGidBuilder : SimplePermissionGidBuilderImpl!SimplePermissionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimplePermission build()
  {
    return new SimplePermission(cast(void*)createGObject(SimplePermission._getGType), Yes.Take);
  }
}
