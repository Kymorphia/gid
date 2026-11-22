/// Module for [UserMediaPermissionRequest] class
module gid.webkit6.user_media_permission_request;

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
    A permission request for accessing user's audio/video devices.
    
    WebKitUserMediaPermissionRequest represents a request for
    permission to decide whether WebKit should be allowed to access the user's
    audio and video source devices when requested through the getUserMedia API.
    
    When a WebKitUserMediaPermissionRequest is not handled by the user,
    it is denied by default.
*/
class UserMediaPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_user_media_permission_request_get_type != &gidSymbolNotFound ? webkit_user_media_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitUserMediaPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMediaPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.user_media_permission_request.UserMediaPermissionRequest]
      Returns: New builder object
  */
  static UserMediaPermissionRequestGidBuilder builder() nothrow
  {
    return new UserMediaPermissionRequestGidBuilder;
  }

  /**
      Get `isForAudioDevice` property.
      Returns: Whether the media device to which the permission was requested has a microphone or not.
  */
  @property bool isForAudioDevice() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("is-for-audio-device");
  }

  /**
      Get `isForVideoDevice` property.
      Returns: Whether the media device to which the permission was requested has a video capture capability or not.
  */
  @property bool isForVideoDevice() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("is-for-video-device");
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.user_media_permission_request.UserMediaPermissionRequest]
class UserMediaPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.user_media_permission_request.UserMediaPermissionRequest]
final class UserMediaPermissionRequestGidBuilder : UserMediaPermissionRequestGidBuilderImpl!UserMediaPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UserMediaPermissionRequest build() nothrow
  {
    return new UserMediaPermissionRequest(cast(void*)createGObject(UserMediaPermissionRequest._getGType), Yes.Take);
  }
}
