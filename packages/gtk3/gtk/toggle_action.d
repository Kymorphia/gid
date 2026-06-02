/// Module for [ToggleAction] class
module gtk.toggle_action;

public import gid.basictypes;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toggle_action_get_type != &gidSymbolNotFound ? gtk_toggle_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.toggle_action.ToggleAction]
      Returns: New builder object
  */
  static ToggleActionGidBuilder builder() nothrow
  {
    return new ToggleActionGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the toggle action should be active.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the toggle action should be active.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `drawAsRadio` property.
      Returns: Whether the proxies for this action look like radio action proxies.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  */
  @property bool drawAsRadio() nothrow
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
  @property void drawAsRadio(bool propval) nothrow
  {
    setDrawAsRadio(propval);
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
  this(string name, string label = null, string tooltip = null, string stockId = null) nothrow
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
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_action_get_active(cast(GtkToggleAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the action should have proxies like a radio action.
      Returns: whether the action should have proxies like a radio action.
  */
  bool getDrawAsRadio() nothrow
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
  void setActive(bool isActive) nothrow
  {
    gtk_toggle_action_set_active(cast(GtkToggleAction*)this._cPtr, isActive);
  }

  /**
      Sets whether the action should have proxies like a radio action.
  
      Params:
        drawAsRadio = whether the action should have proxies like a radio
             action
  */
  void setDrawAsRadio(bool drawAsRadio) nothrow
  {
    gtk_toggle_action_set_draw_as_radio(cast(GtkToggleAction*)this._cPtr, drawAsRadio);
  }

  /**
      Emits the “toggled” signal on the toggle action.
  */
  void toggled() nothrow
  {
    gtk_toggle_action_toggled(cast(GtkToggleAction*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      Should be connected if you wish to perform an action
        whenever the #GtkToggleAction state is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.toggle_action.ToggleAction toggleAction)`
  
          `toggleAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.toggle_action.ToggleAction)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.toggle_action.ToggleAction.toggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.toggle_action.ToggleAction]
class ToggleActionGidBuilderImpl(T) : gtk.action.ActionGidBuilderImpl!T
{


  /**
      Set `active` property.
      Params:
        propval = Whether the toggle action should be active.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `drawAsRadio` property.
      Params:
        propval = Whether the proxies for this action look like radio action proxies.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
      Returns: Builder instance for fluent chaining
  */
  T drawAsRadio(bool propval) nothrow
  {
    return setProperty("draw-as-radio", propval);
  }
}

/// Fluent builder for [gtk.toggle_action.ToggleAction]
final class ToggleActionGidBuilder : ToggleActionGidBuilderImpl!ToggleActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleAction build() nothrow
  {
    return new ToggleAction(cast(void*)createGObject(ToggleAction._getGType), Yes.Take);
  }
}
