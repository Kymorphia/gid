/// Module for [ActionMap] interface
module gio.action_map;

public import gid.basictypes;
public import gio.action_map_iface_proxy;
import gid.gid;
import gio.action;
import gio.action_entry;
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
  static GType _getGType() nothrow
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
      A convenience function for creating multiple #GSimpleAction instances
      and adding them to a #GActionMap.
      
      Each action is constructed as per one #GActionEntry.
      
      ```c
      static void
      activate_quit (GSimpleAction *simple,
                     GVariant      *parameter,
                     gpointer       user_data)
      {
        exit (0);
      }
      
      static void
      activate_print_string (GSimpleAction *simple,
                             GVariant      *parameter,
                             gpointer       user_data)
      {
        g_print ("%s\n", g_variant_get_string (parameter, NULL));
      }
      
      static GActionGroup *
      create_action_group (void)
      {
        const GActionEntry entries[] = {
          { "quit",         activate_quit              },
          { "print-string", activate_print_string, "s" }
        };
        GSimpleActionGroup *group;
      
        group = g_simple_action_group_new ();
        g_action_map_add_action_entries (G_ACTION_MAP (group), entries, G_N_ELEMENTS (entries), NULL);
      
        return G_ACTION_GROUP (group);
      }
      ```
  
      Params:
        entries = a pointer to
                    the first item in an array of #GActionEntry structs
        userData = the user data for signal connections
  */
  void addActionEntries(gio.action_entry.ActionEntry[] entries, void* userData = null);

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

  /**
      Remove actions from a #GActionMap. This is meant as the reverse of
      [gio.action_map.ActionMap.addActionEntries].
      
      
      ```c
      static const GActionEntry entries[] = {
          { "quit",         activate_quit              },
          { "print-string", activate_print_string, "s" }
      };
      
      void
      add_actions (GActionMap *map)
      {
        g_action_map_add_action_entries (map, entries, G_N_ELEMENTS (entries), NULL);
      }
      
      void
      remove_actions (GActionMap *map)
      {
        g_action_map_remove_action_entries (map, entries, G_N_ELEMENTS (entries));
      }
      ```
  
      Params:
        entries = a pointer to
                    the first item in an array of #GActionEntry structs
  */
  void removeActionEntries(gio.action_entry.ActionEntry[] entries);
}

/// Fluent builder implementation template for [gio.action_map.ActionMap]
interface ActionMapGidBuilderImpl(T)
{
}
