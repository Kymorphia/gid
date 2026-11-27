/// Module for [InetAddressMask] class
module gid.gio2.inet_address_mask;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.inet_address;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.inet_address_mask.InetAddressMask] represents a range of IPv4 or IPv6 addresses
    described by a base address and a length indicating how many bits
    of the base address are relevant for matching purposes. These are
    often given in string form. For example, `10.0.0.0/8`, or `fe80::/10`.
*/
@gidGir("InetAddressMask", "InetAddressMaskClass")
class InetAddressMask : gid.gobject2.object.ObjectWrap, gid.gio2.initable.Initable
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
    return cast(void function())g_inet_address_mask_get_type != &gidSymbolNotFound ? g_inet_address_mask_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GInetAddressMask";
  }

  /** Returns `this`, for use in `with` statements. */
  override InetAddressMask self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.inet_address_mask.InetAddressMask]
      Returns: New builder object
  */
  static InetAddressMaskGidBuilder builder() nothrow
  {
    return new InetAddressMaskGidBuilder;
  }

  /**
      Get `address` property.
      Returns: The base address.
  */
  @property gid.gio2.inet_address.InetAddress address() nothrow
  {
    return getAddress();
  }

  /**
      Set `address` property.
      Params:
        propval = The base address.
  */
  @property void address(gid.gio2.inet_address.InetAddress propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.inet_address.InetAddress)("address", propval);
  }

  /**
      Get `family` property.
      Returns: The address family (IPv4 or IPv6).
  */
  @property gid.gio2.types.SocketFamily family() nothrow
  {
    return getFamily();
  }

  /**
      Get `length` property.
      Returns: The prefix length, in bytes.
  */
  @property uint length() nothrow
  {
    return getLength();
  }

  /**
      Set `length` property.
      Params:
        propval = The prefix length, in bytes.
  */
  @property void length(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("length", propval);
  }

  mixin InitableT!();

  /**
      Creates a new #GInetAddressMask representing all addresses whose
      first length bits match addr.
  
      Params:
        addr = a #GInetAddress
        length = number of bits of addr to use
      Returns: a new #GInetAddressMask, or null on error
      Throws: [ErrorWrap]
  */
  this(gid.gio2.inet_address.InetAddress addr, uint length)
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GInetAddressMask* _cretval;
      GError *_err;
      _cretval = g_inet_address_mask_new(addr ? cast(GInetAddress*)addr._cPtr(No.Dup) : null, length, &_err);
      if (_err)
        throw new ErrorWrap(_err, Yes.Take);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Parses mask_string as an IP address and (optional) length, and
      creates a new #GInetAddressMask. The length, if present, is
      delimited by a "/". If it is not present, then the length is
      assumed to be the full length of the address.
  
      Params:
        maskString = an IP address or address/length string
      Returns: a new #GInetAddressMask corresponding to string, or null
        on error.
      Throws: [ErrorWrap]
  */
  static gid.gio2.inet_address_mask.InetAddressMask newFromString(string maskString)
  {
    GInetAddressMask* _cretval;
    const(char)* _maskString = maskString.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_inet_address_mask_new_from_string(_maskString, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address_mask.InetAddressMask)(cast(GInetAddressMask*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Tests if mask and mask2 are the same mask.
  
      Params:
        mask2 = another #GInetAddressMask
      Returns: whether mask and mask2 are the same mask
  */
  bool equal(gid.gio2.inet_address_mask.InetAddressMask mask2) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_mask_equal(cast(GInetAddressMask*)this._cPtr, mask2 ? cast(GInetAddressMask*)mask2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets mask's base address
      Returns: mask's base address
  */
  gid.gio2.inet_address.InetAddress getAddress() nothrow
  {
    GInetAddress* _cretval;
    _cretval = g_inet_address_mask_get_address(cast(GInetAddressMask*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.inet_address.InetAddress)(cast(GInetAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GSocketFamily of mask's address
      Returns: the #GSocketFamily of mask's address
  */
  gid.gio2.types.SocketFamily getFamily() nothrow
  {
    GSocketFamily _cretval;
    _cretval = g_inet_address_mask_get_family(cast(GInetAddressMask*)this._cPtr);
    gid.gio2.types.SocketFamily _retval = cast(gid.gio2.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets mask's length
      Returns: mask's length
  */
  uint getLength() nothrow
  {
    uint _retval;
    _retval = g_inet_address_mask_get_length(cast(GInetAddressMask*)this._cPtr);
    return _retval;
  }

  /**
      Tests if address falls within the range described by mask.
  
      Params:
        address = a #GInetAddress
      Returns: whether address falls within the range described by
        mask.
  */
  bool matches(gid.gio2.inet_address.InetAddress address) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_inet_address_mask_matches(cast(GInetAddressMask*)this._cPtr, address ? cast(GInetAddress*)address._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts mask back to its corresponding string form.
      Returns: a string corresponding to mask.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = g_inet_address_mask_to_string(cast(GInetAddressMask*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.inet_address_mask.InetAddressMask]
class InetAddressMaskGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();

  /**
      Set `address` property.
      Params:
        propval = The base address.
      Returns: Builder instance for fluent chaining
  */
  T address(gid.gio2.inet_address.InetAddress propval) nothrow
  {
    return setProperty("address", propval);
  }

  /**
      Set `length` property.
      Params:
        propval = The prefix length, in bytes.
      Returns: Builder instance for fluent chaining
  */
  T length(uint propval) nothrow
  {
    return setProperty("length", propval);
  }
}

/// Fluent builder for [gid.gio2.inet_address_mask.InetAddressMask]
final class InetAddressMaskGidBuilder : InetAddressMaskGidBuilderImpl!InetAddressMaskGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InetAddressMask build() nothrow
  {
    return new InetAddressMask(cast(void*)createGObject(InetAddressMask._getGType), Yes.Take);
  }
}
