/// Module for [Node] class
module json.node;

import gid.gid;
import gobject.boxed;
import gobject.types;
import gobject.value;
import json.array;
import json.c.functions;
import json.c.types;
import json.object;
import json.types;

/**
    A generic container of JSON data types.
    
    [json.node.Node] can contain fundamental types (integers, booleans, floating point
    numbers, strings) and complex types (arrays and objects).
    
    When parsing a JSON data stream you extract the root node and walk
    the node tree by retrieving the type of data contained inside the
    node with the `JSON_NODE_TYPE` macro. If the node contains a fundamental
    type you can retrieve a copy of the [gobject.value.Value] holding it with the
    [json.node.Node.getValue] function, and then use the [gobject.value.Value] API to extract
    the data; if the node contains a complex type you can retrieve the
    [json.object.ObjectWrap] or the [json.array.Array] using [json.node.Node.getObject]
    or [json.node.Node.getArray] respectively, and then retrieve the nodes
    they contain.
    
    A [json.node.Node] may be marked as immutable using [json.node.Node.seal]. This
    marks the node and all its descendents as read-only, and means that
    subsequent calls to setter functions (such as [json.node.Node.setArray])
    on them will abort as a programmer error. By marking a node tree as
    immutable, it may be referenced in multiple places and its hash value cached
    for fast lookups, without the possibility of a value deep within the tree
    changing and affecting hash values. Immutable nodes may be passed to
    functions which retain a reference to them without needing to take a copy.
    
    A [json.node.Node] supports two types of memory management: `malloc`/`free`
    semantics, and reference counting semantics. The two may be mixed to a
    limited extent: nodes may be allocated (which gives them a reference count
    of 1), referenced one or more times, unreferenced exactly that number of
    times (using [json.node.Node.unref]), then either unreferenced exactly
    once more or freed (using [json.node.Node.free]) to destroy them.
    The [json.node.Node.free] function must not be used when a node might
    have a reference count not equal to 1. To this end, JSON-GLib uses
    [json.node.Node.copy] and [json.node.Node.unref] internally.
*/
class Node : gobject.boxed.Boxed
{

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
    return cast(void function())json_node_get_type != &gidSymbolNotFound ? json_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Node self()
  {
    return this;
  }

