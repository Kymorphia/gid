/// Module for [ConverterOutputStream] class
module gio.converter_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.filter_output_stream;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    Converter output stream implements [gio.output_stream.OutputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gio.converter_output_stream.ConverterOutputStream] implements
    [gio.pollable_output_stream.PollableOutputStream].
*/
class ConverterOutputStream : gio.filter_output_stream.FilterOutputStream, gio.pollable_output_stream.PollableOutputStream
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
    return cast(void function())g_converter_output_stream_get_type != &gidSymbolNotFound ? g_converter_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConverterOutputStream self()
  {
    return this;
  }

  /**
  Get builder for [gio.converter_output_stream.ConverterOutputStream]
  Returns: New builder object
  */
  static ConverterOutputStreamGidBuilder builder()
  {
    return new ConverterOutputStreamGidBuilder;
  }

  /**
      Get `converter` property.
      Returns: The converter object.
  */
  @property gio.converter.Converter converter()
  {
    return getConverter();
  }

  mixin PollableOutputStreamT!();

  /**
      Creates a new converter output stream for the base_stream.
  
      Params:
        baseStream = a #GOutputStream
        converter = a #GConverter
      Returns: a new #GOutputStream.
  */
  this(gio.output_stream.OutputStream baseStream, gio.converter.Converter converter)
  {
    GOutputStream* _cretval;
    _cretval = g_converter_output_stream_new(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(gobject.object.ObjectWrap)converter)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GConverter that is used by converter_stream.
      Returns: the converter of the converter output stream
  */
  gio.converter.Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_output_stream_get_converter(cast(GConverterOutputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.converter.Converter)(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}

class ConverterOutputStreamGidBuilderImpl(T) : gio.filter_output_stream.FilterOutputStreamGidBuilderImpl!T, gio.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T
{

  mixin PollableOutputStreamGidBuilderT!();

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

/// Fluent builder for [gio.converter_output_stream.ConverterOutputStream]
final class ConverterOutputStreamGidBuilder : ConverterOutputStreamGidBuilderImpl!ConverterOutputStreamGidBuilder
{
  ConverterOutputStream build()
  {
    return new ConverterOutputStream(cast(void*)createGObject(ConverterOutputStream._getGType), Yes.Take);
  }
}
