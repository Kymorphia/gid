//!class DigVfunc pre
//!kind DigVfunc Namespace
//!inhibit init funcs imports

/**
 * `@gVirtual` and the helpers that add new virtual methods to the class struct of a D class (see GObjectSubclass).
 */
import std.traits : OriginalType, Parameters, ReturnType, hasUDA, isFloatingPoint, isIntegral;
import std.meta : staticMap;

import gid.gobject2.c.functions : g_type_interface_peek;
import gid.gobject2.c.types : GObject, GTypeClass, GTypeInstance;

/**
 * Marks a method of a D class as a new virtual method of its GObject type (a "vfunc"), which C code and other
 * language bindings can override by setting a function pointer in the class struct.
 *
 * The method is named `vfunc` followed by a name that starts in upper case, for example `vfuncDoThing`, and it is the
 * default implementation. The class gets a public method `doThing` that calls the implementation of the type of
 * the object. A D subclass overrides the method with `override`, and `super.vfuncDoThing(...)` chains up.
 * Code written in another language overrides the vfunc by setting the function pointer of the class struct.
 *
 * ---
 * class Shape : ObjectWrap
 * {
 *   mixin GObjectSubclass;
 *
 *   @gVirtual protected double vfuncArea() { return 0; }
 * }
 *
 * class Square : Shape
 * {
 *   mixin GObjectSubclass;
 *
 *   override protected double vfuncArea() { return side * side; }
 * }
 *
 * double a = shape.area(); // Calls the implementation of the subclass
 * ---
 *
 * The class struct of a type with `@gVirtual` methods is the class struct of the parent type followed by one function
 * pointer per method, in the order of declaration: `void*`-aligned `ReturnType function(Instance* self, Params...)`,
 * with the instance first and with `gboolean` for `bool`, `char*` for `string`, and `GObject*` for objects.
 *
 * Supported types: parameters can be `bool`, integers, `float`, `double`, enums, `string`, and `ObjectWrap` classes.
 * The return type can be `void`, `bool`, an integer, `float`, `double`, or an enum. Parameters can't be `ref`, `out`
 * or `lazy`. Strings and objects are not owned by the callee, as for `const` parameters of C functions.
 */
struct gVirtual {}

// Placeholder for "no @gVirtual overload"
private struct _DNoVirtualFn {}

// First overload of a method that is marked @gVirtual and is not an override
private template _dFirstVirtualFn(fns...)
{
  static if (fns.length == 0)
    alias _dFirstVirtualFn = _DNoVirtualFn;
  else static if (hasUDA!(fns[0], gVirtual) && !__traits(isOverrideFunction, fns[0]))
    alias _dFirstVirtualFn = fns[0];
  else
    alias _dFirstVirtualFn = _dFirstVirtualFn!(fns[1 .. $]);
}

/**
 * True if T declares a method named mem that is marked @gVirtual (see GObjectSubclass)
 */
template _isDVirtualMember(T, string mem)
{
  static if (mem.length == 0 || mem == "this" || mem == "~this" || !__traits(compiles, __traits(getOverloads, T, mem, true)))
    enum bool _isDVirtualMember = false;
  else
    enum bool _isDVirtualMember = !__traits(isSame, _dFirstVirtualFn!(__traits(getOverloads, T, mem, true)), _DNoVirtualFn);
}

// The @gVirtual method
private alias _dVirtualFn(T, string mem) = _dFirstVirtualFn!(__traits(getOverloads, T, mem, true));

/**
 * Argument types of a @gVirtual method
 */
alias _dVfuncParams(T, string mem) = Parameters!(_dVirtualFn!(T, mem));

/**
 * Return type of a @gVirtual method
 */
alias _dVfuncReturn(T, string mem) = ReturnType!(_dVirtualFn!(T, mem));

/**
 * Name of the public method that calls a @gVirtual method (`vfuncDoThing` has the invoker `doThing`)
 */
static string _dVfuncInvokerName(string mem) pure nothrow
{
  assert(mem.length > 5 && mem[0 .. 5] == "vfunc" && mem[5] >= 'A' && mem[5] <= 'Z',
    "@gVirtual method " ~ mem ~ " must be named vfunc followed by a name that starts in upper case");

  return cast(char)(mem[5] - 'A' + 'a') ~ mem[6 .. $];
}

