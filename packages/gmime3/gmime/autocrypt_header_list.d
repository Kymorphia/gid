/// Module for [AutocryptHeaderList] class
module gmime.autocrypt_header_list;

import gid.gid;
import gmime.autocrypt_header;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address_list;
import gmime.internet_address_mailbox;
import gmime.types;
import gobject.object;

/**
    A list of Autocrypt headers, typically extracted from a GMimeMessage.
*/
class AutocryptHeaderList : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_autocrypt_header_list_get_type != &gidSymbolNotFound ? g_mime_autocrypt_header_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AutocryptHeaderList self()
  {
    return this;
  }

  /**
      Creates a new #GMimeAutocryptHeaderList object.
      Returns: a new #GMimeAutocryptHeaderList object.
  */
  this()
  {
    GMimeAutocryptHeaderList* _cretval;
    _cretval = g_mime_autocrypt_header_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a the passed #GMimeAutocryptHeader to the list.
  
      Params:
        header = a #GMimeAutocryptHeader object
  */
  void add(gmime.autocrypt_header.AutocryptHeader header)
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
  uint addMissingAddresses(gmime.internet_address_list.InternetAddressList addresses)
  {
    uint _retval;
    _retval = g_mime_autocrypt_header_list_add_missing_addresses(cast(GMimeAutocryptHeaderList*)this._cPtr, addresses ? cast(GMimeInternetAddressList*)addresses._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      See how many Autocrypt headers are in the list.
      Returns: the number of available Autocrypt headers
  */
  uint getCount()
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
  gmime.autocrypt_header.AutocryptHeader getHeaderAt(uint index)
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_autocrypt_header_list_get_header_at(cast(GMimeAutocryptHeaderList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, No.Take);
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
  gmime.autocrypt_header.AutocryptHeader getHeaderForAddress(gmime.internet_address_mailbox.InternetAddressMailbox mailbox)
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_autocrypt_header_list_get_header_for_address(cast(GMimeAutocryptHeaderList*)this._cPtr, mailbox ? cast(GMimeInternetAddressMailbox*)mailbox._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, No.Take);
    return _retval;
  }

  /**
      Remove all incomplete Autocrypt headers from the list.
  */
  void removeIncomplete()
  {
    g_mime_autocrypt_header_list_remove_incomplete(cast(GMimeAutocryptHeaderList*)this._cPtr);
  }
}
