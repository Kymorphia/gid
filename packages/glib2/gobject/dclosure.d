/// Module for [DClosure] class
module gobject.dclosure;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.types;


import std.conv : to;

import gobject.closure;
public import gobject.value;
import glib.variant;

/**
* Closure used for D delegates.
*/
/** */
class DClosure : Closure
{
  void* contextPtr; // Used to keep a reference to delegate context so it doesn't get GC'd

  /** */
  this(T)(T cb, GClosureMarshal cMarshal) nothrow
  {
    static if (is(T == delegate))
      contextPtr = cast(void*)cb.ptr;

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
      gidInvokeCallbackExceptionHandler(new Exception("DClosure has " ~ nParams.to!string ~ ", expected at least "
    ~ Parameters!T.length.to!string));

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
    gidInvokeCallbackExceptionHandler(e, "gobject.dclosure.DGClosure.cb");
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
      cb ~= "setVal!(" ~ ReturnType!T.stringof ~ ")(returnValue, ret);\n";

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