// C type of a parameter or return type of a vfunc function pointer
private template _dVfuncCType(PT)
{
  static if (is(PT == bool))
    alias _dVfuncCType = int; // gboolean
  else static if (is(PT == byte) || is(PT == ubyte) || is(PT == short) || is(PT == ushort) || is(PT == int)
      || is(PT == uint) || is(PT == long) || is(PT == ulong) || is(PT == float) || is(PT == double))
    alias _dVfuncCType = PT;
  else static if (is(PT == enum))
    alias _dVfuncCType = OriginalType!PT;
  else static if (is(PT == string))
    alias _dVfuncCType = const(char)*;
  else static if (is(PT : imported!"gid.gobject2.object".ObjectWrap))
    alias _dVfuncCType = GObject*;
  else
    static assert(0, "Type " ~ PT.stringof ~ " is not supported by @gVirtual, use bool, integers, float, double, enums,"
      ~ " string, or ObjectWrap classes");
}

// Argument types of the vfunc function pointer after the instance
private alias _dVfuncCParams(T, string mem) = staticMap!(_dVfuncCType, _dVfuncParams!(T, mem));

private template _dVfuncCReturn(T, string mem)
{
  alias R = _dVfuncReturn!(T, mem);

  static if (is(R == void))
    alias _dVfuncCReturn = void;
  else static if (is(R == bool) || is(R == enum) || isIntegral!R || isFloatingPoint!R)
    alias _dVfuncCReturn = _dVfuncCType!R;
  else
    static assert(0, "Return type " ~ R.stringof ~ " of " ~ T.stringof ~ "." ~ mem ~ " is not supported by @gVirtual, use"
      ~ " void, bool, integers, float, double, or an enum");
}

// Value returned when no implementation is called (0 also for floating point types, whose init is NaN)
private template _dVfuncZero(R)
{
  static if (isFloatingPoint!R)
    enum R _dVfuncZero = 0;
  else
    enum R _dVfuncZero = R.init;
}

// D value to C value (argument of a call through the class struct, or return value of a trampoline)
private static auto _dVfuncToC(PT)(PT val)
{
  static if (is(PT == bool))
    return val ? 1 : 0;
  else static if (is(PT == enum))
    return cast(OriginalType!PT)val;
  else static if (is(PT == string))
  {
    import std.string : toStringz;
    return val is null ? null : val.toStringz; // null stays null
  }
  else static if (is(PT : imported!"gid.gobject2.object".ObjectWrap))
    return val ? cast(GObject*)val._cPtr : null;
  else
    return val;
}

// C value to D value (argument of a trampoline, or return value of a call through the class struct)
private static PT _dVfuncFromC(PT, CT)(CT val)
{
  static if (is(PT == bool))
    return val != 0;
  else static if (is(PT == enum))
    return cast(PT)val;
  else static if (is(PT == string))
    return imported!"gid.core.utils".fromCString(val);
  else static if (is(PT : imported!"gid.gobject2.object".ObjectWrap))
    return imported!"gid.gobject2.object".ObjectWrap._getDObject!PT(cast(void*)val, imported!"std.typecons".No.Take);
  else
    return val;
}

// Offset of the function pointer of a @gVirtual method of T from the start of the class struct. The slots of T follow
// the class struct of its parent type. The start is set when the GType of T is registered.
private template _dVfuncBase(T)
{
  static __gshared size_t _dVfuncBase;
}

/**
 * Names of the @gVirtual methods declared by T, in order of declaration
 */
template _dVfuncMembers(T)
{
  enum string[] _dVfuncMembers = ()
  {
    string[] names;

    static foreach (mem; __traits(derivedMembers, T))
    {
      static if (_isDVirtualMember!(T, mem))
        names ~= mem;
    }

    return names;
  }();
}

private static size_t _dVfuncOffset(T, string mem)() nothrow
{
  enum idx = ()
  {
    size_t i;

    foreach (j, m; _dVfuncMembers!T)
    {
      if (m == mem)
        i = j;
    }

    return i;
  }();

  return _dVfuncBase!T + idx * (void*).sizeof;
}

