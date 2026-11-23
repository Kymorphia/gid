/// Module for [Picture] class
module gid.gtk4.picture;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.file;
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
    Displays a [gid.gdk4.paintable.Paintable].
    
    <picture>
      <source srcset="picture-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkPicture" src="picture.png">
    </picture>
    
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
    and image loading framework such as libglycin, then create the [gid.gtk4.picture.Picture]
    with [gid.gtk4.picture.Picture.newForPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gid.gio2.resource.Resource] for details.
    In this case, [gid.gtk4.picture.Picture.newForResource] and
    [gid.gtk4.picture.Picture.setResource] should be used.
    
    [gid.gtk4.picture.Picture] displays an image at its natural size. See [gid.gtk4.image.Image]
    if you want to display a fixed-size image, such as an icon.
    
    ## Sizing the paintable
    
    You can influence how the paintable is displayed inside the [gid.gtk4.picture.Picture]
    by changing [gid.gtk4.picture.Picture.contentFit]. See [gid.gtk4.types.ContentFit]
    for details. [gid.gtk4.picture.Picture.canShrink] can be unset to make sure
    that paintables are never made smaller than their ideal size - but
    be careful if you do not know the size of the paintable in use (like
    when displaying user-loaded images). This can easily cause the picture to
    grow larger than the screen. And [gid.gtk4.widget.Widget.halign] and
    [gid.gtk4.widget.Widget.valign] can be used to make sure the paintable doesn't
    fill all available space but is instead displayed at its original size.
    
    ## CSS nodes
    
    [gid.gtk4.picture.Picture] has a single CSS node with the name `picture`.
    
    ## Accessibility
    
    [gid.gtk4.picture.Picture] uses the [gid.gtk4.types.AccessibleRole.Img] role.
