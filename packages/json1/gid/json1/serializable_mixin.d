/// Module for [Serializable] interface mixin
module gid.json1.serializable_mixin;

public import gid.core.basictypes;
public import gid.json1.serializable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.param_spec;
public import gid.gobject2.value;
public import gid.json1.c.functions;
public import gid.json1.c.types;
public import gid.json1.node;
public import gid.json1.types;

/**
    [gid.json1.serializable.Serializable] is an interface for controlling the serialization
    and deserialization of [gid.gobject2.object.ObjectWrap] classes.
    
    Implementing this interface allows controlling how the class is going
    to be serialized or deserialized by `func@Json.construct_gobject` and
    `func@Json.serialize_gobject`, respectively.
*/
template SerializableT()
{

  /**
      Asks a [gid.json1.serializable.Serializable] implementation to deserialize the
      property contained inside `property_node` and place its value
      into `value`.
      
      The `value` can be:
      
      - an empty [gid.gobject2.value.Value] initialized by `G_VALUE_INIT`, which will be automatically
        initialized with the expected type of the property by using the given
        property description (since JSON-GLib 1.6)
      - a [gid.gobject2.value.Value] initialized with the expected type of the property
      
      This function will not be called for properties that are marked as
      as [gid.gobject2.types.ParamFlags.ConstructOnly].
  
      Params:
        propertyName = the name of the property to serialize
        value = a pointer to an uninitialized value
        pspec = a property description
        propertyNode = the JSON node containing the serialized property (modified in place, changes are seen by the caller)
      Returns: `TRUE` if the property was successfully deserialized
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeserializeProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDeserializeProperty(string propertyName, out gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec, gid.json1.node.Node propertyNode)
  {
    auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.json1.serializable.Serializable._getGType);
    if (!_klass || !_klass.deserializeProperty)
      return typeof(return).init;

    bool _retval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)_klass.deserializeProperty(cast(JsonSerializable*)this._cPtr, _propertyName, _value, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, propertyNode ? cast(JsonNode*)propertyNode._cPtr(No.Dup) : null);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.find_property` implementation on
      the [gid.json1.serializable.Serializable] instance, which will return the property
      description for the given name.
  
      Params:
        name = the name of the property
      Returns: the property description
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncFindProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.param_spec.ParamSpec vfuncFindProperty(string name)
  {
    auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.json1.serializable.Serializable._getGType);
    if (!_klass || !_klass.findProperty)
      return typeof(return).init;

    GParamSpec* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.findProperty(cast(JsonSerializable*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.get_property` implementation
      on the [gid.json1.serializable.Serializable] instance, which will get the value of
      the given property.
  
      Params:
        pspec = a property description
        value = return location for the property value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetProperty(gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value)
  {
    auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.json1.serializable.Serializable._getGType);
    if (!_klass || !_klass.getProperty)
      return;

    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _klass.getProperty(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Asks a [gid.json1.serializable.Serializable] implementation to serialize an object
      property into a JSON node.
  
      Params:
        propertyName = the name of the property to serialize
        value = the value of the property to serialize
        pspec = a property description
      Returns: a node containing the serialized property
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSerializeProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.json1.node.Node vfuncSerializeProperty(string propertyName, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec)
  {
    auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.json1.serializable.Serializable._getGType);
    if (!_klass || !_klass.serializeProperty)
      return typeof(return).init;

    JsonNode* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.serializeProperty(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.set_property` implementation
      on the [gid.json1.serializable.Serializable] instance, which will set the property
      with the given value.
  
      Params:
        pspec = a property description
        value = the property value to set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetProperty(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value)
  {
    auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.json1.serializable.Serializable._getGType);
    if (!_klass || !_klass.setProperty)
      return;

    _klass.setProperty(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Calls the default implementation of the `vfuncJson.Serializable.deserialize_property`
      virtual function.
      
      This function can be used inside a custom implementation of the
      `deserialize_property()` virtual function in lieu of calling the
      default implementation through `[gid.gobject2.global.typeDefaultInterfacePeek]`:
      
      ```c
      JsonSerializable *iface;
      gboolean res;
      
      iface = g_type_default_interface_peek (JSON_TYPE_SERIALIZABLE);
      res = iface->deserialize_property (serializable, property_name,
                                         value,
                                         pspec,
                                         property_node);
      ```
  
      Params:
        propertyName = the name of the property to deserialize
        value = a pointer to an uninitialized value
        pspec = a property description
        propertyNode = the JSON node containing the serialized property
      Returns: `TRUE` if the property was successfully deserialized
  */
  override bool defaultDeserializeProperty(string propertyName, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec, gid.json1.node.Node propertyNode) nothrow
  {
    bool _retval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)json_serializable_default_deserialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, propertyNode ? cast(JsonNode*)propertyNode._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls the default implementation of the `vfuncJson.Serializable.serialize_property`
      virtual function.
      
      This function can be used inside a custom implementation of the
      `serialize_property()` virtual function in lieu of calling the
      default implementation through `[gid.gobject2.global.typeDefaultInterfacePeek]`:
      
      ```c
      JsonSerializable *iface;
      JsonNode *node;
      
      iface = g_type_default_interface_peek (JSON_TYPE_SERIALIZABLE);
      node = iface->serialize_property (serializable, property_name,
                                        value,
                                        pspec);
      ```
      
      This function will return `NULL` if the property could not be
      serialized.
  
      Params:
        propertyName = the name of the property to serialize
        value = the value of the property to serialize
        pspec = a property description
      Returns: a node containing the
          serialized property
  */
  override gid.json1.node.Node defaultSerializeProperty(string propertyName, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    JsonNode* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_serializable_default_serialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asks a [gid.json1.serializable.Serializable] implementation to deserialize the
      property contained inside `property_node` and place its value
      into `value`.
      
      The `value` can be:
      
      - an empty [gid.gobject2.value.Value] initialized by `G_VALUE_INIT`, which will be automatically
        initialized with the expected type of the property by using the given
        property description (since JSON-GLib 1.6)
      - a [gid.gobject2.value.Value] initialized with the expected type of the property
      
      This function will not be called for properties that are marked as
      as [gid.gobject2.types.ParamFlags.ConstructOnly].
  
      Params:
        propertyName = the name of the property to serialize
        value = a pointer to an uninitialized value
        pspec = a property description
        propertyNode = the JSON node containing the serialized property
      Returns: `TRUE` if the property was successfully deserialized
  */
  override bool deserializeProperty(string propertyName, out gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec, gid.json1.node.Node propertyNode) nothrow
  {
    bool _retval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)json_serializable_deserialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, _value, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, propertyNode ? cast(JsonNode*)propertyNode._cPtr(No.Dup) : null);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.find_property` implementation on
      the [gid.json1.serializable.Serializable] instance, which will return the property
      description for the given name.
  
      Params:
        name = the name of the property
      Returns: the property description
  */
  override gid.gobject2.param_spec.ParamSpec findProperty(string name) nothrow
  {
    GParamSpec* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = json_serializable_find_property(cast(JsonSerializable*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.get_property` implementation
      on the [gid.json1.serializable.Serializable] instance, which will get the value of
      the given property.
  
      Params:
        pspec = a property description
        value = return location for the property value
  */
  override void getProperty(gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value) nothrow
  {
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    json_serializable_get_property(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Calls the `vfuncJson.Serializable.list_properties` implementation on
      the [gid.json1.serializable.Serializable] instance, which will return the list of serializable
      properties.
      Returns: the serializable
          properties of the object
  */
  override gid.gobject2.param_spec.ParamSpec[] listProperties() nothrow
  {
    GParamSpec** _cretval;
    uint _cretlength;
    _cretval = json_serializable_list_properties(cast(JsonSerializable*)this._cPtr, &_cretlength);
    gid.gobject2.param_spec.ParamSpec[] _retval;

    if (_cretval)
    {
      _retval = new gid.gobject2.param_spec.ParamSpec[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gobject2.param_spec.ParamSpec(cast(void*)_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Asks a [gid.json1.serializable.Serializable] implementation to serialize an object
      property into a JSON node.
  
      Params:
        propertyName = the name of the property to serialize
        value = the value of the property to serialize
        pspec = a property description
      Returns: a node containing the serialized property
  */
  override gid.json1.node.Node serializeProperty(string propertyName, gid.gobject2.value.Value value, gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    JsonNode* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_serializable_serialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.set_property` implementation
      on the [gid.json1.serializable.Serializable] instance, which will set the property
      with the given value.
  
      Params:
        pspec = a property description
        value = the property value to set
  */
  override void setProperty(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.value.Value value) nothrow
  {
    json_serializable_set_property(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.json1.serializable.Serializable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_json1_serializable_Serializable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeserializeProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSerializeProperty", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetProperty", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.json1.serializable.Serializable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_json1_serializable_Serializable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeserializeProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_json1_serializable_Serializable(iface, "deserialize_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFindProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_json1_serializable_Serializable(iface, "find_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_json1_serializable_Serializable(iface, "get_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSerializeProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_json1_serializable_Serializable(iface, "serialize_property");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_json1_serializable_Serializable(iface, "set_property");
  }

  private static void _installIfaceVfunc_gid_json1_serializable_Serializable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(JsonSerializableIface*)iface;

    switch (vfunc)
    {
      case "deserialize_property":
      {
        static extern(C) gboolean _vfuncDeserializePropertyTramp(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)serializable);
          if (!_obj)
          {
            auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)serializable), gid.json1.serializable.Serializable._getGType);
            if (_klass && _klass.deserializeProperty)
              return (cast(typeof(&_vfuncDeserializePropertyTramp))_klass.deserializeProperty)(serializable, propertyName, value, pspec, propertyNode);
            return typeof(return).init;
          }

          bool _dretval;
          string _propertyName = propertyName.fromCString!(No.Free);
          gid.gobject2.value.Value _value;
          auto _propertyNode = propertyNode ? new gid.json1.node.Node(cast(void*)propertyNode, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDeserializeProperty(_propertyName, _value, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, _propertyNode);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.serializable.Serializable.vfuncDeserializeProperty");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }
          if (_propertyNode)
            _propertyNode._cUnborrow;

          return _retval;
        }

        _klass.deserializeProperty = cast(typeof(_klass.deserializeProperty))&_vfuncDeserializePropertyTramp;
        break;
      }
      case "find_property":
      {
        static extern(C) GParamSpec* _vfuncFindPropertyTramp(JsonSerializable* serializable, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)serializable);
          if (!_obj)
          {
            auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)serializable), gid.json1.serializable.Serializable._getGType);
            if (_klass && _klass.findProperty)
              return (cast(typeof(&_vfuncFindPropertyTramp))_klass.findProperty)(serializable, name);
            return typeof(return).init;
          }

          gid.gobject2.param_spec.ParamSpec _dretval;
          string _name = name.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncFindProperty(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.serializable.Serializable.vfuncFindProperty");
          }
          auto _retval = _dretval ? cast(GParamSpec*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.findProperty = cast(typeof(_klass.findProperty))&_vfuncFindPropertyTramp;
        break;
      }
      case "get_property":
      {
        static extern(C) void _vfuncGetPropertyTramp(JsonSerializable* serializable, GParamSpec* pspec, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)serializable);
          if (!_obj)
          {
            auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)serializable), gid.json1.serializable.Serializable._getGType);
            if (_klass && _klass.getProperty)
              return (cast(typeof(&_vfuncGetPropertyTramp))_klass.getProperty)(serializable, pspec, value);
            return;
          }

          gid.gobject2.value.Value _value;

          try
          {
            _obj.vfuncGetProperty(pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.serializable.Serializable.vfuncGetProperty");
          }
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

        }

        _klass.getProperty = cast(typeof(_klass.getProperty))&_vfuncGetPropertyTramp;
        break;
      }
      case "serialize_property":
      {
        static extern(C) JsonNode* _vfuncSerializePropertyTramp(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)serializable);
          if (!_obj)
          {
            auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)serializable), gid.json1.serializable.Serializable._getGType);
            if (_klass && _klass.serializeProperty)
              return (cast(typeof(&_vfuncSerializePropertyTramp))_klass.serializeProperty)(serializable, propertyName, value, pspec);
            return typeof(return).init;
          }

          gid.json1.node.Node _dretval;
          string _propertyName = propertyName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSerializeProperty(_propertyName, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.serializable.Serializable.vfuncSerializeProperty");
          }
          auto _retval = _dretval ? cast(JsonNode*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.serializeProperty = cast(typeof(_klass.serializeProperty))&_vfuncSerializePropertyTramp;
        break;
      }
      case "set_property":
      {
        static extern(C) void _vfuncSetPropertyTramp(JsonSerializable* serializable, GParamSpec* pspec, const(GValue)* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)serializable);
          if (!_obj)
          {
            auto _klass = cast(JsonSerializableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)serializable), gid.json1.serializable.Serializable._getGType);
            if (_klass && _klass.setProperty)
              return (cast(typeof(&_vfuncSetPropertyTramp))_klass.setProperty)(serializable, pspec, value);
            return;
          }

          try
          {
            _obj.vfuncSetProperty(pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, value ? new gid.gobject2.value.Value(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.json1.serializable.Serializable.vfuncSetProperty");
          }
        }

        _klass.setProperty = cast(typeof(_klass.setProperty))&_vfuncSetPropertyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.json1.serializable.Serializable]
template SerializableGidBuilderT()
{
}
