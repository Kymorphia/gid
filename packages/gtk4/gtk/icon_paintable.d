/// Module for [IconPaintable] class
module gtk.icon_paintable;

import gdk.paintable;
import gdk.paintable_mixin;
import gid.gid;
import gio.file;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.symbolic_paintable;
import gtk.symbolic_paintable_mixin;
import gtk.types;

/**
    Contains information found when looking up an icon in [gtk.icon_theme.IconTheme].
    
    [gtk.icon_paintable.IconPaintable] implements [gdk.paintable.Paintable].
*/
class IconPaintable : gobject.object.ObjectWrap, gdk.paintable.Paintable, gtk.symbolic_paintable.SymbolicPaintable
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
    return cast(void function())gtk_icon_paintable_get_type != &gidSymbolNotFound ? gtk_icon_paintable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconPaintable self()
  {
    return this;
  }

  mixin PaintableT!();
  mixin SymbolicPaintableT!();

  /**
      Creates a [gtk.icon_paintable.IconPaintable] for a file with a given size and scale.
      
      The icon can then be rendered by using it as a [gdk.paintable.Paintable].
  
      Params:
        file = a [gio.file.File]
        size = desired icon size
        scale = the desired scale
      Returns: a [gtk.icon_paintable.IconPaintable] containing
          for the icon. Unref with [gobject.object.ObjectWrap.unref]
  */
  static gtk.icon_paintable.IconPaintable newForFile(gio.file.File file, int size, int scale)
  {
    GtkIconPaintable* _cretval;
    _cretval = gtk_icon_paintable_new_for_file(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, size, scale);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_paintable.IconPaintable)(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the [gio.file.File] that was used to load the icon.
      
      Returns null if the icon was not loaded from a file.
      Returns: the [gio.file.File] for the icon
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_icon_paintable_get_file(cast(GtkIconPaintable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the icon name being used for this icon.
      
      When an icon looked up in the icon theme was not available, the
      icon theme may use fallback icons - either those specified to
      [gtk.icon_theme.IconTheme.lookupIcon] or the always-available
      "image-missing". The icon chosen is returned by this function.
      
      If the icon was created without an icon theme, this function
      returns null.
      Returns: the themed icon-name for the
          icon, or null if its not a themed icon.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_icon_paintable_get_icon_name(cast(GtkIconPaintable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if the icon is symbolic or not.
      
      This currently uses only the file name and not the file contents
      for determining this. This behaviour may change in the future.
      
      Note that to render a symbolic [gtk.icon_paintable.IconPaintable] properly (with
      recoloring), you have to set its icon name on a [gtk.image.Image].
      Returns: true if the icon is symbolic, false otherwise
  */
  bool isSymbolic()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_paintable_is_symbolic(cast(GtkIconPaintable*)this._cPtr);
    return _retval;
  }
}
