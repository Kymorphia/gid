/// Module for [WebViewSessionState] class
module webkit.web_view_session_state;

import gid.gid;
import glib.bytes;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Handles serialization of a web view's browsing state.
*/
class WebViewSessionState : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_web_view_session_state_get_type != &gidSymbolNotFound ? webkit_web_view_session_state_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebViewSessionState self()
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
  this(glib.bytes.Bytes data)
  {
    WebKitWebViewSessionState* _cretval;
    _cretval = webkit_web_view_session_state_new(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Serializes a #WebKitWebViewSessionState.
      Returns: a #GBytes containing the state serialized.
  */
  glib.bytes.Bytes serialize()
  {
    GBytes* _cretval;
    _cretval = webkit_web_view_session_state_serialize(cast(WebKitWebViewSessionState*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
