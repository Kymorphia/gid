/// Module for [Image] class
module gid.gtk4.image;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Displays an image.
    
    <picture>
      <source srcset="image-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkImage" src="image.png">
    </picture>
    
    Various kinds of object can be displayed as an image; most typically,
    you would load a [gid.gdk4.texture.Texture] from a file, using the convenience function
    [gid.gtk4.image.Image.newFromFile], for instance:
    
    ```c
    GtkWidget *image = gtk_image_new_from_file ("myfile.png");
    ```
    
    If the file isn’t loaded successfully, the image will contain a
    “broken image” icon similar to that used in many web browsers.
    
    If you want to handle errors in loading the file yourself, for example
    by displaying an error message, then load the image with an image
    loading framework such as libglycin, then create the [gid.gtk4.image.Image] with
    [gid.gtk4.image.Image.newFromPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gid.gio2.resource.Resource] inside
    GIO, for details. In this case, [gid.gtk4.image.Image.resource],
    [gid.gtk4.image.Image.newFromResource], and [gid.gtk4.image.Image.setFromResource]
    should be used.
    
    [gid.gtk4.image.Image] displays its image as an icon, with a size that is determined
    by the application. See [gid.gtk4.picture.Picture] if you want to show an image
    at is actual size.
    
    ## CSS nodes
    
    [gid.gtk4.image.Image] has a single CSS node with the name `image`. The style classes
    `.normal-icons` or `.large-icons` may appear, depending on the
    [gid.gtk4.image.Image.iconSize] property.
    
    ## Accessibility
    
    [gid.gtk4.image.Image] uses the [gid.gtk4.types.AccessibleRole.Img] role.
