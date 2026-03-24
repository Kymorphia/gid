/// Module for [ClipboardPermissionRequest] class
module webkit.clipboard_permission_request;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.permission_request;
import webkit.permission_request_mixin;
import webkit.types;

/**
    A permission request for reading clipboard contents.
    
    WebKitClipboardPermissionRequest represents a request for
    permission to decide whether WebKit can access the clipboard to read
    its contents through the Async Clipboard API.
    
    When a WebKitClipboardPermissionRequest is not handled by the user,
    it is denied by default.
*/
class ClipboardPermissionRequest : gobject.object.ObjectWrap, webkit.permission_request.PermissionRequest
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
    return cast(void function())webkit_clipboard_permission_request_get_type != &gidSymbolNotFound ? webkit_clipboard_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ClipboardPermissionRequest self()
  {
    return this;
  }

  /**
  Get builder for [webkit.clipboard_permission_request.ClipboardPermissionRequest]
  Returns: New builder object
  */
  static ClipboardPermissionRequestGidBuilder builder()
  {
    return new ClipboardPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

class ClipboardPermissionRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, webkit.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [webkit.clipboard_permission_request.ClipboardPermissionRequest]
final class ClipboardPermissionRequestGidBuilder : ClipboardPermissionRequestGidBuilderImpl!ClipboardPermissionRequestGidBuilder
{
  ClipboardPermissionRequest build()
  {
    return new ClipboardPermissionRequest(cast(void*)createGObject(ClipboardPermissionRequest._getGType), No.Take);
  }
}
