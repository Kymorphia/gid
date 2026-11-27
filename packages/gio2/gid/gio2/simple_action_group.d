/// Module for [SimpleActionGroup] class
module gid.gio2.simple_action_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action;
import gid.gio2.action_entry;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.simple_action_group.SimpleActionGroup] is a hash table filled with [gid.gio2.action.Action] objects,
    implementing the [gid.gio2.action_group.ActionGroup] and [gid.gio2.action_map.ActionMap]
    interfaces.
*/
@gidGir("SimpleActionGroup", "SimpleActionGroupClass")
class SimpleActionGroup : gid.gobject2.object.ObjectWrap, gid.gio2.action_group.ActionGroup, gid.gio2.action_map.ActionMap
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
    return cast(void function())g_simple_action_group_get_type != &gidSymbolNotFound ? g_simple_action_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSimpleActionGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleActionGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.simple_action_group.SimpleActionGroup]
      Returns: New builder object
  */
  static SimpleActionGroupGidBuilder builder() nothrow
  {
    return new SimpleActionGroupGidBuilder;
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new, empty, #GSimpleActionGroup.
      Returns: a new #GSimpleActionGroup
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GSimpleActionGroup* _cretval;
      _cretval = g_simple_action_group_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      A convenience function for creating multiple #GSimpleAction instances
      and adding them to the action group.
  
      Params:
        entries = a pointer to the first item in
                    an array of #GActionEntry structs
        userData = the user data for signal connections
  
      Deprecated: Use [gid.gio2.action_map.ActionMap.addActionEntries]
  */
  void addEntries(gid.gio2.action_entry.ActionEntry[] entries, void* userData = null) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    auto _entries_arr = new GActionEntry[](entries.length);
    auto _entries = _entries_arr.ptr;
    foreach (i, obj; entries) _entries[i] = *cast(GActionEntry*)obj._cPtr;
    g_simple_action_group_add_entries(cast(GSimpleActionGroup*)this._cPtr, _entries, _nEntries, userData);
  }

  /**
      Adds an action to the action group.
      
      If the action group already contains an action with the same name as
      action then the old action is dropped from the group.
      
      The action group takes its own reference on action.
  
      Params:
        action = a #GAction
  
      Deprecated: Use [gid.gio2.action_map.ActionMap.addAction]
  */
  void insert(gid.gio2.action.Action action) nothrow
  {
    g_simple_action_group_insert(cast(GSimpleActionGroup*)this._cPtr, action ? cast(GAction*)(cast(gid.gobject2.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

  /**
      Looks up the action with the name action_name in the group.
      
      If no such action exists, returns null.
  
      Params:
        actionName = the name of an action
      Returns: a #GAction, or null
  
      Deprecated: Use [gid.gio2.action_map.ActionMap.lookupAction]
  */
  gid.gio2.action.Action lookup(string actionName) nothrow
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_simple_action_group_lookup(cast(GSimpleActionGroup*)this._cPtr, _actionName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes the named action from the action group.
      
      If no action of this name is in the group then nothing happens.
  
      Params:
        actionName = the name of the action
  
      Deprecated: Use [gid.gio2.action_map.ActionMap.removeAction]
  */
  void remove(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_simple_action_group_remove(cast(GSimpleActionGroup*)this._cPtr, _actionName);
  }
}

/// Fluent builder implementation template for [gid.gio2.simple_action_group.SimpleActionGroup]
class SimpleActionGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action_group.ActionGroupGidBuilderImpl!T, gid.gio2.action_map.ActionMapGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin ActionMapGidBuilderT!();
}

/// Fluent builder for [gid.gio2.simple_action_group.SimpleActionGroup]
final class SimpleActionGroupGidBuilder : SimpleActionGroupGidBuilderImpl!SimpleActionGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimpleActionGroup build() nothrow
  {
    return new SimpleActionGroup(cast(void*)createGObject(SimpleActionGroup._getGType), Yes.Take);
  }
}
