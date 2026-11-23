/// Module for [Viewport] class
module gid.gtk3.viewport;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.window;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.types;

/**
    The #GtkViewport widget acts as an adaptor class, implementing
    scrollability for child widgets that lack their own scrolling
    capabilities. Use GtkViewport to scroll child widgets such as
    #GtkGrid, #GtkBox, and so on.
    
    If a widget has native scrolling abilities, such as #GtkTextView,
    #GtkTreeView or #GtkIconView, it can be added to a #GtkScrolledWindow
    with [gid.gtk3.container.Container.add]. If a widget does not, you must first add the
    widget to a #GtkViewport, then add the viewport to the scrolled window.
    [gid.gtk3.container.Container.add] does this automatically if a child that does not
    implement #GtkScrollable is added to a #GtkScrolledWindow, so you can
    ignore the presence of the viewport.
    
    The GtkViewport will start scrolling content only if allocated less
    than the child widget’s minimum size in a given orientation.
    
    # CSS nodes
    
    GtkViewport has a single CSS node with name viewport.
*/
class Viewport : gid.gtk3.bin.Bin, gid.gtk3.scrollable.Scrollable
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
    return cast(void function())gtk_viewport_get_type != &gidSymbolNotFound ? gtk_viewport_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkViewport";
  }

  /** Returns `this`, for use in `with` statements. */
  override Viewport self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.viewport.Viewport]
      Returns: New builder object
  */
  static ViewportGidBuilder builder() nothrow
  {
    return new ViewportGidBuilder;
  }

  /** */
  @property gid.gtk3.types.ShadowType shadowType() nothrow
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    setShadowType(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new #GtkViewport with the given adjustments, or with default
      adjustments if none are given.
  
      Params:
        hadjustment = horizontal adjustment
        vadjustment = vertical adjustment
      Returns: a new #GtkViewport
  */
  this(gid.gtk3.adjustment.Adjustment hadjustment = null, gid.gtk3.adjustment.Adjustment vadjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, hadjustment !is null || vadjustment !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_viewport_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the bin window of the #GtkViewport.
      Returns: a #GdkWindow
  */
  gid.gdk3.window.Window getBinWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_viewport_get_bin_window(cast(GtkViewport*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the horizontal adjustment of the viewport.
      Returns: the horizontal adjustment of viewport.
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getHadjustment]
  */
  gid.gtk3.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_viewport_get_hadjustment(cast(GtkViewport*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the shadow type of the #GtkViewport. See
      [gid.gtk3.viewport.Viewport.setShadowType].
      Returns: the shadow type
  */
  gid.gtk3.types.ShadowType getShadowType() nothrow
  {
    GtkShadowType _cretval;
    _cretval = gtk_viewport_get_shadow_type(cast(GtkViewport*)this._cPtr);
    gid.gtk3.types.ShadowType _retval = cast(gid.gtk3.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Returns the vertical adjustment of the viewport.
      Returns: the vertical adjustment of viewport.
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getVadjustment]
  */
  gid.gtk3.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_viewport_get_vadjustment(cast(GtkViewport*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the view window of the #GtkViewport.
      Returns: a #GdkWindow
  */
  gid.gdk3.window.Window getViewWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_viewport_get_view_window(cast(GtkViewport*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the viewport.
  
      Params:
        adjustment = a #GtkAdjustment.
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.setHadjustment]
  */
  void setHadjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_viewport_set_hadjustment(cast(GtkViewport*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the shadow type of the viewport.
  
      Params:
        type = the new shadow type.
  */
  void setShadowType(gid.gtk3.types.ShadowType type) nothrow
  {
    gtk_viewport_set_shadow_type(cast(GtkViewport*)this._cPtr, type);
  }

  /**
      Sets the vertical adjustment of the viewport.
  
      Params:
        adjustment = a #GtkAdjustment.
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.setVadjustment]
  */
  void setVadjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_viewport_set_vadjustment(cast(GtkViewport*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.viewport.Viewport]
class ViewportGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /** */
  T shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    return setProperty("shadow-type", propval);
  }
}

/// Fluent builder for [gid.gtk3.viewport.Viewport]
final class ViewportGidBuilder : ViewportGidBuilderImpl!ViewportGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Viewport build() nothrow
  {
    return new Viewport(cast(void*)createGObject(Viewport._getGType), Yes.Take);
  }
}
