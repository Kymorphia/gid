/// Module for [Auth] class
module soup.auth;

import gid.gid;
import glib.uri;
import gobject.object;
import gobject.types;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.types;

/**
    The abstract base class for handling authentication.
    
    Specific HTTP Authentication mechanisms are implemented by its subclasses,
    but applications never need to be aware of the specific subclasses being
    used.
    
    #SoupAuth objects store the authentication data associated with a given bit
    of web space. They are created automatically by `class@Session`.
*/
class Auth : gobject.object.ObjectWrap
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
    return cast(void function())soup_auth_get_type != &gidSymbolNotFound ? soup_auth_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Auth self()
  {
    return this;
  }

  /**
      Get `authority` property.
      Returns: The authority (host:port) being authenticated to.
  */
  @property string authority()
  {
    return getAuthority();
  }

  /**
      Set `authority` property.
      Params:
        propval = The authority (host:port) being authenticated to.
  */
  @property void authority(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("authority", propval);
  }

  /**
      Get `realm` property.
      Returns: The authentication realm.
  */
  @property string realm()
  {
    return getRealm();
  }

  /**
      Set `realm` property.
      Params:
        propval = The authentication realm.
  */
  @property void realm(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("realm", propval);
  }

  /**
      Get `schemeName` property.
      Returns: The authentication scheme name.
  */
  @property string schemeName()
  {
    return getSchemeName();
  }

  /**
      Creates a new #SoupAuth of type type with the information from
      msg and auth_header.
      
      This is called by `classSession`; you will normally not create auths
      yourself.
  
      Params:
        type = the type of auth to create (a subtype of #SoupAuth)
        msg = the #SoupMessage the auth is being created for
        authHeader = the WWW-Authenticate/Proxy-Authenticate header
      Returns: the new #SoupAuth, or null if it could
          not be created
  */
  this(gobject.types.GType type, soup.message.Message msg, string authHeader)
  {
    SoupAuth* _cretval;
    const(char)* _authHeader = authHeader.toCString(No.Alloc);
    _cretval = soup_auth_new(type, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _authHeader);
    this(_cretval, Yes.Take);
  }

  /**
      Call this on an auth to authenticate it.
      
      Normally this will cause the auth's message to be requeued with the new
      authentication info.
  
      Params:
        username = the username provided by the user or client
        password = the password provided by the user or client
  */
  void authenticate(string username, string password)
  {
    const(char)* _username = username.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    soup_auth_authenticate(cast(SoupAuth*)this._cPtr, _username, _password);
  }

  /**
      Tests if auth is able to authenticate by providing credentials to the
      [soup.auth.Auth.authenticate].
      Returns: true if auth is able to accept credentials.
  */
  bool canAuthenticate()
  {
    bool _retval;
    _retval = cast(bool)soup_auth_can_authenticate(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Call this on an auth to cancel it.
      
      You need to cancel an auth to complete an asynchronous authenticate operation
      when no credentials are provided ([soup.auth.Auth.authenticate] is not called).
      The #SoupAuth will be cancelled on dispose if it hans't been authenticated.
  */
  void cancel()
  {
    soup_auth_cancel(cast(SoupAuth*)this._cPtr);
  }

  /**
      Returns the authority (host:port) that auth is associated with.
      Returns: the authority
  */
  string getAuthority()
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_authority(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Generates an appropriate "Authorization" header for msg.
      
      (The session will only call this if [soup.auth.Auth.isAuthenticated] returned
      true.)
  
      Params:
        msg = the #SoupMessage to be authorized
      Returns: the "Authorization" header, which must be freed.
  */
  string getAuthorization(soup.message.Message msg)
  {
    char* _cretval;
    _cretval = soup_auth_get_authorization(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets an opaque identifier for auth.
      
      The identifier can be used as a hash key or the like. #SoupAuth objects from
      the same server with the same identifier refer to the same authentication
      domain (eg, the URLs associated with them take the same usernames and
      passwords).
      Returns: the identifier
  */
  string getInfo()
  {
    char* _cretval;
    _cretval = soup_auth_get_info(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns a list of paths on the server which auth extends over.
      
      (All subdirectories of these paths are also assumed to be part
      of auth's protection space, unless otherwise discovered not to
      be.)
  
      Params:
        sourceUri = the URI of the request that auth was generated in
            response to.
      Returns: the list of
          paths, which can be freed with [soup.auth.Auth.freeProtectionSpace].
  */
  string[] getProtectionSpace(glib.uri.Uri sourceUri)
  {
    GSList* _cretval;
    _cretval = soup_auth_get_protection_space(cast(SoupAuth*)this._cPtr, sourceUri ? cast(GUri*)sourceUri._cPtr(No.Dup) : null);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns auth's realm.
      
      This is an identifier that distinguishes separate authentication spaces on a
      given server, and may be some string that is meaningful to the user.
      (Although it is probably not localized.)
      Returns: the realm name
  */
  string getRealm()
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_realm(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      soup_auth_get_scheme_name: (attributes org.gtk.Method.get_property=scheme-name)
      Returns auth's scheme name. (Eg, "Basic", "Digest", or "NTLM")
      Returns: the scheme name
  */
  string getSchemeName()
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_scheme_name(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Tests if auth has been given a username and password.
      Returns: true if auth has been given a username and password
  */
  bool isAuthenticated()
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_authenticated(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests if auth has been cancelled
      Returns: true if auth has been cancelled
  */
  bool isCancelled()
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_cancelled(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether or not auth is associated with a proxy server rather
      than an "origin" server.
      Returns: true or false
  */
  bool isForProxy()
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_for_proxy(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests if auth is ready to make a request for msg with.
      
      For most auths, this is equivalent to [soup.auth.Auth.isAuthenticated], but for
      some auth types (eg, NTLM), the auth may be sendable (eg, as an
      authentication request) even before it is authenticated.
  
      Params:
        msg = a #SoupMessage
      Returns: true if auth is ready to make a request with.
  */
  bool isReady(soup.message.Message msg)
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_ready(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates auth with the information from msg and auth_header,
      possibly un-authenticating it.
      
      As with [soup.auth.Auth.new_], this is normally only used by `classSession`.
  
      Params:
        msg = the #SoupMessage auth is being updated for
        authHeader = the WWW-Authenticate/Proxy-Authenticate header
      Returns: true if auth is still a valid (but potentially
          unauthenticated) #SoupAuth. false if something about auth_params
          could not be parsed or incorporated into auth at all.
  */
  bool update(soup.message.Message msg, string authHeader)
  {
    bool _retval;
    const(char)* _authHeader = authHeader.toCString(No.Alloc);
    _retval = cast(bool)soup_auth_update(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _authHeader);
    return _retval;
  }
}
