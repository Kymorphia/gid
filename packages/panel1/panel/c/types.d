/// C types for panel1 library
module panel.c.types;

public import gid.basictypes;
public import adw.c.types;
public import gtk.c.types;

/**
    The area of the panel.
*/
enum PanelArea
{
  /**
      the area of the panel that is at the horizontal
         start. The side is defined by the direction of the user
         language. In English, it is the left side.
  */
  Start = 0,

  /**
      the area of the panel that is at the end.
  */
  End = 1,

  /**
      the area at the top of the panel.
  */
  Top = 2,

  /**
      the area at the bottom of the panel.
  */
  Bottom = 3,

  /**
      the area that would be considered as the main area, always
         revealed.
  */
  Center = 4,
}

/** */
struct PanelAction;

/** */
struct PanelActionMuxer;

/** */
struct PanelActionMuxerClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct PanelApplication
{
  /** */
  AdwApplication parentInstance;
}

/** */
struct PanelApplicationClass
{
  /** */
  AdwApplicationClass parentClass;

  /** */
  void*[8] Reserved;
}

/** */
struct PanelChangesDialog;

/** */
struct PanelChangesDialogClass
{
  /** */
  AdwAlertDialogClass parentClass;
}

/**
    The #PanelDock is a widget designed to contain widgets that can be
    docked. Use the #PanelDock as the top widget of your dockable UI.
    
    A #PanelDock is divided in 5 areas: [panel.types.Area.Top],
    [panel.types.Area.Bottom], [panel.types.Area.Start], [panel.types.Area.End] represent
    the surrounding areas that can revealed. [panel.types.Area.Center]
    represent the main area, that is always displayed and resized
    depending on the reveal state of the surrounding areas.
    
    It will contain a #PanelDockChild for each of the areas in use,
    albeit this is done by the widget.
*/
struct PanelDock
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct PanelDockClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(PanelDock* self, PanelWidget* widget) panelDragBegin;

  /** */
  extern(C) void function(PanelDock* self, PanelWidget* widget) panelDragEnd;
}

/** */
struct PanelDocumentWorkspace
{
  /** */
  PanelWorkspace parentInstance;
}

/** */
struct PanelDocumentWorkspaceClass
{
  /** */
  PanelWorkspaceClass parentClass;

  /** */
  extern(C) PanelFrame* function(PanelDocumentWorkspace* self, PanelPosition* position) createFrame;

  /** */
  extern(C) gboolean function(PanelDocumentWorkspace* self, PanelWidget* widget, PanelPosition* position) addWidget;

  /** */
  void*[16] Reserved;
}

/**
    The #PanelFrame is a widget containing panels to display in an
    area. The widgets are added internally in an [adw.tab_view.TabView] to
    display them one at a time like in a stack.
    
    A #PanelFrame can also have a header widget that will be displayed
    above the panels.
*/
struct PanelFrame
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct PanelFrameClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(PanelFrame* self, PanelWidget* widget) pageClosed;

  /** */
  extern(C) gboolean function(PanelFrame* self, PanelWidget* widget) adoptWidget;

  /** */
  void*[6] Reserved;
}

/**
    An interface implemented by the header of a #PanelFrame.
*/
struct PanelFrameHeader;

/**
    A header bar for #PanelFrame. It can optionally show an icon, it
    can have a popover to be displace, and it can also have prefix and
    suffix widgets.
    
    It is an implementation of #PanelFrameHeader
*/
struct PanelFrameHeaderBar;

/** */
struct PanelFrameHeaderBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct PanelFrameHeaderInterface
{
  /** */
  GTypeInterface parentIface;

  /** */
  extern(C) void function(PanelFrameHeader* self, PanelWidget* widget) pageChanged;

  /** */
  extern(C) gboolean function(PanelFrameHeader* self, PanelWidget* widget) canDrop;

  /** */
  extern(C) void function(PanelFrameHeader* self, int priority, GtkWidget* child) addPrefix;

  /** */
  extern(C) void function(PanelFrameHeader* self, int priority, GtkWidget* child) addSuffix;
}

/**
    A #PanelFrameSwitcher is a #PanelFrameHeader that shows a row of
    buttons to switch between #GtkStack pages, not disimilar to a
    #GtkStackSwitcher.
*/
struct PanelFrameSwitcher;

/** */
struct PanelFrameSwitcherClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A #PanelFrameHeader that implements switching between tab views in
    a #PanelFrame.
*/
struct PanelFrameTabBar;

/** */
struct PanelFrameTabBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct PanelGSettingsActionGroup;

/** */
struct PanelGSettingsActionGroupClass
{
  /** */
  GObjectClass parentClass;
}

/**
    The #PanelGrid is a widget used to layout the dock item in the
    center area.
*/
struct PanelGrid
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct PanelGridClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) PanelFrame* function(PanelGrid* self) createFrame;

  /** */
  void*[12] Reserved;
}

/** */
struct PanelGridColumn;

/** */
struct PanelGridColumnClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct PanelInhibitor;

/** */
struct PanelInhibitorClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct PanelLayeredSettings;

