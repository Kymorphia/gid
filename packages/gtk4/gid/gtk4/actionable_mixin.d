/// Module for [Actionable] interface mixin
module gid.gtk4.actionable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.actionable_iface_proxy;
public import gid.core.gid;
public import gid.glib2.variant;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    Provides a way to associate widgets with actions.
    
    It primarily consists of two properties: [gid.gtk4.actionable.Actionable.actionName]
    and [gid.gtk4.actionable.Actionable.actionTarget]. There are also some convenience
    APIs for setting these properties.
    
    The action will be looked up in action groups that are found among
    the widgets ancestors. Most commonly, these will be the actions with
    the “win.” or “app.” prefix that are associated with the
    [gid.gtk4.application_window.ApplicationWindow] or [gid.gtk4.application.Application], but other action groups that
    are added with [gid.gtk4.widget.Widget.insertActionGroup] will be consulted
    as well.
*/
template ActionableT()
{

  /**
      Get `actionName` property.
      Returns: The name of the action with which this widget should be associated.
  */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action with which this widget should be associated.
  */
  @property void actionName(string propval) nothrow
  {
    setActionName(propval);
  }

  /**
      Get `actionTarget` property.
      Returns: The target value of the actionable widget's action.
  */
  @property gid.glib2.variant.Variant actionTarget() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.glib2.variant.Variant)("action-target");
  }

  /**
      Set `actionTarget` property.
      Params:
        propval = The target value of the actionable widget's action.
  */
  @property void actionTarget(gid.glib2.variant.Variant propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.glib2.variant.Variant)("action-target", propval);
  }

  /**
      Gets the action name for actionable.
      Returns: the action name
  */
  override string getActionName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_actionable_get_action_name(cast(GtkActionable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the current target value of actionable.
      Returns: the current target value
  */
  override gid.glib2.variant.Variant getActionTargetValue() nothrow
  {
    GVariant* _cretval;
    _cretval = gtk_actionable_get_action_target_value(cast(GtkActionable*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Specifies the name of the action with which this widget should be
      associated.
      
      If action_name is null then the widget will be unassociated from
      any previous action.
      
      Usually this function is used when the widget is located (or will be
      located) within the hierarchy of a [gid.gtk4.application_window.ApplicationWindow].
      
      Names are of the form “win.save” or “app.quit” for actions on the
      containing [gid.gtk4.application_window.ApplicationWindow] or its associated [gid.gtk4.application.Application],
      respectively. This is the same form used for actions in the [gid.gio2.menu.Menu]
      associated with the window.
  
      Params:
        actionName = an action name
  */
  override void setActionName(string actionName = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, Yes.Nullable);
    gtk_actionable_set_action_name(cast(GtkActionable*)this._cPtr, _actionName);
  }

  /**
      Sets the target value of an actionable widget.
      
      If target_value is null then the target value is unset.
      
      The target value has two purposes. First, it is used as the parameter
      to activation of the action associated with the [gid.gtk4.actionable.Actionable] widget.
      Second, it is used to determine if the widget should be rendered as
      “active” — the widget is active if the state is equal to the given target.
      
      Consider the example of associating a set of buttons with a [gid.gio2.action.Action]
      with string state in a typical “radio button” situation. Each button
      will be associated with the same action, but with a different target
      value for that action. Clicking on a particular button will activate
      the action with the target of that button, which will typically cause
      the action’s state to change to that value. Since the action’s state
      is now equal to the target value of the button, the button will now
      be rendered as active (and the other buttons, with different targets,
      rendered inactive).
  
      Params:
        targetValue = a [gid.glib2.variant.Variant] to set as the target value
  */
  override void setActionTargetValue(gid.glib2.variant.Variant targetValue = null) nothrow
  {
    gtk_actionable_set_action_target_value(cast(GtkActionable*)this._cPtr, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the action-name and associated string target value of an
      actionable widget.
      
      detailed_action_name is a string in the format accepted by
      [gid.gio2.action.Action.parseDetailedName].
  
      Params:
        detailedActionName = the detailed action name
  */
  override void setDetailedActionName(string detailedActionName) nothrow
  {
    const(char)* _detailedActionName = detailedActionName.toCString!(No.Malloc, No.Nullable);
    gtk_actionable_set_detailed_action_name(cast(GtkActionable*)this._cPtr, _detailedActionName);
  }
}

/// Fluent builder implementation template for [gid.gtk4.actionable.Actionable]
template ActionableGidBuilderT()
{

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action with which this widget should be associated.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /**
      Set `actionTarget` property.
      Params:
        propval = The target value of the actionable widget's action.
      Returns: Builder instance for fluent chaining
  */
  T actionTarget(gid.glib2.variant.Variant propval) nothrow
  {
    return setProperty("action-target", propval);
  }
}
