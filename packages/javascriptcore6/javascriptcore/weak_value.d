/// Module for [WeakValue] class
module javascriptcore.weak_value;

import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.types;
import javascriptcore.value;

/**
    JSCWeakValue represents a weak reference to a value in a #JSCContext. It can be used
    to keep a reference to a JavaScript value without protecting it from being garbage
    collected and without referencing the #JSCContext either.
*/
class WeakValue : gobject.object.ObjectWrap
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
    return cast(void function())jsc_weak_value_get_type != &gidSymbolNotFound ? jsc_weak_value_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WeakValue self()
  {
    return this;
  }

  /**
  Get builder for [javascriptcore.weak_value.WeakValue]
  Returns: New builder object
  */
  static WeakValueGidBuilder builder()
  {
    return new WeakValueGidBuilder;
  }

  /**
      Create a new #JSCWeakValue for the JavaScript value referenced by value.
  
      Params:
        value = a #JSCValue
      Returns: a new #JSCWeakValue
  */
  this(javascriptcore.value.Value value)
  {
    JSCWeakValue* _cretval;
    _cretval = jsc_weak_value_new(value ? cast(JSCValue*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Get a #JSCValue referencing the JavaScript value of weak_value.
      Returns: a new #JSCValue or null if weak_value was cleared.
  */
  javascriptcore.value.Value getValue()
  {
    JSCValue* _cretval;
    _cretval = jsc_weak_value_get_value(cast(JSCWeakValue*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Cleared` signal.
  
      This signal is emitted when the JavaScript value is destroyed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(javascriptcore.weak_value.WeakValue weakValue))
  
          `weakValue` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCleared(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : javascriptcore.weak_value.WeakValue)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cleared", closure, after);
  }
}

class WeakValueGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The #JSCValue referencing the JavaScript value.
      Returns: Builder instance for fluent chaining
  */
  T value(javascriptcore.value.Value propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [javascriptcore.weak_value.WeakValue]
final class WeakValueGidBuilder : WeakValueGidBuilderImpl!WeakValueGidBuilder
{
  WeakValue build()
  {
    return new WeakValue(cast(void*)createGObject(WeakValue._getGType), Yes.Take);
  }
}
