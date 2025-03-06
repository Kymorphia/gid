module gtk.check_button;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.check_button.CheckButton] places a label next to an indicator.
  
  ![Example GtkCheckButtons](check-button.png)
  
  A [gtk.check_button.CheckButton] is created by calling either [gtk.check_button.CheckButton.new_]
  or [gtk.check_button.CheckButton.newWithLabel].
  
  The state of a [gtk.check_button.CheckButton] can be set specifically using
  [gtk.check_button.CheckButton.setActive], and retrieved using
  [gtk.check_button.CheckButton.getActive].
  
  # Inconsistent state
  
  In addition to "on" and "off", check buttons can be an
  "in between" state that is neither on nor off. This can be used
  e.g. when the user has selected a range of elements (such as some
  text or spreadsheet cells) that are affected by a check button,
  and the current values in that range are inconsistent.
  
  To set a [gtk.check_button.CheckButton] to inconsistent state, use
  [gtk.check_button.CheckButton.setInconsistent].
  
  # Grouping
  
  Check buttons can be grouped together, to form mutually exclusive
  groups - only one of the buttons can be toggled at a time, and toggling
  another one will switch the currently toggled one off.
  
  Grouped check buttons use a different indicator, and are commonly referred
  to as *radio buttons*.
  
  ![Example GtkCheckButtons](radio-button.png)
  
  To add a [gtk.check_button.CheckButton] to a group, use [gtk.check_button.CheckButton.setGroup].
  
  When the code must keep track of the state of a group of radio buttons, it
  is recommended to keep track of such state through a stateful
  [gio.action.Action] with a target for each button. Using the `toggled` signals to keep
  track of the group changes and state is discouraged.
  
  # CSS nodes
  
  ```
  checkbutton[.text-button]
  ├── check
  ╰── [label]
  ```
  
  A [gtk.check_button.CheckButton] has a main node with name checkbutton. If the
  [gtk.check_button.CheckButton.utf8] or [gtk.check_button.CheckButton.Widget]
  properties are set, it contains a child widget. The indicator node
  is named check when no group is set, and radio if the checkbutton
  is grouped together with other checkbuttons.
  
  # Accessibility
  
  [gtk.check_button.CheckButton] uses the [gtk.types.AccessibleRole.Checkbox] role.
