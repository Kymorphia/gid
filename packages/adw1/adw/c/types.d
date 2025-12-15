/// C types for adw1 library
module adw.c.types;

public import gid.basictypes;
public import gio.c.types;
public import gtk.c.types;

/**
    Describes the possible states of an `class@Animation`.
    
    The state can be controlled with [adw.animation.Animation.play],
    [adw.animation.Animation.pause], [adw.animation.Animation.resume],
    [adw.animation.Animation.reset] and [adw.animation.Animation.skip].
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
    Describes length types for `struct@BreakpointCondition`.
    
    See [adw.breakpoint_condition.BreakpointCondition.newLength].
    
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
    Describes ratio types for `struct@BreakpointCondition`.
    
    See [adw.breakpoint_condition.BreakpointCondition.newRatio].
    
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
    Describes title centering behavior of a `class@HeaderBar` widget.
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
    Application color schemes for `property@StyleManager:color-scheme`.
*/
enum AdwColorScheme
{
  /**
      Inherit the parent color-scheme. When set on the
        [adw.style_manager.StyleManager] returned by [adw.style_manager.StyleManager.getDefault], it's
        equivalent to [adw.types.ColorScheme.PreferLight].
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
    Describes the available presentation modes for `class@Dialog`.
    
    New values may be added to this enumeration over time.
    
    See `property@Dialog:presentation-mode`.
*/
enum AdwDialogPresentationMode
{
  /**
      Switch between [adw.types.DialogPresentationMode.Floating] and
        [adw.types.DialogPresentationMode.BottomSheet] depending on available size.
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
    `class@TimedAnimation`.
    
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
      Quadratic tweening, inverse of [adw.types.Easing.EaseInQuad].
  */
  EaseOutQuad = 2,

  /**
      Quadratic tweening, combining [adw.types.Easing.EaseInQuad] and
        [adw.types.Easing.EaseOutQuad].
  */
  EaseInOutQuad = 3,

  /**
      Cubic tweening.
  */
  EaseInCubic = 4,

  /**
      Cubic tweening, inverse of [adw.types.Easing.EaseInCubic].
  */
  EaseOutCubic = 5,

  /**
      Cubic tweening, combining [adw.types.Easing.EaseInCubic] and
        [adw.types.Easing.EaseOutCubic].
  */
  EaseInOutCubic = 6,

  /**
      Quartic tweening.
  */
  EaseInQuart = 7,

  /**
      Quartic tweening, inverse of [adw.types.Easing.EaseInQuart].
  */
  EaseOutQuart = 8,

  /**
      Quartic tweening, combining [adw.types.Easing.EaseInQuart] and
        [adw.types.Easing.EaseOutQuart].
  */
  EaseInOutQuart = 9,

  /**
      Quintic tweening.
  */
  EaseInQuint = 10,

  /**
      Quintic tweening, inverse of [adw.types.Easing.EaseInQuint].
  */
  EaseOutQuint = 11,

  /**
      Quintic tweening, combining [adw.types.Easing.EaseInQuint] and
        [adw.types.Easing.EaseOutQuint].
  */
  EaseInOutQuint = 12,

  /**
      Sine wave tweening.
  */
  EaseInSine = 13,

  /**
      Sine wave tweening, inverse of [adw.types.Easing.EaseInSine].
  */
  EaseOutSine = 14,

  /**
      Sine wave tweening, combining [adw.types.Easing.EaseInSine] and
        [adw.types.Easing.EaseOutSine].
  */
  EaseInOutSine = 15,

  /**
      Exponential tweening.
  */
  EaseInExpo = 16,

  /**
      Exponential tweening, inverse of [adw.types.Easing.EaseInExpo].
  */
  EaseOutExpo = 17,

  /**
      Exponential tweening, combining [adw.types.Easing.EaseInExpo] and
        [adw.types.Easing.EaseOutExpo].
  */
  EaseInOutExpo = 18,

  /**
      Circular tweening.
  */
  EaseInCirc = 19,

  /**
      Circular tweening, inverse of [adw.types.Easing.EaseInCirc].
  */
  EaseOutCirc = 20,

  /**
      Circular tweening, combining [adw.types.Easing.EaseInCirc] and
        [adw.types.Easing.EaseOutCirc].
  */
  EaseInOutCirc = 21,

  /**
      Elastic tweening, with offshoot on start.
  */
  EaseInElastic = 22,

  /**
      Elastic tweening, with offshoot on end, inverse of
        [adw.types.Easing.EaseInElastic].
  */
  EaseOutElastic = 23,

  /**
      Elastic tweening, with offshoot on both ends,
        combining [adw.types.Easing.EaseInElastic] and [adw.types.Easing.EaseOutElastic].
  */
  EaseInOutElastic = 24,

  /**
      Overshooting cubic tweening, with backtracking on start.
  */
  EaseInBack = 25,

  /**
      Overshooting cubic tweening, with backtracking on end,
        inverse of [adw.types.Easing.EaseInBack].
  */
  EaseOutBack = 26,

  /**
      Overshooting cubic tweening, with backtracking on both
        ends, combining [adw.types.Easing.EaseInBack] and [adw.types.Easing.EaseOutBack].
  */
  EaseInOutBack = 27,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        on start.
  */
  EaseInBounce = 28,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        with bounce on end, inverse of [adw.types.Easing.EaseInBounce].
  */
  EaseOutBounce = 29,

