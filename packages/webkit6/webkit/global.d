/// Global functions for webkit6 library
module webkit.global;

import gid.gid;
import webkit.c.functions;
import webkit.c.types;
import webkit.media_key_system_permission_request;
import webkit.types;
import webkit.user_media_permission_request;


/**
    Returns the major version number of the WebKit library.
    
    (e.g. in WebKit version 1.8.3 this is 1.)
    
    This function is in the library, so it represents the WebKit library
    your code is running against. Contrast with the #WEBKIT_MAJOR_VERSION
    macro, which represents the major version of the WebKit headers you
    have included when compiling your code.
    Returns: the major version number of the WebKit library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = webkit_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the WebKit library.
    
    (e.g. in WebKit version 1.8.3 this is 3.)
    
    This function is in the library, so it represents the WebKit library
    your code is running against. Contrast with the #WEBKIT_MICRO_VERSION
    macro, which represents the micro version of the WebKit headers you
    have included when compiling your code.
    Returns: the micro version number of the WebKit library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = webkit_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the WebKit library.
    
    (e.g. in WebKit version 1.8.3 this is 8.)
    
    This function is in the library, so it represents the WebKit library
    your code is running against. Contrast with the #WEBKIT_MINOR_VERSION
    macro, which represents the minor version of the WebKit headers you
    have included when compiling your code.
    Returns: the minor version number of the WebKit library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = webkit_get_minor_version();
  return _retval;
}

/**
    Get the key system for which access permission is being requested.

    Params:
      request = a #WebKitMediaKeySystemPermissionRequest
    Returns: the key system name for request
*/
string mediaKeySystemPermissionGetName(webkit.media_key_system_permission_request.MediaKeySystemPermissionRequest request)
{
  const(char)* _cretval;
  _cretval = webkit_media_key_system_permission_get_name(request ? cast(WebKitMediaKeySystemPermissionRequest*)request._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Use this function to format a URI for display.
    
    The URIs used internally by
    WebKit may contain percent-encoded characters or Punycode, which are not
    generally suitable to display to users. This function provides protection
    against IDN homograph attacks, so in some cases the host part of the returned
    URI may be in Punycode if the safety check fails.

    Params:
      uri = the URI to be converted
    Returns: uri suitable for display, or null in
         case of error.
*/
string uriForDisplay(string uri)
{
  char* _cretval;
  const(char)* _uri = uri.toCString(No.Alloc);
  _cretval = webkit_uri_for_display(_uri);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Check whether the permission request is for an audio device.

    Params:
      request = a #WebKitUserMediaPermissionRequest
    Returns: true if access to an audio device was requested.
*/
bool userMediaPermissionIsForAudioDevice(webkit.user_media_permission_request.UserMediaPermissionRequest request)
{
  bool _retval;
  _retval = cast(bool)webkit_user_media_permission_is_for_audio_device(request ? cast(WebKitUserMediaPermissionRequest*)request._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Check whether the permission request is for a display device.

    Params:
      request = a #WebKitUserMediaPermissionRequest
    Returns: true if access to a display device was requested.
*/
bool userMediaPermissionIsForDisplayDevice(webkit.user_media_permission_request.UserMediaPermissionRequest request)
{
  bool _retval;
  _retval = cast(bool)webkit_user_media_permission_is_for_display_device(request ? cast(WebKitUserMediaPermissionRequest*)request._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Check whether the permission request is for a video device.

    Params:
      request = a #WebKitUserMediaPermissionRequest
    Returns: true if access to a video device was requested.
*/
bool userMediaPermissionIsForVideoDevice(webkit.user_media_permission_request.UserMediaPermissionRequest request)
{
  bool _retval;
  _retval = cast(bool)webkit_user_media_permission_is_for_video_device(request ? cast(WebKitUserMediaPermissionRequest*)request._cPtr(No.Dup) : null);
  return _retval;
}
