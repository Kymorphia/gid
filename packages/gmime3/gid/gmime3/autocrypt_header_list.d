/// Module for [AutocryptHeaderList] class
module gid.gmime3.autocrypt_header_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.autocrypt_header;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.internet_address_list;
import gid.gmime3.internet_address_mailbox;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A list of Autocrypt headers, typically extracted from a GMimeMessage.
*/
class AutocryptHeaderList : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_autocrypt_header_list_get_type != &gidSymbolNotFound ? g_mime_autocrypt_header_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeAutocryptHeaderList";
  }

  /** Returns `this`, for use in `with` statements. */
  override AutocryptHeaderList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.autocrypt_header_list.AutocryptHeaderList]
      Returns: New builder object
  */
  static AutocryptHeaderListGidBuilder builder() nothrow
  {
    return new AutocryptHeaderListGidBuilder;
  }

  /**
      Creates a new #GMimeAutocryptHeaderList object.
      Returns: a new #GMimeAutocryptHeaderList object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeAutocryptHeaderList* _cretval;
      _cretval = g_mime_autocrypt_header_list_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a the passed #GMimeAutocryptHeader to the list.
  
      Params:
        header = a #GMimeAutocryptHeader object
  */
  void add(gid.gmime3.autocrypt_header.AutocryptHeader header) nothrow
  {
    g_mime_autocrypt_header_list_add(cast(GMimeAutocryptHeaderList*)this._cPtr, header ? cast(GMimeAutocryptHeader*)header._cPtr(No.Dup) : null);
  }

  /**
      Adds a new incomplete #GMimeAutocryptHeader object for each
      InternetAddressMailbox found in #addresses.
  
      Params:
        addresses = an #InternetAddressList object
      Returns: the number of addresses added
  */
  uint addMissingAddresses(gid.gmime3.internet_address_list.InternetAddressList addresses) nothrow
  {
    uint _retval;
    _retval = g_mime_autocrypt_header_list_add_missing_addresses(cast(GMimeAutocryptHeaderList*)this._cPtr, addresses ? cast(GMimeInternetAddressList*)addresses._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      See how many Autocrypt headers are in the list.
      Returns: the number of available Autocrypt headers
  */
  uint getCount() nothrow
  {
    uint _retval;
    _retval = g_mime_autocrypt_header_list_get_count(cast(GMimeAutocryptHeaderList*)this._cPtr);
    return _retval;
  }

  /**
      Get the Nth header in the list (returns null on error, or if index is out of bounds)
  
      Params:
        index = an index into the list
      Returns: a pointer to the Nth header in the list.
  */
  gid.gmime3.autocrypt_header.AutocryptHeader getHeaderAt(uint index) nothrow
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_autocrypt_header_list_get_header_at(cast(GMimeAutocryptHeaderList*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the Autocrypt header corresponding to the given mailbox.
  
      Params:
        mailbox = an #InternetAddressMailbox object
      Returns: a pointer to the header in the list which
        matches the requested address, or null if no such header exists in
        the list.
  */
  gid.gmime3.autocrypt_header.AutocryptHeader getHeaderForAddress(gid.gmime3.internet_address_mailbox.InternetAddressMailbox mailbox) nothrow
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_autocrypt_header_list_get_header_for_address(cast(GMimeAutocryptHeaderList*)this._cPtr, mailbox ? cast(GMimeInternetAddressMailbox*)mailbox._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Remove all incomplete Autocrypt headers from the list.
  */
  void removeIncomplete() nothrow
  {
    g_mime_autocrypt_header_list_remove_incomplete(cast(GMimeAutocryptHeaderList*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gmime3.autocrypt_header_list.AutocryptHeaderList]
class AutocryptHeaderListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.autocrypt_header_list.AutocryptHeaderList]
final class AutocryptHeaderListGidBuilder : AutocryptHeaderListGidBuilderImpl!AutocryptHeaderListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AutocryptHeaderList build() nothrow
  {
    return new AutocryptHeaderList(cast(void*)createGObject(AutocryptHeaderList._getGType), Yes.Take);
  }
}
