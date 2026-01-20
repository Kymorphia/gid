/// Module for [Value] class
module gobject.value;

import gid.gid;
import glib.variant;
import gobject.boxed;
import gobject.c.functions;
import gobject.c.types;
import gobject.object;
import gobject.param_spec;
import gobject.type_instance;
import gobject.types;


import std.traits : isPointer;

import gobject.object;
import gobject.types;

/**
* Abstract class used as the base for GObject boxed types.
*/
/**
    An opaque structure used to hold different types of values.
    
    The data within the structure has protected scope: it is accessible only
    to functions within a #GTypeValueTable structure, or implementations of
    the g_value_*() API. That is, code portions which implement new fundamental
    types.
    
    #GValue users cannot make any assumptions about how data is stored
    within the 2 element @data union, and the @g_type member should
    only be accessed through the G_VALUE_TYPE() macro.
*/
class Value : Boxed
{

  /**
      Create a `value.Value` boxed type.
  */
  this()
  {
    super(gMalloc(GValue.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_value_get_type != &gidSymbolNotFound ? g_value_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Value self()
  {
    return this;
  }

  /**
  * Template to create a new Value from a D type.
  * Params:
  *   T = The D type to initialize the value to
  *   val = The value to assign
  */
  this(T)(T val)
  if (!is(T == void*))
  {
    this();
    init_!T();
    set!T(val);
  }

  /**
  * Template to initialize a Value to a D type.
  * Params:
  *   T = The D type to initialize the Value to
  */
  void init_(T)()
  {
    initVal!T(cast(GValue*)_cPtr);
  }

  /**
  * Get the GType of the data stored in the value.
  * Returns: The GType of the value
  */
  @property GType valType()
  {
    return (cast(GValue*)_cPtr).gType;
  }

  /**
  * Template to get a Value of a specific type.
  * Params:
  *   T = The D type of the value to get (must match the type of the Value)
  * Returns: The value
  */
  T get(T)()
  {
    return getVal!T(cast(GValue*)_cPtr);
  }

  /**
  * Template to set a Value of a specific type.
  * Params:
  *   T = The D type of the value to set (must match the type of the Value)
  *   val = The value to assign
  */
  void set(T)(T val)
  {
    setVal!T(cast(GValue*)_cPtr, val);
  }

  /**
      Copies the value of src_value into dest_value.
  
      Params:
        destValue = An initialized #GValue structure of the same type as src_value.
  */
  void copy(gobject.value.Value destValue)
  {
    g_value_copy(cast(const(GValue)*)this._cPtr, destValue ? cast(GValue*)destValue._cPtr(No.Dup) : null);
  }

  /**
      Get the contents of a `G_TYPE_OBJECT` derived #GValue, increasing
      its reference count. If the contents of the #GValue are null, then
      null will be returned.
      Returns: object content of value,
                 should be unreferenced when no longer needed.
  */
  gobject.object.ObjectWrap dupObject()
  {
    GObject* _cretval;
    _cretval = g_value_dup_object(cast(const(GValue)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a copy the contents of a `G_TYPE_STRING` #GValue.
      Returns: a newly allocated copy of the string content of value
  */
  string dupString()
  {
    char* _cretval;
    _cretval = g_value_dup_string(cast(const(GValue)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the contents of a variant #GValue, increasing its refcount. The returned
      #GVariant is never floating.
      Returns: variant contents of value (may be null);
           should be unreffed using [glib.variant.Variant.unref] when no longer needed
  */
  glib.variant.Variant dupVariant()
  {
    GVariant* _cretval;
    _cretval = g_value_dup_variant(cast(const(GValue)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Determines if value will fit inside the size of a pointer value.
      This is an internal function introduced mainly for C marshallers.
      Returns: true if value will fit inside a pointer value.
  */
  bool fitsPointer()
  {
    bool _retval;
    _retval = cast(bool)g_value_fits_pointer(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_BOOLEAN` #GValue.
      Returns: boolean contents of value
  */
  bool getBoolean()
  {
    bool _retval;
    _retval = cast(bool)g_value_get_boolean(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_BOXED` derived #GValue.
      Returns: boxed contents of value
  */
  void* getBoxed()
  {
    auto _retval = g_value_get_boxed(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Do not use this function; it is broken on platforms where the [glib.types.char]
      type is unsigned, such as ARM and PowerPC.  See [gobject.value.Value.getSchar].
      
      Get the contents of a `G_TYPE_CHAR` #GValue.
      Returns: character contents of value
  
      Deprecated: This function's return type is broken, see [gobject.value.Value.getSchar]
  */
  char getChar()
  {
    char _retval;
    _retval = g_value_get_char(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_DOUBLE` #GValue.
      Returns: double contents of value
  */
  double getDouble()
  {
    double _retval;
    _retval = g_value_get_double(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_ENUM` #GValue.
      Returns: enum contents of value
  */
  int getEnum()
  {
    int _retval;
    _retval = g_value_get_enum(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_FLAGS` #GValue.
      Returns: flags contents of value
  */
  uint getFlags()
  {
    uint _retval;
    _retval = g_value_get_flags(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_FLOAT` #GValue.
      Returns: float contents of value
  */
  float getFloat()
  {
    float _retval;
    _retval = g_value_get_float(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_GTYPE` #GValue.
      Returns: the #GType stored in value
  */
  gobject.types.GType getGtype()
  {
    gobject.types.GType _retval;
    _retval = g_value_get_gtype(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_INT` #GValue.
      Returns: integer contents of value
  */
  int getInt()
  {
    int _retval;
    _retval = g_value_get_int(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_INT64` #GValue.
      Returns: 64bit integer contents of value
  */
  long getInt64()
  {
    long _retval;
    _retval = g_value_get_int64(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_LONG` #GValue.
      Returns: long integer contents of value
  */
  glong getLong()
  {
    glong _retval;
    _retval = g_value_get_long(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_OBJECT` derived #GValue.
      Returns: object contents of value
  */
  gobject.object.ObjectWrap getObject()
  {
    GObject* _cretval;
    _cretval = g_value_get_object(cast(const(GValue)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_PARAM` #GValue.
      Returns: #GParamSpec content of value
  */
  gobject.param_spec.ParamSpec getParam()
  {
    GParamSpec* _cretval;
    _cretval = g_value_get_param(cast(const(GValue)*)this._cPtr);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the contents of a pointer #GValue.
      Returns: pointer contents of value
  */
  void* getPointer()
  {
    auto _retval = g_value_get_pointer(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_CHAR` #GValue.
      Returns: signed 8 bit integer contents of value
  */
  byte getSchar()
  {
    byte _retval;
    _retval = g_value_get_schar(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_STRING` #GValue.
      Returns: string content of value
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = g_value_get_string(cast(const(GValue)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_UCHAR` #GValue.
      Returns: unsigned character contents of value
  */
  ubyte getUchar()
  {
    ubyte _retval;
    _retval = g_value_get_uchar(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_UINT` #GValue.
      Returns: unsigned integer contents of value
  */
  uint getUint()
  {
    uint _retval;
    _retval = g_value_get_uint(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_UINT64` #GValue.
      Returns: unsigned 64bit integer contents of value
  */
  ulong getUint64()
  {
    ulong _retval;
    _retval = g_value_get_uint64(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a `G_TYPE_ULONG` #GValue.
      Returns: unsigned long integer contents of value
  */
  gulong getUlong()
  {
    gulong _retval;
    _retval = g_value_get_ulong(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Get the contents of a variant #GValue.
      Returns: variant contents of value (may be null)
  */
  glib.variant.Variant getVariant()
  {
    GVariant* _cretval;
    _cretval = g_value_get_variant(cast(const(GValue)*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes value with the default value of type.
  
      Params:
        gType = Type the #GValue should hold values of.
      Returns: the #GValue structure that has been passed in
  */
  gobject.value.Value init_(gobject.types.GType gType)
  {
    GValue* _cretval;
    _cretval = g_value_init(cast(GValue*)this._cPtr, gType);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes and sets value from an instantiatable type via the
      value_table's collect_value() function.
      
      Note: The value will be initialised with the exact type of
      instance.  If you wish to set the value's type to a different GType
      (such as a parent class GType), you need to manually call
      [gobject.value.Value.init_] and [gobject.value.Value.setInstance].
  
      Params:
        instance = the instance
  */
  void initFromInstance(gobject.type_instance.TypeInstance instance)
  {
    g_value_init_from_instance(cast(GValue*)this._cPtr, instance ? cast(GTypeInstance*)instance._cPtr : null);
  }

  /**
      Returns the value contents as pointer. This function asserts that
      [gobject.value.Value.fitsPointer] returned true for the passed in value.
      This is an internal function introduced mainly for C marshallers.
      Returns: the value contents as pointer
  */
  void* peekPointer()
  {
    auto _retval = g_value_peek_pointer(cast(const(GValue)*)this._cPtr);
    return _retval;
  }

  /**
      Clears the current value in value and resets it to the default value
      (as if the value had just been initialized).
      Returns: the #GValue structure that has been passed in
  */
  gobject.value.Value reset()
  {
    GValue* _cretval;
    _cretval = g_value_reset(cast(GValue*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the contents of a `G_TYPE_BOOLEAN` #GValue to v_boolean.
  
      Params:
        vBoolean = boolean value to be set
  */
  void setBoolean(bool vBoolean)
  {
    g_value_set_boolean(cast(GValue*)this._cPtr, vBoolean);
  }

  /**
      Set the contents of a `G_TYPE_BOXED` derived #GValue to v_boxed.
  
      Params:
        vBoxed = boxed value to be set
  */
  void setBoxed(const(void)* vBoxed = null)
  {
    g_value_set_boxed(cast(GValue*)this._cPtr, vBoxed);
  }

  /**
      This is an internal function introduced mainly for C marshallers.
  
      Params:
        vBoxed = duplicated unowned boxed value to be set
  
      Deprecated: Use [gobject.value.Value.takeBoxed] instead.
  */
  void setBoxedTakeOwnership(const(void)* vBoxed = null)
  {
    g_value_set_boxed_take_ownership(cast(GValue*)this._cPtr, vBoxed);
  }

  /**
      Set the contents of a `G_TYPE_CHAR` #GValue to v_char.
  
      Params:
        vChar = character value to be set
  
      Deprecated: This function's input type is broken, see [gobject.value.Value.setSchar]
  */
  void setChar(char vChar)
  {
    g_value_set_char(cast(GValue*)this._cPtr, vChar);
  }

  /**
      Set the contents of a `G_TYPE_DOUBLE` #GValue to v_double.
  
      Params:
        vDouble = double value to be set
  */
  void setDouble(double vDouble)
  {
    g_value_set_double(cast(GValue*)this._cPtr, vDouble);
  }

  /**
      Set the contents of a `G_TYPE_ENUM` #GValue to v_enum.
  
      Params:
        vEnum = enum value to be set
  */
  void setEnum(int vEnum)
  {
    g_value_set_enum(cast(GValue*)this._cPtr, vEnum);
  }

  /**
      Set the contents of a `G_TYPE_FLAGS` #GValue to v_flags.
  
      Params:
        vFlags = flags value to be set
  */
  void setFlags(uint vFlags)
  {
    g_value_set_flags(cast(GValue*)this._cPtr, vFlags);
  }

  /**
      Set the contents of a `G_TYPE_FLOAT` #GValue to v_float.
  
      Params:
        vFloat = float value to be set
  */
  void setFloat(float vFloat)
  {
    g_value_set_float(cast(GValue*)this._cPtr, vFloat);
  }

  /**
      Set the contents of a `G_TYPE_GTYPE` #GValue to v_gtype.
  
      Params:
        vGtype = #GType to be set
  */
  void setGtype(gobject.types.GType vGtype)
  {
    g_value_set_gtype(cast(GValue*)this._cPtr, vGtype);
  }

  /**
      Sets value from an instantiatable type via the
      value_table's collect_value() function.
  
      Params:
        instance = the instance
  */
  void setInstance(void* instance = null)
  {
    g_value_set_instance(cast(GValue*)this._cPtr, instance);
  }

  /**
      Set the contents of a `G_TYPE_INT` #GValue to v_int.
  
      Params:
        vInt = integer value to be set
  */
  void setInt(int vInt)
  {
    g_value_set_int(cast(GValue*)this._cPtr, vInt);
  }

  /**
      Set the contents of a `G_TYPE_INT64` #GValue to v_int64.
  
      Params:
        vInt64 = 64bit integer value to be set
  */
  void setInt64(long vInt64)
  {
    g_value_set_int64(cast(GValue*)this._cPtr, vInt64);
  }

  /**
      Set the contents of a `G_TYPE_STRING` #GValue to v_string.  The string is
      assumed to be static and interned (canonical, for example from
      [glib.global.internString]), and is thus not duplicated when setting the #GValue.
  
      Params:
        vString = static string to be set
  */
  void setInternedString(string vString = null)
  {
    const(char)* _vString = vString.toCString(No.Alloc);
    g_value_set_interned_string(cast(GValue*)this._cPtr, _vString);
  }

  /**
      Set the contents of a `G_TYPE_LONG` #GValue to v_long.
  
      Params:
        vLong = long integer value to be set
  */
  void setLong(glong vLong)
  {
    g_value_set_long(cast(GValue*)this._cPtr, vLong);
  }

  /**
      Set the contents of a `G_TYPE_OBJECT` derived #GValue to v_object.
      
      [gobject.value.Value.setObject] increases the reference count of v_object
      (the #GValue holds a reference to v_object).  If you do not wish
      to increase the reference count of the object (i.e. you wish to
      pass your current reference to the #GValue because you no longer
      need it), use [gobject.value.Value.takeObject] instead.
      
      It is important that your #GValue holds a reference to v_object (either its
      own, or one it has taken) to ensure that the object won't be destroyed while
      the #GValue still exists).
  
      Params:
        vObject = object value to be set
  */
  void setObject(gobject.object.ObjectWrap vObject = null)
  {
    g_value_set_object(cast(GValue*)this._cPtr, vObject ? cast(GObject*)vObject._cPtr(No.Dup) : null);
  }

  /**
      Set the contents of a `G_TYPE_PARAM` #GValue to param.
  
      Params:
        param = the #GParamSpec to be set
  */
  void setParam(gobject.param_spec.ParamSpec param = null)
  {
    g_value_set_param(cast(GValue*)this._cPtr, param ? cast(GParamSpec*)param._cPtr(No.Dup) : null);
  }

  /**
      Set the contents of a pointer #GValue to v_pointer.
  
      Params:
        vPointer = pointer value to be set
  */
  void setPointer(void* vPointer = null)
  {
    g_value_set_pointer(cast(GValue*)this._cPtr, vPointer);
  }

  /**
      Set the contents of a `G_TYPE_CHAR` #GValue to v_char.
  
      Params:
        vChar = signed 8 bit integer to be set
  */
  void setSchar(byte vChar)
  {
    g_value_set_schar(cast(GValue*)this._cPtr, vChar);
  }

  /**
      Set the contents of a `G_TYPE_BOXED` derived #GValue to v_boxed.
      
      The boxed value is assumed to be static, and is thus not duplicated
      when setting the #GValue.
  
      Params:
        vBoxed = static boxed value to be set
  */
  void setStaticBoxed(const(void)* vBoxed = null)
  {
    g_value_set_static_boxed(cast(GValue*)this._cPtr, vBoxed);
  }

  /**
      Set the contents of a `G_TYPE_STRING` #GValue to v_string.
      The string is assumed to be static, and is thus not duplicated
      when setting the #GValue.
      
      If the the string is a canonical string, using [gobject.value.Value.setInternedString]
      is more appropriate.
  
      Params:
        vString = static string to be set
  */
  void setStaticString(string vString = null)
  {
    const(char)* _vString = vString.toCString(No.Alloc);
    g_value_set_static_string(cast(GValue*)this._cPtr, _vString);
  }

  /**
      Set the contents of a `G_TYPE_STRING` #GValue to a copy of v_string.
  
      Params:
        vString = caller-owned string to be duplicated for the #GValue
  */
  void setString(string vString = null)
  {
    const(char)* _vString = vString.toCString(No.Alloc);
    g_value_set_string(cast(GValue*)this._cPtr, _vString);
  }

  /**
      This is an internal function introduced mainly for C marshallers.
  
      Params:
        vString = duplicated unowned string to be set
  
      Deprecated: Use [gobject.value.Value.takeString] instead.
  */
  void setStringTakeOwnership(string vString = null)
  {
    char* _vString = vString.toCString(No.Alloc);
    g_value_set_string_take_ownership(cast(GValue*)this._cPtr, _vString);
  }

  /**
      Set the contents of a `G_TYPE_UCHAR` #GValue to v_uchar.
  
      Params:
        vUchar = unsigned character value to be set
  */
  void setUchar(ubyte vUchar)
  {
    g_value_set_uchar(cast(GValue*)this._cPtr, vUchar);
  }

  /**
      Set the contents of a `G_TYPE_UINT` #GValue to v_uint.
  
      Params:
        vUint = unsigned integer value to be set
  */
  void setUint(uint vUint)
  {
    g_value_set_uint(cast(GValue*)this._cPtr, vUint);
  }

  /**
      Set the contents of a `G_TYPE_UINT64` #GValue to v_uint64.
  
      Params:
        vUint64 = unsigned 64bit integer value to be set
  */
  void setUint64(ulong vUint64)
  {
    g_value_set_uint64(cast(GValue*)this._cPtr, vUint64);
  }

  /**
      Set the contents of a `G_TYPE_ULONG` #GValue to v_ulong.
  
      Params:
        vUlong = unsigned long integer value to be set
  */
  void setUlong(gulong vUlong)
  {
    g_value_set_ulong(cast(GValue*)this._cPtr, vUlong);
  }

  /**
      Set the contents of a variant #GValue to variant.
      If the variant is floating, it is consumed.
  
      Params:
        variant = a #GVariant, or null
  */
  void setVariant(glib.variant.Variant variant = null)
  {
    g_value_set_variant(cast(GValue*)this._cPtr, variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
  }

  /**
      Steal ownership on contents of a `G_TYPE_STRING` #GValue.
      As a result of this operation the value's contents will be reset to null.
      
      The purpose of this call is to provide a way to avoid an extra copy
      when some object have been serialized into string through #GValue API.
      
      NOTE: for safety and compatibility purposes, if #GValue contains
      static string, or an interned one, this function will return a copy
      of the string. Otherwise the transfer notation would be ambiguous.
      Returns: string content of value;
         Should be freed with [glib.global.gfree] when no longer needed.
  */
  string stealString()
  {
    char* _cretval;
    _cretval = g_value_steal_string(cast(GValue*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the contents of a `G_TYPE_BOXED` derived #GValue to v_boxed
      and takes over the ownership of the caller’s reference to v_boxed;
      the caller doesn’t have to unref it any more.
  
      Params:
        vBoxed = duplicated unowned boxed value to be set
  */
  void takeBoxed(const(void)* vBoxed = null)
  {
    g_value_take_boxed(cast(GValue*)this._cPtr, vBoxed);
  }

  /**
      Sets the contents of a `G_TYPE_STRING` #GValue to v_string.
  
      Params:
        vString = string to take ownership of
  */
  void takeString(string vString = null)
  {
    char* _vString = vString.toCString(Yes.Alloc);
    g_value_take_string(cast(GValue*)this._cPtr, _vString);
  }

  /**
      Set the contents of a variant #GValue to variant, and takes over
      the ownership of the caller's reference to variant;
      the caller doesn't have to unref it any more (i.e. the reference
      count of the variant is not increased).
      
      If variant was floating then its floating reference is converted to
      a hard reference.
      
      If you want the #GValue to hold its own reference to variant, use
      [gobject.value.Value.setVariant] instead.
      
      This is an internal function introduced mainly for C marshallers.
  
      Params:
        variant = a #GVariant, or null
  */
  void takeVariant(glib.variant.Variant variant = null)
  {
    g_value_take_variant(cast(GValue*)this._cPtr, variant ? cast(GVariant*)variant._cPtr(Yes.Dup) : null);
  }

  /**
      Tries to cast the contents of src_value into a type appropriate
      to store in dest_value, e.g. to transform a `G_TYPE_INT` value
      into a `G_TYPE_FLOAT` value. Performing transformations between
      value types might incur precision lossage. Especially
      transformations into strings might reveal seemingly arbitrary
      results and shouldn't be relied upon for production code (such
      as rcfile value or object property serialization).
  
      Params:
        destValue = Target value.
      Returns: Whether a transformation rule was found and could be applied.
         Upon failing transformations, dest_value is left untouched.
  */
  bool transform(gobject.value.Value destValue)
  {
    bool _retval;
    _retval = cast(bool)g_value_transform(cast(const(GValue)*)this._cPtr, destValue ? cast(GValue*)destValue._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears the current value in value (if any) and "unsets" the type,
      this releases all resources associated with this GValue. An unset
      value is the same as an uninitialized (zero-filled) #GValue
      structure.
  */
  void unset()
  {
    g_value_unset(cast(GValue*)this._cPtr);
  }

  /**
      Returns whether a #GValue of type src_type can be copied into
      a #GValue of type dest_type.
  
      Params:
        srcType = source type to be copied.
        destType = destination type for copying.
      Returns: true if [gobject.value.Value.copy] is possible with src_type and dest_type.
  */
  static bool typeCompatible(gobject.types.GType srcType, gobject.types.GType destType)
  {
    bool _retval;
    _retval = cast(bool)g_value_type_compatible(srcType, destType);
    return _retval;
  }

  /**
      Check whether [gobject.value.Value.transform] is able to transform values
      of type src_type into values of type dest_type. Note that for
      the types to be transformable, they must be compatible or a
      transformation function must be registered.
  
      Params:
        srcType = Source type.
        destType = Target type.
      Returns: true if the transformation is possible, false otherwise.
  */
  static bool typeTransformable(gobject.types.GType srcType, gobject.types.GType destType)
  {
    bool _retval;
    _retval = cast(bool)g_value_type_transformable(srcType, destType);
    return _retval;
  }
}

/**
* Template to initialize a C GValue structure.
* Params:
*   T = The D type to initialize the GValue to
*   gval = The C GValue structure pointer
*/
void initVal(T)(GValue* gval)
{
  static if (is(T == bool))
    g_value_init(gval, GTypeEnum.Boolean);
  else static if (is(T == byte))
    g_value_init(gval, GTypeEnum.Char);
  else static if (is(T == ubyte))
    g_value_init(gval, GTypeEnum.Uchar);
  else static if (is(T == int))
    g_value_init(gval, GTypeEnum.Int);
  else static if (is(T == uint))
    g_value_init(gval, GTypeEnum.Uint);
  else static if (is(T == long))
    g_value_init(gval, GTypeEnum.Int64);
  else static if (is(T == ulong))
    g_value_init(gval, GTypeEnum.Uint64);
  else static if (is(T == float))
    g_value_init(gval, GTypeEnum.Float);
  else static if (is(T == double))
    g_value_init(gval, GTypeEnum.Double);
  else static if (is(T == enum)) // FIXME enum or flags
    g_value_init(gval, GTypeEnum.Enum);
  else static if (is(T == string))
    g_value_init(gval, GTypeEnum.String);
  else static if (is(T == glib.variant.Variant))
    g_value_init(gval, GTypeEnum.Variant);
  else static if (is(T : ParamSpec))
    g_value_init(gval, GTypeEnum.Param);
  else static if (is(T : Boxed))
  { // Cannot initialize a plain boxed type, it is done in setVal()
  }
  else static if (is(T : gobject.object.ObjectWrap) || is(T == interface))
    g_value_init(gval, GTypeEnum.Object);
  else static if (is(T : Object) || isPointer!T)
    g_value_init(gval, GTypeEnum.Pointer);
  else
    assert(0, "Unsupported type " ~ T.stringof ~ " in Value.initVal");
}

/**
* Template to get a value from a GValue of a given D type (must contain the correct type)
* Params:
*   T = D type which the C GValue structure contains
*   gval = C GValue structure pointer
* Returns: The value of type `T`
*/
T getVal(T)(const(GValue)* gval)
{
  static if (is(T == bool))
    return cast(bool)g_value_get_boolean(gval);
  else static if (is(T == byte))
    return g_value_get_schar(gval);
  else static if (is(T == ubyte))
    return g_value_get_uchar(gval);
  else static if (is(T == int))
    return g_value_get_int(gval);
  else static if (is(T == uint))
    return g_value_get_uint(gval);
  else static if (is(T == long))
    return g_value_get_int64(gval);
  else static if (is(T == ulong))
    return g_value_get_uint64(gval);
  else static if (is(T == float))
    return g_value_get_float(gval);
  else static if (is(T == double))
    return g_value_get_double(gval);
  else static if (is(T == enum)) // enum or flags
    return g_type_is_a(gval.gType, GTypeEnum.Flags) ? cast(T)g_value_get_flags(gval) : cast(T)g_value_get_enum(gval);
  else static if (is(T == string))
    return g_value_get_string(gval).fromCString(No.Free);
  else static if (is(T == glib.variant.Variant))
  {
    auto v = g_value_get_variant(gval);
    return v ? new glib.variant.Variant(v, No.Take) : null;
  }
  else static if (is(T : ParamSpec))
  {
    auto v = g_value_get_param(gval);
    return v ? new T(v, No.Take) : null;
  }
  else static if (is(T : Boxed))
  {
    auto v = g_value_get_boxed(gval);
    return v ? new T(v, No.Take) : null;
  }
  else static if (is(T : gobject.object.ObjectWrap) || is(T == interface))
  {
    auto v = g_value_get_object(gval);
    return gobject.object.ObjectWrap._getDObject!T(v, No.Take);
  }
  else static if (is(T : Object) || isPointer!T)
    return cast(T)g_value_get_pointer(gval);
  else
    assert(0, "Unsupported type " ~ T.stringof ~ " in Value.getVal");
}

/**
* Template to set a GValue to a given D type (must have been initialized to the proper type)
* Params:
*   T = D type which the C GValue structure has been initialized to (except Boxed types which are initialized by this template)
*   gval = C GValue structure pointer
*   v = The value to set the GValue structure to
*/
void setVal(T)(GValue* gval, T v)
{
  static if (is(T == bool))
    g_value_set_boolean(gval, cast(gboolean)v);
  else static if (is(T == byte))
    g_value_set_schar(gval, v);
  else static if (is(T == ubyte))
    g_value_set_uchar(gval, v);
  else static if (is(T == int))
    g_value_set_int(gval, v);
  else static if (is(T == uint))
    g_value_set_uint(gval, v);
  else static if (is(T == long))
    g_value_set_int64(gval, v);
  else static if (is(T == ulong))
    g_value_set_uint64(gval, v);
  else static if (is(T == float))
    g_value_set_float(gval, v);
  else static if (is(T == double))
    g_value_set_double(gval, v);
  else static if (is(T == enum))
  {
    if (g_type_is_a(gval.gType, GTypeEnum.Flags))
      g_value_set_flags(gval, v);
    else
      g_value_set_enum(gval, v);
  }
  else static if (is(T == string))
    g_value_take_string(gval, v.toCString(Yes.Alloc));
  else static if (is(T == glib.variant.Variant))
    g_value_set_variant(gval, v ? cast(GVariant*)v._cPtr : null);
  else static if (is(T : ParamSpec))
    g_value_set_param(gval, v ? cast(GParamSpec*)v._cPtr : null);
  else static if (is(T : Boxed))
  {
    g_value_init(gval, v._gType); // Have to initialize the specific boxed type here rather than in initVal
    g_value_set_boxed(gval, v._cInstancePtr);
  }
  else static if (is(T : gobject.object.ObjectWrap))
    g_value_set_object(gval, v ? cast(GObject*)v._cPtr(No.Dup) : null);
  else static if (is(T == interface))
  {
    if (auto objG = cast(gobject.object.ObjectWrap)v)
      g_value_set_object(gval, cast(GObject*)objG._cPtr(No.Dup));
    else if (!v)
      g_value_set_object(gval, null);
    else
      assert(0, "Object type " ~ typeid(v).toString ~ " is not an ObjectWrap in Value.setVal");
  }
  else static if (is(T : Object) || isPointer!T)
    g_value_set_pointer(gval, cast(void*)v);
  else
    assert(0, "Unsupported type " ~ T.stringof ~ " in Value.setVal");
}
