/// Module for [DataWrapper] class
module gid.gmime3.data_wrapper;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A wrapper for a stream which may be encoded.
*/
class DataWrapper : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_data_wrapper_get_type != &gidSymbolNotFound ? g_mime_data_wrapper_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeDataWrapper";
  }

  /** Returns `this`, for use in `with` statements. */
  override DataWrapper self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.data_wrapper.DataWrapper]
      Returns: New builder object
  */
  static DataWrapperGidBuilder builder() nothrow
  {
    return new DataWrapperGidBuilder;
  }

  /**
      Creates a new #GMimeDataWrapper object.
      Returns: a new data wrapper object.
  */
  this() nothrow
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_data_wrapper_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeDataWrapper object around stream.
  
      Params:
        stream = a #GMimeStream
        encoding = stream's encoding
      Returns: a data wrapper around stream. Since the wrapper owns its
        own reference on the stream, caller is responsible for unrefing
        its own copy.
  */
  static gid.gmime3.data_wrapper.DataWrapper newWithStream(gid.gmime3.stream.Stream stream, gid.gmime3.types.ContentEncoding encoding) nothrow
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_data_wrapper_new_with_stream(stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null, encoding);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.data_wrapper.DataWrapper)(cast(GMimeDataWrapper*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the encoding type of the stream wrapped by wrapper.
      Returns: the encoding type of the internal stream.
  */
  gid.gmime3.types.ContentEncoding getEncoding() nothrow
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_data_wrapper_get_encoding(cast(GMimeDataWrapper*)this._cPtr);
    gid.gmime3.types.ContentEncoding _retval = cast(gid.gmime3.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets a reference to the stream wrapped by wrapper.
      Returns: a reference to the internal stream.
  */
  gid.gmime3.stream.Stream getStream() nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_data_wrapper_get_stream(cast(GMimeDataWrapper*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the encoding type of the internal stream.
  
      Params:
        encoding = encoding
  */
  void setEncoding(gid.gmime3.types.ContentEncoding encoding) nothrow
  {
    g_mime_data_wrapper_set_encoding(cast(GMimeDataWrapper*)this._cPtr, encoding);
  }

  /**
      Replaces the wrapper's internal stream with stream. Don't forget,
      if stream is not of the same encoding as the old stream, you'll
      want to call [gid.gmime3.data_wrapper.DataWrapper.setEncoding] as well.
      
      Note: caller is responsible for its own reference on
      stream.
  
      Params:
        stream = a #GMimeStream
  */
  void setStream(gid.gmime3.stream.Stream stream) nothrow
  {
    g_mime_data_wrapper_set_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Writes the raw (decoded) data to the output stream.
  
      Params:
        stream = output stream
      Returns: the number of bytes written or %-1 on failure.
  */
  ptrdiff_t writeToStream(gid.gmime3.stream.Stream stream) nothrow
  {
    ptrdiff_t _retval;
    _retval = g_mime_data_wrapper_write_to_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.data_wrapper.DataWrapper]
class DataWrapperGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.data_wrapper.DataWrapper]
final class DataWrapperGidBuilder : DataWrapperGidBuilderImpl!DataWrapperGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataWrapper build() nothrow
  {
    return new DataWrapper(cast(void*)createGObject(DataWrapper._getGType), Yes.Take);
  }
}
