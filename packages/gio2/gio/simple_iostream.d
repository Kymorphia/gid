/// Module for [SimpleIOStream] class
module gio.simple_iostream;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.input_stream;
import gio.iostream;
import gio.output_stream;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.simple_iostream.SimpleIOStream] creates a [gio.iostream.IOStream] from an arbitrary
    [gio.input_stream.InputStream] and [gio.output_stream.OutputStream]. This allows any pair of
    input and output streams to be used with [gio.iostream.IOStream] methods.
    
    This is useful when you obtained a [gio.input_stream.InputStream] and a
    [gio.output_stream.OutputStream] by other means, for instance creating them with
    platform specific methods as
    [`[gio.unix_input_stream.UnixInputStream.new_]`](../gio-unix/ctor.UnixInputStream.new.html)
    (from `gio-unix-2.0.pc` / `GioUnix-2.0`), and you want to
    take advantage of the methods provided by [gio.iostream.IOStream].
*/
class SimpleIOStream : gio.iostream.IOStream
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
    return cast(void function())g_simple_io_stream_get_type != &gidSymbolNotFound ? g_simple_io_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleIOStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gio.simple_iostream.SimpleIOStream]
      Returns: New builder object
  */
  static SimpleIOStreamGidBuilder builder() nothrow
  {
    return new SimpleIOStreamGidBuilder;
  }

  /**
      Get `inputStream` property.
      Returns: The [gio.input_stream.InputStream] to read from.
  */
  override @property gio.input_stream.InputStream inputStream() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gio.input_stream.InputStream)("input-stream");
  }

  /**
      Get `outputStream` property.
      Returns: The [gio.output_stream.OutputStream] to write to.
  */
  override @property gio.output_stream.OutputStream outputStream() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gio.output_stream.OutputStream)("output-stream");
  }

  /**
      Creates a new #GSimpleIOStream wrapping input_stream and output_stream.
      See also #GIOStream.
  
      Params:
        inputStream = a #GInputStream.
        outputStream = a #GOutputStream.
      Returns: a new #GSimpleIOStream instance.
  */
  this(gio.input_stream.InputStream inputStream, gio.output_stream.OutputStream outputStream) nothrow
  {
    GIOStream* _cretval;
    _cretval = g_simple_io_stream_new(inputStream ? cast(GInputStream*)inputStream._cPtr(No.Dup) : null, outputStream ? cast(GOutputStream*)outputStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gio.simple_iostream.SimpleIOStream]
class SimpleIOStreamGidBuilderImpl(T) : gio.iostream.IOStreamGidBuilderImpl!T
{

  /**
      Set `inputStream` property.
      Params:
        propval = The [gio.input_stream.InputStream] to read from.
      Returns: Builder instance for fluent chaining
  */
  T inputStream(gio.input_stream.InputStream propval) nothrow
  {
    return setProperty("input-stream", propval);
  }

  /**
      Set `outputStream` property.
      Params:
        propval = The [gio.output_stream.OutputStream] to write to.
      Returns: Builder instance for fluent chaining
  */
  T outputStream(gio.output_stream.OutputStream propval) nothrow
  {
    return setProperty("output-stream", propval);
  }
}

/// Fluent builder for [gio.simple_iostream.SimpleIOStream]
final class SimpleIOStreamGidBuilder : SimpleIOStreamGidBuilderImpl!SimpleIOStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimpleIOStream build() nothrow
  {
    return new SimpleIOStream(cast(void*)createGObject(SimpleIOStream._getGType), Yes.Take);
  }
}
