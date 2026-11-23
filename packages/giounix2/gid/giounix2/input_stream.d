/// Module for [InputStream] class
module gid.giounix2.input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.input_stream;
import gid.gio2.pollable_input_stream;
import gid.gio2.pollable_input_stream_mixin;
import gid.giounix2.c.functions;
import gid.giounix2.c.types;
import gid.giounix2.file_descriptor_based;
import gid.giounix2.file_descriptor_based_mixin;
import gid.giounix2.types;
import gid.gobject2.gid_builder;

/**
    [gid.giounix2.input_stream.InputStream] implements [gid.gio2.input_stream.InputStream] for reading from a UNIX
    file descriptor, including asynchronous operations. (If the file
    descriptor refers to a socket or pipe, this will use `poll()` to do
    asynchronous I/O. If it refers to a regular file, it will fall back
    to doing asynchronous I/O in another thread.)
    
    Note that `<gio/gunixinputstream.h>` belongs to the UNIX-specific GIO
    interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class InputStream : gid.gio2.input_stream.InputStream, gid.gio2.pollable_input_stream.PollableInputStream, gid.giounix2.file_descriptor_based.FileDescriptorBased
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
    return cast(void function())g_unix_input_stream_get_type != &gidSymbolNotFound ? g_unix_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GUnixInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override InputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.giounix2.input_stream.InputStream]
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
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GInputStream* _cretval;
      _cretval = g_unix_input_stream_new(fd, closeFd);
      this(_cretval, Yes.Take);
    }
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

/// Fluent builder implementation template for [gid.giounix2.input_stream.InputStream]
class InputStreamGidBuilderImpl(T) : gid.gio2.input_stream.InputStreamGidBuilderImpl!T, gid.gio2.pollable_input_stream.PollableInputStreamGidBuilderImpl!T, gid.giounix2.file_descriptor_based.FileDescriptorBasedGidBuilderImpl!T
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

/// Fluent builder for [gid.giounix2.input_stream.InputStream]
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
