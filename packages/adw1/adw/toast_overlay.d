/// Module for [ToastOverlay] class
module adw.toast_overlay;

import adw.c.functions;
import adw.c.types;
import adw.toast;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget showing toasts above its content.
    
    <picture>
      <source srcset="toast-overlay-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-overlay.png" alt="toast-overlay">
    </picture>
    
    Much like [gtk.overlay.Overlay], [adw.toast_overlay.ToastOverlay] is a container with a single
    main child, on top of which it can display a `class@Toast`, overlaid.
    Toasts can be shown with [adw.toast_overlay.ToastOverlay.addToast].
    
    See `class@Toast` for details.
    
    ## CSS nodes
    
    ```
    toastoverlay
    ├── [child]
    ├── toast
    ┊   ├── widget
    ┊   │   ├── [label.heading]
        │   ╰── [custom title]
        ├── [button]
        ╰── button.circular.flat
    ```
    
    [adw.toast_overlay.ToastOverlay]'s CSS node is called `toastoverlay`. It contains the child,
    as well as zero or more `toast` subnodes.
    
    Each of the `toast` nodes contains a `widget` subnode, optionally a `button`
    subnode, and another `button` subnode with `.circular` and `.flat` style
    classes.
    
    The `widget` subnode contains a `label` subnode with the `.heading` style
    class, or a custom widget provided by the application.
    
    ## Accessibility
    
    [adw.toast_overlay.ToastOverlay] uses the `GTK_ACCESSIBLE_ROLE_TAB_GROUP` role.
*/
class ToastOverlay : gtk.widget.Widget
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
    return cast(void function())adw_toast_overlay_get_type != &gidSymbolNotFound ? adw_toast_overlay_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToastOverlay self()
  {
    return this;
  }

  /**
  Get builder for [adw.toast_overlay.ToastOverlay]
  Returns: New builder object
  */
  static ToastOverlayGidBuilder builder()
  {
    return new ToastOverlayGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Creates a new [adw.toast_overlay.ToastOverlay].
      Returns: the new created [adw.toast_overlay.ToastOverlay]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_overlay_new();
    this(_cretval, No.Take);
  }

  /**
      Displays toast.
      
      Only one toast can be shown at a time; if a toast is already being displayed,
      either toast or the original toast will be placed in a queue, depending on
      the priority of toast. See `propertyToast:priority`.
      
      If called on a toast that's already displayed, its timeout will be reset.
      
      If called on a toast currently in the queue, the toast will be bumped
      forward to be shown as soon as possible.
  
      Params:
        toast = a toast
  */
  void addToast(adw.toast.Toast toast)
  {
    adw_toast_overlay_add_toast(cast(AdwToastOverlay*)this._cPtr, toast ? cast(AdwToast*)toast._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_overlay_get_child(cast(AdwToastOverlay*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_toast_overlay_set_child(cast(AdwToastOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

class ToastOverlayGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [adw.toast_overlay.ToastOverlay]
final class ToastOverlayGidBuilder : ToastOverlayGidBuilderImpl!ToastOverlayGidBuilder
{
  ToastOverlay build()
  {
    return new ToastOverlay(cast(void*)createGObject(ToastOverlay._getGType), No.Take);
  }
}
