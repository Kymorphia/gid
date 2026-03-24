/// Module for [Actionable] interface mixin
module gtk.actionable_mixin;

public import gtk.actionable_iface_proxy;
public import gid.gid;
public import glib.variant;
public import gobject.gid_builder;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The [gtk.actionable.Actionable] interface provides a convenient way of associating
    widgets with actions.
    
    It primarily consists of two properties: `property@Gtk.Actionable:action-name`
    and `property@Gtk.Actionable:action-target`. There are also some convenience
    APIs for setting these properties.
    
    The action will be looked up in action groups that are found among
    the widgets ancestors. Most commonly, these will be the actions with
    the “win.” or “app.” prefix that are associated with the
    [gtk.application_window.ApplicationWindow] or [gtk.application.Application], but other action groups that
    are added with [gtk.widget.Widget.insertActionGroup] will be consulted
    as well.
*/
template ActionableT()
{

  /** */
  @property string actionName()
  {
    return getActionName();
  }

  /** */
  @property void actionName(string propval)
  {
    setActionName(propval);
  }

  /** */
  @property glib.variant.Variant actionTarget()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant.Variant)("action-target");
  }

  /** */
  @property void actionTarget(glib.variant.Variant propval)
  {
    gobject.object.ObjectWrap.setProperty!(glib.variant.Variant)("action-target", propval);
  }

  /**
      Gets the action name for actionable.
      Returns: the action name
  */
  override string getActionName()
  {
    const(char)* _cretval;
    _cretval = gtk_actionable_get_action_name(cast(GtkActionable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the current target value of actionable.
      Returns: the current target value
  */
  override glib.variant.Variant getActionTargetValue()
  {
    GVariant* _cretval;
    _cretval = gtk_actionable_get_action_target_value(cast(GtkActionable*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Specifies the name of the action with which this widget should be
      associated.
      
      If action_name is null then the widget will be unassociated from
      any previous action.
      
      Usually this function is used when the widget is located (or will be
      located) within the hierarchy of a [gtk.application_window.ApplicationWindow].
      
      Names are of the form “win.save” or “app.quit” for actions on the
      containing `classApplicationWindow` or its associated `classApplication`,
      respectively. This is the same form used for actions in the [gio.menu.Menu]
      associated with the window.
  
      Params:
        actionName = an action name
  */
  override void setActionName(string actionName = null)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    gtk_actionable_set_action_name(cast(GtkActionable*)this._cPtr, _actionName);
  }

  /**
      Sets the target value of an actionable widget.
      
      If target_value is null then the target value is unset.
      
      The target value has two purposes. First, it is used as the parameter
      to activation of the action associated with the [gtk.actionable.Actionable] widget.
      Second, it is used to determine if the widget should be rendered as
      “active” — the widget is active if the state is equal to the given target.
      
      Consider the example of associating a set of buttons with a [gio.action.Action]
      with string state in a typical “radio button” situation. Each button
      will be associated with the same action, but with a different target
      value for that action. Clicking on a particular button will activate
      the action with the target of that button, which will typically cause
      the action’s state to change to that value. Since the action’s state
      is now equal to the target value of the button, the button will now
      be rendered as active (and the other buttons, with different targets,
      rendered inactive).
  
      Params:
        targetValue = a [glib.variant.Variant] to set as the target value
  */
  override void setActionTargetValue(glib.variant.Variant targetValue = null)
  {
    gtk_actionable_set_action_target_value(cast(GtkActionable*)this._cPtr, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the action-name and associated string target value of an
      actionable widget.
      
      detailed_action_name is a string in the format accepted by
      [gio.action.Action.parseDetailedName].
  
      Params:
        detailedActionName = the detailed action name
  */
  override void setDetailedActionName(string detailedActionName)
  {
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    gtk_actionable_set_detailed_action_name(cast(GtkActionable*)this._cPtr, _detailedActionName);
  }
}

template ActionableGidBuilderT()
{

  /** */
  T actionName(string propval)
  {
    return setProperty("action-name", propval);
  }

  /** */
  T actionTarget(glib.variant.Variant propval)
  {
    return setProperty("action-target", propval);
  }
}
