/// Module for [SocketAddress] class
module gid.gio2.socket_address;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_connectable;
import gid.gio2.socket_connectable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.socket_address.SocketAddress] is the equivalent of
    [`struct sockaddr`](man:sockaddr(3type)) and its subtypes in the BSD sockets
    API. This is an abstract class; use [gid.gio2.inet_socket_address.InetSocketAddress] for
    internet sockets, or [gid.gio2.unix_socket_address.UnixSocketAddress] for UNIX domain sockets.
*/
class SocketAddress : gid.gobject2.object.ObjectWrap, gid.gio2.socket_connectable.SocketConnectable
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
    return cast(void function())g_socket_address_get_type != &gidSymbolNotFound ? g_socket_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketAddress";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAddress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_address.SocketAddress]
      Returns: New builder object
  */
  static SocketAddressGidBuilder builder() nothrow
  {
    return new SocketAddressGidBuilder;
  }

  /**
      Get `family` property.
      Returns: The family of the socket address.
  */
  @property gid.gio2.types.SocketFamily family() nothrow
  {
    return getFamily();
  }

  mixin SocketConnectableT!();

  /**
      Creates a #GSocketAddress subclass corresponding to the native
      struct sockaddr native.
  
      Params:
        native = a pointer to a struct sockaddr
        len = the size of the memory location pointed to by native
      Returns: a new #GSocketAddress if native could successfully
            be converted, otherwise null
  */
  static gid.gio2.socket_address.SocketAddress newFromNative(void* native, size_t len) nothrow
  {
    GSocketAddress* _cretval;
    _cretval = g_socket_address_new_from_native(native, len);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the socket family type of address.
      Returns: the socket family type of address
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetFamily` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.SocketFamily vfuncGetFamily()
  {
    auto _klass = cast(GSocketAddressClass*)_vfuncClass;
    if (!_klass.getFamily)
      return typeof(return).init;

    GSocketFamily _cretval;
    _cretval = _klass.getFamily(cast(GSocketAddress*)this._cPtr);
    gid.gio2.types.SocketFamily _retval = cast(gid.gio2.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets the size of address's native struct sockaddr.
      You can use this to allocate memory to pass to
      [gid.gio2.socket_address.SocketAddress.toNative].
      Returns: the size of the native struct sockaddr that
            address represents, or `-1` if address
            is not valid
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNativeSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncGetNativeSize()
  {
    auto _klass = cast(GSocketAddressClass*)_vfuncClass;
    if (!_klass.getNativeSize)
      return typeof(return).init;

    ptrdiff_t _retval;
    _retval = _klass.getNativeSize(cast(GSocketAddress*)this._cPtr);
    return _retval;
  }

  /**
      Converts a #GSocketAddress to a native struct sockaddr, which can
      be passed to low-level functions like connect() or bind().
      
      If not enough space is available, a [gid.gio2.types.IOErrorEnum.NoSpace] error
      is returned. If the address type is not known on the system
      then a [gid.gio2.types.IOErrorEnum.NotSupported] error is returned.
  
      Params:
        dest = a pointer to a memory location that will contain the native
          struct sockaddr
        destlen = the size of dest. Must be at least as large as
              [gid.gio2.socket_address.SocketAddress.getNativeSize]
      Returns: true if dest was filled in, false on error
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToNative` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncToNative(void* dest, size_t destlen)
  {
    auto _klass = cast(GSocketAddressClass*)_vfuncClass;
    if (!_klass.toNative)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.toNative(cast(GSocketAddress*)this._cPtr, dest, destlen, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the socket family type of address.
      Returns: the socket family type of address
  */
  gid.gio2.types.SocketFamily getFamily() nothrow
  {
    GSocketFamily _cretval;
    _cretval = g_socket_address_get_family(cast(GSocketAddress*)this._cPtr);
    gid.gio2.types.SocketFamily _retval = cast(gid.gio2.types.SocketFamily)_cretval;
    return _retval;
  }

  /**
      Gets the size of address's native struct sockaddr.
      You can use this to allocate memory to pass to
      [gid.gio2.socket_address.SocketAddress.toNative].
      Returns: the size of the native struct sockaddr that
            address represents, or `-1` if address
            is not valid
  */
  ptrdiff_t getNativeSize() nothrow
  {
    ptrdiff_t _retval;
    _retval = g_socket_address_get_native_size(cast(GSocketAddress*)this._cPtr);
    return _retval;
  }

  /**
      Converts a #GSocketAddress to a native struct sockaddr, which can
      be passed to low-level functions like connect() or bind().
      
      If not enough space is available, a [gid.gio2.types.IOErrorEnum.NoSpace] error
      is returned. If the address type is not known on the system
      then a [gid.gio2.types.IOErrorEnum.NotSupported] error is returned.
  
      Params:
        dest = a pointer to a memory location that will contain the native
          struct sockaddr
        destlen = the size of dest. Must be at least as large as
              [gid.gio2.socket_address.SocketAddress.getNativeSize]
      Returns: true if dest was filled in, false on error
      Throws: [ErrorWrap]
  */
  bool toNative(void* dest, size_t destlen)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_address_to_native(cast(GSocketAddress*)this._cPtr, dest, destlen, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SocketAddress
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.socket_address.SocketAddress), T.stringof ~ " is not derived from gid.gio2.socket_address.SocketAddress");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetFamily", true)[0]) == gid.gio2.socket_address.SocketAddress))
      _installVfunc(klass, "get_family");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNativeSize", true)[0]) == gid.gio2.socket_address.SocketAddress))
      _installVfunc(klass, "get_native_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToNative", true)[0]) == gid.gio2.socket_address.SocketAddress))
      _installVfunc(klass, "to_native");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GSocketAddressClass*)klass;

    switch (vfunc)
    {
      case "get_family":
      {
        static extern(C) GSocketFamily _vfuncGetFamilyTramp(GSocketAddress* address) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.socket_address.SocketAddress)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)address);
          if (!_obj)
          {
            auto _klass = cast(GSocketAddressClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)address);
            if (_klass.getFamily)
              return (cast(typeof(&_vfuncGetFamilyTramp))_klass.getFamily)(address);
            return typeof(return).init;
          }

          gid.gio2.types.SocketFamily _dretval;

          try
          {
            _dretval = _obj.vfuncGetFamily();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_address.SocketAddress.vfuncGetFamily");
          }
          auto _retval = cast(GSocketFamily)_dretval;

          return _retval;
        }

        _klass.getFamily = cast(typeof(_klass.getFamily))&_vfuncGetFamilyTramp;
        break;
      }
      case "get_native_size":
      {
        static extern(C) ptrdiff_t _vfuncGetNativeSizeTramp(GSocketAddress* address) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.socket_address.SocketAddress)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)address);
          if (!_obj)
          {
            auto _klass = cast(GSocketAddressClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)address);
            if (_klass.getNativeSize)
              return (cast(typeof(&_vfuncGetNativeSizeTramp))_klass.getNativeSize)(address);
            return typeof(return).init;
          }

          ptrdiff_t _retval;

          try
          {
            _retval = _obj.vfuncGetNativeSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_address.SocketAddress.vfuncGetNativeSize");
          }
          return _retval;
        }

        _klass.getNativeSize = cast(typeof(_klass.getNativeSize))&_vfuncGetNativeSizeTramp;
        break;
      }
      case "to_native":
      {
        static extern(C) gboolean _vfuncToNativeTramp(GSocketAddress* address, void* dest, size_t destlen, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.socket_address.SocketAddress)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)address);
          if (!_obj)
          {
            auto _klass = cast(GSocketAddressClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)address);
            if (_klass.toNative)
              return (cast(typeof(&_vfuncToNativeTramp))_klass.toNative)(address, dest, destlen, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncToNative(dest, destlen);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.toNative = cast(typeof(_klass.toNative))&_vfuncToNativeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_address.SocketAddress]
class SocketAddressGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.socket_connectable.SocketConnectableGidBuilderImpl!T
{

  mixin SocketConnectableGidBuilderT!();
}

/// Fluent builder for [gid.gio2.socket_address.SocketAddress]
final class SocketAddressGidBuilder : SocketAddressGidBuilderImpl!SocketAddressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketAddress build() nothrow
  {
    return new SocketAddress(cast(void*)createGObject(SocketAddress._getGType), Yes.Take);
  }
}
