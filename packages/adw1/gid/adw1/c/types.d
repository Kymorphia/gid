/// C types for adw1 library
module gid.adw1.c.types;

public import gid.core.basictypes;
public import gid.gio2.c.types;
public import gid.gtk4.c.types;

/**
    Describes the available system accent colors.
*/
enum AdwAccentColor
{
  /**
      Use a blue color (`#3584e4` or `#0073e5` in Yaru). This is the default value.
  */
  Blue = 0,

  /**
      Use a teal color (`#2190a4` or `#4b8501` in Yaru).
  */
  Teal = 1,

  /**
      Use a green color (`#3a944a` or `#4b8501` in Yaru).
  */
  Green = 2,

  /**
      Use a yellow color (`#c88800`).
  */
  Yellow = 3,

  /**
      Use a orange color (`#ed5b00` or `#e95420` in Yaru).
  */
  Orange = 4,

  /**
      Use a red color (`#e62d42` or `#da3450` in Yaru).
  */
  Red = 5,

  /**
      Use a pink color (`#d56199` or `#b34cb3` in Yaru).
  */
  Pink = 6,

  /**
      Use a purple color (`#9141ac` or `#7764d8` in Yaru).
  */
  Purple = 7,

  /**
      Use a slate color (`#6f8396` or `#657b69` in Yaru).
  */
  Slate = 8,

  /** */
  Brown = 108,
}

/**
    Describes the possible states of an [gid.adw1.animation.Animation].
    
    The state can be controlled with [gid.adw1.animation.Animation.play],
    [gid.adw1.animation.Animation.pause], [gid.adw1.animation.Animation.resume],
    [gid.adw1.animation.Animation.reset] and [gid.adw1.animation.Animation.skip].
*/
enum AdwAnimationState
{
  /**
      The animation hasn't started yet.
  */
  Idle = 0,

  /**
      The animation has been paused.
  */
  Paused = 1,

  /**
      The animation is currently playing.
  */
  Playing = 2,

  /**
      The animation has finished.
  */
  Finished = 3,
}

/**
    Describes the available button styles for [gid.adw1.banner.Banner].
    
    New values may be added to this enumeration over time.
    
    See [gid.adw1.banner.Banner.buttonStyle].
*/
enum AdwBannerButtonStyle
{
  /**
      The default button style.
  */
  Default = 0,

  /**
      A button in the suggested action style.
  */
  Suggested = 1,
}

/**
    Describes length types for [gid.adw1.breakpoint_condition.BreakpointCondition].
    
    See [gid.adw1.breakpoint_condition.BreakpointCondition.newLength].
    
    New values may be added to this enumeration over time.
*/
enum AdwBreakpointConditionLengthType
{
  /**
      true if the width is greater than or
        equal to the condition value
  */
  MinWidth = 0,

  /**
      true if the width is less than or
        equal to the condition value
  */
  MaxWidth = 1,

  /**
      true if the height is greater than or
        equal to the condition value
  */
  MinHeight = 2,

  /**
      true if the height is less than or
        equal to the condition value
  */
  MaxHeight = 3,
}

/**
    Describes ratio types for [gid.adw1.breakpoint_condition.BreakpointCondition].
    
    See [gid.adw1.breakpoint_condition.BreakpointCondition.newRatio].
    
    New values may be added to this enumeration over time.
*/
enum AdwBreakpointConditionRatioType
{
  /**
      true if the aspect ratio is
        greater than or equal to the condition value
  */
  MinAspectRatio = 0,

  /**
      true if the aspect ratio is
        less than or equal to the condition value
  */
  MaxAspectRatio = 1,
}

/**
    Describes title centering behavior of a [gid.adw1.header_bar.HeaderBar] widget.
*/
enum AdwCenteringPolicy
{
  /**
      Keep the title centered when possible
  */
  Loose = 0,

  /**
      Keep the title centered at all cost
  */
  Strict = 1,
}

/**
    Application color schemes for [gid.adw1.style_manager.StyleManager.colorScheme].
*/
enum AdwColorScheme
{
  /**
      Inherit the parent color-scheme. When set on the
        [gid.adw1.style_manager.StyleManager] returned by [gid.adw1.style_manager.StyleManager.getDefault], it's
        equivalent to `enum@Adw.ColorScheme.prefer-light`.
  */
  Default = 0,

  /**
      Always use light appearance.
  */
  ForceLight = 1,

  /**
      Use light appearance unless the system
        prefers dark colors.
  */
  PreferLight = 2,

  /**
      Use dark appearance unless the system prefers
        prefers light colors.
  */
  PreferDark = 3,

  /**
      Always use dark appearance.
  */
  ForceDark = 4,
}

/**
    Describes the available presentation modes for [gid.adw1.dialog.Dialog].
    
    New values may be added to this enumeration over time.
    
    See [gid.adw1.dialog.Dialog.presentationMode].
*/
enum AdwDialogPresentationMode
{
  /**
      Switch between [gid.adw1.types.DialogPresentationMode.Floating]
        and `enum@Adw.DialogPresentationMode.bottom-sheet` depending on available
        size.
  */
  Auto = 0,

  /**
      Present dialog as a centered floating window.
  */
  Floating = 1,

  /**
      Present dialog as a bottom sheet.
  */
  BottomSheet = 2,
}

/**
    Describes the available easing functions for use with
    [gid.adw1.timed_animation.TimedAnimation].
    
    New values may be added to this enumeration over time.
*/
enum AdwEasing
{
  /**
      Linear tweening.
  */
  Linear = 0,

  /**
      Quadratic tweening.
  */
  EaseInQuad = 1,

  /**
      Quadratic tweening, inverse of
        `enum@Adw.Easing.ease-in-quad`.
  */
  EaseOutQuad = 2,

  /**
      Quadratic tweening, combining
        `enum@Adw.Easing.ease-in-quad` and `enum@Adw.Easing.ease-out-quad`.
  */
  EaseInOutQuad = 3,

  /**
      Cubic tweening.
  */
  EaseInCubic = 4,

  /**
      Cubic tweening, inverse of
        `enum@Adw.Easing.ease-in-cubic`.
  */
  EaseOutCubic = 5,

  /**
      Cubic tweening, combining
        `enum@Adw.Easing.ease-in-cubic` and `enum@Adw.Easing.ease-out-cubic`.
  */
  EaseInOutCubic = 6,

  /**
      Quartic tweening.
  */
  EaseInQuart = 7,

  /**
      Quartic tweening, inverse of
        `enum@Adw.Easing.ease-in-quart`.
  */
  EaseOutQuart = 8,

  /**
      Quartic tweening, combining
        `enum@Adw.Easing.ease-in-quart` and `enum@Adw.Easing.ease-out-quart`.
  */
  EaseInOutQuart = 9,

  /**
      Quintic tweening.
  */
  EaseInQuint = 10,

  /**
      Quintic tweening, inverse of
        `enum@Adw.Easing.ease-in-quint`.
  */
  EaseOutQuint = 11,

  /**
      Quintic tweening, combining
        `enum@Adw.Easing.ease-in-quint` and `enum@Adw.Easing.ease-out-quint`.
  */
  EaseInOutQuint = 12,

  /**
      Sine wave tweening.
  */
  EaseInSine = 13,

  /**
      Sine wave tweening, inverse of
        `enum@Adw.Easing.ease-in-sine`.
  */
  EaseOutSine = 14,

  /**
      Sine wave tweening, combining
        `enum@Adw.Easing.ease-in-sine` and `enum@Adw.Easing.ease-out-sine`.
  */
  EaseInOutSine = 15,

  /**
      Exponential tweening.
  */
  EaseInExpo = 16,

  /**
      Exponential tweening, inverse of
        `enum@Adw.Easing.ease-in-expo`.
  */
  EaseOutExpo = 17,

  /**
      Exponential tweening, combining
        `enum@Adw.Easing.ease-in-expo` and `enum@Adw.Easing.ease-out-expo`.
  */
  EaseInOutExpo = 18,

  /**
      Circular tweening.
  */
  EaseInCirc = 19,

  /**
      Circular tweening, inverse of
        `enum@Adw.Easing.ease-in-circ`.
  */
  EaseOutCirc = 20,

  /**
      Circular tweening, combining
        `enum@Adw.Easing.ease-in-circ` and `enum@Adw.Easing.ease-out-circ`.
  */
  EaseInOutCirc = 21,

  /**
      Elastic tweening, with offshoot on start.
  */
  EaseInElastic = 22,

  /**
      Elastic tweening, with offshoot on end, inverse of
        `enum@Adw.Easing.ease-in-elastic`.
  */
  EaseOutElastic = 23,

  /**
      Elastic tweening, with offshoot on both ends,
        combining `enum@Adw.Easing.ease-in-elastic` and
        `enum@Adw.Easing.ease-out-elastic`.
  */
  EaseInOutElastic = 24,

  /**
      Overshooting cubic tweening, with backtracking on start.
  */
  EaseInBack = 25,

  /**
      Overshooting cubic tweening, with backtracking on end,
        inverse of `enum@Adw.Easing.ease-in-back`.
  */
  EaseOutBack = 26,

  /**
      Overshooting cubic tweening, with backtracking on both
        ends, combining `enum@Adw.Easing.ease-in-back` and
        `enum@Adw.Easing.ease-out-back`.
  */
  EaseInOutBack = 27,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        on start.
  */
  EaseInBounce = 28,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        with bounce on end, inverse of `enum@Adw.Easing.ease-in-bounce`.
  */
  EaseOutBounce = 29,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        with bounce on both ends, combining `enum@Adw.Easing.ease-in-bounce` and
        `enum@Adw.Easing.ease-out-bounce`.
  */
  EaseInOutBounce = 30,

  /**
      Cubic bezier tweening, with control points in (0.25, 0.1) and (0.25, 1.0).
      
      Increases in velocity towards the middle of the animation, slowing back down
      at the end.
  */
  Ease = 31,

  /**
      Cubic bezier tweening, with control points in (0.42, 0.0) and (1.0, 1.0).
      
      Starts off slowly, with the speed of the animation increasing until complete.
  */
  EaseIn = 32,

  /**
      Cubic bezier tweening, with control points in (0.0, 0.0) and (0.58, 1.0).
      
      Starts quickly, slowing down the animation until complete.
  */
  EaseOut = 33,

  /**
      Cubic bezier tweening, with control points in (0.42, 0.0) and (0.58, 1.0).
      
      Starts off slowly, speeds up in the middle, and then slows down again.
  */
  EaseInOut = 34,
}

/**
    Describes the possible folding behavior of a [gid.adw1.flap.Flap] widget.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
*/
enum AdwFlapFoldPolicy
{
  /**
      Disable folding, the flap cannot reach narrow
        sizes.
  */
  Never = 0,

  /**
      Keep the flap always folded.
  */
  Always = 1,

  /**
      Fold and unfold the flap based on available
        space.
  */
  Auto = 2,
}

/**
    Describes transitions types of a [gid.adw1.flap.Flap] widget.
    
    It determines the type of animation when transitioning between children in a
    [gid.adw1.flap.Flap] widget, as well as which areas can be swiped via
    [gid.adw1.flap.Flap.swipeToOpen] and [gid.adw1.flap.Flap.swipeToClose].

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
*/
enum AdwFlapTransitionType
{
  /**
      The flap slides over the content, which is
        dimmed. When folded, only the flap can be swiped.
  */
  Over = 0,

  /**
      The content slides over the flap. Only the
        content can be swiped.
  */
  Under = 1,

  /**
      The flap slides offscreen when hidden,
        neither the flap nor content overlap each other. Both widgets can be
        swiped.
  */
  Slide = 2,
}

/**
    Determines when [gid.adw1.flap.Flap] and [gid.adw1.leaflet.Leaflet] will fold.

    Deprecated: Stop using [gid.adw1.leaflet.Leaflet] and [gid.adw1.flap.Flap]
*/
enum AdwFoldThresholdPolicy
{
  /**
      Folding is based on the minimum size
  */
  Minimum = 0,

  /**
      Folding is based on the natural size
  */
  Natural = 1,
}

/**
    Describes what [gid.adw1.inline_view_switcher.InlineViewSwitcher] toggles display.
    
    <picture>
      <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
    </picture>
*/
enum AdwInlineViewSwitcherDisplayMode
{
  /**
      Toggles only display labels.
  */
  Labels = 0,

  /**
      Toggles only display icons.
  */
  Icons = 1,

  /**
      Toggles display both icons and labels.
  */
  Both = 2,
}

/**
    Describes line justify behaviors in a [gid.adw1.wrap_layout.WrapLayout] or [gid.adw1.wrap_box.WrapBox].
    
    See [gid.adw1.wrap_layout.WrapLayout.justify] and [gid.adw1.wrap_box.WrapBox.justify].
*/
enum AdwJustifyMode
{
  /**
      Don't justify children within a line.
  */
  None = 0,

  /**
      Stretch each child within the line, keeping consistent
          spacing, so that the line fills the entire length.
  */
  Fill = 1,

  /**
      Increase spacing between children, moving the children
          so that the first and last child are aligned with the beginning and end
          of the line. If the line only contains a single widget, it will be
          stretched regardless.
  */
  Spread = 2,
}

/**
    Describes the possible transitions in a [gid.adw1.leaflet.Leaflet] widget.
    
    New values may be added to this enumeration over time.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
*/
enum AdwLeafletTransitionType
{
  /**
      Cover the old page or uncover the new page, sliding from or towards the end according to orientation, text direction and children order
  */
  Over = 0,

  /**
      Uncover the new page or cover the old page, sliding from or towards the start according to orientation, text direction and children order
  */
  Under = 1,

  /**
      Slide from left, right, up or down according to the orientation, text direction and the children order
  */
  Slide = 2,
}

/**
    Describes length units.
    
    | Unit | Regular Text | Large Text |
    | ---- | ------------ | ---------- |
    | 1px  | 1px          | 1px        |
    | 1pt  | 1.333333px   | 1.666667px |
    | 1sp  | 1px          | 1.25px     |
    
    New values may be added to this enumeration over time.
*/
enum AdwLengthUnit
{
  /**
      pixels
  */
  Px = 0,

  /**
      points, changes with text scale factor
  */
  Pt = 1,

  /**
      scale independent pixels, changes with text scale factor
  */
  Sp = 2,
}

/**
    Describes the direction of a swipe navigation gesture.
*/
enum AdwNavigationDirection
{
  /**
      Corresponds to start or top, depending on orientation and text direction
  */
  Back = 0,

  /**
      Corresponds to end or bottom, depending on orientation and text direction
  */
  Forward = 1,
}

/**
    Describes child packing behavior in a [gid.adw1.wrap_layout.WrapLayout] or [gid.adw1.wrap_box.WrapBox].
    
    See [gid.adw1.wrap_layout.WrapLayout.packDirection] and
    [gid.adw1.wrap_box.WrapBox.packDirection].
*/
enum AdwPackDirection
{
  /**
      Pack children from left to right for LTR languages,
          or top to bottom vertically.
  */
  StartToEnd = 0,

  /**
      Pack children from right to left for LTR languages,
          or bottom to top vertically.
  */
  EndToStart = 1,
}

/**
    Describes the possible styles of [gid.adw1.alert_dialog.AlertDialog] response buttons.
    
    See [gid.adw1.alert_dialog.AlertDialog.setResponseAppearance].
*/
enum AdwResponseAppearance
{
  /**
      the default appearance.
  */
  Default = 0,

  /**
      used to denote important responses such as the
          affirmative action.
  */
  Suggested = 1,

  /**
      used to draw attention to the potentially damaging
          consequences of using the response. This appearance acts as a warning to
          the user.
  */
  Destructive = 2,
}

/**
    Determines how an [gid.adw1.sidebar.Sidebar] should look and behave.
    
    See [gid.adw1.sidebar.Sidebar.mode] and [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.mode].
*/
enum AdwSidebarMode
{
  /**
      The sidebar should be displayed as a sidebar
  */
  Sidebar = 0,

  /**
      The sidebar should be displayed as boxed lists page
  */
  Page = 1,
}

/**
    Describes the possible transitions in a [gid.adw1.squeezer.Squeezer] widget.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
enum AdwSqueezerTransitionType
{
  /**
      No transition
  */
  None = 0,

  /**
      A cross-fade
  */
  Crossfade = 1,
}

/**
    Describes available shortcuts in an [gid.adw1.tab_view.TabView].
    
    Shortcuts can be set with [gid.adw1.tab_view.TabView.shortcuts], or added/removed
    individually with [gid.adw1.tab_view.TabView.addShortcuts] and
    [gid.adw1.tab_view.TabView.removeShortcuts].
    
    New values may be added to this enumeration over time.
*/
enum AdwTabViewShortcuts : uint
{
  /**
      No shortcuts
  */
  None = 0,

  /**
      <kbd>Ctrl</kbd>+<kbd>Tab</kbd> - switch to the next page
  */
  ControlTab = 1,

  /**
      <kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>Tab</kbd> - switch to the previous
        page
  */
  ControlShiftTab = 2,

  /**
      <kbd>Ctrl</kbd>+<kbd>Page Up</kbd> - switch to the previous page
  */
  ControlPageUp = 4,

  /**
      <kbd>Ctrl</kbd>+<kbd>Page Down</kbd> - switch to the next page
  */
  ControlPageDown = 8,

  /**
      <kbd>Ctrl</kbd>+<kbd>Home</kbd> - switch to the first page
  */
  ControlHome = 16,

  /**
      <kbd>Ctrl</kbd>+<kbd>End</kbd> - switch to the last page
  */
  ControlEnd = 32,

  /**
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Page Up</kbd> - move the selected
        page backward
  */
  ControlShiftPageUp = 64,

  /**
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Page Down</kbd> - move the selected
        page forward
  */
  ControlShiftPageDown = 128,

  /**
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Home</kbd> - move the selected page
        at the start
  */
  ControlShiftHome = 256,

  /**
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>End</kbd> - move the current page at
        the end
  */
  ControlShiftEnd = 512,

  /**
      <kbd>Alt</kbd>+<kbd>1</kbd>⋯<kbd>9</kbd> - switch to pages 1-9
  */
  AltDigits = 1024,

  /**
      <kbd>Alt</kbd>+<kbd>0</kbd> - switch to page 10
  */
  AltZero = 2048,

  /**
      All of the shortcuts
  */
  AllShortcuts = 4095,
}

/**
    [gid.adw1.toast.Toast] behavior when another toast is already displayed.
*/
enum AdwToastPriority
{
  /**
      the toast will be queued if another toast is
        already displayed.
  */
  Normal = 0,

  /**
      the toast will be displayed immediately, pushing
        the previous toast into the queue instead.
  */
  High = 1,
}

/**
    Describes the possible top or bottom bar styles in an [gid.adw1.toolbar_view.ToolbarView]
    widget.
    
    [gid.adw1.types.ToolbarStyle.Flat] is suitable for simple content, such as
    [gid.adw1.status_page.StatusPage] or [gid.adw1.preferences_page.PreferencesPage], where the background at the
    top and bottom parts of the page is uniform. Additionally, windows with
    sidebars should always use this style.
    
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-1-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-1.png" alt="toolbar-view-flat-1">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-2-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-2.png" alt="toolbar-view-flat-2">
    </picture>
    
    [gid.adw1.types.ToolbarStyle.Raised] style is suitable for content such as
    [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
    where some elements are directly adjacent to the top/bottom bars, or
    [gid.adw1.tab_view.TabView], where each page can have a different background.
    
    `enum@Adw.ToolbarStyle.raised-border` style is similar to
    [gid.adw1.types.ToolbarStyle.Raised], but with the shadow replaced with a more
    subtle border. It's intended to be used in applications like image viewers,
    where a shadow over the content might be undesired.
    
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised.png" alt="toolbar-view-raised">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-border-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised-border.png" alt="toolbar-view-raised-border">
    </picture>
    
    See [gid.adw1.toolbar_view.ToolbarView.topBarStyle] and
    [gid.adw1.toolbar_view.ToolbarView.bottomBarStyle].
    
    New values may be added to this enumeration over time.
*/
enum AdwToolbarStyle
{
  /**
      No background, shadow only for scrolled content
  */
  Flat = 0,

  /**
      Opaque background with a persistent shadow
  */
  Raised = 1,

  /**
      Opaque background with a persistent border
  */
  RaisedBorder = 2,
}

/**
    Describes the adaptive modes of [gid.adw1.view_switcher.ViewSwitcher].
*/
enum AdwViewSwitcherPolicy
{
  /**
      Force the narrow mode
  */
  Narrow = 0,

  /**
      Force the wide mode
  */
  Wide = 1,
}

/**
    Describes line wrapping behavior in a [gid.adw1.wrap_layout.WrapLayout] or [gid.adw1.wrap_box.WrapBox].
    
    See [gid.adw1.wrap_layout.WrapLayout.wrapPolicy] and [gid.adw1.wrap_box.WrapBox.wrapPolicy].
*/
enum AdwWrapPolicy
{
  /**
      Fit as many children into each line as possible, shrinking
          them down to their minimum size before wrapping to the next line.
  */
  Minimum = 0,

  /**
      Wrap to the next line as soon as the previous line cannot
          fit any more children without shrinking them past their natural size.
  */
  Natural = 1,
}

