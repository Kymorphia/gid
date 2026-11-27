/// Module for [Resolver] class
module gid.gio2.resolver;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.inet_address;
import gid.gio2.srv_target;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The object that handles DNS resolution. Use [gid.gio2.resolver.Resolver.getDefault]
    to get the default resolver.
    
    [gid.gio2.resolver.Resolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames ([gid.gio2.resolver.Resolver.lookupByAddress],
    [gid.gio2.resolver.Resolver.lookupByName] and their async variants) and SRV
    (service) records ([gid.gio2.resolver.Resolver.lookupService]).
    
    [gid.gio2.network_address.NetworkAddress] and [gid.gio2.network_service.NetworkService] provide wrappers
    around [gid.gio2.resolver.Resolver] functionality that also implement
    [gid.gio2.socket_connectable.SocketConnectable], making it easy to connect to a remote
    host/service.
    
    The default resolver (see [gid.gio2.resolver.Resolver.getDefault]) has a timeout of
    30s set on it since GLib 2.78. Earlier versions of GLib did not support
    resolver timeouts.
    
    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations.
*/
@gidGir("Resolver", "ResolverClass")
class Resolver : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_resolver_get_type != &gidSymbolNotFound ? g_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GResolver";
  }

  /** Returns `this`, for use in `with` statements. */
  override Resolver self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.resolver.Resolver]
      Returns: New builder object
  */
  static ResolverGidBuilder builder() nothrow
  {
    return new ResolverGidBuilder;
  }

  /**
      Get `timeout` property.
      Returns: The timeout applied to all resolver lookups, in milliseconds.
        
        This may be changed through the lifetime of the #GResolver. The new value
        will apply to any lookups started after the change, but not to any
        already-ongoing lookups.
        
        If this is `0`, no timeout is applied to lookups.
        
        No timeout was applied to lookups before this property was added in
        GLib 2.78.
  */
  @property uint timeout() nothrow
  {
    return getTimeout();
  }

  /**
      Set `timeout` property.
      Params:
        propval = The timeout applied to all resolver lookups, in milliseconds.
          
          This may be changed through the lifetime of the #GResolver. The new value
          will apply to any lookups started after the change, but not to any
          already-ongoing lookups.
          
          If this is `0`, no timeout is applied to lookups.
          
          No timeout was applied to lookups before this property was added in
          GLib 2.78.
  */
  @property void timeout(uint propval) nothrow
  {
    setTimeout(propval);
  }

  /**
      Gets the default #GResolver. You should unref it when you are done
      with it. #GResolver may use its reference count as a hint about how
      many threads it should allocate for concurrent DNS resolutions.
      Returns: the default #GResolver.
  */
  static gid.gio2.resolver.Resolver getDefault() nothrow
  {
    GResolver* _cretval;
    _cretval = g_resolver_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.resolver.Resolver)(cast(GResolver*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Synchronously reverse-resolves address to determine its
      associated hostname.
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
            form), or null on error.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByAddress` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncLookupByAddress(gid.gio2.inet_address.InetAddress address, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByAddress)
      return typeof(return).init;

    char* _cretval;
    GError *_err;
    _cretval = _klass.lookupByAddress(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Begins asynchronously reverse-resolving address to determine its
      associated hostname, and eventually calls callback, which must
      call [gid.gio2.resolver.Resolver.lookupByAddressFinish] to get the final result.
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByAddressAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupByAddressAsync(gid.gio2.inet_address.InetAddress address, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByAddressAsync)
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
    _klass.lookupByAddressAsync(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupByAddressAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
        form), or null on error.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByAddressFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncLookupByAddressFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByAddressFinish)
      return typeof(return).init;

    char* _cretval;
    GError *_err;
    _cretval = _klass.lookupByAddressFinish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Synchronously resolves hostname to determine its associated IP
      address(es). hostname may be an ASCII-only or UTF-8 hostname, or
      the textual form of an IP address (in which case this just becomes
      a wrapper around [gid.gio2.inet_address.InetAddress.newFromString]).
      
      On success, [gid.gio2.resolver.Resolver.lookupByName] will return a non-empty #GList of
      #GInetAddress, sorted in order of preference and guaranteed to not
      contain duplicates. That is, if using the result to connect to
      hostname, you should attempt to connect to the first address
      first, then the second if the first fails, etc. If you are using
      the result to listen on a socket, it is appropriate to add each
      result using e.g. [gid.gio2.socket_listener.SocketListener.addAddress].
      
      If the DNS resolution fails, error (if non-null) will be set to a
      value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
      
      If you are planning to connect to a socket on the resolved IP
      address, it may be easier to create a #GNetworkAddress and use its
      #GSocketConnectable interface.
  
      Params:
        hostname = the hostname to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gid.gio2.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByName` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.inet_address.InetAddress[] vfuncLookupByName(string hostname, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByName)
      return typeof(return).init;

    GList* _cretval;
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.lookupByName(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gid.gio2.resolver.Resolver.lookupByNameFinish] to get the result.
      See [gid.gio2.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByNameAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupByNameAsync(string hostname, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByNameAsync)
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
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupByNameAsync(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gid.gio2.resolver.Resolver.lookupByNameAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gid.gio2.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByNameFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.inet_address.InetAddress[] vfuncLookupByNameFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByNameFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.lookupByNameFinish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      This differs from [gid.gio2.resolver.Resolver.lookupByName] in that you can modify
      the lookup behavior with flags. For example this can be used to limit
      results with [gid.gio2.types.ResolverNameLookupFlags.Ipv4Only].
  
      Params:
        hostname = the hostname to look up
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gid.gio2.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByNameWithFlags` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.inet_address.InetAddress[] vfuncLookupByNameWithFlags(string hostname, gid.gio2.types.ResolverNameLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByNameWithFlags)
      return typeof(return).init;

    GList* _cretval;
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.lookupByNameWithFlags(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gid.gio2.resolver.Resolver.lookupByNameWithFlagsFinish] to get the result.
      See [gid.gio2.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByNameWithFlagsAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupByNameWithFlagsAsync(string hostname, gid.gio2.types.ResolverNameLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByNameWithFlagsAsync)
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
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupByNameWithFlagsAsync(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gid.gio2.resolver.Resolver.lookupByNameWithFlagsAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gid.gio2.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupByNameWithFlagsFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.inet_address.InetAddress[] vfuncLookupByNameWithFlagsFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupByNameWithFlagsFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.lookupByNameWithFlagsFinish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Synchronously performs a DNS record lookup for the given rrname and returns
      a list of records as #GVariant tuples. See #GResolverRecordType for
      information on what the records contain for each record_type.
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [gid.glib2.list.List.freeFull] with
        [gid.glib2.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupRecords` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant[] vfuncLookupRecords(string rrname, gid.gio2.types.ResolverRecordType recordType, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupRecords)
      return typeof(return).init;

    GList* _cretval;
    const(char)* _rrname = rrname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.lookupRecords(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.glib2.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously performing a DNS lookup for the given
      rrname, and eventually calls callback, which must call
      [gid.gio2.resolver.Resolver.lookupRecordsFinish] to get the final result. See
      [gid.gio2.resolver.Resolver.lookupRecords] for more details.
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupRecordsAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupRecordsAsync(string rrname, gid.gio2.types.ResolverRecordType recordType, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupRecordsAsync)
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
    const(char)* _rrname = rrname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupRecordsAsync(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupRecordsAsync]. Returns a non-empty list of records as
      #GVariant tuples. See #GResolverRecordType for information on what the
      records contain.
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [gid.glib2.list.List.freeFull] with
        [gid.glib2.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupRecordsFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant[] vfuncLookupRecordsFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupRecordsFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.lookupRecordsFinish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.glib2.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  protected void vfuncLookupServiceAsync(string rrname, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupServiceAsync)
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
    const(char)* _rrname = rrname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupServiceAsync(cast(GResolver*)this._cPtr, _rrname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupServiceAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GSrvTarget, or null on error. See [gid.gio2.resolver.Resolver.lookupService] for more
        details.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupServiceFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.srv_target.SrvTarget[] vfuncLookupServiceFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.lookupServiceFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.lookupServiceFinish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.srv_target.SrvTarget, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  protected void vfuncReload()
  {
    auto _klass = cast(GResolverClass*)_vfuncClass;
    if (!_klass.reload)
      return;

    _klass.reload(cast(GResolver*)this._cPtr);
  }

  /**
      Get the timeout applied to all resolver lookups. See #GResolver:timeout.
      Returns: the resolver timeout, in milliseconds, or `0` for no timeout
  */
  uint getTimeout() nothrow
  {
    uint _retval;
    _retval = g_resolver_get_timeout(cast(GResolver*)this._cPtr);
    return _retval;
  }

  /**
      Synchronously reverse-resolves address to determine its
      associated hostname.
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
            form), or null on error.
      Throws: [ErrorWrap]
  */
  string lookupByAddress(gid.gio2.inet_address.InetAddress address, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_address(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Begins asynchronously reverse-resolving address to determine its
      associated hostname, and eventually calls callback, which must
      call [gid.gio2.resolver.Resolver.lookupByAddressFinish] to get the final result.
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByAddressAsync(gid.gio2.inet_address.InetAddress address, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_resolver_lookup_by_address_async(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupByAddressAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
        form), or null on error.
      Throws: [ErrorWrap]
  */
  string lookupByAddressFinish(gid.gio2.async_result.AsyncResult result)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_address_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Synchronously resolves hostname to determine its associated IP
      address(es). hostname may be an ASCII-only or UTF-8 hostname, or
      the textual form of an IP address (in which case this just becomes
      a wrapper around [gid.gio2.inet_address.InetAddress.newFromString]).
      
      On success, [gid.gio2.resolver.Resolver.lookupByName] will return a non-empty #GList of
      #GInetAddress, sorted in order of preference and guaranteed to not
      contain duplicates. That is, if using the result to connect to
      hostname, you should attempt to connect to the first address
      first, then the second if the first fails, etc. If you are using
      the result to listen on a socket, it is appropriate to add each
      result using e.g. [gid.gio2.socket_listener.SocketListener.addAddress].
      
      If the DNS resolution fails, error (if non-null) will be set to a
      value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
      
      If you are planning to connect to a socket on the resolved IP
      address, it may be easier to create a #GNetworkAddress and use its
      #GSocketConnectable interface.
  
      Params:
        hostname = the hostname to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gid.gio2.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  */
  gid.gio2.inet_address.InetAddress[] lookupByName(string hostname, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_resolver_lookup_by_name(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gid.gio2.resolver.Resolver.lookupByNameFinish] to get the result.
      See [gid.gio2.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByNameAsync(string hostname, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_by_name_async(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gid.gio2.resolver.Resolver.lookupByNameAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gid.gio2.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  */
  gid.gio2.inet_address.InetAddress[] lookupByNameFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_name_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      This differs from [gid.gio2.resolver.Resolver.lookupByName] in that you can modify
      the lookup behavior with flags. For example this can be used to limit
      results with [gid.gio2.types.ResolverNameLookupFlags.Ipv4Only].
  
      Params:
        hostname = the hostname to look up
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gid.gio2.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  */
  gid.gio2.inet_address.InetAddress[] lookupByNameWithFlags(string hostname, gid.gio2.types.ResolverNameLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_resolver_lookup_by_name_with_flags(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gid.gio2.resolver.Resolver.lookupByNameWithFlagsFinish] to get the result.
      See [gid.gio2.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByNameWithFlagsAsync(string hostname, gid.gio2.types.ResolverNameLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_by_name_with_flags_async(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gid.gio2.resolver.Resolver.lookupByNameWithFlagsAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gid.gio2.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  */
  gid.gio2.inet_address.InetAddress[] lookupByNameWithFlagsFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_name_with_flags_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Synchronously performs a DNS record lookup for the given rrname and returns
      a list of records as #GVariant tuples. See #GResolverRecordType for
      information on what the records contain for each record_type.
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [gid.glib2.list.List.freeFull] with
        [gid.glib2.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant[] lookupRecords(string rrname, gid.gio2.types.ResolverRecordType recordType, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _rrname = rrname.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_resolver_lookup_records(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.glib2.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously performing a DNS lookup for the given
      rrname, and eventually calls callback, which must call
      [gid.gio2.resolver.Resolver.lookupRecordsFinish] to get the final result. See
      [gid.gio2.resolver.Resolver.lookupRecords] for more details.
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupRecordsAsync(string rrname, gid.gio2.types.ResolverRecordType recordType, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _rrname = rrname.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_records_async(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupRecordsAsync]. Returns a non-empty list of records as
      #GVariant tuples. See #GResolverRecordType for information on what the
      records contain.
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [gid.glib2.list.List.freeFull] with
        [gid.glib2.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant[] lookupRecordsFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_records_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.glib2.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Synchronously performs a DNS SRV lookup for the given service and
      protocol in the given domain and returns an array of #GSrvTarget.
      domain may be an ASCII-only or UTF-8 hostname. Note also that the
      service and protocol arguments do not include the leading underscore
      that appears in the actual DNS entry.
      
      On success, [gid.gio2.resolver.Resolver.lookupService] will return a non-empty #GList of
      #GSrvTarget, sorted in order of preference. (That is, you should
      attempt to connect to the first target first, then the second if
      the first fails, etc.)
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gid.gio2.types.IOErrorEnum.Cancelled].
      
      If you are planning to connect to the service, it is usually easier
      to create a #GNetworkService and use its #GSocketConnectable
      interface.
  
      Params:
        service = the service type to look up (eg, "ldap")
        protocol = the networking protocol to use for service (eg, "tcp")
        domain = the DNS domain to look up the service in
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList of
        #GSrvTarget, or null on error. You must free each of the targets and the
        list when you are done with it. (You can use [gid.gio2.resolver.Resolver.freeTargets] to do
        this.)
      Throws: [ErrorWrap]
  */
  gid.gio2.srv_target.SrvTarget[] lookupService(string service, string protocol, string domain, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _service = service.toCString!(No.Malloc, No.Nullable);
    const(char)* _protocol = protocol.toCString!(No.Malloc, No.Nullable);
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_resolver_lookup_service(cast(GResolver*)this._cPtr, _service, _protocol, _domain, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.srv_target.SrvTarget, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously performing a DNS SRV lookup for the given
      service and protocol in the given domain, and eventually calls
      callback, which must call [gid.gio2.resolver.Resolver.lookupServiceFinish] to
      get the final result. See [gid.gio2.resolver.Resolver.lookupService] for more
      details.
  
      Params:
        service = the service type to look up (eg, "ldap")
        protocol = the networking protocol to use for service (eg, "tcp")
        domain = the DNS domain to look up the service in
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupServiceAsync(string service, string protocol, string domain, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _service = service.toCString!(No.Malloc, No.Nullable);
    const(char)* _protocol = protocol.toCString!(No.Malloc, No.Nullable);
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_service_async(cast(GResolver*)this._cPtr, _service, _protocol, _domain, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gid.gio2.resolver.Resolver.lookupServiceAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gid.gio2.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GSrvTarget, or null on error. See [gid.gio2.resolver.Resolver.lookupService] for more
        details.
      Throws: [ErrorWrap]
  */
  gid.gio2.srv_target.SrvTarget[] lookupServiceFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_service_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.srv_target.SrvTarget, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets resolver to be the application's default resolver (reffing
      resolver, and unreffing the previous default resolver, if any).
      Future calls to [gid.gio2.resolver.Resolver.getDefault] will return this resolver.
      
      This can be used if an application wants to perform any sort of DNS
      caching or "pinning"; it can implement its own #GResolver that
      calls the original default resolver for DNS operations, and
      implements its own cache policies on top of that, and then set
      itself as the default resolver for all later code to use.
  */
  void setDefault() nothrow
  {
    g_resolver_set_default(cast(GResolver*)this._cPtr);
  }

  /**
      Set the timeout applied to all resolver lookups. See #GResolver:timeout.
  
      Params:
        timeoutMs = timeout in milliseconds, or `0` for no timeouts
  */
  void setTimeout(uint timeoutMs) nothrow
  {
    g_resolver_set_timeout(cast(GResolver*)this._cPtr, timeoutMs);
  }

  /**
      Connect to `Reload` signal.
  
      Emitted when the resolver notices that the system resolver
        configuration has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.resolver.Resolver resolver)`
  
          `resolver` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReload(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.resolver.Resolver)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.resolver.Resolver.reload");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reload", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Resolver
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.resolver.Resolver), T.stringof ~ " is not derived from gid.gio2.resolver.Resolver");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByAddress", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_address");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByAddressAsync", true)[0]) == gid.gio2.resolver.Resolver))
      static assert(0, "Overriding gid.gio2.resolver.Resolver.vfuncLookupByAddressAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByAddressFinish", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_address_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByName", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_name");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByNameAsync", true)[0]) == gid.gio2.resolver.Resolver))
      static assert(0, "Overriding gid.gio2.resolver.Resolver.vfuncLookupByNameAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByNameFinish", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_name_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByNameWithFlags", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_name_with_flags");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByNameWithFlagsAsync", true)[0]) == gid.gio2.resolver.Resolver))
      static assert(0, "Overriding gid.gio2.resolver.Resolver.vfuncLookupByNameWithFlagsAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupByNameWithFlagsFinish", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_by_name_with_flags_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupRecords", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_records");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupRecordsAsync", true)[0]) == gid.gio2.resolver.Resolver))
      static assert(0, "Overriding gid.gio2.resolver.Resolver.vfuncLookupRecordsAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupRecordsFinish", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_records_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupServiceAsync", true)[0]) == gid.gio2.resolver.Resolver))
      static assert(0, "Overriding gid.gio2.resolver.Resolver.vfuncLookupServiceAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupServiceFinish", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "lookup_service_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReload", true)[0]) == gid.gio2.resolver.Resolver))
      _installVfunc(klass, "reload");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GResolverClass*)klass;

    switch (vfunc)
    {
      case "lookup_by_address":
      {
        static extern(C) char* _vfuncLookupByAddressTramp(GResolver* resolver, GInetAddress* address, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByAddress)
              return (cast(typeof(&_vfuncLookupByAddressTramp))_klass.lookupByAddress)(resolver, address, cancellable, _err);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncLookupByAddress(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(void*)address, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.lookupByAddress = cast(typeof(_klass.lookupByAddress))&_vfuncLookupByAddressTramp;
        break;
      }
      case "lookup_by_address_finish":
      {
        static extern(C) char* _vfuncLookupByAddressFinishTramp(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByAddressFinish)
              return (cast(typeof(&_vfuncLookupByAddressFinishTramp))_klass.lookupByAddressFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncLookupByAddressFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.lookupByAddressFinish = cast(typeof(_klass.lookupByAddressFinish))&_vfuncLookupByAddressFinishTramp;
        break;
      }
      case "lookup_by_name":
      {
        static extern(C) GList* _vfuncLookupByNameTramp(GResolver* resolver, const(char)* hostname, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByName)
              return (cast(typeof(&_vfuncLookupByNameTramp))_klass.lookupByName)(resolver, hostname, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.inet_address.InetAddress[] _dretval;
          string _hostname = hostname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookupByName(_hostname, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.inet_address.InetAddress)(_dretval);

          return _retval;
        }

        _klass.lookupByName = cast(typeof(_klass.lookupByName))&_vfuncLookupByNameTramp;
        break;
      }
      case "lookup_by_name_finish":
      {
        static extern(C) GList* _vfuncLookupByNameFinishTramp(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByNameFinish)
              return (cast(typeof(&_vfuncLookupByNameFinishTramp))_klass.lookupByNameFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          gid.gio2.inet_address.InetAddress[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupByNameFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.inet_address.InetAddress)(_dretval);

          return _retval;
        }

        _klass.lookupByNameFinish = cast(typeof(_klass.lookupByNameFinish))&_vfuncLookupByNameFinishTramp;
        break;
      }
      case "lookup_by_name_with_flags":
      {
        static extern(C) GList* _vfuncLookupByNameWithFlagsTramp(GResolver* resolver, const(char)* hostname, GResolverNameLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByNameWithFlags)
              return (cast(typeof(&_vfuncLookupByNameWithFlagsTramp))_klass.lookupByNameWithFlags)(resolver, hostname, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.inet_address.InetAddress[] _dretval;
          string _hostname = hostname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookupByNameWithFlags(_hostname, flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.inet_address.InetAddress)(_dretval);

          return _retval;
        }

        _klass.lookupByNameWithFlags = cast(typeof(_klass.lookupByNameWithFlags))&_vfuncLookupByNameWithFlagsTramp;
        break;
      }
      case "lookup_by_name_with_flags_finish":
      {
        static extern(C) GList* _vfuncLookupByNameWithFlagsFinishTramp(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupByNameWithFlagsFinish)
              return (cast(typeof(&_vfuncLookupByNameWithFlagsFinishTramp))_klass.lookupByNameWithFlagsFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          gid.gio2.inet_address.InetAddress[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupByNameWithFlagsFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.inet_address.InetAddress)(_dretval);

          return _retval;
        }

        _klass.lookupByNameWithFlagsFinish = cast(typeof(_klass.lookupByNameWithFlagsFinish))&_vfuncLookupByNameWithFlagsFinishTramp;
        break;
      }
      case "lookup_records":
      {
        static extern(C) GList* _vfuncLookupRecordsTramp(GResolver* resolver, const(char)* rrname, GResolverRecordType recordType, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupRecords)
              return (cast(typeof(&_vfuncLookupRecordsTramp))_klass.lookupRecords)(resolver, rrname, recordType, cancellable, _err);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant[] _dretval;
          string _rrname = rrname.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookupRecords(_rrname, recordType, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.glib2.variant.Variant)(_dretval);

          return _retval;
        }

        _klass.lookupRecords = cast(typeof(_klass.lookupRecords))&_vfuncLookupRecordsTramp;
        break;
      }
      case "lookup_records_finish":
      {
        static extern(C) GList* _vfuncLookupRecordsFinishTramp(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupRecordsFinish)
              return (cast(typeof(&_vfuncLookupRecordsFinishTramp))_klass.lookupRecordsFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupRecordsFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.glib2.variant.Variant)(_dretval);

          return _retval;
        }

        _klass.lookupRecordsFinish = cast(typeof(_klass.lookupRecordsFinish))&_vfuncLookupRecordsFinishTramp;
        break;
      }
      case "lookup_service_finish":
      {
        static extern(C) GList* _vfuncLookupServiceFinishTramp(GResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.lookupServiceFinish)
              return (cast(typeof(&_vfuncLookupServiceFinishTramp))_klass.lookupServiceFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          gid.gio2.srv_target.SrvTarget[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupServiceFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.srv_target.SrvTarget)(_dretval);

          return _retval;
        }

        _klass.lookupServiceFinish = cast(typeof(_klass.lookupServiceFinish))&_vfuncLookupServiceFinishTramp;
        break;
      }
      case "reload":
      {
        static extern(C) void _vfuncReloadTramp(GResolver* resolver) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.resolver.Resolver)(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GResolverClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver);
            if (_klass.reload)
              return (cast(typeof(&_vfuncReloadTramp))_klass.reload)(resolver);
            return;
          }

          try
          {
            _obj.vfuncReload();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.resolver.Resolver.vfuncReload");
          }
        }

        _klass.reload = cast(typeof(_klass.reload))&_vfuncReloadTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.resolver.Resolver]
class ResolverGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `timeout` property.
      Params:
        propval = The timeout applied to all resolver lookups, in milliseconds.
          
          This may be changed through the lifetime of the #GResolver. The new value
          will apply to any lookups started after the change, but not to any
          already-ongoing lookups.
          
          If this is `0`, no timeout is applied to lookups.
          
          No timeout was applied to lookups before this property was added in
          GLib 2.78.
      Returns: Builder instance for fluent chaining
  */
  T timeout(uint propval) nothrow
  {
    return setProperty("timeout", propval);
  }
}

/// Fluent builder for [gid.gio2.resolver.Resolver]
final class ResolverGidBuilder : ResolverGidBuilderImpl!ResolverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Resolver build() nothrow
  {
    return new Resolver(cast(void*)createGObject(Resolver._getGType), Yes.Take);
  }
}
