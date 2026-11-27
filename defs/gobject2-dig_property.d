//!class DigProperty pre
//!kind DigProperty Namespace
//!inhibit init funcs imports

/**
 * `@gProperty` and the helpers that install GObject properties on a D class (see GObjectSubclass).
 */
import std.traits : Parameters, ReturnType, hasUDA;

import gid.glib2.c.functions;
import gid.glib2.c.types : GLogLevelFlags;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;

/**
 * Declares a GObject property on a field or a getter/setter of a class that uses GObjectSubclass or GObjectExport.
 *
 * Use `@gProperty` on a field (the field initializer is the default value) or on a getter and/or setter of the same
 * name. The GObject name is the D name written in kebab-case (`myValue` becomes `my-value`), unless you pass a name.
 * Pass `ParamFlags` for construct or construct-only. For a combination of name, flags, and a GType name (needed for
 * some enums and flags), use `@(gProperty.create(...))`.
 *
 * A set notifies only when the value changes. Add `@gNotifyAlways` (or `notifyAlways: true` in `create`) to notify on
 * every set, as GObject does by default. Pass `ParamFlags.ExplicitNotify` to handle notify yourself with `notify()`.
 *
 * Params:
 *   name = GObject property name, or null to derive one from the D name
 *   nick = Short display name, or null to use the property name
 *   blurb = Description, or null
 *   flags = Property flags (`ParamFlags.Readable`, `Writable`, `Construct`, `ConstructOnly`, `ExplicitNotify`,
 *     ...), or 0 to derive readable/writable from the member
 *   typeName = GType name for enum and flags properties that do not provide `_getGType`, or null
 *   notifyAlways = If true, notify on every set (same as `@gNotifyAlways`)
 *
 * Example:
 * ---
 * class Foo : ObjectWrap
 * {
 *   mixin GObjectSubclass;
 *
 *   @gProperty int count = 1;
 *   @gProperty("full-name") string name;
 *   @gProperty @gNotifyAlways int ticks;
 *   @gProperty(ParamFlags.ExplicitNotify) int quiet;
 *
 *   private int _level;
 *   @gProperty @property int level() { return _level; }
 *   @property int level(int v) { _level = v; return v; }
 * }
 * ---
 */
struct gProperty
{
  string name; /// GObject property name, or null to derive one from the D name
  string nick; /// Short display name, or null to use the property name
  string blurb; /// Description, or null
  GParamFlags flags = cast(GParamFlags)0; /// Flags, or 0 to derive readable/writable from the member
  string typeName; /// GType name for enum and flags types without `_getGType`
  bool notifyAlways; /// If true, notify on every set (same as `@gNotifyAlways`)

  this(string name, string nick = null, string blurb = null)
  {
    this.name = name;
    this.nick = nick;
    this.blurb = blurb;
  }

  this(GParamFlags flags)
  {
    this.flags = flags;
  }

  /// Build a property UDA with any combination of fields (for typeName, flags, name, and notifyAlways together).
  static gProperty create(string name = null, string nick = null, string blurb = null,
    GParamFlags flags = cast(GParamFlags)0, string typeName = null,
    bool notifyAlways = false)
  {
    gProperty p;
    p.name = name;
    p.nick = nick;
    p.blurb = blurb;
    p.flags = flags;
    p.typeName = typeName;
    p.notifyAlways = notifyAlways;
    return p;
  }
}

/**
 * Notify on every set of a `@gProperty` member, including when the value does not change (GObject's default).
 */
struct gNotifyAlways {}


// True if alias member is marked @gProperty or @gProperty(...)
private template _hasGPropertyUDA(alias member)
{
  enum _hasGPropertyUDA = hasUDA!(member, gProperty);
}

// @gProperty value of a member (init if the attribute has no arguments)
private static gProperty _gPropertyOf(alias member)() pure nothrow
{
  static foreach (attr; __traits(getAttributes, member))
  {
    static if (is(typeof(attr) == gProperty))
      return attr;
    else static if (is(attr == gProperty))
      return gProperty.init;
  }

  return gProperty.init;
}

// True if T declares a @gProperty field or function named mem, or D @property accessors exported by
// GidExport.Properties
package template _isDPropertyMember(T, string mem)
{
  static if (mem == "this" || mem.length == 0)
    enum _isDPropertyMember = false;
  else static if (_isDExplicitPropertyMember!(T, mem))
    enum _isDPropertyMember = true;
  else
    enum _isDPropertyMember = imported!"gid.gobject2.dig_method"._dIsAutoPropertyMember!(T, mem);
}

