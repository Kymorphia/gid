/// Module for [ToggleButton] class
module gtk.toggle_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkToggleButton is a #GtkButton which will remain “pressed-in” when
    clicked. Clicking again will cause the toggle button to return to its
    normal state.
    
    A toggle button is created by calling either [gtk.toggle_button.ToggleButton.new_] or
    [gtk.toggle_button.ToggleButton.newWithLabel]. If using the former, it is advisable to
    pack a widget, (such as a #GtkLabel and/or a #GtkImage), into the toggle
    button’s container. (See #GtkButton for more information).
    
    The state of a #GtkToggleButton can be set specifically using
    [gtk.toggle_button.ToggleButton.setActive], and retrieved using
    [gtk.toggle_button.ToggleButton.getActive].
    
    To simply switch the state of a toggle button, use [gtk.toggle_button.ToggleButton.toggled].
    
    # CSS nodes
    
    GtkToggleButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .toggle style class.
    
    ## Creating two #GtkToggleButton widgets.
    
    ```c
    static void output_state (GtkToggleButton *source, gpointer user_data) {
      printf ("Active: %d\n", gtk_toggle_button_get_active (source));
    }
    
    void make_toggles (void) {
      GtkWidget *window, *toggle1, *toggle2;
      GtkWidget *box;
      const char *text;
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
    
      text = "Hi, I’m a toggle button.";
      toggle1 = gtk_toggle_button_new_with_label (text);
    
      // Makes this toggle button invisible
      gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle1),
                                  TRUE);
    
      g_signal_connect (toggle1, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_container_add (GTK_CONTAINER (box), toggle1);
    
      text = "Hi, I’m a toggle button.";
      toggle2 = gtk_toggle_button_new_with_label (text);
      gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle2),
                                  FALSE);
      g_signal_connect (toggle2, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_container_add (GTK_CONTAINER (box), toggle2);
    
      gtk_container_add (GTK_CONTAINER (window), box);
      gtk_widget_show_all (window);
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

  /** */
  @property bool active()
  {
    return getActive();
  }

  /** */
  @property void active(bool propval)
  {
    return setActive(propval);
  }

  /** */
  @property bool drawIndicator()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("draw-indicator");
  }

  /** */
  @property void drawIndicator(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("draw-indicator", propval);
  }

  /** */
  @property bool inconsistent()
  {
    return getInconsistent();
  }

  /** */
  @property void inconsistent(bool propval)
  {
    return setInconsistent(propval);
  }

  /**
      Creates a new toggle button. A widget should be packed into the button, as in [gtk.button.Button.new_].
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
      Creates a new #GtkToggleButton containing a label. The label
      will be created using [gtk.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the button.
  
      Params:
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkToggleButton
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
      Queries a #GtkToggleButton and returns its current state. Returns true if
      the toggle button is pressed in and false if it is raised.
      Returns: a #gboolean value.
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_button_get_active(cast(GtkToggleButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.toggle_button.ToggleButton.setInconsistent].
      Returns: true if the button is displayed as inconsistent, false otherwise
  */
  bool getInconsistent()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_button_get_inconsistent(cast(GtkToggleButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the button is displayed as a separate indicator
      and label. See [gtk.toggle_button.ToggleButton.setMode].
      Returns: true if the togglebutton is drawn as a separate indicator
          and label.
  */
  bool getMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_toggle_button_get_mode(cast(GtkToggleButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the status of the toggle button. Set to true if you want the
      GtkToggleButton to be “pressed in”, and false to raise it.
      This action causes the #GtkToggleButton::toggled signal and the
      #GtkButton::clicked signal to be emitted.
  
      Params:
        isActive = true or false.
  */
  void setActive(bool isActive)
  {
    gtk_toggle_button_set_active(cast(GtkToggleButton*)this._cPtr, isActive);
  }

  /**
      If the user has selected a range of elements (such as some text or
      spreadsheet cells) that are affected by a toggle button, and the
      current values in that range are inconsistent, you may want to
      display the toggle in an “in between” state. This function turns on
      “in between” display.  Normally you would turn off the inconsistent
      state again if the user toggles the toggle button. This has to be
      done manually, [gtk.toggle_button.ToggleButton.setInconsistent] only affects
      visual appearance, it doesn’t affect the semantics of the button.
  
      Params:
        setting = true if state is inconsistent
  */
  void setInconsistent(bool setting)
  {
    gtk_toggle_button_set_inconsistent(cast(GtkToggleButton*)this._cPtr, setting);
  }

  /**
      Sets whether the button is displayed as a separate indicator and label.
      You can call this function on a checkbutton or a radiobutton with
      draw_indicator = false to make the button look like a normal button.
      
      This can be used to create linked strip of buttons that work like
      a #GtkStackSwitcher.
      
      This function only affects instances of classes like #GtkCheckButton
      and #GtkRadioButton that derive from #GtkToggleButton,
      not instances of #GtkToggleButton itself.
  
      Params:
        drawIndicator = if true, draw the button as a separate indicator
          and label; if false, draw the button like a normal button
  */
  void setMode(bool drawIndicator)
  {
    gtk_toggle_button_set_mode(cast(GtkToggleButton*)this._cPtr, drawIndicator);
  }

  /**
      Emits the #GtkToggleButton::toggled signal on the
      #GtkToggleButton. There is no good reason for an
      application ever to call this function.
  */
  void toggled()
  {
    gtk_toggle_button_toggled(cast(GtkToggleButton*)this._cPtr);
  }

  /**
      Connect to `Toggled` signal.
  
      Should be connected if you wish to perform an action whenever the
      #GtkToggleButton's state is changed.
  
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
