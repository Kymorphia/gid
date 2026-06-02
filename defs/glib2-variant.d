//!class Variant pre

import glib.variant_builder;
import glib.variant_type;

import std.conv : to;
import std.exception : assumeWontThrow;
import std.traits : isSomeString, isTypeTuple;
import std.typecons : Tuple;
import std.variant : StdVariant = Variant;

class Variant
{
  /**
   * Template to create a new Variant from a single D value.
   * Params:
   *   T = The D type to create the variant from
   *   val = The value to assign
   */
  this(T)(T val) nothrow
    if (isTypeTuple!T && !is(T == void*))
  { // Somewhat counter-intuitive.. We don't "own" a reference, it is floating, so pass false to sink it.
    this(cast(void*)createVariant(val), No.Take);
  }

  /**
   * Template to create a new Variant from multiple D values.
   * Params:
   *   T = The D types to create the variant from
   *   vals = The values to assign
   */
  this(T...)(T vals) nothrow
    if (isTypeTuple!T && vals.length > 1 && !is(T[0] == void*))
  {
    this(createVariant!T(vals), No.Take);
  }

  /**
   * Template to create a new tuple Variant from one or more values.
   * Params:
   *   T = The D types to create the tuple variant from
   *   vals = The values to assign
   */
  static Variant newTuple(T...)(T vals) nothrow
    if (isTypeTuple!T)
  {
    return new Variant(createVariantTuple!T(vals), No.Take);
  }

  /** */
  override bool opEquals(Object other) const nothrow
  {
    if (auto otherVariant = cast(Variant)other)
      return (cast(Variant)this).equal(otherVariant);

    return false;
  }

  /** */
  override int opCmp(Object other) const nothrow
  {
    if (auto otherVariant = cast(Variant)other)
      return (cast(Variant)this).compare(otherVariant);

    return 1;
  }

  /** */
  override size_t toHash() const @trusted nothrow
  {
    return cast(size_t)g_variant_hash(cast(GVariant*)this._cInstancePtr);
  }

  /** */
  override string toString() const nothrow
  {
    return (cast(Variant)this).print(true);
  }

  /**
   * Template to get a single value from a Variant
   * Params:
   *   T = The D type of the value to get
   * Returns: The single value of the Variant of type `T`
   */
  T get(T)() nothrow
  {
    return getVal!T(cast(GVariant*)_cInstancePtr);
  }

  /**
   * Template to get multiple values from a container Variant.
   * Params:
   *   T = The D types of the values to get
   * Returns: A tuple containing the values from the Variant of the specified types
   */
  auto get(T...)() nothrow
    if (T.length > 1)
  {
    return getItems!T;
  }

  /**
   * Template to get one or more values from a container Variant.
   * Params:
   *   T = The D types of the values to get
   * Returns: A tuple containing the values from the Variant of the specified types
   */
  auto getItems(T...)() nothrow
  {
    Tuple!T vals;

    foreach (i, E; T)
      vals[i] = getChildValue(i).get!E;

    return vals;
  }
}

/**
 * Template to create a GVariant from a single D value.
 * Params:
 *   T = The type of the value
 *   val = The value to assign to the new Variant.
 * Returns: New variant C instance with floating reference
 */
GVariant* createVariant(T)(T val) nothrow
{
  static if (is(T == bool))
    return g_variant_new_boolean(val);
  else static if (is(T == byte) || is(T == ubyte))
    return g_variant_new_byte(cast(ubyte)val);
  else static if (is(T == short))
    return g_variant_new_int16(val);
  else static if (is(T == ushort))
    return g_variant_new_uint16(val);
  else static if (is(T == int))
    return g_variant_new_int32(val);
  else static if (is(T == uint))
    return g_variant_new_uint32(val);
  else static if (is(T == long))
    return g_variant_new_int64(val);
  else static if (is(T == ulong))
    return g_variant_new_uint64(val);
  else static if (is(T == float) || is(T == double))
    return g_variant_new_double(val);
  else static if (isSomeString!T)
    return g_variant_new_string(toCString(val.to!string, No.Alloc));
  else static if (is(T : E[], E))
  {
    auto variantType = g_variant_type_new(VariantType.getStr!T.toCString(No.Alloc)); // ++ new
    GVariantBuilder builder;
    g_variant_builder_init(&builder, variantType);
    g_variant_type_free(variantType); // -- free

    foreach (item; val)
      g_variant_builder_add_value(&builder, createVariant(item)); // !! takes over floating reference of new GVariant

    return g_variant_builder_end(&builder);
  }
  else static if (is(T : V[K], V, K)) // Dictionary
  {
    auto variantType = g_variant_type_new(VariantType.getStr!T.toCString(No.Alloc)); // ++ new
    GVariantBuilder builder;
    g_variant_builder_init(&builder, variantType);
    g_variant_type_free(variantType); // -- free

    foreach (k; val.keys)
      g_variant_builder_add_value(&builder, g_variant_new_dict_entry(createVariant(k), createVariant(val[k]))); // !! takes over floating reference of new GVariant

    return g_variant_builder_end(&builder);
  }
  else static if (is(T : Variant))
    return g_variant_new_variant(cast(GVariant*)val._cInstancePtr);
  else static if (is(T == GVariant*))
    return g_variant_new_variant(val);
  else static if (is(T == StdVariant)) // std.variant.Variant (only basic types supported currently)
  {
    try
    {
      if (val.type is typeid(bool))
        return createVariant(val.get!bool);
      else if (val.type is typeid(byte) || val.type is typeid(ubyte))
        return createVariant(val.coerce!byte);
      else if (val.type is typeid(short))
        return createVariant(val.get!short);
      else if (val.type is typeid(ushort))
        return createVariant(val.get!ushort);
      else if (val.type is typeid(int))
        return createVariant(val.get!int);
      else if (val.type is typeid(uint))
        return createVariant(val.get!uint);
      else if (val.type is typeid(long))
        return createVariant(val.get!long);
      else if (val.type is typeid(ulong))
        return createVariant(val.get!ulong);
      else if (val.type is typeid(float) || val.type is typeid(double))
        return createVariant(val.coerce!double);
      else if (val.type is typeid(string) || val.type is typeid(wstring) || val.type is typeid(dstring))
        return createVariant(val.coerce!string);
      else
        assert(false, "Variant.createVariant does not support D Variant type " ~ val.type.to!string);
    }
    catch (Exception)
      assert(false, "Variant.createVariant exception with std.variant.Variant value get"); // Should not happen
  }
  else static if (isTypeTuple!T)
    return createVariant(val.expand);
  else
    static assert(false, "Unsupported type for Variant.createVariant: " ~ T.stringof);
}