// True if T declares a @gProperty field or function named mem
private template _isDExplicitPropertyMember(T, string mem)
{
  static if (mem == "this" || mem.length == 0)
    enum _isDExplicitPropertyMember = false;
  else static if (__traits(compiles, __traits(getOverloads, T, mem, true))
      && __traits(getOverloads, T, mem, true).length > 0)
    enum _isDExplicitPropertyMember = _dOverloadHasPropertyUDA!(T, __traits(getOverloads, T, mem, true));
  else static if (__traits(compiles, __traits(getMember, T, mem))
      && __traits(compiles, __traits(parent, __traits(getMember, T, mem)))
      && __traits(isSame, __traits(parent, __traits(getMember, T, mem)), T)
      && _hasGPropertyUDA!(__traits(getMember, T, mem)))
    enum _isDExplicitPropertyMember = true;
  else
    enum _isDExplicitPropertyMember = false;
}

// Combined @gProperty of a member (first annotated overload or the field)
package static gProperty _dPropertyUDA(T, string mem)() pure nothrow
{
  static if (__traits(compiles, __traits(getOverloads, T, mem, true))
      && __traits(getOverloads, T, mem, true).length > 0)
  {
    static foreach (fn; __traits(getOverloads, T, mem, true))
    {
      static if (__traits(isSame, __traits(parent, fn), T) && _hasGPropertyUDA!fn)
        return _gPropertyOf!fn;
    }
  }
  else
    return _gPropertyOf!(__traits(getMember, T, mem));

  return gProperty.init;
}

// Field, readable property, or writable property
private template _dPropertyIsField(T, string mem)
{
  static if (__traits(compiles, __traits(getOverloads, T, mem, true))
      && __traits(getOverloads, T, mem, true).length > 0)
    enum _dPropertyIsField = false;
  else
    enum _dPropertyIsField = true;
}

// True if fn is a zero-arg getter declared on T (including @property)
private template _dOverloadHasPropertyUDA(T, fns...)
{
  static if (fns.length == 0)
    enum _dOverloadHasPropertyUDA = false;
  else static if (__traits(isSame, __traits(parent, fns[0]), T) && _hasGPropertyUDA!(fns[0]))
    enum _dOverloadHasPropertyUDA = true;
  else
    enum _dOverloadHasPropertyUDA = _dOverloadHasPropertyUDA!(T, fns[1 .. $]);
}

private template _dOverloadHasGetter(T, fns...)
{
  static if (fns.length == 0)
    enum _dOverloadHasGetter = false;
  else static if (_dIsPropertyGetter!(T, fns[0]))
    enum _dOverloadHasGetter = true;
  else
    enum _dOverloadHasGetter = _dOverloadHasGetter!(T, fns[1 .. $]);
}

private template _dOverloadHasSetter(T, fns...)
{
  static if (fns.length == 0)
    enum _dOverloadHasSetter = false;
  else static if (_dIsPropertySetter!(T, fns[0]))
    enum _dOverloadHasSetter = true;
  else
    enum _dOverloadHasSetter = _dOverloadHasSetter!(T, fns[1 .. $]);
}

private template _dIsPropertyGetter(T, alias fn)
{
  enum _dIsPropertyGetter = __traits(isSame, __traits(parent, fn), T)
    && __traits(compiles, Parameters!fn) && Parameters!fn.length == 0
    && __traits(compiles, ReturnType!fn) && !is(ReturnType!fn == void);
}

// True if fn is a one-arg setter declared on T (including @property)
private template _dIsPropertySetter(T, alias fn)
{
  enum _dIsPropertySetter = __traits(isSame, __traits(parent, fn), T)
    && __traits(compiles, Parameters!fn) && Parameters!fn.length == 1;
}

private template _dPropertyCanGet(T, string mem)
{
  static if (_dPropertyIsField!(T, mem))
    enum _dPropertyCanGet = true;
  else
    enum _dPropertyCanGet = _dOverloadHasGetter!(T, __traits(getOverloads, T, mem, true));
}

private template _dPropertyCanSet(T, string mem)
{
  static if (_dPropertyIsField!(T, mem))
    enum _dPropertyCanSet = true;
  else
    enum _dPropertyCanSet = _dOverloadHasSetter!(T, __traits(getOverloads, T, mem, true));
}

