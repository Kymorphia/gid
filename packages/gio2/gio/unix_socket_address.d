/// Module for [UnixSocketAddress] class
module gio.unix_socket_address;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.socket_connectable;
import gio.socket_connectable_mixin;
import gio.types;
import gobject.object;

/**
    Support for UNIX-domain (also known as local) sockets, corresponding to
    `struct sockaddr_un`.
    
    UNIX domain sockets are generally visible in the filesystem.
    However, some systems support abstract socket names which are not
    visible in the filesystem and not affected by the filesystem
    permissions, visibility, etc. Currently this is only supported
    under Linux. If you attempt to use abstract sockets on other
    systems, function calls may return [gio.types.IOErrorEnum.NotSupported]
    errors. You can use [gio.unix_socket_address.UnixSocketAddress.abstractNamesSupported]
    to see if abstract names are supported.
    
    Since GLib 2.72, [gio.unix_socket_address.UnixSocketAddress] is available on all platforms. It
    requires underlying system support (such as Windows 10 with `AF_UNIX`) at
    run time.
    
    Before GLib 2.72, `<gio/gunixsocketaddress.h>` belonged to the UNIX-specific
    GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
    when using it. This is no longer necessary since GLib 2.72.
*/
class UnixSocketAddress : gio.socket_address.SocketAddress
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
    return cast(void function())g_unix_socket_address_get_type != &gidSymbolNotFound ? g_unix_socket_address_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixSocketAddress self()
  {
    return this;
  }

  /**
      Creates a new #GUnixSocketAddress for path.
      
      To create abstract socket addresses, on systems that support that,
      use [gio.unix_socket_address.UnixSocketAddress.newAbstract].
  
      Params:
        path = the socket path
      Returns: a new #GUnixSocketAddress
  */
  this(string path)
  {
    GSocketAddress* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_unix_socket_address_new(_path);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gio.types.UnixSocketAddressType.AbstractPadded]
      #GUnixSocketAddress for path.
  
      Params:
        path = the abstract name
      Returns: a new #GUnixSocketAddress
  
      Deprecated: Use [gio.unix_socket_address.UnixSocketAddress.newWithType].
  */
  static gio.unix_socket_address.UnixSocketAddress newAbstract(string path)
  {
    GSocketAddress* _cretval;
    int _pathLen;
    if (path)
      _pathLen = cast(int)path.length;

    auto _path = cast(const(char)*)path.ptr;
    _cretval = g_unix_socket_address_new_abstract(_path, _pathLen);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_socket_address.UnixSocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GUnixSocketAddress of type type with name path.
      
      If type is [gio.types.UnixSocketAddressType.Path], this is equivalent to
      calling [gio.unix_socket_address.UnixSocketAddress.new_].
      
      If type is [gio.types.UnixSocketAddressType.Anonymous], path and path_len will be
      ignored.
      
      If path_type is [gio.types.UnixSocketAddressType.Abstract], then path_len
      bytes of path will be copied to the socket's path, and only those
      bytes will be considered part of the name. (If path_len is -1,
      then path is assumed to be NUL-terminated.) For example, if path
      was "test", then calling [gio.socket_address.SocketAddress.getNativeSize] on the
      returned socket would return 7 (2 bytes of overhead, 1 byte for the
      abstract-socket indicator byte, and 4 bytes for the name "test").
      
      If path_type is [gio.types.UnixSocketAddressType.AbstractPadded], then
      path_len bytes of path will be copied to the socket's path, the
      rest of the path will be padded with 0 bytes, and the entire
      zero-padded buffer will be considered the name. (As above, if
      path_len is -1, then path is assumed to be NUL-terminated.) In
      this case, [gio.socket_address.SocketAddress.getNativeSize] will always return
      the full size of a `struct sockaddr_un`, although
      [gio.unix_socket_address.UnixSocketAddress.getPathLen] will still return just the
      length of path.
      
      [gio.types.UnixSocketAddressType.Abstract] is preferred over
      [gio.types.UnixSocketAddressType.AbstractPadded] for new programs. Of course,
      when connecting to a server created by another process, you must
      use the appropriate type corresponding to how that process created
      its listening socket.
  
      Params:
        path = the name
        type = a #GUnixSocketAddressType
      Returns: a new #GUnixSocketAddress
  */
  static gio.unix_socket_address.UnixSocketAddress newWithType(string path, gio.types.UnixSocketAddressType type)
  {
    GSocketAddress* _cretval;
    int _pathLen;
    if (path)
      _pathLen = cast(int)path.length;

    auto _path = cast(const(char)*)path.ptr;
    _cretval = g_unix_socket_address_new_with_type(_path, _pathLen, type);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_socket_address.UnixSocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if abstract UNIX domain socket names are supported.
      Returns: true if supported, false otherwise
  */
  static bool abstractNamesSupported()
  {
    bool _retval;
    _retval = cast(bool)g_unix_socket_address_abstract_names_supported();
    return _retval;
  }

  /**
      Gets address's type.
      Returns: a #GUnixSocketAddressType
  */
  gio.types.UnixSocketAddressType getAddressType()
  {
    GUnixSocketAddressType _cretval;
    _cretval = g_unix_socket_address_get_address_type(cast(GUnixSocketAddress*)this._cPtr);
    gio.types.UnixSocketAddressType _retval = cast(gio.types.UnixSocketAddressType)_cretval;
    return _retval;
  }

  /**
      Tests if address is abstract.
      Returns: true if the address is abstract, false otherwise
  
      Deprecated: Use [gio.unix_socket_address.UnixSocketAddress.getAddressType]
  */
  bool getIsAbstract()
  {
    bool _retval;
    _retval = cast(bool)g_unix_socket_address_get_is_abstract(cast(GUnixSocketAddress*)this._cPtr);
    return _retval;
  }

  /**
      Gets address's path, or for abstract sockets the "name".
      
      Guaranteed to be zero-terminated, but an abstract socket
      may contain embedded zeros, and thus you should use
      [gio.unix_socket_address.UnixSocketAddress.getPathLen] to get the true length
      of this string.
      Returns: the path for address
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = g_unix_socket_address_get_path(cast(GUnixSocketAddress*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the length of address's path.
      
      For details, see [gio.unix_socket_address.UnixSocketAddress.getPath].
      Returns: the length of the path
  */
  size_t getPathLen()
  {
    size_t _retval;
    _retval = g_unix_socket_address_get_path_len(cast(GUnixSocketAddress*)this._cPtr);
    return _retval;
  }
}
