/// Module for [DigSignal] class
module gid.gobject2.dig_signal;

public import gid.core.basictypes;

/**
* `@gSignal` and the helpers that install GObject signals on a D class (see GObjectSubclass).
*/
import std.traits : ParameterStorageClass, ParameterStorageClassTuple, Parameters, ReturnType, hasUDA, isCallable;
import std.typecons : Flag, No, Tuple;

import gid.glib2.c.functions;
import gid.glib2.c.types : GLogLevelFlags;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;

/**
* How the return values of the handlers of a signal that returns a value are combined (see gSignal).
*/
enum gSignalAccumulator
{
  Auto, /// `TrueHandled` for a signal that returns `bool`, otherwise `Last`
  Last, /// The value returned by the last handler that runs is the result
  TrueHandled, /// Stop at the first handler that returns true, which is the result (`bool` only)
  FirstWins, /// Stop after the first handler, whose value is the result
}

/**
* Declares a GObject signal on a public method of a class that uses GObjectSubclass or GObjectExport.
*
* The method gives the signature of the signal and its body is the default handler (a class handler). Leave the body
* empty if there is nothing to do. The mixin adds `emitFoo(...)` to emit the signal of a method `foo` and
* `connectFoo(callback)` to connect to it, in the same way as the signals of the gid bindings. A callback takes the
* signal arguments and, optionally, the instance as the last parameter. C and other languages connect with
* `g_signal_connect()` and emit with `g_signal_emit_by_name()`.
*
* The signal name is the D name written in kebab-case (`valueChanged` becomes `value-changed`), unless you pass a
* name. Pass `SignalFlags` to change the flags, which default to `RunLast`. Use `SignalFlags.Detailed` for a signal
* with a detail (`emitFoo(detail, ...)` and `connectFoo(detail, callback)`), and `SignalFlags.Action` for an action
* signal. Pass a `gSignalAccumulator` to choose how the return values of the handlers of a signal that returns a value
* are combined, or a custom accumulator `static bool name(ref R total, R handlerReturn)` of the class (return true to
* continue). A signal that returns `bool` stops at the first handler that returns true by default.
*
* Argument and return types: `bool`, integers (`byte`/`ubyte`/`short`/`int`/`uint`/`long`/`ulong`), `float`/`double`,
* `string`, `Variant`, gid-wrapped boxed and `ObjectWrap` types, and enums/flags that have `_getGType` or whose GType
* name is passed in `typeNames` of `@(gSignal.create(...))` (one entry per argument, then one for the return type; use
* null for the other entries).
*
* A D class that derives from the class can `override` the method to change the default handler.
*
* Params:
*   name = GObject signal name, or null to derive one from the D name
*   flags = Signal flags, or 0 for `RunLast`
*   accumulate = How the handler return values are combined
*   accumulator = Name of a custom accumulator method of the class, or null
*   typeNames = GType names of enum and flags types without `_getGType`, for the arguments and then the return type
*
* Example:
* ---
* class Foo : ObjectWrap
* {
*   mixin GObjectSubclass;
*
*   @gSignal void changed(int count, string reason) {}
*   @gSignal("value-set") void valueSet() {}
*   @gSignal(SignalFlags.Detailed | SignalFlags.RunFirst) void tagged(string text) {}
*   @gSignal bool handleThing(int what) { return false; }
* }
*
* auto foo = new Foo;
* foo.connectChanged((int count, string reason, Foo self) { writeln(reason); });
* foo.emitChanged(3, "because");
* ---
*/
struct gSignal
{
  string name; /// GObject signal name, or null to derive one from the D name
  GSignalFlags flags = cast(GSignalFlags)0; /// Signal flags, or 0 for `RunLast`
  gSignalAccumulator accumulate; /// How the handler return values are combined
  string accumulator; /// Name of a custom accumulator method of the class, or null
  string[] typeNames; /// GType names of enum and flags types without `_getGType` (arguments, then return type)

  this(string name)
  {
    this.name = name;
  }

  this(GSignalFlags flags)
  {
    this.flags = flags;
  }

  this(gSignalAccumulator accumulate)
  {
    this.accumulate = accumulate;
  }

