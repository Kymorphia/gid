/// Module for [StringList] class
module gtk.string_list;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.object;
import gobject.types;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.string_list.StringList] is a list model that wraps an array of strings.
    
    The objects in the model are of type [gtk.string_object.StringObject] and have
    a "string" property that can be used inside expressions.
    
    [gtk.string_list.StringList] is well-suited for any place where you would
    typically use a `char*[]`, but need a list model.
    
    ## GtkStringList as GtkBuildable
    
    The [gtk.string_list.StringList] implementation of the [gtk.buildable.Buildable] interface
    supports adding items directly using the `<items>` element and
    specifying `<item>` elements for each item. Each `<item>` element
    supports the regular translation attributes “translatable”,
    “context” and “comments”.
    
    Here is a UI definition fragment specifying a [gtk.string_list.StringList]
    
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
class StringList : gobject.object.ObjectWrap, gio.list_model.ListModel, gtk.buildable.Buildable
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
    return cast(void function())gtk_string_list_get_type != &gidSymbolNotFound ? gtk_string_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringList self()
  {
    return this;
  }

  /**
      Get `itemType` property.
      Returns: The type of items. See [gio.list_model.ListModel.getItemType].
  */
  @property gobject.types.GType itemType()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.types.GType)("item-type");
  }

  /**
      Get `nItems` property.
      Returns: The number of items. See [gio.list_model.ListModel.getNItems].
  */
  @property uint nItems()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-items");
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
      Creates a new [gtk.string_list.StringList] with the given strings.
  
      Params:
        strings = The strings to put in the model
      Returns: a new [gtk.string_list.StringList]
  */
  this(string[] strings = null)
  {
    GtkStringList* _cretval;
    char*[] _tmpstrings;
    foreach (s; strings)
      _tmpstrings ~= s.toCString(No.Alloc);
    _tmpstrings ~= null;
    const(char*)* _strings = _tmpstrings.ptr;

    _cretval = gtk_string_list_new(_strings);
    this(_cretval, Yes.Take);
  }

  /**
      Appends string to self.
      
      The string will be copied. See
      [gtk.string_list.StringList.take] for a way to avoid that.
  
      Params:
        string_ = the string to insert
  */
  void append(string string_)
  {
    const(char)* _string_ = string_.toCString(No.Alloc);
    gtk_string_list_append(cast(GtkStringList*)this._cPtr, _string_);
  }

  /**
      Gets the string that is at position in self.
      
      If self does not contain position items, null is returned.
      
      This function returns the const char *. To get the
      object wrapping it, use [gio.list_model.ListModel.getItem].
  
      Params:
        position = the position to get the string for
      Returns: the string at the given position
  */
  string getString(uint position)
  {
    const(char)* _cretval;
    _cretval = gtk_string_list_get_string(cast(GtkStringList*)this._cPtr, position);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes the string at position from self.
      
      position must be smaller than the current
      length of the list.
  
      Params:
        position = the position of the string that is to be removed
  */
  void remove(uint position)
  {
    gtk_string_list_remove(cast(GtkStringList*)this._cPtr, position);
  }

  /**
      Changes self by removing n_removals strings and adding additions
      to it.
      
      This function is more efficient than [gtk.string_list.StringList.append]
      and [gtk.string_list.StringList.remove], because it only emits the
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
  void splice(uint position, uint nRemovals, string[] additions = null)
  {
    char*[] _tmpadditions;
    foreach (s; additions)
      _tmpadditions ~= s.toCString(No.Alloc);
    _tmpadditions ~= null;
    const(char*)* _additions = _tmpadditions.ptr;

    gtk_string_list_splice(cast(GtkStringList*)this._cPtr, position, nRemovals, _additions);
  }

  /**
      Adds string to self at the end, and takes
      ownership of it.
      
      This variant of [gtk.string_list.StringList.append]
      is convenient for formatting strings:
      
      ```c
      gtk_string_list_take (self, g_strdup_print ("%d dollars", lots));
      ```
  
      Params:
        string_ = the string to insert
  */
  void take(string string_)
  {
    char* _string_ = string_.toCString(Yes.Alloc);
    gtk_string_list_take(cast(GtkStringList*)this._cPtr, _string_);
  }
}
