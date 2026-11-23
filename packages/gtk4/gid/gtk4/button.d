/// Module for [Button] class
module gid.gtk4.button;

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
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Calls a callback function when the button is clicked.
    
    <picture>
      <source srcset="button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkButton" src="button.png">
    </picture>
    
    The [gid.gtk4.button.Button] widget can hold any valid child widget. That is, it can hold
    almost any other standard [gid.gtk4.widget.Widget]. The most commonly used child is the
    [gid.gtk4.label.Label].
    
    # Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.button.Button.activate]
    
    # CSS nodes
    
    [gid.gtk4.button.Button] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an
    image or label, respectively. It may also receive the .flat style class.
    When activating a button via the keyboard, the button will temporarily
    gain the .keyboard-activating style class.
    
    Other style classes that are commonly used with [gid.gtk4.button.Button] include
    .suggested-action and .destructive-action. In special cases, buttons
    can be made round by adding the .circular style class.
    
    Button-like widgets like [gid.gtk4.toggle_button.ToggleButton], [gid.gtk4.menu_button.MenuButton],
    [gid.gtk4.volume_button.VolumeButton], [gid.gtk4.lock_button.LockButton], [gid.gtk4.color_button.ColorButton]
    or [gid.gtk4.font_button.FontButton] use style classes such as .toggle, .popup, .scale,
    .lock, .color on the button node to differentiate themselves from a plain
    [gid.gtk4.button.Button].
    
    # Accessibility
    
    [gid.gtk4.button.Button] uses the [gid.gtk4.types.AccessibleRole.Button] role.
