/// Module for [SDPOrigin] class
module gstsdp.sdporigin;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "o=" field which gives the originator of the session
    (their username and the address of the user's host) plus a session id and
    session version number.
*/
class SDPOrigin : StructWrap!(GstSDPOrigin)
{
  /**
      Create a `sdporigin.SDPOrigin` wrap type.
      Params:
        username = the user's login on the originating host, or it is "-"
             if the originating host does not support the concept of user ids.
        sessId = is a numeric string such that the tuple of @username, @sess_id,
             @nettype, @addrtype and @addr form a globally unique identifier for the
             session.
        sessVersion = a version number for this announcement
        nettype = the type of network. "IN" is defined to have the meaning
             "Internet".
        addrtype = the type of @addr.
        addr = the globally unique address of the machine from which the session was
              created.
  */
  this(string username = string.init, string sessId = string.init, string sessVersion = string.init, string nettype = string.init, string addrtype = string.init, string addr = string.init) nothrow
  {
    this.username = username;
    this.sessId = sessId;
    this.sessVersion = sessVersion;
    this.nettype = nettype;
    this.addrtype = addrtype;
    this.addr = addr;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _usernameRef; // Keeps borrowed GC string alive

  /**
      Get `username` field.
      Returns: the user's login on the originating host, or it is "-"
           if the originating host does not support the concept of user ids.
  */
  @property string username() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).username);
  }

  /**
      Set `username` field.
      Params:
        propval = the user's login on the originating host, or it is "-"
             if the originating host does not support the concept of user ids.
  */
  @property void username(string propval) nothrow
  {
    if (_refuseBorrowedStore("username"))
      return;

    _usernameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).username = cast(char*)_usernameRef;
  }

  private const(char)* _sessIdRef; // Keeps borrowed GC string alive

  /**
      Get `sessId` field.
      Returns: is a numeric string such that the tuple of @username, @sess_id,
           @nettype, @addrtype and @addr form a globally unique identifier for the
           session.
  */
  @property string sessId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessId);
  }

  /**
      Set `sessId` field.
      Params:
        propval = is a numeric string such that the tuple of @username, @sess_id,
             @nettype, @addrtype and @addr form a globally unique identifier for the
             session.
  */
  @property void sessId(string propval) nothrow
  {
    if (_refuseBorrowedStore("sessId"))
      return;

    _sessIdRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).sessId = cast(char*)_sessIdRef;
  }

  private const(char)* _sessVersionRef; // Keeps borrowed GC string alive

  /**
      Get `sessVersion` field.
      Returns: a version number for this announcement
  */
  @property string sessVersion() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).sessVersion);
  }

  /**
      Set `sessVersion` field.
      Params:
        propval = a version number for this announcement
  */
  @property void sessVersion(string propval) nothrow
  {
    if (_refuseBorrowedStore("sessVersion"))
      return;

    _sessVersionRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).sessVersion = cast(char*)_sessVersionRef;
  }

  private const(char)* _nettypeRef; // Keeps borrowed GC string alive

  /**
      Get `nettype` field.
      Returns: the type of network. "IN" is defined to have the meaning
           "Internet".
  */
  @property string nettype() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).nettype);
  }

  /**
      Set `nettype` field.
      Params:
        propval = the type of network. "IN" is defined to have the meaning
             "Internet".
  */
  @property void nettype(string propval) nothrow
  {
    if (_refuseBorrowedStore("nettype"))
      return;

    _nettypeRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).nettype = cast(char*)_nettypeRef;
  }

  private const(char)* _addrtypeRef; // Keeps borrowed GC string alive

  /**
      Get `addrtype` field.
      Returns: the type of @addr.
  */
  @property string addrtype() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addrtype);
  }

  /**
      Set `addrtype` field.
      Params:
        propval = the type of @addr.
  */
  @property void addrtype(string propval) nothrow
  {
    if (_refuseBorrowedStore("addrtype"))
      return;

    _addrtypeRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).addrtype = cast(char*)_addrtypeRef;
  }

  private const(char)* _addrRef; // Keeps borrowed GC string alive

  /**
      Get `addr` field.
      Returns: the globally unique address of the machine from which the session was
            created.
  */
  @property string addr() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPOrigin*)this._cPtr).addr);
  }

  /**
      Set `addr` field.
      Params:
        propval = the globally unique address of the machine from which the session was
              created.
  */
  @property void addr(string propval) nothrow
  {
    if (_refuseBorrowedStore("addr"))
      return;

    _addrRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPOrigin*)this._cPtr).addr = cast(char*)_addrRef;
  }
}
