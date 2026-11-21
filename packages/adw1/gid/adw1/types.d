/// D types for adw1 library
module gid.adw1.types;

import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.sidebar_item;
import gid.core.gid;
import gid.gobject2.object;


// Enums

/** */
alias AccentColor = AdwAccentColor;

/** */
alias AnimationState = AdwAnimationState;

/** */
alias BannerButtonStyle = AdwBannerButtonStyle;

/** */
alias BreakpointConditionLengthType = AdwBreakpointConditionLengthType;

/** */
alias BreakpointConditionRatioType = AdwBreakpointConditionRatioType;

/** */
alias CenteringPolicy = AdwCenteringPolicy;

/** */
alias ColorScheme = AdwColorScheme;

/** */
alias DialogPresentationMode = AdwDialogPresentationMode;

/** */
alias Easing = AdwEasing;

/** */
alias FlapFoldPolicy = AdwFlapFoldPolicy;

/** */
alias FlapTransitionType = AdwFlapTransitionType;

/** */
alias FoldThresholdPolicy = AdwFoldThresholdPolicy;

/** */
alias InlineViewSwitcherDisplayMode = AdwInlineViewSwitcherDisplayMode;

/** */
alias JustifyMode = AdwJustifyMode;

/** */
alias LeafletTransitionType = AdwLeafletTransitionType;

/** */
alias LengthUnit = AdwLengthUnit;

/** */
alias NavigationDirection = AdwNavigationDirection;

/** */
alias PackDirection = AdwPackDirection;

/** */
alias ResponseAppearance = AdwResponseAppearance;

/** */
alias SidebarMode = AdwSidebarMode;

/** */
alias SqueezerTransitionType = AdwSqueezerTransitionType;

/** */
alias TabViewShortcuts = AdwTabViewShortcuts;

/** */
alias ToastPriority = AdwToastPriority;

/** */
alias ToolbarStyle = AdwToolbarStyle;

/** */
alias ViewSwitcherPolicy = AdwViewSwitcherPolicy;

/** */
alias WrapPolicy = AdwWrapPolicy;

// Callbacks

/**
    Prototype for animation targets based on user callbacks.

    Params:
      value = The animation value
*/
alias AnimationTargetFunc = void delegate(double value);

/**
    Called for sidebars that are bound to a [gid.gio2.list_model.ListModel] with
    [gid.adw1.sidebar_section.SidebarSection.bindModel] for each
    item that gets added to the model.

    Params:
      item = the item from the model for which to create an item for
    Returns: an [gid.adw1.sidebar_item.SidebarItem] that represents item
*/
alias SidebarSectionCreateItemFunc = gid.adw1.sidebar_item.SidebarItem delegate(gid.gobject2.object.ObjectWrap item);

/**
    Indicates an [gid.adw1.animation.Animation] with an infinite duration.
    
    This value is mostly used internally.
*/
enum DURATION_INFINITE = 4294967295;

/**
    Adwaita major version component (e.g. 1 if the version is 1.2.3).
*/
enum MAJOR_VERSION = 1;

/**
    Adwaita micro version component (e.g. 3 if the version is 1.2.3).
*/
enum MICRO_VERSION = 1;

/**
    Adwaita minor version component (e.g. 2 if the version is 1.2.3).
*/
enum MINOR_VERSION = 9;

/**
    Adwaita version, encoded as a string, useful for printing and
    concatenation.
*/
enum VERSION_S = "1.9.1";
