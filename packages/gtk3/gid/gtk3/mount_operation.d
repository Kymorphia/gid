/// Module for [MountOperation] class
module gid.gtk3.mount_operation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.screen;
import gid.gio2.mount_operation;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    This should not be accessed directly. Use the accessor functions below.
*/
class MountOperation : gid.gio2.mount_operation.MountOperation
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
    return cast(void function())gtk_mount_operation_get_type != &gidSymbolNotFound ? gtk_mount_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMountOperation";
  }

  /** Returns `this`, for use in `with` statements. */
  override MountOperation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.mount_operation.MountOperation]
      Returns: New builder object
  */
  static MountOperationGidBuilder builder() nothrow
  {
    return new MountOperationGidBuilder;
  }

  /** */
  @property gid.gtk3.window.Window parent() nothrow
  {
    return getParent();
  }

  /** */
  @property void parent(gid.gtk3.window.Window propval) nothrow
  {
    setParent(propval);
  }

  /** */
  @property gid.gdk3.screen.Screen screen() nothrow
  {
    return getScreen();
  }

  /** */
  @property void screen(gid.gdk3.screen.Screen propval) nothrow
  {
    setScreen(propval);
  }

  /**
      Creates a new #GtkMountOperation
  
      Params:
        parent = transient parent of the window, or null
      Returns: a new #GtkMountOperation
  */
  this(gid.gtk3.window.Window parent = null) nothrow
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the transient parent used by the #GtkMountOperation
      Returns: the transient parent for windows shown by op
  */
  gid.gtk3.window.Window getParent() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the screen on which windows of the #GtkMountOperation
      will be shown.
      Returns: the screen on which windows of op are shown
  */
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_mount_operation_get_screen(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
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
  void setParent(gid.gtk3.window.Window parent = null) nothrow
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets the screen to show windows of the #GtkMountOperation on.
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    gtk_mount_operation_set_screen(cast(GtkMountOperation*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.mount_operation.MountOperation]
class MountOperationGidBuilderImpl(T) : gid.gio2.mount_operation.MountOperationGidBuilderImpl!T
{

  /** */
  T parent(gid.gtk3.window.Window propval) nothrow
  {
    return setProperty("parent", propval);
  }

  /** */
  T screen(gid.gdk3.screen.Screen propval) nothrow
  {
    return setProperty("screen", propval);
  }
}

/// Fluent builder for [gid.gtk3.mount_operation.MountOperation]
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
