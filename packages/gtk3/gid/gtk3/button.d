/// Module for [Button] class
module gid.gtk3.button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.gtk3.widget;

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
class Button : gid.gtk3.bin.Bin, gid.gtk3.actionable.Actionable, gid.gtk3.activatable.Activatable
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
      Get builder for [gid.gtk3.button.Button]
      Returns: New builder object
  */
  static ButtonGidBuilder builder() nothrow
  {
    return new ButtonGidBuilder;
  }

  /**
      Get `alwaysShowImage` property.
      Returns: If true, the button will ignore the #GtkSettings:gtk-button-images
        setting and always show the image, if available.
        
        Use this property if the button would be useless or hard to use
        without the image.
  */
  @property bool alwaysShowImage() nothrow
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
  @property void alwaysShowImage(bool propval) nothrow
  {
    setAlwaysShowImage(propval);
  }

  /**
      Get `image` property.
      Returns: The child widget to appear next to the button text.
  */
  @property gid.gtk3.widget.Widget image() nothrow
  {
    return getImage();
  }

  /**
      Set `image` property.
      Params:
        propval = The child widget to appear next to the button text.
  */
  @property void image(gid.gtk3.widget.Widget propval) nothrow
  {
    setImage(propval);
  }

  /**
      Get `imagePosition` property.
      Returns: The position of the image relative to the text inside the button.
  */
  @property gid.gtk3.types.PositionType imagePosition() nothrow
  {
    return getImagePosition();
  }

  /**
      Set `imagePosition` property.
      Params:
        propval = The position of the image relative to the text inside the button.
  */
  @property void imagePosition(gid.gtk3.types.PositionType propval) nothrow
  {
    setImagePosition(propval);
  }

  /** */
  @property string label() nothrow
  {
    return getLabel();
  }

  /** */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /** */
  @property gid.gtk3.types.ReliefStyle relief() nothrow
  {
    return getRelief();
  }

  /** */
  @property void relief(gid.gtk3.types.ReliefStyle propval) nothrow
  {
    setRelief(propval);
  }

  /** */
  @property bool useStock() nothrow
  {
    return getUseStock();
  }

  /** */
  @property void useStock(bool propval) nothrow
  {
    setUseStock(propval);
  }

  /** */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /** */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Get `xalign` property.
      Returns: If the child of the button is a #GtkMisc or #GtkAlignment, this property
        can be used to control its horizontal alignment. 0.0 is left aligned,
        1.0 is right aligned.
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  @property float xalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("xalign");
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
  @property void xalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("xalign", propval);
  }

  /**
      Get `yalign` property.
      Returns: If the child of the button is a #GtkMisc or #GtkAlignment, this property
        can be used to control its vertical alignment. 0.0 is top aligned,
        1.0 is bottom aligned.
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  @property float yalign() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(float)("yalign");
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
  @property void yalign(float propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(float)("yalign", propval);
  }

  mixin ActionableT!();
  mixin ActivatableT!();

  /**
      Creates a new #GtkButton widget. To add a child widget to the button,
      use [gid.gtk3.container.Container.add].
      Returns: The newly created #GtkButton widget.
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
      
      This function is a convenience wrapper around [gid.gtk4.button.Button.new_] and
      [gid.gtk3.button.Button.setImage].
  
      Params:
        iconName = an icon name or null
        size = an icon size (#GtkIconSize)
      Returns: a new #GtkButton displaying the themed icon
  */
  static gid.gtk3.button.Button newFromIconName(string iconName, gid.gtk3.types.IconSize size) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_button_new_from_icon_name(_iconName, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkButton containing the image and text from a
      [stock item][gtkstock].
      Some stock ids have preprocessor macros like #GTK_STOCK_OK and
      #GTK_STOCK_APPLY.
      
      If stock_id is unknown, then it will be treated as a mnemonic
      label (as for [gid.gtk4.button.Button.newWithMnemonic]).
  
      Params:
        stockId = the name of the stock item
      Returns: a new #GtkButton
  
      Deprecated: Stock items are deprecated. Use [gid.gtk4.button.Button.newWithLabel]
        instead.
  */
  static gid.gtk3.button.Button newFromStock(string stockId) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_from_stock(_stockId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkButton widget with a #GtkLabel child containing the given
      text.
  
      Params:
        label = The text you want the #GtkLabel to hold.
      Returns: The newly created #GtkButton widget.
  */
  static gid.gtk3.button.Button newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
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
  static gid.gtk3.button.Button newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_button_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
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
      Emits a #GtkButton::clicked signal to the given #GtkButton.
  
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
      Emits a #GtkButton::enter signal to the given #GtkButton.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEnter` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use the #GtkWidget::enter-notify-event signal.
  */
  protected void vfuncEnter()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.enter)
      return;

    _klass.enter(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::leave signal to the given #GtkButton.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLeave` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use the #GtkWidget::leave-notify-event signal.
  */
  protected void vfuncLeave()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.leave)
      return;

    _klass.leave(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::pressed signal to the given #GtkButton.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPressed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use the #GtkWidget::button-press-event signal.
  */
  protected void vfuncPressed()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.pressed)
      return;

    _klass.pressed(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::released signal to the given #GtkButton.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReleased` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Use the #GtkWidget::button-release-event signal.
  */
  protected void vfuncReleased()
  {
    auto _klass = cast(GtkButtonClass*)_vfuncClass;
    if (!_klass.released)
      return;

    _klass.released(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::clicked signal to the given #GtkButton.
  */
  void clicked() nothrow
  {
    gtk_button_clicked(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::enter signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::enter-notify-event signal.
  */
  void enter() nothrow
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
  void getAlignment(out float xalign, out float yalign) nothrow
  {
    gtk_button_get_alignment(cast(GtkButton*)this._cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Returns whether the button will ignore the #GtkSettings:gtk-button-images
      setting and always show the image, if available.
      Returns: true if the button will always show the image
  */
  bool getAlwaysShowImage() nothrow
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
  gid.gdk3.window.Window getEventWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_button_get_event_window(cast(GtkButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button grabs focus when it is clicked with the mouse.
      See [gid.gtk3.button.Button.setFocusOnClick].
      Returns: true if the button grabs focus when it is clicked with
                      the mouse.
  
      Deprecated: Use [gid.gtk4.widget.Widget.getFocusOnClick] instead
  */
  override bool getFocusOnClick() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_focus_on_click(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget that is currenty set as the image of button.
      This may have been explicitly set by [gid.gtk3.button.Button.setImage]
      or constructed by [gid.gtk3.button.Button.newFromStock].
      Returns: a #GtkWidget or null in case
            there is no image
  */
  gid.gtk3.widget.Widget getImage() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_button_get_image(cast(GtkButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position of the image relative to the text
      inside the button.
      Returns: the position
  */
  gid.gtk3.types.PositionType getImagePosition() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_button_get_image_position(cast(GtkButton*)this._cPtr);
    gid.gtk3.types.PositionType _retval = cast(gid.gtk3.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Fetches the text from the label of the button, as set by
      [gid.gtk4.button.Button.setLabel]. If the label text has not
      been set the return value will be null. This will be the
      case if you create an empty button with [gid.gtk4.button.Button.new_] to
      use as a container.
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
      Returns the current relief style of the given #GtkButton.
      Returns: The current #GtkReliefStyle
  */
  gid.gtk3.types.ReliefStyle getRelief() nothrow
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_button_get_relief(cast(GtkButton*)this._cPtr);
    gid.gtk3.types.ReliefStyle _retval = cast(gid.gtk3.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Returns whether the button label is a stock item.
      Returns: true if the button label is used to
                      select a stock item instead of being
                      used directly as the label text.
  */
  bool getUseStock() nothrow
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
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_button_get_use_underline(cast(GtkButton*)this._cPtr);
    return _retval;
  }

  /**
      Emits a #GtkButton::leave signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::leave-notify-event signal.
  */
  void leave() nothrow
  {
    gtk_button_leave(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::pressed signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::button-press-event signal.
  */
  void pressed() nothrow
  {
    gtk_button_pressed(cast(GtkButton*)this._cPtr);
  }

  /**
      Emits a #GtkButton::released signal to the given #GtkButton.
  
      Deprecated: Use the #GtkWidget::button-release-event signal.
  */
  void released() nothrow
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
  void setAlignment(float xalign, float yalign) nothrow
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
  void setAlwaysShowImage(bool alwaysShow) nothrow
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
  
      Deprecated: Use [gid.gtk4.widget.Widget.setFocusOnClick] instead
  */
  override void setFocusOnClick(bool focusOnClick) nothrow
  {
    gtk_button_set_focus_on_click(cast(GtkButton*)this._cPtr, focusOnClick);
  }

  /**
      Set the image of button to the given widget. The image will be
      displayed if the label text is null or if
      #GtkButton:always-show-image is true. You don’t have to call
      [gid.gtk4.widget.Widget.show] on image yourself.
  
      Params:
        image = a widget to set as the image for the button, or null to unset
  */
  void setImage(gid.gtk3.widget.Widget image = null) nothrow
  {
    gtk_button_set_image(cast(GtkButton*)this._cPtr, image ? cast(GtkWidget*)image._cPtr(No.Dup) : null);
  }

  /**
      Sets the position of the image relative to the text
      inside the button.
  
      Params:
        position = the position
  */
  void setImagePosition(gid.gtk3.types.PositionType position) nothrow
  {
    gtk_button_set_image_position(cast(GtkButton*)this._cPtr, position);
  }

  /**
      Sets the text of the label of the button to str. This text is
      also used to select the stock item if [gid.gtk3.button.Button.setUseStock]
      is used.
      
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
      Sets the relief style of the edges of the given #GtkButton widget.
      Two styles exist, [gid.gtk3.types.ReliefStyle.Normal] and [gid.gtk3.types.ReliefStyle.None].
      The default style is, as one can guess, [gid.gtk3.types.ReliefStyle.Normal].
      The deprecated value [gid.gtk3.types.ReliefStyle.Half] behaves the same as
      [gid.gtk3.types.ReliefStyle.Normal].
  
      Params:
        relief = The GtkReliefStyle as described above
  */
  void setRelief(gid.gtk3.types.ReliefStyle relief) nothrow
  {
    gtk_button_set_relief(cast(GtkButton*)this._cPtr, relief);
  }

  /**
      If true, the label set on the button is used as a
      stock id to select the stock item for the button.
  
      Params:
        useStock = true if the button should use a stock item
  */
  void setUseStock(bool useStock) nothrow
  {
    gtk_button_set_use_stock(cast(GtkButton*)this._cPtr, useStock);
  }

  /**
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
  
      The ::activate signal on GtkButton is an action signal and
        emitting it causes the button to animate press then release.
        Applications should never connect to this signal, but use the
        #GtkButton::clicked signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.activate");
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
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.clicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clicked", closure, after);
  }

  /**
      Connect to `Enter` signal.
  
      Emitted when the pointer enters the button.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::enter-notify-event signal.
  */
  gulong connectEnter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.enter");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Emitted when the pointer leaves the button.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::leave-notify-event signal.
  */
  gulong connectLeave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.leave");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Pressed` signal.
  
      Emitted when the button is pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::button-press-event signal.
  */
  gulong connectPressed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.pressed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }

  /**
      Connect to `Released` signal.
  
      Emitted when the button is released.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.button.Button button)`
  
          `button` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #GtkWidget::button-release-event signal.
  */
  gulong connectReleased(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.button.Button)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.released");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("released", closure, after);
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
    static assert(is(T : gid.gtk3.button.Button), T.stringof ~ " is not derived from gid.gtk3.button.Button");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClicked", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "clicked");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEnter", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "enter");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLeave", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "leave");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPressed", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "pressed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReleased", true)[0]) == gid.gtk3.button.Button))
      _installVfunc(klass, "released");
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
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncActivate");
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
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncClicked");
          }
        }

        _klass.clicked = cast(typeof(_klass.clicked))&_vfuncClickedTramp;
        break;
      }
      case "enter":
      {
        static extern(C) void _vfuncEnterTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.enter)
              return (cast(typeof(&_vfuncEnterTramp))_klass.enter)(button);
            return;
          }

          try
          {
            _obj.vfuncEnter();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncEnter");
          }
        }

        _klass.enter = cast(typeof(_klass.enter))&_vfuncEnterTramp;
        break;
      }
      case "leave":
      {
        static extern(C) void _vfuncLeaveTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.leave)
              return (cast(typeof(&_vfuncLeaveTramp))_klass.leave)(button);
            return;
          }

          try
          {
            _obj.vfuncLeave();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncLeave");
          }
        }

        _klass.leave = cast(typeof(_klass.leave))&_vfuncLeaveTramp;
        break;
      }
      case "pressed":
      {
        static extern(C) void _vfuncPressedTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.pressed)
              return (cast(typeof(&_vfuncPressedTramp))_klass.pressed)(button);
            return;
          }

          try
          {
            _obj.vfuncPressed();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncPressed");
          }
        }

        _klass.pressed = cast(typeof(_klass.pressed))&_vfuncPressedTramp;
        break;
      }
      case "released":
      {
        static extern(C) void _vfuncReleasedTramp(GtkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.button.Button)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.released)
              return (cast(typeof(&_vfuncReleasedTramp))_klass.released)(button);
            return;
          }

          try
          {
            _obj.vfuncReleased();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.button.Button.vfuncReleased");
          }
        }

        _klass.released = cast(typeof(_klass.released))&_vfuncReleasedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.button.Button]
class ButtonGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T, gid.gtk3.actionable.ActionableGidBuilderImpl!T, gid.gtk3.activatable.ActivatableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();
  mixin ActivatableGidBuilderT!();

  /**
      Set `alwaysShowImage` property.
      Params:
        propval = If true, the button will ignore the #GtkSettings:gtk-button-images
          setting and always show the image, if available.
          
          Use this property if the button would be useless or hard to use
          without the image.
      Returns: Builder instance for fluent chaining
  */
  T alwaysShowImage(bool propval) nothrow
  {
    return setProperty("always-show-image", propval);
  }

  /**
      Set `image` property.
      Params:
        propval = The child widget to appear next to the button text.
      Returns: Builder instance for fluent chaining
  */
  T image(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("image", propval);
  }

  /**
      Set `imagePosition` property.
      Params:
        propval = The position of the image relative to the text inside the button.
      Returns: Builder instance for fluent chaining
  */
  T imagePosition(gid.gtk3.types.PositionType propval) nothrow
  {
    return setProperty("image-position", propval);
  }

  /** */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /** */
  T relief(gid.gtk3.types.ReliefStyle propval) nothrow
  {
    return setProperty("relief", propval);
  }

  /** */
  T useStock(bool propval) nothrow
  {
    return setProperty("use-stock", propval);
  }

  /** */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = If the child of the button is a #GtkMisc or #GtkAlignment, this property
          can be used to control its horizontal alignment. 0.0 is left aligned,
          1.0 is right aligned.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = If the child of the button is a #GtkMisc or #GtkAlignment, this property
          can be used to control its vertical alignment. 0.0 is top aligned,
          1.0 is bottom aligned.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Access the child widget directly if you need to control
        its alignment.
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }
}

/// Fluent builder for [gid.gtk3.button.Button]
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
