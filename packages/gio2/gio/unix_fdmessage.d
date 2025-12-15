/// Module for [UnixFDMessage] class
module gio.unix_fdmessage;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_control_message;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import gobject.object;

/**
    This [gio.socket_control_message.SocketControlMessage] contains a [gio.unix_fdlist.UnixFDList].
    It may be sent using [gio.socket.Socket.sendMessage] and received using
    [gio.socket.Socket.receiveMessage] over UNIX sockets (ie: sockets in the
    [gio.types.SocketFamily.Unix] family). The file descriptors are copied
    between processes by the kernel.
    
    For an easier way to send and receive file descriptors over
    stream-oriented UNIX sockets, see [gio.unix_connection.UnixConnection.sendFd] and
    [gio.unix_connection.UnixConnection.receiveFd].
    
    Note that `<gio/gunixfdmessage.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class UnixFDMessage : gio.socket_control_message.SocketControlMessage
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
    return cast(void function())g_unix_fd_message_get_type != &gidSymbolNotFound ? g_unix_fd_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixFDMessage self()
  {
    return this;
  }

  /**
      Creates a new #GUnixFDMessage containing an empty file descriptor
      list.
      Returns: a new #GUnixFDMessage
  */
  this()
  {
    GSocketControlMessage* _cretval;
    _cretval = g_unix_fd_message_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GUnixFDMessage containing list.
  
      Params:
        fdList = a #GUnixFDList
      Returns: a new #GUnixFDMessage
  */
  static gio.unix_fdmessage.UnixFDMessage newWithFdList(gio.unix_fdlist.UnixFDList fdList)
  {
    GSocketControlMessage* _cretval;
    _cretval = g_unix_fd_message_new_with_fd_list(fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_fdmessage.UnixFDMessage)(cast(GSocketControlMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds a file descriptor to message.
      
      The file descriptor is duplicated using dup(). You keep your copy
      of the descriptor and the copy contained in message will be closed
      when message is finalized.
      
      A possible cause of failure is exceeding the per-process or
      system-wide file descriptor limit.
  
      Params:
        fd = a valid open file descriptor
      Returns: true in case of success, else false (and error is set)
      Throws: [ErrorWrap]
  */
  bool appendFd(int fd)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_unix_fd_message_append_fd(cast(GUnixFDMessage*)this._cPtr, fd, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the #GUnixFDList contained in message.  This function does not
      return a reference to the caller, but the returned list is valid for
      the lifetime of message.
      Returns: the #GUnixFDList from message
  */
  gio.unix_fdlist.UnixFDList getFdList()
  {
    GUnixFDList* _cretval;
    _cretval = g_unix_fd_message_get_fd_list(cast(GUnixFDMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_fdlist.UnixFDList)(cast(GUnixFDList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the array of file descriptors that is contained in this
      object.
      
      After this call, the descriptors are no longer contained in
      message. Further calls will return an empty list (unless more
      descriptors have been added).
      
      The return result of this function must be freed with [glib.global.gfree].
      The caller is also responsible for closing all of the file
      descriptors.
      
      If length is non-null then it is set to the number of file
      descriptors in the returned array. The returned array is also
      terminated with -1.
      
      This function never returns null. In case there are no file
      descriptors contained in message, an empty array is returned.
      Returns: an array of file
            descriptors
  */
  int[] stealFds()
  {
    int* _cretval;
    int _cretlength;
    _cretval = g_unix_fd_message_steal_fds(cast(GUnixFDMessage*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
