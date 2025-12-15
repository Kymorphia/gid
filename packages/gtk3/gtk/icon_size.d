/// Module for [IconSize] enum namespace
module gtk.icon_size;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.settings;
import gtk.types;

/// Namespace for [IconSize] enum
struct IconSize
{
  alias Enum = gtk.types.IconSize; ///

  /**
      Looks up the icon size associated with name.
  
      Params:
        name = the name to look up.
      Returns: the icon size (#GtkIconSize)
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static gtk.types.IconSize fromName(string name)
  {
    GtkIconSize _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_icon_size_from_name(_name);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Gets the canonical name of the given icon size. The returned string
      is statically allocated and should not be freed.
  
      Params:
        size = a #GtkIconSize.
      Returns: the name of the given icon size.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static string getName(gtk.types.IconSize size)
  {
    const(char)* _cretval;
    _cretval = gtk_icon_size_get_name(size);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Obtains the pixel size of a semantic icon size size:
      #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_BUTTON, etc.  This function
      isn’t normally needed, [gtk.icon_theme.IconTheme.loadIcon] is the usual
      way to get an icon for rendering, then just look at the size of
      the rendered pixbuf. The rendered pixbuf may not even correspond to
      the width/height returned by [gtk.global.iconSizeLookup], because themes
      are free to render the pixbuf however they like, including changing
      the usual size.
  
      Params:
        size = an icon size (#GtkIconSize)
        width = location to store icon width
        height = location to store icon height
      Returns: true if size was a valid size
  */
  static bool lookup(gtk.types.IconSize size, out int width, out int height)
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_size_lookup(size, cast(int*)&width, cast(int*)&height);
    return _retval;
  }

  /**
      Obtains the pixel size of a semantic icon size, possibly
      modified by user preferences for a particular
      #GtkSettings. Normally size would be
      #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_BUTTON, etc.  This function
      isn’t normally needed, [gtk.widget.Widget.renderIconPixbuf] is the usual
      way to get an icon for rendering, then just look at the size of
      the rendered pixbuf. The rendered pixbuf may not even correspond to
      the width/height returned by [gtk.global.iconSizeLookup], because themes
      are free to render the pixbuf however they like, including changing
      the usual size.
  
      Params:
        settings = a #GtkSettings object, used to determine
            which set of user preferences to used.
        size = an icon size (#GtkIconSize)
        width = location to store icon width
        height = location to store icon height
      Returns: true if size was a valid size
  
      Deprecated: Use [gtk.global.iconSizeLookup] instead.
  */
  static bool lookupForSettings(gtk.settings.Settings settings, gtk.types.IconSize size, out int width, out int height)
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_size_lookup_for_settings(settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null, size, cast(int*)&width, cast(int*)&height);
    return _retval;
  }

  /**
      Registers a new icon size, along the same lines as #GTK_ICON_SIZE_MENU,
      etc. Returns the integer value for the size.
  
      Params:
        name = name of the icon size
        width = the icon width
        height = the icon height
      Returns: integer value representing the size (#GtkIconSize)
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static gtk.types.IconSize register(string name, int width, int height)
  {
    GtkIconSize _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_icon_size_register(_name, width, height);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Registers alias as another name for target.
      So calling [gtk.global.iconSizeFromName] with alias as argument
      will return target.
  
      Params:
        alias_ = an alias for target
        target = an existing icon size (#GtkIconSize)
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static void registerAlias(string alias_, gtk.types.IconSize target)
  {
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    gtk_icon_size_register_alias(_alias_, target);
  }
}
