/// Module for [StatusIcon] class
module gtk.status_icon;

import gdk.event_button;
import gdk.event_scroll;
import gdk.rectangle;
import gdk.screen;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.tooltip;
import gtk.types;

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
    a notification area by using [gtk.status_icon.StatusIcon.isEmbedded], and gracefully
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
class StatusIcon : gobject.object.ObjectWrap
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
    return cast(void function())gtk_status_icon_get_type != &gidSymbolNotFound ? gtk_status_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StatusIcon self()
  {
    return this;
  }

  /**
      Get `embedded` property.
      Returns: true if the statusicon is embedded in a notification area.
  */
  @property bool embedded()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("embedded");
  }

  /** */
  @property void file(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("file", propval);
  }

  /**
      Get `gicon` property.
      Returns: The #GIcon displayed in the #GtkStatusIcon. For themed icons,
      the image will be updated automatically if the theme changes.
  */
  @property gio.icon.Icon gicon()
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon displayed in the #GtkStatusIcon. For themed icons,
        the image will be updated automatically if the theme changes.
  */
  @property void gicon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("gicon", propval);
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
  @property bool hasTooltip()
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
  @property void hasTooltip(bool propval)
  {
    return setHasTooltip(propval);
  }

  /** */
  @property string iconName()
  {
    return getIconName();
  }

  /** */
  @property void iconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the tray in which the statusicon
      is embedded.
  */
  @property gtk.types.Orientation orientation()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Orientation)("orientation");
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbuf()
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gdk.screen.Screen screen()
  {
    return getScreen();
  }

  /** */
  @property void screen(gdk.screen.Screen propval)
  {
    return setScreen(propval);
  }

  /** */
  @property int size()
  {
    return getSize();
  }

  /** */
  @property string stock()
  {
    return getStock();
  }

  /** */
  @property void stock(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("stock", propval);
  }

  /** */
  @property gtk.types.ImageType storageType()
  {
    return getStorageType();
  }

  /**
      Get `title` property.
      Returns: The title of this tray icon. This should be a short, human-readable,
      localized string describing the tray icon. It may be used by tools
      like screen readers to render the tray icon.
  */
  @property string title()
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
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `tooltipMarkup` property.
      Returns: Sets the text of tooltip to be the given string, which is marked up
      with the [Pango text markup language][PangoMarkupFormat].
      Also see [gtk.tooltip.Tooltip.setMarkup].
      
      This is a convenience property which will take care of getting the
      tooltip shown if the given string is not null.
      #GtkStatusIcon:has-tooltip will automatically be set to true and
      the default handler for the #GtkStatusIcon::query-tooltip signal
      will take care of displaying the tooltip.
      
      On some platforms, embedded markup will be ignored.
  */
  @property string tooltipMarkup()
  {
    return getTooltipMarkup();
  }

  /**
      Set `tooltipMarkup` property.
      Params:
        propval = Sets the text of tooltip to be the given string, which is marked up
        with the [Pango text markup language][PangoMarkupFormat].
        Also see [gtk.tooltip.Tooltip.setMarkup].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null.
        #GtkStatusIcon:has-tooltip will automatically be set to true and
        the default handler for the #GtkStatusIcon::query-tooltip signal
        will take care of displaying the tooltip.
        
        On some platforms, embedded markup will be ignored.
  */
  @property void tooltipMarkup(string propval)
  {
    return setTooltipMarkup(propval);
  }

  /**
      Get `tooltipText` property.
      Returns: Sets the text of tooltip to be the given string.
      
      Also see [gtk.tooltip.Tooltip.setText].
      
      This is a convenience property which will take care of getting the
      tooltip shown if the given string is not null.
      #GtkStatusIcon:has-tooltip will automatically be set to true and
      the default handler for the #GtkStatusIcon::query-tooltip signal
      will take care of displaying the tooltip.
      
      Note that some platforms have limitations on the length of tooltips
      that they allow on status icons, e.g. Windows only shows the first
      64 characters.
  */
  @property string tooltipText()
  {
    return getTooltipText();
  }

  /**
      Set `tooltipText` property.
      Params:
        propval = Sets the text of tooltip to be the given string.
        
        Also see [gtk.tooltip.Tooltip.setText].
        
        This is a convenience property which will take care of getting the
        tooltip shown if the given string is not null.
        #GtkStatusIcon:has-tooltip will automatically be set to true and
        the default handler for the #GtkStatusIcon::query-tooltip signal
        will take care of displaying the tooltip.
        
        Note that some platforms have limitations on the length of tooltips
        that they allow on status icons, e.g. Windows only shows the first
        64 characters.
  */
  @property void tooltipText(string propval)
  {
    return setTooltipText(propval);
  }

  /** */
  @property bool visible()
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /**
      Creates an empty status icon object.
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  this()
  {
    GtkStatusIcon* _cretval;
    _cretval = gtk_status_icon_new();
    this(_cretval, Yes.Take);
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
  static gtk.status_icon.StatusIcon newFromFile(string filename)
  {
    GtkStatusIcon* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_status_icon_new_from_file(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
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
  static gtk.status_icon.StatusIcon newFromGicon(gio.icon.Icon icon)
  {
    GtkStatusIcon* _cretval;
    _cretval = gtk_status_icon_new_from_gicon(icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
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
  static gtk.status_icon.StatusIcon newFromIconName(string iconName)
  {
    GtkStatusIcon* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_status_icon_new_from_icon_name(_iconName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
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
  static gtk.status_icon.StatusIcon newFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GtkStatusIcon* _cretval;
    _cretval = gtk_status_icon_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a status icon displaying a stock icon. Sample stock icon
      names are #GTK_STOCK_OPEN, #GTK_STOCK_QUIT. You can register your
      own stock icon names, see [gtk.icon_factory.IconFactory.addDefault] and
      [gtk.icon_factory.IconFactory.add].
  
      Params:
        stockId = a stock icon id
      Returns: a new #GtkStatusIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications
  */
  static gtk.status_icon.StatusIcon newFromStock(string stockId)
  {
    GtkStatusIcon* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_status_icon_new_from_stock(_stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.status_icon.StatusIcon)(cast(GtkStatusIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Menu positioning function to use with [gtk.menu.Menu.popup]
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
  static void positionMenu(gtk.menu.Menu menu, ref int x, ref int y, out bool pushIn, gtk.status_icon.StatusIcon userData)
  {
    gboolean _pushIn;
    gtk_status_icon_position_menu(menu ? cast(GtkMenu*)menu._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, &_pushIn, userData ? cast(GtkStatusIcon*)userData._cPtr(No.Dup) : null);
    pushIn = cast(bool)_pushIn;
  }

  /**
      Obtains information about the location of the status icon
      on screen. This information can be used to e.g. position
      popups like notification bubbles.
      
      See [gtk.status_icon.StatusIcon.positionMenu] for a more convenient
      alternative for positioning menus.
      
      Note that some platforms do not allow GTK+ to provide
      this information, and even on platforms that do allow it,
      the information is not reliable unless the status icon
      is embedded in a notification area, see
      [gtk.status_icon.StatusIcon.isEmbedded].
  
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
  bool getGeometry(out gdk.screen.Screen screen, out gdk.rectangle.Rectangle area, out gtk.types.Orientation orientation)
  {
    bool _retval;
    GdkScreen* _screen;
    GdkRectangle _area;
    _retval = cast(bool)gtk_status_icon_get_geometry(cast(GtkStatusIcon*)this._cPtr, &_screen, &_area, &orientation);
    screen = new gdk.screen.Screen(cast(void*)_screen, No.Take);
    area = new gdk.rectangle.Rectangle(cast(void*)&_area, No.Take);
    return _retval;
  }

  /**
      Retrieves the #GIcon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.Gicon] (see [gtk.status_icon.StatusIcon.getStorageType]).
      The caller of this function does not own a reference to the
      returned #GIcon.
      
      If this function fails, icon is left unchanged;
      Returns: the displayed icon, or null if the image is empty
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_status_icon_get_gicon(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
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
  bool getHasTooltip()
  {
    bool _retval;
    _retval = cast(bool)gtk_status_icon_get_has_tooltip(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the icon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.IconName] (see [gtk.status_icon.StatusIcon.getStorageType]).
      The returned string is owned by the #GtkStatusIcon and should not
      be freed or modified.
      Returns: name of the displayed icon, or null if the image is empty.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_icon_name(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GdkPixbuf being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.Pixbuf] (see [gtk.status_icon.StatusIcon.getStorageType]).
      The caller of this function does not own a reference to the
      returned pixbuf.
      Returns: the displayed pixbuf,
            or null if the image is empty.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_status_icon_get_pixbuf(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkScreen associated with status_icon.
      Returns: a #GdkScreen.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as notifications are managed by the platform
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_status_icon_get_screen(cast(GtkStatusIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size in pixels that is available for the image.
      Stock icons and named icons adapt their size automatically
      if the size of the notification area changes. For other
      storage types, the size-changed signal can be used to
      react to size changes.
      
      Note that the returned size is only meaningful while the
      status icon is embedded (see [gtk.status_icon.StatusIcon.isEmbedded]).
      Returns: the size that is available for the image
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, as the representation of a notification
          is left to the platform
  */
  int getSize()
  {
    int _retval;
    _retval = gtk_status_icon_get_size(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Gets the id of the stock icon being displayed by the #GtkStatusIcon.
      The storage type of the status icon must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.Stock] (see [gtk.status_icon.StatusIcon.getStorageType]).
      The returned string is owned by the #GtkStatusIcon and should not
      be freed or modified.
      Returns: stock id of the displayed stock icon,
          or null if the image is empty.
  
      Deprecated: Use [gtk.status_icon.StatusIcon.getIconName] instead.
  */
  string getStock()
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_stock(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the type of representation being used by the #GtkStatusIcon
      to store image data. If the #GtkStatusIcon has no image data,
      the return value will be [gtk.types.ImageType.Empty].
      Returns: the image representation being used
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function, and #GNotification only supports #GIcon
          instances
  */
  gtk.types.ImageType getStorageType()
  {
    GtkImageType _cretval;
    _cretval = gtk_status_icon_get_storage_type(cast(GtkStatusIcon*)this._cPtr);
    gtk.types.ImageType _retval = cast(gtk.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Gets the title of this tray icon. See [gtk.status_icon.StatusIcon.setTitle].
      Returns: the title of the status icon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_status_icon_get_title(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for status_icon.
      Returns: the tooltip text, or null. You should free the
          returned string with [glib.global.gfree] when done.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTooltipMarkup()
  {
    char* _cretval;
    _cretval = gtk_status_icon_get_tooltip_markup(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the tooltip for status_icon.
      Returns: the tooltip text, or null. You should free the
          returned string with [glib.global.gfree] when done.
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  string getTooltipText()
  {
    char* _cretval;
    _cretval = gtk_status_icon_get_tooltip_text(cast(GtkStatusIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether the status icon is visible or not.
      Note that being visible does not guarantee that
      the user can actually see the icon, see also
      [gtk.status_icon.StatusIcon.isEmbedded].
      Returns: true if the status icon is visible
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  bool getVisible()
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
      as [gtk.status_icon.StatusIcon.positionMenu].
      Returns: An 32 bit unsigned integer identifier for the
        underlying X11 Window
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  uint getX11WindowId()
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
  bool isEmbedded()
  {
    bool _retval;
    _retval = cast(bool)gtk_status_icon_is_embedded(cast(GtkStatusIcon*)this._cPtr);
    return _retval;
  }

  /**
      Makes status_icon display the file filename.
      See [gtk.status_icon.StatusIcon.newFromFile] for details.
  
      Params:
        filename = a filename
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gio.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromFile(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_status_icon_set_from_file(cast(GtkStatusIcon*)this._cPtr, _filename);
  }

  /**
      Makes status_icon display the #GIcon.
      See [gtk.status_icon.StatusIcon.newFromGicon] for details.
  
      Params:
        icon = a GIcon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gio.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromGicon(gio.icon.Icon icon)
  {
    gtk_status_icon_set_from_gicon(cast(GtkStatusIcon*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Makes status_icon display the icon named icon_name from the
      current icon theme.
      See [gtk.status_icon.StatusIcon.newFromIconName] for details.
  
      Params:
        iconName = an icon name
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gio.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_status_icon_set_from_icon_name(cast(GtkStatusIcon*)this._cPtr, _iconName);
  }

  /**
      Makes status_icon display pixbuf.
      See [gtk.status_icon.StatusIcon.newFromPixbuf] for details.
  
      Params:
        pixbuf = a #GdkPixbuf or null
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; you can use [gio.notification.Notification.setIcon]
          to associate a #GIcon with a notification
  */
  void setFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_status_icon_set_from_pixbuf(cast(GtkStatusIcon*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Makes status_icon display the stock icon with the id stock_id.
      See [gtk.status_icon.StatusIcon.newFromStock] for details.
  
      Params:
        stockId = a stock icon id
  
      Deprecated: Use [gtk.status_icon.StatusIcon.setFromIconName] instead.
  */
  void setFromStock(string stockId)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
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
          amount of text using [gio.notification.Notification.setBody]
  */
  void setHasTooltip(bool hasTooltip)
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
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
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
  void setScreen(gdk.screen.Screen screen)
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
          provide status notifications; you should use [gio.notification.Notification.setTitle]
          and [gio.notification.Notification.setBody] to present text inside your notification
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_status_icon_set_title(cast(GtkStatusIcon*)this._cPtr, _title);
  }

  /**
      Sets markup as the contents of the tooltip, which is marked up with
       the [Pango text markup language][PangoMarkupFormat].
      
      This function will take care of setting #GtkStatusIcon:has-tooltip to true
      and of the default handler for the #GtkStatusIcon::query-tooltip signal.
      
      See also the #GtkStatusIcon:tooltip-markup property and
      [gtk.tooltip.Tooltip.setMarkup].
  
      Params:
        markup = the contents of the tooltip for status_icon, or null
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  void setTooltipMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_status_icon_set_tooltip_markup(cast(GtkStatusIcon*)this._cPtr, _markup);
  }

  /**
      Sets text as the contents of the tooltip.
      
      This function will take care of setting #GtkStatusIcon:has-tooltip to
      true and of the default handler for the #GtkStatusIcon::query-tooltip
      signal.
      
      See also the #GtkStatusIcon:tooltip-text property and
      [gtk.tooltip.Tooltip.setText].
  
      Params:
        text = the contents of the tooltip for status_icon
  
      Deprecated: Use #GNotification and #GtkApplication to
          provide status notifications; there is no direct replacement
          for this function
  */
  void setTooltipText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
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
  void setVisible(bool visible)
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
  
          $(D void callback(gtk.status_icon.StatusIcon statusIcon))
  
          `statusIcon` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.status_icon.StatusIcon)))
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
      Connect to `ButtonPressEvent` signal.
  
      The ::button-press-event signal will be emitted when a button
      (typically from a mouse) is pressed.
      
      Whether this event is emitted is platform-dependent.  Use the ::activate
      and ::popup-menu signals in preference.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event_button.EventButton event, gtk.status_icon.StatusIcon statusIcon))
  
          `event` the #GdkEventButton which triggered
                                          this signal (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked
          for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectButtonPressEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(gdk.event_button.EventButton event, gtk.status_icon.StatusIcon statusIcon))
  
          `event` the #GdkEventButton which triggered
                                          this signal (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked
          for the event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectButtonReleaseEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_button.EventButton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
      passed as the last to arguments to [gtk.menu.Menu.popup].
      
      Unlike most G_SIGNAL_ACTION signals, this signal is meant to
      be used by applications and should be wrapped by language bindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint button, uint activateTime, gtk.status_icon.StatusIcon statusIcon))
  
          `button` the button that was pressed, or 0 if the
            signal is not emitted in response to a button press event (optional)
  
          `activateTime` the timestamp of the event that
            triggered the signal emission (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopupMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(int x, int y, bool keyboardMode, gtk.tooltip.Tooltip tooltip, gtk.status_icon.StatusIcon statusIcon))
  
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
  ulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.tooltip.Tooltip)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


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

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(gdk.event_scroll.EventScroll event, gtk.status_icon.StatusIcon statusIcon))
  
          `event` the #GdkEventScroll which triggered
                                          this signal (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_scroll.EventScroll)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(int size, gtk.status_icon.StatusIcon statusIcon))
  
          `size` the new size (optional)
  
          `statusIcon` the instance the signal is connected to (optional)
  
          `Returns` true if the icon was updated for the new
          size. Otherwise, GTK+ will scale the icon as necessary.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSizeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.status_icon.StatusIcon)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-changed", closure, after);
  }
}
