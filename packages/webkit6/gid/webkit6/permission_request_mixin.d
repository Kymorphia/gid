/// Module for [PermissionRequest] interface mixin
module gid.webkit6.permission_request_mixin;

public import gid.core.basictypes;
public import gid.webkit6.permission_request_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.webkit6.c.functions;
public import gid.webkit6.c.types;
public import gid.webkit6.types;

/**
    A permission request.
    
    There are situations where an embedder would need to ask the user
    for permission to do certain types of operations, such as switching
    to fullscreen mode or reporting the user's location through the
    standard Geolocation API. In those cases, WebKit will emit a
    #WebKitWebView::permission-request signal with a
    #WebKitPermissionRequest object attached to it.
*/
template PermissionRequestT()
{

  /**
      Allow the action which triggered this request.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAllow`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAllow()
  {
    auto _klass = cast(WebKitPermissionRequestInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.webkit6.permission_request.PermissionRequest._getGType);
    if (!_klass || !_klass.allow)
      return;

    _klass.allow(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /**
      Deny the action which triggered this request.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeny`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncDeny()
  {
    auto _klass = cast(WebKitPermissionRequestInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.webkit6.permission_request.PermissionRequest._getGType);
    if (!_klass || !_klass.deny)
      return;

    _klass.deny(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /**
      Allow the action which triggered this request.
  */
  override void allow() nothrow
  {
    webkit_permission_request_allow(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /**
      Deny the action which triggered this request.
  */
  override void deny() nothrow
  {
    webkit_permission_request_deny(cast(WebKitPermissionRequest*)this._cPtr);
  }

  /// True if the D class T overrides any vfunc method of gid.webkit6.permission_request.PermissionRequest (DiG)
  enum bool _ifaceVfuncsOverridden_gid_webkit6_permission_request_PermissionRequest(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAllow", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeny", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.webkit6.permission_request.PermissionRequest vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_webkit6_permission_request_PermissionRequest(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAllow", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_webkit6_permission_request_PermissionRequest(iface, "allow");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeny", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_webkit6_permission_request_PermissionRequest(iface, "deny");
  }

  private static void _installIfaceVfunc_gid_webkit6_permission_request_PermissionRequest(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(WebKitPermissionRequestInterface*)iface;

    switch (vfunc)
    {
      case "allow":
      {
        static extern(C) void _vfuncAllowTramp(WebKitPermissionRequest* request) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)request);
          if (!_obj)
          {
            auto _klass = cast(WebKitPermissionRequestInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)request), gid.webkit6.permission_request.PermissionRequest._getGType);
            if (_klass && _klass.allow)
              return (cast(typeof(&_vfuncAllowTramp))_klass.allow)(request);
            return;
          }

          try
          {
            _obj.vfuncAllow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.permission_request.PermissionRequest.vfuncAllow");
          }
        }

        _klass.allow = cast(typeof(_klass.allow))&_vfuncAllowTramp;
        break;
      }
      case "deny":
      {
        static extern(C) void _vfuncDenyTramp(WebKitPermissionRequest* request) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)request);
          if (!_obj)
          {
            auto _klass = cast(WebKitPermissionRequestInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)request), gid.webkit6.permission_request.PermissionRequest._getGType);
            if (_klass && _klass.deny)
              return (cast(typeof(&_vfuncDenyTramp))_klass.deny)(request);
            return;
          }

          try
          {
            _obj.vfuncDeny();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.permission_request.PermissionRequest.vfuncDeny");
          }
        }

        _klass.deny = cast(typeof(_klass.deny))&_vfuncDenyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.webkit6.permission_request.PermissionRequest]
template PermissionRequestGidBuilderT()
{
}
