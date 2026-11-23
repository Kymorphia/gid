/// Module for [StringList] class
module gid.gtk4.string_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gio2.list_model_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    A list model that wraps an array of strings.
    
    The objects in the model are of type [gid.gtk4.string_object.StringObject] and have
    a "string" property that can be used inside expressions.
    
    [gid.gtk4.string_list.StringList] is well-suited for any place where you would
    typically use a `char*[]`, but need a list model.
    
    ## GtkStringList as GtkBuildable
    
    The [gid.gtk4.string_list.StringList] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding items directly using the `<items>` element and
    specifying `<item>` elements for each item. Each `<item>` element
    supports the regular translation attributes “translatable”,
    “context” and “comments”.
    
    Here is a UI definition fragment specifying a [gid.gtk4.string_list.StringList]
    
    ```xml
    <object class="GtkStringList">
      <items>
        <item translatable="yes">Factory</item>
        <item translatable="yes">Home</item>
        <item translatable="yes">Subway</item>
      </items>
    </object>
    ```
*/
class StringList : gid.gobject2.object.ObjectWrap, gid.gio2.list_model.ListModel, gid.gtk4.buildable.Buildable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_string_list_get_type != &gidSymbolNotFound ? gtk_string_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStringList";
  }

  /** Returns `this`, for use in `with` statements. */
  override StringList self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.string_list.StringList]
      Returns: New builder object
  */
  static StringListGidBuilder builder() nothrow
  {
    return new StringListGidBuilder;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gid.gio2.list_model.ListModel.getItemType].
  */
  @property gid.gobject2.types.GType itemType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gid.gio2.list_model.ListModel.getNItems].
  */
  @property uint nItems() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new [gid.gtk4.string_list.StringList] with the given strings.
  
      Params:
        strings = The strings to put in the model
      Returns: a new [gid.gtk4.string_list.StringList]
  */
  this(string[] strings = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, strings !is null), Yes.Take);
    }
    else
    {
      GtkStringList* _cretval;
      auto _strings_arr = new char*[](strings.length + 1);
      auto _strings = cast(char**)_strings_arr.ptr;
      foreach (i, s; strings) _strings[i] = s.toCString!(No.Malloc);
      _cretval = gtk_string_list_new(_strings);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Appends string to self.
      
      The string will be copied. See
      [gid.gtk4.string_list.StringList.take] for a way to avoid that.
  
      Params:
        string_ = the string to insert
  */
  void append(string string_) nothrow
  {
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    gtk_string_list_append(cast(GtkStringList*)this._cPtr, _string_);
  }

  /**
      Gets the position of the string in self.
      
      If self does not contain string item, `G_MAXUINT` is returned.
  
      Params:
        string_ = the string to find
      Returns: the position of the string
  */
  uint find(string string_) nothrow
  {
    uint _retval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _retval = gtk_string_list_find(cast(GtkStringList*)this._cPtr, _string_);
    return _retval;
  }

  /**
      Gets the string that is at position in self.
      
      If self does not contain position items, null is returned.
      
      This function returns the const char *. To get the
      object wrapping it, use [gid.gio2.list_model.ListModel.getItem].
  
      Params:
        position = the position to get the string for
      Returns: the string at the given position
  */
  string getString(uint position) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_string_list_get_string(cast(GtkStringList*)this._cPtr, position);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Removes the string at position from self.
      
      position must be smaller than the current
      length of the list.
  
      Params:
        position = the position of the string that is to be removed
  */
  void remove(uint position) nothrow
  {
    gtk_string_list_remove(cast(GtkStringList*)this._cPtr, position);
  }

  /**
      Changes self by removing n_removals strings and adding additions
      to it.
      
      This function is more efficient than [gid.gtk4.string_list.StringList.append]
      and [gid.gtk4.string_list.StringList.remove], because it only emits the
      ::items-changed signal once for the change.
      
      This function copies the strings in additions.
      
      The parameters position and n_removals must be correct (ie:
      position + n_removals must be less than or equal to the length
      of the list at the time this function is called).
  
      Params:
        position = the position at which to make the change
        nRemovals = the number of strings to remove
        additions = The strings to add
  */
  void splice(uint position, uint nRemovals, string[] additions = null) nothrow
  {
    auto _additions_arr = new char*[](additions.length + 1);
    auto _additions = cast(char**)_additions_arr.ptr;
    foreach (i, s; additions) _additions[i] = s.toCString!(No.Malloc);
    gtk_string_list_splice(cast(GtkStringList*)this._cPtr, position, nRemovals, _additions);
  }

  /**
      Adds string to self at the end, and takes
      ownership of it.
      
      This variant of [gid.gtk4.string_list.StringList.append]
      is convenient for formatting strings:
      
      ```c
      gtk_string_list_take (self, g_strdup_print ("%d dollars", lots));
      ```
  
      Params:
        string_ = the string to insert
  */
  void take(string string_) nothrow
  {
    char* _string_ = string_.toCString!(Yes.Malloc, No.Nullable);
    gtk_string_list_take(cast(GtkStringList*)this._cPtr, _string_);
  }
}

/// Fluent builder implementation template for [gid.gtk4.string_list.StringList]
class StringListGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.list_model.ListModelGidBuilderImpl!T, gid.gtk4.buildable.BuildableGidBuilderImpl!T
{

  mixin ListModelGidBuilderT!();
  mixin BuildableGidBuilderT!();

  /**
      Set `strings` property.
      Params:
        propval = The strings in the model.
      Returns: Builder instance for fluent chaining
  */
  T strings(string[] propval) nothrow
  {
    return setProperty("strings", propval);
  }
}

/// Fluent builder for [gid.gtk4.string_list.StringList]
final class StringListGidBuilder : StringListGidBuilderImpl!StringListGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StringList build() nothrow
  {
    return new StringList(cast(void*)createGObject(StringList._getGType), Yes.Take);
  }
}
