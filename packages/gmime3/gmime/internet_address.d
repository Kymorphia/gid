/// Module for [InternetAddress] class
module gmime.internet_address;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.types;
import gobject.object;

/**
    An RFC 2822 Address object.
*/
class InternetAddress : gobject.object.ObjectWrap
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
    return cast(void function())internet_address_get_type != &gidSymbolNotFound ? internet_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddress self()
  {
    return this;
  }

  /**
      Gets the charset to be used when encoding the name of the mailbox or group.
      Returns: the charset to be used when encoding the name of the
        mailbox or group if available or null otherwise.
  */
  string getCharset()
  {
    const(char)* _cretval;
    _cretval = internet_address_get_charset(cast(GMimeInternetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the display name of the #InternetAddress.
      Returns: the name of the mailbox or group in a form suitable
        for display if available or null otherwise. If the name is available,
        the returned string will be in UTF-8.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = internet_address_get_name(cast(GMimeInternetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the charset to use for encoding the name of the mailbox or group.
  
      Params:
        charset = the charset to use when encoding the name or null to use the defaults
  */
  void setCharset(string charset = null)
  {
    const(char)* _charset = charset.toCString(No.Alloc);
    internet_address_set_charset(cast(GMimeInternetAddress*)this._cPtr, _charset);
  }

  /**
      Set the display name of the #InternetAddress.
      
      Note: The name string should be in UTF-8.
  
      Params:
        name = the display name for the address group or mailbox
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    internet_address_set_name(cast(GMimeInternetAddress*)this._cPtr, _name);
  }

  /**
      Allocates a string containing the contents of the #InternetAddress
      object.
  
      Params:
        options = a #GMimeFormatOptions or null
        encode = true if the address should be rfc2047 encoded
      Returns: the #InternetAddress object as an allocated string in
        rfc822 format.
  */
  string toString_(gmime.format_options.FormatOptions options, bool encode)
  {
    char* _cretval;
    _cretval = internet_address_to_string(cast(GMimeInternetAddress*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, encode);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
