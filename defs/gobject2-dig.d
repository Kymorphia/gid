//!class Dig pre
//!kind Dig Namespace
//!inhibit init funcs imports

/**
 * Types and mixins for declaring GObject types, properties, and signals in D.
 *
 * Import `gid.gobject2.object` (or this module) and add `mixin GObjectSubclass` or `mixin GObjectExport` to a class.
 * Mark fields or getters and setters with `@gProperty`, public methods with `@gSignal`, and new virtual methods with
 * `@gVirtual`. Add `mixin GInterfaceDef` to a D interface to make it a GObject interface.
 */
public import gid.gobject2.dig_property;
public import gid.gobject2.dig_signal;
public import gid.gobject2.dig_iface;
public import gid.gobject2.dig_method;
public import gid.gobject2.dig_vfunc;
public import gid.gobject2.dig_gir;

import core.atomic;
import gid.glib2.c.functions;
import gid.glib2.c.types : GLogLevelFlags;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;


/**
 * Gives a D class derived from a GObject class (such as `gid.gtk4.widget.Widget` or `ObjectWrap`) its own GObject type.
 * Use it to override virtual methods or implement interfaces.
 *
 * Add `mixin GObjectSubclass;` to the class and call `super()` in its constructors. Override the protected methods
 * named after the C virtual function in TitleCase, for example `vfuncSnapshot`. Mark fields or getters and setters
 * with `@gProperty` to declare GObject properties, and public methods with `@gSignal` to declare GObject signals (each
 * signal gets an `emitFoo` method and a `connectFoo` method). Each class in a hierarchy needs its own mixin. The type
 * name must be unique; pass `typeName` to choose a different one.
 *
 * Params:
 *   typeName = Type name, or null to derive one from the D class name with a "D" prefix
 *
 * Example:
 * ---
 * class MyWidget : gid.gtk4.widget.Widget
 * {
 *   mixin GObjectSubclass;
 *
 *   this()
 *   {
 *     super();
 *   }
 *
 *   override protected void vfuncSnapshot(gid.gtk4.snapshot.Snapshot snapshot)
 *   {
 *     super.vfuncSnapshot(snapshot);
 *   }
 * }
 * ---
 */
mixin template GObjectSubclass(string typeName = null)
{
  static assert(is(typeof(this) : imported!"gid.gobject2.object".ObjectWrap),
    "GObjectSubclass can only be used in classes derived from gid.gobject2.object.ObjectWrap");

  /// GType name of the D class
  enum string _gidDTypeName = typeName.length > 0 ? typeName
    : imported!"gid.gobject2.dig"._dSubclassTypeName!(typeof(this));

  private __gshared imported!"gid.gobject2.types".GType _gidDGType; // Registered GType (0 until registered)

  /**
   * Get the GType of the D class, registering it on first use.
   * Returns: The GType
   */
  static imported!"gid.gobject2.types".GType _getGType() nothrow
  {
    return imported!"gid.gobject2.dig"._registerDSubclass!(typeof(this))(_gidDGType, _gidDTypeName);
  }

  /** */
  override @property imported!"gid.gobject2.types".GType _gType() nothrow
  {
    return _getGType;
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return _gidDTypeName;
  }

  /** */
  override protected imported!"gid.gobject2.types".GType _dSubclassGType() nothrow
  {
    return _getGType;
  }

  /** */
  override protected bool _usesDSubclassGType() nothrow
  {
    return true;
  }

  static assert(is(typeof(this)._gidExportedAs == typeof(this))
    || !imported!"gid.gobject2.dig_method"._dHasExportMethods!(typeof(this)), typeof(this).stringof
    ~ ": @gMethod and @gConstructor need mixin GObjectExport instead of GObjectSubclass");

  static foreach (_gidSignalMem; __traits(derivedMembers, typeof(this)))
  {
    static if (imported!"gid.gobject2.dig"._isDSignalMember!(typeof(this), _gidSignalMem))
      mixin imported!"gid.gobject2.dig"._GObjectSignalMembers!(typeof(this), _gidSignalMem);

    static if (imported!"gid.gobject2.dig"._isDVirtualMember!(typeof(this), _gidSignalMem))
      mixin imported!"gid.gobject2.dig"._GObjectVfuncMembers!(typeof(this), _gidSignalMem);
  }
}

/**
 * Adds the invoker `foo` and the implementation shim `_gidVfuncImpl_foo` for the `@gVirtual` method `vfuncFoo` (see
 * GObjectSubclass). The invoker calls through the class struct, the trampoline of the class struct calls the shim,
 * which calls the method (a virtual call, so that D subclasses can override it).
 */
