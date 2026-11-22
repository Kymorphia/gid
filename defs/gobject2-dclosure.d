//!class DClosure pre
//!kind DClosure Opaque
//!inhibit init funcs

import std.conv : to;

import gid.gobject2.closure;
public import gid.gobject2.value;
import gid.glib2.variant;

/**
 * Closure used for D delegates.
 */
class DClosure : Closure
{
  private void* _contextPtr; // Used to keep a reference to delegate context so it doesn't get GC'd

  /** */
  this(T)(T cb, GClosureMarshal cMarshal) nothrow
  {
    static if (is(T == delegate))
      _contextPtr = cast(void*)cb.ptr;

    auto closure = g_closure_new_simple(DGClosure!T.sizeof, null);
    g_closure_ref(closure);
    g_closure_sink(closure);

    auto dgClosure = cast(DGClosure!T*)closure;
    dgClosure.cb = cb;
    g_closure_set_marshal(closure, cMarshal);
    super(closure, Yes.Take);
  }

  /** */
  this(T, Flag!"Swap" swap = No.Swap)(T cb) nothrow
  {
    this(cb, &_cmarshal!(T, swap));
  }

  private static extern(C) void _cmarshal(T, Flag!"Swap" swap)(GClosure* closure, GValue* returnValue, uint nParams,
    const(GValue)* paramVals, void* invocHint, void* marshalData) nothrow
  {
    auto dClosure = cast(DGClosure!T*)closure;

    if (Parameters!T.length > nParams)
    {
      gidInvokeCallbackExceptionHandler(new Exception("DClosure has " ~ nParams.to!string
        ~ " parameters, expected at least " ~ Parameters!T.length.to!string));
      return;
    }

    GValue[] swapParams;

    static if (swap) // Move the first argument to the end?
    {
      swapParams = paramVals[1 .. nParams] ~ paramVals[0];
      paramVals = swapParams.ptr;
    }

    try
    {
      mixin(callbackMixin!T);
    }
    catch (Exception e)
      gidInvokeCallbackExceptionHandler(e, "gid.gobject2.dclosure.DGClosure.cb");
  }

  private static string callbackMixin(T)() nothrow
  {
    string cb;

    static if (!is(ReturnType!T == void))
      cb = "auto ret = ";

    cb ~= "dClosure.cb(";

    foreach (i, param; Parameters!T)
      cb ~= (i > 0 ? ", " : "") ~ "getVal!(Parameters!T[" ~ i.to!string ~ "])(&paramVals[" ~ i.to!string ~ "])";

    cb ~= ");\n";

    static if (!is(ReturnType!T == void))
      cb ~= "setVal!(ReturnType!T)(returnValue, ret);\n";

    return cb;
  }
}

/**
 * New GClosure type with a delegate pointer
 */
struct DGClosure(T)
{
  GClosure closure;
  T cb;
  bool swap;
}
