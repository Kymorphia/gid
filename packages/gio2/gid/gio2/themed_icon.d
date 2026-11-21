/// Module for [ThemedIcon] class
module gid.gio2.themed_icon;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.themed_icon.ThemedIcon] is an implementation of [gid.gio2.icon.Icon] that supports icon
    themes.
    
    [gid.gio2.themed_icon.ThemedIcon] contains a list of all of the icons present in an icon
    theme, so that icons can be looked up quickly. [gid.gio2.themed_icon.ThemedIcon] does
    not provide actual pixmaps for icons, just the icon names.
    Ideally something like `method@Gtk.IconTheme.choose_icon` should be used to
    resolve the list of names so that fallback icons work nicely with
    themes that inherit other themes.
*/
class ThemedIcon : gid.gobject2.object.ObjectWrap, gid.gio2.icon.Icon
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
    return cast(void function())g_themed_icon_get_type != &gidSymbolNotFound ? g_themed_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GThemedIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThemedIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.themed_icon.ThemedIcon]
      Returns: New builder object
  */
  static ThemedIconGidBuilder builder() nothrow
  {
    return new ThemedIconGidBuilder;
  }

  /**
      Get `names` property.
      Returns: A null-terminated array of icon names.
  */
  @property string[] names() nothrow
  {
    return getNames();
  }

  /**
      Get `useDefaultFallbacks` property.
      Returns: Whether to use the default fallbacks found by shortening the icon name
        at '-' characters. If the "names" array has more than one element,
        ignores any past the first.
        
        For example, if the icon name was "gnome-dev-cdrom-audio", the array
        would become
        ```c
        {
          "gnome-dev-cdrom-audio",
          "gnome-dev-cdrom",
          "gnome-dev",
          "gnome",
          NULL
        };
        ```
  */
  @property bool useDefaultFallbacks() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-default-fallbacks");
  }

  mixin IconT!();

  /**
      Creates a new themed icon for iconname.
  
      Params:
        iconname = a string containing an icon name.
      Returns: a new #GThemedIcon.
  */
  this(string iconname) nothrow
  {
    GIcon* _cretval;
    const(char)* _iconname = iconname.toCString!(No.Malloc, No.Nullable);
    _cretval = g_themed_icon_new(_iconname);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new themed icon for iconnames.
  
      Params:
        iconnames = an array of strings containing icon names.
      Returns: a new #GThemedIcon
  */
  static gid.gio2.themed_icon.ThemedIcon newFromNames(string[] iconnames) nothrow
  {
    GIcon* _cretval;
    int _len;
    if (iconnames)
      _len = cast(int)iconnames.length;

    auto _iconnames_arr = new char*[](iconnames.length);
    auto _iconnames = cast(char**)_iconnames_arr.ptr;
    foreach (i, s; iconnames) _iconnames[i] = s.toCString!(No.Malloc);
    _cretval = g_themed_icon_new_from_names(_iconnames, _len);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.themed_icon.ThemedIcon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new themed icon for iconname, and all the names
      that can be created by shortening iconname at '-' characters.
      
      In the following example, icon1 and icon2 are equivalent:
      ```c
      const char *names[] = {
        "gnome-dev-cdrom-audio",
        "gnome-dev-cdrom",
        "gnome-dev",
        "gnome"
      };
      
      icon1 = g_themed_icon_new_from_names (names, 4);
      icon2 = g_themed_icon_new_with_default_fallbacks ("gnome-dev-cdrom-audio");
      ```
  
      Params:
        iconname = a string containing an icon name
      Returns: a new #GThemedIcon.
  */
  static gid.gio2.themed_icon.ThemedIcon newWithDefaultFallbacks(string iconname) nothrow
  {
    GIcon* _cretval;
    const(char)* _iconname = iconname.toCString!(No.Malloc, No.Nullable);
    _cretval = g_themed_icon_new_with_default_fallbacks(_iconname);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.themed_icon.ThemedIcon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Append a name to the list of icons from within icon.
      
      Note that doing so invalidates the hash computed by prior calls
      to [gid.gio2.icon.Icon.hash].
  
      Params:
        iconname = name of icon to append to list of icons from within icon.
  */
  void appendName(string iconname) nothrow
  {
    const(char)* _iconname = iconname.toCString!(No.Malloc, No.Nullable);
    g_themed_icon_append_name(cast(GThemedIcon*)this._cPtr, _iconname);
  }

  /**
      Gets the names of icons from within icon.
      Returns: a list of icon names.
  */
  string[] getNames() nothrow
  {
    const(char*)* _cretval;
    _cretval = g_themed_icon_get_names(cast(GThemedIcon*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Prepend a name to the list of icons from within icon.
      
      Note that doing so invalidates the hash computed by prior calls
      to [gid.gio2.icon.Icon.hash].
  
      Params:
        iconname = name of icon to prepend to list of icons from within icon.
  */
  void prependName(string iconname) nothrow
  {
    const(char)* _iconname = iconname.toCString!(No.Malloc, No.Nullable);
    g_themed_icon_prepend_name(cast(GThemedIcon*)this._cPtr, _iconname);
  }
}

/// Fluent builder implementation template for [gid.gio2.themed_icon.ThemedIcon]
class ThemedIconGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();

  /**
      Set `name` property.
      Params:
        propval = The icon name.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `names` property.
      Params:
        propval = A null-terminated array of icon names.
      Returns: Builder instance for fluent chaining
  */
  T names(string[] propval) nothrow
  {
    return setProperty("names", propval);
  }

  /**
      Set `useDefaultFallbacks` property.
      Params:
        propval = Whether to use the default fallbacks found by shortening the icon name
          at '-' characters. If the "names" array has more than one element,
          ignores any past the first.
          
          For example, if the icon name was "gnome-dev-cdrom-audio", the array
          would become
          ```c
          {
            "gnome-dev-cdrom-audio",
            "gnome-dev-cdrom",
            "gnome-dev",
            "gnome",
            NULL
          };
          ```
      Returns: Builder instance for fluent chaining
  */
  T useDefaultFallbacks(bool propval) nothrow
  {
    return setProperty("use-default-fallbacks", propval);
  }
}

/// Fluent builder for [gid.gio2.themed_icon.ThemedIcon]
final class ThemedIconGidBuilder : ThemedIconGidBuilderImpl!ThemedIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThemedIcon build() nothrow
  {
    return new ThemedIcon(cast(void*)createGObject(ThemedIcon._getGType), Yes.Take);
  }
}