  /**
      Exponentially decaying parabolic (bounce) tweening,
        with bounce on both ends, combining [adw.types.Easing.EaseInBounce] and
        [adw.types.Easing.EaseOutBounce].
  */
  EaseInOutBounce = 30,
}

/**
    Describes the possible folding behavior of a `class@Flap` widget.

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
    Describes transitions types of a `class@Flap` widget.
    
    It determines the type of animation when transitioning between children in a
    `class@Flap` widget, as well as which areas can be swiped via
    `property@Flap:swipe-to-open` and `property@Flap:swipe-to-close`.

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
    Determines when `class@Flap` and `class@Leaflet` will fold.

    Deprecated: Stop using [adw.leaflet.Leaflet] and [adw.flap.Flap]
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
    Describes the possible transitions in a `class@Leaflet` widget.
    
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
    Describes the possible styles of `class@AlertDialog` response buttons.
    
    See [adw.alert_dialog.AlertDialog.setResponseAppearance].
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
    Describes the possible transitions in a `class@Squeezer` widget.

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
    Describes available shortcuts in an `class@TabView`.
    
    Shortcuts can be set with `property@TabView:shortcuts`, or added/removed
    individually with [adw.tab_view.TabView.addShortcuts] and
    [adw.tab_view.TabView.removeShortcuts].
    
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
    `class@Toast` behavior when another toast is already displayed.
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
    Describes the possible top or bottom bar styles in an `class@ToolbarView`
    widget.
    
    [adw.types.ToolbarStyle.Flat] is suitable for simple content, such as
    `class@StatusPage` or `class@PreferencesPage`, where the background at the
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
    
    [adw.types.ToolbarStyle.Raised] style is suitable for content such as
    [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
    where some elements are directly adjacent to the top/bottom bars, or
    `class@TabView`, where each page can have a different background.
    
    [adw.types.ToolbarStyle.RaisedBorder] style is similar to [adw.types.ToolbarStyle.Raised], but
    with the shadow replaced with a more subtle border. It's intended to be used
    in applications like image viewers, where a shadow over the content might be
    undesired.
    
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised.png" alt="toolbar-view-raised">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-border-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised-border.png" alt="toolbar-view-raised-border">
    </picture>
    
    See `property@ToolbarView:top-bar-style` and
    `property@ToolbarView:bottom-bar-style`.
    
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
    Describes the adaptive modes of `class@ViewSwitcher`.
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
    A dialog showing information about the application.
    
    <picture>
      <source srcset="about-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="about-dialog.png" alt="about-dialog">
    </picture>
    
    an about dialog is typically opened when the user activates the `About …`
    item in the application's primary menu. All parts of the dialog are optional.
    
    ## Main page
    
    [adw.about_dialog.AboutDialog] prominently displays the application's icon, name, developer
    name and version. They can be set with the `property@AboutDialog:application-icon`,
    `property@AboutDialog:application-name`,
    `property@AboutDialog:developer-name` and `property@AboutDialog:version`
    respectively.
    
    ## What's New
    
    [adw.about_dialog.AboutDialog] provides a way for applications to display their release
    notes, set with the `property@AboutDialog:release-notes` property.
    
    Release notes are formatted the same way as
    [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
    
    The supported formatting options are:
    
    $(LIST
      * Paragraph (`<p>`)
      * Ordered list (`<ol>`), with list items (`<li>`)
      * Unordered list (`<ul>`), with list items (`<li>`)
    )
      
    Within paragraphs and list items, emphasis (`<em>`) and inline code
    (`<code>`) text styles are supported. The emphasis is rendered in italic,
    while inline code is shown in a monospaced font.
    
    Any text outside paragraphs or list items is ignored.
    
    Nested lists are not supported.
    
    Only one version can be shown at a time. By default, the displayed version
    number matches `property@AboutDialog:version`. Use
    `property@AboutDialog:release-notes-version` to override it.
    
    ## Details
    
    The Details page displays the application comments and links.
    
    The comments can be set with the `property@AboutDialog:comments` property.
    Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
    detailed. It can also contain links and Pango markup.
    
    To set the application website, use `property@AboutDialog:website`.
    To add extra links below the website, use [adw.about_dialog.AboutDialog.addLink].
    
    If the Details page doesn't have any other content besides website, the
    website will be displayed on the main page instead.
    
    ## Troubleshooting
    
    [adw.about_dialog.AboutDialog] displays the following two links on the main page:
    
    $(LIST
      * Support Questions, set with the `property@AboutDialog:support-url` property,
      * Report an Issue, set with the `property@AboutDialog:issue-url` property.
    )
      
    Additionally, applications can provide debugging information. It will be
    shown separately on the Troubleshooting page. Use the
    `property@AboutDialog:debug-info` property to specify it.
    
    It's intended to be attached to issue reports when reporting issues against
    the application. As such, it cannot contain markup or links.
    
    [adw.about_dialog.AboutDialog] provides a quick way to save debug information to a file.
    When saving, `property@AboutDialog:debug-info-filename` would be used as
    the suggested filename.
    
    ## Credits and Acknowledgements
    
    The Credits page has the following default sections:
    
    $(LIST
      * Developers, set with the `property@AboutDialog:developers` property,
      * Designers, set with the `property@AboutDialog:designers` property,
      * Artists, set with the `property@AboutDialog:artists` property,
      * Documenters, set with the `property@AboutDialog:documenters` property,
      * Translators, set with the `property@AboutDialog:translator-credits` property.
    )
      
    When setting translator credits, use the strings `"translator-credits"` or
    `"translator_credits"` and mark them as translatable.
    
    The default sections that don't contain any names won't be displayed.
    
    The Credits page can also contain an arbitrary number of extra sections below
    the default ones. Use [adw.about_dialog.AboutDialog.addCreditSection] to add them.
    
    The Acknowledgements page can be used to acknowledge additional people and
    organizations for their non-development contributions. Use
    [adw.about_dialog.AboutDialog.addAcknowledgementSection] to add sections to it. For
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
    
    The copyright string is set with the `property@AboutDialog:copyright`
    property and should be a short string of one or two lines, for example:
    `© 2022 Example`.
    
    Licensing information can be quickly set from a list of known licenses with
    the `property@AboutDialog:license-type` property. If the application's
    license is not in the list, `property@AboutDialog:license` can be used
    instead.
    
    To add information about other modules, such as application dependencies or
    data, use [adw.about_dialog.AboutDialog.addLegalSection].
    
    ## Constructing
    
    To make constructing an [adw.about_dialog.AboutDialog] as convenient as possible, you can
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
                             "issue-url", "https://gitlab.gnome.org/example/example/-/issues/new",
                             "license-type", GTK_LICENSE_GPL_3_0,
                             "developers", developers,
                             "designers", designers,
                             "translator-credits", _("translator-credits"),
                             NULL);
    }
    ```
    
    ## CSS nodes
    
    [adw.about_dialog.AboutDialog] has a main CSS node with the name `dialog` and the
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
    
    [adw.about_window.AboutWindow] prominently displays the application's icon, name, developer
    name and version. They can be set with the `property@AboutWindow:application-icon`,
    `property@AboutWindow:application-name`,
    `property@AboutWindow:developer-name` and `property@AboutWindow:version`
    respectively.
    
    ## What's New
    
    [adw.about_window.AboutWindow] provides a way for applications to display their release
    notes, set with the `property@AboutWindow:release-notes` property.
    
    Release notes are formatted the same way as
    [AppStream descriptions](https://freedesktop.org/software/appstream/docs/chap-Metadata.html#tag-description).
    
    The supported formatting options are:
    
    $(LIST
      * Paragraph (`<p>`)
      * Ordered list (`<ol>`), with list items (`<li>`)
      * Unordered list (`<ul>`), with list items (`<li>`)
    )
      
    Within paragraphs and list items, emphasis (`<em>`) and inline code
    (`<code>`) text styles are supported. The emphasis is rendered in italic,
    while inline code is shown in a monospaced font.
    
    Any text outside paragraphs or list items is ignored.
    
    Nested lists are not supported.
    
    Only one version can be shown at a time. By default, the displayed version
    number matches `property@AboutWindow:version`. Use
    `property@AboutWindow:release-notes-version` to override it.
    
    ## Details
    
    The Details page displays the application comments and links.
    
    The comments can be set with the `property@AboutWindow:comments` property.
    Unlike [gtk.about_dialog.AboutDialog.comments], this string can be long and
    detailed. It can also contain links and Pango markup.
    
    To set the application website, use `property@AboutWindow:website`.
    To add extra links below the website, use [adw.about_window.AboutWindow.addLink].
    
    If the Details page doesn't have any other content besides website, the
    website will be displayed on the main page instead.
    
    ## Troubleshooting
    
    [adw.about_window.AboutWindow] displays the following two links on the main page:
    
    $(LIST
      * Support Questions, set with the `property@AboutWindow:support-url` property,
      * Report an Issue, set with the `property@AboutWindow:issue-url` property.
    )
      
    Additionally, applications can provide debugging information. It will be
    shown separately on the Troubleshooting page. Use the
    `property@AboutWindow:debug-info` property to specify it.
    
    It's intended to be attached to issue reports when reporting issues against
    the application. As such, it cannot contain markup or links.
    
    [adw.about_window.AboutWindow] provides a quick way to save debug information to a file.
    When saving, `property@AboutWindow:debug-info-filename` would be used as
    the suggested filename.
    
    ## Credits and Acknowledgements
    
    The Credits page has the following default sections:
    
    $(LIST
      * Developers, set with the `property@AboutWindow:developers` property,
      * Designers, set with the `property@AboutWindow:designers` property,
      * Artists, set with the `property@AboutWindow:artists` property,
      * Documenters, set with the `property@AboutWindow:documenters` property,
      * Translators, set with the `property@AboutWindow:translator-credits` property.
    )
      
    When setting translator credits, use the strings `"translator-credits"` or
    `"translator_credits"` and mark them as translatable.
    
    The default sections that don't contain any names won't be displayed.
    
    The Credits page can also contain an arbitrary number of extra sections below
    the default ones. Use [adw.about_window.AboutWindow.addCreditSection] to add them.
    
    The Acknowledgements page can be used to acknowledge additional people and
    organizations for their non-development contributions. Use
    [adw.about_window.AboutWindow.addAcknowledgementSection] to add sections to it. For
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
    
    The copyright string is set with the `property@AboutWindow:copyright`
    property and should be a short string of one or two lines, for example:
    `© 2022 Example`.
    
    Licensing information can be quickly set from a list of known licenses with
    the `property@AboutWindow:license-type` property. If the application's
    license is not in the list, `property@AboutWindow:license` can be used
    instead.
    
    To add information about other modules, such as application dependencies or
    data, use [adw.about_window.AboutWindow.addLegalSection].
    
    ## Constructing
    
    To make constructing an [adw.about_window.AboutWindow] as convenient as possible, you can
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
                             "issue-url", "https://gitlab.gnome.org/example/example/-/issues/new",
                             "license-type", GTK_LICENSE_GPL_3_0,
                             "developers", developers,
                             "designers", designers,
                             "translator-credits", _("translator-credits"),
                             NULL);
    }
    ```
    
    ## CSS nodes
    
    [adw.about_window.AboutWindow] has a main CSS node with the name `window` and the
    style class `.about`.
*/
struct AdwAboutWindow;

/** */
struct AdwAboutWindowClass
{
  /** */
  AdwWindowClass parentClass;
}

/**
    A [gtk.list_box_row.ListBoxRow] used to present actions.
    
    <picture>
      <source srcset="action-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="action-row.png" alt="action-row">
    </picture>
    
    The [adw.action_row.ActionRow] widget can have a title, a subtitle and an icon. The row
    can receive additional widgets at its end, or prefix widgets at its start.
    
    It is convenient to present a preference and its related actions.
    
    [adw.action_row.ActionRow] is unactivatable by default, giving it an activatable widget
    will automatically make it activatable, but unsetting it won't change the
    row's activatability.
    
    ## AdwActionRow as GtkBuildable
    
    The [adw.action_row.ActionRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.action_row.ActionRow] has a main CSS node with name `row`.
    
    It contains the subnode `box.header` for its main horizontal box, and
    `box.title` for the vertical box containing the title and subtitle labels.
    
    It contains subnodes `label.title` and `label.subtitle` representing
    respectively the title label and subtitle label.
    
    [adw.action_row.ActionRow] can use the
    [`.property`](style-classes.html#property-rows) style class to emphasize
    the row subtitle instead of the row title, which is useful for
    displaying read-only properties.
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
    `signal@AlertDialog::response` signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    `property@AlertDialog:close-response` property if the dialog had been closed
    without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [adw.alert_dialog.AlertDialog] is closed automatically.
    
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
    
    [adw.alert_dialog.AlertDialog] can also be used via the [adw.alert_dialog.AlertDialog.choose] method.
    This API follows the GIO async pattern, and the result can be obtained by
    calling [adw.alert_dialog.AlertDialog.chooseFinish], for example:
    
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
    
    [adw.alert_dialog.AlertDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    respresenting a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [adw.alert_dialog.AlertDialog.setResponseEnabled] and
    [adw.alert_dialog.AlertDialog.setResponseAppearance] for details.
    
    Example of an [adw.alert_dialog.AlertDialog] UI definition:
    
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
    
    [adw.animation.Animation] represents an animation on a widget. It has a target that
    provides a value to animate, and a state indicating whether the
    animation hasn't been started yet, is playing, paused or finished.
    
    Currently there are two concrete animation types:
    `class@TimedAnimation` and `class@SpringAnimation`.
    
    [adw.animation.Animation] will automatically skip the animation if
    `property@Animation:widget` is unmapped, or if
    `property@Gtk.Settings:gtk-enable-animations` is `FALSE`.
    
    The `signal@Animation::done` signal can be used to perform an action after
    the animation ends, for example hiding a widget after animating its
    [gtk.widget.Widget.opacity] to 0.
    
    [adw.animation.Animation] will be kept alive while the animation is playing. As such,
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
    [adw.animation.Animation] object can be reused.
*/
struct AdwAnimation
{
  /** */
  GObject parentInstance;
}

/** */
struct AdwAnimationClass;

/**
    Represents a value `class@Animation` can animate.
*/
struct AdwAnimationTarget;

/** */
struct AdwAnimationTargetClass;

/**
    A base class for Adwaita applications.
    
    [adw.application.Application] handles library initialization by calling `func@init` in the
    default [gio.application.Application.startup] signal handler, in turn chaining up
    as required by [gtk.application.Application]. Therefore, any subclass of
    [adw.application.Application] should always chain up its `startup` handler before using
    any Adwaita or GTK API.
    
    ## Automatic Resources
    
    [adw.application.Application] will automatically load stylesheets located in the
    application's resource base path (see
    [gio.application.Application.setResourceBasePath], if they're present.
    
    They can be used to add custom styles to the application, as follows:
    
    $(LIST
      * `style.css` contains styles that are always present.
      
      * `style-dark.css` contains styles only used when
    )
    `property@StyleManager:dark` is `TRUE`.
    
    $(LIST
      * `style-hc.css` contains styles used when the system high contrast
        preference is enabled.
      
      * `style-hc-dark.css` contains styles used when the system high contrast
        preference is enabled and `property@StyleManager:dark` is `TRUE`.
    )
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
    
    [adw.application_window.ApplicationWindow] is a [gtk.application_window.ApplicationWindow] subclass providing
    the same features as `class@Window`.
    
    See `class@Window` for details.
    
    Example of an [adw.application_window.ApplicationWindow] UI definition:
    
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
    
    Using [gtk.application.Application.menubar] is not supported and may result in
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
    
    [adw.avatar.Avatar] is a widget that shows a round avatar.
    
    [adw.avatar.Avatar] generates an avatar with the initials of  the
    `property@Avatar:text` on top of a colored background.
    
    The color is picked based on the hash of the `property@Avatar:text`.
    
    If `property@Avatar:show-initials` is set to `FALSE`,
    `property@Avatar:icon-name` or `avatar-default-symbolic` is shown instead of
    the initials.
    
    Use `property@Avatar:custom-image` to set a custom image.
    
    ## CSS nodes
    
    [adw.avatar.Avatar] has a single CSS node with name `avatar`.
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
    
    Banners are hidden by default, use `property@Banner:revealed` to show them.
    
    Banners have a title, set with `property@Banner:title`. Titles can be marked
    up with Pango markup, use `property@Banner:use-markup` to enable it.
    
    The title will be shown centered or left-aligned depending on available
    space.
    
    Banners can optionally have a button with text on it, set through
    `property@Banner:button-label`. The button can be used with a [gio.action.Action],
    or with the `signal@Banner::button-clicked` signal.
    
    ## CSS nodes
    
    [adw.banner.Banner] has a main CSS node with the name `banner`.
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
    
    The [adw.bin.Bin] widget has only one child, set with the `property@Bin:child`
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
    Describes a breakpoint for `class@Window` or `class@Dialog`.
    
    Breakpoints are used to create adaptive UI, allowing to change the layout
    depending on available size.
    
    Breakpoint is a size threshold, specified by its condition, as well as one or
    more setters.
    
    Each setter has a target object, a property and a value. When a breakpoint
    is applied, each setter sets the target property on their target object to
    the specified value, and reset it back to the original value when it's
    unapplied.
    
    For more complicated scenarios, `signal@Breakpoint::apply` and
    `signal@Breakpoint::unapply` can be used instead.
    
    Breakpoints can be used within `class@Window`, `class@ApplicationWindow`,
    `class@Dialog` or `class@BreakpointBin`.
    
    ## [adw.breakpoint.Breakpoint] as [gtk.buildable.Buildable]:
    
    [adw.breakpoint.Breakpoint] supports specifying its condition via the `<condition>`
    element. The contents of the element must be a string in a format accepted by
    [adw.breakpoint_condition.BreakpointCondition.parse].
    
    It also supports adding setters via the `<setter>` element. Each `<setter>`
    element must have the `object` attribute specifying the target object, and
    the `property` attribute specifying the property name. The contents of the
    element are used as the setter value.
    
    For `G_TYPE_OBJECT` and `G_TYPE_BOXED` derived properties, empty contents are
    treated as `NULL`.
    
    Setter values can be translated with the usual `translatable`, `context` and
    `comments` attributes.
    
    Example of an [adw.breakpoint.Breakpoint] UI definition:
    
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
    
    [adw.breakpoint_bin.BreakpointBin] provides a way to use breakpoints without `class@Window`,
    `class@ApplicationWindow` or `class@Dialog`. It can be useful for limiting
    breakpoints to a single page and similar purposes. Most applications
    shouldn't need it.
    
    [adw.breakpoint_bin.BreakpointBin] is similar to `class@Bin`. It has one child, set via the
    `property@BreakpointBin:child` property.
    
    When [adw.breakpoint_bin.BreakpointBin] is resized, its child widget can rearrange its layout
    at specific thresholds.
    
    The thresholds and layout changes are defined via `class@Breakpoint` objects.
    They can be added using [adw.breakpoint_bin.BreakpointBin.addBreakpoint].
    
    Each breakpoint has a condition, specifying the bin's size and/or aspect
    ratio, and setters that automatically set object properties when that
    happens. The `signal@Breakpoint::apply` and `signal@Breakpoint::unapply` can
    be used instead for more complex scenarios.
    
    Breakpoints are only allowed to modify widgets inside the [adw.breakpoint_bin.BreakpointBin],
    but not on the [adw.breakpoint_bin.BreakpointBin] itself or any other widgets.
    
    If multiple breakpoints can be used for the current size, the last one is
    always picked. The current breakpoint can be tracked using the
    `property@BreakpointBin:current-breakpoint` property.
    
    If none of the breakpoints can be used, that property will be set to `NULL`,
    and the original property values will be used instead.
    
    ## Minimum Size
    
    Adding a breakpoint to [adw.breakpoint_bin.BreakpointBin] will result in it having no minimum
    size. The `property@Gtk.Widget:width-request` and
    `property@Gtk.Widget:height-request` properties must always be set when using
    breakpoints, indicating the smallest size you want to support.
    
    The minimum size and breakpoint conditions must be carefully selected so that
    the child widget completely fits. If it doesn't, it will overflow and a
    warning message will be printed.
    
    When choosing minimum size, consider translations and text scale factor
    changes. Make sure to leave enough space for text labels, and enable
    ellipsizing or wrapping if they might not fit.
    
    For [gtk.label.Label] this can be done via [gtk.label.Label.ellipsize], or
    via [gtk.label.Label.wrap] together with [gtk.label.Label.wrap].
    
    For buttons, use `property@Gtk.Button:can-shrink`,
    `property@Gtk.MenuButton:can-shrink`, `property@Adw.SplitButton:can-shrink`,
    or `property@Adw.ButtonContent:can-shrink`.
    
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
    
    ## [adw.breakpoint_bin.BreakpointBin] as [gtk.buildable.Buildable]
    
    [adw.breakpoint_bin.BreakpointBin] allows adding [adw.breakpoint.Breakpoint] objects as children.
    
    Example of an [adw.breakpoint_bin.BreakpointBin] UI definition:
    
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
    
    See `class@Breakpoint` documentation for details.
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
    Describes condition for an `class@Breakpoint`.
*/
struct AdwBreakpointCondition;

/**
    A helper widget for creating buttons.
    
    <picture>
      <source srcset="button-content-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-content.png" alt="button-content">
    </picture>
    
    [adw.button_content.ButtonContent] is a box-like widget with an icon and a label.
    
    It's intended to be used as a direct child of [gtk.button.Button],
    [gtk.menu_button.MenuButton] or `class@SplitButton`, when they need to have both an
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
    
    [adw.button_content.ButtonContent] handles style classes and connecting the mnemonic to the
    button automatically.
    
    ## CSS nodes
    
    ```
    buttoncontent
    ╰── box
        ├── image
        ╰── label
    ```
    
    [adw.button_content.ButtonContent]'s CSS node is called `buttoncontent`. It contains a `box`
    subnode that serves as a container for the  `image` and `label` nodes.
    
    When inside a [gtk.button.Button] or [adw.split_button.SplitButton], the button will receive the
    `.image-text-button` style class. When inside a [gtk.menu_button.MenuButton], the
    internal [gtk.button.Button] will receive it instead.
    
    ## Accessibility
    
    [adw.button_content.ButtonContent] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwButtonContent;

/** */
struct AdwButtonContentClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An `class@AnimationTarget` that calls a given callback during the
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
    
