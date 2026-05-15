/// Module for [Builder] class
module json.builder;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import json.c.functions;
import json.c.types;
import json.node;
import json.types;

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
class Builder : gobject.object.ObjectWrap
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
    return cast(void function())json_builder_get_type != &gidSymbolNotFound ? json_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Builder self()
  {
    return this;
  }

  /**
      Get builder for [json.builder.Builder]
      Returns: New builder object
  */
  static BuilderGidBuilder builder()
  {
    return new BuilderGidBuilder;
  }

  /**
      Get `immutable_` property.
      Returns: Whether the tree should be immutable when created.
        
        Making the output immutable on creation avoids the expense
        of traversing it to make it immutable later.
  */
  @property bool immutable_()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("immutable");
  }

  /**
      Creates a new [json.builder.Builder].
      
      You can use this object to generate a JSON tree and obtain the root node.
      Returns: the newly created builder instance
  */
  this()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new, immutable [json.builder.Builder] instance.
      
      It is equivalent to setting the [json.builder.Builder.immutable_] property
      set to `TRUE` at construction time.
      Returns: the newly create builder instance
  */
  static json.builder.Builder newImmutable()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_new_immutable();
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds a boolean value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given value
      as the value of the current member in the open object; otherwise, the value
      is appended to the elements of the open array.
      
      See also: [json.builder.Builder.addValue]
  
      Params:
        value = the value of the member or element
      Returns: the builder instance
  */
  json.builder.Builder addBooleanValue(bool value)
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_add_boolean_value(cast(JsonBuilder*)this._cPtr, value);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a floating point value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given value
      as the value of the current member in the open object; otherwise, the value
      is appended to the elements of the open array.
      
      See also: [json.builder.Builder.addValue]
  
      Params:
        value = the value of the member or element
      Returns: the builder instance
  */
  json.builder.Builder addDoubleValue(double value)
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_add_double_value(cast(JsonBuilder*)this._cPtr, value);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds an integer value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given value
      as the value of the current member in the open object; otherwise, the value
      is appended to the elements of the open array.
      
      See also: [json.builder.Builder.addValue]
  
      Params:
        value = the value of the member or element
      Returns: the builder instance
  */
  json.builder.Builder addIntValue(long value)
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_add_int_value(cast(JsonBuilder*)this._cPtr, value);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a null value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given value
      as the value of the current member in the open object; otherwise, the value
      is appended to the elements of the open array.
      
      See also: [json.builder.Builder.addValue]
      Returns: the builder instance
  */
  json.builder.Builder addNullValue()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_add_null_value(cast(JsonBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a boolean value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given value
      as the value of the current member in the open object; otherwise, the value
      is appended to the elements of the open array.
      
      See also: [json.builder.Builder.addValue]
  
      Params:
        value = the value of the member or element
      Returns: the builder instance
  */
  json.builder.Builder addStringValue(string value)
  {
    JsonBuilder* _cretval;
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = json_builder_add_string_value(cast(JsonBuilder*)this._cPtr, _value);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a value to the currently open object member or array.
      
      If called after [json.builder.Builder.setMemberName], sets the given node
      as the value of the current member in the open object; otherwise, the node
      is appended to the elements of the open array.
      
      The builder will take ownership of the node.
  
      Params:
        node = the value of the member or element
      Returns: the builder instance
  */
  json.builder.Builder addValue(json.node.Node node)
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_add_value(cast(JsonBuilder*)this._cPtr, node ? cast(JsonNode*)node._cPtr(Yes.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Opens an array inside the given builder.
      
      You can add a new element to the array by using [json.builder.Builder.addValue].
      
      Once you added all elements to the array, you must call
      [json.builder.Builder.endArray] to close the array.
      Returns: the builder instance
  */
  json.builder.Builder beginArray()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_begin_array(cast(JsonBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Opens an object inside the given builder.
      
      You can add a new member to the object by using [json.builder.Builder.setMemberName],
      followed by [json.builder.Builder.addValue].
      
      Once you added all members to the object, you must call [json.builder.Builder.endObject]
      to close the object.
      
      If the builder is in an inconsistent state, this function will return `NULL`.
      Returns: the builder instance
  */
  json.builder.Builder beginObject()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_begin_object(cast(JsonBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Closes the array inside the given builder that was opened by the most
      recent call to [json.builder.Builder.beginArray].
      
      This function cannot be called after [json.builder.Builder.setMemberName].
      Returns: the builder instance
  */
  json.builder.Builder endArray()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_end_array(cast(JsonBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Closes the object inside the given builder that was opened by the most
      recent call to [json.builder.Builder.beginObject].
      
      This function cannot be called after [json.builder.Builder.setMemberName].
      Returns: the builder instance
  */
  json.builder.Builder endObject()
  {
    JsonBuilder* _cretval;
    _cretval = json_builder_end_object(cast(JsonBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the root of the currently constructed tree.
      
      if the build is incomplete (ie: if there are any opened objects, or any
      open object members and array elements) then this function will return
      `NULL`.
      Returns: the root node
  */
  json.node.Node getRoot()
  {
    JsonNode* _cretval;
    _cretval = json_builder_get_root(cast(JsonBuilder*)this._cPtr);
    auto _retval = _cretval ? new json.node.Node(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Resets the state of the builder back to its initial state.
  */
  void reset()
  {
    json_builder_reset(cast(JsonBuilder*)this._cPtr);
  }

  /**
      Sets the name of the member in an object.
      
      This function must be followed by of these functions:
      
       - [json.builder.Builder.addValue], to add a scalar value to the member
       - [json.builder.Builder.beginObject], to add an object to the member
       - [json.builder.Builder.beginArray], to add an array to the member
      
      This function can only be called within an open object.
  
      Params:
        memberName = the name of the member
      Returns: the builder instance
  */
  json.builder.Builder setMemberName(string memberName)
  {
    JsonBuilder* _cretval;
    const(char)* _memberName = memberName.toCString(No.Alloc);
    _cretval = json_builder_set_member_name(cast(JsonBuilder*)this._cPtr, _memberName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(json.builder.Builder)(cast(JsonBuilder*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [json.builder.Builder]
class BuilderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `immutable_` property.
      Params:
        propval = Whether the tree should be immutable when created.
          
          Making the output immutable on creation avoids the expense
          of traversing it to make it immutable later.
      Returns: Builder instance for fluent chaining
  */
  T immutable_(bool propval)
  {
    return setProperty("immutable", propval);
  }
}

/// Fluent builder for [json.builder.Builder]
final class BuilderGidBuilder : BuilderGidBuilderImpl!BuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Builder build()
  {
    return new Builder(cast(void*)createGObject(Builder._getGType), Yes.Take);
  }
}