  /// Build a signal UDA with any combination of fields.
  static gSignal create(string name = null, GSignalFlags flags = cast(GSignalFlags)0,
  gSignalAccumulator accumulate = gSignalAccumulator.Auto, string accumulator = null, string[] typeNames = null)
  {
    gSignal s;
    s.name = name;
    s.flags = flags;
    s.accumulate = accumulate;
    s.accumulator = accumulator;
    s.typeNames = typeNames;
    return s;
  }
}


// Placeholder for "no @gSignal overload"
private struct _DNoSignalFn {}

// First overload of a method that is marked @gSignal and is not an override
private template _dFirstSignalFn(fns...)
{
  static if (fns.length == 0)
    alias _dFirstSignalFn = _DNoSignalFn;
  else static if (hasUDA!(fns[0], gSignal) && !__traits(isOverrideFunction, fns[0]))
  alias _dFirstSignalFn = fns[0];
  else
    alias _dFirstSignalFn = _dFirstSignalFn!(fns[1 .. $]);
}

/**
* True if T declares a method named mem that is marked @gSignal (see GObjectSubclass)
*/
template _isDSignalMember(T, string mem)
{
  static if (mem.length == 0 || mem == "this" || mem == "~this" || !__traits(compiles, __traits(getOverloads, T, mem)))
    enum bool _isDSignalMember = false;
  else
    enum bool _isDSignalMember = !__traits(isSame, _dFirstSignalFn!(__traits(getOverloads, T, mem)), _DNoSignalFn);
}

// The @gSignal method
package alias _dSignalFn(T, string mem) = _dFirstSignalFn!(__traits(getOverloads, T, mem));

/**
* Argument types of a @gSignal method
*/
alias _dSignalParams(T, string mem) = Parameters!(_dSignalFn!(T, mem));

/**
* Return type of a @gSignal method
*/
alias _dSignalReturn(T, string mem) = ReturnType!(_dSignalFn!(T, mem));

// @gSignal value of a method (init if the attribute has no arguments)
private static gSignal _gSignalOf(alias member)() pure nothrow
{
  static foreach (attr; __traits(getAttributes, member))
  {
    static if (is(typeof(attr) == gSignal))
      return attr;
    else static if (is(attr == gSignal))
    return gSignal.init;
  }

  return gSignal.init;
}

package template _dSignalUDA(T, string mem)
{
  enum gSignal _dSignalUDA = _gSignalOf!(_dSignalFn!(T, mem));
}

/**
* True if a @gSignal method is declared with SignalFlags.Detailed
*/
template _dSignalDetailed(T, string mem)
{
  enum bool _dSignalDetailed = (_dSignalUDA!(T, mem).flags & GSignalFlags.Detailed) != 0;
}

/**
* Method name with the first letter in upper case (`valueChanged` becomes `ValueChanged`)
*/
static string _dSignalTitle(string mem) pure nothrow
{
  if (mem.length == 0 || mem[0] < 'a' || mem[0] > 'z')
    return mem;

  return cast(char)(mem[0] - 'a' + 'A') ~ mem[1 .. $];
}

// GObject signal name: the explicit name or the D name in kebab-case
package template _dSignalName(T, string mem)
{
  enum string _dSignalName = imported!"gid.gobject2.dig"._dPropertyName(mem, _dSignalUDA!(T, mem).name);
}

// GType name given for argument i (the return type is the entry after the arguments)
private static string _dSignalTypeName(T, string mem, size_t i)() pure nothrow
{
  enum names = _dSignalUDA!(T, mem).typeNames;
  return i < names.length ? names[i] : null;
}

