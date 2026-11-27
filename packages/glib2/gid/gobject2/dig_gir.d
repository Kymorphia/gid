/// Module for [DigGir] class
module gid.gobject2.dig_gir;

public import gid.core.basictypes;

/**
* GIR export of the GObject types of a D library (GObjectExport classes and GInterfaceExport interfaces), so that
* Python, GJS, Vala and other languages can use them through GObject introspection.
*
* Add a `gir` configuration to the dub recipe of the library and mix in GObjectGirMain in one of its modules: the
* configuration builds a small program which writes `<Namespace>-<version>.gir`. Then compile it to a typelib with
* `g-ir-compiler` as for a C library.
*/
import std.meta : AliasSeq;
import std.traits : BaseClassesTuple, InterfacesTuple, isFloatingPoint, isIntegral, OriginalType,
ParameterIdentifierTuple, Parameters, ReturnType;

import gid.glib2.c.functions;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.dig_method;
import gid.gobject2.dig_property : _dPropertyType, _dPropertyUDA, _isDPropertyMember;
import gid.gobject2.dig_signal : _dSignalFn, _dSignalName;
import gid.gobject2.dig_vfunc : _dVfuncInvokerName, _dVfuncMembers, _dVirtualFn;
import gid.gobject2.dig_iface : _isDInterface;

/**
* GIR repository information of a D library (see GObjectGirMain).
*
* Members:
*   namespace = GIR namespace, the namespace of the exported types (see GObjectNamespace)
*   nsVersion = Version of the GIR namespace ("1.0"), or null to use the version given to GObjectNamespace
*   sharedLibrary = Name of the shared library which C, Python and other languages load ("libmylib.so"), can be
*     changed with the `--shared-library` option of the program
*   cIncludes = C headers to list in the GIR (optional), the first one is the name of the C header the program writes
*     (default: the namespace in snake case, `mylib.h`)
*   packages = pkg-config packages to list in the GIR (optional)
*/
struct GirInfo
{
  string namespace; ///
  string nsVersion; ///
  string sharedLibrary; ///
  string[] cIncludes; ///
  string[] packages; ///
}

/**
* Adds a `main` function which writes the GIR file of the GObject types exported by the given modules: the
* GObjectExport classes and the GInterfaceExport interfaces of the namespace of `info` (types of other namespaces are
* skipped). Mix it in under `version (GidGir)` and build the library sources as an executable with that version.
*
* The program writes `<Namespace>-<version>.gir` in the current directory. The version is the one of `info` or the
* one given to GObjectNamespace (they must be the same if both are given). Types of other namespaces that the API uses
* need the GIR version of their namespace: `mixin GObjectNamespace!("Widgets", "1.0");`. Options: `--gir FILE` writes another
* file (`-` for the standard output), and `--shared-library NAME` changes the shared library name.
*
* It also writes the C header of the types (`mylib.h`, the first header of `GirInfo.cIncludes` if given, which the GIR
* lists as its C include): type macros (`MYLIB_TYPE_COUNTER`, `MYLIB_COUNTER()`, `MYLIB_IS_COUNTER()`, ...), the
* instance, class and interface structs, and the prototypes of the exported functions. `--header FILE` writes another
* file (`-` for the standard output), `--no-header` writes none. The header includes `glib-object.h` and the headers of
* the namespaces it uses: those of the giD bindings and `<namespace>.h` for other D namespaces.
*
* Params:
*   info = GIR namespace, version and shared library name (see GirInfo)
*   Modules = The D modules which declare the exported types
*
* Example:
* ---
* // mylib/package.d
* module mylib;
* public import mylib.counter;
*
* mixin GObjectNamespace!("Mylib", "1.0");
* version (GidGir) mixin GObjectGirMain!(GirInfo("Mylib", null, "libmylib.so"), mylib.counter); // Version 1.0
* ---
*
* dub.json:
* ---
* "configurations": [
*   { "name": "library", "targetType": "dynamicLibrary" },
*   { "name": "gir", "targetType": "executable", "targetName": "mylib-gir", "versions": ["GidGir"] }
* ]
* ---
*
* Then `dub run -c gir` writes `Mylib-1.0.gir` and `mylib.h`, and
* `g-ir-compiler Mylib-1.0.gir -o Mylib-1.0.typelib` compiles it.
*/
mixin template GObjectGirMain(GirInfo info, Modules...)
{
  int main(string[] args)
  {
    return imported!"gid.gobject2.dig_gir".girMain!(info, Modules)(args);
  }
}

/**
* The `main` of GObjectGirMain: parses the options and writes the GIR file.
* Returns: Exit status, 0 on success
*/
int girMain(GirInfo info, Modules...)(string[] args)
{
  import std.file : write;
  import std.getopt : defaultGetoptPrinter, getopt, GetOptException;
  import std.stdio : stderr, stdout;

  string output;
  string headerOutput;
  string sharedLibrary;
  bool noHeader;

  try
  {
    auto help = getopt(args, "gir", "Output GIR file (- for the standard output)", &output, "header",
    "Output C header file (- for the standard output)", &headerOutput, "no-header", "Don't write the C header",
    &noHeader, "shared-library", "Shared library name (default " ~ info.sharedLibrary ~ ")", &sharedLibrary);

    if (help.helpWanted)
    {
      defaultGetoptPrinter("Write the GIR file of " ~ info.namespace ~ ".", help.options);
      return 0;
    }
  }
  catch (Exception e)
  {
    stderr.writeln("Error: ", e.msg);
    return 1;
  }

  try
  {
    auto gir = _girWrite!(info, Modules)(sharedLibrary);

    if (output.length == 0)
      output = info.namespace ~ "-" ~ gir.nsVersion ~ ".gir";

    if (output == "-")
      stdout.write(gir.xml);
    else
      write(output, gir.xml);

    if (!noHeader)
    {
      if (headerOutput.length == 0)
        headerOutput = gir.headerName;

      if (headerOutput == "-")
        stdout.write(gir.header);
      else
        write(headerOutput, gir.header);
    }
  }
  catch (Exception e)
  {
    stderr.writeln("Error: ", e.msg);
    return 1;
  }

  return 0;
}

