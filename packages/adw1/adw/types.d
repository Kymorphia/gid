/// D types for adw1 library
module adw.types;

import adw.c.functions;
import adw.c.types;
import gid.gid;


// Enums

/** */
alias AnimationState = AdwAnimationState;

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
alias LeafletTransitionType = AdwLeafletTransitionType;

/** */
alias LengthUnit = AdwLengthUnit;

/** */
alias NavigationDirection = AdwNavigationDirection;

/** */
alias ResponseAppearance = AdwResponseAppearance;

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

// Callbacks

/**
    Prototype for animation targets based on user callbacks.

    Params:
      value = The animation value
*/
alias AnimationTargetFunc = void delegate(double value);

/**
    Indicates an [adw.animation.Animation] with an infinite duration.
    
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
enum MICRO_VERSION = 5;

/**
    Adwaita minor version component (e.g. 2 if the version is 1.2.3).
*/
enum MINOR_VERSION = 5;

/**
    Adwaita version, encoded as a string, useful for printing and
    concatenation.
*/
enum VERSION_S = "1.5.5";
