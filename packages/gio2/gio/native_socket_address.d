/// Module for [NativeSocketAddress] class
module gio.native_socket_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import gobject.gid_builder;

/**
    A socket address of some unknown native type.
    
    This corresponds to a general `struct sockaddr` of a type not otherwise
    handled by GLib.
*/
class NativeSocketAddress : gio.socket_address.SocketAddress
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
    return cast(void function())g_native_socket_address_get_type != &gidSymbolNotFound ? g_native_socket_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeSocketAddress self()
  {
    return this;
  }

  /**
      Get builder for [gio.native_socket_address.NativeSocketAddress]
      Returns: New builder object
  */
  static NativeSocketAddressGidBuilder builder()
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
  this(void* native, size_t len)
  {
    GSocketAddress* _cretval;
    _cretval = g_native_socket_address_new(native, len);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gio.native_socket_address.NativeSocketAddress]
class NativeSocketAddressGidBuilderImpl(T) : gio.socket_address.SocketAddressGidBuilderImpl!T
{

}

/// Fluent builder for [gio.native_socket_address.NativeSocketAddress]
final class NativeSocketAddressGidBuilder : NativeSocketAddressGidBuilderImpl!NativeSocketAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NativeSocketAddress build()
  {
    return new NativeSocketAddress(cast(void*)createGObject(NativeSocketAddress._getGType), Yes.Take);
  }
}