/**
* GIR XML of the GObjectExport classes and GInterfaceExport interfaces of the namespace of info declared in the given
* modules. The types are registered, so that the values GObject keeps (property flags and default values, signal
* flags) can be read.
* Params:
*   info = GIR namespace, version and shared library name
*   Modules = The D modules which declare the exported types
*   sharedLibrary = Shared library name, or null for the one of info
* Returns: The XML
* Throws: Exception with all the problems found (types which can't be described in GIR)
*/
string girXml(GirInfo info, Modules...)(string sharedLibrary = null)
{
  return _girWrite!(info, Modules)(sharedLibrary).xml;
}

/**
* C header of the GObjectExport classes and GInterfaceExport interfaces of the namespace of info declared in the given
* modules (see girXml): type macros, instance, class and interface structs, get_type functions, constructors, methods,
* functions and the invokers of the virtual methods.
* Params:
*   info = GIR namespace, version and shared library name
*   Modules = The D modules which declare the exported types
* Returns: The header
* Throws: Exception with all the problems found
*/
string girHeader(GirInfo info, Modules...)()
{
  return _girWrite!(info, Modules)(null).header;
}

/// The GIR XML, the namespace version and the C header (see girXml and girHeader)
struct _GirOutput
{
  string xml; ///
  string nsVersion; ///
  string header; /// C header
  string headerName; /// Name of the C header (GirInfo.cIncludes[0] or <namespace>.h in snake case)
}

/// ditto
_GirOutput _girWrite(GirInfo info, Modules...)(string sharedLibrary)
{
  import std.algorithm : canFind, sort, uniq;
  import std.array : array, join;

  _GirWriter w;
  w.info = info;
  w.includes["GObject"] = "2.0";

  static foreach (Mod; Modules)
  static foreach (mem; __traits(allMembers, Mod))
  {
    static if (_girExportKind!(Mod, mem, info.namespace) == 1)
      _girClass!(__traits(getMember, Mod, mem))(w);
    else static if (_girExportKind!(Mod, mem, info.namespace) == 2)
    _girInterface!(__traits(getMember, Mod, mem))(w);
  }

  // Version: the one of info, or of the GObjectNamespace declaration of the types
  auto declared = w.nsVersions.dup.sort.uniq.array;
  string nsVersion = info.nsVersion;

  if (declared.length > 1)
    w.errors ~= "the types of " ~ info.namespace ~ " have different GIR versions: " ~ declared.join(", ");
  else if (declared.length == 1 && nsVersion.length > 0 && declared[0] != nsVersion)
  w.errors ~= "the GirInfo version " ~ nsVersion ~ " differs from the GIR version " ~ declared[0]
  ~ " given to GObjectNamespace";
  else if (nsVersion.length == 0 && declared.length == 1)
  nsVersion = declared[0];
  else if (nsVersion.length == 0)
  w.errors ~= "no GIR version: pass it to GirInfo or to GObjectNamespace (GObjectNamespace!(\"" ~ info.namespace
  ~ "\", \"1.0\"))";

  if (w.errors.length > 0)
    throw new Exception("Can't write the GIR of " ~ info.namespace ~ ":\n  " ~ w.errors.join("\n  "));

  string xml = "<?xml version=\"1.0\"?>\n"
  ~ "<repository version=\"1.2\" xmlns=\"http://www.gtk.org/introspection/core/1.0\""
  ~ " xmlns:c=\"http://www.gtk.org/introspection/c/1.0\" xmlns:glib=\"http://www.gtk.org/introspection/glib/1.0\">\n";

  foreach (ns; w.includes.keys.sort)
    if (ns != info.namespace)
    xml ~= "  <include name=\"" ~ _girEsc(ns) ~ "\" version=\"" ~ _girEsc(w.includes[ns]) ~ "\"/>\n";

  foreach (p; info.packages)
    xml ~= "  <package name=\"" ~ _girEsc(p) ~ "\"/>\n";

  // The generated header, or the headers of info
  string headerName = info.cIncludes.length > 0 ? info.cIncludes[0] : _girDefaultHeader(info.namespace);

  foreach (h; info.cIncludes.length > 0 ? info.cIncludes : [headerName])
    xml ~= "  <c:include name=\"" ~ _girEsc(h) ~ "\"/>\n";

  xml ~= "  <namespace name=\"" ~ _girEsc(info.namespace) ~ "\" version=\"" ~ _girEsc(nsVersion)
  ~ "\" shared-library=\"" ~ _girEsc(sharedLibrary.length > 0 ? sharedLibrary : info.sharedLibrary)
  ~ "\" c:identifier-prefixes=\"" ~ _girEsc(info.namespace) ~ "\" c:symbol-prefixes=\""
  ~ _girEsc(w.symbolPrefix.length > 0 ? w.symbolPrefix : imported!"gid.gobject2.dig"._snakeCaseName(info.namespace))
  ~ "\">\n" ~ w.body ~ "  </namespace>\n</repository>\n";

  // Headers of the included namespaces: GLib and GObject, the headers of the bindings and other D namespaces
  string[] includes = ["glib-object.h"];

  foreach (ns; w.includes.keys.sort)
    if (ns != info.namespace)
    if (auto hs = ns in w.cHeaders)
    foreach (h; *hs)
    if (!includes.canFind(h))
    includes ~= h;

  foreach (h; info.cIncludes.length > 1 ? info.cIncludes[1 .. $] : null)
    if (!includes.canFind(h))
    includes ~= h;

  return _GirOutput(xml, nsVersion, _girHeader(xml, headerName, includes), headerName);
}

