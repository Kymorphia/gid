/// Module for [Int8DataType] class
module arrow.int8_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;

/** */
class Int8DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_int8_data_type_get_type != &gidSymbolNotFound ? garrow_int8_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8DataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowInt8DataType* _cretval;
    _cretval = garrow_int8_data_type_new();
    this(_cretval, Yes.Take);
  }
}
