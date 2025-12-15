/// Module for [IconTheme] class
module gtk.icon_theme;

import gdk.display;
import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_paintable;
import gtk.types;

/**
    [gtk.icon_theme.IconTheme] provides a facility for loading themed icons.
    
    The main reason for using a name rather than simply providing a filename
    is to allow different icons to be used depending on what “icon theme” is
    selected by the user. The operation of icon themes on Linux and Unix
    follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
    There is a fallback icon theme, named `hicolor`, where applications
    should install their icons, but additional icon themes can be installed
    as operating system vendors and users choose.
    
    In many cases, named themes are used indirectly, via [gtk.image.Image]
    rather than directly, but looking up icons directly is also simple. The
    [gtk.icon_theme.IconTheme] object acts as a database of all the icons in the current
    theme. You can create new [gtk.icon_theme.IconTheme] objects, but it’s much more
    efficient to use the standard icon theme of the [gtk.widget.Widget] so that the
    icon information is shared with other people looking up icons.
    
    ```c
    GtkIconTheme *icon_theme;
    GtkIconPaintable *icon;
    GdkPaintable *paintable;
    
    icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display (my_widget));
    icon = gtk_icon_theme_lookup_icon (icon_theme,
                                       "my-icon-name", // icon name
                                       48, // icon size
                                       1,  // scale
                                       0,  // flags);
    paintable = GDK_PAINTABLE (icon);
    // Use the paintable
    g_object_unref (icon);
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
      Get `display` property.
      Returns: The display that this icon theme object is attached to.
  */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /**
      Set `display` property.
      Params:
        propval = The display that this icon theme object is attached to.
  */
  @property void display(gdk.display.Display propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.display.Display)("display", propval);
  }

  /**
      Get `themeName` property.
      Returns: The name of the icon theme that is being used.
      
      Unless set to a different value, this will be the value of
      the `GtkSettings:gtk-icon-theme-name` property of the [gtk.settings.Settings]
      object associated to the display of the icontheme object.
  */
  @property string themeName()
  {
    return getThemeName();
  }

  /**
      Set `themeName` property.
      Params:
        propval = The name of the icon theme that is being used.
        
        Unless set to a different value, this will be the value of
        the `GtkSettings:gtk-icon-theme-name` property of the [gtk.settings.Settings]
        object associated to the display of the icontheme object.
  */
  @property void themeName(string propval)
  {
    return setThemeName(propval);
  }

  /**
      Creates a new icon theme object.
      
      Icon theme objects are used to lookup up an icon by name
      in a particular icon theme. Usually, you’ll want to use
      [gtk.icon_theme.IconTheme.getForDisplay] rather than creating
      a new icon theme object for scratch.
      Returns: the newly created [gtk.icon_theme.IconTheme] object.
  */
  this()
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the icon theme object associated with display.
      
      If this function has not previously been called for the given
      display, a new icon theme object will be created and associated
      with the display. Icon theme objects are fairly expensive to create,
      so using this function is usually a better choice than calling
      [gtk.icon_theme.IconTheme.new_] and setting the display yourself; by using
      this function a single icon theme object will be shared between users.
  
      Params:
        display = a [gdk.display.Display]
      Returns: A unique [gtk.icon_theme.IconTheme] associated with
          the given display. This icon theme is associated with the display
          and can be used as long as the display is open. Do not ref or unref it.
  */
  static gtk.icon_theme.IconTheme getForDisplay(gdk.display.Display display)
  {
    GtkIconTheme* _cretval;
    _cretval = gtk_icon_theme_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_theme.IconTheme)(cast(GtkIconTheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a resource path that will be looked at when looking
      for icons, similar to search paths.
      
      See [gtk.icon_theme.IconTheme.setResourcePath].
      
      This function should be used to make application-specific icons
      available as part of the icon theme.
  
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
  void addSearchPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    gtk_icon_theme_add_search_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Returns the display that the [gtk.icon_theme.IconTheme] object was
      created for.
      Returns: the display of icon_theme
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_icon_theme_get_display(cast(GtkIconTheme*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Lists the names of icons in the current icon theme.
      Returns: a string array
          holding the names of all the icons in the theme. You must
          free the array using [glib.global.strfreev].
  */
  string[] getIconNames()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_icon_names(cast(GtkIconTheme*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns an array of integers describing the sizes at which
      the icon is available without scaling.
      
      A size of -1 means that the icon is available in a scalable
      format. The array is zero-terminated.
  
      Params:
        iconName = the name of an icon
      Returns: A newly
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
      Gets the current resource path.
      
      See [gtk.icon_theme.IconTheme.setResourcePath].
      Returns: A list of resource paths
  */
  string[] getResourcePath()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_resource_path(cast(GtkIconTheme*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the current search path.
      
      See [gtk.icon_theme.IconTheme.setSearchPath].
      Returns: a list of icon theme path directories
  */
  string[] getSearchPath()
  {
    char** _cretval;
    _cretval = gtk_icon_theme_get_search_path(cast(GtkIconTheme*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the current icon theme name.
      
      Returns (transfer full): the current icon theme name,
      Returns: 
  */
  string getThemeName()
  {
    char* _cretval;
    _cretval = gtk_icon_theme_get_theme_name(cast(GtkIconTheme*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks whether an icon theme includes an icon
      for a particular [gio.icon.Icon].
  
      Params:
        gicon = a [gio.icon.Icon]
      Returns: true if self includes an icon for gicon
  */
  bool hasGicon(gio.icon.Icon gicon)
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_theme_has_gicon(cast(GtkIconTheme*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether an icon theme includes an icon
      for a particular name.
  
      Params:
        iconName = the name of an icon
      Returns: true if self includes an
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
      Looks up a icon for a desired size and window scale.
      
      The icon can then be rendered by using it as a [gdk.paintable.Paintable],
      or you can get information such as the filename and size.
  
      Params:
        icon = the [gio.icon.Icon] to look up
        size = desired icon size
        scale = the desired scale
        direction = text direction the icon will be displayed in
        flags = flags modifying the behavior of the icon lookup
      Returns: a [gtk.icon_paintable.IconPaintable] containing
          information about the icon. Unref with [gobject.object.ObjectWrap.unref]
  */
  gtk.icon_paintable.IconPaintable lookupByGicon(gio.icon.Icon icon, int size, int scale, gtk.types.TextDirection direction, gtk.types.IconLookupFlags flags)
  {
    GtkIconPaintable* _cretval;
    _cretval = gtk_icon_theme_lookup_by_gicon(cast(GtkIconTheme*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null, size, scale, direction, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_paintable.IconPaintable)(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a named icon for a desired size and window scale,
      returning a [gtk.icon_paintable.IconPaintable].
      
      The icon can then be rendered by using it as a [gdk.paintable.Paintable],
      or you can get information such as the filename and size.
      
      If the available icon_name is not available and fallbacks are
      provided, they will be tried in order.
      
      If no matching icon is found, then a paintable that renders the
      "missing icon" icon is returned. If you need to do something else
      for missing icons you need to use [gtk.icon_theme.IconTheme.hasIcon].
      
      Note that you probably want to listen for icon theme changes and
      update the icon. This is usually done by overriding the
      GtkWidgetClass.css-changed() function.
  
      Params:
        iconName = the name of the icon to lookup
        fallbacks = 
        size = desired icon size.
        scale = the window scale this will be displayed on
        direction = text direction the icon will be displayed in
        flags = flags modifying the behavior of the icon lookup
      Returns: a [gtk.icon_paintable.IconPaintable] object
          containing the icon.
  */
  gtk.icon_paintable.IconPaintable lookupIcon(string iconName, string[] fallbacks, int size, int scale, gtk.types.TextDirection direction, gtk.types.IconLookupFlags flags)
  {
    GtkIconPaintable* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    char*[] _tmpfallbacks;
    foreach (s; fallbacks)
      _tmpfallbacks ~= s.toCString(No.Alloc);
    _tmpfallbacks ~= null;
    const(char*)* _fallbacks = _tmpfallbacks.ptr;
    _cretval = gtk_icon_theme_lookup_icon(cast(GtkIconTheme*)this._cPtr, _iconName, _fallbacks, size, scale, direction, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_paintable.IconPaintable)(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the resource paths that will be looked at when
      looking for icons, similar to search paths.
      
      The resources are considered as part of the hicolor icon theme
      and must be located in subdirectories that are defined in the
      hicolor icon theme, such as `path/16x16/actions/run.png`
      or `path/scalable/actions/run.svg`.
      
      Icons that are directly placed in the resource path instead
      of a subdirectory are also considered as ultimate fallback,
      but they are treated like unthemed icons.
  
      Params:
        path = NULL-terminated array of resource paths
            that are searched for icons
  */
  void setResourcePath(string[] path = null)
  {
    const(char)*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    _tmppath ~= null;
    const(char*)* _path = _tmppath.ptr;
    gtk_icon_theme_set_resource_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Sets the search path for the icon theme object.
      
      When looking for an icon theme, GTK will search for a subdirectory
      of one or more of the directories in path with the same name
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
        path = NULL-terminated
            array of directories that are searched for icon themes
  */
  void setSearchPath(string[] path = null)
  {
    const(char)*[] _tmppath;
    foreach (s; path)
      _tmppath ~= s.toCString(No.Alloc);
    _tmppath ~= null;
    const(char*)* _path = _tmppath.ptr;
    gtk_icon_theme_set_search_path(cast(GtkIconTheme*)this._cPtr, _path);
  }

  /**
      Sets the name of the icon theme that the [gtk.icon_theme.IconTheme] object uses
      overriding system configuration.
      
      This function cannot be called on the icon theme objects returned
      from [gtk.icon_theme.IconTheme.getForDisplay].
  
      Params:
        themeName = name of icon theme to use instead of
            configured theme, or null to unset a previously set custom theme
  */
  void setThemeName(string themeName = null)
  {
    const(char)* _themeName = themeName.toCString(No.Alloc);
    gtk_icon_theme_set_theme_name(cast(GtkIconTheme*)this._cPtr, _themeName);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the icon theme changes.
      
      This can happen because current icon theme is switched or
      because GTK detects that a change has occurred in the
      contents of the current icon theme.
  
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
