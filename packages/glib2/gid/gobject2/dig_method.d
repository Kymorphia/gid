/// Module for [DigMethod] class
module gid.gobject2.dig_method;

public import gid.core.basictypes;

/**
* `@gMethod` and the other attributes that export methods, functions and constructors of a GObjectExport class as C
* functions, which other languages call through GIR.
*/
public import gid.core.utils : GidOwnership;

import std.meta : AliasSeq, staticMap;
import std.traits : InterfacesTuple, OriginalType, ParameterIdentifierTuple, ParameterStorageClass, ParameterStorageClassTuple,
ReturnType, Unqual, functionAttributes, FunctionAttribute, isFloatingPoint, isIntegral;
import std.typecons : No, Tuple, Yes;

import gid.glib2.c.functions : g_malloc0, g_propagate_error, g_quark_from_static_string, g_return_if_fail_warning,
g_set_error_literal, g_strndup;
import gid.glib2.c.types : GError, GQuark, GVariant;
import gid.gobject2.c.functions : g_type_check_instance_is_a;
import gid.gobject2.c.types : GObject, GTypeInstance;

/**
* Exports a public method of a GObjectExport class as a C function, named after the C symbol prefix of the type and
* the method name in snake case: `describe` of `MylibCounter` gives `mylib_counter_describe(MylibCounter *self, ...)`.
* A static method gives a function without the instance parameter. Pass a name to use instead of the snake case
* method name: `@gMethod("to_text")` gives `mylib_counter_to_text`.
*
* Supported parameter and return types: `bool`, integers, `float`, `double`, enums and flags of bindings, `string`,
* `string[]`, exported D classes and interfaces and the classes and interfaces of bindings, boxed types of bindings
* (such as `gid.glib2.bytes.Bytes`) and `gid.glib2.variant.Variant`. Parameters can be `out` (any of these types) or
* `ref` (`bool`, numbers and enums).
*
* Ownership is the usual one for C functions: the caller keeps its arguments, and gets a new string, array, object
* reference or copy for the return value and `out` values (`@gTransfer(GidOwnership.None)` returns an object without
* a reference). Strings, arrays and objects can't be NULL unless the parameter or method (for the return value) is
* `@gNullable`. An exception is reported by `gidInvokeCallbackExceptionHandler` and the function returns 0 or NULL,
* unless the method is `@gThrows`.
*
* ---
* class Counter : ObjectWrap
* {
*   mixin GObjectExport;
*
*   @gMethod string describe(@gNullable string prefix) { ... }      // char *mylib_counter_describe(MylibCounter *self,
*                                                                    //   const char *prefix)
*   @gMethod @gThrows void load(string path) { ... }                 // void mylib_counter_load(MylibCounter *self,
*                                                                    //   const char *path, GError **error)
*   @gMethod static int parse(string s, out bool ok) { ... }         // int mylib_counter_parse(const char *s, gboolean *ok)
*   @gConstructor this(int step) { ... }                             // MylibCounter *mylib_counter_new(int step)
*   @gConstructor static Counter withStep(int s) { ... }             // MylibCounter *mylib_counter_new_with_step(int s)
* }
* ---
*/
struct gMethod
{
  string name; /// C name after the type prefix, or null for the snake case method name
}

/**
* Exports a constructor with parameters, or a static method which returns a new instance of the class, as a C
* constructor (see gMethod). The C name is `<prefix>_<type>_new` for a constructor, `<prefix>_<type>_new_<name>` for
* a static method (`withStep` gives `mylib_counter_new_with_step`) or when a name is passed
* (`@gConstructor("from_text")`). The public `this()` is always exported as `<prefix>_<type>_new`.
*/
struct gConstructor
{
  string name; /// Name after `new_`, or null
}

/**
* The exported method reports exceptions to the caller with a `GError **error` parameter, added after the other
* parameters (see gMethod). An `ErrorWrap` keeps its domain and code; another exception gets the domain
* `gid-d-exception-quark` (gidDExceptionQuark) and code 0, with the exception message. `@gThrows(false)` turns it off.
*/
struct gThrows
{
  bool enabled = true; ///
}

/**
* The parameter of an exported method can be NULL (null in D), or the method can return NULL (see gMethod).
*/
struct gNullable {}

/**
* Ownership of an object returned by an exported method or `out` parameter (see gMethod): `GidOwnership.Full` (a new
* reference, the default) or `GidOwnership.None`.
*/
struct gTransfer
{
  GidOwnership ownership = GidOwnership.Full; ///
}

/**
* Excludes a member from export: from auto-export (see GidExport), or a D `@property` accessor from the properties
* of GidExport.Properties.
*/
struct gNoExport {}

/**
* What GObjectExport exports without attributes, passed to GObjectExport or GObjectNamespace (for all exported
* classes in its scope). Combine the values with `|`. Members with attributes (`@gMethod`, `@gProperty`, ...) are
* always exported, and `@gNoExport` excludes a member.
*
* Only public members declared by the class itself are exported, except names starting with `_`, overrides,
* interface implementations, operator overloads, `vfunc` methods, templates, and members with `@gSignal`,
* `@gVirtual` or `@gProperty`. Constructors other than `this()` need `@gConstructor`. Signals and virtual methods
* are never automatic.
*/
enum GidExport : uint
{
  None = 0, /// Only members with attributes (the default)
  Methods = 1 << 0, /// Public instance methods (as with `@gMethod`)
  Functions = 1 << 1, /// Public static methods (as with `@gMethod`)
  Properties = 1 << 2, /// D `@property` getters and setters become GObject properties (as with `@gProperty`)
  Throws = 1 << 3, /// Exported methods that aren't `nothrow` get a `GError **error` parameter (see gThrows)
  All = Methods | Functions | Properties, /// Methods, functions and properties
}

