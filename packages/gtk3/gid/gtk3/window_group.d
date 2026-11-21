/// Module for [WindowGroup] class
module gid.gtk3.window_group;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.device;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.gtk3.window;

/**
    A #GtkWindowGroup restricts the effect of grabs to windows
    in the same group, thereby making window groups almost behave
    like separate applications.
    
    A window can be a member in at most one window group at a time.
    Windows that have not been explicitly assigned to a group are
    implicitly treated like windows of the default window group.
    
    GtkWindowGroup objects are referenced by each window in the group,
    so once you have added all windows to a GtkWindowGroup, you can drop
    the initial reference to the window group with [gid.gobject2.object.ObjectWrap.unref]. If the
    windows in the window group are subsequently destroyed, then they will
    be removed from the window group and drop their references on the window
    group; when all window have been removed, the window group will be
    freed.
*/
class WindowGroup : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_window_group_get_type != &gidSymbolNotFound ? gtk_window_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindowGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.window_group.WindowGroup]
      Returns: New builder object
  */
  static WindowGroupGidBuilder builder() nothrow
  {
    return new WindowGroupGidBuilder;
  }

  /**
      Creates a new #GtkWindowGroup object. Grabs added with
      [gid.gtk3.widget.Widget.grabAdd] only affect windows within the same #GtkWindowGroup.
      Returns: a new #GtkWindowGroup.
  */
  this() nothrow
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a window to a #GtkWindowGroup.
  
      Params:
        window = the #GtkWindow to add
  */
  void addWindow(gid.gtk3.window.Window window) nothrow
  {
    gtk_window_group_add_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Returns the current grab widget for device, or null if none.
  
      Params:
        device = a #GdkDevice
      Returns: The grab widget, or null
  */
  gid.gtk3.widget.Widget getCurrentDeviceGrab(gid.gdk3.device.Device device) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_group_get_current_device_grab(cast(GtkWindowGroup*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current grab widget of the given group,
      see [gid.gtk3.widget.Widget.grabAdd].
      Returns: the current grab widget of the group
  */
  gid.gtk3.widget.Widget getCurrentGrab() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_group_get_current_grab(cast(GtkWindowGroup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of the #GtkWindows that belong to window_group.
      Returns: A
          newly-allocated list of windows inside the group.
  */
  gid.gtk3.window.Window[] listWindows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_window_group_list_windows(cast(GtkWindowGroup*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Removes a window from a #GtkWindowGroup.
  
      Params:
        window = the #GtkWindow to remove
  */
  void removeWindow(gid.gtk3.window.Window window) nothrow
  {
    gtk_window_group_remove_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.window_group.WindowGroup]
class WindowGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.window_group.WindowGroup]
final class WindowGroupGidBuilder : WindowGroupGidBuilderImpl!WindowGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowGroup build() nothrow
  {
    return new WindowGroup(cast(void*)createGObject(WindowGroup._getGType), Yes.Take);
  }
}
