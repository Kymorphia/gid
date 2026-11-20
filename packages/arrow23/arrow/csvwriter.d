/// Module for [CSVWriter] class
module arrow.csvwriter;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.csvwrite_options;
import arrow.output_stream;
import arrow.record_batch_writer;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class CSVWriter : arrow.record_batch_writer.RecordBatchWriter
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
    return cast(void function())garrow_csv_writer_get_type != &gidSymbolNotFound ? garrow_csv_writer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowCSVWriter";
  }

  /** Returns `this`, for use in `with` statements. */
  override CSVWriter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.csvwriter.CSVWriter]
      Returns: New builder object
  */
  static CSVWriterGidBuilder builder() nothrow
  {
    return new CSVWriterGidBuilder;
  }

  /** */
  this(arrow.output_stream.OutputStream sink, arrow.schema.Schema schema, arrow.csvwrite_options.CSVWriteOptions options = null)
  {
    GArrowCSVWriter* _cretval;
    GError *_err;
    _cretval = garrow_csv_writer_new(sink ? cast(GArrowOutputStream*)sink._cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, options ? cast(GArrowCSVWriteOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.csvwriter.CSVWriter]
class CSVWriterGidBuilderImpl(T) : arrow.record_batch_writer.RecordBatchWriterGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.csvwriter.CSVWriter]
final class CSVWriterGidBuilder : CSVWriterGidBuilderImpl!CSVWriterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CSVWriter build() nothrow
  {
    return new CSVWriter(cast(void*)createGObject(CSVWriter._getGType), Yes.Take);
  }
}
