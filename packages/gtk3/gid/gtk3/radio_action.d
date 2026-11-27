/// Module for [RadioAction] class
module gid.gtk3.radio_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.toggle_action;
import gid.gtk3.types;

/**
    A #GtkRadioAction is similar to #GtkRadioMenuItem. A number of radio
    actions can be linked together so that only one may be active at any
    one time.
*/
@gidGir("RadioAction", "RadioActionClass")
class RadioAction : gid.gtk3.toggle_action.ToggleAction
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_radio_action_get_type != &gidSymbolNotFound ? gtk_radio_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_action.RadioAction]
      Returns: New builder object
  */
  static RadioActionGidBuilder builder() nothrow
  {
    return new RadioActionGidBuilder;
  }

  /**
      Get `currentValue` property.
      Returns: The value property of the currently active member of the group to which
        this action belongs.
  */
  @property int currentValue() nothrow
  {
    return getCurrentValue();
  }

  /**
      Set `currentValue` property.
      Params:
        propval = The value property of the currently active member of the group to which
          this action belongs.
  */
  @property void currentValue(int propval) nothrow
  {
    setCurrentValue(propval);
  }

  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio action.
  */
  @property void group(gid.gtk3.radio_action.RadioAction propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.radio_action.RadioAction)("group", propval);
  }

  /**
      Get `value` property.
      Returns: The value is an arbitrary integer which can be used as a
        convenient way to determine which action in the group is
        currently active in an ::activate or ::changed signal handler.
        See [gid.gtk3.radio_action.RadioAction.getCurrentValue] and #GtkRadioActionEntry
        for convenient ways to get and set this property.
  */
  @property int value() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("value");
  }

  /**
      Set `value` property.
      Params:
        propval = The value is an arbitrary integer which can be used as a
          convenient way to determine which action in the group is
          currently active in an ::activate or ::changed signal handler.
          See [gid.gtk3.radio_action.RadioAction.getCurrentValue] and #GtkRadioActionEntry
          for convenient ways to get and set this property.
  */
  @property void value(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("value", propval);
  }

  /**
      Creates a new #GtkRadioAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gid.gtk3.action_group.ActionGroup.addActionWithAccel].
  
      Params:
        name = A unique name for the action
        label = The label displayed in menu items and on buttons,
            or null
        tooltip = A tooltip for this action, or null
        stockId = The stock icon to display in widgets representing
            this action, or null
        value = The value which [gid.gtk3.radio_action.RadioAction.getCurrentValue] should
            return if this action is selected.
      Returns: a new #GtkRadioAction
  */
  this(string name, string label, string tooltip, string stockId, int value) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkRadioAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_radio_action_new(_name, _label, _tooltip, _stockId, value);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncChanged(gid.gtk3.radio_action.RadioAction current)
  {
    auto _klass = cast(GtkRadioActionClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkRadioAction*)this._cPtr, current ? cast(GtkRadioAction*)current._cPtr(No.Dup) : null);
  }

  /**
      Obtains the value property of the currently active member of
      the group to which action belongs.
      Returns: The value of the currently active group member
  */
  int getCurrentValue() nothrow
  {
    int _retval;
    _retval = gtk_radio_action_get_current_value(cast(GtkRadioAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns the list representing the radio group for this object.
      Note that the returned list is only valid until the next change
      to the group.
      
      A common way to set up a group of radio group is the following:
      ```c
        GSList *group = NULL;
        GtkRadioAction *action;
       
        while ( ...more actions to add... /)
          {
             action = gtk_radio_action_new (...);
             
             gtk_radio_action_set_group (action, group);
             group = gtk_radio_action_get_group (action);
          }
      ```
      Returns: the list representing the radio group for this object
  */
  gid.gtk3.radio_action.RadioAction[] getGroup() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_radio_action_get_group(cast(GtkRadioAction*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.radio_action.RadioAction, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Joins a radio action object to the group of another radio action object.
      
      Use this in language bindings instead of the [gid.gtk3.radio_action.RadioAction.getGroup]
      and [gid.gtk3.radio_action.RadioAction.setGroup] methods
      
      A common way to set up a group of radio actions is the following:
      ```c
        GtkRadioAction *action;
        GtkRadioAction *last_action;
       
        while ( ...more actions to add... /)
          {
             action = gtk_radio_action_new (...);
             
             gtk_radio_action_join_group (action, last_action);
             last_action = action;
          }
      ```
  
      Params:
        groupSource = a radio action object whos group we are
            joining, or null to remove the radio action from its group
  */
  void joinGroup(gid.gtk3.radio_action.RadioAction groupSource = null) nothrow
  {
    gtk_radio_action_join_group(cast(GtkRadioAction*)this._cPtr, groupSource ? cast(GtkRadioAction*)groupSource._cPtr(No.Dup) : null);
  }

  /**
      Sets the currently active group member to the member with value
      property current_value.
  
      Params:
        currentValue = the new value
  */
  void setCurrentValue(int currentValue) nothrow
  {
    gtk_radio_action_set_current_value(cast(GtkRadioAction*)this._cPtr, currentValue);
  }

  /**
      Sets the radio group for the radio action object.
  
      Params:
        group = a list representing a radio group, or null
  */
  void setGroup(gid.gtk3.radio_action.RadioAction[] group = null) nothrow
  {
    auto _group = gSListFromD!(gid.gtk3.radio_action.RadioAction)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_action.RadioAction, GidOwnership.None)(_group);
    gtk_radio_action_set_group(cast(GtkRadioAction*)this._cPtr, _group);
  }

  /**
      Connect to `Changed` signal.
  
      The ::changed signal is emitted on every member of a radio group when the
        active member is changed. The signal gets emitted after the ::activate signals
        for the previous and current active members.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.radio_action.RadioAction current, gid.gtk3.radio_action.RadioAction radioAction)`
  
          `current` the member of action's group which has just been activated (optional)
  
          `radioAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.radio_action.RadioAction)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.radio_action.RadioAction)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_action.RadioAction.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RadioAction
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.radio_action.RadioAction), T.stringof ~ " is not derived from gid.gtk3.radio_action.RadioAction");

    gid.gtk3.toggle_action.ToggleAction._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.radio_action.RadioAction))
      _installVfunc(klass, "changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRadioActionClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkRadioAction* action, GtkRadioAction* current) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.radio_action.RadioAction)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkRadioActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(action, current);
            return;
          }

          try
          {
            _obj.vfuncChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_action.RadioAction)(cast(void*)current, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_action.RadioAction.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_action.RadioAction]
class RadioActionGidBuilderImpl(T) : gid.gtk3.toggle_action.ToggleActionGidBuilderImpl!T
{


  /**
      Set `currentValue` property.
      Params:
        propval = The value property of the currently active member of the group to which
          this action belongs.
      Returns: Builder instance for fluent chaining
  */
  T currentValue(int propval) nothrow
  {
    return setProperty("current-value", propval);
  }

  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio action.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk3.radio_action.RadioAction propval) nothrow
  {
    return setProperty("group", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = The value is an arbitrary integer which can be used as a
          convenient way to determine which action in the group is
          currently active in an ::activate or ::changed signal handler.
          See [gid.gtk3.radio_action.RadioAction.getCurrentValue] and #GtkRadioActionEntry
          for convenient ways to get and set this property.
      Returns: Builder instance for fluent chaining
  */
  T value(int propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk3.radio_action.RadioAction]
final class RadioActionGidBuilder : RadioActionGidBuilderImpl!RadioActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioAction build() nothrow
  {
    return new RadioAction(cast(void*)createGObject(RadioAction._getGType), Yes.Take);
  }
}
