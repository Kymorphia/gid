/// Module for [CSVReader] class
module arrow.csvreader;

import arrow.c.functions;
import arrow.c.types;
import arrow.csvread_options;
import arrow.input_stream;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class CSVReader : gobject.object.ObjectWrap
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
    return cast(void function())garrow_csv_reader_get_type != &gidSymbolNotFound ? garrow_csv_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CSVReader self()
  {
    return this;
  }

  /** */
  this(arrow.input_stream.InputStream input, arrow.csvread_options.CSVReadOptions options = null)
  {
    GArrowCSVReader* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_new(input ? cast(GArrowInputStream*)input._cPtr(No.Dup) : null, options ? cast(GArrowCSVReadOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_csv_reader_read(cast(GArrowCSVReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}
