/// Module for [Reader] class
module json.reader;

import gid.gid;
import glib.error;
import gobject.object;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

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
class Reader : gobject.object.ObjectWrap
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
    return cast(void function())json_reader_get_type != &gidSymbolNotFound ? json_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Reader self()
  {
    return this;
  }

  /**
      Get `root` property.
      Returns: The root of the JSON tree that the reader should read.
  */
  @property json.node.Node root()
  {
    return gobject.object.ObjectWrap.getProperty!(json.node.Node)("root");
  }

  /**
      Set `root` property.
      Params:
        propval = The root of the JSON tree that the reader should read.
  */
  @property void root(json.node.Node propval)
  {
    return setRoot(propval);
  }

  /**
      Creates a new reader.
      
      You can use this object to read the contents of the JSON tree starting
      from the given node.
  
      Params:
        node = the root node
      Returns: the newly created reader
  */
  this(json.node.Node node = null)
  {
    JsonReader* _cretval;
    _cretval = json_reader_new(node ? cast(JsonNode*)node._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Counts the elements of the current position, if the reader is
      positioned on an array.
      
      In case of failure, the reader is set to an error state.
      Returns: the number of elements, or -1.
  */
  int countElements()
  {
    int _retval;
    _retval = json_reader_count_elements(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Counts the members of the current position, if the reader is
      positioned on an object.
      
      In case of failure, the reader is set to an error state.
      Returns: the number of members, or -1
  */
  int countMembers()
  {
    int _retval;
    _retval = json_reader_count_members(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Moves the cursor back to the previous node after being positioned
      inside an array.
      
      This function resets the error state of the reader, if any was set.
  */
  void endElement()
  {
    json_reader_end_element(cast(JsonReader*)this._cPtr);
  }

  /**
      Moves the cursor back to the previous node after being positioned
      inside an object.
      
      This function resets the error state of the reader, if any was set.
  */
  void endMember()
  {
    json_reader_end_member(cast(JsonReader*)this._cPtr);
  }

  /**
      Retrieves the boolean value of the current position of the reader.
      
      See also: [json.reader.Reader.getValue]
      Returns: the boolean value
  */
  bool getBooleanValue()
  {
    bool _retval;
    _retval = json_reader_get_boolean_value(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the reader node at the current position.
      Returns: the current node of the reader
  */
  json.node.Node getCurrentNode()
  {
    JsonNode* _cretval;
    _cretval = json_reader_get_current_node(cast(JsonReader*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the floating point value of the current position of the reader.
      
      See also: [json.reader.Reader.getValue]
      Returns: the floating point value
  */
  double getDoubleValue()
  {
    double _retval;
    _retval = json_reader_get_double_value(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the error currently set on the reader.
      Returns: the current error
  */
  glib.error.ErrorWrap getError()
  {
    const(GError)* _cretval;
    _cretval = json_reader_get_error(cast(JsonReader*)this._cPtr);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the integer value of the current position of the reader.
      
      See also: [json.reader.Reader.getValue]
      Returns: the integer value
  */
  long getIntValue()
  {
    long _retval;
    _retval = json_reader_get_int_value(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the name of the current member.
      
      In case of failure, the reader is set to an error state.
      Returns: the name of the member
  */
  string getMemberName()
  {
    const(char)* _cretval;
    _cretval = json_reader_get_member_name(cast(JsonReader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks whether the value of the current position of the reader is `null`.
      
      See also: [json.reader.Reader.getValue]
      Returns: `TRUE` if `null` is set, and `FALSE` otherwise
  */
  bool getNullValue()
  {
    bool _retval;
    _retval = json_reader_get_null_value(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the string value of the current position of the reader.
      
      See also: [json.reader.Reader.getValue]
      Returns: the string value
  */
  string getStringValue()
  {
    const(char)* _cretval;
    _cretval = json_reader_get_string_value(cast(JsonReader*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the value node at the current position of the reader.
      
      If the current position does not contain a scalar value, the reader
      is set to an error state.
      Returns: the current value node
  */
  json.node.Node getValue()
  {
    JsonNode* _cretval;
    _cretval = json_reader_get_value(cast(JsonReader*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the reader is currently on an array.
      Returns: `TRUE` if the reader is on an array
  */
  bool isArray()
  {
    bool _retval;
    _retval = json_reader_is_array(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the reader is currently on an object.
      Returns: `TRUE` if the reader is on an object
  */
  bool isObject()
  {
    bool _retval;
    _retval = json_reader_is_object(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the reader is currently on a value.
      Returns: `TRUE` if the reader is on a value
  */
  bool isValue()
  {
    bool _retval;
    _retval = json_reader_is_value(cast(JsonReader*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a list of member names from the current position, if the reader
      is positioned on an object.
      
      In case of failure, the reader is set to an error state.
      Returns: the members of
          the object
  */
  string[] listMembers()
  {
    char** _cretval;
    _cretval = json_reader_list_members(cast(JsonReader*)this._cPtr);
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
      Advances the cursor of the reader to the element of the array or
      the member of the object at the given position.
      
      You can use [json.reader.Reader.getValue] and its wrapper functions to
      retrieve the value of the element; for instance, the following code will
      read the first element of the array at the current cursor position:
      
      ```c
      json_reader_read_element (reader, 0);
      int_value = json_reader_get_int_value (reader);
      ```
      
      After reading the value, you should call [json.reader.Reader.endElement]
      to reposition the cursor inside the reader, e.g.:
      
      ```c
      const char *str_value = NULL;
      
      json_reader_read_element (reader, 1);
      str_value = json_reader_get_string_value (reader);
      json_reader_end_element (reader);
      
      json_reader_read_element (reader, 2);
      str_value = json_reader_get_string_value (reader);
      json_reader_end_element (reader);
      ```
      
      If the reader is not currently on an array or an object, or if the index is
      bigger than the size of the array or the object, the reader will be
      put in an error state until [json.reader.Reader.endElement] is called. This
      means that, if used conditionally, [json.reader.Reader.endElement] must be
      called on all branches:
      
      ```c
      if (!json_reader_read_element (reader, 1))
        {
          g_propagate_error (error, json_reader_get_error (reader));
          json_reader_end_element (reader);
          return FALSE;
        }
      else
        {
          const char *str_value = json_reader_get_string_value (reader);
          json_reader_end_element (reader);
      
          // use str_value
      
          return TRUE;
        }
      ```c
  
      Params:
        index = the index of the element
      Returns: `TRUE` on success, and `FALSE` otherwise
  */
  bool readElement(uint index)
  {
    bool _retval;
    _retval = json_reader_read_element(cast(JsonReader*)this._cPtr, index);
    return _retval;
  }

  /**
      Advances the cursor of the reader to the `member_name` of the object at
      the current position.
      
      You can use [json.reader.Reader.getValue] and its wrapper functions to
      retrieve the value of the member; for instance:
      
      ```c
      json_reader_read_member (reader, "width");
      width = json_reader_get_int_value (reader);
      ```
      
      After reading the value, `[json.reader.Reader.endMember]` should be called to
      reposition the cursor inside the reader, e.g.:
      
      ```c
      json_reader_read_member (reader, "author");
      author = json_reader_get_string_value (reader);
      json_reader_end_member (reader);
      
      json_reader_read_member (reader, "title");
      title = json_reader_get_string_value (reader);
      json_reader_end_member (reader);
      ```
      
      If the reader is not currently on an object, or if the `member_name` is not
      defined in the object, the reader will be put in an error state until
      [json.reader.Reader.endMember] is called. This means that if used
      conditionally, [json.reader.Reader.endMember] must be called on all branches:
      
      ```c
      if (!json_reader_read_member (reader, "title"))
        {
          g_propagate_error (error, json_reader_get_error (reader));
          json_reader_end_member (reader);
          return FALSE;
        }
      else
        {
          const char *str_value = json_reader_get_string_value (reader);
          json_reader_end_member (reader);
      
          // use str_value
      
          return TRUE;
        }
      ```
  
      Params:
        memberName = the name of the member to read
      Returns: `TRUE` on success, and `FALSE` otherwise
  */
  bool readMember(string memberName)
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = json_reader_read_member(cast(JsonReader*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Sets the root node of the JSON tree to be read by reader.
      
      The reader will take a copy of the node.
  
      Params:
        root = the root node
  */
  void setRoot(json.node.Node root = null)
  {
    json_reader_set_root(cast(JsonReader*)this._cPtr, root ? cast(JsonNode*)root._cPtr(No.Dup) : null);
  }
}