/// State of the GIR writer
struct _GirWriter
{
  GirInfo info; /// Repository information
  string[string] includes; /// Included namespaces and their versions
  string symbolPrefix; /// C symbol prefix of the namespace (from the types)
  string body; /// Content of the namespace element
  string[] errors; /// Problems found
  bool[string] done; /// Types written
  string[] nsVersions; /// GIR versions declared for the types written
  string[][string] cHeaders; /// C headers of the included namespaces, by namespace (where known)
}

// 1 for a GObjectExport class of namespace ns, 2 for a GInterfaceExport interface, 0 otherwise
private template _girExportKind(alias Mod, string mem, string ns)
{
  static if (!__traits(compiles, __traits(getMember, Mod, mem)) || !is(__traits(getMember, Mod, mem)))
    enum int _girExportKind = 0;
  else
  {
    private alias S = __traits(getMember, Mod, mem);

    static if (!(is(S == class) || is(S == interface)))
      enum int _girExportKind = 0;
    else static if (!__traits(compiles, S._gidExportedAs) || !is(S._gidExportedAs == S)
    || !__traits(compiles, S._gidExportNs) || S._gidExportNs != ns)
    enum int _girExportKind = 0;
    else
      enum int _girExportKind = is(S == class) ? 1 : 2;
  }
}

// XML attribute value
package string _girEsc(string s) pure nothrow
{
  string r;

  foreach (char c; s)
  {
    switch (c)
    {
      case '&': r ~= "&amp;"; break;
      case '<': r ~= "&lt;"; break;
      case '>': r ~= "&gt;"; break;
      case '"': r ~= "&quot;"; break;
      case '\n': r ~= "&#10;"; break;
      default: r ~= c;
    }
  }

  return r;
}

private string _girStr(const(char)* s) nothrow
{
  import std.string : fromStringz;
  return s ? s.fromStringz.idup : null;
}

// C type name of a registered GType (its type name)
private string _girGTypeName(GType t) nothrow
{
  return t ? _girStr(g_type_name(t)) : null;
}

// True if PT is a GObjectExport class or GInterfaceExport interface
private enum bool _girIsExported(PT) = __traits(compiles, PT._gidExportedAs) && is(PT._gidExportedAs == PT)
&& __traits(compiles, PT._gidExportNs);

// GIR name to refer to a class, interface, boxed type or enum PT (the nearest exported or binding base for other D
// classes), adds the include of its namespace
private string _girRefName(PT)(ref _GirWriter w, string where)
{
  static if (_girIsExported!PT)
  {
    if (PT._gidExportNs == w.info.namespace)
      return PT._gidExportName;

    // Type of another D namespace: included with the version of its GObjectNamespace declaration
    if (PT._gidExportNsVersion.length == 0)
      w.errors ~= where ~ ": type " ~ PT.stringof ~ " is in namespace " ~ PT._gidExportNs ~ ", which has no GIR version"
    ~ " (pass it to GObjectNamespace: GObjectNamespace!(\"" ~ PT._gidExportNs ~ "\", \"1.0\"))";
    else
      w.includes[PT._gidExportNs] = PT._gidExportNsVersion;

    w.cHeaders[PT._gidExportNs] = [_girDefaultHeader(PT._gidExportNs)];
    return PT._gidExportNs ~ "." ~ PT._gidExportName;
  }
  else static if (_dIsBindingType!PT)
  {
    alias G = imported!"gid.gobject2.dig"._dGirType!PT;
    w.includes[G.namespace] = G.nsVersion;

    if (G.cIncludes.length > 0)
      w.cHeaders[G.namespace] = G.cIncludes;

    return G.fullName;
  }
  else static if (is(PT == class) && BaseClassesTuple!PT.length > 0)
  return _girRefName!(BaseClassesTuple!PT[0])(w, where);
  else
  {
    w.errors ~= where ~ ": type " ~ PT.stringof ~ " can't be described in GIR (use a binding type, or a type with"
    ~ " GObjectExport or GInterfaceExport)";
    return "gpointer";
  }
}

// C type of a class, interface or boxed type (pointer), from its GType name
private string _girRefCType(PT)()
{
  static if (__traits(compiles, PT._getGType()))
  {
    auto name = _girGTypeName(PT._getGType());
    return name.length > 0 ? name ~ "*" : "gpointer";
  }
  else static if (is(PT == class) && BaseClassesTuple!PT.length > 0)
  return _girRefCType!(BaseClassesTuple!PT[0]);
  else
    return "gpointer";
}

// GIR name of a basic D type, or null
private template _girBasicName(PT)
{
  static if (is(PT == bool))
    enum string _girBasicName = "gboolean";
  else static if (is(PT == byte))
  enum string _girBasicName = "gint8";
  else static if (is(PT == ubyte))
  enum string _girBasicName = "guint8";
  else static if (is(PT == short))
  enum string _girBasicName = "gint16";
  else static if (is(PT == ushort))
  enum string _girBasicName = "guint16";
  else static if (is(PT == int))
  enum string _girBasicName = "gint";
  else static if (is(PT == uint))
  enum string _girBasicName = "guint";
  else static if (is(PT == long))
  enum string _girBasicName = "gint64";
  else static if (is(PT == ulong))
  enum string _girBasicName = "guint64";
  else static if (is(PT == float))
  enum string _girBasicName = "gfloat";
  else static if (is(PT == double))
  enum string _girBasicName = "gdouble";
  else
    enum string _girBasicName = null;
}

// True if values of PT are returned with an ownership (strings, arrays, objects, boxed types and variants)
private enum bool _girOwned(PT) = is(PT == string) || is(PT == string[]) || is(PT == class) || is(PT == interface);

