/// Module for [Image] class
module gtk.image;

import gdk.paintable;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.image.Image] widget displays an image.
    
    ![An example GtkImage](image.png)
    
    Various kinds of object can be displayed as an image; most typically,
    you would load a [gdk.texture.Texture] from a file, using the convenience function
    [gtk.image.Image.newFromFile], for instance:
    
    ```c
    GtkWidget *image = gtk_image_new_from_file ("myfile.png");
    ```
    
    If the file isn’t loaded successfully, the image will contain a
    “broken image” icon similar to that used in many web browsers.
    
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gdk.texture.Texture.newFromFile], then create the [gtk.image.Image] with
    [gtk.image.Image.newFromPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gio.resource.Resource] inside
    GIO, for details. In this case, [gtk.image.Image.resource],
    [gtk.image.Image.newFromResource], and [gtk.image.Image.setFromResource]
    should be used.
    
    [gtk.image.Image] displays its image as an icon, with a size that is determined
    by the application. See [gtk.picture.Picture] if you want to show an image
    at is actual size.
    
    ## CSS nodes
    
    [gtk.image.Image] has a single CSS node with the name `image`. The style classes
    `.normal-icons` or `.large-icons` may appear, depending on the
    `property@Gtk.Image:icon-size` property.
    
    ## Accessibility
    
    [gtk.image.Image] uses the [gtk.types.AccessibleRole.Img] role.