/**
* What auto-export does with a member it can't export, such as a method with a delegate parameter: print a warning
* at compile time (the default), skip it silently, or fail to compile. Mark the member `@gNoExport` to skip it
* without a warning. Members with attributes are always compile errors when they can't be exported.
*/
enum GidSkip
{
  Warn, /// Skip the member with a compile-time message (default)
  Silent, /// Skip the member
  Error, /// Compile error
}

/**
* Exports a class like GObjectExport, with GidExport.All added to its options: public methods, static methods and
* D `@property` accessors are exported without attributes.
*
* Example:
* ---
* class Counter : ObjectWrap
* {
*   mixin GObjectExportAll;
*
*   @property int count() { return _count; }   // Property "count"
*   void reset() { _count = 0; }                 // mylib_counter_reset()
*   private int _count;
* }
* ---
*/
mixin template GObjectExportAll(Args...)
{
  mixin imported!"gid.gobject2.dig".GObjectExport!(Args, GidExport.All);
}

/// Internal: marks members generated by DiG mixins (not auto-exported)
struct _gidGenerated {}

/// Parsed options of GObjectExport or GObjectNamespace
struct _DExportOptions
{
  string[] strings; /// String options in order (null for `null`)
  bool hasFlags; /// GidExport given
  GidExport flags; /// GidExport values, combined
  bool hasSkip; /// GidSkip given
  GidSkip skip; ///
  string error; /// Problem with the options, or null

  /// String option i, or null
  string str(size_t i) const pure nothrow
  {
    return i < strings.length ? strings[i] : null;
  }
}

/**
* Parse the options of GObjectExport (maxStrings 3: ns, name, cSymbol) or GObjectNamespace (1: symbolPrefix): strings
* in order, GidExport values (combined) and one GidSkip, in any order.
*/
template _dParseExportOptions(string mixinName, size_t maxStrings, Args...)
{
  enum _DExportOptions _dParseExportOptions = () {
  _DExportOptions o;

  static foreach (i; 0 .. Args.length)
  {
    static if (!__traits(compiles, typeof(Args[i])))
      o.error = mixinName ~ ": option " ~ Args[i].stringof ~ " is not a value";
    else static if (is(typeof(Args[i]) == typeof(null)))
    o.strings ~= null;
    else static if (is(typeof(Args[i]) : string))
    o.strings ~= Args[i];
    else static if (is(typeof(Args[i]) == GidExport))
    {
      o.hasFlags = true;
      o.flags |= Args[i];
    }
    else static if (is(typeof(Args[i]) == GidSkip))
    {
      if (o.hasSkip)
        o.error = mixinName ~ ": more than one GidSkip option";

      o.hasSkip = true;
      o.skip = Args[i];
    }
    else
      o.error = mixinName ~ ": unsupported option " ~ Args[i].stringof ~ " of type " ~ typeof(Args[i]).stringof;
  }

  if (!o.error && o.strings.length > maxStrings)
    o.error = mixinName ~ ": too many string options";

  return o;
}();
}

/**
* GidExport flags of the exported class T (None for other types)
*/
template _dExportFlags(T)
{
  static if (is(T == class) && __traits(compiles, T._gidExportFlags) && __traits(compiles, T._gidExportedAs)
    && is(T._gidExportedAs == T))
  enum GidExport _dExportFlags = T._gidExportFlags;
  else
    enum GidExport _dExportFlags = GidExport.None;
}

/**
* GidSkip mode of the exported class T
*/
template _dExportSkip(T)
{
  static if (is(T == class) && __traits(compiles, T._gidExportSkip) && __traits(compiles, T._gidExportedAs)
    && is(T._gidExportedAs == T))
  enum GidSkip _dExportSkip = T._gidExportSkip;
  else
    enum GidSkip _dExportSkip = GidSkip.Warn;
}

/**
* GError domain of D exceptions reported by exported methods (see gThrows), "gid-d-exception-quark"
*/
GQuark gidDExceptionQuark() nothrow
{
  return g_quark_from_static_string("gid-d-exception-quark");
}

/// Kind of an exported method
enum _DExportKind
{
  Method, /// Instance method
  Function, /// Static method
  Constructor, /// Constructor or static factory
}

/// An exported method, constructor or function of a GObjectExport class (see _dExportMethods)
struct _DExportMethod
{
  string mem; /// D member name ("__ctor" for constructors)
  size_t overload; /// Index in __traits(getOverloads)
  _DExportKind kind; ///
  string name; /// C name after the type prefix (also the GIR name)
  bool throws; /// Has a GError ** parameter
}

// True if a symbol has the attribute U (`@U` or `@U(...)`)
package enum bool _dHasUda(alias sym, U) = () {
bool found;
static foreach (a; __traits(getAttributes, sym))
static if (is(a == U) || is(typeof(a) == U))
  found = true;
return found;
}();

// Value of the attribute U of a symbol (U.init for `@U` or no attribute)
package enum U _dUdaValue(alias sym, U) = () {
U v;
static foreach (a; __traits(getAttributes, sym))
static if (is(typeof(a) == U))
  v = a;
return v;
}();

