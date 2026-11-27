/// Module for [URIHandler] interface mixin
module gid.gst1.urihandler_mixin;

public import gid.core.basictypes;
public import gid.gst1.urihandler;
public import gid.gst1.urihandler_iface_proxy;
public import gid.core.utils;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gst1.c.functions;
public import gid.gst1.c.types;
public import gid.gst1.types;

/**
    The #GstURIHandler is an interface that is implemented by Source and Sink
    #GstElement to unify handling of URI.
    
    An application can use the following functions to quickly get an element
    that handles the given URI for reading or writing
    ([gid.gst1.element.Element.makeFromUri]).
    
    Source and Sink plugins should implement this interface when possible.
*/
template URIHandlerT()
{

  /**
      Gets the currently handled URI.
      Returns: the URI currently handled by
          the handler.  Returns null if there are no URI currently
          handled. The returned string must be freed with [gid.glib2.global.gfree] when no
          longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUri()
  {
    auto _klass = cast(GstURIHandlerInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.urihandler.URIHandler._getGType);
    if (!_klass || !_klass.getUri)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUri(cast(GstURIHandler*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Tries to set the URI of the given handler.
  
      Params:
        uri = URI to set
      Returns: true if the URI was set successfully, else false.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetUri(string uri)
  {
    auto _klass = cast(GstURIHandlerInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gst1.urihandler.URIHandler._getGType);
    if (!_klass || !_klass.setUri)
      return typeof(return).init;

    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setUri(cast(GstURIHandler*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the list of protocols supported by handler. This list may not be
      modified.
      Returns: the
            supported protocols.  Returns null if the handler isn't
            implemented properly, or the handler doesn't support any
            protocols.
  */
  override string[] getProtocols() nothrow
  {
    const(char*)* _cretval;
    _cretval = gst_uri_handler_get_protocols(cast(GstURIHandler*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Gets the currently handled URI.
      Returns: the URI currently handled by
          the handler.  Returns null if there are no URI currently
          handled. The returned string must be freed with [gid.glib2.global.gfree] when no
          longer needed.
  */
  override string getUri() nothrow
  {
    char* _cretval;
    _cretval = gst_uri_handler_get_uri(cast(GstURIHandler*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the type of the given URI handler
      Returns: the #GstURIType of the URI handler.
        Returns #GST_URI_UNKNOWN if the handler isn't implemented correctly.
  */
  override gid.gst1.types.URIType getUriType() nothrow
  {
    GstURIType _cretval;
    _cretval = gst_uri_handler_get_uri_type(cast(GstURIHandler*)this._cPtr);
    gid.gst1.types.URIType _retval = cast(gid.gst1.types.URIType)_cretval;
    return _retval;
  }

  /**
      Tries to set the URI of the given handler.
  
      Params:
        uri = URI to set
      Returns: true if the URI was set successfully, else false.
      Throws: [ErrorWrap]
  */
  override bool setUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gst_uri_handler_set_uri(cast(GstURIHandler*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gst1.urihandler.URIHandler (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gst1_urihandler_URIHandler(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetUri", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gst1.urihandler.URIHandler vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gst1_urihandler_URIHandler(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_urihandler_URIHandler(iface, "get_uri");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gst1_urihandler_URIHandler(iface, "set_uri");
  }

  private static void _installIfaceVfunc_gid_gst1_urihandler_URIHandler(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstURIHandlerInterface*)iface;

    switch (vfunc)
    {
      case "get_uri":
      {
        static extern(C) char* _vfuncGetUriTramp(GstURIHandler* handler) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)handler);
          if (!_obj)
          {
            auto _klass = cast(GstURIHandlerInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)handler), gid.gst1.urihandler.URIHandler._getGType);
            if (_klass && _klass.getUri)
              return (cast(typeof(&_vfuncGetUriTramp))_klass.getUri)(handler);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUri();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.urihandler.URIHandler.vfuncGetUri");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUri = cast(typeof(_klass.getUri))&_vfuncGetUriTramp;
        break;
      }
      case "set_uri":
      {
        static extern(C) gboolean _vfuncSetUriTramp(GstURIHandler* handler, const(char)* uri, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)handler);
          if (!_obj)
          {
            auto _klass = cast(GstURIHandlerInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)handler), gid.gst1.urihandler.URIHandler._getGType);
            if (_klass && _klass.setUri)
              return (cast(typeof(&_vfuncSetUriTramp))_klass.setUri)(handler, uri, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetUri(_uri);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setUri = cast(typeof(_klass.setUri))&_vfuncSetUriTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.urihandler.URIHandler]
template URIHandlerGidBuilderT()
{
}