// First matching getter or setter type among overloads (void if none)
private template _dFirstPropType(string kind, T, fns...)
{
  static if (fns.length == 0)
    alias _dFirstPropType = void;
  else static if (kind == "get" && _dIsPropertyGetter!(T, fns[0]))
    alias _dFirstPropType = ReturnType!(fns[0]);
  else static if (kind == "set" && _dIsPropertySetter!(T, fns[0]))
    alias _dFirstPropType = Parameters!(fns[0])[0];
  else
    alias _dFirstPropType = _dFirstPropType!(kind, T, fns[1 .. $]);
}

private template _dPropertyGetterType(T, string mem)
{
  alias _dPropertyGetterType = _dFirstPropType!("get", T, __traits(getOverloads, T, mem, true));
}

private template _dPropertySetterType(T, string mem)
{
  alias _dPropertySetterType = _dFirstPropType!("set", T, __traits(getOverloads, T, mem, true));
}

package template _dPropertyType(T, string mem)
{
  static if (_dPropertyIsField!(T, mem))
    alias _dPropertyType = typeof(__traits(getMember, T, mem));
  else static if (!is(_dPropertyGetterType!(T, mem) == void))
    alias _dPropertyType = _dPropertyGetterType!(T, mem);
  else
    alias _dPropertyType = _dPropertySetterType!(T, mem);
}

// True if member is marked @gNotifyAlways or gProperty.notifyAlways
private template _dMemberHasNotifyAlways(alias member)
{
  enum _dMemberHasNotifyAlways = hasUDA!(member, gNotifyAlways)
    || (hasUDA!(member, gProperty) && _gPropertyOf!member.notifyAlways);
}

private template _dOverloadHasNotifyAlways(T, fns...)
{
  static if (fns.length == 0)
    enum _dOverloadHasNotifyAlways = false;
  else static if (__traits(isSame, __traits(parent, fns[0]), T) && _dMemberHasNotifyAlways!(fns[0]))
    enum _dOverloadHasNotifyAlways = true;
  else
    enum _dOverloadHasNotifyAlways = _dOverloadHasNotifyAlways!(T, fns[1 .. $]);
}

private template _dPropertyNotifyAlways(T, string mem)
{
  static if (__traits(compiles, __traits(getOverloads, T, mem, true))
      && __traits(getOverloads, T, mem, true).length > 0)
    enum _dPropertyNotifyAlways = _dOverloadHasNotifyAlways!(T, __traits(getOverloads, T, mem, true));
  else static if (__traits(compiles, __traits(getMember, T, mem)))
    enum _dPropertyNotifyAlways = _dMemberHasNotifyAlways!(__traits(getMember, T, mem));
  else
    enum _dPropertyNotifyAlways = false;
}

// True if the user passed ParamFlags.ExplicitNotify (handle notify themselves)
private template _dPropertyUserExplicitNotify(T, string mem)
{
  import gid.gobject2.types : ParamFlags;

  enum _dPropertyUserExplicitNotify = (_dPropertyUDA!(T, mem).flags & ParamFlags.ExplicitNotify) != 0;
}

// Param flags: derive readable/writable if omitted, ExplicitNotify unless notifyAlways, plus static strings
private static GParamFlags _dPropertyFlags(T, string mem)() pure nothrow
{
  import gid.gobject2.types : ParamFlags;

  auto flags = _dPropertyUDA!(T, mem).flags;

  if ((flags & (ParamFlags.Readable | ParamFlags.Writable)) == 0)
  {
    static if (_dPropertyCanGet!(T, mem))
      flags |= ParamFlags.Readable;
    static if (_dPropertyCanSet!(T, mem))
      flags |= ParamFlags.Writable;
  }

  // Default: on-change notify (EXPLICIT_NOTIFY). notifyAlways leaves it unset so GObject notifies every set.
  // User-specified ExplicitNotify is kept (and wins over notifyAlways).
  static if (!_dPropertyNotifyAlways!(T, mem) || _dPropertyUserExplicitNotify!(T, mem))
    flags |= ParamFlags.ExplicitNotify;

  return flags | ParamFlags.StaticName | ParamFlags.StaticNick | ParamFlags.StaticBlurb;
}

