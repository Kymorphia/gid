/// Module for [TableDatum] class
module arrow.table_datum;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_table_datum_get_type != &gidSymbolNotFound ? garrow_table_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TableDatum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.table_datum.TableDatum]
      Returns: New builder object
  */
  static TableDatumGidBuilder builder() nothrow
  {
    return new TableDatumGidBuilder;
  }

  /** */
  @property arrow.table.Table value() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.table.Table)("value");
  }

  /** */
  this(arrow.table.Table value) nothrow
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
  T value(arrow.table.Table propval) nothrow
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
  TableDatum build() nothrow
  {
    return new TableDatum(cast(void*)createGObject(TableDatum._getGType), Yes.Take);
  }
}
