/// Module for [ToggleButton] class
module gid.gtk4.toggle_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.button;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;

/**
    Shows a button which remains “pressed-in” when clicked.
    
    <picture>
      <source srcset="toggle-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Example GtkToggleButtons" src="toggle-button.png">
    </picture>
    
    Clicking again will cause the toggle button to return to its normal state.
    
    A toggle button is created by calling either [gid.gtk4.toggle_button.ToggleButton.new_] or
    [gid.gtk4.toggle_button.ToggleButton.newWithLabel]. If using the former, it is advisable
    to pack a widget, (such as a [gid.gtk4.label.Label] and/or a [gid.gtk4.image.Image]), into the toggle
    button’s container. (See [gid.gtk4.button.Button] for more information).
    
    The state of a [gid.gtk4.toggle_button.ToggleButton] can be set specifically using
    [gid.gtk4.toggle_button.ToggleButton.setActive], and retrieved using
    [gid.gtk4.toggle_button.ToggleButton.getActive].
    
    ## Grouping
    
    Toggle buttons can be grouped together, to form mutually exclusive
    groups - only one of the buttons can be toggled at a time, and toggling
    another one will switch the currently toggled one off.
    
    To add a [gid.gtk4.toggle_button.ToggleButton] to a group, use [gid.gtk4.toggle_button.ToggleButton.setGroup].
    
    ## CSS nodes
    
    [gid.gtk4.toggle_button.ToggleButton] has a single CSS node with name button. To differentiate
    it from a plain [gid.gtk4.button.Button], it gets the `.toggle` style class.
    
    ## Accessibility
    
    [gid.gtk4.toggle_button.ToggleButton] uses the [gid.gtk4.types.AccessibleRole.ToggleButton] role.
    
    ## Creating two [gid.gtk4.toggle_button.ToggleButton] widgets.
    
    ```c
    static void
    output_state (GtkToggleButton *source,
                  gpointer         user_data)
    {
      g_print ("Toggle button "%s" is active: %s",
               gtk_button_get_label (GTK_BUTTON (source)),
               gtk_toggle_button_get_active (source) ? "Yes" : "No");
    }
    
    static void
    make_toggles (void)
    {
      GtkWidget *window, *toggle1, *toggle2;
      GtkWidget *box;
      const char *text;
    
      window = gtk_window_new ();
      box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
    
      text = "Hi, I’m toggle button one";
      toggle1 = gtk_toggle_button_new_with_label (text);
    
      g_signal_connect (toggle1, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle1);
    
      text = "Hi, I’m toggle button two";
      toggle2 = gtk_toggle_button_new_with_label (text);
      g_signal_connect (toggle2, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle2);
    
      gtk_window_set_child (GTK_WINDOW (window), box);
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
*/
class ToggleButton : gid.gtk4.button.Button
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_toggle_button_get_type != &gidSymbolNotFound ? gtk_toggle_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToggleButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.toggle_button.ToggleButton]
      Returns: New builder object
  */
  static ToggleButtonGidBuilder builder() nothrow
  {
    return new ToggleButtonGidBuilder;
  }

  /**
      Get `active` property.
      Returns: If the toggle button should be pressed in.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = If the toggle button should be pressed in.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Set `group` property.
      Params:
        propval = The toggle button whose group this widget belongs to.
  */
  @property void group(gid.gtk4.toggle_button.ToggleButton propval) nothrow
  {
    setGroup(propval);
  }

  /**
      Creates a new toggle button.
      
      A widget should be packed into the button, as in [gid.gtk4.button.Button.new_].
      Returns: a new toggle button.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_toggle_button_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new toggle button with a text label.
  
      Params:
        label = a string containing the message to be placed in the toggle button.
      Returns: a new toggle button.
  */
  static gid.gtk4.toggle_button.ToggleButton newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_toggle_button_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.toggle_button.ToggleButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.toggle_button.ToggleButton] containing a label.
      
      The label will be created using [gid.gtk4.label.Label.newWithMnemonic],
      so underscores in label indicate the mnemonic for the button.
  
      Params:
        label = the text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new [gid.gtk4.toggle_button.ToggleButton]
  */
  static gid.gtk4.toggle_button.ToggleButton newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_toggle_button_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.toggle_button.ToggleButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the ::toggled signal on the [gid.gtk4.toggle_button.ToggleButton].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggled` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: There is no good reason for an application ever to call this function.
  */
  protected void vfuncToggled()
  {
    auto _klass = cast(GtkToggleButtonClass*)_vfuncClass;
    if (!_klass.toggled)
      return;

    _klass.toggled(cast(GtkToggleButton*)this._cPtr);
  }

  /**
      Queries a [gid.gtk4.toggle_button.ToggleButton] and returns its current state.
      
      Returns true if the toggle button is pressed in and false
      if it is raised.
      Returns: whether the button is pressed
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_button_get_active(cast(GtkToggleButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the status of the toggle button.
      
      Set to true if you want the [gid.gtk4.toggle_button.ToggleButton] to be “pressed in”,
      and false to raise it.
      
      If the status of the button changes, this action causes the
      [gid.gtk4.toggle_button.ToggleButton.toggled] signal to be emitted.
  
      Params:
        isActive = true or false.
  */
  void setActive(bool isActive) nothrow
  {
    gtk_toggle_button_set_active(cast(GtkToggleButton*)this._cPtr, isActive);
  }

  /**
      Adds self to the group of group.
      
      In a group of multiple toggle buttons, only one button can be active
      at a time.
      
      Setting up groups in a cycle leads to undefined behavior.
      
      Note that the same effect can be achieved via the [gid.gtk4.actionable.Actionable]
      API, by using the same action with parameter type and state type 's'
      for all buttons in the group, and giving each button its own target
      value.
  
      Params:
        group = another [gid.gtk4.toggle_button.ToggleButton] to
            form a group with
  */
  void setGroup(gid.gtk4.toggle_button.ToggleButton group = null) nothrow
  {
    gtk_toggle_button_set_group(cast(GtkToggleButton*)this._cPtr, group ? cast(GtkToggleButton*)group._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::toggled signal on the [gid.gtk4.toggle_button.ToggleButton].
  
      Deprecated: There is no good reason for an application ever to call this function.
  */
  void toggled() nothrow
  {
    gtk_toggle_button_toggled(cast(GtkToggleButton*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      Emitted whenever the [gid.gtk4.toggle_button.ToggleButton]'s state is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.toggle_button.ToggleButton toggleButton)`
  
          `toggleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.toggle_button.ToggleButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.toggle_button.ToggleButton.toggled");
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
        T = D class derived from ToggleButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.toggle_button.ToggleButton), T.stringof ~ " is not derived from gid.gtk4.toggle_button.ToggleButton");

    gid.gtk4.button.Button._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggled", true)[0]) == gid.gtk4.toggle_button.ToggleButton))
      _installVfunc(klass, "toggled");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkToggleButtonClass*)klass;

    switch (vfunc)
    {
      case "toggled":
      {
        static extern(C) void _vfuncToggledTramp(GtkToggleButton* toggleButton) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.toggle_button.ToggleButton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)toggleButton);
          if (!_obj)
          {
            auto _klass = cast(GtkToggleButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)toggleButton);
            if (_klass.toggled)
              return (cast(typeof(&_vfuncToggledTramp))_klass.toggled)(toggleButton);
            return;
          }

          try
          {
            _obj.vfuncToggled();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.toggle_button.ToggleButton.vfuncToggled");
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

/// Fluent builder implementation template for [gid.gtk4.toggle_button.ToggleButton]
class ToggleButtonGidBuilderImpl(T) : gid.gtk4.button.ButtonGidBuilderImpl!T
{


  /**
      Set `active` property.
      Params:
        propval = If the toggle button should be pressed in.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `group` property.
      Params:
        propval = The toggle button whose group this widget belongs to.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk4.toggle_button.ToggleButton propval) nothrow
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gid.gtk4.toggle_button.ToggleButton]
final class ToggleButtonGidBuilder : ToggleButtonGidBuilderImpl!ToggleButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleButton build() nothrow
  {
    return new ToggleButton(cast(void*)createGObject(ToggleButton._getGType), Yes.Take);
  }
}
