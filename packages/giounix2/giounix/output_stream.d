/// Module for [OutputStream] class
module giounix.output_stream;

public import gid.basictypes;
import gid.gid;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import giounix.c.functions;
import giounix.c.types;
import giounix.file_descriptor_based;
import giounix.file_descriptor_based_mixin;
import giounix.types;
import gobject.gid_builder;

/**
    [giounix.output_stream.OutputStream] implements [gio.output_stream.OutputStream] for writing to a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixoutputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config file
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class OutputStream : gio.output_stream.OutputStream, gio.pollable_output_stream.PollableOutputStream, giounix.file_descriptor_based.FileDescriptorBased
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_output_stream_get_type != &gidSymbolNotFound ? g_unix_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [giounix.output_stream.OutputStream]
      Returns: New builder object
  */
  static OutputStreamGidBuilder builder() nothrow
  {
    return new OutputStreamGidBuilder;
  }

  /**
      Get `closeFd` property.
      Returns: Whether to close the file descriptor when the stream is closed.
  */
  @property bool closeFd() nothrow
  {
    return getCloseFd();
  }

  /**
      Set `closeFd` property.
      Params:
        propval = Whether to close the file descriptor when the stream is closed.
  */
  @property void closeFd(bool propval) nothrow
  {
    setCloseFd(propval);
  }

  /**
      Get `fd` property.
      Returns: The file descriptor that the stream writes to.
  */
  @property int fd() nothrow
  {
    return getFd();
  }

  mixin PollableOutputStreamT!();
  mixin FileDescriptorBasedT!();

  /**
      Creates a new #GUnixOutputStream for the given fd.
      
      If close_fd, is true, the file descriptor will be closed when
      the output stream is destroyed.
  
      Params:
        fd = a UNIX file descriptor
        closeFd = true to close the file descriptor when done
      Returns: a new #GOutputStream
  */
  this(int fd, bool closeFd) nothrow
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
  bool getCloseFd() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_output_stream_get_close_fd(cast(GUnixOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Return the UNIX file descriptor that the stream writes to.
      Returns: The file descriptor of stream
  */
  int getFd() nothrow
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
  void setCloseFd(bool closeFd) nothrow
  {
    g_unix_output_stream_set_close_fd(cast(GUnixOutputStream*)this._cPtr, closeFd);
  }
}

/// Fluent builder implementation template for [giounix.output_stream.OutputStream]
class OutputStreamGidBuilderImpl(T) : gio.output_stream.OutputStreamGidBuilderImpl!T, gio.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T, giounix.file_descriptor_based.FileDescriptorBasedGidBuilderImpl!T
{

  mixin PollableOutputStreamGidBuilderT!();
  mixin FileDescriptorBasedGidBuilderT!();

  /**
      Set `closeFd` property.
      Params:
        propval = Whether to close the file descriptor when the stream is closed.
      Returns: Builder instance for fluent chaining
  */
  T closeFd(bool propval) nothrow
  {
    return setProperty("close-fd", propval);
  }

  /**
      Set `fd` property.
      Params:
        propval = The file descriptor that the stream writes to.
      Returns: Builder instance for fluent chaining
  */
  T fd(int propval) nothrow
  {
    return setProperty("fd", propval);
  }
}

/// Fluent builder for [giounix.output_stream.OutputStream]
final class OutputStreamGidBuilder : OutputStreamGidBuilderImpl!OutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OutputStream build() nothrow
  {
    return new OutputStream(cast(void*)createGObject(OutputStream._getGType), Yes.Take);
  }
}
