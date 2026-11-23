/// Module for [Action] interface mixin
module gid.atk1.action_mixin;

public import gid.core.basictypes;
public import gid.atk1.action_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface provided by UI components
    which the user can activate/interact with.
    
    #AtkAction should be implemented by instances of #AtkObject classes
    with which the user can interact directly, i.e. buttons,
    checkboxes, scrollbars, e.g. components which are not "passive"
    providers of UI information.
    
    Exceptions: when the user interaction is already covered by another
    appropriate interface such as #AtkEditableText (insert/delete text,
    etc.) or #AtkValue (set value) then these actions should not be
    exposed by #AtkAction as well.
    
    Though most UI interactions on components should be invocable via
    keyboard as well as mouse, there will generally be a close mapping
    between "mouse actions" that are possible on a component and the
    AtkActions.  Where mouse and keyboard actions are redundant in
    effect, #AtkAction should expose only one action rather than
    exposing redundant actions if possible.  By convention we have been
    using "mouse centric" terminology for #AtkAction names.
*/
template ActionT()
{

  /**
      Perform the specified action on the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: true if success, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDoAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDoAction(int i)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.doAction)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.doAction(cast(AtkAction*)this._cPtr, i);
    return _retval;
  }

  /**
      Returns a description of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a description string, or null if action does
        not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionGetDescription`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncActionGetDescription(int i)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.getDescription)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getDescription(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the keybinding which can be used to activate this action, if one
      exists. The string returned should contain localized, human-readable,
      key sequences as they would appear when displayed on screen. It must
      be in the format "mnemonic;sequence;shortcut".
      
      - The mnemonic key activates the object if it is presently enabled onscreen.
        This typically corresponds to the underlined letter within the widget.
        Example: "n" in a traditional "New..." menu item or the "a" in "Apply" for
        a button.
      - The sequence is the full list of keys which invoke the action even if the
        relevant element is not currently shown on screen. For instance, for a menu
        item the sequence is the keybindings used to open the parent menus before
        invoking. The sequence string is colon-delimited. Example: "Alt+F:N" in a
        traditional "New..." menu item.
      - The shortcut, if it exists, will invoke the same action without showing
        the component or its enclosing menus or dialogs. Example: "Ctrl+N" in a
        traditional "New..." menu item.
      
      Example: For a traditional "New..." menu item, the expected return value
      would be: "N;Alt+F:N;Ctrl+N" for the English locale and "N;Alt+D:N;Strg+N"
      for the German locale. If, hypothetically, this menu item lacked a mnemonic,
      it would be represented by ";;Ctrl+N" and ";;Strg+N" respectively.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: the keybinding which can be used to activate
        this action, or null if there is no keybinding for this action.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetKeybinding`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetKeybinding(int i)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.getKeybinding)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getKeybinding(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the localized name of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetLocalizedName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetLocalizedName(int i)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.getLocalizedName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getLocalizedName(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of accessible actions available on the object.
      If there are more than one, the first one is considered the
      "default" action of the object.
      Returns: a the number of actions, or 0 if action does not
        implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNActions`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNActions()
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.getNActions)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNActions(cast(AtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns a non-localized string naming the specified action of the
      object. This name is generally not descriptive of the end result
      of the action, but instead names the 'interaction type' which the
      object supports. By convention, the above strings should be used to
      represent the actions which correspond to the common point-and-click
      interaction techniques of the same name: i.e.
      "click", "press", "release", "drag", "drop", "popup", etc.
      The "popup" action should be used to pop up a context menu for the
      object, if one exists.
      
      For technical reasons, some toolkits cannot guarantee that the
      reported action is actually 'bound' to a nontrivial user event;
      i.e. the result of some actions via [gid.atk1.action.Action.doAction] may be
      NIL.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionGetName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncActionGetName(int i)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getName(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets a description of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
        desc = the description to be assigned to this action
      Returns: a gboolean representing if the description was successfully set;
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionSetDescription`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncActionSetDescription(int i, string desc)
  {
    auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.action.Action._getGType);
    if (!_klass || !_klass.setDescription)
      return typeof(return).init;

    bool _retval;
    const(char)* _desc = desc.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.setDescription(cast(AtkAction*)this._cPtr, i, _desc);
    return _retval;
  }

  /**
      Perform the specified action on the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: true if success, false otherwise
  */
  override bool doAction(int i) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_action_do_action(cast(AtkAction*)this._cPtr, i);
    return _retval;
  }

  /**
      Returns a description of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a description string, or null if action does
        not implement this interface.
  */
  override string getDescription(int i) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_action_get_description(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the keybinding which can be used to activate this action, if one
      exists. The string returned should contain localized, human-readable,
      key sequences as they would appear when displayed on screen. It must
      be in the format "mnemonic;sequence;shortcut".
      
      - The mnemonic key activates the object if it is presently enabled onscreen.
        This typically corresponds to the underlined letter within the widget.
        Example: "n" in a traditional "New..." menu item or the "a" in "Apply" for
        a button.
      - The sequence is the full list of keys which invoke the action even if the
        relevant element is not currently shown on screen. For instance, for a menu
        item the sequence is the keybindings used to open the parent menus before
        invoking. The sequence string is colon-delimited. Example: "Alt+F:N" in a
        traditional "New..." menu item.
      - The shortcut, if it exists, will invoke the same action without showing
        the component or its enclosing menus or dialogs. Example: "Ctrl+N" in a
        traditional "New..." menu item.
      
      Example: For a traditional "New..." menu item, the expected return value
      would be: "N;Alt+F:N;Ctrl+N" for the English locale and "N;Alt+D:N;Strg+N"
      for the German locale. If, hypothetically, this menu item lacked a mnemonic,
      it would be represented by ";;Ctrl+N" and ";;Strg+N" respectively.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: the keybinding which can be used to activate
        this action, or null if there is no keybinding for this action.
  */
  override string getKeybinding(int i) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_action_get_keybinding(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the localized name of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  */
  override string getLocalizedName(int i) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_action_get_localized_name(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of accessible actions available on the object.
      If there are more than one, the first one is considered the
      "default" action of the object.
      Returns: a the number of actions, or 0 if action does not
        implement this interface.
  */
  override int getNActions() nothrow
  {
    int _retval;
    _retval = atk_action_get_n_actions(cast(AtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns a non-localized string naming the specified action of the
      object. This name is generally not descriptive of the end result
      of the action, but instead names the 'interaction type' which the
      object supports. By convention, the above strings should be used to
      represent the actions which correspond to the common point-and-click
      interaction techniques of the same name: i.e.
      "click", "press", "release", "drag", "drop", "popup", etc.
      The "popup" action should be used to pop up a context menu for the
      object, if one exists.
      
      For technical reasons, some toolkits cannot guarantee that the
      reported action is actually 'bound' to a nontrivial user event;
      i.e. the result of some actions via [gid.atk1.action.Action.doAction] may be
      NIL.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  */
  override string getName(int i) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_action_get_name(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets a description of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
        desc = the description to be assigned to this action
      Returns: a gboolean representing if the description was successfully set;
  */
  override bool setDescription(int i, string desc) nothrow
  {
    bool _retval;
    const(char)* _desc = desc.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)atk_action_set_description(cast(AtkAction*)this._cPtr, i, _desc);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.action.Action (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_action_Action(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDoAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionGetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetKeybinding", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLocalizedName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNActions", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionSetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.action.Action vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_action_Action(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDoAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_action_Action(iface, "do_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionGetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.action.Action.vfuncActionGetDescription is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetKeybinding", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.action.Action.vfuncGetKeybinding is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLocalizedName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.action.Action.vfuncGetLocalizedName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNActions", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_action_Action(iface, "get_n_actions");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.action.Action.vfuncActionGetName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionSetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_action_Action(iface, "set_description");
  }

  private static void _installIfaceVfunc_gid_atk1_action_Action(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkActionIface*)iface;

    switch (vfunc)
    {
      case "do_action":
      {
        static extern(C) gboolean _vfuncDoActionTramp(AtkAction* action, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.atk1.action.Action._getGType);
            if (_klass && _klass.doAction)
              return (cast(typeof(&_vfuncDoActionTramp))_klass.doAction)(action, i);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDoAction(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.action.Action.vfuncDoAction");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.doAction = cast(typeof(_klass.doAction))&_vfuncDoActionTramp;
        break;
      }
      case "get_n_actions":
      {
        static extern(C) int _vfuncGetNActionsTramp(AtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.atk1.action.Action._getGType);
            if (_klass && _klass.getNActions)
              return (cast(typeof(&_vfuncGetNActionsTramp))_klass.getNActions)(action);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNActions();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.action.Action.vfuncGetNActions");
          }
          return _retval;
        }

        _klass.getNActions = cast(typeof(_klass.getNActions))&_vfuncGetNActionsTramp;
        break;
      }
      case "set_description":
      {
        static extern(C) gboolean _vfuncActionSetDescriptionTramp(AtkAction* action, int i, const(char)* desc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(AtkActionIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.atk1.action.Action._getGType);
            if (_klass && _klass.setDescription)
              return (cast(typeof(&_vfuncActionSetDescriptionTramp))_klass.setDescription)(action, i, desc);
            return typeof(return).init;
          }

          bool _dretval;
          string _desc = desc.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncActionSetDescription(i, _desc);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.action.Action.vfuncActionSetDescription");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setDescription = cast(typeof(_klass.setDescription))&_vfuncActionSetDescriptionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.action.Action]
template ActionGidBuilderT()
{
}
