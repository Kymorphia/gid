/// Module for [SecurityOrigin] class
module webkit.security_origin;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A security boundary for websites.
    
    #WebKitSecurityOrigin is a representation of a security domain
    defined by websites. A security origin consists of a protocol, a
    hostname, and an optional port number.
    
    Resources with the same security origin can generally access each
    other for client-side scripting or database access. When comparing
    origins, beware that if both protocol and host are null, the origins
    should not be treated as equal.
*/
class SecurityOrigin : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_security_origin_get_type != &gidSymbolNotFound ? webkit_security_origin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SecurityOrigin self()
  {
    return this;
  }

  /**
      Create a new security origin from the provided protocol, host and
      port.
  
      Params:
        protocol = The protocol for the new origin
        host = The host for the new origin
        port = The port number for the new origin, or 0 to indicate the
                 default port for protocol
      Returns: A #WebKitSecurityOrigin.
  */
  this(string protocol, string host, ushort port)
  {
    WebKitSecurityOrigin* _cretval;
    const(char)* _protocol = protocol.toCString(No.Alloc);
    const(char)* _host = host.toCString(No.Alloc);
    _cretval = webkit_security_origin_new(_protocol, _host, port);
    this(_cretval, Yes.Take);
  }

  /**
      Create a new security origin from the provided.
      
      Create a new security origin from the provided URI. Components of
      uri other than protocol, host, and port do not affect the created
      #WebKitSecurityOrigin.
  
      Params:
        uri = The URI for the new origin
      Returns: A #WebKitSecurityOrigin.
  */
  static webkit.security_origin.SecurityOrigin newForUri(string uri)
  {
    WebKitSecurityOrigin* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = webkit_security_origin_new_for_uri(_uri);
    auto _retval = _cretval ? new webkit.security_origin.SecurityOrigin(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the hostname of origin.
      
      It is reasonable for this to be null
      if its protocol does not require a host component.
      Returns: The host of the #WebKitSecurityOrigin
  */
  string getHost()
  {
    const(char)* _cretval;
    _cretval = webkit_security_origin_get_host(cast(WebKitSecurityOrigin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the port of origin.
      
      This function will always return 0 if the
      port is the default port for the given protocol. For example,
      http://example.com has the same security origin as
      http://example.com:80, and this function will return 0 for a
      #WebKitSecurityOrigin constructed from either URI.
      Returns: The port of the #WebKitSecurityOrigin.
  */
  ushort getPort()
  {
    ushort _retval;
    _retval = webkit_security_origin_get_port(cast(WebKitSecurityOrigin*)this._cPtr);
    return _retval;
  }

  /**
      Gets the protocol of origin.
      Returns: The protocol of the #WebKitSecurityOrigin
  */
  string getProtocol()
  {
    const(char)* _cretval;
    _cretval = webkit_security_origin_get_protocol(cast(WebKitSecurityOrigin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a string representation of origin.
      
      The string representation
      is a valid URI with only protocol, host, and port components, or
      null.
      Returns: a URI representing origin.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = webkit_security_origin_to_string(cast(WebKitSecurityOrigin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