/**
* True if the exported member fn of T has a GError ** parameter: `@gThrows` or `@gThrows(false)`, otherwise
* GidExport.Throws for members that aren't nothrow
*/
template _dMemberThrows(T, alias fn)
{
  import std.traits : FunctionAttribute, functionAttributes;

  static if (_dHasUda!(fn, gThrows))
    enum bool _dMemberThrows = _dUdaValue!(fn, gThrows).enabled;
  else
    enum bool _dMemberThrows = (_dExportFlags!T & GidExport.Throws) != 0
  && !(functionAttributes!fn & FunctionAttribute.nothrow_);
}

// True if a member name is never auto-exported: internal, operator, vfunc or special names
private bool _dIsReservedName(string mem) pure nothrow
{
  if (mem.length == 0 || mem[0] == '_' || mem == "this" || mem == "~this")
    return true;

  if (mem.length > 2 && mem[0 .. 2] == "op" && mem[2] >= 'A' && mem[2] <= 'Z') // Operator overloads
    return true;

  return mem.length > 5 && mem[0 .. 5] == "vfunc" && mem[5] >= 'A' && mem[5] <= 'Z'; // vfunc implementations
}

// True if an interface of T declares a member named mem (T implements it)
private template _dImplementsInterfaceMember(T, string mem)
{
  enum bool _dImplementsInterfaceMember = () {
  bool found;
  static foreach (I; InterfacesTuple!T)
  static if (__traits(hasMember, I, mem))
    found = true;
  return found;
}();
}

// True if fn has an attribute which excludes it from auto-export (or makes it something else than a method)
private enum bool _dHasNoAutoUda(alias fn) = _dHasUda!(fn, gNoExport) || _dHasUda!(fn, _gidGenerated)
|| _dHasUda!(fn, imported!"gid.gobject2.dig".gSignal) || _dHasUda!(fn, imported!"gid.gobject2.dig".gVirtual)
|| _dHasUda!(fn, imported!"gid.gobject2.dig".gProperty) || _dHasUda!(fn, gConstructor);

// True if fn is a D @property function
private template _dIsDProperty(alias fn)
{
  import std.traits : FunctionAttribute, functionAttributes;

  enum bool _dIsDProperty = (functionAttributes!fn & FunctionAttribute.property) != 0;
}

/**
* True if the overload fn of T.mem would be exported automatically by the GidExport flags of T (Methods or
* Functions), before checking its types
*/
template _dIsAutoMethod(T, string mem, alias fn)
{
  static if ((_dExportFlags!T & (GidExport.Methods | GidExport.Functions)) == 0)
    enum bool _dIsAutoMethod = false;
  else static if (_dIsReservedName(mem) || !__traits(isSame, __traits(parent, fn), T) || _dIsExportMethod!fn
  || _dHasNoAutoUda!fn || _dIsDProperty!fn || __traits(isOverrideFunction, fn) || __traits(isDisabled, fn)
  || (__traits(getVisibility, fn) != "public" && __traits(getVisibility, fn) != "export")
  || _dImplementsInterfaceMember!(T, mem))
  enum bool _dIsAutoMethod = false;
  else static if (__traits(isStaticFunction, fn))
  enum bool _dIsAutoMethod = (_dExportFlags!T & GidExport.Functions) != 0;
  else
    enum bool _dIsAutoMethod = (_dExportFlags!T & GidExport.Methods) != 0;
}

// Overload idx of the member mem of T
package alias _dExportOverload(T, string mem, size_t idx) = AliasSeq!(__traits(getOverloads, T, mem))[idx];

/**
* True if fn has @gMethod or @gConstructor
*/
enum bool _dIsExportMethod(alias fn) = _dHasUda!(fn, gMethod) || _dHasUda!(fn, gConstructor);

/**
* True if T declares a method or constructor with @gMethod or @gConstructor
*/
template _dHasExportMethods(T)
{
  enum bool _dHasExportMethods = () {
  bool found;

  static foreach (mem; __traits(derivedMembers, T))
  static if (mem.length > 0 && __traits(compiles, __traits(getOverloads, T, mem)))
    static foreach (fn; __traits(getOverloads, T, mem))
  static if (_dIsExportMethod!fn)
    found = true;

  return found;
}();
}

/**
* The methods, functions and constructors of T exported with @gMethod or @gConstructor, in declaration order
*/
template _dExportMethods(T)
{
  enum _DExportMethod[] _dExportMethods = () {
  _DExportMethod[] list;

  static foreach (mem; __traits(derivedMembers, T))
  static if (mem.length > 0 && __traits(compiles, __traits(getOverloads, T, mem)))
    static foreach (i, fn; __traits(getOverloads, T, mem))
  static if (_dIsExportMethod!fn || (_dIsAutoMethod!(T, mem, fn) && _dExportMethodProblem!(T, mem, i) is null))
    list ~= _DExportMethod(mem, i, _dExportKindOf!(T, mem, fn), _dExportName!(T, mem, fn),
  _dMemberThrows!(T, fn));

  return list;
}();
}

/**
* Overloaded names of T with more than one exported or auto-exported overload, not all with distinct
* `@gMethod("name")`: an error message, or null
*/
template _dExportOverloadProblem(T)
{
  enum string _dExportOverloadProblem = () {
  string problem;

  static foreach (mem; __traits(derivedMembers, T))
  static if (mem.length > 0 && __traits(compiles, __traits(getOverloads, T, mem)))
  {{
    string[] sigs;
    bool allNamed = true;

    static foreach (i, fn; __traits(getOverloads, T, mem))
    static if (_dIsExportMethod!fn || _dIsAutoMethod!(T, mem, fn))
    {
      sigs ~= (mem == "__ctor" ? "this" : mem) ~ imported!"std.traits".Parameters!fn.stringof;

      if (_dUdaValue!(fn, gMethod).name.length == 0 && _dUdaValue!(fn, gConstructor).name.length == 0)
        allNamed = false;
    }

    if (sigs.length > 1 && !allNamed && !problem)
    {
      string list;
      foreach (j, sig; sigs)
        list ~= (j > 0 ? ", " : "") ~ sig;

      problem = T.stringof ~ "." ~ (mem == "__ctor" ? "this" : mem) ~ " has " ~ imported!"std.conv".to!string(
      sigs.length) ~ " exportable overloads (" ~ list ~ "): give each a distinct @gMethod(\"name\"), or mark"
      ~ " all but one @gNoExport";
    }
  }}

  return problem;
}();
}