/**
* GIR type element of a D type.
* Params:
*   w = Writer (includes and errors)
*   output = true for a return value or an out parameter (C types without const)
*   ptr = Number of extra pointers in the C type (1 for out parameters)
*   where = Member, for error messages
*/
private string _girType(PT)(ref _GirWriter w, bool output, int ptr, string where)
{
  string stars;
  foreach (i; 0 .. ptr)
    stars ~= "*";

  static if (is(PT == void))
    return `<type name="none" c:type="void"/>`;
  else static if (is(PT == enum))
  {
    static if (_dIsBindingType!PT)
      return `<type name="` ~ _girEsc(_girRefName!PT(w, where)) ~ `" c:type="` ~ __traits(identifier, PT) ~ stars
    ~ `"/>`;
    else // D-defined enums (virtual methods and signals): the base type
      return _girType!(OriginalType!PT)(w, output, ptr, where);
  }
  else static if (_girBasicName!PT.length > 0)
  return `<type name="` ~ _girBasicName!PT ~ `" c:type="` ~ _girBasicName!PT ~ stars ~ `"/>`;
  else static if (is(PT == string))
  return `<type name="utf8" c:type="` ~ (output ? "char*" : "const char*") ~ stars ~ `"/>`;
  else static if (is(PT == string[]))
  return `<array c:type="` ~ (output ? "char**" : "const char* const*") ~ stars
  ~ `" zero-terminated="1"><type name="utf8" c:type="char*"/></array>`;
  else static if (is(PT == imported!"gid.glib2.variant".Variant))
  {
    w.includes["GLib"] = "2.0";
    return `<type name="GLib.Variant" c:type="GVariant*` ~ stars ~ `"/>`;
  }
  else static if (is(PT == class) || is(PT == interface))
  return `<type name="` ~ _girEsc(_girRefName!PT(w, where)) ~ `" c:type="` ~ _girEsc(_girRefCType!PT) ~ stars
  ~ `"/>`;
  else
  {
    w.errors ~= where ~ ": type " ~ PT.stringof ~ " can't be described in GIR";
    return `<type name="gpointer" c:type="gpointer"/>`;
  }
}

// <return-value> element
private string _girReturn(PT)(ref _GirWriter w, string transfer, bool nullable, string where, string indent)
{
  return indent ~ `<return-value transfer-ownership="` ~ transfer ~ `"` ~ (nullable ? ` nullable="1"` : "") ~ `>`
  ~ _girType!PT(w, true, 0, where) ~ "</return-value>\n";
}

// <instance-parameter> (or <parameter> in callbacks) of type T
private string _girSelf(T)(ref _GirWriter w, string where, string indent, string elem = "instance-parameter")
{
  return indent ~ `<` ~ elem ~ ` name="self" transfer-ownership="none">` ~ _girType!T(w, false, 0, where) ~ `</`
  ~ elem ~ ">\n";
}

// Name of parameter i (arg<i> for unnamed parameters)
private string _girParamName(string name, size_t i) pure nothrow
{
  import std.conv : to;
  return name.length > 0 ? imported!"gid.gobject2.dig"._snakeCaseName(name) : "arg" ~ i.to!string;
}

// Parameters element of an exported method, function or constructor
private string _girExportParams(T, alias fn)(ref _GirWriter w, bool instance, string where, string indent)
{
  alias P = _dExportParams!fn;
  string s;

  if (instance)
    s ~= _girSelf!T(w, where, indent ~ "  ");

  static foreach (i, PT; P)
  {{
    enum dir = _dParamDir!(fn, i);
    enum nullable = _dParamHas!(fn, i, gNullable);
    string transfer = "none";

    static if (dir != 0)
      transfer = _girOwned!PT && _dParamTransfer!(fn, i) == GidOwnership.None ? "none" : "full";

    s ~= indent ~ `  <parameter name="` ~ _girParamName(ParameterIdentifierTuple!fn[i], i) ~ `"`
    ~ (dir == 1 ? ` direction="out" caller-allocates="0" optional="1"` : dir == 2 ? ` direction="inout"` : "")
    ~ ` transfer-ownership="` ~ transfer ~ `"` ~ (nullable ? ` nullable="1"` : "") ~ `>`
    ~ _girType!PT(w, dir != 0, dir != 0 ? 1 : 0, where) ~ "</parameter>\n";
  }}

  return s.length > 0 ? indent ~ "<parameters>\n" ~ s ~ indent ~ "</parameters>\n" : null;
}

// Element of an exported method, function or constructor (see _dExportMethods)
private string _girExportMethod(T, _DExportMethod m)(ref _GirWriter w, string indent)
{
  alias fn = _dExportOverload!(T, m.mem, m.overload);
  alias R = _dExportReturn!(T, fn);
  enum where = T.stringof ~ "." ~ (m.mem == "__ctor" ? "this" : m.mem);
  enum elem = m.kind == _DExportKind.Constructor ? "constructor" : m.kind == _DExportKind.Function ? "function"
  : "method";

  string transfer = "none";

  static if (m.kind == _DExportKind.Constructor)
    transfer = "full"; // @gConstructor wrappers return a full reference, also for GInitiallyUnowned types
  else static if (_girOwned!R)
  transfer = _dHasUda!(fn, gTransfer) && _dUdaValue!(fn, gTransfer).ownership == GidOwnership.None ? "none"
  : "full";

  return indent ~ `<` ~ elem ~ ` name="` ~ m.name ~ `" c:identifier="` ~ T._gidExportSymbolBase ~ "_" ~ m.name ~ `"`
  ~ (m.throws ? ` throws="1"` : "") ~ ">\n"
  ~ _girReturn!R(w, transfer, _dHasUda!(fn, gNullable), where, indent ~ "  ")
  ~ _girExportParams!(T, fn)(w, m.kind == _DExportKind.Method, where, indent ~ "  ")
  ~ indent ~ "</" ~ elem ~ ">\n";
}

// Parameters of a @gVirtual method (strings and objects are not owned by the callee)
private string _girVfuncParams(T, string mem)(ref _GirWriter w, string selfElem, string where, string indent)
{
  alias fn = _dVirtualFn!(T, mem);
  string s = _girSelf!T(w, where, indent ~ "  ", selfElem);

  static foreach (i, PT; Parameters!fn)
  s ~= indent ~ `  <parameter name="` ~ _girParamName(ParameterIdentifierTuple!fn[i], i)
  ~ `" transfer-ownership="none">` ~ _girType!PT(w, false, 0, where) ~ "</parameter>\n";

  return indent ~ "<parameters>\n" ~ s ~ indent ~ "</parameters>\n";
}

