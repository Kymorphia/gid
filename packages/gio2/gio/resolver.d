/// Module for [Resolver] class
module gio.resolver;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.inet_address;
import gio.srv_target;
import gio.types;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
    The object that handles DNS resolution. Use [gio.resolver.Resolver.getDefault]
    to get the default resolver.
    
    [gio.resolver.Resolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames ([gio.resolver.Resolver.lookupByAddress],
    [gio.resolver.Resolver.lookupByName] and their async variants) and SRV
    (service) records ([gio.resolver.Resolver.lookupService]).
    
    [gio.network_address.NetworkAddress] and [gio.network_service.NetworkService] provide wrappers
    around [gio.resolver.Resolver] functionality that also implement
    [gio.socket_connectable.SocketConnectable], making it easy to connect to a remote
    host/service.
    
    The default resolver (see [gio.resolver.Resolver.getDefault]) has a timeout of
    30s set on it since GLib 2.78. Earlier versions of GLib did not support
    resolver timeouts.
    
    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations.
*/
class Resolver : gobject.object.ObjectWrap
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
    return cast(void function())g_resolver_get_type != &gidSymbolNotFound ? g_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Resolver self()
  {
    return this;
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
  @property uint timeout()
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
  @property void timeout(uint propval)
  {
    return setTimeout(propval);
  }

  /**
      Gets the default #GResolver. You should unref it when you are done
      with it. #GResolver may use its reference count as a hint about how
      many threads it should allocate for concurrent DNS resolutions.
      Returns: the default #GResolver.
  */
  static gio.resolver.Resolver getDefault()
  {
    GResolver* _cretval;
    _cretval = g_resolver_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.resolver.Resolver)(cast(GResolver*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the timeout applied to all resolver lookups. See #GResolver:timeout.
      Returns: the resolver timeout, in milliseconds, or `0` for no timeout
  */
  uint getTimeout()
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
      [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
            form), or null on error.
      Throws: [ErrorWrap]
  */
  string lookupByAddress(gio.inet_address.InetAddress address, gio.cancellable.Cancellable cancellable = null)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_address(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Begins asynchronously reverse-resolving address to determine its
      associated hostname, and eventually calls callback, which must
      call [gio.resolver.Resolver.lookupByAddressFinish] to get the final result.
  
      Params:
        address = the address to reverse-resolve
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByAddressAsync(gio.inet_address.InetAddress address, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_by_address_async(cast(GResolver*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gio.resolver.Resolver.lookupByAddressAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a hostname (either ASCII-only, or in ASCII-encoded
        form), or null on error.
      Throws: [ErrorWrap]
  */
  string lookupByAddressFinish(gio.async_result.AsyncResult result)
  {
    char* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_address_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Synchronously resolves hostname to determine its associated IP
      address(es). hostname may be an ASCII-only or UTF-8 hostname, or
      the textual form of an IP address (in which case this just becomes
      a wrapper around [gio.inet_address.InetAddress.newFromString]).
      
      On success, [gio.resolver.Resolver.lookupByName] will return a non-empty #GList of
      #GInetAddress, sorted in order of preference and guaranteed to not
      contain duplicates. That is, if using the result to connect to
      hostname, you should attempt to connect to the first address
      first, then the second if the first fails, etc. If you are using
      the result to listen on a socket, it is appropriate to add each
      result using e.g. [gio.socket_listener.SocketListener.addAddress].
      
      If the DNS resolution fails, error (if non-null) will be set to a
      value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gio.types.IOErrorEnum.Cancelled].
      
      If you are planning to connect to a socket on the resolved IP
      address, it may be easier to create a #GNetworkAddress and use its
      #GSocketConnectable interface.
  
      Params:
        hostname = the hostname to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gio.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  */
  gio.inet_address.InetAddress[] lookupByName(string hostname, gio.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _hostname = hostname.toCString(No.Alloc);
    GError *_err;
    _cretval = g_resolver_lookup_by_name(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gio.resolver.Resolver.lookupByNameFinish] to get the result.
      See [gio.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByNameAsync(string hostname, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _hostname = hostname.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_by_name_async(cast(GResolver*)this._cPtr, _hostname, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gio.resolver.Resolver.lookupByNameAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gio.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  */
  gio.inet_address.InetAddress[] lookupByNameFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_name_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      This differs from [gio.resolver.Resolver.lookupByName] in that you can modify
      the lookup behavior with flags. For example this can be used to limit
      results with [gio.types.ResolverNameLookupFlags.Ipv4Only].
  
      Params:
        hostname = the hostname to look up
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList
        of #GInetAddress, or null on error. You
        must unref each of the addresses and free the list when you are
        done with it. (You can use [gio.resolver.Resolver.freeAddresses] to do this.)
      Throws: [ErrorWrap]
  */
  gio.inet_address.InetAddress[] lookupByNameWithFlags(string hostname, gio.types.ResolverNameLookupFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _hostname = hostname.toCString(No.Alloc);
    GError *_err;
    _cretval = g_resolver_lookup_by_name_with_flags(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously resolving hostname to determine its
      associated IP address(es), and eventually calls callback, which
      must call [gio.resolver.Resolver.lookupByNameWithFlagsFinish] to get the result.
      See [gio.resolver.Resolver.lookupByName] for more details.
  
      Params:
        hostname = the hostname to look up the address of
        flags = extra #GResolverNameLookupFlags for the lookup
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupByNameWithFlagsAsync(string hostname, gio.types.ResolverNameLookupFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _hostname = hostname.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_by_name_with_flags_async(cast(GResolver*)this._cPtr, _hostname, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a call to
      [gio.resolver.Resolver.lookupByNameWithFlagsAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a #GList
        of #GInetAddress, or null on error. See [gio.resolver.Resolver.lookupByName]
        for more details.
      Throws: [ErrorWrap]
  */
  gio.inet_address.InetAddress[] lookupByNameWithFlagsFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_by_name_with_flags_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.inet_address.InetAddress, GidOwnership.Full)(cast(GList*)_cretval);
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
      [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [glib.list.List.freeFull] with
        [glib.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  */
  glib.variant.Variant[] lookupRecords(string rrname, gio.types.ResolverRecordType recordType, gio.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _rrname = rrname.toCString(No.Alloc);
    GError *_err;
    _cretval = g_resolver_lookup_records(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(glib.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously performing a DNS lookup for the given
      rrname, and eventually calls callback, which must call
      [gio.resolver.Resolver.lookupRecordsFinish] to get the final result. See
      [gio.resolver.Resolver.lookupRecords] for more details.
  
      Params:
        rrname = the DNS name to look up the record for
        recordType = the type of DNS record to look up
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupRecordsAsync(string rrname, gio.types.ResolverRecordType recordType, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _rrname = rrname.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_records_async(cast(GResolver*)this._cPtr, _rrname, recordType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gio.resolver.Resolver.lookupRecordsAsync]. Returns a non-empty list of records as
      #GVariant tuples. See #GResolverRecordType for information on what the
      records contain.
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GVariant, or null on error. You must free each of the records and the list
        when you are done with it. (You can use [glib.list.List.freeFull] with
        [glib.variant.Variant.unref] to do this.)
      Throws: [ErrorWrap]
  */
  glib.variant.Variant[] lookupRecordsFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_records_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(glib.variant.Variant, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Synchronously performs a DNS SRV lookup for the given service and
      protocol in the given domain and returns an array of #GSrvTarget.
      domain may be an ASCII-only or UTF-8 hostname. Note also that the
      service and protocol arguments do not include the leading underscore
      that appears in the actual DNS entry.
      
      On success, [gio.resolver.Resolver.lookupService] will return a non-empty #GList of
      #GSrvTarget, sorted in order of preference. (That is, you should
      attempt to connect to the first target first, then the second if
      the first fails, etc.)
      
      If the DNS resolution fails, error (if non-null) will be set to
      a value from #GResolverError and null will be returned.
      
      If cancellable is non-null, it can be used to cancel the
      operation, in which case error (if non-null) will be set to
      [gio.types.IOErrorEnum.Cancelled].
      
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
        list when you are done with it. (You can use [gio.resolver.Resolver.freeTargets] to do
        this.)
      Throws: [ErrorWrap]
  */
  gio.srv_target.SrvTarget[] lookupService(string service, string protocol, string domain, gio.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    const(char)* _service = service.toCString(No.Alloc);
    const(char)* _protocol = protocol.toCString(No.Alloc);
    const(char)* _domain = domain.toCString(No.Alloc);
    GError *_err;
    _cretval = g_resolver_lookup_service(cast(GResolver*)this._cPtr, _service, _protocol, _domain, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.srv_target.SrvTarget, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Begins asynchronously performing a DNS SRV lookup for the given
      service and protocol in the given domain, and eventually calls
      callback, which must call [gio.resolver.Resolver.lookupServiceFinish] to
      get the final result. See [gio.resolver.Resolver.lookupService] for more
      details.
  
      Params:
        service = the service type to look up (eg, "ldap")
        protocol = the networking protocol to use for service (eg, "tcp")
        domain = the DNS domain to look up the service in
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  void lookupServiceAsync(string service, string protocol, string domain, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _service = service.toCString(No.Alloc);
    const(char)* _protocol = protocol.toCString(No.Alloc);
    const(char)* _domain = domain.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_resolver_lookup_service_async(cast(GResolver*)this._cPtr, _service, _protocol, _domain, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a previous call to
      [gio.resolver.Resolver.lookupServiceAsync].
      
      If the DNS resolution failed, error (if non-null) will be set to
      a value from #GResolverError. If the operation was cancelled,
      error will be set to [gio.types.IOErrorEnum.Cancelled].
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: a non-empty #GList of
        #GSrvTarget, or null on error. See [gio.resolver.Resolver.lookupService] for more
        details.
      Throws: [ErrorWrap]
  */
  gio.srv_target.SrvTarget[] lookupServiceFinish(gio.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_resolver_lookup_service_finish(cast(GResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.srv_target.SrvTarget, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets resolver to be the application's default resolver (reffing
      resolver, and unreffing the previous default resolver, if any).
      Future calls to [gio.resolver.Resolver.getDefault] will return this resolver.
      
      This can be used if an application wants to perform any sort of DNS
      caching or "pinning"; it can implement its own #GResolver that
      calls the original default resolver for DNS operations, and
      implements its own cache policies on top of that, and then set
      itself as the default resolver for all later code to use.
  */
  void setDefault()
  {
    g_resolver_set_default(cast(GResolver*)this._cPtr);
  }

  /**
      Set the timeout applied to all resolver lookups. See #GResolver:timeout.
  
      Params:
        timeoutMs = timeout in milliseconds, or `0` for no timeouts
  */
  void setTimeout(uint timeoutMs)
  {
    g_resolver_set_timeout(cast(GResolver*)this._cPtr, timeoutMs);
  }

  /**
      Connect to `Reload` signal.
  
      Emitted when the resolver notices that the system resolver
        configuration has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.resolver.Resolver resolver))
  
          `resolver` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReload(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.resolver.Resolver)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reload", closure, after);
  }
}