*/
class CheckButton : gtk.widget.Widget, gtk.actionable.Actionable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_check_button_get_type != &gidSymbolNotFound ? gtk_check_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ActionableT!();

  /**
      Creates a new [gtk.check_button.CheckButton].
    Returns:     a new [gtk.check_button.CheckButton]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.check_button.CheckButton] with the given text.
    Params:
      label =       the text for the check button.
    Returns:     a new [gtk.check_button.CheckButton]
  */
  static gtk.check_button.CheckButton newWithLabel(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_button_new_with_label(_label);
    auto _retval = ObjectG.getDObject!(gtk.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.check_button.CheckButton] with the given text and a mnemonic.
    Params:
      label =       The text of the button, with an underscore
          in front of the mnemonic character
    Returns:     a new [gtk.check_button.CheckButton]
  */
  static gtk.check_button.CheckButton newWithMnemonic(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_button_new_with_mnemonic(_label);
    auto _retval = ObjectG.getDObject!(gtk.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the check button is active.
    Returns:     whether the check button is active
  */
  bool getActive()
  {
    bool _retval;
    _retval = gtk_check_button_get_active(cast(GtkCheckButton*)cPtr);
    return _retval;
  }

  /**
      Gets the child widget of button or `NULL` if `propertyCheckButton:label` is set.
    Returns:     the child widget of button
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_button_get_child(cast(GtkCheckButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the check button is in an inconsistent state.
    Returns:     true if check_button is currently in an inconsistent state
  */
  bool getInconsistent()
  {
    bool _retval;
    _retval = gtk_check_button_get_inconsistent(cast(GtkCheckButton*)cPtr);
    return _retval;
  }

  /**
      Returns the label of the check button or `NULL` if `propertyCheckButton:child` is set.
    Returns:     The label self shows next
        to the indicator. If no label is shown, null will be returned.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_check_button_get_label(cast(GtkCheckButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether underlines in the label indicate mnemonics.
    Returns:     The value of the `propertyGtk.CheckButton:use-underline` property.
        See [gtk.check_button.CheckButton.setUseUnderline] for details on how to set
        a new value.
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = gtk_check_button_get_use_underline(cast(GtkCheckButton*)cPtr);
    return _retval;
  }

  /**
      Changes the check buttons active state.
    Params:
      setting =       the new value to set
  */
  void setActive(bool setting)
  {
    gtk_check_button_set_active(cast(GtkCheckButton*)cPtr, setting);
  }

  /**
      Sets the child widget of button.
    
    Note that by using this API, you take full responsibility for setting
    up the proper accessibility label and description information for button.
    Most likely, you'll either set the accessibility label or description
    for button explicitly, or you'll set a labelled-by or described-by
    relations from child to button.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_check_button_set_child(cast(GtkCheckButton*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Adds self to the group of group.
    
    In a group of multiple check buttons, only one button can be active
    at a time. The behavior of a checkbutton in a group is also commonly
    known as a *radio button*.
    
    Setting the group of a check button also changes the css name of the
    indicator widget's CSS node to 'radio'.
    
    Setting up groups in a cycle leads to undefined behavior.
    
    Note that the same effect can be achieved via the [gtk.actionable.Actionable]
    API, by using the same action with parameter type and state type 's'
    for all buttons in the group, and giving each button its own target
    value.
    Params:
      group =       another [gtk.check_button.CheckButton] to
          form a group with
  */
  void setGroup(gtk.check_button.CheckButton group = null)
  {
    gtk_check_button_set_group(cast(GtkCheckButton*)cPtr, group ? cast(GtkCheckButton*)group.cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.check_button.CheckButton] to inconsistent state.
    
    You should turn off the inconsistent state again if the user checks
    the check button. This has to be done manually.
    Params:
      inconsistent =       true if state is inconsistent
  */
  void setInconsistent(bool inconsistent)
  {
    gtk_check_button_set_inconsistent(cast(GtkCheckButton*)cPtr, inconsistent);
  }

  /**
      Sets the text of self.
    
    If `propertyGtk.CheckButton:use-underline` is true, an underscore
    in label is interpreted as mnemonic indicator, see
    [gtk.check_button.CheckButton.setUseUnderline] for details on this behavior.
    Params:
      label =       The text shown next to the indicator, or null
          to show no text
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_check_button_set_label(cast(GtkCheckButton*)cPtr, _label);
  }

  /**
      Sets whether underlines in the label indicate mnemonics.
    
    If setting is true, an underscore character in self's label
    indicates a mnemonic accelerator key. This behavior is similar
    to `propertyGtk.Label:use-underline`.
    Params:
      setting =       the new value to set
  */
  void setUseUnderline(bool setting)
  {
    gtk_check_button_set_use_underline(cast(GtkCheckButton*)cPtr, setting);
  }

  /**
      Emitted to when the check button is activated.
    
    The `::activate` signal on [gtk.check_button.CheckButton] is an action signal and
    emitting it causes the button to animate press then release.
    
    Applications should never connect to this signal, but use the
    [gtk.check_button.CheckButton.toggled] signal.
    
    The default bindings for this signal are all forms of the
    <kbd>␣</kbd> and <kbd>Enter</kbd> keys.
  
    ## Parameters
    $(LIST
      * $(B checkButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.check_button.CheckButton checkButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.check_button.CheckButton checkButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto checkButton = getVal!(gtk.check_button.CheckButton)(_paramVals);
      _dClosure.dlg(checkButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the buttons's [gtk.check_button.CheckButton.gboolean]
    property changes.
  
    ## Parameters
    $(LIST
      * $(B checkButton) the instance the signal is connected to
    )
  */
  alias ToggledCallbackDlg = void delegate(gtk.check_button.CheckButton checkButton);

  /** ditto */
  alias ToggledCallbackFunc = void function(gtk.check_button.CheckButton checkButton);

  /**
    Connect to Toggled signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToggled(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggledCallbackDlg) || is(T : ToggledCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto checkButton = getVal!(gtk.check_button.CheckButton)(_paramVals);
      _dClosure.dlg(checkButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}
