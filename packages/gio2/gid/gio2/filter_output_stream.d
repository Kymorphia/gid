/// Module for [FilterOutputStream] class
module gid.gio2.filter_output_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base class for output stream implementations that perform some
    kind of filtering operation on a base stream. Typical examples
    of filtering operations are character set conversion, compression
    and byte order flipping.
*/
@gidGir("FilterOutputStream", "FilterOutputStreamClass")
class FilterOutputStream : gid.gio2.output_stream.OutputStream
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
    return cast(void function())g_filter_output_stream_get_type != &gidSymbolNotFound ? g_filter_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFilterOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.filter_output_stream.FilterOutputStream]
      Returns: New builder object
  */
  static FilterOutputStreamGidBuilder builder() nothrow
  {
    return new FilterOutputStreamGidBuilder;
  }

  /**
      Get `baseStream` property.
      Returns: The underlying base stream on which the I/O ops will be done.
  */
  @property gid.gio2.output_stream.OutputStream baseStream() nothrow
  {
    return getBaseStream();
  }

  /**
      Get `closeBaseStream` property.
      Returns: Whether the base stream should be closed when the filter stream is closed.
  */
  @property bool closeBaseStream() nothrow
  {
    return getCloseBaseStream();
  }

  /**
      Gets the base stream for the filter stream.
      Returns: a [gid.gio2.output_stream.OutputStream].
  */
  gid.gio2.output_stream.OutputStream getBaseStream() nothrow
  {
    GOutputStream* _cretval;
    _cretval = g_filter_output_stream_get_base_stream(cast(GFilterOutputStream*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the base stream will be closed when stream is
      closed.
      Returns: `TRUE` if the base stream will be closed.
  */
  bool getCloseBaseStream() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_filter_output_stream_get_close_base_stream(cast(GFilterOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the base stream will be closed when stream is closed.
  
      Params:
        closeBase = `TRUE` to close the base stream.
  */
  void setCloseBaseStream(bool closeBase) nothrow
  {
    g_filter_output_stream_set_close_base_stream(cast(GFilterOutputStream*)this._cPtr, closeBase);
  }
}

/// Fluent builder implementation template for [gid.gio2.filter_output_stream.FilterOutputStream]
class FilterOutputStreamGidBuilderImpl(T) : gid.gio2.output_stream.OutputStreamGidBuilderImpl!T
{

  /**
      Set `baseStream` property.
      Params:
        propval = The underlying base stream on which the I/O ops will be done.
      Returns: Builder instance for fluent chaining
  */
  T baseStream(gid.gio2.output_stream.OutputStream propval) nothrow
  {
    return setProperty("base-stream", propval);
  }

  /**
      Set `closeBaseStream` property.
      Params:
        propval = Whether the base stream should be closed when the filter stream is closed.
      Returns: Builder instance for fluent chaining
  */
  T closeBaseStream(bool propval) nothrow
  {
    return setProperty("close-base-stream", propval);
  }
}

/// Fluent builder for [gid.gio2.filter_output_stream.FilterOutputStream]
final class FilterOutputStreamGidBuilder : FilterOutputStreamGidBuilderImpl!FilterOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterOutputStream build() nothrow
  {
    return new FilterOutputStream(cast(void*)createGObject(FilterOutputStream._getGType), Yes.Take);
  }
}
