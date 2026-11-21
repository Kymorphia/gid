/// D types for json1 library
module gid.json1.types;

import gid.core.gid;
import gid.json1.array;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.node;
import gid.json1.object;


// Enums

/** */
alias NodeType = JsonNodeType;

/** */
alias ParserError = JsonParserError;

/** */
alias PathError = JsonPathError;

/** */
alias ReaderError = JsonReaderError;

// Callbacks

/**
    The function to be passed to [gid.json1.array.Array.foreachElement].
    
    You should not add or remove elements to and from array within
    this function.
    
    It is safe to change the value of element_node.

    Params:
      array = the iterated JSON array (modified in place, changes are seen by the caller)
      index = the index of the element
      elementNode = the value of the element at the given index_ (modified in place, changes are seen by the caller)
*/
alias ArrayForeach = void delegate(gid.json1.array.Array array, uint index, gid.json1.node.Node elementNode);

/**
    Deserializes the contents of the passed [gid.json1.node.Node] into a `GBoxed`, for instance:
    
    ```c
    static gpointer
    my_point_deserialize (JsonNode *node)
    {
      double x = 0.0, y = 0.0;
    
      if (JSON_NODE_HOLDS_ARRAY (node))
        {
          JsonArray *array = json_node_get_array (node);
    
          if (json_array_get_length (array) == 2)
            {
              x = json_array_get_double_element (array, 0);
              y = json_array_get_double_element (array, 1);
            }
        }
      else if (JSON_NODE_HOLDS_OBJECT (node))
        {
          JsonObject *obj = json_node_get_object (node);
    
          x = json_object_get_double_member_with_default (obj, "x", 0.0);
          y = json_object_get_double_member_with_default (obj, "y", 0.0);
        }
    
      // my_point_new() is defined elsewhere
      return my_point_new (x, y);
    }
    ```

    Params:
      node = a node tree representing a boxed data (modified in place, changes are seen by the caller)
    Returns: the newly created boxed structure
*/
alias BoxedDeserializeFunc = void* delegate(gid.json1.node.Node node);

/**
    Serializes the passed `GBoxed` and stores it inside a [gid.json1.node.Node], for instance:
    
    ```c
    static JsonNode *
    my_point_serialize (gconstpointer boxed)
    {
      const MyPoint *point = boxed;
    
      g_autoptr(JsonBuilder) builder = json_builder_new ();
    
      json_builder_begin_object (builder);
      json_builder_set_member_name (builder, "x");
      json_builder_add_double_value (builder, point->x);
      json_builder_set_member_name (builder, "y");
      json_builder_add_double_value (builder, point->y);
      json_builder_end_object (builder);
    
      return json_builder_get_root (builder);
    }
    ```

    Params:
      boxed = a boxed data structure
    Returns: the newly created JSON node tree representing the boxed data
*/
alias BoxedSerializeFunc = gid.json1.node.Node delegate(const(void)* boxed);

/**
    The function to be passed to [gid.json1.object.ObjectWrap.foreachMember].
    
    You should not add or remove members to and from object within
    this function.
    
    It is safe to change the value of member_node.

    Params:
      object = the iterated JSON object (modified in place, changes are seen by the caller)
      memberName = the name of the member
      memberNode = the value of the member (modified in place, changes are seen by the caller)
*/
alias ObjectForeach = void delegate(gid.json1.object.ObjectWrap object, string memberName, gid.json1.node.Node memberNode);

/**
    Json major version component (e.g. 1 if `JSON_VERSION` is "1.2.3")
*/
enum MAJOR_VERSION = 1;

/**
    Json micro version component (e.g. 3 if `JSON_VERSION` is "1.2.3")
*/
enum MICRO_VERSION = 8;

/**
    Json minor version component (e.g. 2 if `JSON_VERSION` is "1.2.3")
*/
enum MINOR_VERSION = 10;

/**
    The maximum recursion depth for a JSON tree.
*/
enum PARSER_MAX_RECURSION_DEPTH = 1024;

/**
    The version of JSON-GLib, encoded as a string, useful for printing and
    concatenation.
*/
enum VERSION_S = "1.10.8";