    The [adw.carousel.Carousel] widget can be used to display a set of pages with
    swipe-based navigation between them.
    
    `class@CarouselIndicatorDots` and `class@CarouselIndicatorLines` can be used
    to provide page indicators for [adw.carousel.Carousel].
    
    ## CSS nodes
    
    [adw.carousel.Carousel] has a single CSS node with name `carousel`.
*/
struct AdwCarousel;

/** */
struct AdwCarouselClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A dots indicator for `class@Carousel`.
    
    <picture>
      <source srcset="carousel-indicator-dots-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-dots.png" alt="carousel-indicator-dots">
    </picture>
    
    The [adw.carousel_indicator_dots.CarouselIndicatorDots] widget shows a set of dots for each page of a
    given `class@Carousel`. The dot representing the carousel's active page is
    larger and more opaque than the others, the transition to the active and
    inactive state is gradual to match the carousel's position.
    
    See also `class@CarouselIndicatorLines`.
    
    ## CSS nodes
    
    [adw.carousel_indicator_dots.CarouselIndicatorDots] has a single CSS node with name
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
    A lines indicator for `class@Carousel`.
    
    <picture>
      <source srcset="carousel-indicator-dots-lines.png" media="(prefers-color-scheme: dark)">
      <img src="carousel-indicator-lines.png" alt="carousel-indicator-lines">
    </picture>
    
    The [adw.carousel_indicator_lines.CarouselIndicatorLines] widget shows a set of lines for each page of
    a given `class@Carousel`. The carousel's active page is shown as another line
    that moves between them to match the carousel's position.
    
    See also `class@CarouselIndicatorDots`.
    
    ## CSS nodes
    
    [adw.carousel_indicator_lines.CarouselIndicatorLines] has a single CSS node with name
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
    
    The [adw.clamp.Clamp] widget constrains the size of the widget it contains to a
    given maximum size. It will constrain the width if it is horizontal, or the
    height if it is vertical. The expansion of the child from its minimum to its
    maximum size is eased out for a smooth transition.
    
    If the child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [adw.clamp.Clamp] can scale with the text scale factor, use the
    `property@Clamp:unit` property to enable that behavior.
    
