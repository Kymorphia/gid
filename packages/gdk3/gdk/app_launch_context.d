/// Module for [AppLaunchContext] class
module gdk.app_launch_context;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.screen;
import gdk.types;
import gid.gid;
import gio.app_launch_context;
import gio.icon;
import gobject.object;

/**
    GdkAppLaunchContext is an implementation of #GAppLaunchContext that
    handles launching an application in a graphical context. It provides
    startup notification and allows to launch applications on a specific
    screen or workspace.
    
    ## Launching an application
    
    ```c
    GdkAppLaunchContext *context;
    
    context = gdk_display_get_app_launch_context (display);
    
    gdk_app_launch_context_set_screen (screen);
    gdk_app_launch_context_set_timestamp (event->time);
    
    if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
      g_warning ("Launching failed: %s\n", error->message);
    
    g_object_unref (context);
    ```
*/
class AppLaunchContext : gio.app_launch_context.AppLaunchContext
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
    return cast(void function())gdk_app_launch_context_get_type != &gidSymbolNotFound ? gdk_app_launch_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppLaunchContext self()
  {
    return this;
  }

  /**
      Creates a new #GdkAppLaunchContext.
      Returns: a new #GdkAppLaunchContext
  
      Deprecated: Use [gdk.display.Display.getAppLaunchContext] instead
  */
  this()
  {
    GdkAppLaunchContext* _cretval;
    _cretval = gdk_app_launch_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Sets the workspace on which applications will be launched when
      using this context when running under a window manager that
      supports multiple workspaces, as described in the
      [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
      
      When the workspace is not specified or desktop is set to -1,
      it is up to the window manager to pick one, typically it will
      be the current workspace.
  
      Params:
        desktop = the number of a workspace, or -1
  */
  void setDesktop(int desktop)
  {
    gdk_app_launch_context_set_desktop(cast(GdkAppLaunchContext*)this._cPtr, desktop);
  }

  /**
      Sets the display on which applications will be launched when
      using this context. See also [gdk.app_launch_context.AppLaunchContext.setScreen].
  
      Params:
        display = a #GdkDisplay
  
      Deprecated: Use [gdk.display.Display.getAppLaunchContext] instead
  */
  void setDisplay(gdk.display.Display display)
  {
    gdk_app_launch_context_set_display(cast(GdkAppLaunchContext*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon for applications that are launched with this
      context.
      
      Window Managers can use this information when displaying startup
      notification.
      
      See also [gdk.app_launch_context.AppLaunchContext.setIconName].
  
      Params:
        icon = a #GIcon, or null
  */
  void setIcon(gio.icon.Icon icon = null)
  {
    gdk_app_launch_context_set_icon(cast(GdkAppLaunchContext*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon for applications that are launched with this context.
      The icon_name will be interpreted in the same way as the Icon field
      in desktop files. See also [gdk.app_launch_context.AppLaunchContext.setIcon].
      
      If both icon and icon_name are set, the icon_name takes priority.
      If neither icon or icon_name is set, the icon is taken from either
      the file that is passed to launched application or from the #GAppInfo
      for the launched application itself.
  
      Params:
        iconName = an icon name, or null
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gdk_app_launch_context_set_icon_name(cast(GdkAppLaunchContext*)this._cPtr, _iconName);
  }

  /**
      Sets the screen on which applications will be launched when
      using this context. See also [gdk.app_launch_context.AppLaunchContext.setDisplay].
      
      Note that, typically, a #GdkScreen represents a logical screen,
      not a physical monitor.
      
      If both screen and display are set, the screen takes priority.
      If neither screen or display are set, the default screen and
      display are used.
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gdk.screen.Screen screen)
  {
    gdk_app_launch_context_set_screen(cast(GdkAppLaunchContext*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Sets the timestamp of context. The timestamp should ideally
      be taken from the event that triggered the launch.
      
      Window managers can use this information to avoid moving the
      focus to the newly launched application when the user is busy
      typing in another window. This is also known as 'focus stealing
      prevention'.
  
      Params:
        timestamp = a timestamp
  */
  void setTimestamp(uint timestamp)
  {
    gdk_app_launch_context_set_timestamp(cast(GdkAppLaunchContext*)this._cPtr, timestamp);
  }
}
