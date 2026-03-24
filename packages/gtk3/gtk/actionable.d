/// Module for [Actionable] interface
module gtk.actionable;

public import gtk.actionable_iface_proxy;
import gid.gid;
import glib.variant;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    This interface provides a convenient way of associating widgets with
    actions on a #GtkApplicationWindow or #GtkApplication.
    
    It primarily consists of two properties: #GtkActionable:action-name
    and #GtkActionable:action-target. There are also some convenience APIs
    for setting these properties.
    
    The action will be looked up in action groups that are found among
    the widgets ancestors. Most commonly, these will be the actions with
    the “win.” or “app.” prefix that are associated with the #GtkApplicationWindow
    or #GtkApplication, but other action groups that are added with
    [gtk.widget.Widget.insertActionGroup] will be consulted as well.
*/
interface Actionable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_actionable_get_type != &gidSymbolNotFound ? gtk_actionable_get_type() : cast(GType)0;
  }

  /** */
  @property string actionName();

  /** */
  @property void actionName(string propval);

  /** */
  @property glib.variant.Variant actionTarget();

  /** */
  @property void actionTarget(glib.variant.Variant propval);

  /**
      Gets the action name for actionable.
      
      See [gtk.actionable.Actionable.setActionName] for more information.
      Returns: the action name, or null if none is set
  */
  string getActionName();

  /**
      Gets the current target value of actionable.
      
      See [gtk.actionable.Actionable.setActionTargetValue] for more information.
      Returns: the current target value
  */
  glib.variant.Variant getActionTargetValue();

  /**
      Specifies the name of the action with which this widget should be
      associated.  If action_name is null then the widget will be
      unassociated from any previous action.
      
      Usually this function is used when the widget is located (or will be
      located) within the hierarchy of a #GtkApplicationWindow.
      
      Names are of the form “win.save” or “app.quit” for actions on the
      containing #GtkApplicationWindow or its associated #GtkApplication,
      respectively.  This is the same form used for actions in the #GMenu
      associated with the window.
  
      Params:
        actionName = an action name, or null
  */
  void setActionName(string actionName = null);

  /**
      Sets the target value of an actionable widget.
      
      If target_value is null then the target value is unset.
      
      The target value has two purposes.  First, it is used as the
      parameter to activation of the action associated with the
      #GtkActionable widget. Second, it is used to determine if the widget
      should be rendered as “active” — the widget is active if the state
      is equal to the given target.
      
      Consider the example of associating a set of buttons with a #GAction
      with string state in a typical “radio button” situation.  Each button
      will be associated with the same action, but with a different target
      value for that action.  Clicking on a particular button will activate
      the action with the target of that button, which will typically cause
      the action’s state to change to that value.  Since the action’s state
      is now equal to the target value of the button, the button will now
      be rendered as active (and the other buttons, with different targets,
      rendered inactive).
  
      Params:
        targetValue = a #GVariant to set as the target value, or null
  */
  void setActionTargetValue(glib.variant.Variant targetValue = null);

  /**
      Sets the action-name and associated string target value of an
      actionable widget.
      
      detailed_action_name is a string in the format accepted by
      [gio.action.Action.parseDetailedName].
      
      (Note that prior to version 3.22.25,
      this function is only usable for actions with a simple "s" target, and
      detailed_action_name must be of the form `"action::target"` where
      `action` is the action name and `target` is the string to use
      as the target.)
  
      Params:
        detailedActionName = the detailed action name
  */
  void setDetailedActionName(string detailedActionName);
}

interface ActionableGidBuilderImpl(T)
{

  /** */
  T actionName(string propval);

  /** */
  T actionTarget(glib.variant.Variant propval);
}
