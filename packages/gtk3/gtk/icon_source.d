/// Module for [IconSource] class
module gtk.icon_source;

import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class IconSource : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_source_get_type != &gidSymbolNotFound ? gtk_icon_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconSource self()
  {
    return this;
  }

  /**
      Creates a new #GtkIconSource. A #GtkIconSource contains a #GdkPixbuf (or
      image filename) that serves as the base image for one or more of the
      icons in a #GtkIconSet, along with a specification for which icons in the
      icon set will be based on that pixbuf or image file. An icon set contains
      a set of icons that represent “the same” logical concept in different states,
      different global text directions, and different sizes.
      
      So for example a web browser’s “Back to Previous Page” icon might
      point in a different direction in Hebrew and in English; it might
      look different when insensitive; and it might change size depending
      on toolbar mode (small/large icons). So a single icon set would
      contain all those variants of the icon. #GtkIconSet contains a list
      of #GtkIconSource from which it can derive specific icon variants in
      the set.
      
      In the simplest case, #GtkIconSet contains one source pixbuf from
      which it derives all variants. The convenience function
      [gtk.icon_set.IconSet.newFromPixbuf] handles this case; if you only have
      one source pixbuf, just use that function.
      
      If you want to use a different base pixbuf for different icon
      variants, you create multiple icon sources, mark which variants
      they’ll be used to create, and add them to the icon set with
      [gtk.icon_set.IconSet.addSource].
      
      By default, the icon source has all parameters wildcarded. That is,
      the icon source will be used as the base icon for any desired text
      direction, widget state, or icon size.
      Returns: a new #GtkIconSource
  
      Deprecated: Use #GtkIconTheme instead.
  */
  this()
  {
    GtkIconSource* _cretval;
    _cretval = gtk_icon_source_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a copy of source; mostly useful for language bindings.
      Returns: a new #GtkIconSource
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.icon_source.IconSource copy()
  {
    GtkIconSource* _cretval;
    _cretval = gtk_icon_source_copy(cast(const(GtkIconSource)*)this._cPtr);
    auto _retval = _cretval ? new gtk.icon_source.IconSource(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtains the text direction this icon source applies to. The return
      value is only useful/meaningful if the text direction is not
      wildcarded.
      Returns: text direction this source matches
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.types.TextDirection getDirection()
  {
    GtkTextDirection _cretval;
    _cretval = gtk_icon_source_get_direction(cast(const(GtkIconSource)*)this._cPtr);
    gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Gets the value set by [gtk.icon_source.IconSource.setDirectionWildcarded].
      Returns: true if this icon source is a base for any text direction variant
  
      Deprecated: Use #GtkIconTheme instead.
  */
  bool getDirectionWildcarded()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_source_get_direction_wildcarded(cast(const(GtkIconSource)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the source filename, or null if none is set. The
      filename is not a copy, and should not be modified or expected to
      persist beyond the lifetime of the icon source.
      Returns: image filename. This string must not
        be modified or freed.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_icon_source_get_filename(cast(const(GtkIconSource)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the source icon name, or null if none is set. The
      icon_name is not a copy, and should not be modified or expected to
      persist beyond the lifetime of the icon source.
      Returns: icon name. This string must not be modified or freed.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_icon_source_get_icon_name(cast(const(GtkIconSource)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the source pixbuf, or null if none is set.
      In addition, if a filename source is in use, this
      function in some cases will return the pixbuf from
      loaded from the filename. This is, for example, true
      for the GtkIconSource passed to the #GtkStyle render_icon()
      virtual function. The reference count on the pixbuf is
      not incremented.
      Returns: source pixbuf
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_icon_source_get_pixbuf(cast(const(GtkIconSource)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the icon size this source applies to. The return value
      is only useful/meaningful if the icon size is not wildcarded.
      Returns: icon size (#GtkIconSize) this source matches.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.types.IconSize getSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_icon_source_get_size(cast(const(GtkIconSource)*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Gets the value set by [gtk.icon_source.IconSource.setSizeWildcarded].
      Returns: true if this icon source is a base for any icon size variant
  
      Deprecated: Use #GtkIconTheme instead.
  */
  bool getSizeWildcarded()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_source_get_size_wildcarded(cast(const(GtkIconSource)*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the widget state this icon source applies to. The return
      value is only useful/meaningful if the widget state is not
      wildcarded.
      Returns: widget state this source matches
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.types.StateType getState()
  {
    GtkStateType _cretval;
    _cretval = gtk_icon_source_get_state(cast(const(GtkIconSource)*)this._cPtr);
    gtk.types.StateType _retval = cast(gtk.types.StateType)_cretval;
    return _retval;
  }

  /**
      Gets the value set by [gtk.icon_source.IconSource.setStateWildcarded].
      Returns: true if this icon source is a base for any widget state variant
  
      Deprecated: Use #GtkIconTheme instead.
  */
  bool getStateWildcarded()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_source_get_state_wildcarded(cast(const(GtkIconSource)*)this._cPtr);
    return _retval;
  }

  /**
      Sets the text direction this icon source is intended to be used
      with.
      
      Setting the text direction on an icon source makes no difference
      if the text direction is wildcarded. Therefore, you should usually
      call [gtk.icon_source.IconSource.setDirectionWildcarded] to un-wildcard it
      in addition to calling this function.
  
      Params:
        direction = text direction this source applies to
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setDirection(gtk.types.TextDirection direction)
  {
    gtk_icon_source_set_direction(cast(GtkIconSource*)this._cPtr, direction);
  }

  /**
      If the text direction is wildcarded, this source can be used
      as the base image for an icon in any #GtkTextDirection.
      If the text direction is not wildcarded, then the
      text direction the icon source applies to should be set
      with [gtk.icon_source.IconSource.setDirection], and the icon source
      will only be used with that text direction.
      
      #GtkIconSet prefers non-wildcarded sources (exact matches) over
      wildcarded sources, and will use an exact match when possible.
  
      Params:
        setting = true to wildcard the text direction
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setDirectionWildcarded(bool setting)
  {
    gtk_icon_source_set_direction_wildcarded(cast(GtkIconSource*)this._cPtr, setting);
  }

  /**
      Sets the name of an image file to use as a base image when creating
      icon variants for #GtkIconSet. The filename must be absolute.
  
      Params:
        filename = image file to use
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_icon_source_set_filename(cast(GtkIconSource*)this._cPtr, _filename);
  }

  /**
      Sets the name of an icon to look up in the current icon theme
      to use as a base image when creating icon variants for #GtkIconSet.
  
      Params:
        iconName = name of icon to use
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_icon_source_set_icon_name(cast(GtkIconSource*)this._cPtr, _iconName);
  }

  /**
      Sets a pixbuf to use as a base image when creating icon variants
      for #GtkIconSet.
  
      Params:
        pixbuf = pixbuf to use as a source
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_icon_source_set_pixbuf(cast(GtkIconSource*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon size this icon source is intended to be used
      with.
      
      Setting the icon size on an icon source makes no difference
      if the size is wildcarded. Therefore, you should usually
      call [gtk.icon_source.IconSource.setSizeWildcarded] to un-wildcard it
      in addition to calling this function.
  
      Params:
        size = icon size (#GtkIconSize) this source applies to
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setSize(gtk.types.IconSize size)
  {
    gtk_icon_source_set_size(cast(GtkIconSource*)this._cPtr, size);
  }

  /**
      If the icon size is wildcarded, this source can be used as the base
      image for an icon of any size.  If the size is not wildcarded, then
      the size the source applies to should be set with
      [gtk.icon_source.IconSource.setSize] and the icon source will only be used
      with that specific size.
      
      #GtkIconSet prefers non-wildcarded sources (exact matches) over
      wildcarded sources, and will use an exact match when possible.
      
      #GtkIconSet will normally scale wildcarded source images to produce
      an appropriate icon at a given size, but will not change the size
      of source images that match exactly.
  
      Params:
        setting = true to wildcard the widget state
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setSizeWildcarded(bool setting)
  {
    gtk_icon_source_set_size_wildcarded(cast(GtkIconSource*)this._cPtr, setting);
  }

  /**
      Sets the widget state this icon source is intended to be used
      with.
      
      Setting the widget state on an icon source makes no difference
      if the state is wildcarded. Therefore, you should usually
      call [gtk.icon_source.IconSource.setStateWildcarded] to un-wildcard it
      in addition to calling this function.
  
      Params:
        state = widget state this source applies to
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setState(gtk.types.StateType state)
  {
    gtk_icon_source_set_state(cast(GtkIconSource*)this._cPtr, state);
  }

  /**
      If the widget state is wildcarded, this source can be used as the
      base image for an icon in any #GtkStateType.  If the widget state
      is not wildcarded, then the state the source applies to should be
      set with [gtk.icon_source.IconSource.setState] and the icon source will
      only be used with that specific state.
      
      #GtkIconSet prefers non-wildcarded sources (exact matches) over
      wildcarded sources, and will use an exact match when possible.
      
      #GtkIconSet will normally transform wildcarded source images to
      produce an appropriate icon for a given state, for example
      lightening an image on prelight, but will not modify source images
      that match exactly.
  
      Params:
        setting = true to wildcard the widget state
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void setStateWildcarded(bool setting)
  {
    gtk_icon_source_set_state_wildcarded(cast(GtkIconSource*)this._cPtr, setting);
  }
}
