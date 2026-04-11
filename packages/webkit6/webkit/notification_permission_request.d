/// Module for [NotificationPermissionRequest] class
module webkit.notification_permission_request;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for displaying web notifications.
    
    WebKitNotificationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user with
    notifications through the Web Notification API.
    
    When a WebKitNotificationPermissionRequest is not handled by the user,
    it is denied by default.
*/
class NotificationPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_notification_permission_request_get_type != &gidSymbolNotFound ? webkit_notification_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotificationPermissionRequest self()
  {
    return this;
  }

  /**
      Get builder for [webkit.notification_permission_request.NotificationPermissionRequest]
      Returns: New builder object
  */
  static NotificationPermissionRequestGidBuilder builder()
  {
    return new NotificationPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [webkit.notification_permission_request.NotificationPermissionRequest]
class NotificationPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.notification_permission_request.NotificationPermissionRequest]
final class NotificationPermissionRequestGidBuilder : NotificationPermissionRequestGidBuilderImpl!NotificationPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotificationPermissionRequest build()
  {
    return new NotificationPermissionRequest(cast(void*)createGObject(NotificationPermissionRequest._getGType), No.Take);
  }
}
