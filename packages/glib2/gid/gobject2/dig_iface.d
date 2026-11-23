/// Module for [DigIface] class
module gid.gobject2.dig_iface;

public import gid.core.basictypes;

/**
* `GObjectInterface` and the helpers that register a D interface as a GObject interface type.
*/
import core.atomic;
import std.meta : AliasSeq;
import std.traits : InterfacesTuple;
import std.typecons : Flag;

import gid.glib2.c.functions;
import gid.glib2.c.types : GLogLevelFlags;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;

/**
* Registers a D interface as a GObject interface type, so that D classes, C code, and other language bindings can
* implement it.
*
* Mark the methods of the interface with `@gVirtual`. Each one is named `vfunc` followed by a name that starts in
* upper case, for example `vfuncArea`, and the interface gets a public method with the short name (`area`) that calls
* the implementation of the object, whether it is written in D or in another language. A D class implements the
* interface by listing it as a base and implementing the `vfunc` methods. The class needs `mixin GObjectSubclass`
* (or `GObjectExport`).
*
* ---
* interface Shape
* {
*   mixin GObjectInterface!"MyShape";
*
*   @gVirtual double vfuncArea();
* }
*
* class Square : ObjectWrap, Shape
* {
*   mixin GObjectSubclass;
*
*   double side = 2;
*
*   override double vfuncArea() { return side * side; }
* }
*
* Shape s = new Square;
* double a = s.area();
* ---
*
* Params:
*   typeName = GType name of the interface (defaults to "D" followed by the fully qualified D name with '.' replaced
*     by '_')
*
* The interface struct is a `GTypeInterface` followed by one function pointer per method, in the order of
* declaration, with the same types as for `@gVirtual` methods of classes. Objects implementing the interface are
* GObjects (prerequisite `GObject`). A D-defined interface can extend other D-defined interfaces, which become its
* prerequisites. A GObject which implements the interface in another language is wrapped as the D interface, and its
* methods call that implementation.
*/
mixin template GObjectInterface(string typeName = null)
{
  static assert(is(typeof(this) == interface), "GObjectInterface can only be used in interfaces");

  /// The D interface declaring this mixin
  alias _gidDInterfaceOf = typeof(this);

  /// The GType of the interface, registered on first use
  static imported!"gid.gobject2.types".GType _getGType() nothrow
  {
    enum name = typeName.length > 0 ? typeName : imported!"gid.gobject2.dig"._dSubclassTypeName!(typeof(this));
    return imported!"gid.gobject2.dig_iface"._registerDInterface!(typeof(this))(name);
  }

  static foreach (_gidVfuncMem; __traits(derivedMembers, typeof(this)))
  {
    static assert(!imported!"gid.gobject2.dig_signal"._isDSignalMember!(typeof(this), _gidVfuncMem),
    "@gSignal is not supported in interfaces");

    static if (imported!"gid.gobject2.dig_vfunc"._isDVirtualMember!(typeof(this), _gidVfuncMem))
      mixin imported!"gid.gobject2.dig_iface"._GObjectIfaceVfuncMembers!(typeof(this), _gidVfuncMem);
  }
}

/**
* Adds the invoker `foo` for the `@gVirtual` method `vfuncFoo` of a D interface (see GObjectInterface).
*/
mixin template _GObjectIfaceVfuncMembers(I, string mem)
{
  mixin("final imported!\"gid.gobject2.dig_vfunc\"._dVfuncReturn!(I, mem) "
  ~ imported!"gid.gobject2.dig_vfunc"._dVfuncInvokerName(mem)
  ~ "(imported!\"gid.gobject2.dig_vfunc\"._dVfuncParams!(I, mem) args) { return"
  ~ " imported!\"gid.gobject2.dig_vfunc\"._dVfuncInvoke!(I, mem)(this, args); }");
}

/**
* True if I is a D interface registered with GObjectInterface
*/
enum bool _isDInterface(I) = is(I == interface) && is(I._gidDInterfaceOf == I);