/**
    A dialog showing information about the application.
    
    <picture>
      <source srcset="about-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-dialog.png" alt="about-dialog">
    </picture>
    
    an about dialog is typically opened when the user activates the `About …`
    item in the application's primary menu. All parts of the dialog are optional.
    
    ## Main page
    
    [gid.adw1.about_dialog.AboutDialog] prominently displays the application's icon, name, developer
    name and version. They can be set with the [gid.adw1.about_dialog.AboutDialog.applicationIcon],
    [gid.adw1.about_dialog.AboutDialog.applicationName],
    [gid.adw1.about_dialog.AboutDialog.developerName] and [gid.adw1.about_dialog.AboutDialog.version_]
    respectively.
    
    ## What's New
    
    [gid.adw1.about_dialog.AboutDialog] provides a way for applications to display their release
    notes, set with the [gid.adw1.about_dialog.AboutDialog.releaseNotes] property.
    
    Release notes are formatted the same way as
    [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
    
    The supported formatting options are:
    
    * Paragraph (`<p>`)
    * Ordered list (`<ol>`), with list items (`<li>`)
    * Unordered list (`<ul>`), with list items (`<li>`)
    
    Within paragraphs and list items, emphasis (`<em>`) and inline code
    (`<code>`) text styles are supported. The emphasis is rendered in italic,
    while inline code is shown in a monospaced font.
    
    Any text outside paragraphs or list items is ignored.
    
    Nested lists are not supported.
    
    Only one version can be shown at a time. By default, the displayed version
    number matches [gid.adw1.about_dialog.AboutDialog.version_]. Use
    [gid.adw1.about_dialog.AboutDialog.releaseNotesVersion] to override it.
    
    ## Details
    
    The Details page displays the application comments and links.
    
    The comments can be set with the [gid.adw1.about_dialog.AboutDialog.comments] property.
    Unlike [gid.gtk4.about_dialog.AboutDialog.comments], this string can be long and
    detailed. It can also contain links and Pango markup.
    
    To set the application website, use [gid.adw1.about_dialog.AboutDialog.website].
    To add extra links below the website, use [gid.adw1.about_dialog.AboutDialog.addLink].
    
    If the Details page doesn't have any other content besides website, the
    website will be displayed on the main page instead.
    
    ## Troubleshooting
    
    [gid.adw1.about_dialog.AboutDialog] displays the following two links on the main page:
    
    * Support Questions, set with the [gid.adw1.about_dialog.AboutDialog.supportUrl] property,
    * Report an Issue, set with the [gid.adw1.about_dialog.AboutDialog.issueUrl] property.
    
    Additionally, applications can provide debugging information. It will be
    shown separately on the Troubleshooting page. Use the
    [gid.adw1.about_dialog.AboutDialog.debugInfo] property to specify it.
    
    It's intended to be attached to issue reports when reporting issues against
    the application. As such, it cannot contain markup or links.
    
    [gid.adw1.about_dialog.AboutDialog] provides a quick way to save debug information to a file.
    When saving, [gid.adw1.about_dialog.AboutDialog.debugInfoFilename] would be used as
    the suggested filename.
    
    ## Credits and Acknowledgements
    
    The Credits page has the following default sections:
    
    * Developers, set with the [gid.adw1.about_dialog.AboutDialog.developers] property,
    * Designers, set with the [gid.adw1.about_dialog.AboutDialog.designers] property,
    * Artists, set with the [gid.adw1.about_dialog.AboutDialog.artists] property,
    * Documenters, set with the [gid.adw1.about_dialog.AboutDialog.documenters] property,
    * Translators, set with the [gid.adw1.about_dialog.AboutDialog.translatorCredits] property.
    
    When setting translator credits, use the strings `"translator-credits"` or
    `"translator_credits"` and mark them as translatable.
    
    The default sections that don't contain any names won't be displayed.
    
    The Credits page can also contain an arbitrary number of extra sections below
    the default ones. Use [gid.adw1.about_dialog.AboutDialog.addCreditSection] to add them.
    
    The Acknowledgements page can be used to acknowledge additional people and
    organizations for their non-development contributions. Use
    [gid.adw1.about_dialog.AboutDialog.addAcknowledgementSection] to add sections to it. For
    example, it can be used to list backers in a crowdfunded project or to give
    special thanks.
    
    Each of the people or organizations can have an email address or a website
    specified. To add a email address, use a string like
    `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title, use a
    string like `The GNOME Project https://www.gnome.org`:
    
    <picture>
      <source srcset="about-dialog-credits-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-dialog-credits.png" alt="about-dialog-credits">
    </picture>
    
    ## Legal
    
    The Legal page displays the copyright and licensing information for the
    application and other modules.
    
    The copyright string is set with the [gid.adw1.about_dialog.AboutDialog.copyright]
    property and should be a short string of one or two lines, for example:
    `© 2022 Example`.
    
    Licensing information can be quickly set from a list of known licenses with
    the [gid.adw1.about_dialog.AboutDialog.licenseType] property. If the application's
    license is not in the list, [gid.adw1.about_dialog.AboutDialog.license] can be used
    instead.
    
    To add information about other modules, such as application dependencies or
    data, use [gid.adw1.about_dialog.AboutDialog.addLegalSection].
    
    ## Other applications
    
    [gid.adw1.about_dialog.AboutDialog] can show links to your other apps at the end of the main
    page. To add them, use [gid.adw1.about_dialog.AboutDialog.addOtherApp].
    
    ## Constructing
    
    To make constructing an [gid.adw1.about_dialog.AboutDialog] as convenient as possible, you can
    use the function `func@show_about_dialog` which constructs and shows a
    dialog.
    
    ```c
    static void
    show_about (GtkApplication *app)
    {
      const char *developers[] = {
        "Angela Avery",
        NULL
      };
    
      const char *designers[] = {
        "GNOME Design Team",
        NULL
      };
    
      adw_show_about_dialog (GTK_WIDGET (gtk_application_get_active_window (app)),
                             "application-name", _("Example"),
                             "application-icon", "org.example.App",
                             "version", "1.2.3",
                             "copyright", "© 2022 Angela Avery",
                             "issue-url", "https://gitlab.gnome.org/example/example/-/issues/",
                             "license-type", GTK_LICENSE_GPL_3_0,
                             "developers", developers,
                             "designers", designers,
                             "translator-credits", _("translator-credits"),
                             NULL);
    }
    ```
    
    ## CSS nodes
    
    [gid.adw1.about_dialog.AboutDialog] has a main CSS node with the name `dialog` and the
    style class `.about`.
*/
struct AdwAboutDialog;

/** */
struct AdwAboutDialogClass
{
  /** */
  AdwDialogClass parentClass;
}

/**
    A window showing information about the application.
    
    <picture>
      <source srcset="about-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-window.png" alt="about-window">
    </picture>
    
    An about window is typically opened when the user activates the `About …`
    item in the application's primary menu. All parts of the window are optional.
    
    ## Main page
    
    [gid.adw1.about_window.AboutWindow] prominently displays the application's icon, name, developer
    name and version. They can be set with the [gid.adw1.about_window.AboutWindow.applicationIcon],
    [gid.adw1.about_window.AboutWindow.applicationName],
    [gid.adw1.about_window.AboutWindow.developerName] and [gid.adw1.about_window.AboutWindow.version_]
    respectively.
    
    ## What's New
    
    [gid.adw1.about_window.AboutWindow] provides a way for applications to display their release
    notes, set with the [gid.adw1.about_window.AboutWindow.releaseNotes] property.
    
    Release notes are formatted the same way as
    [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
    
    The supported formatting options are:
    
    * Paragraph (`<p>`)
    * Ordered list (`<ol>`), with list items (`<li>`)
    * Unordered list (`<ul>`), with list items (`<li>`)
    
    Within paragraphs and list items, emphasis (`<em>`) and inline code
    (`<code>`) text styles are supported. The emphasis is rendered in italic,
    while inline code is shown in a monospaced font.
    
    Any text outside paragraphs or list items is ignored.
    
    Nested lists are not supported.
    
    Only one version can be shown at a time. By default, the displayed version
    number matches [gid.adw1.about_window.AboutWindow.version_]. Use
    [gid.adw1.about_window.AboutWindow.releaseNotesVersion] to override it.
    
    ## Details
    
    The Details page displays the application comments and links.
    
    The comments can be set with the [gid.adw1.about_window.AboutWindow.comments] property.
    Unlike [gid.gtk4.about_dialog.AboutDialog.comments], this string can be long and
    detailed. It can also contain links and Pango markup.
    
    To set the application website, use [gid.adw1.about_window.AboutWindow.website].
    To add extra links below the website, use [gid.adw1.about_window.AboutWindow.addLink].
    
    If the Details page doesn't have any other content besides website, the
    website will be displayed on the main page instead.
    
    ## Troubleshooting
    
    [gid.adw1.about_window.AboutWindow] displays the following two links on the main page:
    
    * Support Questions, set with the [gid.adw1.about_window.AboutWindow.supportUrl] property,
    * Report an Issue, set with the [gid.adw1.about_window.AboutWindow.issueUrl] property.
    
    Additionally, applications can provide debugging information. It will be
    shown separately on the Troubleshooting page. Use the
    [gid.adw1.about_window.AboutWindow.debugInfo] property to specify it.
    
    It's intended to be attached to issue reports when reporting issues against
    the application. As such, it cannot contain markup or links.
    
    [gid.adw1.about_window.AboutWindow] provides a quick way to save debug information to a file.
    When saving, [gid.adw1.about_window.AboutWindow.debugInfoFilename] would be used as
    the suggested filename.
    
    ## Credits and Acknowledgements
    
    The Credits page has the following default sections:
    
    * Developers, set with the [gid.adw1.about_window.AboutWindow.developers] property,
    * Designers, set with the [gid.adw1.about_window.AboutWindow.designers] property,
    * Artists, set with the [gid.adw1.about_window.AboutWindow.artists] property,
    * Documenters, set with the [gid.adw1.about_window.AboutWindow.documenters] property,
    * Translators, set with the [gid.adw1.about_window.AboutWindow.translatorCredits] property.
    
    When setting translator credits, use the strings `"translator-credits"` or
    `"translator_credits"` and mark them as translatable.
    
    The default sections that don't contain any names won't be displayed.
    
    The Credits page can also contain an arbitrary number of extra sections below
    the default ones. Use [gid.adw1.about_window.AboutWindow.addCreditSection] to add them.
    
    The Acknowledgements page can be used to acknowledge additional people and
    organizations for their non-development contributions. Use
    [gid.adw1.about_window.AboutWindow.addAcknowledgementSection] to add sections to it. For
    example, it can be used to list backers in a crowdfunded project or to give
    special thanks.
    
    Each of the people or organizations can have an email address or a website
    specified. To add a email address, use a string like
    `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title, use a
    string like `The GNOME Project https://www.gnome.org`:
    
    <picture>
      <source srcset="about-window-credits-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-window-credits.png" alt="about-window-credits">
    </picture>
    
    ## Legal
    
    The Legal page displays the copyright and licensing information for the
    application and other modules.
    
    The copyright string is set with the [gid.adw1.about_window.AboutWindow.copyright]
    property and should be a short string of one or two lines, for example:
    `© 2022 Example`.
    
    Licensing information can be quickly set from a list of known licenses with
    the [gid.adw1.about_window.AboutWindow.licenseType] property. If the application's
    license is not in the list, [gid.adw1.about_window.AboutWindow.license] can be used
    instead.
    
    To add information about other modules, such as application dependencies or
    data, use [gid.adw1.about_window.AboutWindow.addLegalSection].
    
    ## Constructing
    
    To make constructing an [gid.adw1.about_window.AboutWindow] as convenient as possible, you can
    use the function `func@show_about_window` which constructs and shows a
    window.
    
    ```c
    static void
    show_about (GtkApplication *app)
    {
      const char *developers[] = {
        "Angela Avery",
        NULL
      };
    
      const char *designers[] = {
        "GNOME Design Team",
        NULL
      };
    
      adw_show_about_window (gtk_application_get_active_window (app),
                             "application-name", _("Example"),
                             "application-icon", "org.example.App",
                             "version", "1.2.3",
                             "copyright", "© 2022 Angela Avery",
                             "issue-url", "https://gitlab.gnome.org/example/example/-/issues/",
                             "license-type", GTK_LICENSE_GPL_3_0,
                             "developers", developers,
                             "designers", designers,
                             "translator-credits", _("translator-credits"),
                             NULL);
    }
    ```
    
    ## CSS nodes
    
    [gid.adw1.about_window.AboutWindow] has a main CSS node with the name `window` and the
    style class `.about`.

    Deprecated: Use [gid.adw1.about_dialog.AboutDialog].
*/
struct AdwAboutWindow;

/** */
struct AdwAboutWindowClass
{
  /** */
  AdwWindowClass parentClass;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to present actions.
    
    <picture>
      <source srcset="action-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="action-row.png" alt="action-row">
    </picture>
    
    The [gid.adw1.action_row.ActionRow] widget can have a title, a subtitle and an icon. The row
    can receive additional widgets at its end, or prefix widgets at its start.
    
    It is convenient to present a preference and its related actions.
    
    [gid.adw1.action_row.ActionRow] is unactivatable by default, giving it an activatable widget
    will automatically make it activatable, but unsetting it won't change the
    row's activatability.
    
    ## AdwActionRow as GtkBuildable
    
    The [gid.adw1.action_row.ActionRow] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [gid.adw1.action_row.ActionRow] has a main CSS node with name `row`.
    
    It contains the subnode `box.header` for its main horizontal box, and
    `box.title` for the vertical box containing the title and subtitle labels.
    
    It contains subnodes `label.title` and `label.subtitle` representing
    respectively the title label and subtitle label.
    
    ## Style classes
    
