/// Module for [NativeSocketAddress] class
module gid.gio2.native_socket_address;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_address;
import gid.gio2.socket_connectable;
import gid.gio2.socket_connectable_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    A socket address of some unknown native type.
    
    This corresponds to a general `struct sockaddr` of a type not otherwise
    handled by GLib.
*/
class NativeSocketAddress : gid.gio2.socket_address.SocketAddress
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_native_socket_address_get_type != &gidSymbolNotFound ? g_native_socket_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GNativeSocketAddress";
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeSocketAddress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.native_socket_address.NativeSocketAddress]
      Returns: New builder object
  */
  static NativeSocketAddressGidBuilder builder() nothrow
  {
    return new NativeSocketAddressGidBuilder;
  }

  /**
      Creates a new #GNativeSocketAddress for native and len.
  
      Params:
        native = a native address object
        len = the length of native, in bytes
      Returns: a new #GNativeSocketAddress
  */
  this(void* native, size_t len) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GSocketAddress* _cretval;
      _cretval = g_native_socket_address_new(native, len);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.native_socket_address.NativeSocketAddress]
class NativeSocketAddressGidBuilderImpl(T) : gid.gio2.socket_address.SocketAddressGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gio2.native_socket_address.NativeSocketAddress]
final class NativeSocketAddressGidBuilder : NativeSocketAddressGidBuilderImpl!NativeSocketAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NativeSocketAddress build() nothrow
  {
    return new NativeSocketAddress(cast(void*)createGObject(NativeSocketAddress._getGType), Yes.Take);
  }
}
