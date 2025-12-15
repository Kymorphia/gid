/// Module for [UnixInputStream] class
module gio.unix_input_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file_descriptor_based;
import gio.file_descriptor_based_mixin;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import gio.types;

/**
    [gio.unix_input_stream.UnixInputStream] implements [gio.input_stream.InputStream] for reading from a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixinputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class UnixInputStream : gio.input_stream.InputStream, gio.file_descriptor_based.FileDescriptorBased, gio.pollable_input_stream.PollableInputStream
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
    return cast(void function())g_unix_input_stream_get_type != &gidSymbolNotFound ? g_unix_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixInputStream self()
  {
    return this;
  }

  /**
      Get `closeFd` property.
      Returns: Whether to close the file descriptor when the stream is closed.
  */
  @property bool closeFd()
  {
    return getCloseFd();
  }

  /**
      Set `closeFd` property.
      Params:
        propval = Whether to close the file descriptor when the stream is closed.
  */
  @property void closeFd(bool propval)
  {
    return setCloseFd(propval);
  }

  mixin FileDescriptorBasedT!();
  mixin PollableInputStreamT!();

  /**
      Creates a new #GUnixInputStream for the given fd.
      
      If close_fd is true, the file descriptor will be closed
      when the stream is closed.
  
      Params:
        fd = a UNIX file descriptor
        closeFd = true to close the file descriptor when done
      Returns: a new #GUnixInputStream
  */
  this(int fd, bool closeFd)
  {
    GInputStream* _cretval;
    _cretval = g_unix_input_stream_new(fd, closeFd);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether the file descriptor of stream will be
      closed when the stream is closed.
      Returns: true if the file descriptor is closed when done
  */
  bool getCloseFd()
  {
    bool _retval;
    _retval = cast(bool)g_unix_input_stream_get_close_fd(cast(GUnixInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Return the UNIX file descriptor that the stream reads from.
      Returns: The file descriptor of stream
  */
  int getFd()
  {
    int _retval;
    _retval = g_unix_input_stream_get_fd(cast(GUnixInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the file descriptor of stream shall be closed
      when the stream is closed.
  
      Params:
        closeFd = true to close the file descriptor when done
  */
  void setCloseFd(bool closeFd)
  {
    g_unix_input_stream_set_close_fd(cast(GUnixInputStream*)this._cPtr, closeFd);
  }
}
