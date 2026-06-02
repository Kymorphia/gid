/// Module for [InternetAddressMailbox] class
module gmime.internet_address_mailbox;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address;
import gmime.types;
import gobject.gid_builder;

/**
    An RFC 2822 Mailbox address.
*/
class InternetAddressMailbox : gmime.internet_address.InternetAddress
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())internet_address_mailbox_get_type != &gidSymbolNotFound ? internet_address_mailbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressMailbox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.internet_address_mailbox.InternetAddressMailbox]
      Returns: New builder object
  */
  static InternetAddressMailboxGidBuilder builder() nothrow
  {
    return new InternetAddressMailboxGidBuilder;
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
  this(string name, string addr) nothrow
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
  string getAddr() nothrow
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
  string getIdnAddr() nothrow
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
  void setAddr(string addr) nothrow
  {
    const(char)* _addr = addr.toCString(No.Alloc);
    internet_address_mailbox_set_addr(cast(GMimeInternetAddressMailbox*)this._cPtr, _addr);
  }
}

/// Fluent builder implementation template for [gmime.internet_address_mailbox.InternetAddressMailbox]
class InternetAddressMailboxGidBuilderImpl(T) : gmime.internet_address.InternetAddressGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.internet_address_mailbox.InternetAddressMailbox]
final class InternetAddressMailboxGidBuilder : InternetAddressMailboxGidBuilderImpl!InternetAddressMailboxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InternetAddressMailbox build() nothrow
  {
    return new InternetAddressMailbox(cast(void*)createGObject(InternetAddressMailbox._getGType), Yes.Take);
  }
}