/**
* Members of T which auto-export skips because they can't be exported (methods with unsupported types, D @property
* accessors with an unsupported type): one message per member, for GidSkip
*/
template _dExportSkipped(T)
{
  enum string[] _dExportSkipped = () {
  string[] msgs;

  static foreach (mem; __traits(derivedMembers, T))
  static if (mem.length > 0 && __traits(compiles, __traits(getOverloads, T, mem)))
  {
    static foreach (i, fn; __traits(getOverloads, T, mem))
    static if (!_dIsExportMethod!fn && _dIsAutoMethod!(T, mem, fn) && _dExportMethodProblem!(T, mem, i) !is null)
      msgs ~= _dSkipMessage(_dExportMethodProblem!(T, mem, i));

    static if (_dIsAutoPropertyCandidate!(T, mem))
      static if (!_dAutoPropertyTypeOk!(_dAutoPropertyType!(T, mem)))
      msgs ~= T.stringof ~ "." ~ mem ~ ": not exported, unsupported property type "
    ~ _dAutoPropertyType!(T, mem).stringof ~ " (mark it @gNoExport to silence this)";
  }

  return msgs;
}();
}

// Skip message from a problem message "T.mem: reason"
private string _dSkipMessage(string problem) pure nothrow
{
  foreach (i; 0 .. problem.length)
    if (problem[i] == ':')
    return problem[0 .. i] ~ ": not exported," ~ problem[i + 1 .. $] ~ " (mark it @gNoExport to silence this)";

  return problem;
}

// Overloads of T.mem declared by T which are D @property functions
private template _dPropertyFns(T, string mem)
{
  private template _isProp(alias fn)
  {
    enum bool _isProp = __traits(isSame, __traits(parent, fn), T) && _dIsDProperty!fn;
  }

  alias _dPropertyFns = imported!"std.meta".Filter!(_isProp, __traits(getOverloads, T, mem));
}

/**
* True if the D @property accessors T.mem are eligible for GidExport.Properties (before checking the type)
*/
template _dIsAutoPropertyCandidate(T, string mem)
{
  static if ((_dExportFlags!T & GidExport.Properties) == 0)
    enum bool _dIsAutoPropertyCandidate = false;
  else static if (_dIsReservedName(mem) || !__traits(compiles, __traits(getOverloads, T, mem))
  || _dImplementsInterfaceMember!(T, mem))
  enum bool _dIsAutoPropertyCandidate = false;
  else static if (_dPropertyFns!(T, mem).length == 0)
  enum bool _dIsAutoPropertyCandidate = false;
  else
    enum bool _dIsAutoPropertyCandidate = () {
  bool ok, accessor;

  ok = true;

  static foreach (fn; _dPropertyFns!(T, mem))
  {
    if (_dHasNoAutoUda!fn || _dIsExportMethod!fn || __traits(isStaticFunction, fn)
      || __traits(isOverrideFunction, fn)
    || (__traits(getVisibility, fn) != "public" && __traits(getVisibility, fn) != "export"))
    ok = false;

    static if (imported!"std.traits".Parameters!fn.length == 0
    && !is(imported!"std.traits".ReturnType!fn == void))
    accessor = true;
    else static if (imported!"std.traits".Parameters!fn.length == 1)
    accessor = true;
  }

  return ok && accessor;
}();
}

/**
* Value type of the D @property accessors T.mem (getter return type, or setter parameter type)
*/
template _dAutoPropertyType(T, string mem)
{
  private template _getterType(fns...)
  {
    static if (fns.length == 0)
      alias _getterType = void;
    else static if (imported!"std.traits".Parameters!(fns[0]).length == 0)
    alias _getterType = Unqual!(ReturnType!(fns[0]));
    else
      alias _getterType = _getterType!(fns[1 .. $]);
  }

  private template _setterType(fns...)
  {
    static if (fns.length == 0)
      alias _setterType = void;
    else static if (imported!"std.traits".Parameters!(fns[0]).length == 1)
    alias _setterType = Unqual!(imported!"std.traits".Parameters!(fns[0])[0]);
    else
      alias _setterType = _setterType!(fns[1 .. $]);
  }

  static if (!is(_getterType!(_dPropertyFns!(T, mem)) == void))
    alias _dAutoPropertyType = _getterType!(_dPropertyFns!(T, mem));
  else
    alias _dAutoPropertyType = _setterType!(_dPropertyFns!(T, mem));
}

/**
* True if PT can be the type of a property exported with GidExport.Properties: bool, numbers, string, binding enums
* and flags, and types with a GType (objects, boxed types, Variant)
*/
template _dAutoPropertyTypeOk(PT)
{
  static if (is(PT == enum))
    enum bool _dAutoPropertyTypeOk = _dIsBindingType!PT;
  else
    enum bool _dAutoPropertyTypeOk = _dIsScalar!PT || is(PT == string) || __traits(compiles, PT._getGType());
}

