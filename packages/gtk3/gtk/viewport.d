module gtk.viewport;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;

/**
    The #GtkViewport widget acts as an adaptor class, implementing
  scrollability for child widgets that lack their own scrolling
  capabilities. Use GtkViewport to scroll child widgets such as
  #GtkGrid, #GtkBox, and so on.
  
  If a widget has native scrolling abilities, such as #GtkTextView,
  #GtkTreeView or #GtkIconView, it can be added to a #GtkScrolledWindow
  with [gtk.container.Container.add]. If a widget does not, you must first add the
  widget to a #GtkViewport, then add the viewport to the scrolled window.
  [gtk.container.Container.add] does this automatically if a child that does not
  implement #GtkScrollable is added to a #GtkScrolledWindow, so you can
  ignore the presence of the viewport.
  
  The GtkViewport will start scrolling content only if allocated less
  than the child widget’s minimum size in a given orientation.
  
  # CSS nodes
  
  GtkViewport has a single CSS node with name viewport.
*/
class Viewport : gtk.bin.Bin, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_viewport_get_type != &gidSymbolNotFound ? gtk_viewport_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Viewport self()
  {
    return this;
  }

  mixin ScrollableT!();

  /**
      Creates a new #GtkViewport with the given adjustments, or with default
    adjustments if none are given.
    Params:
      hadjustment =       horizontal adjustment
      vadjustment =       vertical adjustment
    Returns:     a new #GtkViewport
  */
  this(gtk.adjustment.Adjustment hadjustment = null, gtk.adjustment.Adjustment vadjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_viewport_new(hadjustment ? cast(GtkAdjustment*)hadjustment.cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the bin window of the #GtkViewport.
    Returns:     a #GdkWindow
  */
  gdk.window.Window getBinWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_viewport_get_bin_window(cast(GtkViewport*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the horizontal adjustment of the viewport.
    Returns:     the horizontal adjustment of viewport.
  
    Deprecated:     Use [gtk.scrollable.Scrollable.getHadjustment]
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_viewport_get_hadjustment(cast(GtkViewport*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the shadow type of the #GtkViewport. See
    [gtk.viewport.Viewport.setShadowType].
    Returns:     the shadow type
  */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_viewport_get_shadow_type(cast(GtkViewport*)cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Returns the vertical adjustment of the viewport.
    Returns:     the vertical adjustment of viewport.
  
    Deprecated:     Use [gtk.scrollable.Scrollable.getVadjustment]
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_viewport_get_vadjustment(cast(GtkViewport*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the view window of the #GtkViewport.
    Returns:     a #GdkWindow
  */
  gdk.window.Window getViewWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_viewport_get_view_window(cast(GtkViewport*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the viewport.
    Params:
      adjustment =       a #GtkAdjustment.
  
    Deprecated:     Use [gtk.scrollable.Scrollable.setHadjustment]
  */
  void setHadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_viewport_set_hadjustment(cast(GtkViewport*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }

  /**
      Sets the shadow type of the viewport.
    Params:
      type =       the new shadow type.
  */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_viewport_set_shadow_type(cast(GtkViewport*)cPtr, type);
  }

  /**
      Sets the vertical adjustment of the viewport.
    Params:
      adjustment =       a #GtkAdjustment.
  
    Deprecated:     Use [gtk.scrollable.Scrollable.setVadjustment]
  */
  void setVadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_viewport_set_vadjustment(cast(GtkViewport*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }
}
