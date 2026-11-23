/// Module for [ConverterOutputStream] class
module gid.gio2.converter_output_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.converter;
import gid.gio2.filter_output_stream;
import gid.gio2.output_stream;
import gid.gio2.pollable_output_stream;
import gid.gio2.pollable_output_stream_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Converter output stream implements [gid.gio2.output_stream.OutputStream] and allows
    conversion of data of various types during reading.
    
    As of GLib 2.34, [gid.gio2.converter_output_stream.ConverterOutputStream] implements
    [gid.gio2.pollable_output_stream.PollableOutputStream].
*/
class ConverterOutputStream : gid.gio2.filter_output_stream.FilterOutputStream, gid.gio2.pollable_output_stream.PollableOutputStream
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
    return cast(void function())g_converter_output_stream_get_type != &gidSymbolNotFound ? g_converter_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GConverterOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override ConverterOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.converter_output_stream.ConverterOutputStream]
      Returns: New builder object
  */
  static ConverterOutputStreamGidBuilder builder() nothrow
  {
    return new ConverterOutputStreamGidBuilder;
  }

  /**
      Get `converter` property.
      Returns: The converter object.
  */
  @property gid.gio2.converter.Converter converter() nothrow
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
  this(gid.gio2.output_stream.OutputStream baseStream, gid.gio2.converter.Converter converter) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GOutputStream* _cretval;
      _cretval = g_converter_output_stream_new(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(gid.gobject2.object.ObjectWrap)converter)._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the #GConverter that is used by converter_stream.
      Returns: the converter of the converter output stream
  */
  gid.gio2.converter.Converter getConverter() nothrow
  {
    GConverter* _cretval;
    _cretval = g_converter_output_stream_get_converter(cast(GConverterOutputStream*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.converter.Converter)(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.converter_output_stream.ConverterOutputStream]
class ConverterOutputStreamGidBuilderImpl(T) : gid.gio2.filter_output_stream.FilterOutputStreamGidBuilderImpl!T, gid.gio2.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T
{

  mixin PollableOutputStreamGidBuilderT!();

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

/// Fluent builder for [gid.gio2.converter_output_stream.ConverterOutputStream]
final class ConverterOutputStreamGidBuilder : ConverterOutputStreamGidBuilderImpl!ConverterOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConverterOutputStream build() nothrow
  {
    return new ConverterOutputStream(cast(void*)createGObject(ConverterOutputStream._getGType), Yes.Take);
  }
}
