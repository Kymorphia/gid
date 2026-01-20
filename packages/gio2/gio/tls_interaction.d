/// Module for [TlsInteraction] class
module gio.tls_interaction;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.tls_connection;
import gio.tls_password;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.tls_interaction.TlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for passwords.
    
    To use a [gio.tls_interaction.TlsInteraction] with a TLS connection use
    [gio.tls_connection.TlsConnection.setInteraction].
    
    Callers should instantiate a derived class that implements the various
    interaction methods to show the required dialogs.
    
    Callers should use the 'invoke' functions like
    [gio.tls_interaction.TlsInteraction.invokeAskPassword] to run interaction methods.
    These functions make sure that the interaction is invoked in the main loop
    and not in the current thread, if the current thread is not running the
    main loop.
    
    Derived classes can choose to implement whichever interactions methods they’d
    like to support by overriding those virtual methods in their class
    initialization function. Any interactions not implemented will return
    [gio.types.TlsInteractionResult.Unhandled]. If a derived class implements an async method,
    it must also implement the corresponding finish method.
*/
class TlsInteraction : gobject.object.ObjectWrap
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
    return cast(void function())g_tls_interaction_get_type != &gidSymbolNotFound ? g_tls_interaction_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsInteraction self()
  {
    return this;
  }

  /**
      Run synchronous interaction to ask the user for a password. In general,
      [gio.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult askPassword(gio.tls_password.TlsPassword password, gio.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_ask_password(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a password. In general,
      [gio.tls_interaction.TlsInteraction.invokeAskPassword] should be used instead of this
      function.
      
      Derived subclasses usually implement a password prompt, although they may
      also choose to provide a password from elsewhere. The password value will
      be filled in and then callback will be called. Alternatively the user may
      abort this password request, which will usually abort the TLS connection.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
      
      Certain implementations may not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
        callback = will be called when the interaction completes
  */
  void askPasswordAsync(gio.tls_password.TlsPassword password, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_interaction_ask_password_async(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an ask password user interaction request. This should be once
      the [gio.tls_interaction.TlsInteraction.askPasswordAsync] completion callback is called.
      
      If [gio.types.TlsInteractionResult.Handled] is returned, then the #GTlsPassword passed
      to [gio.tls_interaction.TlsInteraction.askPassword] will have its password filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult askPasswordFinish(gio.async_result.AsyncResult result)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_ask_password_finish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Invoke the interaction to ask the user for a password. It invokes this
      interaction in the main loop, specifically the #GMainContext returned by
      [glib.main_context.MainContext.getThreadDefault] when the interaction is created. This
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
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        password = a #GTlsPassword object
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the ask password interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult invokeAskPassword(gio.tls_password.TlsPassword password, gio.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_invoke_ask_password(cast(GTlsInteraction*)this._cPtr, password ? cast(GTlsPassword*)password._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Invoke the interaction to ask the user to choose a certificate to
      use with the connection. It invokes this interaction in the main
      loop, specifically the #GMainContext returned by
      [glib.main_context.MainContext.getThreadDefault] when the interaction is
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
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the certificate request interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult invokeRequestCertificate(gio.tls_connection.TlsConnection connection, gio.types.TlsCertificateRequestFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_invoke_request_certificate(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run synchronous interaction to ask the user to choose a certificate to use
      with the connection. In general, [gio.tls_interaction.TlsInteraction.invokeRequestCertificate]
      should be used instead of this function.
      
      Derived subclasses usually implement a certificate selector, although they may
      also choose to provide a certificate from elsewhere. Alternatively the user may
      abort this certificate request, which will usually abort the TLS connection.
      
      If [gio.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gio.tls_interaction.TlsInteraction.requestCertificate] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code. Certain implementations may
      not support immediate cancellation.
  
      Params:
        connection = a #GTlsConnection object
        flags = flags providing more information about the request
        cancellable = an optional #GCancellable cancellation object
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult requestCertificate(gio.tls_connection.TlsConnection connection, gio.types.TlsCertificateRequestFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_request_certificate(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }

  /**
      Run asynchronous interaction to ask the user for a certificate to use with
      the connection. In general, [gio.tls_interaction.TlsInteraction.invokeRequestCertificate] should
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
  void requestCertificateAsync(gio.tls_connection.TlsConnection connection, gio.types.TlsCertificateRequestFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_interaction_request_certificate_async(cast(GTlsInteraction*)this._cPtr, connection ? cast(GTlsConnection*)connection._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete a request certificate user interaction request. This should be once
      the [gio.tls_interaction.TlsInteraction.requestCertificateAsync] completion callback is called.
      
      If [gio.types.TlsInteractionResult.Handled] is returned, then the #GTlsConnection
      passed to [gio.tls_interaction.TlsInteraction.requestCertificateAsync] will have had its
      #GTlsConnection:certificate filled in.
      
      If the interaction is cancelled by the cancellation object, or by the
      user then [gio.types.TlsInteractionResult.Failed] will be returned with an error that
      contains a [gio.types.IOErrorEnum.Cancelled] error code.
  
      Params:
        result = the result passed to the callback
      Returns: The status of the request certificate interaction.
      Throws: [ErrorWrap]
  */
  gio.types.TlsInteractionResult requestCertificateFinish(gio.async_result.AsyncResult result)
  {
    GTlsInteractionResult _cretval;
    GError *_err;
    _cretval = g_tls_interaction_request_certificate_finish(cast(GTlsInteraction*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    gio.types.TlsInteractionResult _retval = cast(gio.types.TlsInteractionResult)_cretval;
    return _retval;
  }
}
