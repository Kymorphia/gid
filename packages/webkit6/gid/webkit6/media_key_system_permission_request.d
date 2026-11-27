/// Module for [MediaKeySystemPermissionRequest] class
module gid.webkit6.media_key_system_permission_request;

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
    A permission request for using an EME Content Decryption Module.
    
    WebKitMediaKeySystemPermissionRequest represents a request for permission to decide whether
    WebKit should use the given CDM to access protected media when requested through the
    MediaKeySystem API.
    
    When a WebKitMediaKeySystemPermissionRequest is not handled by the user,
    it is denied by default.
    
    When handling this permission request the application may perform additional installation of the
    requested CDM, unless it is already present on the host system.
*/
@gidGir("MediaKeySystemPermissionRequest", "MediaKeySystemPermissionRequestClass")
class MediaKeySystemPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_media_key_system_permission_request_get_type != &gidSymbolNotFound ? webkit_media_key_system_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitMediaKeySystemPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaKeySystemPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.media_key_system_permission_request.MediaKeySystemPermissionRequest]
      Returns: New builder object
  */
  static MediaKeySystemPermissionRequestGidBuilder builder() nothrow
  {
    return new MediaKeySystemPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.media_key_system_permission_request.MediaKeySystemPermissionRequest]
class MediaKeySystemPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.media_key_system_permission_request.MediaKeySystemPermissionRequest]
final class MediaKeySystemPermissionRequestGidBuilder : MediaKeySystemPermissionRequestGidBuilderImpl!MediaKeySystemPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MediaKeySystemPermissionRequest build() nothrow
  {
    return new MediaKeySystemPermissionRequest(cast(void*)createGObject(MediaKeySystemPermissionRequest._getGType), Yes.Take);
  }
}
