/// Module for [ToastOverlay] class
module gid.adw1.toast_overlay;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.toast;
import gid.adw1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A widget showing toasts above its content.
    
    <picture>
      <source srcset="toast-overlay-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-overlay.png" alt="toast-overlay">
    </picture>
    
    Much like [gid.gtk4.overlay.Overlay], [gid.adw1.toast_overlay.ToastOverlay] is a container with a single
    main child, on top of which it can display a [gid.adw1.toast.Toast], overlaid.
    Toasts can be shown with [gid.adw1.toast_overlay.ToastOverlay.addToast].
    
    Use [gid.adw1.toast_overlay.ToastOverlay.dismissAll] to dismiss all toasts at once, or
    [gid.adw1.toast.Toast.dismiss] to dismiss a single toast.
    
    See [gid.adw1.toast.Toast] for details.
    
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
    
    [gid.adw1.toast_overlay.ToastOverlay]'s CSS node is called `toastoverlay`. It contains the child,
    as well as zero or more `toast` subnodes.
    
    Each of the `toast` nodes contains a `widget` subnode, optionally a `button`
    subnode, and another `button` subnode with `.circular` and `.flat` style
    classes.
    
    The `widget` subnode contains a `label` subnode with the `.heading` style
    class, or a custom widget provided by the application.
    
    ## Accessibility
    
    [gid.adw1.toast_overlay.ToastOverlay] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class ToastOverlay : gid.gtk4.widget.Widget
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
    return cast(void function())adw_toast_overlay_get_type != &gidSymbolNotFound ? adw_toast_overlay_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwToastOverlay";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToastOverlay self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.toast_overlay.ToastOverlay]
      Returns: New builder object
  */
  static ToastOverlayGidBuilder builder() nothrow
  {
    return new ToastOverlayGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gid.adw1.toast_overlay.ToastOverlay].
      Returns: the new created [gid.adw1.toast_overlay.ToastOverlay]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_overlay_new();
    this(_cretval, No.Take);
  }

  /**
      Displays toast.
      
      Only one toast can be shown at a time; if a toast is already being displayed,
      either toast or the original toast will be placed in a queue, depending on
      the priority of toast. See [gid.adw1.toast.Toast.priority].
      
      If called on a toast that's already displayed, its timeout will be reset.
      
      If called on a toast currently in the queue, the toast will be bumped
      forward to be shown as soon as possible.
  
      Params:
        toast = a toast
  */
  void addToast(gid.adw1.toast.Toast toast) nothrow
  {
    adw_toast_overlay_add_toast(cast(AdwToastOverlay*)this._cPtr, toast ? cast(AdwToast*)toast._cPtr(Yes.Dup) : null);
  }

  /**
      Dismisses all displayed toasts.
      
      Use [gid.adw1.toast.Toast.dismiss] to dismiss a single toast.
  */
  void dismissAll() nothrow
  {
    adw_toast_overlay_dismiss_all(cast(AdwToastOverlay*)this._cPtr);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_overlay_get_child(cast(AdwToastOverlay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_toast_overlay_set_child(cast(AdwToastOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.toast_overlay.ToastOverlay]
class ToastOverlayGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.adw1.toast_overlay.ToastOverlay]
final class ToastOverlayGidBuilder : ToastOverlayGidBuilderImpl!ToastOverlayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToastOverlay build() nothrow
  {
    return new ToastOverlay(cast(void*)createGObject(ToastOverlay._getGType), Yes.Take);
  }
}
