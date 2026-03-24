/// Module for [TableBatchReader] class
module arrow.table_batch_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch_reader;
import arrow.table;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TableBatchReader : arrow.record_batch_reader.RecordBatchReader
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
    return cast(void function())garrow_table_batch_reader_get_type != &gidSymbolNotFound ? garrow_table_batch_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TableBatchReader self()
  {
    return this;
  }

  /**
  Get builder for [arrow.table_batch_reader.TableBatchReader]
  Returns: New builder object
  */
  static TableBatchReaderGidBuilder builder()
  {
    return new TableBatchReaderGidBuilder;
  }

  /** */
  this(arrow.table.Table table)
  {
    GArrowTableBatchReader* _cretval;
    _cretval = garrow_table_batch_reader_new(table ? cast(GArrowTable*)table._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Set the desired maximum chunk size of record batches.
      
      The actual chunk size of each record batch may be smaller,
      depending on actual chunking characteristics of each table column.
  
      Params:
        maxChunkSize = The maximum chunk size of record batches.
  */
  void setMaxChunkSize(long maxChunkSize)
  {
    garrow_table_batch_reader_set_max_chunk_size(cast(GArrowTableBatchReader*)this._cPtr, maxChunkSize);
  }
}

class TableBatchReaderGidBuilderImpl(T) : arrow.record_batch_reader.RecordBatchReaderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.table_batch_reader.TableBatchReader]
final class TableBatchReaderGidBuilder : TableBatchReaderGidBuilderImpl!TableBatchReaderGidBuilder
{
  TableBatchReader build()
  {
    return new TableBatchReader(cast(void*)createGObject(TableBatchReader._getGType), Yes.Take);
  }
}