// Compare property values for on-change notify: objects by identity, strings and floats by ==,
// boxed by == when D supports it, otherwise by pointer.
private static bool _dPropertyValuesEqual(PT)(PT a, PT b)
{
  static if (is(PT : imported!"gid.gobject2.object".ObjectWrap) || is(PT == interface))
  {
    if (a is b)
      return true;

    auto ao = cast(imported!"gid.gobject2.object".ObjectWrap)a;
    auto bo = cast(imported!"gid.gobject2.object".ObjectWrap)b;
    return ao !is null && bo !is null && ao._cPtr is bo._cPtr;
  }
  else static if (is(PT == class))
  {
    if (a is b)
      return true;
    if (a is null || b is null)
      return false;

    static if (__traits(compiles, a.equal(b)))
      return a.equal(b);
    else static if (__traits(compiles, a.opEquals(b)))
      return a.opEquals(b);
    else static if (__traits(compiles, a._cPtr) && __traits(compiles, b._cPtr))
      return a._cPtr is b._cPtr;
    else
      return false;
  }
  else static if (__traits(compiles, a == b))
    return a == b;
  else static if (__traits(compiles, a._cPtr) && __traits(compiles, b._cPtr))
    return a._cPtr is b._cPtr;
  else
    return false;
}

// Default value of a field (the initializer), or T.init for a getter/setter
private static _dPropertyType!(T, mem) _dPropertyDefault(T, string mem)()
{
  static if (_dPropertyIsField!(T, mem))
  {
    // T.init is null for classes; copy the field from the class initializer blob
    alias PT = _dPropertyType!(T, mem);
    enum offset = __traits(getMember, T, mem).offsetof;
    auto init = __traits(initSymbol, T);
    PT val;
    (cast(void*)&val)[0 .. PT.sizeof] = init[offset .. offset + PT.sizeof];
    return val;
  }
  else
    return _dPropertyType!(T, mem).init;
}

// GType of an enum/flags/boxed/object property type
private static GType _dPropertyValueGType(T, string mem)()
{
  alias PT = _dPropertyType!(T, mem);
  enum uda = _dPropertyUDA!(T, mem);

  static if (is(PT == bool) || is(PT == byte) || is(PT == ubyte) || is(PT == short) || is(PT == ushort)
      || is(PT == int) || is(PT == uint) || is(PT == long) || is(PT == ulong) || is(PT == float)
      || is(PT == double) || is(PT == string))
    return 0; // Fundamental types use a param spec that sets the GType
  else static if (__traits(compiles, PT._getGType()))
    return PT._getGType;
  else static if (uda.typeName.length > 0)
  {
    import gid.gobject2.c.functions : g_type_from_name;
    import std.string : toStringz;
    return g_type_from_name(uda.typeName.toStringz);
  }
  else static if (is(PT == enum))
  {
    import gid.gobject2.c.functions : g_type_from_name;
    import std.string : toStringz;
    return g_type_from_name(PT.stringof.toStringz);
  }
  else
  {
    static assert(0, "Unsupported @gProperty type " ~ PT.stringof ~ " on " ~ T.stringof ~ "." ~ mem
      ~ (is(PT == enum) ? `, pass typeName to @gProperty or provide ` ~ PT.stringof ~ `._getGType` : ""));
  }
}