// <virtual-method>, the invoker <method> and the class struct <field> of the @gVirtual methods of T
private void _girVfuncs(T)(ref _GirWriter w, ref string vmethods, ref string invokers, ref string fields)
{
  static foreach (mem; _dVfuncMembers!T)
  {{
    alias fn = _dVirtualFn!(T, mem);
    alias R = ReturnType!fn;
    enum where = T.stringof ~ "." ~ mem;
    enum name = imported!"gid.gobject2.dig"._snakeCaseName(_dVfuncInvokerName(mem));

    vmethods ~= `      <virtual-method name="` ~ name ~ `" invoker="` ~ name ~ "\">\n"
    ~ _girReturn!R(w, "none", false, where, "        ")
    ~ _girVfuncParams!(T, mem)(w, "instance-parameter", where, "        ") ~ "      </virtual-method>\n";

    invokers ~= `      <method name="` ~ name ~ `" c:identifier="` ~ T._gidExportSymbolBase ~ "_" ~ name ~ "\">\n"
    ~ _girReturn!R(w, "none", false, where, "        ")
    ~ _girVfuncParams!(T, mem)(w, "instance-parameter", where, "        ") ~ "      </method>\n";

    fields ~= `      <field name="` ~ name ~ "\">\n        <callback name=\"" ~ name ~ "\">\n"
    ~ _girReturn!R(w, "none", false, where, "          ")
    ~ _girVfuncParams!(T, mem)(w, "parameter", where, "          ") ~ "        </callback>\n      </field>\n";
  }}
}

// Value of the default-value attribute of a property, or null
private string _girDefaultValue(GParamSpec* pspec)
{
  import std.conv : to;
  import std.format : format;
  import gid.gobject2.types : GTypeEnum;

  auto val = g_param_spec_get_default_value(pspec);

  if (!val)
    return null;

  auto v = cast(GValue*)val;

  switch (g_type_fundamental(pspec.valueType))
  {
    case GTypeEnum.Boolean: return g_value_get_boolean(v) ? "TRUE" : "FALSE";
    case GTypeEnum.Char: return g_value_get_schar(v).to!string;
    case GTypeEnum.Uchar: return g_value_get_uchar(v).to!string;
    case GTypeEnum.Int: return g_value_get_int(v).to!string;
    case GTypeEnum.Uint: return g_value_get_uint(v).to!string;
    case GTypeEnum.Long: return g_value_get_long(v).to!string;
    case GTypeEnum.Ulong: return g_value_get_ulong(v).to!string;
    case GTypeEnum.Int64: return g_value_get_int64(v).to!string;
    case GTypeEnum.Uint64: return g_value_get_uint64(v).to!string;
    case GTypeEnum.Float: return format("%g", g_value_get_float(v));
    case GTypeEnum.Double: return format("%g", g_value_get_double(v));
    case GTypeEnum.String: return _girStr(g_value_get_string(v));
    case GTypeEnum.Enum:
    auto klass = cast(GEnumClass*)g_type_class_ref(pspec.valueType);
    scope(exit) g_type_class_unref(cast(GTypeClass*)klass);
    auto ev = g_enum_get_value(klass, g_value_get_enum(v));
    return ev ? _girStr(ev.valueName) : null;
    default: return null;
  }
}

// <property> elements of the properties T declares
private string _girProperties(T)(ref _GirWriter w, GObjectClass* klass, GType gtype)
{
  string s;

  static foreach (mem; __traits(allMembers, T))
  {
    static if (_isDPropertyMember!(T, mem))
    {{
      alias PT = _dPropertyType!(T, mem);
      enum where = T.stringof ~ "." ~ mem;
      enum name = imported!"gid.gobject2.dig"._dPropertyName(mem, _dPropertyUDA!(T, mem).name);
      auto pspec = g_object_class_find_property(klass, name.ptr);

      if (!pspec || pspec.ownerType != gtype)
        w.errors ~= where ~ ": property " ~ name ~ " is not registered";
      else
      {
        auto f = pspec.flags;
        auto def = _girDefaultValue(pspec);
        s ~= `      <property name="` ~ name ~ `"` ~ ((f & GParamFlags.Readable) ? "" : ` readable="0"`)
        ~ ((f & GParamFlags.Writable) ? ` writable="1"` : "") ~ ((f & GParamFlags.Construct) ? ` construct="1"` : "")
        ~ ((f & GParamFlags.ConstructOnly) ? ` construct-only="1"` : "") ~ ` transfer-ownership="none"`
        ~ (def !is null ? ` default-value="` ~ _girEsc(def) ~ `"` : "") ~ ">"
        ~ _girType!PT(w, false, 0, where) ~ "</property>\n";
      }
    }}
  }

  return s;
}