// GType of a signal argument or return type
private static GType _dSignalValueGType(PT, string typeName, string where)()
{
  static if (is(PT == void))
    return imported!"gid.gobject2.types".GTypeEnum.None;
  else static if (is(PT == bool))
  return imported!"gid.gobject2.types".GTypeEnum.Boolean;
  else static if (is(PT == byte))
  return imported!"gid.gobject2.types".GTypeEnum.Char;
  else static if (is(PT == ubyte))
  return imported!"gid.gobject2.types".GTypeEnum.Uchar;
  else static if (is(PT == short) || is(PT == int))
  return imported!"gid.gobject2.types".GTypeEnum.Int;
  else static if (is(PT == ushort) || is(PT == uint))
  return imported!"gid.gobject2.types".GTypeEnum.Uint;
  else static if (is(PT == long))
  return imported!"gid.gobject2.types".GTypeEnum.Int64;
  else static if (is(PT == ulong))
  return imported!"gid.gobject2.types".GTypeEnum.Uint64;
  else static if (is(PT == float))
  return imported!"gid.gobject2.types".GTypeEnum.Float;
  else static if (is(PT == double))
  return imported!"gid.gobject2.types".GTypeEnum.Double;
  else static if (is(PT == string))
  return imported!"gid.gobject2.types".GTypeEnum.String;
  else static if (is(PT == imported!"gid.glib2.variant".Variant))
  return imported!"gid.gobject2.types".GTypeEnum.Variant;
  else static if (__traits(compiles, PT._getGType()))
  return PT._getGType;
  else static if (typeName.length > 0 || is(PT == enum))
  {
    import gid.gobject2.c.functions : g_type_from_name;
    import std.string : toStringz;

    auto gtype = g_type_from_name((typeName.length > 0 ? typeName : PT.stringof).toStringz);

    if (!gtype)
      g_log("Gid", GLogLevelFlags.LevelCritical, "No GType for %s of signal %s", PT.stringof.ptr, where.ptr);

    return gtype;
  }
  else
    static assert(0, "Unsupported @gSignal type " ~ PT.stringof ~ " of " ~ where);
}

/**
* Emit a @gSignal signal of T (the emit method generated by GObjectSubclass)
* Params:
*   T = The D class which declares the signal
*   mem = Name of the @gSignal method
*   self = The instance
*   detail = Signal detail or null
*   args = Signal arguments
* Returns: The return value of the signal (nothing if it returns void)
*/
static _dSignalReturn!(T, mem) _dSignalEmit(T, string mem)(T self, string detail, _dSignalParams!(T, mem) args)
{
  import gid.gobject2.value : getVal, setVal;
  import gid.gobject2.c.functions : g_signal_emitv, g_signal_lookup, g_value_init, g_value_set_object, g_value_unset;
  import std.string : toStringz;

  alias P = _dSignalParams!(T, mem);
  alias R = _dSignalReturn!(T, mem);
  enum where = T.stringof ~ "." ~ mem;
  static __gshared uint signalId;

  if (!signalId)
    signalId = g_signal_lookup(_dSignalName!(T, mem).toStringz, T._getGType);

  GValue[P.length + 1] vals;

  scope(exit)
  {
    foreach (ref v; vals)
      if (v.gType)
      g_value_unset(&v);
  }

  g_value_init(&vals[0], T._getGType);
  g_value_set_object(&vals[0], cast(GObject*)self._cPtr);

  static foreach (i, PT; P)
  {
    g_value_init(&vals[i + 1], _dSignalValueGType!(PT, _dSignalTypeName!(T, mem, i), where));
    setVal!PT(&vals[i + 1], args[i]);
  }

  const quark = detail.length > 0 ? g_quark_from_string(detail.toStringz) : 0;

  static if (is(R == void))
    g_signal_emitv(vals.ptr, signalId, quark, null);
  else
  {
    GValue retVal;

    scope(exit)
    {
      if (retVal.gType)
        g_value_unset(&retVal);
    }

    g_value_init(&retVal, _dSignalValueGType!(R, _dSignalTypeName!(T, mem, P.length), where));
    g_signal_emitv(vals.ptr, signalId, quark, &retVal);
    return getVal!R(&retVal);
  }
}

