//!repo GObject-2.0

//# Merge GObject into GLib package to simplify interdependencies
//!merge GLib

//# Add DClosure class type which is defined in GObject-DClosure.d
//!add repository.namespace '<class name="DClosure" parent="Closure"></class>'

//# Remove duplicate IOCondition definition
//!del bitfield[IOCondition]

//# Disable TypePlugin.use() and unuse() since they conflict with IOModule
//!set interface[TypePlugin].method[use][disable] 1
//!set interface[TypePlugin].method[unuse][disable] 1

//# Add c:type for the _Value__data__union used within GValue
//!set union[_Value__data__union][c:type] _Value__data__union
//!set union[_Value__data__union][disable] 1
//!set record[Value].field[data].array.type[_Value__data__union][c:type] _Value__data__union
//!set record[Value].field[data][private] 1

//# Disable binding of unuseful and problematic structures
//!set record[TypePluginClass][disable] 1

//# Remove duplicate variant_get_gtype (also in GLib-2.0.gir) as it was causing duplicate C function pointer symbols with dmd
//!del function[variant_get_gtype]

//# Disable WeakRef priv union field
//!set record[WeakRef].union[priv][disable] 1

//# Rename Object and TypeInfo which conflict with the base D Object type
//!subctype GObject ObjectC
//!subdtype Object ObjectG
//!subdtype TypeInfo TypeInfoG
//!subdtype Type GType

//# Set ref/unref of ParamSpec
//!set class[ParamSpec][glib:ref-func] g_param_spec_ref
//!set class[ParamSpec][glib:unref-func] g_param_spec_unref
//!del class[ParamSpec][glib:get-type]

//# Designate ParamSpecPool.new as constructor and set as introspectable
//!set record[ParamSpecPool].function[new][introspectable] 1
//!rename record[ParamSpecPool].function[new] constructor

//# Replace gpointer C types to actual type
//!set record[TypeClass].method[peek_parent].return-value.type[][c:type] GTypeClass*
//!set record[TypeClass].function[peek].return-value.type[][c:type] GTypeClass*
//!set record[TypeClass].function[peek_static].return-value.type[][c:type] GTypeClass*
//!set record[TypeClass].function[ref].return-value.type[][c:type] GTypeClass*
//!set record[TypeInterface].method[peek_parent].return-value.type[][c:type] GTypeInterface*
//!set record[TypeInterface].function[peek].return-value.type[][c:type] GTypeInterface*
//!set function[type_default_interface_peek].return-value.type[][c:type] GTypeInterface*
//!set function[type_default_interface_ref].return-value.type[][c:type] GTypeInterface*

//# Not introspectable, but could be implemented manually
//!set function[signal_chain_from_overridden][introspectable] 0
//!set function[signal_emitv][introspectable] 0
//!set class[SignalGroup].method[connect_data][introspectable] 0

//!set function[clear_signal_handler].parameters.parameter[handler_id_ptr][direction] inout
//!set record[TypeClass].function[adjust_private_offset].parameters.parameter[private_size_or_offset][direction] inout

//# Add missing free functions
//!set record[TypeClass][free-function] g_type_class_unref

//# Set writable to false as it should be
//!set record[CClosure].field[closure][writable] 0
//!set record[EnumClass].field[g_type_class][writable] 0
//!set record[EnumClass].field[values][writable] 0
//!set record[FlagsClass].field[g_type_class][writable] 0
//!set record[FlagsClass].field[values][writable] 0

//# Set some methods to not introspectable as they should be
//!set class[SignalGroup].method[connect_swapped][introspectable] 0

//# Add missing closure parameter designations
//!set callback[SignalEmissionHook].parameters.parameter[data][closure] 3

//!class Types

  enum GTypeFundamentalShift = 2; /// Fundamental GType shift value (G_TYPE_FUNDAMENTAL_SHIFT)

  /// Fundamental GType values as an enum
  enum GTypeEnum
  {
    Invalid = 0 << GTypeFundamentalShift,
    None = 1 << GTypeFundamentalShift,
    Interface = 2 << GTypeFundamentalShift,
    Char = 3 << GTypeFundamentalShift,
    Uchar = 4 << GTypeFundamentalShift,
    Boolean = 5 << GTypeFundamentalShift,
    Int = 6 << GTypeFundamentalShift,
    Uint = 7 << GTypeFundamentalShift,
    Long = 8 << GTypeFundamentalShift,
    Ulong = 9 << GTypeFundamentalShift,
    Int64 = 10 << GTypeFundamentalShift,
    Uint64 = 11 << GTypeFundamentalShift,
    Enum = 12 << GTypeFundamentalShift,
    Flags = 13 << GTypeFundamentalShift,
    Float = 14 << GTypeFundamentalShift,
    Double = 15 << GTypeFundamentalShift,
    String = 16 << GTypeFundamentalShift,
    Pointer = 17 << GTypeFundamentalShift,
    Boxed = 18 << GTypeFundamentalShift,
    Param = 19 << GTypeFundamentalShift,
    Object = 20 << GTypeFundamentalShift,
    Variant = 21 << GTypeFundamentalShift,
  }
