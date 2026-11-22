/// Global functions for gobject2 library
module gid.gobject2.global;

import gid.core.utils;
import gid.glib2.source;
import gid.glib2.types;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.closure;
import gid.gobject2.enum_class;
import gid.gobject2.enum_value;
import gid.gobject2.flags_class;
import gid.gobject2.flags_value;
import gid.gobject2.object;
import gid.gobject2.param_spec;
import gid.gobject2.signal_query;
import gid.gobject2.type_instance;
import gid.gobject2.type_query;
import gid.gobject2.types;
import gid.gobject2.value;


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
void signalHandlerDisconnect(gid.gobject2.object.ObjectWrap instance, gulong handlerId) nothrow
{
  g_signal_handler_disconnect(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, handlerId);
  instance._signalClosures.remove(handlerId);
}

/**
Destroy all signal handlers of a type instance. This function is
an implementation detail of the #GObject dispose implementation,
and should not be used outside of the type system.

Params:
instance = The instance whose signal handlers are destroyed
*/
void signalHandlersDestroy(gid.gobject2.object.ObjectWrap instance) nothrow
{
  g_signal_handlers_destroy(instance ? cast(GObject*)instance._cPtr(No.Dup) : null);
  instance._signalClosures.clear;
}


/**
    Set the callback for a source as a #GClosure.
    
    If the source is not one of the standard GLib types, the closure_callback
    and closure_marshal fields of the #GSourceFuncs structure must have been
    filled in with pointers to appropriate functions.

    Params:
      source = the source
      closure = a #GClosure
*/
void setClosure(gid.glib2.source.Source source, gid.gobject2.closure.Closure closure) nothrow
{
  g_source_set_closure(source ? cast(GSource*)source._cPtr(No.Dup) : null, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null);
}

/**
    Sets a dummy callback for source. The callback will do nothing, and
    if the source expects a #gboolean return value, it will return true.
    (If the source expects any other type of return value, it will return
    a 0/null value; whatever [gid.gobject2.value.Value.init_] initializes a #GValue to for
    that type.)
    
    If the source is not one of the standard GLib types, the
    closure_callback and closure_marshal fields of the #GSourceFuncs
    structure must have been filled in with pointers to appropriate
    functions.

    Params:
      source = the source
*/
void setDummyCallback(gid.glib2.source.Source source) nothrow
{
  g_source_set_dummy_callback(source ? cast(GSource*)source._cPtr(No.Dup) : null);
}

/**
    Provide a copy of a boxed structure src_boxed which is of type boxed_type.

    Params:
      boxedType = The type of src_boxed.
      srcBoxed = The boxed structure to be copied.
    Returns: The newly created copy of the boxed
         structure.
*/
void* boxedCopy(gid.gobject2.types.GType boxedType, const(void)* srcBoxed) nothrow
{
  auto _retval = g_boxed_copy(boxedType, srcBoxed);
  return _retval;
}

/**
    Free the boxed structure boxed which is of type boxed_type.

    Params:
      boxedType = The type of boxed.
      boxed = The boxed structure to be freed.
*/
void boxedFree(gid.gobject2.types.GType boxedType, void* boxed) nothrow
{
  g_boxed_free(boxedType, boxed);
}

/**
    Disconnects a handler from instance so it will not be called during
    any future or currently ongoing emissions of the signal it has been
    connected to. The handler_id_ptr is then set to zero, which is never a valid handler ID value (see g_signal_connect()).
    
    If the handler ID is 0 then this function does nothing.
    
    There is also a macro version of this function so that the code
    will be inlined.

    Params:
      handlerIdPtr = A pointer to a handler ID (of type #gulong) of the handler to be disconnected.
      instance = The instance to remove the signal handler from.
          This pointer may be null or invalid, if the handler ID is zero.
*/
void clearSignalHandler(ref gulong handlerIdPtr, gid.gobject2.object.ObjectWrap instance) nothrow
{
  g_clear_signal_handler(cast(gulong*)&handlerIdPtr, instance ? cast(GObject*)instance._cPtr(No.Dup) : null);
}

/**
    Returns the #GEnumValue for a value.

    Params:
      enumClass = a #GEnumClass
      value = the value to look up
    Returns: the #GEnumValue for value, or null
               if value is not a member of the enumeration
*/
gid.gobject2.enum_value.EnumValue enumGetValue(gid.gobject2.enum_class.EnumClass enumClass, int value) nothrow
{
  GEnumValue* _cretval;
  _cretval = g_enum_get_value(cast(GEnumClass*)&enumClass, value);
  gid.gobject2.enum_value.EnumValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.enum_value.EnumValue*)_cretval;
  return _retval;
}

/**
    Looks up a #GEnumValue by name.

    Params:
      enumClass = a #GEnumClass
      name = the name to look up
    Returns: the #GEnumValue with name name,
               or null if the enumeration doesn't have a member
               with that name
*/
gid.gobject2.enum_value.EnumValue enumGetValueByName(gid.gobject2.enum_class.EnumClass enumClass, string name) nothrow
{
  GEnumValue* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = g_enum_get_value_by_name(cast(GEnumClass*)&enumClass, _name);
  gid.gobject2.enum_value.EnumValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.enum_value.EnumValue*)_cretval;
  return _retval;
}

/**
    Looks up a #GEnumValue by nickname.

    Params:
      enumClass = a #GEnumClass
      nick = the nickname to look up
    Returns: the #GEnumValue with nickname nick,
               or null if the enumeration doesn't have a member
               with that nickname
*/
gid.gobject2.enum_value.EnumValue enumGetValueByNick(gid.gobject2.enum_class.EnumClass enumClass, string nick) nothrow
{
  GEnumValue* _cretval;
  const(char)* _nick = nick.toCString!(No.Malloc, No.Nullable);
  _cretval = g_enum_get_value_by_nick(cast(GEnumClass*)&enumClass, _nick);
  gid.gobject2.enum_value.EnumValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.enum_value.EnumValue*)_cretval;
  return _retval;
}

/**
    Pretty-prints value in the form of the enum’s name.
    
    This is intended to be used for debugging purposes. The format of the output
    may change in the future.

    Params:
      gEnumType = the type identifier of a #GEnumClass type
      value = the value
    Returns: a newly-allocated text string
*/
string enumToString(gid.gobject2.types.GType gEnumType, int value) nothrow
{
  char* _cretval;
  _cretval = g_enum_to_string(gEnumType, value);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Returns the first #GFlagsValue which is set in value.

    Params:
      flagsClass = a #GFlagsClass
      value = the value
    Returns: the first #GFlagsValue which is set in
               value, or null if none is set
*/
gid.gobject2.flags_value.FlagsValue flagsGetFirstValue(gid.gobject2.flags_class.FlagsClass flagsClass, uint value) nothrow
{
  GFlagsValue* _cretval;
  _cretval = g_flags_get_first_value(cast(GFlagsClass*)&flagsClass, value);
  gid.gobject2.flags_value.FlagsValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.flags_value.FlagsValue*)_cretval;
  return _retval;
}

