/// Module for [ObjectWrap] class
module json.object;

import gid.gid;
import gobject.boxed;
import json.array;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

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
class ObjectWrap : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())json_object_get_type != &gidSymbolNotFound ? json_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectWrap self()
  {
    return this;
  }

  /**
      Creates a new object.
      Returns: the newly created object
  */
  this()
  {
    JsonObject* _cretval;
    _cretval = json_object_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a new member for the given name and value into an object.
      
      This function will return if the object already contains a member
      with the same name.
  
      Params:
        memberName = the name of the member
        node = the value of the member
  
      Deprecated: Use [json.object.ObjectWrap.setMember] instead
  */
  void addMember(string memberName, json.node.Node node)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_add_member(cast(JsonObject*)this._cPtr, _memberName, node ? cast(JsonNode*)node._cPtr(Yes.Dup) : null);
  }

  /**
      Retrieves a copy of the value of the given member inside an object.
  
      Params:
        memberName = the name of the JSON object member to access
      Returns: a copy of the value for the
          requested object member
  */
  json.node.Node dupMember(string memberName)
  {
    JsonNode* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_object_dup_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check whether `a` and `b` are equal objects, meaning they have the same
      set of members, and the values of corresponding members are equal.
  
      Params:
        b = another JSON object
      Returns: `TRUE` if `a` and `b` are equal, and `FALSE` otherwise
  */
  bool equal(json.object.ObjectWrap b)
  {
    bool _retval;
    _retval = cast(bool)json_object_equal(cast(JsonObject*)this._cPtr, b ? cast(JsonObject*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Iterates over all members of object and calls func on
      each one of them.
      
      It is safe to change the value of a member of the oobject
      from within the iterator function, but it is not safe to add or
      remove members from the object.
      
      The order in which the object members are iterated is the
      insertion order.
  
      Params:
        func = the function to be called on each member
  */
  void foreachMember(json.types.ObjectForeach func)
  {
    extern(C) void _funcCallback(JsonObject* object, const(char)* memberName, JsonNode* memberNode, void* userData)
    {
      auto _dlg = cast(json.types.ObjectForeach*)userData;
      string _memberName = memberName.fromCString(No.Free);

      (*_dlg)(object ? new json.object.ObjectWrap(cast(void*)object, No.Take) : null, _memberName, memberNode ? new json.node.Node(cast(void*)memberNode, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    json_object_foreach_member(cast(JsonObject*)this._cPtr, _funcCB, _func);
  }

  /**
      Convenience function that retrieves the array
      stored in member_name of object. It is an error to specify a
      member_name which does not exist.
      
      If member_name contains `null`, then this function will return `NULL`.
      
      See also: [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the array inside the object's member
  */
  json.array.Array getArrayMember(string memberName)
  {
    JsonArray* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_object_get_array_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new json.array.Array(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Convenience function that retrieves the boolean value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist.
      
      See also: [json.object.ObjectWrap.getBooleanMemberWithDefault],
        [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the boolean value of the object's member
  */
  bool getBooleanMember(string memberName)
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = cast(bool)json_object_get_boolean_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the boolean value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the boolean value of the object's member, or the
          given default
  */
  bool getBooleanMemberWithDefault(string memberName, bool defaultValue)
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = cast(bool)json_object_get_boolean_member_with_default(cast(JsonObject*)this._cPtr, _memberName, defaultValue);
    return _retval;
  }

  /**
      Convenience function that retrieves the floating point value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist.
      
      See also: [json.object.ObjectWrap.getDoubleMemberWithDefault],
        [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the floating point value of the object's member
  */
  double getDoubleMember(string memberName)
  {
    double _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = json_object_get_double_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the floating point value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the floating point value of the object's member, or the
          given default
  */
  double getDoubleMemberWithDefault(string memberName, double defaultValue)
  {
    double _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = json_object_get_double_member_with_default(cast(JsonObject*)this._cPtr, _memberName, defaultValue);
    return _retval;
  }

  /**
      Convenience function that retrieves the integer value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist.
      
      See also: [json.object.ObjectWrap.getIntMemberWithDefault],
        [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the object member
      Returns: the integer value of the object's member
  */
  long getIntMember(string memberName)
  {
    long _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = json_object_get_int_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the integer value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the integer value of the object's member, or the
          given default
  */
  long getIntMemberWithDefault(string memberName, long defaultValue)
  {
    long _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = json_object_get_int_member_with_default(cast(JsonObject*)this._cPtr, _memberName, defaultValue);
    return _retval;
  }

  /**
      Retrieves the value of the given member inside an object.
  
      Params:
        memberName = the name of the JSON object member to access
      Returns: the value for the
          requested object member
  */
  json.node.Node getMember(string memberName)
  {
    JsonNode* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_object_get_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves all the names of the members of an object.
      
      You can obtain the value for each member by iterating the returned list
      and calling [json.object.ObjectWrap.getMember].
      Returns: the
          member names of the object
  */
  string[] getMembers()
  {
    GList* _cretval;
    _cretval = json_object_get_members(cast(JsonObject*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Convenience function that checks whether the value
      stored in member_name of object is null. It is an error to
      specify a member_name which does not exist.
      
      See also: [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: `TRUE` if the value is `null`
  */
  bool getNullMember(string memberName)
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = cast(bool)json_object_get_null_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the object
      stored in member_name of object. It is an error to specify a member_name
      which does not exist.
      
      If member_name contains `null`, then this function will return `NULL`.
      
      See also: [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the object inside the object's member
  */
  json.object.ObjectWrap getObjectMember(string memberName)
  {
    JsonObject* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_object_get_object_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new json.object.ObjectWrap(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of members of a JSON object.
      Returns: the number of members
  */
  uint getSize()
  {
    uint _retval;
    _retval = json_object_get_size(cast(JsonObject*)this._cPtr);
    return _retval;
  }

  /**
      Convenience function that retrieves the string value
      stored in member_name of object. It is an error to specify a
      member_name that does not exist.
      
      See also: [json.object.ObjectWrap.getStringMemberWithDefault],
        [json.object.ObjectWrap.getMember], [json.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the string value of the object's member
  */
  string getStringMember(string memberName)
  {
    const(char)* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_object_get_string_member(cast(JsonObject*)this._cPtr, _memberName);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Convenience function that retrieves the string value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the string value of the object's member, or the
          given default
  */
  string getStringMemberWithDefault(string memberName, string defaultValue)
  {
    const(char)* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    const(char)* _defaultValue = defaultValue.toCString(No.Alloc);
    _cretval = json_object_get_string_member_with_default(cast(JsonObject*)this._cPtr, _memberName, _defaultValue);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves all the values of the members of an object.
      Returns: the
          member values of the object
  */
  json.node.Node[] getValues()
  {
    GList* _cretval;
    _cretval = json_object_get_values(cast(JsonObject*)this._cPtr);
    auto _retval = gListToD!(json.node.Node, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks whether object has a member named member_name.
  
      Params:
        memberName = the name of a JSON object member
      Returns: `TRUE` if the JSON object has the requested member
  */
  bool hasMember(string memberName)
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _retval = cast(bool)json_object_has_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Calculate a hash value for the given key (a JSON object).
      
      The hash is calculated over the object and all its members, recursively. If
      the object is immutable, this is a fast operation; otherwise, it scales
      proportionally with the number of members in the object.
      Returns: hash value for key
  */
  uint hash()
  {
    uint _retval;
    _retval = json_object_hash(cast(JsonObject*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the given object has been marked as immutable by calling
      [json.object.ObjectWrap.seal] on it.
      Returns: `TRUE` if the object is immutable
  */
  bool isImmutable()
  {
    bool _retval;
    _retval = cast(bool)json_object_is_immutable(cast(JsonObject*)this._cPtr);
    return _retval;
  }

  /**
      Removes member_name from object, freeing its allocated resources.
  
      Params:
        memberName = the name of the member to remove
  */
  void removeMember(string memberName)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_remove_member(cast(JsonObject*)this._cPtr, _memberName);
  }

  /**
      Seals the object, making it immutable to further changes.
      
      This function will recursively seal all members of the object too.
      
      If the object is already immutable, this is a no-op.
  */
  void seal()
  {
    json_object_seal(cast(JsonObject*)this._cPtr);
  }

  /**
      Convenience function for setting an object member with an array value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.takeArray]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setArrayMember(string memberName, json.array.Array value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_array_member(cast(JsonObject*)this._cPtr, _memberName, value ? cast(JsonArray*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a boolean value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.initBoolean]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setBooleanMember(string memberName, bool value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_boolean_member(cast(JsonObject*)this._cPtr, _memberName, value);
  }

  /**
      Convenience function for setting an object member with a floating point value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.initDouble]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setDoubleMember(string memberName, double value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_double_member(cast(JsonObject*)this._cPtr, _memberName, value);
  }

  /**
      Convenience function for setting an object member with an integer value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.initInt]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setIntMember(string memberName, long value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_int_member(cast(JsonObject*)this._cPtr, _memberName, value);
  }

  /**
      Sets the value of a member inside an object.
      
      If the object does not have a member with the given name, a new member
      is created.
      
      If the object already has a member with the given name, the current
      value is overwritten with the new.
  
      Params:
        memberName = the name of the member
        node = the value of the member
  */
  void setMember(string memberName, json.node.Node node)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_member(cast(JsonObject*)this._cPtr, _memberName, node ? cast(JsonNode*)node._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a `null` value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.initNull]
  
      Params:
        memberName = the name of the member
  */
  void setNullMember(string memberName)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_null_member(cast(JsonObject*)this._cPtr, _memberName);
  }

  /**
      Convenience function for setting an object member with an object value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.takeObject]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setObjectMember(string memberName, json.object.ObjectWrap value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    json_object_set_object_member(cast(JsonObject*)this._cPtr, _memberName, value ? cast(JsonObject*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a string value.
      
      See also: [json.object.ObjectWrap.setMember], [json.node.Node.initString]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setStringMember(string memberName, string value)
  {
    const(char)* _memberName = memberName.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    json_object_set_string_member(cast(JsonObject*)this._cPtr, _memberName, _value);
  }
}