// <glib:signal> elements of the signals T declares
private string _girSignals(T)(ref _GirWriter w, GType gtype)
{
  string s;

  static foreach (mem; __traits(derivedMembers, T))
  {
    static if (imported!"gid.gobject2.dig_signal"._isDSignalMember!(T, mem))
    {{
      alias fn = _dSignalFn!(T, mem);
      alias R = ReturnType!fn;
      enum where = T.stringof ~ "." ~ mem;
      enum name = _dSignalName!(T, mem);
      auto id = g_signal_lookup(name.ptr, gtype);

      if (!id)
        w.errors ~= where ~ ": signal " ~ name ~ " is not registered";
      else
      {
        GSignalQuery q;
        g_signal_query(id, &q);
        auto f = q.signalFlags;
        string params;

        static foreach (i, PT; Parameters!fn)
        params ~= `          <parameter name="` ~ _girParamName(ParameterIdentifierTuple!fn[i], i)
        ~ `" transfer-ownership="none">` ~ _girType!PT(w, false, 0, where) ~ "</parameter>\n";

        s ~= `      <glib:signal name="` ~ name ~ `" when="` ~ ((f & GSignalFlags.RunFirst) ? "first"
        : (f & GSignalFlags.RunLast) ? "last" : "cleanup") ~ `"` ~ ((f & GSignalFlags.Detailed) ? ` detailed="1"` : "")
        ~ ((f & GSignalFlags.Action) ? ` action="1"` : "") ~ ((f & GSignalFlags.NoRecurse) ? ` no-recurse="1"` : "")
        ~ ((f & GSignalFlags.NoHooks) ? ` no-hooks="1"` : "") ~ ">\n"
        ~ _girReturn!R(w, _girOwned!R ? "full" : "none", false, where, "        ")
        ~ (params.length > 0 ? "        <parameters>\n" ~ params ~ "        </parameters>\n" : "")
        ~ "      </glib:signal>\n";
      }
    }}
  }

  return s;
}

// Record the C symbol prefix of the namespace from an exported type
private void _girSymbolPrefix(T)(ref _GirWriter w)
{
  enum base = T._gidExportSymbolBase;
  enum suffix = "_" ~ imported!"gid.gobject2.dig"._snakeCaseName(T._gidExportName);

  if (w.symbolPrefix.length == 0 && base.length > suffix.length && base[$ - suffix.length .. $] == suffix)
    w.symbolPrefix = base[0 .. $ - suffix.length];
}

// GIR name and C type of a type struct (class or interface struct) of a binding or exported type
private string _girTypeStructElem(PT)(ref _GirWriter w, string where)
{
  static if (_girIsExported!PT)
    return `<type name="` ~ _girRefName!PT(w, where) ~ (is(PT == interface) ? "Interface" : "Class") ~ `" c:type="`
  ~ PT._gidExportNs ~ PT._gidExportName ~ (is(PT == interface) ? "Interface" : "Class") ~ `"/>`;
  else static if (_dIsBindingType!PT)
  {
    alias G = imported!"gid.gobject2.dig"._dGirType!PT;
    auto refName = _girRefName!PT(w, where);
    string ctype;

    if (G.typeStruct.length > G.name.length && G.typeStruct[0 .. G.name.length] == G.name)
    {
      auto cname = _girRefCType!PT;
      if (cname.length > 1 && cname[$ - 1] == '*')
        ctype = cname[0 .. $ - 1] ~ G.typeStruct[G.name.length .. $];
    }

    if (G.typeStruct.length == 0)
      w.errors ~= where ~ ": parent type " ~ PT.stringof ~ " has no class structure";

    return `<type name="` ~ G.namespace ~ "." ~ G.typeStruct ~ `"` ~ (ctype.length > 0 ? ` c:type="` ~ ctype ~ `"`
    : "") ~ `/>`;
  }
  else
  {
    w.errors ~= where ~ ": parent type " ~ PT.stringof ~ " must be a binding type or use GObjectExport";
    return `<type name="gpointer"/>`;
  }
}

// <class> and its class struct <record>
private void _girClass(T)(ref _GirWriter w)
{
  alias Parent = BaseClassesTuple!T[0];
  enum where = T.stringof;
  enum typeName = T._gidExportNs ~ T._gidExportName;

  if (typeName in w.done)
    return;

  w.done[typeName] = true;
  _girSymbolPrefix!T(w);

  if (T._gidExportNsVersion.length > 0)
    w.nsVersions ~= T._gidExportNsVersion;

  auto gtype = T._getGType();

  if (!gtype)
  {
    w.errors ~= where ~ ": GType " ~ typeName ~ " can't be registered";
    return;
  }

  auto klass = cast(GObjectClass*)g_type_class_ref(gtype); // Runs class_init: properties and signals
  scope(exit) g_type_class_unref(cast(GTypeClass*)klass);

  string parentName = _girRefName!Parent(w, where);
  string parentCType = _girGTypeName(g_type_parent(gtype));
  string s, vmethods, invokers, fields;

  s ~= `    <class name="` ~ T._gidExportName ~ `" c:symbol-prefix="`
  ~ imported!"gid.gobject2.dig"._snakeCaseName(T._gidExportName) ~ `" c:type="` ~ typeName ~ `" parent="`
  ~ parentName ~ `" glib:type-name="` ~ typeName ~ `" glib:get-type="` ~ T._gidExportGetTypeSymbol
  ~ `" glib:type-struct="` ~ T._gidExportName ~ `Class"` ~ (__traits(isAbstractClass, T) ? ` abstract="1"` : "")
  ~ ">\n";

  // Interfaces the D class adds
  static foreach (I; InterfacesTuple!T)
  static if (!is(Parent : I) && (_girIsExported!I || _dIsBindingType!I))
    s ~= `      <implements name="` ~ _girRefName!I(w, where) ~ "\"/>\n";

  // Automatic _new
  static if (imported!"gid.gobject2.dig"._dHasPublicDefaultCtor!T)
  {
    // A floating reference for GInitiallyUnowned types, described as transfer none like C constructors
    enum floating = is(T : imported!"gid.gobject2.initially_unowned".InitiallyUnowned);
    s ~= `      <constructor name="new" c:identifier="` ~ T._gidExportSymbolBase ~ "_new\">\n"
    ~ _girReturn!T(w, floating ? "none" : "full", false, where, "        ") ~ "      </constructor>\n";
  }

  static foreach (m; _dExportMethods!T)
  static if (m.kind == _DExportKind.Constructor)
    s ~= _girExportMethod!(T, m)(w, "      ");

  _girVfuncs!T(w, vmethods, invokers, fields);
  s ~= vmethods ~ invokers;

  static foreach (m; _dExportMethods!T)
  static if (m.kind != _DExportKind.Constructor)
    s ~= _girExportMethod!(T, m)(w, "      ");

  s ~= _girProperties!T(w, klass, gtype);
  s ~= `      <field name="parent_instance" readable="0" private="1"><type name="` ~ parentName ~ `" c:type="`
  ~ parentCType ~ "\"/></field>\n";
  s ~= _girSignals!T(w, gtype);
  s ~= "    </class>\n";

  s ~= `    <record name="` ~ T._gidExportName ~ `Class" c:type="` ~ typeName ~ `Class" glib:is-gtype-struct-for="`
  ~ T._gidExportName ~ "\">\n      <field name=\"parent_class\">" ~ _girTypeStructElem!Parent(w, where)
  ~ "</field>\n" ~ fields ~ "    </record>\n";

  w.body ~= s;
}

