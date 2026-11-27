/// Module for [InternetAddressMailbox] class
module gid.gmime3.internet_address_mailbox;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.internet_address;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    An RFC 2822 Mailbox address.
*/
@gidGir("InternetAddressMailbox", "InternetAddressMailboxClass")
class InternetAddressMailbox : gid.gmime3.internet_address.InternetAddress
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
    return cast(void function())internet_address_mailbox_get_type != &gidSymbolNotFound ? internet_address_mailbox_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "InternetAddressMailbox";
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressMailbox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.internet_address_mailbox.InternetAddressMailbox]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeInternetAddress* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _addr = addr.toCString!(No.Malloc, No.Nullable);
      _cretval = internet_address_mailbox_new(_name, _addr);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the addr-spec of the internet address mailbox.
      Returns: the addr-spec string.
  */
  string getAddr() nothrow
  {
    const(char)* _cretval;
    _cretval = internet_address_mailbox_get_addr(cast(GMimeInternetAddressMailbox*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Set the mailbox address.
  
      Params:
        addr = contact's email address
  */
  void setAddr(string addr) nothrow
  {
    const(char)* _addr = addr.toCString!(No.Malloc, No.Nullable);
    internet_address_mailbox_set_addr(cast(GMimeInternetAddressMailbox*)this._cPtr, _addr);
  }
}

/// Fluent builder implementation template for [gid.gmime3.internet_address_mailbox.InternetAddressMailbox]
class InternetAddressMailboxGidBuilderImpl(T) : gid.gmime3.internet_address.InternetAddressGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.internet_address_mailbox.InternetAddressMailbox]
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