mixin template _GObjectVfuncMembers(T, string mem)
{
  mixin("@(imported!\"gid.gobject2.dig_method\"._gidGenerated) final imported!\"gid.gobject2.dig\"._dVfuncReturn!(T, mem) " ~ imported!"gid.gobject2.dig"._dVfuncInvokerName(mem)
    ~ "(imported!\"gid.gobject2.dig\"._dVfuncParams!(T, mem) args) { return imported!\"gid.gobject2.dig\"._dVfuncInvoke!(T, mem)(this, args); }");
  mixin("final imported!\"gid.gobject2.dig\"._dVfuncReturn!(T, mem) _gidVfuncImpl_" ~ imported!"gid.gobject2.dig"._dVfuncInvokerName(mem)
    ~ "(imported!\"gid.gobject2.dig\"._dVfuncParams!(T, mem) args) { return this." ~ mem ~ "(args); }");
}

/**
 * Adds `emitFoo` and `connectFoo` for the `@gSignal` method `foo` (see GObjectSubclass).
 */
mixin template _GObjectSignalMembers(T, string mem)
{
  mixin("@(imported!\"gid.gobject2.dig_method\"._gidGenerated) final imported!\"gid.gobject2.dig\"._dSignalReturn!(T, mem) emit"
    ~ imported!"gid.gobject2.dig"._dSignalTitle(mem)
    ~ "(imported!\"gid.gobject2.dig\"._dSignalParams!(T, mem) args) { return"
    ~ " imported!\"gid.gobject2.dig\"._dSignalEmit!(T, mem)(this, null, args); }");

  static if (imported!"gid.gobject2.dig"._dSignalDetailed!(T, mem))
  {
    mixin("@(imported!\"gid.gobject2.dig_method\"._gidGenerated) final imported!\"gid.gobject2.dig\"._dSignalReturn!(T, mem) emit"
      ~ imported!"gid.gobject2.dig"._dSignalTitle(mem)
      ~ "(string detail, imported!\"gid.gobject2.dig\"._dSignalParams!(T, mem) args) { return"
      ~ " imported!\"gid.gobject2.dig\"._dSignalEmit!(T, mem)(this, detail, args); }");

    mixin("@(imported!\"gid.gobject2.dig_method\"._gidGenerated) final imported!\"gid.core.basictypes\".gulong connect" ~ imported!"gid.gobject2.dig"._dSignalTitle(mem)
      ~ "(C)(string detail, C callback, imported!\"std.typecons\".Flag!\"After\" after ="
      ~ " imported!\"std.typecons\".No.After) nothrow if (imported!\"std.traits\".isCallable!C) { return"
      ~ " imported!\"gid.gobject2.dig\"._dSignalConnect!(T, mem, C)(this, detail, callback, after); }");
  }

  mixin("@(imported!\"gid.gobject2.dig_method\"._gidGenerated) final imported!\"gid.core.basictypes\".gulong connect" ~ imported!"gid.gobject2.dig"._dSignalTitle(mem)
    ~ "(C)(C callback, imported!\"std.typecons\".Flag!\"After\" after = imported!\"std.typecons\".No.After)"
    ~ " nothrow if (imported!\"std.traits\".isCallable!C) { return"
    ~ " imported!\"gid.gobject2.dig\"._dSignalConnect!(T, mem, C)(this, null, callback, after); }");
}

/**
 * Declares the namespace of the GObject types your library exports. Mix it in once at module scope, or in the
 * library's `package.d`.
 *
 * For example, `mixin GObjectNamespace!("Mylib");` names types `MylibFoo` and C functions `mylib_foo_...`.
 *
 * After the namespace you can pass, in any order: the GIR version, the C function prefix, GidExport flags and a
 * GidSkip mode. A string that starts with a digit is the version ("1.0"), another string is the prefix. The version is
 * needed when the types are used by the GIR of another namespace (see GObjectGirMain). The flags and mode are the
 * defaults of the GObjectExport classes that see this declaration; a class that passes its own GidExport flags or
 * GidSkip mode replaces them.
 *
 * Params:
 *   ns = Namespace ("Mylib")
 *   Options = GIR version ("1.0"), C function prefix (null to derive one from the namespace: "MyLib" becomes
 *     "my_lib"; pass "mylib" if that is what you want), GidExport flags, GidSkip mode
 *
 * Example:
 * ---
 * mixin GObjectNamespace!("Mylib");
 * mixin GObjectNamespace!("Mylib", "1.0"); // With the GIR version
 * mixin GObjectNamespace!("MyLib", "1.0", "mylib", GidExport.All | GidExport.Throws, GidSkip.Error); // Or more
 * ---
 */
