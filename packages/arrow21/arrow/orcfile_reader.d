/// Module for [ORCFileReader] class
module arrow.orcfile_reader;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.seekable_input_stream;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class ORCFileReader : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_orc_file_reader_get_type != &gidSymbolNotFound ? garrow_orc_file_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowORCFileReader";
  }

  /** Returns `this`, for use in `with` statements. */
  override ORCFileReader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.orcfile_reader.ORCFileReader]
      Returns: New builder object
  */
  static ORCFileReaderGidBuilder builder() nothrow
  {
    return new ORCFileReaderGidBuilder;
  }

  /** */
  @property arrow.seekable_input_stream.SeekableInputStream input() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.seekable_input_stream.SeekableInputStream)("input");
  }

  /** */
  this(arrow.seekable_input_stream.SeekableInputStream file)
  {
    GArrowORCFileReader* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_new(file ? cast(GArrowSeekableInputStream*)file._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }

  /** */
  int[] getFieldIndexes() nothrow
  {
    const(int)* _cretval;
    uint _cretlength;
    _cretval = garrow_orc_file_reader_get_field_indexes(cast(GArrowORCFileReader*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  int[] getFieldIndices() nothrow
  {
    const(int)* _cretval;
    uint _cretlength;
    _cretval = garrow_orc_file_reader_get_field_indices(cast(GArrowORCFileReader*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  long getNRows() nothrow
  {
    long _retval;
    _retval = garrow_orc_file_reader_get_n_rows(cast(GArrowORCFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  long getNStripes() nothrow
  {
    long _retval;
    _retval = garrow_orc_file_reader_get_n_stripes(cast(GArrowORCFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.record_batch.RecordBatch readStripe(long i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_stripe(cast(GArrowORCFileReader*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readStripes()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_stripes(cast(GArrowORCFileReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.schema.Schema readType()
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_type(cast(GArrowORCFileReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setFieldIndexes(int[] fieldIndexes = null) nothrow
  {
    uint _nFieldIndexes;
    if (fieldIndexes)
      _nFieldIndexes = cast(uint)fieldIndexes.length;

    auto _fieldIndexes = cast(int*)fieldIndexes.ptr;
    garrow_orc_file_reader_set_field_indexes(cast(GArrowORCFileReader*)this._cPtr, _fieldIndexes, _nFieldIndexes);
  }

  /** */
  void setFieldIndices(int[] fieldIndices = null) nothrow
  {
    uint _nFieldIndices;
    if (fieldIndices)
      _nFieldIndices = cast(uint)fieldIndices.length;

    auto _fieldIndices = cast(int*)fieldIndices.ptr;
    garrow_orc_file_reader_set_field_indices(cast(GArrowORCFileReader*)this._cPtr, _fieldIndices, _nFieldIndices);
  }
}

/// Fluent builder implementation template for [arrow.orcfile_reader.ORCFileReader]
class ORCFileReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T input(arrow.seekable_input_stream.SeekableInputStream propval) nothrow
  {
    return setProperty("input", propval);
  }

  /** */
  T orcFileReader(void* propval) nothrow
  {
    return setProperty("orc-file-reader", propval);
  }
}

/// Fluent builder for [arrow.orcfile_reader.ORCFileReader]
final class ORCFileReaderGidBuilder : ORCFileReaderGidBuilderImpl!ORCFileReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ORCFileReader build() nothrow
  {
    return new ORCFileReader(cast(void*)createGObject(ORCFileReader._getGType), Yes.Take);
  }
}
