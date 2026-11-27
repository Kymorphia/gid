/// Module for [StatusIcon] class
module gid.gtk3.status_icon;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.event_button;
import gid.gdk3.event_scroll;
import gid.gdk3.rectangle;
import gid.gdk3.screen;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu;
import gid.gtk3.tooltip;
import gid.gtk3.types;

/**
    The “system tray” or notification area is normally used for transient icons
    that indicate some special state. For example, a system tray icon might
    appear to tell the user that they have new mail, or have an incoming instant
    message, or something along those lines. The basic idea is that creating an
    icon in the notification area is less annoying than popping up a dialog.
    
    A #GtkStatusIcon object can be used to display an icon in a “system tray”.
    The icon can have a tooltip, and the user can interact with it by
    activating it or popping up a context menu.
    
    It is very important to notice that status icons depend on the existence
    of a notification area being available to the user; you should not use status
    icons as the only way to convey critical information regarding your application,
    as the notification area may not exist on the user's environment, or may have
    been removed. You should always check that a status icon has been embedded into
    a notification area by using [gid.gtk3.status_icon.StatusIcon.isEmbedded], and gracefully
    recover if the function returns false.
    
    On X11, the implementation follows the
    [FreeDesktop System Tray Specification](http://www.freedesktop.org/wiki/Specifications/systemtray-spec).
    Implementations of the “tray” side of this specification can
    be found e.g. in the GNOME 2 and KDE panel applications.
    
    Note that a GtkStatusIcon is not a widget, but just a #GObject. Making it a
    widget would be impractical, since the system tray on Windows doesn’t allow
    to embed arbitrary widgets.
    
    GtkStatusIcon has been deprecated in 3.14. You should consider using
    notifications or more modern platform-specific APIs instead. GLib provides
    the #GNotification API which works well with #GtkApplication on multiple
    platforms and environments, and should be the preferred mechanism to notify
    the users of transient status updates. See this [HowDoI](https://wiki.gnome.org/HowDoI/GNotification)
    for code examples.
*/
@gidGir("StatusIcon", "StatusIconClass")
class StatusIcon : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_status_icon_get_type != &gidSymbolNotFound ? gtk_status_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStatusIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.status_icon.StatusIcon]
      Returns: New builder object
  */
  static StatusIconGidBuilder builder() nothrow
  {
    return new StatusIconGidBuilder;
  }

  /**
      Get `embedded` property.
      Returns: true if the statusicon is embedded in a notification area.
  */
  @property bool embedded() nothrow
  {
    return isEmbedded();
  }

  /** */
  @property void file(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("file", propval);
  }

  /**
      Get `gicon` property.
      Returns: The #GIcon displayed in the #GtkStatusIcon. For themed icons,
        the image will be updated automatically if the theme changes.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon displayed in the #GtkStatusIcon. For themed icons,
          the image will be updated automatically if the theme changes.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("gicon", propval);
  }

  /**
      Get `hasTooltip` property.
      Returns: Enables or disables the emission of #GtkStatusIcon::query-tooltip on
        @status_icon.  A value of true indicates that @status_icon can have a
        tooltip, in this case the status icon will be queried using
        #GtkStatusIcon::query-tooltip to determine whether it will provide a
        tooltip or not.
        
        Note that setting this property to true for the first time will change
        the event masks of the windows of this status icon to include leave-notify
        and motion-notify events. This will not be undone when the property is set
        to false again.
        
        Whether this property is respected is platform dependent.
        For plain text tooltips, use #GtkStatusIcon:tooltip-text in preference.
  */
  @property bool hasTooltip() nothrow
  {
    return getHasTooltip();
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of #GtkStatusIcon::query-tooltip on
          @status_icon.  A value of true indicates that @status_icon can have a
          tooltip, in this case the status icon will be queried using
          #GtkStatusIcon::query-tooltip to determine whether it will provide a
          tooltip or not.
          
          Note that setting this property to true for the first time will change
          the event masks of the windows of this status icon to include leave-notify
          and motion-notify events. This will not be undone when the property is set
          to false again.
          
          Whether this property is respected is platform dependent.
          For plain text tooltips, use #GtkStatusIcon:tooltip-text in preference.
  */
  @property void hasTooltip(bool propval) nothrow
  {
    setHasTooltip(propval);
  }

  /** */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /** */
  @property void iconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the tray in which the statusicon
        is embedded.
  */
  @property gid.gtk3.types.Orientation orientation() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.Orientation)("orientation");
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf() nothrow
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gid.gdk3.screen.Screen screen() nothrow
  {
    return getScreen();
  }

  /** */
  @property void screen(gid.gdk3.screen.Screen propval) nothrow
  {
    setScreen(propval);
  }

  /** */
  @property int size() nothrow
  {
    return getSize();
  }

  /** */
  @property string stock() nothrow
  {
    return getStock();
  }

  /** */
  @property void stock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("stock", propval);
  }

  /** */
  @property gid.gtk3.types.ImageType storageType() nothrow
  {
    return getStorageType();
  }

  /**
      Get `title` property.
      Returns: The title of this tray icon. This should be a short, human-readable,
        localized string describing the tray icon. It may be used by tools
        like screen readers to render the tray icon.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of this tray icon. This should be a short, human-readable,
          localized string describing the tray icon. It may be used by tools
          like screen readers to render the tray icon.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null.
        #GtkStatusIcon:has-tooltip will automatically be set to true and
        the default handler for the #GtkStatusIcon::query-tooltip signal
        will take care of displaying the tooltip.
        
        On some platforms, embedded markup will be ignored.
  */
  @property string tooltipMarkup() nothrow
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null.
          #GtkStatusIcon:has-tooltip will automatically be set to true and
          the default handler for the #GtkStatusIcon::query-tooltip signal
          will take care of displaying the tooltip.
          
          On some platforms, embedded markup will be ignored.
  */
  @property void tooltipMarkup(string propval) nothrow
  {
    setTooltipMarkup(propval);
  }

  /**
      Get `tooltipText` property.
      Returns: Sets the text of tooltip to be the given string.
        
        Also see [gid.gtk4.tooltip.Tooltip.setText].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null.
        #GtkStatusIcon:has-tooltip will automatically be set to true and
        the default handler for the #GtkStatusIcon::query-tooltip signal
        will take care of displaying the tooltip.
        
        Note that some platforms have limitations on the length of tooltips
        that they allow on status icons, e.g. Windows only shows the first
        64 characters.
  */
  @property string tooltipText() nothrow
  {
    return getTooltipText();
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
          
          Also see [gid.gtk4.tooltip.Tooltip.setText].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null.
          #GtkStatusIcon:has-tooltip will automatically be set to true and
          the default handler for the #GtkStatusIcon::query-tooltip signal
          will take care of displaying the tooltip.
          
          Note that some platforms have limitations on the length of tooltips
          that they allow on status icons, e.g. Windows only shows the first
          64 characters.
  */
  @property void tooltipText(string propval) nothrow
  {
    setTooltipText(propval);
  }

  /** */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /**
      Creates an empty status icon object.
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkStatusIcon* _cretval;
      _cretval = gtk_status_icon_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a status icon displaying the file filename.
      
      The image will be scaled down to fit in the available
      space in the notification area, if necessary.
  
      Params:
        filename = a filename
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gid.gtk3.status_icon.StatusIcon newFromFile(string filename) nothrow
  {
    GtkStatusIcon* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_status_icon_new_from_file(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a status icon displaying a #GIcon. If the icon is a
      themed icon, it will be updated when the theme changes.
  
      Params:
        icon = a #GIcon
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gid.gtk3.status_icon.StatusIcon newFromGicon(gid.gio2.icon.Icon icon) nothrow
  {
    GtkStatusIcon* _cretval;
    _cretval = gtk_status_icon_new_from_gicon(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a status icon displaying an icon from the current icon theme.
      If the current icon theme is changed, the icon will be updated
      appropriately.
  
      Params:
        iconName = an icon name
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gid.gtk3.status_icon.StatusIcon newFromIconName(string iconName) nothrow
  {
    GtkStatusIcon* _cretval;
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_status_icon_new_from_icon_name(_iconName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a status icon displaying pixbuf.
      
      The image will be scaled down to fit in the available
      space in the notification area, if necessary.
  
      Params:
        pixbuf = a #GdkPixbuf
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gid.gtk3.status_icon.StatusIcon newFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    GtkStatusIcon* _cretval;
    _cretval = gtk_status_icon_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a status icon displaying a stock icon. Sample stock icon
      names are #GTK_STOCK_OPEN, #GTK_STOCK_QUIT. You can register your
      own stock icon names, see [gid.gtk3.icon_factory.IconFactory.addDefault] and
      [gid.gtk3.icon_factory.IconFactory.add].
  
      Params:
        stockId = a stock icon id
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gid.gtk3.status_icon.StatusIcon newFromStock(string stockId) nothrow
  {
    GtkStatusIcon* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_status_icon_new_from_stock(_stockId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Menu positioning function to use with [gid.gtk3.menu.Menu.popup]
      to position menu aligned to the status icon user_data.
  
      Params:
        menu = the #GtkMenu
        x = return location for the x position
        y = return location for the y position
        pushIn = whether the first menu item should be offset
                    (pushed in) to be aligned with the menu popup position
                    (only useful for GtkOptionMenu).
        userData = the status icon to position the menu on
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; notifications do not have menus,
          but can have buttons, and actions associated with each button
  */
  static void positionMenu(gid.gtk3.menu.Menu menu, ref int x, ref int y, out bool pushIn, gid.gtk3.status_icon.StatusIcon userData) nothrow
  {
    gboolean _pushIn;
    gtk_status_icon_position_menu(menu ? cast(GtkMenu*)menu._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, &_pushIn, userData ? cast(GtkStatusIcon*)userData._cPtr(No.Dup) : null);
    pushIn = cast(bool)_pushIn;
  }

  /** */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkStatusIcon*)this._cPtr);
  }

  /** */
  protected bool vfuncButtonPressEvent(gid.gdk3.event_button.EventButton event)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.buttonPressEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.buttonPressEvent(cast(GtkStatusIcon*)this._cPtr, event ? cast(GdkEventButton*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncButtonReleaseEvent(gid.gdk3.event_button.EventButton event)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.buttonReleaseEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.buttonReleaseEvent(cast(GtkStatusIcon*)this._cPtr, event ? cast(GdkEventButton*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected void vfuncPopupMenu(uint button, uint activateTime)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.popupMenu)
      return;

    _klass.popupMenu(cast(GtkStatusIcon*)this._cPtr, button, activateTime);
  }

  /** */
  protected bool vfuncQueryTooltip(int x, int y, bool keyboardMode, gid.gtk3.tooltip.Tooltip tooltip)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.queryTooltip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.queryTooltip(cast(GtkStatusIcon*)this._cPtr, x, y, keyboardMode, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncScrollEvent(gid.gdk3.event_scroll.EventScroll event)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.scrollEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.scrollEvent(cast(GtkStatusIcon*)this._cPtr, event ? cast(GdkEventScroll*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncSizeChanged(int size)
  {
    auto _klass = cast(GtkStatusIconClass*)_vfuncClass;
    if (!_klass.sizeChanged)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.sizeChanged(cast(GtkStatusIcon*)this._cPtr, size);
    return _retval;
  }

  /**
      Obtains information about the location of the status icon
      on screen. This information can be used to e.g. position
      popups like notification bubbles.
      
      See [gid.gtk3.status_icon.StatusIcon.positionMenu] for a more convenient
      alternative for positioning menus.
      
      Note that some platforms do not allow GTK+ to provide
      this information, and even on platforms that do allow it,
      the information is not reliable unless the status icon
      is embedded in a notification area, see
      [gid.gtk3.status_icon.StatusIcon.isEmbedded].
  
      Params:
        screen = return location for
                   the screen, or null if the information is not needed
        area = return location for the area occupied by
                 the status icon, or null
        orientation = return location for the
             orientation of the panel in which the status icon is embedded,
             or null. A panel at the top or bottom of the screen is
             horizontal, a panel at the left or right is vertical.
      Returns: true if the location information has
                      been filled in
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as the platform is responsible for the
          presentation of notifications
  */
  bool getGeometry(out gid.gdk3.screen.Screen screen, out gid.gdk3.rectangle.Rectangle area, out gid.gtk3.types.Orientation orientation) nothrow
  {
    bool _retval;
    GdkScreen* _screen;
    _retval = cast(bool)gtk_status_icon_get_geometry(cast(GtkStatusIcon*)this._cPtr, &_screen, cast(GdkRectangle*)&area, &orientation);
    screen = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(_screen, No.Take);
    return _retval;
  }

  /**
      Retrieves the #GIcon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.Gicon] (see [gid.gtk3.status_icon.StatusIcon.getStorageType]).
      The caller of this function does not own a reference to the
      returned #GIcon.
      
      If this function fails, icon is left unchanged;
      Returns: the displayed icon, or null if the image is empty
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_status_icon_get_gicon(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current value of the has-tooltip property.
      See #GtkStatusIcon:has-tooltip for more information.
      Returns: current value of has-tooltip on status_icon.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  bool getHasTooltip() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_status_icon_get_has_tooltip(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the icon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.IconName] (see [gid.gtk3.status_icon.StatusIcon.getStorageType]).
      The returned string is owned by the #GtkStatusIcon and should not
      be freed or modified.
      Returns: name of the displayed icon, or null if the image is empty.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_icon_name(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.Pixbuf] (see [gid.gtk3.status_icon.StatusIcon.getStorageType]).
      The caller of this function does not own a reference to the
      returned pixbuf.
      Returns: the displayed pixbuf,
            or null if the image is empty.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_status_icon_get_pixbuf(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkScreen associated with status_icon.
      Returns: a #GdkScreen.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as notifications are managed by the platform
  */
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_status_icon_get_screen(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size in pixels that is available for the image.
      Stock icons and named icons adapt their size automatically
      if the size of the notification area changes. For other
      storage types, the size-changed signal can be used to
      react to size changes.
      
      Note that the returned size is only meaningful while the
      status icon is embedded (see [gid.gtk3.status_icon.StatusIcon.isEmbedded]).
      Returns: the size that is available for the image
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as the representation of a notification
          is left to the platform
  */
  int getSize() nothrow
  {
    int _retval;
    _retval = gtk_status_icon_get_size(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Gets the id of the stock icon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.Stock] (see [gid.gtk3.status_icon.StatusIcon.getStorageType]).
      The returned string is owned by the #GtkStatusIcon and should not
      be freed or modified.
      Returns: stock id of the displayed stock icon,
          or null if the image is empty.
  
      Deprecated: Use [gid.gtk3.status_icon.StatusIcon.getIconName] instead.
  */
  string getStock() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_stock(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the type of representation being used by the #GtkStatusIcon
      to store image data. If the #GtkStatusIcon has no image data,
      the return value will be [gid.gtk4.types.ImageType.Empty].
      Returns: the image representation being used
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, and #GNotification only supports #GIcon
          instances
  */
  gid.gtk3.types.ImageType getStorageType() nothrow
  {
    GtkImageType _cretval;
    _cretval = gtk_status_icon_get_storage_type(cast(GtkStatusIcon*)this._cPtr);
    gid.gtk3.types.ImageType _retval = cast(gid.gtk3.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Gets the title of this tray icon. See [gid.gtk3.status_icon.StatusIcon.setTitle].
      Returns: the title of the status icon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_title(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for status_icon.
      Returns: the tooltip text, or null. You should free the
          returned string with [gid.glib2.global.gfree] when done.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTooltipMarkup() nothrow
  {
    char* _cretval;
    _cretval = gtk_status_icon_get_tooltip_markup(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for status_icon.
      Returns: the tooltip text, or null. You should free the
          returned string with [gid.glib2.global.gfree] when done.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTooltipText() nothrow
  {
    char* _cretval;
    _cretval = gtk_status_icon_get_tooltip_text(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns whether the status icon is visible or not.
      Note that being visible does not guarantee that
      the user can actually see the icon, see also
      [gid.gtk3.status_icon.StatusIcon.isEmbedded].
      Returns: true if the status icon is visible
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_status_icon_get_visible(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      This function is only useful on the X11/freedesktop.org platform.
      
      It returns a window ID for the widget in the underlying
      status icon implementation.  This is useful for the Galago
      notification service, which can send a window ID in the protocol
      in order for the server to position notification windows
      pointing to a status icon reliably.
      
      This function is not intended for other use cases which are
      more likely to be met by one of the non-X11 specific methods, such
      as [gid.gtk3.status_icon.StatusIcon.positionMenu].
      Returns: An 32 bit unsigned integer identifier for the
        underlying X11 Window
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  uint getX11WindowId() nothrow
  {
    uint _retval;
    _retval = gtk_status_icon_get_x11_window_id(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the status icon is embedded in a notification
      area.
      Returns: true if the status icon is embedded in
          a notification area.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  bool isEmbedded() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_status_icon_is_embedded(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Makes status_icon display the file filename.
      See [gid.gtk3.status_icon.StatusIcon.newFromFile] for details.
  
      Params:
        filename = a filename
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gid.gio2.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromFile(string filename) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_from_file(cast(GtkStatusIcon*)this._cPtr, _filename);
  }

  /**
      Makes status_icon display the #GIcon.
      See [gid.gtk3.status_icon.StatusIcon.newFromGicon] for details.
  
      Params:
        icon = a GIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gid.gio2.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromGicon(gid.gio2.icon.Icon icon) nothrow
  {
    gtk_status_icon_set_from_gicon(cast(GtkStatusIcon*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Makes status_icon display the icon named icon_name from the
      current icon theme.
      See [gid.gtk3.status_icon.StatusIcon.newFromIconName] for details.
  
      Params:
        iconName = an icon name
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gid.gio2.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_from_icon_name(cast(GtkStatusIcon*)this._cPtr, _iconName);
  }

  /**
      Makes status_icon display pixbuf.
      See [gid.gtk3.status_icon.StatusIcon.newFromPixbuf] for details.
  
      Params:
        pixbuf = a #GdkPixbuf or null
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gid.gio2.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_status_icon_set_from_pixbuf(cast(GtkStatusIcon*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Makes status_icon display the stock icon with the id stock_id.
      See [gid.gtk3.status_icon.StatusIcon.newFromStock] for details.
  
      Params:
        stockId = a stock icon id
  
      Deprecated: Use [gid.gtk3.status_icon.StatusIcon.setFromIconName] instead.
  */
  void setFromStock(string stockId) nothrow
  {
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_from_stock(cast(GtkStatusIcon*)this._cPtr, _stockId);
  }

  /**
      Sets the has-tooltip property on status_icon to has_tooltip.
      See #GtkStatusIcon:has-tooltip for more information.
  
      Params:
        hasTooltip = whether or not status_icon has a tooltip
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, but notifications can display an arbitrary
          amount of text using [gid.gio2.notification.Notification.setBody]
  */
  void setHasTooltip(bool hasTooltip) nothrow
  {
    gtk_status_icon_set_has_tooltip(cast(GtkStatusIcon*)this._cPtr, hasTooltip);
  }

  /**
      Sets the name of this tray icon.
      This should be a string identifying this icon. It is may be
      used for sorting the icons in the tray and will not be shown to
      the user.
  
      Params:
        name = the name
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as notifications are associated with a
          unique application identifier by #GApplication
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_name(cast(GtkStatusIcon*)this._cPtr, _name);
  }

  /**
      Sets the #GdkScreen where status_icon is displayed; if
      the icon is already mapped, it will be unmapped, and
      then remapped on the new screen.
  
      Params:
        screen = a #GdkScreen
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as GTK typically only has one #GdkScreen
          and notifications are managed by the platform
  */
  void setScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    gtk_status_icon_set_screen(cast(GtkStatusIcon*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Sets the title of this tray icon.
      This should be a short, human-readable, localized string
      describing the tray icon. It may be used by tools like screen
      readers to render the tray icon.
  
      Params:
        title = the title
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you should use [gid.gio2.notification.Notification.setTitle]
          and [gid.gio2.notification.Notification.setBody] to present text inside your notification
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_title(cast(GtkStatusIcon*)this._cPtr, _title);
  }

  /**
      Sets markup as the contents of the tooltip, which is marked up with
       the [Pango text markup language][PangoMarkupFormat].
      
      This function will take care of setting #GtkStatusIcon:has-tooltip to true
      and of the default handler for the #GtkStatusIcon::query-tooltip signal.
      
      See also the #GtkStatusIcon:tooltip-markup property and
      [gid.gtk4.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for status_icon, or null
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  void setTooltipMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_status_icon_set_tooltip_markup(cast(GtkStatusIcon*)this._cPtr, _markup);
  }

  /**
      Sets text as the contents of the tooltip.
      
      This function will take care of setting #GtkStatusIcon:has-tooltip to
      true and of the default handler for the #GtkStatusIcon::query-tooltip
      signal.
      
      See also the #GtkStatusIcon:tooltip-text property and
      [gid.gtk4.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for status_icon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  void setTooltipText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_status_icon_set_tooltip_text(cast(GtkStatusIcon*)this._cPtr, _text);
  }

  /**
      Shows or hides a status icon.
  
      Params:
        visible = true to show the status icon, false to hide it
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as notifications are managed by the platform
  */
  void setVisible(bool visible) nothrow
  {
    gtk_status_icon_set_visible(cast(GtkStatusIcon*)this._cPtr, visible);
  }

  /**
      Connect to `Activate` signal.
  
      Gets emitted when the user activates the status icon.
        If and how status icons can activated is platform-dependent.
        
        Unlike most G_SIGNAL_ACTION signals, this signal is meant to
        be used by applications and should be wrapped by language bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `statusIcon` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.status_icon.StatusIcon)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `ButtonPressEvent` signal.
  
      The ::button-press-event signal will be emitted when a button
        (typically from a mouse) is pressed.
        
        Whether this event is emitted is platform-dependent.  Use the ::activate
        and ::popup-menu signals in preference.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event_button.EventButton event, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `event` the #GdkEventButton which triggered
                                            this signal (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked
            for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonPressEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_button.EventButton(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.buttonPressEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-press-event", closure, after);
  }

  /**
      Connect to `ButtonReleaseEvent` signal.
  
      The ::button-release-event signal will be emitted when a button
        (typically from a mouse) is released.
        
        Whether this event is emitted is platform-dependent.  Use the ::activate
        and ::popup-menu signals in preference.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event_button.EventButton event, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `event` the #GdkEventButton which triggered
                                            this signal (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked
            for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonReleaseEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_button.EventButton(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.buttonReleaseEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-release-event", closure, after);
  }

  /**
      Connect to `PopupMenu` signal.
  
      Gets emitted when the user brings up the context menu
        of the status icon. Whether status icons can have context
        menus and how these are activated is platform-dependent.
        
        The button and activate_time parameters should be
        passed as the last to arguments to [gid.gtk3.menu.Menu.popup].
        
        Unlike most G_SIGNAL_ACTION signals, this signal is meant to
        be used by applications and should be wrapped by language bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint button, uint activateTime, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `button` the button that was pressed, or 0 if the
              signal is not emitted in response to a button press event (optional)
  
          `activateTime` the timestamp of the event that
              triggered the signal emission (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopupMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.popupMenu");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup-menu", closure, after);
  }

  /**
      Connect to `QueryTooltip` signal.
  
      Emitted when the hover timeout has expired with the
        cursor hovering above status_icon; or emitted when status_icon got
        focus in keyboard mode.
        
        Using the given coordinates, the signal handler should determine
        whether a tooltip should be shown for status_icon. If this is
        the case true should be returned, false otherwise. Note that if
        keyboard_mode is true, the values of `x` and `y` are undefined and
        should not be used.
        
        The signal handler is free to manipulate tooltip with the therefore
        destined function calls.
        
        Whether this signal is emitted is platform-dependent.
        For plain text tooltips, use #GtkStatusIcon:tooltip-text in preference.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int x, int y, bool keyboardMode, gid.gtk3.tooltip.Tooltip tooltip, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `x` the x coordinate of the cursor position where the request has been
                emitted, relative to status_icon (optional)
  
          `y` the y coordinate of the cursor position where the request has been
                emitted, relative to status_icon (optional)
  
          `keyboardMode` true if the tooltip was trigged using the keyboard (optional)
  
          `tooltip` a #GtkTooltip (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true if tooltip should be shown right now, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.tooltip.Tooltip)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.queryTooltip");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
      Connect to `ScrollEvent` signal.
  
      The ::scroll-event signal is emitted when a button in the 4 to 7
        range is pressed. Wheel mice are usually configured to generate
        button press events for buttons 4 and 5 when the wheel is turned.
        
        Whether this event is emitted is platform-dependent.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk3.event_scroll.EventScroll event, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `event` the #GdkEventScroll which triggered
                                            this signal (borrowed, only valid during the callback, use `_dup` to keep a copy) (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk3.event_scroll.EventScroll)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
      {
        auto _event = getVal!(void*)(&_paramVals[1]);
        _paramTuple[0] = _event ? new gid.gdk3.event_scroll.EventScroll(_event, null) : null;
      }

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.scrollEvent");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-event", closure, after);
  }

  /**
      Connect to `SizeChanged` signal.
  
      Gets emitted when the size available for the image
        changes, e.g. because the notification area got resized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int size, gid.gtk3.status_icon.StatusIcon statusIcon)`
  
          `size` the new size (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true if the icon was updated for the new
            size. Otherwise, GTK+ will scale the icon as necessary.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSizeChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.sizeChanged");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from StatusIcon
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.status_icon.StatusIcon), T.stringof ~ " is not derived from gid.gtk3.status_icon.StatusIcon");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncButtonPressEvent", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "button_press_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncButtonReleaseEvent", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "button_release_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopupMenu", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "popup_menu");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueryTooltip", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "query_tooltip");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncScrollEvent", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "scroll_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSizeChanged", true)[0]) == gid.gtk3.status_icon.StatusIcon))
      _installVfunc(klass, "size_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkStatusIconClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkStatusIcon* statusIcon) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(statusIcon);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "button_press_event":
      {
        static extern(C) gboolean _vfuncButtonPressEventTramp(GtkStatusIcon* statusIcon, GdkEventButton* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.buttonPressEvent)
              return (cast(typeof(&_vfuncButtonPressEventTramp))_klass.buttonPressEvent)(statusIcon, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_button.EventButton(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncButtonPressEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncButtonPressEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.buttonPressEvent = cast(typeof(_klass.buttonPressEvent))&_vfuncButtonPressEventTramp;
        break;
      }
      case "button_release_event":
      {
        static extern(C) gboolean _vfuncButtonReleaseEventTramp(GtkStatusIcon* statusIcon, GdkEventButton* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.buttonReleaseEvent)
              return (cast(typeof(&_vfuncButtonReleaseEventTramp))_klass.buttonReleaseEvent)(statusIcon, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_button.EventButton(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncButtonReleaseEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncButtonReleaseEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.buttonReleaseEvent = cast(typeof(_klass.buttonReleaseEvent))&_vfuncButtonReleaseEventTramp;
        break;
      }
      case "popup_menu":
      {
        static extern(C) void _vfuncPopupMenuTramp(GtkStatusIcon* statusIcon, uint button, uint activateTime) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.popupMenu)
              return (cast(typeof(&_vfuncPopupMenuTramp))_klass.popupMenu)(statusIcon, button, activateTime);
            return;
          }

          try
          {
            _obj.vfuncPopupMenu(button, activateTime);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncPopupMenu");
          }
        }

        _klass.popupMenu = cast(typeof(_klass.popupMenu))&_vfuncPopupMenuTramp;
        break;
      }
      case "query_tooltip":
      {
        static extern(C) gboolean _vfuncQueryTooltipTramp(GtkStatusIcon* statusIcon, int x, int y, gboolean keyboardMode, GtkTooltip* tooltip) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.queryTooltip)
              return (cast(typeof(&_vfuncQueryTooltipTramp))_klass.queryTooltip)(statusIcon, x, y, keyboardMode, tooltip);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncQueryTooltip(x, y, cast(bool)keyboardMode, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tooltip.Tooltip)(cast(void*)tooltip, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncQueryTooltip");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.queryTooltip = cast(typeof(_klass.queryTooltip))&_vfuncQueryTooltipTramp;
        break;
      }
      case "scroll_event":
      {
        static extern(C) gboolean _vfuncScrollEventTramp(GtkStatusIcon* statusIcon, GdkEventScroll* event) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.scrollEvent)
              return (cast(typeof(&_vfuncScrollEventTramp))_klass.scrollEvent)(statusIcon, event);
            return typeof(return).init;
          }

          bool _dretval;
          auto _event = event ? new gid.gdk3.event_scroll.EventScroll(cast(void*)event, null) : null;

          try
          {
            _dretval = _obj.vfuncScrollEvent(_event);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncScrollEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.scrollEvent = cast(typeof(_klass.scrollEvent))&_vfuncScrollEventTramp;
        break;
      }
      case "size_changed":
      {
        static extern(C) gboolean _vfuncSizeChangedTramp(GtkStatusIcon* statusIcon, int size) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.status_icon.StatusIcon)(cast(void*)statusIcon);
          if (!_obj)
          {
            auto _klass = cast(GtkStatusIconClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)statusIcon);
            if (_klass.sizeChanged)
              return (cast(typeof(&_vfuncSizeChangedTramp))_klass.sizeChanged)(statusIcon, size);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSizeChanged(size);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.status_icon.StatusIcon.vfuncSizeChanged");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.sizeChanged = cast(typeof(_klass.sizeChanged))&_vfuncSizeChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.status_icon.StatusIcon]
class StatusIconGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T file(string propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon displayed in the #GtkStatusIcon. For themed icons,
          the image will be updated automatically if the theme changes.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `hasTooltip` property.
      Params:
        propval = Enables or disables the emission of #GtkStatusIcon::query-tooltip on
          @status_icon.  A value of true indicates that @status_icon can have a
          tooltip, in this case the status icon will be queried using
          #GtkStatusIcon::query-tooltip to determine whether it will provide a
          tooltip or not.
          
          Note that setting this property to true for the first time will change
          the event masks of the windows of this status icon to include leave-notify
          and motion-notify events. This will not be undone when the property is set
          to false again.
          
          Whether this property is respected is platform dependent.
          For plain text tooltips, use #GtkStatusIcon:tooltip-text in preference.
      Returns: Builder instance for fluent chaining
  */
  T hasTooltip(bool propval) nothrow
  {
    return setProperty("has-tooltip", propval);
  }

  /** */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }

  /** */
  T screen(gid.gdk3.screen.Screen propval) nothrow
  {
    return setProperty("screen", propval);
  }

  /** */
  T stock(string propval) nothrow
  {
    return setProperty("stock", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of this tray icon. This should be a short, human-readable,
          localized string describing the tray icon. It may be used by tools
          like screen readers to render the tray icon.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
          with the [Pango text markup language][PangoMarkupFormat].
          Also see [gid.gtk4.tooltip.Tooltip.setMarkup].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null.
          #GtkStatusIcon:has-tooltip will automatically be set to true and
          the default handler for the #GtkStatusIcon::query-tooltip signal
          will take care of displaying the tooltip.
          
          On some platforms, embedded markup will be ignored.
      Returns: Builder instance for fluent chaining
  */
  T tooltipMarkup(string propval) nothrow
  {
    return setProperty("tooltip-markup", propval);
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
          
          Also see [gid.gtk4.tooltip.Tooltip.setText].
          
          This is a convenience property which will take care of getting the
          tooltip shown if the given string is not null.
          #GtkStatusIcon:has-tooltip will automatically be set to true and
          the default handler for the #GtkStatusIcon::query-tooltip signal
          will take care of displaying the tooltip.
          
          Note that some platforms have limitations on the length of tooltips
          that they allow on status icons, e.g. Windows only shows the first
          64 characters.
      Returns: Builder instance for fluent chaining
  */
  T tooltipText(string propval) nothrow
  {
    return setProperty("tooltip-text", propval);
  }

  /** */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }
}

/// Fluent builder for [gid.gtk3.status_icon.StatusIcon]
final class StatusIconGidBuilder : StatusIconGidBuilderImpl!StatusIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StatusIcon build() nothrow
  {
    return new StatusIcon(cast(void*)createGObject(StatusIcon._getGType), Yes.Take);
  }
}
