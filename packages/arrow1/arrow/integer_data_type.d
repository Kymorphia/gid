/// Module for [IntegerDataType] class
module arrow.integer_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_data_type;
import arrow.types;
import gid.gid;

/** */
class IntegerDataType : arrow.numeric_data_type.NumericDataType
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
    return cast(void function())garrow_integer_data_type_get_type != &gidSymbolNotFound ? garrow_integer_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IntegerDataType self()
  {
    return this;
  }

  /** */
  bool isSigned()
  {
    bool _retval;
    _retval = cast(bool)garrow_integer_data_type_is_signed(cast(GArrowIntegerDataType*)this._cPtr);
    return _retval;
  }
}
