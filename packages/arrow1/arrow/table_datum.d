/// Module for [TableDatum] class
module arrow.table_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.table;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class TableDatum : arrow.datum.Datum
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
    return cast(void function())garrow_table_datum_get_type != &gidSymbolNotFound ? garrow_table_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TableDatum self()
  {
    return this;
  }

  /**
      Get builder for [arrow.table_datum.TableDatum]
      Returns: New builder object
  */
  static TableDatumGidBuilder builder()
  {
    return new TableDatumGidBuilder;
  }

  /** */
  @property arrow.table.Table value()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.table.Table)("value");
  }

  /** */
  this(arrow.table.Table value)
  {
    GArrowTableDatum* _cretval;
    _cretval = garrow_table_datum_new(value ? cast(GArrowTable*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.table_datum.TableDatum]
class TableDatumGidBuilderImpl(T) : arrow.datum.DatumGidBuilderImpl!T
{

  /** */
  T value(arrow.table.Table propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.table_datum.TableDatum]
final class TableDatumGidBuilder : TableDatumGidBuilderImpl!TableDatumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TableDatum build()
  {
    return new TableDatum(cast(void*)createGObject(TableDatum._getGType), Yes.Take);
  }
}
