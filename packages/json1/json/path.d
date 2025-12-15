/// Module for [Path] class
module json.path;

import gid.gid;
import glib.error;
import gobject.object;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

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
class Path : gobject.object.ObjectWrap
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
    return cast(void function())json_path_get_type != &gidSymbolNotFound ? json_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Path self()
  {
    return this;
  }

  /**
      Creates a new [json.path.Path] instance.
      
      Once created, the [json.path.Path] object should be used with
      [json.path.Path.compile] and [json.path.Path.match].
      Returns: the newly created path
  */
  this()
  {
    JsonPath* _cretval;
    _cretval = json_path_new();
    this(_cretval, Yes.Take);
  }

  /**
      Queries a JSON tree using a JSONPath expression.
      
      This function is a simple wrapper around [json.path.Path.new_],
      [json.path.Path.compile], and [json.path.Path.match]. It implicitly
      creates a [json.path.Path] instance, compiles the given expression and matches
      it against the JSON tree pointed by `root`.
  
      Params:
        expression = a JSONPath expression
        root = the root of a JSON tree
      Returns: a newly-created node of type
          [json.types.NodeType.Array] containing the array of matching nodes
      Throws: [ErrorWrap]
  */
  static json.node.Node query(string expression, json.node.Node root)
  {
    JsonNode* _cretval;
    const(char)* _expression = expression.toCString(No.Alloc);
    GError *_err;
    _cretval = json_path_query(_expression, root ? cast(JsonNode*)root._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Validates and decomposes the given expression.
      
      A JSONPath expression must be compiled before calling
      [json.path.Path.match].
  
      Params:
        expression = a JSONPath expression
      Returns: `TRUE` if the compilation was successful, and `FALSE`
          otherwise
      Throws: [ErrorWrap]
  */
  bool compile(string expression)
  {
    bool _retval;
    const(char)* _expression = expression.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)json_path_compile(cast(JsonPath*)this._cPtr, _expression, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Matches the JSON tree pointed by `root` using the expression compiled
      into the [json.path.Path].
      
      The nodes matching the expression will be copied into an array.
  
      Params:
        root = the root node of the JSON data to match
      Returns: a newly-created node of type
          [json.types.NodeType.Array] containing the array of matching nodes
  */
  json.node.Node match(json.node.Node root)
  {
    JsonNode* _cretval;
    _cretval = json_path_match(cast(JsonPath*)this._cPtr, root ? cast(JsonNode*)root._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
