/// Module for [ObjectWrap] class
module gid.json1.object;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.json1.array;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.node;
import gid.json1.types;

/**
    [gid.json1.object.ObjectWrap] is the representation of the object type inside JSON.
    
    A [gid.json1.object.ObjectWrap] contains [gid.json1.node.Node] "members", which may contain
    fundamental types, arrays or other objects; each member of an object is
    accessed using a unique string, or "name".
    
    Since objects can be arbitrarily big, copying them can be expensive; for
    this reason they are reference counted. You can control the lifetime of
    a [gid.json1.object.ObjectWrap] using [gid.json1.object.ObjectWrap.ref_] and [gid.json1.object.ObjectWrap.unref].
    
    To add or overwrite a member with a given name, use [gid.json1.object.ObjectWrap.setMember].
    
    To extract a member with a given name, use [gid.json1.object.ObjectWrap.getMember].
    
    To retrieve the list of members, use [gid.json1.object.ObjectWrap.getMembers].
    
    To retrieve the size of the object (that is, the number of members it has),
    use [gid.json1.object.ObjectWrap.getSize].
*/
@gidGir("Object")
class ObjectWrap : gid.gobject2.boxed.BoxedWrap!(json_object_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectWrap self() nothrow
  {
    return this;
  }

  /**
      Creates a new object.
      Returns: the newly created object
  */
  this() nothrow
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
  
      Deprecated: Use [gid.json1.object.ObjectWrap.setMember] instead
  */
  void addMember(string memberName, gid.json1.node.Node node) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_add_member(cast(JsonObject*)this._cPtr, _memberName, node ? cast(JsonNode*)node._cPtr(Yes.Dup) : null);
  }

  /**
      Retrieves a copy of the value of the given member inside an object.
  
      Params:
        memberName = the name of the JSON object member to access
      Returns: a copy of the value for the
          requested object member
  */
  gid.json1.node.Node dupMember(string memberName) nothrow
  {
    JsonNode* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_dup_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check whether `a` and `b` are equal objects, meaning they have the same
      set of members, and the values of corresponding members are equal.
  
      Params:
        b = another JSON object
      Returns: `TRUE` if `a` and `b` are equal, and `FALSE` otherwise
  */
  bool equal(gid.json1.object.ObjectWrap b) nothrow
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
  void foreachMember(gid.json1.types.ObjectForeach func) nothrow
  {
    extern(C) void _funcCallback(JsonObject* object, const(char)* memberName, JsonNode* memberNode, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.json1.types.ObjectForeach*)userData;
      auto _object = object ? new gid.json1.object.ObjectWrap(cast(void*)object, Yes.Take)._cBorrow : null;
      string _memberName = memberName.fromCString!(No.Free);
      auto _memberNode = memberNode ? new gid.json1.node.Node(cast(void*)memberNode, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(_object, _memberName, _memberNode);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.json1.types.ObjectForeach");
      }
      if (_object)
        _object._cUnborrow;
      if (_memberNode)
        _memberNode._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    json_object_foreach_member(cast(JsonObject*)this._cPtr, _funcCB, _func);
  }

  /**
      Convenience function that retrieves the array
      stored in member_name of object. It is an error to specify a
      member_name which does not exist or which holds a non-`null`, non-array
      value.
      
      If member_name contains `null`, then this function will return `NULL`.
      
      See also: [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the array inside the object's member
  */
  gid.json1.array.Array getArrayMember(string memberName) nothrow
  {
    JsonArray* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_get_array_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new gid.json1.array.Array(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Convenience function that retrieves the boolean value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist or which holds a non-scalar,
      non-`null` value.
      
      See also: [gid.json1.object.ObjectWrap.getBooleanMemberWithDefault],
        [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the boolean value of the object's member
  */
  bool getBooleanMember(string memberName) nothrow
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)json_object_get_boolean_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the boolean value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead. If
      member_name contains a non-boolean, non-`null` scalar value, then
      whatever [gid.json1.node.Node.getBoolean] would return is returned.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the boolean value of the object's member, or the
          given default
  */
  bool getBooleanMemberWithDefault(string memberName, bool defaultValue) nothrow
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)json_object_get_boolean_member_with_default(cast(JsonObject*)this._cPtr, _memberName, defaultValue);
    return _retval;
  }

  /**
      Convenience function that retrieves the floating point value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist or which holds a non-scalar,
      non-`null` value.
      
      See also: [gid.json1.object.ObjectWrap.getDoubleMemberWithDefault],
        [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the floating point value of the object's member
  */
  double getDoubleMember(string memberName) nothrow
  {
    double _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = json_object_get_double_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the floating point value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead. If
      member_name contains a non-double, non-`null` scalar value, then
      whatever [gid.json1.node.Node.getDouble] would return is returned.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the floating point value of the object's member, or the
          given default
  */
  double getDoubleMemberWithDefault(string memberName, double defaultValue) nothrow
  {
    double _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = json_object_get_double_member_with_default(cast(JsonObject*)this._cPtr, _memberName, defaultValue);
    return _retval;
  }

  /**
      Convenience function that retrieves the integer value
      stored in member_name of object. It is an error to specify a
      member_name which does not exist or which holds a non-scalar,
      non-`null` value.
      
      See also: [gid.json1.object.ObjectWrap.getIntMemberWithDefault],
        [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the object member
      Returns: the integer value of the object's member
  */
  long getIntMember(string memberName) nothrow
  {
    long _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = json_object_get_int_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the integer value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead. If
      member_name contains a non-integer, non-`null` scalar value, then whatever
      [gid.json1.node.Node.getInt] would return is returned.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the integer value of the object's member, or the
          given default
  */
  long getIntMemberWithDefault(string memberName, long defaultValue) nothrow
  {
    long _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
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
  gid.json1.node.Node getMember(string memberName) nothrow
  {
    JsonNode* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_get_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new gid.json1.node.Node(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves all the names of the members of an object.
      
      You can obtain the value for each member by iterating the returned list
      and calling [gid.json1.object.ObjectWrap.getMember].
      Returns: the
          member names of the object
  */
  string[] getMembers() nothrow
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
      
      See also: [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: `TRUE` if the value is `null`
  */
  bool getNullMember(string memberName) nothrow
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)json_object_get_null_member(cast(JsonObject*)this._cPtr, _memberName);
    return _retval;
  }

  /**
      Convenience function that retrieves the object
      stored in member_name of object. It is an error to specify a member_name
      which does not exist or which holds a non-`null`, non-object value.
      
      If member_name contains `null`, then this function will return `NULL`.
      
      See also: [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the object inside the object's member
  */
  gid.json1.object.ObjectWrap getObjectMember(string memberName) nothrow
  {
    JsonObject* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_get_object_member(cast(JsonObject*)this._cPtr, _memberName);
    auto _retval = _cretval ? new gid.json1.object.ObjectWrap(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the number of members of a JSON object.
      Returns: the number of members
  */
  uint getSize() nothrow
  {
    uint _retval;
    _retval = json_object_get_size(cast(JsonObject*)this._cPtr);
    return _retval;
  }

  /**
      Convenience function that retrieves the string value
      stored in member_name of object. It is an error to specify a
      member_name that does not exist or which holds a non-scalar,
      non-`null` value.
      
      See also: [gid.json1.object.ObjectWrap.getStringMemberWithDefault],
        [gid.json1.object.ObjectWrap.getMember], [gid.json1.object.ObjectWrap.hasMember]
  
      Params:
        memberName = the name of the member
      Returns: the string value of the object's member
  */
  string getStringMember(string memberName) nothrow
  {
    const(char)* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_get_string_member(cast(JsonObject*)this._cPtr, _memberName);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Convenience function that retrieves the string value
      stored in member_name of object.
      
      If member_name does not exist, does not contain a scalar value,
      or contains `null`, then default_value is returned instead. If
      member_name contains a non-string, non-`null` scalar value, then
      null is returned.
  
      Params:
        memberName = the name of the object member
        defaultValue = the value to return if member_name is not valid
      Returns: the string value of the object's member, or the
          given default
  */
  string getStringMemberWithDefault(string memberName, string defaultValue) nothrow
  {
    const(char)* _cretval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    const(char)* _defaultValue = defaultValue.toCString!(No.Malloc, No.Nullable);
    _cretval = json_object_get_string_member_with_default(cast(JsonObject*)this._cPtr, _memberName, _defaultValue);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves all the values of the members of an object.
      Returns: the
          member values of the object
  */
  gid.json1.node.Node[] getValues() nothrow
  {
    GList* _cretval;
    _cretval = json_object_get_values(cast(JsonObject*)this._cPtr);
    auto _retval = gListToD!(gid.json1.node.Node, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks whether object has a member named member_name.
  
      Params:
        memberName = the name of a JSON object member
      Returns: `TRUE` if the JSON object has the requested member
  */
  bool hasMember(string memberName) nothrow
  {
    bool _retval;
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
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
  uint hash() nothrow
  {
    uint _retval;
    _retval = json_object_hash(cast(JsonObject*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the given object has been marked as immutable by calling
      [gid.json1.object.ObjectWrap.seal] on it.
      Returns: `TRUE` if the object is immutable
  */
  bool isImmutable() nothrow
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
  void removeMember(string memberName) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_remove_member(cast(JsonObject*)this._cPtr, _memberName);
  }

  /**
      Seals the object, making it immutable to further changes.
      
      This function will recursively seal all members of the object too.
      
      If the object is already immutable, this is a no-op.
  */
  void seal() nothrow
  {
    json_object_seal(cast(JsonObject*)this._cPtr);
  }

  /**
      Convenience function for setting an object member with an array value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.takeArray]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setArrayMember(string memberName, gid.json1.array.Array value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_array_member(cast(JsonObject*)this._cPtr, _memberName, value ? cast(JsonArray*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a boolean value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.initBoolean]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setBooleanMember(string memberName, bool value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_boolean_member(cast(JsonObject*)this._cPtr, _memberName, value);
  }

  /**
      Convenience function for setting an object member with a floating point value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.initDouble]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setDoubleMember(string memberName, double value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_double_member(cast(JsonObject*)this._cPtr, _memberName, value);
  }

  /**
      Convenience function for setting an object member with an integer value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.initInt]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setIntMember(string memberName, long value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
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
  void setMember(string memberName, gid.json1.node.Node node) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_member(cast(JsonObject*)this._cPtr, _memberName, node ? cast(JsonNode*)node._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a `null` value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.initNull]
  
      Params:
        memberName = the name of the member
  */
  void setNullMember(string memberName) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_null_member(cast(JsonObject*)this._cPtr, _memberName);
  }

  /**
      Convenience function for setting an object member with an object value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.takeObject]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setObjectMember(string memberName, gid.json1.object.ObjectWrap value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    json_object_set_object_member(cast(JsonObject*)this._cPtr, _memberName, value ? cast(JsonObject*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Convenience function for setting an object member with a string value.
      
      See also: [gid.json1.object.ObjectWrap.setMember], [gid.json1.node.Node.initString]
  
      Params:
        memberName = the name of the member
        value = the value of the member
  */
  void setStringMember(string memberName, string value) nothrow
  {
    const(char)* _memberName = memberName.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    json_object_set_string_member(cast(JsonObject*)this._cPtr, _memberName, _value);
  }
}
