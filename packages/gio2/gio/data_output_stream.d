/// Module for [DataOutputStream] class
module gio.data_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.filter_output_stream;
import gio.output_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.error;

/**
    Data output stream implements [gio.output_stream.OutputStream] and includes functions
    for writing data directly to an output stream.
*/
class DataOutputStream : gio.filter_output_stream.FilterOutputStream, gio.seekable.Seekable
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
    return cast(void function())g_data_output_stream_get_type != &gidSymbolNotFound ? g_data_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataOutputStream self()
  {
    return this;
  }

  /**
      Get `byteOrder` property.
      Returns: Determines the byte ordering that is used when writing
      multi-byte entities (such as integers) to the stream.
  */
  @property gio.types.DataStreamByteOrder byteOrder()
  {
    return getByteOrder();
  }

  /**
      Set `byteOrder` property.
      Params:
        propval = Determines the byte ordering that is used when writing
        multi-byte entities (such as integers) to the stream.
  */
  @property void byteOrder(gio.types.DataStreamByteOrder propval)
  {
    return setByteOrder(propval);
  }

  mixin SeekableT!();

  /**
      Creates a new data output stream for base_stream.
  
      Params:
        baseStream = a #GOutputStream.
      Returns: #GDataOutputStream.
  */
  this(gio.output_stream.OutputStream baseStream)
  {
    GDataOutputStream* _cretval;
    _cretval = g_data_output_stream_new(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the byte order for the stream.
      Returns: the #GDataStreamByteOrder for the stream.
  */
  gio.types.DataStreamByteOrder getByteOrder()
  {
    GDataStreamByteOrder _cretval;
    _cretval = g_data_output_stream_get_byte_order(cast(GDataOutputStream*)this._cPtr);
    gio.types.DataStreamByteOrder _retval = cast(gio.types.DataStreamByteOrder)_cretval;
    return _retval;
  }

  /**
      Puts a byte into the output stream.
  
      Params:
        data = a #guchar.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putByte(ubyte data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_byte(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts a signed 16-bit integer into the output stream.
  
      Params:
        data = a #gint16.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putInt16(short data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int16(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts a signed 32-bit integer into the output stream.
  
      Params:
        data = a #gint32.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putInt32(int data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int32(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts a signed 64-bit integer into the stream.
  
      Params:
        data = a #gint64.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putInt64(long data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int64(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts a string into the output stream.
  
      Params:
        str = a string.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if string was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putString(string str, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _str = str.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_string(cast(GDataOutputStream*)this._cPtr, _str, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts an unsigned 16-bit integer into the output stream.
  
      Params:
        data = a #guint16.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putUint16(ushort data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint16(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts an unsigned 32-bit integer into the stream.
  
      Params:
        data = a #guint32.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putUint32(uint data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint32(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Puts an unsigned 64-bit integer into the stream.
  
      Params:
        data = a #guint64.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if data was successfully added to the stream.
      Throws: [ErrorWrap]
  */
  bool putUint64(ulong data, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint64(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the byte order of the data output stream to order.
  
      Params:
        order = a [gio.types.DataStreamByteOrder].
  */
  void setByteOrder(gio.types.DataStreamByteOrder order)
  {
    g_data_output_stream_set_byte_order(cast(GDataOutputStream*)this._cPtr, order);
  }
}
