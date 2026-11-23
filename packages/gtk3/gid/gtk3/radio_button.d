/// Module for [RadioButton] class
module gid.gtk3.radio_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.check_button;
import gid.gtk3.types;

/**
    A single radio button performs the same basic function as a #GtkCheckButton,
    as its position in the object hierarchy reflects. It is only when multiple
    radio buttons are grouped together that they become a different user
    interface component in their own right.
    
    Every radio button is a member of some group of radio buttons. When one is
    selected, all other radio buttons in the same group are deselected. A
    #GtkRadioButton is one way of giving the user a choice from many options.
    
    Radio button widgets are created with [gid.gtk3.radio_button.RadioButton.new_], passing null
    as the argument if this is the first radio button in a group. In subsequent
    calls, the group you wish to add this button to should be passed as an
    argument. Optionally, [gid.gtk3.radio_button.RadioButton.newWithLabel] can be used if you
    want a text label on the radio button.
    
    Alternatively, when adding widgets to an existing group of radio buttons,
    use [gid.gtk3.radio_button.RadioButton.newFromWidget] with a #GtkRadioButton that already
    has a group assigned to it. The convenience function
    [gid.gtk3.radio_button.RadioButton.newWithLabelFromWidget] is also provided.
    
    To retrieve the group a #GtkRadioButton is assigned to, use
    [gid.gtk3.radio_button.RadioButton.getGroup].
    
    To remove a #GtkRadioButton from one group and make it part of a new one,
    use [gid.gtk3.radio_button.RadioButton.setGroup].
    
    The group list does not need to be freed, as each #GtkRadioButton will remove
    itself and its list item when it is destroyed.
    
    # CSS nodes
    
    ```plain
    radiobutton
    ├── radio
    ╰── <child>
    ```
    
    A GtkRadioButton with indicator (see [gid.gtk3.toggle_button.ToggleButton.setMode]) has a
    main CSS node with name radiobutton and a subnode with name radio.
    
    ```plain
    button.radio
    ├── radio
    ╰── <child>
    ```
    
    A GtkRadioButton without indicator changes the name of its main node
    to button and adds a .radio style class to it. The subnode is invisible
    in this case.
    
    ## How to create a group of two radio buttons.
    
    ```c
    void create_radio_buttons (void) {
    
       GtkWidget *window, *radio1, *radio2, *box, *entry;
       window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
       box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 2);
       gtk_box_set_homogeneous (GTK_BOX (box), TRUE);
    
       // Create a radio button with a GtkEntry widget
       radio1 = gtk_radio_button_new (NULL);
       entry = gtk_entry_new ();
       gtk_container_add (GTK_CONTAINER (radio1), entry);
    
    
       // Create a radio button with a label
       radio2 = gtk_radio_button_new_with_label_from_widget (GTK_RADIO_BUTTON (radio1),
                                                             "I’m the second radio button.");
    
       // Pack them into a box, then show all the widgets
       gtk_box_pack_start (GTK_BOX (box), radio1);
       gtk_box_pack_start (GTK_BOX (box), radio2);
       gtk_container_add (GTK_CONTAINER (window), box);
       gtk_widget_show_all (window);
       return;
    }
    ```
    
    When an unselected button in the group is clicked the clicked button
    receives the #GtkToggleButton::toggled signal, as does the previously
    selected button.
    Inside the #GtkToggleButton::toggled handler, [gid.gtk4.toggle_button.ToggleButton.getActive]
    can be used to determine if the button has been selected or deselected.
*/
class RadioButton : gid.gtk3.check_button.CheckButton
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
    return cast(void function())gtk_radio_button_get_type != &gidSymbolNotFound ? gtk_radio_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_button.RadioButton]
      Returns: New builder object
  */
  static RadioButtonGidBuilder builder() nothrow
  {
    return new RadioButtonGidBuilder;
  }

  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio button.
  */
  @property void group(gid.gtk3.radio_button.RadioButton propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.radio_button.RadioButton)("group", propval);
  }

  /**
      Creates a new #GtkRadioButton. To be of any practical value, a widget should
      then be packed into the radio button.
  
      Params:
        group = an existing
                  radio button group, or null if you are creating a new group.
      Returns: a new radio button
  */
  this(gid.gtk3.radio_button.RadioButton[] group = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, group !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
      scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
      _cretval = gtk_radio_button_new(_group);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkRadioButton, adding it to the same group as
      radio_group_member. As with [gid.gtk3.radio_button.RadioButton.new_], a widget
      should be packed into the radio button.
  
      Params:
        radioGroupMember = an existing #GtkRadioButton.
      Returns: a new radio button.
  */
  static gid.gtk3.radio_button.RadioButton newFromWidget(gid.gtk3.radio_button.RadioButton radioGroupMember = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_radio_button_new_from_widget(radioGroupMember ? cast(GtkRadioButton*)radioGroupMember._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_button.RadioButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioButton with a text label.
  
      Params:
        group = an existing
                  radio button group, or null if you are creating a new group.
        label = the text label to display next to the radio button.
      Returns: a new radio button.
  */
  static gid.gtk3.radio_button.RadioButton newWithLabel(gid.gtk3.radio_button.RadioButton[] group, string label) nothrow
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_button_new_with_label(_group, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_button.RadioButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioButton with a text label, adding it to
      the same group as radio_group_member.
  
      Params:
        radioGroupMember = widget to get radio group from or null
        label = a text string to display next to the radio button.
      Returns: a new radio button.
  */
  static gid.gtk3.radio_button.RadioButton newWithLabelFromWidget(gid.gtk3.radio_button.RadioButton radioGroupMember, string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_button_new_with_label_from_widget(radioGroupMember ? cast(GtkRadioButton*)radioGroupMember._cPtr(No.Dup) : null, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_button.RadioButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioButton containing a label, adding it to the same
      group as group. The label will be created using
      [gid.gtk4.label.Label.newWithMnemonic], so underscores in label indicate the
      mnemonic for the button.
  
      Params:
        group = the radio button
                  group, or null
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkRadioButton
  */
  static gid.gtk3.radio_button.RadioButton newWithMnemonic(gid.gtk3.radio_button.RadioButton[] group, string label) nothrow
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_button_new_with_mnemonic(_group, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_button.RadioButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioButton containing a label. The label
      will be created using [gid.gtk4.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the button.
  
      Params:
        radioGroupMember = widget to get radio group from or null
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkRadioButton
  */
  static gid.gtk3.radio_button.RadioButton newWithMnemonicFromWidget(gid.gtk3.radio_button.RadioButton radioGroupMember, string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_button_new_with_mnemonic_from_widget(radioGroupMember ? cast(GtkRadioButton*)radioGroupMember._cPtr(No.Dup) : null, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_button.RadioButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncGroupChanged()
  {
    auto _klass = cast(GtkRadioButtonClass*)_vfuncClass;
    if (!_klass.groupChanged)
      return;

    _klass.groupChanged(cast(GtkRadioButton*)this._cPtr);
  }

  /**
      Retrieves the group assigned to a radio button.
      Returns: a linked list
        containing all the radio buttons in the same group
        as radio_button. The returned list is owned by the radio button
        and must not be modified or freed.
  */
  gid.gtk3.radio_button.RadioButton[] getGroup() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_radio_button_get_group(cast(GtkRadioButton*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.radio_button.RadioButton, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Joins a #GtkRadioButton object to the group of another #GtkRadioButton object
      
      Use this in language bindings instead of the [gid.gtk3.radio_button.RadioButton.getGroup]
      and [gid.gtk3.radio_button.RadioButton.setGroup] methods
      
      A common way to set up a group of radio buttons is the following:
      ```c
        GtkRadioButton *radio_button;
        GtkRadioButton *last_button;
      
        while (some_condition)
          {
             radio_button = gtk_radio_button_new (NULL);
      
             gtk_radio_button_join_group (radio_button, last_button);
             last_button = radio_button;
          }
      ```
  
      Params:
        groupSource = a radio button object whos group we are
            joining, or null to remove the radio button from its group
  */
  void joinGroup(gid.gtk3.radio_button.RadioButton groupSource = null) nothrow
  {
    gtk_radio_button_join_group(cast(GtkRadioButton*)this._cPtr, groupSource ? cast(GtkRadioButton*)groupSource._cPtr(No.Dup) : null);
  }

  /**
      Sets a #GtkRadioButton’s group. It should be noted that this does not change
      the layout of your interface in any way, so if you are changing the group,
      it is likely you will need to re-arrange the user interface to reflect these
      changes.
  
      Params:
        group = an existing radio
              button group, such as one returned from [gid.gtk3.radio_button.RadioButton.getGroup], or null.
  */
  void setGroup(gid.gtk3.radio_button.RadioButton[] group = null) nothrow
  {
    auto _group = gSListFromD!(gid.gtk3.radio_button.RadioButton)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_button.RadioButton, GidOwnership.None)(_group);
    gtk_radio_button_set_group(cast(GtkRadioButton*)this._cPtr, _group);
  }

  /**
      Connect to `GroupChanged` signal.
  
      Emitted when the group of radio buttons that a radio button belongs
        to changes. This is emitted when a radio button switches from
        being alone to being part of a group of 2 or more buttons, or
        vice-versa, and when a button is moved from one group of 2 or
        more buttons to a different one, but not when the composition
        of the group that a button belongs to changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.radio_button.RadioButton radioButton)`
  
          `radioButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGroupChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.radio_button.RadioButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_button.RadioButton.groupChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("group-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RadioButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.radio_button.RadioButton), T.stringof ~ " is not derived from gid.gtk3.radio_button.RadioButton");

    gid.gtk3.check_button.CheckButton._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGroupChanged", true)[0]) == gid.gtk3.radio_button.RadioButton))
      _installVfunc(klass, "group_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRadioButtonClass*)klass;

    switch (vfunc)
    {
      case "group_changed":
      {
        static extern(C) void _vfuncGroupChangedTramp(GtkRadioButton* radioButton) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.radio_button.RadioButton)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)radioButton);
          if (!_obj)
          {
            auto _klass = cast(GtkRadioButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)radioButton);
            if (_klass.groupChanged)
              return (cast(typeof(&_vfuncGroupChangedTramp))_klass.groupChanged)(radioButton);
            return;
          }

          try
          {
            _obj.vfuncGroupChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_button.RadioButton.vfuncGroupChanged");
          }
        }

        _klass.groupChanged = cast(typeof(_klass.groupChanged))&_vfuncGroupChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_button.RadioButton]
class RadioButtonGidBuilderImpl(T) : gid.gtk3.check_button.CheckButtonGidBuilderImpl!T
{


  /**
      Set `group` property.
      Params:
        propval = Sets a new group for a radio button.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk3.radio_button.RadioButton propval) nothrow
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gid.gtk3.radio_button.RadioButton]
final class RadioButtonGidBuilder : RadioButtonGidBuilderImpl!RadioButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioButton build() nothrow
  {
    return new RadioButton(cast(void*)createGObject(RadioButton._getGType), Yes.Take);
  }
}
