/// Module for [UnixOutputStream] class
module gio.unix_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file_descriptor_based;
import gio.file_descriptor_based_mixin;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.types;
import gobject.gid_builder;

/**
    [gio.unix_output_stream.UnixOutputStream] implements [gio.output_stream.OutputStream] for writing to a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixoutputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class UnixOutputStream : gio.output_stream.OutputStream, gio.file_descriptor_based.FileDescriptorBased, gio.pollable_output_stream.PollableOutputStream
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
    return cast(void function())g_unix_output_stream_get_type != &gidSymbolNotFound ? g_unix_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixOutputStream self()
  {
    return this;
  }

  /**
      Get builder for [gio.unix_output_stream.UnixOutputStream]
      Returns: New builder object
  */
  static UnixOutputStreamGidBuilder builder()
  {
    return new UnixOutputStreamGidBuilder;
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
    setCloseFd(propval);
  }

  /**
      Get `fd` property.
      Returns: The file descriptor that the stream writes to.
  */
  @property int fd()
  {
    return getFd();
  }

  mixin FileDescriptorBasedT!();
  mixin PollableOutputStreamT!();

  /**
      Creates a new #GUnixOutputStream for the given fd.
      
      If close_fd, is true, the file descriptor will be closed when
      the output stream is destroyed.
  
      Params:
        fd = a UNIX file descriptor
        closeFd = true to close the file descriptor when done
      Returns: a new #GOutputStream
  */
  this(int fd, bool closeFd)
  {
    GOutputStream* _cretval;
    _cretval = g_unix_output_stream_new(fd, closeFd);
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
    _retval = cast(bool)g_unix_output_stream_get_close_fd(cast(GUnixOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Return the UNIX file descriptor that the stream writes to.
      Returns: The file descriptor of stream
  */
  int getFd()
  {
    int _retval;
    _retval = g_unix_output_stream_get_fd(cast(GUnixOutputStream*)this._cPtr);
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
    g_unix_output_stream_set_close_fd(cast(GUnixOutputStream*)this._cPtr, closeFd);
  }
}

/// Fluent builder implementation template for [gio.unix_output_stream.UnixOutputStream]
class UnixOutputStreamGidBuilderImpl(T) : gio.output_stream.OutputStreamGidBuilderImpl!T, gio.file_descriptor_based.FileDescriptorBasedGidBuilderImpl!T, gio.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T
{

  mixin FileDescriptorBasedGidBuilderT!();
  mixin PollableOutputStreamGidBuilderT!();

  /**
      Set `closeFd` property.
      Params:
        propval = Whether to close the file descriptor when the stream is closed.
      Returns: Builder instance for fluent chaining
  */
  T closeFd(bool propval)
  {
    return setProperty("close-fd", propval);
  }

  /**
      Set `fd` property.
      Params:
        propval = The file descriptor that the stream writes to.
      Returns: Builder instance for fluent chaining
  */
  T fd(int propval)
  {
    return setProperty("fd", propval);
  }
}

/// Fluent builder for [gio.unix_output_stream.UnixOutputStream]
final class UnixOutputStreamGidBuilder : UnixOutputStreamGidBuilderImpl!UnixOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UnixOutputStream build()
  {
    return new UnixOutputStream(cast(void*)createGObject(UnixOutputStream._getGType), Yes.Take);
  }
}