*/
class Button : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())gtk_button_get_type != &gidSymbolNotFound ? gtk_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override Button self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.button.Button]
      Returns: New builder object
  */
  static ButtonGidBuilder builder() nothrow
  {
    return new ButtonGidBuilder;
  }

  /**
      Get `canShrink` property.
      Returns: Whether the size of the button can be made smaller than the natural
        size of its contents.
        
        For text buttons, setting this property will allow ellipsizing the label.
        
        If the contents of a button are an icon or a custom widget, setting this
        property has no effect.
  */
  @property bool canShrink() nothrow
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the size of the button can be made smaller than the natural
          size of its contents.
          
          For text buttons, setting this property will allow ellipsizing the label.
          
          If the contents of a button are an icon or a custom widget, setting this
          property has no effect.
  */
  @property void canShrink(bool propval) nothrow
  {
    setCanShrink(propval);
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
      Get `hasFrame` property.
      Returns: Whether the button has a frame.
  */
  @property bool hasFrame() nothrow
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = Whether the button has a frame.
  */
  @property void hasFrame(bool propval) nothrow
  {
    setHasFrame(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon used to automatically populate the button.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: Text of the label inside the button, if the button contains a label widget.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the label inside the button, if the button contains a label widget.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: If set, an underline in the text indicates that the following character is
        to be used as mnemonic.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the text indicates that the following character is
          to be used as mnemonic.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gid.gtk4.button.Button] widget.
      
      To add a child widget to the button, use [gid.gtk4.button.Button.setChild].
      Returns: The newly created [gid.gtk4.button.Button] widget.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_button_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new button containing an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        iconName = an icon name
      Returns: a new [gid.gtk4.button.Button] displaying the themed icon
  */
  static gid.gtk4.button.Button newFromIconName(string iconName) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_from_icon_name(_iconName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.button.Button] widget with a [gid.gtk4.label.Label] child.
  
      Params:
        label = The text you want the [gid.gtk4.label.Label] to hold
      Returns: The newly created [gid.gtk4.button.Button] widget
  */
  static gid.gtk4.button.Button newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.button.Button] containing a label.
      
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic. Pressing <kbd>Alt</kbd> and that key
      activates the button.
  
      Params:
        label = The text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new [gid.gtk4.button.Button]
  */
  static gid.gtk4.button.Button newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Signal that causes the button to animate press then
         release. Applications should never connect to this signal, but use
         the clicked signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkButton*)this._cPtr);
  }

  /**
      Signal emitted when the button has been activated (pressed and released).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClicked` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncClicked()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.clicked)
      return;

    _klass.clicked(cast(GtkButton*)this._cPtr);
  }

  /**
      Retrieves whether the button can be smaller than the natural
      size of its contents.
      Returns: true if the button can shrink, and false otherwise
  */
  bool getCanShrink() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_can_shrink(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of button.
      Returns: the child widget of button
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_get_child(cast(GtkButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button has a frame.
      Returns: true if the button has a frame
  */
  bool getHasFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_has_frame(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns the icon name of the button.
      
      If the icon name has not been set with [gid.gtk4.button.Button.setIconName]
      the return value will be null. This will be the case if you create
      an empty button with [gid.gtk4.button.Button.new_] to use as a container.
      Returns: The icon name set via [gid.gtk4.button.Button.setIconName]
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_button_get_icon_name(cast(GtkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Fetches the text from the label of the button.
      
      If the label text has not been set with [gid.gtk4.button.Button.setLabel]
      the return value will be null. This will be the case if you create
      an empty button with [gid.gtk4.button.Button.new_] to use as a container.
      Returns: The text of the label widget. This string is owned
        by the widget and must not be modified or freed.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_button_get_label(cast(GtkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      gets whether underlines are interpreted as mnemonics.
      
      See [gid.gtk4.button.Button.setUseUnderline].
      Returns: true if an embedded underline in the button label
          indicates the mnemonic accelerator keys.
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_use_underline(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the button size can be smaller than the natural size of
      its contents.
      
      For text buttons, setting can_shrink to true will ellipsize the label.
      
      For icons and custom children, this function has no effect.
  
      Params:
        canShrink = whether the button can shrink
  */
  void setCanShrink(bool canShrink) nothrow
  {
    gtk_button_set_can_shrink(cast(GtkButton*)this._cPtr, canShrink);
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
    gtk_button_set_child(cast(GtkButton*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the style of the button.
      
      Buttons can have a flat appearance or have a frame drawn around them.
  
      Params:
        hasFrame = whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame) nothrow
  {
    gtk_button_set_has_frame(cast(GtkButton*)this._cPtr, hasFrame);
  }

  /**
      Adds a [gid.gtk4.image.Image] with the given icon name as a child.
      
      If button already contains a child widget, that child widget will
      be removed and replaced with the image.
  
      Params:
        iconName = An icon name
  */
  void setIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_button_set_icon_name(cast(GtkButton*)this._cPtr, _iconName);
  }

  /**
      Sets the text of the label of the button to label.
      
      This will also clear any previously set labels.
  
      Params:
        label = a string
  */
  void setLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_button_set_label(cast(GtkButton*)this._cPtr, _label);
  }

  /**
      Sets whether to use underlines as mnemonics.
      
      If true, an underline in the text of the button label indicates
      the next character should be used for the mnemonic accelerator key.
  
      Params:
        useUnderline = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    gtk_button_set_use_underline(cast(GtkButton*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate press then release.
        
        This is an action signal. Applications should never connect
        to this signal, but use the [gid.gtk4.button.Button.clicked] signal.
        
        The default bindings for this signal are all forms of the
        <kbd>␣</kbd> and <kbd>Enter</kbd> keys.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.button.Button.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Clicked` signal.
  
      Emitted when the button has been activated (pressed and released).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.button.Button.clicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clicked", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Button
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.button.Button), T.stringof ~ " is not derived from gid.gtk4.button.Button");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk4.button.Button))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClicked", true)[0]) == gid.gtk4.button.Button))
      _installVfunc(klass, "clicked");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkButtonClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(button);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.button.Button.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "clicked":
      {
        static extern(C) void _vfuncClickedTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.clicked)
              return (cast(typeof(&_vfuncClickedTramp))_klass.clicked)(button);
            return;
          }

          try
          {
            _obj.vfuncClicked();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.button.Button.vfuncClicked");
          }
        }

        _klass.clicked = cast(typeof(_klass.clicked))&_vfuncClickedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.button.Button]
class ButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the size of the button can be made smaller than the natural
          size of its contents.
          
          For text buttons, setting this property will allow ellipsizing the label.
          
          If the contents of a button are an icon or a custom widget, setting this
          property has no effect.
      Returns: Builder instance for fluent chaining
  */
  T canShrink(bool propval) nothrow
  {
    return setProperty("can-shrink", propval);
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
      Set `hasFrame` property.
      Params:
        propval = Whether the button has a frame.
      Returns: Builder instance for fluent chaining
  */
  T hasFrame(bool propval) nothrow
  {
    return setProperty("has-frame", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the label inside the button, if the button contains a label widget.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the text indicates that the following character is
          to be used as mnemonic.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [gid.gtk4.button.Button]
final class ButtonGidBuilder : ButtonGidBuilderImpl!ButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Button build() nothrow
  {
    return new Button(cast(void*)createGObject(Button._getGType), Yes.Take);
  }
}