/**
    Looks up a #GFlagsValue by name.

    Params:
      flagsClass = a #GFlagsClass
      name = the name to look up
    Returns: the #GFlagsValue with name name,
               or null if there is no flag with that name
*/
gid.gobject2.flags_value.FlagsValue flagsGetValueByName(gid.gobject2.flags_class.FlagsClass flagsClass, string name) nothrow
{
  GFlagsValue* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = g_flags_get_value_by_name(cast(GFlagsClass*)&flagsClass, _name);
  gid.gobject2.flags_value.FlagsValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.flags_value.FlagsValue*)_cretval;
  return _retval;
}

/**
    Looks up a #GFlagsValue by nickname.

    Params:
      flagsClass = a #GFlagsClass
      nick = the nickname to look up
    Returns: the #GFlagsValue with nickname nick,
               or null if there is no flag with that nickname
*/
gid.gobject2.flags_value.FlagsValue flagsGetValueByNick(gid.gobject2.flags_class.FlagsClass flagsClass, string nick) nothrow
{
  GFlagsValue* _cretval;
  const(char)* _nick = nick.toCString!(No.Malloc, No.Nullable);
  _cretval = g_flags_get_value_by_nick(cast(GFlagsClass*)&flagsClass, _nick);
  gid.gobject2.flags_value.FlagsValue _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.flags_value.FlagsValue*)_cretval;
  return _retval;
}

