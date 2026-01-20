/// Module for [Picture] class
module gtk.picture;

import gdk.paintable;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.file;
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
    The [gtk.picture.Picture] widget displays a [gdk.paintable.Paintable].
    
    ![An example GtkPicture](picture.png)
    
    Many convenience functions are provided to make pictures simple to use.
    For example, if you want to load an image from a file, and then display
    it, there’s a convenience function to do this:
    
    ```c
    GtkWidget *widget = gtk_picture_new_for_filename ("myfile.png");
    ```
    
    If the file isn’t loaded successfully, the picture will contain a
    “broken image” icon similar to that used in many web browsers.
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gdk.texture.Texture.newFromFile], then create the [gtk.picture.Picture] with
    [gtk.picture.Picture.newForPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gio.resource.Resource] for details.
    In this case, [gtk.picture.Picture.newForResource] and
    [gtk.picture.Picture.setResource] should be used.
    
    [gtk.picture.Picture] displays an image at its natural size. See [gtk.image.Image]
    if you want to display a fixed-size image, such as an icon.
    
    ## Sizing the paintable
    
    You can influence how the paintable is displayed inside the [gtk.picture.Picture]
    by changing `property@Gtk.Picture:content-fit`. See [gtk.types.ContentFit]
    for details. `property@Gtk.Picture:can-shrink` can be unset to make sure
    that paintables are never made smaller than their ideal size - but
    be careful if you do not know the size of the paintable in use (like
    when displaying user-loaded images). This can easily cause the picture to
    grow larger than the screen. And [gtk.widget.Widget.halign] and
    [gtk.widget.Widget.valign] can be used to make sure the paintable doesn't
    fill all available space but is instead displayed at its original size.
    
    ## CSS nodes
    
    [gtk.picture.Picture] has a single CSS node with the name `picture`.
    
    ## Accessibility
    
    [gtk.picture.Picture] uses the [gtk.types.AccessibleRole.Img] role.
