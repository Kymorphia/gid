/// Module for [ToggleAction] class
module gid.gtk3.toggle_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.action;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    A #GtkToggleAction corresponds roughly to a #GtkCheckMenuItem. It has an
    “active” state specifying whether the action has been checked or not.
*/
@gidGir("ToggleAction", "ToggleActionClass")
class ToggleAction : gid.gtk3.action.Action
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
    return cast(void function())gtk_toggle_action_get_type != &gidSymbolNotFound ? gtk_toggle_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToggleAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.toggle_action.ToggleAction]
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
      call [gid.gtk3.action_group.ActionGroup.addActionWithAccel].
  
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkToggleAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_toggle_action_new(_name, _label, _tooltip, _stockId);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Emits the “toggled” signal on the toggle action.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggled` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncToggled()
  {
    auto _klass = cast(GtkToggleActionClass*)_vfuncClass;
    if (!_klass.toggled)
      return;

    _klass.toggled(cast(GtkToggleAction*)this._cPtr);
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
  
          `void callback(gid.gtk3.toggle_action.ToggleAction toggleAction)`
  
          `toggleAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.toggle_action.ToggleAction)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toggle_action.ToggleAction.toggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ToggleAction
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.toggle_action.ToggleAction), T.stringof ~ " is not derived from gid.gtk3.toggle_action.ToggleAction");

    gid.gtk3.action.Action._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggled", true)[0]) == gid.gtk3.toggle_action.ToggleAction))
      _installVfunc(klass, "toggled");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkToggleActionClass*)klass;

    switch (vfunc)
    {
      case "toggled":
      {
        static extern(C) void _vfuncToggledTramp(GtkToggleAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.toggle_action.ToggleAction)(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkToggleActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.toggled)
              return (cast(typeof(&_vfuncToggledTramp))_klass.toggled)(action);
            return;
          }

          try
          {
            _obj.vfuncToggled();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toggle_action.ToggleAction.vfuncToggled");
          }
        }

        _klass.toggled = cast(typeof(_klass.toggled))&_vfuncToggledTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.toggle_action.ToggleAction]
class ToggleActionGidBuilderImpl(T) : gid.gtk3.action.ActionGidBuilderImpl!T
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

/// Fluent builder for [gid.gtk3.toggle_action.ToggleAction]
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
