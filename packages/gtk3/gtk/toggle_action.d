/// Module for [ToggleAction] class
module gtk.toggle_action;

import gid.gid;
import gobject.dclosure;
import gtk.action;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkToggleAction corresponds roughly to a #GtkCheckMenuItem. It has an
    “active” state specifying whether the action has been checked or not.
*/
class ToggleAction : gtk.action.Action
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toggle_action_get_type != &gidSymbolNotFound ? gtk_toggle_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleAction self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: Whether the toggle action should be active.
  */
  @property bool active()
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the toggle action should be active.
  */
  @property void active(bool propval)
  {
    return setActive(propval);
  }

  /**
      Get `drawAsRadio` property.
      Returns: Whether the proxies for this action look like radio action proxies.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  */
  @property bool drawAsRadio()
  {
    return getDrawAsRadio();
  }

  /**
      Set `drawAsRadio` property.
      Params:
        propval = Whether the proxies for this action look like radio action proxies.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  */
  @property void drawAsRadio(bool propval)
  {
    return setDrawAsRadio(propval);
  }

  /**
      Creates a new #GtkToggleAction object. To add the action to
      a #GtkActionGroup and set the accelerator for the action,
      call [gtk.action_group.ActionGroup.addActionWithAccel].
  
      Params:
        name = A unique name for the action
        label = The label displayed in menu items and on buttons,
                  or null
        tooltip = A tooltip for the action, or null
        stockId = The stock icon to display in widgets representing
                     the action, or null
      Returns: a new #GtkToggleAction
  */
  this(string name, string label = null, string tooltip = null, string stockId = null)
  {
    GtkToggleAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_toggle_action_new(_name, _label, _tooltip, _stockId);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the checked state of the toggle action.
      Returns: the checked state of the toggle action
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_action_get_active(cast(GtkToggleAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the action should have proxies like a radio action.
      Returns: whether the action should have proxies like a radio action.
  */
  bool getDrawAsRadio()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_action_get_draw_as_radio(cast(GtkToggleAction*)this._cPtr);
    return _retval;
  }

  /**
      Sets the checked state on the toggle action.
  
      Params:
        isActive = whether the action should be checked or not
  */
  void setActive(bool isActive)
  {
    gtk_toggle_action_set_active(cast(GtkToggleAction*)this._cPtr, isActive);
  }

  /**
      Sets whether the action should have proxies like a radio action.
  
      Params:
        drawAsRadio = whether the action should have proxies like a radio
             action
  */
  void setDrawAsRadio(bool drawAsRadio)
  {
    gtk_toggle_action_set_draw_as_radio(cast(GtkToggleAction*)this._cPtr, drawAsRadio);
  }

  /**
      Emits the “toggled” signal on the toggle action.
  */
  void toggled()
  {
    gtk_toggle_action_toggled(cast(GtkToggleAction*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      Should be connected if you wish to perform an action
        whenever the #GtkToggleAction state is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.toggle_action.ToggleAction toggleAction))
  
          `toggleAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.toggle_action.ToggleAction)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}