    See also: `class@ClampLayout`, `class@ClampScrollable`.
    
    ## CSS nodes
    
    [adw.clamp.Clamp] has a single CSS node with name `clamp`.
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
    
    [adw.clamp_layout.ClampLayout] constraints the size of the widgets it contains to a given
    maximum size. It will constrain the width if it is horizontal, or the height
    if it is vertical. The expansion of the children from their minimum to their
    maximum size is eased out for a smooth transition.
    
    If a child requires more than the requested maximum size, it will be
    allocated the minimum size it can fit in instead.
    
    [adw.clamp_layout.ClampLayout] can scale with the text scale factor, use the
    `property@ClampLayout:unit` property to enable that behavior.
    
    See also: `class@Clamp`, `class@ClampScrollable`.
*/
struct AdwClampLayout;

/** */
struct AdwClampLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    A scrollable `class@Clamp`.
    
    [adw.clamp_scrollable.ClampScrollable] is a variant of `class@Clamp` that implements the
    [gtk.scrollable.Scrollable] interface.
    
    The primary use case for [adw.clamp_scrollable.ClampScrollable] is clamping
    [gtk.list_view.ListView].
    
    See also: `class@ClampLayout`.
*/
struct AdwClampScrollable;

/** */
struct AdwClampScrollableClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A [gtk.list_box_row.ListBoxRow] used to choose from a list of items.
    
    <picture>
      <source srcset="combo-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="combo-row.png" alt="combo-row">
    </picture>
    
    The [adw.combo_row.ComboRow] widget allows the user to choose from a list of valid
    choices. The row displays the selected choice. When activated, the row
    displays a popover which allows the user to make a new choice.
    
    Example of an [adw.combo_row.ComboRow] UI definition:
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
    
    The `property@ComboRow:selected` and `property@ComboRow:selected-item`
    properties can be used to keep track of the selected item and react to their
    changes.
    
    [adw.combo_row.ComboRow] mirrors [gtk.drop_down.DropDown], see that widget for details.
    
    [adw.combo_row.ComboRow] is [gtk.list_box_row.ListBoxRow.activatable] if a model is set.
    
    ## CSS nodes
    
    [adw.combo_row.ComboRow] has a main CSS node with name `row` and the `.combo` style
    class.
    
    Its popover has the node named `popover` with the `.menu` style class, it
    contains a [gtk.scrolled_window.ScrolledWindow], which in turn contains a
    [gtk.list_view.ListView], both are accessible via their regular nodes.
    
    ## Accessibility
    
    [adw.combo_row.ComboRow] uses the [gtk.types.AccessibleRole.ComboBox] role.
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
    
    [adw.dialog.Dialog] is similar to a window, but is shown within another window. It
    can be used with `class@Window` and `class@ApplicationWindow`, use
    [adw.dialog.Dialog.present] to show it.
    
    [adw.dialog.Dialog] is not resizable. Use the `property@Dialog:content-width` and
    `property@Dialog:content-height` properties to set its size, or set
    `property@Dialog:follows-content-size` to `TRUE` to make the dialog track the
    content's size as it changes. [adw.dialog.Dialog] can never be larger than its parent
    window.
    
    [adw.dialog.Dialog] can be presented as a centered floating window or a bottom sheet.
    By default it's automatic depending on the available size.
    `property@Dialog:presentation-mode` can be used to change that.
    
    [adw.dialog.Dialog] can be closed via [adw.dialog.Dialog.close].
    
    When presented as a bottom sheet, [adw.dialog.Dialog] can also be closed via swiping
    it down.
    
    The `property@Dialog:can-close` can be used to prevent closing. In that case,
    `signal@Dialog::close-attempt` gets emitted instead.
    
    Use [adw.dialog.Dialog.forceClose] to close the dialog even when `can-close` is set to
    `FALSE`.
    
    ## Header Bar Integration
    
    When placed inside an [adw.dialog.Dialog], `class@HeaderBar` will display the dialog
    title instead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    `property@HeaderBar:show-start-title-buttons` and
    `property@HeaderBar:show-end-title-buttons` to `FALSE` to remove it if it's
    unwanted.
    
    ## Breakpoints
    
    [adw.dialog.Dialog] can be used with `class@Breakpoint` the same way as
    `class@BreakpointBin`. Refer to that widget's documentation for details.
    
    Like [adw.breakpoint_bin.BreakpointBin], if breakpoints are used, [adw.dialog.Dialog] doesn't have a
    minimum size, and `property@Gtk.Widget:width-request` and
    `property@Gtk.Widget:height-request` properties must be set manually.
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
    A [gtk.list_box_row.ListBoxRow] with an embedded text entry.
    
    <picture>
      <source srcset="entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="entry-row.png" alt="entry-row">
    </picture>
    
    [adw.entry_row.EntryRow] has a title that doubles as placeholder text. It shows an icon
    indicating that it's editable and can receive additional widgets before or
    after the editable part.
    
    If `property@EntryRow:show-apply-button` is set to `TRUE`, [adw.entry_row.EntryRow] can
    show an apply button when editing its contents. This can be useful if
    changing its contents can result in an expensive operation, such as network
    activity.
    
    [adw.entry_row.EntryRow] provides only minimal API and should be used with the
    [gtk.editable.Editable] API.
    
    See also `class@PasswordEntryRow`.
    
    ## AdwEntryRow as GtkBuildable
    
    The [adw.entry_row.EntryRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.entry_row.EntryRow] has a single CSS node with name `row` and the `.entry` style
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
    [adw.enum_list_item.EnumListItem] is the type of items in a `class@EnumListModel`.
*/
struct AdwEnumListItem;

/** */
struct AdwEnumListItemClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gio.list_model.ListModel] representing values of a given enum.
    
    [adw.enum_list_model.EnumListModel] contains objects of type `class@EnumListItem`.
*/
struct AdwEnumListModel;

