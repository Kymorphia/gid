/// Module for [WeakValue] class
module gid.javascriptcore6.weak_value;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.javascriptcore6.c.functions;
import gid.javascriptcore6.c.types;
import gid.javascriptcore6.types;
import gid.javascriptcore6.value;

/**
    JSCWeakValue represents a weak reference to a value in a #JSCContext. It can be used
    to keep a reference to a JavaScript value without protecting it from being garbage
    collected and without referencing the #JSCContext either.
*/
class WeakValue : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())jsc_weak_value_get_type != &gidSymbolNotFound ? jsc_weak_value_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "JSCWeakValue";
  }

  /** Returns `this`, for use in `with` statements. */
  override WeakValue self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.javascriptcore6.weak_value.WeakValue]
      Returns: New builder object
  */
  static WeakValueGidBuilder builder() nothrow
  {
    return new WeakValueGidBuilder;
  }

  /**
      Create a new #JSCWeakValue for the JavaScript value referenced by value.
  
      Params:
        value = a #JSCValue
      Returns: a new #JSCWeakValue
  */
  this(gid.javascriptcore6.value.Value value) nothrow
  {
    JSCWeakValue* _cretval;
    _cretval = jsc_weak_value_new(value ? cast(JSCValue*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Get a #JSCValue referencing the JavaScript value of weak_value.
      Returns: a new #JSCValue or null if weak_value was cleared.
  */
  gid.javascriptcore6.value.Value getValue() nothrow
  {
    JSCValue* _cretval;
    _cretval = jsc_weak_value_get_value(cast(JSCWeakValue*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.javascriptcore6.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Cleared` signal.
  
      This signal is emitted when the JavaScript value is destroyed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.javascriptcore6.weak_value.WeakValue weakValue)`
  
          `weakValue` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCleared(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.javascriptcore6.weak_value.WeakValue)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.javascriptcore6.weak_value.WeakValue.cleared");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cleared", closure, after);
  }
}

/// Fluent builder implementation template for [gid.javascriptcore6.weak_value.WeakValue]
class WeakValueGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The #JSCValue referencing the JavaScript value.
      Returns: Builder instance for fluent chaining
  */
  T value(gid.javascriptcore6.value.Value propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.javascriptcore6.weak_value.WeakValue]
final class WeakValueGidBuilder : WeakValueGidBuilderImpl!WeakValueGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WeakValue build() nothrow
  {
    return new WeakValue(cast(void*)createGObject(WeakValue._getGType), Yes.Take);
  }
}