mixin template GObjectNamespace(string ns, Options...)
{
  private enum _gidNamespaceOptions = imported!"gid.gobject2.dig_method"._dParseExportOptions!("GObjectNamespace", 2,
    Options);
  static assert(_gidNamespaceOptions.error is null, _gidNamespaceOptions.error);

  private enum _gidNamespaceStrings = imported!"gid.gobject2.dig"._dNamespaceStrings(_gidNamespaceOptions.strings);
  static assert(_gidNamespaceStrings.error is null, _gidNamespaceStrings.error);

  static assert(imported!"gid.gobject2.dig"._isValidNamespace(ns), "GObjectNamespace: invalid namespace \""
    ~ ns ~ "\" (must start with an ASCII letter, followed by letters and digits)");

  /// GObject namespace of exported types (see GObjectExport)
  enum string _gidNamespace = ns;

  /// GIR version of the namespace, or null
  enum string _gidNamespaceVersion = _gidNamespaceStrings.nsVersion;

  /// C symbol prefix of exported types
  enum string _gidSymbolPrefix = _gidNamespaceStrings.prefix.length > 0 ? _gidNamespaceStrings.prefix
    : imported!"gid.gobject2.dig"._snakeCaseName(ns);

  /// Default GidExport flags of exported types
  enum imported!"gid.gobject2.dig_method".GidExport _gidNamespaceExportFlags = _gidNamespaceOptions.flags;

  /// Default GidSkip mode of exported types
  enum imported!"gid.gobject2.dig_method".GidSkip _gidNamespaceExportSkip = _gidNamespaceOptions.skip;
}

/**
 * Use this instead of GObjectSubclass when a D class should be usable from other languages (C, Python, GJS,
 * GtkBuilder, and so on) from a shared library.
 *
 * Declare the library namespace once with GObjectNamespace, add `mixin GObjectExport;` to the class, and give it a
 * public default constructor `this()`. The type name (namespace and name) must be unique. Don't unload the library
 * after it has been loaded.
 *
 * The exported C functions are named after the C symbol prefix of the namespace and the type name in snake case
 * (`mylib_foo_bar_` for `MylibFooBar`):
 * - `get_type` (unless cSymbol is given)
 * - `new`, which returns a new instance (transfer full, or a floating reference for a GInitiallyUnowned type), if
 *   the class has a public default constructor
 * - one invoker per `@gVirtual` method the class declares, named after the D invoker (`vfuncDoThing` gives
 *   `mylib_foo_bar_do_thing(MylibFooBar *self, ...)`), which calls the implementation in the class struct of the
 *   instance (D, C, or another language)
 * - one function per method, static method or constructor marked `@gMethod` or `@gConstructor` (see gMethod)
 *
 * Pass GidExport flags to also export public members without attributes, for example `GidExport.All` (or use
 * GObjectExportAll) for public methods, static methods and D `@property` accessors. Without flags, the defaults of
 * GObjectNamespace are used, or only members with attributes.
 *
 * Params:
 *   Options = Up to three strings, in order: the namespace (null to use the one declared with GObjectNamespace),
 *     the type name without the namespace (null to use the D class name) and the name of the exported C get_type
 *     function (null for the default). In any position: GidExport flags and a GidSkip mode.
 *
 * Example:
 * ---
 * mixin GObjectNamespace!("Mylib");
 *
 * class Foo : gid.gobject2.object.ObjectWrap
 * {
 *   mixin GObjectExport; // Type MylibFoo, C functions mylib_foo_get_type() and mylib_foo_new()
 *
 *   this()
 *   {
 *     super();
 *   }
 *
 *   @gMethod int add(int a, int b) // C function int mylib_foo_add(MylibFoo *self, int a, int b)
 *   {
 *     return a + b;
 *   }
 * }
 *
 * class Bar : gid.gobject2.object.ObjectWrap
 * {
 *   mixin GObjectExport!(GidExport.Methods | GidExport.Properties); // Type MylibBar
 *
 *   int sum(int a, int b) { return a + b; }  // C function int mylib_bar_sum(MylibBar *self, int a, int b)
 *   @property int size() { return 1; }       // Read-only GObject property "size"
 *   @gNoExport void debugDump() {}            // Not exported
 * }
 * ---
 */
