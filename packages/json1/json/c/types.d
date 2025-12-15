/// C types for json1 library
module json.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;

/**
    Indicates the content of a node.
*/
enum JsonNodeType
{
  /**
      The node contains a JSON object
  */
  Object = 0,

  /**
      The node contains a JSON array
  */
  Array = 1,

  /**
      The node contains a fundamental type
  */
  Value = 2,

  /**
      Special type, for nodes containing null
  */
  Null = 3,
}

/**
    Error codes for `JSON_PARSER_ERROR`.
    
    This enumeration can be extended at later date
*/
enum JsonParserError
{
  /**
      parse error
  */
  Parse = 0,

  /**
      unexpected trailing comma
  */
  TrailingComma = 1,

  /**
      expected comma
  */
  MissingComma = 2,

  /**
      expected colon
  */
  MissingColon = 3,

  /**
      invalid bareword
  */
  InvalidBareword = 4,

  /**
      empty member name (Since: 0.16)
  */
  EmptyMemberName = 5,

  /**
      invalid data (Since: 0.18)
  */
  InvalidData = 6,

  /**
      unknown error
  */
  Unknown = 7,
}

/**
    Error codes for `JSON_PATH_ERROR`.
    
    This enumeration can be extended at later date
*/
enum JsonPathError
{
  /**
      Invalid query
  */
  Query = 0,
}

/**
    Error codes for `JSON_READER_ERROR`.
    
    This enumeration can be extended at later date
*/
enum JsonReaderError
{
  /**
      No array found at the current position
  */
  NoArray = 0,

  /**
      Index out of bounds
  */
  InvalidIndex = 1,

  /**
      No object found at the current position
  */
  NoObject = 2,

  /**
      Member not found
  */
  InvalidMember = 3,

  /**
      No valid node found at the current position
  */
  InvalidNode = 4,

  /**
      The node at the current position does not
        hold a value
  */
  NoValue = 5,

  /**
      The node at the current position does not
        hold a value of the desired type
  */
  InvalidType = 6,
}

/**
    [json.array.Array] is the representation of the array type inside JSON.
    
    A [json.array.Array] contains [json.node.Node] elements, which may contain
    fundamental types, other arrays or objects.
    
    Since arrays can be arbitrarily big, copying them can be expensive; for
    this reason, they are reference counted. You can control the lifetime of
    a [json.array.Array] using [json.array.Array.ref_] and [json.array.Array.unref].
    
    To append an element, use [json.array.Array.addElement].
    
    To extract an element at a given index, use [json.array.Array.getElement].
    
    To retrieve the entire array in list form, use [json.array.Array.getElements].
    
    To retrieve the length of the array, use [json.array.Array.getLength].
*/
struct JsonArray;

/**
    [json.builder.Builder] provides an object for generating a JSON tree.
    
    The root of the JSON tree can be either a [json.object.ObjectWrap] or a [json.array.Array].
    Thus the first call must necessarily be either
    [json.builder.Builder.beginObject] or [json.builder.Builder.beginArray].
    
    For convenience to language bindings, most [json.builder.Builder] method return the
    instance, making it easy to chain function calls.
    
    ## Using [json.builder.Builder]
    
    ```c
    g_autoptr(JsonBuilder) builder = json_builder_new ();
    
    json_builder_begin_object (builder);
    
    json_builder_set_member_name (builder, "url");
    json_builder_add_string_value (builder, "http://www.gnome.org/img/flash/two-thirty.png");
    
    json_builder_set_member_name (builder, "size");
    json_builder_begin_array (builder);
    json_builder_add_int_value (builder, 652);
    json_builder_add_int_value (builder, 242);
    json_builder_end_array (builder);
    
    json_builder_end_object (builder);
    
    g_autoptr(JsonNode) root = json_builder_get_root (builder);
    
    g_autoptr(JsonGenerator) gen = json_generator_new ();
    json_generator_set_root (gen, root);
    g_autofree char *str = json_generator_to_data (gen, NULL);
    
    // str now contains the following JSON data
    // { "url" : "http://www.gnome.org/img/flash/two-thirty.png", "size" : [ 652, 242 ] }
    ```
*/
struct JsonBuilder
{
  /** */
  GObject parentInstance;

  /** */
  JsonBuilderPrivate* priv;
}

/** */
struct JsonBuilderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() JsonReserved1;

  /** */
  extern(C) void function() JsonReserved2;
}

/** */
struct JsonBuilderPrivate;

