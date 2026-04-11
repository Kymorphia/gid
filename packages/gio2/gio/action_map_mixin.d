/// Module for [ActionMap] interface mixin
module gio.action_map_mixin;

public import gio.action_map_iface_proxy;
public import gid.gid;
public import gio.action;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import gobject.gid_builder;
public import gobject.object;

/**
    [gio.action_map.ActionMap] is an interface for action containers.
    
    The [gio.action_map.ActionMap] interface is implemented by [gio.action_group.ActionGroup]
    implementations that operate by containing a number of named
    [gio.action.Action] instances, such as [gio.simple_action_group.SimpleActionGroup].
    
    One useful application of this interface is to map the
    names of actions from various action groups to unique,
    prefixed names (e.g. by prepending "app." or "win.").
    This is the motivation for the 'Map' part of the interface
    name.
*/
template ActionMapT()
{

  /**
      Adds an action to the action_map.
      
      If the action map already contains an action with the same name
      as action then the old action is dropped from the action map.
      
      The action map takes its own reference on action.
  
      Params:
        action = a #GAction
  */
  override void addAction(gio.action.Action action)
  {
    g_action_map_add_action(cast(GActionMap*)this._cPtr, action ? cast(GAction*)(cast(gobject.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns null.
  
      Params:
        actionName = the name of an action
      Returns: a #GAction, or null
  */
  override gio.action.Action lookupAction(string actionName)
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_action_map_lookup_action(cast(GActionMap*)this._cPtr, _actionName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes the named action from the action map.
      
      If no action of this name is in the map then nothing happens.
  
      Params:
        actionName = the name of the action
  */
  override void removeAction(string actionName)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    g_action_map_remove_action(cast(GActionMap*)this._cPtr, _actionName);
  }
}

/// Fluent builder implementation template for [gio.action_map.ActionMap]
template ActionMapGidBuilderT()
{
}
