/// Module for [CheckButton] class
module gid.gtk4.check_button;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Places a label next to an indicator.
    
    <picture>
      <source srcset="check-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Example GtkCheckButtons" src="check-button.png">
    </picture>
    
    A [gid.gtk4.check_button.CheckButton] is created by calling either [gid.gtk4.check_button.CheckButton.new_]
    or [gid.gtk4.check_button.CheckButton.newWithLabel].
    
    The state of a [gid.gtk4.check_button.CheckButton] can be set specifically using
    [gid.gtk4.check_button.CheckButton.setActive], and retrieved using
    [gid.gtk4.check_button.CheckButton.getActive].
    
    # Inconsistent state
    
    In addition to "on" and "off", check buttons can be an
    "in between" state that is neither on nor off. This can be used
    e.g. when the user has selected a range of elements (such as some
    text or spreadsheet cells) that are affected by a check button,
    and the current values in that range are inconsistent.
    
    To set a [gid.gtk4.check_button.CheckButton] to inconsistent state, use
    [gid.gtk4.check_button.CheckButton.setInconsistent].
    
    # Grouping
    
    Check buttons can be grouped together, to form mutually exclusive
    groups - only one of the buttons can be toggled at a time, and toggling
    another one will switch the currently toggled one off.
    
    Grouped check buttons use a different indicator, and are commonly referred
    to as *radio buttons*.
    
    <picture>
      <source srcset="radio-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Example GtkRadioButtons" src="radio-button.png">
    </picture>
    
    To add a [gid.gtk4.check_button.CheckButton] to a group, use [gid.gtk4.check_button.CheckButton.setGroup].
    
    When the code must keep track of the state of a group of radio buttons, it
    is recommended to keep track of such state through a stateful
    [gid.gio2.action.Action] with a target for each button. Using the `toggled` signals to keep
    track of the group changes and state is discouraged.
    
    # Shortcuts and Gestures
    
    [gid.gtk4.check_button.CheckButton] supports the following keyboard shortcuts:
    
    - <kbd>␣</kbd> or <kbd>Enter</kbd> activates the button.
    
    # CSS nodes
    
    ```
    checkbutton[.text-button][.grouped]
    ├── check
    ╰── [label]
    ```
    
    A [gid.gtk4.check_button.CheckButton] has a main node with name checkbutton. If the
    [gid.gtk4.check_button.CheckButton.label] or [gid.gtk4.check_button.CheckButton.child]
    properties are set, it contains a child widget. The indicator node
    is named check when no group is set, and radio if the checkbutton
    is grouped together with other checkbuttons.
    
    # Accessibility
    
    [gid.gtk4.check_button.CheckButton] uses the [gid.gtk4.types.AccessibleRole.Checkbox] role.
