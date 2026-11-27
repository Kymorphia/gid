/// Module for [InternetAddress] class
module gid.gmime3.internet_address;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.format_options;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An RFC 2822 Address object.
*/
@gidGir("InternetAddress", "InternetAddressClass")
class InternetAddress : gid.gobject2.object.ObjectWrap
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
    return cast(void function())internet_address_get_type != &gidSymbolNotFound ? internet_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "InternetAddress";
  }

  /** Returns `this`, for use in `with` statements. */
  override InternetAddress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.internet_address.InternetAddress]
      Returns: New builder object
  */
  static InternetAddressGidBuilder builder() nothrow
  {
    return new InternetAddressGidBuilder;
  }

  /**
      Gets the charset to be used when encoding the name of the mailbox or group.
      Returns: the charset to be used when encoding the name of the
        mailbox or group if available or null otherwise.
  */
  string getCharset() nothrow
  {
    const(char)* _cretval;
    _cretval = internet_address_get_charset(cast(GMimeInternetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the display name of the #InternetAddress.
      Returns: the name of the mailbox or group in a form suitable
        for display if available or null otherwise. If the name is available,
        the returned string will be in UTF-8.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = internet_address_get_name(cast(GMimeInternetAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Set the charset to use for encoding the name of the mailbox or group.
  
      Params:
        charset = the charset to use when encoding the name or null to use the defaults
  */
  void setCharset(string charset = null) nothrow
  {
    const(char)* _charset = charset.toCString!(No.Malloc, Yes.Nullable);
    internet_address_set_charset(cast(GMimeInternetAddress*)this._cPtr, _charset);
  }

  /**
      Set the display name of the #InternetAddress.
      
      Note: The name string should be in UTF-8.
  
      Params:
        name = the display name for the address group or mailbox
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
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
  string toString_(gid.gmime3.format_options.FormatOptions options, bool encode) nothrow
  {
    char* _cretval;
    _cretval = internet_address_to_string(cast(GMimeInternetAddress*)this._cPtr, options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, encode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.internet_address.InternetAddress]
class InternetAddressGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.internet_address.InternetAddress]
final class InternetAddressGidBuilder : InternetAddressGidBuilderImpl!InternetAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InternetAddress build() nothrow
  {
    return new InternetAddress(cast(void*)createGObject(InternetAddress._getGType), Yes.Take);
  }
}