mixin template GObjectExport(Options...)
{
  private enum _gidExportOptions = imported!"gid.gobject2.dig_method"._dParseExportOptions!("GObjectExport", 3,
    Options);
  static assert(_gidExportOptions.error is null, _gidExportOptions.error);

  /// GidExport flags of the class: its options, otherwise the GObjectNamespace defaults
  static if (_gidExportOptions.hasFlags)
    enum imported!"gid.gobject2.dig_method".GidExport _gidExportFlags = _gidExportOptions.flags;
  else static if (__traits(compiles, _gidNamespaceExportFlags))
    enum imported!"gid.gobject2.dig_method".GidExport _gidExportFlags = _gidNamespaceExportFlags;
  else
    enum imported!"gid.gobject2.dig_method".GidExport _gidExportFlags = imported!"gid.gobject2.dig_method"
      .GidExport.None;

  /// GidSkip mode of the class
  static if (_gidExportOptions.hasSkip)
    enum imported!"gid.gobject2.dig_method".GidSkip _gidExportSkip = _gidExportOptions.skip;
  else static if (__traits(compiles, _gidNamespaceExportSkip))
    enum imported!"gid.gobject2.dig_method".GidSkip _gidExportSkip = _gidNamespaceExportSkip;
  else
    enum imported!"gid.gobject2.dig_method".GidSkip _gidExportSkip = imported!"gid.gobject2.dig_method"
      .GidSkip.Warn;

  mixin imported!"gid.gobject2.dig"._GObjectExportNames!(_gidExportOptions.str(0), _gidExportOptions.str(1),
    "GObjectExport");
  mixin imported!"gid.gobject2.dig".GObjectSubclass!(_gidExportNs ~ _gidExportName);
  mixin imported!"gid.gobject2.dig"._GObjectExportEntryPoints!(_gidExportOptions.str(2));

  static if (imported!"gid.gobject2.dig"._dHasPublicDefaultCtor!(typeof(this)))
  {
    /// Exported `<prefix>_<type>_new()` C function: a new instance (with `g_object_new`), transfer full (floating
    /// for a GInitiallyUnowned type)
    pragma(mangle, _gidExportSymbolBase ~ "_new")
    export extern(C) static imported!"gid.gobject2.c.types".GObject* _gidExportNew() nothrow
    {
      imported!"gid.core.utils".gidInitRuntime();
      imported!"gid.core.utils".gidAttachThread();
      return cast(imported!"gid.gobject2.c.types".GObject*)imported!"gid.gobject2.c.functions"
        .g_object_new_with_properties(_getGType, 0, null, null);
    }
  }

  // Exported methods, functions and constructors (@gMethod, @gConstructor)
  static foreach (_gidExportK, _gidExportM; imported!"gid.gobject2.dig_method"._dExportMethods!(typeof(this)))
  {
    static assert(imported!"gid.gobject2.dig_method"._dExportMethodProblem!(typeof(this), _gidExportM.mem,
      _gidExportM.overload) is null, imported!"gid.gobject2.dig_method"._dExportMethodProblem!(typeof(this),
      _gidExportM.mem, _gidExportM.overload));

    static if (imported!"gid.gobject2.dig_method"._dExportMethodProblem!(typeof(this), _gidExportM.mem,
        _gidExportM.overload) is null)
      mixin imported!"gid.gobject2.dig_method"._GObjectExportMethod!(typeof(this), _gidExportM.mem,
        _gidExportM.overload, _gidExportK, _gidExportSymbolBase ~ "_" ~ _gidExportM.name);
  }

  // Auto-export: overloads and skipped members
  static assert(imported!"gid.gobject2.dig_method"._dExportOverloadProblem!(typeof(this)) is null,
    imported!"gid.gobject2.dig_method"._dExportOverloadProblem!(typeof(this)));

  static foreach (_gidExportSkipMsg; imported!"gid.gobject2.dig_method"._dExportSkipped!(typeof(this)))
  {
    static if (_gidExportSkip == imported!"gid.gobject2.dig_method".GidSkip.Warn)
      pragma(msg, "Warning: " ~ _gidExportSkipMsg);
    else static if (_gidExportSkip == imported!"gid.gobject2.dig_method".GidSkip.Error)
      static assert(0, _gidExportSkipMsg);
  }

  static assert(imported!"gid.gobject2.dig_method"._dExportNamesProblem!(typeof(this),
    imported!"gid.gobject2.dig"._dHasPublicDefaultCtor!(typeof(this))) is null,
    imported!"gid.gobject2.dig_method"._dExportNamesProblem!(typeof(this),
    imported!"gid.gobject2.dig"._dHasPublicDefaultCtor!(typeof(this))));
}

/**
 * Namespace, type name and C symbol prefix of a GObjectExport class or GInterfaceExport interface.
 * The symbol base is the C symbol prefix of the namespace followed by the type name in snake case
 * (`mylib_foo_bar` for `MylibFooBar`), the prefix of the exported C functions of the type.
 */