  /**
      Allocates a new, uninitialized node.
      
      Use [json.node.Node.init_] and its variants to initialize the returned value.
      Returns: the newly allocated node
  */
  static json.node.Node alloc()
  {
    JsonNode* _cretval;
    _cretval = json_node_alloc();
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new node holding the given type.
      
      This is a convenience function for [json.node.Node.alloc] and
      [json.node.Node.init_], and it's the equivalent of:
      
      ```c
         json_node_init (json_node_alloc (), type);
      ```
  
      Params:
        type = the type of the node to create
      Returns: the newly created node
  */
  this(json.types.NodeType type)
  {
    JsonNode* _cretval;
    _cretval = json_node_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Copies node.
      
      If the node contains complex data types, their reference
      counts are increased, regardless of whether the node is mutable or
      immutable.
      
      The copy will be immutable if, and only if, node is immutable. However,
      there should be no need to copy an immutable node.
      Returns: the copied of the given node
  */
  json.node.Node copy()
  {
    JsonNode* _cretval;
    _cretval = json_node_copy(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the JSON array inside node.
      
      The reference count of the returned array is increased.
      
      It is a programmer error to call this on a node which doesn’t hold an
      array value. Use `JSON_NODE_HOLDS_ARRAY` first.
      Returns: the JSON array with its reference
          count increased.
  */
  json.array.Array dupArray()
  {
    JsonArray* _cretval;
    _cretval = json_node_dup_array(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.array.Array(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the object inside node.
      
      The reference count of the returned object is increased.
      
      It is a programmer error to call this on a node which doesn’t hold an
      object value. Use `JSON_NODE_HOLDS_OBJECT` first.
      Returns: the JSON object
  */
  json.object.ObjectWrap dupObject()
  {
    JsonObject* _cretval;
    _cretval = json_node_dup_object(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.object.ObjectWrap(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a copy of the string value stored inside a node.
      
      If the node does not hold a string value, `NULL` is returned.
      Returns: a copy of the string
          inside the node
  */
  string dupString()
  {
    char* _cretval;
    _cretval = json_node_dup_string(cast(JsonNode*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Check whether `a` and `b` are equal node, meaning they have the same
      type and same values (checked recursively).
      
      Note that integer values are compared numerically, ignoring type, so a
      double value 4.0 is equal to the integer value 4.
  
      Params:
        b = another JSON node
      Returns: `TRUE` if `a` and `b` are equal; `FALSE` otherwise
  */
  bool equal(json.node.Node b)
  {
    bool _retval;
    _retval = cast(bool)json_node_equal(cast(JsonNode*)this._cPtr, b ? cast(JsonNode*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the JSON array stored inside a node.
      
      It is a programmer error to call this on a node which doesn’t hold an
      array value. Use `JSON_NODE_HOLDS_ARRAY` first.
      Returns: the JSON array
  */
  json.array.Array getArray()
  {
    JsonArray* _cretval;
    _cretval = json_node_get_array(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.array.Array(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the boolean value stored inside a node.
      
      If the node holds an integer or double value which is zero, `FALSE` is
      returned; otherwise `TRUE` is returned.
      
      If the node holds a [json.types.NodeType.Null] value or a value of another
      non-boolean type, `FALSE` is returned.
      Returns: a boolean value.
  */
  bool getBoolean()
  {
    bool _retval;
    _retval = cast(bool)json_node_get_boolean(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the double value stored inside a node.
      
      If the node holds an integer value, it is returned as a double.
      
      If the node holds a `FALSE` boolean value, `0.0` is returned; otherwise
      a non-zero double is returned.
      
      If the node holds a [json.types.NodeType.Null] value or a value of another
      non-double type, `0.0` is returned.
      Returns: a double value.
  */
  double getDouble()
  {
    double _retval;
    _retval = json_node_get_double(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Gets the integer value stored inside a node.
      
      If the node holds a double value, its integer component is returned.
      
      If the node holds a `FALSE` boolean value, `0` is returned; otherwise,
      a non-zero integer is returned.
      
      If the node holds a [json.types.NodeType.Null] value or a value of another
      non-integer type, `0` is returned.
      Returns: an integer value.
  */
  long getInt()
  {
    long _retval;
    _retval = json_node_get_int(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the type of a node.
      Returns: the type of the node
  */
  json.types.NodeType getNodeType()
  {
    JsonNodeType _cretval;
    _cretval = json_node_get_node_type(cast(JsonNode*)this._cPtr);
    json.types.NodeType _retval = cast(json.types.NodeType)_cretval;
    return _retval;
  }

  /**
      Retrieves the object stored inside a node.
      
      It is a programmer error to call this on a node which doesn’t hold an
      object value. Use `JSON_NODE_HOLDS_OBJECT` first.
      Returns: the JSON object
  */
  json.object.ObjectWrap getObject()
  {
    JsonObject* _cretval;
    _cretval = json_node_get_object(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.object.ObjectWrap(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the parent node of the given node.
      Returns: the parent node, or `NULL` if node
          is the root node
  */
  json.node.Node getParent()
  {
    JsonNode* _cretval;
    _cretval = json_node_get_parent(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the string value stored inside a node.
      
      If the node does not hold a string value, `NULL` is returned.
      Returns: a string value.
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = json_node_get_string(cast(JsonNode*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves a value from a node and copies into value.
      
      When done using it, call `[gobject.value.Value.unset]` on the [gobject.value.Value] to free the
      associated resources.
      
      It is a programmer error to call this on a node which doesn’t hold a scalar
      value. Use `JSON_NODE_HOLDS_VALUE` first.
  
      Params:
        value = return location for an uninitialized value
  */
  void getValue(out gobject.value.Value value)
  {
    GValue _value;
    json_node_get_value(cast(JsonNode*)this._cPtr, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Returns the `GType` of the payload of the node.
      
      For [json.types.NodeType.Null] nodes, the returned type is `G_TYPE_INVALID`.
      Returns: the type for the payload
  */
  gobject.types.GType getValueType()
  {
    gobject.types.GType _retval;
    _retval = json_node_get_value_type(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Calculate a hash value for the given key.
      
      The hash is calculated over the node and its value, recursively. If the node
      is immutable, this is a fast operation; otherwise, it scales proportionally
      with the size of the node’s value (for example, with the number of members
      in the JSON object if this node contains an object).
      Returns: hash value for key
  */
  uint hash()
  {
    uint _retval;
    _retval = json_node_hash(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a node to a specific type.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        type = the type of JSON node to initialize node to
      Returns: the initialized node
  */
  json.node.Node init_(json.types.NodeType type)
  {
    JsonNode* _cretval;
    _cretval = json_node_init(cast(JsonNode*)this._cPtr, type);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Array] and sets array into it.
      
      This function will take a reference on array.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        array = the JSON array to initialize node with, or `NULL`
      Returns: the initialized node
  */
  json.node.Node initArray(json.array.Array array = null)
  {
    JsonNode* _cretval;
    _cretval = json_node_init_array(cast(JsonNode*)this._cPtr, array ? cast(JsonArray*)array._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Value] and sets value into it.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        value = a boolean value
      Returns: the initialized node
  */
  json.node.Node initBoolean(bool value)
  {
    JsonNode* _cretval;
    _cretval = json_node_init_boolean(cast(JsonNode*)this._cPtr, value);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Value] and sets value into it.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        value = a floating point value
      Returns: the initialized node
  */
  json.node.Node initDouble(double value)
  {
    JsonNode* _cretval;
    _cretval = json_node_init_double(cast(JsonNode*)this._cPtr, value);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Value] and sets value into it.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        value = an integer
      Returns: the initialized node
  */
  json.node.Node initInt(long value)
  {
    JsonNode* _cretval;
    _cretval = json_node_init_int(cast(JsonNode*)this._cPtr, value);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Null].
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
      Returns: the initialized node
  */
  json.node.Node initNull()
  {
    JsonNode* _cretval;
    _cretval = json_node_init_null(cast(JsonNode*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Object] and sets object into it.
      
      This function will take a reference on object.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        object = the JSON object to initialize node with, or `NULL`
      Returns: the initialized node
  */
  json.node.Node initObject(json.object.ObjectWrap object = null)
  {
    JsonNode* _cretval;
    _cretval = json_node_init_object(cast(JsonNode*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes node to [json.types.NodeType.Value] and sets value into it.
      
      If the node has already been initialized once, it will be reset to
      the given type, and any data contained will be cleared.
  
      Params:
        value = a string value
      Returns: the initialized node
  */
  json.node.Node initString(string value = null)
  {
    JsonNode* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = json_node_init_string(cast(JsonNode*)this._cPtr, _value);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Check whether the given node has been marked as immutable by calling
      [json.node.Node.seal] on it.
      Returns: `TRUE` if the node is immutable
  */
  bool isImmutable()
  {
    bool _retval;
    _retval = cast(bool)json_node_is_immutable(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether node is a [json.types.NodeType.Null].
      
      A [json.types.NodeType.Null] node is not the same as a `NULL` node; a [json.types.NodeType.Null]
      represents a literal `null` value in the JSON tree.
      Returns: `TRUE` if the node is null
  */
  bool isNull()
  {
    bool _retval;
    _retval = cast(bool)json_node_is_null(cast(JsonNode*)this._cPtr);
    return _retval;
  }

  /**
      Seals the given node, making it immutable to further changes.
      
      In order to be sealed, the node must have a type and value set. The value
      will be recursively sealed — if the node holds an object, that JSON object
      will be sealed, etc.
      
      If the `node` is already immutable, this is a no-op.
  */
  void seal()
  {
    json_node_seal(cast(JsonNode*)this._cPtr);
  }

  /**
      Sets array inside node.
      
      The reference count of array is increased.
      
      It is a programmer error to call this on a node which doesn’t hold an
      array value. Use `JSON_NODE_HOLDS_ARRAY` first.
  
      Params:
        array = a JSON array
  */
  void setArray(json.array.Array array)
  {
    json_node_set_array(cast(JsonNode*)this._cPtr, array ? cast(JsonArray*)array._cPtr(No.Dup) : null);
  }

  /**
      Sets value as the boolean content of the node, replacing any existing
      content.
      
      It is an error to call this on an immutable node, or on a node which is not
      a value node.
  
      Params:
        value = a boolean value
  */
  void setBoolean(bool value)
  {
    json_node_set_boolean(cast(JsonNode*)this._cPtr, value);
  }

  /**
      Sets value as the double content of the node, replacing any existing
      content.
      
      It is an error to call this on an immutable node, or on a node which is not
      a value node.
  
      Params:
        value = a double value
  */
  void setDouble(double value)
  {
    json_node_set_double(cast(JsonNode*)this._cPtr, value);
  }

  /**
      Sets value as the integer content of the node, replacing any existing
      content.
      
      It is an error to call this on an immutable node, or on a node which is not
      a value node.
  
      Params:
        value = an integer value
  */
  void setInt(long value)
  {
    json_node_set_int(cast(JsonNode*)this._cPtr, value);
  }

  /**
      Sets objects inside node.
      
      The reference count of object is increased.
      
      If object is `NULL`, the node’s existing object is cleared.
      
      It is an error to call this on an immutable node, or on a node which is not
      an object node.
  
      Params:
        object = a JSON object
  */
  void setObject(json.object.ObjectWrap object = null)
  {
    json_node_set_object(cast(JsonNode*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null);
  }

  /**
      Sets the parent node for the given `node`.
      
      It is an error to call this with an immutable parent.
      
      The node may be immutable.
  
      Params:
        parent = the parent node
  */
  void setParent(json.node.Node parent = null)
  {
    json_node_set_parent(cast(JsonNode*)this._cPtr, parent ? cast(JsonNode*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets value as the string content of the node, replacing any existing
      content.
      
      It is an error to call this on an immutable node, or on a node which is not
      a value node.
  
      Params:
        value = a string value
  */
  void setString(string value)
  {
    const(char)* _value = value.toCString(No.Alloc);
    json_node_set_string(cast(JsonNode*)this._cPtr, _value);
  }

  /**
      Sets a scalar value inside the given node.
      
      The contents of the given [gobject.value.Value] are copied into the [json.node.Node].
      
      The following [gobject.value.Value] types have a direct mapping to JSON types:
      
       $(LIST
          * `G_TYPE_INT64`
          * `G_TYPE_DOUBLE`
          * `G_TYPE_BOOLEAN`
          * `G_TYPE_STRING`
       )
         
      JSON-GLib will also automatically promote the following [gobject.value.Value] types:
      
       $(LIST
          * `G_TYPE_INT` to `G_TYPE_INT64`
          * `G_TYPE_FLOAT` to `G_TYPE_DOUBLE`
       )
         
      It is an error to call this on an immutable node, or on a node which is not
      a value node.
  
      Params:
        value = the value to set
  */
  void setValue(gobject.value.Value value)
  {
    json_node_set_value(cast(JsonNode*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets array inside node.
      
      The reference count of array is not increased.
      
      It is a programmer error to call this on a node which doesn’t hold an
      array value. Use `JSON_NODE_HOLDS_ARRAY` first.
  
      Params:
        array = a JSON array
  */
  void takeArray(json.array.Array array)
  {
    json_node_take_array(cast(JsonNode*)this._cPtr, array ? cast(JsonArray*)array._cPtr(Yes.Dup) : null);
  }

  /**
      Sets object inside node.
      
      The reference count of object is not increased.
      
      It is an error to call this on an immutable node, or on a node which is not
      an object node.
  
      Params:
        object = a JSON object
  */
  void takeObject(json.object.ObjectWrap object)
  {
    json_node_take_object(cast(JsonNode*)this._cPtr, object ? cast(JsonObject*)object._cPtr(Yes.Dup) : null);
  }

  /**
      Retrieves the user readable name of the data type contained by node.
      
      **Note**: The name is only meant for debugging purposes, and there is no
      guarantee the name will stay the same across different versions.
      Returns: a string containing the name of the type
  */
  string typeName()
  {
    const(char)* _cretval;
    _cretval = json_node_type_name(cast(JsonNode*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
