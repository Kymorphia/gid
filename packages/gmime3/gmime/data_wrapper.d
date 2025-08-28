/// Module for [DataWrapper] class
module gmime.data_wrapper;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A wrapper for a stream which may be encoded.
*/
class DataWrapper : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_data_wrapper_get_type != &gidSymbolNotFound ? g_mime_data_wrapper_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataWrapper self()
  {
    return this;
  }

  /**
      Creates a new #GMimeDataWrapper object.
      Returns: a new data wrapper object.
  */
  this()
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
  static gmime.data_wrapper.DataWrapper newWithStream(gmime.stream.Stream stream, gmime.types.ContentEncoding encoding)
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_data_wrapper_new_with_stream(stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null, encoding);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.data_wrapper.DataWrapper)(cast(GMimeDataWrapper*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the encoding type of the stream wrapped by wrapper.
      Returns: the encoding type of the internal stream.
  */
  gmime.types.ContentEncoding getEncoding()
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_data_wrapper_get_encoding(cast(GMimeDataWrapper*)this._cPtr);
    gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets a reference to the stream wrapped by wrapper.
      Returns: a reference to the internal stream.
  */
  gmime.stream.Stream getStream()
  {
    GMimeStream* _cretval;
    _cretval = g_mime_data_wrapper_get_stream(cast(GMimeDataWrapper*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream.Stream)(cast(GMimeStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the encoding type of the internal stream.
  
      Params:
        encoding = encoding
  */
  void setEncoding(gmime.types.ContentEncoding encoding)
  {
    g_mime_data_wrapper_set_encoding(cast(GMimeDataWrapper*)this._cPtr, encoding);
  }

  /**
      Replaces the wrapper's internal stream with stream. Don't forget,
      if stream is not of the same encoding as the old stream, you'll
      want to call [gmime.data_wrapper.DataWrapper.setEncoding] as well.
      
      Note: caller is responsible for its own reference on
      stream.
  
      Params:
        stream = a #GMimeStream
  */
  void setStream(gmime.stream.Stream stream)
  {
    g_mime_data_wrapper_set_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Writes the raw (decoded) data to the output stream.
  
      Params:
        stream = output stream
      Returns: the number of bytes written or %-1 on failure.
  */
  ptrdiff_t writeToStream(gmime.stream.Stream stream)
  {
    ptrdiff_t _retval;
    _retval = g_mime_data_wrapper_write_to_stream(cast(GMimeDataWrapper*)this._cPtr, stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    return _retval;
  }
}
