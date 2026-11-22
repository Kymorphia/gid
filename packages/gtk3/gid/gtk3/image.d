/// Module for [Image] class
module gid.gtk3.image;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdkpixbuf2.pixbuf;
import gid.gdkpixbuf2.pixbuf_animation;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.icon_set;
import gid.gtk3.misc;
import gid.gtk3.types;

/**
    The #GtkImage widget displays an image. Various kinds of object
    can be displayed as an image; most typically, you would load a
    #GdkPixbuf ("pixel buffer") from a file, and then display that.
    There’s a convenience function to do this, [gid.gtk4.image.Image.newFromFile],
    used as follows:
    ```c
      GtkWidget *image;
      image = gtk_image_new_from_file ("myfile.png");
    ```
    If the file isn’t loaded successfully, the image will contain a
    “broken image” icon similar to that used in many web browsers.
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gid.gdkpixbuf2.pixbuf.Pixbuf.newFromFile], then create the #GtkImage with
    [gid.gtk4.image.Image.newFromPixbuf].
    
    The image file may contain an animation, if so the #GtkImage will
    display an animation (#GdkPixbufAnimation) instead of a static image.
    
    #GtkImage is a subclass of #GtkMisc, which implies that you can
    align it (center, left, right) and add padding to it, using
    #GtkMisc methods.
    
    #GtkImage is a “no window” widget (has no #GdkWindow of its own),
    so by default does not receive events. If you want to receive events
    on the image, such as button clicks, place the image inside a
    #GtkEventBox, then connect to the event signals on the event box.
    
    ## Handling button press events on a #GtkImage.
    
    ```c
      static gboolean
      button_press_callback (GtkWidget      *event_box,
                             GdkEventButton *event,
                             gpointer        data)
      {
        g_print ("Event box clicked at coordinates %f,%f\n",
                 event->x, event->y);
    
        // Returning TRUE means we handled the event, so the signal
        // emission should be stopped (don’t call any further callbacks
        // that may be connected). Return FALSE to continue invoking callbacks.
        return TRUE;
      }
    
      static GtkWidget*
      create_image (void)
      {
        GtkWidget *image;
        GtkWidget *event_box;
    
        image = gtk_image_new_from_file ("myfile.png");
    
        event_box = gtk_event_box_new ();
    
        gtk_container_add (GTK_CONTAINER (event_box), image);
    
        g_signal_connect (G_OBJECT (event_box),
                          "button_press_event",
                          G_CALLBACK (button_press_callback),
                          image);
    
        return image;
      }
    ```
    
    When handling events on the event box, keep in mind that coordinates
    in the image may be different from event box coordinates due to
    the alignment and padding settings on the image (see #GtkMisc).
    The simplest way to solve this is to set the alignment to 0.0
    (left/top), and set the padding to zero. Then the origin of
    the image will be the same as the origin of the event box.
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. GTK+ comes with a program to avoid this,
    called “gdk-pixbuf-csource”. This library
    allows you to convert an image into a C variable declaration, which
    can then be loaded into a #GdkPixbuf using
    [gid.gdkpixbuf2.pixbuf.Pixbuf.newFromInline].
    
    # CSS nodes
    
    GtkImage has a single CSS node with the name image. The style classes
    may appear on image CSS nodes: .icon-dropshadow, .lowres-icon.
*/
class Image : gid.gtk3.misc.Misc
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
      Get builder for [gid.gtk3.image.Image]
      Returns: New builder object
  */
  static ImageGidBuilder builder() nothrow
  {
    return new ImageGidBuilder;
  }

  /** */
  @property string file() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("file");
  }

  /** */
  @property void file(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("file", propval);
  }

  /**
      Get `gicon` property.
      Returns: The GIcon displayed in the GtkImage. For themed icons,
        If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("gicon");
  }

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon displayed in the GtkImage. For themed icons,
          If the icon theme is changed, the image will be updated
          automatically.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("gicon", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon in the icon theme. If the icon theme is
        changed, the image will be updated automatically.
  */
  @property string iconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon in the icon theme. If the icon theme is
          changed, the image will be updated automatically.
  */
  @property void iconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /** */
  @property gid.gtk3.icon_set.IconSet iconSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.icon_set.IconSet)("icon-set");
  }

  /** */
  @property void iconSet(gid.gtk3.icon_set.IconSet propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.icon_set.IconSet)("icon-set", propval);
  }

  /** */
  @property int iconSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("icon-size");
  }

  /** */
  @property void iconSize(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("icon-size", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf() nothrow
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation pixbufAnimation() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)("pixbuf-animation");
  }

  /** */
  @property void pixbufAnimation(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)("pixbuf-animation", propval);
  }

  /**
      Get `pixelSize` property.
      Returns: The "pixel-size" property can be used to specify a fixed size
        overriding the #GtkImage:icon-size property for images of type
        [gid.gtk4.types.ImageType.IconName].
  */
  @property int pixelSize() nothrow
  {
    return getPixelSize();
  }

  /**
      Set `pixelSize` property.
      Params:
        propval = The "pixel-size" property can be used to specify a fixed size
          overriding the #GtkImage:icon-size property for images of type
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
    gid.gobject2.object.ObjectWrap.setProperty!(string)("resource", propval);
  }

  /** */
  @property string stock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("stock");
  }

  /** */
  @property void stock(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("stock", propval);
  }

  /** */
  @property gid.gtk3.types.ImageType storageType() nothrow
  {
    return getStorageType();
  }

  /** */
  @property gid.cairo1.surface.Surface surface() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.cairo1.surface.Surface)("surface");
  }

  /** */
  @property void surface(gid.cairo1.surface.Surface propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.cairo1.surface.Surface)("surface", propval);
  }

  /**
      Get `useFallback` property.
      Returns: Whether the icon displayed in the GtkImage will use
        standard icon names fallback. The value of this property
        is only relevant for images of type [gid.gtk4.types.ImageType.IconName]
        and [gid.gtk4.types.ImageType.Gicon].
  */
  @property bool useFallback() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("use-fallback");
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Whether the icon displayed in the GtkImage will use
          standard icon names fallback. The value of this property
          is only relevant for images of type [gid.gtk4.types.ImageType.IconName]
          and [gid.gtk4.types.ImageType.Gicon].
  */
  @property void useFallback(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("use-fallback", propval);
  }

  /**
      Creates a new empty #GtkImage widget.
      Returns: a newly created #GtkImage widget.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a #GtkImage displaying the given animation.
      The #GtkImage does not assume a reference to the
      animation; you still need to unref it if you own references.
      #GtkImage will add its own reference rather than adopting yours.
      
      Note that the animation frames are shown using a timeout with
      #G_PRIORITY_DEFAULT. When using animations to indicate busyness,
      keep in mind that the animation will only be shown if the main loop
      is not busy with something that has a higher priority.
  
      Params:
        animation = an animation
      Returns: a new #GtkImage widget
  */
  static gid.gtk3.image.Image newFromAnimation(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation animation) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_animation(animation ? cast(GdkPixbufAnimation*)animation._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImage displaying the file filename. If the file
      isn’t found or can’t be loaded, the resulting #GtkImage will
      display a “broken image” icon. This function never returns null,
      it always returns a valid #GtkImage widget.
      
      If the file contains an animation, the image will contain an
      animation.
      
      If you need to detect failures to load the file, use
      [gid.gdkpixbuf2.pixbuf.Pixbuf.newFromFile] to load the file yourself, then create
      the #GtkImage from the pixbuf. (Or for animations, use
      [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromFile]).
      
      The storage type ([gid.gtk4.image.Image.getStorageType]) of the returned
      image is not defined, it will be whatever is appropriate for
      displaying the file.
  
      Params:
        filename = a filename
      Returns: a new #GtkImage
  */
  static gid.gtk3.image.Image newFromFile(string filename) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_image_new_from_file(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkImage displaying an icon from the current icon theme.
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead.  If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        icon = an icon
        size = a stock icon size (#GtkIconSize)
      Returns: a new #GtkImage displaying the themed icon
  */
  static gid.gtk3.image.Image newFromGicon(gid.gio2.icon.Icon icon, gid.gtk3.types.IconSize size) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_gicon(icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkImage displaying an icon from the current icon theme.
      If the icon name isn’t known, a “broken image” icon will be
      displayed instead.  If the current icon theme is changed, the icon
      will be updated appropriately.
  
      Params:
        iconName = an icon name or null
        size = a stock icon size (#GtkIconSize)
      Returns: a new #GtkImage displaying the themed icon
  */
  static gid.gtk3.image.Image newFromIconName(string iconName, gid.gtk3.types.IconSize size) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_image_new_from_icon_name(_iconName, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkImage displaying an icon set. Sample stock sizes are
      #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_SMALL_TOOLBAR. Instead of using
      this function, usually it’s better to create a #GtkIconFactory, put
      your icon sets in the icon factory, add the icon factory to the
      list of default factories with [gid.gtk3.icon_factory.IconFactory.addDefault], and
      then use [gid.gtk3.image.Image.newFromStock]. This will allow themes to
      override the icon you ship with your application.
      
      The #GtkImage does not assume a reference to the
      icon set; you still need to unref it if you own references.
      #GtkImage will add its own reference rather than adopting yours.
  
      Params:
        iconSet = a #GtkIconSet
        size = a stock icon size (#GtkIconSize)
      Returns: a new #GtkImage
  
      Deprecated: Use [gid.gtk4.image.Image.newFromIconName] instead.
  */
  static gid.gtk3.image.Image newFromIconSet(gid.gtk3.icon_set.IconSet iconSet, gid.gtk3.types.IconSize size) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_icon_set(iconSet ? cast(GtkIconSet*)iconSet._cPtr(No.Dup) : null, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImage displaying pixbuf.
      The #GtkImage does not assume a reference to the
      pixbuf; you still need to unref it if you own references.
      #GtkImage will add its own reference rather than adopting yours.
      
      Note that this function just creates an #GtkImage from the pixbuf. The
      #GtkImage created will not react to state changes. Should you want that,
      you should use [gid.gtk4.image.Image.newFromIconName].
  
      Params:
        pixbuf = a #GdkPixbuf, or null
      Returns: a new #GtkImage
  */
  static gid.gtk3.image.Image newFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImage displaying the resource file resource_path. If the file
      isn’t found or can’t be loaded, the resulting #GtkImage will
      display a “broken image” icon. This function never returns null,
      it always returns a valid #GtkImage widget.
      
      If the file contains an animation, the image will contain an
      animation.
      
      If you need to detect failures to load the file, use
      [gid.gdkpixbuf2.pixbuf.Pixbuf.newFromFile] to load the file yourself, then create
      the #GtkImage from the pixbuf. (Or for animations, use
      [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromFile]).
      
      The storage type ([gid.gtk4.image.Image.getStorageType]) of the returned
      image is not defined, it will be whatever is appropriate for
      displaying the file.
  
      Params:
        resourcePath = a resource path
      Returns: a new #GtkImage
  */
  static gid.gtk3.image.Image newFromResource(string resourcePath) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_image_new_from_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a #GtkImage displaying a stock icon. Sample stock icon
      names are #GTK_STOCK_OPEN, #GTK_STOCK_QUIT. Sample stock sizes
      are #GTK_ICON_SIZE_MENU, #GTK_ICON_SIZE_SMALL_TOOLBAR. If the stock
      icon name isn’t known, the image will be empty.
      You can register your own stock icon names, see
      [gid.gtk3.icon_factory.IconFactory.addDefault] and [gid.gtk3.icon_factory.IconFactory.add].
  
      Params:
        stockId = a stock icon name
        size = a stock icon size (#GtkIconSize)
      Returns: a new #GtkImage displaying the stock icon
  
      Deprecated: Use [gid.gtk4.image.Image.newFromIconName] instead.
  */
  static gid.gtk3.image.Image newFromStock(string stockId, gid.gtk3.types.IconSize size) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_image_new_from_stock(_stockId, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImage displaying surface.
      The #GtkImage does not assume a reference to the
      surface; you still need to unref it if you own references.
      #GtkImage will add its own reference rather than adopting yours.
  
      Params:
        surface = a #cairo_surface_t, or null
      Returns: a new #GtkImage
  */
  static gid.gtk3.image.Image newFromSurface(gid.cairo1.surface.Surface surface = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_new_from_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.image.Image)(cast(GtkWidget*)_cretval, No.Take);
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
      Gets the #GdkPixbufAnimation being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.Animation] (see [gid.gtk4.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned animation.
      Returns: the displayed animation, or null if
        the image is empty
  */
  gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation getAnimation() nothrow
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gtk_image_get_animation(cast(GtkImage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GIcon and size being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.Gicon] (see [gid.gtk4.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned #GIcon.
  
      Params:
        gicon = place to store a
              #GIcon, or null
        size = place to store an icon size
              (#GtkIconSize), or null
  */
  void getGicon(out gid.gio2.icon.Icon gicon, out gid.gtk3.types.IconSize size) nothrow
  {
    GIcon* _gicon;
    gtk_image_get_gicon(cast(GtkImage*)this._cPtr, &_gicon, &size);
    gicon = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(_gicon, No.Take);
  }

  /**
      Gets the icon name and size being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk4.types.ImageType.IconName] (see [gid.gtk4.image.Image.getStorageType]).
      The returned string is owned by the #GtkImage and should not
      be freed.
  
      Params:
        iconName = place to store an
              icon name, or null
        size = place to store an icon size
              (#GtkIconSize), or null
  */
  void getIconName(out string iconName, out gid.gtk3.types.IconSize size) nothrow
  {
    char* _iconName;
    gtk_image_get_icon_name(cast(GtkImage*)this._cPtr, &_iconName, &size);
    iconName = _iconName.fromCString!(No.Free);
  }

  /**
      Gets the icon set and size being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.IconSet] (see [gid.gtk4.image.Image.getStorageType]).
  
      Params:
        iconSet = location to store a
              #GtkIconSet, or null
        size = location to store a stock
              icon size (#GtkIconSize), or null
  
      Deprecated: Use [gid.gtk4.image.Image.getIconName] instead.
  */
  void getIconSet(out gid.gtk3.icon_set.IconSet iconSet, out gid.gtk3.types.IconSize size) nothrow
  {
    GtkIconSet* _iconSet;
    gtk_image_get_icon_set(cast(GtkImage*)this._cPtr, &_iconSet, &size);
    if (_iconSet)
      iconSet = new gid.gtk3.icon_set.IconSet(cast(void*)_iconSet, No.Take);
  }

  /**
      Gets the #GdkPixbuf being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.Pixbuf] (see [gid.gtk4.image.Image.getStorageType]).
      The caller of this function does not own a reference to the
      returned pixbuf.
      Returns: the displayed pixbuf, or null if
        the image is empty
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_image_get_pixbuf(cast(GtkImage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
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
      Gets the stock icon name and size being displayed by the #GtkImage.
      The storage type of the image must be [gid.gtk4.types.ImageType.Empty] or
      [gid.gtk3.types.ImageType.Stock] (see [gid.gtk4.image.Image.getStorageType]).
      The returned string is owned by the #GtkImage and should not
      be freed.
  
      Params:
        stockId = place to store a
              stock icon name, or null
        size = place to store a stock icon
              size (#GtkIconSize), or null
  
      Deprecated: Use [gid.gtk4.image.Image.getIconName] instead.
  */
  void getStock(out string stockId, out gid.gtk3.types.IconSize size) nothrow
  {
    char* _stockId;
    gtk_image_get_stock(cast(GtkImage*)this._cPtr, &_stockId, &size);
    stockId = _stockId.fromCString!(No.Free);
  }

  /**
      Gets the type of representation being used by the #GtkImage
      to store image data. If the #GtkImage has no image data,
      the return value will be [gid.gtk4.types.ImageType.Empty].
      Returns: image representation being used
  */
  gid.gtk3.types.ImageType getStorageType() nothrow
  {
    GtkImageType _cretval;
    _cretval = gtk_image_get_storage_type(cast(GtkImage*)this._cPtr);
    gid.gtk3.types.ImageType _retval = cast(gid.gtk3.types.ImageType)_cretval;
    return _retval;
  }

  /**
      Causes the #GtkImage to display the given animation (or display
      nothing, if you set the animation to null).
  
      Params:
        animation = the #GdkPixbufAnimation
  */
  void setFromAnimation(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation animation) nothrow
  {
    gtk_image_set_from_animation(cast(GtkImage*)this._cPtr, animation ? cast(GdkPixbufAnimation*)animation._cPtr(No.Dup) : null);
  }

  /**
      See [gid.gtk4.image.Image.newFromFile] for details.
  
      Params:
        filename = a filename or null
  */
  void setFromFile(string filename = null) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_file(cast(GtkImage*)this._cPtr, _filename);
  }

  /**
      See [gid.gtk4.image.Image.newFromGicon] for details.
  
      Params:
        icon = an icon
        size = an icon size (#GtkIconSize)
  */
  void setFromGicon(gid.gio2.icon.Icon icon, gid.gtk3.types.IconSize size) nothrow
  {
    gtk_image_set_from_gicon(cast(GtkImage*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null, size);
  }

  /**
      See [gid.gtk4.image.Image.newFromIconName] for details.
  
      Params:
        iconName = an icon name or null
        size = an icon size (#GtkIconSize)
  */
  void setFromIconName(string iconName, gid.gtk3.types.IconSize size) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_icon_name(cast(GtkImage*)this._cPtr, _iconName, size);
  }

  /**
      See [gid.gtk3.image.Image.newFromIconSet] for details.
  
      Params:
        iconSet = a #GtkIconSet
        size = a stock icon size (#GtkIconSize)
  
      Deprecated: Use [gid.gtk4.image.Image.setFromIconName] instead.
  */
  void setFromIconSet(gid.gtk3.icon_set.IconSet iconSet, gid.gtk3.types.IconSize size) nothrow
  {
    gtk_image_set_from_icon_set(cast(GtkImage*)this._cPtr, iconSet ? cast(GtkIconSet*)iconSet._cPtr(No.Dup) : null, size);
  }

  /**
      See [gid.gtk4.image.Image.newFromPixbuf] for details.
  
      Params:
        pixbuf = a #GdkPixbuf or null
  */
  void setFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_image_set_from_pixbuf(cast(GtkImage*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      See [gid.gtk4.image.Image.newFromResource] for details.
  
      Params:
        resourcePath = a resource path or null
  */
  void setFromResource(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    gtk_image_set_from_resource(cast(GtkImage*)this._cPtr, _resourcePath);
  }

  /**
      See [gid.gtk3.image.Image.newFromStock] for details.
  
      Params:
        stockId = a stock icon name
        size = a stock icon size (#GtkIconSize)
  
      Deprecated: Use [gid.gtk4.image.Image.setFromIconName] instead.
  */
  void setFromStock(string stockId, gid.gtk3.types.IconSize size) nothrow
  {
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    gtk_image_set_from_stock(cast(GtkImage*)this._cPtr, _stockId, size);
  }

  /**
      See [gid.gtk3.image.Image.newFromSurface] for details.
  
      Params:
        surface = a cairo_surface_t or null
  */
  void setFromSurface(gid.cairo1.surface.Surface surface = null) nothrow
  {
    gtk_image_set_from_surface(cast(GtkImage*)this._cPtr, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  }

  /**
      Sets the pixel size to use for named icons. If the pixel size is set
      to a value != -1, it is used instead of the icon size set by
      [gid.gtk4.image.Image.setFromIconName].
  
      Params:
        pixelSize = the new pixel size
  */
  void setPixelSize(int pixelSize) nothrow
  {
    gtk_image_set_pixel_size(cast(GtkImage*)this._cPtr, pixelSize);
  }
}

/// Fluent builder implementation template for [gid.gtk3.image.Image]
class ImageGidBuilderImpl(T) : gid.gtk3.misc.MiscGidBuilderImpl!T
{


  /** */
  T file(string propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon displayed in the GtkImage. For themed icons,
          If the icon theme is changed, the image will be updated
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
        propval = The name of the icon in the icon theme. If the icon theme is
          changed, the image will be updated automatically.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T iconSet(gid.gtk3.icon_set.IconSet propval) nothrow
  {
    return setProperty("icon-set", propval);
  }

  /** */
  T iconSize(int propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /** */
  T pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }

  /** */
  T pixbufAnimation(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation propval) nothrow
  {
    return setProperty("pixbuf-animation", propval);
  }

  /**
      Set `pixelSize` property.
      Params:
        propval = The "pixel-size" property can be used to specify a fixed size
          overriding the #GtkImage:icon-size property for images of type
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

  /** */
  T stock(string propval) nothrow
  {
    return setProperty("stock", propval);
  }

  /** */
  T surface(gid.cairo1.surface.Surface propval) nothrow
  {
    return setProperty("surface", propval);
  }

  /**
      Set `useFallback` property.
      Params:
        propval = Whether the icon displayed in the GtkImage will use
          standard icon names fallback. The value of this property
          is only relevant for images of type [gid.gtk4.types.ImageType.IconName]
          and [gid.gtk4.types.ImageType.Gicon].
      Returns: Builder instance for fluent chaining
  */
  T useFallback(bool propval) nothrow
  {
    return setProperty("use-fallback", propval);
  }
}

/// Fluent builder for [gid.gtk3.image.Image]
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