/**
    [json.generator.Generator] provides an object for generating a JSON data stream
    from a tree of [json.node.Node] instances, and put it into a buffer
    or a file.
*/
struct JsonGenerator
{
  /** */
  GObject parentInstance;

  /** */
  JsonGeneratorPrivate* priv;
}

/** */
struct JsonGeneratorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() JsonReserved1;

  /** */
  extern(C) void function() JsonReserved2;

  /** */
  extern(C) void function() JsonReserved3;

  /** */
  extern(C) void function() JsonReserved4;
}

/** */
struct JsonGeneratorPrivate;

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
struct JsonNode;

/**
    An iterator object used to iterate over the members of a JSON object.
    
    [json.object_iter.ObjectIter] must be allocated on the stack and initialised using
    [json.object_iter.ObjectIter.init_] or [json.object_iter.ObjectIter.initOrdered].
    
    The iterator is invalidated if the object is modified during
    iteration.
    
    All the fields in the [json.object_iter.ObjectIter] structure are private and should
    never be accessed directly.
*/
struct JsonObjectIter
{
  /** */
  void*[6] privPointer;

  /** */
  int[2] privInt;

  /** */
  gboolean[1] privBoolean;
}

/**
    [json.object.ObjectWrap] is the representation of the object type inside JSON.
    
    A [json.object.ObjectWrap] contains [json.node.Node] "members", which may contain
    fundamental types, arrays or other objects; each member of an object is
    accessed using a unique string, or "name".
    
    Since objects can be arbitrarily big, copying them can be expensive; for
    this reason they are reference counted. You can control the lifetime of
    a [json.object.ObjectWrap] using [json.object.ObjectWrap.ref_] and [json.object.ObjectWrap.unref].
    
    To add or overwrite a member with a given name, use [json.object.ObjectWrap.setMember].
    
    To extract a member with a given name, use [json.object.ObjectWrap.getMember].
    
    To retrieve the list of members, use [json.object.ObjectWrap.getMembers].
    
    To retrieve the size of the object (that is, the number of members it has),
    use [json.object.ObjectWrap.getSize].
*/
struct JsonObject;

/**
    [json.parser.Parser] provides an object for parsing a JSON data stream, either
    inside a file or inside a static buffer.
    
    ## Using [json.parser.Parser]
    
    The [json.parser.Parser] API is fairly simple:
    
    ```c
    gboolean
    parse_json (const char *filename)
    {
      g_autoptr(JsonParser) parser = json_parser_new ();
      g_autoptr(GError) error = NULL
    
      json_parser_load_from_file (parser, filename, &error);
      if (error != NULL)
        {
          g_critical ("Unable to parse '%s': %s", filename, error->message);
          return FALSE;
        }
    
      g_autoptr(JsonNode) root = json_parser_get_root (parser);
    
      // manipulate the object tree from the root node
    
      return TRUE
    }
    ```
    
    By default, the entire process of loading the data and parsing it is
    synchronous; the [json.parser.Parser.loadFromStreamAsync] API will
    load the data asynchronously, but parse it in the main context as the
    signals of the parser must be emitted in the same thread. If you do
    not use signals, and you wish to also parse the JSON data without blocking,
    you should use a [gio.task.Task] and the synchronous [json.parser.Parser] API inside the
    task itself.
*/
struct JsonParser
{
  /** */
  GObject parentInstance;

  /** */
  JsonParserPrivate* priv;
}

/**
    The class structure for the JsonParser type.
*/
struct JsonParserClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(JsonParser* parser) parseStart;

  /** */
  extern(C) void function(JsonParser* parser) objectStart;

  /** */
  extern(C) void function(JsonParser* parser, JsonObject* object, const(char)* memberName) objectMember;

  /** */
  extern(C) void function(JsonParser* parser, JsonObject* object) objectEnd;

  /** */
  extern(C) void function(JsonParser* parser) arrayStart;

  /** */
  extern(C) void function(JsonParser* parser, JsonArray* array, int index) arrayElement;

  /** */
  extern(C) void function(JsonParser* parser, JsonArray* array) arrayEnd;

  /** */
  extern(C) void function(JsonParser* parser) parseEnd;

  /** */
  extern(C) void function(JsonParser* parser, const(GError)* error) error;

  /** */
  extern(C) void function() JsonReserved1;

  /** */
  extern(C) void function() JsonReserved2;

  /** */
  extern(C) void function() JsonReserved3;

  /** */
  extern(C) void function() JsonReserved4;

  /** */
  extern(C) void function() JsonReserved5;

  /** */
  extern(C) void function() JsonReserved6;

  /** */
  extern(C) void function() JsonReserved7;

  /** */
  extern(C) void function() JsonReserved8;
}

