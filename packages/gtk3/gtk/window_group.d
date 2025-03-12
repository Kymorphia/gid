module gtk.window_group;

import gdk.device;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    A #GtkWindowGroup restricts the effect of grabs to windows
  in the same group, thereby making window groups almost behave
  like separate applications.
  
  A window can be a member in at most one window group at a time.
  Windows that have not been explicitly assigned to a group are
  implicitly treated like windows of the default window group.
  
  GtkWindowGroup objects are referenced by each window in the group,
  so once you have added all windows to a GtkWindowGroup, you can drop
  the initial reference to the window group with [gobject.object.ObjectG.unref]. If the
  windows in the window group are subsequently destroyed, then they will
  be removed from the window group and drop their references on the window
  group; when all window have been removed, the window group will be
  freed.
*/
class WindowGroup : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_group_get_type != &gidSymbolNotFound ? gtk_window_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override WindowGroup self()
  {
    return this;
  }

  /**
      Creates a new #GtkWindowGroup object. Grabs added with
    [gtk.widget.Widget.grabAdd] only affect windows within the same #GtkWindowGroup.
    Returns:     a new #GtkWindowGroup.
  */
  this()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a window to a #GtkWindowGroup.
    Params:
      window =       the #GtkWindow to add
  */
  void addWindow(gtk.window.Window window)
  {
    gtk_window_group_add_window(cast(GtkWindowGroup*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }

  /**
      Returns the current grab widget for device, or null if none.
    Params:
      device =       a #GdkDevice
    Returns:     The grab widget, or null
  */
  gtk.widget.Widget getCurrentDeviceGrab(gdk.device.Device device)
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_group_get_current_device_grab(cast(GtkWindowGroup*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current grab widget of the given group,
    see [gtk.widget.Widget.grabAdd].
    Returns:     the current grab widget of the group
  */
  gtk.widget.Widget getCurrentGrab()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_group_get_current_grab(cast(GtkWindowGroup*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of the #GtkWindows that belong to window_group.
    Returns:     A
        newly-allocated list of windows inside the group.
  */
  gtk.window.Window[] listWindows()
  {
    GList* _cretval;
    _cretval = gtk_window_group_list_windows(cast(GtkWindowGroup*)cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Removes a window from a #GtkWindowGroup.
    Params:
      window =       the #GtkWindow to remove
  */
  void removeWindow(gtk.window.Window window)
  {
    gtk_window_group_remove_window(cast(GtkWindowGroup*)cPtr, window ? cast(GtkWindow*)window.cPtr(No.Dup) : null);
  }
}
