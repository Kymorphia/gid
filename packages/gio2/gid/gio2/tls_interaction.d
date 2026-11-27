/// Module for [TlsInteraction] class
module gid.gio2.tls_interaction;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.tls_connection;
import gid.gio2.tls_password;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.tls_interaction.TlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for passwords.
    
    To use a [gid.gio2.tls_interaction.TlsInteraction] with a TLS connection use
    [gid.gio2.tls_connection.TlsConnection.setInteraction].
    
    Callers should instantiate a derived class that implements the various
    interaction methods to show the required dialogs.
    
    Callers should use the 'invoke' functions like
    [gid.gio2.tls_interaction.TlsInteraction.invokeAskPassword] to run interaction methods.
    These functions make sure that the interaction is invoked in the main loop
    and not in the current thread, if the current thread is not running the
    main loop.
    
    Derived classes can choose to implement whichever interactions methods they’d
    like to support by overriding those virtual methods in their class
    initialization function. Any interactions not implemented will return
    [gid.gio2.types.TlsInteractionResult.Unhandled]. If a derived class implements an async method,
    it must also implement the corresponding finish method.
*/
@gidGir("TlsInteraction", "TlsInteractionClass")
class TlsInteraction : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_tls_interaction_get_type != &gidSymbolNotFound ? g_tls_interaction_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GTlsInteraction";
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsInteraction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.tls_interaction.TlsInteraction]
      Returns: New builder object
  */
  static TlsInteractionGidBuilder builder() nothrow
  {
    return new TlsInteractionGidBuilder;
  }

  /**
      Run synchronous interaction to ask the user for a password. In general,
      [gid.gio2.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAskPassword` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsInteractionResult vfuncAskPassword(gid.gio2.tls_password.TlsPassword password, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.askPassword)
      return typeof(return).init;

    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = _klass.askPassword(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a password. In general,
      [gid.gio2.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
      
      Certain implementations may not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
        callback = will be called when the interaction completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAskPasswordAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncAskPasswordAsync(gid.gio2.tls_password.TlsPassword password, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.askPasswordAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.askPasswordAsync(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an ask password user interaction request. This should be once
      the [gid.gio2.tls_interaction.TlsInteraction.askPasswordAsync] completion callback is called.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsPassword passed
      to [gid.gio2.tls_interaction.TlsInteraction.askPassword] will have its password filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAskPasswordFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsInteractionResult vfuncAskPasswordFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.askPasswordFinish)
      return typeof(return).init;

    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = _klass.askPasswordFinish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run synchronous interaction to ask the user to choose a certificate to use
      with the connection. In general, [gid.gio2.tls_interaction.TlsInteraction.invokeRequestCertificate]
      should be used instead of this function.
      
      Derived subclasses usually implement a certificate selector, although they may
      also choose to provide a certificate from elsewhere. Alternatively the user may
      abort this certificate request, which will usually abort the TLS connection.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gid.gio2.tls_interaction.TlsInteraction.requestCertificate] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRequestCertificate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsInteractionResult vfuncRequestCertificate(gid.gio2.tls_connection.TlsConnection connection, gid.gio2.types.TlsCertificateRequestFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.requestCertificate)
      return typeof(return).init;

    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = _klass.requestCertificate(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a certificate to use with
      the connection. In general, [gid.gio2.tls_interaction.TlsInteraction.invokeRequestCertificate] should
      be used instead of this function.
      
      Derived subclasses usually implement a certificate selector, although they may
      also choose to provide a certificate from elsewhere. callback will be called
      when the operation completes. Alternatively the user may abort this certificate
      request, which will usually abort the TLS connection.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
        callback = will be called when the interaction completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRequestCertificateAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncRequestCertificateAsync(gid.gio2.tls_connection.TlsConnection connection, gid.gio2.types.TlsCertificateRequestFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.requestCertificateAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.requestCertificateAsync(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete a request certificate user interaction request. This should be once
      the [gid.gio2.tls_interaction.TlsInteraction.requestCertificateAsync] completion callback is called.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gid.gio2.tls_interaction.TlsInteraction.requestCertificateAsync] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRequestCertificateFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsInteractionResult vfuncRequestCertificateFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsInteractionClass*)_vfuncClass;
    if (!_klass.requestCertificateFinish)
      return typeof(return).init;

    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = _klass.requestCertificateFinish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run synchronous interaction to ask the user for a password. In general,
      [gid.gio2.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult askPassword(gid.gio2.tls_password.TlsPassword password, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_ask_password(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a password. In general,
      [gid.gio2.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
      
      Certain implementations may not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
        callback = will be called when the interaction completes
  */
  void askPasswordAsync(gid.gio2.tls_password.TlsPassword password, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_interaction_ask_password_async(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an ask password user interaction request. This should be once
      the [gid.gio2.tls_interaction.TlsInteraction.askPasswordAsync] completion callback is called.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsPassword passed
      to [gid.gio2.tls_interaction.TlsInteraction.askPassword] will have its password filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult askPasswordFinish(gid.gio2.async_result.AsyncResult result)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_ask_password_finish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Invoke the interaction to ask the user for a password. It invokes this
      interaction in the main loop, specifically the #GMainContext returned by
      [gid.glib2.main_context.MainContext.getThreadDefault] when the interaction is created. This
      is called by called by #GTlsConnection or #GTlsDatabase to ask the user
      for a password.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      The implementation can either be a synchronous (eg: modal dialog) or an
      asynchronous one (eg: modeless dialog). This function will take care of
      calling which ever one correctly.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult invokeAskPassword(gid.gio2.tls_password.TlsPassword password, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_invoke_ask_password(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Invoke the interaction to ask the user to choose a certificate to
      use with the connection. It invokes this interaction in the main
      loop, specifically the #GMainContext returned by
      [gid.glib2.main_context.MainContext.getThreadDefault] when the interaction is
      created. This is called by called by #GTlsConnection when the peer
      requests a certificate during the handshake.
      
      Derived subclasses usually implement a certificate selector,
      although they may also choose to provide a certificate from
      elsewhere. Alternatively the user may abort this certificate
      request, which may or may not abort the TLS connection.
      
      The implementation can either be a synchronous (eg: modal dialog) or an
      asynchronous one (eg: modeless dialog). This function will take care of
      calling which ever one correctly.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the certificate request interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult invokeRequestCertificate(gid.gio2.tls_connection.TlsConnection connection, gid.gio2.types.TlsCertificateRequestFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_invoke_request_certificate(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run synchronous interaction to ask the user to choose a certificate to use
      with the connection. In general, [gid.gio2.tls_interaction.TlsInteraction.invokeRequestCertificate]
      should be used instead of this function.
      
      Derived subclasses usually implement a certificate selector, although they may
      also choose to provide a certificate from elsewhere. Alternatively the user may
      abort this certificate request, which will usually abort the TLS connection.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gid.gio2.tls_interaction.TlsInteraction.requestCertificate] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult requestCertificate(gid.gio2.tls_connection.TlsConnection connection, gid.gio2.types.TlsCertificateRequestFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_request_certificate(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a certificate to use with
      the connection. In general, [gid.gio2.tls_interaction.TlsInteraction.invokeRequestCertificate] should
      be used instead of this function.
      
      Derived subclasses usually implement a certificate selector, although they may
      also choose to provide a certificate from elsewhere. callback will be called
      when the operation completes. Alternatively the user may abort this certificate
      request, which will usually abort the TLS connection.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
        callback = will be called when the interaction completes
  */
  void requestCertificateAsync(gid.gio2.tls_connection.TlsConnection connection, gid.gio2.types.TlsCertificateRequestFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_interaction_request_certificate_async(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete a request certificate user interaction request. This should be once
      the [gid.gio2.tls_interaction.TlsInteraction.requestCertificateAsync] completion callback is called.
      
      If [gid.gio2.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gid.gio2.tls_interaction.TlsInteraction.requestCertificateAsync] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gid.gio2.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gid.gio2.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsInteractionResult requestCertificateFinish(gid.gio2.async_result.AsyncResult result)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_request_certificate_finish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsInteractionResult _retval = cast(gid.gio2.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TlsInteraction
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.tls_interaction.TlsInteraction), T.stringof ~ " is not derived from gid.gio2.tls_interaction.TlsInteraction");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAskPassword", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      _installVfunc(klass, "ask_password");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAskPasswordAsync", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      static assert(0, "Overriding gid.gio2.tls_interaction.TlsInteraction.vfuncAskPasswordAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAskPasswordFinish", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      _installVfunc(klass, "ask_password_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRequestCertificate", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      _installVfunc(klass, "request_certificate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRequestCertificateAsync", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      static assert(0, "Overriding gid.gio2.tls_interaction.TlsInteraction.vfuncRequestCertificateAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRequestCertificateFinish", true)[0]) == gid.gio2.tls_interaction.TlsInteraction))
      _installVfunc(klass, "request_certificate_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GTlsInteractionClass*)klass;

    switch (vfunc)
    {
      case "ask_password":
      {
        static extern(C) GTlsInteractionResult _vfuncAskPasswordTramp(GTlsInteraction* interaction, GTlsPassword* password, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_interaction.TlsInteraction)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interaction);
          if (!_obj)
          {
            auto _klass = cast(GTlsInteractionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interaction);
            if (_klass.askPassword)
              return (cast(typeof(&_vfuncAskPasswordTramp))_klass.askPassword)(interaction, password, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsInteractionResult _dretval;

          try
          {
            _dretval = _obj.vfuncAskPassword(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_password.TlsPassword)(cast(void*)password, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsInteractionResult)_dretval;

          return _retval;
        }

        _klass.askPassword = cast(typeof(_klass.askPassword))&_vfuncAskPasswordTramp;
        break;
      }
      case "ask_password_finish":
      {
        static extern(C) GTlsInteractionResult _vfuncAskPasswordFinishTramp(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_interaction.TlsInteraction)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interaction);
          if (!_obj)
          {
            auto _klass = cast(GTlsInteractionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interaction);
            if (_klass.askPasswordFinish)
              return (cast(typeof(&_vfuncAskPasswordFinishTramp))_klass.askPasswordFinish)(interaction, result, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsInteractionResult _dretval;

          try
          {
            _dretval = _obj.vfuncAskPasswordFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsInteractionResult)_dretval;

          return _retval;
        }

        _klass.askPasswordFinish = cast(typeof(_klass.askPasswordFinish))&_vfuncAskPasswordFinishTramp;
        break;
      }
      case "request_certificate":
      {
        static extern(C) GTlsInteractionResult _vfuncRequestCertificateTramp(GTlsInteraction* interaction, GTlsConnection* connection, GTlsCertificateRequestFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_interaction.TlsInteraction)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interaction);
          if (!_obj)
          {
            auto _klass = cast(GTlsInteractionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interaction);
            if (_klass.requestCertificate)
              return (cast(typeof(&_vfuncRequestCertificateTramp))_klass.requestCertificate)(interaction, connection, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsInteractionResult _dretval;

          try
          {
            _dretval = _obj.vfuncRequestCertificate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_connection.TlsConnection)(cast(void*)connection, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsInteractionResult)_dretval;

          return _retval;
        }

        _klass.requestCertificate = cast(typeof(_klass.requestCertificate))&_vfuncRequestCertificateTramp;
        break;
      }
      case "request_certificate_finish":
      {
        static extern(C) GTlsInteractionResult _vfuncRequestCertificateFinishTramp(GTlsInteraction* interaction, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_interaction.TlsInteraction)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interaction);
          if (!_obj)
          {
            auto _klass = cast(GTlsInteractionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interaction);
            if (_klass.requestCertificateFinish)
              return (cast(typeof(&_vfuncRequestCertificateFinishTramp))_klass.requestCertificateFinish)(interaction, result, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsInteractionResult _dretval;

          try
          {
            _dretval = _obj.vfuncRequestCertificateFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsInteractionResult)_dretval;

          return _retval;
        }

        _klass.requestCertificateFinish = cast(typeof(_klass.requestCertificateFinish))&_vfuncRequestCertificateFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_interaction.TlsInteraction]
class TlsInteractionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.tls_interaction.TlsInteraction]
final class TlsInteractionGidBuilder : TlsInteractionGidBuilderImpl!TlsInteractionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TlsInteraction build() nothrow
  {
    return new TlsInteraction(cast(void*)createGObject(TlsInteraction._getGType), Yes.Take);
  }
}
