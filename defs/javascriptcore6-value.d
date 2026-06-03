//!class Value pre

import core.memory : GC;
import std.exception : enforce;
import std.traits : isNumeric;
import gobject.types : GTypeEnum;
import glib.c.functions : g_strfreev;
import gobject.c.functions : g_object_ref, g_object_unref;

class Value : gobject.object.ObjectWrap
{
  /**
  * Create a function in context which calls a D callback.
  * Params:
  *   context = The context
  *   name = The name of the function or null for an anonymous function
  *   callback = The callback
  * Returns: New function Value
  */
  static Value newFunction(T)(Context context, string name, T callback) nothrow
  {
    extern(C) JSCValue* _ccallback(GPtrArray* args, void* userData) nothrow
    {
      auto _cb = cast(T*)userData;
      auto ctx = jsc_context_get_current();
      alias Params = Parameters!T;
      Params dParams;

      try
      {
        foreach (i, P; Params)
        {
          if (i < args.len)
          {
            dParams[i] = getJsVal!P(cast(JSCValue*)args.pdata[i]);
          }
        }

        static if (!is(ReturnType!T == void))
        {
          auto retval = (*_cb)(dParams);
          return createJsVal(ctx, retval);
        }
        else
        {
          (*_cb)(dParams);
          return jsc_value_new_undefined(ctx);
        }
      }
      catch (Exception e)
      {
        jsc_context_throw(ctx, e.msg.toCString);
        return jsc_value_new_undefined(ctx);
      }
    }

    JSCValue* funcVal = jsc_value_new_function_variadic(cast(JSCContext*)context._cPtr, name.toCString,
      cast(GCallback)&_ccallback, freezeDelegate(cast(void*)&callback), &thawDelegate, _getGType);

    return new Value(cast(void*)funcVal, Yes.Take);
  }

  /**
  * Get the D value from a Value.
  * Params:
  *   T = The D type
  * Returns: The value as a native D type
  */
  T get(T)() nothrow
  {
    return getJsVal!T(cast(JSCValue*)_cInstancePtr);
  }

  /**
  * Create a new Value from a native D value.
  * Params:
  *   T = The type of the value
  *   ctx = The Context object
  *   val = The D value to create the Value from
  * Returns: The new Value
  */
  static Value from(T)(Context ctx, T val) nothrow
  {
    return new Value (createJsVal!T(cast(JSCContext*)ctx._cPtr, val), Yes.Take);
  }
}

/**
* Template to get a value from a JSCValue of a given D type (must contain the correct type)
* Params:
*   T = D type which the C GValue structure contains
*   jsval = C JSCValue structure pointer
* Returns: The value of type `T`
*/
static T getJsVal(T)(JSCValue* jsval) nothrow
{
  static if (is(T == bool))
    return cast(bool)jsc_value_to_boolean(jsval);
  else static if (is(T == int))
    return jsc_value_to_int32(jsval);
  else static if (is(T == double))
    return jsc_value_to_double(jsval);
  else static if (is(T == string))
    return jsc_value_to_string(jsval).fromCString!(Yes.Free);
  else static if (is(T == Value))
    return gobject.object.ObjectWrap._getDObject!Value(jsval, No.Take);
  else static if (is(T == U[], U))
  {
    enforce(jsc_value_is_array(jsval), "JSCValue is not a JavaScript array");

    auto lenVal = jsc_value_object_get_property(jsval, "length");
    scope(exit) if (lenVal) g_object_unref(cast(GObject*)lenVal);
    auto len = cast(size_t)jsc_value_to_double(lenVal);

    U[] array;
    array.length = len;

    foreach (i; 0 .. len)
    {
      auto v = jsc_value_object_get_property_at_index(jsval, cast(uint)i);
      scope(exit) if (v) g_object_unref(cast(GObject*)v);
      array[i] = getJsVal!U(v);
    }

    return array;
  }
  else static if (is(T == U[string], U))
  {
    enforce(jsc_value_is_object(jsval), "JSCValue is not a JavaScript object");

    U[string] obj;

    char** propNames = jsc_value_object_enumerate_properties(jsval);
    if (!propNames)
      return obj;

    scope(exit) g_strfreev(propNames);

    for (size_t i = 0; propNames[i]; i++)
    {
      auto v = jsc_value_object_get_property(jsval, propNames[i]);
      scope(exit) if (v) g_object_unref(cast(GObject*)v);
      obj[propNames[i].fromCString] = getJsVal!U(v); // Free the individual strings
    }

    return obj;
  }
  else
    static assert(0, "Unsupported type " ~ T.stringof ~ " in javascriptcore.Value.getJsVal");
}

/**
* Template to create a JSCValue from a given D value
* Params:
*   T = D type to create the C JSCValue from
*   ctx = The JSCContext to create the value in
*   val = The value to create the JSCValue from
* Returns: The new JSCValue which the caller owns
*/
static JSCValue* createJsVal(T)(JSCContext* ctx, T val) nothrow
{
  static if (is(T == bool))
    return jsc_value_new_boolean(ctx, cast(gboolean)val);
  else static if (isNumeric!T)
    return jsc_value_new_number(ctx, val);
  else static if (is(T == string))
    return jsc_value_new_string(ctx, val.toCString);
  else static if (is(T == Value))
    return cast(JSCValue*)g_object_ref(cast(GObject*)val._cPtr);
  else static if (is(T == U[], U))
  {
    JSCValue* array = jsc_value_new_array(ctx, GTypeEnum.None);

    foreach (i, item; val)
    {
      auto itemVal = createJsVal(ctx, item);
      scope(exit) if (itemVal) g_object_unref(cast(GObject*)itemVal);
      jsc_value_object_set_property_at_index(array, cast(uint)i, itemVal);
    }

    return array;
  }
  else static if (is(T == U[string], U))
  {
    JSCValue* obj = jsc_value_new_object(ctx, null, null);

    foreach (k, v; val)
    {
      auto itemVal = createJsVal(ctx, v);
      scope(exit) if (itemVal) g_object_unref(cast(GObject*)itemVal);
      jsc_value_object_set_property(obj, k.toCString, itemVal);
    }

    return obj;
  }
  else
    static assert(0, "Unsupported type " ~ T.stringof ~ " in javascriptcore.Value.createJsVal");
}

/**
 * Check if a D type is a valid JS Value type (a value of the type can be created with createJsVal)
 * Params:
 *   T = The D type
 * Returns: true if createJsVal is supported for the type, false otherwise
 */
bool isValidJsVal(T)() nothrow
{
  return is(T == bool) || isNumeric!T || is(T == string) || is(T == Value) || is(T == U[], U) || is(T == U[string], U);
}
