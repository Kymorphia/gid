/// Module for [Serializable] interface mixin
module json.serializable_mixin;

public import json.serializable_iface_proxy;
public import gid.gid;
public import gobject.param_spec;
public import gobject.value;
public import json.c.functions;
public import json.c.types;
public import json.node;
public import json.types;

/**
    [json.serializable.Serializable] is an interface for controlling the serialization
    and deserialization of [gobject.object.ObjectWrap] classes.
    
    Implementing this interface allows controlling how the class is going
    to be serialized or deserialized by `func@Json.construct_gobject` and
    `func@Json.serialize_gobject`, respectively.
*/
template SerializableT()
{

  /**
      Calls the default implementation of the `vfuncJson.Serializable.deserialize_property`
      virtual function.
      
      This function can be used inside a custom implementation of the
      `deserialize_property()` virtual function in lieu of calling the
      default implementation through `[gobject.global.typeDefaultInterfacePeek]`:
      
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
  override bool defaultDeserializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec, json.node.Node propertyNode)
  {
    bool _retval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _retval = cast(bool)json_serializable_default_deserialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, propertyNode ? cast(JsonNode*)propertyNode._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls the default implementation of the `vfuncJson.Serializable.serialize_property`
      virtual function.
      
      This function can be used inside a custom implementation of the
      `serialize_property()` virtual function in lieu of calling the
      default implementation through `[gobject.global.typeDefaultInterfacePeek]`:
      
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
  override json.node.Node defaultSerializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec)
  {
    JsonNode* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = json_serializable_default_serialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asks a [json.serializable.Serializable] implementation to deserialize the
      property contained inside `property_node` and place its value
      into `value`.
      
      The `value` can be:
      
      $(LIST
        * an empty [gobject.value.Value] initialized by `G_VALUE_INIT`, which will be automatically
          initialized with the expected type of the property by using the given
          property description (since JSON-GLib 1.6)
        * a [gobject.value.Value] initialized with the expected type of the property
      )
        
      This function will not be called for properties that are marked as
      as `G_PARAM_CONSTRUCT_ONLY`.
  
      Params:
        propertyName = the name of the property to serialize
        value = a pointer to an uninitialized value
        pspec = a property description
        propertyNode = the JSON node containing the serialized property
      Returns: `TRUE` if the property was successfully deserialized
  */
  override bool deserializeProperty(string propertyName, out gobject.value.Value value, gobject.param_spec.ParamSpec pspec, json.node.Node propertyNode)
  {
    bool _retval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    GValue _value;
    _retval = cast(bool)json_serializable_deserialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, &_value, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, propertyNode ? cast(JsonNode*)propertyNode._cPtr(No.Dup) : null);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.find_property` implementation on
      the [json.serializable.Serializable] instance, which will return the property
      description for the given name.
  
      Params:
        name = the name of the property
      Returns: the property description
  */
  override gobject.param_spec.ParamSpec findProperty(string name)
  {
    GParamSpec* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = json_serializable_find_property(cast(JsonSerializable*)this._cPtr, _name);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.get_property` implementation
      on the [json.serializable.Serializable] instance, which will get the value of
      the given property.
  
      Params:
        pspec = a property description
        value = return location for the property value
  */
  override void getProperty(gobject.param_spec.ParamSpec pspec, out gobject.value.Value value)
  {
    GValue _value;
    json_serializable_get_property(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Calls the `vfuncJson.Serializable.list_properties` implementation on
      the [json.serializable.Serializable] instance, which will return the list of serializable
      properties.
      Returns: the serializable
          properties of the object
  */
  override gobject.param_spec.ParamSpec[] listProperties()
  {
    GParamSpec** _cretval;
    uint _cretlength;
    _cretval = json_serializable_list_properties(cast(JsonSerializable*)this._cPtr, &_cretlength);
    gobject.param_spec.ParamSpec[] _retval;

    if (_cretval)
    {
      _retval = new gobject.param_spec.ParamSpec[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gobject.param_spec.ParamSpec(cast(void*)_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Asks a [json.serializable.Serializable] implementation to serialize an object
      property into a JSON node.
  
      Params:
        propertyName = the name of the property to serialize
        value = the value of the property to serialize
        pspec = a property description
      Returns: a node containing the serialized property
  */
  override json.node.Node serializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec)
  {
    JsonNode* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = json_serializable_serialize_property(cast(JsonSerializable*)this._cPtr, _propertyName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls the `vfuncJson.Serializable.set_property` implementation
      on the [json.serializable.Serializable] instance, which will set the property
      with the given value.
  
      Params:
        pspec = a property description
        value = the property value to set
  */
  override void setProperty(gobject.param_spec.ParamSpec pspec, gobject.value.Value value)
  {
    json_serializable_set_property(cast(JsonSerializable*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }
}
