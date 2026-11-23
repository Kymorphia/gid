/// Module for [Actionable] interface mixin
module gid.gtk3.actionable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.actionable_iface_proxy;
public import gid.core.utils;
public import gid.glib2.variant;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

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
    [gid.gtk4.widget.Widget.insertActionGroup] will be consulted as well.
*/
template ActionableT()
{

  /** */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /** */
  @property void actionName(string propval) nothrow
  {
    setActionName(propval);
  }

  /** */
  @property gid.glib2.variant.Variant actionTarget() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.glib2.variant.Variant)("action-target");
  }

  /** */
  @property void actionTarget(gid.glib2.variant.Variant propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.glib2.variant.Variant)("action-target", propval);
  }

  /**
      Gets the action name for actionable.
      
      See [gid.gtk4.actionable.Actionable.setActionName] for more information.
      Returns: the action name, or null if none is set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetActionName()
  {
    auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.actionable.Actionable._getGType);
    if (!_klass || !_klass.getActionName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getActionName(cast(GtkActionable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the current target value of actionable.
      
      See [gid.gtk4.actionable.Actionable.setActionTargetValue] for more information.
      Returns: the current target value
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionTargetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncGetActionTargetValue()
  {
    auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.actionable.Actionable._getGType);
    if (!_klass || !_klass.getActionTargetValue)
      return typeof(return).init;

    GVariant* _cretval;
    _cretval = _klass.getActionTargetValue(cast(GtkActionable*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetActionName`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetActionName(string actionName = null)
  {
    auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.actionable.Actionable._getGType);
    if (!_klass || !_klass.setActionName)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, Yes.Nullable);
    _klass.setActionName(cast(GtkActionable*)this._cPtr, _actionName);
  }

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetActionTargetValue`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetActionTargetValue(gid.glib2.variant.Variant targetValue = null)
  {
    auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.actionable.Actionable._getGType);
    if (!_klass || !_klass.setActionTargetValue)
      return;

    _klass.setActionTargetValue(cast(GtkActionable*)this._cPtr, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
  }

  /**
      Gets the action name for actionable.
      
      See [gid.gtk4.actionable.Actionable.setActionName] for more information.
      Returns: the action name, or null if none is set
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
      
      See [gid.gtk4.actionable.Actionable.setActionTargetValue] for more information.
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
  override void setActionName(string actionName = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, Yes.Nullable);
    gtk_actionable_set_action_name(cast(GtkActionable*)this._cPtr, _actionName);
  }

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
  override void setActionTargetValue(gid.glib2.variant.Variant targetValue = null) nothrow
  {
    gtk_actionable_set_action_target_value(cast(GtkActionable*)this._cPtr, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the action-name and associated string target value of an
      actionable widget.
      
      detailed_action_name is a string in the format accepted by
      [gid.gio2.action.Action.parseDetailedName].
      
      (Note that prior to version 3.22.25,
      this function is only usable for actions with a simple "s" target, and
      detailed_action_name must be of the form `"action::target"` where
      `action` is the action name and `target` is the string to use
      as the target.)
  
      Params:
        detailedActionName = the detailed action name
  */
  override void setDetailedActionName(string detailedActionName) nothrow
  {
    const(char)* _detailedActionName = detailedActionName.toCString!(No.Malloc, No.Nullable);
    gtk_actionable_set_detailed_action_name(cast(GtkActionable*)this._cPtr, _detailedActionName);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.actionable.Actionable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_actionable_Actionable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionTargetValue", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetActionName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetActionTargetValue", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.actionable.Actionable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_actionable_Actionable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.actionable.Actionable.vfuncGetActionName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionTargetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_actionable_Actionable(iface, "get_action_target_value");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetActionName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_actionable_Actionable(iface, "set_action_name");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetActionTargetValue", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_actionable_Actionable(iface, "set_action_target_value");
  }

  private static void _installIfaceVfunc_gid_gtk3_actionable_Actionable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkActionableInterface*)iface;

    switch (vfunc)
    {
      case "get_action_target_value":
      {
        static extern(C) GVariant* _vfuncGetActionTargetValueTramp(GtkActionable* actionable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionable);
          if (!_obj)
          {
            auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionable), gid.gtk3.actionable.Actionable._getGType);
            if (_klass && _klass.getActionTargetValue)
              return (cast(typeof(&_vfuncGetActionTargetValueTramp))_klass.getActionTargetValue)(actionable);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncGetActionTargetValue();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.actionable.Actionable.vfuncGetActionTargetValue");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getActionTargetValue = cast(typeof(_klass.getActionTargetValue))&_vfuncGetActionTargetValueTramp;
        break;
      }
      case "set_action_name":
      {
        static extern(C) void _vfuncSetActionNameTramp(GtkActionable* actionable, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionable);
          if (!_obj)
          {
            auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionable), gid.gtk3.actionable.Actionable._getGType);
            if (_klass && _klass.setActionName)
              return (cast(typeof(&_vfuncSetActionNameTramp))_klass.setActionName)(actionable, actionName);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetActionName(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.actionable.Actionable.vfuncSetActionName");
          }
        }

        _klass.setActionName = cast(typeof(_klass.setActionName))&_vfuncSetActionNameTramp;
        break;
      }
      case "set_action_target_value":
      {
        static extern(C) void _vfuncSetActionTargetValueTramp(GtkActionable* actionable, GVariant* targetValue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionable);
          if (!_obj)
          {
            auto _klass = cast(GtkActionableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionable), gid.gtk3.actionable.Actionable._getGType);
            if (_klass && _klass.setActionTargetValue)
              return (cast(typeof(&_vfuncSetActionTargetValueTramp))_klass.setActionTargetValue)(actionable, targetValue);
            return;
          }

          try
          {
            _obj.vfuncSetActionTargetValue(targetValue ? new gid.glib2.variant.Variant(cast(void*)targetValue, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.actionable.Actionable.vfuncSetActionTargetValue");
          }
        }

        _klass.setActionTargetValue = cast(typeof(_klass.setActionTargetValue))&_vfuncSetActionTargetValueTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.actionable.Actionable]
template ActionableGidBuilderT()
{

  /** */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /** */
  T actionTarget(gid.glib2.variant.Variant propval) nothrow
  {
    return setProperty("action-target", propval);
  }
}
