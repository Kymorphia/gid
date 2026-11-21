/// Module for [WebViewSessionState] class
module gid.webkit6.web_view_session_state;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.bytes;
import gid.gobject2.boxed;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Handles serialization of a web view's browsing state.
*/
class WebViewSessionState : gid.gobject2.boxed.BoxedWrap!(webkit_web_view_session_state_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override WebViewSessionState self() nothrow
  {
    return this;
  }

  /**
      Creates a new #WebKitWebViewSessionState from serialized data.
  
      Params:
        data = a #GBytes
      Returns: a new #WebKitWebViewSessionState, or null if data doesn't contain a
            valid serialized #WebKitWebViewSessionState.
  */
  this(gid.glib2.bytes.Bytes data) nothrow
  {
    WebKitWebViewSessionState* _cretval;
    _cretval = webkit_web_view_session_state_new(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Serializes a #WebKitWebViewSessionState.
      Returns: a #GBytes containing the state serialized.
  */
  gid.glib2.bytes.Bytes serialize() nothrow
  {
    GBytes* _cretval;
    _cretval = webkit_web_view_session_state_serialize(cast(WebKitWebViewSessionState*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
