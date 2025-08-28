/// Module for [InternetAddressMailbox] class
module gmime.internet_address_mailbox;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address;
import gmime.types;

/**
    An RFC 2822 Mailbox address.
*/
class InternetAddressMailbox : gmime.internet_address.InternetAddress
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
    return cast(void function())internet_address_mailbox_get_type != &gidSymbolNotFound ? internet_address_mailbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressMailbox self()
  {
    return this;
  }

  /**
      Creates a new #InternetAddress object with the specified name and
      addr.
  
      Params:
        name = person's name
        addr = person's address
      Returns: a new #InternetAddressMailbox object.
        
        Note: The name string should be in UTF-8.
  */
  this(string name, string addr)
  {
    GMimeInternetAddress* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _addr = addr.toCString(No.Alloc);
    _cretval = internet_address_mailbox_new(_name, _addr);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the addr-spec of the internet address mailbox.
      Returns: the addr-spec string.
  */
  string getAddr()
  {
    const(char)* _cretval;
    _cretval = internet_address_mailbox_get_addr(cast(GMimeInternetAddressMailbox*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the IDN ascii-encoded addr-spec.
      Returns: the encoded addr-spec string.
  */
  string getIdnAddr()
  {
    const(char)* _cretval;
    _cretval = internet_address_mailbox_get_idn_addr(cast(GMimeInternetAddressMailbox*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the mailbox address.
  
      Params:
        addr = contact's email address
  */
  void setAddr(string addr)
  {
    const(char)* _addr = addr.toCString(No.Alloc);
    internet_address_mailbox_set_addr(cast(GMimeInternetAddressMailbox*)this._cPtr, _addr);
  }
}
