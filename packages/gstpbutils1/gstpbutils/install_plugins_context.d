/// Module for [InstallPluginsContext] class
module gstpbutils.install_plugins_context;

import gid.gid;
import gobject.boxed;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.types;

/**
    Opaque context structure for the plugin installation. Use the provided
    API to set details on it.
*/
class InstallPluginsContext : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_install_plugins_context_get_type != &gidSymbolNotFound ? gst_install_plugins_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InstallPluginsContext self()
  {
    return this;
  }

  /**
      Creates a new #GstInstallPluginsContext.
      Returns: a new #GstInstallPluginsContext. Free with
        [gstpbutils.install_plugins_context.InstallPluginsContext.free] when no longer needed
  */
  this()
  {
    GstInstallPluginsContext* _cretval;
    _cretval = gst_install_plugins_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GstInstallPluginsContext.
      Returns: A copy of ctx
  */
  gstpbutils.install_plugins_context.InstallPluginsContext copy()
  {
    GstInstallPluginsContext* _cretval;
    _cretval = gst_install_plugins_context_copy(cast(GstInstallPluginsContext*)this._cPtr);
    auto _retval = _cretval ? new gstpbutils.install_plugins_context.InstallPluginsContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function is used to tell the external installer process whether it
      should ask for confirmation or not before searching for missing plugins.
      
      If set, this option will be passed to the installer via a
      --interaction=[show-confirm-search|hide-confirm-search] command line option.
  
      Params:
        confirmSearch = whether to ask for confirmation before searching for plugins
  */
  void setConfirmSearch(bool confirmSearch)
  {
    gst_install_plugins_context_set_confirm_search(cast(GstInstallPluginsContext*)this._cPtr, confirmSearch);
  }

  /**
      This function is used to pass the calling application's desktop file ID to
      the external installer process.
      
      A desktop file ID is the basename of the desktop file, including the
      .desktop extension.
      
      If set, the desktop file ID will be passed to the installer via a
      --desktop-id= command line option.
  
      Params:
        desktopId = the desktop file ID of the calling application
  */
  void setDesktopId(string desktopId)
  {
    const(char)* _desktopId = desktopId.toCString(No.Alloc);
    gst_install_plugins_context_set_desktop_id(cast(GstInstallPluginsContext*)this._cPtr, _desktopId);
  }

  /**
      Sets the startup notification ID for the launched process.
      
      This is typically used to to pass the current X11 event timestamp to the
      external installer process.
      
      Startup notification IDs are defined in the
      [FreeDesktop.Org Startup Notifications standard](http://standards.freedesktop.org/startup-notification-spec/startup-notification-latest.txt).
      
      If set, the ID will be passed to the installer via a
      --startup-notification-id= command line option.
      
      GTK+/GNOME applications should be able to create a startup notification ID
      like this:
      ```
        timestamp = gtk_get_current_event_time ();
        startup_id = g_strdup_printf ("_TIME%u", timestamp);
      ...
      ```
  
      Params:
        startupId = the startup notification ID
  */
  void setStartupNotificationId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gst_install_plugins_context_set_startup_notification_id(cast(GstInstallPluginsContext*)this._cPtr, _startupId);
  }

  /**
      This function is for X11-based applications (such as most Gtk/Qt
      applications on linux/unix) only. You can use it to tell the external
      installer the XID of your main application window. That way the installer
      can make its own window transient to your application window during the
      installation.
      
      If set, the XID will be passed to the installer via a --transient-for=XID
      command line option.
      
      Gtk+/Gnome application should be able to obtain the XID of the top-level
      window like this:
      ```
      ##include <gtk/gtk.h>
      ##ifdef GDK_WINDOWING_X11
      ##include <gdk/gdkx.h>
      ##endif
      ...
      ##ifdef GDK_WINDOWING_X11
        xid = GDK_WINDOW_XWINDOW (GTK_WIDGET (application_window)->window);
      ##endif
      ...
      ```
  
      Params:
        xid = the XWindow ID (XID) of the top-level application
  */
  void setXid(uint xid)
  {
    gst_install_plugins_context_set_xid(cast(GstInstallPluginsContext*)this._cPtr, xid);
  }
}
