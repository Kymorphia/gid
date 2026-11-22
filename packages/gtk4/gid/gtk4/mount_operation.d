/// Module for [MountOperation] class
module gid.gtk4.mount_operation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.display;
import gid.gio2.mount_operation;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Asks the user for passwords and other information required to
    mount a volume.
    
    [gid.gtk4.mount_operation.MountOperation] is needed when mounting volumes:
    It is an implementation of [gid.gio2.mount_operation.MountOperation] that can be used with
    GIO functions for mounting volumes such as
    [gid.gio2.file.File.mountEnclosingVolume],
    [gid.gio2.file.File.mountMountable],
    [gid.gio2.volume.Volume.mount],
    [gid.gio2.mount.Mount.unmountWithOperation] and others.
    
    When necessary, [gid.gtk4.mount_operation.MountOperation] shows dialogs to let the user
    enter passwords, ask questions or show processes blocking unmount.
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
      Get builder for [gid.gtk4.mount_operation.MountOperation]
      Returns: New builder object
  */
  static MountOperationGidBuilder builder() nothrow
  {
    return new MountOperationGidBuilder;
  }

  /**
      Get `display` property.
      Returns: The display where dialogs will be shown.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Set `display` property.
      Params:
        propval = The display where dialogs will be shown.
  */
  @property void display(gid.gdk4.display.Display propval) nothrow
  {
    setDisplay(propval);
  }

  /**
      Get `parent` property.
      Returns: The parent window.
  */
  @property gid.gtk4.window.Window parent() nothrow
  {
    return getParent();
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent window.
  */
  @property void parent(gid.gtk4.window.Window propval) nothrow
  {
    setParent(propval);
  }

  /**
      Creates a new [gid.gtk4.mount_operation.MountOperation].
  
      Params:
        parent = transient parent of the window
      Returns: a new [gid.gtk4.mount_operation.MountOperation]
  */
  this(gid.gtk4.window.Window parent = null) nothrow
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the display on which windows of the [gid.gtk4.mount_operation.MountOperation]
      will be shown.
      Returns: the display on which windows of op are shown
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gtk_mount_operation_get_display(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the transient parent used by the [gid.gtk4.mount_operation.MountOperation].
      Returns: the transient parent for windows shown by op
  */
  gid.gtk4.window.Window getParent() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.mount_operation.MountOperation] is currently displaying
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
      Sets the display to show windows of the [gid.gtk4.mount_operation.MountOperation] on.
  
      Params:
        display = a [gid.gdk4.display.Display]
  */
  void setDisplay(gid.gdk4.display.Display display) nothrow
  {
    gtk_mount_operation_set_display(cast(GtkMountOperation*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the transient parent for windows shown by the
      [gid.gtk4.mount_operation.MountOperation].
  
      Params:
        parent = transient parent of the window
  */
  void setParent(gid.gtk4.window.Window parent = null) nothrow
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.mount_operation.MountOperation]
class MountOperationGidBuilderImpl(T) : gid.gio2.mount_operation.MountOperationGidBuilderImpl!T
{

  /**
      Set `display` property.
      Params:
        propval = The display where dialogs will be shown.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent window.
      Returns: Builder instance for fluent chaining
  */
  T parent(gid.gtk4.window.Window propval) nothrow
  {
    return setProperty("parent", propval);
  }
}

/// Fluent builder for [gid.gtk4.mount_operation.MountOperation]
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
