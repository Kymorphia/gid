/// Module for [ConverterInputStream] class
module gio.converter_input_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.filter_input_stream;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    Converter input stream implements [gio.input_stream.InputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gio.converter_input_stream.ConverterInputStream] implements
    [gio.pollable_input_stream.PollableInputStream].
*/
class ConverterInputStream : gio.filter_input_stream.FilterInputStream, gio.pollable_input_stream.PollableInputStream
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
    return cast(void function())g_converter_input_stream_get_type != &gidSymbolNotFound ? g_converter_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConverterInputStream self()
  {
    return this;
  }

  /**
      Get builder for [gio.converter_input_stream.ConverterInputStream]
      Returns: New builder object
  */
  static ConverterInputStreamGidBuilder builder()
  {
    return new ConverterInputStreamGidBuilder;
  }

  /**
      Get `converter` property.
      Returns: The converter object.
  */
  @property gio.converter.Converter converter()
  {
    return getConverter();
  }

  mixin PollableInputStreamT!();

  /**
      Creates a new converter input stream for the base_stream.
  
      Params:
        baseStream = a #GInputStream
        converter = a #GConverter
      Returns: a new #GInputStream.
  */
  this(gio.input_stream.InputStream baseStream, gio.converter.Converter converter)
  {
    GInputStream* _cretval;
    _cretval = g_converter_input_stream_new(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(gobject.object.ObjectWrap)converter)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GConverter that is used by converter_stream.
      Returns: the converter of the converter input stream
  */
  gio.converter.Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_input_stream_get_converter(cast(GConverterInputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.converter.Converter)(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.converter_input_stream.ConverterInputStream]
class ConverterInputStreamGidBuilderImpl(T) : gio.filter_input_stream.FilterInputStreamGidBuilderImpl!T, gio.pollable_input_stream.PollableInputStreamGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();

  /**
      Set `converter` property.
      Params:
        propval = The converter object.
      Returns: Builder instance for fluent chaining
  */
  T converter(gio.converter.Converter propval)
  {
    return setProperty("converter", propval);
  }
}

/// Fluent builder for [gio.converter_input_stream.ConverterInputStream]
final class ConverterInputStreamGidBuilder : ConverterInputStreamGidBuilderImpl!ConverterInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConverterInputStream build()
  {
    return new ConverterInputStream(cast(void*)createGObject(ConverterInputStream._getGType), Yes.Take);
  }
}
