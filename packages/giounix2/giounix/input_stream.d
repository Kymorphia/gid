/// Module for [InputStream] class
module giounix.input_stream;

public import gid.basictypes;
import gid.gid;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import giounix.c.functions;
import giounix.c.types;
import giounix.file_descriptor_based;
import giounix.file_descriptor_based_mixin;
import giounix.types;
import gobject.gid_builder;

/**
    [giounix.input_stream.InputStream] implements [gio.input_stream.InputStream] for reading from a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixinputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class InputStream : gio.input_stream.InputStream, gio.pollable_input_stream.PollableInputStream, giounix.file_descriptor_based.FileDescriptorBased
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
    return cast(void function())g_unix_input_stream_get_type != &gidSymbolNotFound ? g_unix_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [giounix.input_stream.InputStream]
      Returns: New builder object
  */
  static InputStreamGidBuilder builder() nothrow
  {
    return new InputStreamGidBuilder;
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
      Returns: The file descriptor that the stream reads from.
  */
  @property int fd() nothrow
  {
    return getFd();
  }

  mixin PollableInputStreamT!();
  mixin FileDescriptorBasedT!();

  /**
      Creates a new #GUnixInputStream for the given fd.
      
      If close_fd is true, the file descriptor will be closed
      when the stream is closed.
  
      Params:
        fd = a UNIX file descriptor
        closeFd = true to close the file descriptor when done
      Returns: a new #GUnixInputStream
  */
  this(int fd, bool closeFd) nothrow
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
  bool getCloseFd() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_input_stream_get_close_fd(cast(GUnixInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Return the UNIX file descriptor that the stream reads from.
      Returns: The file descriptor of stream
  */
  int getFd() nothrow
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
  void setCloseFd(bool closeFd) nothrow
  {
    g_unix_input_stream_set_close_fd(cast(GUnixInputStream*)this._cPtr, closeFd);
  }
}

/// Fluent builder implementation template for [giounix.input_stream.InputStream]
class InputStreamGidBuilderImpl(T) : gio.input_stream.InputStreamGidBuilderImpl!T, gio.pollable_input_stream.PollableInputStreamGidBuilderImpl!T, giounix.file_descriptor_based.FileDescriptorBasedGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();
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
        propval = The file descriptor that the stream reads from.
      Returns: Builder instance for fluent chaining
  */
  T fd(int propval) nothrow
  {
    return setProperty("fd", propval);
  }
}

/// Fluent builder for [giounix.input_stream.InputStream]
final class InputStreamGidBuilder : InputStreamGidBuilderImpl!InputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InputStream build() nothrow
  {
    return new InputStream(cast(void*)createGObject(InputStream._getGType), Yes.Take);
  }
}
