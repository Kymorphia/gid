/// Module for [ScannerBuilder] class
module arrowdataset.scanner_builder;

import arrow.expression;
import arrow.record_batch_reader;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.scanner;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ScannerBuilder : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_scanner_builder_get_type != &gidSymbolNotFound ? gadataset_scanner_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScannerBuilder self()
  {
    return this;
  }

  /** */
  this(arrowdataset.dataset.Dataset dataset)
  {
    GADatasetScannerBuilder* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_new(dataset ? cast(GADatasetDataset*)dataset._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrowdataset.scanner_builder.ScannerBuilder newRecordBatchReader(arrow.record_batch_reader.RecordBatchReader reader)
  {
    GADatasetScannerBuilder* _cretval;
    _cretval = gadataset_scanner_builder_new_record_batch_reader(reader ? cast(GArrowRecordBatchReader*)reader._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.scanner_builder.ScannerBuilder)(cast(GADatasetScannerBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrowdataset.scanner.Scanner finish()
  {
    GADatasetScanner* _cretval;
    GError *_err;
    _cretval = gadataset_scanner_builder_finish(cast(GADatasetScannerBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.scanner.Scanner)(cast(GADatasetScanner*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool setFilter(arrow.expression.Expression expression)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_scanner_builder_set_filter(cast(GADatasetScannerBuilder*)this._cPtr, expression ? cast(GArrowExpression*)expression._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
