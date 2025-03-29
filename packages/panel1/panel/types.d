module panel.types;

import gid.gid;
import glib.variant;
import panel.c.functions;
import panel.c.types;
import panel.frame;
import panel.workspace;


// Enums

/** */
alias Area = PanelArea;

// Structs

/** */
alias Action = PanelAction*;

// Callbacks

/** */
alias ActionActivateFunc = void delegate(void* instance, string actionName, glib.variant.VariantG param);

/**
    Callback passed to "foreach frame" functions.

    Params:
      frame = The #PanelFrame calling.
*/
alias FrameCallback = void delegate(panel.frame.Frame frame);

/**
    This function is called for each workspace window within a #PanelWorkbench
    when using [panel.workbench.Workbench.foreachWorkspace].

    Params:
      workspace = a #PanelWorkspace
*/
alias WorkspaceForeach = void delegate(panel.workspace.Workspace workspace);

/**
    libpanel major version component (e.g. 1 if `PANEL_VERSION` is 1.2.3)
*/
enum MAJOR_VERSION = 1;

/**
    libpanel micro version component (e.g. 3 if `PANEL_VERSION` is 1.2.3)
*/
enum MICRO_VERSION = 1;

/**
    libpanel minor version component (e.g. 2 if `PANEL_VERSION` is 1.2.3)
*/
enum MINOR_VERSION = 8;

/**
    libpanel version, encoded as a string, useful for printing and
    concatenation.
*/
enum VERSION_S = "1.8.1";

/** */
enum WIDGET_KIND_ANY = "*";

/** */
enum WIDGET_KIND_DOCUMENT = "document";

/** */
enum WIDGET_KIND_UNKNOWN = "unknown";

/** */
enum WIDGET_KIND_UTILITY = "utility";
