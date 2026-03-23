//!class GidBuilder pre
//!kind GidBuilder Wrap
//!inhibit init funcs

import std.typecons : Yes;
import gobject.object;
import gobject.value;

/// giD GObject builder base class
abstract class GidBuilder(T)
{
  ~this()
  {
    foreach (ref val; _propValues)
      g_value_unset(&val);
  }

  protected T _self()
  {
    return cast(T)this;
  }

  /**
   * Set a property.
   * Params:
   *   name = The property name
   *   val = The D type value to assign to the property
   */
  T setProperty(V)(immutable(char)* name, V val)
  {
    _propNames ~= name;
    _propValues ~= GValue();
    initVal!V(&_propValues[$ - 1]);
    setVal(&_propValues[$ - 1], val);
    return _self;
  }

  /**
   * Build the object.
   * Returns: New D wrapped ObjectWrap
   */
  GObject* createGObject(GType gtype)
  {
    return g_object_new_with_properties(gtype, cast(uint)_propNames.length, _propNames.ptr, _propValues.ptr);
  }

private:
  immutable(char)*[] _propNames;
  GValue[] _propValues;
}