/**
* True if T.mem is a D @property exported as a GObject property by GidExport.Properties (see _isDPropertyMember)
*/
template _dIsAutoPropertyMember(T, string mem)
{
  static if (_dIsAutoPropertyCandidate!(T, mem))
    enum bool _dIsAutoPropertyMember = _dAutoPropertyTypeOk!(_dAutoPropertyType!(T, mem));
  else
    enum bool _dIsAutoPropertyMember = false;
}

private template _dExportKindOf(T, string mem, alias fn)
{
  static if (mem == "__ctor" || _dHasUda!(fn, gConstructor))
    enum _dExportKindOf = _DExportKind.Constructor;
  else static if (__traits(isStaticFunction, fn))
  enum _dExportKindOf = _DExportKind.Function;
  else
    enum _dExportKindOf = _DExportKind.Method;
}

private template _dExportName(T, string mem, alias fn)
{
  import gid.gobject2.dig : _snakeCaseName;

  enum string _dExportName = () {
  if (_dHasUda!(fn, gConstructor))
  {
    if (_dUdaValue!(fn, gConstructor).name.length > 0)
      return "new_" ~ _dUdaValue!(fn, gConstructor).name;

    if (_dUdaValue!(fn, gMethod).name.length > 0)
      return _dUdaValue!(fn, gMethod).name;

    if (mem == "__ctor")
      return "new";

    auto s = _snakeCaseName(mem);
    return (s == "new" || (s.length > 4 && s[0 .. 4] == "new_")) ? s : "new_" ~ s;
  }

  if (_dUdaValue!(fn, gMethod).name.length > 0)
    return _dUdaValue!(fn, gMethod).name;

  return _snakeCaseName(mem);
}();
}

// Parameter types of fn, without qualifiers
package template _dExportParams(alias fn)
{
  static if (is(typeof(fn) P == __parameters))
    alias _dExportParams = staticMap!(Unqual, P);
}

// Attributes of parameter i of fn
private template _dExportParamUdas(alias fn, size_t i)
{
  static if (is(typeof(fn) P == __parameters))
    alias _dExportParamUdas = __traits(getAttributes, P[i .. i + 1]);
}

package enum bool _dParamHas(alias fn, size_t i, U) = () {
bool found;
static foreach (a; _dExportParamUdas!(fn, i))
static if (is(a == U) || is(typeof(a) == U))
  found = true;
return found;
}();

package template _dParamTransfer(alias fn, size_t i)
{
  enum GidOwnership _dParamTransfer = () {
  GidOwnership o = GidOwnership.Full;
  static foreach (a; _dExportParamUdas!(fn, i))
  static if (is(typeof(a) == gTransfer))
    o = a.ownership;
  return o;
}();
}

// Direction of parameter i of fn: 0 in, 1 out, 2 ref (inout)
package template _dParamDir(alias fn, size_t i)
{
  enum stc = ParameterStorageClassTuple!fn[i];
  enum int _dParamDir = (stc & ParameterStorageClass.out_) ? 1 : (stc & ParameterStorageClass.ref_) ? 2 : 0;
}

// Return type of an exported method (the class for a constructor)
package template _dExportReturn(T, alias fn)
{
  static if (__traits(identifier, fn) == "__ctor")
    alias _dExportReturn = T;
  else
    alias _dExportReturn = Unqual!(ReturnType!fn);
}

package enum bool _dIsBindingType(PT) = __traits(compiles, imported!"gid.gobject2.dig"._dGirType!PT.name);
package enum bool _dIsExportedType(PT) = __traits(compiles, PT._gidExportedAs) && is(PT._gidExportedAs == PT);

private enum bool _dIsScalar(PT) = is(PT == bool) || (isIntegral!PT && PT.sizeof <= 8) || is(PT == float)
|| is(PT == double);

private enum _DTypeCat { Unsupported, Scalar, Enum, String, Strv, Object, Wrap }

// Category of a D type of an exported method
private template _dTypeCat(PT)
{
  static if (is(PT == enum))
    enum _dTypeCat = _dIsBindingType!PT ? _DTypeCat.Enum : _DTypeCat.Unsupported;
  else static if (_dIsScalar!PT)
  enum _dTypeCat = _DTypeCat.Scalar;
  else static if (is(PT == string))
  enum _dTypeCat = _DTypeCat.String;
  else static if (is(PT == string[]))
  enum _dTypeCat = _DTypeCat.Strv;
  else static if ((is(PT == class) && is(PT : imported!"gid.gobject2.object".ObjectWrap)) || is(PT == interface))
  enum _dTypeCat = (_dIsBindingType!PT || _dIsExportedType!PT) ? _DTypeCat.Object : _DTypeCat.Unsupported;
  else static if (is(PT == imported!"gid.glib2.variant".Variant)
  || (is(PT : imported!"gid.gobject2.boxed".Boxed) && _dIsBindingType!PT))
  enum _dTypeCat = _DTypeCat.Wrap;
  else
    enum _dTypeCat = _DTypeCat.Unsupported;
}

// Why a D type is not supported, for error messages
private template _dUnsupportedReason(PT)
{
  static if (is(PT == enum))
    enum string _dUnsupportedReason = " (D-defined enums can't be exported yet, use an enum of a binding)";
  else static if (is(PT == class) || is(PT == interface))
  enum string _dUnsupportedReason = " (a D class or interface must use GObjectExport or GInterfaceExport)";
  else
    enum string _dUnsupportedReason = "";
}

private enum string _dSupportedTypes = "use bool, integers, float, double, binding enums and flags, string, string[],"
~ " exported or binding classes and interfaces, binding boxed types, or Variant";

