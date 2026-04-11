/// Module for [DeviceInfoPermissionRequest] class
module webkit.device_info_permission_request;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for accessing user's audio/video devices.
    
    WebKitUserMediaPermissionRequest represents a request for
    permission to whether WebKit should be allowed to access the user's
    devices information when requested through the enumerateDevices API.
    
    When a WebKitDeviceInfoPermissionRequest is not handled by the user,
    it is denied by default.
*/
class DeviceInfoPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_device_info_permission_request_get_type != &gidSymbolNotFound ? webkit_device_info_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceInfoPermissionRequest self()
  {
    return this;
  }

  /**
      Get builder for [webkit.device_info_permission_request.DeviceInfoPermissionRequest]
      Returns: New builder object
  */
  static DeviceInfoPermissionRequestGidBuilder builder()
  {
    return new DeviceInfoPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [webkit.device_info_permission_request.DeviceInfoPermissionRequest]
class DeviceInfoPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.device_info_permission_request.DeviceInfoPermissionRequest]
final class DeviceInfoPermissionRequestGidBuilder : DeviceInfoPermissionRequestGidBuilderImpl!DeviceInfoPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceInfoPermissionRequest build()
  {
    return new DeviceInfoPermissionRequest(cast(void*)createGObject(DeviceInfoPermissionRequest._getGType), No.Take);
  }
}
