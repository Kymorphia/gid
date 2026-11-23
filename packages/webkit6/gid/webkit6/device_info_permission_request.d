/// Module for [DeviceInfoPermissionRequest] class
module gid.webkit6.device_info_permission_request;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.permission_request;
import gid.webkit6.permission_request_mixin;
import gid.webkit6.types;

/**
    A permission request for enumerating the user's media devices
    
    WebKitDeviceInfoPermissionRequest represents a request for
    permission to whether WebKit should be allowed to access the user's
    devices information when requested through the MediaDevices.enumerateDevices
    API.
    
    When a WebKitDeviceInfoPermissionRequest is not handled by the user,
    it is denied by default.
*/
class DeviceInfoPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_device_info_permission_request_get_type != &gidSymbolNotFound ? webkit_device_info_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitDeviceInfoPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceInfoPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.device_info_permission_request.DeviceInfoPermissionRequest]
      Returns: New builder object
  */
  static DeviceInfoPermissionRequestGidBuilder builder() nothrow
  {
    return new DeviceInfoPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.device_info_permission_request.DeviceInfoPermissionRequest]
class DeviceInfoPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.device_info_permission_request.DeviceInfoPermissionRequest]
final class DeviceInfoPermissionRequestGidBuilder : DeviceInfoPermissionRequestGidBuilderImpl!DeviceInfoPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceInfoPermissionRequest build() nothrow
  {
    return new DeviceInfoPermissionRequest(cast(void*)createGObject(DeviceInfoPermissionRequest._getGType), Yes.Take);
  }
}
