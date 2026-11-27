/// Module for [InternetAddressList] class
module gid.gmime3.internet_address_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.string_;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.format_options;
import gid.gmime3.internet_address;
import gid.gmime3.parser_options;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A collection of #InternetAddress objects.
*/
@gidGir("InternetAddressList", "InternetAddressListClass")
class InternetAddressList : gid.gobject2.object.ObjectWrap
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
    return cast(void function())internet_address_list_get_type != &gidSymbolNotFound ? internet_address_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "InternetAddressList";
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddressList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.internet_address_list.InternetAddressList]
      Returns: New builder object
  */
  static InternetAddressListGidBuilder builder() nothrow
  {
    return new InternetAddressListGidBuilder;
  }

  /**
      Creates a new #InternetAddressList.
      Returns: a new #InternetAddressList.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeInternetAddressList* _cretval;
      _cretval = internet_address_list_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Construct a list of internet addresses from the given string.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string containing internet addresses
      Returns: a #InternetAddressList or null if the
        input string does not contain any addresses.
  */
  static gid.gmime3.internet_address_list.InternetAddressList parse(gid.gmime3.parser_options.ParserOptions options, string str) nothrow
  {
    GMimeInternetAddressList* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = internet_address_list_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds an #InternetAddress to the #InternetAddressList.
  
      Params:
        ia = a #InternetAddress
      Returns: the index of the added #InternetAddress.
  */
  int add(gid.gmime3.internet_address.InternetAddress ia) nothrow
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
  void append(gid.gmime3.internet_address_list.InternetAddressList append) nothrow
  {
    internet_address_list_append(cast(GMimeInternetAddressList*)this._cPtr, append ? cast(GMimeInternetAddressList*)append._cPtr(No.Dup) : null);
  }

  /**
      Adds all of the addresses in str to list.
  
      Params:
        options = a #GMimeParserOptions or null
        str = a string containing internet addresses
  */
  void appendParse(gid.gmime3.parser_options.ParserOptions options, string str) nothrow
  {
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    internet_address_list_append_parse(cast(GMimeInternetAddressList*)this._cPtr, options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _str);
  }

  /**
      Clears the list of addresses.
  */
  void clear() nothrow
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
  bool contains(gid.gmime3.internet_address.InternetAddress ia) nothrow
  {
    bool _retval;
    _retval = cast(bool)internet_address_list_contains(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Writes the rfc2047-encoded rfc822 formatted addresses in list to
      str, folding appropriately.
  
      Params:
        options = a #GMimeFormatOptions or null
        str = string to write to
  */
  void encode(gid.gmime3.format_options.FormatOptions options, gid.glib2.string_.String str) nothrow
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
  gid.gmime3.internet_address.InternetAddress getAddress(int index) nothrow
  {
    GMimeInternetAddress* _cretval;
    _cretval = internet_address_list_get_address(cast(GMimeInternetAddressList*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address.InternetAddress)(cast(GMimeInternetAddress*)_cretval, No.Take);
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
  int indexOf(gid.gmime3.internet_address.InternetAddress ia) nothrow
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
  void insert(int index, gid.gmime3.internet_address.InternetAddress ia) nothrow
  {
    internet_address_list_insert(cast(GMimeInternetAddressList*)this._cPtr, index, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
  }

  /**
      Gets the length of the list.
      Returns: the number of #InternetAddress objects in the list.
  */
  int length() nothrow
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
  void prepend(gid.gmime3.internet_address_list.InternetAddressList prepend) nothrow
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
  bool remove(gid.gmime3.internet_address.InternetAddress ia) nothrow
  {
    bool _retval;
    _retval = cast(bool)internet_address_list_remove(cast(GMimeInternetAddressList*)this._cPtr, ia ? cast(GMimeInternetAddress*)ia._cPtr(No.Dup) : null);
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
  bool removeAt(int index) nothrow
  {
    bool _retval;
    _retval = cast(bool)internet_address_list_remove_at(cast(GMimeInternetAddressList*)this._cPtr, index);
    return _retval;
  }

  /**
      Sets the #InternetAddress at the specified index to ia.
  
      Params:
        index = index of #InternetAddress to set
        ia = a #InternetAddress
  */
  void setAddress(int index, gid.gmime3.internet_address.InternetAddress ia) nothrow
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
  string toString_(gid.gmime3.format_options.FormatOptions options, bool encode) nothrow
  {
    char* _cretval;
    _cretval = internet_address_list_to_string(cast(GMimeInternetAddressList*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, encode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.internet_address_list.InternetAddressList]
class InternetAddressListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.internet_address_list.InternetAddressList]
final class InternetAddressListGidBuilder : InternetAddressListGidBuilderImpl!InternetAddressListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InternetAddressList build() nothrow
  {
    return new InternetAddressList(cast(void*)createGObject(InternetAddressList._getGType), Yes.Take);
  }
}
