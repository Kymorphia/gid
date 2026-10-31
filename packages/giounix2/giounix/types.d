/// D types for giounix2 library
module giounix.types;

import gid.gid;
import giounix.c.functions;
import giounix.c.types;
import giounix.desktop_app_info;
import glib.types;


// Callbacks

/**
    During invocation, [giounix.desktop_app_info.DesktopAppInfo.launchUrisAsManager] may
    create one or more child processes.  This callback is invoked once
    for each, providing the process ID.

    Params:
      appinfo = a #GDesktopAppInfo
      pid = Process identifier
*/
alias DesktopAppLaunchCallback = void delegate(giounix.desktop_app_info.DesktopAppInfo appinfo, glib.types.Pid pid);

/**
    Extension point for default handler to URI association. See
    [Extending GIO](overview.html#extending-gio).

    Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
         unused by GIO.
*/
enum DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup";
