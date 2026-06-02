/// Module for [MountOperation] class
module gtk.mount_operation;

public import gid.basictypes;
import gdk.screen;
import gid.gid;
import gio.mount_operation;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    This should not be accessed directly. Use the accessor functions below.
*/
class MountOperation : gio.mount_operation.MountOperation
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_mount_operation_get_type != &gidSymbolNotFound ? gtk_mount_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MountOperation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.mount_operation.MountOperation]
      Returns: New builder object
  */
  static MountOperationGidBuilder builder() nothrow
  {
    return new MountOperationGidBuilder;
  }

  /** */
  @property gtk.window.Window parent() nothrow
  {
    return getParent();
  }

  /** */
  @property void parent(gtk.window.Window propval) nothrow
  {
    setParent(propval);
  }

  /** */
  @property gdk.screen.Screen screen() nothrow
  {
    return getScreen();
  }

  /** */
  @property void screen(gdk.screen.Screen propval) nothrow
  {
    setScreen(propval);
  }

  /**
      Creates a new #GtkMountOperation
  
      Params:
        parent = transient parent of the window, or null
      Returns: a new #GtkMountOperation
  */
  this(gtk.window.Window parent = null) nothrow
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the transient parent used by the #GtkMountOperation
      Returns: the transient parent for windows shown by op
  */
  gtk.window.Window getParent() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the screen on which windows of the #GtkMountOperation
      will be shown.
      Returns: the screen on which windows of op are shown
  */
  gdk.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_mount_operation_get_screen(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the #GtkMountOperation is currently displaying
      a window.
      Returns: true if op is currently displaying a window
  */
  bool isShowing() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_mount_operation_is_showing(cast(GtkMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Sets the transient parent for windows shown by the
      #GtkMountOperation.
  
      Params:
        parent = transient parent of the window, or null
  */
  void setParent(gtk.window.Window parent = null) nothrow
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets the screen to show windows of the #GtkMountOperation on.
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gdk.screen.Screen screen) nothrow
  {
    gtk_mount_operation_set_screen(cast(GtkMountOperation*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.mount_operation.MountOperation]
class MountOperationGidBuilderImpl(T) : gio.mount_operation.MountOperationGidBuilderImpl!T
{

  /** */
  T parent(gtk.window.Window propval) nothrow
  {
    return setProperty("parent", propval);
  }

  /** */
  T screen(gdk.screen.Screen propval) nothrow
  {
    return setProperty("screen", propval);
  }
}

/// Fluent builder for [gtk.mount_operation.MountOperation]
final class MountOperationGidBuilder : MountOperationGidBuilderImpl!MountOperationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MountOperation build() nothrow
  {
    return new MountOperation(cast(void*)createGObject(MountOperation._getGType), Yes.Take);
  }
}
