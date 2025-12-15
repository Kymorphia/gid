/// Module for [Value] class
module javascriptcore.value;

import gid.gid;
import glib.bytes;
import glib.types;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.class_;
import javascriptcore.context;
import javascriptcore.types;

/**
    JSCValue represents a reference to a value in a #JSCContext. The JSCValue
    protects the referenced value from being garbage collected.
*/
class Value : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())jsc_value_get_type != &gidSymbolNotFound ? jsc_value_get_type() : cast(GType)0;
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
      Creates a new `ArrayBuffer` from existing data in memory.
      
      The data is not copied: while this allows sharing data with JavaScript
      efficiently, the caller must ensure that the memory region remains valid
      until the newly created object is released by JSC.
      
      Optionally, a destroy_notify callback can be provided, which will be
      invoked with user_data as parameter when the `ArrayBuffer` object is
      released. This is intended to be used for freeing resources related to
      the memory region which contains the data:
      
      ```!<-- language="C" -->
      GMappedFile *f = g_mapped_file_new (file_path, TRUE, NULL);
      JSCValue *value = jsc_value_new_array_buffer (context,
          g_mapped_file_get_contents (f), g_mapped_file_get_length (f),
          (GDestroyNotify) g_mapped_file_unref, f);
      ```
      
      Note that the user_data can be the same value as data:
      
      ```!<-- language="C" -->
      void *bytes = g_malloc0 (100);
      JSCValue *value = jsc_value_new_array_buffer (context, bytes, 100, g_free, bytes);
      ```
  
      Params:
        context = A #JSCContext
        data = Pointer to a region of memory.
        size = Size in bytes of the memory region.
        destroyNotify = destroy notifier for user_data.
      Returns: A #JSCValue, or null in case of exception.
  */
  static javascriptcore.value.Value newArrayBuffer(javascriptcore.context.Context context, void* data, size_t size, glib.types.DestroyNotify destroyNotify = null)
  {
    extern(C) void _destroyNotifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyNotifyCB = destroyNotify ? &_destroyNotifyCallback : null;

    JSCValue* _cretval;
    auto _destroyNotify = destroyNotify ? freezeDelegate(cast(void*)&destroyNotify) : null;
    _cretval = jsc_value_new_array_buffer(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, data, size, _destroyNotifyCB, _destroyNotify);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue referencing an array with the items from array. If array
      is null or empty a new empty array will be created. Elements of array should be
      pointers to a #JSCValue.
  
      Params:
        context = a #JSCContext
        array = a #GPtrArray
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newArrayFromGarray(javascriptcore.context.Context context, javascriptcore.value.Value[] array = null)
  {
    JSCValue* _cretval;
    auto _array = gPtrArrayFromD!(javascriptcore.value.Value, false)(array);
    scope(exit) containerFree!(GPtrArray*, javascriptcore.value.Value, GidOwnership.None)(_array);
    _cretval = jsc_value_new_array_from_garray(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _array);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue referencing an array of strings with the items from strv. If array
      is null or empty a new empty array will be created.
  
      Params:
        context = a #JSCContext
        strv = a null-terminated array of strings
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newArrayFromStrv(javascriptcore.context.Context context, string[] strv)
  {
    JSCValue* _cretval;
    const(char)*[] _tmpstrv;
    foreach (s; strv)
      _tmpstrv ~= s.toCString(No.Alloc);
    _tmpstrv ~= null;
    const(char*)* _strv = _tmpstrv.ptr;
    _cretval = jsc_value_new_array_from_strv(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _strv);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue from value
  
      Params:
        context = a #JSCContext
        value = a #gboolean
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newBoolean(javascriptcore.context.Context context, bool value)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_boolean(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, value);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue referencing a new value created by parsing json.
  
      Params:
        context = a #JSCContext
        json = the JSON string to be parsed
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newFromJson(javascriptcore.context.Context context, string json)
  {
    JSCValue* _cretval;
    const(char)* _json = json.toCString(No.Alloc);
    _cretval = jsc_value_new_from_json(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _json);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue referencing <function>null</function> in context.
  
      Params:
        context = a #JSCContext
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newNull(javascriptcore.context.Context context)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_null(context ? cast(JSCContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue from number.
  
      Params:
        context = a #JSCContext
        number = a number
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newNumber(javascriptcore.context.Context context, double number)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_number(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, number);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue from instance. If instance is null a new empty object is created.
      When instance is provided, jsc_class must be provided too. jsc_class takes ownership of
      instance that will be freed by the #GDestroyNotify passed to [javascriptcore.context.Context.registerClass].
  
      Params:
        context = a #JSCContext
        instance = an object instance or null
        jscClass = the #JSCClass of instance
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newObject(javascriptcore.context.Context context, void* instance = null, javascriptcore.class_.Class jscClass = null)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_object(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, instance, jscClass ? cast(JSCClass*)jscClass._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new Promise. executor will be invoked during promise initialization
      and it receives the resolve and reject objects than can be called to resolve
      or reject the promise. It is called like a JavaScript function, so exceptions raised
      during the executor invocation will not be propagated to the context, but
      handled by the promise causing a rejection.
  
      Params:
        context = a #JSCContext
        executor = an initialization callback
      Returns: a deferred promise object
  */
  static javascriptcore.value.Value newPromise(javascriptcore.context.Context context, javascriptcore.types.Executor executor)
  {
    extern(C) void _executorCallback(JSCValue* resolve, JSCValue* reject, void* userData)
    {
      auto _dlg = cast(javascriptcore.types.Executor*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(void*)resolve, No.Take), gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(void*)reject, No.Take));
    }
    auto _executorCB = executor ? &_executorCallback : null;

    JSCValue* _cretval;
    auto _executor = executor ? cast(void*)&(executor) : null;
    _cretval = jsc_value_new_promise(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _executorCB, _executor);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue from string. If you need to create a #JSCValue from a
      string containing null characters, use [javascriptcore.value.Value.newStringFromBytes] instead.
  
      Params:
        context = a #JSCContext
        string_ = a null-terminated string
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newString(javascriptcore.context.Context context, string string_ = null)
  {
    JSCValue* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = jsc_value_new_string(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _string_);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue from bytes.
  
      Params:
        context = a #JSCContext
        bytes = a #GBytes
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newStringFromBytes(javascriptcore.context.Context context, glib.bytes.Bytes bytes = null)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_string_from_bytes(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new typed array containing a given amount of elements.
      
      Create a #JSCValue referencing a new typed array with space for length
      elements of a given type. As all typed arrays must have an associated
      `ArrayBuffer`, a new one of suitable size will be allocated to store
      the elements, which will be initialized to zero.
      
      The type must *not* be `JSC_TYPED_ARRAY_NONE`.
  
      Params:
        context = a #JSCContext
        type = the type of array elements
        length = number of elements in the array
      Returns: a #JSCValue
  */
  static javascriptcore.value.Value newTypedArray(javascriptcore.context.Context context, javascriptcore.types.TypedArrayType type, size_t length)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_typed_array(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, type, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new #JSCValue referencing <function>undefined</function> in context.
  
      Params:
        context = a #JSCContext
      Returns: a #JSCValue.
  */
  static javascriptcore.value.Value newUndefined(javascriptcore.context.Context context)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_undefined(context ? cast(JSCContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the size in bytes of the array buffer.
      
      Obtains the size in bytes of the memory region that holds the contents of
      an `ArrayBuffer`.
      Returns: size, in bytes.
  */
  size_t arrayBufferGetSize()
  {
    size_t _retval;
    _retval = jsc_value_array_buffer_get_size(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Invoke <function>new</function> with constructor referenced by value. If n_parameters
      is 0 no parameters will be passed to the constructor.
  
      Params:
        parameters = the #JSCValue<!-- -->s to pass as parameters to the constructor, or null
      Returns: a #JSCValue referencing the newly created object instance.
  */
  javascriptcore.value.Value constructorCall(javascriptcore.value.Value[] parameters = null)
  {
    JSCValue* _cretval;
    uint _nParameters;
    if (parameters)
      _nParameters = cast(uint)parameters.length;

    JSCValue*[] _tmpparameters;
    foreach (obj; parameters)
      _tmpparameters ~= obj ? cast(JSCValue*)obj._cPtr : null;
    JSCValue** _parameters = cast(JSCValue**)_tmpparameters.ptr;
    _cretval = jsc_value_constructor_callv(cast(JSCValue*)this._cPtr, _nParameters, _parameters);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Call function referenced by value, passing the given parameters. If n_parameters
      is 0 no parameters will be passed to the function.
      
      This function always returns a #JSCValue, in case of void functions a #JSCValue referencing
      <function>undefined</function> is returned
  
      Params:
        parameters = the #JSCValue<!-- -->s to pass as parameters to the function, or null
      Returns: a #JSCValue with the return value of the function.
  */
  javascriptcore.value.Value functionCall(javascriptcore.value.Value[] parameters = null)
  {
    JSCValue* _cretval;
    uint _nParameters;
    if (parameters)
      _nParameters = cast(uint)parameters.length;

    JSCValue*[] _tmpparameters;
    foreach (obj; parameters)
      _tmpparameters ~= obj ? cast(JSCValue*)obj._cPtr : null;
    JSCValue** _parameters = cast(JSCValue**)_tmpparameters.ptr;
    _cretval = jsc_value_function_callv(cast(JSCValue*)this._cPtr, _nParameters, _parameters);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #JSCContext in which value was created.
      Returns: the #JSCValue context.
  */
  javascriptcore.context.Context getContext()
  {
    JSCContext* _cretval;
    _cretval = jsc_value_get_context(cast(JSCValue*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(JSCContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get whether the value referenced by value is an array.
      Returns: whether the value is an array.
  */
  bool isArray()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_array(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Check whether the value is an `ArrayBuffer`.
      Returns: whether the value is an `ArrayBuffer`
  */
  bool isArrayBuffer()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_array_buffer(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is a boolean.
      Returns: whether the value is a boolean.
  */
  bool isBoolean()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_boolean(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is a constructor.
      Returns: whether the value is a constructor.
  */
  bool isConstructor()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_constructor(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is a function
      Returns: whether the value is a function.
  */
  bool isFunction()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_function(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is <function>null</function>.
      Returns: whether the value is null.
  */
  bool isNull()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_null(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is a number.
      Returns: whether the value is a number.
  */
  bool isNumber()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_number(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is an object.
      Returns: whether the value is an object.
  */
  bool isObject()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_object(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is a string
      Returns: whether the value is a string
  */
  bool isString()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_string(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether a value is a typed array.
      Returns: Whether value is a typed array.
  */
  bool isTypedArray()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_typed_array(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the value referenced by value is <function>undefined</function>.
      Returns: whether the value is undefined.
  */
  bool isUndefined()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_is_undefined(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Create a new typed array value with elements from an array buffer.
      
      Create a #JSCValue referencing a new typed array value containing
      elements of the given type, where the elements are stored at the memory
      region represented by the array_buffer.
      
      The type must *not* be `JSC_TYPED_ARRAY_NONE`.
      
      The offset and length parameters can be used to indicate which part of
      the array buffer can be accessed through the typed array. If both are
      omitted (passing zero as offset, and `-1` as length), the whole
      array_buffer is exposed through the typed array. Omitting the length
      with a non-zero offset will expose the remainder of the array_buffer
      starting at the indicated offset.
  
      Params:
        type = type of array elements.
        offset = offset, in bytes.
        length = number of array elements, or `-1`.
      Returns: a #JSCValue
  */
  javascriptcore.value.Value newTypedArrayWithBuffer(javascriptcore.types.TypedArrayType type, size_t offset, ptrdiff_t length)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_new_typed_array_with_buffer(cast(JSCValue*)this._cPtr, type, offset, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Define or modify a property with property_name in object referenced by value. This is equivalent to
      JavaScript <function>Object.defineProperty()</function> when used with a data descriptor.
  
      Params:
        propertyName = the name of the property to define
        flags = #JSCValuePropertyFlags
        propertyValue = the default property value
  */
  void objectDefinePropertyData(string propertyName, javascriptcore.types.ValuePropertyFlags flags, javascriptcore.value.Value propertyValue = null)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    jsc_value_object_define_property_data(cast(JSCValue*)this._cPtr, _propertyName, flags, propertyValue ? cast(JSCValue*)propertyValue._cPtr(No.Dup) : null);
  }

  /**
      Try to delete property with name from value. This function will return false if
      the property was defined without `JSC_VALUE_PROPERTY_CONFIGURABLE` flag.
  
      Params:
        name = the property name
      Returns: true if the property was deleted, or false otherwise.
  */
  bool objectDeleteProperty(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)jsc_value_object_delete_property(cast(JSCValue*)this._cPtr, _name);
    return _retval;
  }

  /**
      Get the list of property names of value. Only properties defined with `JSC_VALUE_PROPERTY_ENUMERABLE`
      flag will be collected.
      Returns: a null-terminated array of strings containing the
           property names, or null if value doesn't have enumerable properties.  Use [glib.global.strfreev] to free.
  */
  string[] objectEnumerateProperties()
  {
    char** _cretval;
    _cretval = jsc_value_object_enumerate_properties(cast(JSCValue*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get property with name from value.
  
      Params:
        name = the property name
      Returns: the property #JSCValue.
  */
  javascriptcore.value.Value objectGetProperty(string name)
  {
    JSCValue* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = jsc_value_object_get_property(cast(JSCValue*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get property at index from value.
  
      Params:
        index = the property index
      Returns: the property #JSCValue.
  */
  javascriptcore.value.Value objectGetPropertyAtIndex(uint index)
  {
    JSCValue* _cretval;
    _cretval = jsc_value_object_get_property_at_index(cast(JSCValue*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get whether value has property with name.
  
      Params:
        name = the property name
      Returns: true if value has a property with name, or false otherwise
  */
  bool objectHasProperty(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)jsc_value_object_has_property(cast(JSCValue*)this._cPtr, _name);
    return _retval;
  }

  /**
      Invoke method with name on object referenced by value, passing the given parameters. If
      n_parameters is 0 no parameters will be passed to the method.
      The object instance will be handled automatically even when the method is a custom one
      registered with [javascriptcore.class_.Class.addMethod], so it should never be passed explicitly as parameter
      of this function.
      
      This function always returns a #JSCValue, in case of void methods a #JSCValue referencing
      <function>undefined</function> is returned.
  
      Params:
        name = the method name
        parameters = the #JSCValue<!-- -->s to pass as parameters to the method, or null
      Returns: a #JSCValue with the return value of the method.
  */
  javascriptcore.value.Value objectInvokeMethod(string name, javascriptcore.value.Value[] parameters = null)
  {
    JSCValue* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    uint _nParameters;
    if (parameters)
      _nParameters = cast(uint)parameters.length;

    JSCValue*[] _tmpparameters;
    foreach (obj; parameters)
      _tmpparameters ~= obj ? cast(JSCValue*)obj._cPtr : null;
    JSCValue** _parameters = cast(JSCValue**)_tmpparameters.ptr;
    _cretval = jsc_value_object_invoke_methodv(cast(JSCValue*)this._cPtr, _name, _nParameters, _parameters);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get whether the value referenced by value is an instance of class name.
  
      Params:
        name = a class name
      Returns: whether the value is an object instance of class name.
  */
  bool objectIsInstanceOf(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)jsc_value_object_is_instance_of(cast(JSCValue*)this._cPtr, _name);
    return _retval;
  }

  /**
      Set property with name on value.
  
      Params:
        name = the property name
        property = the #JSCValue to set
  */
  void objectSetProperty(string name, javascriptcore.value.Value property)
  {
    const(char)* _name = name.toCString(No.Alloc);
    jsc_value_object_set_property(cast(JSCValue*)this._cPtr, _name, property ? cast(JSCValue*)property._cPtr(No.Dup) : null);
  }

  /**
      Set property at index on value.
  
      Params:
        index = the property index
        property = the #JSCValue to set
  */
  void objectSetPropertyAtIndex(uint index, javascriptcore.value.Value property)
  {
    jsc_value_object_set_property_at_index(cast(JSCValue*)this._cPtr, index, property ? cast(JSCValue*)property._cPtr(No.Dup) : null);
  }

  /**
      Convert value to a boolean.
      Returns: a #gboolean result of the conversion.
  */
  bool toBoolean()
  {
    bool _retval;
    _retval = cast(bool)jsc_value_to_boolean(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Convert value to a double.
      Returns: a #gdouble result of the conversion.
  */
  double toDouble()
  {
    double _retval;
    _retval = jsc_value_to_double(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Convert value to a #gint32.
      Returns: a #gint32 result of the conversion.
  */
  int toInt32()
  {
    int _retval;
    _retval = jsc_value_to_int32(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Create a JSON string of value serialization. If indent is 0, the resulting JSON will
      not contain newlines. The size of the indent is clamped to 10 spaces.
  
      Params:
        indent = The number of spaces to indent when nesting.
      Returns: a null-terminated JSON string with serialization of value
  */
  string toJson(uint indent)
  {
    char* _cretval;
    _cretval = jsc_value_to_json(cast(JSCValue*)this._cPtr, indent);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Convert value to a string. Use [javascriptcore.value.Value.toStringAsBytes] instead, if you need to
      handle strings containing null characters.
      Returns: a null-terminated string result of the conversion.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = jsc_value_to_string(cast(JSCValue*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Convert value to a string and return the results as #GBytes. This is needed
      to handle strings with null characters.
      Returns: a #GBytes with the result of the conversion.
  */
  glib.bytes.Bytes toStringAsBytes()
  {
    GBytes* _cretval;
    _cretval = jsc_value_to_string_as_bytes(cast(JSCValue*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtain the `ArrayBuffer` for the memory region of the typed array elements.
      Returns: A #JSCValue
  */
  javascriptcore.value.Value typedArrayGetBuffer()
  {
    JSCValue* _cretval;
    _cretval = jsc_value_typed_array_get_buffer(cast(JSCValue*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a pointer to the memory region that holds the elements of the typed
      array; modifications done to them will be visible to JavaScript code. If
      length is not null, the number of elements contained in the typed array
      are also stored in the pointed location.
      
      The returned pointer needs to be casted to the appropriate type (see
      #JSCTypedArrayType), and has the `offset` over the underlying array
      buffer data applied—that is, points to the first element of the typed
      array:
      
      ```c
      if (jsc_value_typed_array_get_type(value) != JSC_TYPED_ARRAY_UINT32)
          g_error ("Only arrays of uint32_t are supported");
      
      gsize count = 0;
      uint32_t *elements = jsc_value_typed_array_get_contents (value, &count);
      for (gsize i = 0; i < count; i++)
           g_print ("index %zu, value %" PRIu32 "\n", i, elements[i]);
      ```
      
      Note that the pointer returned by this function is not guaranteed to remain
      the same after calls to other JSC API functions. See
      [javascriptcore.value.Value.arrayBufferGetData] for details.
  
      Params:
        length = location to return the number of elements contained
      Returns: pointer to memory.
  */
  void* typedArrayGetData(out size_t length)
  {
    auto _retval = jsc_value_typed_array_get_data(cast(JSCValue*)this._cPtr, cast(size_t*)&length);
    return _retval;
  }

  /**
      Gets the number of elements in a typed array.
      Returns: number of elements.
  */
  size_t typedArrayGetLength()
  {
    size_t _retval;
    _retval = jsc_value_typed_array_get_length(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset over the underlying array buffer data.
      Returns: offset, in bytes.
  */
  size_t typedArrayGetOffset()
  {
    size_t _retval;
    _retval = jsc_value_typed_array_get_offset(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of a typed array.
      Returns: size, in bytes.
  */
  size_t typedArrayGetSize()
  {
    size_t _retval;
    _retval = jsc_value_typed_array_get_size(cast(JSCValue*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of elements contained in a typed array.
      Returns: type of the elements, or `JSC_TYPED_ARRAY_NONE` if value is not a typed array.
  */
  javascriptcore.types.TypedArrayType typedArrayGetType()
  {
    JSCTypedArrayType _cretval;
    _cretval = jsc_value_typed_array_get_type(cast(JSCValue*)this._cPtr);
    javascriptcore.types.TypedArrayType _retval = cast(javascriptcore.types.TypedArrayType)_cretval;
    return _retval;
  }
}
