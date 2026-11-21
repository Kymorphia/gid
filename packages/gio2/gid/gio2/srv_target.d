/// Module for [SrvTarget] class
module gid.gio2.srv_target;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.boxed;

/**
    A single target host/port that a network service is running on.
    
    SRV (service) records are used by some network protocols to provide
    service-specific aliasing and load-balancing. For example, XMPP
    (Jabber) uses SRV records to locate the XMPP server for a domain;
    rather than connecting directly to ‘example.com’ or assuming a
    specific server hostname like ‘xmpp.example.com’, an XMPP client
    would look up the `xmpp-client` SRV record for ‘example.com’, and
    then connect to whatever host was pointed to by that record.
    
    You can use [gid.gio2.resolver.Resolver.lookupService] or
    [gid.gio2.resolver.Resolver.lookupServiceAsync] to find the [gid.gio2.srv_target.SrvTarget]s
    for a given service. However, if you are simply planning to connect
    to the remote service, you can use [gid.gio2.network_service.NetworkService]’s
    [gid.gio2.socket_connectable.SocketConnectable] interface and not need to worry about
    [gid.gio2.srv_target.SrvTarget] at all.
*/
class SrvTarget : gid.gobject2.boxed.BoxedWrap!(g_srv_target_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override SrvTarget self() nothrow
  {
    return this;
  }

  /**
      Creates a new #GSrvTarget with the given parameters.
      
      You should not need to use this; normally #GSrvTargets are
      created by #GResolver.
  
      Params:
        hostname = the host that the service is running on
        port = the port that the service is running on
        priority = the target's priority
        weight = the target's weight
      Returns: a new #GSrvTarget.
  */
  this(string hostname, ushort port, ushort priority, ushort weight) nothrow
  {
    GSrvTarget* _cretval;
    const(char)* _hostname = hostname.toCString!(No.Malloc, No.Nullable);
    _cretval = g_srv_target_new(_hostname, port, priority, weight);
    this(_cretval, Yes.Take);
  }

  /**
      Copies target
      Returns: a copy of target
  */
  gid.gio2.srv_target.SrvTarget copy() nothrow
  {
    GSrvTarget* _cretval;
    _cretval = g_srv_target_copy(cast(GSrvTarget*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.srv_target.SrvTarget(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets target's hostname (in ASCII form; if you are going to present
      this to the user, you should use [gid.glib2.global.hostnameIsAsciiEncoded] to
      check if it contains encoded Unicode segments, and use
      [gid.glib2.global.hostnameToUnicode] to convert it if it does.)
      Returns: target's hostname
  */
  string getHostname() nothrow
  {
    const(char)* _cretval;
    _cretval = g_srv_target_get_hostname(cast(GSrvTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets target's port
      Returns: target's port
  */
  ushort getPort() nothrow
  {
    ushort _retval;
    _retval = g_srv_target_get_port(cast(GSrvTarget*)this._cPtr);
    return _retval;
  }

  /**
      Gets target's priority. You should not need to look at this;
      #GResolver already sorts the targets according to the algorithm in
      RFC 2782.
      Returns: target's priority
  */
  ushort getPriority() nothrow
  {
    ushort _retval;
    _retval = g_srv_target_get_priority(cast(GSrvTarget*)this._cPtr);
    return _retval;
  }

  /**
      Gets target's weight. You should not need to look at this;
      #GResolver already sorts the targets according to the algorithm in
      RFC 2782.
      Returns: target's weight
  */
  ushort getWeight() nothrow
  {
    ushort _retval;
    _retval = g_srv_target_get_weight(cast(GSrvTarget*)this._cPtr);
    return _retval;
  }
}
