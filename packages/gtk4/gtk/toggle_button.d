/// Module for [ToggleButton] class
module gtk.toggle_button;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;

/**
    A [gtk.toggle_button.ToggleButton] is a button which remains “pressed-in” when
    clicked.
    
    Clicking again will cause the toggle button to return to its normal state.
    
    A toggle button is created by calling either [gtk.toggle_button.ToggleButton.new_] or
    [gtk.toggle_button.ToggleButton.newWithLabel]. If using the former, it is advisable
    to pack a widget, (such as a [gtk.label.Label] and/or a [gtk.image.Image]), into the toggle
    button’s container. (See [gtk.button.Button] for more information).
    
    The state of a [gtk.toggle_button.ToggleButton] can be set specifically using
    [gtk.toggle_button.ToggleButton.setActive], and retrieved using
    [gtk.toggle_button.ToggleButton.getActive].
    
    To simply switch the state of a toggle button, use
    [gtk.toggle_button.ToggleButton.toggled].
    
    ## Grouping
    
    Toggle buttons can be grouped together, to form mutually exclusive
    groups - only one of the buttons can be toggled at a time, and toggling
    another one will switch the currently toggled one off.
    
    To add a [gtk.toggle_button.ToggleButton] to a group, use [gtk.toggle_button.ToggleButton.setGroup].
    
    ## CSS nodes
    
    [gtk.toggle_button.ToggleButton] has a single CSS node with name button. To differentiate
    it from a plain [gtk.button.Button], it gets the `.toggle` style class.
    
    ## Accessibility
    
    [gtk.toggle_button.ToggleButton] uses the [gtk.types.AccessibleRole.ToggleButton] role.
    
    ## Creating two [gtk.toggle_button.ToggleButton] widgets.
    
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
class ToggleButton : gtk.button.Button
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
    return cast(void function())gtk_toggle_button_get_type != &gidSymbolNotFound ? gtk_toggle_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleButton self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: If the toggle button should be pressed in.
  */
  @property bool active()
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = If the toggle button should be pressed in.
  */
  @property void active(bool propval)
  {
    return setActive(propval);
  }

  /**
      Set `group` property.
      Params:
        propval = The toggle button whose group this widget belongs to.
  */
  @property void group(gtk.toggle_button.ToggleButton propval)
  {
    return setGroup(propval);
  }

  /**
      Creates a new toggle button.
      
      A widget should be packed into the button, as in [gtk.button.Button.new_].
      Returns: a new toggle button.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_toggle_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new toggle button with a text label.
  
      Params:
        label = a string containing the message to be placed in the toggle button.
      Returns: a new toggle button.
  */
  static gtk.toggle_button.ToggleButton newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_toggle_button_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.toggle_button.ToggleButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.toggle_button.ToggleButton] containing a label.
      
      The label will be created using [gtk.label.Label.newWithMnemonic],
      so underscores in label indicate the mnemonic for the button.
  
      Params:
        label = the text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new [gtk.toggle_button.ToggleButton]
  */
  static gtk.toggle_button.ToggleButton newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_toggle_button_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.toggle_button.ToggleButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries a [gtk.toggle_button.ToggleButton] and returns its current state.
      
      Returns true if the toggle button is pressed in and false
      if it is raised.
      Returns: whether the button is pressed
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_button_get_active(cast(GtkToggleButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the status of the toggle button.
      
      Set to true if you want the [gtk.toggle_button.ToggleButton] to be “pressed in”,
      and false to raise it.
      
      If the status of the button changes, this action causes the
      [gtk.toggle_button.ToggleButton.toggled] signal to be emitted.
  
      Params:
        isActive = true or false.
  */
  void setActive(bool isActive)
  {
    gtk_toggle_button_set_active(cast(GtkToggleButton*)this._cPtr, isActive);
  }

  /**
      Adds self to the group of group.
      
      In a group of multiple toggle buttons, only one button can be active
      at a time.
      
      Setting up groups in a cycle leads to undefined behavior.
      
      Note that the same effect can be achieved via the [gtk.actionable.Actionable]
      API, by using the same action with parameter type and state type 's'
      for all buttons in the group, and giving each button its own target
      value.
  
      Params:
        group = another [gtk.toggle_button.ToggleButton] to
            form a group with
  */
  void setGroup(gtk.toggle_button.ToggleButton group = null)
  {
    gtk_toggle_button_set_group(cast(GtkToggleButton*)this._cPtr, group ? cast(GtkToggleButton*)group._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::toggled signal on the [gtk.toggle_button.ToggleButton].
  
      Deprecated: There is no good reason for an application ever to call this function.
  */
  void toggled()
  {
    gtk_toggle_button_toggled(cast(GtkToggleButton*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      Emitted whenever the [gtk.toggle_button.ToggleButton]'s state is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.toggle_button.ToggleButton toggleButton))
  
          `toggleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.toggle_button.ToggleButton)))
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
