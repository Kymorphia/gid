/// Module for [ObjectIter] class
module json.object_iter;

import gid.gid;
import json.c.functions;
import json.c.types;
import json.node;
import json.object;
import json.types;

/**
    An iterator object used to iterate over the members of a JSON object.
    
    [json.object_iter.ObjectIter] must be allocated on the stack and initialised using
    [json.object_iter.ObjectIter.init_] or [json.object_iter.ObjectIter.initOrdered].
    
    The iterator is invalidated if the object is modified during
    iteration.
    
    All the fields in the [json.object_iter.ObjectIter] structure are private and should
    never be accessed directly.
*/
class ObjectIter
{
  JsonObjectIter cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for json.object_iter.ObjectIter");

    cInstance = *cast(JsonObjectIter*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Initialises the iter and associate it with object.
      
      ```c
      JsonObjectIter iter;
      const gchar *member_name;
      JsonNode *member_node;
      
      json_object_iter_init (&iter, some_object);
      while (json_object_iter_next (&iter, &member_name, &member_node))
        {
          // Do something with member_name and member_node.
        }
      ```
      
      The iterator initialized with this function will iterate the
      members of the object in an undefined order.
      
      See also: [json.object_iter.ObjectIter.initOrdered]
  
      Params:
        object = the JSON object to iterate over
  */
  void init_(json.object.ObjectWrap object)
  {
    json_object_iter_init(cast(JsonObjectIter*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null);
  }

  /**
      Initialises the iter and associate it with object.
      
      ```c
      JsonObjectIter iter;
      const gchar *member_name;
      JsonNode *member_node;
      
      json_object_iter_init_ordered (&iter, some_object);
      while (json_object_iter_next_ordered (&iter, &member_name, &member_node))
        {
          // Do something with member_name and member_node.
        }
      ```
      
      See also: [json.object_iter.ObjectIter.init_]
  
      Params:
        object = the JSON object to iterate over
  */
  void initOrdered(json.object.ObjectWrap object)
  {
    json_object_iter_init_ordered(cast(JsonObjectIter*)this._cPtr, object ? cast(JsonObject*)object._cPtr(No.Dup) : null);
  }

  /**
      Advances the iterator and retrieves the next member in the object.
      
      If the end of the object is reached, `FALSE` is returned and member_name
      and member_node are set to invalid values. After that point, the iter
      is invalid.
      
      The order in which members are returned by the iterator is undefined. The
      iterator is invalidated if the object is modified during iteration.
      
      You must use this function with an iterator initialized with
      [json.object_iter.ObjectIter.init_]; using this function with an iterator
      initialized with [json.object_iter.ObjectIter.initOrdered] yields undefined
      behavior.
      
      See also: [json.object_iter.ObjectIter.nextOrdered]
  
      Params:
        memberName = return
             location for the member name, or null to ignore
        memberNode = return
             location for the member value, or null to ignore
      Returns: `TRUE` if member_name and member_node are valid; `FALSE` if
          there are no more members
  */
  bool next(out string memberName, out json.node.Node memberNode)
  {
    bool _retval;
    char* _memberName;
    JsonNode* _memberNode;
    _retval = cast(bool)json_object_iter_next(cast(JsonObjectIter*)this._cPtr, &_memberName, &_memberNode);
    memberName = _memberName.fromCString(No.Free);
    memberNode = new json.node.Node(cast(void*)_memberNode, No.Take);
    return _retval;
  }

  /**
      Advances the iterator and retrieves the next member in the object.
      
      If the end of the object is reached, `FALSE` is returned and member_name and
      member_node are set to invalid values. After that point, the iter is invalid.
      
      The order in which members are returned by the iterator is the same order in
      which the members were added to the [json.object.ObjectWrap]. The iterator is invalidated
      if its [json.object.ObjectWrap] is modified during iteration.
      
      You must use this function with an iterator initialized with
      [json.object_iter.ObjectIter.initOrdered]; using this function with an iterator
      initialized with [json.object_iter.ObjectIter.init_] yields undefined behavior.
      
      See also: [json.object_iter.ObjectIter.next]
  
      Params:
        memberName = return
             location for the member name, or null to ignore
        memberNode = return
             location for the member value, or null to ignore
      Returns: `TRUE `if member_name and member_node are valid; `FALSE` if the end
           of the object has been reached
  */
  bool nextOrdered(out string memberName, out json.node.Node memberNode)
  {
    bool _retval;
    char* _memberName;
    JsonNode* _memberNode;
    _retval = cast(bool)json_object_iter_next_ordered(cast(JsonObjectIter*)this._cPtr, &_memberName, &_memberNode);
    memberName = _memberName.fromCString(No.Free);
    memberNode = new json.node.Node(cast(void*)_memberNode, No.Take);
    return _retval;
  }
}
