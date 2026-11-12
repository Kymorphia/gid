//# GStreamer fundamental value types (Fraction, ranges, lists, etc), which have no C structure of their own and are
//# only accessible via GValues. They are bound as D value types which convert to and from GValues using the
//# gobject.value.isGidValueType hook, so they can be used with gobject.value.Value, properties, Structure fields, etc.

import gobject.c.functions;
import gobject.c.types;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import std.typecons : No;

/// GStreamer fraction value type (GstFraction), such as a framerate.
struct Fraction
{
  int num; /// Numerator
  int den = 1; /// Denominator

  /// Get the GType of GstFraction values.
  static GType _gidValueGType() nothrow
  {
    return gst_fraction_get_type();
  }

  /// Get a Fraction from a GValue.
  static Fraction _gidValueGet(const(GValue)* gval) nothrow
  {
    return Fraction(gst_value_get_fraction_numerator(gval), gst_value_get_fraction_denominator(gval));
  }

  /// Set a GValue to the Fraction.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_fraction(gval, num, den);
  }
}

/// GStreamer integer range value type (GstIntRange).
struct IntRange
{
  int min; /// Minimum value (inclusive)
  int max; /// Maximum value (inclusive)
  int step = 1; /// Step size

  /// Get the GType of GstIntRange values.
  static GType _gidValueGType() nothrow
  {
    return gst_int_range_get_type();
  }

  /// Get an IntRange from a GValue.
  static IntRange _gidValueGet(const(GValue)* gval) nothrow
  {
    auto step = gst_value_get_int_range_step(gval);
    return IntRange(gst_value_get_int_range_min(gval), gst_value_get_int_range_max(gval), step);
  }

  /// Set a GValue to the IntRange.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_int_range_step(gval, min, max, step);
  }
}

/// GStreamer 64 bit integer range value type (GstInt64Range).
struct Int64Range
{
  long min; /// Minimum value (inclusive)
  long max; /// Maximum value (inclusive)
  long step = 1; /// Step size

  /// Get the GType of GstInt64Range values.
  static GType _gidValueGType() nothrow
  {
    return gst_int64_range_get_type();
  }

  /// Get an Int64Range from a GValue.
  static Int64Range _gidValueGet(const(GValue)* gval) nothrow
  {
    auto step = gst_value_get_int64_range_step(gval);
    return Int64Range(gst_value_get_int64_range_min(gval), gst_value_get_int64_range_max(gval), step);
  }

  /// Set a GValue to the Int64Range.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_int64_range_step(gval, min, max, step);
  }
}

/// GStreamer double range value type (GstDoubleRange).
struct DoubleRange
{
  double min = 0.0; /// Minimum value (inclusive)
  double max = 0.0; /// Maximum value (inclusive)

  /// Get the GType of GstDoubleRange values.
  static GType _gidValueGType() nothrow
  {
    return gst_double_range_get_type();
  }

  /// Get a DoubleRange from a GValue.
  static DoubleRange _gidValueGet(const(GValue)* gval) nothrow
  {
    return DoubleRange(gst_value_get_double_range_min(gval), gst_value_get_double_range_max(gval));
  }

  /// Set a GValue to the DoubleRange.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_double_range(gval, min, max);
  }
}

/// GStreamer fraction range value type (GstFractionRange), such as a framerate range.
struct FractionRange
{
  Fraction min; /// Minimum value (inclusive)
  Fraction max; /// Maximum value (inclusive)

  /// Get the GType of GstFractionRange values.
  static GType _gidValueGType() nothrow
  {
    return gst_fraction_range_get_type();
  }

  /// Get a FractionRange from a GValue.
  static FractionRange _gidValueGet(const(GValue)* gval) nothrow
  {
    auto minVal = gst_value_get_fraction_range_min(gval);
    auto maxVal = gst_value_get_fraction_range_max(gval);

    if (!minVal || !maxVal)
      return FractionRange.init;

    return FractionRange(Fraction._gidValueGet(minVal), Fraction._gidValueGet(maxVal));
  }

  /// Set a GValue to the FractionRange.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_fraction_range_full(gval, min.num, min.den, max.num, max.den);
  }
}

/// GStreamer 64 bit bitmask value type (GstBitmask).
struct Bitmask
{
  ulong value; /// The bitmask value

  /// Get the GType of GstBitmask values.
  static GType _gidValueGType() nothrow
  {
    return gst_bitmask_get_type();
  }