mixin template _GObjectExportNames(string ns, string name, string mixinName)
{
  static if (ns.length > 0)
    enum string _gidExportNs = ns; /// Namespace of the exported type
  else static if (__traits(compiles, _gidNamespace))
    enum string _gidExportNs = _gidNamespace; /// ditto
  else
    enum string _gidExportNs = null; /// ditto

  static assert(_gidExportNs.length > 0, mixinName ~ ": no namespace for " ~ typeof(this).stringof ~ ", declare it"
    ~ " at module scope with `mixin GObjectNamespace!(\"Mylib\");` or pass it: `mixin " ~ mixinName
    ~ "!(\"Mylib\");`");

  /// GIR version of the namespace: the one declared with GObjectNamespace for its namespace, otherwise null
  static if (__traits(compiles, _gidNamespace) && __traits(compiles, _gidNamespaceVersion)
      && _gidExportNs == _gidNamespace)
    enum string _gidExportNsVersion = _gidNamespaceVersion;
  else
    enum string _gidExportNsVersion = null;

  /// Type name without the namespace
  enum string _gidExportName = name.length > 0 ? name : __traits(identifier, typeof(this));

  /// The exported type (not inherited: a subclass which isn't exported has the type of its parent here)
  alias _gidExportedAs = typeof(this);

  /// C symbol prefix of the exported functions of the type (`mylib_foo`)
  static if (__traits(compiles, _gidSymbolPrefix) && __traits(compiles, _gidNamespace)
      && _gidExportNs == _gidNamespace) // Declared namespace: use its symbol prefix
    enum string _gidExportSymbolBase = _gidSymbolPrefix ~ "_" ~ imported!"gid.gobject2.dig"._snakeCaseName(_gidExportName);
  else
    enum string _gidExportSymbolBase = imported!"gid.gobject2.dig"._snakeCaseName(_gidExportNs) ~ "_"
      ~ imported!"gid.gobject2.dig"._snakeCaseName(_gidExportName);
}

/**
 * Exported C functions of a GObjectExport class or GInterfaceExport interface: `get_type`, and the invokers of
 * the `@gVirtual` methods it declares (`<prefix>_<type>_<invoker>`), and the library constructor which initializes
 * the D runtime.
 */
mixin template _GObjectExportEntryPoints(string cSymbol)
{
  /// Name of the exported get_type C function
  static if (cSymbol.length > 0)
    enum string _gidExportGetTypeSymbol = cSymbol;
  else
    enum string _gidExportGetTypeSymbol = _gidExportSymbolBase ~ "_get_type";

  /// Exported get_type function of the GType
  pragma(mangle, _gidExportGetTypeSymbol)
  export extern(C) static imported!"gid.gobject2.types".GType _gidExportGetType() nothrow
  {
    imported!"gid.core.utils".gidInitRuntime();
    imported!"gid.core.utils".gidAttachThread();
    return _getGType;
  }

  // Library constructor initializing the D runtime for non-D programs
  pragma(crt_constructor)
  extern(C) static void _gidExportInit() nothrow
  {
    imported!"gid.core.utils".gidInitRuntime();
  }

  static foreach (_gidExportVfuncMem; imported!"gid.gobject2.dig_vfunc"._dVfuncMembers!(typeof(this)))
    mixin imported!"gid.gobject2.dig_vfunc"._GObjectExportVfuncInvoker!(typeof(this), _gidExportVfuncMem,
      _gidExportSymbolBase);
}

/**
 * True if the class T has a public constructor without arguments (or none at all) and is not abstract
 */
template _dHasPublicDefaultCtor(T)
{
  // Only the constructors declared by T count: without any, the implicit default constructor is used (base class
  // constructors are found too while the class is still being analyzed)
  enum bool _dHasPublicDefaultCtor = () {
    static if (__traits(isAbstractClass, T))
      return false;
    else
    {
      bool declared, found;

      static if (__traits(hasMember, T, "__ctor"))
        static foreach (ctor; __traits(getOverloads, T, "__ctor"))
          static if (is(__traits(parent, ctor) == T))
          {
            declared = true;

            static if (imported!"std.traits".Parameters!ctor.length == 0 && __traits(getVisibility, ctor) == "public")
              found = true;
          }

      return found || !declared;
    }
  }();
}

/**
 * Default GType name of a D subclass (see GObjectSubclass): "D" followed by the fully qualified D class name with
 * characters which are not valid in GType names replaced by '_'.
 */