// <interface> and its interface struct <record>
private void _girInterface(I)(ref _GirWriter w)
{
  enum where = I.stringof;
  enum typeName = I._gidExportNs ~ I._gidExportName;

  if (typeName in w.done)
    return;

  w.done[typeName] = true;
  _girSymbolPrefix!I(w);

  if (I._gidExportNsVersion.length > 0)
    w.nsVersions ~= I._gidExportNsVersion;

  if (!I._getGType())
  {
    w.errors ~= where ~ ": GType " ~ typeName ~ " can't be registered";
    return;
  }

  string s, vmethods, invokers, fields;

  s ~= `    <interface name="` ~ I._gidExportName ~ `" c:symbol-prefix="`
  ~ imported!"gid.gobject2.dig"._snakeCaseName(I._gidExportName) ~ `" c:type="` ~ typeName ~ `" glib:type-name="`
  ~ typeName ~ `" glib:get-type="` ~ I._gidExportGetTypeSymbol ~ `" glib:type-struct="` ~ I._gidExportName
  ~ "Interface\">\n      <prerequisite name=\"GObject.Object\"/>\n";

  static foreach (J; InterfacesTuple!I)
  static if (_isDInterface!J)
    s ~= `      <prerequisite name="` ~ _girRefName!J(w, where) ~ "\"/>\n";

  _girVfuncs!I(w, vmethods, invokers, fields);
  s ~= vmethods ~ invokers ~ "    </interface>\n";

  s ~= `    <record name="` ~ I._gidExportName ~ `Interface" c:type="` ~ typeName
  ~ `Interface" glib:is-gtype-struct-for="` ~ I._gidExportName ~ "\">\n"
  ~ "      <field name=\"g_iface\"><type name=\"GObject.TypeInterface\" c:type=\"GTypeInterface\"/></field>\n"
  ~ fields ~ "    </record>\n";

  w.body ~= s;
}

// Default C header name of a D namespace ("Mylib" -> "mylib.h", "GidgenExport" -> "gidgen_export.h")
package string _girDefaultHeader(string ns) pure
{
  return imported!"gid.gobject2.dig"._snakeCaseName(ns) ~ ".h";
}

// Element of the GIR XML written by the GIR writer (for the C header)
private class _GirNode
{
  string tag; // Element name
  string[string] attrs; // Attributes (unescaped)
  _GirNode[] kids; // Child elements

  string attr(string name)
  {
    auto p = name in attrs;
    return p ? *p : null;
  }

  _GirNode kid(string name)
  {
    foreach (k; kids)
      if (k.tag == name)
      return k;

    return null;
  }
}

// Parse the XML the GIR writer generates (elements and attributes, no text content)
private _GirNode _girParse(string xml)
{
  import std.array : replace;
  import std.string : indexOf;

  auto root = new _GirNode;
  _GirNode[] stack = [root];
  size_t i;

  while (true)
  {
    auto lt = xml[i .. $].indexOf('<');

    if (lt < 0)
      break;

    i += lt + 1;

    if (xml[i] == '?' || xml[i] == '!')
    {
      i += xml[i .. $].indexOf('>') + 1;
      continue;
    }

    if (xml[i] == '/')
    {
      i += xml[i .. $].indexOf('>') + 1;
      stack = stack[0 .. $ - 1];
      continue;
    }

    auto node = new _GirNode;
    auto start = i;

    while (xml[i] != ' ' && xml[i] != '>' && xml[i] != '/')
      i++;

    node.tag = xml[start .. i];

    while (true)
    {
      while (xml[i] == ' ' || xml[i] == '\n')
        i++;

      if (xml[i] == '/' || xml[i] == '>')
        break;

      auto eq = xml[i .. $].indexOf('=');
      auto name = xml[i .. i + eq];
      i += eq + 2; // ="
      auto q = xml[i .. $].indexOf('"');
      node.attrs[name] = xml[i .. i + q].replace("&#10;", "\n").replace("&quot;", "\"").replace("&lt;", "<")
      .replace("&gt;", ">").replace("&amp;", "&");
      i += q + 1;
    }

    stack[$ - 1].kids ~= node;

    if (xml[i] == '/')
      i += 2;
    else
    {
      i++;
      stack ~= node;
    }
  }

  return root;
}

// C type of a <type> or <array> element in a parent element
private string _girNodeCType(_GirNode n)
{
  foreach (k; n.kids)
    if (k.tag == "type" || k.tag == "array")
    return k.attr("c:type");

  return "gpointer";
}

// C declaration of a variable or parameter of C type ctype ("const char*", "x" -> "const char *x")
private string _girCDecl(string ctype, string name)
{
  size_t e = ctype.length;

  while (e > 0 && ctype[e - 1] == '*')
    e--;

  return e < ctype.length ? ctype[0 .. e] ~ " " ~ ctype[e .. $] ~ name : ctype ~ " " ~ name;
}

// C parameter list of a constructor, method, function or callback element
private string _girCParams(_GirNode fn)
{
  import std.array : join;

  string[] params;

  if (auto ps = fn.kid("parameters"))
    foreach (p; ps.kids)
    params ~= _girCDecl(_girNodeCType(p), p.attr("name"));

  if (fn.attr("throws") == "1")
    params ~= "GError **error";

  return params.length > 0 ? params.join(", ") : "void";
}

