/// D types for giounix2 library
module gid.giounix2.types;

import gid.core.gid;
import gid.giounix2.c.functions;
import gid.giounix2.c.types;
import gid.giounix2.desktop_app_info;
import gid.glib2.types;


// Callbacks

/**
    During invocation, [gid.giounix2.desktop_app_info.DesktopAppInfo.launchUrisAsManager] may
    create one or more child processes.  This callback is invoked once
    for each, providing the process ID.

    Params:
      appinfo = a #GDesktopAppInfo
      pid = Process identifier
*/
alias DesktopAppLaunchCallback = void delegate(gid.giounix2.desktop_app_info.DesktopAppInfo appinfo, gid.glib2.types.Pid pid);

/**
    Extension point for default handler to URI association. See
    [Extending GIO](overview.html#extending-gio).

    Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
         unused by GIO.
*/
enum DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup";
