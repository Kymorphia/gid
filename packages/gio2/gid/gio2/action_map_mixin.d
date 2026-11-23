/// Module for [ActionMap] interface mixin
module gid.gio2.action_map_mixin;

public import gid.core.basictypes;
public import gid.gio2.action_map_iface_proxy;
public import gid.core.utils;
public import gid.gio2.action;
public import gid.gio2.action_entry;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

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
template ActionMapT()
{

  /**
      Adds an action to the action_map.
      
      If the action map already contains an action with the same name
      as action then the old action is dropped from the action map.
      
      The action map takes its own reference on action.
  
      Params:
        action = a [gid.gio2.action.Action]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddAction(gid.gio2.action.Action action)
  {
    auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_map.ActionMap._getGType);
    if (!_klass || !_klass.addAction)
      return;

    _klass.addAction(cast(GActionMap*)this._cPtr, action ? cast(GAction*)(cast(gid.gobject2.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns `NULL`.
  
      Params:
        actionName = the name of an action
      Returns: a [gid.gio2.action.Action]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLookupAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.action.Action vfuncLookupAction(string actionName)
  {
    auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_map.ActionMap._getGType);
    if (!_klass || !_klass.lookupAction)
      return typeof(return).init;

    GAction* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.lookupAction(cast(GActionMap*)this._cPtr, _actionName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes the named action from the action map.
      
      If no action of this name is in the map then nothing happens.
  
      Params:
        actionName = the name of the action
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoveAction(string actionName)
  {
    auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_map.ActionMap._getGType);
    if (!_klass || !_klass.removeAction)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.removeAction(cast(GActionMap*)this._cPtr, _actionName);
  }

  /**
      Adds an action to the action_map.
      
      If the action map already contains an action with the same name
      as action then the old action is dropped from the action map.
      
      The action map takes its own reference on action.
  
      Params:
        action = a [gid.gio2.action.Action]
  */
  override void addAction(gid.gio2.action.Action action) nothrow
  {
    g_action_map_add_action(cast(GActionMap*)this._cPtr, action ? cast(GAction*)(cast(gid.gobject2.object.ObjectWrap)action)._cPtr(No.Dup) : null);
  }

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
  override void addActionEntries(gid.gio2.action_entry.ActionEntry[] entries, void* userData = null) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    auto _entries_arr = new GActionEntry[](entries.length);
    auto _entries = _entries_arr.ptr;
    foreach (i, obj; entries) _entries[i] = *cast(GActionEntry*)obj._cPtr;
    g_action_map_add_action_entries(cast(GActionMap*)this._cPtr, _entries, _nEntries, userData);
  }

  /**
      Looks up the action with the name action_name in action_map.
      
      If no such action exists, returns `NULL`.
  
      Params:
        actionName = the name of an action
      Returns: a [gid.gio2.action.Action]
  */
  override gid.gio2.action.Action lookupAction(string actionName) nothrow
  {
    GAction* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_map_lookup_action(cast(GActionMap*)this._cPtr, _actionName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action.Action)(cast(GAction*)_cretval, No.Take);
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
  override void removeActionEntries(gid.gio2.action_entry.ActionEntry[] entries) nothrow
  {
    int _nEntries;
    if (entries)
      _nEntries = cast(int)entries.length;

    auto _entries_arr = new GActionEntry[](entries.length);
    auto _entries = _entries_arr.ptr;
    foreach (i, obj; entries) _entries[i] = *cast(GActionEntry*)obj._cPtr;
    g_action_map_remove_action_entries(cast(GActionMap*)this._cPtr, _entries, _nEntries);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.action_map.ActionMap (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_action_map_ActionMap(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveAction", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.action_map.ActionMap vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_action_map_ActionMap(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_map_ActionMap(iface, "add_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_map_ActionMap(iface, "lookup_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_map_ActionMap(iface, "remove_action");
  }

  private static void _installIfaceVfunc_gid_gio2_action_map_ActionMap(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GActionMapInterface*)iface;

    switch (vfunc)
    {
      case "add_action":
      {
        static extern(C) void _vfuncAddActionTramp(GActionMap* actionMap, GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionMap);
          if (!_obj)
          {
            auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionMap), gid.gio2.action_map.ActionMap._getGType);
            if (_klass && _klass.addAction)
              return (cast(typeof(&_vfuncAddActionTramp))_klass.addAction)(actionMap, action);
            return;
          }

          try
          {
            _obj.vfuncAddAction(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action.Action)(cast(void*)action, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_map.ActionMap.vfuncAddAction");
          }
        }

        _klass.addAction = cast(typeof(_klass.addAction))&_vfuncAddActionTramp;
        break;
      }
      case "lookup_action":
      {
        static extern(C) GAction* _vfuncLookupActionTramp(GActionMap* actionMap, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionMap);
          if (!_obj)
          {
            auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionMap), gid.gio2.action_map.ActionMap._getGType);
            if (_klass && _klass.lookupAction)
              return (cast(typeof(&_vfuncLookupActionTramp))_klass.lookupAction)(actionMap, actionName);
            return typeof(return).init;
          }

          gid.gio2.action.Action _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookupAction(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_map.ActionMap.vfuncLookupAction");
          }
          auto _retval = _dretval ? cast(GAction*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.lookupAction = cast(typeof(_klass.lookupAction))&_vfuncLookupActionTramp;
        break;
      }
      case "remove_action":
      {
        static extern(C) void _vfuncRemoveActionTramp(GActionMap* actionMap, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionMap);
          if (!_obj)
          {
            auto _klass = cast(GActionMapInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionMap), gid.gio2.action_map.ActionMap._getGType);
            if (_klass && _klass.removeAction)
              return (cast(typeof(&_vfuncRemoveActionTramp))_klass.removeAction)(actionMap, actionName);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncRemoveAction(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_map.ActionMap.vfuncRemoveAction");
          }
        }

        _klass.removeAction = cast(typeof(_klass.removeAction))&_vfuncRemoveActionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.action_map.ActionMap]
template ActionMapGidBuilderT()
{
}