/**
* C type of a D type of an exported method, for an argument (output false), or a return or `out` value (output true)
*/
template _dExportCType(PT, bool output)
{
  static if (_dTypeCat!PT == _DTypeCat.Scalar)
    alias _dExportCType = AliasSeq!(int, PT)[is(PT == bool) ? 0 : 1];
  else static if (_dTypeCat!PT == _DTypeCat.Enum)
  alias _dExportCType = OriginalType!PT;
  else static if (_dTypeCat!PT == _DTypeCat.String)
  alias _dExportCType = AliasSeq!(const(char)*, char*)[output];
  else static if (_dTypeCat!PT == _DTypeCat.Strv)
  alias _dExportCType = AliasSeq!(const(char*)*, char**)[output];
  else static if (_dTypeCat!PT == _DTypeCat.Object)
  alias _dExportCType = GObject*;
  else static if (is(PT == imported!"gid.glib2.variant".Variant))
  alias _dExportCType = GVariant*;
  else static if (_dTypeCat!PT == _DTypeCat.Wrap)
  alias _dExportCType = void*;
  else
    static assert(0, "Type " ~ PT.stringof ~ " is not supported by @gMethod, " ~ _dSupportedTypes);
}

// C type of parameter i of fn
private template _dExportParamCType(alias fn, size_t i)
{
  alias PT = _dExportParams!fn[i];

  static if (_dParamDir!(fn, i) == 0)
    alias _dExportParamCType = _dExportCType!(PT, false);
  else
    alias _dExportParamCType = _dExportCType!(PT, true)*;
}

/**
* Problem with the exported method idx of T.mem (see gMethod), or null if it can be exported
*/
template _dExportMethodProblem(T, string mem, size_t idx)
{
  alias fn = _dExportOverload!(T, mem, idx);
  alias R = _dExportReturn!(T, fn);
  alias P = _dExportParams!fn;
  enum string where = T.stringof ~ "." ~ (mem == "__ctor" ? "this" : mem);
  enum bool isCtor = mem == "__ctor";
  enum bool isFactory = !isCtor && _dHasUda!(fn, gConstructor);

  enum string _dExportMethodProblem = () {
  string vis = __traits(getVisibility, fn);
  if (vis != "public" && vis != "export")
    return where ~ ": exported methods must be public";

  static if (_dHasUda!(fn, gNoExport) && _dIsExportMethod!fn)
    return where ~ ": @gNoExport can't be used with @gMethod or @gConstructor";

  static foreach (U; AliasSeq!(imported!"gid.gobject2.dig".gVirtual, imported!"gid.gobject2.dig".gSignal,
  imported!"gid.gobject2.dig".gProperty))
  static if (_dHasUda!(fn, U))
    return where ~ ": @gMethod and @gConstructor can't be used with @" ~ U.stringof;

  static if (isCtor)
  {
    static if (__traits(isAbstractClass, T))
      return where ~ ": @gConstructor can't be used in an abstract class";
    else static if (P.length == 0)
    return where ~ ": this() is always exported as _new, remove @gConstructor";
  }
  else static if (isFactory)
  {
    static if (!__traits(isStaticFunction, fn))
      return where ~ ": @gConstructor needs a constructor or a static method";
    else static if (!is(R : T))
    return where ~ ": a @gConstructor static method must return " ~ T.stringof;
  }
  else static if (_dHasUda!(fn, gConstructor))
  return where ~ ": @gConstructor needs a constructor or a static method";

  static if (!is(R == void))
  {
    static if (_dTypeCat!R == _DTypeCat.Unsupported)
      return where ~ ": return type " ~ R.stringof ~ " is not supported by @gMethod" ~ _dUnsupportedReason!R ~ ", "
    ~ _dSupportedTypes;
  }

  static if (_dHasUda!(fn, gTransfer))
  {
    static if (_dTypeCat!R != _DTypeCat.Object || isCtor || isFactory)
      return where ~ ": @gTransfer is only supported for returned objects";
    else static if (_dUdaValue!(fn, gTransfer).ownership == GidOwnership.Container)
    return where ~ ": @gTransfer(GidOwnership.Container) is not supported";
  }

  static foreach (i, PT; P)
  {{
    enum pname = ParameterIdentifierTuple!fn[i];
    enum stc = ParameterStorageClassTuple!fn[i];

    static if (stc & ParameterStorageClass.lazy_)
      return where ~ ": lazy parameter " ~ pname ~ " is not supported";
    else static if (_dTypeCat!PT == _DTypeCat.Unsupported)
    return where ~ ": type " ~ PT.stringof ~ " of parameter " ~ pname ~ " is not supported by @gMethod"
    ~ _dUnsupportedReason!PT ~ ", " ~ _dSupportedTypes;
    else static if (_dParamDir!(fn, i) == 2 && _dTypeCat!PT != _DTypeCat.Scalar && _dTypeCat!PT != _DTypeCat.Enum)
    return where ~ ": ref parameter " ~ pname ~ " must be bool, a number or an enum (use out or the return value"
    ~ " for " ~ PT.stringof ~ ")";
    else static if (_dParamHas!(fn, i, gTransfer) && (_dParamDir!(fn, i) != 1 || _dTypeCat!PT != _DTypeCat.Object
    || _dParamTransfer!(fn, i) == GidOwnership.Container))
    return where ~ ": @gTransfer is only supported for out parameters of objects (None or Full)";
  }}

  return null;
}();
}