/**
* Connect a callback to a @gSignal signal of T (the connect method generated by GObjectSubclass)
* Params:
*   T = The D class which declares the signal
*   mem = Name of the @gSignal method
*   C = The callback type
*   self = The instance
*   detail = Signal detail or null
*   callback = The delegate or function to connect
*   after = Yes.After to run the callback after the default handler
* Returns: The signal connection ID
*/
static gulong _dSignalConnect(T, string mem, C)(T self, string detail, C callback, Flag!"After" after) nothrow
{
  import gid.gobject2.value : getVal, setVal;
  import gid.gobject2.dclosure : DClosure, DGClosure;
  import gid.core.utils : gidInvokeCallbackExceptionHandler;
  import std.traits : ParameterStorageClass, ParameterStorageClassTuple, isCallable;
  import std.typecons : Tuple;

  alias P = _dSignalParams!(T, mem);
  alias R = _dSignalReturn!(T, mem);
  enum where = T.stringof ~ "." ~ mem;
  enum expected = "`" ~ R.stringof ~ " delegate(" ~ P.stringof[1 .. $ - 1] ~ (P.length > 0 ? ", " : "") ~ T.stringof
  ~ " self)`, the last parameters are optional";

  static assert(isCallable!C, "Callback of signal " ~ where ~ " must be a delegate or function: " ~ expected);
  static assert(is(ReturnType!C == R), "Callback of signal " ~ where ~ " must return " ~ R.stringof ~ ": " ~ expected);
  static assert(Parameters!C.length <= P.length + 1,
  "Callback of signal " ~ where ~ " takes too many parameters: " ~ expected);

  static foreach (i, PC; Parameters!C)
  {
    static assert(ParameterStorageClassTuple!C[i] == ParameterStorageClass.none,
    "Callback parameters of signal " ~ where ~ " can't be ref, out or scope");

    static if (i < P.length)
      static assert(is(PC == P[i]) || (is(PC : imported!"gid.gobject2.object".ObjectWrap) && is(P[i] : imported!"gid.gobject2.object".ObjectWrap)),
    "Callback parameter " ~ i.stringof ~ " of signal " ~ where ~ " must be " ~ P[i].stringof ~ ": " ~ expected);
    else
      static assert(is(PC : imported!"gid.gobject2.object".ObjectWrap), "The instance parameter of the callback of signal " ~ where
    ~ " must be an object type: " ~ expected);
  }

  extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals,
  void* _invocHint, void* _marshalData) nothrow
  {
    imported!"gid.core.utils".gidAttachThread();
    assert(_nParams == P.length + 1, "Unexpected number of signal parameters");
    auto _dClosure = cast(DGClosure!C*)_closure;
    Tuple!(Parameters!C) _paramTuple;

    static foreach (i, PC; Parameters!C)
    {
      static if (i < P.length)
        _paramTuple[i] = getVal!PC(&_paramVals[i + 1]);
      else
        _paramTuple[i] = getVal!PC(&_paramVals[0]);
    }

    static if (is(R == void))
    {
      try
      _dClosure.cb(_paramTuple[]);
      catch (Exception e)
      imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, where);
    }
    else
    {
      R _retval;

      try
      _retval = _dClosure.cb(_paramTuple[]);
      catch (Exception e)
      imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, where);

      if (_returnValue)
        setVal!R(_returnValue, _retval);
    }
  }

  auto closure = new DClosure(callback, &_cmarshal);
  return self.connectSignalClosure(_dSignalName!(T, mem) ~ (detail.length > 0 ? "::" ~ detail : ""), closure, after);
}

// Class closure of a @gSignal signal: calls the (virtual) D method of the instance
private static extern(C) void _dSignalClassMarshal(T, string mem)(GClosure* closure, GValue* returnValue,
uint nParams, const(GValue)* paramVals, void* invocHint, void* marshalData) nothrow
{
  import gid.gobject2.value : getVal, setVal;
  import gid.core.utils : gidInvokeCallbackExceptionHandler;
  import gid.gobject2.c.functions : g_value_get_object;
  import std.typecons : Tuple;

  imported!"gid.core.utils".gidAttachThread();

  alias P = _dSignalParams!(T, mem);
  alias R = _dSignalReturn!(T, mem);
  enum where = T.stringof ~ "." ~ mem;

  auto self = imported!"gid.gobject2.object".ObjectWrap._vfuncDObject!T(g_value_get_object(&paramVals[0]));

  if (!self || nParams != P.length + 1)
    return;

  try
  {
    Tuple!P params;

    static foreach (i, PT; P)
    params[i] = getVal!PT(&paramVals[i + 1]);

    static if (is(R == void))
      __traits(getMember, self, mem)(params[]);
    else
    {
      auto retval = __traits(getMember, self, mem)(params[]);

      if (returnValue)
        setVal!R(returnValue, retval);
    }
  }
  catch (Exception e)
  imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, where);
}

