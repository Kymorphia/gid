/// Module for [InternetAddressList] class
module gmime.internet_address_list;

import gid.gid;
import glib.string_;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.internet_address;
import gmime.parser_options;
import gmime.types;
import gobject.object;

/**
    A collection of #InternetAddress objects.
*/
class InternetAddressList : gobject.object.ObjectWrap
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
    return cast(void function())internet_address_list_get_type != &gidSymbolNotFound ? internet_address_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressList self()
  {
    return this;
  }

  /**
      Creates a new #InternetAddressList.
      Returns: a new #InternetAddressList.
  */
  this()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = internet_address_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Construct a list of internet addresses from the given string.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string containing internet addresses
      Returns: a #InternetAddressList or null if the
        input string does not contain any addresses.
  */
  static gmime.internet_address_list.InternetAddressList parse(gmime.parser_options.ParserOptions options, string str)
  {
    GMimeInternetAddressList* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = internet_address_list_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds an #InternetAddress to the #InternetAddressList.
  
      Params:
        ia = a #InternetAddress
      Returns: the index of the added #InternetAddress.
  */
  int add(gmime.internet_address.InternetAddress ia)
  {
    int _retval;
    _retval = internet_address_list_add(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Adds all of the addresses in append to list.
  
      Params:
        append = a #InternetAddressList
  */
  void append(gmime.internet_address_list.InternetAddressList append)
  {
    internet_address_list_append(cast(GMimeInternetAddressList*)this._cPtr, append ? cast(GMimeInternetAddressList*)append._cPtr(No.Dup) : null);
  }

  /**
      Adds all of the addresses in str to list.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string containing internet addresses
  */
  void appendParse(gmime.parser_options.ParserOptions options, string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    internet_address_list_append_parse(cast(GMimeInternetAddressList*)this._cPtr, options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
  }

  /**
      Clears the list of addresses.
  */
  void clear()
  {
    internet_address_list_clear(cast(GMimeInternetAddressList*)this._cPtr);
  }

  /**
      Checks whether or not the specified #InternetAddress is contained
      within the #InternetAddressList.
  
      Params:
        ia = a #InternetAddress
      Returns: true if the specified #InternetAddress is contained
        within the specified #InternetAddressList or false otherwise.
  */
  bool contains(gmime.internet_address.InternetAddress ia)
  {
    bool _retval;
    _retval = internet_address_list_contains(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Writes the rfc2047-encoded rfc822 formatted addresses in list to
      str, folding appropriately.
  
      Params:
        options = a #GMimeFormatOptions or null
        str = string to write to
  */
  void encode(gmime.format_options.FormatOptions options, glib.string_.String str)
  {
    internet_address_list_encode(cast(GMimeInternetAddressList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, str ? cast(GString*)str._cPtr(No.Dup) : null);
  }

  /**
      Gets the #InternetAddress at the specified index.
  
      Params:
        index = index of #InternetAddress to get
      Returns: the #InternetAddress at the specified
        index or null if the index is out of range.
  */
  gmime.internet_address.InternetAddress getAddress(int index)
  {
    GMimeInternetAddress* _cretval;
    _cretval = internet_address_list_get_address(cast(GMimeInternetAddressList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address.InternetAddress)(cast(GMimeInternetAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index of the specified #InternetAddress inside the
      #InternetAddressList.
  
      Params:
        ia = a #InternetAddress
      Returns: the index of the requested #InternetAddress within the
        #InternetAddressList or %-1 if it is not contained within the
        #InternetAddressList.
  */
  int indexOf(gmime.internet_address.InternetAddress ia)
  {
    int _retval;
    _retval = internet_address_list_index_of(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts an #InternetAddress into the #InternetAddressList at the
      specified index.
  
      Params:
        index = index to insert at
        ia = a #InternetAddress
  */
  void insert(int index, gmime.internet_address.InternetAddress ia)
  {
    internet_address_list_insert(cast(GMimeInternetAddressList*)this._cPtr, index, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #InternetAddress objects in the list.
  */
  int length()
  {
    int _retval;
    _retval = internet_address_list_length(cast(GMimeInternetAddressList*)this._cPtr);
    return _retval;
  }

  /**
      Inserts all of the addresses in prepend to the beginning of list.
  
      Params:
        prepend = a #InternetAddressList
  */
  void prepend(gmime.internet_address_list.InternetAddressList prepend)
  {
    internet_address_list_prepend(cast(GMimeInternetAddressList*)this._cPtr, prepend ? cast(GMimeInternetAddressList*)prepend._cPtr(No.Dup) : null);
  }

  /**
      Removes an #InternetAddress from the #InternetAddressList.
  
      Params:
        ia = a #InternetAddress
      Returns: true if the specified #InternetAddress was removed or
        false otherwise.
  */
  bool remove(gmime.internet_address.InternetAddress ia)
  {
    bool _retval;
    _retval = internet_address_list_remove(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes an #InternetAddress from the #InternetAddressList at the
      specified index.
  
      Params:
        index = index to remove
      Returns: true if an #InternetAddress was removed or false
        otherwise.
  */
  bool removeAt(int index)
  {
    bool _retval;
    _retval = internet_address_list_remove_at(cast(GMimeInternetAddressList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #InternetAddress at the specified index to ia.
  
      Params:
        index = index of #InternetAddress to set
        ia = a #InternetAddress
  */
  void setAddress(int index, gmime.internet_address.InternetAddress ia)
  {
    internet_address_list_set_address(cast(GMimeInternetAddressList*)this._cPtr, index, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
  }

  /**
      Allocates a string buffer containing the rfc822 formatted addresses
      in list.
  
      Params:
        options = a #GMimeFormatOptions or null
        encode = true if the address should be rfc2047 encoded
      Returns: a string containing the list of addresses in rfc822
        format or null if no addresses are contained in the list.
  */
  string toString_(gmime.format_options.FormatOptions options, bool encode)
  {
    char* _cretval;
    _cretval = internet_address_list_to_string(cast(GMimeInternetAddressList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, encode);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