/**
* C parameter types of the exported method idx of T.mem: the instance (methods), the parameters, and GError ** if it
* throws
*/
template _dExportCParams(T, string mem, size_t idx)
{
  alias fn = _dExportOverload!(T, mem, idx);

  private alias _paramCType(size_t i) = _dExportParamCType!(fn, i);
  private alias _params = staticMap!(_paramCType, _dIndices!(_dExportParams!fn.length));

  static if (_dExportKindOf!(T, mem, fn) == _DExportKind.Method)
    private alias _withSelf = AliasSeq!(GObject*, _params);
  else
    private alias _withSelf = _params;

  static if (_dMemberThrows!(T, fn))
    alias _dExportCParams = AliasSeq!(_withSelf, GError**);
  else
    alias _dExportCParams = _withSelf;
}

/**
* C return type of the exported method idx of T.mem
*/
template _dExportCReturn(T, string mem, size_t idx)
{
  alias R = _dExportReturn!(T, _dExportOverload!(T, mem, idx));

  static if (is(R == void))
    alias _dExportCReturn = void;
  else
    alias _dExportCReturn = _dExportCType!(R, true);
}

private template _dIndices(size_t n)
{
  static if (n == 0)
    alias _dIndices = AliasSeq!();
  else
    alias _dIndices = AliasSeq!(_dIndices!(n - 1), n - 1);
}

// Zero value of a C type (0 also for floating point types)
private template _dExportZero(CT)
{
  static if (isFloatingPoint!CT)
    enum CT _dExportZero = 0;
  else
    enum CT _dExportZero = CT.init;
}

// D value to C value, for return and out values (strings, arrays and objects with the given ownership)
private CT _dExportToC(PT, CT, GidOwnership transfer = GidOwnership.Full)(PT val) nothrow
{
  static if (is(PT == bool))
    return val ? 1 : 0;
  else static if (is(PT == enum))
  return cast(CT)val;
  else static if (is(PT == string))
  return val is null ? null : g_strndup(val.ptr, val.length);
  else static if (is(PT == string[]))
  {
    if (val is null)
      return null;

    auto array = cast(char**)g_malloc0((val.length + 1) * (char*).sizeof);

    foreach (i, s; val)
      array[i] = g_strndup(s.ptr ? s.ptr : "".ptr, s.length);

    return array;
  }
  else static if (_dTypeCat!PT == _DTypeCat.Object)
  {
    auto obj = cast(imported!"gid.gobject2.object".ObjectWrap)val;
    return obj ? cast(CT)obj._cPtr(transfer == GidOwnership.Full ? Yes.Dup : No.Dup) : null;
  }
  else static if (_dTypeCat!PT == _DTypeCat.Wrap)
  return val ? cast(CT)val._cPtr(Yes.Dup) : null;
  else
    return val;
}

// C argument to D value (strings and arrays are copied, objects and boxed values are not taken)
private PT _dExportFromC(PT, CT)(CT val) nothrow
{
  static if (is(PT == bool))
    return val != 0;
  else static if (is(PT == enum))
  return cast(PT)val;
  else static if (is(PT == string))
  return imported!"gid.core.utils".fromCString(val);
  else static if (is(PT == string[]))
  {
    if (!val)
      return null;

    string[] array;

    for (auto p = val; *p; p++)
      array ~= imported!"gid.core.utils".fromCString(*p);

    return array;
  }
  else static if (_dTypeCat!PT == _DTypeCat.Object)
  return imported!"gid.gobject2.object".ObjectWrap._getDObject!PT(cast(void*)val, No.Take);
  else static if (_dTypeCat!PT == _DTypeCat.Wrap)
  return val ? new PT(cast(void*)val, No.Take) : null;
  else
    return val;
}

// True if the C value of a D type is a pointer that must not be NULL unless @gNullable
private enum bool _dIsPointerCat(PT) = _dTypeCat!PT == _DTypeCat.String || _dTypeCat!PT == _DTypeCat.Strv
|| _dTypeCat!PT == _DTypeCat.Object || _dTypeCat!PT == _DTypeCat.Wrap;

// Report a D exception with a GError
private void _dExportSetError(GError** error, Exception e) nothrow
{
  if (auto err = cast(imported!"gid.glib2.error".ErrorWrap)e)
    g_propagate_error(error, cast(GError*)err._cPtr(Yes.Dup));
  else
    g_set_error_literal(error, gidDExceptionQuark, 0, imported!"gid.core.utils".toCString(e.msg));
}

