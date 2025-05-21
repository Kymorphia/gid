/// Module for [Time32DataType] class
module arrow.time32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.time_data_type;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Time32DataType : arrow.time_data_type.TimeDataType
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
    return cast(void function())garrow_time32_data_type_get_type != &gidSymbolNotFound ? garrow_time32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time32DataType self()
  {
    return this;
  }

  /** */
  this(arrow.types.TimeUnit unit)
  {
    GArrowTime32DataType* _cretval;
    GError *_err;
    _cretval = garrow_time32_data_type_new(unit, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}
