/// Module for [AutocryptHeader] class
module gmime.autocrypt_header;

import gid.gid;
import glib.bytes;
import glib.date_time;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address_mailbox;
import gmime.types;
import gobject.object;

/**
    An object containing Autocrypt information about a given e-mail
    address, as derived from a message header.
    
    See https://autocrypt.org/ for details and motivation.
*/
class AutocryptHeader : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_autocrypt_header_get_type != &gidSymbolNotFound ? g_mime_autocrypt_header_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AutocryptHeader self()
  {
    return this;
  }

  /**
      Creates a new #GMimeAutocryptHeader object.
      Returns: a new #GMimeAutocryptHeader object.
  */
  this()
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_autocrypt_header_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeAutocryptHeader object based on the value of an
      Autocrypt: header.
      
      Note that this will not have an effective_date set, since the
      effective_date is derived from the Date: line in the same block of
      e-mail headers, but cannot be extracted from the raw Autocrypt:
      header itself.
  
      Params:
        string_ = The raw string value of an Autocrypt header
      Returns: a new #GMimeAutocryptHeader object, or
        null on error.
  */
  static gmime.autocrypt_header.AutocryptHeader newFromString(string string_)
  {
    GMimeAutocryptHeader* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = g_mime_autocrypt_header_new_from_string(_string_);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      If address and type already match between src and dst, copy
      keydata, prefer_encrypt, effective_date from src to dst.
  
      Params:
        src = a #GMimeAutocryptHeader object
  */
  void clone(gmime.autocrypt_header.AutocryptHeader src)
  {
    g_mime_autocrypt_header_clone(cast(GMimeAutocryptHeader*)this._cPtr, src ? cast(GMimeAutocryptHeader*)src._cPtr(No.Dup) : null);
  }

  /**
      Compare two Autocrypt Headers.  This is useful for comparison, as well as for
      sorting headers by:
      
       $(LIST
          * address
          * effective_date
          * keydata
          * prefer_encrypt
       )
  
      Params:
        ah2 = a #GMimeAutocryptHeader object
      Returns: -1, 0, or 1 when ah1 is less than, equal to, or greater than ah2.
  */
  int compare(gmime.autocrypt_header.AutocryptHeader ah2)
  {
    int _retval;
    _retval = g_mime_autocrypt_header_compare(cast(GMimeAutocryptHeader*)this._cPtr, ah2 ? cast(GMimeAutocryptHeader*)ah2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the internal address of the Autocrypt header, or null if not set.
      Returns: the address associated with the Autocrypt header
  */
  gmime.internet_address_mailbox.InternetAddressMailbox getAddress()
  {
    GMimeInternetAddressMailbox* _cretval;
    _cretval = g_mime_autocrypt_header_get_address(cast(GMimeAutocryptHeader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_mailbox.InternetAddressMailbox)(cast(GMimeInternetAddressMailbox*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the internal address of the Autocrypt header as a C string, or null if not set.
      Returns: the address associated with the Autocrypt header
  */
  string getAddressAsString()
  {
    const(char)* _cretval;
    _cretval = g_mime_autocrypt_header_get_address_as_string(cast(GMimeAutocryptHeader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the effective date of the Autocrypt header, or null if not set.
      Returns: the effective date associated with the Autocrypt header
  */
  glib.date_time.DateTime getEffectiveDate()
  {
    GDateTime* _cretval;
    _cretval = g_mime_autocrypt_header_get_effective_date(cast(GMimeAutocryptHeader*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the raw keydata of the Autocrypt header, or null if not set.
      Returns: the raw key data associated with the Autocrypt header
  */
  glib.bytes.Bytes getKeydata()
  {
    GBytes* _cretval;
    _cretval = g_mime_autocrypt_header_get_keydata(cast(GMimeAutocryptHeader*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the encryption preference stated by the Autocrypt header.
      Returns: the encryption preference associated with the Autocrypt header
  */
  gmime.types.AutocryptPreferEncrypt getPreferEncrypt()
  {
    GMimeAutocryptPreferEncrypt _cretval;
    _cretval = g_mime_autocrypt_header_get_prefer_encrypt(cast(GMimeAutocryptHeader*)this._cPtr);
    gmime.types.AutocryptPreferEncrypt _retval = cast(gmime.types.AutocryptPreferEncrypt)_cretval;
    return _retval;
  }

  /**
      When dealing with Autocrypt headers derived from a message, some
      sender addresses will not have a legitimate/complete header
      associated with them.  When a given sender address has no complete
      header of a specific type, it should "reset" the state of the
      associated address.
      Returns: true if the header is complete, or false if it is incomplete.
  */
  bool isComplete()
  {
    bool _retval;
    _retval = g_mime_autocrypt_header_is_complete(cast(GMimeAutocryptHeader*)this._cPtr);
    return _retval;
  }

  /**
      Set the address associated with the autocrypt_header.
  
      Params:
        address = a #InternetAddressMailbox value
  */
  void setAddress(gmime.internet_address_mailbox.InternetAddressMailbox address)
  {
    g_mime_autocrypt_header_set_address(cast(GMimeAutocryptHeader*)this._cPtr, address ? cast(GMimeInternetAddressMailbox*)address._cPtr(No.Dup) : null);
  }

  /**
      Set the address associated with the autocrypt_header.
  
      Params:
        address = a null-terminated string that is a raw e-mail address
  */
  void setAddressFromString(string address)
  {
    const(char)* _address = address.toCString(No.Alloc);
    g_mime_autocrypt_header_set_address_from_string(cast(GMimeAutocryptHeader*)this._cPtr, _address);
  }

  /**
      Set the effective date associated with the Autocrypt header.
  
      Params:
        effectiveDate = a #GDateTime object
  */
  void setEffectiveDate(glib.date_time.DateTime effectiveDate)
  {
    g_mime_autocrypt_header_set_effective_date(cast(GMimeAutocryptHeader*)this._cPtr, effectiveDate ? cast(GDateTime*)effectiveDate._cPtr(No.Dup) : null);
  }

  /**
      Set the raw key data associated with the Autocrypt header.
  
      Params:
        keydata = a #GBytes object
  */
  void setKeydata(glib.bytes.Bytes keydata)
  {
    g_mime_autocrypt_header_set_keydata(cast(GMimeAutocryptHeader*)this._cPtr, keydata ? cast(GBytes*)keydata._cPtr(No.Dup) : null);
  }

  /**
      Set the encryption preference associated with the Autocrypt header.
  
      Params:
        pref = a #GMimeAutocryptPreferEncrypt value
  */
  void setPreferEncrypt(gmime.types.AutocryptPreferEncrypt pref)
  {
    g_mime_autocrypt_header_set_prefer_encrypt(cast(GMimeAutocryptHeader*)this._cPtr, pref);
  }

  /**
      Gets the string representation of the Autocrypt header, or null on
      error.  For example, it might return:
      
          prefer-encrypt=mutual; addr=bob\example.com; keydata=AAAB15BE...
      
      If you are using this object to populate an Autocrypt-Gossip
      header, you should set gossip to true (this will suppress
      inclusion of prefer-encrypt).
  
      Params:
        gossip = a #gboolean, indicating whether this header is for use with gossip
      Returns: the string representation of the
        Autocrypt header.
  */
  string toString_(bool gossip)
  {
    char* _cretval;
    _cretval = g_mime_autocrypt_header_to_string(cast(GMimeAutocryptHeader*)this._cPtr, gossip);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