*/
class Image : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_image_get_type != &gidSymbolNotFound ? gtk_image_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkImage";
  }

  /** Returns `this`, for use in `with` statements. */
  override Image self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.image.Image]
      Returns: New builder object
  */
  static ImageGidBuilder builder() nothrow
  {
    return new ImageGidBuilder;
  }

  /**
      Get `file` property.
      Returns: A path to the file to display.
  */
  @property string file() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("file");
  }

  /**
      Set `file` property.
      Params:
        propval = A path to the file to display.
  */
  @property void file(string propval) nothrow
  {
    setFromFile(propval);
  }

  /**
      Get `gicon` property.
      Returns: The [gid.gio2.icon.Icon] displayed in the GtkImage.
        
        For themed icons, If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = The [gid.gio2.icon.Icon] displayed in the GtkImage.
          
          For themed icons, If the icon theme is changed, the image will be updated
          automatically.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    setFromGicon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon in the icon theme.
        
        If the icon theme is changed, the image will be updated automatically.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon in the icon theme.
          
          If the icon theme is changed, the image will be updated automatically.
  */
  @property void iconName(string propval) nothrow
  {
    setFromIconName(propval);
  }

  /**
      Get `iconSize` property.
      Returns: The symbolic size to display icons at.
  */
  @property gid.gtk4.types.IconSize iconSize() nothrow
  {
    return getIconSize();
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The symbolic size to display icons at.
  */
  @property void iconSize(gid.gtk4.types.IconSize propval) nothrow
  {
    setIconSize(propval);
  }

  /**
      Get `paintable` property.
      Returns: The [gid.gdk4.paintable.Paintable] to display.
  */
  @property gid.gdk4.paintable.Paintable paintable() nothrow
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gid.gdk4.paintable.Paintable] to display.
  */
  @property void paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    setFromPaintable(propval);
  }

  /**
      Get `pixelSize` property.
      Returns: The size in pixels to display icons at.
        
        If set to a value != -1, this property overrides the
        [gid.gtk4.image.Image.iconSize] property for images of type
        [gid.gtk4.types.ImageType.IconName].
  */
  @property int pixelSize() nothrow
  {
    return getPixelSize();
  }

  /**
      Set `pixelSize` property.
      Params:
        propval = The size in pixels to display icons at.
          
          If set to a value != -1, this property overrides the
          [gid.gtk4.image.Image.iconSize] property for images of type
          [gid.gtk4.types.ImageType.IconName].
  */
  @property void pixelSize(int propval) nothrow
  {
    setPixelSize(propval);
  }

  /**
      Get `resource` property.
      Returns: A path to a resource file to display.
  */
  @property string resource() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("resource");
  }

  /**
      Set `resource` property.
      Params:
        propval = A path to a resource file to display.
  */
  @property void resource(string propval) nothrow
  {
    setFromResource(propval);
  }

  /**
      Get `storageType` property.
      Returns: The representation being used for image data.
  */
  @property gid.gtk4.types.ImageType storageType() nothrow
  {
    return getStorageType();
  }

  /**
      Get `useFallback` property.
      Returns: Whether the icon displayed in the [gid.gtk4.image.Image] will use
        standard icon names fallback.
        
        The value of this property is only relevant for images of type
        [gid.gtk4.types.ImageType.IconName] and [gid.gtk4.types.ImageType.Gicon].
  */
  @property bool useFallback() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-fallback");
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Whether the icon displayed in the [gid.gtk4.image.Image] will use
          standard icon names fallback.
          
          The value of this property is only relevant for images of type
          [gid.gtk4.types.ImageType.IconName] and [gid.gtk4.types.ImageType.Gicon].
  */
  @property void useFallback(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-fallback", propval);
  }

  /**
      Creates a new empty [gid.gtk4.image.Image] widget.
      Returns: a newly created [gid.gtk4.image.Image] widget.
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
      _cretval = gtk_image_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new [gid.gtk4.image.Image] displaying the file filename.
      
      If the file isn’t found or can’t be loaded, the resulting [gid.gtk4.image.Image]
      will display a “broken image” icon. This function never returns null,
      it always returns a valid [gid.gtk4.image.Image] widget.
      
      If you need to detect failures to load the file, use an
      image loading framework such as libglycin to load the file
      yourself, then create the [gid.gtk4.image.Image] from the texture.
      
      The storage type (see [gid.gtk4.image.Image.getStorageType])
      of the returned image is not defined, it will be whatever
      is appropriate for displaying the file.
  
      Params:
        filename = a filename
      Returns: a new [gid.gtk4.image.Image]
  */
  static gid.gtk4.image.Image newFromFile(string filename) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_image_new_from_file(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.image.Image] displaying an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        icon = an icon
      Returns: a new [gid.gtk4.image.Image] displaying the themed icon
  */
  static gid.gtk4.image.Image newFromGicon(gid.gio2.icon.Icon icon) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_gicon(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.image.Image] displaying an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        iconName = an icon name
      Returns: a new [gid.gtk4.image.Image] displaying the themed icon
  */
  static gid.gtk4.image.Image newFromIconName(string iconName = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_image_new_from_icon_name(_iconName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.image.Image] displaying paintable.
      
      The [gid.gtk4.image.Image] does not assume a reference to the paintable; you still
      need to unref it if you own references. [gid.gtk4.image.Image] will add its own
      reference rather than adopting yours.
      
      The [gid.gtk4.image.Image] will track changes to the paintable and update
      its size and contents in response to it.
      
      Note that paintables are still subject to the icon size that is
      set on the image. If you want to display a paintable at its intrinsic
      size, use [gid.gtk4.picture.Picture] instead.
      
      If paintable is a [gid.gtk4.symbolic_paintable.SymbolicPaintable], then it will be
      recolored with the symbolic palette from the theme.
  
      Params:
        paintable = a [gid.gdk4.paintable.Paintable]
      Returns: a new [gid.gtk4.image.Image]
  */
  static gid.gtk4.image.Image newFromPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_paintable(paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.image.Image] displaying pixbuf.
      
      The [gid.gtk4.image.Image] does not assume a reference to the pixbuf; you still
      need to unref it if you own references. [gid.gtk4.image.Image] will add its own
      reference rather than adopting yours.
      
      This is a helper for [gid.gtk4.image.Image.newFromPaintable], and you can't
      get back the exact pixbuf once this is called, only a texture.
      
      Note that this function just creates an [gid.gtk4.image.Image] from the pixbuf.
      The [gid.gtk4.image.Image] created will not react to state changes. Should you
      want that, you should use [gid.gtk4.image.Image.newFromIconName].
  
      Params:
        pixbuf = a [gid.gdkpixbuf2.pixbuf.Pixbuf]
      Returns: a new [gid.gtk4.image.Image]
  
      Deprecated: Use [gid.gtk4.image.Image.newFromPaintable] and
          [gid.gdk4.texture.Texture.newForPixbuf] instead
  */
  static gid.gtk4.image.Image newFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.image.Image] displaying the resource file resource_path.
      
      If the file isn’t found or can’t be loaded, the resulting [gid.gtk4.image.Image] will
      display a “broken image” icon. This function never returns null,
      it always returns a valid [gid.gtk4.image.Image] widget.
      
      If you need to detect failures to load the file, use an
      image loading framework such as libglycin to load the file
      yourself, then create the [gid.gtk4.image.Image] from the texture.
      
      The storage type (see [gid.gtk4.image.Image.getStorageType]) of
      the returned image is not defined, it will be whatever is
      appropriate for displaying the file.
  
      Params:
        resourcePath = a resource path
      Returns: a new [gid.gtk4.image.Image]
  */
  static gid.gtk4.image.Image newFromResource(string resourcePath) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_image_new_from_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Resets the image to be empty.
  */
  void clear() nothrow
  {
    gtk_image_clear(cast(GtkImage*)this._cPtr);
  }

  /**
      Gets the [gid.gio2.icon.Icon] being displayed by the [gid.gtk4.image.Image].
      
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.Gicon] (see [gid.gtk4.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned [gid.gio2.icon.Icon].
      Returns: a [gid.gio2.icon.Icon]
  */
  gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_image_get_gicon(cast(GtkImage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name and size being displayed by the [gid.gtk4.image.Image].
      
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.IconName] (see [gid.gtk4.image.Image.getStorageType]).
      The returned string is owned by the [gid.gtk4.image.Image] and should not
      be freed.
      Returns: the icon name
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_image_get_icon_name(cast(GtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the icon size used by the image when rendering icons.
      Returns: the image size used by icons
  */
  gid.gtk4.types.IconSize getIconSize() nothrow
  {
    GtkIconSize _cretval;
    _cretval = gtk_image_get_icon_size(cast(GtkImage*)this._cPtr);
    gid.gtk4.types.IconSize _retval = cast(gid.gtk4.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Gets the image [gid.gdk4.paintable.Paintable] being displayed by the [gid.gtk4.image.Image].
      
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.Paintable] (see [gid.gtk4.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned paintable.
      Returns: the displayed paintable
  */
  gid.gdk4.paintable.Paintable getPaintable() nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gtk_image_get_paintable(cast(GtkImage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the pixel size used for named icons.
      Returns: the pixel size used for named icons.
  */
  int getPixelSize() nothrow
  {
    int _retval;
    _retval = gtk_image_get_pixel_size(cast(GtkImage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of representation being used by the [gid.gtk4.image.Image]
      to store image data.
      
      If the [gid.gtk4.image.Image] has no image data, the return value will
      be [gid.gtk4.types.ImageType.Empty].
      Returns: image representation being used
  */
  gid.gtk4.types.ImageType getStorageType() nothrow
  {
    GtkImageType _cretval;
    _cretval = gtk_image_get_storage_type(cast(GtkImage*)this._cPtr);
    gid.gtk4.types.ImageType _retval = cast(gid.gtk4.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a file.
      
      See [gid.gtk4.image.Image.newFromFile] for details.
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture], and then use
          [gid.gtk4.image.Image.setFromPaintable].
  
      Params:
        filename = a filename
  */
  void setFromFile(string filename = null) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_file(cast(GtkImage*)this._cPtr, _filename);
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a [gid.gio2.icon.Icon].
      
      See [gid.gtk4.image.Image.newFromGicon] for details.
  
      Params:
        icon = an icon
  */
  void setFromGicon(gid.gio2.icon.Icon icon) nothrow
  {
    gtk_image_set_from_gicon(cast(GtkImage*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a named icon.
      
      See [gid.gtk4.image.Image.newFromIconName] for details.
  
      Params:
        iconName = an icon name
  */
  void setFromIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_icon_name(cast(GtkImage*)this._cPtr, _iconName);
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a [gid.gdk4.paintable.Paintable].
      
      See [gid.gtk4.image.Image.newFromPaintable] for details.
  
      Params:
        paintable = a [gid.gdk4.paintable.Paintable]
  */
  void setFromPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    gtk_image_set_from_paintable(cast(GtkImage*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a [gid.gdkpixbuf2.pixbuf.Pixbuf].
      
      See [gid.gtk4.image.Image.newFromPixbuf] for details.
      
      Note: This is a helper for [gid.gtk4.image.Image.setFromPaintable],
      and you can't get back the exact pixbuf once this is called,
      only a paintable.
  
      Params:
        pixbuf = a [gid.gdkpixbuf2.pixbuf.Pixbuf] or `NULL`
  
      Deprecated: Use [gid.gtk4.image.Image.setFromPaintable] instead
  */
  void setFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_image_set_from_pixbuf(cast(GtkImage*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gid.gtk4.image.Image] to show a resource.
      
      See [gid.gtk4.image.Image.newFromResource] for details.
  
      Params:
        resourcePath = a resource path
  */
  void setFromResource(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_resource(cast(GtkImage*)this._cPtr, _resourcePath);
  }

  /**
      Suggests an icon size to the theme for named icons.
  
      Params:
        iconSize = the new icon size
  */
  void setIconSize(gid.gtk4.types.IconSize iconSize) nothrow
  {
    gtk_image_set_icon_size(cast(GtkImage*)this._cPtr, iconSize);
  }

  /**
      Sets the pixel size to use for named icons.
      
      If the pixel size is set to a value != -1, it is used instead
      of the icon size set by [gid.gtk4.image.Image.setIconSize].
  
      Params:
        pixelSize = the new pixel size
  */
  void setPixelSize(int pixelSize) nothrow
  {
    gtk_image_set_pixel_size(cast(GtkImage*)this._cPtr, pixelSize);
  }
}

/// Fluent builder implementation template for [gid.gtk4.image.Image]
class ImageGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `file` property.
      Params:
        propval = A path to the file to display.
      Returns: Builder instance for fluent chaining
  */
  T file(string propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = The [gid.gio2.icon.Icon] displayed in the GtkImage.
          
          For themed icons, If the icon theme is changed, the image will be updated
          automatically.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon in the icon theme.
          
          If the icon theme is changed, the image will be updated automatically.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The symbolic size to display icons at.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(gid.gtk4.types.IconSize propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gid.gdk4.paintable.Paintable] to display.
      Returns: Builder instance for fluent chaining
  */
  T paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    return setProperty("paintable", propval);
  }

  /**
      Set `pixelSize` property.
      Params:
        propval = The size in pixels to display icons at.
          
          If set to a value != -1, this property overrides the
          [gid.gtk4.image.Image.iconSize] property for images of type
          [gid.gtk4.types.ImageType.IconName].
      Returns: Builder instance for fluent chaining
  */
  T pixelSize(int propval) nothrow
  {
    return setProperty("pixel-size", propval);
  }

  /**
      Set `resource` property.
      Params:
        propval = A path to a resource file to display.
      Returns: Builder instance for fluent chaining
  */
  T resource(string propval) nothrow
  {
    return setProperty("resource", propval);
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Whether the icon displayed in the [gid.gtk4.image.Image] will use
          standard icon names fallback.
          
          The value of this property is only relevant for images of type
          [gid.gtk4.types.ImageType.IconName] and [gid.gtk4.types.ImageType.Gicon].
      Returns: Builder instance for fluent chaining
  */
  T useFallback(bool propval) nothrow
  {
    return setProperty("use-fallback", propval);
  }
}

/// Fluent builder for [gid.gtk4.image.Image]
final class ImageGidBuilder : ImageGidBuilderImpl!ImageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Image build() nothrow
  {
    return new Image(cast(void*)createGObject(Image._getGType), Yes.Take);
  }
}