/** */
struct PanelLayeredSettingsClass
{
  /** */
  GObjectClass parentClass;
}

/**
    The goal of #PanelMenuManager is to simplify the process of merging multiple
    GtkBuilder .ui files containing menus into a single representation of the
    application menus. Additionally, it provides the ability to "unmerge"
    previously merged menus.
    
    This allows for an application to have plugins which seemlessly extends
    the core application menus.
    
    Implementation notes:
    
    To make this work, we don't use the GMenu instances created by a GtkBuilder
    instance. Instead, we create the menus ourself and recreate section and
    submenu links. This allows the #PanelMenuManager to be in full control of
    the generated menus.
    
    [panel.menu_manager.MenuManager.getMenuById] will always return a #GMenu, however
    that menu may contain no children until something has extended it later
    on during the application process.
*/
struct PanelMenuManager;

/** */
struct PanelMenuManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A multi-use widget for user interaction in the window header bar.
    You can add widgets, a popover to provide action items, an icon,
    updates on progress and pulse the main widget.
    
    There is also a prefix and suffix area that can contain more
    widgets.
    
    <picture>
      <source srcset="omni-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="omni-bar.png" alt="omni-bar">
    </picture>
*/
struct PanelOmniBar
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct PanelOmniBarClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  void*[8] Reserved;
}

/**
    A #PanelPaned is the concrete widget for a panel area.
*/
struct PanelPaned;

/** */
struct PanelPanedClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    Specifies a position in the dock. You receive a #PanelPosition in the
    handler to `signal@PanelDock::create-frame`.
*/
struct PanelPosition;

/** */
struct PanelPositionClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct PanelSaveDelegate
{
  /** */
  GObject parentInstance;
}

/** */
struct PanelSaveDelegateClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(PanelSaveDelegate* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) saveAsync;

  /** */
  extern(C) gboolean function(PanelSaveDelegate* self, GAsyncResult* result, GError** _err) saveFinish;

  /** */
  extern(C) gboolean function(PanelSaveDelegate* self, GTask* task) save;

  /** */
  extern(C) void function(PanelSaveDelegate* self) discard;

  /** */
  extern(C) void function(PanelSaveDelegate* self) close;

  /** */
  void*[8] Reserved;
}

/** */
struct PanelSaveDialog;

/** */
struct PanelSaveDialogClass
{
  /** */
  AdwMessageDialogClass parentClass;
}

/** */
struct PanelSession;

/** */
struct PanelSessionClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct PanelSessionItem;

/** */
struct PanelSessionItemClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct PanelSettings;

/** */
struct PanelSettingsClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A panel status bar is meant to be displayed at the bottom of the
    window. It can contain widgets in the prefix and in the suffix.
*/
struct PanelStatusbar;

/** */
struct PanelStatusbarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A widget that allow selecting theme preference between "dark",
    "light" and "follow" the system preference.
    
    <picture>
      <source srcset="theme-selector-dark.png" media="(prefers-color-scheme: dark)">
      <img src="theme-selector.png" alt="theme-selector">
    </picture>
    
    Upon activation it will activate the named action in
    #PanelThemeSelector:action-name.
*/
struct PanelThemeSelector;

/** */
struct PanelThemeSelectorClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    The [panel.toggle_button.ToggleButton] is a button used to toggle the visibility
    of a [panel.dock.Dock] area.
    
    <picture>
      <source srcset="toggle-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-button.png" alt="toggle-button">
    </picture>
    
    It will automatically reveal or hide the specified area from
    [panel.toggle_button.ToggleButton.dock].
*/
struct PanelToggleButton;

/** */
struct PanelToggleButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    PanelWidget is the base widget class for widgets added to a
    #PanelFrame. It can be use as-is or you can subclass it.
*/
struct PanelWidget
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct PanelWidgetClass
{
  /** */
  GtkWidgetClass parentInstance;

  /** */
  extern(C) GtkWidget* function(PanelWidget* self) getDefaultFocus;

  /** */
  extern(C) void function(PanelWidget* self) presented;

  /** */
  void*[8] Reserved;
}

/** */
struct PanelWorkbench
{
  /** */
  GtkWindowGroup parentInstance;
}

/** */
struct PanelWorkbenchClass
{
  /** */
  GtkWindowGroupClass parentClass;

  /** */
  extern(C) void function(PanelWorkbench* self) activate;

  /** */
  extern(C) void function(PanelWorkbench* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) unloadAsync;

  /** */
  extern(C) gboolean function(PanelWorkbench* self, GAsyncResult* result, GError** _err) unloadFinish;

  /** */
  void*[8] Reserved;
}

/** */
struct PanelWorkspace
{
  /** */
  AdwApplicationWindow parentInstance;
}

/** */
struct PanelWorkspaceClass
{
  /** */
  AdwApplicationWindowClass parentClass;

  /** */
  void*[8] Reserved;
}

alias extern(C) void function(void* instance, const(char)* actionName, GVariant* param) PanelActionActivateFunc;

alias extern(C) void function(PanelFrame* frame, void* userData) PanelFrameCallback;

alias extern(C) void function(PanelWorkspace* workspace, void* userData) PanelWorkspaceForeach;

