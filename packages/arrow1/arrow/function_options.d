/// Module for [FunctionOptions] class
module arrow.function_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FunctionOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_function_options_get_type != &gidSymbolNotFound ? garrow_function_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FunctionOptions self()
  {
    return this;
  }

  /** */
  bool equal(arrow.function_options.FunctionOptions otherOptions = null)
  {
    bool _retval;
    _retval = cast(bool)garrow_function_options_equal(cast(GArrowFunctionOptions*)this._cPtr, otherOptions ? cast(GArrowFunctionOptions*)otherOptions._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_options_to_string(cast(GArrowFunctionOptions*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