/**
 * Template to create a new tuple GVariant from multiple D values.
 * Params:
 *   T = The D types to create the variant from
 *   vals = The values to assign
 * Returns: New variant C instance with floating reference
 */
GVariant* createVariant(T...)(T vals) nothrow
  if (vals.length > 1)
{
  return createVariantTuple!T(vals);
}

/**
 * Template to create a new tuple GVariant from one or more D values.
 * Params:
 *   T = The D types to create the variant from
 *   vals = The values to assign
 * Returns: New variant C instance with floating reference
 */
GVariant* createVariantTuple(T...)(T vals) nothrow
{
  auto variantType = g_variant_type_new("r"); // ++ new
  GVariantBuilder builder;
  g_variant_builder_init(&builder, variantType);
  g_variant_type_free(variantType); // -- free

  foreach (v; vals)
    g_variant_builder_add_value(&builder, createVariant(v)); // !! takes over floating reference of new GVariant

  return g_variant_builder_end(&builder);
}

/**
 * Template to get a single value from a GVariant
 * Params:
 *   T = D type of the value to get
 *   v = GVariant struct pointer
 * Returns: The single variant value of type `T`
 */
T getVal(T)(GVariant* v) nothrow
{
  static if (is(T == bool))
    return g_variant_get_boolean(v);
  else static if (is(T == byte) || is(T == ubyte))
    return cast(T)g_variant_get_byte(v);
  else static if (is(T == short))
    return g_variant_get_int16(v);
  else static if (is(T == ushort))
    return g_variant_get_uint16(v);
  else static if (is(T == int))
    return g_variant_get_int32(v);
  else static if (is(T == uint))
    return g_variant_get_uint32(v);
  else static if (is(T == long))
    return g_variant_get_int64(v);
  else static if (is(T == ulong))
    return g_variant_get_uint64(v);
  else static if (is(T == float) || is(T == double))
    return cast(T)g_variant_get_double(v);
  else static if (isSomeString!T)
    return fromCString(g_variant_get_string(v, null), No.Free); // g_variant_get_string second argument is an optional output length parameter
  else static if (is(T : E[], E))
  {
    T valArray;
    valArray.length = g_variant_n_children(v);

    foreach (i; 0 .. valArray.length)
      valArray[i] = getVal!E(g_variant_get_child_value(v, i));

    return valArray;
  }
  else static if (is(T : V[K], V, K)) // Dictionary
  {
    T dict;

    foreach (i; 0 .. g_variant_n_children(v))
    {
      auto dv = g_variant_get_child_value(v, i);
      dict[getVal!K(g_variant_get_child_value(dv, 0))] = getVal!V(g_variant_get_child_value(dv, 1)); // GVariant dict entries hold 2 values (key, value)
    }

    return dict;
  }
  else static if ((is(T : Variant)))
    return new Variant(v, No.Take);
  else static if ((is(T == GVariant*)))
    return g_variant_get_variant(v);
  else static if (is(T == StdVariant)) // std.variant.Variant (only basic types supported currently)
  {
    if (g_variant_type_is_basic(g_variant_get_type(v)))
    {
      switch (g_variant_get_type_string(v)[0])
      {
        case 'b':
          return Variant(getVal!bool(v));
        case 'y':
          return Variant(cast(T)getVal!byte(v));
        case 'n':
          return Variant(getVal!short(v));
        case 'q':
          return Variant(getVal!ushort(v));
        case 'i':
          return Variant(getVal!int(v));
        case 'u':
          return Variant(getVal!uint(v));
        case 'x':
          return Variant(getVal!long(v));
        case 't':
          return Variant(getVal!ulong(v));
        case 'd':
          return Variant(getVal!double(v));
        case 's':
          return Variant(getVal!string(v));
        default:
          assert(false, "Variant.getVal has unexpected type string");
      }
    }
  }
  else static if (isTypeTuple!T)
    return getVal(val.expand);
  else
    static assert(false, "Unsupported type for Variant.getVal: " ~ T.stringof);
}

/**
 * Template to get multiple values from a GVariant
 * Params:
 *   T = D types of the values to get
 *   v = GVariant struct pointer
 * Returns: A tuple containing the values from the Variant of the specified types
 */
auto getVal(T...)(GVariant* v) nothrow
  if (T.length > 1)
{
  return getValTuple!T(v);
}

/**
 * Template to get one or more values from a container GVariant
 * Params:
 *   T = D types of the values to get
 *   v = GVariant struct pointer
 * Returns: A tuple containing the values from the container Variant of the specified types
 */
auto getValTuple(T...)(GVariant* v) nothrow
{
  Tuple!T vals;

  foreach (i, E; T)
    vals[i] = getVal!E(g_variant_get_child_value(v, i));

  return vals;
}
