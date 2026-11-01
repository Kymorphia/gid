/// Module for [WebViewSessionState] class
module webkit.web_view_session_state;

public import gid.basictypes;
import gid.gid;
import glib.bytes;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Handles serialization of a web view's browsing state.
*/
class WebViewSessionState : gobject.boxed.BoxedWrap!(webkit_web_view_session_state_get_type)
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
  this(glib.bytes.Bytes data) nothrow
  {
    WebKitWebViewSessionState* _cretval;
    _cretval = webkit_web_view_session_state_new(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Serializes a #WebKitWebViewSessionState.
      Returns: a #GBytes containing the state serialized.
  */
  glib.bytes.Bytes serialize() nothrow
  {
    GBytes* _cretval;
    _cretval = webkit_web_view_session_state_serialize(cast(WebKitWebViewSessionState*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
