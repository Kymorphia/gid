/// Module for [ActionMap] interface
module gio.action_map;

public import gio.action_map_iface_proxy;
import gid.gid;
import gio.action;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;
import gobject.object;

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
interface ActionMap
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_action_map_get_type != &gidSymbolNotFound ? g_action_map_get_type() : cast(GType)0;
  }

  /**
      Adds an action to the action_map.
      
      If the action map already contains an action with the same name
      as action then the old action is dropped from the action map.
      
      The action map takes its own reference on action.
  
      Params:
        action = a #GAction
  */
  void addAction(gio.action.Action action);

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns null.
  
      Params:
        actionName = the name of an action
      Returns: a #GAction, or null
  */
  gio.action.Action lookupAction(string actionName);

  /**
      Removes the named action from the action map.
      
      If no action of this name is in the map then nothing happens.
  
      Params:
        actionName = the name of the action
  */
  void removeAction(string actionName);
}

/// Fluent builder implementation template for [gio.action_map.ActionMap]
interface ActionMapGidBuilderImpl(T)
{
}
