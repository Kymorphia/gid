/// Module for [SimpleIOStream] class
module gid.gio2.simple_iostream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.input_stream;
import gid.gio2.iostream;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.simple_iostream.SimpleIOStream] creates a [gid.gio2.iostream.IOStream] from an arbitrary
    [gid.gio2.input_stream.InputStream] and [gid.gio2.output_stream.OutputStream]. This allows any pair of
    input and output streams to be used with [gid.gio2.iostream.IOStream] methods.
    
    This is useful when you obtained a [gid.gio2.input_stream.InputStream] and a
    [gid.gio2.output_stream.OutputStream] by other means, for instance creating them with
    platform specific methods as
    [`[gid.giounix2.input_stream.InputStream.new_]`](../gio-unix/ctor.UnixInputStream.new.html)
    (from `gio-unix-2.0.pc` / `GioUnix-2.0`), and you want to
    take advantage of the methods provided by [gid.gio2.iostream.IOStream].
*/
@gidGir("SimpleIOStream")
class SimpleIOStream : gid.gio2.iostream.IOStream
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
    return cast(void function())g_simple_io_stream_get_type != &gidSymbolNotFound ? g_simple_io_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSimpleIOStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleIOStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.simple_iostream.SimpleIOStream]
      Returns: New builder object
  */
  static SimpleIOStreamGidBuilder builder() nothrow
  {
    return new SimpleIOStreamGidBuilder;
  }

  /**
      Get `inputStream` property.
      Returns: The [gid.gio2.input_stream.InputStream] to read from.
  */
  override @property gid.gio2.input_stream.InputStream inputStream() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.input_stream.InputStream)("input-stream");
  }

  /**
      Get `outputStream` property.
      Returns: The [gid.gio2.output_stream.OutputStream] to write to.
  */
  override @property gid.gio2.output_stream.OutputStream outputStream() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.output_stream.OutputStream)("output-stream");
  }

  /**
      Creates a new #GSimpleIOStream wrapping input_stream and output_stream.
      See also #GIOStream.
  
      Params:
        inputStream = a #GInputStream.
        outputStream = a #GOutputStream.
      Returns: a new #GSimpleIOStream instance.
  */
  this(gid.gio2.input_stream.InputStream inputStream, gid.gio2.output_stream.OutputStream outputStream) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GIOStream* _cretval;
      _cretval = g_simple_io_stream_new(inputStream ? cast(GInputStream*)inputStream._cPtr(No.Dup) : null, outputStream ? cast(GOutputStream*)outputStream._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.simple_iostream.SimpleIOStream]
class SimpleIOStreamGidBuilderImpl(T) : gid.gio2.iostream.IOStreamGidBuilderImpl!T
{

  /**
      Set `inputStream` property.
      Params:
        propval = The [gid.gio2.input_stream.InputStream] to read from.
      Returns: Builder instance for fluent chaining
  */
  T inputStream(gid.gio2.input_stream.InputStream propval) nothrow
  {
    return setProperty("input-stream", propval);
  }

  /**
      Set `outputStream` property.
      Params:
        propval = The [gid.gio2.output_stream.OutputStream] to write to.
      Returns: Builder instance for fluent chaining
  */
  T outputStream(gid.gio2.output_stream.OutputStream propval) nothrow
  {
    return setProperty("output-stream", propval);
  }
}

/// Fluent builder for [gid.gio2.simple_iostream.SimpleIOStream]
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
