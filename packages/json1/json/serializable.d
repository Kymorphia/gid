/// Module for [Serializable] interface
module json.serializable;

public import json.serializable_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gobject.param_spec;
import gobject.value;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

/**
    [json.serializable.Serializable] is an interface for controlling the serialization
    and deserialization of [gobject.object.ObjectWrap] classes.
    
    Implementing this interface allows controlling how the class is going
    to be serialized or deserialized by `func@Json.construct_gobject` and
    `func@Json.serialize_gobject`, respectively.
*/
interface Serializable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())json_serializable_get_type != &gidSymbolNotFound ? json_serializable_get_type() : cast(GType)0;
  }

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
  bool defaultDeserializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec, json.node.Node propertyNode);

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
  json.node.Node defaultSerializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

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
  bool deserializeProperty(string propertyName, out gobject.value.Value value, gobject.param_spec.ParamSpec pspec, json.node.Node propertyNode);

  /**
      Calls the `vfuncJson.Serializable.find_property` implementation on
      the [json.serializable.Serializable] instance, which will return the property
      description for the given name.
  
      Params:
        name = the name of the property
      Returns: the property description
  */
  gobject.param_spec.ParamSpec findProperty(string name);

  /**
      Calls the `vfuncJson.Serializable.get_property` implementation
      on the [json.serializable.Serializable] instance, which will get the value of
      the given property.
  
      Params:
        pspec = a property description
        value = return location for the property value
  */
  void getProperty(gobject.param_spec.ParamSpec pspec, out gobject.value.Value value);

  /**
      Calls the `vfuncJson.Serializable.list_properties` implementation on
      the [json.serializable.Serializable] instance, which will return the list of serializable
      properties.
      Returns: the serializable
          properties of the object
  */
  gobject.param_spec.ParamSpec[] listProperties();

  /**
      Asks a [json.serializable.Serializable] implementation to serialize an object
      property into a JSON node.
  
      Params:
        propertyName = the name of the property to serialize
        value = the value of the property to serialize
        pspec = a property description
      Returns: a node containing the serialized property
  */
  json.node.Node serializeProperty(string propertyName, gobject.value.Value value, gobject.param_spec.ParamSpec pspec);

  /**
      Calls the `vfuncJson.Serializable.set_property` implementation
      on the [json.serializable.Serializable] instance, which will set the property
      with the given value.
  
      Params:
        pspec = a property description
        value = the property value to set
  */
  void setProperty(gobject.param_spec.ParamSpec pspec, gobject.value.Value value);
}

interface SerializableGidBuilderImpl(T)
{
}
