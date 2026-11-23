/// Module for [IconPaintable] class
module gid.gtk4.icon_paintable;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gio2.file;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.symbolic_paintable;
import gid.gtk4.symbolic_paintable_mixin;
import gid.gtk4.types;

/**
    Contains information found when looking up an icon in [gid.gtk4.icon_theme.IconTheme]
    or loading it from a file.
    
    [gid.gtk4.icon_paintable.IconPaintable] implements [gid.gdk4.paintable.Paintable] and [gid.gtk4.symbolic_paintable.SymbolicPaintable].
*/
class IconPaintable : gid.gobject2.object.ObjectWrap, gid.gdk4.paintable.Paintable, gid.gtk4.symbolic_paintable.SymbolicPaintable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_paintable_get_type != &gidSymbolNotFound ? gtk_icon_paintable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIconPaintable";
  }

  /** Returns `this`, for use in `with` statements. */
  override IconPaintable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.icon_paintable.IconPaintable]
      Returns: New builder object
  */
  static IconPaintableGidBuilder builder() nothrow
  {
    return new IconPaintableGidBuilder;
  }

  /**
      Get `file` property.
      Returns: The file representing the icon, if any.
  */
  @property gid.gio2.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Get `iconName` property.
      Returns: The icon name that was chosen during lookup.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /** */
  @property int scale() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("scale");
  }

  /** */
  @property void scale(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("scale", propval);
  }

  /** */
  @property int size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("size");
  }

  /** */
  @property void size(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  mixin PaintableT!();
  mixin SymbolicPaintableT!();

  /**
      Creates a [gid.gtk4.icon_paintable.IconPaintable] for a file with a given size and scale.
      
      The icon can then be rendered by using it as a [gid.gdk4.paintable.Paintable].
  
      Params:
        file = a [gid.gio2.file.File]
        size = desired icon size, in application pixels
        scale = the desired scale
      Returns: a [gid.gtk4.icon_paintable.IconPaintable] containing
          for the icon. Unref with [gid.gobject2.object.ObjectWrap.unref]
  */
  static gid.gtk4.icon_paintable.IconPaintable newForFile(gid.gio2.file.File file, int size, int scale) nothrow
  {
    GtkIconPaintable* _cretval;
    _cretval = gtk_icon_paintable_new_for_file(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, size, scale);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.icon_paintable.IconPaintable)(cast(GtkIconPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the [gid.gio2.file.File] that was used to load the icon.
      
      Returns null if the icon was not loaded from a file.
      Returns: the [gid.gio2.file.File] for the icon
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_icon_paintable_get_file(cast(GtkIconPaintable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the icon name being used for this icon.
      
      When an icon looked up in the icon theme was not available, the
      icon theme may use fallback icons - either those specified to
      [gid.gtk4.icon_theme.IconTheme.lookupIcon] or the always-available
      "image-missing". The icon chosen is returned by this function.
      
      If the icon was created without an icon theme, this function
      returns null.
      Returns: the themed icon-name for the
          icon, or null if its not a themed icon.
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_icon_paintable_get_icon_name(cast(GtkIconPaintable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks if the icon is symbolic or not.
      
      This currently uses only the file name and not the file contents
      for determining this. This behaviour may change in the future.
      Returns: true if the icon is symbolic, false otherwise
  */
  bool isSymbolic() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_paintable_is_symbolic(cast(GtkIconPaintable*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.icon_paintable.IconPaintable]
class IconPaintableGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gdk4.paintable.PaintableGidBuilderImpl!T, gid.gtk4.symbolic_paintable.SymbolicPaintableGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();
  mixin SymbolicPaintableGidBuilderT!();

  /**
      Set `file` property.
      Params:
        propval = The file representing the icon, if any.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gio2.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name that was chosen during lookup.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T scale(int propval) nothrow
  {
    return setProperty("scale", propval);
  }

  /** */
  T size(int propval) nothrow
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gid.gtk4.icon_paintable.IconPaintable]
final class IconPaintableGidBuilder : IconPaintableGidBuilderImpl!IconPaintableGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IconPaintable build() nothrow
  {
    return new IconPaintable(cast(void*)createGObject(IconPaintable._getGType), Yes.Take);
  }
}
