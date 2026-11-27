/// Module for [SocketAddressEnumerator] class
module gid.gio2.socket_address_enumerator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.socket_address;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] is an enumerator type for
    [gid.gio2.socket_address.SocketAddress] instances. It is returned by enumeration functions
    such as [gid.gio2.socket_connectable.SocketConnectable.enumerate], which returns a
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] to list each [gid.gio2.socket_address.SocketAddress] which could
    be used to connect to that [gid.gio2.socket_connectable.SocketConnectable].
    
    Enumeration is typically a blocking operation, so the asynchronous methods
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync] and
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextFinish] should be used where
    possible.
    
    Each [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] can only be enumerated once. Once
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] has returned `NULL`, further
    enumeration with that [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] is not possible, and it can
    be unreffed.
*/
@gidGir("SocketAddressEnumerator", "SocketAddressEnumeratorClass")
class SocketAddressEnumerator : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_socket_address_enumerator_get_type != &gidSymbolNotFound ? g_socket_address_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketAddressEnumerator";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAddressEnumerator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
      Returns: New builder object
  */
  static SocketAddressEnumeratorGidBuilder builder() nothrow
  {
    return new SocketAddressEnumeratorGidBuilder;
  }

  /**
      Retrieves the next #GSocketAddress from enumerator. Note that this
      may block for some amount of time. (Eg, a #GNetworkAddress may need
      to do a DNS lookup before it can return an address.) Use
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync] if you need to avoid
      blocking.
      
      If enumerator is expected to yield addresses, but for some reason
      is unable to (eg, because of a DNS error), then the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] will return an appropriate error
      in `*error`. However, if the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] succeeds, then any further
      internal errors (other than cancellable being triggered) will be
      ignored.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNext` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.socket_address.SocketAddress vfuncNext(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GSocketAddressEnumeratorClass*)_vfuncClass;
    if (!_klass.next)
      return typeof(return).init;

    GSocketAddress* _cretval;
    GError *_err;
    _cretval = _klass.next(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously retrieves the next #GSocketAddress from enumerator
      and then calls callback, which must call
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextFinish] to get the result.
      
      It is an error to call this multiple times before the previous callback has finished.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNextAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncNextAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GSocketAddressEnumeratorClass*)_vfuncClass;
    if (!_klass.nextAsync)
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
    _klass.nextAsync(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a completed call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync]. See
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] for more information about
      error handling.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNextFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.socket_address.SocketAddress vfuncNextFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GSocketAddressEnumeratorClass*)_vfuncClass;
    if (!_klass.nextFinish)
      return typeof(return).init;

    GSocketAddress* _cretval;
    GError *_err;
    _cretval = _klass.nextFinish(cast(GSocketAddressEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the next #GSocketAddress from enumerator. Note that this
      may block for some amount of time. (Eg, a #GNetworkAddress may need
      to do a DNS lookup before it can return an address.) Use
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync] if you need to avoid
      blocking.
      
      If enumerator is expected to yield addresses, but for some reason
      is unable to (eg, because of a DNS error), then the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] will return an appropriate error
      in `*error`. However, if the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] succeeds, then any further
      internal errors (other than cancellable being triggered) will be
      ignored.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress next(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously retrieves the next #GSocketAddress from enumerator
      and then calls callback, which must call
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextFinish] to get the result.
      
      It is an error to call this multiple times before the previous callback has finished.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  void nextAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_socket_address_enumerator_next_async(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a completed call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync]. See
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] for more information about
      error handling.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress nextFinish(gid.gio2.async_result.AsyncResult result)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next_finish(cast(GSocketAddressEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SocketAddressEnumerator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.socket_address_enumerator.SocketAddressEnumerator), T.stringof ~ " is not derived from gid.gio2.socket_address_enumerator.SocketAddressEnumerator");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNext", true)[0]) == gid.gio2.socket_address_enumerator.SocketAddressEnumerator))
      _installVfunc(klass, "next");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextAsync", true)[0]) == gid.gio2.socket_address_enumerator.SocketAddressEnumerator))
      static assert(0, "Overriding gid.gio2.socket_address_enumerator.SocketAddressEnumerator.vfuncNextAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextFinish", true)[0]) == gid.gio2.socket_address_enumerator.SocketAddressEnumerator))
      _installVfunc(klass, "next_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GSocketAddressEnumeratorClass*)klass;

    switch (vfunc)
    {
      case "next":
      {
        static extern(C) GSocketAddress* _vfuncNextTramp(GSocketAddressEnumerator* enumerator, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GSocketAddressEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.next)
              return (cast(typeof(&_vfuncNextTramp))_klass.next)(enumerator, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.socket_address.SocketAddress _dretval;

          try
          {
            _dretval = _obj.vfuncNext(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GSocketAddress*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.next = cast(typeof(_klass.next))&_vfuncNextTramp;
        break;
      }
      case "next_finish":
      {
        static extern(C) GSocketAddress* _vfuncNextFinishTramp(GSocketAddressEnumerator* enumerator, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(void*)enumerator);
          if (!_obj)
          {
            auto _klass = cast(GSocketAddressEnumeratorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)enumerator);
            if (_klass.nextFinish)
              return (cast(typeof(&_vfuncNextFinishTramp))_klass.nextFinish)(enumerator, result, _err);
            return typeof(return).init;
          }

          gid.gio2.socket_address.SocketAddress _dretval;

          try
          {
            _dretval = _obj.vfuncNextFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GSocketAddress*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.nextFinish = cast(typeof(_klass.nextFinish))&_vfuncNextFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
class SocketAddressEnumeratorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
final class SocketAddressEnumeratorGidBuilder : SocketAddressEnumeratorGidBuilderImpl!SocketAddressEnumeratorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketAddressEnumerator build() nothrow
  {
    return new SocketAddressEnumerator(cast(void*)createGObject(SocketAddressEnumerator._getGType), Yes.Take);
  }
}
