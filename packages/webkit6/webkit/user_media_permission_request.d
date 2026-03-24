/// Module for [UserMediaPermissionRequest] class
module webkit.user_media_permission_request;

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
    permission to decide whether WebKit should be allowed to access the user's
    audio and video source devices when requested through the getUserMedia API.
    
    When a WebKitUserMediaPermissionRequest is not handled by the user,
    it is denied by default.
*/
class UserMediaPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_user_media_permission_request_get_type != &gidSymbolNotFound ? webkit_user_media_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMediaPermissionRequest self()
  {
    return this;
  }

  /**
  Get builder for [webkit.user_media_permission_request.UserMediaPermissionRequest]
  Returns: New builder object
  */
  static UserMediaPermissionRequestGidBuilder builder()
  {
    return new UserMediaPermissionRequestGidBuilder;
  }

  /**
      Get `isForAudioDevice` property.
      Returns: Whether the media device to which the permission was requested has a microphone or not.
  */
  @property bool isForAudioDevice()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-for-audio-device");
  }

  /**
      Get `isForVideoDevice` property.
      Returns: Whether the media device to which the permission was requested has a video capture capability or not.
  */
  @property bool isForVideoDevice()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-for-video-device");
  }

  mixin PermissionRequestT!();
}

class UserMediaPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.user_media_permission_request.UserMediaPermissionRequest]
final class UserMediaPermissionRequestGidBuilder : UserMediaPermissionRequestGidBuilderImpl!UserMediaPermissionRequestGidBuilder
{
  UserMediaPermissionRequest build()
  {
    return new UserMediaPermissionRequest(cast(void*)createGObject(UserMediaPermissionRequest._getGType), No.Take);
  }
}
