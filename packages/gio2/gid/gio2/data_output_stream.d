/// Module for [DataOutputStream] class
module gid.gio2.data_output_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.filter_output_stream;
import gid.gio2.output_stream;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;

/**
    Data output stream implements [gid.gio2.output_stream.OutputStream] and includes functions
    for writing data directly to an output stream.
*/
class DataOutputStream : gid.gio2.filter_output_stream.FilterOutputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_data_output_stream_get_type != &gidSymbolNotFound ? g_data_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDataOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override DataOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.data_output_stream.DataOutputStream]
      Returns: New builder object
  */
  static DataOutputStreamGidBuilder builder() nothrow
  {
    return new DataOutputStreamGidBuilder;
  }

  /**
      Get `byteOrder` property.
      Returns: Determines the byte ordering that is used when writing
        multi-byte entities (such as integers) to the stream.
  */
  @property gid.gio2.types.DataStreamByteOrder byteOrder() nothrow
  {
    return getByteOrder();
  }

  /**
      Set `byteOrder` property.
      Params:
        propval = Determines the byte ordering that is used when writing
          multi-byte entities (such as integers) to the stream.
  */
  @property void byteOrder(gid.gio2.types.DataStreamByteOrder propval) nothrow
  {
    setByteOrder(propval);
  }

  mixin SeekableT!();

  /**
      Creates a new data output stream for base_stream.
  
      Params:
        baseStream = a #GOutputStream.
      Returns: #GDataOutputStream.
  */
  this(gid.gio2.output_stream.OutputStream baseStream) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GDataOutputStream* _cretval;
      _cretval = g_data_output_stream_new(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the byte order for the stream.
      Returns: the #GDataStreamByteOrder for the stream.
  */
  gid.gio2.types.DataStreamByteOrder getByteOrder() nothrow
  {
    GDataStreamByteOrder _cretval;
    _cretval = g_data_output_stream_get_byte_order(cast(GDataOutputStream*)this._cPtr);
    gid.gio2.types.DataStreamByteOrder _retval = cast(gid.gio2.types.DataStreamByteOrder)_cretval;
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
  bool putByte(ubyte data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_byte(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putInt16(short data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int16(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putInt32(int data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int32(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putInt64(long data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_int64(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putString(string str, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_string(cast(GDataOutputStream*)this._cPtr, _str, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putUint16(ushort data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint16(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putUint32(uint data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint32(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  bool putUint64(ulong data, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_data_output_stream_put_uint64(cast(GDataOutputStream*)this._cPtr, data, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the byte order of the data output stream to order.
  
      Params:
        order = a [gid.gio2.types.DataStreamByteOrder].
  */
  void setByteOrder(gid.gio2.types.DataStreamByteOrder order) nothrow
  {
    g_data_output_stream_set_byte_order(cast(GDataOutputStream*)this._cPtr, order);
  }
}

/// Fluent builder implementation template for [gid.gio2.data_output_stream.DataOutputStream]
class DataOutputStreamGidBuilderImpl(T) : gid.gio2.filter_output_stream.FilterOutputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin SeekableGidBuilderT!();

  /**
      Set `byteOrder` property.
      Params:
        propval = Determines the byte ordering that is used when writing
          multi-byte entities (such as integers) to the stream.
      Returns: Builder instance for fluent chaining
  */
  T byteOrder(gid.gio2.types.DataStreamByteOrder propval) nothrow
  {
    return setProperty("byte-order", propval);
  }
}

/// Fluent builder for [gid.gio2.data_output_stream.DataOutputStream]
final class DataOutputStreamGidBuilder : DataOutputStreamGidBuilderImpl!DataOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataOutputStream build() nothrow
  {
    return new DataOutputStream(cast(void*)createGObject(DataOutputStream._getGType), Yes.Take);
  }
}