template _dSubclassTypeName(T)
{
  enum string _dSubclassTypeName = () {
    import std.traits : fullyQualifiedName;

    string name = "D";

    foreach (char c; fullyQualifiedName!T)
      name ~= (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '_' ? c : '_';

    return name;
  }();
}

/**
 * Default name of the exported get_type function of a GObjectExport type: the namespace and type name converted
 * from CamelCase to lower snake case (a '_' before an upper case letter following a lower case letter or digit,
 * or ending a run of upper case letters followed by a lower case letter), as GObject type macros name them.
 * Params:
 *   ns = Namespace ("Mylib")
 *   name = Type name without the namespace ("FooBar")
 * Returns: The symbol name ("mylib_foo_bar_get_type")
 */
static string _exportGetTypeSymbol(string ns, string name) pure nothrow
{
  return _snakeCaseName(ns) ~ "_" ~ _snakeCaseName(name) ~ "_get_type";
}

/**
 * Convert a CamelCase name to lower snake case as GObject type macros do (see _exportGetTypeSymbol), usable at
 * compile time.
 * Params:
 *   s = CamelCase name ("HTTPServer")
 * Returns: Lower snake case name ("http_server")
 */
static string _snakeCaseName(string s) pure nothrow
{
  string result;

  foreach (i, char c; s)
  {
    bool isUpper(char x) { return x >= 'A' && x <= 'Z'; }
    bool isLowerOrDigit(char x) { return (x >= 'a' && x <= 'z') || (x >= '0' && x <= '9'); }

    if (i > 0 && isUpper(c) && (isLowerOrDigit(s[i - 1])
        || (isUpper(s[i - 1]) && i + 1 < s.length && isLowerOrDigit(s[i + 1]) && !(s[i + 1] >= '0' && s[i + 1] <= '9'))))
      result ~= '_';

    result ~= isUpper(c) ? cast(char)(c + ('a' - 'A')) : c;
  }

  return result;
}

/**
 * GIR name of a type of a giD binding, such as `gid.gtk4.widget.Widget` ("Gtk.Widget") or `gid.gtk4.types.Orientation`
 * ("Gtk.Orientation"), used to export D-defined GObject types to GIR. The type name comes from the `@gidGir`
 * attribute which gidgen adds to the D declaration of each binding type, and the namespace and version from the
 * `_gidGirNamespace` and `_gidGirVersion` constants of the c/types.d module of the binding. GObjectExport classes and
 * GInterfaceExport interfaces have the namespace and name of their export, and the GIR version of their GObjectNamespace
 * declaration (null if it has none).
 *
 * Members:
 *   namespace = GIR namespace ("Gtk")
 *   nsVersion = GIR namespace version ("4.0")
 *   name = GIR type name without the namespace ("Widget")
 *   fullName = GIR type name with the namespace ("Gtk.Widget")
 *   typeStruct = GIR name of the class or interface structure without the namespace ("WidgetClass"), or null
 *   cIncludes = C headers of the namespace (`["gtk/gtk.h"]`), binding types only (from `_gidGirCIncludes`)
 */
template _dGirType(T)
{
  import gid.core.basictypes : gidGir;
  import std.traits : getUDAs, moduleName;

  static if (__traits(compiles, T._gidExportedAs) && is(T._gidExportedAs == T) && __traits(compiles, T._gidExportNs))
  { // GObjectExport class or GInterfaceExport interface
    enum string namespace = T._gidExportNs;
    enum string nsVersion = T._gidExportNsVersion; // null if GObjectNamespace has no version
    enum string name = T._gidExportName;
    enum string fullName = namespace ~ "." ~ name;
    enum string typeStruct = name ~ (is(T == interface) ? "Interface" : "Class");
  }
  else
  {
  static if (__traits(compiles, getUDAs!(T, gidGir)))
    private alias _udas = getUDAs!(T, gidGir);
  else
    private alias _udas = imported!"std.meta".AliasSeq!();

  static assert(_udas.length == 1, "Type " ~ T.stringof ~ " is not a type of a giD binding (no @gidGir attribute)");

  private enum string _mod = moduleName!T;
  private enum string _pkg = () {
    if (_mod.length > 8 && _mod[$ - 8 .. $] == ".c.types")
      return _mod[0 .. $ - 8];

    foreach_reverse (i, c; _mod)
      if (c == '.')
        return _mod[0 .. i];

    return _mod;
  }();

  static if (_udas.length == 1)
  {
    private alias _ctypes = imported!(_pkg ~ ".c.types");

    enum string namespace = _ctypes._gidGirNamespace;
    enum string nsVersion = _ctypes._gidGirVersion;
    enum string name = _udas[0].name;
    enum string fullName = namespace ~ "." ~ name;
    enum string typeStruct = _udas[0].typeStruct;

    static if (__traits(compiles, _ctypes._gidGirCIncludes))
      enum string[] cIncludes = _ctypes._gidGirCIncludes;
    else
      enum string[] cIncludes = null;
  }
  }
}

/**
 * Check a GObject namespace name (see GObjectNamespace): non-empty, starts with an ASCII letter, followed by ASCII
 * letters and digits (it prefixes GType names and is a GIR namespace).
 * Params:
 *   ns = The namespace
 * Returns: true if valid
 */
static bool _isValidNamespace(string ns) pure nothrow
{
  if (ns.length == 0 || !((ns[0] >= 'A' && ns[0] <= 'Z') || (ns[0] >= 'a' && ns[0] <= 'z')))
    return false;

  foreach (char c; ns)
    if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')))
      return false;

  return true;
}

/// The string options of GObjectNamespace (see _dNamespaceStrings)
struct _DNamespaceStrings
{
  string prefix; /// C symbol prefix, or null
  string nsVersion; /// GIR version, or null
  string error; /// Problem, or null
}

/**
 * Sort the string options of GObjectNamespace: a string starting with a digit is the GIR version (digits separated by
 * dots, "1.0"), another one the C symbol prefix. null is the default symbol prefix.
 */
static _DNamespaceStrings _dNamespaceStrings(string[] strings) pure nothrow
{
  _DNamespaceStrings r;
  bool hasPrefix, hasVersion;

  foreach (s; strings)
  {
    if (s.length > 0 && s[0] >= '0' && s[0] <= '9')
    {
      if (hasVersion)
        r.error = "GObjectNamespace: more than one GIR version";
      else if (!_isValidGirVersion(s))
        r.error = "GObjectNamespace: invalid GIR version \"" ~ s ~ "\" (use digits separated by dots, such as \"1.0\")";

      hasVersion = true;
      r.nsVersion = s;
    }
    else
    {
      if (hasPrefix)
        r.error = "GObjectNamespace: more than one C symbol prefix (a GIR version starts with a digit)";
      else if (s.length > 0 && !_isValidSymbolPrefix(s))
        r.error = "GObjectNamespace: invalid C symbol prefix \"" ~ s ~ "\"";

      hasPrefix = true;
      r.prefix = s;
    }
  }

  return r;
}

/**
 * Check a GIR namespace version: digits separated by single dots ("1.0", "2").
 */
static bool _isValidGirVersion(string v) pure nothrow
{
  if (v.length == 0 || v[0] == '.' || v[$ - 1] == '.')
    return false;

  foreach (i, char c; v)
    if (!((c >= '0' && c <= '9') || (c == '.' && v[i - 1] != '.')))
      return false;

  return true;
}

/**
 * Check a C symbol prefix (see GObjectNamespace): non-empty, starts with a letter or '_', followed by letters,
 * digits and '_'.
 * Params:
 *   prefix = The symbol prefix
 * Returns: true if valid
 */
static bool _isValidSymbolPrefix(string prefix) pure nothrow
{
  if (prefix.length == 0 || (prefix[0] >= '0' && prefix[0] <= '9'))
    return false;

  foreach (char c; prefix)
    if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_'))
      return false;

  return true;
}

/**
 * GObject property name of a D member: the explicit name, or the D name in kebab-case.
 */
static string _dPropertyName(string dName, string explicit = null) pure nothrow
{
  if (explicit.length > 0)
    return explicit;

  auto s = _snakeCaseName(dName);
  string result;

  foreach (char c; s)
    result ~= c == '_' ? '-' : c;

  return result;
}

/**
 * Register the GType of a D subclass (see GObjectSubclass), thread safe and only once.
 * Params:
 *   T = The D class
 *   gtype = Storage for the registered GType
 *   name = GType name to register (must be unique; registration fails if it is already used)
 * Returns: The GType or 0 on error
 */
static GType _registerDSubclass(T)(ref GType gtype, string name) nothrow
{
  import gid.gobject2.c.functions : g_type_from_name, g_type_query, g_type_register_static_simple;
  import gid.gobject2.c.types : GClassInitFunc, GInstanceInitFunc, GTypeFlags, GTypeQuery;
  import std.string : toStringz;
  import std.traits : BaseClassesTuple, InterfacesTuple, fullyQualifiedName;

  if (auto t = atomicLoad(*cast(shared GType*)&gtype))
    return t;

  static __gshared bool failed; // Name collision: stay at 0, log the critical only once

  if (atomicLoad(*cast(shared bool*)&failed))
    return 0;

  static extern(C) void classInit(void* klass, void* classData) nothrow
  {
    imported!"gid.core.utils".gidAttachThread(); // Class initialization can happen on a thread created by C
    T._installVfuncs!T(klass); // Compile error if T overrides a vfunc method without a trampoline
    _installDProperties!T(klass); // @gProperty members of T
    _installDSignals!T(klass); // @gSignal methods of T
    _installDVfuncs!T(klass); // @gVirtual methods of T
  }

  synchronized
  {
    if (gtype)
      return gtype;

    if (failed)
      return 0;

    auto parent = BaseClassesTuple!T[0]._getGType(); // Nearest bound class or D subclass GType

    if (!parent)
      return 0;

    if (g_type_from_name(name.toStringz))
    {
      enum fqn = fullyQualifiedName!T;
      g_log("Gid", GLogLevelFlags.LevelCritical, "Can't register GType %s for %s: name already used, pass a"
        ~ " different typeName to GObjectSubclass (or name or ns to GObjectExport), or rename the class",
        name.toStringz, fqn.ptr);
      atomicStore(*cast(shared bool*)&failed, true);
      return 0;
    }

    GTypeQuery query;
    g_type_query(parent, &query);

    // The slots of the @gVirtual methods follow the class struct of the parent
    auto t = g_type_register_static_simple(parent, name.toStringz, _dVfuncClassSize!T(query.classSize),
      cast(GClassInitFunc)&classInit, query.instanceSize, cast(GInstanceInitFunc)&imported!"gid.gobject2.object".ObjectWrap._dSubclassInstanceInit!T,
      cast(GTypeFlags)0);

    if (t)
    {
      imported!"gid.gobject2.object".ObjectWrap._setDSubclassGType(t, typeid(T));

      static foreach (I; InterfacesTuple!T) // Add interfaces, before the class is initialized
        _addDSubclassIface!(T, I)(t, parent);

      atomicStore(*cast(shared GType*)&gtype, t);
    }
  }

  return gtype;
}

/**
 * Add a GObject interface implemented by a D class to its GType (see _registerDSubclass), if the D class overrides
 * (or implements) a vfunc method of the interface, or if the parent GType does not implement the interface. Its
 * D base interfaces (GObject interface prerequisites) are added first. The interface_init installs the trampolines
 * of the overridden vfunc methods (`_installIfaceVfuncs_<iface>`, see the interface mixin template), after GObject
 * has copied the interface structure of the parent type if the parent implements the interface (other slots keep
 * the parent's implementations), or initialized it with the interface defaults otherwise.
 * Params:
 *   T = The D class
 *   I = A D interface implemented by T
 *   gtype = The GType registered for T
 *   parent = The parent GType
 */
private static void _addDSubclassIface(T, I)(GType gtype, GType parent) nothrow
{
  import gid.gobject2.c.functions : g_type_add_interface_static, g_type_is_a;
  import gid.gobject2.c.types : GInterfaceInfo, GInterfaceInitFunc;
  import std.traits : fullyQualifiedName, InterfacesTuple;

  static if (_isDInterface!I)
    _addDInterface!(T, I)(gtype, parent);
  else static if (__traits(compiles, I._getGType()) && is(I : imported!"gid.core.wrap".GidWrap))
  {
    static foreach (J; InterfacesTuple!I)
      _addDSubclassIface!(T, J)(gtype, parent);

    enum suffix = () {
      string name;
      foreach (char c; fullyQualifiedName!I)
        name ~= c == '.' ? '_' : c;
      return name;
    }();

    static if (__traits(hasMember, T, "_ifaceVfuncsOverridden_" ~ suffix))
    {
      alias overriddenT = __traits(getMember, T, "_ifaceVfuncsOverridden_" ~ suffix);
      enum overridden = overriddenT!T;

      static extern(C) void ifaceInit(void* iface, void* data) nothrow
      {
        imported!"gid.core.utils".gidAttachThread();
        alias install = __traits(getMember, T, "_installIfaceVfuncs_" ~ suffix);
        install!T(iface);
      }

      __gshared GInterfaceInfo info = GInterfaceInfo(cast(GInterfaceInitFunc)&ifaceInit, null, null);
    }
    else
    {
      enum overridden = false;
      __gshared GInterfaceInfo info;
    }

    __gshared bool done; // Interfaces are reached more than once (prerequisites), T is registered only once

    if (done)
      return;

    done = true;
    auto ifaceType = I._getGType;

    if (ifaceType && (overridden || !g_type_is_a(parent, ifaceType)))
      g_type_add_interface_static(gtype, ifaceType, &info);
  }
}
