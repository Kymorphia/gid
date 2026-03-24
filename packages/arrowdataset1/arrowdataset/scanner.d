/// Module for [Scanner] class
module arrowdataset.scanner;

import arrow.record_batch_reader;
import arrow.table;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class Scanner : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_scanner_get_type != &gidSymbolNotFound ? gadataset_scanner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Scanner self()
  {
    return this;
  }

  /**
  Get builder for [arrowdataset.scanner.Scanner]
  Returns: New builder object
  */
  static ScannerGidBuilder builder()
  {
    return new ScannerGidBuilder;
  }

  /** */
  arrow.record_batch_reader.RecordBatchReader toRecordBatchReader()
  {
    GArrowRecordBatchReader* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_to_record_batch_reader(cast(GADatasetScanner*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch_reader.RecordBatchReader)(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table toTable()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_to_table(cast(GADatasetScanner*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}

class ScannerGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T scanner(void* propval)
  {
    return setProperty("scanner", propval);
  }
}

/// Fluent builder for [arrowdataset.scanner.Scanner]
final class ScannerGidBuilder : ScannerGidBuilderImpl!ScannerGidBuilder
{
  Scanner build()
  {
    return new Scanner(cast(void*)createGObject(Scanner._getGType), No.Take);
  }
}
