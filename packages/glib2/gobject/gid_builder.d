/// Module for [GidBuilder] class
module gobject.gid_builder;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;


import std.typecons : Yes;
import gobject.object;
import gobject.value;

/// giD GObject builder base class
/** */
abstract class GidBuilder(T)
{
  protected T _self() nothrow
  {
    return cast(T)this;
  }

  /**
  * Set a property.
  * Params:
  *   name = The property name
  *   val = The D type value to assign to the property
  */
  T setProperty(V)(immutable(char)* name, V val) nothrow
  {
    _propNames ~= name;
    _propSetters ~= (GValue* gval) nothrow { setVal(gval, val); }; // GValue initialized from the property's GType in createGObject
    return _self;
  }

  /**
  * Build the object.
  * Returns: New D wrapped ObjectWrap
  */
  GObject* createGObject(GType gtype) nothrow
  {
    auto typeClass = g_type_class_ref(gtype);
    scope(exit) g_type_class_unref(typeClass);
    auto klass = cast(GObjectClass*)typeClass;
    immutable(char)*[] names;
    GValue[] values;

    foreach (i, name; _propNames)
    {
      auto pspec = g_object_class_find_property(klass, name);
      if (!pspec) // Unknown property, g_object_new_with_properties would just warn and ignore it too
        continue;

      names ~= name;
      values ~= GValue();
      g_value_init(&values[$ - 1], pspec.valueType);
      _propSetters[i](&values[$ - 1]);
    }

    auto obj = g_object_new_with_properties(gtype, cast(uint)names.length, names.ptr, values.ptr);

    foreach (ref val; values)
      g_value_unset(&val);

    if (g_object_is_floating(obj))
      g_object_ref_sink(obj); // Convert floating ref to a strong owned ref (no count change)

    return obj;
  }

  private:
  immutable(char)*[] _propNames;
  void delegate(GValue*) nothrow[] _propSetters;
}
