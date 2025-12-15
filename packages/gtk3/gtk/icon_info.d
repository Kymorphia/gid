/// Module for [IconInfo] class
module gtk.icon_info;

import cairo.surface;
import gdk.rectangle;
import gdk.rgba;
import gdk.types;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_theme;
import gtk.style;
import gtk.style_context;
import gtk.types;

/**
    Contains information found when looking up an icon in
    an icon theme.
*/
class IconInfo : gobject.object.ObjectWrap
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
    return cast(void function())gtk_icon_info_get_type != &gidSymbolNotFound ? gtk_icon_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconInfo self()
  {
    return this;
  }

  /**
      Creates a #GtkIconInfo for a #GdkPixbuf.
  
      Params:
        iconTheme = a #GtkIconTheme
        pixbuf = the pixbuf to wrap in a #GtkIconInfo
      Returns: a #GtkIconInfo
  */
  static gtk.icon_info.IconInfo newForPixbuf(gtk.icon_theme.IconTheme iconTheme, gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GtkIconInfo* _cretval;
    _cretval = gtk_icon_info_new_for_pixbuf(iconTheme ? cast(GtkIconTheme*)iconTheme._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_info.IconInfo)(cast(GtkIconInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function is deprecated and always returns false.
  
      Params:
        points = location to store pointer
              to an array of points, or null free the array of points with [glib.global.gfree].
      Returns: false
  
      Deprecated: Attachment points are deprecated
  */
  bool getAttachPoints(out gdk.types.Point[] points)
  {
    bool _retval;
    int _nPoints;
    GdkPoint* _points;
    _retval = cast(bool)gtk_icon_info_get_attach_points(cast(GtkIconInfo*)this._cPtr, &_points, &_nPoints);
    points.length = _nPoints;
    points[0 .. $] = (cast(gdk.types.Point*)_points)[0 .. _nPoints];
    gFree(cast(void*)_points);
    return _retval;
  }

  /**
      Gets the base scale for the icon. The base scale is a scale
      for the icon that was specified by the icon theme creator.
      For instance an icon drawn for a high-dpi screen with window
      scale 2 for a base size of 32 will be 64 pixels tall and have
      a base scale of 2.
      Returns: the base scale
  */
  int getBaseScale()
  {
    int _retval;
    _retval = gtk_icon_info_get_base_scale(cast(GtkIconInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the base size for the icon. The base size
      is a size for the icon that was specified by
      the icon theme creator. This may be different
      than the actual size of image; an example of
      this is small emblem icons that can be attached
      to a larger icon. These icons will be given
      the same base size as the larger icons to which
      they are attached.
      
      Note that for scaled icons the base size does
      not include the base scale.
      Returns: the base size, or 0, if no base
            size is known for the icon.
  */
  int getBaseSize()
  {
    int _retval;
    _retval = gtk_icon_info_get_base_size(cast(GtkIconInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the built-in image for this icon, if any. To allow GTK+ to use
      built in icon images, you must pass the [gtk.types.IconLookupFlags.UseBuiltin]
      to [gtk.icon_theme.IconTheme.lookupIcon].
      Returns: the built-in image pixbuf, or null.
            No extra reference is added to the returned pixbuf, so if
            you want to keep it around, you must use [gobject.object.ObjectWrap.ref_].
            The returned image must not be modified.
  
      Deprecated: This function is deprecated, use
            [gtk.icon_theme.IconTheme.addResourcePath] instead of builtin icons.
  */
  gdkpixbuf.pixbuf.Pixbuf getBuiltinPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_icon_info_get_builtin_pixbuf(cast(GtkIconInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function is deprecated and always returns null.
      Returns: null
  
      Deprecated: Display names are deprecated
  */
  string getDisplayName()
  {
    const(char)* _cretval;
    _cretval = gtk_icon_info_get_display_name(cast(GtkIconInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function is deprecated and always returns false.
  
      Params:
        rectangle = #GdkRectangle in which to store embedded
            rectangle coordinates; coordinates are only stored
            when this function returns true.
      Returns: false
  
      Deprecated: Embedded rectangles are deprecated
  */
  bool getEmbeddedRect(out gdk.rectangle.Rectangle rectangle)
  {
    bool _retval;
    GdkRectangle _rectangle;
    _retval = cast(bool)gtk_icon_info_get_embedded_rect(cast(GtkIconInfo*)this._cPtr, &_rectangle);
    rectangle = new gdk.rectangle.Rectangle(cast(void*)&_rectangle, No.Take);
    return _retval;
  }

  /**
      Gets the filename for the icon. If the [gtk.types.IconLookupFlags.UseBuiltin]
      flag was passed to [gtk.icon_theme.IconTheme.lookupIcon], there may be no
      filename if a builtin icon is returned; in this case, you should
      use [gtk.icon_info.IconInfo.getBuiltinPixbuf].
      Returns: the filename for the icon, or null
            if [gtk.icon_info.IconInfo.getBuiltinPixbuf] should be used instead.
            The return value is owned by GTK+ and should not be modified
            or freed.
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gtk_icon_info_get_filename(cast(GtkIconInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if the icon is symbolic or not. This currently uses only
      the file name and not the file contents for determining this.
      This behaviour may change in the future.
      Returns: true if the icon is symbolic, false otherwise
  */
  bool isSymbolic()
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_info_is_symbolic(cast(GtkIconInfo*)this._cPtr);
    return _retval;
  }

  /**
      Renders an icon previously looked up in an icon theme using
      [gtk.icon_theme.IconTheme.lookupIcon]; the size will be based on the size
      passed to [gtk.icon_theme.IconTheme.lookupIcon]. Note that the resulting
      pixbuf may not be exactly this size; an icon theme may have icons
      that differ slightly from their nominal sizes, and in addition GTK+
      will avoid scaling icons that it considers sufficiently close to the
      requested size or for which the source image would have to be scaled
      up too far. (This maintains sharpness.). This behaviour can be changed
      by passing the [gtk.types.IconLookupFlags.ForceSize] flag when obtaining
      the #GtkIconInfo. If this flag has been specified, the pixbuf
      returned by this function will be scaled to the exact size.
      Returns: the rendered icon; this may be a newly
            created icon or a new reference to an internal icon, so you must
            not modify the icon. Use [gobject.object.ObjectWrap.unref] to release your reference
            to the icon.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadIcon()
  {
    GdkPixbuf* _cretval;
    GError *_err;
    _cretval = gtk_icon_info_load_icon(cast(GtkIconInfo*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously load, render and scale an icon previously looked up
      from the icon theme using [gtk.icon_theme.IconTheme.lookupIcon].
      
      For more details, see [gtk.icon_info.IconInfo.loadIcon] which is the synchronous
      version of this call.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the
              request is satisfied
  */
  void loadIconAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_icon_info_load_icon_async(cast(GtkIconInfo*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async icon load, see [gtk.icon_info.IconInfo.loadIconAsync].
  
      Params:
        res = a #GAsyncResult
      Returns: the rendered icon; this may be a newly
            created icon or a new reference to an internal icon, so you must
            not modify the icon. Use [gobject.object.ObjectWrap.unref] to release your reference
            to the icon.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadIconFinish(gio.async_result.AsyncResult res)
  {
    GdkPixbuf* _cretval;
    GError *_err;
    _cretval = gtk_icon_info_load_icon_finish(cast(GtkIconInfo*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Renders an icon previously looked up in an icon theme using
      [gtk.icon_theme.IconTheme.lookupIcon]; the size will be based on the size
      passed to [gtk.icon_theme.IconTheme.lookupIcon]. Note that the resulting
      surface may not be exactly this size; an icon theme may have icons
      that differ slightly from their nominal sizes, and in addition GTK+
      will avoid scaling icons that it considers sufficiently close to the
      requested size or for which the source image would have to be scaled
      up too far. (This maintains sharpness.). This behaviour can be changed
      by passing the [gtk.types.IconLookupFlags.ForceSize] flag when obtaining
      the #GtkIconInfo. If this flag has been specified, the pixbuf
      returned by this function will be scaled to the exact size.
  
      Params:
        forWindow = #GdkWindow to optimize drawing for, or null
      Returns: the rendered icon; this may be a newly
            created icon or a new reference to an internal icon, so you must
            not modify the icon. Use [cairo.surface.Surface.destroy] to release your
            reference to the icon.
      Throws: [ErrorWrap]
  */
  cairo.surface.Surface loadSurface(gdk.window.Window forWindow = null)
  {
    cairo_surface_t* _cretval;
    GError *_err;
    _cretval = gtk_icon_info_load_surface(cast(GtkIconInfo*)this._cPtr, forWindow ? cast(GdkWindow*)forWindow._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Loads an icon, modifying it to match the system colours for the foreground,
      success, warning and error colors provided. If the icon is not a symbolic
      one, the function will return the result from [gtk.icon_info.IconInfo.loadIcon].
      
      This allows loading symbolic icons that will match the system theme.
      
      Unless you are implementing a widget, you will want to use
      [gio.themed_icon.ThemedIcon.newWithDefaultFallbacks] to load the icon.
      
      As implementation details, the icon loaded needs to be of SVG type,
      contain the “symbolic” term as the last component of the icon name,
      and use the “fg”, “success”, “warning” and “error” CSS styles in the
      SVG file itself.
      
      See the [Symbolic Icons Specification](http://www.freedesktop.org/wiki/SymbolicIcons)
      for more information about symbolic icons.
  
      Params:
        fg = a #GdkRGBA representing the foreground color of the icon
        successColor = a #GdkRGBA representing the warning color
              of the icon or null to use the default color
        warningColor = a #GdkRGBA representing the warning color
              of the icon or null to use the default color
        errorColor = a #GdkRGBA representing the error color
              of the icon or null to use the default color (allow-none)
        wasSymbolic = a #gboolean, returns whether the
              loaded icon was a symbolic one and whether the fg color was
              applied to it.
      Returns: a #GdkPixbuf representing the loaded icon
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadSymbolic(gdk.rgba.RGBA fg, gdk.rgba.RGBA successColor, gdk.rgba.RGBA warningColor, gdk.rgba.RGBA errorColor, out bool wasSymbolic)
  {
    GdkPixbuf* _cretval;
    gboolean _wasSymbolic;
    GError *_err;
    _cretval = gtk_icon_info_load_symbolic(cast(GtkIconInfo*)this._cPtr, fg ? cast(const(GdkRGBA)*)fg._cPtr(No.Dup) : null, successColor ? cast(const(GdkRGBA)*)successColor._cPtr(No.Dup) : null, warningColor ? cast(const(GdkRGBA)*)warningColor._cPtr(No.Dup) : null, errorColor ? cast(const(GdkRGBA)*)errorColor._cPtr(No.Dup) : null, &_wasSymbolic, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    wasSymbolic = cast(bool)_wasSymbolic;
    return _retval;
  }

  /**
      Asynchronously load, render and scale a symbolic icon previously looked up
      from the icon theme using [gtk.icon_theme.IconTheme.lookupIcon].
      
      For more details, see [gtk.icon_info.IconInfo.loadSymbolic] which is the synchronous
      version of this call.
  
      Params:
        fg = a #GdkRGBA representing the foreground color of the icon
        successColor = a #GdkRGBA representing the warning color
              of the icon or null to use the default color
        warningColor = a #GdkRGBA representing the warning color
              of the icon or null to use the default color
        errorColor = a #GdkRGBA representing the error color
              of the icon or null to use the default color (allow-none)
        cancellable = optional #GCancellable object,
              null to ignore
        callback = a #GAsyncReadyCallback to call when the
              request is satisfied
  */
  void loadSymbolicAsync(gdk.rgba.RGBA fg, gdk.rgba.RGBA successColor = null, gdk.rgba.RGBA warningColor = null, gdk.rgba.RGBA errorColor = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_icon_info_load_symbolic_async(cast(GtkIconInfo*)this._cPtr, fg ? cast(const(GdkRGBA)*)fg._cPtr(No.Dup) : null, successColor ? cast(const(GdkRGBA)*)successColor._cPtr(No.Dup) : null, warningColor ? cast(const(GdkRGBA)*)warningColor._cPtr(No.Dup) : null, errorColor ? cast(const(GdkRGBA)*)errorColor._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async icon load, see [gtk.icon_info.IconInfo.loadSymbolicAsync].
  
      Params:
        res = a #GAsyncResult
        wasSymbolic = a #gboolean, returns whether the
              loaded icon was a symbolic one and whether the fg color was
              applied to it.
      Returns: the rendered icon; this may be a newly
            created icon or a new reference to an internal icon, so you must
            not modify the icon. Use [gobject.object.ObjectWrap.unref] to release your reference
            to the icon.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadSymbolicFinish(gio.async_result.AsyncResult res, out bool wasSymbolic)
  {
    GdkPixbuf* _cretval;
    gboolean _wasSymbolic;
    GError *_err;
    _cretval = gtk_icon_info_load_symbolic_finish(cast(GtkIconInfo*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_wasSymbolic, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    wasSymbolic = cast(bool)_wasSymbolic;
    return _retval;
  }

  /**
      Loads an icon, modifying it to match the system colors for the foreground,
      success, warning and error colors provided. If the icon is not a symbolic
      one, the function will return the result from [gtk.icon_info.IconInfo.loadIcon].
      This function uses the regular foreground color and the symbolic colors
      with the names “success_color”, “warning_color” and “error_color” from
      the context.
      
      This allows loading symbolic icons that will match the system theme.
      
      See [gtk.icon_info.IconInfo.loadSymbolic] for more details.
  
      Params:
        context = a #GtkStyleContext
        wasSymbolic = a #gboolean, returns whether the
              loaded icon was a symbolic one and whether the fg color was
              applied to it.
      Returns: a #GdkPixbuf representing the loaded icon
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadSymbolicForContext(gtk.style_context.StyleContext context, out bool wasSymbolic)
  {
    GdkPixbuf* _cretval;
    gboolean _wasSymbolic;
    GError *_err;
    _cretval = gtk_icon_info_load_symbolic_for_context(cast(GtkIconInfo*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, &_wasSymbolic, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    wasSymbolic = cast(bool)_wasSymbolic;
    return _retval;
  }

  /**
      Asynchronously load, render and scale a symbolic icon previously
      looked up from the icon theme using [gtk.icon_theme.IconTheme.lookupIcon].
      
      For more details, see [gtk.icon_info.IconInfo.loadSymbolicForContext]
      which is the synchronous version of this call.
  
      Params:
        context = a #GtkStyleContext
        cancellable = optional #GCancellable object,
              null to ignore
        callback = a #GAsyncReadyCallback to call when the
              request is satisfied
  */
  void loadSymbolicForContextAsync(gtk.style_context.StyleContext context, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_icon_info_load_symbolic_for_context_async(cast(GtkIconInfo*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async icon load, see [gtk.icon_info.IconInfo.loadSymbolicForContextAsync].
  
      Params:
        res = a #GAsyncResult
        wasSymbolic = a #gboolean, returns whether the
              loaded icon was a symbolic one and whether the fg color was
              applied to it.
      Returns: the rendered icon; this may be a newly
            created icon or a new reference to an internal icon, so you must
            not modify the icon. Use [gobject.object.ObjectWrap.unref] to release your reference
            to the icon.
      Throws: [ErrorWrap]
  */
  gdkpixbuf.pixbuf.Pixbuf loadSymbolicForContextFinish(gio.async_result.AsyncResult res, out bool wasSymbolic)
  {
    GdkPixbuf* _cretval;
    gboolean _wasSymbolic;
    GError *_err;
    _cretval = gtk_icon_info_load_symbolic_for_context_finish(cast(GtkIconInfo*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_wasSymbolic, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    wasSymbolic = cast(bool)_wasSymbolic;
    return _retval;
  }

  /**
      Loads an icon, modifying it to match the system colours for the foreground,
      success, warning and error colors provided. If the icon is not a symbolic
      one, the function will return the result from [gtk.icon_info.IconInfo.loadIcon].
      
      This allows loading symbolic icons that will match the system theme.
      
      See [gtk.icon_info.IconInfo.loadSymbolic] for more details.
  
      Params:
        style = a #GtkStyle to take the colors from
        state = the widget state to use for colors
        wasSymbolic = a #gboolean, returns whether the
              loaded icon was a symbolic one and whether the fg color was
              applied to it.
      Returns: a #GdkPixbuf representing the loaded icon
      Throws: [ErrorWrap]
  
      Deprecated: Use [gtk.icon_info.IconInfo.loadSymbolicForContext] instead
  */
  gdkpixbuf.pixbuf.Pixbuf loadSymbolicForStyle(gtk.style.Style style, gtk.types.StateType state, out bool wasSymbolic)
  {
    GdkPixbuf* _cretval;
    gboolean _wasSymbolic;
    GError *_err;
    _cretval = gtk_icon_info_load_symbolic_for_style(cast(GtkIconInfo*)this._cPtr, style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, state, &_wasSymbolic, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    wasSymbolic = cast(bool)_wasSymbolic;
    return _retval;
  }

  /**
      Sets whether the coordinates returned by [gtk.icon_info.IconInfo.getEmbeddedRect]
      and [gtk.icon_info.IconInfo.getAttachPoints] should be returned in their
      original form as specified in the icon theme, instead of scaled
      appropriately for the pixbuf returned by [gtk.icon_info.IconInfo.loadIcon].
      
      Raw coordinates are somewhat strange; they are specified to be with
      respect to the unscaled pixmap for PNG and XPM icons, but for SVG
      icons, they are in a 1000x1000 coordinate space that is scaled
      to the final size of the icon.  You can determine if the icon is an SVG
      icon by using [gtk.icon_info.IconInfo.getFilename], and seeing if it is non-null
      and ends in “.svg”.
      
      This function is provided primarily to allow compatibility wrappers
      for older API's, and is not expected to be useful for applications.
  
      Params:
        rawCoordinates = whether the coordinates of embedded rectangles
              and attached points should be returned in their original
              (unscaled) form.
  
      Deprecated: Embedded rectangles and attachment points are deprecated
  */
  void setRawCoordinates(bool rawCoordinates)
  {
    gtk_icon_info_set_raw_coordinates(cast(GtkIconInfo*)this._cPtr, rawCoordinates);
  }
}
