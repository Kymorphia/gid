/// Module for [Function] class
module arrow.function_;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.execute_context;
import arrow.function_doc;
import arrow.function_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;
import gobject.types;

/** */
class Function : gobject.object.ObjectWrap
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
    return cast(void function())garrow_function_get_type != &gidSymbolNotFound ? garrow_function_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Function self()
  {
    return this;
  }

  /** */
  static arrow.function_.Function[] all()
  {
    GList* _cretval;
    _cretval = garrow_function_all();
    auto _retval = gListToD!(arrow.function_.Function, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  static arrow.function_.Function find(string name)
  {
    GArrowFunction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_function_find(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.function_.Function)(cast(GArrowFunction*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.function_.Function otherFunction)
  {
    bool _retval;
    _retval = cast(bool)garrow_function_equal(cast(GArrowFunction*)this._cPtr, otherFunction ? cast(GArrowFunction*)otherFunction._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.datum.Datum execute(arrow.datum.Datum[] args, arrow.function_options.FunctionOptions options = null, arrow.execute_context.ExecuteContext context = null)
  {
    GArrowDatum* _cretval;
    auto _args = gListFromD!(arrow.datum.Datum)(args);
    scope(exit) containerFree!(GList*, arrow.datum.Datum, GidOwnership.None)(_args);
    GError *_err;
    _cretval = garrow_function_execute(cast(GArrowFunction*)this._cPtr, _args, options ? cast(GArrowFunctionOptions*)options._cPtr(No.Dup) : null, context ? cast(GArrowExecuteContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.datum.Datum)(cast(GArrowDatum*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.function_options.FunctionOptions getDefaultOptions()
  {
    GArrowFunctionOptions* _cretval;
    _cretval = garrow_function_get_default_options(cast(GArrowFunction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.function_options.FunctionOptions)(cast(GArrowFunctionOptions*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.function_doc.FunctionDoc getDoc()
  {
    GArrowFunctionDoc* _cretval;
    _cretval = garrow_function_get_doc(cast(GArrowFunction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.function_doc.FunctionDoc)(cast(GArrowFunctionDoc*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_function_get_name(cast(GArrowFunction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gobject.types.GType getOptionsType()
  {
    gobject.types.GType _retval;
    _retval = garrow_function_get_options_type(cast(GArrowFunction*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_to_string(cast(GArrowFunction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
