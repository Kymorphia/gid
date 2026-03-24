/// Module for [FeatherFileReader] class
module arrow.feather_file_reader;

import arrow.c.functions;
import arrow.c.types;
import arrow.seekable_input_stream;
import arrow.table;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class FeatherFileReader : gobject.object.ObjectWrap
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
    return cast(void function())garrow_feather_file_reader_get_type != &gidSymbolNotFound ? garrow_feather_file_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FeatherFileReader self()
  {
    return this;
  }

  /**
  Get builder for [arrow.feather_file_reader.FeatherFileReader]
  Returns: New builder object
  */
  static FeatherFileReaderGidBuilder builder()
  {
    return new FeatherFileReaderGidBuilder;
  }

  /** */
  this(arrow.seekable_input_stream.SeekableInputStream file)
  {
    GArrowFeatherFileReader* _cretval;
    GError *_err;
    _cretval = garrow_feather_file_reader_new(file ? cast(GArrowSeekableInputStream*)file._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getVersion()
  {
    int _retval;
    _retval = garrow_feather_file_reader_get_version(cast(GArrowFeatherFileReader*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.table.Table read()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_feather_file_reader_read(cast(GArrowFeatherFileReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readIndices(int[] indices)
  {
    GArrowTable* _cretval;
    uint _nIndices;
    if (indices)
      _nIndices = cast(uint)indices.length;

    auto _indices = cast(const(int)*)indices.ptr;
    GError *_err;
    _cretval = garrow_feather_file_reader_read_indices(cast(GArrowFeatherFileReader*)this._cPtr, _indices, _nIndices, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.table.Table readNames(string[] names)
  {
    GArrowTable* _cretval;
    uint _nNames;
    if (names)
      _nNames = cast(uint)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    GError *_err;
    _cretval = garrow_feather_file_reader_read_names(cast(GArrowFeatherFileReader*)this._cPtr, _names, _nNames, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.table.Table)(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }
}

class FeatherFileReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T featherReader(void* propval)
  {
    return setProperty("feather-reader", propval);
  }
}

/// Fluent builder for [arrow.feather_file_reader.FeatherFileReader]
final class FeatherFileReaderGidBuilder : FeatherFileReaderGidBuilderImpl!FeatherFileReaderGidBuilder
{
  FeatherFileReader build()
  {
    return new FeatherFileReader(cast(void*)createGObject(FeatherFileReader._getGType), Yes.Take);
  }
}