    [gid.adw1.action_row.ActionRow] can use the [`.property`](style-classes.html#property-rows)
    style class to emphasize the row subtitle instead of the row title, which is
    useful for displaying read-only properties.
    
    <picture>
      <source srcset="property-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="property-row.png" alt="property-row">
    </picture>
    
    When used together with the `.monospace` style class, only the subtitle
    becomes monospace, not the title or any extra widgets.
*/
struct AdwActionRow
{
  /** */
  AdwPreferencesRow parentInstance;
}

/** */
struct AdwActionRowClass
{
  /**
      The parent class
  */
  AdwPreferencesRowClass parentClass;

  /**
      Activates the row to trigger its main action.
  */
  extern(C) void function(AdwActionRow* self) activate;

  /** */
  void*[4] padding;
}

/**
    A dialog presenting a message or a question.
    
    <picture>
      <source srcset="alert-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="alert-dialog.png" alt="alert-dialog">
    </picture>
    
    Alert dialogs have a heading, a body, an optional child widget, and one or
    multiple responses, each presented as a button.
    
    Each response has a unique string ID, and a button label. Additionally, each
    response can be enabled or disabled, and can have a suggested or destructive
    appearance.
    
    When one of the responses is activated, or the dialog is closed, the
    [gid.adw1.alert_dialog.AlertDialog.response] signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    [gid.adw1.alert_dialog.AlertDialog.closeResponse] property if the dialog had been closed
    without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [gid.adw1.alert_dialog.AlertDialog] is closed automatically.
    
    An example of using an alert dialog:
    
    ```c
    AdwDialog *dialog;
    
    dialog = adw_alert_dialog_new (_("Replace File?"), NULL);
    
    adw_alert_dialog_format_body (ADW_ALERT_DIALOG (dialog),
                                  _("A file named “%s” already exists. Do you want to replace it?"),
                                  filename);
    
    adw_alert_dialog_add_responses (ADW_ALERT_DIALOG (dialog),
                                    "cancel",  _("_Cancel"),
                                    "replace", _("_Replace"),
                                    NULL);
    
    adw_alert_dialog_set_response_appearance (ADW_ALERT_DIALOG (dialog),
                                              "replace",
                                              ADW_RESPONSE_DESTRUCTIVE);
    
    adw_alert_dialog_set_default_response (ADW_ALERT_DIALOG (dialog), "cancel");
    adw_alert_dialog_set_close_response (ADW_ALERT_DIALOG (dialog), "cancel");
    
    g_signal_connect (dialog, "response", G_CALLBACK (response_cb), self);
    
    adw_dialog_present (dialog, parent);
    ```
    
    ## Async API
    
    [gid.adw1.alert_dialog.AlertDialog] can also be used via the [gid.adw1.alert_dialog.AlertDialog.choose] method.
    This API follows the GIO async pattern, for example:
    
    ```c
    static void
    dialog_cb (AdwAlertDialog *dialog,
               GAsyncResult   *result,
               MyWindow       *self)
    {
      const char *response = adw_alert_dialog_choose_finish (dialog, result);
    
      // ...
    }
    
    static void
    show_dialog (MyWindow *self)
    {
      AdwDialog *dialog;
    
      dialog = adw_alert_dialog_new (_("Replace File?"), NULL);
    
      adw_alert_dialog_format_body (ADW_ALERT_DIALOG (dialog),
                                    _("A file named “%s” already exists. Do you want to replace it?"),
                                    filename);
    
      adw_alert_dialog_add_responses (ADW_ALERT_DIALOG (dialog),
                                      "cancel",  _("_Cancel"),
                                      "replace", _("_Replace"),
                                      NULL);
    
      adw_alert_dialog_set_response_appearance (ADW_ALERT_DIALOG (dialog),
                                                "replace",
                                                ADW_RESPONSE_DESTRUCTIVE);
    
      adw_alert_dialog_set_default_response (ADW_ALERT_DIALOG (dialog), "cancel");
      adw_alert_dialog_set_close_response (ADW_ALERT_DIALOG (dialog), "cancel");
    
      adw_alert_dialog_choose (ADW_ALERT_DIALOG (dialog), GTK_WIDGET (self),
                               NULL, (GAsyncReadyCallback) dialog_cb, self);
    }
    ```
    
    ## AdwAlertDialog as GtkBuildable
    
    [gid.adw1.alert_dialog.AlertDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    representing a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [gid.adw1.alert_dialog.AlertDialog.setResponseEnabled] and
    [gid.adw1.alert_dialog.AlertDialog.setResponseAppearance] for details.
    
    Example of an [gid.adw1.alert_dialog.AlertDialog] UI definition:
    
    ```xml
    <object class="AdwAlertDialog" id="dialog">
      <property name="heading" translatable="yes">Save Changes?</property>
      <property name="body" translatable="yes">Open documents contain unsaved changes. Changes which are not saved will be permanently lost.</property>
      <property name="default-response">save</property>
      <property name="close-response">cancel</property>
      <signal name="response" handler="response_cb"/>
      <responses>
        <response id="cancel" translatable="yes">_Cancel</response>
        <response id="discard" translatable="yes" appearance="destructive">_Discard</response>
        <response id="save" translatable="yes" appearance="suggested" enabled="false">_Save</response>
      </responses>
    </object>
    ```
*/
struct AdwAlertDialog
{
  /** */
  AdwDialog parentInstance;
}

/** */
struct AdwAlertDialogClass
{
  /** */
  AdwDialogClass parentClass;

  /** */
  extern(C) void function(AdwAlertDialog* self, const(char)* response) response;

  /** */
  void*[4] padding;
}

/**
    A base class for animations.
    
    [gid.adw1.animation.Animation] represents an animation on a widget. It has a target that
    provides a value to animate, and a state indicating whether the
    animation hasn't been started yet, is playing, paused or finished.
    
    Currently there are two concrete animation types:
    [gid.adw1.timed_animation.TimedAnimation] and [gid.adw1.spring_animation.SpringAnimation].
    
    [gid.adw1.animation.Animation] will automatically skip the animation if
    [gid.adw1.animation.Animation.widget] is unmapped, or if
    [gid.gtk4.settings.Settings.gtkEnableAnimations] is `FALSE`.
    
    The [gid.adw1.animation.Animation.done] signal can be used to perform an action after
    the animation ends, for example hiding a widget after animating its
    [gid.gtk4.widget.Widget.opacity] to 0.
    
    [gid.adw1.animation.Animation] will be kept alive while the animation is playing. As such,
    it's safe to create an animation, start it and immediately unref it:
    A fire-and-forget animation:
    
    ```c
    static void
    animation_cb (double    value,
                  MyObject *self)
    {
      // Do something with @value
    }
    
    static void
    my_object_animate (MyObject *self)
    {
      AdwAnimationTarget *target =
        adw_callback_animation_target_new ((AdwAnimationTargetFunc) animation_cb,
                                           self, NULL);
      g_autoptr (AdwAnimation) animation =
        adw_timed_animation_new (widget, 0, 1, 250, target);
    
      adw_animation_play (animation);
    }
    ```
    
    If there's a chance the previous animation for the same target hasn't yet
    finished, the previous animation should be stopped first, or the existing
    [gid.adw1.animation.Animation] object can be reused.
*/
struct AdwAnimation
{
  /** */
  GObject parentInstance;
}

/** */
struct AdwAnimationClass;

/**
    Represents a value [gid.adw1.animation.Animation] can animate.
*/
struct AdwAnimationTarget;

/** */
struct AdwAnimationTargetClass;

/**
    A base class for Adwaita applications.
    
    [gid.adw1.application.Application] handles library initialization by calling `func@init` in the
    default [gid.gio2.application.Application.startup] signal handler, in turn chaining up
    as required by [gid.gtk4.application.Application]. Therefore, any subclass of
    [gid.adw1.application.Application] should always chain up its `startup` handler before using
    any Adwaita or GTK API.
    
    ## Automatic Resources
    
    [gid.adw1.application.Application] will automatically load certain resources located in the
    application's resource base path (see
    [gid.gio2.application.Application.setResourceBasePath], if they're present.
    
    ### Shortcuts Dialog
    
    If there's a resource located at `shortcuts-dialog.ui` which defines an
    [gid.adw1.shortcuts_dialog.ShortcutsDialog] with the ID `shortcuts_dialog`, [gid.adw1.application.Application]
    will set up an `app.shortcuts` action that creates and presents this dialog,
    as well as a <kbd>Ctrl</kbd><kbd>?</kbd> accelerator for it.
    
    ### Stylesheet
    
    If there's a resource located at `style.css`, [gid.adw1.application.Application] will load
    styles from it. This can be used to add custom styles to the application.
    
    #### Additional styles (deprecated)
    
    [gid.adw1.application.Application] will also load the following stylesheets conditionally:
    
    - `style-dark.css` when [gid.adw1.style_manager.StyleManager.dark] is `TRUE`.
    
    - `style-hc.css` when the system high contrast preference is enabled.
    
    - `style-hc-dark.css` when the system high contrast preference is enabled and
      [gid.adw1.style_manager.StyleManager.dark] is `TRUE`.
    
    :::warning
        These resources are deprecated since 1.9.
    
        Use `style.css` with the following media queries instead:
    
        - `prefers-color-scheme: dark` for styles used only for dark appearance.
        - `prefers-contrast: more` for styles used only when the system high
          contrast preference is enabled.
*/
struct AdwApplication
{
  /** */
  GtkApplication parentInstance;
}

/** */
struct AdwApplicationClass
{
  /**
      The parent class
  */
  GtkApplicationClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A freeform application window.
    
    <picture>
      <source srcset="application-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="application-window.png" alt="application-window">
    </picture>
    
    [gid.adw1.application_window.ApplicationWindow] is a [gid.gtk4.application_window.ApplicationWindow] subclass providing
    the same features as [gid.adw1.window.Window].
    
    See [gid.adw1.window.Window] for details.
    
    Example of an [gid.adw1.application_window.ApplicationWindow] UI definition:
    
    ```xml
    <object class="AdwApplicationWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar"/>
          </child>
          <property name="content">
            <!-- ... -->
          </property>
        </object>
      </property>
    </object>
    ```
    
    Using [gid.gtk4.application.Application.menubar] is not supported and may result in
    visual glitches.
*/
struct AdwApplicationWindow
{
  /** */
  GtkApplicationWindow parentInstance;
}

/** */
struct AdwApplicationWindowClass
{
  /** */
  GtkApplicationWindowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A widget displaying an image, with a generated fallback.
    
    <picture>
      <source srcset="avatar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="avatar.png" alt="avatar">
    </picture>
    
    [gid.adw1.avatar.Avatar] is a widget that shows a round avatar.
    
    [gid.adw1.avatar.Avatar] generates an avatar with the initials of  the
    [gid.adw1.avatar.Avatar.text] on top of a colored background.
    
    The color is picked based on the hash of the [gid.adw1.avatar.Avatar.text].
    
    If [gid.adw1.avatar.Avatar.showInitials] is set to `FALSE`,
    [gid.adw1.avatar.Avatar.iconName] or `adw-avatar-default-symbolic` is shown instead
    of the initials.
    
    Use [gid.adw1.avatar.Avatar.customImage] to set a custom image.
    
    ## CSS nodes
    
    [gid.adw1.avatar.Avatar] has a single CSS node with name `avatar`.
    
    ## Accessibility
    
    [gid.adw1.avatar.Avatar] uses the [gid.gtk4.types.AccessibleRole.Img] role.
*/
struct AdwAvatar;

/** */
struct AdwAvatarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A bar with contextual information.
    
    <picture>
      <source srcset="banner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="banner.png" alt="banner">
    </picture>
    
    Banners are hidden by default, use [gid.adw1.banner.Banner.revealed] to show them.
    
    Banners have a title, set with [gid.adw1.banner.Banner.title]. Titles can be marked
    up with Pango markup, use [gid.adw1.banner.Banner.useMarkup] to enable it.
    
    The title will be shown centered or left-aligned depending on available
    space.
    
    Banners can optionally have a button with text on it, set through
    [gid.adw1.banner.Banner.buttonLabel]. The button can be used with a [gid.gio2.action.Action],
    or with the [gid.adw1.banner.Banner.buttonClicked] signal. The button can have
    different styles, a gray style and a suggested style.
    
    <picture>
      <source srcset="banner-suggested-dark.png" media="(prefers-color-scheme: dark)">
      <img src="banner-suggested.png" alt="banner with suggested button style">
    </picture>
    
    ## CSS nodes
    
    [gid.adw1.banner.Banner] has a main CSS node with the name `banner`.
*/
struct AdwBanner;

/** */
struct AdwBannerClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A widget with one child.
    
    <picture>
      <source srcset="bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="bin.png" alt="bin">
    </picture>
    
    The [gid.adw1.bin.Bin] widget has only one child, set with the [gid.adw1.bin.Bin.child]
    property.
    
    It is useful for deriving subclasses, since it provides common code needed
    for handling a single child widget.
*/
struct AdwBin
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwBinClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A bottom sheet with an optional bottom bar.
    
    <picture>
      <source srcset="bottom-sheet-dark.png" media="(prefers-color-scheme: dark)">
      <img src="bottom-sheet.png" alt="bottom-sheet">
    </picture>
    
    [gid.adw1.bottom_sheet.BottomSheet] has three child widgets. [gid.adw1.bottom_sheet.BottomSheet.content] is
    shown persistently. [gid.adw1.bottom_sheet.BottomSheet.sheet] is displayed above it when
    it's open, and [gid.adw1.bottom_sheet.BottomSheet.bottomBar] is displayed when it's not.
    
    Bottom sheet and bottom bar are attached to the bottom edge of the widget.
    They take the full width by default, but can only take a portion of it if
    [gid.adw1.bottom_sheet.BottomSheet.fullWidth] is set to `FALSE`. In this case,
    [gid.adw1.bottom_sheet.BottomSheet.align_] determines where along the bottom edge they are
    placed.
    
    Bottom bar can be hidden using the [gid.adw1.bottom_sheet.BottomSheet.revealBottomBar]
    property.
    
    [gid.adw1.bottom_sheet.BottomSheet] can be useful for applications such as music players, that
    want to have a persistent bottom bar that expands into a bottom sheet when
    clicked. It's meant for cases where a bottom sheet is tightly integrated into
    the UI. For more transient bottom sheets, see [gid.adw1.dialog.Dialog].
    
    To open or close the bottom sheet, use the [gid.adw1.bottom_sheet.BottomSheet.open]
    property.
    
    By default, the bottom sheet has an overlaid drag handle. It can be disabled
    by setting [gid.adw1.bottom_sheet.BottomSheet.showDragHandle] to `FALSE`. Note that the
    handle also controls whether the sheet can be dragged using a pointer.
    
    Bottom sheets are modal by default, meaning that the content is dimmed and
    cannot be accessed while the sheet is open. Set [gid.adw1.bottom_sheet.BottomSheet.modal]
    to `FALSE` if this behavior is unwanted.
    
    To disable user interactions for opening or closing the bottom sheet (such as
    swipes or clicking the bottom bar or close button), set
    [gid.adw1.bottom_sheet.BottomSheet.canOpen] or [gid.adw1.bottom_sheet.BottomSheet.canClose] to
    `FALSE`.
    
    In some cases, particularly when using a full-width bottom bar, it may be
    necessary to shift [gid.adw1.bottom_sheet.BottomSheet.content] upwards. Use the
    [gid.adw1.bottom_sheet.BottomSheet.bottomBarHeight] and
    [gid.adw1.bottom_sheet.BottomSheet.sheetHeight] for that.
    
    [gid.adw1.bottom_sheet.BottomSheet] is not adaptive, and for larger window sizes applications
    may want to replace it with another UI, such as a sidebar. This can be done
    using [gid.adw1.multi_layout_view.MultiLayoutView].
    
    ## Sizing
    
    Unlike [gid.adw1.dialog.Dialog] presented as a bottom sheet, [gid.adw1.bottom_sheet.BottomSheet] just
    follows the content's natural size, and it's up to the applications to make
    sure their content provides one. For example, when using
    [gid.gtk4.scrolled_window.ScrolledWindow], make sure to set
    [gid.gtk4.scrolled_window.ScrolledWindow.propagateNaturalHeight] to `TRUE`.
    
    ## Header Bar Integration
    
    When placed inside an [gid.adw1.bottom_sheet.BottomSheet], [gid.adw1.header_bar.HeaderBar] will not show the
    title when [gid.adw1.bottom_sheet.BottomSheet.showDragHandle] is `TRUE`, regardless of
    [gid.adw1.header_bar.HeaderBar.showTitle]. This only applies to the default title,
    titles set with [gid.adw1.header_bar.HeaderBar.titleWidget] will still be shown.
    
    ## [gid.adw1.bottom_sheet.BottomSheet] as [gid.gtk4.buildable.Buildable]:
    
    The [gid.adw1.bottom_sheet.BottomSheet] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports setting the sheet widget by specifying “sheet” as the “type”
    attribute of a `<child>` element, and the bottom bar by specifying
    “bottom-bar”. Specifying “content” or omitting the child type results in
    setting the content child.
*/
struct AdwBottomSheet;

/** */
struct AdwBottomSheetClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    Describes a breakpoint for [gid.adw1.window.Window] or [gid.adw1.dialog.Dialog].
    
    Breakpoints are used to create adaptive UI, allowing to change the layout
    depending on available size.
    
    Breakpoint is a size threshold, specified by its condition, as well as one or
    more setters.
    
    Each setter has a target object, a property and a value. When a breakpoint
    is applied, each setter sets the target property on their target object to
    the specified value, and reset it back to the original value when it's
    unapplied.
    
    For more complicated scenarios, [gid.adw1.breakpoint.Breakpoint.apply] and
    [gid.adw1.breakpoint.Breakpoint.unapply] can be used instead.
    
    Breakpoints can be used within [gid.adw1.window.Window], [gid.adw1.application_window.ApplicationWindow],
    [gid.adw1.dialog.Dialog] or [gid.adw1.breakpoint_bin.BreakpointBin].
    
    ## [gid.adw1.breakpoint.Breakpoint] as [gid.gtk4.buildable.Buildable]:
    
    [gid.adw1.breakpoint.Breakpoint] supports specifying its condition via the `<condition>`
    element. The contents of the element must be a string in a format accepted by
    [gid.adw1.breakpoint_condition.BreakpointCondition.parse].
    
    It also supports adding setters via the `<setter>` element. Each `<setter>`
    element must have the `object` attribute specifying the target object, and
    the `property` attribute specifying the property name. The contents of the
    element are used as the setter value.
    
    For `G_TYPE_OBJECT` and `G_TYPE_BOXED` derived properties, empty contents are
    treated as `NULL`.
    
    Setter values can be translated with the usual `translatable`, `context` and
    `comments` attributes.
    
    Example of an [gid.adw1.breakpoint.Breakpoint] UI definition:
    
    ```xml
    <object class="AdwBreakpoint">
      <condition>max-width: 400px</condition>
      <setter object="button" property="visible">True</setter>
      <setter object="box" property="orientation">vertical</setter>
      <setter object="page" property="title" translatable="yes">Example</setter>
    </object>
    ```
*/
struct AdwBreakpoint;

/**
    A widget that changes layout based on available size.
    
    <picture>
      <source srcset="breakpoint-bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="breakpoint-bin.png" alt="breakpoint-bin">
    </picture>
    
    [gid.adw1.breakpoint_bin.BreakpointBin] provides a way to use breakpoints without [gid.adw1.window.Window],
    [gid.adw1.application_window.ApplicationWindow] or [gid.adw1.dialog.Dialog]. It can be useful for limiting
    breakpoints to a single page and similar purposes. Most applications
    shouldn't need it.
    
    [gid.adw1.breakpoint_bin.BreakpointBin] is similar to [gid.adw1.bin.Bin]. It has one child, set via the
    [gid.adw1.breakpoint_bin.BreakpointBin.child] property.
    
    When [gid.adw1.breakpoint_bin.BreakpointBin] is resized, its child widget can rearrange its layout
    at specific thresholds.
    
    The thresholds and layout changes are defined via [gid.adw1.breakpoint.Breakpoint] objects.
    They can be added using [gid.adw1.breakpoint_bin.BreakpointBin.addBreakpoint].
    
    Each breakpoint has a condition, specifying the bin's size and/or aspect
    ratio, and setters that automatically set object properties when that
    happens. The [gid.adw1.breakpoint.Breakpoint.apply] and [gid.adw1.breakpoint.Breakpoint.unapply] can
    be used instead for more complex scenarios.
    
    Breakpoints are only allowed to modify widgets inside the [gid.adw1.breakpoint_bin.BreakpointBin],
    but not on the [gid.adw1.breakpoint_bin.BreakpointBin] itself or any other widgets.
    
    If multiple breakpoints can be used for the current size, the last one is
    always picked. The current breakpoint can be tracked using the
    [gid.adw1.breakpoint_bin.BreakpointBin.currentBreakpoint] property.
    
    If none of the breakpoints can be used, that property will be set to `NULL`,
    and the original property values will be used instead.
    
    ## Minimum Size
    
    Adding a breakpoint to [gid.adw1.breakpoint_bin.BreakpointBin] will result in it having no minimum
    size. The [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] properties must always be set when using
    breakpoints, indicating the smallest size you want to support.
    
    The minimum size and breakpoint conditions must be carefully selected so that
    the child widget completely fits. If it doesn't, it will overflow and a
    warning message will be printed.
    
    When choosing minimum size, consider translations and text scale factor
    changes. Make sure to leave enough space for text labels, and enable
    ellipsizing or wrapping if they might not fit.
    
    For [gid.gtk4.label.Label] this can be done via [gid.gtk4.label.Label.ellipsize], or
    via [gid.gtk4.label.Label.wrap] together with [gid.gtk4.label.Label.wrapMode].
    
    For buttons, use [gid.gtk4.button.Button.canShrink],
    [gid.gtk4.menu_button.MenuButton.canShrink], [gid.adw1.split_button.SplitButton.canShrink],
    or [gid.adw1.button_content.ButtonContent.canShrink].
    
    ## Example
    
    ```c
    GtkWidget *bin, *child;
    AdwBreakpoint *breakpoint;
    
    bin = adw_breakpoint_bin_new ();
    gtk_widget_set_size_request (bin, 150, 150);
    
    child = gtk_label_new ("Wide");
    gtk_label_set_ellipsize (GTK_LABEL (label), PANGO_ELLIPSIZE_END);
    gtk_widget_add_css_class (child, "title-1");
    adw_breakpoint_bin_set_child (ADW_BREAKPOINT_BIN (bin), child);
    
    breakpoint = adw_breakpoint_new (adw_breakpoint_condition_parse ("max-width: 200px"));
    adw_breakpoint_add_setters (breakpoint,
                                G_OBJECT (child), "label", "Narrow",
                                NULL);
    adw_breakpoint_bin_add_breakpoint (ADW_BREAKPOINT_BIN (bin), breakpoint);
    ```
    
    The bin has a single label inside it, displaying "Wide". When the bin's width
    is smaller than or equal to 200px, it changes to "Narrow".
    
    ## [gid.adw1.breakpoint_bin.BreakpointBin] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.breakpoint_bin.BreakpointBin] allows adding [gid.adw1.breakpoint.Breakpoint] objects as children.
    
    Example of an [gid.adw1.breakpoint_bin.BreakpointBin] UI definition:
    
    ```xml
    <object class="AdwBreakpointBin">
      <property name="width-request">150</property>
      <property name="height-request">150</property>
      <property name="child">
        <object class="GtkLabel" id="child">
          <property name="label">Wide</property>
          <property name="ellipsize">end</property>
          <style>
            <class name="title-1"/>
          </style>
        </object>
      </property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 200px</condition>
          <setter object="child" property="label">Narrow</setter>
        </object>
      </child>
    </object>
    ```
    
    See [gid.adw1.breakpoint.Breakpoint] documentation for details.
*/
struct AdwBreakpointBin
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwBreakpointBinClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  void*[4] padding;
}

/** */
struct AdwBreakpointClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Describes condition for an [gid.adw1.breakpoint.Breakpoint].
*/
struct AdwBreakpointCondition;

/**
    A helper widget for creating buttons.
    
    <picture>
      <source srcset="button-content-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-content.png" alt="button-content">
    </picture>
    
    [gid.adw1.button_content.ButtonContent] is a box-like widget with an icon and a label.
    
    It's intended to be used as a direct child of [gid.gtk4.button.Button],
    [gid.gtk4.menu_button.MenuButton] or [gid.adw1.split_button.SplitButton], when they need to have both an
    icon and a label, as follows:
    
    ```xml
    <object class="GtkButton">
      <property name="child">
        <object class="AdwButtonContent">
          <property name="icon-name">document-open-symbolic</property>
          <property name="label" translatable="yes">_Open</property>
          <property name="use-underline">True</property>
        </object>
      </property>
    </object>
    ```
    
    [gid.adw1.button_content.ButtonContent] handles style classes and connecting the mnemonic to the
    button automatically.
    
    ## CSS nodes
    
    ```
    buttoncontent
    ╰── box
        ├── image
        ╰── label
    ```
    
    [gid.adw1.button_content.ButtonContent]'s CSS node is called `buttoncontent`. It contains a `box`
    subnode that serves as a container for the  `image` and `label` nodes.
    
    When inside a [gid.gtk4.button.Button] or [gid.adw1.split_button.SplitButton], the button will receive the
    `.image-text-button` style class. When inside a [gid.gtk4.menu_button.MenuButton], the
    internal [gid.gtk4.button.Button] will receive it instead.
    
    ## Accessibility
    
    [gid.adw1.button_content.ButtonContent] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwButtonContent;

/** */
struct AdwButtonContentClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] that looks like a button.
    
    <picture>
      <source srcset="button-rows-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-rows.png" alt="button-rows">
    </picture>
    
    The [gid.adw1.button_row.ButtonRow] widget has a title and two icons: before and after the
    title.
    
    It is convenient for presenting actions like "Delete" at the end of a boxed
    list.
    
    [gid.adw1.button_row.ButtonRow] is always activatable.
    
    ## CSS nodes
    
    [gid.adw1.button_row.ButtonRow] has a main CSS node with name `row` and the style class
    `.button`.
    
    It contains the subnode `box` for its main horizontal box, which contains the
    nodes: `image.icon.start` for the start icon, `label.title` for the title,
    and `image.icon.end` for the end icon.
    
    ## Style classes
    
    The [`.suggested-action`](style-classes.html#suggested-action) style class
    makes [gid.adw1.button_row.ButtonRow] use accent color for its background. It should be used
    very sparingly to denote important buttons.
    
    <picture>
      <source srcset="button-row-suggested-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-row-suggested-action.png" alt="button-row-suggested-action">
    </picture>
    
    The [`.destructive-action`](style-classes.html#destructive-action) style
    makes the row use destructive colors. It can be used to draw attention to the
    potentially damaging consequences of using it. This style acts as a warning
    to the user.
    
    <picture>
      <source srcset="button-row-destructive-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-row-destructive-action.png" alt="button-row-destructive-action">
    </picture>
*/
struct AdwButtonRow;

/** */
struct AdwButtonRowClass
{
  /** */
  AdwPreferencesRowClass parentClass;
}

/**
    An [gid.adw1.animation_target.AnimationTarget] that calls a given callback during the
    animation.
*/
struct AdwCallbackAnimationTarget;

/** */
struct AdwCallbackAnimationTargetClass;

/**
    A paginated scrolling widget.
    
    <picture>
      <source srcset="carousel-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel.png" alt="carousel">
    </picture>
    
    The [gid.adw1.carousel.Carousel] widget can be used to display a set of pages with
    swipe-based navigation between them.
    
    [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots] and [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines] can be used
    to provide page indicators for [gid.adw1.carousel.Carousel].
    
    ## CSS nodes
    
    [gid.adw1.carousel.Carousel] has a single CSS node with name `carousel`.
*/
struct AdwCarousel;

/** */
struct AdwCarouselClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A dots indicator for [gid.adw1.carousel.Carousel].
    
    <picture>
      <source srcset="carousel-indicator-dots-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-dots.png" alt="carousel-indicator-dots">
    </picture>
    
    The [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots] widget shows a set of dots for each page of a
    given [gid.adw1.carousel.Carousel]. The dot representing the carousel's active page is
    larger and more opaque than the others, the transition to the active and
    inactive state is gradual to match the carousel's position.
    
    See also [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines].
    
    ## CSS nodes
    
    [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots] has a single CSS node with name
    `carouselindicatordots`.
*/
struct AdwCarouselIndicatorDots;

/** */
struct AdwCarouselIndicatorDotsClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A lines indicator for [gid.adw1.carousel.Carousel].
    
    <picture>
      <source srcset="carousel-indicator-lines-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-lines.png" alt="carousel-indicator-lines">
    </picture>
    
    The [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines] widget shows a set of lines for each page of
    a given [gid.adw1.carousel.Carousel]. The carousel's active page is shown as another line
    that moves between them to match the carousel's position.
    
    See also [gid.adw1.carousel_indicator_dots.CarouselIndicatorDots].
    
    ## CSS nodes
    
    [gid.adw1.carousel_indicator_lines.CarouselIndicatorLines] has a single CSS node with name
    `carouselindicatorlines`.
*/
struct AdwCarouselIndicatorLines;

/** */
struct AdwCarouselIndicatorLinesClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A widget constraining its child to a given size.
    
    <picture>
      <source srcset="clamp-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-wide.png" alt="clamp-wide">
    </picture>
    <picture>
      <source srcset="clamp-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-narrow.png" alt="clamp-narrow">
    </picture>
    
    The [gid.adw1.clamp.Clamp] widget constrains the size of the widget it contains to a
    given maximum size. It will constrain the width if it is horizontal, or the
    height if it is vertical. The expansion of the child from its minimum to its
    maximum size is eased out for a smooth transition.
    
    If the child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [gid.adw1.clamp.Clamp] can scale with the text scale factor, use the
    [gid.adw1.clamp.Clamp.unit] property to enable that behavior.
    
    See also: [gid.adw1.clamp_layout.ClampLayout], [gid.adw1.clamp_scrollable.ClampScrollable].
    
    ## CSS nodes
    
    [gid.adw1.clamp.Clamp] has a single CSS node with name `clamp`.
*/
struct AdwClamp;

/** */
struct AdwClampClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A layout manager constraining its children to a given size.
    
    <picture>
      <source srcset="clamp-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-wide.png" alt="clamp-wide">
    </picture>
    <picture>
      <source srcset="clamp-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="clamp-narrow.png" alt="clamp-narrow">
    </picture>
    
    [gid.adw1.clamp_layout.ClampLayout] constraints the size of the widgets it contains to a given
    maximum size. It will constrain the width if it is horizontal, or the height
    if it is vertical. The expansion of the children from their minimum to their
    maximum size is eased out for a smooth transition.
    
    If a child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [gid.adw1.clamp_layout.ClampLayout] can scale with the text scale factor, use the
    [gid.adw1.clamp_layout.ClampLayout.unit] property to enable that behavior.
    
    See also: [gid.adw1.clamp.Clamp], [gid.adw1.clamp_scrollable.ClampScrollable].
*/
struct AdwClampLayout;

/** */
struct AdwClampLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    A scrollable [gid.adw1.clamp.Clamp].
    
    [gid.adw1.clamp_scrollable.ClampScrollable] is a variant of [gid.adw1.clamp.Clamp] that implements the
    [gid.gtk4.scrollable.Scrollable] interface.
    
    The primary use case for [gid.adw1.clamp_scrollable.ClampScrollable] is clamping
    [gid.gtk4.list_view.ListView].
    
    See also: [gid.adw1.clamp_layout.ClampLayout].
*/
struct AdwClampScrollable;

/** */
struct AdwClampScrollableClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to choose from a list of items.
    
    <picture>
      <source srcset="combo-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="combo-row.png" alt="combo-row">
    </picture>
    
    The [gid.adw1.combo_row.ComboRow] widget allows the user to choose from a list of valid
    choices. The row displays the selected choice. When activated, the row
    displays a popover which allows the user to make a new choice.
    
    Example of an [gid.adw1.combo_row.ComboRow] UI definition:
    ```xml
    <object class="AdwComboRow">
      <property name="title" translatable="yes">Combo Row</property>
      <property name="model">
        <object class="GtkStringList">
          <items>
            <item translatable="yes">Foo</item>
            <item translatable="yes">Bar</item>
            <item translatable="yes">Baz</item>
          </items>
        </object>
      </property>
    </object>
    ```
    
    The [gid.adw1.combo_row.ComboRow.selected] and [gid.adw1.combo_row.ComboRow.selectedItem]
    properties can be used to keep track of the selected item and react to their
    changes.
    
    [gid.adw1.combo_row.ComboRow] mirrors [gid.gtk4.drop_down.DropDown], see that widget for details.
    
    [gid.adw1.combo_row.ComboRow] is [gid.gtk4.list_box_row.ListBoxRow.activatable] if a model is set.
    
    ## CSS nodes
    
    [gid.adw1.combo_row.ComboRow] has a main CSS node with name `row` and the `.combo` style
    class.
    
    Its popover has the node named `popover` with the `.menu` style class, it
    contains a [gid.gtk4.scrolled_window.ScrolledWindow], which in turn contains a
    [gid.gtk4.list_view.ListView], both are accessible via their regular nodes.
    
    ## Accessibility
    
    [gid.adw1.combo_row.ComboRow] uses the `enum@Gtk.AccessibleRole.combo-box` role.
*/
struct AdwComboRow
{
  /** */
  AdwActionRow parentInstance;
}

/** */
struct AdwComboRowClass
{
  /**
      The parent class
  */
  AdwActionRowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    An adaptive dialog container.
    
    <picture>
      <source srcset="dialog-floating-dark.png" media="(prefers-color-scheme: dark)">
      <img src="dialog-floating.png" alt="dialog-floating">
    </picture>
    <picture>
      <source srcset="dialog-bottom-dark.png" media="(prefers-color-scheme: dark)">
      <img src="dialog-bottom.png" alt="dialog-bottom">
    </picture>
    
    [gid.adw1.dialog.Dialog] is similar to a window, but is shown within another window. It
    can be used with [gid.adw1.window.Window] and [gid.adw1.application_window.ApplicationWindow], use
    [gid.adw1.dialog.Dialog.present] to show it.
    
    [gid.adw1.dialog.Dialog] is not resizable. Use the [gid.adw1.dialog.Dialog.contentWidth] and
    [gid.adw1.dialog.Dialog.contentHeight] properties to set its size, or set
    [gid.adw1.dialog.Dialog.followsContentSize] to `TRUE` to make the dialog track the
    content's size as it changes. [gid.adw1.dialog.Dialog] can never be larger than its parent
    window.
    
    [gid.adw1.dialog.Dialog] can be presented as a centered floating window or a bottom sheet.
    By default it's automatic depending on the available size.
    [gid.adw1.dialog.Dialog.presentationMode] can be used to change that.
    
    [gid.adw1.dialog.Dialog] can be closed via [gid.adw1.dialog.Dialog.close].
    
    When presented as a bottom sheet, [gid.adw1.dialog.Dialog] can also be closed via swiping
    it down.
    
    The [gid.adw1.dialog.Dialog.canClose] can be used to prevent closing. In that case,
    [gid.adw1.dialog.Dialog.closeAttempt] gets emitted instead.
    
    Use [gid.adw1.dialog.Dialog.forceClose] to close the dialog even when `can-close` is set to
    `FALSE`.
    
    [gid.adw1.dialog.Dialog] is transient and doesn't integrate with the window below it, for
    example it's not possible to collapse it into a bottom bar. See
    [gid.adw1.bottom_sheet.BottomSheet] for persistent and more tightly integrated bottom sheets.
    
    ## Header Bar Integration
    
    When placed inside an [gid.adw1.dialog.Dialog], [gid.adw1.header_bar.HeaderBar] will display the dialog
    title instead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] to `FALSE` to remove it if it's
    unwanted.
    
    ## Breakpoints
    
    [gid.adw1.dialog.Dialog] can be used with [gid.adw1.breakpoint.Breakpoint] the same way as
    [gid.adw1.breakpoint_bin.BreakpointBin]. Refer to that widget's documentation for details.
    
    Like [gid.adw1.breakpoint_bin.BreakpointBin], if breakpoints are used, [gid.adw1.dialog.Dialog] doesn't have a
    minimum size, and [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] properties must be set manually.
*/
struct AdwDialog
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwDialogClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(AdwDialog* dialog) closeAttempt;

  /** */
  extern(C) void function(AdwDialog* dialog) closed;

  /** */
  void*[4] padding;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] with an embedded text entry.
    
    <picture>
      <source srcset="entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="entry-row.png" alt="entry-row">
    </picture>
    
    [gid.adw1.entry_row.EntryRow] has a title that doubles as placeholder text. It shows an icon
    indicating that it's editable and can receive additional widgets before or
    after the editable part.
    
    If [gid.adw1.entry_row.EntryRow.showApplyButton] is set to `TRUE`, [gid.adw1.entry_row.EntryRow] can
    show an apply button when editing its contents. This can be useful if
    changing its contents can result in an expensive operation, such as network
    activity.
    
    [gid.adw1.entry_row.EntryRow] provides only minimal API and should be used with the
    [gid.gtk4.editable.Editable] API.
    
    See also [gid.adw1.password_entry_row.PasswordEntryRow].
    
    ## AdwEntryRow as GtkBuildable
    
    The [gid.adw1.entry_row.EntryRow] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [gid.adw1.entry_row.EntryRow] has a single CSS node with name `row` and the `.entry` style
    class.
*/
struct AdwEntryRow
{
  /** */
  AdwPreferencesRow parentInstance;
}

/** */
struct AdwEntryRowClass
{
  /**
      The parent class
  */
  AdwPreferencesRowClass parentClass;
}

/**
    [gid.adw1.enum_list_item.EnumListItem] is the type of items in a [gid.adw1.enum_list_model.EnumListModel].
*/
struct AdwEnumListItem;

/** */
struct AdwEnumListItemClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gid.gio2.list_model.ListModel] representing values of a given enum.
    
    [gid.adw1.enum_list_model.EnumListModel] contains objects of type [gid.adw1.enum_list_item.EnumListItem].
*/
struct AdwEnumListModel;

/** */
struct AdwEnumListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to reveal widgets.
    
    <picture>
      <source srcset="expander-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="expander-row.png" alt="expander-row">
    </picture>
    
    The [gid.adw1.expander_row.ExpanderRow] widget allows the user to reveal or hide widgets below
    it. It also allows the user to enable the expansion of the row, allowing to
    disable all that the row contains.
    
    ## AdwExpanderRow as GtkBuildable
    
    The [gid.adw1.expander_row.ExpanderRow] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding a child as an suffix widget by specifying “suffix” as the
    “type” attribute of a <child> element.
    
    It also supports adding it as a prefix widget by specifying “prefix” as the
    “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [gid.adw1.expander_row.ExpanderRow] has a main CSS node with name `row` and the `.expander`
    style class. It has the `.empty` style class when it contains no children.
    
    It contains the subnodes `row.header` for its main embedded row,
    `list.nested` for the list it can expand, and `image.expander-row-arrow` for
    its arrow.
    
    ## Style classes
    
    [gid.adw1.expander_row.ExpanderRow] can use the [`.`](style-classes.html#property-rows)
    style class to emphasize the row subtitle instead of the row title, which is
    useful for displaying read-only properties.
    
    When used together with the `.monospace` style class, only the subtitle
    becomes monospace, not the title or any extra widgets.
*/
struct AdwExpanderRow
{
  /** */
  AdwPreferencesRow parentInstance;
}

/** */
struct AdwExpanderRowClass
{
  /**
      The parent class
  */
  AdwPreferencesRowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    An adaptive container acting like a box or an overlay.
    
    <picture>
      <source srcset="flap-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="flap-wide.png" alt="flap-wide">
    </picture>
    <picture>
      <source srcset="flap-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="flap-narrow.png" alt="flap-narrow">
    </picture>
    
    The [gid.adw1.flap.Flap] widget can display its children like a [gid.gtk4.box.Box] does or
    like a [gid.gtk4.overlay.Overlay] does, according to the
    [gid.adw1.flap.Flap.foldPolicy] value.
    
    [gid.adw1.flap.Flap] has at most three children: [gid.adw1.flap.Flap.content],
    [gid.adw1.flap.Flap.flap] and [gid.adw1.flap.Flap.separator]. Content is the primary
    child, flap is displayed next to it when unfolded, or overlays it when
    folded. Flap can be shown or hidden by changing the
    [gid.adw1.flap.Flap.revealFlap] value, as well as via swipe gestures if
    [gid.adw1.flap.Flap.swipeToOpen] and/or [gid.adw1.flap.Flap.swipeToClose] are set
    to `TRUE`.
    
    Optionally, a separator can be provided, which would be displayed between
    the content and the flap when there's no shadow to separate them, depending
    on the transition type.
    
    [gid.adw1.flap.Flap.flap] is transparent by default; add the
    [`.background`](style-classes.html#background) style class to it if this is
    unwanted.
    
    If [gid.adw1.flap.Flap.modal] is set to `TRUE`, content becomes completely
    inaccessible when the flap is revealed while folded.
    
    The position of the flap and separator children relative to the content is
    determined by orientation, as well as the [gid.adw1.flap.Flap.flapPosition]
    value.
    
    Folding the flap will automatically hide the flap widget, and unfolding it
    will automatically reveal it. If this behavior is not desired, the
    [gid.adw1.flap.Flap.locked] property can be used to override it.
    
    Common use cases include sidebars, header bars that need to be able to
    overlap the window content (for example, in fullscreen mode) and bottom
    sheets.
    
    ## AdwFlap as GtkBuildable
    
    The [gid.adw1.flap.Flap] implementation of the [gid.gtk4.buildable.Buildable] interface supports
    setting the flap child by specifying “flap” as the “type” attribute of a
    `<child>` element, and separator by specifying “separator”. Specifying
    “content” child type or omitting it results in setting the content child.
    
    ## CSS nodes
    
    [gid.adw1.flap.Flap] has a single CSS node with name `flap`. The node will get the style
    classes `.folded` when it is folded, and `.unfolded` when it's not.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
*/
struct AdwFlap;

/** */
struct AdwFlapClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A title bar widget.
    
    <picture>
      <source srcset="header-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="header-bar.png" alt="header-bar">
    </picture>
    
    [gid.adw1.header_bar.HeaderBar] is similar to [gid.gtk4.header_bar.HeaderBar], but provides additional
    features compared to it. Refer to [gid.gtk4.header_bar.HeaderBar] for details. It is typically
    used as a top bar within [gid.adw1.toolbar_view.ToolbarView].
    
    ## Dialog Integration
    
    When placed inside an [gid.adw1.dialog.Dialog], [gid.adw1.header_bar.HeaderBar] will display the dialog
    title instead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] to `FALSE` to remove it if it's
    unwanted.
    
    ## Navigation View Integration
    
    When placed inside an [gid.adw1.navigation_page.NavigationPage], [gid.adw1.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with [gid.adw1.navigation_view.NavigationView] or [gid.adw1.navigation_split_view.NavigationSplitView],
    it will also display a back button that can be used to go back to the previous
    page. The button also has a context menu, allowing to pop multiple pages at
    once, potentially across multiple navigation views.
    
    Set [gid.adw1.header_bar.HeaderBar.showBackButton] to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    ## Split View Integration
    
    When placed inside [gid.adw1.navigation_split_view.NavigationSplitView] or [gid.adw1.overlay_split_view.OverlaySplitView],
    [gid.adw1.header_bar.HeaderBar] will automatically hide the title buttons other than at the
    edges of the window.
    
    ## Bottom Sheet Integration
    
    When played inside [gid.adw1.bottom_sheet.BottomSheet], [gid.adw1.header_bar.HeaderBar] will not show the title
    unless [gid.adw1.bottom_sheet.BottomSheet.showDragHandle] is set to `FALSE`, regardless
    of [gid.adw1.header_bar.HeaderBar.showTitle]. This only applies to the default title,
    titles set with [gid.adw1.header_bar.HeaderBar.titleWidget] will still be shown.
    
    ## Centering Policy
    
    [gid.adw1.header_bar.HeaderBar.centeringPolicy] allows to enforce strict centering of
    the title widget. This can be useful for entries inside [gid.adw1.clamp.Clamp].
    
    ## Title Buttons
    
    Unlike [gid.gtk4.header_bar.HeaderBar], [gid.adw1.header_bar.HeaderBar] allows to toggle title button
    visibility for each side individually, using the
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] properties.
    
    ## CSS nodes
    
    ```
    headerbar
    ╰── windowhandle
        ╰── box
            ├── widget
            │   ╰── box.start
            │       ├── windowcontrols.start
            │       ├── widget
            │       │   ╰── [button.back]
            │       ╰── [other children]
            ├── widget
            │   ╰── [Title Widget]
            ╰── widget
                ╰── box.end
                    ├── [other children]
                    ╰── windowcontrols.end
    ```
    
    [gid.adw1.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains three `widget`
    subnodes at the start, center and end of the header bar. The start and end
    subnodes contain a `box` subnode with the `.start` and `.end` style classes
    respectively, and the center node contains a node that represents the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gid.gtk4.window_controls.WindowControls] for details, as well as other children.
    
    When [gid.adw1.header_bar.HeaderBar.showBackButton] is `TRUE`, the start box also
    contains a node with the name `widget` that contains a node with the name
    `button` and `.back` style class.
    
    ## Accessibility
    
    [gid.adw1.header_bar.HeaderBar] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwHeaderBar;

/** */
struct AdwHeaderBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A view switcher that uses a toggle group.
    
    <picture>
      <source srcset="inline-view-switcher-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher.png" alt="inline-view-switcher">
    </picture>
    
    A view switcher showing pages of an [gid.adw1.view_stack.ViewStack] within an
    [gid.adw1.toggle_group.ToggleGroup], similar to [gid.adw1.view_switcher.ViewSwitcher].
    
    The toggles can display either an icon, a label or both. Use the
    [gid.adw1.inline_view_switcher.InlineViewSwitcher.displayMode] to control this.
    
    <picture>
      <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
    </picture>
    
    ## CSS nodes
    
    [gid.adw1.inline_view_switcher.InlineViewSwitcher] has a single CSS node with the name
    `inline-view-switcher`.
    
    ## Style classes
    
    Like [gid.adw1.toggle_group.ToggleGroup], it can accept the [`.flat`](style-classes.html#flat_1)
    and [`.round`](style-classes.html#round) style classes.
    
    <picture>
      <source srcset="inline-view-switcher-style-classes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher-style-classes.png" alt="inline-view-switcher-style-classes">
    </picture>
    
    ## Accessibility
    
    The internal toggle group uses the `enum@Gtk.AccessibleRole.tab-list` role.
    Its toggles use the [gid.gtk4.types.AccessibleRole.Tab] role.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.view_switcher_bar.ViewSwitcherBar],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
struct AdwInlineViewSwitcher;

/** */
struct AdwInlineViewSwitcherClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An individual layout in [gid.adw1.multi_layout_view.MultiLayoutView].
*/
struct AdwLayout;

/** */
struct AdwLayoutClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A child slot within [gid.adw1.layout.Layout].
    
    While it contains a layout child, the [gid.gtk4.widget.Widget.visible] property
    of the slot is updated to match that of the layout child.
    
    See [gid.adw1.multi_layout_view.MultiLayoutView].
*/
struct AdwLayoutSlot;

/** */
struct AdwLayoutSlotClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An adaptive container acting like a box or a stack.
    
    <picture>
      <source srcset="leaflet-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="leaflet-wide.png" alt="leaflet-wide">
    </picture>
    <picture>
      <source srcset="leaflet-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="leaflet-narrow.png" alt="leaflet-narrow">
    </picture>
    
    The [gid.adw1.leaflet.Leaflet] widget can display its children like a [gid.gtk4.box.Box] does
    or like a [gid.gtk4.stack.Stack] does, adapting to size changes by switching
    between the two modes.
    
    When there is enough space the children are displayed side by side, otherwise
    only one is displayed and the leaflet is said to be “folded”.
    The threshold is dictated by the preferred minimum sizes of the children.
    When a leaflet is folded, the children can be navigated using swipe gestures.
    
    The “over” and “under” transition types stack the children one on top of the
    other, while the “slide” transition puts the children side by side. While
    navigating to a child on the side or below can be performed by swiping the
    current child away, navigating to an upper child requires dragging it from
    the edge where it resides. This doesn't affect non-dragging swipes.
    
    ## CSS nodes
    
    [gid.adw1.leaflet.Leaflet] has a single CSS node with name `leaflet`. The node will get the
    style classes `.folded` when it is folded, `.unfolded` when it's not, or none
    if it hasn't computed its fold yet.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
*/
struct AdwLeaflet;

/** */
struct AdwLeafletClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by [gid.adw1.leaflet.Leaflet].

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
*/
struct AdwLeafletPage;

/** */
struct AdwLeafletPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A dialog presenting a message or a question.
    
    <picture>
      <source srcset="message-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="message-dialog.png" alt="message-dialog">
    </picture>
    
    Message dialogs have a heading, a body, an optional child widget, and one or
    multiple responses, each presented as a button.
    
    Each response has a unique string ID, and a button label. Additionally, each
    response can be enabled or disabled, and can have a suggested or destructive
    appearance.
    
    When one of the responses is activated, or the dialog is closed, the
    [gid.adw1.message_dialog.MessageDialog.response] signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    [gid.adw1.message_dialog.MessageDialog.closeResponse] property if the dialog had been
    closed without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [gid.adw1.message_dialog.MessageDialog] is closed automatically.
    
    An example of using a message dialog:
    
    ```c
    GtkWidget *dialog;
    
    dialog = adw_message_dialog_new (parent, _("Replace File?"), NULL);
    
    adw_message_dialog_format_body (ADW_MESSAGE_DIALOG (dialog),
                                    _("A file named “%s” already exists. Do you want to replace it?"),
                                    filename);
    
    adw_message_dialog_add_responses (ADW_MESSAGE_DIALOG (dialog),
                                      "cancel",  _("_Cancel"),
                                      "replace", _("_Replace"),
                                      NULL);
    
    adw_message_dialog_set_response_appearance (ADW_MESSAGE_DIALOG (dialog), "replace", ADW_RESPONSE_DESTRUCTIVE);
    
    adw_message_dialog_set_default_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    adw_message_dialog_set_close_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    
    g_signal_connect (dialog, "response", G_CALLBACK (response_cb), self);
    
    gtk_window_present (GTK_WINDOW (dialog));
    ```
    
    ## Async API
    
    [gid.adw1.message_dialog.MessageDialog] can also be used via the [gid.adw1.message_dialog.MessageDialog.choose]
    method. This API follows the GIO async pattern, for example:
    
    ```c
    static void
    dialog_cb (AdwMessageDialog *dialog,
               GAsyncResult     *result,
               MyWindow         *self)
    {
      const char *response = adw_message_dialog_choose_finish (dialog, result);
    
      // ...
    }
    
    static void
    show_dialog (MyWindow *self)
    {
      GtkWidget *dialog;
    
      dialog = adw_message_dialog_new (GTK_WINDOW (self), _("Replace File?"), NULL);
    
      adw_message_dialog_format_body (ADW_MESSAGE_DIALOG (dialog),
                                      _("A file named “%s” already exists. Do you want to replace it?"),
                                      filename);
    
      adw_message_dialog_add_responses (ADW_MESSAGE_DIALOG (dialog),
                                        "cancel",  _("_Cancel"),
                                        "replace", _("_Replace"),
                                        NULL);
    
      adw_message_dialog_set_response_appearance (ADW_MESSAGE_DIALOG (dialog), "replace", ADW_RESPONSE_DESTRUCTIVE);
    
      adw_message_dialog_set_default_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
      adw_message_dialog_set_close_response (ADW_MESSAGE_DIALOG (dialog), "cancel");
    
      adw_message_dialog_choose (ADW_MESSAGE_DIALOG (dialog), NULL, (GAsyncReadyCallback) dialog_cb, self);
    }
    ```
    
    ## AdwMessageDialog as GtkBuildable
    
    [gid.adw1.message_dialog.MessageDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    representing a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [gid.adw1.message_dialog.MessageDialog.setResponseEnabled] and
    [gid.adw1.message_dialog.MessageDialog.setResponseAppearance] for details.
    
    Example of an [gid.adw1.message_dialog.MessageDialog] UI definition:
    
    ```xml
    <object class="AdwMessageDialog" id="dialog">
      <property name="heading" translatable="yes">Save Changes?</property>
      <property name="body" translatable="yes">Open documents contain unsaved changes. Changes which are not saved will be permanently lost.</property>
      <property name="default-response">save</property>
      <property name="close-response">cancel</property>
      <signal name="response" handler="response_cb"/>
      <responses>
        <response id="cancel" translatable="yes">_Cancel</response>
        <response id="discard" translatable="yes" appearance="destructive">_Discard</response>
        <response id="save" translatable="yes" appearance="suggested" enabled="false">_Save</response>
      </responses>
    </object>
    ```
    
    ## Accessibility
    
    [gid.adw1.message_dialog.MessageDialog] uses the [gid.gtk4.types.AccessibleRole.Dialog] role.

    Deprecated: Use [gid.adw1.alert_dialog.AlertDialog].
*/
struct AdwMessageDialog
{
  /** */
  GtkWindow parentInstance;
}

/** */
struct AdwMessageDialogClass
{
  /** */
  GtkWindowClass parentClass;

  /** */
  extern(C) void function(AdwMessageDialog* self, const(char)* response) response;

  /** */
  void*[4] padding;
}

/**
    A widget for switching between different layouts.
    
    [gid.adw1.multi_layout_view.MultiLayoutView] contains layouts and children. Each child has
    an ID, each layout has slots inside it, each slot also has an ID. When
    switching layouts, children are inserted into slots with matching IDs. The
    [gid.gtk4.widget.Widget.visible] property of each slot is updated to match
    that of the inserted child.
    
    This can be useful for rearranging children when it's difficult to do so
    otherwise, for example to move a child from a sidebar to a bottom bar.
    
    The currently used layout can be switched using the
    [gid.adw1.multi_layout_view.MultiLayoutView.layout] or [gid.adw1.multi_layout_view.MultiLayoutView.layoutName]
    properties. For example, it can be done via a [gid.adw1.breakpoint.Breakpoint] setter
    to change layouts depending on the window size.
    
    ## AdwMultiLayoutView as GtkBuildable
    
    The [gid.adw1.multi_layout_view.MultiLayoutView] implementation of the [gid.gtk4.buildable.Buildable]
    interface supports adding layouts via `<child>` element with the `type`
    attribute omitted.
    
    It also supports setting children via `<child type="ID">`.
    
    Example of an [gid.adw1.multi_layout_view.MultiLayoutView] UI definition that can display a secondary
    child as either a sidebar or a bottom sheet.
    
    ```xml
    <object class="AdwMultiLayoutView">
      <child>
        <object class="AdwLayout">
          <property name="name">sidebar</property>
          <property name="content">
            <object class="AdwOverlaySplitView">
              <property name="sidebar">
                <object class="AdwLayoutSlot">
                  <property name="id">secondary</property>
                </object>
              </property>
              <property name="content">
                <object class="AdwLayoutSlot">
                  <property name="id">primary</property>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child>
        <object class="AdwLayout">
          <property name="name">bottom-sheet</property>
          <property name="content">
            <object class="AdwBottomSheet">
              <property name="open">True</property>
              <property name="content">
                <object class="AdwLayoutSlot">
                  <property name="id">primary</property>
                </object>
              </property>
              <property name="sheet">
                <object class="AdwLayoutSlot">
                  <property name="id">secondary</property>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child type="primary">
        <!-- ... -->
      </child>
      <child type="secondary">
        <!-- ... -->
      </child>
    </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.multi_layout_view.MultiLayoutView] has a single CSS node with name `multi-layout-view`.
*/
struct AdwMultiLayoutView;

/** */
struct AdwMultiLayoutViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A page within [gid.adw1.navigation_view.NavigationView] or [gid.adw1.navigation_split_view.NavigationSplitView].
    
    Each page has a child widget, a title and optionally a tag.
    
    The [gid.adw1.navigation_page.NavigationPage.showing], [gid.adw1.navigation_page.NavigationPage.shown],
    [gid.adw1.navigation_page.NavigationPage.hiding] and [gid.adw1.navigation_page.NavigationPage.hidden] signals
    can be used to track the page's visibility within its [gid.adw1.navigation_view.NavigationView].
    
    ## Header Bar Integration
    
    When placed inside [gid.adw1.navigation_page.NavigationPage], [gid.adw1.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with [gid.adw1.navigation_view.NavigationView], it will also display a back
    button that can be used to go back to the previous page. Set
    [gid.adw1.header_bar.HeaderBar.showBackButton] to `FALSE` to disable that behavior if
    it's unwanted.
    
    ## CSS Nodes
    
    [gid.adw1.navigation_page.NavigationPage] has a single CSS node with name
    `navigation-view-page`.
    
    ## Accessibility
    
    [gid.adw1.navigation_page.NavigationPage] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwNavigationPage
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwNavigationPageClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(AdwNavigationPage* self) showing;

  /** */
  extern(C) void function(AdwNavigationPage* self) shown;

  /** */
  extern(C) void function(AdwNavigationPage* self) hiding;

  /** */
  extern(C) void function(AdwNavigationPage* self) hidden;

  /** */
  void*[8] padding;
}

/**
    A widget presenting sidebar and content side by side or as a navigation view.
    
    <picture>
      <source srcset="navigation-split-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-split-view.png" alt="navigation-split-view">
    </picture>
    <picture>
      <source srcset="navigation-split-view-collapsed-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-split-view-collapsed.png" alt="navigation-split-view-collapsed">
    </picture>
    
    [gid.adw1.navigation_split_view.NavigationSplitView] has two [gid.adw1.navigation_page.NavigationPage] children: sidebar and
    content, and displays them side by side.
    
    When [gid.adw1.navigation_split_view.NavigationSplitView.collapsed] is set to `TRUE`, it instead
    puts both children inside an [gid.adw1.navigation_view.NavigationView]. The
    [gid.adw1.navigation_split_view.NavigationSplitView.showContent] controls which child is visible
    while collapsed.
    
    See also [gid.adw1.overlay_split_view.OverlaySplitView].
    
    [gid.adw1.navigation_split_view.NavigationSplitView] is typically used together with an [gid.adw1.breakpoint.Breakpoint]
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="default-width">800</property>
      <property name="default-height">800</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwNavigationSplitView" id="split_view">
          <property name="sidebar">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Sidebar</property>
              <property name="child">
                <!-- ... -->
              </property>
            </object>
          </property>
          <property name="content">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Content</property>
              <property name="child">
                <!-- ... -->
              </property>
            </object>
          </property>
        </object>
      </property>
    </object>
    ```
    
    ## Sizing
    
    When not collapsed, [gid.adw1.navigation_split_view.NavigationSplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the [gid.adw1.navigation_split_view.NavigationSplitView.sidebarWidthFraction] property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    [gid.adw1.navigation_split_view.NavigationSplitView.minSidebarWidth] and
    [gid.adw1.navigation_split_view.NavigationSplitView.maxSidebarWidth] properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    [gid.adw1.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    ## Header Bar Integration
    
    When used inside [gid.adw1.navigation_split_view.NavigationSplitView], [gid.adw1.header_bar.HeaderBar] will
    automatically hide the window buttons in the middle.
    
    When collapsed, it also displays a back button for the content widget, as
    well as the page titles. See [gid.adw1.navigation_view.NavigationView] documentation for details.
    
    ## Actions
    
    [gid.adw1.navigation_split_view.NavigationSplitView] defines the same actions as [gid.adw1.navigation_view.NavigationView], but
    they can be used even when the split view is not collapsed:
    
    - `navigation.push` takes a string parameter specifying the tag of the page
    to push. If it matches the tag of the content widget, it sets
    [gid.adw1.navigation_split_view.NavigationSplitView.showContent] to `TRUE`.
    
    - `navigation.pop` doesn't take any parameters and sets
    [gid.adw1.navigation_split_view.NavigationSplitView.showContent] to `FALSE`.
    
    ## [gid.adw1.navigation_split_view.NavigationSplitView] as [gid.gtk4.buildable.Buildable]
    
    The [gid.adw1.navigation_split_view.NavigationSplitView] implementation of the [gid.gtk4.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [gid.adw1.navigation_split_view.NavigationSplitView] has a single CSS node with the name
    `navigation-split-view`.
    
    When collapsed, it contains a child node with the name `navigation-view`
    containing both children.
    
    ```
    navigation-split-view
    ╰── navigation-view
        ├── [sidebar child]
        ╰── [content child]
    ```
    
    When not collapsed, it contains two nodes with the name `widget`, one with
    the `.sidebar-pane` style class, the other one with `.content-view` style
    class, containing the sidebar and content children respectively.
    
    ```
    navigation-split-view
    ├── widget.sidebar-pane
    │   ╰── [sidebar child]
    ╰── widget.content-pane
        ╰── [content child]
    ```
    
    ## Accessibility
    
    [gid.adw1.navigation_split_view.NavigationSplitView] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwNavigationSplitView;

/** */
struct AdwNavigationSplitViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A page-based navigation container.
    
    <picture>
      <source srcset="navigation-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-view.png" alt="navigation-view">
    </picture>
    
    [gid.adw1.navigation_view.NavigationView] presents one child at a time, similar to
    [gid.gtk4.stack.Stack].
    
    [gid.adw1.navigation_view.NavigationView] can only contain [gid.adw1.navigation_page.NavigationPage] children.
    
    It maintains a navigation stack that can be controlled with
    [gid.adw1.navigation_view.NavigationView.push] and [gid.adw1.navigation_view.NavigationView.pop]. The whole
    navigation stack can also be replaced using [gid.adw1.navigation_view.NavigationView.replace].
    
    [gid.adw1.navigation_view.NavigationView] allows to manage pages statically or dynamically.
    
    Static pages can be added using the [gid.adw1.navigation_view.NavigationView.add] method. The
    [gid.adw1.navigation_view.NavigationView] will keep a reference to these pages, but they aren't
    accessible to the user until [gid.adw1.navigation_view.NavigationView.push] is called (except
    for the first page, which is pushed automatically). Use the
    [gid.adw1.navigation_view.NavigationView.remove] method to remove them. This is useful for
    applications that have a small number of unique pages and just need
    navigation between them.
    
    Dynamic pages are automatically destroyed once they are popped off the
    navigation stack. To add a page like this, push it using the
    [gid.adw1.navigation_view.NavigationView.push] method without calling
    [gid.adw1.navigation_view.NavigationView.add] first.
    
    ## Tags
    
    Static pages, as well as any pages in the navigation stack, can be accessed
    by their [gid.adw1.navigation_page.NavigationPage.tag]. For example,
    [gid.adw1.navigation_view.NavigationView.pushByTag] can be used to push a static page that's
    not in the navigation stack without having to keep a reference to it manually.
    
    ## Header Bar Integration
    
    When used inside [gid.adw1.navigation_view.NavigationView], [gid.adw1.header_bar.HeaderBar] will automatically
    display a back button that can be used to go back to the previous page when
    possible. The button also has a context menu, allowing to pop multiple pages
    at once, potentially across multiple navigation views.
    
    Set [gid.adw1.header_bar.HeaderBar.showBackButton] to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    [gid.adw1.header_bar.HeaderBar] will also display the title of the [gid.adw1.navigation_page.NavigationPage] it's
    placed into, so most applications shouldn't need to customize it at all.
    
    ## Shortcuts and Gestures
    
    [gid.adw1.navigation_view.NavigationView] supports the following shortcuts for going to the
    previous page:
    
    - <kbd>Escape</kbd> (unless [gid.adw1.navigation_view.NavigationView.popOnEscape] is set to
      `FALSE`)
    - <kbd>Alt</kbd>+<kbd>←</kbd>
    - Back mouse button
    
    Additionally, it supports interactive gestures:
    
    - One-finger swipe towards the right on touchscreens
    - Scrolling towards the right on touchpads (usually two-finger swipe)
    
    These gestures have transitions enabled regardless of the
    [gid.adw1.navigation_view.NavigationView.animateTransitions] value.
    
    Applications can also enable shortcuts for pushing another page onto the
    navigation stack via connecting to the [gid.adw1.navigation_view.NavigationView.getNextPage]
    signal, in that case the following shortcuts are supported:
    
    - <kbd>Alt</kbd>+<kbd>→</kbd>
    - Forward mouse button
    - Swipe/scrolling towards the left
    
    For right-to-left locales, the gestures and shortcuts are reversed.
    
    [gid.adw1.navigation_page.NavigationPage.canPop] can be used to disable them, along with the
    header bar back buttons.
    
    ## Actions
    
    [gid.adw1.navigation_view.NavigationView] defines actions for controlling the navigation stack.
    actions for controlling the navigation stack:
    
    - `navigation.push` takes a string parameter specifying the tag of the page to
    push, and is equivalent to calling [gid.adw1.navigation_view.NavigationView.pushByTag].
    
    - `navigation.pop` doesn't take any parameters and pops the current page from
    the navigation stack, equivalent to calling [gid.adw1.navigation_view.NavigationView.pop].
    
    ## [gid.adw1.navigation_view.NavigationView] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.navigation_view.NavigationView] allows to add pages as children, equivalent to using the
    [gid.adw1.navigation_view.NavigationView.add] method.
    
    Example of an [gid.adw1.navigation_view.NavigationView] UI definition:
    
    ```xml
    <object class="AdwNavigationView">
      <child>
        <object class="AdwNavigationPage">
          <property name="title" translatable="yes">Page 1</property>
          <property name="child">
            <object class="AdwToolbarView">
              <child type="top">
                <object class="AdwHeaderBar"/>
              </child>
              <property name="content">
                <object class="GtkButton">
                  <property name="label" translatable="yes">Open Page 2</property>
                  <property name="halign">center</property>
                  <property name="valign">center</property>
                  <property name="action-name">navigation.push</property>
                  <property name="action-target">'page-2'</property>
                  <style>
                    <class name="pill"/>
                   </style>
                </object>
              </property>
            </object>
          </property>
        </object>
      </child>
      <child>
        <object class="AdwNavigationPage">
          <property name="title" translatable="yes">Page 2</property>
          <property name="tag">page-2</property>
          <property name="child">
            <object class="AdwToolbarView">
              <child type="top">
                <object class="AdwHeaderBar"/>
              </child>
              <property name="content">
                <!-- ... -->
              </property>
            </object>
          </property>
        </object>
      </child>
    </object>
    ```
    
    <picture>
      <source srcset="navigation-view-example-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-view-example.png" alt="navigation-view-example">
    </picture>
    
    ## CSS nodes
    
    [gid.adw1.navigation_view.NavigationView] has a single CSS node with the name `navigation-view`.
    
    ## Accessibility
    
    [gid.adw1.navigation_view.NavigationView] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwNavigationView;

/** */
struct AdwNavigationViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An [gid.adw1.animation_target.AnimationTarget] that doesn't do anything.
*/
struct AdwNoneAnimationTarget;

/** */
struct AdwNoneAnimationTargetClass;

/**
    A widget presenting sidebar and content side by side or as an overlay.
    
    <picture>
      <source srcset="overlay-split-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="overlay-split-view.png" alt="overlay-split-view">
    </picture>
    <picture>
      <source srcset="overlay-split-view-collapsed-dark.png" media="(prefers-color-scheme: dark)">
      <img src="overlay-split-view-collapsed.png" alt="overlay-split-view-collapsed">
    </picture>
    
    [gid.adw1.overlay_split_view.OverlaySplitView] has two children: sidebar and content, and displays
    them side by side.
    
    When [gid.adw1.overlay_split_view.OverlaySplitView.collapsed] is set to `TRUE`, the sidebar is
    instead shown as an overlay above the content widget.
    
    The sidebar can be hidden or shown using the
    [gid.adw1.overlay_split_view.OverlaySplitView.showSidebar] property.
    
    Sidebar can be displayed before or after the content, this can be controlled
    with the [gid.adw1.overlay_split_view.OverlaySplitView.sidebarPosition] property.
    
    Collapsing the split view automatically hides the sidebar widget, and
    uncollapsing it shows the sidebar. If this behavior is not desired, the
    [gid.adw1.overlay_split_view.OverlaySplitView.pinSidebar] property can be used to override it.
    
    [gid.adw1.overlay_split_view.OverlaySplitView] supports an edge swipe gesture for showing the sidebar,
    and a swipe from the sidebar for hiding it. Gestures are only supported on
    touchscreen, but not touchpad. Gestures can be controlled with the
    [gid.adw1.overlay_split_view.OverlaySplitView.enableShowGesture] and
    [gid.adw1.overlay_split_view.OverlaySplitView.enableHideGesture] properties.
    
    See also [gid.adw1.navigation_split_view.NavigationSplitView].
    
    [gid.adw1.overlay_split_view.OverlaySplitView] is typically used together with an [gid.adw1.breakpoint.Breakpoint]
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="default-width">800</property>
      <property name="default-height">800</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwOverlaySplitView" id="split_view">
          <property name="sidebar">
            <!-- ... -->
          </property>
          <property name="content">
            <!-- ... -->
          </property>
        </object>
      </property>
    </object>
    ```
    
    [gid.adw1.overlay_split_view.OverlaySplitView] is often used for implementing the
    [utility pane](https://developer.gnome.org/hig/patterns/containers/utility-panes.html)
    pattern.
    
    ## Sizing
    
    When not collapsed, [gid.adw1.overlay_split_view.OverlaySplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthFraction] property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
    [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth] properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    When collapsed, the preferred width fraction is ignored and the sidebar uses
    [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth] when possible.
    
    ## Header Bar Integration
    
    When used inside [gid.adw1.overlay_split_view.OverlaySplitView], [gid.adw1.header_bar.HeaderBar] will automatically
    hide the window buttons in the middle.
    
    ## [gid.adw1.overlay_split_view.OverlaySplitView] as [gid.gtk4.buildable.Buildable]
    
    The [gid.adw1.overlay_split_view.OverlaySplitView] implementation of the [gid.gtk4.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [gid.adw1.overlay_split_view.OverlaySplitView] has a single CSS node with the name
    `overlay-split-view`.
    
    It contains two nodes with the name `widget`, containing the sidebar and
    content children.
    
    When not collapsed, they have the `.sidebar-view` and `.content-view` style
    classes respectively.
    
    ```
    overlay-split-view
    ├── widget.sidebar-pane
    │   ╰── [sidebar child]
    ╰── widget.content-pane
        ╰── [content child]
    ```
    
    When collapsed, the one containing the sidebar child has the `.background`
    style class and the other one has no style classes.
    
    ```
    overlay-split-view
    ├── widget.background
    │   ╰── [sidebar child]
    ╰── widget
        ╰── [content child]
    ```
    
    ## Accessibility
    
    [gid.adw1.overlay_split_view.OverlaySplitView] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwOverlaySplitView;

/** */
struct AdwOverlaySplitViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A [gid.adw1.entry_row.EntryRow] tailored for entering secrets.
    
    <picture>
      <source srcset="password-entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="password-entry-row.png" alt="password-entry-row">
    </picture>
    
    It does not show its contents in clear text, does not allow to copy it to the
    clipboard, and shows a warning when Caps Lock is engaged. If the underlying
    platform allows it, [gid.adw1.password_entry_row.PasswordEntryRow] will also place the text in a
    non-pageable memory area, to avoid it being written out to disk by the
    operating system.
    
    It offer a way to reveal the contents in clear text.
    
    ## CSS Nodes
    
    [gid.adw1.password_entry_row.PasswordEntryRow] has a single CSS node with name `row` that carries
    `.entry` and `.password` style classes.
*/
struct AdwPasswordEntryRow;

/** */
struct AdwPasswordEntryRowClass
{
  /** */
  AdwEntryRowClass parentClass;
}

/**
    A dialog showing application's preferences.
    
    <picture>
      <source srcset="preferences-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-dialog.png" alt="preferences-dialog">
    </picture>
    
    The [gid.adw1.preferences_dialog.PreferencesDialog] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## Actions
    
    `AdwPrefencesDialog` defines the `navigation.pop` action, it doesn't take any
    parameters and pops the current subpage from the navigation stack, equivalent
    to calling [gid.adw1.preferences_dialog.PreferencesDialog.popSubpage].
    
    ## CSS nodes
    
    [gid.adw1.preferences_dialog.PreferencesDialog] has a main CSS node with the name `dialog` and the
    style class `.preferences`.
*/
struct AdwPreferencesDialog
{
  /** */
  AdwDialog parentInstance;
}

/** */
struct AdwPreferencesDialogClass
{
  /**
      The parent class
  */
  AdwDialogClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A group of preference rows.
    
    <picture>
      <source srcset="preferences-group-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-group.png" alt="preferences-group">
    </picture>
    
    An [gid.adw1.preferences_group.PreferencesGroup] represents a group or tightly related preferences,
    which in turn are represented by [gid.adw1.preferences_row.PreferencesRow].
    
    To summarize the role of the preferences it gathers, a group can have both a
    title and a description. The title will be used by [gid.adw1.preferences_dialog.PreferencesDialog]
    to let the user look for a preference.
    
    The [gid.adw1.preferences_group.PreferencesGroup.separateRows] property can be used to
    separate the rows within the group, same as when using the
    [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
    instead of `.boxed-list`.
    
    ## AdwPreferencesGroup as GtkBuildable
    
    The [gid.adw1.preferences_group.PreferencesGroup] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding [gid.adw1.preferences_row.PreferencesRow]s to the list by omitting "type". If "type"
    is omitted and the widget isn't a [gid.adw1.preferences_row.PreferencesRow] the child is added to
    a box below the list.
    
    When the "type" attribute of a child is `header-suffix`, the child
    is set as the suffix on the end of the title and description.
    
    ## CSS nodes
    
    [gid.adw1.preferences_group.PreferencesGroup] has a single CSS node with name `preferencesgroup`.
    
    ## Accessibility
    
    [gid.adw1.preferences_group.PreferencesGroup] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwPreferencesGroup
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwPreferencesGroupClass
{
  /**
      The parent class
  */
  GtkWidgetClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A page from [gid.adw1.preferences_dialog.PreferencesDialog].
    
    <picture>
      <source srcset="preferences-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-page.png" alt="preferences-page">
    </picture>
    
    The [gid.adw1.preferences_page.PreferencesPage] widget gathers preferences groups into a single page
    of a preferences window.
    
    ## CSS nodes
    
    [gid.adw1.preferences_page.PreferencesPage] has a single CSS node with name `preferencespage`.
    
    ## Accessibility
    
    [gid.adw1.preferences_page.PreferencesPage] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwPreferencesPage
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct AdwPreferencesPageClass
{
  /**
      The parent class
  */
  GtkWidgetClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to present preferences.
    
    The [gid.adw1.preferences_row.PreferencesRow] widget has a title that [gid.adw1.preferences_dialog.PreferencesDialog]
    will use to let the user look for a preference. It doesn't present the title
    in any way and lets you present the preference as you please.
    
    [gid.adw1.action_row.ActionRow] and its derivatives are convenient to use as preference
    rows as they take care of presenting the preference's title while letting you
    compose the inputs of the preference around it.
*/
struct AdwPreferencesRow
{
  /** */
  GtkListBoxRow parentInstance;
}

/** */
struct AdwPreferencesRowClass
{
  /**
      The parent class
  */
  GtkListBoxRowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A window to present an application's preferences.
    
    <picture>
      <source srcset="preferences-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-window.png" alt="preferences-window">
    </picture>
    
    The [gid.adw1.preferences_window.PreferencesWindow] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## CSS nodes
    
    [gid.adw1.preferences_window.PreferencesWindow] has a main CSS node with the name `window` and the
    style class `.preferences`.

    Deprecated: Use [gid.adw1.preferences_dialog.PreferencesDialog].
*/
struct AdwPreferencesWindow
{
  /** */
  AdwWindow parentInstance;
}

/** */
struct AdwPreferencesWindowClass
{
  /**
      The parent class
  */
  AdwWindowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    An [gid.adw1.animation_target.AnimationTarget] changing the value of a property of a
    [gid.gobject2.object.ObjectWrap] instance.
*/
struct AdwPropertyAnimationTarget;

/** */
struct AdwPropertyAnimationTargetClass;

/**
    A widget that displays a keyboard shortcut.
    
    <picture>
      <source srcset="shortcut-label-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcut-label.png" alt="shortcut-label">
    </picture>
    
    The shown shortcut can be set using the [gid.adw1.shortcut_label.ShortcutLabel.accelerator]
    property.
    
    Optionally, if no shortcut is set, [gid.adw1.shortcut_label.ShortcutLabel] will display a
    placeholder set with the [gid.adw1.shortcut_label.ShortcutLabel.disabledText] property.
    
    The following types of shortcuts can be displayed:
    
    - A single shortcut in `func@Gtk.accelerator_parse` format, e.g. `<Control>C`:
    
        <picture>
          <source srcset="shortcut-label-single-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-single.png" alt="shortcut-label-single">
        </picture>
    
    - Multiple alternative shortcuts, separated with spaces, e.g. `<Shift>A Home`:
    
        <picture>
          <source srcset="shortcut-label-alternative-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-alternative.png" alt="shortcut-label-alternative">
        </picture>
    
    - A range of shortcuts, separated with `...`, e.g. `<Alt>1...9`:
    
        <picture>
          <source srcset="shortcut-label-range-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-range.png" alt="shortcut-label-range">
        </picture>
    
    - Multiple keys pressed at once, separated with `&`, e.g. `Control_L&Control_R`:
    
        <picture>
          <source srcset="shortcut-label-multiple-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-multiple.png" alt="shortcut-label-multiple">
        </picture>
    
    - Multiple shortcuts or keys, pressed sequentially, separated with `+`, e.g. `<Control>C+<Control>X`:
    
        <picture>
          <source srcset="shortcut-label-sequence-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-sequence.png" alt="shortcut-label-sequence">
        </picture>
    
    ::: note
        `<`, `>` and `&` need to be escaped as `&lt;`, `&gt;` and `&amp;` when used in UI files.
    
    ## CSS nodes
    
    [gid.adw1.shortcut_label.ShortcutLabel] has a single CSS node with name `shortcut-label`. The
    individual keycap labels each have the `.keycap` style class, while the
    labels separating them have the `.dimmed` style class.
    
    ## Accessibility
    
    [gid.adw1.shortcut_label.ShortcutLabel] uses the [gid.gtk4.types.AccessibleRole.Label] role.
    
    See also: [gid.adw1.shortcuts_dialog.ShortcutsDialog].
*/
struct AdwShortcutLabel;

/** */
struct AdwShortcutLabelClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A dialog that displays application's keyboard shortcuts.
    
    <picture>
      <source srcset="shortcuts-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcuts-dialog.png" alt="shortcuts-dialog">
    </picture>
    
    Shortcuts are grouped into sections, represented by [gid.adw1.shortcuts_section.ShortcutsSection]
    objects. Each section has one or more items, represented by
    [gid.adw1.shortcuts_item.ShortcutsItem] objects.
    
    To add a section to the dialog, use [gid.adw1.shortcuts_dialog.ShortcutsDialog.add], or add it
    as a child when using UI files.
    
    Sections without titles can be used to further subdivide each section into
    groups.
    
    Example of an [gid.adw1.shortcuts_dialog.ShortcutsDialog] UI definition:
    
    ```xml
    <object class="AdwShortcutsDialog" id="shortcuts_dialog">
      <child>
        <object class="AdwShortcutsSection">
          <property name="title" translatable="yes">General</property>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Open Menu</property>
              <property name="accelerator">F10</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Quit</property>
              <property name="action-name">app.quit</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwShortcutsSection">
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Left</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Up</property>
              <property name="direction">ltr</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Right</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Down</property>
              <property name="direction">ltr</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Right</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Up</property>
              <property name="direction">rtl</property>
            </object>
          </child>
          <child>
            <object class="AdwShortcutsItem">
              <property name="title" translatable="yes">Move Tab Left</property>
              <property name="accelerator">&lt;Shift&gt;&lt;Ctrl&gt;Page_Down</property>
              <property name="direction">rtl</property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    If the `app.quit` action has the <kbd>Ctrl</kbd><kbd>Q</kbd> accelerator
    associated with it, the result will look as follows:
    
    <picture>
      <source srcset="shortcuts-dialog-example-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcuts-dialog-example.png" alt="shortcuts-dialog-example">
    </picture>
    
    The recommended way to use [gid.adw1.shortcuts_dialog.ShortcutsDialog] is via [gid.adw1.application.Application]'s
    automatic resource loading.
    
    See also: [gid.adw1.shortcut_label.ShortcutLabel].
*/
struct AdwShortcutsDialog;

/** */
struct AdwShortcutsDialogClass
{
  /** */
  AdwDialogClass parentClass;
}

/**
    An object representing an individual shortcut in [gid.adw1.shortcuts_section.ShortcutsSection].
    
    A shortcut has a title, an optional subtitle, and an accelerator.
    
    Accelerator must be specified in the format [gid.adw1.shortcut_label.ShortcutLabel] accepts.
    
    Alternatively, the [gid.adw1.shortcuts_item.ShortcutsItem.actionName] property can be used
    to automatically get accelerator associated with the specified action, as set
    via [gid.gtk4.application.Application.setAccelsForAction].
    
    If both are specified, the accelerator will be used if the action couldn't
    be found or doesn't have an accelerator associated for it.
    
    If [gid.adw1.shortcuts_item.ShortcutsItem.direction] is set, the shortcut will only be
    displayed for the specified text direction. This allows to display different
    shortcuts for different text directions.
*/
struct AdwShortcutsItem;

/** */
struct AdwShortcutsItemClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An object representing a section in [gid.adw1.shortcuts_dialog.ShortcutsDialog].
    
    It contains [gid.adw1.shortcuts_item.ShortcutsItem] objects, use [gid.adw1.shortcuts_section.ShortcutsSection.add] to
    add them.
    
    [gid.adw1.shortcuts_section.ShortcutsSection] implements the [gid.gio2.list_model.ListModel] interface and
    allows to access the added shortcut items through it.
    
    ## [gid.adw1.shortcuts_section.ShortcutsSection] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.shortcuts_section.ShortcutsSection] allows adding [gid.adw1.shortcuts_item.ShortcutsItem] objects as children.
*/
struct AdwShortcutsSection;

/** */
struct AdwShortcutsSectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Adaptive sidebar widget.
    
    <picture>
      <source srcset="sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar.png" alt="sidebar">
    </picture>
    
    [gid.adw1.sidebar.Sidebar] contains [gid.adw1.sidebar_section.SidebarSection] objects, which in turn contain
    [gid.adw1.sidebar_item.SidebarItem] objects.
    
    To add sections, use [gid.adw1.sidebar.Sidebar.append], [gid.adw1.sidebar.Sidebar.prepend] or
    [gid.adw1.sidebar.Sidebar.insert].
    
    To remove sections, use [gid.adw1.sidebar.Sidebar.remove] or
    [gid.adw1.sidebar.Sidebar.removeAll].
    
    To inspect the items, use [gid.adw1.sidebar.Sidebar.getItem] or
    [gid.adw1.sidebar.Sidebar.items].
    
    To inspect sections themselves, use [gid.adw1.sidebar.Sidebar.getSection] or
    [gid.adw1.sidebar.Sidebar.sections].
    
    ## Selection and activation
    
    [gid.adw1.sidebar.Sidebar] has zero or one selected items. The index of the item can be
    accessed and changed via [gid.adw1.sidebar.Sidebar.selected]. Set it to
    [gid.gtk4.types.INVALID_LIST_POSITION] to remove selection.
    
    Selection cannot be permanently disabled.
    
    [gid.adw1.sidebar.Sidebar.selectedItem] can be used to access the selected item.
    
    Connect to the [gid.adw1.sidebar.Sidebar.activated] signal to run code when an item
    has been activated. This can be used to toggle the visible pane when used in
    a split view.
    
    See also: [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
    
    ## Modes
    
    <picture>
      <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar-modes.png" alt="sidebar-modes">
    </picture>
    
    [gid.adw1.sidebar.Sidebar] is adaptive and can act as either a regular sidebar, or a page
    of boxed lists.
    
    Use the [gid.adw1.sidebar.Sidebar.mode] to determine its look and behavior.
    
    A typical use case involves using [gid.adw1.sidebar.Sidebar] inside the sidebar pane of a
    [gid.adw1.navigation_split_view.NavigationSplitView], and switching mode to page whenever it's
    collapsed, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="default-width">800</property>
      <property name="default-height">600</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
          <setter object="sidebar" property="mode">page</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwNavigationSplitView" id="split_view">
          <property name="sidebar">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Sidebar</property>
              <property name="child">
                <object class="AdwToolbarView">
                  <child type="top">
                    <object class="AdwHeaderBar"/>
                  </child>
                  <property name="content">
                    <object class="AdwSidebar" id="sidebar">
                      <!-- Calls adw_navigation_split_view_set_show_content (split_view, TRUE); -->
                      <signal name="activated" handler="sidebar_activated_cb"/>
                      <!-- ... -->
                    </object>
                  </property>
                </object>
              </property>
            </object>
          </property>
          <property name="content">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Content</property>
              <property name="child">
                <!-- ... -->
              </property>
            </object>
          </property>
        </object>
      </property>
    </object>
    ```
    
    When used with [gid.adw1.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
    mode, as the sidebar pane is still a sidebar when collapsed.
    
    ## Search
    
    [gid.adw1.sidebar.Sidebar] supports filtering items via the [gid.adw1.sidebar.Sidebar.filter]
    property.
    
    Use [gid.adw1.sidebar.Sidebar.placeholder] to provide an empty state widget. It will
    be shown when all items have been filtered out, or the sidebar has no items
    otherwise.
    
    ## Context Menu
    
    To create a context menu for the sidebar items, use the
    [gid.adw1.sidebar.Sidebar.menuModel] property to provide a menu model, and the
    [gid.adw1.sidebar.Sidebar.setupMenu] signal to set up actions for the given item.
    
    To set or override the menu for just one section, use
    [gid.adw1.sidebar_section.SidebarSection.menuModel] instead.
    
    ## Drag-and-Drop
    
    [gid.adw1.sidebar.Sidebar] items can have a drop target for arbitrary content.
    
    Use [gid.adw1.sidebar.Sidebar.setupDropTarget] to set it up, specifying the
    supported content types and drag actions, then connect to
    [gid.adw1.sidebar.Sidebar.drop] to handle drops.
    
    In some cases, it may be necessary to determine the used action based on the
    dragged content, or the hovered item.
    
    To determine it based on the sidebar item, connect to the
    [gid.adw1.sidebar.Sidebar.dropEnter] signal and return the action from its handler.
    
    To determine it based on the content, set [gid.adw1.sidebar.Sidebar.dropPreload] to
    `TRUE`, then connect to [gid.adw1.sidebar.Sidebar.dropValueLoaded] signal and return
    the action from its handler.
    
    In both cases the action will be passed as a parameter to the
    [gid.adw1.sidebar.Sidebar.drop] signal.
    
    Regardless of whether a drop target was set up, dragging content over sidebar
    items activates them after a timeout. To disable this behavior for specific
    items, set [gid.adw1.sidebar_item.SidebarItem.dragMotionActivate] to `FALSE` on them.
    
    ## [gid.adw1.sidebar.Sidebar] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.sidebar.Sidebar] allows adding sections as children.
    
    Example of an [gid.adw1.sidebar.Sidebar] UI definition:
    
    ```xml
    <object class="AdwSidebar">
      <child>
        <object class="AdwSidebarSection">
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Recent</property>
              <property name="icon-name">document-open-recent-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Starred</property>
              <property name="icon-name">starred-symbolic</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwSidebarSection">
          <property name="title" translatable="yes">Places</property>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Music</property>
              <property name="icon-name">folder-music-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Pictures</property>
              <property name="icon-name">folder-pictures-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Videos</property>
              <property name="icon-name">folder-videos-symbolic</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwSidebarSection">
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Trash</property>
              <property name="icon-name">user-trash-symbolic</property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.sidebar.Sidebar] has a main CSS node with the name `sidebar`.
    
    Internally, it's using a [gid.gtk4.list_box.ListBox] with the
    [`.navigation-sidebar`](style-classes.html#sidebars) style class in sidebar
    mode, or an [gid.adw1.preferences_page.PreferencesPage] in page mode.
    
    ## Accessibility
    
    [gid.adw1.sidebar.Sidebar] uses the [gid.gtk4.types.AccessibleRole.Generic] role.
*/
struct AdwSidebar;

/** */
struct AdwSidebarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An item within [gid.adw1.sidebar_section.SidebarSection].
    
    Sidebar items must have a title, set via [gid.adw1.sidebar_item.SidebarItem.title].
    
    Sidebar items should, but are not required to, have an icon. Icons can be set
    from an icon name, via [gid.adw1.sidebar_item.SidebarItem.iconName], or a
    [gid.gdk4.paintable.Paintable], via [gid.adw1.sidebar_item.SidebarItem.iconPaintable].
    
    Items can also have subtitles, set with the [gid.adw1.sidebar_item.SidebarItem.subtitle]
    property. Subtitles should be used sparingly.
    
    To add a tooltip, use [gid.adw1.sidebar_item.SidebarItem.tooltip]. Tooltips always use
    Pango markup.
    
    Items can have an arbitrary suffix widget, set with the
    [gid.adw1.sidebar_item.SidebarItem.suffix] properties. It will be displayed at the end of
    its row, or before the arrow in the [gid.adw1.types.SidebarMode.Page] mode.
    
    To hide or disable the item, use the [gid.adw1.sidebar_item.SidebarItem.visible] and
    [gid.adw1.sidebar_item.SidebarItem.enabled] properties respectively.
    
    To access the items's section, use [gid.adw1.sidebar_item.SidebarItem.section].
    
    It's also possible to access the index of the item in both the section and
    the sidebar, using [gid.adw1.sidebar_item.SidebarItem.getSectionIndex] and
    [gid.adw1.sidebar_item.SidebarItem.getIndex] respectively.
    
    Dragging content over sidebar items activates them by default. To disable
    this behavior, set [gid.adw1.sidebar_item.SidebarItem.dragMotionActivate] to `FALSE`.
    
    [gid.adw1.sidebar_item.SidebarItem] is derivable, and applications that need to associate each
    page with data can store it in the items themselves  this way.
*/
struct AdwSidebarItem
{
  /** */
  GObject parentInstance;
}

/** */
struct AdwSidebarItemClass
{
  /**
      The parent class
  */
  GObjectClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A section within [gid.adw1.sidebar.Sidebar].
    
    [gid.adw1.sidebar_section.SidebarSection] contains [gid.adw1.sidebar_item.SidebarItem] objects.
    
    Section can optionally have a title, set with the
    [gid.adw1.sidebar_section.SidebarSection.title] property. If a title is not set, the section
    will have a separator in front of it, or just spacing in the
    [gid.adw1.types.SidebarMode.Page] mode.
    
    To add items, use [gid.adw1.sidebar_section.SidebarSection.append],
    [gid.adw1.sidebar_section.SidebarSection.prepend] or [gid.adw1.sidebar_section.SidebarSection.insert].
    
    To remove items, use [gid.adw1.sidebar_section.SidebarSection.remove] or
    [gid.adw1.sidebar_section.SidebarSection.removeAll].
    
    To inspect the items, use [gid.adw1.sidebar_section.SidebarSection.getItem] or
    [gid.adw1.sidebar_section.SidebarSection.items].
    
    To get the sidebar the section is in, use[gid.adw1.sidebar_section.SidebarSection.sidebar].
    
    ## Binding models
    
    [gid.adw1.sidebar_section.SidebarSection] can show items from a provided [gid.gio2.list_model.ListModel],
    using [gid.adw1.sidebar_section.SidebarSection.bindModel]. It works the same way as
    [gid.gtk4.list_box.ListBox.bindModel], except the provided function creates an
    [gid.adw1.sidebar_item.SidebarItem] rather than a [gid.gtk4.list_box_row.ListBoxRow].
    
    While a model is bound, adding or removing items manually is not allowed.
    Inspecting them is still allowed, but discouraged.
    
    ## [gid.adw1.sidebar_section.SidebarSection] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.sidebar_section.SidebarSection] allows adding items as children.
    
    Example of an [gid.adw1.sidebar_section.SidebarSection] UI definition:
    
    ```xml
    <object class="AdwSidebarSection">
      <property name="title" translatable="yes">Places</property>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Music</property>
          <property name="icon-name">folder-music-symbolic</property>
        </object>
      </child>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Pictures</property>
          <property name="icon-name">folder-pictures-symbolic</property>
        </object>
      </child>
      <child>
        <object class="AdwSidebarItem">
          <property name="title" translatable="yes">Videos</property>
          <property name="icon-name">folder-videos-symbolic</property>
        </object>
      </child>
    </object>
    ```
    
    Result:
    
    <picture>
      <source srcset="sidebar-section-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar-section.png" alt="sidebar-section">
    </picture>
*/
struct AdwSidebarSection;

/** */
struct AdwSidebarSectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An [gid.adw1.action_row.ActionRow] with an embedded spin button.
    
    <picture>
      <source srcset="spin-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spin-row.png" alt="spin-row">
    </picture>
    
    Example of an [gid.adw1.spin_row.SpinRow] UI definition:
    
    ```xml
    <object class="AdwSpinRow">
      <property name="title" translatable="yes">Spin Row</property>
      <property name="adjustment">
        <object class="GtkAdjustment">
          <property name="lower">0</property>
          <property name="upper">100</property>
          <property name="value">50</property>
          <property name="page-increment">10</property>
          <property name="step-increment">1</property>
        </object>
      </property>
    </object>
    ```
    
    See [gid.gtk4.spin_button.SpinButton] for details.
    
    ## CSS nodes
    
    [gid.adw1.spin_row.SpinRow] has the same structure as [gid.adw1.action_row.ActionRow], as well as the
    `.spin` style class on the main node.
    
    ## Accessibility
    
    [gid.adw1.spin_row.SpinRow] uses an internal [gid.gtk4.spin_button.SpinButton] with the
    `enum@Gtk.AccessibleRole.spin-button` role.
*/
struct AdwSpinRow;

/** */
struct AdwSpinRowClass
{
  /** */
  AdwActionRowClass parentClass;
}

/**
    A widget showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    The size of the spinner depends on the available size, never smaller than
    16×16 pixels and never larger than 64×64 pixels.
    
    Use the [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties in combination with [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] for fine sizing control.
    
    For example, the following snippet shows the spinner at 48×48 pixels:
    
    ```xml
    <object class="AdwSpinner">
      <property name="halign">center</property>
      <property name="valign">center</property>
      <property name="width-request">48</property>
      <property name="height-request">48</property>
    </object>
    ```
    
    See [gid.adw1.spinner_paintable.SpinnerPaintable] for cases where using a widget is impractical or
    impossible, such as [gid.adw1.status_page.StatusPage.paintable].
    
    ## CSS nodes
    
    [gid.adw1.spinner.Spinner] has a single node with the name `image` and the style class
    `.spinner`.
    
    ## Accessibility
    
    [gid.adw1.spinner.Spinner] uses the `enum@Gtk.AccessibleRole.progress-bar` role.
*/
struct AdwSpinner;

/** */
struct AdwSpinnerClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A paintable showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    [gid.adw1.spinner_paintable.SpinnerPaintable] size varies depending on the available space, but is
    capped at 64×64 pixels.
    
    To be able to animate, [gid.adw1.spinner_paintable.SpinnerPaintable] needs a widget. It will be
    animated according to that widget's frame clock, and only if that widget is
    mapped. Ideally it should be the same widget the paintable is displayed in,
    but that's not a requirement.
    
    Most applications should be using [gid.adw1.spinner.Spinner] instead.
    [gid.adw1.spinner_paintable.SpinnerPaintable] is provided for the cases where using a widget is
    impractical or impossible, such as [gid.adw1.status_page.StatusPage.paintable]:
    
    ```xml
    <object class="AdwStatusPage" id="status_page">
      <property name="paintable">
        <object class="AdwSpinnerPaintable">
          <property name="widget">status_page</property>
        </object>
      </property>
      <!-- ... -->
    </object>
    ```
*/
struct AdwSpinnerPaintable;

/** */
struct AdwSpinnerPaintableClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A combined button and dropdown widget.
    
    <picture>
      <source srcset="split-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="split-button.png" alt="split-button">
    </picture>
    
    [gid.adw1.split_button.SplitButton] is typically used to present a set of actions in a menu,
    but allow access to one of them with a single click.
    
    The API is very similar to [gid.gtk4.button.Button] and [gid.gtk4.menu_button.MenuButton], see
    their documentation for details.
    
    ## CSS nodes
    
    ```
    splitbutton[.image-button][.text-button]
    ├── button
    │   ╰── <content>
    ├── separator
    ╰── menubutton
        ╰── button.toggle
            ╰── arrow
    ```
    
    [gid.adw1.split_button.SplitButton]'s CSS node is called `splitbutton`. It contains the css
    nodes: `button`, `separator`, `menubutton`. See [gid.gtk4.menu_button.MenuButton]
    documentation for the `menubutton` contents.
    
    The main CSS node will contain the `.image-button` or `.text-button` style
    classes matching the button contents. The nested button nodes will never
    contain them.
    
    ## Style classes
    
    [gid.adw1.split_button.SplitButton] can use some of the same style classes as [gid.gtk4.button.Button]:
    
    - [`.suggested-action`](style-classes.html#suggested-action)
    - [`.destructive-action`](style-classes.html#destructive-action)
    - [`.flat`](style-classes.html#flat)
    - [`.raised`](style-classes.html#raised)
    
    Other style classes, like `.pill`, cannot be used.
    
    ## Accessibility
    
    [gid.adw1.split_button.SplitButton] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwSplitButton;

/** */
struct AdwSplitButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A spring-based [gid.adw1.animation.Animation].
    
    [gid.adw1.spring_animation.SpringAnimation] implements an animation driven by a physical model of a
    spring described by [gid.adw1.spring_params.SpringParams], with a resting position in
    [gid.adw1.spring_animation.SpringAnimation.valueTo], stretched to
    [gid.adw1.spring_animation.SpringAnimation.valueFrom].
    
    Since the animation is physically simulated, spring animations don't have a
    fixed duration. The animation will stop when the simulated spring comes to a
    rest - when the amplitude of the oscillations becomes smaller than
    [gid.adw1.spring_animation.SpringAnimation.epsilon], or immediately when it reaches
    [gid.adw1.spring_animation.SpringAnimation.valueTo] if
    [gid.adw1.spring_animation.SpringAnimation.clamp] is set to `TRUE`. The estimated duration can
    be obtained with [gid.adw1.spring_animation.SpringAnimation.estimatedDuration].
    
    Due to the nature of spring-driven motion the animation can overshoot
    [gid.adw1.spring_animation.SpringAnimation.valueTo] before coming to a rest. Whether the
    animation will overshoot or not depends on the damping ratio of the spring.
    See [gid.adw1.spring_params.SpringParams] for more information about specific damping ratio
    values.
    
    If [gid.adw1.spring_animation.SpringAnimation.clamp] is `TRUE`, the animation will abruptly
    end as soon as it reaches the final value, preventing overshooting.
    
    Animations can have an initial velocity value, set via
    [gid.adw1.spring_animation.SpringAnimation.initialVelocity], which adjusts the curve without
    changing the duration. This makes spring animations useful for deceleration
    at the end of gestures.
    
    If the initial and final values are equal, and the initial velocity is not 0,
    the animation value will bounce and return to its resting position.
*/
struct AdwSpringAnimation;

/** */
struct AdwSpringAnimationClass;

/**
    Physical parameters of a spring for [gid.adw1.spring_animation.SpringAnimation].
    
    Any spring can be described by three parameters: mass, stiffness and damping.
    
    An undamped spring will produce an oscillatory motion which will go on
    forever.
    
    The frequency and amplitude of the oscillations will be determined by the
    stiffness (how "strong" the spring is) and its mass (how much "inertia" it
    has).
    
    If damping is larger than 0, the amplitude of that oscillating motion will
    exponientally decrease over time. If that damping is strong enough that the
    spring can't complete a full oscillation, it's called an overdamped spring.
    
    If we the spring can oscillate, it's called an underdamped spring.
    
    The value between these two behaviors is called critical damping; a
    critically damped spring will comes to rest in the minimum possible time
    without producing oscillations.
    
    The damping can be replaced by damping ratio, which produces the following
    springs:
    
    * 0: an undamped spring.
    * Between 0 and 1: an underdamped spring.
    * 1: a critically damped spring.
    * Larger than 1: an overdamped spring.
    
    As such
*/
struct AdwSpringParams;

/**
    A best fit container.
    
    <picture>
      <source srcset="squeezer-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="squeezer-wide.png" alt="squeezer-wide">
    </picture>
    <picture>
      <source srcset="squeezer-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="squeezer-narrow.png" alt="squeezer-narrow">
    </picture>
    
    The [gid.adw1.squeezer.Squeezer] widget is a container which only shows the first of its
    children that fits in the available size. It is convenient to offer different
    widgets to represent the same data with different levels of detail, making
    the widget seem to squeeze itself to fit in the available space.
    
    Transitions between children can be animated as fades. This can be controlled
    with [gid.adw1.squeezer.Squeezer.transitionType].
    
    ## CSS nodes
    
    [gid.adw1.squeezer.Squeezer] has a single CSS node with name `squeezer`.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
struct AdwSqueezer;

/** */
struct AdwSqueezerClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by [gid.adw1.squeezer.Squeezer].

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
struct AdwSqueezerPage;

/** */
struct AdwSqueezerPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A page used for empty/error states and similar use-cases.
    
    <picture>
      <source srcset="status-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="status-page.png" alt="status-page">
    </picture>
    
    The [gid.adw1.status_page.StatusPage] widget can have an icon, a title, a description and a
    custom widget which is displayed below them.
    
    ## CSS nodes
    
    [gid.adw1.status_page.StatusPage] has a main CSS node with name `statuspage`.
    
    When setting an [gid.adw1.spinner_paintable.SpinnerPaintable] as [gid.adw1.status_page.StatusPage.paintable],
    the main nodes gains the `.spinner` style class for a more compact
    appearance.
    
    ## Style classes
    
    [gid.adw1.status_page.StatusPage] can use the
    [`.compact`](style-classes.html#compact-status-page) style class for when it
    needs to fit into a small space such a sidebar or a popover, similar to when
    using a spinner as the paintable.
    
    <picture>
      <source srcset="status-page-compact-dark.png" media="(prefers-color-scheme: dark)">
      <img src="status-page-compact.png" alt="status-page-compact">
    </picture>
*/
struct AdwStatusPage;

/** */
struct AdwStatusPageClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A class for managing application-wide styling.
    
    [gid.adw1.style_manager.StyleManager] provides a way to query and influence the application
    styles, such as whether to use dark style, the system accent color or high
    contrast appearance.
    
    It allows to set the color scheme via the
    [gid.adw1.style_manager.StyleManager.colorScheme] property, and to query the current
    appearance, as well as whether a system-wide color scheme and accent color
    preferences exists.
*/
struct AdwStyleManager;

/** */
struct AdwStyleManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A swipe tracker used in [gid.adw1.carousel.Carousel], [gid.adw1.navigation_view.NavigationView] and
    [gid.adw1.overlay_split_view.OverlaySplitView].
    
    The [gid.adw1.swipe_tracker.SwipeTracker] object can be used for implementing widgets with swipe
    gestures. It supports touch-based swipes, pointer dragging, and touchpad
    scrolling.
    
    The widgets will probably want to expose the [gid.adw1.swipe_tracker.SwipeTracker.enabled]
    property. If they expect to use horizontal orientation,
    [gid.adw1.swipe_tracker.SwipeTracker.reversed] can be used for supporting RTL text
    direction.
*/
struct AdwSwipeTracker;

/** */
struct AdwSwipeTrackerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An interface for swipeable widgets.
    
    The [gid.adw1.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See [gid.adw1.swipe_tracker.SwipeTracker] for details about implementing it.
*/
struct AdwSwipeable;

/**
    An interface for swipeable widgets.
*/
struct AdwSwipeableInterface
{
  /**
      The parent interface.
  */
  GTypeInterface parent;

  /**
      Gets the swipe distance.
  */
  extern(C) double function(AdwSwipeable* self) getDistance;

  /**
      Gets the snap points.
  */
  extern(C) double* function(AdwSwipeable* self, int* nSnapPoints) getSnapPoints;

  /**
      Gets the current progress.
  */
  extern(C) double function(AdwSwipeable* self) getProgress;

  /**
      Gets the cancel progress.
  */
  extern(C) double function(AdwSwipeable* self) getCancelProgress;

  /**
      Gets the swipeable rectangle.
  */
  extern(C) void function(AdwSwipeable* self, AdwNavigationDirection navigationDirection, gboolean isDrag, GdkRectangle* rect) getSwipeArea;

  /** */
  void*[4] padding;
}

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to represent two states.
    
    <picture>
      <source srcset="switch-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="switch-row.png" alt="switch-row">
    </picture>
    
    The [gid.adw1.switch_row.SwitchRow] widget contains a [gid.gtk4.switch_.Switch] that allows the user
    to select between two states: "on" or "off". When activated, the row will
    invert its active state.
    
    The user can control the switch by activating the row or by dragging on the
    switch handle.
    
    See [gid.gtk4.switch_.Switch] for details.
    
    Example of an [gid.adw1.switch_row.SwitchRow] UI definition:
    ```xml
    <object class="AdwSwitchRow">
      <property name="title" translatable="yes">Switch Row</property>
      <signal name="notify::active" handler="switch_row_notify_active_cb"/>
    </object>
    ```
    
    The [gid.adw1.switch_row.SwitchRow.active] property should be connected to in order to
    monitor changes to the active state.
    
    ## Accessibility
    
    [gid.adw1.switch_row.SwitchRow] uses the [gid.gtk4.types.AccessibleRole.Switch] role.
*/
struct AdwSwitchRow;

/** */
struct AdwSwitchRowClass
{
  /** */
  AdwActionRowClass parentClass;
}

/**
    A tab bar for [gid.adw1.tab_view.TabView].
    
    <picture>
      <source srcset="tab-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-bar.png" alt="tab-bar">
    </picture>
    
    The [gid.adw1.tab_bar.TabBar] widget is a tab bar that can be used with conjunction with
    [gid.adw1.tab_view.TabView]. It is typically used as a top bar within [gid.adw1.toolbar_view.ToolbarView].
    
    [gid.adw1.tab_bar.TabBar] can autohide and can optionally contain action widgets on both
    sides of the tabs.
    
    When there's not enough space to show all the tabs, [gid.adw1.tab_bar.TabBar] will scroll
    them. Pinned tabs always stay visible and aren't a part of the scrollable
    area.
    
    ## Drag-and-Drop
    
    [gid.adw1.tab_bar.TabBar] tabs can have an additional drop target for arbitrary content.
    
    Use [gid.adw1.tab_bar.TabBar.setupExtraDropTarget] to set it up, specifying the
    supported content types and drag actions, then connect to
    [gid.adw1.tab_bar.TabBar.extraDragDrop] to handle a drop.
    
    In some cases, it may be necessary to determine the used action based on the
    content. In that case, set [gid.adw1.tab_bar.TabBar.extraDragPreload] to `TRUE`
    and connect to [gid.adw1.tab_bar.TabBar.extraDragValue] signal, then return the
    action from its handler. To access this action from the
    [gid.adw1.tab_bar.TabBar.extraDragDrop] handler, use the
    [gid.adw1.tab_bar.TabBar.extraDragPreferredAction] property.
    
    [gid.adw1.tab_bar.TabBar.extraDragValue] is also always emitted when starting to
    hover an item, with a `NULL` value. This happens even when
    [gid.adw1.tab_bar.TabBar.extraDragPreload] is `FALSE`.
    
    ## CSS nodes
    
    [gid.adw1.tab_bar.TabBar] has a single CSS node with name `tabbar`.
    
    ## Style classes
    
    By default [gid.adw1.tab_bar.TabBar] look like a part of an [gid.adw1.header_bar.HeaderBar] and is intended
    to be used directly attached to one or used as a [gid.adw1.toolbar_view.ToolbarView] toolbar.
    The [`.inline`](style-classes.html#inline) style class removes its background,
    so that it can be used in different contexts instead.
    
    <picture>
      <source srcset="tab-bar-inline-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-bar-inline.png" alt="tab-bar-inline">
    </picture>
*/
struct AdwTabBar;

/** */
struct AdwTabBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A button that displays the number of [gid.adw1.tab_view.TabView] pages.
    
    <picture>
      <source srcset="tab-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-button.png" alt="tab-button">
    </picture>
    
    [gid.adw1.tab_button.TabButton] is a button that displays the number of pages in a given
    [gid.adw1.tab_view.TabView], as well as whether one of the inactive pages needs attention.
    
    It's intended to be used as a visible indicator when there's no visible tab
    bar, typically opening an [gid.adw1.tab_overview.TabOverview] on click, e.g. via the
    `overview.open` action name:
    
    ```xml
    <object class="AdwTabButton">
      <property name="view">view</property>
      <property name="action-name">overview.open</property>
    </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.tab_button.TabButton] has a main CSS node with name `tabbutton`.
    
    # Accessibility
    
    [gid.adw1.tab_button.TabButton] uses the [gid.gtk4.types.AccessibleRole.Button] role.
*/
struct AdwTabButton;

/** */
struct AdwTabButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A tab overview for [gid.adw1.tab_view.TabView].
    
    <picture>
      <source srcset="tab-overview-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-overview.png" alt="tab-overview">
    </picture>
    
    [gid.adw1.tab_overview.TabOverview] is a widget that can display tabs from an [gid.adw1.tab_view.TabView] in a
    grid.
    
    [gid.adw1.tab_overview.TabOverview] shows a thumbnail for each tab. By default thumbnails are
    static for all pages except the selected one. They can be made always live
    by setting [gid.adw1.tab_page.TabPage.liveThumbnail] to `TRUE`, or refreshed with
    [gid.adw1.tab_page.TabPage.invalidateThumbnail] or
    [gid.adw1.tab_view.TabView.invalidateThumbnails] otherwise.
    
    If the pages are too tall or too wide, the thumbnails will be cropped; use
    [gid.adw1.tab_page.TabPage.thumbnailXalign] and [gid.adw1.tab_page.TabPage.thumbnailYalign] to
    control which part of the page should be visible in this case.
    
    Pinned tabs are shown as smaller cards without thumbnails above the other
    tabs. Unlike in [gid.adw1.tab_bar.TabBar], they still have titles, as well as an unpin
    button.
    
    [gid.adw1.tab_overview.TabOverview] provides search in open tabs. It searches in tab titles and
    tooltips, as well as [gid.adw1.tab_page.TabPage.keyword].
    
    If [gid.adw1.tab_overview.TabOverview.enableNewTab] is set to `TRUE`, a new tab button
    will be shown. Connect to the [gid.adw1.tab_overview.TabOverview.createTab] signal to use
    it.
    
    [gid.adw1.tab_overview.TabOverview.secondaryMenu] can be used to provide a secondary menu
    for the overview. Use it to add extra actions, e.g. to open a new window or
    undo closed tab.
    
    [gid.adw1.tab_overview.TabOverview] is intended to be used as the direct child of the window,
    with the rest of the window contents set as the [gid.adw1.tab_overview.TabOverview.child].
    The child is expected to contain an [gid.adw1.tab_view.TabView].
    
    [gid.adw1.tab_overview.TabOverview] shows window buttons by default. They can be disabled by
    setting [gid.adw1.tab_overview.TabOverview.showStartTitleButtons] and/or
    [gid.adw1.tab_overview.TabOverview.showStartTitleButtons] and/or
    [gid.adw1.tab_overview.TabOverview.showEndTitleButtons] to `FALSE`.
    
    If search and window buttons are disabled, and secondary menu is not set, the
    header bar will be hidden.
    
    ## Drag-and-Drop
    
    [gid.adw1.tab_overview.TabOverview] thumbnails can have an additional drop target for arbitrary
    content.
    
    Use [gid.adw1.tab_overview.TabOverview.setupExtraDropTarget] to set it up, specifying the
    supported content types and drag actions, then connect to
    [gid.adw1.tab_overview.TabOverview.extraDragDrop] to handle a drop.
    
    In some cases, it may be necessary to determine the used action based on the
    content. In that case, set [gid.adw1.tab_overview.TabOverview.extraDragPreload] to
    `TRUE` and connect to [gid.adw1.tab_overview.TabOverview.extraDragValue] signal, then
    return the action from its handler. To access this action from the
    [gid.adw1.tab_overview.TabOverview.extraDragDrop] handler, use the
    [gid.adw1.tab_overview.TabOverview.extraDragPreferredAction] property.
    
    [gid.adw1.tab_overview.TabOverview.extraDragValue] is also always emitted when starting to
    hover an item, with a `NULL` value. This happens even when
    [gid.adw1.tab_overview.TabOverview.extraDragPreload] is `FALSE`.
    
    ## Actions
    
    [gid.adw1.tab_overview.TabOverview] defines the `overview.open` and `overview.close` actions for
    opening and closing itself. They can be convenient when used together with
    [gid.adw1.tab_button.TabButton].
    
    ## CSS nodes
    
    [gid.adw1.tab_overview.TabOverview] has a single CSS node with name `taboverview`.
*/
struct AdwTabOverview;

/** */
struct AdwTabOverviewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by [gid.adw1.tab_view.TabView].
*/
struct AdwTabPage;

/** */
struct AdwTabPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A dynamic tabbed container.
    
    [gid.adw1.tab_view.TabView] is a container which shows one child at a time. While it
    provides keyboard shortcuts for switching between pages, it does not provide
    a visible tab switcher and relies on external widgets for that, such as
    [gid.adw1.tab_bar.TabBar], [gid.adw1.tab_overview.TabOverview] and [gid.adw1.tab_button.TabButton].
    
    [gid.adw1.tab_view.TabView] maintains a [gid.adw1.tab_page.TabPage] object for each page, which holds
    additional per-page properties. You can obtain the [gid.adw1.tab_page.TabPage] for a page
    with [gid.adw1.tab_view.TabView.getPage], and as the return value for
    [gid.adw1.tab_view.TabView.append] and other functions for adding children.
    
    [gid.adw1.tab_view.TabView] only aims to be useful for dynamic tabs in multi-window
    document-based applications, such as web browsers, file managers, text
    editors or terminals. It does not aim to replace [gid.gtk4.notebook.Notebook] for use
    cases such as tabbed dialogs.
    
    As such, it does not support disabling page reordering or detaching.
    
    [gid.adw1.tab_view.TabView] adds a number of global page switching and reordering shortcuts.
    The [gid.adw1.tab_view.TabView.shortcuts] property can be used to manage them.
    
    See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All of
    the shortcuts are enabled by default.
    
    [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts] can be
    used to manage shortcuts in a convenient way, for example:
    
    ```c
    adw_tab_view_remove_shortcuts (view, ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME |
                                         ADW_TAB_VIEW_SHORTCUT_CONTROL_END);
    ```
    
    ## CSS nodes
    
    [gid.adw1.tab_view.TabView] has a main CSS node with the name `tabview`.
    
    ## Accessibility
    
    [gid.adw1.tab_view.TabView] uses the `enum@Gtk.AccessibleRole.tab-panel` role for the tab
    pages which are the accessible parent objects of the child widgets.
*/
struct AdwTabView;

/** */
struct AdwTabViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A time-based [gid.adw1.animation.Animation].
    
    [gid.adw1.timed_animation.TimedAnimation] implements a simple animation interpolating the given
    value from [gid.adw1.timed_animation.TimedAnimation.valueFrom] to
    [gid.adw1.timed_animation.TimedAnimation.valueTo] over
    [gid.adw1.timed_animation.TimedAnimation.duration] milliseconds using the curve described by
    [gid.adw1.timed_animation.TimedAnimation.easing].
    
    If [gid.adw1.timed_animation.TimedAnimation.reverse] is set to `TRUE`, [gid.adw1.timed_animation.TimedAnimation]
    will instead animate from [gid.adw1.timed_animation.TimedAnimation.valueTo] to
    [gid.adw1.timed_animation.TimedAnimation.valueFrom], and the easing curve will be inverted.
    
    The animation can repeat a certain amount of times, or endlessly, depending
    on the [gid.adw1.timed_animation.TimedAnimation.repeatCount] value. If
    [gid.adw1.timed_animation.TimedAnimation.alternate] is set to `TRUE`, it will also change the
    direction every other iteration.
*/
struct AdwTimedAnimation;

/** */
struct AdwTimedAnimationClass;

/**
    A helper object for [gid.adw1.toast_overlay.ToastOverlay].
    
    Toasts are meant to be passed into [gid.adw1.toast_overlay.ToastOverlay.addToast] as
    follows:
    
    ```c
    adw_toast_overlay_add_toast (overlay, adw_toast_new (_("Simple Toast")));
    ```
    
    <picture>
      <source srcset="toast-simple-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-simple.png" alt="toast-simple">
    </picture>
    
    Toasts always have a close button. They emit the [gid.adw1.toast.Toast.dismissed]
    signal when disappearing.
    
    [gid.adw1.toast.Toast.timeout] determines how long the toast stays on screen, while
    [gid.adw1.toast.Toast.priority] determines how it behaves if another toast is
    already being displayed.
    
    Toast titles use Pango markup by default, set [gid.adw1.toast.Toast.useMarkup] to
    `FALSE` if this is unwanted.
    
    [gid.adw1.toast.Toast.customTitle] can be used to replace the title label with a
    custom widget.
    
    ## Actions
    
    Toasts can have one button on them, with a label and an attached
    [gid.gio2.action.Action].
    
    ```c
    AdwToast *toast = adw_toast_new (_("Toast with Action"));
    
    adw_toast_set_button_label (toast, _("_Example"));
    adw_toast_set_action_name (toast, "win.example");
    
    adw_toast_overlay_add_toast (overlay, toast);
    ```
    
    <picture>
      <source srcset="toast-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-action.png" alt="toast-action">
    </picture>
    
    ## Modifying toasts
    
    Toasts can be modified after they have been shown. For this, an [gid.adw1.toast.Toast]
    reference must be kept around while the toast is visible.
    
    A common use case for this is using toasts as undo prompts that stack with
    each other, allowing to batch undo the last deleted items:
    
    ```c
    
    static void
    toast_undo_cb (GtkWidget  *sender,
                   const char *action,
                   GVariant   *param)
    {
      // Undo the deletion
    }
    
    static void
    dismissed_cb (MyWindow *self)
    {
      self->undo_toast = NULL;
    
      // Permanently delete the items
    }
    
    static void
    delete_item (MyWindow *self,
                 MyItem   *item)
    {
      g_autofree char *title = NULL;
      int n_items;
    
      // Mark the item as waiting for deletion
      n_items = ... // The number of waiting items
    
      if (!self->undo_toast) {
        self->undo_toast = adw_toast_new_format (_("‘%s’ deleted"), ...);
    
        adw_toast_set_priority (self->undo_toast, ADW_TOAST_PRIORITY_HIGH);
        adw_toast_set_button_label (self->undo_toast, _("_Undo"));
        adw_toast_set_action_name (self->undo_toast, "toast.undo");
    
        g_signal_connect_swapped (self->undo_toast, "dismissed",
                                  G_CALLBACK (dismissed_cb), self);
    
        adw_toast_overlay_add_toast (self->toast_overlay, self->undo_toast);
    
        return;
      }
    
      title =
        g_strdup_printf (ngettext ("<span font_features='tnum=1'>%d</span> item deleted",
                                   "<span font_features='tnum=1'>%d</span> items deleted",
                                   n_items), n_items);
    
      adw_toast_set_title (self->undo_toast, title);
    
      // Bump the toast timeout
      adw_toast_overlay_add_toast (self->toast_overlay, g_object_ref (self->undo_toast));
    }
    
    static void
    my_window_class_init (MyWindowClass *klass)
    {
      GtkWidgetClass *widget_class = GTK_WIDGET_CLASS (klass);
    
      gtk_widget_class_install_action (widget_class, "toast.undo", NULL, toast_undo_cb);
    }
    ```
    
    <picture>
      <source srcset="toast-undo-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-undo.png" alt="toast-undo">
    </picture>
*/
struct AdwToast;

/** */
struct AdwToastClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A widget showing toasts above its content.
    
    <picture>
      <source srcset="toast-overlay-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-overlay.png" alt="toast-overlay">
    </picture>
    
    Much like [gid.gtk4.overlay.Overlay], [gid.adw1.toast_overlay.ToastOverlay] is a container with a single
    main child, on top of which it can display a [gid.adw1.toast.Toast], overlaid.
    Toasts can be shown with [gid.adw1.toast_overlay.ToastOverlay.addToast].
    
    Use [gid.adw1.toast_overlay.ToastOverlay.dismissAll] to dismiss all toasts at once, or
    [gid.adw1.toast.Toast.dismiss] to dismiss a single toast.
    
    See [gid.adw1.toast.Toast] for details.
    
    ## CSS nodes
    
    ```
    toastoverlay
    ├── [child]
    ├── toast
    ┊   ├── widget
    ┊   │   ├── [label.heading]
        │   ╰── [custom title]
        ├── [button]
        ╰── button.circular.flat
    ```
    
    [gid.adw1.toast_overlay.ToastOverlay]'s CSS node is called `toastoverlay`. It contains the child,
    as well as zero or more `toast` subnodes.
    
    Each of the `toast` nodes contains a `widget` subnode, optionally a `button`
    subnode, and another `button` subnode with `.circular` and `.flat` style
    classes.
    
    The `widget` subnode contains a `label` subnode with the `.heading` style
    class, or a custom widget provided by the application.
    
    ## Accessibility
    
    [gid.adw1.toast_overlay.ToastOverlay] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwToastOverlay;

/** */
struct AdwToastOverlayClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A toggle within [gid.adw1.toggle_group.ToggleGroup].
    
    [gid.adw1.toggle.Toggle] can optionally have a name, set with [gid.adw1.toggle.Toggle.name].
    If the name is set, [gid.adw1.toggle_group.ToggleGroup.activeName] can be used to access
    toggles instead of index.
*/
struct AdwToggle;

/** */
struct AdwToggleClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A group of exclusive toggles.
    
    <picture>
      <source srcset="toggle-group-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group.png" alt="toggle-group">
    </picture>
    
    [gid.adw1.toggle_group.ToggleGroup] presents a set of exclusive toggles, represented as
    [gid.adw1.toggle.Toggle] objects. Each toggle can display an icon, a label, an icon
    and a label, or a custom child.
    
    Toggles are indexed by their position, with the first toggle being equivalent
    to 0, and so on. Use the [gid.adw1.toggle_group.ToggleGroup.active] to get that position.
    
    Toggles can also have optional names, set via the [gid.adw1.toggle.Toggle.name]
    property. The name of the active toggle can be accessed via the
    [gid.adw1.toggle_group.ToggleGroup.activeName] property.
    
    [gid.adw1.toggle.Toggle] objects can be retrieved via their index or name, using
    [gid.adw1.toggle_group.ToggleGroup.getToggle] or [gid.adw1.toggle_group.ToggleGroup.getToggleByName]
    respectively. [gid.adw1.toggle_group.ToggleGroup] also provides a [gid.gtk4.selection_model.SelectionModel] of
    its toggles via the [gid.adw1.toggle_group.ToggleGroup.toggles] property.
    
    [gid.adw1.toggle_group.ToggleGroup] is orientable, and the toggles can be displayed horizontally
    or vertically. This is mostly useful for icon-only toggles.
    
    Use the [gid.adw1.toggle_group.ToggleGroup.homogeneous] property to make the toggles take
    the same size, and the [gid.adw1.toggle_group.ToggleGroup.canShrink] to control whether
    the toggles can ellipsize.
    
    Example of an [gid.adw1.toggle_group.ToggleGroup] UI definition:
    
    ```xml
     <object class="AdwToggleGroup">
       <property name="active-name">picture</property>
       <child>
         <object class="AdwToggle">
           <property name="icon-name">camera-photo-symbolic</property>
           <property name="tooltip" translatable="yes">Picture Mode</property>
           <property name="name">picture</property>
         </object>
       </child>
       <child>
         <object class="AdwToggle">
           <property name="icon-name">camera-video-symbolic</property>
           <property name="tooltip" translatable="yes">Recording Mode</property>
           <property name="name">recording</property>
         </object>
       </child>
     </object>
    ```
    
    See also: [gid.adw1.inline_view_switcher.InlineViewSwitcher].
    
    ## CSS nodes
    
    [gid.adw1.toggle_group.ToggleGroup] has a main CSS node with the name `toggle-group`.
    
    Its toggles have CSS nodes with the name `toggle`, and its separators have nodes
    with the name `separator`.
    
    Toggle nodes will have a different style classes depending on their content:
    `.text-button` for labels, `.image-button` for icons, `.image-text-button`
    for both or no style class for custom children.
    
    The hidden separators use the `.hidden` style class.
    
    ## Style classes
    
    [gid.adw1.toggle_group.ToggleGroup] can use the [`.flat`](style-classes.html#flat_1) style class
    to remove its background and make it look like a group of buttons.
    
    <picture>
      <source srcset="toggle-group-flat-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-flat.png" alt="toggle-group-flat">
    </picture>
    
    It can also use the [`.round`](style-classes.html#round) style class to make
    its toggles and the group itself rounded.
    
    <picture>
      <source srcset="toggle-group-round-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-round.png" alt="toggle-group-round">
    </picture>
    
    They can also be combined with each other.
    
    <picture>
      <source srcset="toggle-group-flat-round-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-group-flat-round.png" alt="toggle-group-flat-round">
    </picture>
    
    ## Accessibility
    
    [gid.adw1.toggle_group.ToggleGroup] uses the `enum@Gtk.AccessibleRole.radio-group` role. Its
    toggles use the [gid.gtk4.types.AccessibleRole.Radio] role.
*/
struct AdwToggleGroup;

/** */
struct AdwToggleGroupClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A widget containing a page, as well as top and/or bottom bars.
    
    <picture>
      <source srcset="toolbar-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view.png" alt="toolbar-view">
    </picture>
    
    [gid.adw1.toolbar_view.ToolbarView] has a single content widget and one or multiple top and
    bottom bars, shown at the top and bottom sides respectively.
    
    Example of an [gid.adw1.toolbar_view.ToolbarView] UI definition:
    ```xml
    <object class="AdwToolbarView">
      <child type="top">
        <object class="AdwHeaderBar"/>
      </child>
      <property name="content">
        <object class="AdwPreferencesPage">
          <!-- ... -->
        </object>
      </property>
    </object>
    ```
    
    The following kinds of top and bottom bars are supported:
    
    - [gid.adw1.header_bar.HeaderBar]
    - [gid.adw1.tab_bar.TabBar]
    - [gid.adw1.view_switcher_bar.ViewSwitcherBar]
    - [gid.gtk4.action_bar.ActionBar]
    - [gid.gtk4.header_bar.HeaderBar]
    - [gid.gtk4.popover_menu_bar.PopoverMenuBar]
    - [gid.gtk4.search_bar.SearchBar]
    - Any [gid.gtk4.box.Box] or a similar widget with the
      [`.toolbar`](style-classes.html#toolbars) style class
    
    By default, top and bottom bars are flat and scrolling content has a subtle
    undershoot shadow, same as when using the
    [`.undershoot-top`](style-classes.html#undershoot-indicators) and
    [`.undershoot-bottom`](style-classes.html#undershoot-indicators) style
    classes. This works well in most cases, e.g. with [gid.adw1.status_page.StatusPage] or
    [gid.adw1.preferences_page.PreferencesPage], where the background at the top and bottom parts of
    the page is uniform. Additionally, windows with sidebars should always use
    this style.
    
    [gid.adw1.toolbar_view.ToolbarView.topBarStyle] and
    [gid.adw1.toolbar_view.ToolbarView.bottomBarStyle] properties can be used add an opaque
    background and a persistent shadow to top and bottom bars, this can be useful
    for content such as [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
    where some elements are adjacent to the top/bottom bars, or [gid.adw1.tab_view.TabView],
    where each page can have a different background.
    
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-1-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-1.png" alt="toolbar-view-flat-1">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-2-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-2.png" alt="toolbar-view-flat-2">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised.png" alt="toolbar-view-raised">
    </picture>
    
    [gid.adw1.toolbar_view.ToolbarView] ensures the top and bottom bars have consistent backdrop
    styles and vertical spacing. For comparison:
    
    <picture style="min-width: 40%; display: inline-block;">
      <source srcset="toolbar-view-spacing-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-spacing.png" alt="toolbar-view-spacing">
    </picture>
    <picture style="min-width: 40%; display: inline-block;">
      <source srcset="toolbar-view-spacing-box-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-spacing-box.png" alt="toolbar-view-spacing-box">
    </picture>
    
    Any top and bottom bars can also be dragged to move the window, equivalent
    to putting them into a [gid.gtk4.window_handle.WindowHandle].
    
    Content is typically place between top and bottom bars, but can also extend
    behind them. This is controlled with the
    [gid.adw1.toolbar_view.ToolbarView.extendContentToTopEdge] and
    [gid.adw1.toolbar_view.ToolbarView.extendContentToBottomEdge] properties.
    
    Top and bottom bars can be hidden and revealed with an animation using the
    [gid.adw1.toolbar_view.ToolbarView.revealTopBars] and
    [gid.adw1.toolbar_view.ToolbarView.revealBottomBars] properties.
    
    ## [gid.adw1.toolbar_view.ToolbarView] as [gid.gtk4.buildable.Buildable]
    
    The [gid.adw1.toolbar_view.ToolbarView] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding a top bar by specifying “top” as the “type” attribute of a
    `<child>` element, or adding a bottom bar by specifying “bottom”.
    
    ## Accessibility
    
    [gid.adw1.toolbar_view.ToolbarView] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwToolbarView;

/** */
struct AdwToolbarViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A view container for [gid.adw1.view_switcher.ViewSwitcher].
    
    [gid.adw1.view_stack.ViewStack] is a container which only shows one page at a time.
    It is typically used to hold an application's main views.
    
    It doesn't provide a way to transition between pages.
    Instead, a separate widget such as [gid.adw1.view_switcher.ViewSwitcher],
    [gid.adw1.inline_view_switcher.InlineViewSwitcher] or [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] can be used with
    [gid.adw1.view_stack.ViewStack] to provide this functionality.
    
    [gid.adw1.view_stack.ViewStack] pages can have a title, an icon, an attention request, and a
    numbered badge that [gid.adw1.view_switcher.ViewSwitcher] will use to let users identify which
    page is which. Set them using the [gid.adw1.view_stack_page.ViewStackPage.title],
    [gid.adw1.view_stack_page.ViewStackPage.iconName],
    [gid.adw1.view_stack_page.ViewStackPage.needsAttention], and
    [gid.adw1.view_stack_page.ViewStackPage.badgeNumber] properties.
    
    [gid.adw1.view_stack.ViewStack] pages can also be grouped into sections, using the
    [gid.adw1.view_stack_page.ViewStackPage.startsSection] and
    [gid.adw1.view_stack_page.ViewStackPage.sectionTitle] properties. Currently, only
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] displays groups.
    
    Unlike [gid.gtk4.stack.Stack], transitions between views can only be animated via
    a crossfade and size changes are always interpolated. Animations are disabled
    by default. Use [gid.adw1.view_stack.ViewStack.enableTransitions] to enable them.
    
    [gid.adw1.view_stack.ViewStack] maintains a [gid.adw1.view_stack_page.ViewStackPage] object for each added child,
    which holds additional per-child properties. You obtain the
    [gid.adw1.view_stack_page.ViewStackPage] for a child with [gid.adw1.view_stack.ViewStack.getPage] and you
    can obtain a [gid.gtk4.selection_model.SelectionModel] containing all the pages with
    [gid.adw1.view_stack.ViewStack.getPages].
    
    ## AdwViewStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create
    [gid.adw1.view_stack_page.ViewStackPage] objects explicitly, and set the child widget as a
    property on it:
    
    ```xml
      <object class="AdwViewStack" id="stack">
        <child>
          <object class="AdwViewStackPage">
            <property name="name">overview</property>
            <property name="title">Overview</property>
            <property name="child">
              <object class="AdwStatusPage">
                <property name="title">Welcome!</property>
              </object>
            </property>
          </object>
        </child>
      </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.view_stack.ViewStack] has a single CSS node named `stack`.
    
    ## Accessibility
    
    [gid.adw1.view_stack.ViewStack] uses the `enum@Gtk.AccessibleRole.tab-panel` for the stack
    pages which are the accessible parent objects of the child widgets.
*/
struct AdwViewStack;

/** */
struct AdwViewStackClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by [gid.adw1.view_stack.ViewStack].
*/
struct AdwViewStackPage;

/** */
struct AdwViewStackPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An auxiliary class used by [gid.adw1.view_stack.ViewStack].
    
    See [gid.adw1.view_stack.ViewStack.pages].
*/
struct AdwViewStackPages;

/** */
struct AdwViewStackPagesClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An adaptive view switcher.
    
    <picture>
      <source srcset="view-switcher-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher.png" alt="view-switcher">
    </picture>
    
    An adaptive view switcher designed to switch between multiple views
    contained in a [gid.adw1.view_stack.ViewStack] in a similar fashion to
    [gid.gtk4.stack_switcher.StackSwitcher].
    
    [gid.adw1.view_switcher.ViewSwitcher] buttons always have an icon and a label. They can be
    displayed side by side, or icon on top of the label. This can be controlled
    via the [gid.adw1.view_switcher.ViewSwitcher.policy] property.
    
    [gid.adw1.view_switcher.ViewSwitcher] is intended to be used in a header bar together with
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] at the bottom of the window, and a [gid.adw1.breakpoint.Breakpoint]
    showing the view switcher bar on narrow sizes, while removing the view
    switcher from the header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 550sp</condition>
          <setter object="switcher_bar" property="reveal">True</setter>
          <setter object="header_bar" property="title-widget"/>
        </object>
      </child>
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar" id="header_bar">
              <property name="title-widget">
                <object class="AdwViewSwitcher">
                  <property name="stack">stack</property>
                  <property name="policy">wide</property>
                </object>
              </property>
            </object>
          </child>
          <property name="content">
            <object class="AdwViewStack" id="stack"/>
          </property>
          <child type="bottom">
            <object class="AdwViewSwitcherBar" id="switcher_bar">
              <property name="stack">stack</property>
            </object>
          </child>
        </object>
      </property>
    </object>
    ```
    
    It's recommended to set [gid.adw1.view_switcher.ViewSwitcher.policy] to
    [gid.adw1.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [gid.adw1.view_switcher.ViewSwitcher] has a single CSS node with name `viewswitcher`. It can have
    the style classes `.wide` and `.narrow`, matching its policy.
    
    ## Accessibility
    
    [gid.adw1.view_switcher.ViewSwitcher] uses the `enum@Gtk.AccessibleRole.tab-list` role and the
    [gid.gtk4.types.AccessibleRole.Tab] role for its buttons.
    
    See also: [gid.adw1.view_switcher_bar.ViewSwitcherBar], [gid.adw1.inline_view_switcher.InlineViewSwitcher],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
struct AdwViewSwitcher;

/**
    A view switcher action bar.
    
    <picture>
      <source srcset="view-switcher-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-bar.png" alt="view-switcher-bar">
    </picture>
    
    An action bar letting you switch between multiple views contained in a
    [gid.adw1.view_stack.ViewStack], via an [gid.adw1.view_switcher.ViewSwitcher]. It is designed to be put at
    the bottom of a window and to be revealed only on really narrow windows, e.g.
    on mobile phones. It can't be revealed if there are less than two pages.
    
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] is intended to be used together with
    [gid.adw1.view_switcher.ViewSwitcher] in a header bar, and a [gid.adw1.breakpoint.Breakpoint] showing the view
    switcher bar on narrow sizes, while removing the view switcher from the
    header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 550sp</condition>
          <setter object="switcher_bar" property="reveal">True</setter>
          <setter object="header_bar" property="title-widget"/>
        </object>
      </child>
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar" id="header_bar">
              <property name="title-widget">
                <object class="AdwViewSwitcher">
                  <property name="stack">stack</property>
                  <property name="policy">wide</property>
                </object>
              </property>
            </object>
          </child>
          <property name="content">
            <object class="AdwViewStack" id="stack"/>
          </property>
          <child type="bottom">
            <object class="AdwViewSwitcherBar" id="switcher_bar">
              <property name="stack">stack</property>
            </object>
          </child>
        </object>
      </property>
    </object>
    ```
    
    It's recommended to set [gid.adw1.view_switcher.ViewSwitcher.policy] to
    [gid.adw1.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] has a single CSS node with name` viewswitcherbar`.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.inline_view_switcher.InlineViewSwitcher],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
struct AdwViewSwitcherBar;

/** */
struct AdwViewSwitcherBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct AdwViewSwitcherClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An adaptive sidebar that controls an [gid.adw1.view_stack.ViewStack].
    
    <picture>
      <source srcset="view-switcher-sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar.png" alt="view-switcher-sidebar">
    </picture>
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] is a view switcher implemented using a
    [gid.adw1.sidebar.Sidebar], in a similar fashion to [gid.gtk4.stack_sidebar.StackSidebar].
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] items have an icon, a label, as well as an unread
    dot or a badge.
    
    Unlike other switchers, [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] supports grouping pages into
    sections, using the [gid.adw1.view_stack_page.ViewStackPage.startsSection] and
    [gid.adw1.view_stack_page.ViewStackPage.sectionTitle] properties.
    
    Like [gid.adw1.sidebar.Sidebar], [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] is adaptive and can behave as
    a sidebar or a page, via the [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.mode] property.
    
    <picture>
      <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
    </picture>
    
    Connect to the [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.activated] signal to run code when
    an item has been activated. This can be used to toggle the visible pane when
    used in a split view.
    
    Like [gid.adw1.sidebar.Sidebar], [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] supports filtering items via the
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter] property.
    
    Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state
    widget. It will be shown when all items have been filtered out, or the
    sidebar has no items otherwise.
    
    ## CSS nodes
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] has a single CSS node with name
    `view-switcher-sidebar`.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.view_switcher_bar.ViewSwitcherBar],
    [gid.adw1.inline_view_switcher.InlineViewSwitcher].
*/
struct AdwViewSwitcherSidebar;

/** */
struct AdwViewSwitcherSidebarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A view switcher title.
    
    <picture>
      <source srcset="view-switcher-title-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-title.png" alt="view-switcher-title">
    </picture>
    
    A widget letting you switch between multiple views contained by a
    [gid.adw1.view_stack.ViewStack] via an [gid.adw1.view_switcher.ViewSwitcher].
    
    It is designed to be used as the title widget of a [gid.adw1.header_bar.HeaderBar], and
    will display the window's title when the window is too narrow to fit the view
    switcher e.g. on mobile phones, or if there are less than two views.
    
    In order to center the title in narrow windows, the header bar should have
    [gid.adw1.header_bar.HeaderBar.centeringPolicy] set to
    [gid.adw1.types.CenteringPolicy.Strict].
    
    [gid.adw1.view_switcher_title.ViewSwitcherTitle] is intended to be used together with
    [gid.adw1.view_switcher_bar.ViewSwitcherBar].
    
    A common use case is to bind the [gid.adw1.view_switcher_bar.ViewSwitcherBar.reveal] property
    to [gid.adw1.view_switcher_title.ViewSwitcherTitle.titleVisible] to automatically reveal the
    view switcher bar when the title label is displayed in place of the view
    switcher, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar">
              <property name="centering-policy">strict</property>
              <property name="title-widget">
                <object class="AdwViewSwitcherTitle" id="title">
                  <property name="stack">stack</property>
                </object>
              </property>
            </object>
          </child>
          <property name="content">
            <object class="AdwViewStack" id="stack"/>
          </property>
          <child type="bottom">
            <object class="AdwViewSwitcherBar">
              <property name="stack">stack</property>
              <binding name="reveal">
                <lookup name="title-visible">title</lookup>
              </binding>
            </object>
          </child>
        </object>
      </property>
    </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.view_switcher_title.ViewSwitcherTitle] has a single CSS node with name `viewswitchertitle`.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
*/
struct AdwViewSwitcherTitle;

/** */
struct AdwViewSwitcherTitleClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A freeform window.
    
    <picture>
      <source srcset="window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="window.png" alt="window">
    </picture>
    
    The [gid.adw1.window.Window] widget is a subclass of [gid.gtk4.window.Window] which has no
    titlebar area. Instead, [gid.adw1.toolbar_view.ToolbarView] can be used together with
    [gid.adw1.header_bar.HeaderBar] or [gid.gtk4.header_bar.HeaderBar] as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar"/>
          </child>
          <property name="content">
            <!-- ... -->
          </property>
        </object>
      </property>
    </object>
    ```
    
    Using [gid.gtk4.window.Window.titlebar] or [gid.gtk4.window.Window.child]
    is not supported and will result in a crash. Use [gid.adw1.window.Window.content]
    instead.
    
    ## Dialogs
    
    [gid.adw1.window.Window] can contain [gid.adw1.dialog.Dialog]. Use [gid.adw1.dialog.Dialog.present] with the
    window or a widget within a window to show a dialog.
    
    ## Breakpoints
    
    [gid.adw1.window.Window] can be used with [gid.adw1.breakpoint.Breakpoint] the same way as
    [gid.adw1.breakpoint_bin.BreakpointBin]. Refer to that widget's documentation for details.
    
    Example:
    
    ```xml
    <object class="AdwWindow">
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar"/>
          </child>
          <property name="content">
            <!-- ... -->
          </property>
          <child type="bottom">
            <object class="GtkActionBar" id="bottom_bar">
              <property name="revealed">True</property>
              <property name="visible">False</property>
            </object>
          </child>
        </object>
      </property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 500px</condition>
          <setter object="bottom_bar" property="visible">True</setter>
        </object>
      </child>
    </object>
    ```
    
    When breakpoints are used, the minimum size must be larger than the smallest
    UI state. [gid.adw1.window.Window] defaults to the minimum size of 360×200 px. If that's
    too small, set the [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] properties manually.
    
    ## Adaptive Preview
    
    [gid.adw1.window.Window] has a debug tool called adaptive preview. It can be opened from
    GTK Inspector or by pressing <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>M</kbd>,
    and controlled via the [gid.adw1.window.Window.adaptivePreview] property.
*/
struct AdwWindow
{
  /** */
  GtkWindow parentInstance;
}

/** */
struct AdwWindowClass
{
  /** */
  GtkWindowClass parentClass;

  /** */
  void*[4] padding;
}

/**
    A helper widget for setting a window's title and subtitle.
    
    <picture>
      <source srcset="window-title-dark.png" media="(prefers-color-scheme: dark)">
      <img src="window-title.png" alt="window-title">
    </picture>
    
    [gid.adw1.window_title.WindowTitle] shows a title and subtitle. It's intended to be used as the
    title child of [gid.gtk4.header_bar.HeaderBar] or [gid.adw1.header_bar.HeaderBar].
    
    ## CSS nodes
    
    [gid.adw1.window_title.WindowTitle] has a single CSS node with name `windowtitle`.
*/
struct AdwWindowTitle;

/** */
struct AdwWindowTitleClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A box-like widget that can wrap into multiple lines.
    
    <picture>
      <source srcset="wrap-box-dark.png" media="(prefers-color-scheme: dark)">
      <img src="wrap-box.png" alt="wrap-box">
    </picture>
    
    [gid.adw1.wrap_box.WrapBox] is similar to [gid.gtk4.box.Box], but can wrap lines when the
    widgets cannot fit otherwise. Unlike [gid.gtk4.flow_box.FlowBox], the children aren't
    arranged into a grid and behave more like words in a wrapping label.
    
    Like [gid.gtk4.box.Box], [gid.adw1.wrap_box.WrapBox] is orientable and has spacing:
    
    - [gid.adw1.wrap_box.WrapBox.childSpacing] between children in the same line;
    - [gid.adw1.wrap_box.WrapBox.lineSpacing] between lines.
    
    ::: note
        Unlike [gid.gtk4.box.Box], [gid.adw1.wrap_box.WrapBox] cannot follow the CSS `border-spacing`
        property.
    
    Use the [gid.adw1.wrap_box.WrapBox.naturalLineLength] property to determine the
    layout's natural size, e.g. when using it in a [gid.gtk4.popover.Popover].
    
    Normally, a horizontal [gid.adw1.wrap_box.WrapBox] wraps left to right and top to bottom
    for left-to-right languages. Both of these directions can be reversed, using
    the [gid.adw1.wrap_box.WrapBox.packDirection] and [gid.adw1.wrap_box.WrapBox.wrapReverse]
    properties. Additionally, the alignment of each line can be controlled with
    the [gid.adw1.wrap_box.WrapBox.align_] property.
    
    Lines can be justified using the [gid.adw1.wrap_box.WrapBox.justify] property, filling
    the entire line by either increasing child size or spacing depending on the
    value. Set [gid.adw1.wrap_box.WrapBox.justifyLastLine] to justify the last line as
    well.
    
    By default, [gid.adw1.wrap_box.WrapBox] wraps as soon as the previous line cannot fit any
    more children without shrinking them past their natural size. Set
    [gid.adw1.wrap_box.WrapBox.wrapPolicy] to [gid.adw1.types.WrapPolicy.Minimum] to only wrap
    once all the children in the previous line have been shrunk to their minimum
    size.
    
    To make each line take the same amount of space, set
    [gid.adw1.wrap_box.WrapBox.lineHomogeneous] to `TRUE`.
    
    Spacing and natural line length can scale with the text scale factor, use the
    [gid.adw1.wrap_box.WrapBox.childSpacingUnit], [gid.adw1.wrap_box.WrapBox.lineSpacingUnit]
    and/or [gid.adw1.wrap_box.WrapBox.naturalLineLengthUnit] properties to enable that
    behavior.
    
    See [gid.adw1.wrap_layout.WrapLayout].
    
    ## CSS nodes
    
    [gid.adw1.wrap_box.WrapBox] uses a single CSS node with name `wrap-box`.
    
    ## Accessibility
    
    [gid.adw1.wrap_box.WrapBox] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
struct AdwWrapBox;

/** */
struct AdwWrapBoxClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A box-like layout that can wrap into multiple lines.
    
    <picture>
      <source srcset="wrap-box-dark.png" media="(prefers-color-scheme: dark)">
      <img src="wrap-box.png" alt="wrap-box">
    </picture>
    
    [gid.adw1.wrap_layout.WrapLayout] is similar to [gid.gtk4.box_layout.BoxLayout], but can wrap lines when
    the widgets cannot fit otherwise. Unlike [gid.gtk4.flow_box.FlowBox], the children
    aren't arranged into a grid and behave more like words in a wrapping label.
    
    Like [gid.gtk4.box_layout.BoxLayout], [gid.adw1.wrap_layout.WrapLayout] is orientable and has spacing:
    
    - [gid.adw1.wrap_layout.WrapLayout.childSpacing] between children in the same line;
    - [gid.adw1.wrap_layout.WrapLayout.lineSpacing] between lines.
    
    ::: note
        Unlike [gid.gtk4.box_layout.BoxLayout], [gid.adw1.wrap_layout.WrapLayout] cannot follow the CSS
        `border-spacing` property.
    
    Use the [gid.adw1.wrap_layout.WrapLayout.naturalLineLength] property to determine the
    layout's natural size, e.g. when using it in a [gid.gtk4.popover.Popover].
    
    Normally, a horizontal [gid.adw1.wrap_layout.WrapLayout] wraps left to right and top to bottom
    for left-to-right languages. Both of these directions can be reversed, using
    the [gid.adw1.wrap_layout.WrapLayout.packDirection] and
    [gid.adw1.wrap_layout.WrapLayout.wrapReverse] properties. Additionally, the alignment
    of each line can be controlled with the [gid.adw1.wrap_layout.WrapLayout.align_] property.
    
    Lines can be justified using the [gid.adw1.wrap_layout.WrapLayout.justify] property,
    filling the entire line by either increasing child size or spacing depending
    on the value. Set [gid.adw1.wrap_layout.WrapLayout.justifyLastLine] to justify the last
    line as well.
    
    By default, [gid.adw1.wrap_layout.WrapLayout] wraps as soon as the previous line cannot fit
    any more children without shrinking them past their natural size. Set
    [gid.adw1.wrap_layout.WrapLayout.wrapPolicy] to [gid.adw1.types.WrapPolicy.Minimum] to only
    wrap once all the children in the previous line have been shrunk to their
    minimum size.
    
    To make each line take the same amount of space, set
    [gid.adw1.wrap_layout.WrapLayout.lineHomogeneous] to `TRUE`.
    
    Spacing and natural line length can scale with the text scale factor, use the
    [gid.adw1.wrap_layout.WrapLayout.childSpacingUnit],
    [gid.adw1.wrap_layout.WrapLayout.lineSpacingUnit] and/or
    [gid.adw1.wrap_layout.WrapLayout.naturalLineLengthUnit] properties to enable that
    behavior.
    
    See [gid.adw1.wrap_box.WrapBox].
*/
struct AdwWrapLayout;

/** */
struct AdwWrapLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

alias extern(C) void function(double value, void* userData) AdwAnimationTargetFunc;

alias extern(C) AdwSidebarItem* function(GObject* item, void* userData) AdwSidebarSectionCreateItemFunc;

