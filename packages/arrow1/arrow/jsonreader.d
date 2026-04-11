/// Module for [JSONReader] class
module arrow.jsonreader;

import arrow.c.functions;
import arrow.c.types;
import arrow.input_stream;
import arrow.jsonread_options;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class JSONReader : gobject.object.ObjectWrap
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
    return cast(void function())garrow_json_reader_get_type != &gidSymbolNotFound ? garrow_json_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override JSONReader self()
  {
    return this;
  }

  /**
      Get builder for [arrow.jsonreader.JSONReader]
      Returns: New builder object
  */
  static JSONReaderGidBuilder builder()
  {
    return new JSONReaderGidBuilder;
  }

  /** */
  @property arrow.input_stream.InputStream input()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.input_stream.InputStream)("input");
  }

  /** */
  this(arrow.input_stream.InputStream input, arrow.jsonread_options.JSONReadOptions options = null)
  {
    GArrowJSONReader* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_new(input ? cast(GArrowInputStream*)input._cPtr(No.Dup) : null, options ? cast(GArrowJSONReadOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_json_reader_read(cast(GArrowJSONReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.jsonreader.JSONReader]
class JSONReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T input(arrow.input_stream.InputStream propval)
  {
    return setProperty("input", propval);
  }

  /** */
  T jsonTableReader(void* propval)
  {
    return setProperty("json-table-reader", propval);
  }
}

/// Fluent builder for [arrow.jsonreader.JSONReader]
final class JSONReaderGidBuilder : JSONReaderGidBuilderImpl!JSONReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  JSONReader build()
  {
    return new JSONReader(cast(void*)createGObject(JSONReader._getGType), Yes.Take);
  }
}
