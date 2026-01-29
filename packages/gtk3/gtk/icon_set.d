/// Module for [IconSet] class
module gtk.icon_set;

import cairo.surface;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_source;
import gtk.style;
import gtk.style_context;
import gtk.types;
import gtk.widget;

/** */
class IconSet : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_set_get_type != &gidSymbolNotFound ? gtk_icon_set_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IconSet self()
  {
    return this;
  }

  /**
      Creates a new #GtkIconSet. A #GtkIconSet represents a single icon
      in various sizes and widget states. It can provide a #GdkPixbuf
      for a given size and state on request, and automatically caches
      some of the rendered #GdkPixbuf objects.
      
      Normally you would use [gtk.widget.Widget.renderIconPixbuf] instead of
      using #GtkIconSet directly. The one case where you’d use
      #GtkIconSet is to create application-specific icon sets to place in
      a #GtkIconFactory.
      Returns: a new #GtkIconSet
  
      Deprecated: Use #GtkIconTheme instead.
  */
  this()
  {
    GtkIconSet* _cretval;
    _cretval = gtk_icon_set_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkIconSet with pixbuf as the default/fallback
      source image. If you don’t add any additional #GtkIconSource to the
      icon set, all variants of the icon will be created from pixbuf,
      using scaling, pixelation, etc. as required to adjust the icon size
      or make the icon look insensitive/prelighted.
  
      Params:
        pixbuf = a #GdkPixbuf
      Returns: a new #GtkIconSet
  
      Deprecated: Use #GtkIconTheme instead.
  */
  static gtk.icon_set.IconSet newFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GtkIconSet* _cretval;
    _cretval = gtk_icon_set_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.icon_set.IconSet(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Icon sets have a list of #GtkIconSource, which they use as base
      icons for rendering icons in different states and sizes. Icons are
      scaled, made to look insensitive, etc. in
      [gtk.icon_set.IconSet.renderIcon], but #GtkIconSet needs base images to
      work with. The base images and when to use them are described by
      a #GtkIconSource.
      
      This function copies source, so you can reuse the same source immediately
      without affecting the icon set.
      
      An example of when you’d use this function: a web browser’s "Back
      to Previous Page" icon might point in a different direction in
      Hebrew and in English; it might look different when insensitive;
      and it might change size depending on toolbar mode (small/large
      icons). So a single icon set would contain all those variants of
      the icon, and you might add a separate source for each one.
      
      You should nearly always add a “default” icon source with all
      fields wildcarded, which will be used as a fallback if no more
      specific source matches. #GtkIconSet always prefers more specific
      icon sources to more generic icon sources. The order in which you
      add the sources to the icon set does not matter.
      
      [gtk.icon_set.IconSet.newFromPixbuf] creates a new icon set with a
      default icon source based on the given pixbuf.
  
      Params:
        source = a #GtkIconSource
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void addSource(gtk.icon_source.IconSource source)
  {
    gtk_icon_set_add_source(cast(GtkIconSet*)this._cPtr, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null);
  }

  /**
      Copies icon_set by value.
      Returns: a new #GtkIconSet identical to the first.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gtk.icon_set.IconSet copy()
  {
    GtkIconSet* _cretval;
    _cretval = gtk_icon_set_copy(cast(GtkIconSet*)this._cPtr);
    auto _retval = _cretval ? new gtk.icon_set.IconSet(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtains a list of icon sizes this icon set can render. The returned
      array must be freed with [glib.global.gfree].
  
      Params:
        sizes = return location
              for array of sizes (#GtkIconSize)
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void getSizes(out gtk.types.IconSize[] sizes)
  {
    int _nSizes;
    GtkIconSize* _sizes;
    gtk_icon_set_get_sizes(cast(GtkIconSet*)this._cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = (cast(gtk.types.IconSize*)_sizes)[0 .. _nSizes];
    gFree(cast(void*)_sizes);
  }

  /**
      Renders an icon using [gtk.style.Style.renderIcon]. In most cases,
      [gtk.widget.Widget.renderIcon] is better, since it automatically provides
      most of the arguments from the current widget settings.  This
      function never returns null; if the icon can’t be rendered
      (perhaps because an image file fails to load), a default "missing
      image" icon will be returned instead.
  
      Params:
        style = a #GtkStyle associated with widget, or null
        direction = text direction
        state = widget state
        size = icon size (#GtkIconSize). A size of `(GtkIconSize)-1`
                 means render at the size of the source and don’t scale.
        widget = widget that will display the icon, or null.
                   The only use that is typically made of this
                   is to determine the appropriate #GdkScreen.
        detail = detail to pass to the theme engine, or null.
                   Note that passing a detail of anything but null
                   will disable caching.
      Returns: a #GdkPixbuf to be displayed
  
      Deprecated: Use [gtk.icon_set.IconSet.renderIconPixbuf] instead
  */
  gdkpixbuf.pixbuf.Pixbuf renderIcon(gtk.style.Style style, gtk.types.TextDirection direction, gtk.types.StateType state, gtk.types.IconSize size, gtk.widget.Widget widget = null, string detail = null)
  {
    GdkPixbuf* _cretval;
    const(char)* _detail = detail.toCString(No.Alloc);
    _cretval = gtk_icon_set_render_icon(cast(GtkIconSet*)this._cPtr, style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, direction, state, size, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Renders an icon using [gtk.global.renderIconPixbuf]. In most cases,
      [gtk.widget.Widget.renderIconPixbuf] is better, since it automatically provides
      most of the arguments from the current widget settings.  This
      function never returns null; if the icon can’t be rendered
      (perhaps because an image file fails to load), a default "missing
      image" icon will be returned instead.
  
      Params:
        context = a #GtkStyleContext
        size = icon size (#GtkIconSize). A size of `(GtkIconSize)-1`
                 means render at the size of the source and don’t scale.
      Returns: a #GdkPixbuf to be displayed
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gdkpixbuf.pixbuf.Pixbuf renderIconPixbuf(gtk.style_context.StyleContext context, gtk.types.IconSize size)
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_icon_set_render_icon_pixbuf(cast(GtkIconSet*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Renders an icon using [gtk.global.renderIconPixbuf] and converts it to a
      cairo surface.
      
      This function never returns null; if the icon can’t be rendered
      (perhaps because an image file fails to load), a default "missing
      image" icon will be returned instead.
  
      Params:
        context = a #GtkStyleContext
        size = icon size (#GtkIconSize). A size of `(GtkIconSize)-1`
                 means render at the size of the source and don’t scale.
        scale = the window scale to render for
        forWindow = #GdkWindow to optimize drawing for, or null
      Returns: a #cairo_surface_t to be displayed
  
      Deprecated: Use #GtkIconTheme instead.
  */
  cairo.surface.Surface renderIconSurface(gtk.style_context.StyleContext context, gtk.types.IconSize size, int scale, gdk.window.Window forWindow = null)
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_icon_set_render_icon_surface(cast(GtkIconSet*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, size, scale, forWindow ? cast(GdkWindow*)forWindow._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
