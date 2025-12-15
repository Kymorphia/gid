/// Module for [IconTheme] class
module gtk.icon_theme;

import cairo.surface;
import gdk.screen;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_info;
import gtk.types;

/**
    #GtkIconTheme provides a facility for looking up icons by name
    and size. The main reason for using a name rather than simply
    providing a filename is to allow different icons to be used
    depending on what “icon theme” is selected
    by the user. The operation of icon themes on Linux and Unix
    follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
    There is a fallback icon theme, named `hicolor`, where applications
    should install their icons, but additional icon themes can be installed
    as operating system vendors and users choose.
    
    Named icons are similar to the deprecated [Stock Items][gtkstock],
    and the distinction between the two may be a bit confusing.
    A few things to keep in mind:
    
    $(LIST
      * Stock images usually are used in conjunction with
        [Stock Items][gtkstock], such as `GTK_STOCK_OK` or
        `GTK_STOCK_OPEN`. Named icons are easier to set up and therefore
        are more useful for new icons that an application wants to
        add, such as application icons or window icons.
      
      * Stock images can only be loaded at the symbolic sizes defined
        by the #GtkIconSize enumeration, or by custom sizes defined
        by [gtk.global.iconSizeRegister], while named icons are more flexible
        and any pixel size can be specified.
      
      * Because stock images are closely tied to stock items, and thus
        to actions in the user interface, stock images may come in
        multiple variants for different widget states or writing
        directions.
    )
      
    A good rule of thumb is that if there is a stock image for what
    you want to use, use it, otherwise use a named icon. It turns
    out that internally stock images are generally defined in
    terms of one or more named icons. (An example of the
    more than one case is icons that depend on writing direction;
    `GTK_STOCK_GO_FORWARD` uses the two themed icons
    “gtk-stock-go-forward-ltr” and “gtk-stock-go-forward-rtl”.)
    
    In many cases, named themes are used indirectly, via #GtkImage
    or stock items, rather than directly, but looking up icons
    directly is also simple. The #GtkIconTheme object acts
    as a database of all the icons in the current theme. You
    can create new #GtkIconTheme objects, but it’s much more
    efficient to use the standard icon theme for the #GdkScreen
    so that the icon information is shared with other people
    looking up icons.
    ```c
    GError *error = NULL;
    GtkIconTheme *icon_theme;
    GdkPixbuf *pixbuf;
    
    icon_theme = gtk_icon_theme_get_default ();
    pixbuf = gtk_icon_theme_load_icon (icon_theme,
                                       "my-icon-name", // icon name
                                       48, // icon size
                                       0,  // flags
                                       &error);
    if (!pixbuf)
      {
        g_warning ("Couldn’t load icon: %s", error->message);
        g_error_free (error);
      }
    else
      {
        // Use the pixbuf
        g_object_unref (pixbuf);
      }
    ```
*/
class IconTheme : gobject.object.ObjectWrap
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
    return cast(void function())gtk_icon_theme_get_type != &gidSymbolNotFound ? gtk_icon_theme_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconTheme self()
  {
    return this;
  }

  /**
      Creates a new icon theme object. Icon theme objects are used
      to lookup up an icon by name in a particular icon theme.
      Usually, you’ll want to use [gtk.icon_theme.IconTheme.getDefault]
      or [gtk.icon_theme.IconTheme.getForScreen] rather than creating
      a new icon theme object for scratch.
      Returns: the newly created #GtkIconTheme object.
  */
  this()
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_new();
    this(_cretval, Yes.Take);
  }

  /**
      Registers a built-in icon for icon theme lookups. The idea
      of built-in icons is to allow an application or library
      that uses themed icons to function requiring files to
      be present in the file system. For instance, the default
      images for all of GTK+’s stock icons are registered
      as built-icons.
      
      In general, if you use [gtk.icon_theme.IconTheme.addBuiltinIcon]
      you should also install the icon in the icon theme, so
      that the icon is generally available.
      
      This function will generally be used with pixbufs loaded
      via [gdkpixbuf.pixbuf.Pixbuf.newFromInline].
  
      Params:
        iconName = the name of the icon to register
        size = the size in pixels at which to register the icon (different
              images can be registered for the same icon name at different sizes.)
        pixbuf = #GdkPixbuf that contains the image to use for icon_name
  
      Deprecated: Use [gtk.icon_theme.IconTheme.addResourcePath]
            to add application-specific icons to the icon theme.
  */
  static void addBuiltinIcon(string iconName, int size, gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_icon_theme_add_builtin_icon(_iconName, size, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Gets the icon theme for the default screen. See
      [gtk.icon_theme.IconTheme.getForScreen].
      Returns: A unique #GtkIconTheme associated with
            the default screen. This icon theme is associated with
            the screen and can be used as long as the screen
            is open. Do not ref or unref it.
  */
  static gtk.icon_theme.IconTheme getDefault()
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_theme.IconTheme)(cast(GtkIconTheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon theme object associated with screen; if this
      function has not previously been called for the given
      screen, a new icon theme object will be created and
      associated with the screen. Icon theme objects are
      fairly expensive to create, so using this function
      is usually a better choice than calling than [gtk.icon_theme.IconTheme.new_]
      and setting the screen yourself; by using this function
      a single icon theme object will be shared between users.
  
      Params:
        screen = a #GdkScreen
      Returns: A unique #GtkIconTheme associated with
         the given screen. This icon theme is associated with
         the screen and can be used as long as the screen
         is open. Do not ref or unref it.
  */
  static gtk.icon_theme.IconTheme getForScreen(gdk.screen.Screen screen)
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_get_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_theme.IconTheme)(cast(GtkIconTheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a resource path that will be looked at when looking
      for icons, similar to search paths.
      
      This function should be used to make application-specific icons
      available as part of the icon theme.
      
      The resources are considered as part of the hicolor icon theme
      and must be located in subdirectories that are defined in the
      hicolor icon theme, such as `path/16x16/actions/run.png`.
      Icons that are directly placed in the resource path instead
      of a subdirectory are also considered as ultimate fallback.
  
      Params:
        path = a resource path
  */
  void addResourcePath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_add_resource_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Appends a directory to the search path.
      See [gtk.icon_theme.IconTheme.setSearchPath].
  
      Params:
        path = directory name to append to the icon path
  */
  void appendSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_append_search_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Looks up a named icon and returns a #GtkIconInfo containing
      information such as the filename of the icon. The icon
      can then be rendered into a pixbuf using
      [gtk.icon_info.IconInfo.loadIcon]. ([gtk.icon_theme.IconTheme.loadIcon]
      combines these two steps if all you need is the pixbuf.)
      
      If icon_names contains more than one name, this function
      tries them all in the given order before falling back to
      inherited icon themes.
  
      Params:
        iconNames = null-terminated array of
              icon names to lookup
        size = desired icon size
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo object
        containing information about the icon, or null if the icon wasn’t
        found.
  */
  gtk.icon_info.IconInfo chooseIcon(string[] iconNames, int size, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    char*[] _tmpiconNames;
    foreach (s; iconNames)
      _tmpiconNames ~= s.toCString(No.Alloc);
    _tmpiconNames ~= null;
    const(char*)* _iconNames = _tmpiconNames.ptr;
    _cretval = gtk_icon_theme_choose_icon(cast(GtkIconTheme*)this._cPtr, _iconNames, size, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a named icon for a particular window scale and returns
      a #GtkIconInfo containing information such as the filename of the
      icon. The icon can then be rendered into a pixbuf using
      [gtk.icon_info.IconInfo.loadIcon]. ([gtk.icon_theme.IconTheme.loadIcon]
      combines these two steps if all you need is the pixbuf.)
      
      If icon_names contains more than one name, this function
      tries them all in the given order before falling back to
      inherited icon themes.
  
      Params:
        iconNames = null-terminated
              array of icon names to lookup
        size = desired icon size
        scale = desired scale
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo object
            containing information about the icon, or null if the
            icon wasn’t found.
  */
  gtk.icon_info.IconInfo chooseIconForScale(string[] iconNames, int size, int scale, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    char*[] _tmpiconNames;
    foreach (s; iconNames)
      _tmpiconNames ~= s.toCString(No.Alloc);
    _tmpiconNames ~= null;
    const(char*)* _iconNames = _tmpiconNames.ptr;
    _cretval = gtk_icon_theme_choose_icon_for_scale(cast(GtkIconTheme*)this._cPtr, _iconNames, size, scale, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of an icon that is representative of the
      current theme (for instance, to use when presenting
      a list of themes to the user.)
      Returns: the name of an example icon or null.
            Free with [glib.global.gfree].
  */
  string getExampleIconName()
  {
    char* _cretval;
    _cretval = gtk_icon_theme_get_example_icon_name(cast(GtkIconTheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns an array of integers describing the sizes at which
      the icon is available without scaling. A size of -1 means
      that the icon is available in a scalable format. The array
      is zero-terminated.
  
      Params:
        iconName = the name of an icon
      Returns: An newly
        allocated array describing the sizes at which the icon is
        available. The array should be freed with [glib.global.gfree] when it is no
        longer needed.
  */
  int[] getIconSizes(string iconName)
  {
    int* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_icon_theme_get_icon_sizes(cast(GtkIconTheme*)this._cPtr, _iconName);
    int[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] != 0; _cretlength++)
        break;
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the current search path. See [gtk.icon_theme.IconTheme.setSearchPath].
  
      Params:
        path = location to store a list of icon theme path directories or null.
              The stored value should be freed with [glib.global.strfreev].
  */
  void getSearchPath(out string[] path)
  {
    int _nElements;
    char** _path;
    gtk_icon_theme_get_search_path(cast(GtkIconTheme*)this._cPtr, &_path, &_nElements);
    path.length = _nElements;
    foreach (i; 0 .. _nElements)
      path[i] = _path[i].fromCString(Yes.Free);
    gFree(cast(void*)_path);
  }

  /**
      Checks whether an icon theme includes an icon
      for a particular name.
  
      Params:
        iconName = the name of an icon
      Returns: true if icon_theme includes an
         icon for icon_name.
  */
  bool hasIcon(string iconName)
  {
    bool _retval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _retval = cast(bool)gtk_icon_theme_has_icon(cast(GtkIconTheme*)this._cPtr, _iconName);
    return _retval;
  }

  /**
      Gets the list of contexts available within the current
      hierarchy of icon themes.
      See [gtk.icon_theme.IconTheme.listIcons] for details about contexts.
      Returns: a #GList list
            holding the names of all the contexts in the theme. You must first
            free each element in the list with [glib.global.gfree], then free the list
            itself with [glib.list.List.free].
  */
  string[] listContexts()
  {
    GList* _cretval;
    _cretval = gtk_icon_theme_list_contexts(cast(GtkIconTheme*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Lists the icons in the current icon theme. Only a subset
      of the icons can be listed by providing a context string.
      The set of values for the context string is system dependent,
      but will typically include such values as “Applications” and
      “MimeTypes”. Contexts are explained in the
      [Icon Theme Specification](http://www.freedesktop.org/wiki/Specifications/icon-theme-spec).
      The standard contexts are listed in the
      [Icon Naming Specification](http://www.freedesktop.org/wiki/Specifications/icon-naming-spec).
      Also see [gtk.icon_theme.IconTheme.listContexts].
  
      Params:
        context = a string identifying a particular type of
                    icon, or null to list all icons.
      Returns: a #GList list
            holding the names of all the icons in the theme. You must
            first free each element in the list with [glib.global.gfree], then
            free the list itself with [glib.list.List.free].
  */
  string[] listIcons(string context = null)
  {
    GList* _cretval;
    const(char)* _context = context.toCString(No.Alloc);
    _cretval = gtk_icon_theme_list_icons(cast(GtkIconTheme*)this._cPtr, _context);
    auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Looks up an icon in an icon theme, scales it to the given size
      and renders it into a pixbuf. This is a convenience function;
      if more details about the icon are needed, use
      [gtk.icon_theme.IconTheme.lookupIcon] followed by [gtk.icon_info.IconInfo.loadIcon].
      
      Note that you probably want to listen for icon theme changes and
      update the icon. This is usually done by connecting to the
      GtkWidget::style-set signal. If for some reason you do not want to
      update the icon when the icon theme changes, you should consider
      using [gdkpixbuf.pixbuf.Pixbuf.copy] to make a private copy of the pixbuf
      returned by this function. Otherwise GTK+ may need to keep the old
      icon theme loaded, which would be a waste of memory.
  
      Params:
        iconName = the name of the icon to lookup
        size = the desired icon size. The resulting icon may not be
              exactly this size; see [gtk.icon_info.IconInfo.loadIcon].
        flags = flags modifying the behavior of the icon lookup
      Returns: the rendered icon; this may be
            a newly created icon or a new reference to an internal icon, so
            you must not modify the icon. Use [gobject.object.ObjectWrap.unref] to release
            your reference to the icon. null if the icon isn’t found.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadIcon(string iconName, int size, gtk.types.IconLookupFlags flags)
  {
    GdkPixbuf* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_icon_theme_load_icon(cast(GtkIconTheme*)this._cPtr, _iconName, size, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up an icon in an icon theme for a particular window scale,
      scales it to the given size and renders it into a pixbuf. This is a
      convenience function; if more details about the icon are needed,
      use [gtk.icon_theme.IconTheme.lookupIcon] followed by
      [gtk.icon_info.IconInfo.loadIcon].
      
      Note that you probably want to listen for icon theme changes and
      update the icon. This is usually done by connecting to the
      GtkWidget::style-set signal. If for some reason you do not want to
      update the icon when the icon theme changes, you should consider
      using [gdkpixbuf.pixbuf.Pixbuf.copy] to make a private copy of the pixbuf
      returned by this function. Otherwise GTK+ may need to keep the old
      icon theme loaded, which would be a waste of memory.
  
      Params:
        iconName = the name of the icon to lookup
        size = the desired icon size. The resulting icon may not be
              exactly this size; see [gtk.icon_info.IconInfo.loadIcon].
        scale = desired scale
        flags = flags modifying the behavior of the icon lookup
      Returns: the rendered icon; this may be
            a newly created icon or a new reference to an internal icon, so
            you must not modify the icon. Use [gobject.object.ObjectWrap.unref] to release
            your reference to the icon. null if the icon isn’t found.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadIconForScale(string iconName, int size, int scale, gtk.types.IconLookupFlags flags)
  {
    GdkPixbuf* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_icon_theme_load_icon_for_scale(cast(GtkIconTheme*)this._cPtr, _iconName, size, scale, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up an icon in an icon theme for a particular window scale,
      scales it to the given size and renders it into a cairo surface. This is a
      convenience function; if more details about the icon are needed,
      use [gtk.icon_theme.IconTheme.lookupIcon] followed by
      [gtk.icon_info.IconInfo.loadSurface].
      
      Note that you probably want to listen for icon theme changes and
      update the icon. This is usually done by connecting to the
      GtkWidget::style-set signal.
  
      Params:
        iconName = the name of the icon to lookup
        size = the desired icon size. The resulting icon may not be
              exactly this size; see [gtk.icon_info.IconInfo.loadIcon].
        scale = desired scale
        forWindow = #GdkWindow to optimize drawing for, or null
        flags = flags modifying the behavior of the icon lookup
      Returns: the rendered icon; this may be
            a newly created icon or a new reference to an internal icon, so
            you must not modify the icon. Use [cairo.surface.Surface.destroy] to
            release your reference to the icon. null if the icon isn’t
            found.
      Throws: [ErrorWrap]
  */
  cairo.surface.Surface loadSurface(string iconName, int size, int scale, gdk.window.Window forWindow, gtk.types.IconLookupFlags flags)
  {
    cairo_surface_t* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_icon_theme_load_surface(cast(GtkIconTheme*)this._cPtr, _iconName, size, scale, forWindow ? cast(GdkWindow*)forWindow._cPtr(No.Dup) : null, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Looks up an icon and returns a #GtkIconInfo containing information
      such as the filename of the icon. The icon can then be rendered
      into a pixbuf using [gtk.icon_info.IconInfo.loadIcon].
      
      When rendering on displays with high pixel densities you should not
      use a size multiplied by the scaling factor returned by functions
      like [gdk.window.Window.getScaleFactor]. Instead, you should use
      [gtk.icon_theme.IconTheme.lookupByGiconForScale], as the assets loaded
      for a given scaling factor may be different.
  
      Params:
        icon = the #GIcon to look up
        size = desired icon size
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo containing
            information about the icon, or null if the icon wasn’t
            found. Unref with [gobject.object.ObjectWrap.unref]
  */
  gtk.icon_info.IconInfo lookupByGicon(gio.icon.Icon icon, int size, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    _cretval = gtk_icon_theme_lookup_by_gicon(cast(GtkIconTheme*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, size, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up an icon and returns a #GtkIconInfo containing information
      such as the filename of the icon. The icon can then be rendered into
      a pixbuf using [gtk.icon_info.IconInfo.loadIcon].
  
      Params:
        icon = the #GIcon to look up
        size = desired icon size
        scale = the desired scale
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo containing
            information about the icon, or null if the icon wasn’t
            found. Unref with [gobject.object.ObjectWrap.unref]
  */
  gtk.icon_info.IconInfo lookupByGiconForScale(gio.icon.Icon icon, int size, int scale, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    _cretval = gtk_icon_theme_lookup_by_gicon_for_scale(cast(GtkIconTheme*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, size, scale, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a named icon and returns a #GtkIconInfo containing
      information such as the filename of the icon. The icon
      can then be rendered into a pixbuf using
      [gtk.icon_info.IconInfo.loadIcon]. ([gtk.icon_theme.IconTheme.loadIcon]
      combines these two steps if all you need is the pixbuf.)
      
      When rendering on displays with high pixel densities you should not
      use a size multiplied by the scaling factor returned by functions
      like [gdk.window.Window.getScaleFactor]. Instead, you should use
      [gtk.icon_theme.IconTheme.lookupIconForScale], as the assets loaded
      for a given scaling factor may be different.
  
      Params:
        iconName = the name of the icon to lookup
        size = desired icon size
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo object
            containing information about the icon, or null if the
            icon wasn’t found.
  */
  gtk.icon_info.IconInfo lookupIcon(string iconName, int size, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_icon_theme_lookup_icon(cast(GtkIconTheme*)this._cPtr, _iconName, size, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a named icon for a particular window scale and returns a
      #GtkIconInfo containing information such as the filename of the
      icon. The icon can then be rendered into a pixbuf using
      [gtk.icon_info.IconInfo.loadIcon]. ([gtk.icon_theme.IconTheme.loadIcon] combines
      these two steps if all you need is the pixbuf.)
  
      Params:
        iconName = the name of the icon to lookup
        size = desired icon size
        scale = the desired scale
        flags = flags modifying the behavior of the icon lookup
      Returns: a #GtkIconInfo object
            containing information about the icon, or null if the
            icon wasn’t found.
  */
  gtk.icon_info.IconInfo lookupIconForScale(string iconName, int size, int scale, gtk.types.IconLookupFlags flags)
  {
    GtkIconInfo* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_icon_theme_lookup_icon_for_scale(cast(GtkIconTheme*)this._cPtr, _iconName, size, scale, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Prepends a directory to the search path.
      See [gtk.icon_theme.IconTheme.setSearchPath].
  
      Params:
        path = directory name to prepend to the icon path
  */
  void prependSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_prepend_search_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Checks to see if the icon theme has changed; if it has, any
      currently cached information is discarded and will be reloaded
      next time icon_theme is accessed.
      Returns: true if the icon theme has changed and needed
            to be reloaded.
  */
  bool rescanIfNeeded()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_theme_rescan_if_needed(cast(GtkIconTheme*)this._cPtr);
    return _retval;
  }

  /**
      Sets the name of the icon theme that the #GtkIconTheme object uses
      overriding system configuration. This function cannot be called
      on the icon theme objects returned from [gtk.icon_theme.IconTheme.getDefault]
      and [gtk.icon_theme.IconTheme.getForScreen].
  
      Params:
        themeName = name of icon theme to use instead of
            configured theme, or null to unset a previously set custom theme
  */
  void setCustomTheme(string themeName = null)
  {
    const(char)* _themeName = themeName.toCString(No.Alloc);
    gtk_icon_theme_set_custom_theme(cast(GtkIconTheme*)this._cPtr, _themeName);
  }

  /**
      Sets the screen for an icon theme; the screen is used
      to track the user’s currently configured icon theme,
      which might be different for different screens.
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gdk.screen.Screen screen)
  {
    gtk_icon_theme_set_screen(cast(GtkIconTheme*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Sets the search path for the icon theme object. When looking
      for an icon theme, GTK+ will search for a subdirectory of
      one or more of the directories in path with the same name
      as the icon theme containing an index.theme file. (Themes from
      multiple of the path elements are combined to allow themes to be
      extended by adding icons in the user’s home directory.)
      
      In addition if an icon found isn’t found either in the current
      icon theme or the default icon theme, and an image file with
      the right name is found directly in one of the elements of
      path, then that image will be used for the icon name.
      (This is legacy feature, and new icons should be put
      into the fallback icon theme, which is called hicolor,
      rather than directly on the icon path.)
  
      Params:
        path = array of
              directories that are searched for icon themes
  */
  void setSearchPath(string[] path)
  {
    int _nElements;
    if (path)
      _nElements = cast(int)path.length;

    const(char)*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    const(char*)* _path = _tmppath.ptr;
    gtk_icon_theme_set_search_path(cast(GtkIconTheme*)this._cPtr, _path, _nElements);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the current icon theme is switched or GTK+ detects
      that a change has occurred in the contents of the current
      icon theme.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.icon_theme.IconTheme iconTheme))
  
          `iconTheme` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.icon_theme.IconTheme)))
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
    return connectSignalClosure("changed", closure, after);
  }
}
