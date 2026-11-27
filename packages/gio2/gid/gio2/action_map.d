/// Module for [ActionMap] interface
module gid.gio2.action_map;

public import gid.core.basictypes;
public import gid.gio2.action_map_iface_proxy;
import gid.core.utils;
import gid.gio2.action;
import gid.gio2.action_entry;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.action_map.ActionMap] is an interface for action containers.
    
    The [gid.gio2.action_map.ActionMap] interface is implemented by [gid.gio2.action_group.ActionGroup]
    implementations that operate by containing a number of named
    [gid.gio2.action.Action] instances, such as [gid.gio2.simple_action_group.SimpleActionGroup].
    
    One useful application of this interface is to map the
    names of actions from various action groups to unique,
    prefixed names (e.g. by prepending "app." or "win.").
    This is the motivation for the ‘Map’ part of the interface
    name.
*/
@gidGir("ActionMap", "ActionMapInterface")
interface ActionMap : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_action_map_get_type != &gidSymbolNotFound ? g_action_map_get_type() : cast(GType)0;
  }




  /**
      Adds an action to the action_map.
      
      If the action map already contains an action with the same name
      as action then the old action is dropped from the action map.
      
      The action map takes its own reference on action.
  
      Params:
        action = a [gid.gio2.action.Action]
  */
  void addAction(gid.gio2.action.Action action);

  /**
      A convenience function for creating multiple [gid.gio2.simple_action.SimpleAction]
      instances and adding them to a [gid.gio2.action_map.ActionMap].
      
      Each action is constructed as per one [gid.gio2.action_entry.ActionEntry].
      
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
            the first item in an array of [gid.gio2.action_entry.ActionEntry] structs
        userData = the user data for signal connections
  */
  void addActionEntries(gid.gio2.action_entry.ActionEntry[] entries, void* userData = null);

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns `NULL`.
  
      Params:
        actionName = the name of an action
      Returns: a [gid.gio2.action.Action]
  */
  gid.gio2.action.Action lookupAction(string actionName);

  /**
      Removes the named action from the action map.
      
      If no action of this name is in the map then nothing happens.
  
      Params:
        actionName = the name of the action
  */
  void removeAction(string actionName);

  /**
      Remove actions from a [gid.gio2.action_map.ActionMap]. This is meant as the reverse of
      [gid.gio2.action_map.ActionMap.addActionEntries].
      
      
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
            the first item in an array of [gid.gio2.action_entry.ActionEntry] structs
  */
  void removeActionEntries(gid.gio2.action_entry.ActionEntry[] entries);
}

/// Fluent builder implementation template for [gid.gio2.action_map.ActionMap]
interface ActionMapGidBuilderImpl(T)
{
}