// Custom accumulator of a @gSignal signal: calls the static method named in the attribute
private static extern(C) int _dSignalAccumulate(T, string mem)(GSignalInvocationHint* hint, GValue* returnAccu,
const(GValue)* handlerReturn, void* data) nothrow
{
  import gid.gobject2.value : getVal, setVal;
  import gid.core.utils : gidInvokeCallbackExceptionHandler;

  imported!"gid.core.utils".gidAttachThread();

  alias R = _dSignalReturn!(T, mem);
  enum fn = _dSignalUDA!(T, mem).accumulator;

  try
  {
    R total = getVal!R(returnAccu);
    const cont = __traits(getMember, T, fn)(total, getVal!R(handlerReturn));
    setVal!R(returnAccu, total);
    return cont;
  }
  catch (Exception e)
  imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, T.stringof ~ "." ~ mem ~ " accumulator");

  return false;
}

private static void _installDSignal(T, string mem)(GType itype) nothrow
{
  import gid.gobject2.c.functions : g_closure_new_simple, g_closure_set_marshal, g_signal_newv;
  import std.string : toStringz;

  alias P = _dSignalParams!(T, mem);
  alias R = _dSignalReturn!(T, mem);
  enum uda = _dSignalUDA!(T, mem);
  enum where = T.stringof ~ "." ~ mem;

  static assert(__traits(getProtection, _dSignalFn!(T, mem)) == "public",
  "@gSignal method " ~ where ~ " must be public");
  static assert(uda.accumulator.length == 0 || !is(R == void), "Signal " ~ where ~ " returns nothing and can't have"
  ~ " an accumulator");

  enum runFlags = GSignalFlags.RunFirst | GSignalFlags.RunLast | GSignalFlags.RunCleanup;
  auto flags = (uda.flags & runFlags) ? uda.flags : cast(GSignalFlags)(uda.flags | GSignalFlags.RunLast);

  GType[P.length] paramTypes;

  static foreach (i, PT; P)
  paramTypes[i] = _dSignalValueGType!(PT, _dSignalTypeName!(T, mem, i), where);

  auto classClosure = g_closure_new_simple(GClosure.sizeof, null);
  g_closure_set_marshal(classClosure, cast(GClosureMarshal)&_dSignalClassMarshal!(T, mem));

  GSignalAccumulator accumulator;

  static if (uda.accumulator.length > 0)
    accumulator = cast(GSignalAccumulator)&_dSignalAccumulate!(T, mem);
  else static if (uda.accumulate == gSignalAccumulator.FirstWins)
  accumulator = cast(GSignalAccumulator)g_signal_accumulator_first_wins;
  else static if (uda.accumulate == gSignalAccumulator.TrueHandled
  || (uda.accumulate == gSignalAccumulator.Auto && is(R == bool)))
  accumulator = cast(GSignalAccumulator)g_signal_accumulator_true_handled;

  static if (uda.accumulate == gSignalAccumulator.TrueHandled)
    static assert(is(R == bool), "Signal " ~ where ~ ": TrueHandled needs a bool return type");

  g_signal_newv(_dSignalName!(T, mem).toStringz, itype, flags, classClosure, accumulator, null, null,
  _dSignalValueGType!(R, _dSignalTypeName!(T, mem, P.length), where), cast(uint)P.length, paramTypes.ptr);
}

/**
* Install the @gSignal methods of T as signals of its GObject class (see GObjectSubclass). No-op if T has none.
*/
package static void _installDSignals(T)(void* klass) nothrow
{
  auto itype = (cast(GTypeClass*)klass).gType;

  static foreach (mem; __traits(derivedMembers, T))
  {
    static if (_isDSignalMember!(T, mem))
      _installDSignal!(T, mem)(itype);
  }
}
