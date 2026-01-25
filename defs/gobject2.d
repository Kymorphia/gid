//!gir GObject-2.0
//!info description "D binding for the GObject library - C library for object oriented type system and object class"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gobject.html
//!info capi https://docs.gtk.org/gobject/

//!kind ClosureNotifyData StructAlias

//# Merge GObject into GLib package to simplify interdependencies
//!merge GLib 2.0

//# Re-enable some structures which were set to ignore with global wildcard rule
//!set record[EnumClass][ignore] 0
//!set record[FlagsClass][ignore] 0
//!set record[TypeClass][ignore] 0

//!kind EnumClass Struct
//!kind FlagsClass Struct
//!kind EnumValue Struct
//!kind FlagsValue Struct

//# Add DClosure class type which is defined in GObject-DClosure.d
//!add repository.namespace '<class name="DClosure" parent="Closure"></class>'

//# Remove duplicate IOCondition definition
//!del bitfield[IOCondition]

//# Ignore some API items which aren't useful for D binding
//!set class[TypeModule][ignore] 1
//!set interface[TypePlugin][ignore] 1
//!set record[TypeInterface][ignore] 1
//!set record[TypeInfo][ignore] 1
//!set record[InterfaceInfo][ignore] 1
//!set function[enum_complete_type_info][ignore] 1
//!set function[flags_complete_type_info][ignore] 1
//!set function[type_add_interface_dynamic][ignore] 1
//!set function[type_get_plugin][ignore] 1
//!set function[type_register_dynamic][ignore] 1
//!set function[type_register_fundamental][ignore] 1
//!set function[type_register_static][ignore] 1
//!set function[type_default_interface_peek][ignore] 1
//!set function[type_default_interface_ref][ignore] 1
//!set function[type_default_interface_unref][ignore] 1
//!set function[type_add_interface_static][ignore] 1
//!set class[Object].function[interface_find_property][ignore] 1
//!set class[Object].function[interface_install_property][ignore] 1
//!set class[Object].function[interface_list_properties][ignore] 1
//!set function[boxed_type_register_static][ignore] 1
//!set function[signal_override_class_handler][ignore] 1
//!set function[signal_set_va_marshaller][ignore] 1
//!set function[type_check_class_is_a][ignore] 1
//!set function[type_name_from_class][ignore] 1

//# Add c:type for the _Value__data__union used within GValue
//!set union[_Value__data__union][c:type] _Value__data__union
//!set union[_Value__data__union][ignore] 1
//!set record[Value].field[data].array.type[_Value__data__union][c:type] _Value__data__union
//!set record[Value].field[data][private] 1

//# Remove duplicate variant_get_gtype (also in GLib-2.0.gir) as it was causing duplicate C function pointer symbols with dmd
//!del function[variant_get_gtype]

//# Disable WeakRef priv union field
//!set record[WeakRef].union[priv][ignore] 1

//# Rename Object and TypeInfo which conflict with the base D Object type
//!subdtype Object ObjectWrap
//!subdtype Type GType

//# Set ref/unref of ParamSpec
//!set class[ParamSpec][glib:ref-func] g_param_spec_ref
//!set class[ParamSpec][glib:unref-func] g_param_spec_unref
//!del class[ParamSpec][glib:get-type]

//# Designate ParamSpecPool.new as constructor and set as introspectable
//!set record[ParamSpecPool].function[new][introspectable] 1
//!rename record[ParamSpecPool].function[new] constructor

//# Replace gpointer C types to actual type
//!set record[TypeInterface].method[peek_parent].return-value.type[][c:type] GTypeInterface*
//!set record[TypeInterface].function[peek].return-value.type[][c:type] GTypeInterface*
//!set function[type_default_interface_peek].return-value.type[][c:type] GTypeInterface*
//!set function[type_default_interface_ref].return-value.type[][c:type] GTypeInterface*

//# Not introspectable, but could be implemented manually
//!set function[signal_chain_from_overridden][introspectable] 0
//!set function[signal_emitv][introspectable] 0
//!set class[SignalGroup].method[connect_data][introspectable] 0

//!set function[clear_signal_handler].parameters.parameter[handler_id_ptr][direction] inout

//# Set writable to false as it should be
//!set record[CClosure].field[closure][writable] 0

//# Set some methods to not introspectable as they should be
//!set class[SignalGroup].method[connect_swapped][introspectable] 0

//# Ignore type plugin callbacks
//!set callback[TypeInterfaceCheckFunc][ignore] 1
//!set callback[TypePluginCompleteInterfaceInfo][ignore] 1
//!set callback[TypePluginCompleteTypeInfo][ignore] 1
//!set callback[TypePluginUnuse][ignore] 1
//!set callback[TypePluginUse][ignore] 1
//!set callback[InterfaceFinalizeFunc][ignore] 1
//!set callback[InterfaceInitFunc][ignore] 1

//# Add missing closure parameter designations
//!set callback[SignalEmissionHook].parameters.parameter[data][closure] 3

//# Override signalHandlerDisconnect and signalHandlersDestroy to update signalClosures references to allow garbage collection of objects referenced by signal callbacks
//# NOTE: signalHandlersDisconnectMatched is also a potential candidate, but not currently implemented
//!set function[signal_handler_disconnect][ignore] 1
//!set function[signal_handlers_destroy][ignore] 1
//!class global pre

/**
    Disconnects a handler from an instance so it will not be called during
    any future or currently ongoing emissions of the signal it has been
    connected to. The handler_id becomes invalid and may be reused.
    
    The handler_id has to be a valid signal handler id, connected to a
    signal of instance.

    Params:
      instance = The instance to remove the signal handler from.
      handlerId = Handler id of the handler to be disconnected.
*/
void signalHandlerDisconnect(gobject.object.ObjectWrap instance, gulong handlerId)
{
  g_signal_handler_disconnect(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, handlerId);
  instance.signalClosures.remove(handlerId);
}

/**
    Destroy all signal handlers of a type instance. This function is
    an implementation detail of the #GObject dispose implementation,
    and should not be used outside of the type system.

    Params:
      instance = The instance whose signal handlers are destroyed
*/
void signalHandlersDestroy(gobject.object.ObjectWrap instance)
{
  g_signal_handlers_destroy(instance ? cast(GObject*)instance._cPtr(No.Dup) : null);
  instance.signalClosures.clear;
}

//!class types

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
