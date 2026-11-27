/// Module for [SimplePermission] class
module gid.gio2.simple_permission;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.permission;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    [gid.gio2.simple_permission.SimplePermission] is a trivial implementation of [gid.gio2.permission.Permission]
    that represents a permission that is either always or never allowed.  The
    value is given at construction and doesn’t change.
    
    Calling [gid.gio2.permission.Permission.acquire] or [gid.gio2.permission.Permission.release]
    on a [gid.gio2.simple_permission.SimplePermission] will result in errors.
*/
@gidGir("SimplePermission")
class SimplePermission : gid.gio2.permission.Permission
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_simple_permission_get_type != &gidSymbolNotFound ? g_simple_permission_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSimplePermission";
  }

  /** Returns `this`, for use in `with` statements. */
  override SimplePermission self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.simple_permission.SimplePermission]
      Returns: New builder object
  */
  static SimplePermissionGidBuilder builder() nothrow
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
  this(bool allowed) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GPermission* _cretval;
      _cretval = g_simple_permission_new(allowed);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.simple_permission.SimplePermission]
class SimplePermissionGidBuilderImpl(T) : gid.gio2.permission.PermissionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.simple_permission.SimplePermission]
final class SimplePermissionGidBuilder : SimplePermissionGidBuilderImpl!SimplePermissionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimplePermission build() nothrow
  {
    return new SimplePermission(cast(void*)createGObject(SimplePermission._getGType), Yes.Take);
  }
}
