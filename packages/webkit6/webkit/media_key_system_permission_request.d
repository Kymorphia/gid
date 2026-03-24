/// Module for [MediaKeySystemPermissionRequest] class
module webkit.media_key_system_permission_request;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for using an EME Content Decryption Module.
    
    WebKitMediaKeySystemPermissionRequest represents a request for permission to decide whether
    WebKit should use the given CDM to access protected media when requested through the
    MediaKeySystem API.
    
    When a WebKitMediaKeySystemPermissionRequest is not handled by the user,
    it is denied by default.
    
    When handling this permission request the application may perform additional installation of the
    requested CDM, unless it is already present on the host system.
*/
class MediaKeySystemPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_media_key_system_permission_request_get_type != &gidSymbolNotFound ? webkit_media_key_system_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaKeySystemPermissionRequest self()
  {
    return this;
  }

  /**
  Get builder for [webkit.media_key_system_permission_request.MediaKeySystemPermissionRequest]
  Returns: New builder object
  */
  static MediaKeySystemPermissionRequestGidBuilder builder()
  {
    return new MediaKeySystemPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

class MediaKeySystemPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.media_key_system_permission_request.MediaKeySystemPermissionRequest]
final class MediaKeySystemPermissionRequestGidBuilder : MediaKeySystemPermissionRequestGidBuilderImpl!MediaKeySystemPermissionRequestGidBuilder
{
  MediaKeySystemPermissionRequest build()
  {
    return new MediaKeySystemPermissionRequest(cast(void*)createGObject(MediaKeySystemPermissionRequest._getGType), No.Take);
  }
}