/** */
struct AdwEnumListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.list_box_row.ListBoxRow] used to reveal widgets.
    
    <picture>
      <source srcset="expander-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="expander-row.png" alt="expander-row">
    </picture>
    
    The [adw.expander_row.ExpanderRow] widget allows the user to reveal or hide widgets below
    it. It also allows the user to enable the expansion of the row, allowing to
    disable all that the row contains.
    
    ## AdwExpanderRow as GtkBuildable
    
    The [adw.expander_row.ExpanderRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child as an suffix widget by specifying “suffix” as the
    “type” attribute of a <child> element.
    
    It also supports adding it as a prefix widget by specifying “prefix” as the
    “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.expander_row.ExpanderRow] has a main CSS node with name `row` and the `.expander`
    style class. It has the `.empty` style class when it contains no children.
    
    It contains the subnodes `row.header` for its main embedded row,
    `list.nested` for the list it can expand, and `image.expander-row-arrow` for
    its arrow.
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
    
    The [adw.flap.Flap] widget can display its children like a [gtk.box.Box] does or
    like a [gtk.overlay.Overlay] does, according to the
    `property@Flap:fold-policy` value.
    
    [adw.flap.Flap] has at most three children: `property@Flap:content`,
    `property@Flap:flap` and `property@Flap:separator`. Content is the primary
    child, flap is displayed next to it when unfolded, or overlays it when
    folded. Flap can be shown or hidden by changing the
    `property@Flap:reveal-flap` value, as well as via swipe gestures if
    `property@Flap:swipe-to-open` and/or `property@Flap:swipe-to-close` are set
    to `TRUE`.
    
    Optionally, a separator can be provided, which would be displayed between
    the content and the flap when there's no shadow to separate them, depending
    on the transition type.
    
    `property@Flap:flap` is transparent by default; add the
    [`.background`](style-classes.html#background) style class to it if this is
    unwanted.
    
    If `property@Flap:modal` is set to `TRUE`, content becomes completely
    inaccessible when the flap is revealed while folded.
    
    The position of the flap and separator children relative to the content is
    determined by orientation, as well as the `property@Flap:flap-position`
    value.
    
    Folding the flap will automatically hide the flap widget, and unfolding it
    will automatically reveal it. If this behavior is not desired, the
    `property@Flap:locked` property can be used to override it.
    
    Common use cases include sidebars, header bars that need to be able to
    overlap the window content (for example, in fullscreen mode) and bottom
    sheets.
    
    ## AdwFlap as GtkBuildable
    
    The [adw.flap.Flap] implementation of the [gtk.buildable.Buildable] interface supports
    setting the flap child by specifying “flap” as the “type” attribute of a
    `<child>` element, and separator by specifying “separator”. Specifying
    “content” child type or omitting it results in setting the content child.
    
    ## CSS nodes
    
    [adw.flap.Flap] has a single CSS node with name `flap`. The node will get the style
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
    
    [adw.header_bar.HeaderBar] is similar to [gtk.header_bar.HeaderBar], but provides additional
    features compared to it. Refer to [gtk.header_bar.HeaderBar] for details. It is typically
    used as a top bar within `class@ToolbarView`.
    
    ## Dialog Integration
    
    When placed inside an `class@Dialog`, [adw.header_bar.HeaderBar] will display the dialog
    title intead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    `property@HeaderBar:show-start-title-buttons` and
    `property@HeaderBar:show-end-title-buttons` to `FALSE` to remove it if it's
    unwanted.
    
    ## Navigation View Integration
    
    When placed inside an `class@NavigationPage`, [adw.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with `class@NavigationView` or `class@NavigationSplitView`,
    it will also display a back button that can be used to go back to the previous
    page. The button also has a context menu, allowing to pop multiple pages at
    once, potentially across multiple navigation views.
    
    Set `property@HeaderBar:show-back-button` to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    ## Split View Integration
    
    When placed inside `class@NavigationSplitView` or `class@OverlaySplitView`,
    [adw.header_bar.HeaderBar] will automatically hide the title buttons other than at the
    edges of the window.
    
    ## Centering Policy
    
    `property@HeaderBar:centering-policy` allows to enforce strict centering of
    the title widget. This can be useful for entries inside `class@Clamp`.
    
    ## Title Buttons
    
    Unlike [gtk.header_bar.HeaderBar], [adw.header_bar.HeaderBar] allows to toggle title button
    visibility for each side individually, using the
    `property@HeaderBar:show-start-title-buttons` and
    `property@HeaderBar:show-end-title-buttons` properties.
    
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
    
    [adw.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains three `widget`
    subnodes at the start, center and end of the header bar. The start and end
    subnotes contain a `box` subnode with the `.start` and `.end` style classes
    respectively, and the center node contains a node that represents the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gtk.window_controls.WindowControls] for details, as well as other children.
    
    When `property@HeaderBar:show-back-button` is `TRUE`, the start box also
    contains a node with the name `widget` that contains a node with the name
    `button` and `.back` style class.
    
    ## Accessibility
    
    [adw.header_bar.HeaderBar] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwHeaderBar;

/** */
struct AdwHeaderBarClass
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
    
    The [adw.leaflet.Leaflet] widget can display its children like a [gtk.box.Box] does
    or like a [gtk.stack.Stack] does, adapting to size changes by switching
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
    
    [adw.leaflet.Leaflet] has a single CSS node with name `leaflet`. The node will get the
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
    An auxiliary class used by `class@Leaflet`.

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
    `signal@MessageDialog::response` signal will be emitted. This signal is
    detailed, and the detail, as well as the `response` parameter will be set to
    the ID of the activated response, or to the value of the
    `property@MessageDialog:close-response` property if the dialog had been
    closed without activating any of the responses.
    
    Response buttons can be presented horizontally or vertically depending on
    available space.
    
    When a response is activated, [adw.message_dialog.MessageDialog] is closed automatically.
    
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
    
    [adw.message_dialog.MessageDialog] can also be used via the [adw.message_dialog.MessageDialog.choose]
    method. This API follows the GIO async pattern, and the result can be
    obtained by calling [adw.message_dialog.MessageDialog.chooseFinish], for example:
    
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
    
    [adw.message_dialog.MessageDialog] supports adding responses in UI definitions by via the
    `<responses>` element that may contain multiple `<response>` elements, each
    respresenting a response.
    
    Each of the `<response>` elements must have the `id` attribute specifying the
    response ID. The contents of the element are used as the response label.
    
    Response labels can be translated with the usual `translatable`, `context`
    and `comments` attributes.
    
    The `<response>` elements can also have `enabled` and/or `appearance`
    attributes. See [adw.message_dialog.MessageDialog.setResponseEnabled] and
    [adw.message_dialog.MessageDialog.setResponseAppearance] for details.
    
    Example of an [adw.message_dialog.MessageDialog] UI definition:
    
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
    
    [adw.message_dialog.MessageDialog] uses the [gtk.types.AccessibleRole.Dialog] role.
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
    A page within `class@NavigationView` or `class@NavigationSplitView`.
    
    Each page has a child widget, a title and optionally a tag.
    
    The `signal@NavigationPage::showing`, `signal@NavigationPage::shown`,
    `signal@NavigationPage::hiding` and `signal@NavigationPage::hidden` signals
    can be used to track the page's visibility within its [adw.navigation_view.NavigationView].
    
    ## Header Bar Integration
    
    When placed inside [adw.navigation_page.NavigationPage], `class@HeaderBar` will display the
    page title instead of window title.
    
    When used together with `class@NavigationView`, it will also display a back
    button that can be used to go back to the previous page. Set
    `property@HeaderBar:show-back-button` to `FALSE` to disable that behavior if
    it's unwanted.
    
    ## CSS Nodes
    
    [adw.navigation_page.NavigationPage] has a single CSS node with name
    `navigation-view-page`.
    
    ## Accessibility
    
    [adw.navigation_page.NavigationPage] uses the [gtk.types.AccessibleRole.Group] role.
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
    
    [adw.navigation_split_view.NavigationSplitView] has two `class@NavigationPage` children: sidebar and
    content, and displays them side by side.
    
    When `property@NavigationSplitView:collapsed` is set to `TRUE`, it instead
    puts both children inside an `class@NavigationView`. The
    `property@NavigationSplitView:show-content` controls which child is visible
    while collapsed.
    
    See also `class@OverlaySplitView`.
    
    [adw.navigation_split_view.NavigationSplitView] is typically used together with an `class@Breakpoint`
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">280</property>
      <property name="height-request">200</property>
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
    
    When not collapsed, [adw.navigation_split_view.NavigationSplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the `property@NavigationSplitView:sidebar-width-fraction` property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    `property@NavigationSplitView:min-sidebar-width` and
    `property@NavigationSplitView:max-sidebar-width` properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    `property@NavigationSplitView:sidebar-width-unit`.
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    ## Header Bar Integration
    
    When used inside [adw.navigation_split_view.NavigationSplitView], `class@HeaderBar` will
    automatically hide the window buttons in the middle.
    
    When collapsed, it also displays a back button for the content widget, as
    well as the page titles. See `class@NavigationView` documentation for details.
    
    ## Actions
    
    [adw.navigation_split_view.NavigationSplitView] defines the same actions as [adw.navigation_view.NavigationView], but
    they can be used even when the split view is not collapsed:
    
    $(LIST
      * `navigation.push` takes a string parameter specifying the tag of the page
    )
    to push. If it matches the tag of the content widget, it sets
    `property@NavigationSplitView:show-content` to `TRUE`.
    
    $(LIST
      * `navigation.pop` doesn't take any parameters and sets
    )
    `property@NavigationSplitView:show-content` to `FALSE`.
    
    ## [adw.navigation_split_view.NavigationSplitView] as [gtk.buildable.Buildable]
    
    The [adw.navigation_split_view.NavigationSplitView] implementation of the [gtk.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [adw.navigation_split_view.NavigationSplitView] has a single CSS node with the name
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
    
    [adw.navigation_split_view.NavigationSplitView] uses the [gtk.types.AccessibleRole.Group] role.
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
    
    [adw.navigation_view.NavigationView] presents one child at a time, similar to
    [gtk.stack.Stack].
    
    [adw.navigation_view.NavigationView] can only contain `class@NavigationPage` children.
    
    It maintains a navigation stack that can be controlled with
    [adw.navigation_view.NavigationView.push] and [adw.navigation_view.NavigationView.pop]. The whole
    navigation stack can also be replaced using [adw.navigation_view.NavigationView.replace].
    
    [adw.navigation_view.NavigationView] allows to manage pages statically or dynamically.
    
    Static pages can be added using the [adw.navigation_view.NavigationView.add] method. The
    [adw.navigation_view.NavigationView] will keep a reference to these pages, but they aren't
    accessible to the user until [adw.navigation_view.NavigationView.push] is called (except
    for the first page, which is pushed automatically). Use the
    [adw.navigation_view.NavigationView.remove] method to remove them. This is useful for
    applications that have a small number of unique pages and just need
    navigation between them.
    
    Dynamic pages are automatically destroyed once they are popped off the
    navigation stack. To add a page like this, push it using the
    [adw.navigation_view.NavigationView.push] method without calling
    [adw.navigation_view.NavigationView.add] first.
    
    ## Tags
    
    Static pages, as well as any pages in the navigation stack, can be accessed
    by their `property@NavigationPage:tag`. For example,
    [adw.navigation_view.NavigationView.pushByTag] can be used to push a static page that's
    not in the navigation stack without having to keep a reference to it manually.
    
    ## Header Bar Integration
    
    When used inside [adw.navigation_view.NavigationView], `class@HeaderBar` will automatically
    display a back button that can be used to go back to the previous page when
    possible. The button also has a context menu, allowing to pop multiple pages
    at once, potentially across multiple navigation views.
    
    Set `property@HeaderBar:show-back-button` to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    [adw.header_bar.HeaderBar] will also display the title of the [adw.navigation_page.NavigationPage] it's
    placed into, so most applications shouldn't need to customize it at all.
    
    ## Shortcuts and Gestures
    
    [adw.navigation_view.NavigationView] supports the following shortcuts for going to the
    previous page:
    
    $(LIST
      * <kbd>Escape</kbd> (unless `property@NavigationView:pop-on-escape` is set to
        `FALSE`)
      * <kbd>Alt</kbd>+<kbd>←</kbd>
      * Back mouse button
    )
      
    Additionally, it supports interactive gestures:
    
    $(LIST
      * One-finger swipe towards the right on touchscreens
      * Scrolling towards the right on touchpads (usually two-finger swipe)
    )
      
    These gestures have transitions enabled regardless of the
    `property@NavigationView:animate-transitions` value.
    
    Applications can also enable shortcuts for pushing another page onto the
    navigation stack via connecting to the `signal@NavigationView::get-next-page`
    signal, in that case the following shortcuts are supported:
    
    $(LIST
      * <kbd>Alt</kbd>+<kbd>→</kbd>
      * Forward mouse button
      * Swipe/scrolling towards the left
    )
      
    For right-to-left locales, the gestures and shortcuts are reversed.
    
    `property@NavigationPage:can-pop` can be used to disable them, along with the
    header bar back buttons.
    
    ## Actions
    
    [adw.navigation_view.NavigationView] defines actions for controlling the navigation stack.
    actions for controlling the navigation stack:
    
    $(LIST
      * `navigation.push` takes a string parameter specifying the tag of the page to
    )
    push, and is equivalent to calling [adw.navigation_view.NavigationView.pushByTag].
    
    $(LIST
      * `navigation.pop` doesn't take any parameters and pops the current page from
    )
    the navigation stack, equivalent to calling [adw.navigation_view.NavigationView.pop].
    
    ## [adw.navigation_view.NavigationView] as [gtk.buildable.Buildable]
    
    [adw.navigation_view.NavigationView] allows to add pages as children, equivalent to using the
    [adw.navigation_view.NavigationView.add] method.
    
    Example of an [adw.navigation_view.NavigationView] UI definition:
    
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
    
    [adw.navigation_view.NavigationView] has a single CSS node with the name `navigation-view`.
    
    ## Accessibility
    
    [adw.navigation_view.NavigationView] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwNavigationView;

/** */
struct AdwNavigationViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

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
    
    [adw.overlay_split_view.OverlaySplitView] has two children: sidebar and content, and displays
    them side by side.
    
    When `property@OverlaySplitView:collapsed` is set to `TRUE`, the sidebar is
    instead shown as an overlay above the content widget.
    
    The sidebar can be hidden or shown using the
    `property@OverlaySplitView:show-sidebar` property.
    
    Sidebar can be displayed before or after the content, this can be controlled
    with the `property@OverlaySplitView:sidebar-position` property.
    
    Collapsing the split view automatically hides the sidebar widget, and
    uncollapsing it shows the sidebar. If this behavior is not desired, the
    `property@OverlaySplitView:pin-sidebar` property can be used to override it.
    
    [adw.overlay_split_view.OverlaySplitView] supports an edge swipe gesture for showing the sidebar,
    and a swipe from the sidebar for hiding it. Gestures are only supported on
    touchscreen, but not touchpad. Gestures can be controlled with the
    `property@OverlaySplitView:enable-show-gesture` and
    `property@OverlaySplitView:enable-hide-gesture` properties.
    
    See also `class@NavigationSplitView`.
    
    [adw.overlay_split_view.OverlaySplitView] is typically used together with an `class@Breakpoint`
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    [adw.overlay_split_view.OverlaySplitView] is often used for implementing the
    [utility pane](https://developer.gnome.org/hig/patterns/containers/utility-panes.html)
    pattern.
    
    ## Sizing
    
    When not collapsed, [adw.overlay_split_view.OverlaySplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the `property@OverlaySplitView:sidebar-width-fraction` property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    `property@OverlaySplitView:min-sidebar-width` and
    `property@OverlaySplitView:max-sidebar-width` properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    `property@OverlaySplitView:sidebar-width-unit`.
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    When collapsed, the preferred width fraction is ignored and the sidebar uses
    `property@OverlaySplitView:max-sidebar-width` when possible.
    
    ## Header Bar Integration
    
    When used inside [adw.overlay_split_view.OverlaySplitView], `class@HeaderBar` will automatically
    hide the window buttons in the middle.
    
    ## [adw.overlay_split_view.OverlaySplitView] as [gtk.buildable.Buildable]
    
    The [adw.overlay_split_view.OverlaySplitView] implementation of the [gtk.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [adw.overlay_split_view.OverlaySplitView] has a single CSS node with the name
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
    
    [adw.overlay_split_view.OverlaySplitView] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwOverlaySplitView;

/** */
struct AdwOverlaySplitViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A `class@EntryRow` tailored for entering secrets.
    
    <picture>
      <source srcset="password-entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="password-entry-row.png" alt="password-entry-row">
    </picture>
    
    It does not show its contents in clear text, does not allow to copy it to the
    clipboard, and shows a warning when Caps Lock is engaged. If the underlying
    platform allows it, [adw.password_entry_row.PasswordEntryRow] will also place the text in a
    non-pageable memory area, to avoid it being written out to disk by the
    operating system.
    
    It offer a way to reveal the contents in clear text.
    
    ## CSS Nodes
    
    [adw.password_entry_row.PasswordEntryRow] has a single CSS node with name `row` that carries
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
    
    The [adw.preferences_dialog.PreferencesDialog] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## CSS nodes
    
    [adw.preferences_dialog.PreferencesDialog] has a main CSS node with the name `dialog` and the
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
    
    An [adw.preferences_group.PreferencesGroup] represents a group or tightly related preferences,
    which in turn are represented by `class@PreferencesRow`.
    
    To summarize the role of the preferences it gathers, a group can have both a
    title and a description. The title will be used by `class@PreferencesDialog`
    to let the user look for a preference.
    
    ## AdwPreferencesGroup as GtkBuildable
    
    The [adw.preferences_group.PreferencesGroup] implementation of the [gtk.buildable.Buildable] interface
    supports adding `class@PreferencesRow`s to the list by omitting "type". If "type"
    is omitted and the widget isn't a `class@PreferencesRow` the child is added to
    a box below the list.
    
    When the "type" attribute of a child is `header-suffix`, the child
    is set as the suffix on the end of the title and description.
    
    ## CSS nodes
    
    [adw.preferences_group.PreferencesGroup] has a single CSS node with name `preferencesgroup`.
    
    ## Accessibility
    
    [adw.preferences_group.PreferencesGroup] uses the [gtk.types.AccessibleRole.Group] role.
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
    A page from `class@PreferencesDialog`.
    
    <picture>
      <source srcset="preferences-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-page.png" alt="preferences-page">
    </picture>
    
    The [adw.preferences_page.PreferencesPage] widget gathers preferences groups into a single page
    of a preferences window.
    
    ## CSS nodes
    
    [adw.preferences_page.PreferencesPage] has a single CSS node with name `preferencespage`.
    
    ## Accessibility
    
    [adw.preferences_page.PreferencesPage] uses the [gtk.types.AccessibleRole.Group] role.
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
    A [gtk.list_box_row.ListBoxRow] used to present preferences.
    
    The [adw.preferences_row.PreferencesRow] widget has a title that `class@PreferencesDialog`
    will use to let the user look for a preference. It doesn't present the title
    in any way and lets you present the preference as you please.
    
    `class@ActionRow` and its derivatives are convenient to use as preference
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
    
    The [adw.preferences_window.PreferencesWindow] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## CSS nodes
    
    [adw.preferences_window.PreferencesWindow] has a main CSS node with the name `window` and the
    style class `.preferences`.
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
    An `class@AnimationTarget` changing the value of a property of a
    [gobject.object.ObjectWrap] instance.
*/
struct AdwPropertyAnimationTarget;

/** */
struct AdwPropertyAnimationTargetClass;

/**
    An `class@ActionRow` with an embedded spin button.
    
    <picture>
      <source srcset="spin-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spin-row.png" alt="spin-row">
    </picture>
    
    Example of an [adw.spin_row.SpinRow] UI definition:
    
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
    
    See [gtk.spin_button.SpinButton] for details.
    
    ## CSS nodes
    
    [adw.spin_row.SpinRow] has the same structure as `class@ActionRow`, as well as the
    `.spin` style class on the main node.
    
    ## Accessibility
    
    [adw.spin_row.SpinRow] uses an internal [gtk.spin_button.SpinButton] with the
    [gtk.types.AccessibleRole.SpinButton] role.
*/
struct AdwSpinRow;

/** */
struct AdwSpinRowClass
{
  /** */
  AdwActionRowClass parentClass;
}

/**
    A combined button and dropdown widget.
    
    <picture>
      <source srcset="split-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="split-button.png" alt="split-button">
    </picture>
    
    [adw.split_button.SplitButton] is typically used to present a set of actions in a menu,
    but allow access to one of them with a single click.
    
    The API is very similar to [gtk.button.Button] and [gtk.menu_button.MenuButton], see
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
    
    [adw.split_button.SplitButton]'s CSS node is called `splitbutton`. It contains the css
    nodes: `button`, `separator`, `menubutton`. See [gtk.menu_button.MenuButton]
    documentation for the `menubutton` contents.
    
    The main CSS node will contain the `.image-button` or `.text-button` style
    classes matching the button contents. The nested button nodes will never
    contain them.
    
    ## Accessibility
    
    [adw.split_button.SplitButton] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwSplitButton;

/** */
struct AdwSplitButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A spring-based `class@Animation`.
    
    [adw.spring_animation.SpringAnimation] implements an animation driven by a physical model of a
    spring described by `struct@SpringParams`, with a resting position in
    `property@SpringAnimation:value-to`, stretched to
    `property@SpringAnimation:value-from`.
    
    Since the animation is physically simulated, spring animations don't have a
    fixed duration. The animation will stop when the simulated spring comes to a
    rest - when the amplitude of the oscillations becomes smaller than
    `property@SpringAnimation:epsilon`, or immediately when it reaches
    `property@SpringAnimation:value-to` if
    `property@SpringAnimation:clamp` is set to `TRUE`. The estimated duration can
    be obtained with `property@SpringAnimation:estimated-duration`.
    
    Due to the nature of spring-driven motion the animation can overshoot
    `property@SpringAnimation:value-to` before coming to a rest. Whether the
    animation will overshoot or not depends on the damping ratio of the spring.
    See `struct@SpringParams` for more information about specific damping ratio
    values.
    
    If `property@SpringAnimation:clamp` is `TRUE`, the animation will abruptly
    end as soon as it reaches the final value, preventing overshooting.
    
    Animations can have an initial velocity value, set via
    `property@SpringAnimation:initial-velocity`, which adjusts the curve without
    changing the duration. This makes spring animations useful for deceleration
    at the end of gestures.
    
    If the initial and final values are equal, and the initial velocity is not 0,
    the animation value will bounce and return to its resting position.
*/
struct AdwSpringAnimation;

/** */
struct AdwSpringAnimationClass;

/**
    Physical parameters of a spring for `class@SpringAnimation`.
    
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
    
    $(LIST
      * 0: an undamped spring.
      * Between 0 and 1: an underdamped spring.
      * 1: a critically damped spring.
      * Larger than 1: an overdamped spring.
    )
      
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
    
    The [adw.squeezer.Squeezer] widget is a container which only shows the first of its
    children that fits in the available size. It is convenient to offer different
    widgets to represent the same data with different levels of detail, making
    the widget seem to squeeze itself to fit in the available space.
    
    Transitions between children can be animated as fades. This can be controlled
    with `property@Squeezer:transition-type`.
    
    ## CSS nodes
    
    [adw.squeezer.Squeezer] has a single CSS node with name `squeezer`.

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
    An auxiliary class used by `class@Squeezer`.

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
    
    The [adw.status_page.StatusPage] widget can have an icon, a title, a description and a
    custom widget which is displayed below them.
    
    ## CSS nodes
    
    [adw.status_page.StatusPage] has a main CSS node with name `statuspage`.
    
    [adw.status_page.StatusPage] can use the
    [`.compact`](style-classes.html#compact-status-page) style class for when it
    needs to fit into a small space such a sidebar or a popover.
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
    
    [adw.style_manager.StyleManager] provides a way to query and influence the application
    styles, such as whether to use dark or high contrast appearance.
    
    It allows to set the color scheme via the
    `property@StyleManager:color-scheme` property, and to query the current
    appearance, as well as whether a system-wide color scheme preference exists.
*/
struct AdwStyleManager;

/** */
struct AdwStyleManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A swipe tracker used in `class@Carousel`, `class@NavigationView` and
    `class@OverlaySplitView`.
    
    The [adw.swipe_tracker.SwipeTracker] object can be used for implementing widgets with swipe
    gestures. It supports touch-based swipes, pointer dragging, and touchpad
    scrolling.
    
    The widgets will probably want to expose the `property@SwipeTracker:enabled`
    property. If they expect to use horizontal orientation,
    `property@SwipeTracker:reversed` can be used for supporting RTL text
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
    
    The [adw.swipeable.Swipeable] interface is implemented by all swipeable widgets.
    
    See `class@SwipeTracker` for details about implementing it.
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
    A [gtk.list_box_row.ListBoxRow] used to represent two states.
    
    <picture>
      <source srcset="switch-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="switch-row.png" alt="switch-row">
    </picture>
    
    The [adw.switch_row.SwitchRow] widget contains a [gtk.switch_.Switch] that allows the user
    to select between two states: "on" or "off". When activated, the row will
    invert its active state.
    
    The user can control the switch by activating the row or by dragging on the
    switch handle.
    
    See [gtk.switch_.Switch] for details.
    
    Example of an [adw.switch_row.SwitchRow] UI definition:
    ```xml
    <object class="AdwSwitchRow">
      <property name="title" translatable="yes">Switch Row</property>
      <signal name="notify::active" handler="switch_row_notify_active_cb"/>
    </object>
    ```
    
    The `property@SwitchRow:active` property should be connected to in order to
    monitor changes to the active state.
    
    ## Accessibility
    
    [adw.switch_row.SwitchRow] uses the [gtk.types.AccessibleRole.Switch] role.
*/
struct AdwSwitchRow;

/** */
struct AdwSwitchRowClass
{
  /** */
  AdwActionRowClass parentClass;
}

/**
    A tab bar for `class@TabView`.
    
    <picture>
      <source srcset="tab-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-bar.png" alt="tab-bar">
    </picture>
    
    The [adw.tab_bar.TabBar] widget is a tab bar that can be used with conjunction with
    [adw.tab_view.TabView]. It is typically used as a top bar within `class@ToolbarView`.
    
    [adw.tab_bar.TabBar] can autohide and can optionally contain action widgets on both
    sides of the tabs.
    
    When there's not enough space to show all the tabs, [adw.tab_bar.TabBar] will scroll
    them. Pinned tabs always stay visible and aren't a part of the scrollable
    area.
    
    ## CSS nodes
    
    [adw.tab_bar.TabBar] has a single CSS node with name `tabbar`.
*/
struct AdwTabBar;

/** */
struct AdwTabBarClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A button that displays the number of `class@TabView` pages.
    
    <picture>
      <source srcset="tab-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-button.png" alt="tab-button">
    </picture>
    
    [adw.tab_button.TabButton] is a button that displays the number of pages in a given
    [adw.tab_view.TabView], as well as whether one of the inactive pages needs attention.
    
    It's intended to be used as a visible indicator when there's no visible tab
    bar, typically opening an `class@TabOverview` on click, e.g. via the
    `overview.open` action name:
    
    ```xml
    <object class="AdwTabButton">
      <property name="view">view</property>
      <property name="action-name">overview.open</property>
    </object>
    ```
    
    ## CSS nodes
    
    [adw.tab_button.TabButton] has a main CSS node with name `tabbutton`.
    
    # Accessibility
    
    [adw.tab_button.TabButton] uses the [gtk.types.AccessibleRole.Button] role.
*/
struct AdwTabButton;

/** */
struct AdwTabButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A tab overview for `class@TabView`.
    
    <picture>
      <source srcset="tab-overview-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-overview.png" alt="tab-overview">
    </picture>
    
    [adw.tab_overview.TabOverview] is a widget that can display tabs from an [adw.tab_view.TabView] in a
    grid.
    
    [adw.tab_overview.TabOverview] shows a thumbnail for each tab. By default thumbnails are
    static for all pages except the selected one. They can be made always live
    by setting `property@TabPage:live-thumbnail` to `TRUE`, or refreshed with
    [adw.tab_page.TabPage.invalidateThumbnail] or
    [adw.tab_view.TabView.invalidateThumbnails] otherwise.
    
    If the pages are too tall or too wide, the thumbnails will be cropped; use
    `property@TabPage:thumbnail-xalign` and `property@TabPage:thumbnail-yalign` to
    control which part of the page should be visible in this case.
    
    Pinned tabs are shown as smaller cards without thumbnails above the other
    tabs. Unlike in `class@TabBar`, they still have titles, as well as an unpin
    button.
    
    [adw.tab_overview.TabOverview] provides search in open tabs. It searches in tab titles and
    tooltips, as well as `property@TabPage:keyword`.
    
    If `property@TabOverview:enable-new-tab` is set to `TRUE`, a new tab button
    will be shown. Connect to the `signal@TabOverview::create-tab` signal to use
    it.
    
    `property@TabOverview:secondary-menu` can be used to provide a secondary menu
    for the overview. Use it to add extra actions, e.g. to open a new window or
    undo closed tab.
    
    [adw.tab_overview.TabOverview] is intended to be used as the direct child of the window,
    with the rest of the window contents set as the `property@TabOverview:child`.
    The child is expected to contain an `class@TabView`.
    
    [adw.tab_overview.TabOverview] shows window buttons by default. They can be disabled by
    setting `property@TabOverview:show-start-title-buttons` and/or
    `property@TabOverview:show-start-title-buttons` and/or
    `property@TabOverview:show-end-title-buttons` to `FALSE`.
    
    If search and window buttons are disabled, and secondary menu is not set, the
    header bar will be hidden.
    
    ## Actions
    
    [adw.tab_overview.TabOverview] defines the `overview.open` and `overview.close` actions for
    opening and closing itself. They can be convenient when used together with
    `class@TabButton`.
    
    ## CSS nodes
    
    [adw.tab_overview.TabOverview] has a single CSS node with name `taboverview`.
*/
struct AdwTabOverview;

/** */
struct AdwTabOverviewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by `class@TabView`.
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
    
    [adw.tab_view.TabView] is a container which shows one child at a time. While it
    provides keyboard shortcuts for switching between pages, it does not provide
    a visible tab switcher and relies on external widgets for that, such as
    `class@TabBar`, `class@TabOverview` and `class@TabButton`.
    
    [adw.tab_view.TabView] maintains a `class@TabPage` object for each page, which holds
    additional per-page properties. You can obtain the [adw.tab_page.TabPage] for a page
    with [adw.tab_view.TabView.getPage], and as the return value for
    [adw.tab_view.TabView.append] and other functions for adding children.
    
    [adw.tab_view.TabView] only aims to be useful for dynamic tabs in multi-window
    document-based applications, such as web browsers, file managers, text
    editors or terminals. It does not aim to replace [gtk.notebook.Notebook] for use
    cases such as tabbed dialogs.
    
    As such, it does not support disabling page reordering or detaching.
    
    [adw.tab_view.TabView] adds a number of global page switching and reordering shortcuts.
    The `property@TabView:shortcuts` property can be used to manage them.
    
    See `flags@TabViewShortcuts` for the list of the available shortcuts. All of
    the shortcuts are enabled by default.
    
    [adw.tab_view.TabView.addShortcuts] and [adw.tab_view.TabView.removeShortcuts] can be
    used to manage shortcuts in a convenient way, for example:
    
    ```c
    adw_tab_view_remove_shortcuts (view, ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME |
                                         ADW_TAB_VIEW_SHORTCUT_CONTROL_END);
    ```
    
    ## CSS nodes
    
    [adw.tab_view.TabView] has a main CSS node with the name `tabview`.
    
    ## Accessibility
    
    [adw.tab_view.TabView] uses the [gtk.types.AccessibleRole.TabPanel] for the tab pages which
    are the accessible parent objects of the child widgets.
*/
struct AdwTabView;

/** */
struct AdwTabViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A time-based `class@Animation`.
    
    [adw.timed_animation.TimedAnimation] implements a simple animation interpolating the given
    value from `property@TimedAnimation:value-from` to
    `property@TimedAnimation:value-to` over
    `property@TimedAnimation:duration` milliseconds using the curve described by
    `property@TimedAnimation:easing`.
    
    If `property@TimedAnimation:reverse` is set to `TRUE`, [adw.timed_animation.TimedAnimation]
    will instead animate from `property@TimedAnimation:value-to` to
    `property@TimedAnimation:value-from`, and the easing curve will be inverted.
    
    The animation can repeat a certain amount of times, or endlessly, depending
    on the `property@TimedAnimation:repeat-count` value. If
    `property@TimedAnimation:alternate` is set to `TRUE`, it will also change the
    direction every other iteration.
*/
struct AdwTimedAnimation;

/** */
struct AdwTimedAnimationClass;

/**
    A helper object for `class@ToastOverlay`.
    
    Toasts are meant to be passed into [adw.toast_overlay.ToastOverlay.addToast] as
    follows:
    
    ```c
    adw_toast_overlay_add_toast (overlay, adw_toast_new (_("Simple Toast")));
    ```
    
    <picture>
      <source srcset="toast-simple-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toast-simple.png" alt="toast-simple">
    </picture>
    
    Toasts always have a close button. They emit the `signal@Toast::dismissed`
    signal when disappearing.
    
    `property@Toast:timeout` determines how long the toast stays on screen, while
    `property@Toast:priority` determines how it behaves if another toast is
    already being displayed.
    
    Toast titles use Pango markup by default, set `property@Toast:use-markup` to
    `FALSE` if this is unwanted.
    
    `property@Toast:custom-title` can be used to replace the title label with a
    custom widget.
    
    ## Actions
    
    Toasts can have one button on them, with a label and an attached
    [gio.action.Action].
    
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
    
    Toasts can be modified after they have been shown. For this, an [adw.toast.Toast]
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
    
    Much like [gtk.overlay.Overlay], [adw.toast_overlay.ToastOverlay] is a container with a single
    main child, on top of which it can display a `class@Toast`, overlaid.
    Toasts can be shown with [adw.toast_overlay.ToastOverlay.addToast].
    
    See `class@Toast` for details.
    
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
    
    [adw.toast_overlay.ToastOverlay]'s CSS node is called `toastoverlay`. It contains the child,
    as well as zero or more `toast` subnodes.
    
    Each of the `toast` nodes contains a `widget` subnode, optionally a `button`
    subnode, and another `button` subnode with `.circular` and `.flat` style
    classes.
    
    The `widget` subnode contains a `label` subnode with the `.heading` style
    class, or a custom widget provided by the application.
    
    ## Accessibility
    
    [adw.toast_overlay.ToastOverlay] uses the `GTK_ACCESSIBLE_ROLE_TAB_GROUP` role.
*/
struct AdwToastOverlay;

/** */
struct AdwToastOverlayClass
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
    
    [adw.toolbar_view.ToolbarView] has a single content widget and one or multiple top and
    bottom bars, shown at the top and bottom sides respectively.
    
    Example of an [adw.toolbar_view.ToolbarView] UI definition:
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
    
    $(LIST
      * `class@HeaderBar`
      * `class@TabBar`
      * `class@ViewSwitcherBar`
      * [gtk.action_bar.ActionBar]
      * [gtk.header_bar.HeaderBar]
      * [gtk.popover_menu_bar.PopoverMenuBar]
      * [gtk.search_bar.SearchBar]
      * Any [gtk.box.Box] or a similar widget with the
        [`.toolbar`](style-classes.html#toolbars) style class
    )
      
    By default, top and bottom bars are flat and scrolling content has a subtle
    undershoot shadow, same as when using the
    [`.undershoot-top`](style-classes.html#undershoot-indicators) and
    [`.undershoot-bottom`](style-classes.html#undershoot-indicators) style
    classes. This works well in most cases, e.g. with `class@StatusPage` or
    `class@PreferencesPage`, where the background at the top and bottom parts of
    the page is uniform. Additionally, windows with sidebars should always use
    this style.
    
    `property@ToolbarView:top-bar-style` and
    `property@ToolbarView:bottom-bar-style` properties can be used add an opaque
    background and a persistent shadow to top and bottom bars, this can be useful
    for content such as [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
    where some elements are adjacent to the top/bottom bars, or `class@TabView`,
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
    
    [adw.toolbar_view.ToolbarView] ensures the top and bottom bars have consistent backdrop
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
    to putting them into a [gtk.window_handle.WindowHandle].
    
    Content is typically place between top and bottom bars, but can also extend
    behind them. This is controlled with the
    `property@ToolbarView:extend-content-to-top-edge` and
    `property@ToolbarView:extend-content-to-bottom-edge` properties.
    
    Top and bottom bars can be hidden and revealed with an animation using the
    `property@ToolbarView:reveal-top-bars` and
    `property@ToolbarView:reveal-bottom-bars` properties.
    
    ## [adw.toolbar_view.ToolbarView] as [gtk.buildable.Buildable]
    
    The [adw.toolbar_view.ToolbarView] implementation of the [gtk.buildable.Buildable] interface
    supports adding a top bar by specifying “top” as the “type” attribute of a
    `<child>` element, or adding a bottom bar by specifying “bottom”.
    
    ## Accessibility
    
    [adw.toolbar_view.ToolbarView] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct AdwToolbarView;

/** */
struct AdwToolbarViewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A view container for `class@ViewSwitcher`.
    
    [adw.view_stack.ViewStack] is a container which only shows one page at a time.
    It is typically used to hold an application's main views.
    
    It doesn't provide a way to transition between pages.
    Instead, a separate widget such as `class@ViewSwitcher` can be used with
    [adw.view_stack.ViewStack] to provide this functionality.
    
    [adw.view_stack.ViewStack] pages can have a title, an icon, an attention request, and a
    numbered badge that `class@ViewSwitcher` will use to let users identify which
    page is which. Set them using the `property@ViewStackPage:title`,
    `property@ViewStackPage:icon-name`,
    `property@ViewStackPage:needs-attention`, and
    `property@ViewStackPage:badge-number` properties.
    
    Unlike [gtk.stack.Stack], transitions between views are not animated.
    
    [adw.view_stack.ViewStack] maintains a `class@ViewStackPage` object for each added child,
    which holds additional per-child properties. You obtain the
    `class@ViewStackPage` for a child with [adw.view_stack.ViewStack.getPage] and you
    can obtain a [gtk.selection_model.SelectionModel] containing all the pages with
    [adw.view_stack.ViewStack.getPages].
    
    ## AdwViewStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create
    `class@ViewStackPage` objects explicitly, and set the child widget as a
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
    
    [adw.view_stack.ViewStack] has a single CSS node named `stack`.
    
    ## Accessibility
    
    [adw.view_stack.ViewStack] uses the [gtk.types.AccessibleRole.TabPanel] for the stack pages
    which are the accessible parent objects of the child widgets.
*/
struct AdwViewStack;

/** */
struct AdwViewStackClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    An auxiliary class used by `class@ViewStack`.
*/
struct AdwViewStackPage;

/** */
struct AdwViewStackPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An auxiliary class used by `class@ViewStack`.
    
    See `property@ViewStack:pages`.
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
    contained in a `class@ViewStack` in a similar fashion to
    [gtk.stack_switcher.StackSwitcher].
    
    [adw.view_switcher.ViewSwitcher] buttons always have an icon and a label. They can be
    displayed side by side, or icon on top of the label. This can be controlled
    via the `property@ViewSwitcher:policy` property.
    
    [adw.view_switcher.ViewSwitcher] is intended to be used in a header bar together with
    `class@ViewSwitcherBar` at the bottom of the window, and a `class@Breakpoint`
    showing the view switcher bar on narrow sizes, while removing the view
    switcher from the header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    It's recommended to set `property@ViewSwitcher:policy` to
    [adw.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [adw.view_switcher.ViewSwitcher] has a single CSS node with name `viewswitcher`. It can have
    the style classes `.wide` and `.narrow`, matching its policy.
    
    ## Accessibility
    
    [adw.view_switcher.ViewSwitcher] uses the [gtk.types.AccessibleRole.TabList] role and uses the
    [gtk.types.AccessibleRole.Tab] for its buttons.
*/
struct AdwViewSwitcher;

/**
    A view switcher action bar.
    
    <picture>
      <source srcset="view-switcher-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-bar.png" alt="view-switcher-bar">
    </picture>
    
    An action bar letting you switch between multiple views contained in a
    `class@ViewStack`, via an `class@ViewSwitcher`. It is designed to be put at
    the bottom of a window and to be revealed only on really narrow windows, e.g.
    on mobile phones. It can't be revealed if there are less than two pages.
    
    [adw.view_switcher_bar.ViewSwitcherBar] is intended to be used together with
    [adw.view_switcher.ViewSwitcher] in a header bar, and a `class@Breakpoint` showing the view
    switcher bar on narrow sizes, while removing the view switcher from the
    header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    It's recommended to set `property@ViewSwitcher:policy` to
    [adw.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [adw.view_switcher_bar.ViewSwitcherBar] has a single CSS node with name` viewswitcherbar`.
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
    A view switcher title.
    
    <picture>
      <source srcset="view-switcher-title-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-title.png" alt="view-switcher-title">
    </picture>
    
    A widget letting you switch between multiple views contained by a
    `class@ViewStack` via an `class@ViewSwitcher`.
    
    It is designed to be used as the title widget of a `class@HeaderBar`, and
    will display the window's title when the window is too narrow to fit the view
    switcher e.g. on mobile phones, or if there are less than two views.
    
    In order to center the title in narrow windows, the header bar should have
    `property@HeaderBar:centering-policy` set to
    [adw.types.CenteringPolicy.Strict].
    
    [adw.view_switcher_title.ViewSwitcherTitle] is intended to be used together with
    `class@ViewSwitcherBar`.
    
    A common use case is to bind the `property@ViewSwitcherBar:reveal` property
    to `property@ViewSwitcherTitle:title-visible` to automatically reveal the
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
    
    [adw.view_switcher_title.ViewSwitcherTitle] has a single CSS node with name `viewswitchertitle`.

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
    
    The [adw.window.Window] widget is a subclass of [gtk.window.Window] which has no
    titlebar area. Instead, `class@ToolbarView` can be used together with
    `class@HeaderBar` or [gtk.header_bar.HeaderBar] as follows:
    
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
    
    Using [gtk.window.Window.titlebar] or [gtk.window.Window.child]
    is not supported and will result in a crash. Use `property@Window:content`
    instead.
    
    ## Dialogs
    
    [adw.window.Window] can contain `class@Dialog`. Use [adw.dialog.Dialog.present] with the
    window or a widget within a window to show a dialog.
    
    ## Breakpoints
    
    [adw.window.Window] can be used with `class@Breakpoint` the same way as
    `class@BreakpointBin`. Refer to that widget's documentation for details.
    
    Example:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    Like [adw.breakpoint_bin.BreakpointBin], if breakpoints are used, [adw.window.Window] doesn't have a
    minimum size, and `property@Gtk.Widget:width-request` and
    `property@Gtk.Widget:height-request` properties must be set manually.
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
    
    [adw.window_title.WindowTitle] shows a title and subtitle. It's intended to be used as the
    title child of [gtk.header_bar.HeaderBar] or `class@HeaderBar`.
    
    ## CSS nodes
    
    [adw.window_title.WindowTitle] has a single CSS node with name `windowtitle`.
*/
struct AdwWindowTitle;

/** */
struct AdwWindowTitleClass
{
  /** */
  GtkWidgetClass parentClass;
}

alias extern(C) void function(double value, void* userData) AdwAnimationTargetFunc;