/**
    Pretty-prints value in the form of the flag names separated by ` | ` and
    sorted. Any extra bits will be shown at the end as a hexadecimal number.
    
    This is intended to be used for debugging purposes. The format of the output
    may change in the future.

    Params:
      flagsType = the type identifier of a #GFlagsClass type
      value = the value
    Returns: a newly-allocated text string
*/
string flagsToString(gid.gobject2.types.GType flagsType, uint value) nothrow
{
  char* _cretval;
  _cretval = g_flags_to_string(flagsType, value);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/** */
gid.gobject2.types.GType gtypeGetType() nothrow
{
  gid.gobject2.types.GType _retval;
  _retval = g_gtype_get_type();
  return _retval;
}

/**
    Creates a new #GParamSpecBoolean instance specifying a `G_TYPE_BOOLEAN`
    property. In many cases, it may be more appropriate to use an enum with
    [gid.gobject2.global.paramSpecEnum], both to improve code clarity by using explicitly named
    values, and to allow for more values to be added in future without breaking
    API.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecBoolean(string name, string nick, string blurb, bool defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_boolean(_name, _nick, _blurb, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecBoxed instance specifying a `G_TYPE_BOXED`
    derived property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      boxedType = `G_TYPE_BOXED` derived type of this property
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecBoxed(string name, string nick, string blurb, gid.gobject2.types.GType boxedType, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_boxed(_name, _nick, _blurb, boxedType, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecChar instance specifying a `G_TYPE_CHAR` property.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecChar(string name, string nick, string blurb, byte minimum, byte maximum, byte defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_char(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecDouble instance specifying a `G_TYPE_DOUBLE`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecDouble(string name, string nick, string blurb, double minimum, double maximum, double defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_double(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecEnum instance specifying a `G_TYPE_ENUM`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      enumType = a #GType derived from `G_TYPE_ENUM`
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecEnum(string name, string nick, string blurb, gid.gobject2.types.GType enumType, int defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_enum(_name, _nick, _blurb, enumType, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecFlags instance specifying a `G_TYPE_FLAGS`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      flagsType = a #GType derived from `G_TYPE_FLAGS`
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecFlags(string name, string nick, string blurb, gid.gobject2.types.GType flagsType, uint defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_flags(_name, _nick, _blurb, flagsType, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecFloat instance specifying a `G_TYPE_FLOAT` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecFloat(string name, string nick, string blurb, float minimum, float maximum, float defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_float(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecGType instance specifying a
    `G_TYPE_GTYPE` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      isAType = a #GType whose subtypes are allowed as values
         of the property (use `G_TYPE_NONE` for any type)
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecGtype(string name, string nick, string blurb, gid.gobject2.types.GType isAType, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_gtype(_name, _nick, _blurb, isAType, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecInt instance specifying a `G_TYPE_INT` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecInt(string name, string nick, string blurb, int minimum, int maximum, int defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_int(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecInt64 instance specifying a `G_TYPE_INT64` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecInt64(string name, string nick, string blurb, long minimum, long maximum, long defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_int64(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecLong instance specifying a `G_TYPE_LONG` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecLong(string name, string nick, string blurb, glong minimum, glong maximum, glong defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_long(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecBoxed instance specifying a `G_TYPE_OBJECT`
    derived property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      objectType = `G_TYPE_OBJECT` derived type of this property
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecObject(string name, string nick, string blurb, gid.gobject2.types.GType objectType, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_object(_name, _nick, _blurb, objectType, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecParam instance specifying a `G_TYPE_PARAM`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      paramType = a #GType derived from `G_TYPE_PARAM`
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecParam(string name, string nick, string blurb, gid.gobject2.types.GType paramType, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_param(_name, _nick, _blurb, paramType, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecPointer instance specifying a pointer property.
    Where possible, it is better to use [gid.gobject2.global.paramSpecObject] or
    [gid.gobject2.global.paramSpecBoxed] to expose memory management information.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecPointer(string name, string nick, string blurb, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_pointer(_name, _nick, _blurb, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecString instance.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecString(string name, string nick, string blurb, string defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _defaultValue = defaultValue.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_string(_name, _nick, _blurb, _defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecUChar instance specifying a `G_TYPE_UCHAR` property.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecUchar(string name, string nick, string blurb, ubyte minimum, ubyte maximum, ubyte defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_uchar(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecUInt instance specifying a `G_TYPE_UINT` property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecUint(string name, string nick, string blurb, uint minimum, uint maximum, uint defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_uint(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecUInt64 instance specifying a `G_TYPE_UINT64`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecUint64(string name, string nick, string blurb, ulong minimum, ulong maximum, ulong defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_uint64(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecULong instance specifying a `G_TYPE_ULONG`
    property.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minimum = minimum value for the property specified
      maximum = maximum value for the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecUlong(string name, string nick, string blurb, gulong minimum, gulong maximum, gulong defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_ulong(_name, _nick, _blurb, minimum, maximum, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecUnichar instance specifying a `G_TYPE_UINT`
    property. #GValue structures for this property can be accessed with
    [gid.gobject2.value.Value.setUint] and [gid.gobject2.value.Value.getUint].
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      defaultValue = default value for the property specified
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gid.gobject2.param_spec.ParamSpec paramSpecUnichar(string name, string nick, string blurb, dchar defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_unichar(_name, _nick, _blurb, defaultValue, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #GParamSpecVariant instance specifying a #GVariant
    property.
    
    If default_value is floating, it is consumed.
    
    See [gid.gobject2.param_spec.ParamSpec.internal] for details on property names.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      type = a #GVariantType
      defaultValue = a #GVariant of type type to
                        use as the default value, or null
      flags = flags for the property specified
    Returns: the newly created #GParamSpec
*/
gid.gobject2.param_spec.ParamSpec paramSpecVariant(string name, string nick, string blurb, gid.glib2.variant_type.VariantType type, gid.glib2.variant.Variant defaultValue, gid.gobject2.types.ParamFlags flags) nothrow
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  const(char)* _nick = nick.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _blurb = blurb.toCString!(No.Malloc, Yes.Nullable);
  _cretval = g_param_spec_variant(_name, _nick, _blurb, type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null, defaultValue ? cast(GVariant*)defaultValue._cPtr(Yes.Dup) : null, flags);
  auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Registers name as the name of a new static type derived
    from `G_TYPE_PARAM`.
    
    The type system uses the information contained in the #GParamSpecTypeInfo
    structure pointed to by info to manage the #GParamSpec type and its
    instances.

    Params:
      name = 0-terminated string used as the name of the new #GParamSpec type.
      pspecInfo = The #GParamSpecTypeInfo for this #GParamSpec type.
    Returns: The new type identifier.
*/
gid.gobject2.types.GType paramTypeRegisterStatic(string name, gid.gobject2.types.ParamSpecTypeInfo pspecInfo) nothrow
{
  gid.gobject2.types.GType _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = g_param_type_register_static(_name, cast(const(GParamSpecTypeInfo)*)&pspecInfo);
  return _retval;
}

/**
    Transforms src_value into dest_value if possible, and then
    validates dest_value, in order for it to conform to pspec.  If
    strict_validation is true this function will only succeed if the
    transformed dest_value complied to pspec without modifications.
    
    See also [gid.gobject2.value.Value.typeTransformable], [gid.gobject2.value.Value.transform] and
    [gid.gobject2.global.paramValueValidate].

    Params:
      pspec = a valid #GParamSpec
      srcValue = source #GValue
      destValue = destination #GValue of correct type for pspec
      strictValidation = true requires dest_value to conform to pspec
        without modifications
    Returns: true if transformation and validation were successful,
       false otherwise and dest_value is left untouched.
*/
bool paramValueConvert(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value srcValue, gid.gobject2.value.Value destValue, bool strictValidation) nothrow
{
  bool _retval;
  _retval = cast(bool)g_param_value_convert(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, srcValue ? cast(const(GValue)*)srcValue._cPtr(No.Dup) : null, destValue ? cast(GValue*)destValue._cPtr(No.Dup) : null, strictValidation);
  return _retval;
}

/**
    Checks whether value contains the default value as specified in pspec.

    Params:
      pspec = a valid #GParamSpec
      value = a #GValue of correct type for pspec
    Returns: whether value contains the canonical default for this pspec
*/
bool paramValueDefaults(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value) nothrow
{
  bool _retval;
  _retval = cast(bool)g_param_value_defaults(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Return whether the contents of value comply with the specifications
    set out by pspec.

    Params:
      pspec = a valid #GParamSpec
      value = a #GValue of correct type for pspec
    Returns: whether the contents of value comply with the specifications
        set out by pspec.
*/
bool paramValueIsValid(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value) nothrow
{
  bool _retval;
  _retval = cast(bool)g_param_value_is_valid(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Sets value to its default value as specified in pspec.

    Params:
      pspec = a valid #GParamSpec
      value = a #GValue of correct type for pspec; since 2.64, you
          can also pass an empty #GValue, initialized with `G_VALUE_INIT`
*/
void paramValueSetDefault(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value) nothrow
{
  g_param_value_set_default(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(GValue*)value._cPtr(No.Dup) : null);
}

/**
    Ensures that the contents of value comply with the specifications
    set out by pspec. For example, a #GParamSpecInt might require
    that integers stored in value may not be smaller than -42 and not be
    greater than +42. If value contains an integer outside of this range,
    it is modified accordingly, so the resulting value will fit into the
    range -42 .. +42.

    Params:
      pspec = a valid #GParamSpec
      value = a #GValue of correct type for pspec
    Returns: whether modifying value was necessary to ensure validity
*/
bool paramValueValidate(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value) nothrow
{
  bool _retval;
  _retval = cast(bool)g_param_value_validate(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Compares value1 with value2 according to pspec, and return -1, 0 or +1,
    if value1 is found to be less than, equal to or greater than value2,
    respectively.

    Params:
      pspec = a valid #GParamSpec
      value1 = a #GValue of correct type for pspec
      value2 = a #GValue of correct type for pspec
    Returns: -1, 0 or +1, for a less than, equal to or greater than result
*/
int paramValuesCmp(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value1, gid.gobject2.value.Value value2) nothrow
{
  int _retval;
  _retval = g_param_values_cmp(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Creates a new `G_TYPE_POINTER` derived type id for a new
    pointer type with name name.

    Params:
      name = the name of the new pointer type.
    Returns: a new `G_TYPE_POINTER` derived type id for name.
*/
gid.gobject2.types.GType pointerTypeRegisterStatic(string name) nothrow
{
  gid.gobject2.types.GType _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = g_pointer_type_register_static(_name);
  return _retval;
}

/**
    A predefined #GSignalAccumulator for signals intended to be used as a
    hook for application code to provide a particular value.  Usually
    only one such value is desired and multiple handlers for the same
    signal don't make much sense (except for the case of the default
    handler defined in the class structure, in which case you will
    usually want the signal connection to override the class handler).
    
    This accumulator will use the return value from the first signal
    handler that is run as the return value for the signal and not run
    any further handlers (ie: the first handler "wins").

    Params:
      ihint = standard #GSignalAccumulator parameter
      returnAccu = standard #GSignalAccumulator parameter
      handlerReturn = standard #GSignalAccumulator parameter
      dummy = standard #GSignalAccumulator parameter
    Returns: standard #GSignalAccumulator result
*/
bool signalAccumulatorFirstWins(gid.gobject2.types.SignalInvocationHint ihint, gid.gobject2.value.Value returnAccu, gid.gobject2.value.Value handlerReturn, void* dummy = null) nothrow
{
  bool _retval;
  _retval = cast(bool)g_signal_accumulator_first_wins(cast(GSignalInvocationHint*)&ihint, returnAccu ? cast(GValue*)returnAccu._cPtr(No.Dup) : null, handlerReturn ? cast(const(GValue)*)handlerReturn._cPtr(No.Dup) : null, dummy);
  return _retval;
}

/**
    A predefined #GSignalAccumulator for signals that return a
    boolean values. The behavior that this accumulator gives is
    that a return of true stops the signal emission: no further
    callbacks will be invoked, while a return of false allows
    the emission to continue. The idea here is that a true return
    indicates that the callback handled the signal, and no further
    handling is needed.

    Params:
      ihint = standard #GSignalAccumulator parameter
      returnAccu = standard #GSignalAccumulator parameter
      handlerReturn = standard #GSignalAccumulator parameter
      dummy = standard #GSignalAccumulator parameter
    Returns: standard #GSignalAccumulator result
*/
bool signalAccumulatorTrueHandled(gid.gobject2.types.SignalInvocationHint ihint, gid.gobject2.value.Value returnAccu, gid.gobject2.value.Value handlerReturn, void* dummy = null) nothrow
{
  bool _retval;
  _retval = cast(bool)g_signal_accumulator_true_handled(cast(GSignalInvocationHint*)&ihint, returnAccu ? cast(GValue*)returnAccu._cPtr(No.Dup) : null, handlerReturn ? cast(const(GValue)*)handlerReturn._cPtr(No.Dup) : null, dummy);
  return _retval;
}

/**
    Adds an emission hook for a signal, which will get called for any emission
    of that signal, independent of the instance. This is possible only
    for signals which don't have [gid.gobject2.types.SignalFlags.NoHooks] flag set.

    Params:
      signalId = the signal identifier, as returned by [gid.gobject2.global.signalLookup].
      detail = the detail on which to call the hook.
      hookFunc = a #GSignalEmissionHook function.
    Returns: the hook id, for later use with [gid.gobject2.global.signalRemoveEmissionHook].
*/
gulong signalAddEmissionHook(uint signalId, gid.glib2.types.Quark detail, gid.gobject2.types.SignalEmissionHook hookFunc) nothrow
{
  extern(C) gboolean _hookFuncCallback(GSignalInvocationHint* ihint, uint nParamValues, const(GValue)* paramValues, void* data) nothrow
  {
    bool _dretval;
    auto _dlg = cast(gid.gobject2.types.SignalEmissionHook*)data;
    gid.gobject2.value.Value[] _paramValues;
    _paramValues.length = nParamValues;
    foreach (i; 0 .. nParamValues)
      _paramValues[i] = new gid.gobject2.value.Value(cast(GValue*)&paramValues[i], No.Take);

    try
    {
      _dretval = (*_dlg)(*cast(gid.gobject2.types.SignalInvocationHint*)ihint, _paramValues);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.gobject2.types.SignalEmissionHook");
    }
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _hookFuncCB = hookFunc ? &_hookFuncCallback : null;
  gulong _retval;
  auto _hookFunc = hookFunc ? freezeDelegate(cast(void*)&hookFunc) : null;
  GDestroyNotify _hookFuncDestroyCB = hookFunc ? &thawDelegate : null;
  _retval = g_signal_add_emission_hook(signalId, detail, _hookFuncCB, _hookFunc, _hookFuncDestroyCB);
  return _retval;
}

/**
    Connects a closure to a signal for a particular object.
    
    If closure is a floating reference (see [gid.gobject2.closure.Closure.sink]), this function
    takes ownership of closure.
    
    This function cannot fail. If the given signal name doesn’t exist,
    a critical warning is emitted. No validation is performed on the
    ‘detail’ string when specified in detailed_signal, other than a
    non-empty check.
    
    Refer to the [signals documentation](signals.html) for more
    details.

    Params:
      instance = the instance to connect to.
      detailedSignal = a string of the form "signal-name::detail".
      closure = the closure to connect.
      after = whether the handler should be called before or after the
         default handler of the signal.
    Returns: the handler ID (always greater than 0)
*/
gulong signalConnectClosure(gid.gobject2.object.ObjectWrap instance, string detailedSignal, gid.gobject2.closure.Closure closure, bool after) nothrow
{
  gulong _retval;
  const(char)* _detailedSignal = detailedSignal.toCString!(No.Malloc, No.Nullable);
  _retval = g_signal_connect_closure(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, _detailedSignal, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, after);
  return _retval;
}

/**
    Connects a closure to a signal for a particular object.
    
    If closure is a floating reference (see [gid.gobject2.closure.Closure.sink]), this function
    takes ownership of closure.
    
    This function cannot fail. If the given signal name doesn’t exist,
    a critical warning is emitted. No validation is performed on the
    ‘detail’ string when specified in detailed_signal, other than a
    non-empty check.
    
    Refer to the [signals documentation](signals.html) for more
    details.

    Params:
      instance = the instance to connect to.
      signalId = the id of the signal.
      detail = the detail.
      closure = the closure to connect.
      after = whether the handler should be called before or after the
         default handler of the signal.
    Returns: the handler ID (always greater than 0)
*/
gulong signalConnectClosureById(gid.gobject2.object.ObjectWrap instance, uint signalId, gid.glib2.types.Quark detail, gid.gobject2.closure.Closure closure, bool after) nothrow
{
  gulong _retval;
  _retval = g_signal_connect_closure_by_id(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, signalId, detail, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, after);
  return _retval;
}

/**
    Returns the invocation hint of the innermost signal emission of instance.

    Params:
      instance = the instance to query
    Returns: the invocation hint of the innermost
          signal emission, or null if not found.
*/
gid.gobject2.types.SignalInvocationHint signalGetInvocationHint(gid.gobject2.object.ObjectWrap instance) nothrow
{
  GSignalInvocationHint* _cretval;
  _cretval = g_signal_get_invocation_hint(instance ? cast(GObject*)instance._cPtr(No.Dup) : null);
  gid.gobject2.types.SignalInvocationHint _retval;
  if (_cretval)
    _retval = *cast(gid.gobject2.types.SignalInvocationHint*)_cretval;
  return _retval;
}

/**
    Blocks a handler of an instance so it will not be called during any
    signal emissions unless it is unblocked again. Thus "blocking" a
    signal handler means to temporarily deactivate it, a signal handler
    has to be unblocked exactly the same amount of times it has been
    blocked before to become active again.
    
    The handler_id has to be a valid signal handler id, connected to a
    signal of instance.

    Params:
      instance = The instance to block the signal handler of.
      handlerId = Handler id of the handler to be blocked.
*/
void signalHandlerBlock(gid.gobject2.object.ObjectWrap instance, gulong handlerId) nothrow
{
  g_signal_handler_block(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, handlerId);
}

/**
    Finds the first signal handler that matches certain selection criteria.
    The criteria mask is passed as an OR-ed combination of #GSignalMatchType
    flags, and the criteria values are passed as arguments.
    The match mask has to be non-0 for successful matches.
    If no handler was found, 0 is returned.

    Params:
      instance = The instance owning the signal handler to be found.
      mask = Mask indicating which of signal_id, detail, closure, func
         and/or data the handler has to match.
      signalId = Signal the handler has to be connected to.
      detail = Signal detail the handler has to be connected to.
      closure = The closure the handler will invoke.
      func = The C closure callback of the handler (useless for non-C closures).
      data = The closure data of the handler's closure.
    Returns: A valid non-0 signal handler id for a successful match.
*/
gulong signalHandlerFind(gid.gobject2.object.ObjectWrap instance, gid.gobject2.types.SignalMatchType mask, uint signalId, gid.glib2.types.Quark detail, gid.gobject2.closure.Closure closure = null, void* func = null, void* data = null) nothrow
{
  gulong _retval;
  _retval = g_signal_handler_find(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, mask, signalId, detail, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, func, data);
  return _retval;
}

/**
    Returns whether handler_id is the ID of a handler connected to instance.

    Params:
      instance = The instance where a signal handler is sought.
      handlerId = the handler ID.
    Returns: whether handler_id identifies a handler connected to instance.
*/
bool signalHandlerIsConnected(gid.gobject2.object.ObjectWrap instance, gulong handlerId) nothrow
{
  bool _retval;
  _retval = cast(bool)g_signal_handler_is_connected(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, handlerId);
  return _retval;
}

/**
    Undoes the effect of a previous [gid.gobject2.global.signalHandlerBlock] call.  A
    blocked handler is skipped during signal emissions and will not be
    invoked, unblocking it (for exactly the amount of times it has been
    blocked before) reverts its "blocked" state, so the handler will be
    recognized by the signal system and is called upon future or
    currently ongoing signal emissions (since the order in which
    handlers are called during signal emissions is deterministic,
    whether the unblocked handler in question is called as part of a
    currently ongoing emission depends on how far that emission has
    proceeded yet).
    
    The handler_id has to be a valid id of a signal handler that is
    connected to a signal of instance and is currently blocked.

    Params:
      instance = The instance to unblock the signal handler of.
      handlerId = Handler id of the handler to be unblocked.
*/
void signalHandlerUnblock(gid.gobject2.object.ObjectWrap instance, gulong handlerId) nothrow
{
  g_signal_handler_unblock(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, handlerId);
}

/**
    Blocks all handlers on an instance that match a certain selection criteria.
    
    The criteria mask is passed as a combination of #GSignalMatchType flags, and
    the criteria values are passed as arguments. A handler must match on all
    flags set in mask to be blocked (i.e. the match is conjunctive).
    
    Passing at least one of the [gid.gobject2.types.SignalMatchType.Id], [gid.gobject2.types.SignalMatchType.Closure],
    [gid.gobject2.types.SignalMatchType.Func]
    or [gid.gobject2.types.SignalMatchType.Data] match flags is required for successful matches.
    If no handlers were found, 0 is returned, the number of blocked handlers
    otherwise.
    
    Support for [gid.gobject2.types.SignalMatchType.Id] was added in GLib 2.78.

    Params:
      instance = The instance to block handlers from.
      mask = Mask indicating which of signal_id, detail, closure, func
         and/or data the handlers have to match.
      signalId = Signal the handlers have to be connected to.
      detail = Signal detail the handlers have to be connected to.
      closure = The closure the handlers will invoke.
      func = The C closure callback of the handlers (useless for non-C closures).
      data = The closure data of the handlers' closures.
    Returns: The number of handlers that matched.
*/
uint signalHandlersBlockMatched(gid.gobject2.object.ObjectWrap instance, gid.gobject2.types.SignalMatchType mask, uint signalId, gid.glib2.types.Quark detail, gid.gobject2.closure.Closure closure = null, void* func = null, void* data = null) nothrow
{
  uint _retval;
  _retval = g_signal_handlers_block_matched(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, mask, signalId, detail, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, func, data);
  return _retval;
}

/**
    Disconnects all handlers on an instance that match a certain
    selection criteria.
    
    The criteria mask is passed as a combination of #GSignalMatchType flags, and
    the criteria values are passed as arguments. A handler must match on all
    flags set in mask to be disconnected (i.e. the match is conjunctive).
    
    Passing at least one of the [gid.gobject2.types.SignalMatchType.Id], [gid.gobject2.types.SignalMatchType.Closure],
    [gid.gobject2.types.SignalMatchType.Func] or
    [gid.gobject2.types.SignalMatchType.Data] match flags is required for successful
    matches.  If no handlers were found, 0 is returned, the number of
    disconnected handlers otherwise.
    
    Support for [gid.gobject2.types.SignalMatchType.Id] was added in GLib 2.78.

    Params:
      instance = The instance to remove handlers from.
      mask = Mask indicating which of signal_id, detail, closure, func
         and/or data the handlers have to match.
      signalId = Signal the handlers have to be connected to.
      detail = Signal detail the handlers have to be connected to.
      closure = The closure the handlers will invoke.
      func = The C closure callback of the handlers (useless for non-C closures).
      data = The closure data of the handlers' closures.
    Returns: The number of handlers that matched.
*/
uint signalHandlersDisconnectMatched(gid.gobject2.object.ObjectWrap instance, gid.gobject2.types.SignalMatchType mask, uint signalId, gid.glib2.types.Quark detail, gid.gobject2.closure.Closure closure = null, void* func = null, void* data = null) nothrow
{
  uint _retval;
  _retval = g_signal_handlers_disconnect_matched(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, mask, signalId, detail, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, func, data);
  return _retval;
}

/**
    Unblocks all handlers on an instance that match a certain selection
    criteria.
    
    The criteria mask is passed as a combination of #GSignalMatchType flags, and
    the criteria values are passed as arguments. A handler must match on all
    flags set in mask to be unblocked (i.e. the match is conjunctive).
    
    Passing at least one of the [gid.gobject2.types.SignalMatchType.Id], [gid.gobject2.types.SignalMatchType.Closure],
    [gid.gobject2.types.SignalMatchType.Func]
    or [gid.gobject2.types.SignalMatchType.Data] match flags is required for successful matches.
    If no handlers were found, 0 is returned, the number of unblocked handlers
    otherwise. The match criteria should not apply to any handlers that are
    not currently blocked.
    
    Support for [gid.gobject2.types.SignalMatchType.Id] was added in GLib 2.78.

    Params:
      instance = The instance to unblock handlers from.
      mask = Mask indicating which of signal_id, detail, closure, func
         and/or data the handlers have to match.
      signalId = Signal the handlers have to be connected to.
      detail = Signal detail the handlers have to be connected to.
      closure = The closure the handlers will invoke.
      func = The C closure callback of the handlers (useless for non-C closures).
      data = The closure data of the handlers' closures.
    Returns: The number of handlers that matched.
*/
uint signalHandlersUnblockMatched(gid.gobject2.object.ObjectWrap instance, gid.gobject2.types.SignalMatchType mask, uint signalId, gid.glib2.types.Quark detail, gid.gobject2.closure.Closure closure = null, void* func = null, void* data = null) nothrow
{
  uint _retval;
  _retval = g_signal_handlers_unblock_matched(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, mask, signalId, detail, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, func, data);
  return _retval;
}

/**
    Returns whether there are any handlers connected to instance for the
    given signal id and detail.
    
    If detail is 0 then it will only match handlers that were connected
    without detail.  If detail is non-zero then it will match handlers
    connected both without detail and with the given detail.  This is
    consistent with how a signal emitted with detail would be delivered
    to those handlers.
    
    Since 2.46 this also checks for a non-default class closure being
    installed, as this is basically always what you want.
    
    One example of when you might use this is when the arguments to the
    signal are difficult to compute. A class implementor may opt to not
    emit the signal if no one is attached anyway, thus saving the cost
    of building the arguments.

    Params:
      instance = the object whose signal handlers are sought.
      signalId = the signal id.
      detail = the detail.
      mayBeBlocked = whether blocked handlers should count as match.
    Returns: true if a handler is connected to the signal, false
               otherwise.
*/
bool signalHasHandlerPending(gid.gobject2.object.ObjectWrap instance, uint signalId, gid.glib2.types.Quark detail, bool mayBeBlocked) nothrow
{
  bool _retval;
  _retval = cast(bool)g_signal_has_handler_pending(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, signalId, detail, mayBeBlocked);
  return _retval;
}

/**
    Validate a signal name. This can be useful for dynamically-generated signals
    which need to be validated at run-time before actually trying to create them.
    
    See `funcGObject.signal_new` for details of the rules for valid names.
    The rules for signal names are the same as those for property names.

    Params:
      name = the canonical name of the signal
    Returns: true if name is a valid signal name, false otherwise.
*/
bool signalIsValidName(string name) nothrow
{
  bool _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)g_signal_is_valid_name(_name);
  return _retval;
}

/**
    Lists the signals by id that a certain instance or interface type
    created. Further information about the signals can be acquired through
    [gid.gobject2.global.signalQuery].

    Params:
      itype = Instance or interface type.
    Returns: Newly allocated array of signal IDs.
*/
uint[] signalListIds(gid.gobject2.types.GType itype) nothrow
{
  uint* _cretval;
  uint _cretlength;
  _cretval = g_signal_list_ids(itype, &_cretlength);
  uint[] _retval;

  if (_cretval)
  {
    _retval = cast(uint[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Given the name of the signal and the type of object it connects to, gets
    the signal's identifying integer. Emitting the signal by number is
    somewhat faster than using the name each time.
    
    Also tries the ancestors of the given type.
    
    The type class passed as itype must already have been instantiated (for
    example, using [gid.gobject2.type_class.TypeClass.ref_]) for this function to work, as signals are
    always installed during class initialization.
    
    See [gid.gobject2.global.signalNew] for details on allowed signal names.

    Params:
      name = the signal's name.
      itype = the type that the signal operates on.
    Returns: the signal's identifying number, or 0 if no signal was found.
*/
uint signalLookup(string name, gid.gobject2.types.GType itype) nothrow
{
  uint _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = g_signal_lookup(_name, itype);
  return _retval;
}

/**
    Given the signal's identifier, finds its name.
    
    Two different signals may have the same name, if they have differing types.

    Params:
      signalId = the signal's identifying number.
    Returns: the signal name, or null if the signal number was invalid.
*/
string signalName(uint signalId) nothrow
{
  const(char)* _cretval;
  _cretval = g_signal_name(signalId);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Overrides the class closure (i.e. the default handler) for the given signal
    for emissions on instances of instance_type. instance_type must be derived
    from the type to which the signal belongs.
    
    See [gid.gobject2.global.signalChainFromOverridden] and
    [gid.gobject2.global.signalChainFromOverriddenHandler] for how to chain up to the
    parent class closure from inside the overridden one.

    Params:
      signalId = the signal id
      instanceType = the instance type on which to override the class closure
         for the signal.
      classClosure = the closure.
*/
void signalOverrideClassClosure(uint signalId, gid.gobject2.types.GType instanceType, gid.gobject2.closure.Closure classClosure) nothrow
{
  g_signal_override_class_closure(signalId, instanceType, classClosure ? cast(GClosure*)classClosure._cPtr(No.Dup) : null);
}

/**
    Internal function to parse a signal name into its signal_id
    and detail quark.

    Params:
      detailedSignal = a string of the form "signal-name::detail".
      itype = The interface/instance type that introduced "signal-name".
      signalIdP = Location to store the signal id.
      detailP = Location to store the detail quark.
      forceDetailQuark = true forces creation of a #GQuark for the detail.
    Returns: Whether the signal name could successfully be parsed and signal_id_p and detail_p contain valid return values.
*/
bool signalParseName(string detailedSignal, gid.gobject2.types.GType itype, out uint signalIdP, out gid.glib2.types.Quark detailP, bool forceDetailQuark) nothrow
{
  bool _retval;
  const(char)* _detailedSignal = detailedSignal.toCString!(No.Malloc, No.Nullable);
  _retval = cast(bool)g_signal_parse_name(_detailedSignal, itype, cast(uint*)&signalIdP, cast(GQuark*)&detailP, forceDetailQuark);
  return _retval;
}

/**
    Queries the signal system for in-depth information about a
    specific signal. This function will fill in a user-provided
    structure to hold signal-specific information. If an invalid
    signal id is passed in, the signal_id member of the #GSignalQuery
    is 0. All members filled into the #GSignalQuery structure should
    be considered constant and have to be left untouched.

    Params:
      signalId = The signal id of the signal to query information for.
      query = A user provided structure that is
         filled in with constant values upon success.
*/
void signalQuery(uint signalId, out gid.gobject2.signal_query.SignalQuery query) nothrow
{
  GSignalQuery _query;
  g_signal_query(signalId, &_query);
  query = new gid.gobject2.signal_query.SignalQuery(cast(void*)&_query, No.Take);
}

/**
    Deletes an emission hook.

    Params:
      signalId = the id of the signal
      hookId = the id of the emission hook, as returned by
         [gid.gobject2.global.signalAddEmissionHook]
*/
void signalRemoveEmissionHook(uint signalId, gulong hookId) nothrow
{
  g_signal_remove_emission_hook(signalId, hookId);
}

/**
    Stops a signal's current emission.
    
    This will prevent the default method from running, if the signal was
    [gid.gobject2.types.SignalFlags.RunLast] and you connected normally (i.e. without the "after"
    flag).
    
    Prints a warning if used on a signal which isn't being emitted.

    Params:
      instance = the object whose signal handlers you wish to stop.
      signalId = the signal identifier, as returned by [gid.gobject2.global.signalLookup].
      detail = the detail which the signal was emitted with.
*/
void signalStopEmission(gid.gobject2.object.ObjectWrap instance, uint signalId, gid.glib2.types.Quark detail) nothrow
{
  g_signal_stop_emission(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, signalId, detail);
}

/**
    Stops a signal's current emission.
    
    This is just like [gid.gobject2.global.signalStopEmission] except it will look up the
    signal id for you.

    Params:
      instance = the object whose signal handlers you wish to stop.
      detailedSignal = a string of the form "signal-name::detail".
*/
void signalStopEmissionByName(gid.gobject2.object.ObjectWrap instance, string detailedSignal) nothrow
{
  const(char)* _detailedSignal = detailedSignal.toCString!(No.Malloc, No.Nullable);
  g_signal_stop_emission_by_name(instance ? cast(GObject*)instance._cPtr(No.Dup) : null, _detailedSignal);
}

/**
    Creates a new closure which invokes the function found at the offset
    struct_offset in the class structure of the interface or classed type
    identified by itype.

    Params:
      itype = the #GType identifier of an interface or classed type
      structOffset = the offset of the member function of itype's class
         structure which is to be invoked by the new closure
    Returns: a floating reference to a new #GCClosure
*/
gid.gobject2.closure.Closure signalTypeCclosureNew(gid.gobject2.types.GType itype, uint structOffset) nothrow
{
  GClosure* _cretval;
  _cretval = g_signal_type_cclosure_new(itype, structOffset);
  auto _retval = _cretval ? new gid.gobject2.closure.Closure(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Return a newly allocated string, which describes the contents of a
    #GValue.  The main purpose of this function is to describe #GValue
    contents for debugging output, the way in which the contents are
    described may change between different GLib versions.

    Params:
      value = #GValue which contents are to be described.
    Returns: Newly allocated string.
*/
string strdupValueContents(gid.gobject2.value.Value value) nothrow
{
  char* _cretval;
  _cretval = g_strdup_value_contents(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Registers a private class structure for a classed type;
    when the class is allocated, the private structures for
    the class and all of its parent types are allocated
    sequentially in the same memory block as the public
    structures, and are zero-filled.
    
    This function should be called in the
    type's get_type() function after the type is registered.
    The private structure can be retrieved using the
    G_TYPE_CLASS_GET_PRIVATE() macro.

    Params:
      classType = GType of a classed type
      privateSize = size of private structure
*/
void typeAddClassPrivate(gid.gobject2.types.GType classType, size_t privateSize) nothrow
{
  g_type_add_class_private(classType, privateSize);
}

/** */
int typeAddInstancePrivate(gid.gobject2.types.GType classType, size_t privateSize) nothrow
{
  int _retval;
  _retval = g_type_add_instance_private(classType, privateSize);
  return _retval;
}

/**
    Private helper function to aid implementation of the
    G_TYPE_CHECK_INSTANCE() macro.

    Params:
      instance = a valid #GTypeInstance structure
    Returns: true if instance is valid, false otherwise
*/
bool typeCheckInstance(gid.gobject2.type_instance.TypeInstance instance) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_instance(instance ? cast(GTypeInstance*)instance._cPtr : null);
  return _retval;
}

/** */
bool typeCheckInstanceIsA(gid.gobject2.type_instance.TypeInstance instance, gid.gobject2.types.GType ifaceType) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_instance_is_a(instance ? cast(GTypeInstance*)instance._cPtr : null, ifaceType);
  return _retval;
}

/** */
bool typeCheckInstanceIsFundamentallyA(gid.gobject2.type_instance.TypeInstance instance, gid.gobject2.types.GType fundamentalType) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_instance_is_fundamentally_a(instance ? cast(GTypeInstance*)instance._cPtr : null, fundamentalType);
  return _retval;
}

/** */
bool typeCheckIsValueType(gid.gobject2.types.GType type) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_is_value_type(type);
  return _retval;
}

/** */
bool typeCheckValue(gid.gobject2.value.Value value) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool typeCheckValueHolds(gid.gobject2.value.Value value, gid.gobject2.types.GType type) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_check_value_holds(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, type);
  return _retval;
}

/**
    Return a newly allocated and 0-terminated array of type IDs, listing
    the child types of type.

    Params:
      type = the parent type
    Returns: Newly allocated
          and 0-terminated array of child types, free with [gid.glib2.global.gfree]
*/
gid.gobject2.types.GType[] typeChildren(gid.gobject2.types.GType type) nothrow
{
  GType* _cretval;
  uint _cretlength;
  _cretval = g_type_children(type, &_cretlength);
  gid.gobject2.types.GType[] _retval;

  if (_cretval)
  {
    _retval = cast(gid.gobject2.types.GType[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Returns the length of the ancestry of the passed in type. This
    includes the type itself, so that e.g. a fundamental type has depth 1.

    Params:
      type = a #GType
    Returns: the depth of type
*/
uint typeDepth(gid.gobject2.types.GType type) nothrow
{
  uint _retval;
  _retval = g_type_depth(type);
  return _retval;
}

/**
    Ensures that the indicated type has been registered with the
    type system, and its _class_init() method has been run.
    
    In theory, simply calling the type's _get_type() method (or using
    the corresponding macro) is supposed take care of this. However,
    _get_type() methods are often marked `G_GNUC_CONST` for performance
    reasons, even though this is technically incorrect (since
    `G_GNUC_CONST` requires that the function not have side effects,
    which _get_type() methods do on the first call). As a result, if
    you write a bare call to a _get_type() macro, it may get optimized
    out by the compiler. Using [gid.gobject2.global.typeEnsure] guarantees that the
    type's _get_type() method is called.

    Params:
      type = a #GType
*/
void typeEnsure(gid.gobject2.types.GType type) nothrow
{
  g_type_ensure(type);
}

/**
    Frees an instance of a type, returning it to the instance pool for
    the type, if there is one.
    
    Like [gid.gobject2.global.typeCreateInstance], this function is reserved for
    implementors of fundamental types.

    Params:
      instance = an instance of a type
*/
void typeFreeInstance(gid.gobject2.type_instance.TypeInstance instance) nothrow
{
  g_type_free_instance(instance ? cast(GTypeInstance*)instance._cPtr : null);
}

/**
    Look up the type ID from a given type name, returning 0 if no type
    has been registered under this name (this is the preferred method
    to find out by name whether a specific type has been registered
    yet).

    Params:
      name = type name to look up
    Returns: corresponding type ID or 0
*/
gid.gobject2.types.GType typeFromName(string name) nothrow
{
  gid.gobject2.types.GType _retval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _retval = g_type_from_name(_name);
  return _retval;
}

/**
    Internal function, used to extract the fundamental type ID portion.
    Use G_TYPE_FUNDAMENTAL() instead.

    Params:
      typeId = valid type ID
    Returns: fundamental type ID
*/
gid.gobject2.types.GType typeFundamental(gid.gobject2.types.GType typeId) nothrow
{
  gid.gobject2.types.GType _retval;
  _retval = g_type_fundamental(typeId);
  return _retval;
}

/**
    Returns the next free fundamental type id which can be used to
    register a new fundamental type with [gid.gobject2.global.typeRegisterFundamental].
    The returned type ID represents the highest currently registered
    fundamental type identifier.
    Returns: the next available fundamental type ID to be registered,
          or 0 if the type system ran out of fundamental type IDs
*/
gid.gobject2.types.GType typeFundamentalNext() nothrow
{
  gid.gobject2.types.GType _retval;
  _retval = g_type_fundamental_next();
  return _retval;
}

/**
    Returns the number of instances allocated of the particular type;
    this is only available if GLib is built with debugging support and
    the `instance-count` debug flag is set (by setting the `GOBJECT_DEBUG`
    variable to include `instance-count`).

    Params:
      type = a #GType
    Returns: the number of instances allocated of the given type;
        if instance counts are not available, returns 0.
*/
int typeGetInstanceCount(gid.gobject2.types.GType type) nothrow
{
  int _retval;
  _retval = g_type_get_instance_count(type);
  return _retval;
}

/**
    Obtains data which has previously been attached to type
    with [gid.gobject2.global.typeSetQdata].
    
    Note that this does not take subtyping into account; data
    attached to one type with [gid.gobject2.global.typeSetQdata] cannot
    be retrieved from a subtype using [gid.gobject2.global.typeGetQdata].

    Params:
      type = a #GType
      quark = a #GQuark id to identify the data
    Returns: the data, or null if no data was found
*/
void* typeGetQdata(gid.gobject2.types.GType type, gid.glib2.types.Quark quark) nothrow
{
  auto _retval = g_type_get_qdata(type, quark);
  return _retval;
}

/**
    Returns an opaque serial number that represents the state of the set
    of registered types. Any time a type is registered this serial changes,
    which means you can cache information based on type lookups (such as
    [gid.gobject2.global.typeFromName]) and know if the cache is still valid at a later
    time by comparing the current serial with the one at the type lookup.
    Returns: An unsigned int, representing the state of type registrations
*/
uint typeGetTypeRegistrationSerial() nothrow
{
  uint _retval;
  _retval = g_type_get_type_registration_serial();
  return _retval;
}

/**
    This function used to initialise the type system.  Since GLib 2.36,
    the type system is initialised automatically and this function does
    nothing.

    Deprecated: the type system is now initialised automatically
*/
void typeInit() nothrow
{
  g_type_init();
}

/**
    This function used to initialise the type system with debugging
    flags.  Since GLib 2.36, the type system is initialised automatically
    and this function does nothing.
    
    If you need to enable debugging features, use the `GOBJECT_DEBUG`
    environment variable.

    Params:
      debugFlags = bitwise combination of #GTypeDebugFlags values for
            debugging purposes

    Deprecated: the type system is now initialised automatically
*/
void typeInitWithDebugFlags(gid.gobject2.types.TypeDebugFlags debugFlags) nothrow
{
  g_type_init_with_debug_flags(debugFlags);
}

/**
    Return a newly allocated and 0-terminated array of type IDs, listing
    the interface types that type conforms to.

    Params:
      type = the type to list interface types for
    Returns: Newly allocated
          and 0-terminated array of interface types, free with [gid.glib2.global.gfree]
*/
gid.gobject2.types.GType[] typeInterfaces(gid.gobject2.types.GType type) nothrow
{
  GType* _cretval;
  uint _cretlength;
  _cretval = g_type_interfaces(type, &_cretlength);
  gid.gobject2.types.GType[] _retval;

  if (_cretval)
  {
    _retval = cast(gid.gobject2.types.GType[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    If is_a_type is a derivable type, check whether type is a
    descendant of is_a_type. If is_a_type is an interface, check
    whether type conforms to it.

    Params:
      type = type to check ancestry for
      isAType = possible ancestor of type or interface that type
            could conform to
    Returns: true if type is a is_a_type
*/
bool typeIsA(gid.gobject2.types.GType type, gid.gobject2.types.GType isAType) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_is_a(type, isAType);
  return _retval;
}

/**
    Get the unique name that is assigned to a type ID.
    
    Note that this function (like all other GType API) cannot cope with
    invalid type IDs. `G_TYPE_INVALID` may be passed to this function, as
    may be any other validly registered type ID, but randomized type IDs
    should not be passed in and will most likely lead to a crash.

    Params:
      type = type to return name for
    Returns: static type name or null
*/
string typeName(gid.gobject2.types.GType type) nothrow
{
  const(char)* _cretval;
  _cretval = g_type_name(type);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/** */
string typeNameFromInstance(gid.gobject2.type_instance.TypeInstance instance) nothrow
{
  const(char)* _cretval;
  _cretval = g_type_name_from_instance(instance ? cast(GTypeInstance*)instance._cPtr : null);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Given a leaf_type and a root_type which is contained in its
    ancestry, return the type that root_type is the immediate parent
    of. In other words, this function determines the type that is
    derived directly from root_type which is also a base class of
    leaf_type.  Given a root type and a leaf type, this function can
    be used to determine the types and order in which the leaf type is
    descended from the root type.

    Params:
      leafType = descendant of root_type and the type to be returned
      rootType = immediate parent of the returned type
    Returns: immediate child of root_type and ancestor of leaf_type
*/
gid.gobject2.types.GType typeNextBase(gid.gobject2.types.GType leafType, gid.gobject2.types.GType rootType) nothrow
{
  gid.gobject2.types.GType _retval;
  _retval = g_type_next_base(leafType, rootType);
  return _retval;
}

/**
    Return the direct parent type of the passed in type. If the passed
    in type has no parent, i.e. is a fundamental type, 0 is returned.

    Params:
      type = the derived type
    Returns: the parent type
*/
gid.gobject2.types.GType typeParent(gid.gobject2.types.GType type) nothrow
{
  gid.gobject2.types.GType _retval;
  _retval = g_type_parent(type);
  return _retval;
}

/**
    Get the corresponding quark of the type IDs name.

    Params:
      type = type to return quark of type name for
    Returns: the type names quark or 0
*/
gid.glib2.types.Quark typeQname(gid.gobject2.types.GType type) nothrow
{
  gid.glib2.types.Quark _retval;
  _retval = g_type_qname(type);
  return _retval;
}

/**
    Queries the type system for information about a specific type.
    
    This function will fill in a user-provided structure to hold
    type-specific information. If an invalid #GType is passed in, the
    type member of the #GTypeQuery is 0. All members filled into the
    #GTypeQuery structure should be considered constant and have to be
    left untouched.
    
    Since GLib 2.78, this function allows queries on dynamic types. Previously
    it only supported static types.

    Params:
      type = #GType of a static, classed type
      query = a user provided structure that is
            filled in with constant values upon success
*/
void typeQuery(gid.gobject2.types.GType type, out gid.gobject2.type_query.TypeQuery query) nothrow
{
  GTypeQuery _query;
  g_type_query(type, &_query);
  query = new gid.gobject2.type_query.TypeQuery(cast(void*)&_query, No.Take);
}

/**
    Attaches arbitrary data to a type.

    Params:
      type = a #GType
      quark = a #GQuark id to identify the data
      data = the data
*/
void typeSetQdata(gid.gobject2.types.GType type, gid.glib2.types.Quark quark, void* data = null) nothrow
{
  g_type_set_qdata(type, quark, data);
}

/** */
bool typeTestFlags(gid.gobject2.types.GType type, uint flags) nothrow
{
  bool _retval;
  _retval = cast(bool)g_type_test_flags(type, flags);
  return _retval;
}
