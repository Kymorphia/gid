/// Module for [ClipboardPermissionRequest] class
module gid.webkit6.clipboard_permission_request;

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
    A permission request for reading clipboard contents.
    
    WebKitClipboardPermissionRequest represents a request for
    permission to decide whether WebKit can access the clipboard to read
    its contents through the Async Clipboard API.
    
    When a WebKitClipboardPermissionRequest is not handled by the user,
    it is denied by default.
*/
@gidGir("ClipboardPermissionRequest", "ClipboardPermissionRequestClass")
class ClipboardPermissionRequest : gid.gobject2.object.ObjectWrap, gid.webkit6.permission_request.PermissionRequest
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
    return cast(void function())webkit_clipboard_permission_request_get_type != &gidSymbolNotFound ? webkit_clipboard_permission_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitClipboardPermissionRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override ClipboardPermissionRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.clipboard_permission_request.ClipboardPermissionRequest]
      Returns: New builder object
  */
  static ClipboardPermissionRequestGidBuilder builder() nothrow
  {
    return new ClipboardPermissionRequestGidBuilder;
  }

  mixin PermissionRequestT!();
}

/// Fluent builder implementation template for [gid.webkit6.clipboard_permission_request.ClipboardPermissionRequest]
class ClipboardPermissionRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.webkit6.permission_request.PermissionRequestGidBuilderImpl!T
{

  mixin PermissionRequestGidBuilderT!();
}

/// Fluent builder for [gid.webkit6.clipboard_permission_request.ClipboardPermissionRequest]
final class ClipboardPermissionRequestGidBuilder : ClipboardPermissionRequestGidBuilderImpl!ClipboardPermissionRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ClipboardPermissionRequest build() nothrow
  {
    return new ClipboardPermissionRequest(cast(void*)createGObject(ClipboardPermissionRequest._getGType), Yes.Take);
  }
}