/**
 * Number of @gVirtual methods declared by T
 */
enum size_t _dVfuncCount(T) = _dVfuncMembers!T.length;

/**
 * Class struct size of T given the size of the class struct of its parent: the slots follow the parent's class struct.
 * Sets the position of the slots. The size of the parent if T has no @gVirtual methods.
 */
package static uint _dVfuncClassSize(T)(uint parentSize) nothrow
{
  static if (_dVfuncCount!T == 0)
    return parentSize;
  else
  {
  enum ptrSize = (void*).sizeof;
  auto base = (parentSize + ptrSize - 1) & ~(ptrSize - 1);
  _dVfuncBase!T = base;
  return cast(uint)(base + _dVfuncCount!T * ptrSize);
  }
}

/**
 * Call a @gVirtual method through the class struct of the object (or its interface struct if T is an interface), so
 * that implementations in other languages are used. Returns 0 (or the init value) if the slot is not set.
 */
static _dVfuncReturn!(T, mem) _dVfuncInvoke(T, string mem)(T self, _dVfuncParams!(T, mem) args)
{
  alias R = _dVfuncReturn!(T, mem);
  alias CR = _dVfuncCReturn!(T, mem);
  alias Fn = extern(C) CR function(GObject*, _dVfuncCParams!(T, mem)) nothrow;

  auto obj = cast(GObject*)(cast(imported!"gid.gobject2.object".ObjectWrap)self)._cPtr;
  auto klass = (cast(GTypeInstance*)obj).gClass;

  static if (is(T == interface)) // Slots are in the interface struct of the class of the object
    void* vtable = g_type_interface_peek(klass, T._getGType());
  else
    void* vtable = klass;

  auto fn = vtable ? *cast(Fn*)(cast(ubyte*)vtable + _dVfuncOffset!(T, mem)) : null;

  static if (is(R == void))
  {
    if (!fn)
      return;
  }
  else
  {
    if (!fn)
      return _dVfuncZero!R;
  }

  imported!"std.typecons".Tuple!(_dVfuncCParams!(T, mem)) cparams;

  static foreach (i, PT; _dVfuncParams!(T, mem))
    cparams[i] = _dVfuncToC(args[i]);

  static if (is(R == void))
    fn(obj, cparams[]);
  else
    return _dVfuncFromC!R(fn(obj, cparams[]));
}

// Function pointer of a class or interface struct, that calls the method of the D object
private static extern(C) _dVfuncCReturn!(T, mem) _dVfuncTrampoline(T, string mem)(GObject* obj,
  _dVfuncCParams!(T, mem) cargs) nothrow
{
  import gid.core.utils : gidInvokeCallbackExceptionHandler;
  import std.typecons : Tuple;

  imported!"gid.core.utils".gidAttachThread();

  alias P = _dVfuncParams!(T, mem);
  alias R = _dVfuncReturn!(T, mem);
  enum where = T.stringof ~ "." ~ mem;
  static if (is(T == interface))
    enum impl = mem; // Public interface method, implemented by the D class
  else
    enum impl = "_gidVfuncImpl_" ~ _dVfuncInvokerName(mem);

  auto self = cast(T)imported!"gid.gobject2.object".ObjectWrap._vfuncDObject(obj);

  if (self)
  {
    try
    {
      Tuple!P params;

      static foreach (i, PT; P)
        params[i] = _dVfuncFromC!PT(cargs[i]);

      static if (is(R == void))
        __traits(getMember, self, impl)(params[]);
      else
        return _dVfuncToC(__traits(getMember, self, impl)(params[]));
    }
    catch (Exception e)
      imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, where);
  }

  static if (!is(R == void))
    return _dVfuncZero!(_dVfuncCReturn!(T, mem));
}

/**
 * Install the trampolines of the @gVirtual methods of T into its class struct, or into an interface struct if T is an
 * interface (see GObjectSubclass and GObjectInterface). No-op if T has none.
 */
package static void _installDVfuncs(T)(void* klass) nothrow
{
  static foreach (mem; _dVfuncMembers!T)
    *cast(void**)(cast(ubyte*)klass + _dVfuncOffset!(T, mem)) = cast(void*)&_dVfuncTrampoline!(T, mem);
}