// C prototype of a constructor, method or function element
private string _girCPrototype(_GirNode fn)
{
  auto ret = _girNodeCType(fn.kid("return-value"));
  return _girCDecl(ret, fn.attr("c:identifier")) ~ " (" ~ _girCParams(fn) ~ ");\n";
}

// C struct definition of a class or interface struct <record>
private string _girCStruct(_GirNode rec)
{
  string s = "struct _" ~ rec.attr("c:type") ~ "\n{\n";

  foreach (f; rec.kids)
  {
    if (f.tag != "field")
      continue;

    if (auto cb = f.kid("callback"))
      s ~= "  " ~ _girCDecl(_girNodeCType(cb.kid("return-value")), "(*" ~ f.attr("name") ~ ")") ~ " ("
    ~ _girCParams(cb) ~ ");\n";
    else
      s ~= "  " ~ _girCDecl(_girNodeCType(f), f.attr("name")) ~ ";\n";
  }

  return s ~ "};\n";
}

/**
* C header of the GIR XML the GIR writer generated: type macros, instance, class and interface structs and the
* prototypes of the exported functions.
* Params:
*   xml = The GIR XML
*   headerName = Name of the header (for the include guard)
*   includes = Headers to include
* Returns: The header
*/
package string _girHeader(string xml, string headerName, string[] includes)
{
  import std.ascii : isAlphaNum, asciiUpper = toUpper;
  import std.string : toUpper;

  auto repo = _girParse(xml).kid("repository");
  auto ns = repo.kid("namespace");
  auto macroPrefix = ns.attr("c:symbol-prefixes").toUpper;

  string guard;
  foreach (char c; headerName)
    guard ~= isAlphaNum(c) ? asciiUpper(c) : '_';

  string s = "/* " ~ headerName ~ ": C API of the " ~ ns.attr("name") ~ " " ~ ns.attr("version")
  ~ " GObject types, generated by giD (GObjectGirMain), do not edit */\n\n#ifndef " ~ guard ~ "\n#define " ~ guard
  ~ "\n\n";

  foreach (h; includes)
    s ~= "#include <" ~ h ~ ">\n";

  s ~= "\nG_BEGIN_DECLS\n\n";

  _GirNode[string] records;
  _GirNode[] types;

  foreach (k; ns.kids)
  {
    if (k.tag == "record")
      records[k.attr("name")] = k;
    else if (k.tag == "class" || k.tag == "interface")
    types ~= k;
  }

  foreach (t; types)
    s ~= "typedef struct _" ~ t.attr("c:type") ~ " " ~ t.attr("c:type") ~ ";\n";

  foreach (t; types)
    if (auto rec = t.attr("glib:type-struct") in records)
    s ~= "typedef struct _" ~ rec.attr("c:type") ~ " " ~ rec.attr("c:type") ~ ";\n";

  // Interfaces first, then the classes after the parents of the namespace
  _GirNode[] ordered;
  bool[string] placed;

  foreach (t; types)
    if (t.tag == "interface")
  {
    ordered ~= t;
    placed[t.attr("name")] = true;
  }

  for (bool progress = true; progress;)
  {
    progress = false;

    foreach (t; types)
    {
      auto parent = t.attr("parent");
      bool inNs = parent.length > 0 && !imported!"std.algorithm".canFind(parent, '.');

      if (t.attr("name") !in placed && (!inNs || parent in placed))
      {
        ordered ~= t;
        placed[t.attr("name")] = progress = true;
      }
    }
  }

  foreach (t; ordered)
  {
    auto cType = t.attr("c:type");
    auto m = macroPrefix ~ "_" ~ t.attr("c:symbol-prefix").toUpper;
    auto typeMacro = macroPrefix ~ "_TYPE_" ~ t.attr("c:symbol-prefix").toUpper;
    auto rec = t.attr("glib:type-struct") in records;
    auto recType = rec ? rec.attr("c:type") : null;

    auto isMacro = macroPrefix ~ "_IS_" ~ t.attr("c:symbol-prefix").toUpper;

    s ~= "\n/* " ~ cType ~ " */\n\n#define " ~ typeMacro ~ " (" ~ t.attr("glib:get-type") ~ " ())\n"
    ~ "#define " ~ m ~ "(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), " ~ typeMacro ~ ", " ~ cType ~ "))\n"
    ~ "#define " ~ isMacro ~ "(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), " ~ typeMacro ~ "))\n";

    if (t.tag == "interface")
    {
      if (rec)
        s ~= "#define " ~ m ~ "_GET_IFACE(obj) (G_TYPE_INSTANCE_GET_INTERFACE ((obj), " ~ typeMacro ~ ", " ~ recType
      ~ "))\n";
    }
    else
    {
      if (rec)
        s ~= "#define " ~ m ~ "_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), " ~ typeMacro ~ ", " ~ recType ~ "))\n"
      ~ "#define " ~ isMacro ~ "_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), " ~ typeMacro ~ "))\n"
      ~ "#define " ~ m ~ "_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), " ~ typeMacro ~ ", " ~ recType
      ~ "))\n";

      s ~= "\nstruct _" ~ cType ~ "\n{\n";

      foreach (f; t.kids)
        if (f.tag == "field")
        s ~= "  " ~ _girCDecl(_girNodeCType(f), f.attr("name")) ~ ";\n";

      s ~= "};\n";
    }

    if (rec)
      s ~= "\n" ~ _girCStruct(*rec);

    s ~= "\nGType " ~ t.attr("glib:get-type") ~ " (void) G_GNUC_CONST;\n";

    foreach (fn; t.kids)
      if (fn.tag == "constructor" || fn.tag == "method" || fn.tag == "function")
      s ~= _girCPrototype(fn);
  }

  s ~= "\nG_END_DECLS\n\n#endif /* " ~ guard ~ " */\n";
  return s;
}
