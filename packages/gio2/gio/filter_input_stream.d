/// Module for [FilterInputStream] class
module gio.filter_input_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.input_stream;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    Base class for input stream implementations that perform some
    kind of filtering operation on a base stream. Typical examples
    of filtering operations are character set conversion, compression
    and byte order flipping.
*/
class FilterInputStream : gio.input_stream.InputStream
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
    return cast(void function())g_filter_input_stream_get_type != &gidSymbolNotFound ? g_filter_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterInputStream self()
  {
    return this;
  }

  /**
      Get builder for [gio.filter_input_stream.FilterInputStream]
      Returns: New builder object
  */
  static FilterInputStreamGidBuilder builder()
  {
    return new FilterInputStreamGidBuilder;
  }

  /**
      Get `baseStream` property.
      Returns: The underlying base stream on which the I/O ops will be done.
  */
  @property gio.input_stream.InputStream baseStream()
  {
    return getBaseStream();
  }

  /**
      Get `closeBaseStream` property.
      Returns: Whether the base stream should be closed when the filter stream is closed.
  */
  @property bool closeBaseStream()
  {
    return getCloseBaseStream();
  }

  /**
      Set `closeBaseStream` property.
      Params:
        propval = Whether the base stream should be closed when the filter stream is closed.
  */
  @property void closeBaseStream(bool propval)
  {
    setCloseBaseStream(propval);
  }

  /**
      Gets the base stream for the filter stream.
      Returns: a #GInputStream.
  */
  gio.input_stream.InputStream getBaseStream()
  {
    GInputStream* _cretval;
    _cretval = g_filter_input_stream_get_base_stream(cast(GFilterInputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the base stream will be closed when stream is
      closed.
      Returns: true if the base stream will be closed.
  */
  bool getCloseBaseStream()
  {
    bool _retval;
    _retval = cast(bool)g_filter_input_stream_get_close_base_stream(cast(GFilterInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the base stream will be closed when stream is closed.
  
      Params:
        closeBase = true to close the base stream.
  */
  void setCloseBaseStream(bool closeBase)
  {
    g_filter_input_stream_set_close_base_stream(cast(GFilterInputStream*)this._cPtr, closeBase);
  }
}

/// Fluent builder implementation template for [gio.filter_input_stream.FilterInputStream]
class FilterInputStreamGidBuilderImpl(T) : gio.input_stream.InputStreamGidBuilderImpl!T
{

  /**
      Set `baseStream` property.
      Params:
        propval = The underlying base stream on which the I/O ops will be done.
      Returns: Builder instance for fluent chaining
  */
  T baseStream(gio.input_stream.InputStream propval)
  {
    return setProperty("base-stream", propval);
  }

  /**
      Set `closeBaseStream` property.
      Params:
        propval = Whether the base stream should be closed when the filter stream is closed.
      Returns: Builder instance for fluent chaining
  */
  T closeBaseStream(bool propval)
  {
    return setProperty("close-base-stream", propval);
  }
}

/// Fluent builder for [gio.filter_input_stream.FilterInputStream]
final class FilterInputStreamGidBuilder : FilterInputStreamGidBuilderImpl!FilterInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterInputStream build()
  {
    return new FilterInputStream(cast(void*)createGObject(FilterInputStream._getGType), No.Take);
  }
}
