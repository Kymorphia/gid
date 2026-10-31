/// Module for [ActionMap] interface mixin
module gio.action_map_mixin;

public import gid.basictypes;
public import gio.action_map_iface_proxy;
public import gid.gid;
public import gio.action;
public import gio.action_entry;
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
  override void addAction(gio.action.Action action) nothrow
  {
    g_action_map_add_action(cast(GActionMap*)this._cPtr, action ? cast(GAction*)(cast(gobject.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

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
  override void addActionEntries(gio.action_entry.ActionEntry[] entries, void* userData = null) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    GActionEntry[] _tmpentries;
    foreach (obj; entries)
      _tmpentries ~= obj._cInstance;
    const(GActionEntry)* _entries = _tmpentries.ptr;

    g_action_map_add_action_entries(cast(GActionMap*)this._cPtr, _entries, _nEntries, userData);
  }

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns null.
  
      Params:
        actionName = the name of an action
      Returns: a #GAction, or null
  */
  override gio.action.Action lookupAction(string actionName) nothrow
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
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
  override void removeAction(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_map_remove_action(cast(GActionMap*)this._cPtr, _actionName);
  }

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
  override void removeActionEntries(gio.action_entry.ActionEntry[] entries) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    GActionEntry[] _tmpentries;
    foreach (obj; entries)
      _tmpentries ~= obj._cInstance;
    const(GActionEntry)* _entries = _tmpentries.ptr;

    g_action_map_remove_action_entries(cast(GActionMap*)this._cPtr, _entries, _nEntries);
  }
}

/// Fluent builder implementation template for [gio.action_map.ActionMap]
template ActionMapGidBuilderT()
{
}