  /// Get a Bitmask from a GValue.
  static Bitmask _gidValueGet(const(GValue)* gval) nothrow
  {
    return Bitmask(gst_value_get_bitmask(gval));
  }

  /// Set a GValue to the Bitmask.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_bitmask(gval, value);
  }
}

/**
 * GStreamer flag set value type (GstFlagSet), a set of flags and a mask of the flags which are relevant.
 * Values of derived flag set types (such as gstvideo.types.VideoMultiviewFlagsSet) can also be read as a FlagSet.
 */
struct FlagSet
{
  uint flags; /// The flags
  uint mask; /// Mask of the flags which are relevant

  /// Get the GType of GstFlagSet values.
  static GType _gidValueGType() nothrow
  {
    return gst_flagset_get_type();
  }

  /// Get a FlagSet from a GValue.
  static FlagSet _gidValueGet(const(GValue)* gval) nothrow
  {
    return FlagSet(gst_value_get_flagset_flags(gval), gst_value_get_flagset_mask(gval));
  }

  /// Set a GValue to the FlagSet.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_flagset(gval, flags, mask);
  }
}

/// Template for GStreamer value container types (GstValueList, GstValueArray and GstValueUniqueList).
private mixin template GstValueContainer(alias getTypeFunc, alias getSizeFunc, alias getValueFunc, alias appendFunc)
{
  /// The values (deep copies of the GValue container values)
  Value[] values;

  /**
   * Construct from Values.
   * Params:
   *   values = The values (the Value objects are referenced, their GValues are copied when set to a GValue)
   */
  this(Value[] values...) nothrow
  {
    this.values = values.dup;
  }

  /**
   * Create from an array of D values.
   * Params:
   *   T = The D type of the values (any type supported by gobject.value.Value)
   *   items = The items
   * Returns: The new container
   */
  static typeof(this) from(T)(T[] items) nothrow
  {
    typeof(this) container;

    foreach (item; items)
      container.values ~= new Value(item);

    return container;
  }

  /**
   * Get the values as an array of D values.
   * Params:
   *   T = The D type of the values (all values must hold a compatible type)
   * Returns: The values
   */
  T[] to(T)() nothrow
  {
    T[] items;

    foreach (val; values)
      items ~= val.get!T;

    return items;
  }

  /// Number of values.
  size_t length() const nothrow
  {
    return values.length;
  }

  /// Get the GType of the container values (0 if not supported by the GStreamer library).
  static GType _gidValueGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())getTypeFunc != &gidSymbolNotFound ? getTypeFunc() : cast(GType)0;
  }

  /// Get a container with copies of the values in a GValue.
  static typeof(this) _gidValueGet(const(GValue)* gval) nothrow
  {
    typeof(this) container;
    auto size = getSizeFunc(gval);

    foreach (i; 0 .. size)
    {
      if (auto val = getValueFunc(gval, i))
        container.values ~= new Value(cast(void*)val, No.Take); // Boxed copy of the GValue
    }

    return container;
  }

  /// Append copies of the values to a GValue.
  void _gidValueSet(GValue* gval) nothrow
  {
    foreach (val; values)
    {
      if (val)
        appendFunc(gval, cast(const(GValue)*)val._cPtr);
    }
  }
}

/// GStreamer unordered list value type (GstValueList), such as a list of possible caps field values.
struct ValueList
{
  alias _getType = gst_value_list_get_type;
  alias _getSize = gst_value_list_get_size;
  alias _getValue = gst_value_list_get_value;
  alias _append = gst_value_list_append_value;
  mixin GstValueContainer!(_getType, _getSize, _getValue, _append);
}

/**
 * GStreamer ordered array value type (GstValueArray). Not to be confused with the deprecated GObject ValueArray
 * (gobject.value_array.ValueArray).
 */
struct ValueArray
{
  alias _getType = gst_value_array_get_type;
  alias _getSize = gst_value_array_get_size;
  alias _getValue = gst_value_array_get_value;
  alias _append = gst_value_array_append_value;
  mixin GstValueContainer!(_getType, _getSize, _getValue, _append);
}

/// GStreamer unordered list value type with unique values (GstValueUniqueList, GStreamer 1.28 and later).
struct ValueUniqueList
{
  alias _getType = gst_value_unique_list_get_type;
  alias _getSize = gst_value_unique_list_get_size;
  alias _getValue = gst_value_unique_list_get_value;
  alias _append = gst_value_unique_list_append_value;
  mixin GstValueContainer!(_getType, _getSize, _getValue, _append);
}