/** */
struct JsonParserPrivate;

/**
    [json.path.Path] is a simple class implementing the JSONPath syntax for extracting
    data out of a JSON tree.
    
    While the semantics of the JSONPath expressions are heavily borrowed by the
    XPath specification for XML, the syntax follows the ECMAScript origins of
    JSON.
    
    Once a [json.path.Path] instance has been created, it has to compile a JSONPath
    expression using [json.path.Path.compile] before being able to match it to
    a JSON tree; the same [json.path.Path] instance can be used to match multiple JSON
    trees. It it also possible to compile a new JSONPath expression using the
    same [json.path.Path] instance; the previous expression will be discarded only if
    the compilation of the new expression is successful.
    
    The simple convenience function [json.path.Path.query] can be used for
    one-off matching.
    
    ## Syntax of the JSONPath expressions
    
    A JSONPath expression is composed by path indices and operators.
    Each path index can either be a member name or an element index inside
    a JSON tree. A JSONPath expression must start with the `$` operator; each
    path index is separated using either the dot notation or the bracket
    notation, e.g.:
    
    ```
    // dot notation
    $.store.book[0].title
    
    // bracket notation
    $['store']['book'][0]['title']
    ```
    
    The available operators are:
    
    $(LIST
      * The `$` character represents the root node of the JSON tree, and
        matches the entire document.
      
      * Child nodes can either be matched using `.` or `[]`. For instance,
        both `$.store.book` and `$['store']['book']` match the contents of
        the book member of the store object.
      
      * Child nodes can be reached without specifying the whole tree structure
        through the recursive descent operator, or `..`. For instance,
        `$..author` matches all author member in every object.
      
      * Child nodes can grouped through the wildcard operator, or `*`. For
        instance, `$.store.book[*].author` matches all author members of any
        object element contained in the book array of the store object.
      
      * Element nodes can be accessed using their index (starting from zero)
        in the subscript operator `[]`. For instance, `$.store.book[0]` matches
        the first element of the book array of the store object.
      
      * Subsets of element nodes can be accessed using the set notation
        operator `[i,j,...]`. For instance, `$.store.book[0,2]` matches the
        elements 0 and 2 (the first and third) of the book array of the store
        object.
      
      * Slices of element nodes can be accessed using the slice notation
        operation `[start:end:step]`. If start is omitted, the starting index
        of the slice is implied to be zero; if end is omitted, the ending index
        of the slice is implied to be the length of the array; if step is
        omitted, the step of the slice is implied to be 1. For instance,
        `$.store.book[:2]` matches the first two elements of the book array
        of the store object.
    )
      
    More information about JSONPath is available on Stefan Gössner's
    [JSONPath website](http://goessner.net/articles/JsonPath/).
    
    ## Example of JSONPath matches
    
    The following example shows some of the results of using [json.path.Path]
    on a JSON tree. We use the following JSON description of a bookstore:
    
    ```json
    { "store": {
        "book": [
          { "category": "reference", "author": "Nigel Rees",
            "title": "Sayings of the Century", "price": "8.95"  },
          { "category": "fiction", "author": "Evelyn Waugh",
            "title": "Sword of Honour", "price": "12.99" },
          { "category": "fiction", "author": "Herman Melville",
            "title": "Moby Dick", "isbn": "0-553-21311-3",
            "price": "8.99" },
          { "category": "fiction", "author": "J. R. R. Tolkien",
            "title": "The Lord of the Rings", "isbn": "0-395-19395-8",
            "price": "22.99" }
        ],
        "bicycle": { "color": "red", "price": "19.95" }
      }
    }
    ```
    
    We can parse the JSON using [json.parser.Parser]:
    
    ```c
    JsonParser *parser = json_parser_new ();
    json_parser_load_from_data (parser, json_data, -1, NULL);
    ```
    
    If we run the following code:
    
    ```c
    JsonNode *result;
    JsonPath *path = json_path_new ();
    json_path_compile (path, "$.store..author", NULL);
    result = json_path_match (path, json_parser_get_root (parser));
    ```
    
    The `result` node will contain an array with all values of the
    author member of the objects in the JSON tree. If we use a
    [json.generator.Generator] to convert the `result` node to a string
    and print it:
    
    ```c
    JsonGenerator *generator = json_generator_new ();
    json_generator_set_root (generator, result);
    char *str = json_generator_to_data (generator, NULL);
    g_print ("Results: %s\n", str);
    ```
    
    The output will be:
    
    ```json
    ["Nigel Rees","Evelyn Waugh","Herman Melville","J. R. R. Tolkien"]
    ```
*/
struct JsonPath;