private static GParamSpec* _dPropertyCreateSpec(T, string mem)()
{
  import gid.gobject2.c.functions;
  import gid.gobject2.types : ParamFlags;
  import std.string : toStringz;

  alias PT = _dPropertyType!(T, mem);
  enum uda = _dPropertyUDA!(T, mem);
  enum pname = imported!"gid.gobject2.dig"._dPropertyName(mem, uda.name);
  enum pnick = uda.nick.length > 0 ? uda.nick : pname;
  enum pblurb = uda.blurb;
  enum namez = pname ~ "\0";
  enum nickz = pnick ~ "\0";
  enum blurbz = (pblurb.length > 0 ? pblurb : "") ~ "\0";
  auto flags = _dPropertyFlags!(T, mem);
  auto def = _dPropertyDefault!(T, mem);

  static if (is(PT == bool))
    return g_param_spec_boolean(namez.ptr, nickz.ptr, blurbz.ptr, def, flags);
  else static if (is(PT == byte))
    return g_param_spec_char(namez.ptr, nickz.ptr, blurbz.ptr, byte.min, byte.max, def, flags);
  else static if (is(PT == ubyte))
    return g_param_spec_uchar(namez.ptr, nickz.ptr, blurbz.ptr, ubyte.min, ubyte.max, def, flags);
  else static if (is(PT == short) || is(PT == int))
    return g_param_spec_int(namez.ptr, nickz.ptr, blurbz.ptr, int.min, int.max, def, flags);
  else static if (is(PT == ushort) || is(PT == uint))
    return g_param_spec_uint(namez.ptr, nickz.ptr, blurbz.ptr, uint.min, uint.max, def, flags);
  else static if (is(PT == long))
    return g_param_spec_int64(namez.ptr, nickz.ptr, blurbz.ptr, long.min, long.max, def, flags);
  else static if (is(PT == ulong))
    return g_param_spec_uint64(namez.ptr, nickz.ptr, blurbz.ptr, ulong.min, ulong.max, def, flags);
  else static if (is(PT == float))
    return g_param_spec_float(namez.ptr, nickz.ptr, blurbz.ptr, -float.max, float.max, def, flags);
  else static if (is(PT == double))
    return g_param_spec_double(namez.ptr, nickz.ptr, blurbz.ptr, -double.max, double.max, def, flags);
  else static if (is(PT == string))
    return g_param_spec_string(namez.ptr, nickz.ptr, blurbz.ptr, def.toStringz, flags);
  else static if (is(PT == imported!"gid.glib2.variant".Variant))
  {
    import gid.glib2.c.functions : g_variant_type_new;
    import gid.glib2.c.types : GVariantType;
    static __gshared const(GVariantType)* anyType;
    if (!anyType)
      anyType = g_variant_type_new("*");
    return g_param_spec_variant(namez.ptr, nickz.ptr, blurbz.ptr, anyType, null, flags);
  }
  else static if (is(PT : imported!"gid.gobject2.object".ObjectWrap) || is(PT == interface))
  {
    auto gtype = _dPropertyValueGType!(T, mem);
    return gtype ? g_param_spec_object(namez.ptr, nickz.ptr, blurbz.ptr, gtype, flags) : null;
  }
  else static if (is(PT == enum))
  {
    auto gtype = _dPropertyValueGType!(T, mem);
    if (!gtype)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "Can't install property %s.%s: no GType for %s",
        T.stringof.ptr, mem.ptr, PT.stringof.ptr);
      return null;
    }

    if (g_type_is_a(gtype, imported!"gid.gobject2.types".GTypeEnum.Flags))
      return g_param_spec_flags(namez.ptr, nickz.ptr, blurbz.ptr, gtype, def, flags);
    return g_param_spec_enum(namez.ptr, nickz.ptr, blurbz.ptr, gtype, def, flags);
  }
  else static if (is(PT : imported!"gid.gobject2.boxed".Boxed) || __traits(compiles, PT._getGType()))
  {
    auto gtype = _dPropertyValueGType!(T, mem);
    return gtype ? g_param_spec_boxed(namez.ptr, nickz.ptr, blurbz.ptr, gtype, flags) : null;
  }
  else
  {
    static assert(0, "Unsupported @gProperty type " ~ PT.stringof ~ " on " ~ T.stringof ~ "." ~ mem);
  }
}

private static PT _dPropertyRead(T, string mem, PT)(T self)
{
  static if (_dPropertyIsField!(T, mem))
    return __traits(getMember, self, mem);
  else
    return mixin("self." ~ mem);
}

private static void _dPropertyWrite(T, string mem, PT)(T self, PT val)
{
  static if (_dPropertyIsField!(T, mem))
    __traits(getMember, self, mem) = val;
  else
    mixin("self." ~ mem) = val;
}

private static extern(C) void _dPropertyGet(T)(GObject* obj, uint propertyId, GValue* value, GParamSpec* pspec)
  nothrow
{
  import gid.core.utils : gidInvokeCallbackExceptionHandler;
  import gid.gobject2.value : setVal;

  imported!"gid.core.utils".gidAttachThread();

  auto self = cast(T)imported!"gid.gobject2.object".ObjectWrap._vfuncDObject(obj);
  uint id = 1;

  static foreach (mem; __traits(allMembers, T))
  {
    static if (_isDPropertyMember!(T, mem))
    {
      if (propertyId == id)
      {
        if (self)
        {
          static if (_dPropertyCanGet!(T, mem))
          {
            try
            {
              alias PT = _dPropertyType!(T, mem);
              auto cur = _dPropertyRead!(T, mem, PT)(self);
              static if (is(PT == short))
                setVal(value, cast(int)cur);
              else static if (is(PT == ushort))
                setVal(value, cast(uint)cur);
              else
                setVal(value, cur);
            }
            catch (Exception e)
              imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, "get_property " ~ T.stringof ~ "." ~ mem);
          }
        }
        return;
      }

      id++;
    }
  }

  alias ParentGet = extern(C) void function(GObject*, uint, GValue*, GParamSpec*) nothrow;
  if (auto parent = cast(ParentGet)_dPropertyParentGet!T)
    parent(obj, propertyId, value, pspec);
}

