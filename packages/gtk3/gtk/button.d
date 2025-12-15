/// Module for [Button] class
module gtk.button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    The #GtkButton widget is generally used to trigger a callback function that is
    called when the button is pressed.  The various signals and how to use them
    are outlined below.
    
    The #GtkButton widget can hold any valid child widget.  That is, it can hold
    almost any other standard #GtkWidget.  The most commonly used child is the
    #GtkLabel.
    
    # CSS nodes
    
    GtkButton has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an
    image or label, respectively. It may also receive the .flat style class.
    
    Other style classes that are commonly used with GtkButton include
    .suggested-action and .destructive-action. In special cases, buttons
    can be made round by adding the .circular style class.
    
    Button-like widgets like #GtkToggleButton, #GtkMenuButton, #GtkVolumeButton,
    #GtkLockButton, #GtkColorButton, #GtkFontButton or #GtkFileChooserButton use
    style classes such as .toggle, .popup, .scale, .lock, .color, .font, .file
    to differentiate themselves from a plain GtkButton.
*/
class Button : gtk.bin.Bin, gtk.actionable.Actionable, gtk.activatable.Activatable
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
      Get `alwaysShowImage` property.
      Returns: If true, the button will ignore the #GtkSettings:gtk-button-images
      setting and always show the image, if available.
      
      Use this property if the button would be useless or hard to use
      without the image.
  */
  @property bool alwaysShowImage()
  {
    return getAlwaysShowImage();
  }

  /**
      Set `alwaysShowImage` property.
      Params:
        propval = If true, the button will ignore the #GtkSettings:gtk-button-images
        setting and always show the image, if available.
        
        Use this property if the button would be useless or hard to use
        without the image.
  */
  @property void alwaysShowImage(bool propval)
  {
    return setAlwaysShowImage(propval);
  }

  /**
      Get `image` property.
      Returns: The child widget to appear next to the button text.
  */
  @property gtk.widget.Widget image()
  {
    return getImage();
  }

  /**
      Set `image` property.
      Params:
        propval = The child widget to appear next to the button text.
  */
  @property void image(gtk.widget.Widget propval)
  {
    return setImage(propval);
  }

  /**
      Get `imagePosition` property.
      Returns: The position of the image relative to the text inside the button.
  */
  @property gtk.types.PositionType imagePosition()
  {
    return getImagePosition();
  }

  /**
      Set `imagePosition` property.
      Params:
        propval = The position of the image relative to the text inside the button.
  */
  @property void imagePosition(gtk.types.PositionType propval)
  {
    return setImagePosition(propval);
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /** */
  @property gtk.types.ReliefStyle relief()
  {
    return getRelief();
  }

  /** */
  @property void relief(gtk.types.ReliefStyle propval)
  {
    return setRelief(propval);
  }

  /** */
  @property bool useStock()
  {
    return getUseStock();
  }

  /** */
  @property void useStock(bool propval)
  {
    return setUseStock(propval);
  }

  /** */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /** */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Get `xalign` property.
      Returns: If the child of the button is a #GtkMisc or #GtkAlignment, this property
      can be used to control its horizontal alignment. 0.0 is left aligned,
      1.0 is right aligned.
  
      Deprecated: Access the child widget directly if you need to control
      its alignment.
  */
  @property float xalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("xalign");
  }

  /**
      Set `xalign` property.
      Params:
        propval = If the child of the button is a #GtkMisc or #GtkAlignment, this property
        can be used to control its horizontal alignment. 0.0 is left aligned,
        1.0 is right aligned.
  
      Deprecated: Access the child widget directly if you need to control
      its alignment.
  */
  @property void xalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `yalign` property.
      Returns: If the child of the button is a #GtkMisc or #GtkAlignment, this property
      can be used to control its vertical alignment. 0.0 is top aligned,
      1.0 is bottom aligned.
  
      Deprecated: Access the child widget directly if you need to control
      its alignment.
  */
  @property float yalign()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("yalign");
  }

  /**
      Set `yalign` property.
      Params:
        propval = If the child of the button is a #GtkMisc or #GtkAlignment, this property
        can be used to control its vertical alignment. 0.0 is top aligned,
        1.0 is bottom aligned.
  
      Deprecated: Access the child widget directly if you need to control
      its alignment.
  */
  @property void yalign(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  mixin ActionableT!();
  mixin ActivatableT!();

  /**
      Creates a new #GtkButton widget. To add a child widget to the button,
      use [gtk.container.Container.add].
      Returns: The newly created #GtkButton widget.
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
      
      This function is a convenience wrapper around [gtk.button.Button.new_] and
      [gtk.button.Button.setImage].
  
      Params:
        iconName = an icon name or null
        size = an icon size (#GtkIconSize)
      Returns: a new #GtkButton displaying the themed icon
  */
  static gtk.button.Button newFromIconName(string iconName, gtk.types.IconSize size)
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_button_new_from_icon_name(_iconName, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkButton containing the image and text from a
      [stock item][gtkstock].
      Some stock ids have preprocessor macros like #GTK_STOCK_OK and
      #GTK_STOCK_APPLY.
      
      If stock_id is unknown, then it will be treated as a mnemonic
      label (as for [gtk.button.Button.newWithMnemonic]).
  
      Params:
        stockId = the name of the stock item
      Returns: a new #GtkButton
  
      Deprecated: Stock items are deprecated. Use [gtk.button.Button.newWithLabel]
        instead.
  */
  static gtk.button.Button newFromStock(string stockId)
  {
    GtkWidget* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_button_new_from_stock(_stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkButton widget with a #GtkLabel child containing the given
      text.
  
      Params:
        label = The text you want the #GtkLabel to hold.
      Returns: The newly created #GtkButton widget.
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
      Creates a new #GtkButton containing a label.
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic.
      Pressing Alt and that key activates the button.
  
      Params:
        label = The text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkButton
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
      Emits a #GtkButton::clicked signal to the given #GtkButton.
  */
  void clicked()
  {
    gtk_button_clicked(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::enter signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::enter-notify-event signal.
  */
  void enter()
  {
    gtk_button_enter(cast(GtkButton*)this._cPtr);
  }

  /**
      Gets the alignment of the child in the button.
  
      Params:
        xalign = return location for horizontal alignment
        yalign = return location for vertical alignment
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  void getAlignment(out float xalign, out float yalign)
  {
    gtk_button_get_alignment(cast(GtkButton*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Returns whether the button will ignore the #GtkSettings:gtk-button-images
      setting and always show the image, if available.
      Returns: true if the button will always show the image
  */
  bool getAlwaysShowImage()
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_always_show_image(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns the button’s event window if it is realized, null otherwise.
      This function should be rarely needed.
      Returns: button’s event window.
  */
  gdk.window.Window getEventWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_button_get_event_window(cast(GtkButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button grabs focus when it is clicked with the mouse.
      See [gtk.button.Button.setFocusOnClick].
      Returns: true if the button grabs focus when it is clicked with
                      the mouse.
  
      Deprecated: Use [gtk.widget.Widget.getFocusOnClick] instead
  */
  override bool getFocusOnClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_focus_on_click(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget that is currenty set as the image of button.
      This may have been explicitly set by [gtk.button.Button.setImage]
      or constructed by [gtk.button.Button.newFromStock].
      Returns: a #GtkWidget or null in case
            there is no image
  */
  gtk.widget.Widget getImage()
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_get_image(cast(GtkButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the image relative to the text
      inside the button.
      Returns: the position
  */
  gtk.types.PositionType getImagePosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_button_get_image_position(cast(GtkButton*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Fetches the text from the label of the button, as set by
      [gtk.button.Button.setLabel]. If the label text has not
      been set the return value will be null. This will be the
      case if you create an empty button with [gtk.button.Button.new_] to
      use as a container.
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
      Returns the current relief style of the given #GtkButton.
      Returns: The current #GtkReliefStyle
  */
  gtk.types.ReliefStyle getRelief()
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_button_get_relief(cast(GtkButton*)this._cPtr);
    gtk.types.ReliefStyle _retval = cast(gtk.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Returns whether the button label is a stock item.
      Returns: true if the button label is used to
                      select a stock item instead of being
                      used directly as the label text.
  */
  bool getUseStock()
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_use_stock(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the button label indicates a
      mnemonic. See gtk_button_set_use_underline ().
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
      Emits a #GtkButton::leave signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::leave-notify-event signal.
  */
  void leave()
  {
    gtk_button_leave(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::pressed signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::button-press-event signal.
  */
  void pressed()
  {
    gtk_button_pressed(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::released signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::button-release-event signal.
  */
  void released()
  {
    gtk_button_released(cast(GtkButton*)this._cPtr);
  }

  /**
      Sets the alignment of the child. This property has no effect unless
      the child is a #GtkMisc or a #GtkAlignment.
  
      Params:
        xalign = the horizontal position of the child, 0.0 is left aligned,
            1.0 is right aligned
        yalign = the vertical position of the child, 0.0 is top aligned,
            1.0 is bottom aligned
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  void setAlignment(float xalign, float yalign)
  {
    gtk_button_set_alignment(cast(GtkButton*)this._cPtr, xalign, yalign);
  }

  /**
      If true, the button will ignore the #GtkSettings:gtk-button-images
      setting and always show the image, if available.
      
      Use this property if the button  would be useless or hard to use
      without the image.
  
      Params:
        alwaysShow = true if the menuitem should always show the image
  */
  void setAlwaysShowImage(bool alwaysShow)
  {
    gtk_button_set_always_show_image(cast(GtkButton*)this._cPtr, alwaysShow);
  }

  /**
      Sets whether the button will grab focus when it is clicked with the mouse.
      Making mouse clicks not grab focus is useful in places like toolbars where
      you don’t want the keyboard focus removed from the main area of the
      application.
  
      Params:
        focusOnClick = whether the button grabs focus when clicked with the mouse
  
      Deprecated: Use [gtk.widget.Widget.setFocusOnClick] instead
  */
  override void setFocusOnClick(bool focusOnClick)
  {
    gtk_button_set_focus_on_click(cast(GtkButton*)this._cPtr, focusOnClick);
  }

  /**
      Set the image of button to the given widget. The image will be
      displayed if the label text is null or if
      #GtkButton:always-show-image is true. You don’t have to call
      [gtk.widget.Widget.show] on image yourself.
  
      Params:
        image = a widget to set as the image for the button, or null to unset
  */
  void setImage(gtk.widget.Widget image = null)
  {
    gtk_button_set_image(cast(GtkButton*)this._cPtr, image ? cast(GtkWidget*)image._cPtr(No.Dup) : null);
  }

  /**
      Sets the position of the image relative to the text
      inside the button.
  
      Params:
        position = the position
  */
  void setImagePosition(gtk.types.PositionType position)
  {
    gtk_button_set_image_position(cast(GtkButton*)this._cPtr, position);
  }

  /**
      Sets the text of the label of the button to str. This text is
      also used to select the stock item if [gtk.button.Button.setUseStock]
      is used.
      
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
      Sets the relief style of the edges of the given #GtkButton widget.
      Two styles exist, [gtk.types.ReliefStyle.Normal] and [gtk.types.ReliefStyle.None].
      The default style is, as one can guess, [gtk.types.ReliefStyle.Normal].
      The deprecated value [gtk.types.ReliefStyle.Half] behaves the same as
      [gtk.types.ReliefStyle.Normal].
  
      Params:
        relief = The GtkReliefStyle as described above
  */
  void setRelief(gtk.types.ReliefStyle relief)
  {
    gtk_button_set_relief(cast(GtkButton*)this._cPtr, relief);
  }

  /**
      If true, the label set on the button is used as a
      stock id to select the stock item for the button.
  
      Params:
        useStock = true if the button should use a stock item
  */
  void setUseStock(bool useStock)
  {
    gtk_button_set_use_stock(cast(GtkButton*)this._cPtr, useStock);
  }

  /**
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
  
      The ::activate signal on GtkButton is an action signal and
      emitting it causes the button to animate press then release.
      Applications should never connect to this signal, but use the
      #GtkButton::clicked signal.
  
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

  /**
      Connect to `Enter` signal.
  
      Emitted when the pointer enters the button.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::enter-notify-event signal.
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
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
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Emitted when the pointer leaves the button.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::leave-notify-event signal.
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
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
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Pressed` signal.
  
      Emitted when the button is pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::button-press-event signal.
  */
  ulong connectPressed(T)(T callback, Flag!"After" after = No.After)
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
    return connectSignalClosure("pressed", closure, after);
  }

  /**
      Connect to `Released` signal.
  
      Emitted when the button is released.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.button.Button button))
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::button-release-event signal.
  */
  ulong connectReleased(T)(T callback, Flag!"After" after = No.After)
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
    return connectSignalClosure("released", closure, after);
  }
}
