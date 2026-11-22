/// Module for [IconSet] class
module gid.gtk3.icon_set;

public import gid.core.basictypes;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdk3.window;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.icon_source;
import gid.gtk3.style;
import gid.gtk3.style_context;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class IconSet : gid.gobject2.boxed.BoxedWrap!(gtk_icon_set_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override IconSet self() nothrow
  {
    return this;
  }

  /**
      Creates a new #GtkIconSet. A #GtkIconSet represents a single icon
      in various sizes and widget states. It can provide a #GdkPixbuf
      for a given size and state on request, and automatically caches
      some of the rendered #GdkPixbuf objects.
      
      Normally you would use [gid.gtk3.widget.Widget.renderIconPixbuf] instead of
      using #GtkIconSet directly. The one case where you’d use
      #GtkIconSet is to create application-specific icon sets to place in
      a #GtkIconFactory.
      Returns: a new #GtkIconSet
  
      Deprecated: Use #GtkIconTheme instead.
  */
  this() nothrow
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
  static gid.gtk3.icon_set.IconSet newFromPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    GtkIconSet* _cretval;
    _cretval = gtk_icon_set_new_from_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk3.icon_set.IconSet(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Icon sets have a list of #GtkIconSource, which they use as base
      icons for rendering icons in different states and sizes. Icons are
      scaled, made to look insensitive, etc. in
      [gid.gtk3.icon_set.IconSet.renderIcon], but #GtkIconSet needs base images to
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
      
      [gid.gtk3.icon_set.IconSet.newFromPixbuf] creates a new icon set with a
      default icon source based on the given pixbuf.
  
      Params:
        source = a #GtkIconSource
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void addSource(gid.gtk3.icon_source.IconSource source) nothrow
  {
    gtk_icon_set_add_source(cast(GtkIconSet*)this._cPtr, source ? cast(const(GtkIconSource)*)source._cPtr(No.Dup) : null);
  }

  /**
      Copies icon_set by value.
      Returns: a new #GtkIconSet identical to the first.
  
      Deprecated: Use #GtkIconTheme instead.
  */
  gid.gtk3.icon_set.IconSet copy() nothrow
  {
    GtkIconSet* _cretval;
    _cretval = gtk_icon_set_copy(cast(GtkIconSet*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.icon_set.IconSet(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Obtains a list of icon sizes this icon set can render. The returned
      array must be freed with [gid.glib2.global.gfree].
  
      Params:
        sizes = return location
              for array of sizes (#GtkIconSize)
  
      Deprecated: Use #GtkIconTheme instead.
  */
  void getSizes(out gid.gtk3.types.IconSize[] sizes) nothrow
  {
    int _nSizes;
    GtkIconSize* _sizes;
    gtk_icon_set_get_sizes(cast(GtkIconSet*)this._cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = (cast(gid.gtk3.types.IconSize*)_sizes)[0 .. _nSizes];
    gFree(cast(void*)_sizes);
  }

  /**
      Renders an icon using [gid.gtk3.style.Style.renderIcon]. In most cases,
      [gid.gtk3.widget.Widget.renderIcon] is better, since it automatically provides
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
  
      Deprecated: Use [gid.gtk3.icon_set.IconSet.renderIconPixbuf] instead
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf renderIcon(gid.gtk3.style.Style style, gid.gtk3.types.TextDirection direction, gid.gtk3.types.StateType state, gid.gtk3.types.IconSize size, gid.gtk3.widget.Widget widget = null, string detail = null) nothrow
  {
    GdkPixbuf* _cretval;
    const(char)* _detail = detail.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_icon_set_render_icon(cast(GtkIconSet*)this._cPtr, style ? cast(GtkStyle*)style._cPtr(No.Dup) : null, direction, state, size, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, _detail);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Renders an icon using [gid.gtk3.global.renderIconPixbuf]. In most cases,
      [gid.gtk3.widget.Widget.renderIconPixbuf] is better, since it automatically provides
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
  gid.gdkpixbuf2.pixbuf.Pixbuf renderIconPixbuf(gid.gtk3.style_context.StyleContext context, gid.gtk3.types.IconSize size) nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_icon_set_render_icon_pixbuf(cast(GtkIconSet*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, size);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Renders an icon using [gid.gtk3.global.renderIconPixbuf] and converts it to a
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
  gid.cairo1.surface.Surface renderIconSurface(gid.gtk3.style_context.StyleContext context, gid.gtk3.types.IconSize size, int scale, gid.gdk3.window.Window forWindow = null) nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_icon_set_render_icon_surface(cast(GtkIconSet*)this._cPtr, context ? cast(GtkStyleContext*)context._cPtr(No.Dup) : null, size, scale, forWindow ? cast(GdkWindow*)forWindow._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