/** */
struct JsonPathClass;

/**
    [json.reader.Reader] provides a simple, cursor-based API for parsing a JSON DOM.
    
    It is similar, in spirit, to the XML Reader API.
    
    ## Using [json.reader.Reader]
    
    ```c
    g_autoptr(JsonParser) parser = json_parser_new ();
    
    // str is defined elsewhere
    json_parser_load_from_data (parser, str, -1, NULL);
    
    g_autoptr(JsonReader) reader = json_reader_new (json_parser_get_root (parser));
    
    json_reader_read_member (reader, "url");
      const char *url = json_reader_get_string_value (reader);
      json_reader_end_member (reader);
    
    json_reader_read_member (reader, "size");
      json_reader_read_element (reader, 0);
        int width = json_reader_get_int_value (reader);
        json_reader_end_element (reader);
      json_reader_read_element (reader, 1);
        int height = json_reader_get_int_value (reader);
        json_reader_end_element (reader);
      json_reader_end_member (reader);
    ```
    
    ## Error handling
    
    In case of error, [json.reader.Reader] will be set in an error state; all subsequent
    calls will simply be ignored until a function that resets the error state is
    called, e.g.:
    
    ```c
    // ask for the 7th element; if the element does not exist, the
    // reader will be put in an error state
    json_reader_read_element (reader, 6);
    
    // in case of error, this will return NULL, otherwise it will
    // return the value of the element
    str = json_reader_get_string_value (value);
    
    // this function resets the error state if any was set
    json_reader_end_element (reader);
    ```
    
    If you want to detect the error state as soon as possible, you can use
    [json.reader.Reader.getError]:
    
    ```c
    // like the example above, but in this case we print out the
    // error immediately
    if (!json_reader_read_element (reader, 6))
      {
        const GError *error = json_reader_get_error (reader);
        g_print ("Unable to read the element: %s", error->message);
      }
    ```
*/
struct JsonReader
{
  /** */
  GObject parentInstance;

  /** */
  JsonReaderPrivate* priv;
}

/** */
struct JsonReaderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() JsonPadding0;

  /** */
  extern(C) void function() JsonPadding1;

  /** */
  extern(C) void function() JsonPadding2;

  /** */
  extern(C) void function() JsonPadding3;

  /** */
  extern(C) void function() JsonPadding4;
}

/** */
struct JsonReaderPrivate;

/**
    [json.serializable.Serializable] is an interface for controlling the serialization
    and deserialization of [gobject.object.ObjectWrap] classes.
    
    Implementing this interface allows controlling how the class is going
    to be serialized or deserialized by `func@Json.construct_gobject` and
    `func@Json.serialize_gobject`, respectively.
*/
struct JsonSerializable;

/**
    Interface that allows serializing and deserializing object instances
    with properties storing complex data types.
    
    The `func@Json.gobject_from_data` and `func@Json.gobject_to_data`
    functions will check if the passed object type implements this interface,
    so it can also be used to override the default property serialization
    sequence.
*/
struct JsonSerializableIface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) JsonNode* function(JsonSerializable* serializable, const(char)* propertyName, const(GValue)* value, GParamSpec* pspec) serializeProperty;

  /** */
  extern(C) gboolean function(JsonSerializable* serializable, const(char)* propertyName, GValue* value, GParamSpec* pspec, JsonNode* propertyNode) deserializeProperty;

  /** */
  extern(C) GParamSpec* function(JsonSerializable* serializable, const(char)* name) findProperty;

  /** */
  extern(C) GParamSpec** function(JsonSerializable* serializable, uint* nPspecs) listProperties;

  /** */
  extern(C) void function(JsonSerializable* serializable, GParamSpec* pspec, const(GValue)* value) setProperty;

  /** */
  extern(C) void function(JsonSerializable* serializable, GParamSpec* pspec, GValue* value) getProperty;
}

alias extern(C) void function(JsonArray* array, uint index, JsonNode* elementNode, void* userData) JsonArrayForeach;

alias extern(C) void* function(JsonNode* node) JsonBoxedDeserializeFunc;

alias extern(C) JsonNode* function(const(void)* boxed) JsonBoxedSerializeFunc;

alias extern(C) void function(JsonObject* object, const(char)* memberName, JsonNode* memberNode, void* userData) JsonObjectForeach;

