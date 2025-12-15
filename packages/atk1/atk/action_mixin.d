/// Module for [Action] interface mixin
module atk.action_mixin;

public import atk.action_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;

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
  */
  override bool doAction(int i)
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
  override string getDescription(int i)
  {
    const(char)* _cretval;
    _cretval = atk_action_get_description(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the keybinding which can be used to activate this action, if one
      exists. The string returned should contain localized, human-readable,
      key sequences as they would appear when displayed on screen. It must
      be in the format "mnemonic;sequence;shortcut".
      
      $(LIST
        * The mnemonic key activates the object if it is presently enabled onscreen.
          This typically corresponds to the underlined letter within the widget.
          Example: "n" in a traditional "New..." menu item or the "a" in "Apply" for
          a button.
        * The sequence is the full list of keys which invoke the action even if the
          relevant element is not currently shown on screen. For instance, for a menu
          item the sequence is the keybindings used to open the parent menus before
          invoking. The sequence string is colon-delimited. Example: "Alt+F:N" in a
          traditional "New..." menu item.
        * The shortcut, if it exists, will invoke the same action without showing
          the component or its enclosing menus or dialogs. Example: "Ctrl+N" in a
          traditional "New..." menu item.
      )
        
      Example: For a traditional "New..." menu item, the expected return value
      would be: "N;Alt+F:N;Ctrl+N" for the English locale and "N;Alt+D:N;Strg+N"
      for the German locale. If, hypothetically, this menu item lacked a mnemonic,
      it would be represented by ";;Ctrl+N" and ";;Strg+N" respectively.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: the keybinding which can be used to activate
        this action, or null if there is no keybinding for this action.
  */
  override string getKeybinding(int i)
  {
    const(char)* _cretval;
    _cretval = atk_action_get_keybinding(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the localized name of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  */
  override string getLocalizedName(int i)
  {
    const(char)* _cretval;
    _cretval = atk_action_get_localized_name(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of accessible actions available on the object.
      If there are more than one, the first one is considered the
      "default" action of the object.
      Returns: a the number of actions, or 0 if action does not
        implement this interface.
  */
  override int getNActions()
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
      i.e. the result of some actions via [atk.action.Action.doAction] may be
      NIL.
  
      Params:
        i = the action index corresponding to the action to be performed
      Returns: a name string, or null if action does not
        implement this interface.
  */
  override string getName(int i)
  {
    const(char)* _cretval;
    _cretval = atk_action_get_name(cast(AtkAction*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets a description of the specified action of the object.
  
      Params:
        i = the action index corresponding to the action to be performed
        desc = the description to be assigned to this action
      Returns: a gboolean representing if the description was successfully set;
  */
  override bool setDescription(int i, string desc)
  {
    bool _retval;
    const(char)* _desc = desc.toCString(No.Alloc);
    _retval = cast(bool)atk_action_set_description(cast(AtkAction*)this._cPtr, i, _desc);
    return _retval;
  }
}
