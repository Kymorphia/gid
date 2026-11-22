/// D types for panel1 library
module gid.panel1.types;

import gid.core.utils;
import gid.glib2.variant;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame;
import gid.panel1.workspace;


// Enums

/** */
alias Area = PanelArea;

// Structs

/** */
alias Action = PanelAction*;

// Callbacks

/** */
alias ActionActivateFunc = void delegate(void* instance, string actionName, gid.glib2.variant.Variant param);

/**
    Callback passed to "foreach frame" functions.

    Params:
      frame = The #PanelFrame calling.
*/
alias FrameCallback = void delegate(gid.panel1.frame.Frame frame);

/**
    This function is called for each workspace window within a #PanelWorkbench
    when using [gid.panel1.workbench.Workbench.foreachWorkspace].

    Params:
      workspace = a #PanelWorkspace
*/
alias WorkspaceForeach = void delegate(gid.panel1.workspace.Workspace workspace);

/**
    libpanel major version component (e.g. 1 if `PANEL_VERSION` is 1.2.3)
*/
enum MAJOR_VERSION = 1;

/**
    libpanel micro version component (e.g. 3 if `PANEL_VERSION` is 1.2.3)
*/
enum MICRO_VERSION = 3;

/**
    libpanel minor version component (e.g. 2 if `PANEL_VERSION` is 1.2.3)
*/
enum MINOR_VERSION = 10;

/**
    libpanel version, encoded as a string, useful for printing and
    concatenation.
*/
enum VERSION_S = "1.10.3";

/** */
enum WIDGET_KIND_ANY = "*";

/** */
enum WIDGET_KIND_DOCUMENT = "document";

/** */
enum WIDGET_KIND_UNKNOWN = "unknown";

/** */
enum WIDGET_KIND_UTILITY = "utility";
