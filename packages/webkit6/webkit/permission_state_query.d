/// Module for [PermissionStateQuery] class
module webkit.permission_state_query;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.security_origin;
import webkit.types;

/**
    This query represents a user's choice to allow or deny access to "powerful features" of the
    platform, as specified in the [Permissions W3C
    Specification](https://w3c.github.io/permissions/).
    
    When signalled by the #WebKitWebView through the `query-permission-state` signal, the application
    has to eventually respond, via `[webkit.permission_state_query.PermissionStateQuery.finish]`, whether it grants,
    denies or requests a dedicated permission prompt for the given query.
    
    When a #WebKitPermissionStateQuery is not handled by the user, the user-agent is instructed to
    `prompt` the user for the given permission.
*/
class PermissionStateQuery : gobject.boxed.Boxed
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
    return cast(void function())webkit_permission_state_query_get_type != &gidSymbolNotFound ? webkit_permission_state_query_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PermissionStateQuery self()
  {
    return this;
  }

  /**
      Notify the web-engine of the selected permission state for the given query. This function should
      only be called as a response to the `WebKitWebView::query-permission-state` signal.
  
      Params:
        state = a #WebKitPermissionState
  */
  void finish(webkit.types.PermissionState state)
  {
    webkit_permission_state_query_finish(cast(WebKitPermissionStateQuery*)this._cPtr, state);
  }

  /**
      Get the permission name for which access is being queried.
      Returns: the permission name for query
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_permission_state_query_get_name(cast(WebKitPermissionStateQuery*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the permission origin for which access is being queried.
      Returns: A #WebKitSecurityOrigin representing the origin from which the
        query was emitted.
  */
  webkit.security_origin.SecurityOrigin getSecurityOrigin()
  {
    WebKitSecurityOrigin* _cretval;
    _cretval = webkit_permission_state_query_get_security_origin(cast(WebKitPermissionStateQuery*)this._cPtr);
    auto _retval = _cretval ? new webkit.security_origin.SecurityOrigin(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
