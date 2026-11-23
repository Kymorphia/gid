/// Module for [ConverterInputStream] class
module gid.gio2.converter_input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.converter;
import gid.gio2.filter_input_stream;
import gid.gio2.input_stream;
import gid.gio2.pollable_input_stream;
import gid.gio2.pollable_input_stream_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Converter input stream implements [gid.gio2.input_stream.InputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gid.gio2.converter_input_stream.ConverterInputStream] implements
    [gid.gio2.pollable_input_stream.PollableInputStream].
*/
class ConverterInputStream : gid.gio2.filter_input_stream.FilterInputStream, gid.gio2.pollable_input_stream.PollableInputStream
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
    return cast(void function())g_converter_input_stream_get_type != &gidSymbolNotFound ? g_converter_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GConverterInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override ConverterInputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.converter_input_stream.ConverterInputStream]
      Returns: New builder object
  */
  static ConverterInputStreamGidBuilder builder() nothrow
  {
    return new ConverterInputStreamGidBuilder;
  }

  /**
      Get `converter` property.
      Returns: The converter object.
  */
  @property gid.gio2.converter.Converter converter() nothrow
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
  this(gid.gio2.input_stream.InputStream baseStream, gid.gio2.converter.Converter converter) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GInputStream* _cretval;
      _cretval = g_converter_input_stream_new(baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(gid.gobject2.object.ObjectWrap)converter)._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the #GConverter that is used by converter_stream.
      Returns: the converter of the converter input stream
  */
  gid.gio2.converter.Converter getConverter() nothrow
  {
    GConverter* _cretval;
    _cretval = g_converter_input_stream_get_converter(cast(GConverterInputStream*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.converter.Converter)(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.converter_input_stream.ConverterInputStream]
class ConverterInputStreamGidBuilderImpl(T) : gid.gio2.filter_input_stream.FilterInputStreamGidBuilderImpl!T, gid.gio2.pollable_input_stream.PollableInputStreamGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();

  /**
      Set `converter` property.
      Params:
        propval = The converter object.
      Returns: Builder instance for fluent chaining
  */
  T converter(gid.gio2.converter.Converter propval) nothrow
  {
    return setProperty("converter", propval);
  }
}

/// Fluent builder for [gid.gio2.converter_input_stream.ConverterInputStream]
final class ConverterInputStreamGidBuilder : ConverterInputStreamGidBuilderImpl!ConverterInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConverterInputStream build() nothrow
  {
    return new ConverterInputStream(cast(void*)createGObject(ConverterInputStream._getGType), Yes.Take);
  }
}
