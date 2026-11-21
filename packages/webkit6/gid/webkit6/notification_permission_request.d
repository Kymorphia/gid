/// Module for [NotificationPermissionRequest] class
module gid.webkit6.notification_permission_request;

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
    A permission request for displaying web notifications.
    
    WebKitNotificationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user with
    notifications through the Web Notification API.
    
    When a WebKitNotificationPermissionRequest is not handled by the user,
    it is denied by default.
*/
class NotificationPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_notification_permission_request_get_type != &gidSymbolNotFound ? webkit_notification_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitNotificationPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override NotificationPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.notification_permission_request.NotificationPermissionRequest]
      Returns: New builder object
  */
  static NotificationPermissionRequestGidBuilder builder() nothrow
  {
    return new NotificationPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.notification_permission_request.NotificationPermissionRequest]
class NotificationPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.notification_permission_request.NotificationPermissionRequest]
final class NotificationPermissionRequestGidBuilder : NotificationPermissionRequestGidBuilderImpl!NotificationPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotificationPermissionRequest build() nothrow
  {
    return new NotificationPermissionRequest(cast(void*)createGObject(NotificationPermissionRequest._getGType), Yes.Take);
  }
}