*/
class CheckButton : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())gtk_check_button_get_type != &gidSymbolNotFound ? gtk_check_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCheckButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.check_button.CheckButton]
      Returns: New builder object
  */
  static CheckButtonGidBuilder builder() nothrow
  {
    return new CheckButtonGidBuilder;
  }

  /**
      Get `active` property.
      Returns: If the check button is active.
        
        Setting `active` to true will add the `:checked:` state to both
        the check button and the indicator CSS node.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = If the check button is active.
          
          Setting `active` to true will add the `:checked:` state to both
          the check button and the indicator CSS node.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Set `group` property.
      Params:
        propval = The check button whose group this widget belongs to.
  */
  @property void group(gid.gtk4.check_button.CheckButton propval) nothrow
  {
    setGroup(propval);
  }

  /**
      Get `inconsistent` property.
      Returns: If the check button is in an “in between” state.
        
        The inconsistent state only affects visual appearance,
        not the semantics of the button.
  */
  @property bool inconsistent() nothrow
  {
    return getInconsistent();
  }

  /**
      Set `inconsistent` property.
      Params:
        propval = If the check button is in an “in between” state.
          
          The inconsistent state only affects visual appearance,
          not the semantics of the button.
  */
  @property void inconsistent(bool propval) nothrow
  {
    setInconsistent(propval);
  }

  /**
      Get `label` property.
      Returns: Text of the label inside the check button, if it contains a label widget.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the label inside the check button, if it contains a label widget.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: If set, an underline in the text indicates that the following
        character is to be used as mnemonic.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the text indicates that the following
          character is to be used as mnemonic.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gid.gtk4.check_button.CheckButton].
      Returns: a new [gid.gtk4.check_button.CheckButton]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gid.gtk4.check_button.CheckButton] with the given text.
  
      Params:
        label = the text for the check button.
      Returns: a new [gid.gtk4.check_button.CheckButton]
  */
  static gid.gtk4.check_button.CheckButton newWithLabel(string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_check_button_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.check_button.CheckButton] with the given text and a mnemonic.
  
      Params:
        label = The text of the button, with an underscore
            in front of the mnemonic character
      Returns: a new [gid.gtk4.check_button.CheckButton]
  */
  static gid.gtk4.check_button.CheckButton newWithMnemonic(string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_check_button_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the check button is active.
      Returns: whether the check button is active
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_button_get_active(cast(GtkCheckButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of button or `NULL` if [gid.gtk4.check_button.CheckButton.label] is set.
      Returns: the child widget of button
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_button_get_child(cast(GtkCheckButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the check button is in an inconsistent state.
      Returns: true if check_button is currently in an inconsistent state
  */
  bool getInconsistent() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_button_get_inconsistent(cast(GtkCheckButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns the label of the check button or `NULL` if [gid.gtk4.check_button.CheckButton.child] is set.
      Returns: The label self shows next
          to the indicator. If no label is shown, null will be returned.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_check_button_get_label(cast(GtkCheckButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether underlines in the label indicate mnemonics.
      Returns: The value of the [gid.gtk4.check_button.CheckButton.useUnderline] property.
          See [gid.gtk4.check_button.CheckButton.setUseUnderline] for details on how to set
          a new value.
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_check_button_get_use_underline(cast(GtkCheckButton*)this._cPtr);
    return _retval;
  }

  /**
      Changes the check buttons active state.
  
      Params:
        setting = the new value to set
  */
  void setActive(bool setting) nothrow
  {
    gtk_check_button_set_active(cast(GtkCheckButton*)this._cPtr, setting);
  }

  /**
      Sets the child widget of button.
      
      Note that by using this API, you take full responsibility for setting
      up the proper accessibility label and description information for button.
      Most likely, you'll either set the accessibility label or description
      for button explicitly, or you'll set a labelled-by or described-by
      relations from child to button.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_check_button_set_child(cast(GtkCheckButton*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds self to the group of group.
      
      In a group of multiple check buttons, only one button can be active
      at a time. The behavior of a checkbutton in a group is also commonly
      known as a *radio button*.
      
      Setting the group of a check button also changes the css name of the
      indicator widget's CSS node to 'radio'.
      
      Setting up groups in a cycle leads to undefined behavior.
      
      Note that the same effect can be achieved via the [gid.gtk4.actionable.Actionable]
      API, by using the same action with parameter type and state type 's'
      for all buttons in the group, and giving each button its own target
      value.
  
      Params:
        group = another [gid.gtk4.check_button.CheckButton] to
            form a group with
  */
  void setGroup(gid.gtk4.check_button.CheckButton group = null) nothrow
  {
    gtk_check_button_set_group(cast(GtkCheckButton*)this._cPtr, group ? cast(GtkCheckButton*)group._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.check_button.CheckButton] to inconsistent state.
      
      You should turn off the inconsistent state again if the user checks
      the check button. This has to be done manually.
  
      Params:
        inconsistent = true if state is inconsistent
  */
  void setInconsistent(bool inconsistent) nothrow
  {
    gtk_check_button_set_inconsistent(cast(GtkCheckButton*)this._cPtr, inconsistent);
  }

  /**
      Sets the text of self.
      
      If [gid.gtk4.check_button.CheckButton.useUnderline] is true, an underscore
      in label is interpreted as mnemonic indicator, see
      [gid.gtk4.check_button.CheckButton.setUseUnderline] for details on this behavior.
  
      Params:
        label = The text shown next to the indicator, or null
            to show no text
  */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    gtk_check_button_set_label(cast(GtkCheckButton*)this._cPtr, _label);
  }

  /**
      Sets whether underlines in the label indicate mnemonics.
      
      If setting is true, an underscore character in self's label
      indicates a mnemonic accelerator key. This behavior is similar
      to [gid.gtk4.label.Label.useUnderline].
  
      Params:
        setting = the new value to set
  */
  void setUseUnderline(bool setting) nothrow
  {
    gtk_check_button_set_use_underline(cast(GtkCheckButton*)this._cPtr, setting);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the check button is activated.
        
        The `::activate` signal on [gid.gtk4.check_button.CheckButton] is an action signal and
        emitting it causes the button to animate press then release.
        
        Applications should never connect to this signal, but use the
        [gid.gtk4.check_button.CheckButton.toggled] signal.
        
        The default bindings for this signal are all forms of the
        <kbd>␣</kbd> and <kbd>Enter</kbd> keys.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.check_button.CheckButton checkButton)`
  
          `checkButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.check_button.CheckButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.check_button.CheckButton.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Toggled` signal.
  
      Emitted when the buttons's [gid.gtk4.check_button.CheckButton.active]
        property changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.check_button.CheckButton checkButton)`
  
          `checkButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.check_button.CheckButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.check_button.CheckButton.toggled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggled", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.check_button.CheckButton]
class CheckButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `active` property.
      Params:
        propval = If the check button is active.
          
          Setting `active` to true will add the `:checked:` state to both
          the check button and the indicator CSS node.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `group` property.
      Params:
        propval = The check button whose group this widget belongs to.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk4.check_button.CheckButton propval) nothrow
  {
    return setProperty("group", propval);
  }

  /**
      Set `inconsistent` property.
      Params:
        propval = If the check button is in an “in between” state.
          
          The inconsistent state only affects visual appearance,
          not the semantics of the button.
      Returns: Builder instance for fluent chaining
  */
  T inconsistent(bool propval) nothrow
  {
    return setProperty("inconsistent", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the label inside the check button, if it contains a label widget.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the text indicates that the following
          character is to be used as mnemonic.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [gid.gtk4.check_button.CheckButton]
final class CheckButtonGidBuilder : CheckButtonGidBuilderImpl!CheckButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckButton build() nothrow
  {
    return new CheckButton(cast(void*)createGObject(CheckButton._getGType), Yes.Take);
  }
}