// Registered GType of a D interface
private template _dIfaceGType(I)
{
  static __gshared GType _dIfaceGType;
}

/**
* Register the GType of a D interface (see GObjectInterface). Returns the GType, or 0 if the name is already used.
*/
static GType _registerDInterface(I)(string name) nothrow
{
  import std.string : toStringz;
  import std.traits : fullyQualifiedName;

  static foreach (J; InterfacesTuple!I)
  static assert(_isDInterface!J, "Interface " ~ fullyQualifiedName!I ~ " can only extend interfaces declared with"
  ~ " GObjectInterface, not " ~ fullyQualifiedName!J);

  if (auto t = atomicLoad(*cast(shared GType*)&_dIfaceGType!I))
    return t;

  static __gshared bool failed;

  if (atomicLoad(*cast(shared bool*)&failed))
    return 0;

  synchronized
  {
    if (_dIfaceGType!I)
      return _dIfaceGType!I;

    if (g_type_from_name(name.toStringz))
    {
      enum fqn = fullyQualifiedName!I;
      g_log("Gid", GLogLevelFlags.LevelCritical, "Can't register GType %s for %s: name already used, pass a"
      ~ " different typeName to GObjectInterface", name.toStringz, fqn.ptr);
      atomicStore(*cast(shared bool*)&failed, true);
      return 0;
    }

    auto size = imported!"gid.gobject2.dig_vfunc"._dVfuncClassSize!I(cast(uint)GTypeInterface.sizeof);
    auto t = g_type_register_static_simple(imported!"gid.gobject2.types".GTypeEnum.Interface, name.toStringz, size, null, 0,
    null, cast(GTypeFlags)0);

    if (t)
    {
      g_type_interface_add_prerequisite(t, imported!"gid.gobject2.types".GTypeEnum.Object);

      static foreach (J; InterfacesTuple!I)
      g_type_interface_add_prerequisite(t, J._getGType());

      atomicStore(*cast(shared GType*)&_dIfaceGType!I, t);
    }

    return t;
  }
}

/**
* Add the D interface I to the GType of the D class T, installing trampolines that call the methods of the D object.
* Base interfaces are added first. Nothing is done if the parent type already implements I, since its trampolines
* call the D methods (virtual calls), which T overrides.
*/
package static void _addDInterface(T, I)(GType gtype, GType parent) nothrow
{
  import gid.gobject2.c.types : GInterfaceInfo, GInterfaceInitFunc;

  static foreach (J; InterfacesTuple!I)
  _addDInterface!(T, J)(gtype, parent);

  static extern(C) void ifaceInit(void* iface, void* data) nothrow
  {
    imported!"gid.core.utils".gidAttachThread();
    imported!"gid.gobject2.dig_vfunc"._installDVfuncs!I(iface);
  }

  __gshared GInterfaceInfo info = GInterfaceInfo(cast(GInterfaceInitFunc)&ifaceInit, null, null);
  __gshared bool done; // Interfaces are reached more than once (bases), T is registered only once

  if (done)
    return;

  done = true;
  auto ifaceType = I._getGType;

  if (ifaceType && !g_type_is_a(parent, ifaceType))
    g_type_add_interface_static(gtype, ifaceType, &info);
}

/**
* D object for a GObject which implements a D interface without a D class (implemented in another language). Its
* methods call the implementation through the interface struct.
*/
final class _DIfaceProxy(I) : imported!"gid.gobject2.object".IfaceProxy, I
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(I);
  }

  static foreach (J; AliasSeq!(I, InterfacesTuple!I))
  {
    static foreach (mem; imported!"gid.gobject2.dig_vfunc"._dVfuncMembers!J)
    {
      mixin("imported!\"gid.gobject2.dig_vfunc\"._dVfuncReturn!(J, mem) " ~ mem
      ~ "(imported!\"gid.gobject2.dig_vfunc\"._dVfuncParams!(J, mem) args) { return"
      ~ " imported!\"gid.gobject2.dig_vfunc\"._dVfuncInvoke!(J, mem)(this, args); }");
    }
  }
}