*/
class Picture : gtk.widget.Widget
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
    return cast(void function())gtk_picture_get_type != &gidSymbolNotFound ? gtk_picture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Picture self()
  {
    return this;
  }

  /**
      Get `alternativeText` property.
      Returns: The alternative textual description for the picture.
  */
  @property string alternativeText()
  {
    return getAlternativeText();
  }

  /**
      Set `alternativeText` property.
      Params:
        propval = The alternative textual description for the picture.
  */
  @property void alternativeText(string propval)
  {
    return setAlternativeText(propval);
  }

  /**
      Get `canShrink` property.
      Returns: If the [gtk.picture.Picture] can be made smaller than the natural size of its contents.
  */
  @property bool canShrink()
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = If the [gtk.picture.Picture] can be made smaller than the natural size of its contents.
  */
  @property void canShrink(bool propval)
  {
    return setCanShrink(propval);
  }

  /**
      Get `contentFit` property.
      Returns: How the content should be resized to fit inside the [gtk.picture.Picture].
  */
  @property gtk.types.ContentFit contentFit()
  {
    return getContentFit();
  }

  /**
      Set `contentFit` property.
      Params:
        propval = How the content should be resized to fit inside the [gtk.picture.Picture].
  */
  @property void contentFit(gtk.types.ContentFit propval)
  {
    return setContentFit(propval);
  }

  /**
      Get `file` property.
      Returns: The [gio.file.File] that is displayed or null if none.
  */
  @property gio.file.File file()
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The [gio.file.File] that is displayed or null if none.
  */
  @property void file(gio.file.File propval)
  {
    return setFile(propval);
  }

  /**
      Get `keepAspectRatio` property.
      Returns: Whether the GtkPicture will render its contents trying to preserve the aspect
        ratio.
  
      Deprecated: Use `property@Gtk.Picture:content-fit` instead.
  */
  @property bool keepAspectRatio()
  {
    return getKeepAspectRatio();
  }

  /**
      Set `keepAspectRatio` property.
      Params:
        propval = Whether the GtkPicture will render its contents trying to preserve the aspect
          ratio.
  
      Deprecated: Use `property@Gtk.Picture:content-fit` instead.
  */
  @property void keepAspectRatio(bool propval)
  {
    return setKeepAspectRatio(propval);
  }

  /**
      Get `paintable` property.
      Returns: The [gdk.paintable.Paintable] to be displayed by this [gtk.picture.Picture].
  */
  @property gdk.paintable.Paintable paintable()
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gdk.paintable.Paintable] to be displayed by this [gtk.picture.Picture].
  */
  @property void paintable(gdk.paintable.Paintable propval)
  {
    return setPaintable(propval);
  }

  /**
      Creates a new empty [gtk.picture.Picture] widget.
      Returns: a newly created [gtk.picture.Picture] widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.picture.Picture] displaying the given file.
      
      If the file isn’t found or can’t be loaded, the resulting
      [gtk.picture.Picture] is empty.
      
      If you need to detect failures to load the file, use
      [gdk.texture.Texture.newFromFile] to load the file yourself,
      then create the [gtk.picture.Picture] from the texture.
  
      Params:
        file = a [gio.file.File]
      Returns: a new [gtk.picture.Picture]
  */
  static gtk.picture.Picture newForFile(gio.file.File file = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_file(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.picture.Picture] displaying the file filename.
      
      This is a utility function that calls [gtk.picture.Picture.newForFile].
      See that function for details.
  
      Params:
        filename = a filename
      Returns: a new [gtk.picture.Picture]
  */
  static gtk.picture.Picture newForFilename(string filename = null)
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_picture_new_for_filename(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.picture.Picture] displaying paintable.
      
      The [gtk.picture.Picture] will track changes to the paintable and update
      its size and contents in response to it.
  
      Params:
        paintable = a [gdk.paintable.Paintable]
      Returns: a new [gtk.picture.Picture]
  */
  static gtk.picture.Picture newForPaintable(gdk.paintable.Paintable paintable = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_paintable(paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.picture.Picture] displaying pixbuf.
      
      This is a utility function that calls [gtk.picture.Picture.newForPaintable],
      See that function for details.
      
      The pixbuf must not be modified after passing it to this function.
  
      Params:
        pixbuf = a [gdkpixbuf.pixbuf.Pixbuf]
      Returns: a new [gtk.picture.Picture]
  
      Deprecated: Use [gtk.picture.Picture.newForPaintable] and
          [gdk.texture.Texture.newForPixbuf] instead
  */
  static gtk.picture.Picture newForPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.picture.Picture] displaying the resource at resource_path.
      
      This is a utility function that calls [gtk.picture.Picture.newForFile].
      See that function for details.
  
      Params:
        resourcePath = resource path to play back
      Returns: a new [gtk.picture.Picture]
  */
  static gtk.picture.Picture newForResource(string resourcePath = null)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_picture_new_for_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the alternative textual description of the picture.
      
      The returned string will be null if the picture cannot be described textually.
      Returns: the alternative textual description of self.
  */
  string getAlternativeText()
  {
    const(char)* _cretval;
    _cretval = gtk_picture_get_alternative_text(cast(GtkPicture*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the [gtk.picture.Picture] respects its contents size.
      Returns: true if the picture can be made smaller than its contents
  */
  bool getCanShrink()
  {
    bool _retval;
    _retval = cast(bool)gtk_picture_get_can_shrink(cast(GtkPicture*)this._cPtr);
    return _retval;
  }

  /**
      Returns the fit mode for the content of the [gtk.picture.Picture].
      
      See [gtk.types.ContentFit] for details.
      Returns: the content fit mode
  */
  gtk.types.ContentFit getContentFit()
  {
    GtkContentFit _cretval;
    _cretval = gtk_picture_get_content_fit(cast(GtkPicture*)this._cPtr);
    gtk.types.ContentFit _retval = cast(gtk.types.ContentFit)_cretval;
    return _retval;
  }

  /**
      Gets the [gio.file.File] currently displayed if self is displaying a file.
      
      If self is not displaying a file, for example when
      [gtk.picture.Picture.setPaintable] was used, then null is returned.
      Returns: The [gio.file.File] displayed by self.
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_picture_get_file(cast(GtkPicture*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the [gtk.picture.Picture] preserves its contents aspect ratio.
      Returns: true if the self tries to keep the contents' aspect ratio
  
      Deprecated: Use [gtk.picture.Picture.getContentFit] instead. This will
          now return `FALSE` only if `propertyGtk.Picture:content-fit` is
          [gtk.types.ContentFit.Fill]. Returns `TRUE` otherwise.
  */
  bool getKeepAspectRatio()
  {
    bool _retval;
    _retval = cast(bool)gtk_picture_get_keep_aspect_ratio(cast(GtkPicture*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gdk.paintable.Paintable] being displayed by the [gtk.picture.Picture].
      Returns: the displayed paintable
  */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_picture_get_paintable(cast(GtkPicture*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets an alternative textual description for the picture contents.
      
      It is equivalent to the "alt" attribute for images on websites.
      
      This text will be made available to accessibility tools.
      
      If the picture cannot be described textually, set this property to null.
  
      Params:
        alternativeText = a textual description of the contents
  */
  void setAlternativeText(string alternativeText = null)
  {
    const(char)* _alternativeText = alternativeText.toCString(No.Alloc);
    gtk_picture_set_alternative_text(cast(GtkPicture*)this._cPtr, _alternativeText);
  }

  /**
      If set to true, the self can be made smaller than its contents.
      
      The contents will then be scaled down when rendering.
      
      If you want to still force a minimum size manually, consider using
      [gtk.widget.Widget.setSizeRequest].
      
      Also of note is that a similar function for growing does not exist
      because the grow behavior can be controlled via
      [gtk.widget.Widget.setHalign] and [gtk.widget.Widget.setValign].
  
      Params:
        canShrink = if self can be made smaller than its contents
  */
  void setCanShrink(bool canShrink)
  {
    gtk_picture_set_can_shrink(cast(GtkPicture*)this._cPtr, canShrink);
  }

  /**
      Sets how the content should be resized to fit the [gtk.picture.Picture].
      
      See [gtk.types.ContentFit] for details.
  
      Params:
        contentFit = the content fit mode
  */
  void setContentFit(gtk.types.ContentFit contentFit)
  {
    gtk_picture_set_content_fit(cast(GtkPicture*)this._cPtr, contentFit);
  }

  /**
      Makes self load and display file.
      
      See [gtk.picture.Picture.newForFile] for details.
  
      Params:
        file = a [gio.file.File]
  */
  void setFile(gio.file.File file = null)
  {
    gtk_picture_set_file(cast(GtkPicture*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Makes self load and display the given filename.
      
      This is a utility function that calls [gtk.picture.Picture.setFile].
  
      Params:
        filename = the filename to play
  */
  void setFilename(string filename = null)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_picture_set_filename(cast(GtkPicture*)this._cPtr, _filename);
  }

  /**
      If set to true, the self will render its contents according to
      their aspect ratio.
      
      That means that empty space may show up at the top/bottom or
      left/right of self.
      
      If set to false or if the contents provide no aspect ratio,
      the contents will be stretched over the picture's whole area.
  
      Params:
        keepAspectRatio = whether to keep aspect ratio
  
      Deprecated: Use [gtk.picture.Picture.setContentFit] instead. If still
          used, this method will always set the `propertyGtk.Picture:content-fit`
          property to [gtk.types.ContentFit.Contain] if keep_aspect_ratio is true,
          otherwise it will set it to [gtk.types.ContentFit.Fill].
  */
  void setKeepAspectRatio(bool keepAspectRatio)
  {
    gtk_picture_set_keep_aspect_ratio(cast(GtkPicture*)this._cPtr, keepAspectRatio);
  }

  /**
      Makes self display the given paintable.
      
      If paintable is null, nothing will be displayed.
      
      See [gtk.picture.Picture.newForPaintable] for details.
  
      Params:
        paintable = a [gdk.paintable.Paintable]
  */
  void setPaintable(gdk.paintable.Paintable paintable = null)
  {
    gtk_picture_set_paintable(cast(GtkPicture*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gtk.picture.Picture] to show a [gdkpixbuf.pixbuf.Pixbuf].
      
      See [gtk.picture.Picture.newForPixbuf] for details.
      
      This is a utility function that calls [gtk.picture.Picture.setPaintable].
  
      Params:
        pixbuf = a [gdkpixbuf.pixbuf.Pixbuf]
  
      Deprecated: Use [gtk.picture.Picture.setPaintable] instead
  */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_picture_set_pixbuf(cast(GtkPicture*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Makes self load and display the resource at the given
      resource_path.
      
      This is a utility function that calls [gtk.picture.Picture.setFile].
  
      Params:
        resourcePath = the resource to set
  */
  void setResource(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_picture_set_resource(cast(GtkPicture*)this._cPtr, _resourcePath);
  }
}
