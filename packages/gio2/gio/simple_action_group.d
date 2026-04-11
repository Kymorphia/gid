/// Module for [SimpleActionGroup] class
module gio.simple_action_group;

import gid.gid;
import gio.action;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.simple_action_group.SimpleActionGroup] is a hash table filled with [gio.action.Action] objects,
    implementing the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap]
    interfaces.
*/
class SimpleActionGroup : gobject.object.ObjectWrap, gio.action_group.ActionGroup, gio.action_map.ActionMap
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
    return cast(void function())g_simple_action_group_get_type != &gidSymbolNotFound ? g_simple_action_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleActionGroup self()
  {
    return this;
  }

  /**
      Get builder for [gio.simple_action_group.SimpleActionGroup]
      Returns: New builder object
  */
  static SimpleActionGroupGidBuilder builder()
  {
    return new SimpleActionGroupGidBuilder;
  }

  mixin ActionGroupT!();
  mixin ActionMapT!();

  /**
      Creates a new, empty, #GSimpleActionGroup.
      Returns: a new #GSimpleActionGroup
  */
  this()
  {
    GSimpleActionGroup* _cretval;
    _cretval = g_simple_action_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds an action to the action group.
      
      If the action group already contains an action with the same name as
      action then the old action is dropped from the group.
      
      The action group takes its own reference on action.
  
      Params:
        action = a #GAction
  
      Deprecated: Use [gio.action_map.ActionMap.addAction]
  */
  void insert(gio.action.Action action)
  {
    g_simple_action_group_insert(cast(GSimpleActionGroup*)this._cPtr, action ? cast(GAction*)(cast(gobject.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

  /**
      Looks up the action with the name action_name in the group.
      
      If no such action exists, returns null.
  
      Params:
        actionName = the name of an action
      Returns: a #GAction, or null
  
      Deprecated: Use [gio.action_map.ActionMap.lookupAction]
  */
  gio.action.Action lookup(string actionName)
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_simple_action_group_lookup(cast(GSimpleActionGroup*)this._cPtr, _actionName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes the named action from the action group.
      
      If no action of this name is in the group then nothing happens.
  
      Params:
        actionName = the name of the action
  
      Deprecated: Use [gio.action_map.ActionMap.removeAction]
  */
  void remove(string actionName)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    g_simple_action_group_remove(cast(GSimpleActionGroup*)this._cPtr, _actionName);
  }
}

/// Fluent builder implementation template for [gio.simple_action_group.SimpleActionGroup]
class SimpleActionGroupGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.action_group.ActionGroupGidBuilderImpl!T, gio.action_map.ActionMapGidBuilderImpl!T
{

  mixin ActionGroupGidBuilderT!();
  mixin ActionMapGidBuilderT!();
}

/// Fluent builder for [gio.simple_action_group.SimpleActionGroup]
final class SimpleActionGroupGidBuilder : SimpleActionGroupGidBuilderImpl!SimpleActionGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimpleActionGroup build()
  {
    return new SimpleActionGroup(cast(void*)createGObject(SimpleActionGroup._getGType), Yes.Take);
  }
}
