/// Module for [Button] class
module gtk.button;

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
    The [gtk.button.Button] widget is generally used to trigger a callback function that is
    called when the button is pressed.
    
    ![An example GtkButton](button.png)
    
    The [gtk.button.Button] widget can hold any valid child widget. That is, it can hold
    almost any other standard [gtk.widget.Widget]. The most commonly used child is the
    [gtk.label.Label].
    
    # CSS nodes
    
    [gtk.button.Button] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an
    image or label, respectively. It may also receive the .flat style class.
    When activating a button via the keyboard, the button will temporarily
    gain the .keyboard-activating style class.
    
    Other style classes that are commonly used with [gtk.button.Button] include
    .suggested-action and .destructive-action. In special cases, buttons
    can be made round by adding the .circular style class.
    
    Button-like widgets like [gtk.toggle_button.ToggleButton], [gtk.menu_button.MenuButton],
    [gtk.volume_button.VolumeButton], [gtk.lock_button.LockButton], [gtk.color_button.ColorButton]
    or [gtk.font_button.FontButton] use style classes such as .toggle, .popup, .scale,
    .lock, .color on the button node to differentiate themselves from a plain
    [gtk.button.Button].
    
    # Accessibility
    
    [gtk.button.Button] uses the [gtk.types.AccessibleRole.Button] role.
*/
class Button : gtk.widget.Widget, gtk.actionable.Actionable
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
    return cast(void function())gtk_button_get_type != &gidSymbolNotFound ? gtk_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Button self()
  {
    return this;
  }

  /**
      Get `canShrink` property.
      Returns: Whether the size of the button can be made smaller than the natural
      size of its contents.
      
      For text buttons, setting this property will allow ellipsizing the label.
      
      If the contents of a button are an icon or a custom widget, setting this
      property has no effect.
  */
  @property bool canShrink()
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
  @property void canShrink(bool propval)
  {
    return setCanShrink(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `hasFrame` property.
      Returns: Whether the button has a frame.
  */
  @property bool hasFrame()
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = Whether the button has a frame.
  */
  @property void hasFrame(bool propval)
  {
    return setHasFrame(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon used to automatically populate the button.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: Text of the label inside the button, if the button contains a label widget.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = Text of the label inside the button, if the button contains a label widget.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: If set, an underline in the text indicates that the following character is
      to be used as mnemonic.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the text indicates that the following character is
        to be used as mnemonic.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gtk.button.Button] widget.
      
      To add a child widget to the button, use [gtk.button.Button.setChild].
      Returns: The newly created [gtk.button.Button] widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new button containing an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        iconName = an icon name
      Returns: a new [gtk.button.Button] displaying the themed icon
  */
  static gtk.button.Button newFromIconName(string iconName)
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_button_new_from_icon_name(_iconName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.button.Button] widget with a [gtk.label.Label] child.
  
      Params:
        label = The text you want the [gtk.label.Label] to hold
      Returns: The newly created [gtk.button.Button] widget
  */
  static gtk.button.Button newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_button_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.button.Button] containing a label.
      
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic. Pressing <kbd>Alt</kbd> and that key
      activates the button.
  
      Params:
        label = The text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new [gtk.button.Button]
  */
  static gtk.button.Button newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_button_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves whether the button can be smaller than the natural
      size of its contents.
      Returns: true if the button can shrink, and false otherwise
  */
  bool getCanShrink()
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_can_shrink(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of button.
      Returns: the child widget of button
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_get_child(cast(GtkButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button has a frame.
      Returns: true if the button has a frame
  */
  bool getHasFrame()
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_has_frame(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns the icon name of the button.
      
      If the icon name has not been set with [gtk.button.Button.setIconName]
      the return value will be null. This will be the case if you create
      an empty button with [gtk.button.Button.new_] to use as a container.
      Returns: The icon name set via [gtk.button.Button.setIconName]
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_button_get_icon_name(cast(GtkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Fetches the text from the label of the button.
      
      If the label text has not been set with [gtk.button.Button.setLabel]
      the return value will be null. This will be the case if you create
      an empty button with [gtk.button.Button.new_] to use as a container.
      Returns: The text of the label widget. This string is owned
        by the widget and must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_button_get_label(cast(GtkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      gets whether underlines are interpreted as mnemonics.
      
      See [gtk.button.Button.setUseUnderline].
      Returns: true if an embedded underline in the button label
          indicates the mnemonic accelerator keys.
  */
  bool getUseUnderline()
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
  void setCanShrink(bool canShrink)
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
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_button_set_child(cast(GtkButton*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the style of the button.
      
      Buttons can have a flat appearance or have a frame drawn around them.
  
      Params:
        hasFrame = whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame)
  {
    gtk_button_set_has_frame(cast(GtkButton*)this._cPtr, hasFrame);
  }

  /**
      Adds a [gtk.image.Image] with the given icon name as a child.
      
      If button already contains a child widget, that child widget will
      be removed and replaced with the image.
  
      Params:
        iconName = An icon name
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_button_set_icon_name(cast(GtkButton*)this._cPtr, _iconName);
  }

  /**
      Sets the text of the label of the button to label.
      
      This will also clear any previously set labels.
  
      Params:
        label = a string
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_button_set_label(cast(GtkButton*)this._cPtr, _label);
  }

  /**
      Sets whether to use underlines as mnemonics.
      
      If true, an underline in the text of the button label indicates
      the next character should be used for the mnemonic accelerator key.
  
      Params:
        useUnderline = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_button_set_use_underline(cast(GtkButton*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate press then release.
      
      This is an action signal. Applications should never connect
      to this signal, but use the [gtk.button.Button.clicked] signal.
      
      The default bindings for this signal are all forms of the
      <kbd>␣</kbd> and <kbd>Enter</kbd> keys.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.button.Button)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Clicked` signal.
  
      Emitted when the button has been activated (pressed and released).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClicked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.button.Button)))
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
    return connectSignalClosure("clicked", closure, after);
  }
}