/**
* Body of the exported C function of the method idx of T.mem (see _GObjectExportMethod): checks the instance and the
* arguments, converts them, calls the D method and converts the result.
*/
static _dExportCReturn!(T, mem, idx) _dExportCall(T, string mem, size_t idx)(_dExportCParams!(T, mem, idx) cargs)
nothrow
{
  alias fn = _dExportOverload!(T, mem, idx);
  alias P = _dExportParams!fn;
  alias R = _dExportReturn!(T, fn);
  alias CR = _dExportCReturn!(T, mem, idx);
  enum kind = _dExportKindOf!(T, mem, fn);
  enum bool throws = _dMemberThrows!(T, fn);
  enum size_t off = kind == _DExportKind.Method ? 1 : 0;
  enum string where = T.stringof ~ "." ~ _dExportName!(T, mem, fn) ~ "\0";

  static if (is(CR == void))
    enum zero = null;
  else
    enum CR zero = _dExportZero!CR;

  imported!"gid.core.utils".gidInitRuntime();
  imported!"gid.core.utils".gidAttachThread();

  static if (kind == _DExportKind.Method)
  {
    auto gtype = T._getGType();
    T self;

    if (cargs[0] && gtype && g_type_check_instance_is_a(cast(GTypeInstance*)cargs[0], gtype))
      self = imported!"gid.gobject2.object".ObjectWrap._getDObject!T(cast(void*)cargs[0], No.Take);

    if (!self)
    {
      g_return_if_fail_warning("Gid", where.ptr, "self is an instance of the type\0".ptr);

      static if (is(CR == void))
        return;
      else
        return zero;
    }
  }

  // Arguments which must not be NULL
  static foreach (i, PT; P)
  {
    static if ((_dParamDir!(fn, i) == 0 && _dIsPointerCat!PT && !_dParamHas!(fn, i, gNullable))
      || _dParamDir!(fn, i) == 2)
    {
      if (!cargs[off + i])
      {
        g_return_if_fail_warning("Gid", where.ptr, (ParameterIdentifierTuple!fn[i] ~ " != NULL\0").ptr);

        static if (is(CR == void))
          return;
        else
          return zero;
      }
    }
  }

  Tuple!P params;

  static foreach (i, PT; P)
  {
    static if (_dParamDir!(fn, i) == 0)
      params[i] = _dExportFromC!PT(cargs[off + i]);
    else static if (_dParamDir!(fn, i) == 2)
    params[i] = _dExportFromC!PT(*cargs[off + i]);
  }

  try
  {
    static if (kind == _DExportKind.Constructor && mem == "__ctor")
      auto ret = new T(params.expand);
    else static if (kind == _DExportKind.Method)
    {
      static if (is(R == void))
        __traits(child, self, fn)(params.expand);
      else
        auto ret = __traits(child, self, fn)(params.expand);
    }
    else
    {
      static if (is(R == void))
        fn(params.expand);
      else
        auto ret = fn(params.expand);
    }

    static foreach (i, PT; P)
    static if (_dParamDir!(fn, i) != 0)
      if (cargs[off + i])
      *cargs[off + i] = _dExportToC!(PT, typeof(*cargs[off + i]), _dParamTransfer!(fn, i))(params[i]);

    static if (!is(R == void))
    {
      static if (_dHasUda!(fn, gTransfer))
        return _dExportToC!(R, CR, _dUdaValue!(fn, gTransfer).ownership)(ret);
      else
        return _dExportToC!(R, CR)(ret);
    }
    else
      return;
  }
  catch (Exception e)
  {
    static if (throws)
      _dExportSetError(cargs[$ - 1], e);
    else
      imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, where[0 .. $ - 1]);
  }

  static foreach (i, PT; P) // Output values are cleared on errors
  static if (_dParamDir!(fn, i) == 1)
    if (cargs[off + i])
    *cargs[off + i] = _dExportZero!(typeof(*cargs[off + i]));

  static if (!is(CR == void))
    return zero;
}

/**
* Adds the exported C function `<symbolBase>_<name>` of the method, function or constructor idx of T.mem (see
* gMethod), the D function `_gidExportMethod_<k>`.
*/
mixin template _GObjectExportMethod(T, string mem, size_t idx, size_t k, string symbol)
{
  mixin("pragma(mangle, \"" ~ symbol ~ "\") export extern(C) static imported!\"gid.gobject2.dig_method\""
  ~ "._dExportCReturn!(T, \"" ~ mem ~ "\", " ~ imported!"std.conv".to!string(idx) ~ ") _gidExportMethod_"
  ~ imported!"std.conv".to!string(k) ~ "(imported!\"gid.gobject2.dig_method\"._dExportCParams!(T, \"" ~ mem
  ~ "\", " ~ imported!"std.conv".to!string(idx) ~ ") args) nothrow { return imported!\"gid.gobject2.dig_method\""
  ~ "._dExportCall!(T, \"" ~ mem ~ "\", " ~ imported!"std.conv".to!string(idx) ~ ")(args); }");
}

/**
* Problem with the names of the exported C functions of T (invalid or duplicate), or null. The names after the symbol
* prefix are `get_type`, `new` (if hasNew), the vfunc invokers and the exported methods.
*/
template _dExportNamesProblem(T, bool hasNew)
{
  enum string _dExportNamesProblem = () {
  import gid.gobject2.dig : _snakeCaseName;
  import gid.gobject2.dig_vfunc : _dVfuncInvokerName, _dVfuncMembers;

  string[] names = ["get_type"];
  string[] whats = ["get_type"];

  if (hasNew)
  {
    names ~= "new";
    whats ~= T.stringof ~ ".this()";
  }

  foreach (m; _dVfuncMembers!T)
  {
    names ~= _snakeCaseName(_dVfuncInvokerName(m));
    whats ~= "the invoker of " ~ T.stringof ~ "." ~ m;
  }

  foreach (e; _dExportMethods!T)
  {
    auto what = T.stringof ~ "." ~ (e.mem == "__ctor" ? "this" : e.mem);

    foreach (i, c; e.name)
      if (!((c >= 'a' && c <= 'z') || (i > 0 && ((c >= '0' && c <= '9') || c == '_'))))
      return what ~ ": invalid C name \"" ~ e.name ~ "\", use lower case letters, digits and '_'";

    names ~= e.name;
    whats ~= what;
  }

  foreach (i, n; names)
    foreach (j; i + 1 .. names.length)
    if (names[j] == n)
    return "The exported C function name suffix " ~ n ~ " is used by "
  ~ (whats[i] == whats[j] ? "two overloads of " ~ whats[i] : "both " ~ whats[i] ~ " and " ~ whats[j])
  ~ ", pass a different name to @gMethod or @gConstructor";

  return null;
}();
}
