/// Module for [OffscreenWindow] class
module gid.gtk3.offscreen_window;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.cairo1.surface;
import gid.core.gid;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    GtkOffscreenWindow is strictly intended to be used for obtaining
    snapshots of widgets that are not part of a normal widget hierarchy.
    Since #GtkOffscreenWindow is a toplevel widget you cannot obtain
    snapshots of a full window with it since you cannot pack a toplevel
    widget in another toplevel.
    
    The idea is to take a widget and manually set the state of it,
    add it to a GtkOffscreenWindow and then retrieve the snapshot
    as a #cairo_surface_t or #GdkPixbuf.
    
    GtkOffscreenWindow derives from #GtkWindow only as an implementation
    detail.  Applications should not use any API specific to #GtkWindow
    to operate on this object.  It should be treated as a #GtkBin that
    has no parent widget.
    
    When contained offscreen widgets are redrawn, GtkOffscreenWindow
    will emit a #GtkWidget::damage-event signal.
*/
class OffscreenWindow : gid.gtk3.window.Window
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
    return cast(void function())gtk_offscreen_window_get_type != &gidSymbolNotFound ? gtk_offscreen_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkOffscreenWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override OffscreenWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.offscreen_window.OffscreenWindow]
      Returns: New builder object
  */
  static OffscreenWindowGidBuilder builder() nothrow
  {
    return new OffscreenWindowGidBuilder;
  }

  /**
      Creates a toplevel container widget that is used to retrieve
      snapshots of widgets without showing them on the screen.
      Returns: A pointer to a #GtkWidget
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_offscreen_window_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves a snapshot of the contained widget in the form of
      a #GdkPixbuf.  This is a new pixbuf with a reference count of 1,
      and the application should unreference it once it is no longer
      needed.
      Returns: A #GdkPixbuf pointer, or null.
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_offscreen_window_get_pixbuf(cast(GtkOffscreenWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a snapshot of the contained widget in the form of
      a #cairo_surface_t.  If you need to keep this around over window
      resizes then you should add a reference to it.
      Returns: A #cairo_surface_t pointer to the offscreen
            surface, or null.
  */
  gid.cairo1.surface.Surface getSurface() nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_offscreen_window_get_surface(cast(GtkOffscreenWindow*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.offscreen_window.OffscreenWindow]
class OffscreenWindowGidBuilderImpl(T) : gid.gtk3.window.WindowGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.offscreen_window.OffscreenWindow]
final class OffscreenWindowGidBuilder : OffscreenWindowGidBuilderImpl!OffscreenWindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OffscreenWindow build() nothrow
  {
    return new OffscreenWindow(cast(void*)createGObject(OffscreenWindow._getGType), Yes.Take);
  }
}
