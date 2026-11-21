/// Module for [PointerLockPermissionRequest] class
module gid.webkit6.pointer_lock_permission_request;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;
import gid.webkit6.types;

/**
    A permission request for locking the pointer.
    
    WebKitPointerLockPermissionRequest represents a request for
    permission to decide whether WebKit can lock the pointer device when
    requested by web content.
    
    When a WebKitPointerLockPermissionRequest is not handled by the user,
    it is allowed by default.
*/
class PointerLockPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_pointer_lock_permission_request_get_type != &gidSymbolNotFound ? webkit_pointer_lock_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitPointerLockPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override PointerLockPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.pointer_lock_permission_request.PointerLockPermissionRequest]
      Returns: New builder object
  */
  static PointerLockPermissionRequestGidBuilder builder() nothrow
  {
    return new PointerLockPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.pointer_lock_permission_request.PointerLockPermissionRequest]
class PointerLockPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.pointer_lock_permission_request.PointerLockPermissionRequest]
final class PointerLockPermissionRequestGidBuilder : PointerLockPermissionRequestGidBuilderImpl!PointerLockPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PointerLockPermissionRequest build() nothrow
  {
    return new PointerLockPermissionRequest(cast(void*)createGObject(PointerLockPermissionRequest._getGType), Yes.Take);
  }
}