private static extern(C) void _dPropertySet(T)(GObject* obj, uint propertyId, const(GValue)* value, GParamSpec* pspec)
  nothrow
{
  import gid.core.utils : gidInvokeCallbackExceptionHandler;
  import gid.gobject2.value : getVal;
  import gid.gobject2.c.functions : g_object_notify_by_pspec;

  imported!"gid.core.utils".gidAttachThread();

  auto self = cast(T)imported!"gid.gobject2.object".ObjectWrap._vfuncDObject(obj);
  uint id = 1;

  static foreach (mem; __traits(allMembers, T))
  {
    static if (_isDPropertyMember!(T, mem))
    {
      if (propertyId == id)
      {
        static if (_dPropertyCanSet!(T, mem))
        {
          if (self)
          {
            try
            {
              alias PT = _dPropertyType!(T, mem);
              PT neu;
              static if (is(PT == short))
                neu = cast(short)getVal!int(value);
              else static if (is(PT == ushort))
                neu = cast(ushort)getVal!uint(value);
              else
                neu = getVal!PT(value);

              static if (_dPropertyCanGet!(T, mem))
                auto old = _dPropertyRead!(T, mem, PT)(self);

              _dPropertyWrite!(T, mem, PT)(self, neu);

              static if (_dPropertyUserExplicitNotify!(T, mem))
              {
                // User handles notify with notify()
              }
              else static if (_dPropertyNotifyAlways!(T, mem))
              {
                // No EXPLICIT_NOTIFY: GObject notifies on every set
              }
              else
              {
                static if (_dPropertyCanGet!(T, mem))
                {
                  if (!_dPropertyValuesEqual!PT(old, neu))
                    g_object_notify_by_pspec(obj, pspec);
                }
                else
                  g_object_notify_by_pspec(obj, pspec); // Write-only: GObject ignores notify if not readable
              }
            }
            catch (Exception e)
              imported!"gid.core.utils".gidInvokeCallbackExceptionHandler(e, "set_property " ~ T.stringof ~ "." ~ mem);
          }
        }
        return;
      }

      id++;
    }
  }

  alias ParentSet = extern(C) void function(GObject*, uint, const(GValue)*, GParamSpec*) nothrow;
  if (auto parent = cast(ParentSet)_dPropertyParentSet!T)
    parent(obj, propertyId, value, pspec);
}

// Parent get/set_property of T, saved when T's properties are installed
private template _dPropertyParentGet(T)
{
  __gshared extern(C) void function(GObject*, uint, GValue*, GParamSpec*) _dPropertyParentGet;
}

private template _dPropertyParentSet(T)
{
  __gshared extern(C) void function(GObject*, uint, const(GValue)*, GParamSpec*) _dPropertyParentSet;
}

private template _dClassHasProperties(T, members...)
{
  static if (members.length == 0)
    enum _dClassHasProperties = false;
  else static if (is(typeof(members[0]) == string) && _isDPropertyMember!(T, members[0]))
    enum _dClassHasProperties = true;
  else
    enum _dClassHasProperties = _dClassHasProperties!(T, members[1 .. $]);
}

/**
 * Install @gProperty members of T on its GObject class (see GObjectSubclass). No-op if T has none.
 */
package static void _installDProperties(T)(void* klass) nothrow
{
  import gid.gobject2.c.functions : g_object_class_install_property;
  import gid.gobject2.c.types : GObjectClass;

  enum hasProps = _dClassHasProperties!(T, __traits(allMembers, T));

  static if (!hasProps)
    return;
  else
  {
    auto gclass = cast(GObjectClass*)klass;
    _dPropertyParentGet!T = gclass.getProperty;
    _dPropertyParentSet!T = gclass.setProperty;
    gclass.getProperty = &_dPropertyGet!T;
    gclass.setProperty = &_dPropertySet!T;

    uint id = 1;
    static foreach (mem; __traits(allMembers, T))
    {
      static if (_isDPropertyMember!(T, mem))
      {
        {
          auto pspec = _dPropertyCreateSpec!(T, mem);
          if (pspec)
            g_object_class_install_property(gclass, id, pspec);
        }
        id++;
      }
    }
  }
}