*/
class Image : gtk.widget.Widget
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
    return cast(void function())gtk_image_get_type != &gidSymbolNotFound ? gtk_image_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Image self()
  {
    return this;
  }

  /**
      Get `file` property.
      Returns: A path to the file to display.
  */
  @property string file()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("file");
  }

  /**
      Set `file` property.
      Params:
        propval = A path to the file to display.
  */
  @property void file(string propval)
  {
    return setFromFile(propval);
  }

  /**
      Get `gicon` property.
      Returns: The [gio.icon.Icon] displayed in the GtkImage.
        
        For themed icons, If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gio.icon.Icon gicon()
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = The [gio.icon.Icon] displayed in the GtkImage.
          
          For themed icons, If the icon theme is changed, the image will be updated
          automatically.
  */
  @property void gicon(gio.icon.Icon propval)
  {
    return setFromGicon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon in the icon theme.
        
        If the icon theme is changed, the image will be updated automatically.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon in the icon theme.
          
          If the icon theme is changed, the image will be updated automatically.
  */
  @property void iconName(string propval)
  {
    return setFromIconName(propval);
  }

  /**
      Get `iconSize` property.
      Returns: The symbolic size to display icons at.
  */
  @property gtk.types.IconSize iconSize()
  {
    return getIconSize();
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The symbolic size to display icons at.
  */
  @property void iconSize(gtk.types.IconSize propval)
  {
    return setIconSize(propval);
  }

  /**
      Get `paintable` property.
      Returns: The [gdk.paintable.Paintable] to display.
  */
  @property gdk.paintable.Paintable paintable()
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gdk.paintable.Paintable] to display.
  */
  @property void paintable(gdk.paintable.Paintable propval)
  {
    return setFromPaintable(propval);
  }

  /**
      Get `pixelSize` property.
      Returns: The size in pixels to display icons at.
        
        If set to a value != -1, this property overrides the
        `property@Gtk.Image:icon-size` property for images of type
        [gtk.types.ImageType.IconName].
  */
  @property int pixelSize()
  {
    return getPixelSize();
  }

  /**
      Set `pixelSize` property.
      Params:
        propval = The size in pixels to display icons at.
          
          If set to a value != -1, this property overrides the
          `property@Gtk.Image:icon-size` property for images of type
          [gtk.types.ImageType.IconName].
  */
  @property void pixelSize(int propval)
  {
    return setPixelSize(propval);
  }

  /**
      Get `resource` property.
      Returns: A path to a resource file to display.
  */
  @property string resource()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("resource");
  }

  /**
      Set `resource` property.
      Params:
        propval = A path to a resource file to display.
  */
  @property void resource(string propval)
  {
    return setFromResource(propval);
  }

  /**
      Get `storageType` property.
      Returns: The representation being used for image data.
  */
  @property gtk.types.ImageType storageType()
  {
    return getStorageType();
  }

  /**
      Get `useFallback` property.
      Returns: Whether the icon displayed in the [gtk.image.Image] will use
        standard icon names fallback.
        
        The value of this property is only relevant for images of type
        [gtk.types.ImageType.IconName] and [gtk.types.ImageType.Gicon].
  */
  @property bool useFallback()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-fallback");
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Whether the icon displayed in the [gtk.image.Image] will use
          standard icon names fallback.
          
          The value of this property is only relevant for images of type
          [gtk.types.ImageType.IconName] and [gtk.types.ImageType.Gicon].
  */
  @property void useFallback(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-fallback", propval);
  }

  /**
      Creates a new empty [gtk.image.Image] widget.
      Returns: a newly created [gtk.image.Image] widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.image.Image] displaying the file filename.
      
      If the file isn’t found or can’t be loaded, the resulting [gtk.image.Image]
      will display a “broken image” icon. This function never returns null,
      it always returns a valid [gtk.image.Image] widget.
      
      If you need to detect failures to load the file, use
      [gdk.texture.Texture.newFromFile] to load the file yourself,
      then create the [gtk.image.Image] from the texture.
      
      The storage type (see [gtk.image.Image.getStorageType])
      of the returned image is not defined, it will be whatever
      is appropriate for displaying the file.
  
      Params:
        filename = a filename
      Returns: a new [gtk.image.Image]
  */
  static gtk.image.Image newFromFile(string filename)
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_image_new_from_file(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.image.Image] displaying an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        icon = an icon
      Returns: a new [gtk.image.Image] displaying the themed icon
  */
  static gtk.image.Image newFromGicon(gio.icon.Icon icon)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_gicon(icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.image.Image] displaying an icon from the current icon theme.
      
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead. If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        iconName = an icon name
      Returns: a new [gtk.image.Image] displaying the themed icon
  */
  static gtk.image.Image newFromIconName(string iconName = null)
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString(No.Alloc);
    _cretval = gtk_image_new_from_icon_name(_iconName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.image.Image] displaying paintable.
      
      The [gtk.image.Image] does not assume a reference to the paintable; you still
      need to unref it if you own references. [gtk.image.Image] will add its own
      reference rather than adopting yours.
      
      The [gtk.image.Image] will track changes to the paintable and update
      its size and contents in response to it.
  
      Params:
        paintable = a [gdk.paintable.Paintable]
      Returns: a new [gtk.image.Image]
  */
  static gtk.image.Image newFromPaintable(gdk.paintable.Paintable paintable = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_paintable(paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.image.Image] displaying pixbuf.
      
      The [gtk.image.Image] does not assume a reference to the pixbuf; you still
      need to unref it if you own references. [gtk.image.Image] will add its own
      reference rather than adopting yours.
      
      This is a helper for [gtk.image.Image.newFromPaintable], and you can't
      get back the exact pixbuf once this is called, only a texture.
      
      Note that this function just creates an [gtk.image.Image] from the pixbuf.
      The [gtk.image.Image] created will not react to state changes. Should you
      want that, you should use [gtk.image.Image.newFromIconName].
  
      Params:
        pixbuf = a [gdkpixbuf.pixbuf.Pixbuf]
      Returns: a new [gtk.image.Image]
  
      Deprecated: Use [gtk.image.Image.newFromPaintable] and
          [gdk.texture.Texture.newForPixbuf] instead
  */
  static gtk.image.Image newFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.image.Image] displaying the resource file resource_path.
      
      If the file isn’t found or can’t be loaded, the resulting [gtk.image.Image] will
      display a “broken image” icon. This function never returns null,
      it always returns a valid [gtk.image.Image] widget.
      
      If you need to detect failures to load the file, use
      [gdkpixbuf.pixbuf.Pixbuf.newFromFile] to load the file yourself,
      then create the [gtk.image.Image] from the pixbuf.
      
      The storage type (see [gtk.image.Image.getStorageType]) of
      the returned image is not defined, it will be whatever is
      appropriate for displaying the file.
  
      Params:
        resourcePath = a resource path
      Returns: a new [gtk.image.Image]
  */
  static gtk.image.Image newFromResource(string resourcePath)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_image_new_from_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Resets the image to be empty.
  */
  void clear()
  {
    gtk_image_clear(cast(GtkImage*)this._cPtr);
  }

  /**
      Gets the [gio.icon.Icon] being displayed by the [gtk.image.Image].
      
      The storage type of the image must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.Gicon] (see [gtk.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned [gio.icon.Icon].
      Returns: a [gio.icon.Icon]
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_image_get_gicon(cast(GtkImage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name and size being displayed by the [gtk.image.Image].
      
      The storage type of the image must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.IconName] (see [gtk.image.Image.getStorageType]).
      The returned string is owned by the [gtk.image.Image] and should not
      be freed.
      Returns: the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_image_get_icon_name(cast(GtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the icon size used by the image when rendering icons.
      Returns: the image size used by icons
  */
  gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_image_get_icon_size(cast(GtkImage*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Gets the image [gdk.paintable.Paintable] being displayed by the [gtk.image.Image].
      
      The storage type of the image must be [gtk.types.ImageType.Empty] or
      [gtk.types.ImageType.Paintable] (see [gtk.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned paintable.
      Returns: the displayed paintable
  */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_image_get_paintable(cast(GtkImage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the pixel size used for named icons.
      Returns: the pixel size used for named icons.
  */
  int getPixelSize()
  {
    int _retval;
    _retval = gtk_image_get_pixel_size(cast(GtkImage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of representation being used by the [gtk.image.Image]
      to store image data.
      
      If the [gtk.image.Image] has no image data, the return value will
      be [gtk.types.ImageType.Empty].
      Returns: image representation being used
  */
  gtk.types.ImageType getStorageType()
  {
    GtkImageType _cretval;
    _cretval = gtk_image_get_storage_type(cast(GtkImage*)this._cPtr);
    gtk.types.ImageType _retval = cast(gtk.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Sets a [gtk.image.Image] to show a file.
      
      See [gtk.image.Image.newFromFile] for details.
  
      Params:
        filename = a filename
  */
  void setFromFile(string filename = null)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_image_set_from_file(cast(GtkImage*)this._cPtr, _filename);
  }

  /**
      Sets a [gtk.image.Image] to show a [gio.icon.Icon].
      
      See [gtk.image.Image.newFromGicon] for details.
  
      Params:
        icon = an icon
  */
  void setFromGicon(gio.icon.Icon icon)
  {
    gtk_image_set_from_gicon(cast(GtkImage*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gtk.image.Image] to show a named icon.
      
      See [gtk.image.Image.newFromIconName] for details.
  
      Params:
        iconName = an icon name
  */
  void setFromIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_image_set_from_icon_name(cast(GtkImage*)this._cPtr, _iconName);
  }

  /**
      Sets a [gtk.image.Image] to show a [gdk.paintable.Paintable].
      
      See [gtk.image.Image.newFromPaintable] for details.
  
      Params:
        paintable = a [gdk.paintable.Paintable]
  */
  void setFromPaintable(gdk.paintable.Paintable paintable = null)
  {
    gtk_image_set_from_paintable(cast(GtkImage*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gtk.image.Image] to show a [gdkpixbuf.pixbuf.Pixbuf].
      
      See [gtk.image.Image.newFromPixbuf] for details.
      
      Note: This is a helper for [gtk.image.Image.setFromPaintable],
      and you can't get back the exact pixbuf once this is called,
      only a paintable.
  
      Params:
        pixbuf = a [gdkpixbuf.pixbuf.Pixbuf] or `NULL`
  
      Deprecated: Use [gtk.image.Image.setFromPaintable] instead
  */
  void setFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_image_set_from_pixbuf(cast(GtkImage*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gtk.image.Image] to show a resource.
      
      See [gtk.image.Image.newFromResource] for details.
  
      Params:
        resourcePath = a resource path
  */
  void setFromResource(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_image_set_from_resource(cast(GtkImage*)this._cPtr, _resourcePath);
  }

  /**
      Suggests an icon size to the theme for named icons.
  
      Params:
        iconSize = the new icon size
  */
  void setIconSize(gtk.types.IconSize iconSize)
  {
    gtk_image_set_icon_size(cast(GtkImage*)this._cPtr, iconSize);
  }

  /**
      Sets the pixel size to use for named icons.
      
      If the pixel size is set to a value != -1, it is used instead
      of the icon size set by [gtk.image.Image.setFromIconName].
  
      Params:
        pixelSize = the new pixel size
  */
  void setPixelSize(int pixelSize)
  {
    gtk_image_set_pixel_size(cast(GtkImage*)this._cPtr, pixelSize);
  }
}