*/
class Picture : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_picture_get_type != &gidSymbolNotFound ? gtk_picture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPicture";
  }

  /** Returns `this`, for use in `with` statements. */
  override Picture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.picture.Picture]
      Returns: New builder object
  */
  static PictureGidBuilder builder() nothrow
  {
    return new PictureGidBuilder;
  }

  /**
      Get `alternativeText` property.
      Returns: The alternative textual description for the picture.
  */
  @property string alternativeText() nothrow
  {
    return getAlternativeText();
  }

  /**
      Set `alternativeText` property.
      Params:
        propval = The alternative textual description for the picture.
  */
  @property void alternativeText(string propval) nothrow
  {
    setAlternativeText(propval);
  }

  /**
      Get `canShrink` property.
      Returns: If the [gid.gtk4.picture.Picture] can be made smaller than the natural size of its contents.
  */
  @property bool canShrink() nothrow
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = If the [gid.gtk4.picture.Picture] can be made smaller than the natural size of its contents.
  */
  @property void canShrink(bool propval) nothrow
  {
    setCanShrink(propval);
  }

  /**
      Get `contentFit` property.
      Returns: How the content should be resized to fit inside the [gid.gtk4.picture.Picture].
  */
  @property gid.gtk4.types.ContentFit contentFit() nothrow
  {
    return getContentFit();
  }

  /**
      Set `contentFit` property.
      Params:
        propval = How the content should be resized to fit inside the [gid.gtk4.picture.Picture].
  */
  @property void contentFit(gid.gtk4.types.ContentFit propval) nothrow
  {
    setContentFit(propval);
  }

  /**
      Get `file` property.
      Returns: The [gid.gio2.file.File] that is displayed or null if none.
  */
  @property gid.gio2.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The [gid.gio2.file.File] that is displayed or null if none.
  */
  @property void file(gid.gio2.file.File propval) nothrow
  {
    setFile(propval);
  }

  /**
      Get `isolateContents` property.
      Returns: If the rendering of the contents is isolated from the rest of the widget tree.
  */
  @property bool isolateContents() nothrow
  {
    return getIsolateContents();
  }

  /**
      Set `isolateContents` property.
      Params:
        propval = If the rendering of the contents is isolated from the rest of the widget tree.
  */
  @property void isolateContents(bool propval) nothrow
  {
    setIsolateContents(propval);
  }

  /**
      Get `keepAspectRatio` property.
      Returns: Whether the GtkPicture will render its contents trying to preserve the aspect
        ratio.
  
      Deprecated: Use [gid.gtk4.picture.Picture.contentFit] instead.
  */
  @property bool keepAspectRatio() nothrow
  {
    return getKeepAspectRatio();
  }

  /**
      Set `keepAspectRatio` property.
      Params:
        propval = Whether the GtkPicture will render its contents trying to preserve the aspect
          ratio.
  
      Deprecated: Use [gid.gtk4.picture.Picture.contentFit] instead.
  */
  @property void keepAspectRatio(bool propval) nothrow
  {
    setKeepAspectRatio(propval);
  }

  /**
      Get `paintable` property.
      Returns: The [gid.gdk4.paintable.Paintable] to be displayed by this [gid.gtk4.picture.Picture].
  */
  @property gid.gdk4.paintable.Paintable paintable() nothrow
  {
    return getPaintable();
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gid.gdk4.paintable.Paintable] to be displayed by this [gid.gtk4.picture.Picture].
  */
  @property void paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    setPaintable(propval);
  }

  /**
      Creates a new empty [gid.gtk4.picture.Picture] widget.
      Returns: a newly created [gid.gtk4.picture.Picture] widget.
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
      _cretval = gtk_picture_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new [gid.gtk4.picture.Picture] displaying the given file.
      
      If the file isn’t found or can’t be loaded, the resulting
      [gid.gtk4.picture.Picture] is empty.
      
      If you need to detect failures to load the file, use an
      image loading framework such as libglycin to load the file
      yourself, then create the [gid.gtk4.picture.Picture] from the texture.
  
      Params:
        file = a [gid.gio2.file.File]
      Returns: a new [gid.gtk4.picture.Picture]
  */
  static gid.gtk4.picture.Picture newForFile(gid.gio2.file.File file = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_file(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.picture.Picture] displaying the file filename.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.newForFile].
      See that function for details.
  
      Params:
        filename = a filename
      Returns: a new [gid.gtk4.picture.Picture]
  */
  static gid.gtk4.picture.Picture newForFilename(string filename = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_picture_new_for_filename(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.picture.Picture] displaying paintable.
      
      The [gid.gtk4.picture.Picture] will track changes to the paintable and update
      its size and contents in response to it.
  
      Params:
        paintable = a [gid.gdk4.paintable.Paintable]
      Returns: a new [gid.gtk4.picture.Picture]
  */
  static gid.gtk4.picture.Picture newForPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_paintable(paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.picture.Picture] displaying pixbuf.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.newForPaintable],
      See that function for details.
      
      The pixbuf must not be modified after passing it to this function.
  
      Params:
        pixbuf = a [gid.gdkpixbuf2.pixbuf.Pixbuf]
      Returns: a new [gid.gtk4.picture.Picture]
  
      Deprecated: Use [gid.gtk4.picture.Picture.newForPaintable] and
          [gid.gdk4.texture.Texture.newForPixbuf] instead
  */
  static gid.gtk4.picture.Picture newForPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_picture_new_for_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.picture.Picture] displaying the resource at resource_path.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.newForFile].
      See that function for details.
  
      Params:
        resourcePath = resource path to play back
      Returns: a new [gid.gtk4.picture.Picture]
  */
  static gid.gtk4.picture.Picture newForResource(string resourcePath = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_picture_new_for_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.picture.Picture)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the alternative textual description of the picture.
      
      The returned string will be null if the picture cannot be described textually.
      Returns: the alternative textual description of self.
  */
  string getAlternativeText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_picture_get_alternative_text(cast(GtkPicture*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.picture.Picture] respects its contents size.
      Returns: true if the picture can be made smaller than its contents
  */
  bool getCanShrink() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_picture_get_can_shrink(cast(GtkPicture*)this._cPtr);
    return _retval;
  }

  /**
      Returns the fit mode for the content of the [gid.gtk4.picture.Picture].
      
      See [gid.gtk4.types.ContentFit] for details.
      Returns: the content fit mode
  */
  gid.gtk4.types.ContentFit getContentFit() nothrow
  {
    GtkContentFit _cretval;
    _cretval = gtk_picture_get_content_fit(cast(GtkPicture*)this._cPtr);
    gid.gtk4.types.ContentFit _retval = cast(gid.gtk4.types.ContentFit)_cretval;
    return _retval;
  }

  /**
      Gets the [gid.gio2.file.File] currently displayed if self is displaying a file.
      
      If self is not displaying a file, for example when
      [gid.gtk4.picture.Picture.setPaintable] was used, then null is returned.
      Returns: The [gid.gio2.file.File] displayed by self.
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_picture_get_file(cast(GtkPicture*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the contents are isolated.
      Returns: True if contents are isolated
  */
  bool getIsolateContents() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_picture_get_isolate_contents(cast(GtkPicture*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.picture.Picture] preserves its contents aspect ratio.
      Returns: true if the self tries to keep the contents' aspect ratio
  
      Deprecated: Use [gid.gtk4.picture.Picture.getContentFit] instead. This will
          now return `FALSE` only if [gid.gtk4.picture.Picture.contentFit] is
          [gid.gtk4.types.ContentFit.Fill]. Returns `TRUE` otherwise.
  */
  bool getKeepAspectRatio() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_picture_get_keep_aspect_ratio(cast(GtkPicture*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gdk4.paintable.Paintable] being displayed by the [gid.gtk4.picture.Picture].
      Returns: the displayed paintable
  */
  gid.gdk4.paintable.Paintable getPaintable() nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gtk_picture_get_paintable(cast(GtkPicture*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
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
  void setAlternativeText(string alternativeText = null) nothrow
  {
    const(char)* _alternativeText = alternativeText.toCString!(No.Malloc, Yes.Nullable);
    gtk_picture_set_alternative_text(cast(GtkPicture*)this._cPtr, _alternativeText);
  }

  /**
      If set to true, then self can be made smaller than its contents.
      
      The contents will then be scaled down when rendering.
      
      If you want to still force a minimum size manually, consider using
      [gid.gtk4.widget.Widget.setSizeRequest].
      
      Also of note is that a similar function for growing does not exist
      because the grow behavior can be controlled via
      [gid.gtk4.widget.Widget.setHalign] and [gid.gtk4.widget.Widget.setValign].
  
      Params:
        canShrink = if self can be made smaller than its contents
  */
  void setCanShrink(bool canShrink) nothrow
  {
    gtk_picture_set_can_shrink(cast(GtkPicture*)this._cPtr, canShrink);
  }

  /**
      Sets how the content should be resized to fit the [gid.gtk4.picture.Picture].
      
      See [gid.gtk4.types.ContentFit] for details.
  
      Params:
        contentFit = the content fit mode
  */
  void setContentFit(gid.gtk4.types.ContentFit contentFit) nothrow
  {
    gtk_picture_set_content_fit(cast(GtkPicture*)this._cPtr, contentFit);
  }

  /**
      Makes self load and display file.
      
      See [gid.gtk4.picture.Picture.newForFile] for details.
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture], and then use
          [gid.gtk4.image.Image.setFromPaintable].
  
      Params:
        file = a [gid.gio2.file.File]
  */
  void setFile(gid.gio2.file.File file = null) nothrow
  {
    gtk_picture_set_file(cast(GtkPicture*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Makes self load and display the given filename.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.setFile].
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture], and then use
          [gid.gtk4.image.Image.setFromPaintable].
  
      Params:
        filename = the filename to play
  */
  void setFilename(string filename = null) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    gtk_picture_set_filename(cast(GtkPicture*)this._cPtr, _filename);
  }

  /**
      If set to true, then the contents will be rendered individually.
      
      If set to false they will be able to erase or otherwise mix with
      the background.
      
      GTK supports finer grained isolation, in rare cases where you need
      this, you can use [gid.gtk4.snapshot.Snapshot.pushIsolation] yourself to
      achieve this.
      
      By default contents are isolated.
  
      Params:
        isolateContents = if contents are rendered separately
  */
  void setIsolateContents(bool isolateContents) nothrow
  {
    gtk_picture_set_isolate_contents(cast(GtkPicture*)this._cPtr, isolateContents);
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
  
      Deprecated: Use [gid.gtk4.picture.Picture.setContentFit] instead. If still
          used, this method will always set the [gid.gtk4.picture.Picture.contentFit]
          property to [gid.gtk4.types.ContentFit.Contain] if keep_aspect_ratio is true,
          otherwise it will set it to [gid.gtk4.types.ContentFit.Fill].
  */
  void setKeepAspectRatio(bool keepAspectRatio) nothrow
  {
    gtk_picture_set_keep_aspect_ratio(cast(GtkPicture*)this._cPtr, keepAspectRatio);
  }

  /**
      Makes self display the given paintable.
      
      If paintable is `NULL`, nothing will be displayed.
      
      See [gid.gtk4.picture.Picture.newForPaintable] for details.
  
      Params:
        paintable = a [gid.gdk4.paintable.Paintable]
  */
  void setPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    gtk_picture_set_paintable(cast(GtkPicture*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets a [gid.gtk4.picture.Picture] to show a [gid.gdkpixbuf2.pixbuf.Pixbuf].
      
      See [gid.gtk4.picture.Picture.newForPixbuf] for details.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.setPaintable].
  
      Params:
        pixbuf = a [gid.gdkpixbuf2.pixbuf.Pixbuf]
  
      Deprecated: Use [gid.gtk4.picture.Picture.setPaintable] instead
  */
  void setPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_picture_set_pixbuf(cast(GtkPicture*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Makes self load and display the resource at the given
      resource_path.
      
      This is a utility function that calls [gid.gtk4.picture.Picture.setFile].
  
      Params:
        resourcePath = the resource to set
  */
  void setResource(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    gtk_picture_set_resource(cast(GtkPicture*)this._cPtr, _resourcePath);
  }
}

/// Fluent builder implementation template for [gid.gtk4.picture.Picture]
class PictureGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `alternativeText` property.
      Params:
        propval = The alternative textual description for the picture.
      Returns: Builder instance for fluent chaining
  */
  T alternativeText(string propval) nothrow
  {
    return setProperty("alternative-text", propval);
  }

  /**
      Set `canShrink` property.
      Params:
        propval = If the [gid.gtk4.picture.Picture] can be made smaller than the natural size of its contents.
      Returns: Builder instance for fluent chaining
  */
  T canShrink(bool propval) nothrow
  {
    return setProperty("can-shrink", propval);
  }

  /**
      Set `contentFit` property.
      Params:
        propval = How the content should be resized to fit inside the [gid.gtk4.picture.Picture].
      Returns: Builder instance for fluent chaining
  */
  T contentFit(gid.gtk4.types.ContentFit propval) nothrow
  {
    return setProperty("content-fit", propval);
  }

  /**
      Set `file` property.
      Params:
        propval = The [gid.gio2.file.File] that is displayed or null if none.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gio2.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `isolateContents` property.
      Params:
        propval = If the rendering of the contents is isolated from the rest of the widget tree.
      Returns: Builder instance for fluent chaining
  */
  T isolateContents(bool propval) nothrow
  {
    return setProperty("isolate-contents", propval);
  }

  /**
      Set `keepAspectRatio` property.
      Params:
        propval = Whether the GtkPicture will render its contents trying to preserve the aspect
          ratio.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.picture.Picture.contentFit] instead.
  */
  T keepAspectRatio(bool propval) nothrow
  {
    return setProperty("keep-aspect-ratio", propval);
  }

  /**
      Set `paintable` property.
      Params:
        propval = The [gid.gdk4.paintable.Paintable] to be displayed by this [gid.gtk4.picture.Picture].
      Returns: Builder instance for fluent chaining
  */
  T paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    return setProperty("paintable", propval);
  }
}

/// Fluent builder for [gid.gtk4.picture.Picture]
final class PictureGidBuilder : PictureGidBuilderImpl!PictureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Picture build() nothrow
  {
    return new Picture(cast(void*)createGObject(Picture._getGType), Yes.Take);
  }
}
