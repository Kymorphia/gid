/// C types for gtk3 library
module gtk.c.types;

public import gid.basictypes;
public import atk.c.types;
public import gdk.c.types;
public import xlib.c.types;

/**
    A #GtkAllocation-struct of a widget represents region
    which has been allocated to the widget by its parent. It is a subregion
    of its parents allocation. See
    [GtkWidget’s geometry management section][geometry-management] for
    more information.
*/
alias GtkAllocation = GdkRectangle;

/** */
alias GtkStock = char*;

/**
    Accelerator flags used with [gtk.accel_group.AccelGroup.connect].
*/
enum GtkAccelFlags : uint
{
  /**
      Accelerator is visible
  */
  Visible = 1,

  /**
      Accelerator not removable
  */
  Locked = 2,

  /**
      Mask
  */
  Mask = 7,
}

/**
    Controls how a widget deals with extra space in a single (x or y)
    dimension.
    
    Alignment only matters if the widget receives a “too large” allocation,
    for example if you packed the widget with the #GtkWidget:expand
    flag inside a #GtkBox, then the widget might get extra space.  If
    you have for example a 16x16 icon inside a 32x32 space, the icon
    could be scaled and stretched, it could be centered, or it could be
    positioned to one side of the space.
    
    Note that in horizontal context @GTK_ALIGN_START and @GTK_ALIGN_END
    are interpreted relative to text direction.
    
    GTK_ALIGN_BASELINE support for it is optional for containers and widgets, and
    it is only supported for vertical alignment.  When its not supported by
    a child or a container it is treated as @GTK_ALIGN_FILL.
*/
enum GtkAlign
{
  /**
      stretch to fill all space if possible, center if
          no meaningful way to stretch
  */
  Fill = 0,

  /**
      snap to left or top side, leaving space on right
          or bottom
  */
  Start = 1,

  /**
      snap to right or bottom side, leaving space on left
          or top
  */
  End = 2,

  /**
      center natural width of widget inside the
          allocation
  */
  Center = 3,

  /**
      align the widget according to the baseline. Since 3.10.
  */
  Baseline = 4,
}

/**
    Types of user actions that may be blocked by [gtk.application.Application.inhibit].
*/
enum GtkApplicationInhibitFlags : uint
{
  /**
      Inhibit ending the user session
          by logging out or by shutting down the computer
  */
  Logout = 1,

  /**
      Inhibit user switching
  */
  Switch = 2,

  /**
      Inhibit suspending the
          session or computer
  */
  Suspend = 4,

  /**
      Inhibit the session being
          marked as idle (and possibly locked)
  */
  Idle = 8,
}

/**
    Used to specify the placement of scroll arrows in scrolling menus.
*/
enum GtkArrowPlacement
{
  /**
      Place one arrow on each end of the menu.
  */
  Both = 0,

  /**
      Place both arrows at the top of the menu.
  */
  Start = 1,

  /**
      Place both arrows at the bottom of the menu.
  */
  End = 2,
}

/**
    Used to indicate the direction in which an arrow should point.
*/
enum GtkArrowType
{
  /**
      Represents an upward pointing arrow.
  */
  Up = 0,

  /**
      Represents a downward pointing arrow.
  */
  Down = 1,

  /**
      Represents a left pointing arrow.
  */
  Left = 2,

  /**
      Represents a right pointing arrow.
  */
  Right = 3,

  /**
      No arrow. Since 2.10.
  */
  None = 4,
}

/**
    An enum for determining the page role inside the #GtkAssistant. It's
    used to handle buttons sensitivity and visibility.
    
    Note that an assistant needs to end its page flow with a page of type
    [gtk.types.AssistantPageType.Confirm], [gtk.types.AssistantPageType.Summary] or
    [gtk.types.AssistantPageType.Progress] to be correct.
    
    The Cancel button will only be shown if the page isn’t “committed”.
    See [gtk.assistant.Assistant.commit] for details.
*/
enum GtkAssistantPageType
{
  /**
      The page has regular contents. Both the
       Back and forward buttons will be shown.
  */
  Content = 0,

  /**
      The page contains an introduction to the
       assistant task. Only the Forward button will be shown if there is a
        next page.
  */
  Intro = 1,

  /**
      The page lets the user confirm or deny the
       changes. The Back and Apply buttons will be shown.
  */
  Confirm = 2,

  /**
      The page informs the user of the changes
       done. Only the Close button will be shown.
  */
  Summary = 3,

  /**
      Used for tasks that take a long time to
       complete, blocks the assistant until the page is marked as complete.
        Only the back button will be shown.
  */
  Progress = 4,

  /**
      Used for when other page types are not
       appropriate. No buttons will be shown, and the application must
       add its own buttons through [gtk.assistant.Assistant.addActionWidget].
  */
  Custom = 5,
}

/**
    Denotes the expansion properties that a widget will have when it (or its
    parent) is resized.
*/
enum GtkAttachOptions : uint
{
  /**
      the widget should expand to take up any extra space in its
      container that has been allocated.
  */
  Expand = 1,

  /**
      the widget should shrink as and when possible.
  */
  Shrink = 2,

  /**
      the widget should fill the space allocated to it.
  */
  Fill = 4,
}

/**
    Whenever a container has some form of natural row it may align
    children in that row along a common typographical baseline. If
    the amount of verical space in the row is taller than the total
    requested height of the baseline-aligned children then it can use a
    #GtkBaselinePosition to select where to put the baseline inside the
    extra availible space.
*/
enum GtkBaselinePosition
{
  /**
      Align the baseline at the top
  */
  Top = 0,

  /**
      Center the baseline
  */
  Center = 1,

  /**
      Align the baseline at the bottom
  */
  Bottom = 2,
}

/**
    Describes how the border of a UI element should be rendered.
*/
enum GtkBorderStyle
{
  /**
      No visible border
  */
  None = 0,

  /**
      A single line segment
  */
  Solid = 1,

  /**
      Looks as if the content is sunken into the canvas
  */
  Inset = 2,

  /**
      Looks as if the content is coming out of the canvas
  */
  Outset = 3,

  /**
      Same as @GTK_BORDER_STYLE_NONE
  */
  Hidden = 4,

  /**
      A series of round dots
  */
  Dotted = 5,

  /**
      A series of square-ended dashes
  */
  Dashed = 6,

  /**
      Two parallel lines with some space between them
  */
  Double = 7,

  /**
      Looks as if it were carved in the canvas
  */
  Groove = 8,

  /**
      Looks as if it were coming out of the canvas
  */
  Ridge = 9,
}

/**
    Error codes that identify various errors that can occur while using
    #GtkBuilder.
*/
enum GtkBuilderError
{
  /**
      A type-func attribute didn’t name
       a function that returns a #GType.
  */
  InvalidTypeFunction = 0,

  /**
      The input contained a tag that #GtkBuilder
       can’t handle.
  */
  UnhandledTag = 1,

  /**
      An attribute that is required by
       #GtkBuilder was missing.
  */
  MissingAttribute = 2,

  /**
      #GtkBuilder found an attribute that
       it doesn’t understand.
  */
  InvalidAttribute = 3,

  /**
      #GtkBuilder found a tag that
       it doesn’t understand.
  */
  InvalidTag = 4,

  /**
      A required property value was
       missing.
  */
  MissingPropertyValue = 5,

  /**
      #GtkBuilder couldn’t parse
       some attribute value.
  */
  InvalidValue = 6,

  /**
      The input file requires a newer version
       of GTK+.
  */
  VersionMismatch = 7,

  /**
      An object id occurred twice.
  */
  DuplicateId = 8,

  /**
      A specified object type is of the same type or
       derived from the type of the composite class being extended with builder XML.
  */
  ObjectTypeRefused = 9,

  /**
      The wrong type was specified in a composite class’s template XML
  */
  TemplateMismatch = 10,

  /**
      The specified property is unknown for the object class.
  */
  InvalidProperty = 11,

  /**
      The specified signal is unknown for the object class.
  */
  InvalidSignal = 12,

  /**
      An object id is unknown
  */
  InvalidId = 13,
}

/**
    Used to dictate the style that a #GtkButtonBox uses to layout the buttons it
    contains.
*/
enum GtkButtonBoxStyle
{
  /**
      Buttons are evenly spread across the box.
  */
  Spread = 1,

  /**
      Buttons are placed at the edges of the box.
  */
  Edge = 2,

  /**
      Buttons are grouped towards the start of the box,
        (on the left for a HBox, or the top for a VBox).
  */
  Start = 3,

  /**
      Buttons are grouped towards the end of the box,
        (on the right for a HBox, or the bottom for a VBox).
  */
  End = 4,

  /**
      Buttons are centered in the box. Since 2.12.
  */
  Center = 5,

  /**
      Buttons expand to fill the box. This entails giving
        buttons a "linked" appearance, making button sizes homogeneous, and
        setting spacing to 0 (same as calling [gtk.box.Box.setHomogeneous] and
        [gtk.box.Box.setSpacing] manually). Since 3.12.
  */
  Expand = 6,
}

/**
    The role specifies the desired appearance of a #GtkModelButton.
*/
enum GtkButtonRole
{
  /**
      A plain button
  */
  Normal = 0,

  /**
      A check button
  */
  Check = 1,

  /**
      A radio button
  */
  Radio = 2,
}

/**
    Prebuilt sets of buttons for the dialog. If
    none of these choices are appropriate, simply use [gtk.types.ButtonsType.None]
    then call [gtk.dialog.Dialog.addButtons].
    
    > Please note that [gtk.types.ButtonsType.Ok], [gtk.types.ButtonsType.YesNo]
    > and [gtk.types.ButtonsType.OkCancel] are discouraged by the
    > [GNOME Human Interface Guidelines](http://library.gnome.org/devel/hig-book/stable/).
*/
enum GtkButtonsType
{
  /**
      no buttons at all
  */
  None = 0,

  /**
      an OK button
  */
  Ok = 1,

  /**
      a Close button
  */
  Close = 2,

  /**
      a Cancel button
  */
  Cancel = 3,

  /**
      Yes and No buttons
  */
  YesNo = 4,

  /**
      OK and Cancel buttons
  */
  OkCancel = 5,
}

/**
    These options can be used to influence the display and behaviour of a #GtkCalendar.
*/
enum GtkCalendarDisplayOptions : uint
{
  /**
      Specifies that the month and year should be displayed.
  */
  ShowHeading = 1,

  /**
      Specifies that three letter day descriptions should be present.
  */
  ShowDayNames = 2,

  /**
      Prevents the user from switching months with the calendar.
  */
  NoMonthChange = 4,

  /**
      Displays each week numbers of the current year, down the
      left side of the calendar.
  */
  ShowWeekNumbers = 8,

  /**
      Just show an indicator, not the full details
      text when details are provided. See [gtk.calendar.Calendar.setDetailFunc].
  */
  ShowDetails = 32,
}

/**
    Determines if the edited accelerators are GTK+ accelerators. If
    they are, consumed modifiers are suppressed, only accelerators
    accepted by GTK+ are allowed, and the accelerators are rendered
    in the same way as they are in menus.
*/
enum GtkCellRendererAccelMode
{
  /**
      GTK+ accelerators mode
  */
  Gtk = 0,

  /**
      Other accelerator mode
      GTK_CELL_RENDERER_ACCEL_MODE_MODIFIER_TAP: Bare modifiers mode
  */
  Other = 1,

  /** */
  ModifierTap = 2,
}

/**
    Identifies how the user can interact with a particular cell.
*/
enum GtkCellRendererMode
{
  /**
      The cell is just for display
       and cannot be interacted with.  Note that this doesn’t mean that eg. the
       row being drawn can’t be selected -- just that a particular element of
       it cannot be individually modified.
  */
  Inert = 0,

  /**
      The cell can be clicked.
  */
  Activatable = 1,

  /**
      The cell can be edited or otherwise modified.
  */
  Editable = 2,
}

/**
    Tells how a cell is to be rendered.
*/
enum GtkCellRendererState : uint
{
  /**
      The cell is currently selected, and
       probably has a selection colored background to render to.
  */
  Selected = 1,

  /**
      The mouse is hovering over the cell.
  */
  Prelit = 2,

  /**
      The cell is drawn in an insensitive manner
  */
  Insensitive = 4,

  /**
      The cell is in a sorted row
  */
  Sorted = 8,

  /**
      The cell is in the focus row.
  */
  Focused = 16,

  /**
      The cell is in a row that can be expanded. Since 3.4
  */
  Expandable = 32,

  /**
      The cell is in a row that is expanded. Since 3.4
  */
  Expanded = 64,
}

/**
    Specifies which corner a child widget should be placed in when packed into
    a #GtkScrolledWindow. This is effectively the opposite of where the scroll
    bars are placed.
*/
enum GtkCornerType
{
  /**
      Place the scrollbars on the right and bottom of the
       widget (default behaviour).
  */
  TopLeft = 0,

  /**
      Place the scrollbars on the top and right of the
       widget.
  */
  BottomLeft = 1,

  /**
      Place the scrollbars on the left and bottom of the
       widget.
  */
  TopRight = 2,

  /**
      Place the scrollbars on the top and left of the
       widget.
  */
  BottomRight = 3,
}

/**
    Error codes for `GTK_CSS_PROVIDER_ERROR`.
*/
enum GtkCssProviderError
{
  /**
      Failed.
  */
  Failed = 0,

  /**
      Syntax error.
  */
  Syntax = 1,

  /**
      Import error.
  */
  Import = 2,

  /**
      Name error.
  */
  Name = 3,

  /**
      Deprecation error.
  */
  Deprecated = 4,

  /**
      Unknown value.
  */
  UnknownValue = 5,
}

/**
    The different types of sections indicate parts of a CSS document as
    parsed by GTK’s CSS parser. They are oriented towards the
    [CSS Grammar](http://www.w3.org/TR/CSS21/grammar.html),
    but may contain extensions.
    
    More types might be added in the future as the parser incorporates
    more features.
*/
enum GtkCssSectionType
{
  /**
      The section describes a complete document.
        This section time is the only one where [gtk.css_section.CssSection.getParent]
        might return null.
  */
  Document = 0,

  /**
      The section defines an import rule.
  */
  Import = 1,

  /**
      The section defines a color. This
        is a GTK extension to CSS.
  */
  ColorDefinition = 2,

  /**
      The section defines a binding set. This
        is a GTK extension to CSS.
  */
  BindingSet = 3,

  /**
      The section defines a CSS ruleset.
  */
  Ruleset = 4,

  /**
      The section defines a CSS selector.
  */
  Selector = 5,

  /**
      The section defines the declaration of
        a CSS variable.
  */
  Declaration = 6,

  /**
      The section defines the value of a CSS declaration.
  */
  Value = 7,

  /**
      The section defines keyframes. See [CSS
        Animations](http://dev.w3.org/csswg/css3-animations/#keyframes) for details. Since 3.6
  */
  Keyframes = 8,
}

/** */
enum GtkDebugFlag : uint
{
  /** */
  Misc = 1,

  /** */
  Plugsocket = 2,

  /** */
  Text = 4,

  /** */
  Tree = 8,

  /** */
  Updates = 16,

  /** */
  Keybindings = 32,

  /** */
  Multihead = 64,

  /** */
  Modules = 128,

  /** */
  Geometry = 256,

  /** */
  Icontheme = 512,

  /** */
  Printing = 1024,

  /** */
  Builder = 2048,

  /** */
  SizeRequest = 4096,

  /** */
  NoCssCache = 8192,

  /** */
  Baselines = 16384,

  /** */
  PixelCache = 32768,

  /** */
  NoPixelCache = 65536,

  /** */
  Interactive = 131072,

  /** */
  Touchscreen = 262144,

  /** */
  Actions = 524288,

  /** */
  Resize = 1048576,

  /** */
  Layout = 2097152,
}

/**
    See also: #GtkEntry::delete-from-cursor.
*/
enum GtkDeleteType
{
  /**
      Delete characters.
  */
  Chars = 0,

  /**
      Delete only the portion of the word to the
        left/right of cursor if we’re in the middle of a word.
  */
  WordEnds = 1,

  /**
      Delete words.
  */
  Words = 2,

  /**
      Delete display-lines. Display-lines
        refers to the visible lines, with respect to to the current line
        breaks. As opposed to paragraphs, which are defined by line
        breaks in the input.
  */
  DisplayLines = 3,

  /**
      Delete only the portion of the
        display-line to the left/right of cursor.
  */
  DisplayLineEnds = 4,

  /**
      Delete to the end of the
        paragraph. Like C-k in Emacs (or its reverse).
  */
  ParagraphEnds = 5,

  /**
      Delete entire line. Like C-k in pico.
  */
  Paragraphs = 6,

  /**
      Delete only whitespace. Like M-\ in Emacs.
  */
  Whitespace = 7,
}

/**
    The #GtkDestDefaults enumeration specifies the various
    types of action that will be taken on behalf
    of the user for a drag destination site.
*/
enum GtkDestDefaults : uint
{
  /**
      If set for a widget, GTK+, during a drag over this
        widget will check if the drag matches this widget’s list of possible targets
        and actions.
        GTK+ will then call [gdk.global.dragStatus] as appropriate.
  */
  Motion = 1,

  /**
      If set for a widget, GTK+ will draw a highlight on
        this widget as long as a drag is over this widget and the widget drag format
        and action are acceptable.
  */
  Highlight = 2,

  /**
      If set for a widget, when a drop occurs, GTK+ will
        will check if the drag matches this widget’s list of possible targets and
        actions. If so, GTK+ will call [gtk.widget.Widget.dragGetData] on behalf of the widget.
        Whether or not the drop is successful, GTK+ will call [gtk.global.dragFinish]. If
        the action was a move, then if the drag was successful, then true will be
        passed for the @delete parameter to [gtk.global.dragFinish].
  */
  Drop = 4,

  /**
      If set, specifies that all default actions should
        be taken.
  */
  All = 7,
}

/**
    Flags used to influence dialog construction.
*/
enum GtkDialogFlags : uint
{
  /**
      Make the constructed dialog modal,
          see [gtk.window.Window.setModal]
  */
  Modal = 1,

  /**
      Destroy the dialog when its
          parent is destroyed, see [gtk.window.Window.setDestroyWithParent]
  */
  DestroyWithParent = 2,

  /**
      Create dialog with actions in header
          bar instead of action area. Since 3.12.
  */
  UseHeaderBar = 4,
}

/**
    Focus movement types.
*/
enum GtkDirectionType
{
  /**
      Move forward.
  */
  TabForward = 0,

  /**
      Move backward.
  */
  TabBackward = 1,

  /**
      Move up.
  */
  Up = 2,

  /**
      Move down.
  */
  Down = 3,

  /**
      Move left.
  */
  Left = 4,

  /**
      Move right.
  */
  Right = 5,
}

/**
    Gives an indication why a drag operation failed.
    The value can by obtained by connecting to the
    #GtkWidget::drag-failed signal.
*/
enum GtkDragResult
{
  /**
      The drag operation was successful.
  */
  Success = 0,

  /**
      No suitable drag target.
  */
  NoTarget = 1,

  /**
      The user cancelled the drag operation.
  */
  UserCancelled = 2,

  /**
      The drag operation timed out.
  */
  TimeoutExpired = 3,

  /**
      The pointer or keyboard grab used
       for the drag operation was broken.
  */
  GrabBroken = 4,

  /**
      The drag operation failed due to some
       unspecified error.
  */
  Error = 5,
}

/**
    Specifies the side of the entry at which an icon is placed.
*/
enum GtkEntryIconPosition
{
  /**
      At the beginning of the entry (depending on the text direction).
  */
  Primary = 0,

  /**
      At the end of the entry (depending on the text direction).
  */
  Secondary = 1,
}

/**
    Describes the behavior of a #GtkEventControllerScroll.
*/
enum GtkEventControllerScrollFlags : uint
{
  /**
      Don't emit scroll.
  */
  None = 0,

  /**
      Emit scroll with vertical deltas.
  */
  Vertical = 1,

  /**
      Emit scroll with horizontal deltas.
  */
  Horizontal = 2,

  /**
      Only emit deltas that are multiples of 1.
  */
  Discrete = 4,

  /**
      Emit #GtkEventControllerScroll::decelerate
        after continuous scroll finishes.
  */
  Kinetic = 8,

  /**
      Emit scroll on both axes.
  */
  BothAxes = 3,
}

/**
    Describes the state of a #GdkEventSequence in a #GtkGesture.
*/
enum GtkEventSequenceState
{
  /**
      The sequence is handled, but not grabbed.
  */
  None = 0,

  /**
      The sequence is handled and grabbed.
  */
  Claimed = 1,

  /**
      The sequence is denied.
  */
  Denied = 2,
}

/**
    Used to specify the style of the expanders drawn by a #GtkTreeView.
*/
enum GtkExpanderStyle
{
  /**
      The style used for a collapsed subtree.
  */
  Collapsed = 0,

  /**
      Intermediate style used during animation.
  */
  SemiCollapsed = 1,

  /**
      Intermediate style used during animation.
  */
  SemiExpanded = 2,

  /**
      The style used for an expanded subtree.
  */
  Expanded = 3,
}

/**
    Describes whether a #GtkFileChooser is being used to open existing files
    or to save to a possibly new file.
*/
enum GtkFileChooserAction
{
  /**
      Indicates open mode.  The file chooser
       will only let the user pick an existing file.
  */
  Open = 0,

  /**
      Indicates save mode.  The file chooser
       will let the user pick an existing file, or type in a new
       filename.
  */
  Save = 1,

  /**
      Indicates an Open mode for
       selecting folders.  The file chooser will let the user pick an
       existing folder.
  */
  SelectFolder = 2,

  /**
      Indicates a mode for creating a
       new folder.  The file chooser will let the user name an existing or
       new folder.
  */
  CreateFolder = 3,
}

/**
    Used as a return value of handlers for the
    #GtkFileChooser::confirm-overwrite signal of a #GtkFileChooser. This
    value determines whether the file chooser will present the stock
    confirmation dialog, accept the user’s choice of a filename, or
    let the user choose another filename.
*/
enum GtkFileChooserConfirmation
{
  /**
      The file chooser will present
       its stock dialog to confirm about overwriting an existing file.
  */
  Confirm = 0,

  /**
      The file chooser will
       terminate and accept the user’s choice of a file name.
  */
  AcceptFilename = 1,

  /**
      The file chooser will
       continue running, so as to let the user select another file name.
  */
  SelectAgain = 2,
}

/**
    These identify the various errors that can occur while calling
    #GtkFileChooser functions.
*/
enum GtkFileChooserError
{
  /**
      Indicates that a file does not exist.
  */
  Nonexistent = 0,

  /**
      Indicates a malformed filename.
  */
  BadFilename = 1,

  /**
      Indicates a duplicate path (e.g. when
       adding a bookmark).
  */
  AlreadyExists = 2,

  /**
      Indicates an incomplete hostname (e.g. "http://foo" without a slash after that).
  */
  IncompleteHostname = 3,
}

/**
    These flags indicate what parts of a #GtkFileFilterInfo struct
    are filled or need to be filled.
*/
enum GtkFileFilterFlags : uint
{
  /**
      the filename of the file being tested
  */
  Filename = 1,

  /**
      the URI for the file being tested
  */
  Uri = 2,

  /**
      the string that will be used to
        display the file in the file chooser
  */
  DisplayName = 4,

  /**
      the mime type of the file
  */
  MimeType = 8,
}

/**
    This enumeration specifies the granularity of font selection
    that is desired in a font chooser.
    
    This enumeration may be extended in the future; applications should
    ignore unknown values.
*/
enum GtkFontChooserLevel : uint
{
  /**
      Allow selecting a font family
  */
  Family = 0,

  /**
      Allow selecting a specific font face
  */
  Style = 1,

  /**
      Allow selecting a specific font size
  */
  Size = 2,

  /** */
  Variations = 4,

  /**
      Allow selecting specific OpenType font features
  */
  Features = 8,
}

/**
    Style for input method preedit. See also
    #GtkSettings:gtk-im-preedit-style
*/
enum GtkIMPreeditStyle
{
  /**
      Deprecated
  */
  Nothing = 0,

  /**
      Deprecated
  */
  Callback = 1,

  /**
      Deprecated
  */
  None = 2,
}

/**
    Style for input method status. See also
    #GtkSettings:gtk-im-status-style
*/
enum GtkIMStatusStyle
{
  /**
      Deprecated
  */
  Nothing = 0,

  /**
      Deprecated
  */
  Callback = 1,

  /**
      Deprecated
  */
  None = 2,
}

/**
    Used to specify options for [gtk.icon_theme.IconTheme.lookupIcon]
*/
enum GtkIconLookupFlags : uint
{
  /**
      Never get SVG icons, even if gdk-pixbuf
        supports them. Cannot be used together with [gtk.types.IconLookupFlags.ForceSvg].
  */
  NoSvg = 1,

  /**
      Get SVG icons, even if gdk-pixbuf
        doesn’t support them.
        Cannot be used together with [gtk.types.IconLookupFlags.NoSvg].
  */
  ForceSvg = 2,

  /**
      When passed to
        [gtk.icon_theme.IconTheme.lookupIcon] includes builtin icons
        as well as files. For a builtin icon, [gtk.icon_info.IconInfo.getFilename]
        is null and you need to call [gtk.icon_info.IconInfo.getBuiltinPixbuf].
  */
  UseBuiltin = 4,

  /**
      Try to shorten icon name at '-'
        characters before looking at inherited themes. This flag is only
        supported in functions that take a single icon name. For more general
        fallback, see [gtk.icon_theme.IconTheme.chooseIcon]. Since 2.12.
  */
  GenericFallback = 8,

  /**
      Always get the icon scaled to the
        requested size. Since 2.14.
  */
  ForceSize = 16,

  /**
      Try to always load regular icons, even
        when symbolic icon names are given. Since 3.14.
  */
  ForceRegular = 32,

  /**
      Try to always load symbolic icons, even
        when regular icon names are given. Since 3.14.
  */
  ForceSymbolic = 64,

  /**
      Try to load a variant of the icon for left-to-right
        text direction. Since 3.14.
  */
  DirLtr = 128,

  /**
      Try to load a variant of the icon for right-to-left
        text direction. Since 3.14.
  */
  DirRtl = 256,
}

/**
    Built-in stock icon sizes.
*/
enum GtkIconSize
{
  /**
      Invalid size.
  */
  Invalid = 0,

  /**
      Size appropriate for menus (16px).
  */
  Menu = 1,

  /**
      Size appropriate for small toolbars (16px).
  */
  SmallToolbar = 2,

  /**
      Size appropriate for large toolbars (24px)
  */
  LargeToolbar = 3,

  /**
      Size appropriate for buttons (16px)
  */
  Button = 4,

  /**
      Size appropriate for drag and drop (32px)
  */
  Dnd = 5,

  /**
      Size appropriate for dialogs (48px)
  */
  Dialog = 6,
}

/**
    Error codes for GtkIconTheme operations.
*/
enum GtkIconThemeError
{
  /**
      The icon specified does not exist in the theme
  */
  NotFound = 0,

  /**
      An unspecified error occurred.
  */
  Failed = 1,
}

/**
    An enum for determining where a dropped item goes.
*/
enum GtkIconViewDropPosition
{
  /**
      no drop possible
  */
  NoDrop = 0,

  /**
      dropped item replaces the item
  */
  DropInto = 1,

  /**
      droppped item is inserted to the left
  */
  DropLeft = 2,

  /**
      dropped item is inserted to the right
  */
  DropRight = 3,

  /**
      dropped item is inserted above
  */
  DropAbove = 4,

  /**
      dropped item is inserted below
  */
  DropBelow = 5,
}

/**
    Describes the image data representation used by a #GtkImage. If you
    want to get the image from the widget, you can only get the
    currently-stored representation. e.g.  if the
    [gtk.image.Image.getStorageType] returns #GTK_IMAGE_PIXBUF, then you can
    call [gtk.image.Image.getPixbuf] but not [gtk.image.Image.getStock].  For empty
    images, you can request any storage type (call any of the "get"
    functions), but they will all return null values.
*/
enum GtkImageType
{
  /**
      there is no image displayed by the widget
  */
  Empty = 0,

  /**
      the widget contains a #GdkPixbuf
  */
  Pixbuf = 1,

  /**
      the widget contains a [stock item name][gtkstock]
  */
  Stock = 2,

  /**
      the widget contains a #GtkIconSet
  */
  IconSet = 3,

  /**
      the widget contains a #GdkPixbufAnimation
  */
  Animation = 4,

  /**
      the widget contains a named icon.
       This image type was added in GTK+ 2.6
  */
  IconName = 5,

  /**
      the widget contains a #GIcon.
       This image type was added in GTK+ 2.14
  */
  Gicon = 6,

  /**
      the widget contains a #cairo_surface_t.
       This image type was added in GTK+ 3.10
  */
  Surface = 7,
}

/**
    Describes hints that might be taken into account by input methods
    or applications. Note that input methods may already tailor their
    behaviour according to the #GtkInputPurpose of the entry.
    
    Some common sense is expected when using these flags - mixing
    @GTK_INPUT_HINT_LOWERCASE with any of the uppercase hints makes no sense.
    
    This enumeration may be extended in the future; input methods should
    ignore unknown values.
*/
enum GtkInputHints : uint
{
  /**
      No special behaviour suggested
  */
  None = 0,

  /**
      Suggest checking for typos
  */
  Spellcheck = 1,

  /**
      Suggest not checking for typos
  */
  NoSpellcheck = 2,

  /**
      Suggest word completion
  */
  WordCompletion = 4,

  /**
      Suggest to convert all text to lowercase
  */
  Lowercase = 8,

  /**
      Suggest to capitalize all text
  */
  UppercaseChars = 16,

  /**
      Suggest to capitalize the first
          character of each word
  */
  UppercaseWords = 32,

  /**
      Suggest to capitalize the
          first word of each sentence
  */
  UppercaseSentences = 64,

  /**
      Suggest to not show an onscreen keyboard
          (e.g for a calculator that already has all the keys).
  */
  InhibitOsk = 128,

  /**
      The text is vertical. Since 3.18
  */
  VerticalWriting = 256,

  /**
      Suggest offering Emoji support. Since 3.22.20
  */
  Emoji = 512,

  /**
      Suggest not offering Emoji support. Since 3.22.20
  */
  NoEmoji = 1024,
}

/**
    Describes primary purpose of the input widget. This information is
    useful for on-screen keyboards and similar input methods to decide
    which keys should be presented to the user.
    
    Note that the purpose is not meant to impose a totally strict rule
    about allowed characters, and does not replace input validation.
    It is fine for an on-screen keyboard to let the user override the
    character set restriction that is expressed by the purpose. The
    application is expected to validate the entry contents, even if
    it specified a purpose.
    
    The difference between @GTK_INPUT_PURPOSE_DIGITS and
    @GTK_INPUT_PURPOSE_NUMBER is that the former accepts only digits
    while the latter also some punctuation (like commas or points, plus,
    minus) and “e” or “E” as in 3.14E+000.
    
    This enumeration may be extended in the future; input methods should
    interpret unknown values as “free form”.
*/
enum GtkInputPurpose
{
  /**
      Allow any character
  */
  FreeForm = 0,

  /**
      Allow only alphabetic characters
  */
  Alpha = 1,

  /**
      Allow only digits
  */
  Digits = 2,

  /**
      Edited field expects numbers
  */
  Number = 3,

  /**
      Edited field expects phone number
  */
  Phone = 4,

  /**
      Edited field expects URL
  */
  Url = 5,

  /**
      Edited field expects email address
  */
  Email = 6,

  /**
      Edited field expects the name of a person
  */
  Name = 7,

  /**
      Like @GTK_INPUT_PURPOSE_FREE_FORM, but characters are hidden
  */
  Password = 8,

  /**
      Like @GTK_INPUT_PURPOSE_DIGITS, but characters are hidden
  */
  Pin = 9,

  /**
      Allow any character, in addition to control codes
  */
  Terminal = 10,
}

/**
    Describes how a rendered element connects to adjacent elements.
*/
enum GtkJunctionSides : uint
{
  /**
      No junctions.
  */
  None = 0,

  /**
      Element connects on the top-left corner.
  */
  CornerTopleft = 1,

  /**
      Element connects on the top-right corner.
  */
  CornerTopright = 2,

  /**
      Element connects on the bottom-left corner.
  */
  CornerBottomleft = 4,

  /**
      Element connects on the bottom-right corner.
  */
  CornerBottomright = 8,

  /**
      Element connects on the top side.
  */
  Top = 3,

  /**
      Element connects on the bottom side.
  */
  Bottom = 12,

  /**
      Element connects on the left side.
  */
  Left = 5,

  /**
      Element connects on the right side.
  */
  Right = 10,
}

/**
    Used for justifying the text inside a #GtkLabel widget. (See also
    #GtkAlignment).
*/
enum GtkJustification
{
  /**
      The text is placed at the left edge of the label.
  */
  Left = 0,

  /**
      The text is placed at the right edge of the label.
  */
  Right = 1,

  /**
      The text is placed in the center of the label.
  */
  Center = 2,

  /**
      The text is placed is distributed across the label.
  */
  Fill = 3,
}

/**
    Describes how #GtkLevelBar contents should be rendered.
    Note that this enumeration could be extended with additional modes
    in the future.
*/
enum GtkLevelBarMode
{
  /**
      the bar has a continuous mode
  */
  Continuous = 0,

  /**
      the bar has a discrete mode
  */
  Discrete = 1,
}

/**
    The type of license for an application.
    
    This enumeration can be expanded at later date.
*/
enum GtkLicense
{
  /**
      No license specified
  */
  Unknown = 0,

  /**
      A license text is going to be specified by the
        developer
  */
  Custom = 1,

  /**
      The GNU General Public License, version 2.0 or later
  */
  Gpl20 = 2,

  /**
      The GNU General Public License, version 3.0 or later
  */
  Gpl30 = 3,

  /**
      The GNU Lesser General Public License, version 2.1 or later
  */
  Lgpl21 = 4,

  /**
      The GNU Lesser General Public License, version 3.0 or later
  */
  Lgpl30 = 5,

  /**
      The BSD standard license
  */
  Bsd = 6,

  /**
      The MIT/X11 standard license
  */
  MitX11 = 7,

  /**
      The Artistic License, version 2.0
  */
  Artistic = 8,

  /**
      The GNU General Public License, version 2.0 only. Since 3.12.
  */
  Gpl20Only = 9,

  /**
      The GNU General Public License, version 3.0 only. Since 3.12.
  */
  Gpl30Only = 10,

  /**
      The GNU Lesser General Public License, version 2.1 only. Since 3.12.
  */
  Lgpl21Only = 11,

  /**
      The GNU Lesser General Public License, version 3.0 only. Since 3.12.
  */
  Lgpl30Only = 12,

  /**
      The GNU Affero General Public License, version 3.0 or later. Since: 3.22.
  */
  Agpl30 = 13,

  /**
      The GNU Affero General Public License, version 3.0 only. Since: 3.22.27.
  */
  Agpl30Only = 14,

  /**
      The 3-clause BSD licence. Since: 3.24.20.
  */
  Bsd3 = 15,

  /**
      The Apache License, version 2.0. Since: 3.24.20.
  */
  Apache20 = 16,

  /**
      The Mozilla Public License, version 2.0. Since: 3.24.20.
  */
  Mpl20 = 17,
}

/**
    An enumeration representing directional movements within a menu.
*/
enum GtkMenuDirectionType
{
  /**
      To the parent menu shell
  */
  Parent = 0,

  /**
      To the submenu, if any, associated with the item
  */
  Child = 1,

  /**
      To the next menu item
  */
  Next = 2,

  /**
      To the previous menu item
  */
  Prev = 3,
}

/**
    The type of message being displayed in the dialog.
*/
enum GtkMessageType
{
  /**
      Informational message
  */
  Info = 0,

  /**
      Non-fatal warning message
  */
  Warning = 1,

  /**
      Question requiring a choice
  */
  Question = 2,

  /**
      Fatal error message
  */
  Error = 3,

  /**
      None of the above
  */
  Other = 4,
}

/** */
enum GtkMovementStep
{
  /**
      Move forward or back by graphemes
  */
  LogicalPositions = 0,

  /**
      Move left or right by graphemes
  */
  VisualPositions = 1,

  /**
      Move forward or back by words
  */
  Words = 2,

  /**
      Move up or down lines (wrapped lines)
  */
  DisplayLines = 3,

  /**
      Move to either end of a line
  */
  DisplayLineEnds = 4,

  /**
      Move up or down paragraphs (newline-ended lines)
  */
  Paragraphs = 5,

  /**
      Move to either end of a paragraph
  */
  ParagraphEnds = 6,

  /**
      Move by pages
  */
  Pages = 7,

  /**
      Move to ends of the buffer
  */
  BufferEnds = 8,

  /**
      Move horizontally by pages
  */
  HorizontalPages = 9,
}

/** */
enum GtkNotebookTab
{
  /** */
  First = 0,

  /** */
  Last = 1,
}

/**
    Used to determine the layout of pages on a sheet when printing
    multiple pages per sheet.
*/
enum GtkNumberUpLayout
{
  /**
      ![](layout-lrtb.png)
  */
  Lrtb = 0,

  /**
      ![](layout-lrbt.png)
  */
  Lrbt = 1,

  /**
      ![](layout-rltb.png)
  */
  Rltb = 2,

  /**
      ![](layout-rlbt.png)
  */
  Rlbt = 3,

  /**
      ![](layout-tblr.png)
  */
  Tblr = 4,

  /**
      ![](layout-tbrl.png)
  */
  Tbrl = 5,

  /**
      ![](layout-btlr.png)
  */
  Btlr = 6,

  /**
      ![](layout-btrl.png)
  */
  Btrl = 7,
}

/**
    Represents the orientation of widgets and other objects which can be switched
    between horizontal and vertical orientation on the fly, like #GtkToolbar or
    #GtkGesturePan.
*/
enum GtkOrientation
{
  /**
      The element is in horizontal orientation.
  */
  Horizontal = 0,

  /**
      The element is in vertical orientation.
  */
  Vertical = 1,
}

/**
    Determines how widgets should be packed inside menubars
    and menuitems contained in menubars.
*/
enum GtkPackDirection
{
  /**
      Widgets are packed left-to-right
  */
  Ltr = 0,

  /**
      Widgets are packed right-to-left
  */
  Rtl = 1,

  /**
      Widgets are packed top-to-bottom
  */
  Ttb = 2,

  /**
      Widgets are packed bottom-to-top
  */
  Btt = 3,
}

/**
    Represents the packing location #GtkBox children. (See: #GtkVBox,
    #GtkHBox, and #GtkButtonBox).
*/
enum GtkPackType
{
  /**
      The child is packed into the start of the box
  */
  Start = 0,

  /**
      The child is packed into the end of the box
  */
  End = 1,
}

/**
    The type of a pad action.
*/
enum GtkPadActionType
{
  /**
      Action is triggered by a pad button
  */
  Button = 0,

  /**
      Action is triggered by a pad ring
  */
  Ring = 1,

  /**
      Action is triggered by a pad strip
  */
  Strip = 2,
}

/**
    See also [gtk.print_settings.PrintSettings.setOrientation].
*/
enum GtkPageOrientation
{
  /**
      Portrait mode.
  */
  Portrait = 0,

  /**
      Landscape mode.
  */
  Landscape = 1,

  /**
      Reverse portrait mode.
  */
  ReversePortrait = 2,

  /**
      Reverse landscape mode.
  */
  ReverseLandscape = 3,
}

/**
    See also [gtk.print_job.PrintJob.setPageSet].
*/
enum GtkPageSet
{
  /**
      All pages.
  */
  All = 0,

  /**
      Even pages.
  */
  Even = 1,

  /**
      Odd pages.
  */
  Odd = 2,
}

/**
    Describes the panning direction of a #GtkGesturePan
*/
enum GtkPanDirection
{
  /**
      panned towards the left
  */
  Left = 0,

  /**
      panned towards the right
  */
  Right = 1,

  /**
      panned upwards
  */
  Up = 2,

  /**
      panned downwards
  */
  Down = 3,
}

/**
    Priorities for path lookups.
    See also [gtk.binding_set.BindingSet.addPath].
*/
enum GtkPathPriorityType
{
  /**
      Deprecated
  */
  Lowest = 0,

  /**
      Deprecated
  */
  Gtk = 4,

  /**
      Deprecated
  */
  Application = 8,

  /**
      Deprecated
  */
  Theme = 10,

  /**
      Deprecated
  */
  Rc = 12,

  /**
      Deprecated
  */
  Highest = 15,
}

/**
    Widget path types.
    See also [gtk.binding_set.BindingSet.addPath].
*/
enum GtkPathType
{
  /**
      Deprecated
  */
  Widget = 0,

  /**
      Deprecated
  */
  WidgetClass = 1,

  /**
      Deprecated
  */
  Class = 2,
}

/**
    These flags serve two purposes.  First, the application can call [gtk.places_sidebar.PlacesSidebar.setOpenFlags]
    using these flags as a bitmask.  This tells the sidebar that the application is able to open
    folders selected from the sidebar in various ways, for example, in new tabs or in new windows in
    addition to the normal mode.
    
    Second, when one of these values gets passed back to the application in the
    #GtkPlacesSidebar::open-location signal, it means that the application should
    open the selected location in the normal way, in a new tab, or in a new
    window.  The sidebar takes care of determining the desired way to open the location,
    based on the modifier keys that the user is pressing at the time the selection is made.
    
    If the application never calls [gtk.places_sidebar.PlacesSidebar.setOpenFlags], then the sidebar will only
    use #GTK_PLACES_OPEN_NORMAL in the #GtkPlacesSidebar::open-location signal.  This is the
    default mode of operation.
*/
enum GtkPlacesOpenFlags : uint
{
  /**
      This is the default mode that #GtkPlacesSidebar uses if no other flags
       are specified.  It indicates that the calling application should open the selected location
       in the normal way, for example, in the folder view beside the sidebar.
  */
  Normal = 1,

  /**
      When passed to [gtk.places_sidebar.PlacesSidebar.setOpenFlags], this indicates
       that the application can open folders selected from the sidebar in new tabs.  This value
       will be passed to the #GtkPlacesSidebar::open-location signal when the user selects
       that a location be opened in a new tab instead of in the standard fashion.
  */
  NewTab = 2,

  /**
      Similar to @GTK_PLACES_OPEN_NEW_TAB, but indicates that the application
       can open folders in new windows.
  */
  NewWindow = 4,
}

/**
    Determines how the size should be computed to achieve the one of the
    visibility mode for the scrollbars.
*/
enum GtkPolicyType
{
  /**
      The scrollbar is always visible. The view size is
       independent of the content.
  */
  Always = 0,

  /**
      The scrollbar will appear and disappear as necessary.
       For example, when all of a #GtkTreeView can not be seen.
  */
  Automatic = 1,

  /**
      The scrollbar should never appear. In this mode the
       content determines the size.
  */
  Never = 2,

  /**
      Don't show a scrollbar, but don't force the
       size to follow the content. This can be used e.g. to make multiple
       scrolled windows share a scrollbar. Since: 3.16
  */
  External = 3,
}

/**
    Describes constraints to positioning of popovers. More values
    may be added to this enumeration in the future.
*/
enum GtkPopoverConstraint
{
  /**
      Don't constrain the popover position
        beyond what is imposed by the implementation
  */
  None = 0,

  /**
      Constrain the popover to the boundaries
        of the window that it is attached to
  */
  Window = 1,
}

/**
    Describes which edge of a widget a certain feature is positioned at, e.g. the
    tabs of a #GtkNotebook, the handle of a #GtkHandleBox or the label of a
    #GtkScale.
*/
enum GtkPositionType
{
  /**
      The feature is at the left edge.
  */
  Left = 0,

  /**
      The feature is at the right edge.
  */
  Right = 1,

  /**
      The feature is at the top edge.
  */
  Top = 2,

  /**
      The feature is at the bottom edge.
  */
  Bottom = 3,
}

/**
    See also [gtk.print_settings.PrintSettings.setDuplex].
*/
enum GtkPrintDuplex
{
  /**
      No duplex.
  */
  Simplex = 0,

  /**
      Horizontal duplex.
  */
  Horizontal = 1,

  /**
      Vertical duplex.
  */
  Vertical = 2,
}

/**
    Error codes that identify various errors that can occur while
    using the GTK+ printing support.
*/
enum GtkPrintError
{
  /**
      An unspecified error occurred.
  */
  General = 0,

  /**
      An internal error occurred.
  */
  InternalError = 1,

  /**
      A memory allocation failed.
  */
  Nomem = 2,

  /**
      An error occurred while loading a page setup
          or paper size from a key file.
  */
  InvalidFile = 3,
}

/**
    The @action parameter to [gtk.print_operation.PrintOperation.run]
    determines what action the print operation should perform.
*/
enum GtkPrintOperationAction
{
  /**
      Show the print dialog.
  */
  PrintDialog = 0,

  /**
      Start to print without showing
          the print dialog, based on the current print settings.
  */
  Print = 1,

  /**
      Show the print preview.
  */
  Preview = 2,

  /**
      Export to a file. This requires
          the export-filename property to be set.
  */
  Export = 3,
}

/**
    A value of this type is returned by [gtk.print_operation.PrintOperation.run].
*/
enum GtkPrintOperationResult
{
  /**
      An error has occurred.
  */
  Error = 0,

  /**
      The print settings should be stored.
  */
  Apply = 1,

  /**
      The print operation has been canceled,
          the print settings should not be stored.
  */
  Cancel = 2,

  /**
      The print operation is not complete
          yet. This value will only be returned when running asynchronously.
  */
  InProgress = 3,
}

/**
    See also [gtk.print_job.PrintJob.setPages]
*/
enum GtkPrintPages
{
  /**
      All pages.
  */
  All = 0,

  /**
      Current page.
  */
  Current = 1,

  /**
      Range of pages.
  */
  Ranges = 2,

  /**
      Selected pages.
  */
  Selection = 3,
}

/**
    See also [gtk.print_settings.PrintSettings.setQuality].
*/
enum GtkPrintQuality
{
  /**
      Low quality.
  */
  Low = 0,

  /**
      Normal quality.
  */
  Normal = 1,

  /**
      High quality.
  */
  High = 2,

  /**
      Draft quality.
  */
  Draft = 3,
}

/**
    The status gives a rough indication of the completion of a running
    print operation.
*/
enum GtkPrintStatus
{
  /**
      The printing has not started yet; this
          status is set initially, and while the print dialog is shown.
  */
  Initial = 0,

  /**
      This status is set while the begin-print
          signal is emitted and during pagination.
  */
  Preparing = 1,

  /**
      This status is set while the
          pages are being rendered.
  */
  GeneratingData = 2,

  /**
      The print job is being sent off to the
          printer.
  */
  SendingData = 3,

  /**
      The print job has been sent to the printer,
          but is not printed for some reason, e.g. the printer may be stopped.
  */
  Pending = 4,

  /**
      Some problem has occurred during
          printing, e.g. a paper jam.
  */
  PendingIssue = 5,

  /**
      The printer is processing the print job.
  */
  Printing = 6,

  /**
      The printing has been completed successfully.
  */
  Finished = 7,

  /**
      The printing has been aborted.
  */
  FinishedAborted = 8,
}

/**
    Describes the stage at which events are fed into a #GtkEventController.
*/
enum GtkPropagationPhase
{
  /**
      Events are not delivered automatically. Those can be
        manually fed through [gtk.event_controller.EventController.handleEvent]. This should
        only be used when full control about when, or whether the controller
        handles the event is needed.
  */
  None = 0,

  /**
      Events are delivered in the capture phase. The
        capture phase happens before the bubble phase, runs from the toplevel down
        to the event widget. This option should only be used on containers that
        might possibly handle events before their children do.
  */
  Capture = 1,

  /**
      Events are delivered in the bubble phase. The bubble
        phase happens after the capture phase, and before the default handlers
        are run. This phase runs from the event widget, up to the toplevel.
  */
  Bubble = 2,

  /**
      Events are delivered in the default widget event handlers,
        note that widget implementations must chain up on button, motion, touch and
        grab broken handlers for controllers in this phase to be run.
  */
  Target = 3,
}

/**
    Deprecated
*/
enum GtkRcFlags : uint
{
  /**
      Deprecated
  */
  Fg = 1,

  /**
      Deprecated
  */
  Bg = 2,

  /**
      Deprecated
  */
  Text = 4,

  /**
      Deprecated
  */
  Base = 8,
}

/**
    The #GtkRcTokenType enumeration represents the tokens
    in the RC file. It is exposed so that theme engines
    can reuse these tokens when parsing the theme-engine
    specific portions of a RC file.

    Deprecated: Use #GtkCssProvider instead.
*/
enum GtkRcTokenType
{
  /**
      Deprecated
  */
  Invalid = 270,

  /**
      Deprecated
  */
  Include = 271,

  /**
      Deprecated
  */
  Normal = 272,

  /**
      Deprecated
  */
  Active = 273,

  /**
      Deprecated
  */
  Prelight = 274,

  /**
      Deprecated
  */
  Selected = 275,

  /**
      Deprecated
  */
  Insensitive = 276,

  /**
      Deprecated
  */
  Fg = 277,

  /**
      Deprecated
  */
  Bg = 278,

  /**
      Deprecated
  */
  Text = 279,

  /**
      Deprecated
  */
  Base = 280,

  /**
      Deprecated
  */
  Xthickness = 281,

  /**
      Deprecated
  */
  Ythickness = 282,

  /**
      Deprecated
  */
  Font = 283,

  /**
      Deprecated
  */
  Fontset = 284,

  /**
      Deprecated
  */
  FontName = 285,

  /**
      Deprecated
  */
  BgPixmap = 286,

  /**
      Deprecated
  */
  PixmapPath = 287,

  /**
      Deprecated
  */
  Style = 288,

  /**
      Deprecated
  */
  Binding = 289,

  /**
      Deprecated
  */
  Bind = 290,

  /**
      Deprecated
  */
  Widget = 291,

  /**
      Deprecated
  */
  WidgetClass = 292,

  /**
      Deprecated
  */
  Class = 293,

  /**
      Deprecated
  */
  Lowest = 294,

  /**
      Deprecated
  */
  Gtk = 295,

  /**
      Deprecated
  */
  Application = 296,

  /**
      Deprecated
  */
  Theme = 297,

  /**
      Deprecated
  */
  Rc = 298,

  /**
      Deprecated
  */
  Highest = 299,

  /**
      Deprecated
  */
  Engine = 300,

  /**
      Deprecated
  */
  ModulePath = 301,

  /**
      Deprecated
  */
  ImModulePath = 302,

  /**
      Deprecated
  */
  ImModuleFile = 303,

  /**
      Deprecated
  */
  Stock = 304,

  /**
      Deprecated
  */
  Ltr = 305,

  /**
      Deprecated
  */
  Rtl = 306,

  /**
      Deprecated
  */
  Color = 307,

  /**
      Deprecated
  */
  Unbind = 308,

  /**
      Deprecated
  */
  Last = 309,
}

/**
    These identify the various errors that can occur while calling
    #GtkRecentChooser functions.
*/
enum GtkRecentChooserError
{
  /**
      Indicates that a file does not exist
  */
  NotFound = 0,

  /**
      Indicates a malformed URI
  */
  InvalidUri = 1,
}

/**
    These flags indicate what parts of a #GtkRecentFilterInfo struct
    are filled or need to be filled.
*/
enum GtkRecentFilterFlags : uint
{
  /**
      the URI of the file being tested
  */
  Uri = 1,

  /**
      the string that will be used to
       display the file in the recent chooser
  */
  DisplayName = 2,

  /**
      the mime type of the file
  */
  MimeType = 4,

  /**
      the list of applications that have
       registered the file
  */
  Application = 8,

  /**
      the groups to which the file belongs to
  */
  Group = 16,

  /**
      the number of days elapsed since the file
       has been registered
  */
  Age = 32,
}

/**
    Error codes for #GtkRecentManager operations
*/
enum GtkRecentManagerError
{
  /**
      the URI specified does not exists in
        the recently used resources list.
  */
  NotFound = 0,

  /**
      the URI specified is not valid.
  */
  InvalidUri = 1,

  /**
      the supplied string is not
        UTF-8 encoded.
  */
  InvalidEncoding = 2,

  /**
      no application has registered
        the specified item.
  */
  NotRegistered = 3,

  /**
      failure while reading the recently used
        resources file.
  */
  Read = 4,

  /**
      failure while writing the recently used
        resources file.
  */
  Write = 5,

  /**
      unspecified error.
  */
  Unknown = 6,
}

/**
    Used to specify the sorting method to be applyed to the recently
    used resource list.
*/
enum GtkRecentSortType
{
  /**
      Do not sort the returned list of recently used
        resources.
  */
  None = 0,

  /**
      Sort the returned list with the most recently used
        items first.
  */
  Mru = 1,

  /**
      Sort the returned list with the least recently used
        items first.
  */
  Lru = 2,

  /**
      Sort the returned list using a custom sorting
        function passed using [gtk.recent_chooser.RecentChooser.setSortFunc].
  */
  Custom = 3,
}

/**
    Describes a region within a widget.
*/
enum GtkRegionFlags : uint
{
  /**
      Region has an even number within a set.
  */
  Even = 1,

  /**
      Region has an odd number within a set.
  */
  Odd = 2,

  /**
      Region is the first one within a set.
  */
  First = 4,

  /**
      Region is the last one within a set.
  */
  Last = 8,

  /**
      Region is the only one within a set.
  */
  Only = 16,

  /**
      Region is part of a sorted area.
  */
  Sorted = 32,
}

/**
    Indicated the relief to be drawn around a #GtkButton.
*/
enum GtkReliefStyle
{
  /**
      Draw a normal relief.
  */
  Normal = 0,

  /**
      A half relief. Deprecated in 3.14, does the same as @GTK_RELIEF_NORMAL
  */
  Half = 1,

  /**
      No relief.
  */
  None = 2,
}

/** */
enum GtkResizeMode
{
  /**
      Pass resize request to the parent
  */
  Parent = 0,

  /**
      Queue resizes on this widget
  */
  Queue = 1,

  /**
      Resize immediately. Deprecated.
  */
  Immediate = 2,
}

/**
    Predefined values for use as response ids in [gtk.dialog.Dialog.addButton].
    All predefined values are negative; GTK+ leaves values of 0 or greater for
    application-defined response ids.
*/
enum GtkResponseType
{
  /**
      Returned if an action widget has no response id,
          or if the dialog gets programmatically hidden or destroyed
  */
  None = -1,

  /**
      Generic response id, not used by GTK+ dialogs
  */
  Reject = -2,

  /**
      Generic response id, not used by GTK+ dialogs
  */
  Accept = -3,

  /**
      Returned if the dialog is deleted
  */
  DeleteEvent = -4,

  /**
      Returned by OK buttons in GTK+ dialogs
  */
  Ok = -5,

  /**
      Returned by Cancel buttons in GTK+ dialogs
  */
  Cancel = -6,

  /**
      Returned by Close buttons in GTK+ dialogs
  */
  Close = -7,

  /**
      Returned by Yes buttons in GTK+ dialogs
  */
  Yes = -8,

  /**
      Returned by No buttons in GTK+ dialogs
  */
  No = -9,

  /**
      Returned by Apply buttons in GTK+ dialogs
  */
  Apply = -10,

  /**
      Returned by Help buttons in GTK+ dialogs
  */
  Help = -11,
}

/**
    These enumeration values describe the possible transitions
    when the child of a #GtkRevealer widget is shown or hidden.
*/
enum GtkRevealerTransitionType
{
  /**
      No transition
  */
  None = 0,

  /**
      Fade in
  */
  Crossfade = 1,

  /**
      Slide in from the left
  */
  SlideRight = 2,

  /**
      Slide in from the right
  */
  SlideLeft = 3,

  /**
      Slide in from the bottom
  */
  SlideUp = 4,

  /**
      Slide in from the top
  */
  SlideDown = 5,
}

/** */
enum GtkScrollStep
{
  /**
      Scroll in steps.
  */
  Steps = 0,

  /**
      Scroll by pages.
  */
  Pages = 1,

  /**
      Scroll to ends.
  */
  Ends = 2,

  /**
      Scroll in horizontal steps.
  */
  HorizontalSteps = 3,

  /**
      Scroll by horizontal pages.
  */
  HorizontalPages = 4,

  /**
      Scroll to the horizontal ends.
  */
  HorizontalEnds = 5,
}

/**
    Scrolling types.
*/
enum GtkScrollType
{
  /**
      No scrolling.
  */
  None = 0,

  /**
      Jump to new location.
  */
  Jump = 1,

  /**
      Step backward.
  */
  StepBackward = 2,

  /**
      Step forward.
  */
  StepForward = 3,

  /**
      Page backward.
  */
  PageBackward = 4,

  /**
      Page forward.
  */
  PageForward = 5,

  /**
      Step up.
  */
  StepUp = 6,

  /**
      Step down.
  */
  StepDown = 7,

  /**
      Page up.
  */
  PageUp = 8,

  /**
      Page down.
  */
  PageDown = 9,

  /**
      Step to the left.
  */
  StepLeft = 10,

  /**
      Step to the right.
  */
  StepRight = 11,

  /**
      Page to the left.
  */
  PageLeft = 12,

  /**
      Page to the right.
  */
  PageRight = 13,

  /**
      Scroll to start.
  */
  Start = 14,

  /**
      Scroll to end.
  */
  End = 15,
}

/**
    Defines the policy to be used in a scrollable widget when updating
    the scrolled window adjustments in a given orientation.
*/
enum GtkScrollablePolicy
{
  /**
      Scrollable adjustments are based on the minimum size
  */
  Minimum = 0,

  /**
      Scrollable adjustments are based on the natural size
  */
  Natural = 1,
}

/**
    Used to control what selections users are allowed to make.
*/
enum GtkSelectionMode
{
  /**
      No selection is possible.
  */
  None = 0,

  /**
      Zero or one element may be selected.
  */
  Single = 1,

  /**
      Exactly one element is selected.
          In some circumstances, such as initially or during a search
          operation, it’s possible for no element to be selected with
          [gtk.types.SelectionMode.Browse]. What is really enforced is that the user
          can’t deselect a currently selected element except by selecting
          another element.
  */
  Browse = 2,

  /**
      Any number of elements may be selected.
           The Ctrl key may be used to enlarge the selection, and Shift
           key to select between the focus and the child pointed to.
           Some widgets may also allow Click-drag to select a range of elements.
  */
  Multiple = 3,
}

/**
    Determines how GTK+ handles the sensitivity of stepper arrows
    at the end of range widgets.
*/
enum GtkSensitivityType
{
  /**
      The arrow is made insensitive if the
        thumb is at the end
  */
  Auto = 0,

  /**
      The arrow is always sensitive
  */
  On = 1,

  /**
      The arrow is always insensitive
  */
  Off = 2,
}

/**
    Used to change the appearance of an outline typically provided by a #GtkFrame.
    
    Note that many themes do not differentiate the appearance of the
    various shadow types: Either their is no visible shadow (@GTK_SHADOW_NONE),
    or there is (any other value).
*/
enum GtkShadowType
{
  /**
      No outline.
  */
  None = 0,

  /**
      The outline is bevelled inwards.
  */
  In = 1,

  /**
      The outline is bevelled outwards like a button.
  */
  Out = 2,

  /**
      The outline has a sunken 3d appearance.
  */
  EtchedIn = 3,

  /**
      The outline has a raised 3d appearance.
  */
  EtchedOut = 4,
}

/**
    GtkShortcutType specifies the kind of shortcut that is being described.
    More values may be added to this enumeration over time.
*/
enum GtkShortcutType
{
  /**
      The shortcut is a keyboard accelerator. The #GtkShortcutsShortcut:accelerator
        property will be used.
  */
  Accelerator = 0,

  /**
      The shortcut is a pinch gesture. GTK+ provides an icon and subtitle.
  */
  GesturePinch = 1,

  /**
      The shortcut is a stretch gesture. GTK+ provides an icon and subtitle.
  */
  GestureStretch = 2,

  /**
      The shortcut is a clockwise rotation gesture. GTK+ provides an icon and subtitle.
  */
  GestureRotateClockwise = 3,

  /**
      The shortcut is a counterclockwise rotation gesture. GTK+ provides an icon and subtitle.
  */
  GestureRotateCounterclockwise = 4,

  /**
      The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
  */
  GestureTwoFingerSwipeLeft = 5,

  /**
      The shortcut is a two-finger swipe gesture. GTK+ provides an icon and subtitle.
  */
  GestureTwoFingerSwipeRight = 6,

  /**
      The shortcut is a gesture. The #GtkShortcutsShortcut:icon property will be
        used.
  */
  Gesture = 7,
}

/**
    The mode of the size group determines the directions in which the size
    group affects the requested sizes of its component widgets.
*/
enum GtkSizeGroupMode
{
  /**
      group has no effect
  */
  None = 0,

  /**
      group affects horizontal requisition
  */
  Horizontal = 1,

  /**
      group affects vertical requisition
  */
  Vertical = 2,

  /**
      group affects both horizontal and vertical requisition
  */
  Both = 3,
}

/**
    Specifies a preference for height-for-width or
    width-for-height geometry management.
*/
enum GtkSizeRequestMode
{
  /**
      Prefer height-for-width geometry management
  */
  HeightForWidth = 0,

  /**
      Prefer width-for-height geometry management
  */
  WidthForHeight = 1,

  /**
      Don’t trade height-for-width or width-for-height
  */
  ConstantSize = 2,
}

/**
    Determines the direction of a sort.
*/
enum GtkSortType
{
  /**
      Sorting is in ascending order.
  */
  Ascending = 0,

  /**
      Sorting is in descending order.
  */
  Descending = 1,
}

/**
    The spin button update policy determines whether the spin button displays
    values even if they are outside the bounds of its adjustment.
    See [gtk.spin_button.SpinButton.setUpdatePolicy].
*/
enum GtkSpinButtonUpdatePolicy
{
  /**
      When refreshing your #GtkSpinButton, the value is
          always displayed
  */
  Always = 0,

  /**
      When refreshing your #GtkSpinButton, the value is
          only displayed if it is valid within the bounds of the spin button's
          adjustment
  */
  IfValid = 1,
}

/**
    The values of the GtkSpinType enumeration are used to specify the
    change to make in [gtk.spin_button.SpinButton.spin].
*/
enum GtkSpinType
{
  /**
      Increment by the adjustments step increment.
  */
  StepForward = 0,

  /**
      Decrement by the adjustments step increment.
  */
  StepBackward = 1,

  /**
      Increment by the adjustments page increment.
  */
  PageForward = 2,

  /**
      Decrement by the adjustments page increment.
  */
  PageBackward = 3,

  /**
      Go to the adjustments lower bound.
  */
  Home = 4,

  /**
      Go to the adjustments upper bound.
  */
  End = 5,

  /**
      Change by a specified amount.
  */
  UserDefined = 6,
}

/**
    These enumeration values describe the possible transitions
    between pages in a #GtkStack widget.
    
    New values may be added to this enumeration over time.
*/
enum GtkStackTransitionType
{
  /**
      No transition
  */
  None = 0,

  /**
      A cross-fade
  */
  Crossfade = 1,

  /**
      Slide from left to right
  */
  SlideRight = 2,

  /**
      Slide from right to left
  */
  SlideLeft = 3,

  /**
      Slide from bottom up
  */
  SlideUp = 4,

  /**
      Slide from top down
  */
  SlideDown = 5,

  /**
      Slide from left or right according to the children order
  */
  SlideLeftRight = 6,

  /**
      Slide from top down or bottom up according to the order
  */
  SlideUpDown = 7,

  /**
      Cover the old page by sliding up. Since 3.12
  */
  OverUp = 8,

  /**
      Cover the old page by sliding down. Since: 3.12
  */
  OverDown = 9,

  /**
      Cover the old page by sliding to the left. Since: 3.12
  */
  OverLeft = 10,

  /**
      Cover the old page by sliding to the right. Since: 3.12
  */
  OverRight = 11,

  /**
      Uncover the new page by sliding up. Since 3.12
  */
  UnderUp = 12,

  /**
      Uncover the new page by sliding down. Since: 3.12
  */
  UnderDown = 13,

  /**
      Uncover the new page by sliding to the left. Since: 3.12
  */
  UnderLeft = 14,

  /**
      Uncover the new page by sliding to the right. Since: 3.12
  */
  UnderRight = 15,

  /**
      Cover the old page sliding up or uncover the new page sliding down, according to order. Since: 3.12
  */
  OverUpDown = 16,

  /**
      Cover the old page sliding down or uncover the new page sliding up, according to order. Since: 3.14
  */
  OverDownUp = 17,

  /**
      Cover the old page sliding left or uncover the new page sliding right, according to order. Since: 3.14
  */
  OverLeftRight = 18,

  /**
      Cover the old page sliding right or uncover the new page sliding left, according to order. Since: 3.14
  */
  OverRightLeft = 19,
}

/**
    Describes a widget state. Widget states are used to match the widget
    against CSS pseudo-classes. Note that GTK extends the regular CSS
    classes and sometimes uses different names.
*/
enum GtkStateFlags : uint
{
  /**
      State during normal operation.
  */
  Normal = 0,

  /**
      Widget is active.
  */
  Active = 1,

  /**
      Widget has a mouse pointer over it.
  */
  Prelight = 2,

  /**
      Widget is selected.
  */
  Selected = 4,

  /**
      Widget is insensitive.
  */
  Insensitive = 8,

  /**
      Widget is inconsistent.
  */
  Inconsistent = 16,

  /**
      Widget has the keyboard focus.
  */
  Focused = 32,

  /**
      Widget is in a background toplevel window.
  */
  Backdrop = 64,

  /**
      Widget is in left-to-right text direction. Since 3.8
  */
  DirLtr = 128,

  /**
      Widget is in right-to-left text direction. Since 3.8
  */
  DirRtl = 256,

  /**
      Widget is a link. Since 3.12
  */
  Link = 512,

  /**
      The location the widget points to has already been visited. Since 3.12
  */
  Visited = 1024,

  /**
      Widget is checked. Since 3.14
  */
  Checked = 2048,

  /**
      Widget is highlighted as a drop target for DND. Since 3.20
  */
  DropActive = 4096,
}

/**
    This type indicates the current state of a widget; the state determines how
    the widget is drawn. The #GtkStateType enumeration is also used to
    identify different colors in a #GtkStyle for drawing, so states can be
    used for subparts of a widget as well as entire widgets.

    Deprecated: All APIs that are using this enumeration have been deprecated
          in favor of alternatives using #GtkStateFlags.
*/
enum GtkStateType
{
  /**
      State during normal operation.
  */
  Normal = 0,

  /**
      State of a currently active widget, such as a depressed button.
  */
  Active = 1,

  /**
      State indicating that the mouse pointer is over
                           the widget and the widget will respond to mouse clicks.
  */
  Prelight = 2,

  /**
      State of a selected item, such the selected row in a list.
  */
  Selected = 3,

  /**
      State indicating that the widget is
                              unresponsive to user actions.
  */
  Insensitive = 4,

  /**
      The widget is inconsistent, such as checkbuttons
                               or radiobuttons that aren’t either set to true nor false,
                               or buttons requiring the user attention.
  */
  Inconsistent = 5,

  /**
      The widget has the keyboard focus.
  */
  Focused = 6,
}

/**
    Flags that modify the behavior of [gtk.style_context.StyleContext.toString_].
    New values may be added to this enumeration.
*/
enum GtkStyleContextPrintFlags : uint
{
  /** */
  None = 0,

  /**
      Print the entire tree of
          CSS nodes starting at the style context's node
  */
  Recurse = 1,

  /**
      Show the values of the
          CSS properties for each node
  */
  ShowStyle = 2,
}

/**
    The #GtkTargetFlags enumeration is used to specify
    constraints on a #GtkTargetEntry.
*/
enum GtkTargetFlags : uint
{
  /**
      If this is set, the target will only be selected
        for drags within a single application.
  */
  SameApp = 1,

  /**
      If this is set, the target will only be selected
        for drags within a single widget.
  */
  SameWidget = 2,

  /**
      If this is set, the target will not be selected
        for drags within a single application.
  */
  OtherApp = 4,

  /**
      If this is set, the target will not be selected
        for drags withing a single widget.
  */
  OtherWidget = 8,
}

/**
    These values are used as “info” for the targets contained in the
    lists returned by [gtk.text_buffer.TextBuffer.getCopyTargetList] and
    [gtk.text_buffer.TextBuffer.getPasteTargetList].
    
    The values counts down from `-1` to avoid clashes
    with application added drag destinations which usually start at 0.
*/
enum GtkTextBufferTargetInfo
{
  /**
      Buffer contents
  */
  BufferContents = -1,

  /**
      Rich text
  */
  RichText = -2,

  /**
      Text
  */
  Text = -3,
}

/**
    Reading directions for text.
*/
enum GtkTextDirection
{
  /**
      No direction.
  */
  None = 0,

  /**
      Left to right text direction.
  */
  Ltr = 1,

  /**
      Right to left text direction.
  */
  Rtl = 2,
}

/**
    Granularity types that extend the text selection. Use the
    #GtkTextView::extend-selection signal to customize the selection.
*/
enum GtkTextExtendSelection
{
  /**
      Selects the current word. It is triggered by
        a double-click for example.
  */
  Word = 0,

  /**
      Selects the current line. It is triggered by
        a triple-click for example.
  */
  Line = 1,
}

/**
    Flags affecting how a search is done.
    
    If neither #GTK_TEXT_SEARCH_VISIBLE_ONLY nor #GTK_TEXT_SEARCH_TEXT_ONLY are
    enabled, the match must be exact; the special 0xFFFC character will match
    embedded pixbufs or child widgets.
*/
enum GtkTextSearchFlags : uint
{
  /**
      Search only visible data. A search match may
      have invisible text interspersed.
  */
  VisibleOnly = 1,

  /**
      Search only text. A match may have pixbufs or
      child widgets mixed inside the matched range.
  */
  TextOnly = 2,

  /**
      The text will be matched regardless of
      what case it is in.
  */
  CaseInsensitive = 4,
}

/**
    Used to reference the layers of #GtkTextView for the purpose of customized
    drawing with the ::draw_layer vfunc.
*/
enum GtkTextViewLayer
{
  /**
      Old deprecated layer, use [gtk.types.TextViewLayer.BelowText] instead
  */
  Below = 0,

  /**
      Old deprecated layer, use [gtk.types.TextViewLayer.AboveText] instead
  */
  Above = 1,

  /**
      The layer rendered below the text (but above the background).  Since: 3.20
  */
  BelowText = 2,

  /**
      The layer rendered above the text.  Since: 3.20
  */
  AboveText = 3,
}

/**
    Used to reference the parts of #GtkTextView.
*/
enum GtkTextWindowType
{
  /**
      Invalid value, used as a marker
  */
  Private = 0,

  /**
      Window that floats over scrolling areas.
  */
  Widget = 1,

  /**
      Scrollable text window.
  */
  Text = 2,

  /**
      Left side border window.
  */
  Left = 3,

  /**
      Right side border window.
  */
  Right = 4,

  /**
      Top border window.
  */
  Top = 5,

  /**
      Bottom border window.
  */
  Bottom = 6,
}

/**
    Flags used to specify the supported drag targets.
*/
enum GtkToolPaletteDragTargets : uint
{
  /**
      Support drag of items.
  */
  Items = 1,

  /**
      Support drag of groups.
  */
  Groups = 2,
}

/**
    Whether spacers are vertical lines or just blank.
*/
enum GtkToolbarSpaceStyle
{
  /**
      Use blank spacers.
  */
  Empty = 0,

  /**
      Use vertical lines for spacers.
  */
  Line = 1,
}

/**
    Used to customize the appearance of a #GtkToolbar. Note that
    setting the toolbar style overrides the user’s preferences
    for the default toolbar style.  Note that if the button has only
    a label set and GTK_TOOLBAR_ICONS is used, the label will be
    visible, and vice versa.
*/
enum GtkToolbarStyle
{
  /**
      Buttons display only icons in the toolbar.
  */
  Icons = 0,

  /**
      Buttons display only text labels in the toolbar.
  */
  Text = 1,

  /**
      Buttons display text and icons in the toolbar.
  */
  Both = 2,

  /**
      Buttons display icons and text alongside each
       other, rather than vertically stacked
  */
  BothHoriz = 3,
}

/**
    These flags indicate various properties of a #GtkTreeModel.
    
    They are returned by [gtk.tree_model.TreeModel.getFlags], and must be
    static for the lifetime of the object. A more complete description
    of #GTK_TREE_MODEL_ITERS_PERSIST can be found in the overview of
    this section.
*/
enum GtkTreeModelFlags : uint
{
  /**
      iterators survive all signals
          emitted by the tree
  */
  ItersPersist = 1,

  /**
      the model is a list only, and never
          has children
  */
  ListOnly = 2,
}

/**
    The sizing method the column uses to determine its width.  Please note
    that @GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and
    can make columns appear choppy.
*/
enum GtkTreeViewColumnSizing
{
  /**
      Columns only get bigger in reaction to changes in the model
  */
  GrowOnly = 0,

  /**
      Columns resize to be the optimal size everytime the model changes.
  */
  Autosize = 1,

  /**
      Columns are a fixed numbers of pixels wide.
  */
  Fixed = 2,
}

/**
    An enum for determining where a dropped row goes.
*/
enum GtkTreeViewDropPosition
{
  /**
      dropped row is inserted before
  */
  Before = 0,

  /**
      dropped row is inserted after
  */
  After = 1,

  /**
      dropped row becomes a child or is inserted before
  */
  IntoOrBefore = 2,

  /**
      dropped row becomes a child or is inserted after
  */
  IntoOrAfter = 3,
}

/**
    Used to indicate which grid lines to draw in a tree view.
*/
enum GtkTreeViewGridLines
{
  /**
      No grid lines.
  */
  None = 0,

  /**
      Horizontal grid lines.
  */
  Horizontal = 1,

  /**
      Vertical grid lines.
  */
  Vertical = 2,

  /**
      Horizontal and vertical grid lines.
  */
  Both = 3,
}

/**
    These enumeration values are used by [gtk.uimanager.UIManager.addUi] to determine
    what UI element to create.
*/
enum GtkUIManagerItemType : uint
{
  /**
      Pick the type of the UI element according to context.
  */
  Auto = 0,

  /**
      Create a menubar.
  */
  Menubar = 1,

  /**
      Create a menu.
  */
  Menu = 2,

  /**
      Create a toolbar.
  */
  Toolbar = 4,

  /**
      Insert a placeholder.
  */
  Placeholder = 8,

  /**
      Create a popup menu.
  */
  Popup = 16,

  /**
      Create a menuitem.
  */
  Menuitem = 32,

  /**
      Create a toolitem.
  */
  Toolitem = 64,

  /**
      Create a separator.
  */
  Separator = 128,

  /**
      Install an accelerator.
  */
  Accelerator = 256,

  /**
      Same as [gtk.types.UIManagerItemType.Popup], but the
        actions’ accelerators are shown.
  */
  PopupWithAccels = 512,
}

/**
    See also [gtk.print_settings.PrintSettings.setPaperWidth].
*/
enum GtkUnit
{
  /**
      No units.
  */
  None = 0,

  /**
      Dimensions in points.
  */
  Points = 1,

  /**
      Dimensions in inches.
  */
  Inch = 2,

  /**
      Dimensions in millimeters
  */
  Mm = 3,
}

/**
    Kinds of widget-specific help. Used by the ::show-help signal.
*/
enum GtkWidgetHelpType
{
  /**
      Tooltip.
  */
  Tooltip = 0,

  /**
      What’s this.
  */
  WhatsThis = 1,
}

/**
    Window placement can be influenced using this enumeration. Note that
    using #GTK_WIN_POS_CENTER_ALWAYS is almost always a bad idea.
    It won’t necessarily work well with all window managers or on all windowing systems.
*/
enum GtkWindowPosition
{
  /**
      No influence is made on placement.
  */
  None = 0,

  /**
      Windows should be placed in the center of the screen.
  */
  Center = 1,

  /**
      Windows should be placed at the current mouse position.
  */
  Mouse = 2,

  /**
      Keep window centered as it changes size, etc.
  */
  CenterAlways = 3,

  /**
      Center the window on its transient
       parent (see [gtk.window.Window.setTransientFor]).
  */
  CenterOnParent = 4,
}

/**
    A #GtkWindow can be one of these types. Most things you’d consider a
    “window” should have type #GTK_WINDOW_TOPLEVEL; windows with this type
    are managed by the window manager and have a frame by default (call
    [gtk.window.Window.setDecorated] to toggle the frame).  Windows with type
    #GTK_WINDOW_POPUP are ignored by the window manager; window manager
    keybindings won’t work on them, the window manager won’t decorate the
    window with a frame, many GTK+ features that rely on the window
    manager will not work (e.g. resize grips and
    maximization/minimization). #GTK_WINDOW_POPUP is used to implement
    widgets such as #GtkMenu or tooltips that you normally don’t think of
    as windows per se. Nearly all windows should be #GTK_WINDOW_TOPLEVEL.
    In particular, do not use #GTK_WINDOW_POPUP just to turn off
    the window borders; use [gtk.window.Window.setDecorated] for that.
*/
enum GtkWindowType
{
  /**
      A regular window, such as a dialog.
  */
  Toplevel = 0,

  /**
      A special window such as a tooltip.
  */
  Popup = 1,
}

/**
    Describes a type of line wrapping.
*/
enum GtkWrapMode
{
  /**
      do not wrap lines; just make the text area wider
  */
  None = 0,

  /**
      wrap text, breaking lines anywhere the cursor can
          appear (between characters, usually - if you want to be technical,
          between graphemes, see [pango.global.getLogAttrs])
  */
  Char = 1,

  /**
      wrap text, breaking lines in between words
  */
  Word = 2,

  /**
      wrap text, breaking lines in between words, or if
          that is not enough, also between graphemes
  */
  WordChar = 3,
}

/**
    The GtkAboutDialog offers a simple way to display information about
    a program like its logo, name, copyright, website and license. It is
    also possible to give credits to the authors, documenters, translators
    and artists who have worked on the program. An about dialog is typically
    opened when the user selects the `About` option from the `Help` menu.
    All parts of the dialog are optional.
    
    About dialogs often contain links and email addresses. GtkAboutDialog
    displays these as clickable links. By default, it calls [gtk.global.showUriOnWindow]
    when a user clicks one. The behaviour can be overridden with the
    #GtkAboutDialog::activate-link signal.
    
    To specify a person with an email address, use a string like
    "Edgar Allan Poe <edgar\@poe.com>". To specify a website with a title,
    use a string like "GTK+ team http://www.gtk.org".
    
    To make constructing a GtkAboutDialog as convenient as possible, you can
    use the function [gtk.global.showAboutDialog] which constructs and shows a dialog
    and keeps it around so that it can be shown again.
    
    Note that GTK+ sets a default title of `_("About `s`")` on the dialog
    window (where \`s` is replaced by the name of the application, but in
    order to ensure proper translation of the title, applications should
    set the title property explicitly when constructing a GtkAboutDialog,
    as shown in the following example:
    ```c
    GdkPixbuf *example_logo = gdk_pixbuf_new_from_file ("./logo.png", NULL);
    gtk_show_about_dialog (NULL,
                           "program-name", "ExampleCode",
                           "logo", example_logo,
                           "title", _("About ExampleCode"),
                           NULL);
    ```
    
    It is also possible to show a #GtkAboutDialog like any other #GtkDialog,
    e.g. using [gtk.dialog.Dialog.run]. In this case, you might need to know that
    the “Close” button returns the #GTK_RESPONSE_CANCEL response id.
*/
struct GtkAboutDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkAboutDialogPrivate* priv;
}

/** */
struct GtkAboutDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) gboolean function(GtkAboutDialog* dialog, const(char)* uri) activateLink;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAboutDialogPrivate;

/**
    A #GtkAccelGroup represents a group of keyboard accelerators,
    typically attached to a toplevel #GtkWindow (with
    [gtk.window.Window.addAccelGroup]). Usually you won’t need to create a
    #GtkAccelGroup directly; instead, when using #GtkUIManager, GTK+
    automatically sets up the accelerators for your menus in the ui
    manager’s #GtkAccelGroup.
    
    Note that “accelerators” are different from
    “mnemonics”. Accelerators are shortcuts for
    activating a menu item; they appear alongside the menu item they’re a
    shortcut for. For example “Ctrl+Q” might appear alongside the “Quit”
    menu item. Mnemonics are shortcuts for GUI elements such as text
    entries or buttons; they appear as underlined characters. See
    [gtk.label.Label.newWithMnemonic]. Menu items can have both accelerators
    and mnemonics, of course.
*/
struct GtkAccelGroup
{
  /** */
  GObject parent;

  /** */
  GtkAccelGroupPrivate* priv;
}

/** */
struct GtkAccelGroupClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal emitted when an entry is added to or removed
         from the accel group.
  */
  extern(C) void function(GtkAccelGroup* accelGroup, uint keyval, GdkModifierType modifier, GClosure* accelClosure) accelChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAccelGroupEntry
{
  /** */
  GtkAccelKey key;

  /** */
  GClosure* closure;

  /** */
  GQuark accelPathQuark;
}

/** */
struct GtkAccelGroupPrivate;

/** */
struct GtkAccelKey
{
  /**
      The accelerator keyval
  */
  uint accelKey;

  /**
      The accelerator modifiers
  */
  GdkModifierType accelMods;

  /**
      The accelerator flags
  */
  uint accelFlags;
}

/**
    The #GtkAccelLabel widget is a subclass of #GtkLabel that also displays an
    accelerator key on the right of the label text, e.g. “Ctrl+S”.
    It is commonly used in menus to show the keyboard short-cuts for commands.
    
    The accelerator key to display is typically not set explicitly (although it
    can be, with [gtk.accel_label.AccelLabel.setAccel]). Instead, the #GtkAccelLabel displays
    the accelerators which have been added to a particular widget. This widget is
    set by calling [gtk.accel_label.AccelLabel.setAccelWidget].
    
    For example, a #GtkMenuItem widget may have an accelerator added to emit
    the “activate” signal when the “Ctrl+S” key combination is pressed.
    A #GtkAccelLabel is created and added to the #GtkMenuItem, and
    [gtk.accel_label.AccelLabel.setAccelWidget] is called with the #GtkMenuItem as the
    second argument. The #GtkAccelLabel will now display “Ctrl+S” after its label.
    
    Note that creating a #GtkMenuItem with [gtk.menu_item.MenuItem.newWithLabel] (or
    one of the similar functions for #GtkCheckMenuItem and #GtkRadioMenuItem)
    automatically adds a #GtkAccelLabel to the #GtkMenuItem and calls
    [gtk.accel_label.AccelLabel.setAccelWidget] to set it up for you.
    
    A #GtkAccelLabel will only display accelerators which have [gtk.types.AccelFlags.Visible]
    set (see #GtkAccelFlags).
    A #GtkAccelLabel can display multiple accelerators and even signal names,
    though it is almost always used to display just one accelerator key.
    
    ## Creating a simple menu item with an accelerator key.
    
    ```c
      GtkWidget *window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      GtkWidget *menu = gtk_menu_new ();
      GtkWidget *save_item;
      GtkAccelGroup *accel_group;
    
      // Create a GtkAccelGroup and add it to the window.
      accel_group = gtk_accel_group_new ();
      gtk_window_add_accel_group (GTK_WINDOW (window), accel_group);
    
      // Create the menu item using the convenience function.
      save_item = gtk_menu_item_new_with_label ("Save");
      gtk_widget_show (save_item);
      gtk_container_add (GTK_CONTAINER (menu), save_item);
    
      // Now add the accelerator to the GtkMenuItem. Note that since we
      // called gtk_menu_item_new_with_label() to create the GtkMenuItem
      // the GtkAccelLabel is automatically set up to display the
      // GtkMenuItem accelerators. We just need to make sure we use
      // GTK_ACCEL_VISIBLE here.
      gtk_widget_add_accelerator (save_item, "activate", accel_group,
                                  GDK_KEY_s, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
    ```
    
    # CSS nodes
    
    ```plain
    label
    ╰── accelerator
    ```
    
    Like #GtkLabel, GtkAccelLabel has a main CSS node with the name label.
    It adds a subnode with name accelerator.
*/
struct GtkAccelLabel
{
  /** */
  GtkLabel label;

  /** */
  GtkAccelLabelPrivate* priv;
}

/** */
struct GtkAccelLabelClass
{
  /** */
  GtkLabelClass parentClass;

  /** */
  char* signalQuote1;

  /** */
  char* signalQuote2;

  /** */
  char* modNameShift;

  /** */
  char* modNameControl;

  /** */
  char* modNameAlt;

  /** */
  char* modSeparator;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAccelLabelPrivate;

/**
    Accelerator maps are used to define runtime configurable accelerators.
    Functions for manipulating them are are usually used by higher level
    convenience mechanisms like #GtkUIManager and are thus considered
    “low-level”. You’ll want to use them if you’re manually creating menus that
    should have user-configurable accelerators.
    
    An accelerator is uniquely defined by:
    $(LIST
      * accelerator path
      * accelerator key
      * accelerator modifiers
    )
      
    The accelerator path must consist of
    “<WINDOWTYPE>/Category1/Category2/.../Action”, where WINDOWTYPE
    should be a unique application-specific identifier that corresponds
    to the kind of window the accelerator is being used in, e.g.
    “Gimp-Image”, “Abiword-Document” or “Gnumeric-Settings”.
    The “Category1/.../Action” portion is most appropriately chosen by
    the action the accelerator triggers, i.e. for accelerators on menu
    items, choose the item’s menu path, e.g. “File/Save As”,
    “Image/View/Zoom” or “Edit/Select All”. So a full valid accelerator
    path may look like: “<Gimp-Toolbox>/File/Dialogs/Tool Options...”.
    
    All accelerators are stored inside one global #GtkAccelMap that can
    be obtained using [gtk.accel_map.AccelMap.get]. See
    [Monitoring changes][monitoring-changes] for additional
    details.
    
    # Manipulating accelerators
    
    New accelerators can be added using [gtk.accel_map.AccelMap.addEntry].
    To search for specific accelerator, use [gtk.accel_map.AccelMap.lookupEntry].
    Modifications of existing accelerators should be done using
    [gtk.accel_map.AccelMap.changeEntry].
    
    In order to avoid having some accelerators changed, they can be
    locked using [gtk.accel_map.AccelMap.lockPath]. Unlocking is done using
    [gtk.accel_map.AccelMap.unlockPath].
    
    # Saving and loading accelerator maps
    
    Accelerator maps can be saved to and loaded from some external
    resource. For simple saving and loading from file,
    [gtk.accel_map.AccelMap.save] and [gtk.accel_map.AccelMap.load] are provided.
    Saving and loading can also be done by providing file descriptor
    to [gtk.accel_map.AccelMap.saveFd] and [gtk.accel_map.AccelMap.loadFd].
    
    # Monitoring changes
    
    #GtkAccelMap object is only useful for monitoring changes of
    accelerators. By connecting to #GtkAccelMap::changed signal, one
    can monitor changes of all accelerators. It is also possible to
    monitor only single accelerator path by using it as a detail of
    the #GtkAccelMap::changed signal.
*/
struct GtkAccelMap;

/** */
struct GtkAccelMapClass;

/**
    The #GtkAccessible class is the base class for accessible
    implementations for #GtkWidget subclasses. It is a thin
    wrapper around #AtkObject, which adds facilities for associating
    a widget with its accessible object.
    
    An accessible implementation for a third-party widget should
    derive from #GtkAccessible and implement the suitable interfaces
    from ATK, such as #AtkText or #AtkSelection. To establish
    the connection between the widget class and its corresponding
    acccessible implementation, override the get_accessible vfunc
    in #GtkWidgetClass.
*/
struct GtkAccessible
{
  /** */
  AtkObject parent;

  /** */
  GtkAccessiblePrivate* priv;
}

/** */
struct GtkAccessibleClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  extern(C) void function(GtkAccessible* accessible) connectWidgetDestroyed;

  /** */
  extern(C) void function(GtkAccessible* accessible) widgetSet;

  /** */
  extern(C) void function(GtkAccessible* accessible) widgetUnset;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAccessiblePrivate;

/**
    > In GTK+ 3.10, GtkAction has been deprecated. Use #GAction
    > instead, and associate actions with #GtkActionable widgets. Use
    > #GMenuModel for creating menus with [gtk.menu.Menu.newFromModel].
    
    Actions represent operations that the user can be perform, along with
    some information how it should be presented in the interface. Each action
    provides methods to create icons, menu items and toolbar items
    representing itself.
    
    As well as the callback that is called when the action gets activated,
    the following also gets associated with the action:
    
    $(LIST
      * a name (not translated, for path lookup)
      
      * a label (translated, for display)
      
      * an accelerator
      
      * whether label indicates a stock id
      
      * a tooltip (optional, translated)
      
      * a toolbar label (optional, shorter than label)
    )
      
      
    The action will also have some state information:
    
    $(LIST
      * visible (shown/hidden)
      
      * sensitive (enabled/disabled)
    )
      
    Apart from regular actions, there are [toggle actions][GtkToggleAction],
    which can be toggled between two states and
    [radio actions][GtkRadioAction], of which only one in a group
    can be in the “active” state. Other actions can be implemented as #GtkAction
    subclasses.
    
    Each action can have one or more proxy widgets. To act as an action proxy,
    widget needs to implement #GtkActivatable interface. Proxies mirror the state
    of the action and should change when the action’s state changes. Properties
    that are always mirrored by proxies are #GtkAction:sensitive and
    #GtkAction:visible. #GtkAction:gicon, #GtkAction:icon-name, #GtkAction:label,
    #GtkAction:short-label and #GtkAction:stock-id properties are only mirorred
    if proxy widget has #GtkActivatable:use-action-appearance property set to
    true.
    
    When the proxy is activated, it should activate its action.
*/
struct GtkAction
{
  /** */
  GObject object;

  /** */
  GtkActionPrivate* privateData;
}

/**
    GtkActionBar is designed to present contextual actions. It is
    expected to be displayed below the content and expand horizontally
    to fill the area.
    
    It allows placing children at the start or the end. In addition, it
    contains an internal centered box which is centered with respect to
    the full width of the box, even if the children at either side take
    up different amounts of space.
    
    # CSS nodes
    
    GtkActionBar has a single CSS node with name actionbar.
*/
struct GtkActionBar
{
  /** */
  GtkBin bin;
}

/** */
struct GtkActionBarClass
{
  /** */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkActionBarPrivate;

/** */
struct GtkActionClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal emitted when the action is activated.
  */
  extern(C) void function(GtkAction* action) activate;

  /** */
  GType menuItemType;

  /** */
  GType toolbarItemType;

  /** */
  extern(C) GtkWidget* function(GtkAction* action) createMenuItem;

  /** */
  extern(C) GtkWidget* function(GtkAction* action) createToolItem;

  /** */
  extern(C) void function(GtkAction* action, GtkWidget* proxy) connectProxy;

  /** */
  extern(C) void function(GtkAction* action, GtkWidget* proxy) disconnectProxy;

  /** */
  extern(C) GtkWidget* function(GtkAction* action) createMenu;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    #GtkActionEntry structs are used with [gtk.action_group.ActionGroup.addActions] to
    construct actions.
*/
struct GtkActionEntry
{
  /**
      The name of the action.
  */
  const(char)* name;

  /**
      The stock id for the action, or the name of an icon from the
       icon theme.
  */
  const(char)* stockId;

  /**
      The label for the action. This field should typically be marked
       for translation, see [gtk.action_group.ActionGroup.setTranslationDomain]. If
       @label is null, the label of the stock item with id @stock_id is used.
  */
  const(char)* label;

  /**
      The accelerator for the action, in the format understood by
       [gtk.global.acceleratorParse].
  */
  const(char)* accelerator;

  /**
      The tooltip for the action. This field should typically be
       marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  const(char)* tooltip;

  /**
      The function to call when the action is activated.
  */
  GCallback callback;
}

/**
    Actions are organised into groups. An action group is essentially a
    map from names to #GtkAction objects.
    
    All actions that would make sense to use in a particular context
    should be in a single group. Multiple action groups may be used for a
    particular user interface. In fact, it is expected that most nontrivial
    applications will make use of multiple groups. For example, in an
    application that can edit multiple documents, one group holding global
    actions (e.g. quit, about, new), and one group per document holding
    actions that act on that document (eg. save, cut/copy/paste, etc). Each
    window’s menus would be constructed from a combination of two action
    groups.
    
    ## Accelerators ## {#Action-Accel}
    
    Accelerators are handled by the GTK+ accelerator map. All actions are
    assigned an accelerator path (which normally has the form
    `<Actions>/group-name/action-name`) and a shortcut is associated with
    this accelerator path. All menuitems and toolitems take on this accelerator
    path. The GTK+ accelerator map code makes sure that the correct shortcut
    is displayed next to the menu item.
    
    # GtkActionGroup as GtkBuildable # {#GtkActionGroup-BUILDER-UI}
    
    The #GtkActionGroup implementation of the #GtkBuildable interface accepts
    #GtkAction objects as `<child>` elements in UI definitions.
    
    Note that it is probably more common to define actions and action groups
    in the code, since they are directly related to what the code can do.
    
    The GtkActionGroup implementation of the GtkBuildable interface supports
    a custom `<accelerator>` element, which has attributes named “key“ and
    “modifiers“ and allows to specify accelerators. This is similar to the
    `<accelerator>` element of #GtkWidget, the main difference is that
    it doesn’t allow you to specify a signal.
    
    ## A #GtkDialog UI definition fragment. ##
    
    ```xml
    <object class="GtkActionGroup" id="actiongroup">
      <child>
          <object class="GtkAction" id="About">
              <property name="name">About</property>
              <property name="stock_id">gtk-about</property>
              <signal handler="about_activate" name="activate"/>
          </object>
          <accelerator key="F1" modifiers="GDK_CONTROL_MASK | GDK_SHIFT_MASK"/>
      </child>
    </object>
    ```
*/
struct GtkActionGroup
{
  /** */
  GObject parent;

  /** */
  GtkActionGroupPrivate* priv;
}

/** */
struct GtkActionGroupClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Looks up an action in the action group by name.
  */
  extern(C) GtkAction* function(GtkActionGroup* actionGroup, const(char)* actionName) getAction;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkActionGroupPrivate;

/** */
struct GtkActionPrivate;

/**
    This interface provides a convenient way of associating widgets with
    actions on a #GtkApplicationWindow or #GtkApplication.
    
    It primarily consists of two properties: #GtkActionable:action-name
    and #GtkActionable:action-target. There are also some convenience APIs
    for setting these properties.
    
    The action will be looked up in action groups that are found among
    the widgets ancestors. Most commonly, these will be the actions with
    the “win.” or “app.” prefix that are associated with the #GtkApplicationWindow
    or #GtkApplication, but other action groups that are added with
    [gtk.widget.Widget.insertActionGroup] will be consulted as well.
*/
struct GtkActionable;

/**
    The interface vtable for #GtkActionable.
*/
struct GtkActionableInterface
{
  /** */
  GTypeInterface gIface;

  /**
      virtual function for [gtk.actionable.Actionable.getActionName]
  */
  extern(C) const(char)* function(GtkActionable* actionable) getActionName;

  /**
      virtual function for [gtk.actionable.Actionable.setActionName]
  */
  extern(C) void function(GtkActionable* actionable, const(char)* actionName) setActionName;

  /**
      virtual function for [gtk.actionable.Actionable.getActionTargetValue]
  */
  extern(C) GVariant* function(GtkActionable* actionable) getActionTargetValue;

  /**
      virtual function for [gtk.actionable.Actionable.setActionTargetValue]
  */
  extern(C) void function(GtkActionable* actionable, GVariant* targetValue) setActionTargetValue;
}

/**
    Activatable widgets can be connected to a #GtkAction and reflects
    the state of its action. A #GtkActivatable can also provide feedback
    through its action, as they are responsible for activating their
    related actions.
    
    # Implementing GtkActivatable
    
    When extending a class that is already #GtkActivatable; it is only
    necessary to implement the #GtkActivatable->sync_action_properties()
    and #GtkActivatable->update() methods and chain up to the parent
    implementation, however when introducing
    a new #GtkActivatable class; the #GtkActivatable:related-action and
    #GtkActivatable:use-action-appearance properties need to be handled by
    the implementor. Handling these properties is mostly a matter of installing
    the action pointer and boolean flag on your instance, and calling
    [gtk.activatable.Activatable.doSetRelatedAction] and
    [gtk.activatable.Activatable.syncActionProperties] at the appropriate times.
    
    ## A class fragment implementing #GtkActivatable
    
    ```c
    
    enum {
    ...
    
    PROP_ACTIVATABLE_RELATED_ACTION,
    PROP_ACTIVATABLE_USE_ACTION_APPEARANCE
    }
    
    struct _FooBarPrivate
    {
    
      ...
    
      GtkAction      *action;
      gboolean        use_action_appearance;
    };
    
    ...
    
    static void foo_bar_activatable_interface_init         (GtkActivatableIface  *iface);
    static void foo_bar_activatable_update                 (GtkActivatable       *activatable,
    						           GtkAction            *action,
    						           const gchar          *property_name);
    static void foo_bar_activatable_sync_action_properties (GtkActivatable       *activatable,
    						           GtkAction            *action);
    ...
    
    
    static void
    foo_bar_class_init (FooBarClass *klass)
    {
    
      ...
    
      g_object_class_override_property (gobject_class, PROP_ACTIVATABLE_RELATED_ACTION, "related-action");
      g_object_class_override_property (gobject_class, PROP_ACTIVATABLE_USE_ACTION_APPEARANCE, "use-action-appearance");
    
      ...
    }
    
    
    static void
    foo_bar_activatable_interface_init (GtkActivatableIface  *iface)
    {
      iface->update = foo_bar_activatable_update;
      iface->sync_action_properties = foo_bar_activatable_sync_action_properties;
    }
    
    ... Break the reference using gtk_activatable_do_set_related_action()...
    
    static void
    foo_bar_dispose (GObject *object)
    {
      FooBar *bar = FOO_BAR (object);
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);
    
      ...
    
      if (priv->action)
        {
          gtk_activatable_do_set_related_action (GTK_ACTIVATABLE (bar), NULL);
          priv->action = NULL;
        }
      G_OBJECT_CLASS (foo_bar_parent_class)->dispose (object);
    }
    
    ... Handle the “related-action” and “use-action-appearance” properties ...
    
    static void
    foo_bar_set_property (GObject         *object,
                          guint            prop_id,
                          const GValue    *value,
                          GParamSpec      *pspec)
    {
      FooBar *bar = FOO_BAR (object);
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);
    
      switch (prop_id)
        {
    
          ...
    
        case PROP_ACTIVATABLE_RELATED_ACTION:
          foo_bar_set_related_action (bar, g_value_get_object (value));
          break;
        case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
          foo_bar_set_use_action_appearance (bar, g_value_get_boolean (value));
          break;
        default:
          G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
          break;
        }
    }
    
    static void
    foo_bar_get_property (GObject         *object,
                             guint            prop_id,
                             GValue          *value,
                             GParamSpec      *pspec)
    {
      FooBar *bar = FOO_BAR (object);
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);
    
      switch (prop_id)
        {
    
          ...
    
        case PROP_ACTIVATABLE_RELATED_ACTION:
          g_value_set_object (value, priv->action);
          break;
        case PROP_ACTIVATABLE_USE_ACTION_APPEARANCE:
          g_value_set_boolean (value, priv->use_action_appearance);
          break;
        default:
          G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
          break;
        }
    }
    
    
    static void
    foo_bar_set_use_action_appearance (FooBar   *bar,
    				   gboolean  use_appearance)
    {
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);
    
      if (priv->use_action_appearance != use_appearance)
        {
          priv->use_action_appearance = use_appearance;
          
          gtk_activatable_sync_action_properties (GTK_ACTIVATABLE (bar), priv->action);
        }
    }
    
    ... call gtk_activatable_do_set_related_action() and then assign the action pointer,
    no need to reference the action here since gtk_activatable_do_set_related_action() already
    holds a reference here for you...
    static void
    foo_bar_set_related_action (FooBar    *bar,
    			    GtkAction *action)
    {
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (bar);
    
      if (priv->action == action)
        return;
    
      gtk_activatable_do_set_related_action (GTK_ACTIVATABLE (bar), action);
    
      priv->action = action;
    }
    
    ... Selectively reset and update activatable depending on the use-action-appearance property ...
    static void
    gtk_button_activatable_sync_action_properties (GtkActivatable       *activatable,
    		                                  GtkAction            *action)
    {
      GtkButtonPrivate *priv = GTK_BUTTON_GET_PRIVATE (activatable);
    
      if (!action)
        return;
    
      if (gtk_action_is_visible (action))
        gtk_widget_show (GTK_WIDGET (activatable));
      else
        gtk_widget_hide (GTK_WIDGET (activatable));
      
      gtk_widget_set_sensitive (GTK_WIDGET (activatable), gtk_action_is_sensitive (action));
    
      ...
      
      if (priv->use_action_appearance)
        {
          if (gtk_action_get_stock_id (action))
    	foo_bar_set_stock (button, gtk_action_get_stock_id (action));
          else if (gtk_action_get_label (action))
    	foo_bar_set_label (button, gtk_action_get_label (action));
    
          ...
    
        }
    }
    
    static void
    foo_bar_activatable_update (GtkActivatable       *activatable,
    			       GtkAction            *action,
    			       const gchar          *property_name)
    {
      FooBarPrivate *priv = FOO_BAR_GET_PRIVATE (activatable);
    
      if (strcmp (property_name, "visible") == 0)
        {
          if (gtk_action_is_visible (action))
    	gtk_widget_show (GTK_WIDGET (activatable));
          else
    	gtk_widget_hide (GTK_WIDGET (activatable));
        }
      else if (strcmp (property_name, "sensitive") == 0)
        gtk_widget_set_sensitive (GTK_WIDGET (activatable), gtk_action_is_sensitive (action));
    
      ...
    
      if (!priv->use_action_appearance)
        return;
    
      if (strcmp (property_name, "stock-id") == 0)
        foo_bar_set_stock (button, gtk_action_get_stock_id (action));
      else if (strcmp (property_name, "label") == 0)
        foo_bar_set_label (button, gtk_action_get_label (action));
    
      ...
    }
    ```
*/
struct GtkActivatable;

/**
    > This method can be called with a null action at times.
*/
struct GtkActivatableIface
{
  /** */
  GTypeInterface gIface;

  /**
      Called to update the activatable when its related action’s properties change.
      You must check the #GtkActivatable:use-action-appearance property only apply action
      properties that are meant to effect the appearance accordingly.
  */
  extern(C) void function(GtkActivatable* activatable, GtkAction* action, const(char)* propertyName) update;

  /**
      Called to update the activatable completely, this is called internally when
      #GtkActivatable:related-action property is set or unset and by the implementor when
      #GtkActivatable:use-action-appearance changes.
  */
  extern(C) void function(GtkActivatable* activatable, GtkAction* action) syncActionProperties;
}

/**
    The #GtkAdjustment object represents a value which has an associated lower
    and upper bound, together with step and page increments, and a page size.
    It is used within several GTK+ widgets, including #GtkSpinButton, #GtkViewport,
    and #GtkRange (which is a base class for #GtkScrollbar and #GtkScale).
    
    The #GtkAdjustment object does not update the value itself. Instead
    it is left up to the owner of the #GtkAdjustment to control the value.
*/
struct GtkAdjustment
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkAdjustmentPrivate* priv;
}

/** */
struct GtkAdjustmentClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /** */
  extern(C) void function(GtkAdjustment* adjustment) changed;

  /** */
  extern(C) void function(GtkAdjustment* adjustment) valueChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAdjustmentPrivate;

/**
    The #GtkAlignment widget controls the alignment and size of its child widget.
    It has four settings: xscale, yscale, xalign, and yalign.
    
    The scale settings are used to specify how much the child widget should
    expand to fill the space allocated to the #GtkAlignment.
    The values can range from 0 (meaning the child doesn’t expand at all) to
    1 (meaning the child expands to fill all of the available space).
    
    The align settings are used to place the child widget within the available
    area. The values range from 0 (top or left) to 1 (bottom or right).
    Of course, if the scale settings are both set to 1, the alignment settings
    have no effect.
    
    GtkAlignment has been deprecated in 3.14 and should not be used in
    newly-written code. The desired effect can be achieved by using the
    #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties on the
    child widget.
*/
struct GtkAlignment
{
  /** */
  GtkBin bin;

  /** */
  GtkAlignmentPrivate* priv;
}

/** */
struct GtkAlignmentClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAlignmentPrivate;

/**
    #GtkAppChooser is an interface that can be implemented by widgets which
    allow the user to choose an application (typically for the purpose of
    opening a file). The main objects that implement this interface are
    #GtkAppChooserWidget, #GtkAppChooserDialog and #GtkAppChooserButton.
    
    Applications are represented by GIO #GAppInfo objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The #GtkAppChooserWidget provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a #GtkAppChooser,
    use [gtk.app_chooser.AppChooser.getAppInfo].
*/
struct GtkAppChooser;

/**
    The #GtkAppChooserButton is a widget that lets the user select
    an application. It implements the #GtkAppChooser interface.
    
    Initially, a #GtkAppChooserButton selects the first application
    in its list, which will either be the most-recently used application
    or, if #GtkAppChooserButton:show-default-item is true, the
    default application.
    
    The list of applications shown in a #GtkAppChooserButton includes
    the recommended applications for the given content type. When
    #GtkAppChooserButton:show-default-item is set, the default application
    is also included. To let the user chooser other applications,
    you can set the #GtkAppChooserButton:show-dialog-item property,
    which allows to open a full #GtkAppChooserDialog.
    
    It is possible to add custom items to the list, using
    [gtk.app_chooser_button.AppChooserButton.appendCustomItem]. These items cause
    the #GtkAppChooserButton::custom-item-activated signal to be
    emitted when they are selected.
    
    To track changes in the selected application, use the
    #GtkComboBox::changed signal.
*/
struct GtkAppChooserButton
{
  /** */
  GtkComboBox parent;

  /** */
  GtkAppChooserButtonPrivate* priv;
}

/** */
struct GtkAppChooserButtonClass
{
  /**
      The parent class.
  */
  GtkComboBoxClass parentClass;

  /**
      Signal emitted when a custom item,
         previously added with [gtk.app_chooser_button.AppChooserButton.appendCustomItem],
         is activated from the dropdown menu.
  */
  extern(C) void function(GtkAppChooserButton* self, const(char)* itemName) customItemActivated;

  /** */
  void*[16] padding;
}

/** */
struct GtkAppChooserButtonPrivate;

/**
    #GtkAppChooserDialog shows a #GtkAppChooserWidget inside a #GtkDialog.
    
    Note that #GtkAppChooserDialog does not have any interesting methods
    of its own. Instead, you should get the embedded #GtkAppChooserWidget
    using [gtk.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic #GtkAppChooser interface is not sufficient for your needs.
    
    To set the heading that is shown above the #GtkAppChooserWidget,
    use [gtk.app_chooser_dialog.AppChooserDialog.setHeading].
*/
struct GtkAppChooserDialog
{
  /** */
  GtkDialog parent;

  /** */
  GtkAppChooserDialogPrivate* priv;
}

/** */
struct GtkAppChooserDialogClass
{
  /**
      The parent class.
  */
  GtkDialogClass parentClass;

  /** */
  void*[16] padding;
}

/** */
struct GtkAppChooserDialogPrivate;

/**
    #GtkAppChooserWidget is a widget for selecting applications.
    It is the main building block for #GtkAppChooserDialog. Most
    applications only need to use the latter; but you can use
    this widget as part of a larger widget if you have special needs.
    
    #GtkAppChooserWidget offers detailed control over what applications
    are shown, using the
    #GtkAppChooserWidget:show-default,
    #GtkAppChooserWidget:show-recommended,
    #GtkAppChooserWidget:show-fallback,
    #GtkAppChooserWidget:show-other and
    #GtkAppChooserWidget:show-all
    properties. See the #GtkAppChooser documentation for more information
    about these groups of applications.
    
    To keep track of the selected application, use the
    #GtkAppChooserWidget::application-selected and #GtkAppChooserWidget::application-activated signals.
    
    # CSS nodes
    
    GtkAppChooserWidget has a single CSS node with name appchooser.
*/
struct GtkAppChooserWidget
{
  /** */
  GtkBox parent;

  /** */
  GtkAppChooserWidgetPrivate* priv;
}

/** */
struct GtkAppChooserWidgetClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /**
      Signal emitted when an application item is
         selected from the widget’s list.
  */
  extern(C) void function(GtkAppChooserWidget* self, GAppInfo* appInfo) applicationSelected;

  /**
      Signal emitted when an application item is
         activated from the widget’s list.
  */
  extern(C) void function(GtkAppChooserWidget* self, GAppInfo* appInfo) applicationActivated;

  /**
      Signal emitted when a context menu is about to
         popup over an application item.
  */
  extern(C) void function(GtkAppChooserWidget* self, GtkMenu* menu, GAppInfo* appInfo) populatePopup;

  /** */
  void*[16] padding;
}

/** */
struct GtkAppChooserWidgetPrivate;

/**
    #GtkApplication is a class that handles many important aspects
    of a GTK+ application in a convenient fashion, without enforcing
    a one-size-fits-all application model.
    
    Currently, GtkApplication handles GTK+ initialization, application
    uniqueness, session management, provides some basic scriptability and
    desktop shell integration by exporting actions and menus and manages a
    list of toplevel windows whose life-cycle is automatically tied to the
    life-cycle of your application.
    
    While GtkApplication works fine with plain #GtkWindows, it is recommended
    to use it together with #GtkApplicationWindow.
    
    When GDK threads are enabled, GtkApplication will acquire the GDK
    lock when invoking actions that arrive from other processes.  The GDK
    lock is not touched for local action invocations.  In order to have
    actions invoked in a predictable context it is therefore recommended
    that the GDK lock be held while invoking actions locally with
    [gio.action_group.ActionGroup.activateAction].  The same applies to actions
    associated with #GtkApplicationWindow and to the “activate” and
    “open” #GApplication methods.
    
    ## Automatic resources ## {#automatic-resources}
    
    #GtkApplication will automatically load menus from the #GtkBuilder
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gio.application.Application.setResourceBasePath]).  The
    menu with the ID "app-menu" is taken as the application's app menu
    and the menu with the ID "menubar" is taken as the application's
    menubar.  Additional menus (most interesting submenus) can be named
    and accessed via [gtk.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    If the resources "gtk/menus-appmenu.ui" or "gtk/menus-traditional.ui" are
    present then these files will be used in preference, depending on the value
    of [gtk.application.Application.prefersAppMenu]. If the resource "gtk/menus-common.ui"
    is present it will be loaded as well. This is useful for storing items that
    are referenced from both "gtk/menus-appmenu.ui" and
    "gtk/menus-traditional.ui".
    
    It is also possible to provide the menus manually using
    [gtk.application.Application.setAppMenu] and [gtk.application.Application.setMenubar].
    
    #GtkApplication will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path.  This allows your application to easily store its icons as
    resources.  See [gtk.icon_theme.IconTheme.addResourcePath] for more
    information.
    
    If there is a resource located at "gtk/help-overlay.ui" which
    defines a #GtkShortcutsWindow with ID "help_overlay" then GtkApplication
    associates an instance of this shortcuts window with each
    #GtkApplicationWindow and sets up keyboard accelerators (Control-F1
    and Control-?) to open it. To create a menu item that displays the
    shortcuts window, associate the item with the action win.show-help-overlay.
    
    ## A simple application ## {#gtkapplication}
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/examples/bp/bloatpad.c)
    
    GtkApplication optionally registers with a session manager
    of the users session (if you set the #GtkApplication:register-session
    property) and offers various functionality related to the session
    life-cycle.
    
    An application can block various ways to end the session with
    the [gtk.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## See Also ## {#seealso}
    [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
    [Getting Started with GTK+: Basics](https://developer.gnome.org/gtk3/stable/gtk-getting-started.html#id-1.2.3.3)
*/
struct GtkApplication
{
  /** */
  GApplication parent;

  /** */
  GtkApplicationPrivate* priv;
}

/** */
struct GtkApplicationClass
{
  /**
      The parent class.
  */
  GApplicationClass parentClass;

  /**
      Signal emitted when a #GtkWindow is added to
         application through [gtk.application.Application.addWindow].
  */
  extern(C) void function(GtkApplication* application, GtkWindow* window) windowAdded;

  /**
      Signal emitted when a #GtkWindow is removed from
         application, either as a side-effect of being destroyed or
         explicitly through [gtk.application.Application.removeWindow].
  */
  extern(C) void function(GtkApplication* application, GtkWindow* window) windowRemoved;

  /** */
  void*[12] padding;
}

/** */
struct GtkApplicationPrivate;

/**
    #GtkApplicationWindow is a #GtkWindow subclass that offers some
    extra functionality for better integration with #GtkApplication
    features.  Notably, it can handle both the application menu as well
    as the menubar. See [gtk.application.Application.setAppMenu] and
    [gtk.application.Application.setMenubar].
    
    This class implements the #GActionGroup and #GActionMap interfaces,
    to let you add window-specific actions that will be exported by the
    associated #GtkApplication, together with its application-wide
    actions.  Window-specific actions are prefixed with the “win.”
    prefix and application-wide actions are prefixed with the “app.”
    prefix.  Actions must be addressed with the prefixed name when
    referring to them from a #GMenuModel.
    
    Note that widgets that are placed inside a #GtkApplicationWindow
    can also activate these actions, if they implement the
    #GtkActionable interface.
    
    As with #GtkApplication, the GDK lock will be acquired when
    processing actions arriving from other processes and should therefore
    be held when activating actions locally (if GDK threads are enabled).
    
    The settings #GtkSettings:gtk-shell-shows-app-menu and
    #GtkSettings:gtk-shell-shows-menubar tell GTK+ whether the
    desktop environment is showing the application menu and menubar
    models outside the application as part of the desktop shell.
    For instance, on OS X, both menus will be displayed remotely;
    on Windows neither will be. gnome-shell (starting with version 3.4)
    will display the application menu, but not the menubar.
    
    If the desktop environment does not display the menubar, then
    #GtkApplicationWindow will automatically show a #GtkMenuBar for it.
    This behaviour can be overridden with the #GtkApplicationWindow:show-menubar
    property. If the desktop environment does not display the application
    menu, then it will automatically be included in the menubar or in the
    windows client-side decorations.
    
    ## A GtkApplicationWindow with a menubar
    
    ```c
    GtkApplication *app = gtk_application_new ("org.gtk.test", 0);
    
    GtkBuilder *builder = gtk_builder_new_from_string (
        "<interface>"
        "  <menu id='menubar'>"
        "    <submenu label='_Edit'>"
        "      <item label='_Copy' action='win.copy'/>"
        "      <item label='_Paste' action='win.paste'/>"
        "    </submenu>"
        "  </menu>"
        "</interface>",
        -1);
    
    GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder,
                                                                "menubar"));
    gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
    g_object_unref (builder);
    
    // ...
    
    GtkWidget *window = gtk_application_window_new (app);
    ```
    
    ## Handling fallback yourself
    
    [A simple example](https://git.gnome.org/browse/gtk+/tree/examples/sunny.c)
    
    The XML format understood by #GtkBuilder for #GMenuModel consists
    of a toplevel `<menu>` element, which contains one or more `<item>`
    elements. Each `<item>` element contains `<attribute>` and `<link>`
    elements with a mandatory name attribute. `<link>` elements have the
    same content model as `<menu>`. Instead of `<link name="submenu>` or
    `<link name="section">`, you can use `<submenu>` or `<section>`
    elements.
    
    Attribute values can be translated using gettext, like other #GtkBuilder
    content. `<attribute>` elements can be marked for translation with a
    `translatable="yes"` attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the #GtkBuilder must have been given the gettext
    domain to use.
    
    The following attributes are used when constructing menu items:
    $(LIST
      * "label": a user-visible string to display
      * "action": the prefixed name of the action to trigger
      * "target": the parameter to use when activating the action
      * "icon" and "verb-icon": names of icons that may be displayed
      * "submenu-action": name of an action that may be used to determine
           if a submenu can be opened
      * "hidden-when": a string used to determine when the item will be hidden.
           Possible values include "action-disabled", "action-missing", "macos-menubar".
    )
      
    The following attributes are used when constructing sections:
    $(LIST
      * "label": a user-visible string to use as section heading
      * "display-hint": a string used to determine special formatting for the section.
          Possible values include "horizontal-buttons".
      * "text-direction": a string used to determine the #GtkTextDirection to use
          when "display-hint" is set to "horizontal-buttons". Possible values
          include "rtl", "ltr", and "none".
    )
      
    The following attributes are used when constructing submenus:
    $(LIST
      * "label": a user-visible string to display
      * "icon": icon name to display
    )
*/
struct GtkApplicationWindow
{
  /** */
  GtkWindow parentInstance;

  /** */
  GtkApplicationWindowPrivate* priv;
}

/** */
struct GtkApplicationWindowClass
{
  /**
      The parent class.
  */
  GtkWindowClass parentClass;

  /** */
  void*[14] padding;
}

/** */
struct GtkApplicationWindowPrivate;

/**
    GtkArrow should be used to draw simple arrows that need to point in
    one of the four cardinal directions (up, down, left, or right).  The
    style of the arrow can be one of shadow in, shadow out, etched in, or
    etched out.  Note that these directions and style types may be
    amended in versions of GTK+ to come.
    
    GtkArrow will fill any space alloted to it, but since it is inherited
    from #GtkMisc, it can be padded and/or aligned, to fill exactly the
    space the programmer desires.
    
    Arrows are created with a call to [gtk.arrow.Arrow.new_].  The direction or
    style of an arrow can be changed after creation by using [gtk.arrow.Arrow.set].
    
    GtkArrow has been deprecated; you can simply use a #GtkImage with a
    suitable icon name, such as “pan-down-symbolic“. When replacing
    GtkArrow by an image, pay attention to the fact that GtkArrow is
    doing automatic flipping between #GTK_ARROW_LEFT and #GTK_ARROW_RIGHT,
    depending on the text direction. To get the same effect with an image,
    use the icon names “pan-start-symbolic“ and “pan-end-symbolic“, which
    react to the text direction.
*/
struct GtkArrow
{
  /** */
  GtkMisc misc;

  /** */
  GtkArrowPrivate* priv;
}

/** */
struct GtkArrowAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkArrowAccessiblePrivate* priv;
}

/** */
struct GtkArrowAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkArrowAccessiblePrivate;

/** */
struct GtkArrowClass
{
  /** */
  GtkMiscClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkArrowPrivate;

/**
    The #GtkAspectFrame is useful when you want
    pack a widget so that it can resize but always retains
    the same aspect ratio. For instance, one might be
    drawing a small preview of a larger image. #GtkAspectFrame
    derives from #GtkFrame, so it can draw a label and
    a frame around the child. The frame will be
    “shrink-wrapped” to the size of the child.
    
    # CSS nodes
    
    GtkAspectFrame uses a CSS node with name frame.
*/
struct GtkAspectFrame
{
  /** */
  GtkFrame frame;

  /** */
  GtkAspectFramePrivate* priv;
}

/** */
struct GtkAspectFrameClass
{
  /**
      The parent class.
  */
  GtkFrameClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkAspectFramePrivate;

/**
    A #GtkAssistant is a widget used to represent a generally complex
    operation splitted in several steps, guiding the user through its
    pages and controlling the page flow to collect the necessary data.
    
    The design of GtkAssistant is that it controls what buttons to show
    and to make sensitive, based on what it knows about the page sequence
    and the [type][GtkAssistantPageType] of each page,
    in addition to state information like the page
    [completion][gtk-assistant-set-page-complete]
    and [committed][gtk-assistant-commit] status.
    
    If you have a case that doesn’t quite fit in #GtkAssistants way of
    handling buttons, you can use the #GTK_ASSISTANT_PAGE_CUSTOM page
    type and handle buttons yourself.
    
    # GtkAssistant as GtkBuildable
    
    The GtkAssistant implementation of the #GtkBuildable interface
    exposes the @action_area as internal children with the name
    “action_area”.
    
    To add pages to an assistant in #GtkBuilder, simply add it as a
    child to the GtkAssistant object, and set its child properties
    as necessary.
    
    # CSS nodes
    
    GtkAssistant has a single CSS node with the name assistant.
*/
struct GtkAssistant
{
  /** */
  GtkWindow parent;

  /** */
  GtkAssistantPrivate* priv;
}

/** */
struct GtkAssistantClass
{
  /**
      The parent class.
  */
  GtkWindowClass parentClass;

  /**
      Signal emitted when a new page is set as the assistant’s current page, before making the new page visible.
  */
  extern(C) void function(GtkAssistant* assistant, GtkWidget* page) prepare;

  /**
      Signal emitted when the apply button is clicked.
  */
  extern(C) void function(GtkAssistant* assistant) apply;

  /**
      Signal emitted either when the close button or last page apply button is clicked.
  */
  extern(C) void function(GtkAssistant* assistant) close;

  /**
      Signal emitted when the cancel button is clicked.
  */
  extern(C) void function(GtkAssistant* assistant) cancel;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;
}

/** */
struct GtkAssistantPrivate;

/**
    The #GtkBin widget is a container with just one child.
    It is not very useful itself, but it is useful for deriving subclasses,
    since it provides common code needed for handling a single child widget.
    
    Many GTK+ widgets are subclasses of #GtkBin, including #GtkWindow,
    #GtkButton, #GtkFrame, #GtkHandleBox or #GtkScrolledWindow.
*/
struct GtkBin
{
  /** */
  GtkContainer container;

  /** */
  GtkBinPrivate* priv;
}

/** */
struct GtkBinClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkBinPrivate;

/**
    A #GtkBindingArg holds the data associated with
    an argument for a key binding signal emission as
    stored in #GtkBindingSignal.
*/
struct GtkBindingArg
{
  /**
      implementation detail
  */
  GType argType;

  /** */
  /** */
  union DType
  {
    /** */
    glong longData;

    /** */
    double doubleData;

    /** */
    char* stringData;
  }

  DType d;
}

/**
    Each key binding element of a binding sets binding list is
    represented by a GtkBindingEntry.
*/
struct GtkBindingEntry
{
  /**
      key value to match
  */
  uint keyval;

  /**
      key modifiers to match
  */
  GdkModifierType modifiers;

  /**
      binding set this entry belongs to
  */
  GtkBindingSet* bindingSet;

  /**
      implementation detail
  */
  uint destroyed;

  /**
      implementation detail
  */
  uint inEmission;

  /**
      implementation detail
  */
  uint marksUnbound;

  /**
      linked list of entries maintained by binding set
  */
  GtkBindingEntry* setNext;

  /**
      implementation detail
  */
  GtkBindingEntry* hashNext;

  /**
      action signals of this entry
  */
  GtkBindingSignal* signals;
}

/**
    A binding set maintains a list of activatable key bindings.
    A single binding set can match multiple types of widgets.
    Similar to style contexts, can be matched by any information contained
    in a widgets #GtkWidgetPath. When a binding within a set is matched upon
    activation, an action signal is emitted on the target widget to carry out
    the actual activation.
*/
struct GtkBindingSet
{
  /**
      unique name of this binding set
  */
  char* setName;

  /**
      unused
  */
  int priority;

  /**
      unused
  */
  GSList* widgetPathPspecs;

  /**
      unused
  */
  GSList* widgetClassPspecs;

  /**
      unused
  */
  GSList* classBranchPspecs;

  /**
      the key binding entries in this binding set
  */
  GtkBindingEntry* entries;

  /**
      implementation detail
  */
  GtkBindingEntry* current;

  /**
      whether this binding set stems from a CSS file and is reset upon theme changes
  */
  uint parsed;
}

/**
    A GtkBindingSignal stores the necessary information to
    activate a widget in response to a key press via a signal
    emission.
*/
struct GtkBindingSignal
{
  /**
      implementation detail
  */
  GtkBindingSignal* next;

  /**
      the action signal to be emitted
  */
  char* signalName;

  /**
      number of arguments specified for the signal
  */
  uint nArgs;

  /**
      the arguments specified for the signal
  */
  GtkBindingArg* args;
}

/** */
struct GtkBooleanCellAccessible
{
  /** */
  GtkRendererCellAccessible parent;

  /** */
  GtkBooleanCellAccessiblePrivate* priv;
}

/** */
struct GtkBooleanCellAccessibleClass
{
  /** */
  GtkRendererCellAccessibleClass parentClass;
}

/** */
struct GtkBooleanCellAccessiblePrivate;

/**
    A struct that specifies a border around a rectangular area
    that can be of different width on each side.
*/
struct GtkBorder
{
  /**
      The width of the left border
  */
  short left;

  /**
      The width of the right border
  */
  short right;

  /**
      The width of the top border
  */
  short top;

  /**
      The width of the bottom border
  */
  short bottom;
}

/**
    The GtkBox widget arranges child widgets into a single row or column,
    depending upon the value of its #GtkOrientable:orientation property. Within
    the other dimension, all children are allocated the same size. Of course,
    the #GtkWidget:halign and #GtkWidget:valign properties can be used on
    the children to influence their allocation.
    
    GtkBox uses a notion of packing. Packing refers
    to adding widgets with reference to a particular position in a
    #GtkContainer. For a GtkBox, there are two reference positions: the
    start and the end of the box.
    For a vertical #GtkBox, the start is defined as the top of the box and
    the end is defined as the bottom. For a horizontal #GtkBox the start
    is defined as the left side and the end is defined as the right side.
    
    Use repeated calls to [gtk.box.Box.packStart] to pack widgets into a
    GtkBox from start to end. Use [gtk.box.Box.packEnd] to add widgets from
    end to start. You may intersperse these calls and add widgets from
    both ends of the same GtkBox.
    
    Because GtkBox is a #GtkContainer, you may also use [gtk.container.Container.add]
    to insert widgets into the box, and they will be packed with the default
    values for expand and fill child properties. Use [gtk.container.Container.remove]
    to remove widgets from the GtkBox.
    
    Use [gtk.box.Box.setHomogeneous] to specify whether or not all children
    of the GtkBox are forced to get the same amount of space.
    
    Use [gtk.box.Box.setSpacing] to determine how much space will be
    minimally placed between all children in the GtkBox. Note that
    spacing is added between the children, while
    padding added by [gtk.box.Box.packStart] or [gtk.box.Box.packEnd] is added
    on either side of the widget it belongs to.
    
    Use [gtk.box.Box.reorderChild] to move a GtkBox child to a different
    place in the box.
    
    Use [gtk.box.Box.setChildPacking] to reset the expand,
    fill and padding child properties.
    Use [gtk.box.Box.queryChildPacking] to query these fields.
    
    # CSS nodes
    
    GtkBox uses a single CSS node with name box.
    
    In horizontal orientation, the nodes of the children are always arranged
    from left to right. So :first-child will always select the leftmost child,
    regardless of text direction.
*/
struct GtkBox
{
  /** */
  GtkContainer container;

  /** */
  GtkBoxPrivate* priv;
}

/** */
struct GtkBoxClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkBoxPrivate;

/**
    GtkBuildable allows objects to extend and customize their deserialization
    from [GtkBuilder UI descriptions][BUILDER-UI].
    The interface includes methods for setting names and properties of objects,
    parsing custom tags and constructing child objects.
    
    The GtkBuildable interface is implemented by all widgets and
    many of the non-widget objects that are provided by GTK+. The
    main user of this interface is #GtkBuilder. There should be
    very little need for applications to call any of these functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    #GtkBuilder format or run any extra routines at deserialization time.
*/
struct GtkBuildable;

/**
    The #GtkBuildableIface interface contains method that are
    necessary to allow #GtkBuilder to construct an object from
    a #GtkBuilder UI definition.
*/
struct GtkBuildableIface
{
  /**
      the parent class
  */
  GTypeInterface gIface;

  /**
      Stores the name attribute given in the GtkBuilder UI definition.
       #GtkWidget stores the name as object data. Implement this method if your
       object has some notion of “name” and it makes sense to map the XML name
       attribute to it.
  */
  extern(C) void function(GtkBuildable* buildable, const(char)* name) setName;

  /**
      The getter corresponding to @set_name. Implement this
       if you implement @set_name.
  */
  extern(C) const(char)* function(GtkBuildable* buildable) getName;

  /**
      Adds a child. The @type parameter can be used to
       differentiate the kind of child. #GtkContainer implements this
       to add add a child widget to the container, #GtkNotebook uses
       the @type to distinguish between page labels (of type "page-label")
       and normal children.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* type) addChild;

  /**
      Sets a property of a buildable object.
       It is normally not necessary to implement this, [gobject.object.ObjectWrap.setProperty]
       is used by default. #GtkWindow implements this to delay showing itself
       (i.e. setting the #GtkWidget:visible property) until the whole interface
       is created.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name, const(GValue)* value) setBuildableProperty;

  /**
      Constructs a child of a buildable that has been
       specified as “constructor” in the UI definition. #GtkUIManager implements
       this to reference to a widget created in a `<ui>` tag which is outside
       of the normal GtkBuilder UI definition hierarchy.  A reference to the
       constructed object is returned and becomes owned by the caller.
  */
  extern(C) GObject* function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name) constructChild;

  /**
      Implement this if the buildable needs to parse
       content below `<child>`. To handle an element, the implementation
       must fill in the @parser and @user_data and return true.
       #GtkWidget implements this to parse keyboard accelerators specified
       in `<accelerator>` elements. #GtkContainer implements it to map
       properties defined via `<packing>` elements to child properties.
       Note that @user_data must be freed in @custom_tag_end or @custom_finished.
  */
  extern(C) gboolean function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, GMarkupParser* parser, void** data) customTagStart;

  /**
      Called for the end tag of each custom element that is
       handled by the buildable (see @custom_tag_start).
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void** data) customTagEnd;

  /**
      Called for each custom tag handled by the buildable
       when the builder finishes parsing (see @custom_tag_start)
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) customFinished;

  /**
      Called when a builder finishes the parsing
       of a UI definition. It is normally not necessary to implement this,
       unless you need to perform special cleanup actions. #GtkWindow sets
       the #GtkWidget:visible property here.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder) parserFinished;

  /**
      Returns an internal child of a buildable.
       #GtkDialog implements this to give access to its @vbox, making
       it possible to add children to the vbox in a UI definition.
       Implement this if the buildable has internal children that may
       need to be accessed from a UI definition.
  */
  extern(C) GObject* function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* childname) getInternalChild;
}

/**
    A GtkBuilder is an auxiliary object that reads textual descriptions
    of a user interface and instantiates the described objects. To create
    a GtkBuilder from a user interface description, call
    [gtk.builder.Builder.newFromFile], [gtk.builder.Builder.newFromResource] or
    [gtk.builder.Builder.newFromString].
    
    In the (unusual) case that you want to add user interface
    descriptions from multiple sources to the same GtkBuilder you can
    call [gtk.builder.Builder.new_] to get an empty builder and populate it by
    (multiple) calls to [gtk.builder.Builder.addFromFile],
    [gtk.builder.Builder.addFromResource] or [gtk.builder.Builder.addFromString].
    
    A GtkBuilder holds a reference to all objects that it has constructed
    and drops these references when it is finalized. This finalization can
    cause the destruction of non-widget objects or widgets which are not
    contained in a toplevel window. For toplevel windows constructed by a
    builder, it is the responsibility of the user to call [gtk.widget.Widget.destroy]
    to get rid of them and all the widgets they contain.
    
    The functions [gtk.builder.Builder.getObject] and [gtk.builder.Builder.getObjects]
    can be used to access the widgets in the interface by the names assigned
    to them inside the UI description. Toplevel windows returned by these
    functions will stay around until the user explicitly destroys them
    with [gtk.widget.Widget.destroy]. Other widgets will either be part of a
    larger hierarchy constructed by the builder (in which case you should
    not have to worry about their lifecycle), or without a parent, in which
    case they have to be added to some container to make use of them.
    Non-widget objects need to be reffed with [gobject.object.ObjectWrap.ref_] to keep them
    beyond the lifespan of the builder.
    
    The function [gtk.builder.Builder.connectSignals] and variants thereof can be
    used to connect handlers to the named signals in the description.
    
    # GtkBuilder UI Definitions # {#BUILDER-UI}
    
    GtkBuilder parses textual descriptions of user interfaces which are
    specified in an XML format which can be roughly described by the
    RELAX NG schema below. We refer to these descriptions as “GtkBuilder
    UI definitions” or just “UI definitions” if the context is clear.
    Do not confuse GtkBuilder UI Definitions with
    [GtkUIManager UI Definitions][XML-UI], which are more limited in scope.
    It is common to use `.ui` as the filename extension for files containing
    GtkBuilder UI definitions.
    
    [RELAX NG Compact Syntax](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/gtk/gtkbuilder.rnc)
    
    The toplevel element is `<interface>`. It optionally takes a “domain”
    attribute, which will make the builder look for translated strings
    using dgettext() in the domain specified. This can also be done by
    calling [gtk.builder.Builder.setTranslationDomain] on the builder.
    Objects are described by `<object>` elements, which can contain
    `<property>` elements to set properties, `<signal>` elements which
    connect signals to handlers, and `<child>` elements, which describe
    child objects (most often widgets inside a container, but also e.g.
    actions in an action group, or columns in a tree model). A `<child>`
    element contains an `<object>` element which describes the child object.
    The target toolkit version(s) are described by `<requires>` elements,
    the “lib” attribute specifies the widget library in question (currently
    the only supported value is “gtk+”) and the “version” attribute specifies
    the target version in the form `<major>.<minor>`. The builder will error
    out if the version requirements are not met.
    
    Typically, the specific kind of object represented by an `<object>`
    element is specified by the “class” attribute. If the type has not
    been loaded yet, GTK+ tries to find the `get_type()` function from the
    class name by applying heuristics. This works in most cases, but if
    necessary, it is possible to specify the name of the get_type() function
    explictly with the "type-func" attribute. As a special case, GtkBuilder
    allows to use an object that has been constructed by a #GtkUIManager in
    another part of the UI definition by specifying the id of the #GtkUIManager
    in the “constructor” attribute and the name of the object in the “id”
    attribute.
    
    Objects may be given a name with the “id” attribute, which allows the
    application to retrieve them from the builder with [gtk.builder.Builder.getObject].
    An id is also necessary to use the object as property value in other
    parts of the UI definition. GTK+ reserves ids starting and ending
    with `___` (3 underscores) for its own purposes.
    
    Setting properties of objects is pretty straightforward with the
    `<property>` element: the “name” attribute specifies the name of the
    property, and the content of the element specifies the value.
    If the “translatable” attribute is set to a true value, GTK+ uses
    gettext() (or dgettext() if the builder has a translation domain set)
    to find a translation for the value. This happens before the value
    is parsed, so it can be used for properties of any type, but it is
    probably most useful for string properties. It is also possible to
    specify a context to disambiguate short strings, and comments which
    may help the translators.
    
    GtkBuilder can parse textual representations for the most common
    property types: characters, strings, integers, floating-point numbers,
    booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
    as true, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
    as false), enumerations (can be specified by their name, nick or
    integer value), flags (can be specified by their name, nick, integer
    value, optionally combined with “|”, e.g. “GTK_VISIBLE|GTK_REALIZED”)
    and colors (in a format understood by [gdk.rgba.RGBA.parse]).
    
    GVariants can be specified in the format understood by [glib.variant.Variant.parse],
    and pixbufs can be specified as a filename of an image file to load.
    
    Objects can be referred to by their name and by default refer to
    objects declared in the local xml fragment and objects exposed via
    [gtk.builder.Builder.exposeObject]. In general, GtkBuilder allows forward
    references to objects — declared in the local xml; an object doesn’t
    have to be constructed before it can be referred to. The exception
    to this rule is that an object has to be constructed before it can
    be used as the value of a construct-only property.
    
    It is also possible to bind a property value to another object's
    property value using the attributes
    "bind-source" to specify the source object of the binding,
    "bind-property" to specify the source property and optionally
    "bind-flags" to specify the binding flags.
    Internally builder implements this using GBinding objects.
    For more information see [gobject.object.ObjectWrap.bindProperty]
    
    Signal handlers are set up with the `<signal>` element. The “name”
    attribute specifies the name of the signal, and the “handler” attribute
    specifies the function to connect to the signal. By default, GTK+ tries
    to find the handler using [gmodule.module_.Module.symbol], but this can be changed by
    passing a custom #GtkBuilderConnectFunc to
    [gtk.builder.Builder.connectSignalsFull]. The remaining attributes, “after”,
    “swapped” and “object”, have the same meaning as the corresponding
    parameters of the [gobject.global.signalConnectObject] or
    [gobject.global.signalConnectData] functions. A “last_modification_time”
    attribute is also allowed, but it does not have a meaning to the
    builder.
    
    Sometimes it is necessary to refer to widgets which have implicitly
    been constructed by GTK+ as part of a composite widget, to set
    properties on them or to add further children (e.g. the @vbox of
    a #GtkDialog). This can be achieved by setting the “internal-child”
    property of the `<child>` element to a true value. Note that GtkBuilder
    still requires an `<object>` element for the internal child, even if it
    has already been constructed.
    
    A number of widgets have different places where a child can be added
    (e.g. tabs vs. page content in notebooks). This can be reflected in
    a UI definition by specifying the “type” attribute on a `<child>`
    The possible values for the “type” attribute are described in the
    sections describing the widget-specific portions of UI definitions.
    
    # A GtkBuilder UI Definition
    
    ```xml
    <interface>
      <object class="GtkDialog" id="dialog1">
        <child internal-child="vbox">
          <object class="GtkBox" id="vbox1">
            <property name="border-width">10</property>
            <child internal-child="action_area">
              <object class="GtkButtonBox" id="hbuttonbox1">
                <property name="border-width">20</property>
                <child>
                  <object class="GtkButton" id="ok_button">
                    <property name="label">gtk-ok</property>
                    <property name="use-stock">TRUE</property>
                    <signal name="clicked" handler="ok_button_clicked"/>
                  </object>
                </child>
              </object>
            </child>
          </object>
        </child>
      </object>
    </interface>
    ```
    
    Beyond this general structure, several object classes define their
    own XML DTD fragments for filling in the ANY placeholders in the DTD
    above. Note that a custom element in a `<child>` element gets parsed by
    the custom tag handler of the parent object, while a custom element in
    an `<object>` element gets parsed by the custom tag handler of the object.
    
    These XML fragments are explained in the documentation of the
    respective objects.
    
    Additionally, since 3.10 a special `<template>` tag has been added
    to the format allowing one to define a widget class’s components.
    See the [GtkWidget documentation][composite-templates] for details.
*/
struct GtkBuilder
{
  /** */
  GObject parentInstance;

  /** */
  GtkBuilderPrivate* priv;
}

/** */
struct GtkBuilderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GType function(GtkBuilder* builder, const(char)* typeName) getTypeFromName;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkBuilderPrivate;

/**
    The #GtkButton widget is generally used to trigger a callback function that is
    called when the button is pressed.  The various signals and how to use them
    are outlined below.
    
    The #GtkButton widget can hold any valid child widget.  That is, it can hold
    almost any other standard #GtkWidget.  The most commonly used child is the
    #GtkLabel.
    
    # CSS nodes
    
    GtkButton has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an
    image or label, respectively. It may also receive the .flat style class.
    
    Other style classes that are commonly used with GtkButton include
    .suggested-action and .destructive-action. In special cases, buttons
    can be made round by adding the .circular style class.
    
    Button-like widgets like #GtkToggleButton, #GtkMenuButton, #GtkVolumeButton,
    #GtkLockButton, #GtkColorButton, #GtkFontButton or #GtkFileChooserButton use
    style classes such as .toggle, .popup, .scale, .lock, .color, .font, .file
    to differentiate themselves from a plain GtkButton.
*/
struct GtkButton
{
  /** */
  GtkBin bin;

  /** */
  GtkButtonPrivate* priv;
}

/** */
struct GtkButtonAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkButtonAccessiblePrivate* priv;
}

/** */
struct GtkButtonAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkButtonAccessiblePrivate;

/** */
struct GtkButtonBox
{
  /** */
  GtkBox box;

  /** */
  GtkButtonBoxPrivate* priv;
}

/** */
struct GtkButtonBoxClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkButtonBoxPrivate;

/** */
struct GtkButtonClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Signal emitted when the button is pressed. Deprecated: 2.8.
  */
  extern(C) void function(GtkButton* button) pressed;

  /**
      Signal emitted when the button is released. Deprecated: 2.8.
  */
  extern(C) void function(GtkButton* button) released;

  /**
      Signal emitted when the button has been activated (pressed and released).
  */
  extern(C) void function(GtkButton* button) clicked;

  /**
      Signal emitted when the pointer enters the button. Deprecated: 2.8.
  */
  extern(C) void function(GtkButton* button) enter;

  /**
      Signal emitted when the pointer leaves the button. Deprecated: 2.8.
  */
  extern(C) void function(GtkButton* button) leave;

  /**
      Signal that causes the button to animate press then
         release. Applications should never connect to this signal, but use
         the @clicked signal.
  */
  extern(C) void function(GtkButton* button) activate;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkButtonPrivate;

/**
    #GtkCalendar is a widget that displays a Gregorian calendar, one month
    at a time. It can be created with [gtk.calendar.Calendar.new_].
    
    The month and year currently displayed can be altered with
    [gtk.calendar.Calendar.selectMonth]. The exact day can be selected from the
    displayed month using [gtk.calendar.Calendar.selectDay].
    
    To place a visual marker on a particular day, use [gtk.calendar.Calendar.markDay]
    and to remove the marker, [gtk.calendar.Calendar.unmarkDay]. Alternative, all
    marks can be cleared with [gtk.calendar.Calendar.clearMarks].
    
    The way in which the calendar itself is displayed can be altered using
    [gtk.calendar.Calendar.setDisplayOptions].
    
    The selected date can be retrieved from a #GtkCalendar using
    [gtk.calendar.Calendar.getDate].
    
    Users should be aware that, although the Gregorian calendar is the
    legal calendar in most countries, it was adopted progressively
    between 1582 and 1929. Display before these dates is likely to be
    historically incorrect.
*/
struct GtkCalendar
{
  /** */
  GtkWidget widget;

  /** */
  GtkCalendarPrivate* priv;
}

/** */
struct GtkCalendarClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkCalendar* calendar) monthChanged;

  /** */
  extern(C) void function(GtkCalendar* calendar) daySelected;

  /** */
  extern(C) void function(GtkCalendar* calendar) daySelectedDoubleClick;

  /** */
  extern(C) void function(GtkCalendar* calendar) prevMonth;

  /** */
  extern(C) void function(GtkCalendar* calendar) nextMonth;

  /** */
  extern(C) void function(GtkCalendar* calendar) prevYear;

  /** */
  extern(C) void function(GtkCalendar* calendar) nextYear;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCalendarPrivate;

/** */
struct GtkCellAccessible
{
  /** */
  GtkAccessible parent;

  /** */
  GtkCellAccessiblePrivate* priv;
}

/** */
struct GtkCellAccessibleClass
{
  /** */
  GtkAccessibleClass parentClass;

  /** */
  extern(C) void function(GtkCellAccessible* cell, gboolean emitSignal) updateCache;
}

/** */
struct GtkCellAccessibleParent;

/** */
struct GtkCellAccessibleParentIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, int* x, int* y, int* width, int* height, AtkCoordType coordType) getCellExtents;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, GdkRectangle* cellRect) getCellArea;

  /** */
  extern(C) gboolean function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) grabFocus;

  /** */
  extern(C) int function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) getChildIndex;

  /** */
  extern(C) GtkCellRendererState function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) getRendererState;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) expandCollapse;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) activate;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) edit;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, AtkRelationSet* relationset) updateRelationset;

  /** */
  extern(C) void function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, int* row, int* column) getCellPosition;

  /** */
  extern(C) GPtrArray* function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) getColumnHeaderCells;

  /** */
  extern(C) GPtrArray* function(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) getRowHeaderCells;
}

/** */
struct GtkCellAccessiblePrivate;

/**
    The #GtkCellArea is an abstract class for #GtkCellLayout widgets
    (also referred to as "layouting widgets") to interface with an
    arbitrary number of #GtkCellRenderers and interact with the user
    for a given #GtkTreeModel row.
    
    The cell area handles events, focus navigation, drawing and
    size requests and allocations for a given row of data.
    
    Usually users dont have to interact with the #GtkCellArea directly
    unless they are implementing a cell-layouting widget themselves.
    
    # Requesting area sizes
    
    As outlined in
    [GtkWidget’s geometry management section][geometry-management],
    GTK+ uses a height-for-width
    geometry management system to compute the sizes of widgets and user
    interfaces. #GtkCellArea uses the same semantics to calculate the
    size of an area for an arbitrary number of #GtkTreeModel rows.
    
    When requesting the size of a cell area one needs to calculate
    the size for a handful of rows, and this will be done differently by
    different layouting widgets. For instance a #GtkTreeViewColumn
    always lines up the areas from top to bottom while a #GtkIconView
    on the other hand might enforce that all areas received the same
    width and wrap the areas around, requesting height for more cell
    areas when allocated less width.
    
    It’s also important for areas to maintain some cell
    alignments with areas rendered for adjacent rows (cells can
    appear “columnized” inside an area even when the size of
    cells are different in each row). For this reason the #GtkCellArea
    uses a #GtkCellAreaContext object to store the alignments
    and sizes along the way (as well as the overall largest minimum
    and natural size for all the rows which have been calculated
    with the said context).
    
    The #GtkCellAreaContext is an opaque object specific to the
    #GtkCellArea which created it (see [gtk.cell_area.CellArea.createContext]).
    The owning cell-layouting widget can create as many contexts as
    it wishes to calculate sizes of rows which should receive the
    same size in at least one orientation (horizontally or vertically),
    However, it’s important that the same #GtkCellAreaContext which
    was used to request the sizes for a given #GtkTreeModel row be
    used when rendering or processing events for that row.
    
    In order to request the width of all the rows at the root level
    of a #GtkTreeModel one would do the following:
    
    ```c
    GtkTreeIter iter;
    gint        minimum_width;
    gint        natural_width;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_get_preferred_width (area, context, widget, NULL, NULL);
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    gtk_cell_area_context_get_preferred_width (context, &minimum_width, &natural_width);
    ```
    
    Note that in this example it’s not important to observe the
    returned minimum and natural width of the area for each row
    unless the cell-layouting object is actually interested in the
    widths of individual rows. The overall width is however stored
    in the accompanying #GtkCellAreaContext object and can be consulted
    at any time.
    
    This can be useful since #GtkCellLayout widgets usually have to
    support requesting and rendering rows in treemodels with an
    exceedingly large amount of rows. The #GtkCellLayout widget in
    that case would calculate the required width of the rows in an
    idle or timeout source (see [glib.global.timeoutAdd]) and when the widget
    is requested its actual width in #GtkWidgetClass.get_preferred_width()
    it can simply consult the width accumulated so far in the
    #GtkCellAreaContext object.
    
    A simple example where rows are rendered from top to bottom and
    take up the full width of the layouting widget would look like:
    
    ```c
    static void
    foo_get_preferred_width (GtkWidget       *widget,
                             gint            *minimum_size,
                             gint            *natural_size)
    {
      Foo        *foo  = FOO (widget);
      FooPrivate *priv = foo->priv;
    
      foo_ensure_at_least_one_handfull_of_rows_have_been_requested (foo);
    
      gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
    }
    ```
    
    In the above example the Foo widget has to make sure that some
    row sizes have been calculated (the amount of rows that Foo judged
    was appropriate to request space for in a single timeout iteration)
    before simply returning the amount of space required by the area via
    the #GtkCellAreaContext.
    
    Requesting the height for width (or width for height) of an area is
    a similar task except in this case the #GtkCellAreaContext does not
    store the data (actually, it does not know how much space the layouting
    widget plans to allocate it for every row. It’s up to the layouting
    widget to render each row of data with the appropriate height and
    width which was requested by the #GtkCellArea).
    
    In order to request the height for width of all the rows at the
    root level of a #GtkTreeModel one would do the following:
    
    ```c
    GtkTreeIter iter;
    gint        minimum_height;
    gint        natural_height;
    gint        full_minimum_height = 0;
    gint        full_natural_height = 0;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_get_preferred_height_for_width (area, context, widget,
                                                      width, &minimum_height, &natural_height);
    
        if (width_is_for_allocation)
           cache_row_height (&iter, minimum_height, natural_height);
    
        full_minimum_height += minimum_height;
        full_natural_height += natural_height;
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    ```
    
    Note that in the above example we would need to cache the heights
    returned for each row so that we would know what sizes to render the
    areas for each row. However we would only want to really cache the
    heights if the request is intended for the layouting widgets real
    allocation.
    
    In some cases the layouting widget is requested the height for an
    arbitrary for_width, this is a special case for layouting widgets
    who need to request size for tens of thousands  of rows. For this
    case it’s only important that the layouting widget calculate
    one reasonably sized chunk of rows and return that height
    synchronously. The reasoning here is that any layouting widget is
    at least capable of synchronously calculating enough height to fill
    the screen height (or scrolled window height) in response to a single
    call to #GtkWidgetClass.get_preferred_height_for_width(). Returning
    a perfect height for width that is larger than the screen area is
    inconsequential since after the layouting receives an allocation
    from a scrolled window it simply continues to drive the scrollbar
    values while more and more height is required for the row heights
    that are calculated in the background.
    
    # Rendering Areas
    
    Once area sizes have been aquired at least for the rows in the
    visible area of the layouting widget they can be rendered at
    #GtkWidgetClass.draw() time.
    
    A crude example of how to render all the rows at the root level
    runs as follows:
    
    ```c
    GtkAllocation allocation;
    GdkRectangle  cell_area = { 0, };
    GtkTreeIter   iter;
    gint          minimum_width;
    gint          natural_width;
    
    gtk_widget_get_allocation (widget, &allocation);
    cell_area.width = allocation.width;
    
    valid = gtk_tree_model_get_iter_first (model, &iter);
    while (valid)
      {
        cell_area.height = get_cached_height_for_row (&iter);
    
        gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);
        gtk_cell_area_render (area, context, widget, cr,
                              &cell_area, &cell_area, state_flags, FALSE);
    
        cell_area.y += cell_area.height;
    
        valid = gtk_tree_model_iter_next (model, &iter);
      }
    ```
    
    Note that the cached height in this example really depends on how
    the layouting widget works. The layouting widget might decide to
    give every row its minimum or natural height or, if the model content
    is expected to fit inside the layouting widget without scrolling, it
    would make sense to calculate the allocation for each row at
    #GtkWidget::size-allocate time using [gtk.global.distributeNaturalAllocation].
    
    # Handling Events and Driving Keyboard Focus
    
    Passing events to the area is as simple as handling events on any
    normal widget and then passing them to the [gtk.cell_area.CellArea.event]
    API as they come in. Usually #GtkCellArea is only interested in
    button events, however some customized derived areas can be implemented
    who are interested in handling other events. Handling an event can
    trigger the #GtkCellArea::focus-changed signal to fire; as well as
    #GtkCellArea::add-editable in the case that an editable cell was
    clicked and needs to start editing. You can call
    [gtk.cell_area.CellArea.stopEditing] at any time to cancel any cell editing
    that is currently in progress.
    
    The #GtkCellArea drives keyboard focus from cell to cell in a way
    similar to #GtkWidget. For layouting widgets that support giving
    focus to cells it’s important to remember to pass [gtk.types.CellRendererState.Focused]
    to the area functions for the row that has focus and to tell the
    area to paint the focus at render time.
    
    Layouting widgets that accept focus on cells should implement the
    #GtkWidgetClass.focus() virtual method. The layouting widget is always
    responsible for knowing where #GtkTreeModel rows are rendered inside
    the widget, so at #GtkWidgetClass.focus() time the layouting widget
    should use the #GtkCellArea methods to navigate focus inside the area
    and then observe the GtkDirectionType to pass the focus to adjacent
    rows and areas.
    
    A basic example of how the #GtkWidgetClass.focus() virtual method
    should be implemented:
    
    ```c
    static gboolean
    foo_focus (GtkWidget       *widget,
               GtkDirectionType direction)
    {
      Foo        *foo  = FOO (widget);
      FooPrivate *priv = foo->priv;
      gint        focus_row;
      gboolean    have_focus = FALSE;
    
      focus_row = priv->focus_row;
    
      if (!gtk_widget_has_focus (widget))
        gtk_widget_grab_focus (widget);
    
      valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, priv->focus_row);
      while (valid)
        {
          gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, FALSE, FALSE);
    
          if (gtk_cell_area_focus (priv->area, direction))
            {
               priv->focus_row = focus_row;
               have_focus = TRUE;
               break;
            }
          else
            {
              if (direction == GTK_DIR_RIGHT ||
                  direction == GTK_DIR_LEFT)
                break;
              else if (direction == GTK_DIR_UP ||
                       direction == GTK_DIR_TAB_BACKWARD)
               {
                  if (focus_row == 0)
                    break;
                  else
                   {
                      focus_row--;
                      valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, focus_row);
                   }
                }
              else
                {
                  if (focus_row == last_row)
                    break;
                  else
                    {
                      focus_row++;
                      valid = gtk_tree_model_iter_next (priv->model, &iter);
                    }
                }
            }
        }
        return have_focus;
    }
    ```
    
    Note that the layouting widget is responsible for matching the
    GtkDirectionType values to the way it lays out its cells.
    
    # Cell Properties
    
    The #GtkCellArea introduces cell properties for #GtkCellRenderers
    in very much the same way that #GtkContainer introduces
    [child properties][child-properties]
    for #GtkWidgets. This provides some general interfaces for defining
    the relationship cell areas have with their cells. For instance in a
    #GtkCellAreaBox a cell might “expand” and receive extra space when
    the area is allocated more than its full natural request, or a cell
    might be configured to “align” with adjacent rows which were requested
    and rendered with the same #GtkCellAreaContext.
    
    Use [gtk.cell_area_class.CellAreaClass.installCellProperty] to install cell
    properties for a cell area class and [gtk.cell_area_class.CellAreaClass.findCellProperty]
    or [gtk.cell_area_class.CellAreaClass.listCellProperties] to get information about
    existing cell properties.
    
    To set the value of a cell property, use [gtk.cell_area.CellArea.cellSetProperty],
    [gtk.cell_area.CellArea.cellSet] or [gtk.cell_area.CellArea.cellSetValist]. To obtain
    the value of a cell property, use [gtk.cell_area.CellArea.cellGetProperty],
    [gtk.cell_area.CellArea.cellGet] or [gtk.cell_area.CellArea.cellGetValist].
*/
struct GtkCellArea
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkCellAreaPrivate* priv;
}

/**
    The #GtkCellAreaBox renders cell renderers into a row or a column
    depending on its #GtkOrientation.
    
    GtkCellAreaBox uses a notion of packing. Packing
    refers to adding cell renderers with reference to a particular position
    in a #GtkCellAreaBox. There are two reference positions: the
    start and the end of the box.
    When the #GtkCellAreaBox is oriented in the [gtk.types.Orientation.Vertical]
    orientation, the start is defined as the top of the box and the end is
    defined as the bottom. In the [gtk.types.Orientation.Horizontal] orientation
    start is defined as the left side and the end is defined as the right
    side.
    
    Alignments of #GtkCellRenderers rendered in adjacent rows can be
    configured by configuring the #GtkCellAreaBox align child cell property
    with [gtk.cell_area.CellArea.cellSetProperty] or by specifying the "align"
    argument to [gtk.cell_area_box.CellAreaBox.packStart] and [gtk.cell_area_box.CellAreaBox.packEnd].
*/
struct GtkCellAreaBox
{
  /** */
  GtkCellArea parentInstance;

  /** */
  GtkCellAreaBoxPrivate* priv;
}

/** */
struct GtkCellAreaBoxClass
{
  /** */
  GtkCellAreaClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellAreaBoxPrivate;

/** */
struct GtkCellAreaClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /**
      adds a #GtkCellRenderer to the area.
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer) add;

  /**
      removes a #GtkCellRenderer from the area.
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer) remove;

  /**
      calls the #GtkCellCallback function on every #GtkCellRenderer in
          the area with the provided user data until the callback returns true.
  */
  extern(C) void function(GtkCellArea* area, GtkCellCallback callback, void* callbackData) foreach_;

  /**
      Calls the #GtkCellAllocCallback function on every
          #GtkCellRenderer in the area with the allocated area for the cell
          and the provided user data until the callback returns true.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, const(GdkRectangle)* cellArea, const(GdkRectangle)* backgroundArea, GtkCellAllocCallback callback, void* callbackData) foreachAlloc;

  /**
      Handle an event in the area, this is generally used to activate
          a cell at the event location for button events but can also be used
          to generically pass events to #GtkWidgets drawn onto the area.
  */
  extern(C) int function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, GdkEvent* event, const(GdkRectangle)* cellArea, GtkCellRendererState flags) event;

  /**
      Actually render the area’s cells to the specified rectangle,
          @background_area should be correctly distributed to the cells
          corresponding background areas.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, cairo_t* cr, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean paintFocus) render;

  /**
      Apply the cell attributes to the cells. This is
          implemented as a signal and generally #GtkCellArea subclasses don't
          need to implement it since it is handled by the base class.
  */
  extern(C) void function(GtkCellArea* area, GtkTreeModel* treeModel, GtkTreeIter* iter, gboolean isExpander, gboolean isExpanded) applyAttributes;

  /**
      Creates and returns a class specific #GtkCellAreaContext
          to store cell alignment and allocation details for a said #GtkCellArea
          class.
  */
  extern(C) GtkCellAreaContext* function(GtkCellArea* area) createContext;

  /**
      Creates a new #GtkCellAreaContext in the same state as
          the passed @context with any cell alignment data and allocations intact.
  */
  extern(C) GtkCellAreaContext* function(GtkCellArea* area, GtkCellAreaContext* context) copyContext;

  /**
      This allows an area to tell its layouting widget whether
          it prefers to be allocated in [gtk.types.SizeRequestMode.HeightForWidth] or
          [gtk.types.SizeRequestMode.WidthForHeight] mode.
  */
  extern(C) GtkSizeRequestMode function(GtkCellArea* area) getRequestMode;

  /**
      Calculates the minimum and natural width of the
          areas cells with the current attributes applied while considering
          the particular layouting details of the said #GtkCellArea. While
          requests are performed over a series of rows, alignments and overall
          minimum and natural sizes should be stored in the corresponding
          #GtkCellAreaContext.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumWidth, int* naturalWidth) getPreferredWidth;

  /**
      Calculates the minimum and natural height
          for the area if the passed @context would be allocated the given width.
          When implementing this virtual method it is safe to assume that @context
          has already stored the aligned cell widths for every #GtkTreeModel row
          that @context will be allocated for since this information was stored
          at #GtkCellAreaClass.get_preferred_width() time. This virtual method
          should also store any necessary alignments of cell heights for the
          case that the context is allocated a height.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) getPreferredHeightForWidth;

  /**
      Calculates the minimum and natural height of the
          areas cells with the current attributes applied. Essentially this is
          the same as #GtkCellAreaClass.get_preferred_width() only for areas
          that are being requested as [gtk.types.SizeRequestMode.WidthForHeight].
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumHeight, int* naturalHeight) getPreferredHeight;

  /**
      Calculates the minimum and natural width
          for the area if the passed @context would be allocated the given
          height. The same as #GtkCellAreaClass.get_preferred_height_for_width()
          only for handling requests in the [gtk.types.SizeRequestMode.WidthForHeight]
          mode.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) getPreferredWidthForHeight;

  /**
      This should be implemented to handle changes in child
          cell properties for a given #GtkCellRenderer that were previously
          installed on the #GtkCellAreaClass with [gtk.cell_area_class.CellAreaClass.installCellProperty].
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, const(GValue)* value, GParamSpec* pspec) setCellProperty;

  /**
      This should be implemented to report the values of
          child cell properties for a given child #GtkCellRenderer.
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, GValue* value, GParamSpec* pspec) getCellProperty;

  /**
      This virtual method should be implemented to navigate focus from
          cell to cell inside the #GtkCellArea. The #GtkCellArea should move
          focus from cell to cell inside the area and return false if focus
          logically leaves the area with the following exceptions: When the
          area contains no activatable cells, the entire area recieves focus.
          Focus should not be given to cells that are actually “focus siblings”
          of other sibling cells (see [gtk.cell_area.CellArea.getFocusFromSibling]).
          Focus is set by calling [gtk.cell_area.CellArea.setFocusCell].
  */
  extern(C) gboolean function(GtkCellArea* area, GtkDirectionType direction) focus;

  /**
      Returns whether the #GtkCellArea can respond to
          #GtkCellAreaClass.activate(), usually this does not need to be
          implemented since the base class takes care of this however it can
          be enhanced if the #GtkCellArea subclass can handle activation in
          other ways than activating its #GtkCellRenderers.
  */
  extern(C) gboolean function(GtkCellArea* area) isActivatable;

  /**
      This is called when the layouting widget rendering the
          #GtkCellArea activates the focus cell (see [gtk.cell_area.CellArea.getFocusCell]).
  */
  extern(C) gboolean function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean editOnly) activate;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/**
    The #GtkCellAreaContext object is created by a given #GtkCellArea
    implementation via its #GtkCellAreaClass.create_context() virtual
    method and is used to store cell sizes and alignments for a series of
    #GtkTreeModel rows that are requested and rendered in the same context.
    
    #GtkCellLayout widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given #GtkTreeModel
    row also be used for the same row when calling other #GtkCellArea APIs
    such as [gtk.cell_area.CellArea.render] and [gtk.cell_area.CellArea.event].
*/
struct GtkCellAreaContext
{
  /** */
  GObject parentInstance;

  /** */
  GtkCellAreaContextPrivate* priv;
}

/** */
struct GtkCellAreaContextClass
{
  /** */
  GObjectClass parentClass;

  /**
      This tells the context that an allocation width or height
          (or both) have been decided for a group of rows. The context should
          store any allocations for internally aligned cells at this point so
          that they dont need to be recalculated at [gtk.cell_area.CellArea.render] time.
  */
  extern(C) void function(GtkCellAreaContext* context, int width, int height) allocate;

  /**
      Clear any previously stored information about requested and
          allocated sizes for the context.
  */
  extern(C) void function(GtkCellAreaContext* context) reset;

  /**
      Returns the aligned height for the given
          width that context must store while collecting sizes for it’s rows.
  */
  extern(C) void function(GtkCellAreaContext* context, int width, int* minimumHeight, int* naturalHeight) getPreferredHeightForWidth;

  /**
      Returns the aligned width for the given
          height that context must store while collecting sizes for it’s rows.
  */
  extern(C) void function(GtkCellAreaContext* context, int height, int* minimumWidth, int* naturalWidth) getPreferredWidthForHeight;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;
}

/** */
struct GtkCellAreaContextPrivate;

/** */
struct GtkCellAreaPrivate;

/**
    The #GtkCellEditable interface must be implemented for widgets to be usable
    to edit the contents of a #GtkTreeView cell. It provides a way to specify how
    temporary widgets should be configured for editing, get the new value, etc.
*/
struct GtkCellEditable;

/** */
struct GtkCellEditableIface
{
  /** */
  GTypeInterface gIface;

  /**
      Signal is a sign for the cell renderer to update its
         value from the cell_editable.
  */
  extern(C) void function(GtkCellEditable* cellEditable) editingDone;

  /**
      Signal is meant to indicate that the cell is
         finished editing, and the widget may now be destroyed.
  */
  extern(C) void function(GtkCellEditable* cellEditable) removeWidget;

  /**
      Begins editing on a cell_editable.
  */
  extern(C) void function(GtkCellEditable* cellEditable, GdkEvent* event) startEditing;
}

/**
    #GtkCellLayout is an interface to be implemented by all objects which
    want to provide a #GtkTreeViewColumn like API for packing cells,
    setting attributes and data funcs.
    
    One of the notable features provided by implementations of
    GtkCellLayout are attributes. Attributes let you set the properties
    in flexible ways. They can just be set to constant values like regular
    properties. But they can also be mapped to a column of the underlying
    tree model with [gtk.cell_layout.CellLayout.setAttributes], which means that the value
    of the attribute can change from cell to cell as they are rendered by
    the cell renderer. Finally, it is possible to specify a function with
    [gtk.cell_layout.CellLayout.setCellDataFunc] that is called to determine the
    value of the attribute for each cell that is rendered.
    
    # GtkCellLayouts as GtkBuildable
    
    Implementations of GtkCellLayout which also implement the GtkBuildable
    interface (#GtkCellView, #GtkIconView, #GtkComboBox,
    #GtkEntryCompletion, #GtkTreeViewColumn) accept GtkCellRenderer objects
    as `<child>` elements in UI definitions. They support a custom `<attributes>`
    element for their children, which can contain multiple `<attribute>`
    elements. Each `<attribute>` element has a name attribute which specifies
    a property of the cell renderer; the content of the element is the
    attribute value.
    
    This is an example of a UI definition fragment specifying attributes:
    
    ```xml
    <object class="GtkCellView">
      <child>
        <object class="GtkCellRendererText"/>
        <attributes>
          <attribute name="text">0</attribute>
        </attributes>
      </child>
    </object>
    ```
    
    Furthermore for implementations of GtkCellLayout that use a #GtkCellArea
    to lay out cells (all GtkCellLayouts in GTK+ use a GtkCellArea)
    [cell properties][cell-properties] can also be defined in the format by
    specifying the custom `<cell-packing>` attribute which can contain multiple
    `<property>` elements defined in the normal way.
    
    Here is a UI definition fragment specifying cell properties:
    
    ```xml
    <object class="GtkTreeViewColumn">
      <child>
        <object class="GtkCellRendererText"/>
        <cell-packing>
          <property name="align">True</property>
          <property name="expand">False</property>
        </cell-packing>
      </child>
    </object>
    ```
    
    # Subclassing GtkCellLayout implementations
    
    When subclassing a widget that implements #GtkCellLayout like
    #GtkIconView or #GtkComboBox, there are some considerations related
    to the fact that these widgets internally use a #GtkCellArea.
    The cell area is exposed as a construct-only property by these
    widgets. This means that it is possible to e.g. do
    
    ```c
    combo = g_object_new (GTK_TYPE_COMBO_BOX, "cell-area", my_cell_area, NULL);
    ```
    
    to use a custom cell area with a combo box. But construct properties
    are only initialized after instance init()
    functions have run, which means that using functions which rely on
    the existence of the cell area in your subclass’ init() function will
    cause the default cell area to be instantiated. In this case, a provided
    construct property value will be ignored (with a warning, to alert
    you to the problem).
    
    ```c
    static void
    my_combo_box_init (MyComboBox *b)
    {
      GtkCellRenderer *cell;
    
      cell = gtk_cell_renderer_pixbuf_new ();
      // The following call causes the default cell area for combo boxes,
      // a GtkCellAreaBox, to be instantiated
      gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (b), cell, FALSE);
      ...
    }
    
    GtkWidget *
    my_combo_box_new (GtkCellArea *area)
    {
      // This call is going to cause a warning about area being ignored
      return g_object_new (MY_TYPE_COMBO_BOX, "cell-area", area, NULL);
    }
    ```
    
    If supporting alternative cell areas with your derived widget is
    not important, then this does not have to concern you. If you want
    to support alternative cell areas, you can do so by moving the
    problematic calls out of init() and into a constructor()
    for your class.
*/
struct GtkCellLayout;

/** */
struct GtkCellLayoutIface
{
  /** */
  GTypeInterface gIface;

  /**
      Packs the cell into the beginning of cell_layout.
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, gboolean expand) packStart;

  /**
      Adds the cell to the end of cell_layout.
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, gboolean expand) packEnd;

  /**
      Unsets all the mappings on all renderers on cell_layout and
         removes all renderers from cell_layout.
  */
  extern(C) void function(GtkCellLayout* cellLayout) clear;

  /**
      Adds an attribute mapping to the list in
         cell_layout.
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, const(char)* attribute, int column) addAttribute;

  /**
      Sets the #GtkCellLayoutDataFunc to use for
         cell_layout.
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, GtkCellLayoutDataFunc func, void* funcData, GDestroyNotify destroy) setCellDataFunc;

  /**
      Clears all existing attributes previously set
         with [gtk.cell_layout.CellLayout.setAttributes].
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell) clearAttributes;

  /**
      Re-inserts cell at position.
  */
  extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, int position) reorder;

  /**
      Get the cell renderers which have been added to
         cell_layout.
  */
  extern(C) GList* function(GtkCellLayout* cellLayout) getCells;

  /**
      Get the underlying #GtkCellArea which might be
         cell_layout if called on a #GtkCellArea or might be NULL if no
         #GtkCellArea is used by cell_layout.
  */
  extern(C) GtkCellArea* function(GtkCellLayout* cellLayout) getArea;
}

/**
    The #GtkCellRenderer is a base class of a set of objects used for
    rendering a cell to a #cairo_t.  These objects are used primarily by
    the #GtkTreeView widget, though they aren’t tied to them in any
    specific way.  It is worth noting that #GtkCellRenderer is not a
    #GtkWidget and cannot be treated as such.
    
    The primary use of a #GtkCellRenderer is for drawing a certain graphical
    elements on a #cairo_t. Typically, one cell renderer is used to
    draw many cells on the screen.  To this extent, it isn’t expected that a
    CellRenderer keep any permanent state around.  Instead, any state is set
    just prior to use using #GObjects property system.  Then, the
    cell is measured using [gtk.cell_renderer.CellRenderer.getSize]. Finally, the cell
    is rendered in the correct location using [gtk.cell_renderer.CellRenderer.render].
    
    There are a number of rules that must be followed when writing a new
    #GtkCellRenderer.  First and foremost, it’s important that a certain set
    of properties will always yield a cell renderer of the same size,
    barring a #GtkStyle change.  The #GtkCellRenderer also has a number of
    generic properties that are expected to be honored by all children.
    
    Beyond merely rendering a cell, cell renderers can optionally
    provide active user interface elements. A cell renderer can be
    “activatable” like #GtkCellRendererToggle,
    which toggles when it gets activated by a mouse click, or it can be
    “editable” like #GtkCellRendererText, which
    allows the user to edit the text using a widget implementing the
    #GtkCellEditable interface, e.g. #GtkEntry.
    To make a cell renderer activatable or editable, you have to
    implement the #GtkCellRendererClass.activate or
    #GtkCellRendererClass.start_editing virtual functions, respectively.
    
    Many properties of #GtkCellRenderer and its subclasses have a
    corresponding “set” property, e.g. “cell-background-set” corresponds
    to “cell-background”. These “set” properties reflect whether a property
    has been set or not. You should not set them independently.
*/
struct GtkCellRenderer
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkCellRendererPrivate* priv;
}

/**
    #GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
    combination like `Control + a`). If the cell renderer is editable,
    the accelerator can be changed by simply typing the new combination.
    
    The #GtkCellRendererAccel cell renderer was added in GTK+ 2.10.
*/
struct GtkCellRendererAccel
{
  /** */
  GtkCellRendererText parent;

  /** */
  GtkCellRendererAccelPrivate* priv;
}

/** */
struct GtkCellRendererAccelClass
{
  /** */
  GtkCellRendererTextClass parentClass;

  /** */
  extern(C) void function(GtkCellRendererAccel* accel, const(char)* pathString, uint accelKey, GdkModifierType accelMods, uint hardwareKeycode) accelEdited;

  /** */
  extern(C) void function(GtkCellRendererAccel* accel, const(char)* pathString) accelCleared;

  /** */
  extern(C) void function() GtkReserved0;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererAccelPrivate;

/** */
struct GtkCellRendererClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /**
      Called to gets whether the cell renderer prefers
         a height-for-width layout or a width-for-height layout.
  */
  extern(C) GtkSizeRequestMode function(GtkCellRenderer* cell) getRequestMode;

  /**
      Called to get a renderer’s natural width.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, int* minimumSize, int* naturalSize) getPreferredWidth;

  /**
      Called to get a renderer’s natural height for width.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) getPreferredHeightForWidth;

  /**
      Called to get a renderer’s natural height.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, int* minimumSize, int* naturalSize) getPreferredHeight;

  /**
      Called to get a renderer’s natural width for height.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) getPreferredWidthForHeight;

  /**
      Called to get the aligned area used by @cell inside @cell_area.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, GtkCellRendererState flags, const(GdkRectangle)* cellArea, GdkRectangle* alignedArea) getAlignedArea;

  /**
      Called to get the width and height needed to render the cell. Deprecated: 3.0.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkWidget* widget, const(GdkRectangle)* cellArea, int* xOffset, int* yOffset, int* width, int* height) getSize;

  /**
      Called to render the content of the #GtkCellRenderer.
  */
  extern(C) void function(GtkCellRenderer* cell, cairo_t* cr, GtkWidget* widget, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) render;

  /**
      Called to activate the content of the #GtkCellRenderer.
  */
  extern(C) gboolean function(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) activate;

  /**
      Called to initiate editing the content of the #GtkCellRenderer.
  */
  extern(C) GtkCellEditable* function(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) startEditing;

  /**
      Signal gets emitted when the user cancels the process of editing a cell.
  */
  extern(C) void function(GtkCellRenderer* cell) editingCanceled;

  /**
      Signal gets emitted when a cell starts to be edited.
  */
  extern(C) void function(GtkCellRenderer* cell, GtkCellEditable* editable, const(char)* path) editingStarted;

  /** */
  GtkCellRendererClassPrivate* priv;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererClassPrivate;

/**
    #GtkCellRendererCombo renders text in a cell like #GtkCellRendererText from
    which it is derived. But while #GtkCellRendererText offers a simple entry to
    edit the text, #GtkCellRendererCombo offers a #GtkComboBox
    widget to edit the text. The values to display in the combo box are taken from
    the tree model specified in the #GtkCellRendererCombo:model property.
    
    The combo cell renderer takes care of adding a text cell renderer to the combo
    box and sets it to display the column specified by its
    #GtkCellRendererCombo:text-column property. Further properties of the combo box
    can be set in a handler for the #GtkCellRenderer::editing-started signal.
    
    The #GtkCellRendererCombo cell renderer was added in GTK+ 2.6.
*/
struct GtkCellRendererCombo
{
  /** */
  GtkCellRendererText parent;

  /** */
  GtkCellRendererComboPrivate* priv;
}

/** */
struct GtkCellRendererComboClass
{
  /** */
  GtkCellRendererTextClass parent;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererComboPrivate;

/**
    A #GtkCellRendererPixbuf can be used to render an image in a cell. It allows
    to render either a given #GdkPixbuf (set via the
    #GtkCellRendererPixbuf:pixbuf property) or a named icon (set via the
    #GtkCellRendererPixbuf:icon-name property).
    
    To support the tree view, #GtkCellRendererPixbuf also supports rendering two
    alternative pixbufs, when the #GtkCellRenderer:is-expander property is true.
    If the #GtkCellRenderer:is-expanded property is true and the
    #GtkCellRendererPixbuf:pixbuf-expander-open property is set to a pixbuf, it
    renders that pixbuf, if the #GtkCellRenderer:is-expanded property is false
    and the #GtkCellRendererPixbuf:pixbuf-expander-closed property is set to a
    pixbuf, it renders that one.
*/
struct GtkCellRendererPixbuf
{
  /** */
  GtkCellRenderer parent;

  /** */
  GtkCellRendererPixbufPrivate* priv;
}

/** */
struct GtkCellRendererPixbufClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererPixbufPrivate;

/** */
struct GtkCellRendererPrivate;

/**
    #GtkCellRendererProgress renders a numeric value as a progress par in a cell.
    Additionally, it can display a text on top of the progress bar.
    
    The #GtkCellRendererProgress cell renderer was added in GTK+ 2.6.
*/
struct GtkCellRendererProgress
{
  /** */
  GtkCellRenderer parentInstance;

  /** */
  GtkCellRendererProgressPrivate* priv;
}

/** */
struct GtkCellRendererProgressClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererProgressPrivate;

/**
    #GtkCellRendererSpin renders text in a cell like #GtkCellRendererText from
    which it is derived. But while #GtkCellRendererText offers a simple entry to
    edit the text, #GtkCellRendererSpin offers a #GtkSpinButton widget. Of course,
    that means that the text has to be parseable as a floating point number.
    
    The range of the spinbutton is taken from the adjustment property of the
    cell renderer, which can be set explicitly or mapped to a column in the
    tree model, like all properties of cell renders. #GtkCellRendererSpin
    also has properties for the #GtkCellRendererSpin:climb-rate and the number
    of #GtkCellRendererSpin:digits to display. Other #GtkSpinButton properties
    can be set in a handler for the #GtkCellRenderer::editing-started signal.
    
    The #GtkCellRendererSpin cell renderer was added in GTK+ 2.10.
*/
struct GtkCellRendererSpin
{
  /** */
  GtkCellRendererText parent;

  /** */
  GtkCellRendererSpinPrivate* priv;
}

/** */
struct GtkCellRendererSpinClass
{
  /** */
  GtkCellRendererTextClass parent;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererSpinPrivate;

/**
    GtkCellRendererSpinner renders a spinning animation in a cell, very
    similar to #GtkSpinner. It can often be used as an alternative
    to a #GtkCellRendererProgress for displaying indefinite activity,
    instead of actual progress.
    
    To start the animation in a cell, set the #GtkCellRendererSpinner:active
    property to true and increment the #GtkCellRendererSpinner:pulse property
    at regular intervals. The usual way to set the cell renderer properties
    for each cell is to bind them to columns in your tree model using e.g.
    [gtk.tree_view_column.TreeViewColumn.addAttribute].
*/
struct GtkCellRendererSpinner
{
  /** */
  GtkCellRenderer parent;

  /** */
  GtkCellRendererSpinnerPrivate* priv;
}

/** */
struct GtkCellRendererSpinnerClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererSpinnerPrivate;

/**
    A #GtkCellRendererText renders a given text in its cell, using the font, color and
    style information provided by its properties. The text will be ellipsized if it is
    too long and the #GtkCellRendererText:ellipsize property allows it.
    
    If the #GtkCellRenderer:mode is [gtk.types.CellRendererMode.Editable],
    the #GtkCellRendererText allows to edit its text using an entry.
*/
struct GtkCellRendererText
{
  /** */
  GtkCellRenderer parent;

  /** */
  GtkCellRendererTextPrivate* priv;
}

/** */
struct GtkCellRendererTextClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function(GtkCellRendererText* cellRendererText, const(char)* path, const(char)* newText) edited;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererTextPrivate;

/**
    #GtkCellRendererToggle renders a toggle button in a cell. The
    button is drawn as a radio or a checkbutton, depending on the
    #GtkCellRendererToggle:radio property.
    When activated, it emits the #GtkCellRendererToggle::toggled signal.
*/
struct GtkCellRendererToggle
{
  /** */
  GtkCellRenderer parent;

  /** */
  GtkCellRendererTogglePrivate* priv;
}

/** */
struct GtkCellRendererToggleClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function(GtkCellRendererToggle* cellRendererToggle, const(char)* path) toggled;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellRendererTogglePrivate;

/**
    A #GtkCellView displays a single row of a #GtkTreeModel using a #GtkCellArea
    and #GtkCellAreaContext. A #GtkCellAreaContext can be provided to the
    #GtkCellView at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with eachother (like the aligned cells in the menus
    of #GtkComboBox).
    
    #GtkCellView is #GtkOrientable in order to decide in which orientation
    the underlying #GtkCellAreaContext should be allocated. Taking the #GtkComboBox
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    # CSS nodes
    
    GtkCellView has a single CSS node with name cellview.
*/
struct GtkCellView
{
  /** */
  GtkWidget parentInstance;

  /** */
  GtkCellViewPrivate* priv;
}

/** */
struct GtkCellViewClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCellViewPrivate;

/**
    A #GtkCheckButton places a discrete #GtkToggleButton next to a widget,
    (usually a #GtkLabel). See the section on #GtkToggleButton widgets for
    more information about toggle/check buttons.
    
    The important signal ( #GtkToggleButton::toggled ) is also inherited from
    #GtkToggleButton.
    
    # CSS nodes
    
    ```plain
    checkbutton
    ├── check
    ╰── <child>
    ```
    
    A GtkCheckButton with indicator (see [gtk.toggle_button.ToggleButton.setMode]) has a
    main CSS node with name checkbutton and a subnode with name check.
    
    ```plain
    button.check
    ├── check
    ╰── <child>
    ```
    
    A GtkCheckButton without indicator changes the name of its main node
    to button and adds a .check style class to it. The subnode is invisible
    in this case.
*/
struct GtkCheckButton
{
  /** */
  GtkToggleButton toggleButton;
}

/** */
struct GtkCheckButtonClass
{
  /** */
  GtkToggleButtonClass parentClass;

  /** */
  extern(C) void function(GtkCheckButton* checkButton, cairo_t* cr) drawIndicator;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    A #GtkCheckMenuItem is a menu item that maintains the state of a boolean
    value in addition to a #GtkMenuItem usual role in activating application
    code.
    
    A check box indicating the state of the boolean value is displayed
    at the left side of the #GtkMenuItem.  Activating the #GtkMenuItem
    toggles the value.
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── check.left
    ╰── <child>
    ```
    
    GtkCheckMenuItem has a main CSS node with name menuitem, and a subnode
    with name check, which gets the .left or .right style class.
*/
struct GtkCheckMenuItem
{
  /** */
  GtkMenuItem menuItem;

  /** */
  GtkCheckMenuItemPrivate* priv;
}

/** */
struct GtkCheckMenuItemAccessible
{
  /** */
  GtkMenuItemAccessible parent;

  /** */
  GtkCheckMenuItemAccessiblePrivate* priv;
}

/** */
struct GtkCheckMenuItemAccessibleClass
{
  /** */
  GtkMenuItemAccessibleClass parentClass;
}

/** */
struct GtkCheckMenuItemAccessiblePrivate;

/** */
struct GtkCheckMenuItemClass
{
  /**
      The parent class.
  */
  GtkMenuItemClass parentClass;

  /**
      Signal emitted when the state of the check box is changed.
  */
  extern(C) void function(GtkCheckMenuItem* checkMenuItem) toggled;

  /**
      Called to draw the check indicator.
  */
  extern(C) void function(GtkCheckMenuItem* checkMenuItem, cairo_t* cr) drawIndicator;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCheckMenuItemPrivate;

/**
    The #GtkClipboard object represents a clipboard of data shared
    between different processes or between different widgets in
    the same process. Each clipboard is identified by a name encoded as a
    #GdkAtom. (Conversion to and from strings can be done with
    [gdk.atom.Atom.intern] and [gdk.atom.Atom.name].) The default clipboard
    corresponds to the “CLIPBOARD” atom; another commonly used clipboard
    is the “PRIMARY” clipboard, which, in X, traditionally contains
    the currently selected text.
    
    To support having a number of different formats on the clipboard
    at the same time, the clipboard mechanism allows providing
    callbacks instead of the actual data.  When you set the contents
    of the clipboard, you can either supply the data directly (via
    functions like [gtk.clipboard.Clipboard.setText]), or you can supply a
    callback to be called at a later time when the data is needed (via
    [gtk.clipboard.Clipboard.setWithData] or [gtk.clipboard.Clipboard.setWithOwner].)
    Providing a callback also avoids having to make copies of the data
    when it is not needed.
    
    [gtk.clipboard.Clipboard.setWithData] and [gtk.clipboard.Clipboard.setWithOwner]
    are quite similar; the choice between the two depends mostly on
    which is more convenient in a particular situation.
    The former is most useful when you want to have a blob of data
    with callbacks to convert it into the various data types that you
    advertise. When the @clear_func you provided is called, you
    simply free the data blob. The latter is more useful when the
    contents of clipboard reflect the internal state of a #GObject
    (As an example, for the PRIMARY clipboard, when an entry widget
    provides the clipboard’s contents the contents are simply the
    text within the selected region.) If the contents change, the
    entry widget can call [gtk.clipboard.Clipboard.setWithOwner] to update
    the timestamp for clipboard ownership, without having to worry
    about @clear_func being called.
    
    Requesting the data from the clipboard is essentially
    asynchronous. If the contents of the clipboard are provided within
    the same process, then a direct function call will be made to
    retrieve the data, but if they are provided by another process,
    then the data needs to be retrieved from the other process, which
    may take some time. To avoid blocking the user interface, the call
    to request the selection, [gtk.clipboard.Clipboard.requestContents] takes a
    callback that will be called when the contents are received (or
    when the request fails.) If you don’t want to deal with providing
    a separate callback, you can also use [gtk.clipboard.Clipboard.waitForContents].
    What this does is run the GLib main loop recursively waiting for
    the contents. This can simplify the code flow, but you still have
    to be aware that other callbacks in your program can be called
    while this recursive mainloop is running.
    
    Along with the functions to get the clipboard contents as an
    arbitrary data chunk, there are also functions to retrieve
    it as text, [gtk.clipboard.Clipboard.requestText] and
    [gtk.clipboard.Clipboard.waitForText]. These functions take care of
    determining which formats are advertised by the clipboard
    provider, asking for the clipboard in the best available format
    and converting the results into the UTF-8 encoding. (The standard
    form for representing strings in GTK+.)
*/
struct GtkClipboard;

/**
    The #GtkColorButton is a button which displays the currently selected
    color and allows to open a color selection dialog to change the color.
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    GtkColorButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .color style class.
*/
struct GtkColorButton
{
  /** */
  GtkButton button;

  /** */
  GtkColorButtonPrivate* priv;
}

/** */
struct GtkColorButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function(GtkColorButton* cp) colorSet;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkColorButtonPrivate;

/**
    #GtkColorChooser is an interface that is implemented by widgets
    for choosing colors. Depending on the situation, colors may be
    allowed to have alpha (translucency).
    
    In GTK+, the main widgets that implement this interface are
    #GtkColorChooserWidget, #GtkColorChooserDialog and #GtkColorButton.
*/
struct GtkColorChooser;

/**
    The #GtkColorChooserDialog widget is a dialog for choosing
    a color. It implements the #GtkColorChooser interface.
*/
struct GtkColorChooserDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkColorChooserDialogPrivate* priv;
}

/** */
struct GtkColorChooserDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkColorChooserDialogPrivate;

/** */
struct GtkColorChooserInterface
{
  /** */
  GTypeInterface baseInterface;

  /** */
  extern(C) void function(GtkColorChooser* chooser, GdkRGBA* color) getRgba;

  /** */
  extern(C) void function(GtkColorChooser* chooser, const(GdkRGBA)* color) setRgba;

  /** */
  extern(C) void function(GtkColorChooser* chooser, GtkOrientation orientation, int colorsPerLine, int nColors, GdkRGBA* colors) addPalette;

  /** */
  extern(C) void function(GtkColorChooser* chooser, const(GdkRGBA)* color) colorActivated;

  /** */
  void*[12] padding;
}

/**
    The #GtkColorChooserWidget widget lets the user select a
    color. By default, the chooser presents a predefined palette
    of colors, plus a small number of settable custom colors.
    It is also possible to select a different color with the
    single-color editor. To enter the single-color editing mode,
    use the context menu of any color of the palette, or use the
    '+' button to add a new custom color.
    
    The chooser automatically remembers the last selection, as well
    as custom colors.
    
    To change the initially selected color, use [gtk.color_chooser.ColorChooser.setRgba].
    To get the selected color use [gtk.color_chooser.ColorChooser.getRgba].
    
    The #GtkColorChooserWidget is used in the #GtkColorChooserDialog
    to provide a dialog for selecting colors.
    
    # CSS names
    
    GtkColorChooserWidget has a single CSS node with name colorchooser.
*/
struct GtkColorChooserWidget
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkColorChooserWidgetPrivate* priv;
}

/** */
struct GtkColorChooserWidgetClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkColorChooserWidgetPrivate;

/** */
struct GtkColorSelection
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkColorSelectionPrivate* privateData;
}

/** */
struct GtkColorSelectionClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function(GtkColorSelection* colorSelection) colorChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkColorSelectionDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkColorSelectionDialogPrivate* priv;
}

/** */
struct GtkColorSelectionDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkColorSelectionDialogPrivate;

/** */
struct GtkColorSelectionPrivate;

/**
    A GtkComboBox is a widget that allows the user to choose from a list of
    valid choices. The GtkComboBox displays the selected choice. When
    activated, the GtkComboBox displays a popup which allows the user to
    make a new choice. The style in which the selected value is displayed,
    and the style of the popup is determined by the current theme. It may
    be similar to a Windows-style combo box.
    
    The GtkComboBox uses the model-view pattern; the list of valid choices
    is specified in the form of a tree model, and the display of the choices
    can be adapted to the data in the model by using cell renderers, as you
    would in a tree view. This is possible since GtkComboBox implements the
    #GtkCellLayout interface. The tree model holding the valid choices is
    not restricted to a flat list, it can be a real tree, and the popup will
    reflect the tree structure.
    
    To allow the user to enter values not in the model, the “has-entry”
    property allows the GtkComboBox to contain a #GtkEntry. This entry
    can be accessed by calling [gtk.bin.Bin.getChild] on the combo box.
    
    For a simple list of textual choices, the model-view API of GtkComboBox
    can be a bit overwhelming. In this case, #GtkComboBoxText offers a
    simple alternative. Both GtkComboBox and #GtkComboBoxText can contain
    an entry.
    
    # CSS nodes
    
    ```plain
    combobox
    ├── box.linked
    │   ╰── button.combo
    │       ╰── box
    │           ├── cellview
    │           ╰── arrow
    ╰── window.popup
    ```
    
    A normal combobox contains a box with the .linked class, a button
    with the .combo class and inside those buttons, there are a cellview and
    an arrow.
    
    ```plain
    combobox
    ├── box.linked
    │   ├── entry.combo
    │   ╰── button.combo
    │       ╰── box
    │           ╰── arrow
    ╰── window.popup
    ```
    
    A GtkComboBox with an entry has a single CSS node with name combobox. It
    contains a box with the .linked class. That box contains an entry and a
    button, both with the .combo class added.
    The button also contains another node with name arrow.
*/
struct GtkComboBox
{
  /** */
  GtkBin parentInstance;

  /** */
  GtkComboBoxPrivate* priv;
}

/** */
struct GtkComboBoxAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkComboBoxAccessiblePrivate* priv;
}

/** */
struct GtkComboBoxAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkComboBoxAccessiblePrivate;

/** */
struct GtkComboBoxClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Signal is emitted when the active item is changed.
  */
  extern(C) void function(GtkComboBox* comboBox) changed;

  /**
      Signal which allows you to change how the text
         displayed in a combo box’s entry is displayed.
  */
  extern(C) char* function(GtkComboBox* comboBox, const(char)* path) formatEntryText;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;
}

/** */
struct GtkComboBoxPrivate;

/**
    A GtkComboBoxText is a simple variant of #GtkComboBox that hides
    the model-view complexity for simple text-only use cases.
    
    To create a GtkComboBoxText, use [gtk.combo_box_text.ComboBoxText.new_] or
    [gtk.combo_box_text.ComboBoxText.newWithEntry].
    
    You can add items to a GtkComboBoxText with
    [gtk.combo_box_text.ComboBoxText.appendText], [gtk.combo_box_text.ComboBoxText.insertText]
    or [gtk.combo_box_text.ComboBoxText.prependText] and remove options with
    [gtk.combo_box_text.ComboBoxText.remove].
    
    If the GtkComboBoxText contains an entry (via the “has-entry” property),
    its contents can be retrieved using [gtk.combo_box_text.ComboBoxText.getActiveText].
    The entry itself can be accessed by calling [gtk.bin.Bin.getChild] on the
    combo box.
    
    You should not call [gtk.combo_box.ComboBox.setModel] or attempt to pack more cells
    into this combo box via its GtkCellLayout interface.
    
    # GtkComboBoxText as GtkBuildable
    
    The GtkComboBoxText implementation of the GtkBuildable interface supports
    adding items directly using the `<items>` element and specifying `<item>`
    elements for each item. Each `<item>` element can specify the “id”
    corresponding to the appended text and also supports the regular
    translation attributes “translatable”, “context” and “comments”.
    
    Here is a UI definition fragment specifying GtkComboBoxText items:
    
    ```xml
    <object class="GtkComboBoxText">
      <items>
        <item translatable="yes" id="factory">Factory</item>
        <item translatable="yes" id="home">Home</item>
        <item translatable="yes" id="subway">Subway</item>
      </items>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    combobox
    ╰── box.linked
        ├── entry.combo
        ├── button.combo
        ╰── window.popup
    ```
    
    GtkComboBoxText has a single CSS node with name combobox. It adds
    the style class .combo to the main CSS nodes of its entry and button
    children, and the .linked class to the node of its internal box.
*/
struct GtkComboBoxText
{
  /** */
  GtkComboBox parentInstance;

  /** */
  GtkComboBoxTextPrivate* priv;
}

/** */
struct GtkComboBoxTextClass
{
  /** */
  GtkComboBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkComboBoxTextPrivate;

/**
    A GTK+ user interface is constructed by nesting widgets inside widgets.
    Container widgets are the inner nodes in the resulting tree of widgets:
    they contain other widgets. So, for example, you might have a #GtkWindow
    containing a #GtkFrame containing a #GtkLabel. If you wanted an image instead
    of a textual label inside the frame, you might replace the #GtkLabel widget
    with a #GtkImage widget.
    
    There are two major kinds of container widgets in GTK+. Both are subclasses
    of the abstract GtkContainer base class.
    
    The first type of container widget has a single child widget and derives
    from #GtkBin. These containers are decorators, which
    add some kind of functionality to the child. For example, a #GtkButton makes
    its child into a clickable button; a #GtkFrame draws a frame around its child
    and a #GtkWindow places its child widget inside a top-level window.
    
    The second type of container can have more than one child; its purpose is to
    manage layout. This means that these containers assign
    sizes and positions to their children. For example, a #GtkHBox arranges its
    children in a horizontal row, and a #GtkGrid arranges the widgets it contains
    in a two-dimensional grid.
    
    For implementations of #GtkContainer the virtual method #GtkContainerClass.forall()
    is always required, since it's used for drawing and other internal operations
    on the children.
    If the #GtkContainer implementation expect to have non internal children
    it's needed to implement both #GtkContainerClass.add() and #GtkContainerClass.remove().
    If the GtkContainer implementation has internal children, they should be added
    with [gtk.widget.Widget.setParent] on init() and removed with [gtk.widget.Widget.unparent]
    in the #GtkWidgetClass.destroy() implementation.
    See more about implementing custom widgets at https://wiki.gnome.org/HowDoI/CustomWidgets
    
    # Height for width geometry management
    
    GTK+ uses a height-for-width (and width-for-height) geometry management system.
    Height-for-width means that a widget can change how much vertical space it needs,
    depending on the amount of horizontal space that it is given (and similar for
    width-for-height).
    
    There are some things to keep in mind when implementing container widgets
    that make use of GTK+’s height for width geometry management system. First,
    it’s important to note that a container must prioritize one of its
    dimensions, that is to say that a widget or container can only have a
    #GtkSizeRequestMode that is [gtk.types.SizeRequestMode.HeightForWidth] or
    [gtk.types.SizeRequestMode.WidthForHeight]. However, every widget and container
    must be able to respond to the APIs for both dimensions, i.e. even if a
    widget has a request mode that is height-for-width, it is possible that
    its parent will request its sizes using the width-for-height APIs.
    
    To ensure that everything works properly, here are some guidelines to follow
    when implementing height-for-width (or width-for-height) containers.
    
    Each request mode involves 2 virtual methods. Height-for-width apis run
    through [gtk.widget.Widget.getPreferredWidth] and then through [gtk.widget.Widget.getPreferredHeightForWidth].
    When handling requests in the opposite #GtkSizeRequestMode it is important that
    every widget request at least enough space to display all of its content at all times.
    
    When [gtk.widget.Widget.getPreferredHeight] is called on a container that is height-for-width,
    the container must return the height for its minimum width. This is easily achieved by
    simply calling the reverse apis implemented for itself as follows:
    
    ```c
    static void
    foo_container_get_preferred_height (GtkWidget *widget,
                                        gint *min_height,
                                        gint *nat_height)
    {
       if (i_am_in_height_for_width_mode)
         {
           gint min_width;
    
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               &min_width,
                                                               NULL);
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_height_for_width
                                                              (widget,
                                                               min_width,
                                                               min_height,
                                                               nat_height);
         }
       else
         {
           ... many containers support both request modes, execute the
           real width-for-height request here by returning the
           collective heights of all widgets that are stacked
           vertically (or whatever is appropriate for this container)
           ...
         }
    }
    ```
    
    Similarly, when [gtk.widget.Widget.getPreferredWidthForHeight] is called for a container or widget
    that is height-for-width, it then only needs to return the base minimum width like so:
    
    ```c
    static void
    foo_container_get_preferred_width_for_height (GtkWidget *widget,
                                                  gint for_height,
                                                  gint *min_width,
                                                  gint *nat_width)
    {
       if (i_am_in_height_for_width_mode)
         {
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               min_width,
                                                               nat_width);
         }
       else
         {
           ... execute the real width-for-height request here based on
           the required width of the children collectively if the
           container were to be allocated the said height ...
         }
    }
    ```
    
    Height for width requests are generally implemented in terms of a virtual allocation
    of widgets in the input orientation. Assuming an height-for-width request mode, a container
    would implement the get_preferred_height_for_width() virtual function by first calling
    [gtk.widget.Widget.getPreferredWidth] for each of its children.
    
    For each potential group of children that are lined up horizontally, the values returned by
    [gtk.widget.Widget.getPreferredWidth] should be collected in an array of #GtkRequestedSize structures.
    Any child spacing should be removed from the input @for_width and then the collective size should be
    allocated using the [gtk.global.distributeNaturalAllocation] convenience function.
    
    The container will then move on to request the preferred height for each child by using
    [gtk.widget.Widget.getPreferredHeightForWidth] and using the sizes stored in the #GtkRequestedSize array.
    
    To allocate a height-for-width container, it’s again important
    to consider that a container must prioritize one dimension over the other. So if
    a container is a height-for-width container it must first allocate all widgets horizontally
    using a #GtkRequestedSize array and [gtk.global.distributeNaturalAllocation] and then add any
    extra space (if and where appropriate) for the widget to expand.
    
    After adding all the expand space, the container assumes it was allocated sufficient
    height to fit all of its content. At this time, the container must use the total horizontal sizes
    of each widget to request the height-for-width of each of its children and store the requests in a
    #GtkRequestedSize array for any widgets that stack vertically (for tabular containers this can
    be generalized into the heights and widths of rows and columns).
    The vertical space must then again be distributed using [gtk.global.distributeNaturalAllocation]
    while this time considering the allocated height of the widget minus any vertical spacing
    that the container adds. Then vertical expand space should be added where appropriate and available
    and the container should go on to actually allocating the child widgets.
    
    See [GtkWidget’s geometry management section][geometry-management]
    to learn more about implementing height-for-width geometry management for widgets.
    
    # Child properties
    
    GtkContainer introduces child properties.
    These are object properties that are not specific
    to either the container or the contained widget, but rather to their relation.
    Typical examples of child properties are the position or pack-type of a widget
    which is contained in a #GtkBox.
    
    Use [gtk.container_class.ContainerClass.installChildProperty] to install child properties
    for a container class and [gtk.container_class.ContainerClass.findChildProperty] or
    [gtk.container_class.ContainerClass.listChildProperties] to get information about existing
    child properties.
    
    To set the value of a child property, use [gtk.container.Container.childSetProperty],
    [gtk.container.Container.childSet] or [gtk.container.Container.childSetValist].
    To obtain the value of a child property, use
    [gtk.container.Container.childGetProperty], [gtk.container.Container.childGet] or
    [gtk.container.Container.childGetValist]. To emit notification about child property
    changes, use [gtk.widget.Widget.childNotify].
    
    # GtkContainer as GtkBuildable
    
    The GtkContainer implementation of the GtkBuildable interface supports
    a `<packing>` element for children, which can contain multiple `<property>`
    elements that specify child properties for the child.
    
    Since 2.16, child properties can also be marked as translatable using
    the same “translatable”, “comments” and “context” attributes that are used
    for regular properties.
    
    Since 3.16, containers can have a `<focus-chain>` element containing multiple
    `<widget>` elements, one for each child that should be added to the focus
    chain. The ”name” attribute gives the id of the widget.
    
    An example of these properties in UI definitions:
    
    ```xml
    <object class="GtkBox">
      <child>
        <object class="GtkEntry" id="entry1"/>
        <packing>
          <property name="pack-type">start</property>
        </packing>
      </child>
      <child>
        <object class="GtkEntry" id="entry2"/>
      </child>
      <focus-chain>
        <widget name="entry1"/>
        <widget name="entry2"/>
      </focus-chain>
    </object>
    ```
*/
struct GtkContainer
{
  /** */
  GtkWidget widget;

  /** */
  GtkContainerPrivate* priv;
}

/** */
struct GtkContainerAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkContainerAccessiblePrivate* priv;
}

/** */
struct GtkContainerAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;

  /** */
  extern(C) int function(GtkContainer* container, GtkWidget* widget, void* data) addGtk;

  /** */
  extern(C) int function(GtkContainer* container, GtkWidget* widget, void* data) removeGtk;
}

/** */
struct GtkContainerAccessiblePrivate;

/** */
struct GtkContainerCellAccessible
{
  /** */
  GtkCellAccessible parent;

  /** */
  GtkContainerCellAccessiblePrivate* priv;
}

/** */
struct GtkContainerCellAccessibleClass
{
  /** */
  GtkCellAccessibleClass parentClass;
}

/** */
struct GtkContainerCellAccessiblePrivate;

/**
    Base class for containers.
*/
struct GtkContainerClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /**
      Signal emitted when a widget is added to container.
  */
  extern(C) void function(GtkContainer* container, GtkWidget* widget) add;

  /**
      Signal emitted when a widget is removed from container.
  */
  extern(C) void function(GtkContainer* container, GtkWidget* widget) remove;

  /**
      Signal emitted when a size recalculation is needed.
  */
  extern(C) void function(GtkContainer* container) checkResize;

  /**
      Invokes callback on each child of container. The callback handler
         may remove the child.
  */
  extern(C) void function(GtkContainer* container, gboolean includeInternals, GtkCallback callback, void* callbackData) forall;

  /**
      Sets the focused child of container.
  */
  extern(C) void function(GtkContainer* container, GtkWidget* child) setFocusChild;

  /**
      Returns the type of the children supported by the container.
  */
  extern(C) GType function(GtkContainer* container) childType;

  /**
      Gets a widget’s composite name. Deprecated: 3.10.
  */
  extern(C) char* function(GtkContainer* container, GtkWidget* child) compositeName;

  /**
      Set a property on a child of container.
  */
  extern(C) void function(GtkContainer* container, GtkWidget* child, uint propertyId, const(GValue)* value, GParamSpec* pspec) setChildProperty;

  /**
      Get a property from a child of container.
  */
  extern(C) void function(GtkContainer* container, GtkWidget* child, uint propertyId, GValue* value, GParamSpec* pspec) getChildProperty;

  /**
      Get path representing entire widget hierarchy
         from the toplevel down to and including @child.
  */
  extern(C) GtkWidgetPath* function(GtkContainer* container, GtkWidget* child) getPathForChild;

  /** */
  uint HandleBorderWidth;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkContainerPrivate;

/**
    GtkCssProvider is an object implementing the #GtkStyleProvider interface.
    It is able to parse [CSS-like][css-overview] input in order to style widgets.
    
    An application can make GTK+ parse a specific CSS style sheet by calling
    [gtk.css_provider.CssProvider.loadFromFile] or [gtk.css_provider.CssProvider.loadFromResource]
    and adding the provider with [gtk.style_context.StyleContext.addProvider] or
    [gtk.style_context.StyleContext.addProviderForScreen].
    
    In addition, certain files will be read when GTK+ is initialized. First, the
    file `$XDG_CONFIG_HOME/gtk-3.0/gtk.css` is loaded if it exists. Then, GTK+
    loads the first existing file among
    `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk.css`,
    `$HOME/.themes/THEME/gtk-VERSION/gtk.css`,
    `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk.css` and
    `DATADIR/share/themes/THEME/gtk-VERSION/gtk.css`, where `THEME` is the name of
    the current theme (see the #GtkSettings:gtk-theme-name setting), `DATADIR`
    is the prefix configured when GTK+ was compiled (unless overridden by the
    `GTK_DATA_PREFIX` environment variable), and `VERSION` is the GTK+ version number.
    If no file is found for the current version, GTK+ tries older versions all the
    way back to 3.0.
    
    In the same way, GTK+ tries to load a gtk-keys.css file for the current
    key theme, as defined by #GtkSettings:gtk-key-theme-name.
*/
struct GtkCssProvider
{
  /** */
  GObject parentInstance;

  /** */
  GtkCssProviderPrivate* priv;
}

/** */
struct GtkCssProviderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkCssProvider* provider, GtkCssSection* section, const(GError)* error) parsingError;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkCssProviderPrivate;

/**
    Defines a part of a CSS document. Because sections are nested into
    one another, you can use [gtk.css_section.CssSection.getParent] to get the
    containing region.
*/
struct GtkCssSection;

/**
    Dialog boxes are a convenient way to prompt the user for a small amount
    of input, e.g. to display a message, ask a question, or anything else
    that does not require extensive effort on the user’s part.
    
    GTK+ treats a dialog as a window split vertically. The top section is a
    #GtkVBox, and is where widgets such as a #GtkLabel or a #GtkEntry should
    be packed. The bottom area is known as the
    “action area”. This is generally used for
    packing buttons into the dialog which may perform functions such as
    cancel, ok, or apply.
    
    #GtkDialog boxes are created with a call to [gtk.dialog.Dialog.new_] or
    [gtk.dialog.Dialog.newWithButtons]. [gtk.dialog.Dialog.newWithButtons] is
    recommended; it allows you to set the dialog title, some convenient
    flags, and add simple buttons.
    
    If “dialog” is a newly created dialog, the two primary areas of the
    window can be accessed through [gtk.dialog.Dialog.getContentArea] and
    [gtk.dialog.Dialog.getActionArea], as can be seen from the example below.
    
    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [gtk.window.Window.setModal] on the
    dialog. Use the GTK_WINDOW() macro to cast the widget returned from
    [gtk.dialog.Dialog.new_] into a #GtkWindow. When using [gtk.dialog.Dialog.newWithButtons]
    you can also pass the #GTK_DIALOG_MODAL flag to make a dialog modal.
    
    If you add buttons to #GtkDialog using [gtk.dialog.Dialog.newWithButtons],
    [gtk.dialog.Dialog.addButton], [gtk.dialog.Dialog.addButtons], or
    [gtk.dialog.Dialog.addActionWidget], clicking the button will emit a signal
    called #GtkDialog::response with a response ID that you specified. GTK+
    will never assign a meaning to positive response IDs; these are entirely
    user-defined. But for convenience, you can use the response IDs in the
    #GtkResponseType enumeration (these all have values less than zero). If
    a dialog receives a delete event, the #GtkDialog::response signal will
    be emitted with a response ID of #GTK_RESPONSE_DELETE_EVENT.
    
    If you want to block waiting for a dialog to return before returning
    control flow to your code, you can call [gtk.dialog.Dialog.run]. This function
    enters a recursive main loop and waits for the user to respond to the
    dialog, returning the response ID corresponding to the button the user
    clicked.
    
    For the simple dialog in the following example, in reality you’d probably
    use #GtkMessageDialog to save yourself some effort. But you’d need to
    create the dialog contents manually if you had more than a simple message
    in the dialog.
    
    An example for simple GtkDialog usage:
    ```c
    // Function to open a dialog box with a message
    void
    quick_message (GtkWindow *parent, gchar *message)
    {
     GtkWidget *dialog, *label, *content_area;
     GtkDialogFlags flags;
    
     // Create the widgets
     flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_dialog_new_with_buttons ("Message",
                                           parent,
                                           flags,
                                           _("_OK"),
                                           GTK_RESPONSE_NONE,
                                           NULL);
     content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));
     label = gtk_label_new (message);
    
     // Ensure that the dialog box is destroyed when the user responds
    
     g_signal_connect_swapped (dialog,
                               "response",
                               G_CALLBACK (gtk_widget_destroy),
                               dialog);
    
     // Add the label, and show everything we’ve added
    
     gtk_container_add (GTK_CONTAINER (content_area), label);
     gtk_widget_show_all (dialog);
    }
    ```
    
    # GtkDialog as GtkBuildable
    
    The GtkDialog implementation of the #GtkBuildable interface exposes the
    @vbox and @action_area as internal children with the names “vbox” and
    “action_area”.
    
    GtkDialog supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area). To mark a response
    as default, set the “default“ attribute of the `<action-widget>` element
    to true.
    
    GtkDialog supports adding action widgets by specifying “action“ as
    the “type“ attribute of a `<child>` element. The widget will be added
    either to the action area or the headerbar of the dialog, depending
    on the “use-header-bar“ property. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    An example of a #GtkDialog UI definition fragment:
    
    ```xml
    <object class="GtkDialog" id="dialog1">
      <child type="action">
        <object class="GtkButton" id="button_cancel"/>
      </child>
      <child type="action">
        <object class="GtkButton" id="button_ok">
          <property name="can-default">True</property>
        </object>
      </child>
      <action-widgets>
        <action-widget response="cancel">button_cancel</action-widget>
        <action-widget response="ok" default="true">button_ok</action-widget>
      </action-widgets>
    </object>
    ```
*/
struct GtkDialog
{
  /** */
  GtkWindow window;

  /** */
  GtkDialogPrivate* priv;
}

/** */
struct GtkDialogClass
{
  /**
      The parent class.
  */
  GtkWindowClass parentClass;

  /**
      Signal emitted when an action widget is activated.
  */
  extern(C) void function(GtkDialog* dialog, int responseId) response;

  /**
      Signal emitted when the user uses a keybinding to close the dialog.
  */
  extern(C) void function(GtkDialog* dialog) close;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkDialogPrivate;

/**
    The #GtkDrawingArea widget is used for creating custom user interface
    elements. It’s essentially a blank widget; you can draw on it. After
    creating a drawing area, the application may want to connect to:
    
    $(LIST
      * Mouse and button press signals to respond to input from
        the user. (Use [gtk.widget.Widget.addEvents] to enable events
        you wish to receive.)
      
      * The #GtkWidget::realize signal to take any necessary actions
        when the widget is instantiated on a particular display.
        (Create GDK resources in response to this signal.)
      
      * The #GtkWidget::size-allocate signal to take any necessary
        actions when the widget changes size.
      
      * The #GtkWidget::draw signal to handle redrawing the
        contents of the widget.
    )
      
    The following code portion demonstrates using a drawing
    area to display a circle in the normal widget foreground
    color.
    
    Note that GDK automatically clears the exposed area before sending
    the expose event, and that drawing is implicitly clipped to the exposed
    area. If you want to have a theme-provided background, you need
    to call [gtk.global.renderBackground] in your ::draw method.
    
    ## Simple GtkDrawingArea usage
    
    ```c
    gboolean
    draw_callback (GtkWidget *widget, cairo_t *cr, gpointer data)
    {
      guint width, height;
      GdkRGBA color;
      GtkStyleContext *context;
    
      context = gtk_widget_get_style_context (widget);
    
      width = gtk_widget_get_allocated_width (widget);
      height = gtk_widget_get_allocated_height (widget);
    
      gtk_render_background (context, cr, 0, 0, width, height);
    
      cairo_arc (cr,
                 width / 2.0, height / 2.0,
                 MIN (width, height) / 2.0,
                 0, 2 * G_PI);
    
      gtk_style_context_get_color (context,
                                   gtk_style_context_get_state (context),
                                   &color);
      gdk_cairo_set_source_rgba (cr, &color);
    
      cairo_fill (cr);
    
     return FALSE;
    }
    [...]
      GtkWidget *drawing_area = gtk_drawing_area_new ();
      gtk_widget_set_size_request (drawing_area, 100, 100);
      g_signal_connect (G_OBJECT (drawing_area), "draw",
                        G_CALLBACK (draw_callback), NULL);
    ```
    
    Draw signals are normally delivered when a drawing area first comes
    onscreen, or when it’s covered by another window and then uncovered.
    You can also force an expose event by adding to the “damage region”
    of the drawing area’s window; [gtk.widget.Widget.queueDrawArea] and
    [gdk.window.Window.invalidateRect] are equally good ways to do this.
    You’ll then get a draw signal for the invalid region.
    
    The available routines for drawing are documented on the
    [GDK Drawing Primitives][gdk3-Cairo-Interaction] page
    and the cairo documentation.
    
    To receive mouse events on a drawing area, you will need to enable
    them with [gtk.widget.Widget.addEvents]. To receive keyboard events, you
    will need to set the “can-focus” property on the drawing area, and you
    should probably draw some user-visible indication that the drawing
    area is focused. Use [gtk.widget.Widget.hasFocus] in your expose event
    handler to decide whether to draw the focus indicator. See
    [gtk.global.renderFocus] for one way to draw focus.
*/
struct GtkDrawingArea
{
  /** */
  GtkWidget widget;

  /** */
  void* dummy;
}

/** */
struct GtkDrawingAreaClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The #GtkEditable interface is an interface which should be implemented by
    text editing widgets, such as #GtkEntry and #GtkSpinButton. It contains functions
    for generically manipulating an editable widget, a large number of action
    signals used for key bindings, and several signals that an application can
    connect to to modify the behavior of a widget.
    
    As an example of the latter usage, by connecting
    the following handler to #GtkEditable::insert-text, an application
    can convert all entry into a widget into uppercase.
    
    ## Forcing entry to uppercase.
    
    ```c
    #include <ctype.h>;
    
    void
    insert_text_handler (GtkEditable *editable,
                         const gchar *text,
                         gint         length,
                         gint        *position,
                         gpointer     data)
    {
      gchar *result = g_utf8_strup (text, length);
    
      g_signal_handlers_block_by_func (editable,
                                   (gpointer) insert_text_handler, data);
      gtk_editable_insert_text (editable, result, length, position);
      g_signal_handlers_unblock_by_func (editable,
                                         (gpointer) insert_text_handler, data);
    
      g_signal_stop_emission_by_name (editable, "insert_text");
    
      g_free (result);
    }
    ```
*/
struct GtkEditable;

/** */
struct GtkEditableInterface
{
  /** */
  GTypeInterface baseIface;

  /** */
  extern(C) void function(GtkEditable* editable, const(char)* newText, int newTextLength, int* position) insertText;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) deleteText;

  /** */
  extern(C) void function(GtkEditable* editable) changed;

  /** */
  extern(C) void function(GtkEditable* editable, const(char)* newText, int newTextLength, int* position) doInsertText;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) doDeleteText;

  /** */
  extern(C) char* function(GtkEditable* editable, int startPos, int endPos) getChars;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) setSelectionBounds;

  /** */
  extern(C) gboolean function(GtkEditable* editable, int* startPos, int* endPos) getSelectionBounds;

  /** */
  extern(C) void function(GtkEditable* editable, int position) setPosition;

  /** */
  extern(C) int function(GtkEditable* editable) getPosition;
}

/**
    The #GtkEntry widget is a single line text entry
    widget. A fairly large set of key bindings are supported
    by default. If the entered text is longer than the allocation
    of the widget, the widget will scroll so that the cursor
    position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gtk.entry.Entry.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK+ picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.entry.Entry.setInvisibleChar]. Since 2.16, GTK+ displays a warning
    when Caps Lock or input methods might interfere with entering text in
    a password entry. The warning can be turned off with the
    #GtkEntry:caps-lock-warning property.
    
    Since 2.16, GtkEntry has the ability to display progress or activity
    information behind the text. To make an entry display such information,
    use [gtk.entry.Entry.setProgressFraction] or [gtk.entry.Entry.setProgressPulseStep].
    
    Additionally, GtkEntry can show icons at either side of the entry. These
    icons can be activatable by clicking, can be set up as drag source and
    can have tooltips. To add an icon, use [gtk.entry.Entry.setIconFromGicon] or
    one of the various other functions that set an icon from a stock id, an
    icon name or a pixbuf. To trigger an action when the user clicks an icon,
    connect to the #GtkEntry::icon-press signal. To allow DND operations
    from an icon, use [gtk.entry.Entry.setIconDragSource]. To set a tooltip on
    an icon, use [gtk.entry.Entry.setIconTooltipText] or the corresponding function
    for markup.
    
    Note that functionality or information that is only available by clicking
    on an icon in an entry may not be accessible at all to users which are not
    able to use a mouse or other pointing device. It is therefore recommended
    that any such functionality should also be available by other means, e.g.
    via the context menu of the entry.
    
    # CSS nodes
    
    ```plain
    entry[.read-only][.flat][.warning][.error]
    ├── image.left
    ├── image.right
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [progress[.pulse]]
    ╰── [window.popup]
    ```
    
    GtkEntry has a main node with the name entry. Depending on the properties
    of the entry, the style classes .read-only and .flat may appear. The style
    classes .warning and .error may also be used with entries.
    
    When the entry shows icons, it adds subnodes with the name image and the
    style class .left or .right, depending on where the icon appears.
    
    When the entry has a selection, it adds a subnode with the name selection.
    
    When the entry shows progress, it adds a subnode with the name progress.
    The node has the style class .pulse when the shown progress is pulsing.
    
    The CSS node for a context menu is added as a subnode below entry as well.
    
    The undershoot nodes are used to draw the underflow indication when content
    is scrolled out of view. These nodes get the .left and .right style classes
    added depending on where the indication is drawn.
    
    When touch is used and touch selection handles are shown, they are using
    CSS nodes with name cursor-handle. They get the .top or .bottom style class
    depending on where they are shown in relation to the selection. If there is
    just a single handle for the text cursor, it gets the style class
    .insertion-cursor.
*/
struct GtkEntry
{
  /** */
  GtkWidget parentInstance;

  /** */
  GtkEntryPrivate* priv;
}

/** */
struct GtkEntryAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkEntryAccessiblePrivate* priv;
}

/** */
struct GtkEntryAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkEntryAccessiblePrivate;

/**
    The #GtkEntryBuffer class contains the actual text displayed in a
    #GtkEntry widget.
    
    A single #GtkEntryBuffer object can be shared by multiple #GtkEntry
    widgets which will then share the same text content, but not the cursor
    position, visibility attributes, icon etc.
    
    #GtkEntryBuffer may be derived from. Such a derived class might allow
    text to be stored in an alternate location, such as non-pageable memory,
    useful in the case of important passwords. Or a derived class could
    integrate with an application’s concept of undo/redo.
*/
struct GtkEntryBuffer
{
  /** */
  GObject parentInstance;

  /** */
  GtkEntryBufferPrivate* priv;
}

/** */
struct GtkEntryBufferClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkEntryBuffer* buffer, uint position, const(char)* chars, uint nChars) insertedText;

  /** */
  extern(C) void function(GtkEntryBuffer* buffer, uint position, uint nChars) deletedText;

  /** */
  extern(C) const(char)* function(GtkEntryBuffer* buffer, size_t* nBytes) getText;

  /** */
  extern(C) uint function(GtkEntryBuffer* buffer) getLength;

  /** */
  extern(C) uint function(GtkEntryBuffer* buffer, uint position, const(char)* chars, uint nChars) insertText;

  /** */
  extern(C) uint function(GtkEntryBuffer* buffer, uint position, uint nChars) deleteText;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkEntryBufferPrivate;

/**
    Class structure for #GtkEntry. All virtual functions have a default
    implementation. Derived classes may set the virtual function pointers for the
    signal handlers to null, but must keep @get_text_area_size and
    @get_frame_size non-null; either use the default implementation, or provide
    a custom one.
*/
struct GtkEntryClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /**
      Class handler for the #GtkEntry::populate-popup signal. If
        non-null, this will be called to add additional entries to the context
        menu when it is displayed.
  */
  extern(C) void function(GtkEntry* entry, GtkWidget* popup) populatePopup;

  /**
      Class handler for the #GtkEntry::activate signal. The default
        implementation calls [gtk.window.Window.activateDefault] on the entry’s top-level
        window.
  */
  extern(C) void function(GtkEntry* entry) activate;

  /**
      Class handler for the #GtkEntry::move-cursor signal. The
        default implementation specifies the standard #GtkEntry cursor movement
        behavior.
  */
  extern(C) void function(GtkEntry* entry, GtkMovementStep step, int count, gboolean extendSelection) moveCursor;

  /**
      Class handler for the #GtkEntry::insert-at-cursor signal.
        The default implementation inserts text at the cursor.
  */
  extern(C) void function(GtkEntry* entry, const(char)* str) insertAtCursor;

  /**
      Class handler for the #GtkEntry::delete-from-cursor
        signal. The default implementation deletes the selection or the specified
        number of characters or words.
  */
  extern(C) void function(GtkEntry* entry, GtkDeleteType type, int count) deleteFromCursor;

  /**
      Class handler for the #GtkEntry::backspace signal. The default
        implementation deletes the selection or a single character or word.
  */
  extern(C) void function(GtkEntry* entry) backspace;

  /**
      Class handler for the #GtkEntry::cut-clipboard signal. The
        default implementation cuts the selection, if one exists.
  */
  extern(C) void function(GtkEntry* entry) cutClipboard;

  /**
      Class handler for the #GtkEntry::copy-clipboard signal. The
        default implementation copies the selection, if one exists.
  */
  extern(C) void function(GtkEntry* entry) copyClipboard;

  /**
      Class handler for the #GtkEntry::paste-clipboard signal.
        The default implementation pastes at the current cursor position or over
        the current selection if one exists.
  */
  extern(C) void function(GtkEntry* entry) pasteClipboard;

  /**
      Class handler for the #GtkEntry::toggle-overwrite signal.
        The default implementation toggles overwrite mode and blinks the cursor.
  */
  extern(C) void function(GtkEntry* entry) toggleOverwrite;

  /**
      Calculate the size of the text area, which is its
        allocated width and requested height, minus space for margins and borders.
        This virtual function must be non-null.
  */
  extern(C) void function(GtkEntry* entry, int* x, int* y, int* width, int* height) getTextAreaSize;

  /**
      Calculate the size of the text area frame, which is its
        allocated width and requested height, minus space for margins and borders,
        and taking baseline and text height into account. This virtual function
        must be non-null.
  */
  extern(C) void function(GtkEntry* entry, int* x, int* y, int* width, int* height) getFrameSize;

  /** */
  extern(C) void function(GtkEntry* entry) insertEmoji;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;
}

/**
    #GtkEntryCompletion is an auxiliary object to be used in conjunction with
    #GtkEntry to provide the completion functionality. It implements the
    #GtkCellLayout interface, to allow the user to add extra cells to the
    #GtkTreeView with completion matches.
    
    “Completion functionality” means that when the user modifies the text
    in the entry, #GtkEntryCompletion checks which rows in the model match
    the current content of the entry, and displays a list of matches.
    By default, the matching is done by comparing the entry text
    case-insensitively against the text column of the model (see
    [gtk.entry_completion.EntryCompletion.setTextColumn]), but this can be overridden
    with a custom match function (see [gtk.entry_completion.EntryCompletion.setMatchFunc]).
    
    When the user selects a completion, the content of the entry is
    updated. By default, the content of the entry is replaced by the
    text column of the model, but this can be overridden by connecting
    to the #GtkEntryCompletion::match-selected signal and updating the
    entry in the signal handler. Note that you should return true from
    the signal handler to suppress the default behaviour.
    
    To add completion functionality to an entry, use [gtk.entry.Entry.setCompletion].
    
    In addition to regular completion matches, which will be inserted into the
    entry when they are selected, #GtkEntryCompletion also allows to display
    “actions” in the popup window. Their appearance is similar to menuitems,
    to differentiate them clearly from completion strings. When an action is
    selected, the #GtkEntryCompletion::action-activated signal is emitted.
    
    GtkEntryCompletion uses a #GtkTreeModelFilter model to represent the
    subset of the entire model that is currently matching. While the
    GtkEntryCompletion signals #GtkEntryCompletion::match-selected and
    #GtkEntryCompletion::cursor-on-match take the original model and an
    iter pointing to that model as arguments, other callbacks and signals
    (such as #GtkCellLayoutDataFuncs or #GtkCellArea::apply-attributes)
    will generally take the filter model as argument. As long as you are
    only calling [gtk.tree_model.TreeModel.get], this will make no difference to
    you. If for some reason, you need the original model, use
    [gtk.tree_model_filter.TreeModelFilter.getModel]. Don’t forget to use
    [gtk.tree_model_filter.TreeModelFilter.convertIterToChildIter] to obtain a
    matching iter.
*/
struct GtkEntryCompletion
{
  /** */
  GObject parentInstance;

  /** */
  GtkEntryCompletionPrivate* priv;
}

/** */
struct GtkEntryCompletionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GtkEntryCompletion* completion, GtkTreeModel* model, GtkTreeIter* iter) matchSelected;

  /** */
  extern(C) void function(GtkEntryCompletion* completion, int index) actionActivated;

  /** */
  extern(C) gboolean function(GtkEntryCompletion* completion, const(char)* prefix) insertPrefix;

  /** */
  extern(C) gboolean function(GtkEntryCompletion* completion, GtkTreeModel* model, GtkTreeIter* iter) cursorOnMatch;

  /** */
  extern(C) void function(GtkEntryCompletion* completion) noMatches;

  /** */
  extern(C) void function() GtkReserved0;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;
}

/** */
struct GtkEntryCompletionPrivate;

/** */
struct GtkEntryIconAccessible;

/** */
struct GtkEntryPrivate;

/**
    The #GtkEventBox widget is a subclass of #GtkBin which also has its
    own window. It is useful since it allows you to catch events for widgets
    which do not have their own window.
*/
struct GtkEventBox
{
  /** */
  GtkBin bin;

  /** */
  GtkEventBoxPrivate* priv;
}

/** */
struct GtkEventBoxClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkEventBoxPrivate;

/**
    #GtkEventController is a base, low-level implementation for event
    controllers. Those react to a series of #GdkEvents, and possibly trigger
    actions as a consequence of those.
*/
struct GtkEventController;

/** */
struct GtkEventControllerClass;

/**
    #GtkEventControllerKey is an event controller meant for situations
    where you need access to key events.
    
    This object was added in 3.24.
*/
struct GtkEventControllerKey;

/** */
struct GtkEventControllerKeyClass;

/**
    #GtkEventControllerMotion is an event controller meant for situations
    where you need to track the position of the pointer.
    
    This object was added in 3.24.
*/
struct GtkEventControllerMotion;

/** */
struct GtkEventControllerMotionClass;

/**
    #GtkEventControllerScroll is an event controller meant to handle
    scroll events from mice and touchpads. It is capable of handling
    both discrete and continuous scroll events, abstracting them both
    on the #GtkEventControllerScroll::scroll signal (deltas in the
    discrete case are multiples of 1).
    
    In the case of continuous scroll events, #GtkEventControllerScroll
    encloses all #GtkEventControllerScroll::scroll events between two
    #GtkEventControllerScroll::scroll-begin and #GtkEventControllerScroll::scroll-end
    signals.
    
    The behavior of the event controller can be modified by the
    flags given at creation time, or modified at a later point through
    [gtk.event_controller_scroll.EventControllerScroll.setFlags] (e.g. because the scrolling
    conditions of the widget changed).
    
    The controller can be set up to emit motion for either/both vertical
    and horizontal scroll events through #GTK_EVENT_CONTROLLER_SCROLL_VERTICAL,
    #GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL and #GTK_EVENT_CONTROLLER_SCROLL_BOTH.
    If any axis is disabled, the respective #GtkEventControllerScroll::scroll
    delta will be 0. Vertical scroll events will be translated to horizontal
    motion for the devices incapable of horizontal scrolling.
    
    The event controller can also be forced to emit discrete events on all devices
    through #GTK_EVENT_CONTROLLER_SCROLL_DISCRETE. This can be used to implement
    discrete actions triggered through scroll events (e.g. switching across
    combobox options).
    
    The #GTK_EVENT_CONTROLLER_SCROLL_KINETIC flag toggles the emission of the
    #GtkEventControllerScroll::decelerate signal, emitted at the end of scrolling
    with two X/Y velocity arguments that are consistent with the motion that
    was received.
    
    This object was added in 3.24.
*/
struct GtkEventControllerScroll;

/** */
struct GtkEventControllerScrollClass;

/**
    A #GtkExpander allows the user to hide or show its child by clicking
    on an expander triangle similar to the triangles used in a #GtkTreeView.
    
    Normally you use an expander as you would use any other descendant
    of #GtkBin; you create the child widget and use [gtk.container.Container.add]
    to add it to the expander. When the expander is toggled, it will take
    care of showing and hiding the child automatically.
    
    # Special Usage
    
    There are situations in which you may prefer to show and hide the
    expanded widget yourself, such as when you want to actually create
    the widget at expansion time. In this case, create a #GtkExpander
    but do not add a child to it. The expander widget has an
    #GtkExpander:expanded property which can be used to monitor
    its expansion state. You should watch this property with a signal
    connection as follows:
    
    ```c
    static void
    expander_callback (GObject    *object,
                       GParamSpec *param_spec,
                       gpointer    user_data)
    {
      GtkExpander *expander;
    
      expander = GTK_EXPANDER (object);
    
      if (gtk_expander_get_expanded (expander))
        {
          // Show or create widgets
        }
      else
        {
          // Hide or destroy widgets
        }
    }
    
    static void
    create_expander (void)
    {
      GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
      g_signal_connect (expander, "notify::expanded",
                        G_CALLBACK (expander_callback), NULL);
    
      // ...
    }
    ```
    
    # GtkExpander as GtkBuildable
    
    The GtkExpander implementation of the GtkBuildable interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can be
    specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with GtkExpander:
    
    ```xml
    <object class="GtkExpander">
      <child type="label">
        <object class="GtkLabel" id="expander-label"/>
      </child>
      <child>
        <object class="GtkEntry" id="expander-content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    expander
    ├── title
    │   ├── arrow
    │   ╰── <label widget>
    ╰── <child>
    ```
    
    GtkExpander has three CSS nodes, the main node with the name expander,
    a subnode with name title and node below it with name arrow. The arrow of an
    expander that is showing its child gets the :checked pseudoclass added to it.
*/
struct GtkExpander
{
  /** */
  GtkBin bin;

  /** */
  GtkExpanderPrivate* priv;
}

/** */
struct GtkExpanderAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkExpanderAccessiblePrivate* priv;
}

/** */
struct GtkExpanderAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkExpanderAccessiblePrivate;

/** */
struct GtkExpanderClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Keybinding signal is emitted when the user hits the Enter key.
  */
  extern(C) void function(GtkExpander* expander) activate;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkExpanderPrivate;

/**
    #GtkFileChooser is an interface that can be implemented by file
    selection widgets.  In GTK+, the main objects that implement this
    interface are #GtkFileChooserWidget, #GtkFileChooserDialog, and
    #GtkFileChooserButton.  You do not need to write an object that
    implements the #GtkFileChooser interface unless you are trying to
    adapt an existing file selector to expose a standard programming
    interface.
    
    #GtkFileChooser allows for shortcuts to various places in the filesystem.
    In the default implementation these are displayed in the left pane. It
    may be a bit confusing at first that these shortcuts come from various
    sources and in various flavours, so lets explain the terminology here:
    
    $(LIST
      * Bookmarks: are created by the user, by dragging folders from the
        right pane to the left pane, or by using the “Add”. Bookmarks
        can be renamed and deleted by the user.
      
      * Shortcuts: can be provided by the application. For example, a Paint
        program may want to add a shortcut for a Clipart folder. Shortcuts
        cannot be modified by the user.
      
      * Volumes: are provided by the underlying filesystem abstraction. They are
        the “roots” of the filesystem.
    )
      
    # File Names and Encodings
    
    When the user is finished selecting files in a
    #GtkFileChooser, your program can get the selected names
    either as filenames or as URIs.  For URIs, the normal escaping
    rules are applied if the URI contains non-ASCII characters.
    However, filenames are always returned in
    the character set specified by the
    `G_FILENAME_ENCODING` environment variable.
    Please see the GLib documentation for more details about this
    variable.
    
    This means that while you can pass the result of
    [gtk.file_chooser.FileChooser.getFilename] to [glib.global.open] or [glib.global.fopen],
    you may not be able to directly set it as the text of a
    #GtkLabel widget unless you convert it first to UTF-8,
    which all GTK+ widgets expect. You should use [glib.global.filenameToUtf8]
    to convert filenames into strings that can be passed to GTK+
    widgets.
    
    # Adding a Preview Widget
    
    You can add a custom preview widget to a file chooser and then
    get notification about when the preview needs to be updated.
    To install a preview widget, use
    [gtk.file_chooser.FileChooser.setPreviewWidget].  Then, connect to the
    #GtkFileChooser::update-preview signal to get notified when
    you need to update the contents of the preview.
    
    Your callback should use
    [gtk.file_chooser.FileChooser.getPreviewFilename] to see what needs
    previewing.  Once you have generated the preview for the
    corresponding file, you must call
    [gtk.file_chooser.FileChooser.setPreviewWidgetActive] with a boolean
    flag that indicates whether your callback could successfully
    generate a preview.
    
    ## Example: Using a Preview Widget ## {#gtkfilechooser-preview}
    ```c
    {
      GtkImage *preview;
    
      ...
    
      preview = gtk_image_new ();
    
      gtk_file_chooser_set_preview_widget (my_file_chooser, preview);
      g_signal_connect (my_file_chooser, "update-preview",
    		    G_CALLBACK (update_preview_cb), preview);
    }
    
    static void
    update_preview_cb (GtkFileChooser *file_chooser, gpointer data)
    {
      GtkWidget *preview;
      char *filename;
      GdkPixbuf *pixbuf;
      gboolean have_preview;
    
      preview = GTK_WIDGET (data);
      filename = gtk_file_chooser_get_preview_filename (file_chooser);
    
      pixbuf = gdk_pixbuf_new_from_file_at_size (filename, 128, 128, NULL);
      have_preview = (pixbuf != NULL);
      g_free (filename);
    
      gtk_image_set_from_pixbuf (GTK_IMAGE (preview), pixbuf);
      if (pixbuf)
        g_object_unref (pixbuf);
    
      gtk_file_chooser_set_preview_widget_active (file_chooser, have_preview);
    }
    ```
    
    # Adding Extra Widgets
    
    You can add extra widgets to a file chooser to provide options
    that are not present in the default design.  For example, you
    can add a toggle button to give the user the option to open a
    file in read-only mode.  You can use
    [gtk.file_chooser.FileChooser.setExtraWidget] to insert additional
    widgets in a file chooser.
    
    An example for adding extra widgets:
    ```c
    
      GtkWidget *toggle;
    
      ...
    
      toggle = gtk_check_button_new_with_label ("Open file read-only");
      gtk_widget_show (toggle);
      gtk_file_chooser_set_extra_widget (my_file_chooser, toggle);
    }
    ```
    
    If you want to set more than one extra widget in the file
    chooser, you can a container such as a #GtkBox or a #GtkGrid
    and include your widgets in it.  Then, set the container as
    the whole extra widget.
*/
struct GtkFileChooser;

/**
    The #GtkFileChooserButton is a widget that lets the user select a
    file.  It implements the #GtkFileChooser interface.  Visually, it is a
    file name with a button to bring up a #GtkFileChooserDialog.
    The user can then use that dialog to change the file associated with
    that button.  This widget does not support setting the
    #GtkFileChooser:select-multiple property to true.
    
    ## Create a button to let the user select a file in /etc
    
    ```c
    {
      GtkWidget *button;
    
      button = gtk_file_chooser_button_new (_("Select a file"),
                                            GTK_FILE_CHOOSER_ACTION_OPEN);
      gtk_file_chooser_set_current_folder (GTK_FILE_CHOOSER (button),
                                           "/etc");
    }
    ```
    
    The #GtkFileChooserButton supports the #GtkFileChooserActions
    [gtk.types.FileChooserAction.Open] and [gtk.types.FileChooserAction.SelectFolder].
    
    > The #GtkFileChooserButton will ellipsize the label, and will thus
    > request little horizontal space.  To give the button more space,
    > you should call [gtk.widget.Widget.getPreferredSize],
    > [gtk.file_chooser_button.FileChooserButton.setWidthChars], or pack the button in
    > such a way that other interface elements give space to the
    > widget.
    
    # CSS nodes
    
    GtkFileChooserButton has a CSS node with name “filechooserbutton”, containing
    a subnode for the internal button with name “button” and style class “.file”.
*/
struct GtkFileChooserButton
{
  /** */
  GtkBox parent;

  /** */
  GtkFileChooserButtonPrivate* priv;
}

/** */
struct GtkFileChooserButtonClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /**
      Signal emitted when the user selects a file.
  */
  extern(C) void function(GtkFileChooserButton* fc) fileSet;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFileChooserButtonPrivate;

/**
    #GtkFileChooserDialog is a dialog box suitable for use with
    “File/Open” or “File/Save as” commands.  This widget works by
    putting a #GtkFileChooserWidget inside a #GtkDialog.  It exposes
    the #GtkFileChooser interface, so you can use all of the
    #GtkFileChooser functions on the file chooser dialog as well as
    those for #GtkDialog.
    
    Note that #GtkFileChooserDialog does not have any methods of its
    own.  Instead, you should use the functions that work on a
    #GtkFileChooser.
    
    If you want to integrate well with the platform you should use the
    #GtkFileChooserNative API, which will use a platform-specific
    dialog if available and fall back to GtkFileChooserDialog
    otherwise.
    
    ## Typical usage ## {#gtkfilechooser-typical-usage}
    
    In the simplest of cases, you can the following code to use
    #GtkFileChooserDialog to select a file for opening:
    
    ```
    GtkWidget *dialog;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    gint res;
    
    dialog = gtk_file_chooser_dialog_new ("Open File",
                                          parent_window,
                                          action,
                                          _("_Cancel"),
                                          GTK_RESPONSE_CANCEL,
                                          _("_Open"),
                                          GTK_RESPONSE_ACCEPT,
                                          NULL);
    
    res = gtk_dialog_run (GTK_DIALOG (dialog));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
        GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
        filename = gtk_file_chooser_get_filename (chooser);
        open_file (filename);
        g_free (filename);
      }
    
    gtk_widget_destroy (dialog);
    ```
    
    To use a dialog for saving, you can use this:
    
    ```
    GtkWidget *dialog;
    GtkFileChooser *chooser;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    gint res;
    
    dialog = gtk_file_chooser_dialog_new ("Save File",
                                          parent_window,
                                          action,
                                          _("_Cancel"),
                                          GTK_RESPONSE_CANCEL,
                                          _("_Save"),
                                          GTK_RESPONSE_ACCEPT,
                                          NULL);
    chooser = GTK_FILE_CHOOSER (dialog);
    
    gtk_file_chooser_set_do_overwrite_confirmation (chooser, TRUE);
    
    if (user_edited_a_new_document)
      gtk_file_chooser_set_current_name (chooser,
                                         _("Untitled document"));
    else
      gtk_file_chooser_set_filename (chooser,
                                     existing_filename);
    
    res = gtk_dialog_run (GTK_DIALOG (dialog));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
    
        filename = gtk_file_chooser_get_filename (chooser);
        save_to_file (filename);
        g_free (filename);
      }
    
    gtk_widget_destroy (dialog);
    ```
    
    ## Setting up a file chooser dialog ## {#gtkfilechooserdialog-setting-up}
    
    There are various cases in which you may need to use a #GtkFileChooserDialog:
    
    $(LIST
      * To select a file for opening. Use #GTK_FILE_CHOOSER_ACTION_OPEN.
      
      * To save a file for the first time. Use #GTK_FILE_CHOOSER_ACTION_SAVE,
        and suggest a name such as “Untitled” with [gtk.file_chooser.FileChooser.setCurrentName].
      
      * To save a file under a different name. Use #GTK_FILE_CHOOSER_ACTION_SAVE,
        and set the existing filename with [gtk.file_chooser.FileChooser.setFilename].
      
      * To choose a folder instead of a file. Use #GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
    )
      
    Note that old versions of the file chooser’s documentation suggested
    using [gtk.file_chooser.FileChooser.setCurrentFolder] in various
    situations, with the intention of letting the application
    suggest a reasonable default folder.  This is no longer
    considered to be a good policy, as now the file chooser is
    able to make good suggestions on its own.  In general, you
    should only cause the file chooser to show a specific folder
    when it is appropriate to use [gtk.file_chooser.FileChooser.setFilename],
    i.e. when you are doing a Save As command and you already
    have a file saved somewhere.
    
    ## Response Codes ## {#gtkfilechooserdialog-responses}
    
    #GtkFileChooserDialog inherits from #GtkDialog, so buttons that
    go in its action area have response codes such as
    #GTK_RESPONSE_ACCEPT and #GTK_RESPONSE_CANCEL.  For example, you
    could call [gtk.file_chooser_dialog.FileChooserDialog.new_] as follows:
    
    ```
    GtkWidget *dialog;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    
    dialog = gtk_file_chooser_dialog_new ("Open File",
                                          parent_window,
                                          action,
                                          _("_Cancel"),
                                          GTK_RESPONSE_CANCEL,
                                          _("_Open"),
                                          GTK_RESPONSE_ACCEPT,
                                          NULL);
    ```
    
    This will create buttons for “Cancel” and “Open” that use stock
    response identifiers from #GtkResponseType.  For most dialog
    boxes you can use your own custom response codes rather than the
    ones in #GtkResponseType, but #GtkFileChooserDialog assumes that
    its “accept”-type action, e.g. an “Open” or “Save” button,
    will have one of the following response codes:
    
    $(LIST
      * #GTK_RESPONSE_ACCEPT
      * #GTK_RESPONSE_OK
      * #GTK_RESPONSE_YES
      * #GTK_RESPONSE_APPLY
    )
      
    This is because #GtkFileChooserDialog must intercept responses
    and switch to folders if appropriate, rather than letting the
    dialog terminate — the implementation uses these known
    response codes to know which responses can be blocked if
    appropriate.
    
    To summarize, make sure you use a
    [stock response code][gtkfilechooserdialog-responses]
    when you use #GtkFileChooserDialog to ensure proper operation.
*/
struct GtkFileChooserDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkFileChooserDialogPrivate* priv;
}

/** */
struct GtkFileChooserDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFileChooserDialogPrivate;

/**
    #GtkFileChooserNative is an abstraction of a dialog box suitable
    for use with “File/Open” or “File/Save as” commands. By default, this
    just uses a #GtkFileChooserDialog to implement the actual dialog.
    However, on certain platforms, such as Windows and macOS, the native platform
    file chooser is used instead. When the application is running in a
    sandboxed environment without direct filesystem access (such as Flatpak),
    #GtkFileChooserNative may call the proper APIs (portals) to let the user
    choose a file and make it available to the application.
    
    While the API of #GtkFileChooserNative closely mirrors #GtkFileChooserDialog, the main
    difference is that there is no access to any #GtkWindow or #GtkWidget for the dialog.
    This is required, as there may not be one in the case of a platform native dialog.
    Showing, hiding and running the dialog is handled by the #GtkNativeDialog functions.
    
    ## Typical usage ## {#gtkfilechoosernative-typical-usage}
    
    In the simplest of cases, you can the following code to use
    #GtkFileChooserDialog to select a file for opening:
    
    ```
    GtkFileChooserNative *native;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    gint res;
    
    native = gtk_file_chooser_native_new ("Open File",
                                          parent_window,
                                          action,
                                          "_Open",
                                          "_Cancel");
    
    res = gtk_native_dialog_run (GTK_NATIVE_DIALOG (native));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
        GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
        filename = gtk_file_chooser_get_filename (chooser);
        open_file (filename);
        g_free (filename);
      }
    
    g_object_unref (native);
    ```
    
    To use a dialog for saving, you can use this:
    
    ```
    GtkFileChooserNative *native;
    GtkFileChooser *chooser;
    GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    gint res;
    
    native = gtk_file_chooser_native_new ("Save File",
                                          parent_window,
                                          action,
                                          "_Save",
                                          "_Cancel");
    chooser = GTK_FILE_CHOOSER (native);
    
    gtk_file_chooser_set_do_overwrite_confirmation (chooser, TRUE);
    
    if (user_edited_a_new_document)
      gtk_file_chooser_set_current_name (chooser,
                                         _("Untitled document"));
    else
      gtk_file_chooser_set_filename (chooser,
                                     existing_filename);
    
    res = gtk_native_dialog_run (GTK_NATIVE_DIALOG (native));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        char *filename;
    
        filename = gtk_file_chooser_get_filename (chooser);
        save_to_file (filename);
        g_free (filename);
      }
    
    g_object_unref (native);
    ```
    
    For more information on how to best set up a file dialog, see #GtkFileChooserDialog.
    
    ## Response Codes ## {#gtkfilechooserdialognative-responses}
    
    #GtkFileChooserNative inherits from #GtkNativeDialog, which means it
    will return #GTK_RESPONSE_ACCEPT if the user accepted, and
    #GTK_RESPONSE_CANCEL if he pressed cancel. It can also return
    #GTK_RESPONSE_DELETE_EVENT if the window was unexpectedly closed.
    
    ## Differences from #GtkFileChooserDialog ##  {#gtkfilechooserdialognative-differences}
    
    There are a few things in the GtkFileChooser API that are not
    possible to use with #GtkFileChooserNative, as such use would
    prohibit the use of a native dialog.
    
    There is no support for the signals that are emitted when the user
    navigates in the dialog, including:
    $(LIST
      * #GtkFileChooser::current-folder-changed
      * #GtkFileChooser::selection-changed
      * #GtkFileChooser::file-activated
      * #GtkFileChooser::confirm-overwrite
    )
      
    You can also not use the methods that directly control user navigation:
    $(LIST
      * [gtk.file_chooser.FileChooser.unselectFilename]
      * [gtk.file_chooser.FileChooser.selectAll]
      * [gtk.file_chooser.FileChooser.unselectAll]
    )
      
    If you need any of the above you will have to use #GtkFileChooserDialog directly.
    
    No operations that change the the dialog work while the dialog is
    visible. Set all the properties that are required before showing the dialog.
    
    ## Win32 details ## {#gtkfilechooserdialognative-win32}
    
    On windows the IFileDialog implementation (added in Windows Vista) is
    used. It supports many of the features that #GtkFileChooserDialog
    does, but there are some things it does not handle:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget].
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added using a mimetype or custom filter.
    )
      
    If any of these features are used the regular #GtkFileChooserDialog
    will be used in place of the native one.
    
    ## Portal details ## {#gtkfilechooserdialognative-portal}
    
    When the org.freedesktop.portal.FileChooser portal is available on the
    session bus, it is used to bring up an out-of-process file chooser. Depending
    on the kind of session the application is running in, this may or may not
    be a GTK+ file chooser. In this situation, the following things are not
    supported and will be silently ignored:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget].
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added with a custom filter.
    )
      
    ## macOS details ## {#gtkfilechooserdialognative-macos}
    
    On macOS the NSSavePanel and NSOpenPanel classes are used to provide native
    file chooser dialogs. Some features provided by #GtkFileChooserDialog are
    not supported:
    
    $(LIST
      * Extra widgets added with [gtk.file_chooser.FileChooser.setExtraWidget], unless the
        widget is an instance of GtkLabel, in which case the label text will be used
        to set the NSSavePanel message instance property.
      
      * Use of custom previews by connecting to #GtkFileChooser::update-preview.
      
      * Any #GtkFileFilter added with a custom filter.
      
      * Shortcut folders.
    )
*/
struct GtkFileChooserNative;

/** */
struct GtkFileChooserNativeClass
{
  /** */
  GtkNativeDialogClass parentClass;
}

/**
    #GtkFileChooserWidget is a widget for choosing files.
    It exposes the #GtkFileChooser interface, and you should
    use the methods of this interface to interact with the
    widget.
    
    # CSS nodes
    
    GtkFileChooserWidget has a single CSS node with name filechooser.
*/
struct GtkFileChooserWidget
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkFileChooserWidgetPrivate* priv;
}

/** */
struct GtkFileChooserWidgetAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkFileChooserWidgetAccessiblePrivate* priv;
}

/** */
struct GtkFileChooserWidgetAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkFileChooserWidgetAccessiblePrivate;

/** */
struct GtkFileChooserWidgetClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFileChooserWidgetPrivate;

/**
    A GtkFileFilter can be used to restrict the files being shown in a
    #GtkFileChooser. Files can be filtered based on their name (with
    [gtk.file_filter.FileFilter.addPattern]), on their mime type (with
    [gtk.file_filter.FileFilter.addMimeType]), or by a custom filter function
    (with [gtk.file_filter.FileFilter.addCustom]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that #GtkFileFilter allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkFileChooser,
    see [gtk.file_chooser.FileChooser.addFilter], but it is also possible
    to manually use a filter on a file with [gtk.file_filter.FileFilter.filter].
    
    # GtkFileFilter as GtkBuildable
    
    The GtkFileFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>` or `<pattern>` has the same effect as as calling
    [gtk.file_filter.FileFilter.addMimeType] or [gtk.file_filter.FileFilter.addPattern].
    
    An example of a UI definition fragment specifying GtkFileFilter
    rules:
    
    ```xml
    <object class="GtkFileFilter">
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/ *</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
        <pattern>*.png</pattern>
      </patterns>
    </object>
    ```
*/
struct GtkFileFilter;

/**
    A #GtkFileFilterInfo-struct is used to pass information about the
    tested file to [gtk.file_filter.FileFilter.filter].
*/
struct GtkFileFilterInfo
{
  /**
      Flags indicating which of the following fields need
        are filled
  */
  GtkFileFilterFlags contains;

  /**
      the filename of the file being tested
  */
  const(char)* filename;

  /**
      the URI for the file being tested
  */
  const(char)* uri;

  /**
      the string that will be used to display the file
        in the file chooser
  */
  const(char)* displayName;

  /**
      the mime type of the file
  */
  const(char)* mimeType;
}

/**
    The #GtkFixed widget is a container which can place child widgets
    at fixed positions and with fixed sizes, given in pixels. #GtkFixed
    performs no automatic layout management.
    
    For most applications, you should not use this container! It keeps
    you from having to learn about the other GTK+ containers, but it
    results in broken applications.  With #GtkFixed, the following
    things will result in truncated text, overlapping widgets, and
    other display bugs:
    
    $(LIST
      * Themes, which may change widget sizes.
      
      * Fonts other than the one you used to write the app will of course
        change the size of widgets containing text; keep in mind that
        users may use a larger font because of difficulty reading the
        default, or they may be using a different OS that provides different fonts.
      
      * Translation of text into other languages changes its size. Also,
        display of non-English text will use a different font in many
        cases.
    )
      
    In addition, #GtkFixed does not pay attention to text direction and thus may
    produce unwanted results if your app is run under right-to-left languages
    such as Hebrew or Arabic. That is: normally GTK+ will order containers
    appropriately for the text direction, e.g. to put labels to the right of the
    thing they label when using an RTL language, but it can’t do that with
    #GtkFixed. So if you need to reorder widgets depending on the text direction,
    you would need to manually detect it and adjust child positions accordingly.
    
    Finally, fixed positioning makes it kind of annoying to add/remove
    GUI elements, since you have to reposition all the other
    elements. This is a long-term maintenance problem for your
    application.
    
    If you know none of these things are an issue for your application,
    and prefer the simplicity of #GtkFixed, by all means use the
    widget. But you should be aware of the tradeoffs.
    
    See also #GtkLayout, which shares the ability to perform fixed positioning
    of child widgets and additionally adds custom drawing and scrollability.
*/
struct GtkFixed
{
  /** */
  GtkContainer container;

  /** */
  GtkFixedPrivate* priv;
}

/** */
struct GtkFixedChild
{
  /** */
  GtkWidget* widget;

  /** */
  int x;

  /** */
  int y;
}

/** */
struct GtkFixedClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFixedPrivate;

/**
    A GtkFlowBox positions child widgets in sequence according to its
    orientation.
    
    For instance, with the horizontal orientation, the widgets will be
    arranged from left to right, starting a new row under the previous
    row when necessary. Reducing the width in this case will require more
    rows, so a larger height will be requested.
    
    Likewise, with the vertical orientation, the widgets will be arranged
    from top to bottom, starting a new column to the right when necessary.
    Reducing the height will require more columns, so a larger width will
    be requested.
    
    The size request of a GtkFlowBox alone may not be what you expect; if you
    need to be able to shrink it along both axes and dynamically reflow its
    children, you may have to wrap it in a #GtkScrolledWindow to enable that.
    
    The children of a GtkFlowBox can be dynamically sorted and filtered.
    
    Although a GtkFlowBox must have only #GtkFlowBoxChild children,
    you can add any kind of widget to it via [gtk.container.Container.add], and
    a GtkFlowBoxChild widget will automatically be inserted between
    the box and the widget.
    
    Also see #GtkListBox.
    
    GtkFlowBox was added in GTK+ 3.12.
    
    # CSS nodes
    
    ```plain
    flowbox
    ├── flowboxchild
    │   ╰── <child>
    ├── flowboxchild
    │   ╰── <child>
    ┊
    ╰── [rubberband]
    ```
    
    GtkFlowBox uses a single CSS node with name flowbox. GtkFlowBoxChild
    uses a single CSS node with name flowboxchild.
    For rubberband selection, a subnode with name rubberband is used.
*/
struct GtkFlowBox
{
  /** */
  GtkContainer container;
}

/** */
struct GtkFlowBoxAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkFlowBoxAccessiblePrivate* priv;
}

/** */
struct GtkFlowBoxAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkFlowBoxAccessiblePrivate;

/** */
struct GtkFlowBoxChild
{
  /** */
  GtkBin parentInstance;
}

/** */
struct GtkFlowBoxChildAccessible
{
  /** */
  GtkContainerAccessible parent;
}

/** */
struct GtkFlowBoxChildAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkFlowBoxChildClass
{
  /** */
  GtkBinClass parentClass;

  /** */
  extern(C) void function(GtkFlowBoxChild* child) activate;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;
}

/** */
struct GtkFlowBoxClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkFlowBox* box, GtkFlowBoxChild* child) childActivated;

  /** */
  extern(C) void function(GtkFlowBox* box) selectedChildrenChanged;

  /** */
  extern(C) void function(GtkFlowBox* box) activateCursorChild;

  /** */
  extern(C) void function(GtkFlowBox* box) toggleCursorChild;

  /** */
  extern(C) gboolean function(GtkFlowBox* box, GtkMovementStep step, int count) moveCursor;

  /** */
  extern(C) void function(GtkFlowBox* box) selectAll;

  /** */
  extern(C) void function(GtkFlowBox* box) unselectAll;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;
}

/**
    The #GtkFontButton is a button which displays the currently selected
    font an allows to open a font chooser dialog to change the font.
    It is suitable widget for selecting a font in a preference dialog.
    
    # CSS nodes
    
    GtkFontButton has a single CSS node with name button and style class .font.
*/
struct GtkFontButton
{
  /** */
  GtkButton button;

  /** */
  GtkFontButtonPrivate* priv;
}

/** */
struct GtkFontButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function(GtkFontButton* gfp) fontSet;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFontButtonPrivate;

/**
    #GtkFontChooser is an interface that can be implemented by widgets
    displaying the list of fonts. In GTK+, the main objects
    that implement this interface are #GtkFontChooserWidget,
    #GtkFontChooserDialog and #GtkFontButton. The GtkFontChooser interface
    has been introducted in GTK+ 3.2.
*/
struct GtkFontChooser;

/**
    The #GtkFontChooserDialog widget is a dialog for selecting a font.
    It implements the #GtkFontChooser interface.
    
    # GtkFontChooserDialog as GtkBuildable
    
    The GtkFontChooserDialog implementation of the #GtkBuildable
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
*/
struct GtkFontChooserDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkFontChooserDialogPrivate* priv;
}

/** */
struct GtkFontChooserDialogClass
{
  /**
      The parent class.
  */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFontChooserDialogPrivate;

/** */
struct GtkFontChooserIface
{
  /** */
  GTypeInterface baseIface;

  /** */
  extern(C) PangoFontFamily* function(GtkFontChooser* fontchooser) getFontFamily;

  /** */
  extern(C) PangoFontFace* function(GtkFontChooser* fontchooser) getFontFace;

  /** */
  extern(C) int function(GtkFontChooser* fontchooser) getFontSize;

  /** */
  extern(C) void function(GtkFontChooser* fontchooser, GtkFontFilterFunc filter, void* userData, GDestroyNotify destroy) setFilterFunc;

  /** */
  extern(C) void function(GtkFontChooser* chooser, const(char)* fontname) fontActivated;

  /** */
  extern(C) void function(GtkFontChooser* fontchooser, PangoFontMap* fontmap) setFontMap;

  /** */
  extern(C) PangoFontMap* function(GtkFontChooser* fontchooser) getFontMap;

  /** */
  void*[10] padding;
}

/**
    The #GtkFontChooserWidget widget lists the available fonts,
    styles and sizes, allowing the user to select a font. It is
    used in the #GtkFontChooserDialog widget to provide a
    dialog box for selecting fonts.
    
    To set the font which is initially selected, use
    [gtk.font_chooser.FontChooser.setFont] or [gtk.font_chooser.FontChooser.setFontDesc].
    
    To get the selected font use [gtk.font_chooser.FontChooser.getFont] or
    [gtk.font_chooser.FontChooser.getFontDesc].
    
    To change the text which is shown in the preview area, use
    [gtk.font_chooser.FontChooser.setPreviewText].
    
    # CSS nodes
    
    GtkFontChooserWidget has a single CSS node with name fontchooser.
*/
struct GtkFontChooserWidget
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkFontChooserWidgetPrivate* priv;
}

/** */
struct GtkFontChooserWidgetClass
{
  /**
      The parent class.
  */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkFontChooserWidgetPrivate;

/** */
struct GtkFontSelection
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkFontSelectionPrivate* priv;
}

/** */
struct GtkFontSelectionClass
{
  /** */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFontSelectionDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkFontSelectionDialogPrivate* priv;
}

/** */
struct GtkFontSelectionDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFontSelectionDialogPrivate;

/** */
struct GtkFontSelectionPrivate;

/**
    The frame widget is a bin that surrounds its child with a decorative
    frame and an optional label. If present, the label is drawn in a gap
    in the top side of the frame. The position of the label can be
    controlled with [gtk.frame.Frame.setLabelAlign].
    
    # GtkFrame as GtkBuildable
    
    The GtkFrame implementation of the #GtkBuildable interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can
    be specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with [gtk.frame.Frame]:
    
    ```xml
    <object class="GtkFrame">
      <child type="label">
        <object class="GtkLabel" id="frame-label"/>
      </child>
      <child>
        <object class="GtkEntry" id="frame-content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    frame
    ├── border[.flat]
    ├── <label widget>
    ╰── <child>
    ```
    
    GtkFrame has a main CSS node named “frame” and a subnode named “border”. The
    “border” node is used to draw the visible border. You can set the appearance
    of the border using CSS properties like “border-style” on the “border” node.
    
    The border node can be given the style class “.flat”, which is used by themes
    to disable drawing of the border. To do this from code, call
    [gtk.frame.Frame.setShadowType] with [gtk.types.ShadowType.None] to add the “.flat” class or
    any other shadow type to remove it.
*/
struct GtkFrame
{
  /** */
  GtkBin bin;

  /** */
  GtkFramePrivate* priv;
}

/** */
struct GtkFrameAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkFrameAccessiblePrivate* priv;
}

/** */
struct GtkFrameAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkFrameAccessiblePrivate;

/** */
struct GtkFrameClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function(GtkFrame* frame, GtkAllocation* allocation) computeChildAllocation;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkFramePrivate;

/**
    #GtkGLArea is a widget that allows drawing with OpenGL.
    
    #GtkGLArea sets up its own #GdkGLContext for the window it creates, and
    creates a custom GL framebuffer that the widget will do GL rendering onto.
    It also ensures that this framebuffer is the default GL rendering target
    when rendering.
    
    In order to draw, you have to connect to the #GtkGLArea::render signal,
    or subclass #GtkGLArea and override the @GtkGLAreaClass.render() virtual
    function.
    
    The #GtkGLArea widget ensures that the #GdkGLContext is associated with
    the widget's drawing area, and it is kept updated when the size and
    position of the drawing area changes.
    
    ## Drawing with GtkGLArea ##
    
    The simplest way to draw using OpenGL commands in a #GtkGLArea is to
    create a widget instance and connect to the #GtkGLArea::render signal:
    
    ```c
      // create a GtkGLArea instance
      GtkWidget *gl_area = gtk_gl_area_new ();
    
      // connect to the "render" signal
      g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
    ```
    
    The `render()` function will be called when the #GtkGLArea is ready
    for you to draw its content:
    
    ```c
      static gboolean
      render (GtkGLArea *area, GdkGLContext *context)
      {
        // inside this function it's safe to use GL; the given
        // #GdkGLContext has been made current to the drawable
        // surface used by the #GtkGLArea and the viewport has
        // already been set to be the size of the allocation
    
        // we can start by clearing the buffer
        glClearColor (0, 0, 0, 0);
        glClear (GL_COLOR_BUFFER_BIT);
    
        // draw your object
        draw_an_object ();
    
        // we completed our drawing; the draw commands will be
        // flushed at the end of the signal emission chain, and
        // the buffers will be drawn on the window
        return TRUE;
      }
    ```
    
    If you need to initialize OpenGL state, e.g. buffer objects or
    shaders, you should use the #GtkWidget::realize signal; you
    can use the #GtkWidget::unrealize signal to clean up. Since the
    #GdkGLContext creation and initialization may fail, you will
    need to check for errors, using [gtk.glarea.GLArea.getError]. An example
    of how to safely initialize the GL state is:
    
    ```c
      static void
      on_realize (GtkGLarea *area)
      {
        // We need to make the context current if we want to
        // call GL API
        gtk_gl_area_make_current (area);
    
        // If there were errors during the initialization or
        // when trying to make the context current, this
        // function will return a #GError for you to catch
        if (gtk_gl_area_get_error (area) != NULL)
          return;
    
        // You can also use gtk_gl_area_set_error() in order
        // to show eventual initialization errors on the
        // GtkGLArea widget itself
        GError *internal_error = NULL;
        init_buffer_objects (&error);
        if (error != NULL)
          {
            gtk_gl_area_set_error (area, error);
            g_error_free (error);
            return;
          }
    
        init_shaders (&error);
        if (error != NULL)
          {
            gtk_gl_area_set_error (area, error);
            g_error_free (error);
            return;
          }
      }
    ```
    
    If you need to change the options for creating the #GdkGLContext
    you should use the #GtkGLArea::create-context signal.
*/
struct GtkGLArea
{
  /** */
  GtkWidget parentInstance;
}

/**
    The [gtk.glarea_class.GLAreaClass] structure contains only private data.
*/
struct GtkGLAreaClass
{
  /** */
  GtkWidgetClass parentClass;

  /**
      class closure for the #GtkGLArea::render signal
  */
  extern(C) gboolean function(GtkGLArea* area, GdkGLContext* context) render;

  /**
      class closeure for the #GtkGLArea::resize signal
  */
  extern(C) void function(GtkGLArea* area, int width, int height) resize;

  /**
      class closure for the #GtkGLArea::create-context signal
  */
  extern(C) GdkGLContext* function(GtkGLArea* area) createContext;

  /** */
  void*[6] Padding;
}

/**
    #GtkGesture is the base object for gesture recognition, although this
    object is quite generalized to serve as a base for multi-touch gestures,
    it is suitable to implement single-touch and pointer-based gestures (using
    the special null #GdkEventSequence value for these).
    
    The number of touches that a #GtkGesture need to be recognized is controlled
    by the #GtkGesture:n-points property, if a gesture is keeping track of less
    or more than that number of sequences, it won't check wether the gesture
    is recognized.
    
    As soon as the gesture has the expected number of touches, the gesture will
    run the #GtkGesture::check signal regularly on input events until the gesture
    is recognized, the criteria to consider a gesture as "recognized" is left to
    #GtkGesture subclasses.
    
    A recognized gesture will then emit the following signals:
    $(LIST
      * #GtkGesture::begin when the gesture is recognized.
      * A number of #GtkGesture::update, whenever an input event is processed.
      * #GtkGesture::end when the gesture is no longer recognized.
    )
      
    ## Event propagation
    
    In order to receive events, a gesture needs to either set a propagation phase
    through [gtk.event_controller.EventController.setPropagationPhase], or feed those manually
    through [gtk.event_controller.EventController.handleEvent].
    
    In the capture phase, events are propagated from the toplevel down to the
    target widget, and gestures that are attached to containers above the widget
    get a chance to interact with the event before it reaches the target.
    
    After the capture phase, GTK+ emits the traditional #GtkWidget::button-press-event,
    #GtkWidget::button-release-event, #GtkWidget::touch-event, etc signals. Gestures
    with the [gtk.types.PropagationPhase.Target] phase are fed events from the default #GtkWidget::event
    handlers.
    
    In the bubble phase, events are propagated up from the target widget to the
    toplevel, and gestures that are attached to containers above the widget get
    a chance to interact with events that have not been handled yet.
    
    ## States of a sequence # {#touch-sequence-states}
    
    Whenever input interaction happens, a single event may trigger a cascade of
    #GtkGestures, both across the parents of the widget receiving the event and
    in parallel within an individual widget. It is a responsibility of the
    widgets using those gestures to set the state of touch sequences accordingly
    in order to enable cooperation of gestures around the #GdkEventSequences
    triggering those.
    
    Within a widget, gestures can be grouped through [gtk.gesture.Gesture.group],
    grouped gestures synchronize the state of sequences, so calling
    [gtk.gesture.Gesture.setSequenceState] on one will effectively propagate
    the state throughout the group.
    
    By default, all sequences start out in the #GTK_EVENT_SEQUENCE_NONE state,
    sequences in this state trigger the gesture event handler, but event
    propagation will continue unstopped by gestures.
    
    If a sequence enters into the #GTK_EVENT_SEQUENCE_DENIED state, the gesture
    group will effectively ignore the sequence, letting events go unstopped
    through the gesture, but the "slot" will still remain occupied while
    the touch is active.
    
    If a sequence enters in the #GTK_EVENT_SEQUENCE_CLAIMED state, the gesture
    group will grab all interaction on the sequence, by:
    $(LIST
      * Setting the same sequence to #GTK_EVENT_SEQUENCE_DENIED on every other gesture
        group within the widget, and every gesture on parent widgets in the propagation
        chain.
      * calling #GtkGesture::cancel on every gesture in widgets underneath in the
        propagation chain.
      * Stopping event propagation after the gesture group handles the event.
    )
      
    Note: if a sequence is set early to #GTK_EVENT_SEQUENCE_CLAIMED on
    #GDK_TOUCH_BEGIN/#GDK_BUTTON_PRESS (so those events are captured before
    reaching the event widget, this implies #GTK_PHASE_CAPTURE), one similar
    event will emulated if the sequence changes to #GTK_EVENT_SEQUENCE_DENIED.
    This way event coherence is preserved before event propagation is unstopped
    again.
    
    Sequence states can't be changed freely, see [gtk.gesture.Gesture.setSequenceState]
    to know about the possible lifetimes of a #GdkEventSequence.
    
    ## Touchpad gestures
    
    On the platforms that support it, #GtkGesture will handle transparently
    touchpad gesture events. The only precautions users of #GtkGesture should do
    to enable this support are:
    $(LIST
      * Enabling [gdk.types.EventMask.TouchpadGestureMask] on their #GdkWindows
      * If the gesture has [gtk.types.PropagationPhase.None], ensuring events of type
        [gdk.types.EventType.TouchpadSwipe] and [gdk.types.EventType.TouchpadPinch] are handled by the #GtkGesture
    )
*/
struct GtkGesture;

/** */
struct GtkGestureClass;

/**
    #GtkGestureDrag is a #GtkGesture implementation that recognizes drag
    operations. The drag operation itself can be tracked throught the
    #GtkGestureDrag::drag-begin, #GtkGestureDrag::drag-update and
    #GtkGestureDrag::drag-end signals, or the relevant coordinates be
    extracted through [gtk.gesture_drag.GestureDrag.getOffset] and
    [gtk.gesture_drag.GestureDrag.getStartPoint].
*/
struct GtkGestureDrag;

/** */
struct GtkGestureDragClass;

/**
    #GtkGestureLongPress is a #GtkGesture implementation able to recognize
    long presses, triggering the #GtkGestureLongPress::pressed after the
    timeout is exceeded.
    
    If the touchpoint is lifted before the timeout passes, or if it drifts
    too far of the initial press point, the #GtkGestureLongPress::cancelled
    signal will be emitted.
*/
struct GtkGestureLongPress;

/** */
struct GtkGestureLongPressClass;

/**
    #GtkGestureMultiPress is a #GtkGesture implementation able to recognize
    multiple clicks on a nearby zone, which can be listened for through the
    #GtkGestureMultiPress::pressed signal. Whenever time or distance between
    clicks exceed the GTK+ defaults, #GtkGestureMultiPress::stopped is emitted,
    and the click counter is reset.
    
    Callers may also restrict the area that is considered valid for a >1
    touch/button press through [gtk.gesture_multi_press.GestureMultiPress.setArea], so any
    click happening outside that area is considered to be a first click of
    its own.
*/
struct GtkGestureMultiPress;

/** */
struct GtkGestureMultiPressClass;

/**
    #GtkGesturePan is a #GtkGesture implementation able to recognize
    pan gestures, those are drags that are locked to happen along one
    axis. The axis that a #GtkGesturePan handles is defined at
    construct time, and can be changed through
    [gtk.gesture_pan.GesturePan.setOrientation].
    
    When the gesture starts to be recognized, #GtkGesturePan will
    attempt to determine as early as possible whether the sequence
    is moving in the expected direction, and denying the sequence if
    this does not happen.
    
    Once a panning gesture along the expected axis is recognized,
    the #GtkGesturePan::pan signal will be emitted as input events
    are received, containing the offset in the given axis.
*/
struct GtkGesturePan;

/** */
struct GtkGesturePanClass;

/**
    #GtkGestureRotate is a #GtkGesture implementation able to recognize
    2-finger rotations, whenever the angle between both handled sequences
    changes, the #GtkGestureRotate::angle-changed signal is emitted.
*/
struct GtkGestureRotate;

/** */
struct GtkGestureRotateClass;

/**
    #GtkGestureSingle is a subclass of #GtkGesture, optimized (although
    not restricted) for dealing with mouse and single-touch gestures. Under
    interaction, these gestures stick to the first interacting sequence, which
    is accessible through [gtk.gesture_single.GestureSingle.getCurrentSequence] while the
    gesture is being interacted with.
    
    By default gestures react to both `GDK_BUTTON_PRIMARY` and touch
    events, [gtk.gesture_single.GestureSingle.setTouchOnly] can be used to change the
    touch behavior. Callers may also specify a different mouse button number
    to interact with through [gtk.gesture_single.GestureSingle.setButton], or react to any
    mouse button by setting 0. While the gesture is active, the button being
    currently pressed can be known through [gtk.gesture_single.GestureSingle.getCurrentButton].
*/
struct GtkGestureSingle;

/** */
struct GtkGestureSingleClass;

/**
    #GtkGestureStylus is a #GtkGesture implementation specific to stylus
    input. The provided signals just provide the basic information
*/
struct GtkGestureStylus;

/** */
struct GtkGestureStylusClass;

/**
    #GtkGestureSwipe is a #GtkGesture implementation able to recognize
    swipes, after a press/move/.../move/release sequence happens, the
    #GtkGestureSwipe::swipe signal will be emitted, providing the velocity
    and directionality of the sequence at the time it was lifted.
    
    If the velocity is desired in intermediate points,
    [gtk.gesture_swipe.GestureSwipe.getVelocity] can be called on eg. a
    #GtkGesture::update handler.
    
    All velocities are reported in pixels/sec units.
*/
struct GtkGestureSwipe;

/** */
struct GtkGestureSwipeClass;

/**
    #GtkGestureZoom is a #GtkGesture implementation able to recognize
    pinch/zoom gestures, whenever the distance between both tracked
    sequences changes, the #GtkGestureZoom::scale-changed signal is
    emitted to report the scale factor.
*/
struct GtkGestureZoom;

/** */
struct GtkGestureZoomClass;

/**
    GtkGradient is a boxed type that represents a gradient.
    It is the result of parsing a
    [gradient expression][gtkcssprovider-gradients].
    To obtain the gradient represented by a GtkGradient, it has to
    be resolved with [gtk.gradient.Gradient.resolve], which replaces all
    symbolic color references by the colors they refer to (in a given
    context) and constructs a #cairo_pattern_t value.
    
    It is not normally necessary to deal directly with #GtkGradients,
    since they are mostly used behind the scenes by #GtkStyleContext and
    #GtkCssProvider.
    
    #GtkGradient is deprecated. It was used internally by GTK’s CSS engine
    to represent gradients. As its handling is not conforming to modern
    web standards, it is not used anymore. If you want to use gradients in
    your own code, please use Cairo directly.
*/
struct GtkGradient;

/**
    GtkGrid is a container which arranges its child widgets in
    rows and columns, with arbitrary positions and horizontal/vertical spans.
    
    Children are added using [gtk.grid.Grid.attach]. They can span multiple
    rows or columns. It is also possible to add a child next to an
    existing child, using [gtk.grid.Grid.attachNextTo]. The behaviour of
    GtkGrid when several children occupy the same grid cell is undefined.
    
    GtkGrid can be used like a #GtkBox by just using [gtk.container.Container.add],
    which will place children next to each other in the direction determined
    by the #GtkOrientable:orientation property. However, if all you want is a
    single row or column, then #GtkBox is the preferred widget.
    
    # CSS nodes
    
    GtkGrid uses a single CSS node with name grid.
*/
struct GtkGrid
{
  /** */
  GtkContainer container;

  /** */
  GtkGridPrivate* priv;
}

/** */
struct GtkGridClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkGridPrivate;

/**
    #GtkHBox is a container that organizes child widgets into a single row.
    
    Use the #GtkBox packing interface to determine the arrangement,
    spacing, width, and alignment of #GtkHBox children.
    
    All children are allocated the same height.
    
    GtkHBox has been deprecated. You can use #GtkBox instead, which is a
    very quick and easy change. If you have derived your own classes from
    GtkHBox, you can simply change the inheritance to derive directly
    from #GtkBox. No further changes are needed, since the default
    value of the #GtkOrientable:orientation property is
    [gtk.types.Orientation.Horizontal].
    
    If you have a grid-like layout composed of nested boxes, and you don’t
    need first-child or last-child styling, the recommendation is to switch
    to #GtkGrid. For more information about migrating to #GtkGrid, see
    [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].
*/
struct GtkHBox
{
  /** */
  GtkBox box;
}

/** */
struct GtkHBoxClass
{
  /** */
  GtkBoxClass parentClass;
}

/** */
struct GtkHButtonBox
{
  /** */
  GtkButtonBox buttonBox;
}

/** */
struct GtkHButtonBoxClass
{
  /** */
  GtkButtonBoxClass parentClass;
}

/**
    The HPaned widget is a container widget with two
    children arranged horizontally. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkHPaned has been deprecated, use #GtkPaned instead.
*/
struct GtkHPaned
{
  /** */
  GtkPaned paned;
}

/** */
struct GtkHPanedClass
{
  /** */
  GtkPanedClass parentClass;
}

/**
    #GtkHSV is the “color wheel” part of a complete color selector widget.
    It allows to select a color by determining its HSV components in an
    intuitive way. Moving the selection around the outer ring changes the hue,
    and moving the selection point inside the inner triangle changes value and
    saturation.
    
    #GtkHSV has been deprecated together with #GtkColorSelection, where
    it was used.
*/
struct GtkHSV
{
  /** */
  GtkWidget parentInstance;

  /** */
  GtkHSVPrivate* priv;
}

/** */
struct GtkHSVClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkHSV* hsv) changed;

  /** */
  extern(C) void function(GtkHSV* hsv, GtkDirectionType type) move;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkHSVPrivate;

/**
    The #GtkHScale widget is used to allow the user to select a value using
    a horizontal slider. To create one, use [gtk.hscale.HScale.newWithRange].
    
    The position to show the current value, and the number of decimal places
    shown can be set using the parent #GtkScale class’s functions.
    
    GtkHScale has been deprecated, use #GtkScale instead.
*/
struct GtkHScale
{
  /** */
  GtkScale scale;
}

/** */
struct GtkHScaleClass
{
  /** */
  GtkScaleClass parentClass;
}

/**
    The #GtkHScrollbar widget is a widget arranged horizontally creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkHScrollbar has been deprecated, use #GtkScrollbar instead.
*/
struct GtkHScrollbar
{
  /** */
  GtkScrollbar scrollbar;
}

/** */
struct GtkHScrollbarClass
{
  /** */
  GtkScrollbarClass parentClass;
}

/**
    The #GtkHSeparator widget is a horizontal separator, used to group the
    widgets within a window. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    > The #GtkHSeparator widget is not used as a separator within menus.
    > To create a separator in a menu create an empty #GtkSeparatorMenuItem
    > widget using [gtk.separator_menu_item.SeparatorMenuItem.new_] and add it to the menu with
    > [gtk.menu_shell.MenuShell.append].
    
    GtkHSeparator has been deprecated, use #GtkSeparator instead.
*/
struct GtkHSeparator
{
  /** */
  GtkSeparator separator;
}

/** */
struct GtkHSeparatorClass
{
  /** */
  GtkSeparatorClass parentClass;
}

/**
    The #GtkHandleBox widget allows a portion of a window to be "torn
    off". It is a bin widget which displays its child and a handle that
    the user can drag to tear off a separate window (the “float
    window”) containing the child widget. A thin
    “ghost” is drawn in the original location of the
    handlebox. By dragging the separate window back to its original
    location, it can be reattached.
    
    When reattaching, the ghost and float window, must be aligned
    along one of the edges, the “snap edge”.
    This either can be specified by the application programmer
    explicitly, or GTK+ will pick a reasonable default based
    on the handle position.
    
    To make detaching and reattaching the handlebox as minimally confusing
    as possible to the user, it is important to set the snap edge so that
    the snap edge does not move when the handlebox is deattached. For
    instance, if the handlebox is packed at the bottom of a VBox, then
    when the handlebox is detached, the bottom edge of the handlebox's
    allocation will remain fixed as the height of the handlebox shrinks,
    so the snap edge should be set to [gtk.types.PositionType.Bottom].
    
    > #GtkHandleBox has been deprecated. It is very specialized, lacks features
    > to make it useful and most importantly does not fit well into modern
    > application design. Do not use it. There is no replacement.
*/
struct GtkHandleBox
{
  /** */
  GtkBin bin;

  /** */
  GtkHandleBoxPrivate* priv;
}

/** */
struct GtkHandleBoxClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Signal emitted when the contents of the handlebox
         are reattached to the main window. Deprecated: 3.4.
  */
  extern(C) void function(GtkHandleBox* handleBox, GtkWidget* child) childAttached;

  /**
      Signal emitted when the contents of the handlebox
         are detached from the main window. Deprecated: 3.4.
  */
  extern(C) void function(GtkHandleBox* handleBox, GtkWidget* child) childDetached;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkHandleBoxPrivate;

/**
    GtkHeaderBar is similar to a horizontal #GtkBox. It allows children to
    be placed at the start or the end. In addition, it allows a title and
    subtitle to be displayed. The title will be centered with respect to
    the width of the box, even if the children at either side take up
    different amounts of space. The height of the titlebar will be
    set to provide sufficient space for the subtitle, even if none is
    currently set. If a subtitle is not needed, the space reservation
    can be turned off with [gtk.header_bar.HeaderBar.setHasSubtitle].
    
    GtkHeaderBar can add typical window frame controls, such as minimize,
    maximize and close buttons, or the window icon.
    
    For these reasons, GtkHeaderBar is the natural choice for use as the custom
    titlebar widget of a #GtkWindow (see [gtk.window.Window.setTitlebar]), as it gives
    features typical of titlebars while allowing the addition of child widgets.
*/
struct GtkHeaderBar
{
  /** */
  GtkContainer container;
}

/** */
struct GtkHeaderBarAccessible
{
  /** */
  GtkContainerAccessible parent;
}

/** */
struct GtkHeaderBarAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkHeaderBarAccessiblePrivate;

/** */
struct GtkHeaderBarClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkHeaderBarPrivate;

/**
    #GtkIMContext defines the interface for GTK+ input methods. An input method
    is used by GTK+ text input widgets like #GtkEntry to map from key events to
    Unicode character strings.
    
    The default input method can be set programmatically via the
    #GtkSettings:gtk-im-module GtkSettings property. Alternatively, you may set
    the GTK_IM_MODULE environment variable as documented in
    [Running GTK+ Applications][gtk-running].
    
    The #GtkEntry #GtkEntry:im-module and #GtkTextView #GtkTextView:im-module
    properties may also be used to set input methods for specific widget
    instances. For instance, a certain entry widget might be expected to contain
    certain characters which would be easier to input with a certain input
    method.
    
    An input method may consume multiple key events in sequence and finally
    output the composed result. This is called preediting, and an input method
    may provide feedback about this process by displaying the intermediate
    composition states as preedit text. For instance, the default GTK+ input
    method implements the input of arbitrary Unicode code points by holding down
    the Control and Shift keys and then typing “U” followed by the hexadecimal
    digits of the code point.  When releasing the Control and Shift keys,
    preediting ends and the character is inserted as text. Ctrl+Shift+u20AC for
    example results in the € sign.
    
    Additional input methods can be made available for use by GTK+ widgets as
    loadable modules. An input method module is a small shared library which
    implements a subclass of #GtkIMContext or #GtkIMContextSimple and exports
    these four functions:
    
    ```c
    void im_module_init(GTypeModule *module);
    ```
    This function should register the #GType of the #GtkIMContext subclass which
    implements the input method by means of [gobject.type_module.TypeModule.registerType]. Note
    that [gobject.global.typeRegisterStatic] cannot be used as the type needs to be
    registered dynamically.
    
    ```c
    void im_module_exit(void);
    ```
    Here goes any cleanup code your input method might require on module unload.
    
    ```c
    void im_module_list(const GtkIMContextInfo ***contexts, int *n_contexts)
    {
      *contexts = info_list;
      *n_contexts = G_N_ELEMENTS (info_list);
    }
    ```
    This function returns the list of input methods provided by the module. The
    example implementation above shows a common solution and simply returns a
    pointer to statically defined array of #GtkIMContextInfo items for each
    provided input method.
    
    ```c
    GtkIMContext * im_module_create(const gchar *context_id);
    ```
    This function should return a pointer to a newly created instance of the
    #GtkIMContext subclass identified by @context_id. The context ID is the same
    as specified in the #GtkIMContextInfo array returned by im_module_list().
    
    After a new loadable input method module has been installed on the system,
    the configuration file `gtk.immodules` needs to be
    regenerated by [gtk-query-immodules-3.0][gtk-query-immodules-3.0],
    in order for the new input method to become available to GTK+ applications.
*/
struct GtkIMContext
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkIMContextClass
{
  /** */
  GObjectClass parentClass;

  /**
      Default handler of the #GtkIMContext::preedit-start signal.
  */
  extern(C) void function(GtkIMContext* context) preeditStart;

  /**
      Default handler of the #GtkIMContext::preedit-end signal.
  */
  extern(C) void function(GtkIMContext* context) preeditEnd;

  /**
      Default handler of the #GtkIMContext::preedit-changed
        signal.
  */
  extern(C) void function(GtkIMContext* context) preeditChanged;

  /**
      Default handler of the #GtkIMContext::commit signal.
  */
  extern(C) void function(GtkIMContext* context, const(char)* str) commit;

  /**
      Default handler of the
        #GtkIMContext::retrieve-surrounding signal.
  */
  extern(C) gboolean function(GtkIMContext* context) retrieveSurrounding;

  /**
      Default handler of the
        #GtkIMContext::delete-surrounding signal.
  */
  extern(C) gboolean function(GtkIMContext* context, int offset, int nChars) deleteSurrounding;

  /**
      Called via [gtk.imcontext.IMContext.setClientWindow] when the
        input window where the entered text will appear changes. Override this to
        keep track of the current input window, for instance for the purpose of
        positioning a status display of your input method.
  */
  extern(C) void function(GtkIMContext* context, GdkWindow* window) setClientWindow;

  /**
      Called via [gtk.imcontext.IMContext.getPreeditString] to
        retrieve the text currently being preedited for display at the cursor
        position. Any input method which composes complex characters or any
        other compositions from multiple sequential key presses should override
        this method to provide feedback.
  */
  extern(C) void function(GtkIMContext* context, char** str, PangoAttrList** attrs, int* cursorPos) getPreeditString;

  /**
      Called via [gtk.imcontext.IMContext.filterKeypress] on every
        key press or release event. Every non-trivial input method needs to
        override this in order to implement the mapping from key events to text.
        A return value of true indicates to the caller that the event was
        consumed by the input method. In that case, the #GtkIMContext::commit
        signal should be emitted upon completion of a key sequence to pass the
        resulting text back to the input widget. Alternatively, false may be
        returned to indicate that the event wasn’t handled by the input method.
        If a builtin mapping exists for the key, it is used to produce a
        character.
  */
  extern(C) gboolean function(GtkIMContext* context, GdkEventKey* event) filterKeypress;

  /**
      Called via [gtk.imcontext.IMContext.focusIn] when the input widget
        has gained focus. May be overridden to keep track of the current focus.
  */
  extern(C) void function(GtkIMContext* context) focusIn;

  /**
      Called via [gtk.imcontext.IMContext.focusOut] when the input widget
        has lost focus. May be overridden to keep track of the current focus.
  */
  extern(C) void function(GtkIMContext* context) focusOut;

  /**
      Called via [gtk.imcontext.IMContext.reset] to signal a change such as a
        change in cursor position. An input method that implements preediting
        should override this method to clear the preedit state on reset.
  */
  extern(C) void function(GtkIMContext* context) reset;

  /**
      Called via [gtk.imcontext.IMContext.setCursorLocation]
        to inform the input method of the current cursor location relative to
        the client window. May be overridden to implement the display of popup
        windows at the cursor position.
  */
  extern(C) void function(GtkIMContext* context, GdkRectangle* area) setCursorLocation;

  /**
      Called via [gtk.imcontext.IMContext.setUsePreedit] to control
        the use of the preedit string. Override this to display feedback by some
        other means if turned off.
  */
  extern(C) void function(GtkIMContext* context, gboolean usePreedit) setUsePreedit;

  /**
      Called via [gtk.imcontext.IMContext.setSurrounding] in response
        to signal #GtkIMContext::retrieve-surrounding to update the input
        method’s idea of the context around the cursor. It is not necessary to
        override this method even with input methods which implement
        context-dependent behavior. The base implementation is sufficient for
        [gtk.imcontext.IMContext.getSurrounding] to work.
  */
  extern(C) void function(GtkIMContext* context, const(char)* text, int len, int cursorIndex) setSurrounding;

  /**
      Called via [gtk.imcontext.IMContext.getSurrounding] to update
        the context around the cursor location. It is not necessary to override
        this method even with input methods which implement context-dependent
        behavior. The base implementation emits
        #GtkIMContext::retrieve-surrounding and records the context received
        by the subsequent invocation of @get_surrounding.
  */
  extern(C) gboolean function(GtkIMContext* context, char** text, int* cursorIndex) getSurrounding;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;
}

/**
    Bookkeeping information about a loadable input method.
*/
struct GtkIMContextInfo
{
  /**
      The unique identification string of the input method.
  */
  const(char)* contextId;

  /**
      The human-readable name of the input method.
  */
  const(char)* contextName;

  /**
      Translation domain to be used with dgettext()
  */
  const(char)* domain;

  /**
      Name of locale directory for use with bindtextdomain()
  */
  const(char)* domainDirname;

  /**
      A colon-separated list of locales where this input method
        should be the default. The asterisk “*” sets the default for all locales.
  */
  const(char)* defaultLocales;
}

/**
    GtkIMContextSimple is a simple input method context supporting table-based
    input methods. It has a built-in table of compose sequences that is derived
    from the X11 Compose files.
    
    GtkIMContextSimple reads additional compose sequences from the first of the
    following files that is found: ~/.config/gtk-3.0/Compose, ~/.XCompose,
    /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
    Compose file). The syntax of these files is described in the Compose(5)
    manual page.
    
    ## Unicode characters
    
    GtkIMContextSimple also supports numeric entry of Unicode characters
    by typing Ctrl-Shift-u, followed by a hexadecimal Unicode codepoint.
    For example, Ctrl-Shift-u 1 2 3 Enter yields U+0123 LATIN SMALL LETTER
    G WITH CEDILLA, i.e. ģ.
*/
struct GtkIMContextSimple
{
  /** */
  GtkIMContext object;

  /** */
  GtkIMContextSimplePrivate* priv;
}

/** */
struct GtkIMContextSimpleClass
{
  /** */
  GtkIMContextClass parentClass;
}

/** */
struct GtkIMContextSimplePrivate;

/** */
struct GtkIMMulticontext
{
  /** */
  GtkIMContext object;

  /** */
  GtkIMMulticontextPrivate* priv;
}

/** */
struct GtkIMMulticontextClass
{
  /** */
  GtkIMContextClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkIMMulticontextPrivate;

/**
    An icon factory manages a collection of #GtkIconSet; a #GtkIconSet manages a
    set of variants of a particular icon (i.e. a #GtkIconSet contains variants for
    different sizes and widget states). Icons in an icon factory are named by a
    stock ID, which is a simple string identifying the icon. Each #GtkStyle has a
    list of #GtkIconFactory derived from the current theme; those icon factories
    are consulted first when searching for an icon. If the theme doesn’t set a
    particular icon, GTK+ looks for the icon in a list of default icon factories,
    maintained by [gtk.icon_factory.IconFactory.addDefault] and
    [gtk.icon_factory.IconFactory.removeDefault]. Applications with icons should add a default
    icon factory with their icons, which will allow themes to override the icons
    for the application.
    
    To display an icon, always use [gtk.style.Style.lookupIconSet] on the widget that
    will display the icon, or the convenience function
    [gtk.widget.Widget.renderIcon]. These functions take the theme into account when
    looking up the icon to use for a given stock ID.
    
    # GtkIconFactory as GtkBuildable # {#GtkIconFactory-BUILDER-UI}
    
    GtkIconFactory supports a custom `<sources>` element, which can contain
    multiple `<source>` elements. The following attributes are allowed:
    
    $(LIST
      * stock-id
      
          The stock id of the source, a string. This attribute is
          mandatory
      
      * filename
      
          The filename of the source, a string.  This attribute is
          optional
      
      * icon-name
      
          The icon name for the source, a string.  This attribute is
          optional.
      
      * size
      
          Size of the icon, a #GtkIconSize enum value.  This attribute is
          optional.
      
      * direction
      
          Direction of the source, a #GtkTextDirection enum value.  This
          attribute is optional.
      
      * state
      
          State of the source, a #GtkStateType enum value.  This
          attribute is optional.
    )
      
      
    ## A #GtkIconFactory UI definition fragment. ##
    
    ```
    <object class="GtkIconFactory" id="iconfactory1">
      <sources>
        <source stock-id="apple-red" filename="apple-red.png"/>
      </sources>
    </object>
    <object class="GtkWindow" id="window1">
      <child>
        <object class="GtkButton" id="apple_button">
          <property name="label">apple-red</property>
          <property name="use-stock">True</property>
        </object>
      </child>
    </object>
    ```
*/
struct GtkIconFactory
{
  /** */
  GObject parentInstance;

  /** */
  GtkIconFactoryPrivate* priv;
}

/** */
struct GtkIconFactoryClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkIconFactoryPrivate;

/**
    Contains information found when looking up an icon in
    an icon theme.
*/
struct GtkIconInfo;

/** */
struct GtkIconInfoClass;

/** */
struct GtkIconSet;

/** */
struct GtkIconSource;

/**
    #GtkIconTheme provides a facility for looking up icons by name
    and size. The main reason for using a name rather than simply
    providing a filename is to allow different icons to be used
    depending on what “icon theme” is selected
    by the user. The operation of icon themes on Linux and Unix
    follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
    There is a fallback icon theme, named `hicolor`, where applications
    should install their icons, but additional icon themes can be installed
    as operating system vendors and users choose.
    
    Named icons are similar to the deprecated [Stock Items][gtkstock],
    and the distinction between the two may be a bit confusing.
    A few things to keep in mind:
    
    $(LIST
      * Stock images usually are used in conjunction with
        [Stock Items][gtkstock], such as `GTK_STOCK_OK` or
        `GTK_STOCK_OPEN`. Named icons are easier to set up and therefore
        are more useful for new icons that an application wants to
        add, such as application icons or window icons.
      
      * Stock images can only be loaded at the symbolic sizes defined
        by the #GtkIconSize enumeration, or by custom sizes defined
        by [gtk.global.iconSizeRegister], while named icons are more flexible
        and any pixel size can be specified.
      
      * Because stock images are closely tied to stock items, and thus
        to actions in the user interface, stock images may come in
        multiple variants for different widget states or writing
        directions.
    )
      
    A good rule of thumb is that if there is a stock image for what
    you want to use, use it, otherwise use a named icon. It turns
    out that internally stock images are generally defined in
    terms of one or more named icons. (An example of the
    more than one case is icons that depend on writing direction;
    `GTK_STOCK_GO_FORWARD` uses the two themed icons
    “gtk-stock-go-forward-ltr” and “gtk-stock-go-forward-rtl”.)
    
    In many cases, named themes are used indirectly, via #GtkImage
    or stock items, rather than directly, but looking up icons
    directly is also simple. The #GtkIconTheme object acts
    as a database of all the icons in the current theme. You
    can create new #GtkIconTheme objects, but it’s much more
    efficient to use the standard icon theme for the #GdkScreen
    so that the icon information is shared with other people
    looking up icons.
    ```c
    GError *error = NULL;
    GtkIconTheme *icon_theme;
    GdkPixbuf *pixbuf;
    
    icon_theme = gtk_icon_theme_get_default ();
    pixbuf = gtk_icon_theme_load_icon (icon_theme,
                                       "my-icon-name", // icon name
                                       48, // icon size
                                       0,  // flags
                                       &error);
    if (!pixbuf)
      {
        g_warning ("Couldn’t load icon: %s", error->message);
        g_error_free (error);
      }
    else
      {
        // Use the pixbuf
        g_object_unref (pixbuf);
      }
    ```
*/
struct GtkIconTheme
{
  /** */
  GObject parentInstance;

  /** */
  GtkIconThemePrivate* priv;
}

/** */
struct GtkIconThemeClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal emitted when the current icon theme is switched or
         GTK+ detects that a change has occurred in the contents of the
         current icon theme.
  */
  extern(C) void function(GtkIconTheme* iconTheme) changed;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkIconThemePrivate;

/**
    #GtkIconView provides an alternative view on a #GtkTreeModel.
    It displays the model as a grid of icons with labels. Like
    #GtkTreeView, it allows to select one or multiple items
    (depending on the selection mode, see [gtk.icon_view.IconView.setSelectionMode]).
    In addition to selection with the arrow keys, #GtkIconView supports
    rubberband selection, which is controlled by dragging the pointer.
    
    Note that if the tree model is backed by an actual tree store (as
    opposed to a flat list where the mapping to icons is obvious),
    #GtkIconView will only display the first level of the tree and
    ignore the tree’s branches.
    
    # CSS nodes
    
    ```plain
    iconview.view
    ╰── [rubberband]
    ```
    
    GtkIconView has a single CSS node with name iconview and style class .view.
    For rubberband selection, a subnode with name rubberband is used.
*/
struct GtkIconView
{
  /** */
  GtkContainer parent;

  /** */
  GtkIconViewPrivate* priv;
}

/** */
struct GtkIconViewAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkIconViewAccessiblePrivate* priv;
}

/** */
struct GtkIconViewAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkIconViewAccessiblePrivate;

/** */
struct GtkIconViewClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkIconView* iconView, GtkTreePath* path) itemActivated;

  /** */
  extern(C) void function(GtkIconView* iconView) selectionChanged;

  /** */
  extern(C) void function(GtkIconView* iconView) selectAll;

  /** */
  extern(C) void function(GtkIconView* iconView) unselectAll;

  /** */
  extern(C) void function(GtkIconView* iconView) selectCursorItem;

  /** */
  extern(C) void function(GtkIconView* iconView) toggleCursorItem;

  /** */
  extern(C) gboolean function(GtkIconView* iconView, GtkMovementStep step, int count) moveCursor;

  /** */
  extern(C) gboolean function(GtkIconView* iconView) activateCursorItem;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkIconViewPrivate;

/**
    The #GtkImage widget displays an image. Various kinds of object
    can be displayed as an image; most typically, you would load a
    #GdkPixbuf ("pixel buffer") from a file, and then display that.
    There’s a convenience function to do this, [gtk.image.Image.newFromFile],
    used as follows:
    ```c
      GtkWidget *image;
      image = gtk_image_new_from_file ("myfile.png");
    ```
    If the file isn’t loaded successfully, the image will contain a
    “broken image” icon similar to that used in many web browsers.
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gdkpixbuf.pixbuf.Pixbuf.newFromFile], then create the #GtkImage with
    [gtk.image.Image.newFromPixbuf].
    
    The image file may contain an animation, if so the #GtkImage will
    display an animation (#GdkPixbufAnimation) instead of a static image.
    
    #GtkImage is a subclass of #GtkMisc, which implies that you can
    align it (center, left, right) and add padding to it, using
    #GtkMisc methods.
    
    #GtkImage is a “no window” widget (has no #GdkWindow of its own),
    so by default does not receive events. If you want to receive events
    on the image, such as button clicks, place the image inside a
    #GtkEventBox, then connect to the event signals on the event box.
    
    ## Handling button press events on a #GtkImage.
    
    ```c
      static gboolean
      button_press_callback (GtkWidget      *event_box,
                             GdkEventButton *event,
                             gpointer        data)
      {
        g_print ("Event box clicked at coordinates %f,%f\n",
                 event->x, event->y);
    
        // Returning TRUE means we handled the event, so the signal
        // emission should be stopped (don’t call any further callbacks
        // that may be connected). Return FALSE to continue invoking callbacks.
        return TRUE;
      }
    
      static GtkWidget*
      create_image (void)
      {
        GtkWidget *image;
        GtkWidget *event_box;
    
        image = gtk_image_new_from_file ("myfile.png");
    
        event_box = gtk_event_box_new ();
    
        gtk_container_add (GTK_CONTAINER (event_box), image);
    
        g_signal_connect (G_OBJECT (event_box),
                          "button_press_event",
                          G_CALLBACK (button_press_callback),
                          image);
    
        return image;
      }
    ```
    
    When handling events on the event box, keep in mind that coordinates
    in the image may be different from event box coordinates due to
    the alignment and padding settings on the image (see #GtkMisc).
    The simplest way to solve this is to set the alignment to 0.0
    (left/top), and set the padding to zero. Then the origin of
    the image will be the same as the origin of the event box.
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. GTK+ comes with a program to avoid this,
    called “gdk-pixbuf-csource”. This library
    allows you to convert an image into a C variable declaration, which
    can then be loaded into a #GdkPixbuf using
    [gdkpixbuf.pixbuf.Pixbuf.newFromInline].
    
    # CSS nodes
    
    GtkImage has a single CSS node with the name image. The style classes
    may appear on image CSS nodes: .icon-dropshadow, .lowres-icon.
*/
struct GtkImage
{
  /** */
  GtkMisc misc;

  /** */
  GtkImagePrivate* priv;
}

/** */
struct GtkImageAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkImageAccessiblePrivate* priv;
}

/** */
struct GtkImageAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkImageAccessiblePrivate;

/** */
struct GtkImageCellAccessible
{
  /** */
  GtkRendererCellAccessible parent;

  /** */
  GtkImageCellAccessiblePrivate* priv;
}

/** */
struct GtkImageCellAccessibleClass
{
  /** */
  GtkRendererCellAccessibleClass parentClass;
}

/** */
struct GtkImageCellAccessiblePrivate;

/** */
struct GtkImageClass
{
  /** */
  GtkMiscClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    A GtkImageMenuItem is a menu item which has an icon next to the text label.
    
    This is functionally equivalent to:
    
    ```c
      GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
      GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
      GtkWidget *label = gtk_label_new ("Music");
      GtkWidget *menu_item = gtk_menu_item_new ();
    
      gtk_container_add (GTK_CONTAINER (box), icon);
      gtk_container_add (GTK_CONTAINER (box), label);
    
      gtk_container_add (GTK_CONTAINER (menu_item), box);
    
      gtk_widget_show_all (menu_item);
    ```
    
    Note that the user may disable display of menu icons using
    the #GtkSettings:gtk-menu-images setting, so make sure to still
    fill in the text label. If you want to ensure that your menu items
    show an icon you are strongly encouraged to use a #GtkMenuItem
    with a #GtkImage instead.
    
    #GtkImageMenuItem has been deprecated since GTK+ 3.10. If you want to
    display an icon in a menu item, you should use #GtkMenuItem and pack a
    #GtkBox with a #GtkImage and a #GtkLabel instead. You should also consider
    using #GtkBuilder and the XML #GMenu description for creating menus, by
    following the [GMenu guide][https://developer.gnome.org/GMenu/]. You should
    consider using icons in menu items only sparingly, and for "objects" (or
    "nouns") elements only, like bookmarks, files, and links; "actions" (or
    "verbs") should not have icons.
    
    Furthermore, if you would like to display keyboard accelerator, you must
    pack the accel label into the box using [gtk.box.Box.packEnd] and align the
    label, otherwise the accelerator will not display correctly. The following
    code snippet adds a keyboard accelerator to the menu item, with a key
    binding of Ctrl+M:
    
    ```c
      GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
      GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
      GtkWidget *label = gtk_accel_label_new ("Music");
      GtkWidget *menu_item = gtk_menu_item_new ();
      GtkAccelGroup *accel_group = gtk_accel_group_new ();
    
      gtk_container_add (GTK_CONTAINER (box), icon);
    
      gtk_label_set_use_underline (GTK_LABEL (label), TRUE);
      gtk_label_set_xalign (GTK_LABEL (label), 0.0);
    
      gtk_widget_add_accelerator (menu_item, "activate", accel_group,
                                  GDK_KEY_m, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
      gtk_accel_label_set_accel_widget (GTK_ACCEL_LABEL (label), menu_item);
    
      gtk_box_pack_end (GTK_BOX (box), label, TRUE, TRUE, 0);
    
      gtk_container_add (GTK_CONTAINER (menu_item), box);
    
      gtk_widget_show_all (menu_item);
    ```
*/
struct GtkImageMenuItem
{
  /** */
  GtkMenuItem menuItem;

  /** */
  GtkImageMenuItemPrivate* priv;
}

/** */
struct GtkImageMenuItemClass
{
  /**
      The parent class.
  */
  GtkMenuItemClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkImageMenuItemPrivate;

/** */
struct GtkImagePrivate;

/**
    #GtkInfoBar is a widget that can be used to show messages to
    the user without showing a dialog. It is often temporarily shown
    at the top or bottom of a document. In contrast to #GtkDialog, which
    has a action area at the bottom, #GtkInfoBar has an action area
    at the side.
    
    The API of #GtkInfoBar is very similar to #GtkDialog, allowing you
    to add buttons to the action area with [gtk.info_bar.InfoBar.addButton] or
    [gtk.info_bar.InfoBar.newWithButtons]. The sensitivity of action widgets
    can be controlled with [gtk.info_bar.InfoBar.setResponseSensitive].
    To add widgets to the main content area of a #GtkInfoBar, use
    [gtk.info_bar.InfoBar.getContentArea] and add your widgets to the container.
    
    Similar to #GtkMessageDialog, the contents of a #GtkInfoBar can by
    classified as error message, warning, informational message, etc,
    by using [gtk.info_bar.InfoBar.setMessageType]. GTK+ may use the message type
    to determine how the message is displayed.
    
    A simple example for using a #GtkInfoBar:
    ```c
    GtkWidget *widget, *message_label, *content_area;
    GtkWidget *grid;
    GtkInfoBar *bar;
    
    // set up info bar
    widget = gtk_info_bar_new ();
    bar = GTK_INFO_BAR (widget);
    grid = gtk_grid_new ();
    
    gtk_widget_set_no_show_all (widget, TRUE);
    message_label = gtk_label_new ("");
    content_area = gtk_info_bar_get_content_area (bar);
    gtk_container_add (GTK_CONTAINER (content_area),
                       message_label);
    gtk_info_bar_add_button (bar,
                             _("_OK"),
                             GTK_RESPONSE_OK);
    g_signal_connect (bar,
                      "response",
                      G_CALLBACK (gtk_widget_hide),
                      NULL);
    gtk_grid_attach (GTK_GRID (grid),
                     widget,
                     0, 2, 1, 1);
    
    // ...
    
    // show an error message
    gtk_label_set_text (GTK_LABEL (message_label), "An error occurred!");
    gtk_info_bar_set_message_type (bar,
                                   GTK_MESSAGE_ERROR);
    gtk_widget_show (bar);
    ```
    
    # GtkInfoBar as GtkBuildable
    
    The GtkInfoBar implementation of the GtkBuildable interface exposes
    the content area and action area as internal children with the names
    “content_area” and “action_area”.
    
    GtkInfoBar supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area).
    
    # CSS nodes
    
    GtkInfoBar has a single CSS node with name infobar. The node may get
    one of the style classes .info, .warning, .error or .question, depending
    on the message type.
*/
struct GtkInfoBar
{
  /** */
  GtkBox parent;

  /** */
  GtkInfoBarPrivate* priv;
}

/** */
struct GtkInfoBarClass
{
  /** */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function(GtkInfoBar* infoBar, int responseId) response;

  /** */
  extern(C) void function(GtkInfoBar* infoBar) close;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkInfoBarPrivate;

/**
    The #GtkInvisible widget is used internally in GTK+, and is probably not
    very useful for application developers.
    
    It is used for reliable pointer grabs and selection handling in the code
    for drag-and-drop.
*/
struct GtkInvisible
{
  /** */
  GtkWidget widget;

  /** */
  GtkInvisiblePrivate* priv;
}

/** */
struct GtkInvisibleClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkInvisiblePrivate;

/**
    The #GtkLabel widget displays a small amount of text. As the name
    implies, most labels are used to label another widget such as a
    #GtkButton, a #GtkMenuItem, or a #GtkComboBox.
    
    # CSS nodes
    
    ```plain
    label
    ├── [selection]
    ├── [link]
    ┊
    ╰── [link]
    ```
    
    GtkLabel has a single CSS node with the name label. A wide variety
    of style classes may be applied to labels, such as .title, .subtitle,
    .dim-label, etc. In the #GtkShortcutsWindow, labels are used wth the
    .keycap style class.
    
    If the label has a selection, it gets a subnode with name selection.
    
    If the label has links, there is one subnode per link. These subnodes
    carry the link or visited state depending on whether they have been
    visited.
    
    # GtkLabel as GtkBuildable
    
    The GtkLabel implementation of the GtkBuildable interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify #PangoAttribute values for
    this label.
    
    An example of a UI definition fragment specifying Pango attributes:
    
    ```xml
    <object class="GtkLabel">
      <attributes>
        <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
        <attribute name="background" value="red" start="5" end="10"/>
      </attributes>
    </object>
    ```
    
    The start and end attributes specify the range of characters to which the
    Pango attribute applies. If start and end are not specified, the attribute is
    applied to the whole text. Note that specifying ranges does not make much
    sense with translatable attributes. Use markup embedded in the translatable
    content instead.
    
    # Mnemonics
    
    Labels may contain “mnemonics”. Mnemonics are
    underlined characters in the label, used for keyboard navigation.
    Mnemonics are created by providing a string with an underscore before
    the mnemonic character, such as `"_File"`, to the
    functions [gtk.label.Label.newWithMnemonic] or
    [gtk.label.Label.setTextWithMnemonic].
    
    Mnemonics automatically activate any activatable widget the label is
    inside, such as a #GtkButton; if the label is not inside the
    mnemonic’s target widget, you have to tell the label about the target
    using [gtk.label.Label.setMnemonicWidget]. Here’s a simple example where
    the label is inside a button:
    
    ```c
      // Pressing Alt+H will activate this button
      GtkWidget *button = gtk_button_new ();
      GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
      gtk_container_add (GTK_CONTAINER (button), label);
    ```
    
    There’s a convenience function to create buttons with a mnemonic label
    already inside:
    
    ```c
      // Pressing Alt+H will activate this button
      GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
    ```
    
    To create a mnemonic for a widget alongside the label, such as a
    #GtkEntry, you have to point the label at the entry with
    [gtk.label.Label.setMnemonicWidget]:
    
    ```c
      // Pressing Alt+H will focus the entry
      GtkWidget *entry = gtk_entry_new ();
      GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
      gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
    ```
    
    # Markup (styled text)
    
    To make it easy to format text in a label (changing colors,
    fonts, etc.), label text can be provided in a simple
    [markup format][PangoMarkupFormat].
    
    Here’s how to create a label with a small font:
    ```c
      GtkWidget *label = gtk_label_new (NULL);
      gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
    ```
    
    (See [complete documentation][PangoMarkupFormat] of available
    tags in the Pango manual.)
    
    The markup passed to [gtk.label.Label.setMarkup] must be valid; for example,
    literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
    If you pass text obtained from the user, file, or a network to
    [gtk.label.Label.setMarkup], you’ll want to escape it with
    [glib.global.markupEscapeText] or [glib.global.markupPrintfEscaped].
    
    Markup strings are just a convenient way to set the #PangoAttrList on
    a label; [gtk.label.Label.setAttributes] may be a simpler way to set
    attributes in some cases. Be careful though; #PangoAttrList tends to
    cause internationalization problems, unless you’re applying attributes
    to the entire string (i.e. unless you set the range of each attribute
    to [0, `G_MAXINT`)). The reason is that specifying the start_index and
    end_index for a #PangoAttribute requires knowledge of the exact string
    being displayed, so translations will cause problems.
    
    # Selectable labels
    
    Labels can be made selectable with [gtk.label.Label.setSelectable].
    Selectable labels allow the user to copy the label contents to
    the clipboard. Only labels that contain useful-to-copy information
    — such as error messages — should be made selectable.
    
    # Text layout # {#label-text-layout}
    
    A label can contain any number of paragraphs, but will have
    performance problems if it contains more than a small number.
    Paragraphs are separated by newlines or other paragraph separators
    understood by Pango.
    
    Labels can automatically wrap text if you call
    [gtk.label.Label.setLineWrap].
    
    [gtk.label.Label.setJustify] sets how the lines in a label align
    with one another. If you want to set how the label as a whole
    aligns in its available space, see the #GtkWidget:halign and
    #GtkWidget:valign properties.
    
    The #GtkLabel:width-chars and #GtkLabel:max-width-chars properties
    can be used to control the size allocation of ellipsized or wrapped
    labels. For ellipsizing labels, if either is specified (and less
    than the actual text size), it is used as the minimum width, and the actual
    text size is used as the natural width of the label. For wrapping labels,
    width-chars is used as the minimum width, if specified, and max-width-chars
    is used as the natural width. Even if max-width-chars specified, wrapping
    labels will be rewrapped to use all of the available width.
    
    Note that the interpretation of #GtkLabel:width-chars and
    #GtkLabel:max-width-chars has changed a bit with the introduction of
    [width-for-height geometry management.][geometry-management]
    
    # Links
    
    Since 2.18, GTK+ supports markup for clickable hyperlinks in addition
    to regular Pango markup. The markup for links is borrowed from HTML,
    using the `<a>` with “href“ and “title“ attributes. GTK+ renders links
    similar to the way they appear in web browsers, with colored, underlined
    text. The “title“ attribute is displayed as a tooltip on the link.
    
    An example looks like this:
    
    ```c
    const gchar *text =
    "Go to the"
    "<a href=\"http://www.gtk.org title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
    "GTK+ website</a> for more...";
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), text);
    ```
    
    It is possible to implement custom handling for links and their tooltips with
    the #GtkLabel::activate-link signal and the [gtk.label.Label.getCurrentUri] function.
*/
struct GtkLabel
{
  /** */
  GtkMisc misc;

  /** */
  GtkLabelPrivate* priv;
}

/** */
struct GtkLabelAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkLabelAccessiblePrivate* priv;
}

/** */
struct GtkLabelAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkLabelAccessiblePrivate;

/** */
struct GtkLabelClass
{
  /** */
  GtkMiscClass parentClass;

  /** */
  extern(C) void function(GtkLabel* label, GtkMovementStep step, int count, gboolean extendSelection) moveCursor;

  /** */
  extern(C) void function(GtkLabel* label) copyClipboard;

  /** */
  extern(C) void function(GtkLabel* label, GtkMenu* menu) populatePopup;

  /** */
  extern(C) gboolean function(GtkLabel* label, const(char)* uri) activateLink;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkLabelPrivate;

/** */
struct GtkLabelSelectionInfo;

/**
    #GtkLayout is similar to #GtkDrawingArea in that it’s a “blank slate” and
    doesn’t do anything except paint a blank background by default. It’s
    different in that it supports scrolling natively due to implementing
    #GtkScrollable, and can contain child widgets since it’s a #GtkContainer.
    
    If you just want to draw, a #GtkDrawingArea is a better choice since it has
    lower overhead. If you just need to position child widgets at specific
    points, then #GtkFixed provides that functionality on its own.
    
    When handling expose events on a #GtkLayout, you must draw to the #GdkWindow
    returned by [gtk.layout.Layout.getBinWindow], rather than to the one returned by
    [gtk.widget.Widget.getWindow] as you would for a #GtkDrawingArea.
*/
struct GtkLayout
{
  /** */
  GtkContainer container;

  /** */
  GtkLayoutPrivate* priv;
}

/** */
struct GtkLayoutClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkLayoutPrivate;

/**
    The #GtkLevelBar is a bar widget that can be used
    as a level indicator. Typical use cases are displaying the strength
    of a password, or showing the charge level of a battery.
    
    Use [gtk.level_bar.LevelBar.setValue] to set the current value, and
    [gtk.level_bar.LevelBar.addOffsetValue] to set the value offsets at which
    the bar will be considered in a different state. GTK will add a few
    offsets by default on the level bar: #GTK_LEVEL_BAR_OFFSET_LOW,
    #GTK_LEVEL_BAR_OFFSET_HIGH and #GTK_LEVEL_BAR_OFFSET_FULL, with
    values 0.25, 0.75 and 1.0 respectively.
    
    Note that it is your responsibility to update preexisting offsets
    when changing the minimum or maximum value. GTK+ will simply clamp
    them to the new range.
    
    ## Adding a custom offset on the bar
    
    ```c
    
    static GtkWidget *
    create_level_bar (void)
    {
      GtkWidget *widget;
      GtkLevelBar *bar;
    
      widget = gtk_level_bar_new ();
      bar = GTK_LEVEL_BAR (widget);
    
      // This changes the value of the default low offset
    
      gtk_level_bar_add_offset_value (bar,
                                      GTK_LEVEL_BAR_OFFSET_LOW,
                                      0.10);
    
      // This adds a new offset to the bar; the application will
      // be able to change its color CSS like this:
      //
      // levelbar block.my-offset {
      //   background-color: magenta;
      //   border-style: solid;
      //   border-color: black;
      //   border-style: 1px;
      // }
    
      gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
    
      return widget;
    }
    ```
    
    The default interval of values is between zero and one, but it’s possible to
    modify the interval using [gtk.level_bar.LevelBar.setMinValue] and
    [gtk.level_bar.LevelBar.setMaxValue]. The value will be always drawn in proportion to
    the admissible interval, i.e. a value of 15 with a specified interval between
    10 and 20 is equivalent to a value of 0.5 with an interval between 0 and 1.
    When #GTK_LEVEL_BAR_MODE_DISCRETE is used, the bar level is rendered
    as a finite number of separated blocks instead of a single one. The number
    of blocks that will be rendered is equal to the number of units specified by
    the admissible interval.
    
    For instance, to build a bar rendered with five blocks, it’s sufficient to
    set the minimum value to 0 and the maximum value to 5 after changing the indicator
    mode to discrete.
    
    GtkLevelBar was introduced in GTK+ 3.6.
    
    # GtkLevelBar as GtkBuildable
    
    The GtkLevelBar implementation of the GtkBuildable interface supports a
    custom `<offsets>` element, which can contain any number of `<offset>` elements,
    each of which must have "name" and "value" attributes.
    
    # CSS nodes
    
    ```plain
    levelbar[.discrete]
    ╰── trough
        ├── block.filled.level-name
        ┊
        ├── block.empty
        ┊
    ```
    
    GtkLevelBar has a main CSS node with name levelbar and one of the style
    classes .discrete or .continuous and a subnode with name trough. Below the
    trough node are a number of nodes with name block and style class .filled
    or .empty. In continuous mode, there is exactly one node of each, in discrete
    mode, the number of filled and unfilled nodes corresponds to blocks that are
    drawn. The block.filled nodes also get a style class .level-name corresponding
    to the level for the current value.
    
    In horizontal orientation, the nodes are always arranged from left to right,
    regardless of text direction.
*/
struct GtkLevelBar
{
  /** */
  GtkWidget parent;

  /** */
  GtkLevelBarPrivate* priv;
}

/** */
struct GtkLevelBarAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkLevelBarAccessiblePrivate* priv;
}

/** */
struct GtkLevelBarAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkLevelBarAccessiblePrivate;

/** */
struct GtkLevelBarClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkLevelBar* self, const(char)* name) offsetChanged;

  /** */
  void*[16] padding;
}

/** */
struct GtkLevelBarPrivate;

/**
    A GtkLinkButton is a #GtkButton with a hyperlink, similar to the one
    used by web browsers, which triggers an action when clicked. It is useful
    to show quick links to resources.
    
    A link button is created by calling either [gtk.link_button.LinkButton.new_] or
    [gtk.link_button.LinkButton.newWithLabel]. If using the former, the URI you pass
    to the constructor is used as a label for the widget.
    
    The URI bound to a GtkLinkButton can be set specifically using
    [gtk.link_button.LinkButton.setUri], and retrieved using [gtk.link_button.LinkButton.getUri].
    
    By default, GtkLinkButton calls [gtk.global.showUriOnWindow] when the button is
    clicked. This behaviour can be overridden by connecting to the
    #GtkLinkButton::activate-link signal and returning true from the
    signal handler.
    
    # CSS nodes
    
    GtkLinkButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .link style class.
*/
struct GtkLinkButton
{
  /** */
  GtkButton parentInstance;

  /** */
  GtkLinkButtonPrivate* priv;
}

/** */
struct GtkLinkButtonAccessible
{
  /** */
  GtkButtonAccessible parent;

  /** */
  GtkLinkButtonAccessiblePrivate* priv;
}

/** */
struct GtkLinkButtonAccessibleClass
{
  /** */
  GtkButtonAccessibleClass parentClass;
}

/** */
struct GtkLinkButtonAccessiblePrivate;

/**
    The #GtkLinkButtonClass contains only
    private data.
*/
struct GtkLinkButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /**
      class handler for the #GtkLinkButton::activate-link signal
  */
  extern(C) gboolean function(GtkLinkButton* button) activateLink;

  /** */
  extern(C) void function() GtkPadding1;

  /** */
  extern(C) void function() GtkPadding2;

  /** */
  extern(C) void function() GtkPadding3;

  /** */
  extern(C) void function() GtkPadding4;
}

/** */
struct GtkLinkButtonPrivate;

/**
    A GtkListBox is a vertical container that contains GtkListBoxRow
    children. These rows can be dynamically sorted and filtered, and
    headers can be added dynamically depending on the row content.
    It also allows keyboard and mouse navigation and selection like
    a typical list.
    
    Using GtkListBox is often an alternative to #GtkTreeView, especially
    when the list contents has a more complicated layout than what is allowed
    by a #GtkCellRenderer, or when the contents is interactive (i.e. has a
    button in it).
    
    Although a #GtkListBox must have only #GtkListBoxRow children you can
    add any kind of widget to it via [gtk.container.Container.add], and a #GtkListBoxRow
    widget will automatically be inserted between the list and the widget.
    
    #GtkListBoxRows can be marked as activatable or selectable. If a row
    is activatable, #GtkListBox::row-activated will be emitted for it when
    the user tries to activate it. If it is selectable, the row will be marked
    as selected when the user tries to select it.
    
    The GtkListBox widget was added in GTK+ 3.10.
    
    # GtkListBox as GtkBuildable
    
    The GtkListBox implementation of the #GtkBuildable interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a `<child>` element. See [gtk.list_box.ListBox.setPlaceholder] for info.
    
    # CSS nodes
    
    ```plain
    list
    ╰── row[.activatable]
    ```
    
    GtkListBox uses a single CSS node named list. Each GtkListBoxRow uses
    a single CSS node named row. The row nodes get the .activatable
    style class added when appropriate.
*/
struct GtkListBox
{
  /** */
  GtkContainer parentInstance;
}

/** */
struct GtkListBoxAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkListBoxAccessiblePrivate* priv;
}

/** */
struct GtkListBoxAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkListBoxAccessiblePrivate;

/** */
struct GtkListBoxClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /**
      Class handler for the #GtkListBox::row-selected signal
  */
  extern(C) void function(GtkListBox* box, GtkListBoxRow* row) rowSelected;

  /**
      Class handler for the #GtkListBox::row-activated signal
  */
  extern(C) void function(GtkListBox* box, GtkListBoxRow* row) rowActivated;

  /**
      Class handler for the #GtkListBox::activate-cursor-row signal
  */
  extern(C) void function(GtkListBox* box) activateCursorRow;

  /**
      Class handler for the #GtkListBox::toggle-cursor-row signal
  */
  extern(C) void function(GtkListBox* box) toggleCursorRow;

  /**
      Class handler for the #GtkListBox::move-cursor signal
  */
  extern(C) void function(GtkListBox* box, GtkMovementStep step, int count) moveCursor;

  /**
      Class handler for the #GtkListBox::selected-rows-changed signal
  */
  extern(C) void function(GtkListBox* box) selectedRowsChanged;

  /**
      Class handler for the #GtkListBox::select-all signal
  */
  extern(C) void function(GtkListBox* box) selectAll;

  /**
      Class handler for the #GtkListBox::unselect-all signal
  */
  extern(C) void function(GtkListBox* box) unselectAll;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;
}

/** */
struct GtkListBoxRow
{
  /** */
  GtkBin parentInstance;
}

/** */
struct GtkListBoxRowAccessible
{
  /** */
  GtkContainerAccessible parent;
}

/** */
struct GtkListBoxRowAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkListBoxRowClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function(GtkListBoxRow* row) activate;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;
}

/**
    The #GtkListStore object is a list model for use with a #GtkTreeView
    widget.  It implements the #GtkTreeModel interface, and consequentialy,
    can use all of the methods available there.  It also implements the
    #GtkTreeSortable interface so it can be sorted by the view.
    Finally, it also implements the tree
    [drag and drop][gtk3-GtkTreeView-drag-and-drop]
    interfaces.
    
    The #GtkListStore can accept most GObject types as a column type, though
    it can’t accept all custom types.  Internally, it will keep a copy of
    data passed in (such as a string or a boxed pointer).  Columns that
    accept #GObjects are handled a little differently.  The
    #GtkListStore will keep a reference to the object instead of copying the
    value.  As a result, if the object is modified, it is up to the
    application writer to call [gtk.tree_model.TreeModel.rowChanged] to emit the
    #GtkTreeModel::row_changed signal.  This most commonly affects lists with
    #GdkPixbufs stored.
    
    An example for creating a simple list store:
    
    ```c
    enum {
      COLUMN_STRING,
      COLUMN_INT,
      COLUMN_BOOLEAN,
      N_COLUMNS
    };
    
    {
      GtkListStore *list_store;
      GtkTreePath *path;
      GtkTreeIter iter;
      gint i;
    
      list_store = gtk_list_store_new (N_COLUMNS,
                                       G_TYPE_STRING,
                                       G_TYPE_INT,
                                       G_TYPE_BOOLEAN);
    
      for (i = 0; i < 10; i++)
        {
          gchar *some_data;
    
          some_data = get_some_data (i);
    
          // Add a new row to the model
          gtk_list_store_append (list_store, &iter);
          gtk_list_store_set (list_store, &iter,
                              COLUMN_STRING, some_data,
                              COLUMN_INT, i,
                              COLUMN_BOOLEAN,  FALSE,
                              -1);
    
          // As the store will keep a copy of the string internally,
          // we free some_data.
          g_free (some_data);
        }
    
      // Modify a particular row
      path = gtk_tree_path_new_from_string ("4");
      gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),
                               &iter,
                               path);
      gtk_tree_path_free (path);
      gtk_list_store_set (list_store, &iter,
                          COLUMN_BOOLEAN, TRUE,
                          -1);
    }
    ```
    
    # Performance Considerations
    
    Internally, the #GtkListStore was implemented with a linked list with
    a tail pointer prior to GTK+ 2.6.  As a result, it was fast at data
    insertion and deletion, and not fast at random data access.  The
    #GtkListStore sets the #GTK_TREE_MODEL_ITERS_PERSIST flag, which means
    that #GtkTreeIters can be cached while the row exists.  Thus, if
    access to a particular row is needed often and your code is expected to
    run on older versions of GTK+, it is worth keeping the iter around.
    
    # Atomic Operations
    
    It is important to note that only the methods
    [gtk.list_store.ListStore.insertWithValues] and [gtk.list_store.ListStore.insertWithValuesv]
    are atomic, in the sense that the row is being appended to the store and the
    values filled in in a single operation with regard to #GtkTreeModel signaling.
    In contrast, using e.g. [gtk.list_store.ListStore.append] and then [gtk.list_store.ListStore.set]
    will first create a row, which triggers the #GtkTreeModel::row-inserted signal
    on #GtkListStore. The row, however, is still empty, and any signal handler
    connecting to #GtkTreeModel::row-inserted on this particular store should be prepared
    for the situation that the row might be empty. This is especially important
    if you are wrapping the #GtkListStore inside a #GtkTreeModelFilter and are
    using a #GtkTreeModelFilterVisibleFunc. Using any of the non-atomic operations
    to append rows to the #GtkListStore will cause the
    #GtkTreeModelFilterVisibleFunc to be visited with an empty row first; the
    function must be prepared for that.
    
    # GtkListStore as GtkBuildable
    
    The GtkListStore implementation of the GtkBuildable interface allows
    to specify the model columns with a `<columns>` element that may contain
    multiple `<column>` elements, each specifying one model column. The “type”
    attribute specifies the data type for the column.
    
    Additionally, it is possible to specify content for the list store
    in the UI definition, with the `<data>` element. It can contain multiple
    `<row>` elements, each specifying to content for one row of the list model.
    Inside a `<row>`, the `<col>` elements specify the content for individual cells.
    
    Note that it is probably more common to define your models in the code,
    and one might consider it a layering violation to specify the content of
    a list store in a UI definition, data, not presentation, and common wisdom
    is to separate the two, as far as possible.
    
    An example of a UI Definition fragment for a list store:
    
    ```xml
    <object class="GtkListStore">
      <columns>
        <column type="gchararray"/>
        <column type="gchararray"/>
        <column type="gint"/>
      </columns>
      <data>
        <row>
          <col id="0">John</col>
          <col id="1">Doe</col>
          <col id="2">25</col>
        </row>
        <row>
          <col id="0">Johan</col>
          <col id="1">Dahlin</col>
          <col id="2">50</col>
        </row>
      </data>
    </object>
    ```
*/
struct GtkListStore
{
  /** */
  GObject parent;

  /** */
  GtkListStorePrivate* priv;
}

/** */
struct GtkListStoreClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkListStorePrivate;

/**
    GtkLockButton is a widget that can be used in control panels or
    preference dialogs to allow users to obtain and revoke authorizations
    needed to operate the controls. The required authorization is represented
    by a #GPermission object. Concrete implementations of #GPermission may use
    PolicyKit or some other authorization framework. To obtain a PolicyKit-based
    #GPermission, use polkit_permission_new().
    
    If the user is not currently allowed to perform the action, but can obtain
    the permission, the widget looks like this:
    
    ![](lockbutton-locked.png)
    
    and the user can click the button to request the permission. Depending
    on the platform, this may pop up an authentication dialog or ask the user
    to authenticate in some other way. Once the user has obtained the permission,
    the widget changes to this:
    
    ![](lockbutton-unlocked.png)
    
    and the permission can be dropped again by clicking the button. If the user
    is not able to obtain the permission at all, the widget looks like this:
    
    ![](lockbutton-sorry.png)
    
    If the user has the permission and cannot drop it, the button is hidden.
    
    The text (and tooltips) that are shown in the various cases can be adjusted
    with the #GtkLockButton:text-lock, #GtkLockButton:text-unlock,
    #GtkLockButton:tooltip-lock, #GtkLockButton:tooltip-unlock and
    #GtkLockButton:tooltip-not-authorized properties.
*/
struct GtkLockButton
{
  /** */
  GtkButton parent;

  /** */
  GtkLockButtonPrivate* priv;
}

/** */
struct GtkLockButtonAccessible
{
  /** */
  GtkButtonAccessible parent;

  /** */
  GtkLockButtonAccessiblePrivate* priv;
}

/** */
struct GtkLockButtonAccessibleClass
{
  /** */
  GtkButtonAccessibleClass parentClass;
}

/** */
struct GtkLockButtonAccessiblePrivate;

/** */
struct GtkLockButtonClass
{
  /**
      The parent class.
  */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function() reserved0;

  /** */
  extern(C) void function() reserved1;

  /** */
  extern(C) void function() reserved2;

  /** */
  extern(C) void function() reserved3;

  /** */
  extern(C) void function() reserved4;

  /** */
  extern(C) void function() reserved5;

  /** */
  extern(C) void function() reserved6;

  /** */
  extern(C) void function() reserved7;
}

/** */
struct GtkLockButtonPrivate;

/**
    A #GtkMenu is a #GtkMenuShell that implements a drop down menu
    consisting of a list of #GtkMenuItem objects which can be navigated
    and activated by the user to perform application functions.
    
    A #GtkMenu is most commonly dropped down by activating a
    #GtkMenuItem in a #GtkMenuBar or popped up by activating a
    #GtkMenuItem in another #GtkMenu.
    
    A #GtkMenu can also be popped up by activating a #GtkComboBox.
    Other composite widgets such as the #GtkNotebook can pop up a
    #GtkMenu as well.
    
    Applications can display a #GtkMenu as a popup menu by calling the
    [gtk.menu.Menu.popup] function.  The example below shows how an application
    can pop up a menu when the 3rd mouse button is pressed.
    
    ## Connecting the popup signal handler.
    
    ```c
      // connect our handler which will popup the menu
      g_signal_connect_swapped (window, "button_press_event",
    G_CALLBACK (my_popup_handler), menu);
    ```
    
    ## Signal handler which displays a popup menu.
    
    ```c
    static gint
    my_popup_handler (GtkWidget *widget, GdkEvent *event)
    {
      GtkMenu *menu;
      GdkEventButton *event_button;
    
      g_return_val_if_fail (widget != NULL, FALSE);
      g_return_val_if_fail (GTK_IS_MENU (widget), FALSE);
      g_return_val_if_fail (event != NULL, FALSE);
    
      // The "widget" is the menu that was supplied when
      // g_signal_connect_swapped() was called.
      menu = GTK_MENU (widget);
    
      if (event->type == GDK_BUTTON_PRESS)
        {
          event_button = (GdkEventButton *) event;
          if (event_button->button == GDK_BUTTON_SECONDARY)
            {
              gtk_menu_popup (menu, NULL, NULL, NULL, NULL,
                              event_button->button, event_button->time);
              return TRUE;
            }
        }
    
      return FALSE;
    }
    ```
    
    # CSS nodes
    
    ```plain
    menu
    ├── arrow.top
    ├── <child>
    ┊
    ├── <child>
    ╰── arrow.bottom
    ```
    
    The main CSS node of GtkMenu has name menu, and there are two subnodes
    with name arrow, for scrolling menu arrows. These subnodes get the
    .top and .bottom style classes.
*/
struct GtkMenu
{
  /** */
  GtkMenuShell menuShell;

  /** */
  GtkMenuPrivate* priv;
}

/** */
struct GtkMenuAccessible
{
  /** */
  GtkMenuShellAccessible parent;

  /** */
  GtkMenuAccessiblePrivate* priv;
}

/** */
struct GtkMenuAccessibleClass
{
  /** */
  GtkMenuShellAccessibleClass parentClass;
}

/** */
struct GtkMenuAccessiblePrivate;

/**
    The #GtkMenuBar is a subclass of #GtkMenuShell which contains one or
    more #GtkMenuItems. The result is a standard menu bar which can hold
    many menu items.
    
    # CSS nodes
    
    GtkMenuBar has a single CSS node with name menubar.
*/
struct GtkMenuBar
{
  /** */
  GtkMenuShell menuShell;

  /** */
  GtkMenuBarPrivate* priv;
}

/** */
struct GtkMenuBarClass
{
  /** */
  GtkMenuShellClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMenuBarPrivate;

/**
    The #GtkMenuButton widget is used to display a popup when clicked on.
    This popup can be provided either as a #GtkMenu, a #GtkPopover or an
    abstract #GMenuModel.
    
    The #GtkMenuButton widget can hold any valid child widget. That is, it
    can hold almost any other standard #GtkWidget. The most commonly used
    child is #GtkImage. If no widget is explicitely added to the #GtkMenuButton,
    a #GtkImage is automatically created, using an arrow image oriented
    according to #GtkMenuButton:direction or the generic “open-menu-symbolic”
    icon if the direction is not set.
    
    The positioning of the popup is determined by the #GtkMenuButton:direction
    property of the menu button.
    
    For menus, the #GtkWidget:halign and #GtkWidget:valign properties of the
    menu are also taken into account. For example, when the direction is
    [gtk.types.ArrowType.Down] and the horizontal alignment is [gtk.types.Align.Start], the
    menu will be positioned below the button, with the starting edge
    (depending on the text direction) of the menu aligned with the starting
    edge of the button. If there is not enough space below the button, the
    menu is popped up above the button instead. If the alignment would move
    part of the menu offscreen, it is “pushed in”.
    
    ## Direction = Down
    
    $(LIST
      * halign = start
      
          ![](down-start.png)
      
      * halign = center
      
          ![](down-center.png)
      
      * halign = end
      
          ![](down-end.png)
    )
      
    ## Direction = Up
    
    $(LIST
      * halign = start
      
          ![](up-start.png)
      
      * halign = center
      
          ![](up-center.png)
      
      * halign = end
      
          ![](up-end.png)
    )
      
    ## Direction = Left
    
    $(LIST
      * valign = start
      
          ![](left-start.png)
      
      * valign = center
      
          ![](left-center.png)
      
      * valign = end
      
          ![](left-end.png)
    )
      
    ## Direction = Right
    
    $(LIST
      * valign = start
      
          ![](right-start.png)
      
      * valign = center
      
          ![](right-center.png)
      
      * valign = end
      
          ![](right-end.png)
    )
      
    # CSS nodes
    
    GtkMenuButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .popup style class.
*/
struct GtkMenuButton
{
  /** */
  GtkToggleButton parent;

  /** */
  GtkMenuButtonPrivate* priv;
}

/** */
struct GtkMenuButtonAccessible
{
  /** */
  GtkToggleButtonAccessible parent;

  /** */
  GtkMenuButtonAccessiblePrivate* priv;
}

/** */
struct GtkMenuButtonAccessibleClass
{
  /** */
  GtkToggleButtonAccessibleClass parentClass;
}

/** */
struct GtkMenuButtonAccessiblePrivate;

/** */
struct GtkMenuButtonClass
{
  /** */
  GtkToggleButtonClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMenuButtonPrivate;

/** */
struct GtkMenuClass
{
  /** */
  GtkMenuShellClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The #GtkMenuItem widget and the derived widgets are the only valid
    children for menus. Their function is to correctly handle highlighting,
    alignment, events and submenus.
    
    As a GtkMenuItem derives from #GtkBin it can hold any valid child widget,
    although only a few are really useful.
    
    By default, a GtkMenuItem sets a #GtkAccelLabel as its child.
    GtkMenuItem has direct functions to set the label and its mnemonic.
    For more advanced label settings, you can fetch the child widget from the GtkBin.
    
    An example for setting markup and accelerator on a MenuItem:
    
    ```c
    GtkWidget *menu_item = gtk_menu_item_new_with_label ("Example Menu Item");
    
    GtkWidget *child = gtk_bin_get_child (GTK_BIN (menu_item));
    gtk_label_set_markup (GTK_LABEL (child), "<i>new label</i> with <b>markup</b>");
    gtk_accel_label_set_accel (GTK_ACCEL_LABEL (child), GDK_KEY_1, 0);
    ```
    
    # GtkMenuItem as GtkBuildable
    
    The GtkMenuItem implementation of the #GtkBuildable interface supports
    adding a submenu by specifying “submenu” as the “type” attribute of
    a `<child>` element.
    
    An example of UI definition fragment with submenus:
    
    ```xml
    <object class="GtkMenuItem">
      <child type="submenu">
        <object class="GtkMenu"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── <child>
    ╰── [arrow.right]
    ```
    
    GtkMenuItem has a single CSS node with name menuitem. If the menuitem
    has a submenu, it gets another CSS node with name arrow, which has
    the .left or .right style class.
*/
struct GtkMenuItem
{
  /** */
  GtkBin bin;

  /** */
  GtkMenuItemPrivate* priv;
}

/** */
struct GtkMenuItemAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkMenuItemAccessiblePrivate* priv;
}

/** */
struct GtkMenuItemAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkMenuItemAccessiblePrivate;

/** */
struct GtkMenuItemClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      If true, then we should always
         hide the menu when the [gtk.menu_item.MenuItem] is activated. Otherwise,
         it is up to the caller.
  */
  uint hideOnActivate;

  /**
      Signal emitted when the item is activated.
  */
  extern(C) void function(GtkMenuItem* menuItem) activate;

  /**
      Signal emitted when the item is activated, but also
         if the menu item has a submenu.
  */
  extern(C) void function(GtkMenuItem* menuItem) activateItem;

  /** */
  extern(C) void function(GtkMenuItem* menuItem, int* requisition) toggleSizeRequest;

  /** */
  extern(C) void function(GtkMenuItem* menuItem, int allocation) toggleSizeAllocate;

  /**
      Sets @text on the #GtkMenuItem label
  */
  extern(C) void function(GtkMenuItem* menuItem, const(char)* label) setLabel;

  /**
      Gets @text from the #GtkMenuItem label
  */
  extern(C) const(char)* function(GtkMenuItem* menuItem) getLabel;

  /**
      Signal emitted when the item is selected.
  */
  extern(C) void function(GtkMenuItem* menuItem) select;

  /**
      Signal emitted when the item is deselected.
  */
  extern(C) void function(GtkMenuItem* menuItem) deselect;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMenuItemPrivate;

/** */
struct GtkMenuPrivate;

/**
    A #GtkMenuShell is the abstract base class used to derive the
    #GtkMenu and #GtkMenuBar subclasses.
    
    A #GtkMenuShell is a container of #GtkMenuItem objects arranged
    in a list which can be navigated, selected, and activated by the
    user to perform application functions. A #GtkMenuItem can have a
    submenu associated with it, allowing for nested hierarchical menus.
    
    # Terminology
    
    A menu item can be “selected”, this means that it is displayed
    in the prelight state, and if it has a submenu, that submenu
    will be popped up.
    
    A menu is “active” when it is visible onscreen and the user
    is selecting from it. A menubar is not active until the user
    clicks on one of its menuitems. When a menu is active,
    passing the mouse over a submenu will pop it up.
    
    There is also is a concept of the current menu and a current
    menu item. The current menu item is the selected menu item
    that is furthest down in the hierarchy. (Every active menu shell
    does not necessarily contain a selected menu item, but if
    it does, then the parent menu shell must also contain
    a selected menu item.) The current menu is the menu that
    contains the current menu item. It will always have a GTK
    grab and receive all key presses.
*/
struct GtkMenuShell
{
  /** */
  GtkContainer container;

  /** */
  GtkMenuShellPrivate* priv;
}

/** */
struct GtkMenuShellAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkMenuShellAccessiblePrivate* priv;
}

/** */
struct GtkMenuShellAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkMenuShellAccessiblePrivate;

/** */
struct GtkMenuShellClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  uint submenuPlacement;

  /** */
  extern(C) void function(GtkMenuShell* menuShell) deactivate;

  /** */
  extern(C) void function(GtkMenuShell* menuShell) selectionDone;

  /** */
  extern(C) void function(GtkMenuShell* menuShell, GtkMenuDirectionType direction) moveCurrent;

  /** */
  extern(C) void function(GtkMenuShell* menuShell, gboolean forceHide) activateCurrent;

  /** */
  extern(C) void function(GtkMenuShell* menuShell) cancel;

  /** */
  extern(C) void function(GtkMenuShell* menuShell, GtkWidget* menuItem) selectItem;

  /** */
  extern(C) void function(GtkMenuShell* menuShell, GtkWidget* child, int position) insert;

  /** */
  extern(C) int function(GtkMenuShell* menuShell) getPopupDelay;

  /** */
  extern(C) gboolean function(GtkMenuShell* menuShell, int distance) moveSelected;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMenuShellPrivate;

/**
    A #GtkMenuToolButton is a #GtkToolItem that contains a button and
    a small additional button with an arrow. When clicked, the arrow
    button pops up a dropdown menu.
    
    Use [gtk.menu_tool_button.MenuToolButton.new_] to create a new
    #GtkMenuToolButton.
    
    # GtkMenuToolButton as GtkBuildable
    
    The GtkMenuToolButton implementation of the GtkBuildable interface
    supports adding a menu by specifying “menu” as the “type” attribute
    of a `<child>` element.
    
    An example for a UI definition fragment with menus:
    
    ```xml
    <object class="GtkMenuToolButton">
      <child type="menu">
        <object class="GtkMenu"/>
      </child>
    </object>
    ```
*/
struct GtkMenuToolButton
{
  /** */
  GtkToolButton parent;

  /** */
  GtkMenuToolButtonPrivate* priv;
}

/** */
struct GtkMenuToolButtonClass
{
  /**
      The parent class.
  */
  GtkToolButtonClass parentClass;

  /**
      Signal emitted before the menu is shown.
  */
  extern(C) void function(GtkMenuToolButton* button) showMenu;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMenuToolButtonPrivate;

/**
    #GtkMessageDialog presents a dialog with some message text. It’s simply a
    convenience widget; you could construct the equivalent of #GtkMessageDialog
    from #GtkDialog without too much effort, but #GtkMessageDialog saves typing.
    
    One difference from #GtkDialog is that #GtkMessageDialog sets the
    #GtkWindow:skip-taskbar-hint property to true, so that the dialog is hidden
    from the taskbar by default.
    
    The easiest way to do a modal message dialog is to use [gtk.dialog.Dialog.run], though
    you can also pass in the [gtk.types.DialogFlags.Modal] flag, [gtk.dialog.Dialog.run] automatically
    makes the dialog modal and waits for the user to respond to it. [gtk.dialog.Dialog.run]
    returns when any dialog button is clicked.
    
    An example for using a modal dialog:
    ```c
     GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_message_dialog_new (parent_window,
                                      flags,
                                      GTK_MESSAGE_ERROR,
                                      GTK_BUTTONS_CLOSE,
                                      "Error reading “%s”: %s",
                                      filename,
                                      g_strerror (errno));
     gtk_dialog_run (GTK_DIALOG (dialog));
     gtk_widget_destroy (dialog);
    ```
    
    You might do a non-modal #GtkMessageDialog as follows:
    
    An example for a non-modal dialog:
    ```c
     GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
     dialog = gtk_message_dialog_new (parent_window,
                                      flags,
                                      GTK_MESSAGE_ERROR,
                                      GTK_BUTTONS_CLOSE,
                                      "Error reading “%s”: %s",
                                      filename,
                                      g_strerror (errno));
    
     // Destroy the dialog when the user responds to it
     // (e.g. clicks a button)
    
     g_signal_connect_swapped (dialog, "response",
                               G_CALLBACK (gtk_widget_destroy),
                               dialog);
    ```
    
    # GtkMessageDialog as GtkBuildable
    
    The GtkMessageDialog implementation of the GtkBuildable interface exposes
    the message area as an internal child with the name “message_area”.
*/
struct GtkMessageDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkMessageDialogPrivate* priv;
}

/** */
struct GtkMessageDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMessageDialogPrivate;

/**
    The #GtkMisc widget is an abstract widget which is not useful itself, but
    is used to derive subclasses which have alignment and padding attributes.
    
    The horizontal and vertical padding attributes allows extra space to be
    added around the widget.
    
    The horizontal and vertical alignment attributes enable the widget to be
    positioned within its allocated area. Note that if the widget is added to
    a container in such a way that it expands automatically to fill its
    allocated area, the alignment settings will not alter the widget's position.
    
    Note that the desired effect can in most cases be achieved by using the
    #GtkWidget:halign, #GtkWidget:valign and #GtkWidget:margin properties
    on the child widget, so GtkMisc should not be used in new code. To reflect
    this fact, all #GtkMisc API has been deprecated.
*/
struct GtkMisc
{
  /** */
  GtkWidget widget;

  /** */
  GtkMiscPrivate* priv;
}

/** */
struct GtkMiscClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkMiscPrivate;

/**
    GtkModelButton is a button class that can use a #GAction as its model.
    In contrast to #GtkToggleButton or #GtkRadioButton, which can also
    be backed by a #GAction via the #GtkActionable:action-name property,
    GtkModelButton will adapt its appearance according to the kind of
    action it is backed by, and appear either as a plain, check or
    radio button.
    
    Model buttons are used when popovers from a menu model with
    [gtk.popover.Popover.newFromModel]; they can also be used manually in
    a #GtkPopoverMenu.
    
    When the action is specified via the #GtkActionable:action-name
    and #GtkActionable:action-target properties, the role of the button
    (i.e. whether it is a plain, check or radio button) is determined by
    the type of the action and doesn't have to be explicitly specified
    with the #GtkModelButton:role property.
    
    The content of the button is specified by the #GtkModelButton:text
    and #GtkModelButton:icon properties.
    
    The appearance of model buttons can be influenced with the
    #GtkModelButton:centered and #GtkModelButton:iconic properties.
    
    Model buttons have built-in support for submenus in #GtkPopoverMenu.
    To make a GtkModelButton that opens a submenu when activated, set
    the #GtkModelButton:menu-name property. To make a button that goes
    back to the parent menu, you should set the #GtkModelButton:inverted
    property to place the submenu indicator at the opposite side.
    
    # Example
    
    ```
    <object class="GtkPopoverMenu">
      <child>
        <object class="GtkBox">
          <property name="visible">True</property>
          <property name="margin">10</property>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">view.cut</property>
              <property name="text" translatable="yes">Cut</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">view.copy</property>
              <property name="text" translatable="yes">Copy</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">view.paste</property>
              <property name="text" translatable="yes">Paste</property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    modelbutton
    ├── <child>
    ╰── check
    ```
    
    ```plain
    modelbutton
    ├── <child>
    ╰── radio
    ```
    
    ```plain
    modelbutton
    ├── <child>
    ╰── arrow
    ```
    
    GtkModelButton has a main CSS node with name modelbutton, and a subnode,
    which will have the name check, radio or arrow, depending on the role
    of the button and whether it has a menu name set.
    
    The subnode is positioned before or after the content nodes and gets the
    .left or .right style class, depending on where it is located.
    
    ```plain
    button.model
    ├── <child>
    ╰── check
    ```
    
    Iconic model buttons (see #GtkModelButton:iconic) change the name of
    their main node to button and add a .model style class to it. The indicator
    subnode is invisible in this case.
*/
struct GtkModelButton;

/**
    This should not be accessed directly. Use the accessor functions below.
*/
struct GtkMountOperation
{
  /** */
  GMountOperation parentInstance;

  /** */
  GtkMountOperationPrivate* priv;
}

/** */
struct GtkMountOperationClass
{
  /**
      The parent class.
  */
  GMountOperationClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    Virtual table for the D-Bus interface <link linkend="gdbus-interface-org-Gtk-MountOperationHandler.top_of_page">org.Gtk.MountOperationHandler</link>.
*/
struct _GtkMountOperationHandlerIface
{
  /**
      The parent interface.
  */
  GTypeInterface parentIface;

  /**
      Handler for the #_GtkMountOperationHandler::handle-ask-password signal.
  */
  extern(C) gboolean function(_GtkMountOperationHandler* object, GDBusMethodInvocation* invocation, const(char)* argId, const(char)* argMessage, const(char)* argIconName, const(char)* argDefaultUser, const(char)* argDefaultDomain, uint argFlags) handleAskPassword;

  /**
      Handler for the #_GtkMountOperationHandler::handle-ask-question signal.
  */
  extern(C) gboolean function(_GtkMountOperationHandler* object, GDBusMethodInvocation* invocation, const(char)* argId, const(char)* argMessage, const(char)* argIconName, const(char*)* argChoices) handleAskQuestion;

  /**
      Handler for the #_GtkMountOperationHandler::handle-close signal.
  */
  extern(C) gboolean function(_GtkMountOperationHandler* object, GDBusMethodInvocation* invocation) handleClose;

  /**
      Handler for the #_GtkMountOperationHandler::handle-show-processes signal.
  */
  extern(C) gboolean function(_GtkMountOperationHandler* object, GDBusMethodInvocation* invocation, const(char)* argId, const(char)* argMessage, const(char)* argIconName, GVariant* argApplicationPids, const(char*)* argChoices) handleShowProcesses;
}

/**
    The #_GtkMountOperationHandlerProxy structure contains only private data and should only be accessed using the provided API.
*/
struct _GtkMountOperationHandlerProxy
{
  /** */
  GDBusProxy parentInstance;

  /** */
  _GtkMountOperationHandlerProxyPrivate* priv;
}

/**
    The #_GtkMountOperationHandlerSkeleton structure contains only private data and should only be accessed using the provided API.
*/
struct _GtkMountOperationHandlerSkeleton
{
  /** */
  GDBusInterfaceSkeleton parentInstance;

  /** */
  _GtkMountOperationHandlerSkeletonPrivate* priv;
}

/** */
struct GtkMountOperationPrivate;

/**
    Native dialogs are platform dialogs that don't use #GtkDialog or
    #GtkWindow. They are used in order to integrate better with a
    platform, by looking the same as other native applications and
    supporting platform specific features.
    
    The #GtkDialog functions cannot be used on such objects, but we
    need a similar API in order to drive them. The #GtkNativeDialog
    object is an API that allows you to do this. It allows you to set
    various common properties on the dialog, as well as show and hide
    it and get a #GtkNativeDialog::response signal when the user finished
    with the dialog.
    
    There is also a [gtk.native_dialog.NativeDialog.run] helper that makes it easy
    to run any native dialog in a modal way with a recursive mainloop,
    similar to [gtk.dialog.Dialog.run].
*/
struct GtkNativeDialog
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkNativeDialogClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkNativeDialog* self, int responseId) response;

  /** */
  extern(C) void function(GtkNativeDialog* self) show;

  /** */
  extern(C) void function(GtkNativeDialog* self) hide;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The #GtkNotebook widget is a #GtkContainer whose children are pages that
    can be switched between using tab labels along one edge.
    
    There are many configuration options for GtkNotebook. Among other
    things, you can choose on which edge the tabs appear
    (see [gtk.notebook.Notebook.setTabPos]), whether, if there are too many
    tabs to fit the notebook should be made bigger or scrolling
    arrows added (see [gtk.notebook.Notebook.setScrollable]), and whether there
    will be a popup menu allowing the users to switch pages.
    (see [gtk.notebook.Notebook.popupEnable], [gtk.notebook.Notebook.popupDisable])
    
    # GtkNotebook as GtkBuildable
    
    The GtkNotebook implementation of the #GtkBuildable interface
    supports placing children into tabs by specifying “tab” as the
    “type” attribute of a `<child>` element. Note that the content
    of the tab must be created before the tab can be filled.
    A tab child can be specified without specifying a `<child>`
    type attribute.
    
    To add a child widget in the notebooks action area, specify
    "action-start" or “action-end” as the “type” attribute of the
    `<child>` element.
    
    An example of a UI definition fragment with GtkNotebook:
    
    ```xml
    <object class="GtkNotebook">
      <child>
        <object class="GtkLabel" id="notebook-content">
          <property name="label">Content</property>
        </object>
      </child>
      <child type="tab">
        <object class="GtkLabel" id="notebook-tab">
          <property name="label">Tab</property>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    notebook
    ├── header.top
    │   ├── [<action widget>]
    │   ├── tabs
    │   │   ├── [arrow]
    │   │   ├── tab
    │   │   │   ╰── <tab label>
    ┊   ┊   ┊
    │   │   ├── tab[.reorderable-page]
    │   │   │   ╰── <tab label>
    │   │   ╰── [arrow]
    │   ╰── [<action widget>]
    │
    ╰── stack
        ├── <child>
        ┊
        ╰── <child>
    ```
    
    GtkNotebook has a main CSS node with name notebook, a subnode
    with name header and below that a subnode with name tabs which
    contains one subnode per tab with name tab.
    
    If action widgets are present, their CSS nodes are placed next
    to the tabs node. If the notebook is scrollable, CSS nodes with
    name arrow are placed as first and last child of the tabs node.
    
    The main node gets the .frame style class when the notebook
    has a border (see [gtk.notebook.Notebook.setShowBorder]).
    
    The header node gets one of the style class .top, .bottom,
    .left or .right, depending on where the tabs are placed. For
    reorderable pages, the tab node gets the .reorderable-page class.
    
    A tab node gets the .dnd style class while it is moved with drag-and-drop.
    
    The nodes are always arranged from left-to-right, regarldess of text direction.
*/
struct GtkNotebook
{
  /** */
  GtkContainer container;

  /** */
  GtkNotebookPrivate* priv;
}

/** */
struct GtkNotebookAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkNotebookAccessiblePrivate* priv;
}

/** */
struct GtkNotebookAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkNotebookAccessiblePrivate;

/** */
struct GtkNotebookClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkNotebook* notebook, GtkWidget* page, uint pageNum) switchPage;

  /** */
  extern(C) gboolean function(GtkNotebook* notebook, gboolean moveFocus) selectPage;

  /** */
  extern(C) gboolean function(GtkNotebook* notebook, GtkNotebookTab type) focusTab;

  /** */
  extern(C) gboolean function(GtkNotebook* notebook, int offset) changeCurrentPage;

  /** */
  extern(C) void function(GtkNotebook* notebook, GtkDirectionType direction) moveFocusOut;

  /** */
  extern(C) gboolean function(GtkNotebook* notebook, GtkDirectionType direction, gboolean moveToLast) reorderTab;

  /** */
  extern(C) int function(GtkNotebook* notebook, GtkWidget* child, GtkWidget* tabLabel, GtkWidget* menuLabel, int position) insertPage;

  /** */
  extern(C) GtkNotebook* function(GtkNotebook* notebook, GtkWidget* page, int x, int y) createWindow;

  /** */
  extern(C) void function(GtkNotebook* notebook, GtkWidget* child, uint pageNum) pageReordered;

  /** */
  extern(C) void function(GtkNotebook* notebook, GtkWidget* child, uint pageNum) pageRemoved;

  /** */
  extern(C) void function(GtkNotebook* notebook, GtkWidget* child, uint pageNum) pageAdded;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkNotebookPageAccessible
{
  /** */
  AtkObject parent;

  /** */
  GtkNotebookPageAccessiblePrivate* priv;
}

/** */
struct GtkNotebookPageAccessibleClass
{
  /** */
  AtkObjectClass parentClass;
}

/** */
struct GtkNotebookPageAccessiblePrivate;

/** */
struct GtkNotebookPrivate;

/**
    GtkNumerableIcon is a subclass of #GEmblemedIcon that can
    show a number or short string as an emblem. The number can
    be overlayed on top of another emblem, if desired.
    
    It supports theming by taking font and color information
    from a provided #GtkStyleContext; see
    [gtk.numerable_icon.NumerableIcon.setStyleContext].
    
    Typical numerable icons:
    ![](numerableicon.png)
    ![](numerableicon2.png)
*/
struct GtkNumerableIcon
{
  /** */
  GEmblemedIcon parent;

  /** */
  GtkNumerableIconPrivate* priv;
}

/** */
struct GtkNumerableIconClass
{
  /** */
  GEmblemedIconClass parentClass;

  /** */
  void*[16] padding;
}

/** */
struct GtkNumerableIconPrivate;

/**
    GtkOffscreenWindow is strictly intended to be used for obtaining
    snapshots of widgets that are not part of a normal widget hierarchy.
    Since #GtkOffscreenWindow is a toplevel widget you cannot obtain
    snapshots of a full window with it since you cannot pack a toplevel
    widget in another toplevel.
    
    The idea is to take a widget and manually set the state of it,
    add it to a GtkOffscreenWindow and then retrieve the snapshot
    as a #cairo_surface_t or #GdkPixbuf.
    
    GtkOffscreenWindow derives from #GtkWindow only as an implementation
    detail.  Applications should not use any API specific to #GtkWindow
    to operate on this object.  It should be treated as a #GtkBin that
    has no parent widget.
    
    When contained offscreen widgets are redrawn, GtkOffscreenWindow
    will emit a #GtkWidget::damage-event signal.
*/
struct GtkOffscreenWindow
{
  /** */
  GtkWindow parentObject;
}

/** */
struct GtkOffscreenWindowClass
{
  /**
      The parent class.
  */
  GtkWindowClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The #GtkOrientable interface is implemented by all widgets that can be
    oriented horizontally or vertically. Historically, such widgets have been
    realized as subclasses of a common base class (e.g #GtkBox/#GtkHBox/#GtkVBox
    or #GtkScale/#GtkHScale/#GtkVScale). #GtkOrientable is more flexible in that
    it allows the orientation to be changed at runtime, allowing the widgets
    to “flip”.
    
    #GtkOrientable was introduced in GTK+ 2.16.
*/
struct GtkOrientable;

/** */
struct GtkOrientableIface
{
  /** */
  GTypeInterface baseIface;
}

/**
    GtkOverlay is a container which contains a single main child, on top
    of which it can place “overlay” widgets. The position of each overlay
    widget is determined by its #GtkWidget:halign and #GtkWidget:valign
    properties. E.g. a widget with both alignments set to [gtk.types.Align.Start]
    will be placed at the top left corner of the GtkOverlay container,
    whereas an overlay with halign set to [gtk.types.Align.Center] and valign set
    to [gtk.types.Align.End] will be placed a the bottom edge of the GtkOverlay,
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the #GtkOverlay::get-child-position signal.
    
    An overlay’s minimum and natural sizes are those of its main child. The sizes
    of overlay children are not considered when measuring these preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The GtkOverlay implementation of the GtkBuildable interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    GtkOverlay has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
struct GtkOverlay
{
  /** */
  GtkBin parent;

  /** */
  GtkOverlayPrivate* priv;
}

/** */
struct GtkOverlayClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Signal emitted to determine the position and
         size of any overlay child widgets.
  */
  extern(C) gboolean function(GtkOverlay* overlay, GtkWidget* widget, GtkAllocation* allocation) getChildPosition;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkOverlayPrivate;

/**
    Struct defining a pad action entry.
*/
struct GtkPadActionEntry
{
  /**
      the type of pad feature that will trigger this action entry.
  */
  GtkPadActionType type;

  /**
      the 0-indexed button/ring/strip number that will trigger this action
        entry.
  */
  int index;

  /**
      the mode that will trigger this action entry, or -1 for all modes.
  */
  int mode;

  /**
      Human readable description of this action entry, this string should
        be deemed user-visible.
  */
  char* label;

  /**
      action name that will be activated in the #GActionGroup.
  */
  char* actionName;
}

/**
    #GtkPadController is an event controller for the pads found in drawing
    tablets (The collection of buttons and tactile sensors often found around
    the stylus-sensitive area).
    
    These buttons and sensors have no implicit meaning, and by default they
    perform no action, this event controller is provided to map those to
    #GAction objects, thus letting the application give those a more semantic
    meaning.
    
    Buttons and sensors are not constrained to triggering a single action, some
    [gdk.types.InputSource.TabletPad] devices feature multiple "modes", all these input
    elements have one current mode, which may determine the final action
    being triggered. Pad devices often divide buttons and sensors into groups,
    all elements in a group share the same current mode, but different groups
    may have different modes. See [gdk.device_pad.DevicePad.getNGroups] and
    [gdk.device_pad.DevicePad.getGroupNModes].
    
    Each of the actions that a given button/strip/ring performs for a given
    mode is defined by #GtkPadActionEntry, it contains an action name that
    will be looked up in the given #GActionGroup and activated whenever the
    specified input element and mode are triggered.
    
    A simple example of #GtkPadController usage, assigning button 1 in all
    modes and pad devices to an "invert-selection" action:
    ```
      GtkPadActionEntry *pad_actions[] = {
        { GTK_PAD_ACTION_BUTTON, 1, -1, "Invert selection", "pad-actions.invert-selection" },
        …
      };
    
      …
      action_group = g_simple_action_group_new ();
      action = g_simple_action_new ("pad-actions.invert-selection", NULL);
      g_signal_connect (action, "activate", on_invert_selection_activated, NULL);
      g_action_map_add_action (G_ACTION_MAP (action_group), action);
      …
      pad_controller = gtk_pad_controller_new (window, action_group, NULL);
    ```
    
    The actions belonging to rings/strips will be activated with a parameter
    of type `G_VARIANT_TYPE_DOUBLE` bearing the value of the given axis, it
    is required that those are made stateful and accepting this #GVariantType.
*/
struct GtkPadController;

/** */
struct GtkPadControllerClass;

/**
    See also [gtk.print_settings.PrintSettings.setPageRanges].
*/
struct GtkPageRange
{
  /**
      start of page range.
  */
  int start;

  /**
      end of page range.
  */
  int end;
}

/**
    A GtkPageSetup object stores the page size, orientation and margins.
    The idea is that you can get one of these from the page setup dialog
    and then pass it to the #GtkPrintOperation when printing.
    The benefit of splitting this out of the #GtkPrintSettings is that
    these affect the actual layout of the page, and thus need to be set
    long before user prints.
    
    ## Margins ## {#print-margins}
    The margins specified in this object are the “print margins”, i.e. the
    parts of the page that the printer cannot print on. These are different
    from the layout margins that a word processor uses; they are typically
    used to determine the minimal size for the layout
    margins.
    
    To obtain a #GtkPageSetup use [gtk.page_setup.PageSetup.new_] to get the defaults,
    or use [gtk.global.printRunPageSetupDialog] to show the page setup dialog
    and receive the resulting page setup.
    
    ## A page setup dialog
    
    ```c
    static GtkPrintSettings *settings = NULL;
    static GtkPageSetup *page_setup = NULL;
    
    static void
    do_page_setup (void)
    {
      GtkPageSetup *new_page_setup;
    
      if (settings == NULL)
        settings = gtk_print_settings_new ();
    
      new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
                                                        page_setup, settings);
    
      if (page_setup)
        g_object_unref (page_setup);
    
      page_setup = new_page_setup;
    }
    ```
    
    Printing support was added in GTK+ 2.10.
*/
struct GtkPageSetup;

/**
    #GtkPaned has two panes, arranged either
    horizontally or vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle.
    
    Child widgets are
    added to the panes of the widget with [gtk.paned.Paned.pack1] and
    [gtk.paned.Paned.pack2]. The division between the two children is set by default
    from the size requests of the children, but it can be adjusted by the
    user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a #GtkFrame with the shadow type set to [gtk.types.ShadowType.In]
    so that the gutter appears as a ridge. No separator is drawn if one of
    the children is missing.
    
    Each child has two options that can be set, @resize and @shrink. If
    @resize is true, then when the #GtkPaned is resized, that child will
    expand or shrink along with the paned widget. If @shrink is true, then
    that child can be made smaller than its requisition by the user.
    Setting @shrink to false allows the application to set a minimum size.
    If @resize is false for both children, then this is treated as if
    @resize is true for both children.
    
    The application can set the position of the slider as if it were set
    by the user, by calling [gtk.paned.Paned.setPosition].
    
    # CSS nodes
    
    ```plain
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ```
    
    GtkPaned has a main CSS node with name paned, and a subnode for
    the separator with name separator. The subnode gets a .wide style
    class when the paned is supposed to be wide.
    
    In horizontal orientation, the nodes of the children are always arranged
    from left to right. So :first-child will always select the leftmost child,
    regardless of text direction.
    
    ## Creating a paned widget with minimum sizes.
    
    ```c
    GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
    GtkWidget *frame1 = gtk_frame_new (NULL);
    GtkWidget *frame2 = gtk_frame_new (NULL);
    gtk_frame_set_shadow_type (GTK_FRAME (frame1), GTK_SHADOW_IN);
    gtk_frame_set_shadow_type (GTK_FRAME (frame2), GTK_SHADOW_IN);
    
    gtk_widget_set_size_request (hpaned, 200, -1);
    
    gtk_paned_pack1 (GTK_PANED (hpaned), frame1, TRUE, FALSE);
    gtk_widget_set_size_request (frame1, 50, -1);
    
    gtk_paned_pack2 (GTK_PANED (hpaned), frame2, FALSE, FALSE);
    gtk_widget_set_size_request (frame2, 50, -1);
    ```
*/
struct GtkPaned
{
  /** */
  GtkContainer container;

  /** */
  GtkPanedPrivate* priv;
}

/** */
struct GtkPanedAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkPanedAccessiblePrivate* priv;
}

/** */
struct GtkPanedAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkPanedAccessiblePrivate;

/** */
struct GtkPanedClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) gboolean function(GtkPaned* paned, gboolean reverse) cycleChildFocus;

  /** */
  extern(C) gboolean function(GtkPaned* paned) toggleHandleFocus;

  /** */
  extern(C) gboolean function(GtkPaned* paned, GtkScrollType scroll) moveHandle;

  /** */
  extern(C) gboolean function(GtkPaned* paned, gboolean reverse) cycleHandleFocus;

  /** */
  extern(C) gboolean function(GtkPaned* paned) acceptPosition;

  /** */
  extern(C) gboolean function(GtkPaned* paned) cancelPosition;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkPanedPrivate;

/**
    GtkPaperSize handles paper sizes. It uses the standard called
    [PWG 5101.1-2002 PWG: Standard for Media Standardized Names](http://www.pwg.org/standards.html)
    to name the paper sizes (and to get the data for the page sizes).
    In addition to standard paper sizes, GtkPaperSize allows to
    construct custom paper sizes with arbitrary dimensions.
    
    The #GtkPaperSize object stores not only the dimensions (width
    and height) of a paper size and its name, it also provides
    default [print margins][print-margins].
    
    Printing support has been added in GTK+ 2.10.
*/
struct GtkPaperSize;

/**
    #GtkPlacesSidebar is a widget that displays a list of frequently-used places in the
    file system:  the user’s home directory, the user’s bookmarks, and volumes and drives.
    This widget is used as a sidebar in #GtkFileChooser and may be used by file managers
    and similar programs.
    
    The places sidebar displays drives and volumes, and will automatically mount
    or unmount them when the user selects them.
    
    Applications can hook to various signals in the places sidebar to customize
    its behavior.  For example, they can add extra commands to the context menu
    of the sidebar.
    
    While bookmarks are completely in control of the user, the places sidebar also
    allows individual applications to provide extra shortcut folders that are unique
    to each application.  For example, a Paint program may want to add a shortcut
    for a Clipart folder.  You can do this with [gtk.places_sidebar.PlacesSidebar.addShortcut].
    
    To make use of the places sidebar, an application at least needs to connect
    to the #GtkPlacesSidebar::open-location signal.  This is emitted when the
    user selects in the sidebar a location to open.  The application should also
    call [gtk.places_sidebar.PlacesSidebar.setLocation] when it changes the currently-viewed
    location.
    
    # CSS nodes
    
    GtkPlacesSidebar uses a single CSS node with name placessidebar and style
    class .sidebar.
    
    Among the children of the places sidebar, the following style classes can
    be used:
    $(LIST
      * .sidebar-new-bookmark-row for the 'Add new bookmark' row
      * .sidebar-placeholder-row for a row that is a placeholder
      * .has-open-popup when a popup is open for a row
    )
*/
struct GtkPlacesSidebar;

/** */
struct GtkPlacesSidebarClass;

/**
    Together with #GtkSocket, #GtkPlug provides the ability to embed
    widgets from one process into another process in a fashion that is
    transparent to the user. One process creates a #GtkSocket widget
    and passes the ID of that widget’s window to the other process,
    which then creates a #GtkPlug with that window ID. Any widgets
    contained in the #GtkPlug then will appear inside the first
    application’s window.
    
    The communication between a #GtkSocket and a #GtkPlug follows the
    [XEmbed Protocol](http://www.freedesktop.org/Standards/xembed-spec).
    This protocol has also been implemented in other toolkits, e.g. Qt,
    allowing the same level of integration when embedding a Qt widget
    in GTK+ or vice versa.
    
    The #GtkPlug and #GtkSocket widgets are only available when GTK+
    is compiled for the X11 platform and `GDK_WINDOWING_X11` is defined.
    They can only be used on a #GdkX11Display. To use #GtkPlug and
    #GtkSocket, you need to include the `gtk/gtkx.h` header.
*/
struct GtkPlug
{
  /** */
  GtkWindow window;

  /** */
  GtkPlugPrivate* priv;
}

/** */
struct GtkPlugAccessible
{
  /** */
  GtkWindowAccessible parent;

  /** */
  GtkPlugAccessiblePrivate* priv;
}

/** */
struct GtkPlugAccessibleClass
{
  /** */
  GtkWindowAccessibleClass parentClass;
}

/** */
struct GtkPlugAccessiblePrivate;

/** */
struct GtkPlugClass
{
  /** */
  GtkWindowClass parentClass;

  /** */
  extern(C) void function(GtkPlug* plug) embedded;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkPlugPrivate;

/**
    GtkPopover is a bubble-like context window, primarily meant to
    provide context-dependent information or options. Popovers are
    attached to a widget, passed at construction time on [gtk.popover.Popover.new_],
    or updated afterwards through [gtk.popover.Popover.setRelativeTo], by
    default they will point to the whole widget area, although this
    behavior can be changed through [gtk.popover.Popover.setPointingTo].
    
    The position of a popover relative to the widget it is attached to
    can also be changed through [gtk.popover.Popover.setPosition].
    
    By default, #GtkPopover performs a GTK+ grab, in order to ensure
    input events get redirected to it while it is shown, and also so
    the popover is dismissed in the expected situations (clicks outside
    the popover, or the Esc key being pressed). If no such modal behavior
    is desired on a popover, [gtk.popover.Popover.setModal] may be called on it
    to tweak its behavior.
    
    ## GtkPopover as menu replacement
    
    GtkPopover is often used to replace menus. To facilitate this, it
    supports being populated from a #GMenuModel, using
    [gtk.popover.Popover.newFromModel]. In addition to all the regular menu
    model features, this function supports rendering sections in the
    model in a more compact form, as a row of icon buttons instead of
    menu items.
    
    To use this rendering, set the ”display-hint” attribute of the
    section to ”horizontal-buttons” and set the icons of your items
    with the ”verb-icon” attribute.
    
    ```
    <section>
      <attribute name="display-hint">horizontal-buttons</attribute>
      <item>
        <attribute name="label">Cut</attribute>
        <attribute name="action">app.cut</attribute>
        <attribute name="verb-icon">edit-cut-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Copy</attribute>
        <attribute name="action">app.copy</attribute>
        <attribute name="verb-icon">edit-copy-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Paste</attribute>
        <attribute name="action">app.paste</attribute>
        <attribute name="verb-icon">edit-paste-symbolic</attribute>
      </item>
    </section>
    ```
    
    # CSS nodes
    
    GtkPopover has a single css node called popover. It always gets the
    .background style class and it gets the .menu style class if it is
    menu-like (e.g. #GtkPopoverMenu or created using [gtk.popover.Popover.newFromModel].
    
    Particular uses of GtkPopover, such as touch selection popups
    or magnifiers in #GtkEntry or #GtkTextView get style classes
    like .touch-selection or .magnifier to differentiate from
    plain popovers.
*/
struct GtkPopover
{
  /** */
  GtkBin parentInstance;

  /** */
  GtkPopoverPrivate* priv;
}

/** */
struct GtkPopoverAccessible
{
  /** */
  GtkContainerAccessible parent;
}

/** */
struct GtkPopoverAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkPopoverClass
{
  /** */
  GtkBinClass parentClass;

  /** */
  extern(C) void function(GtkPopover* popover) closed;

  /** */
  void*[10] reserved;
}

/**
    GtkPopoverMenu is a subclass of #GtkPopover that treats its
    children like menus and allows switching between them. It is
    meant to be used primarily together with #GtkModelButton, but
    any widget can be used, such as #GtkSpinButton or #GtkScale.
    In this respect, GtkPopoverMenu is more flexible than popovers
    that are created from a #GMenuModel with [gtk.popover.Popover.newFromModel].
    
    To add a child as a submenu, set the #GtkPopoverMenu:submenu
    child property to the name of the submenu. To let the user open
    this submenu, add a #GtkModelButton whose #GtkModelButton:menu-name
    property is set to the name you've given to the submenu.
    
    By convention, the first child of a submenu should be a #GtkModelButton
    to switch back to the parent menu. Such a button should use the
    #GtkModelButton:inverted and #GtkModelButton:centered properties
    to achieve a title-like appearance and place the submenu indicator
    at the opposite side. To switch back to the main menu, use "main"
    as the menu name.
    
    # Example
    
    ```xml
    <object class="GtkPopoverMenu">
      <child>
        <object class="GtkBox">
          <property name="visible">True</property>
          <property name="margin">10</property>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.frob</property>
              <property name="text" translatable="yes">Frob</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="menu-name">more</property>
              <property name="text" translatable="yes">More</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="GtkBox">
          <property name="visible">True</property>
          <property name="margin">10</property>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.foo</property>
              <property name="text" translatable="yes">Foo</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.bar</property>
              <property name="text" translatable="yes">Bar</property>
            </object>
          </child>
        </object>
        <packing>
          <property name="submenu">more</property>
        </packing>
      </child>
    </object>
    ```
    
    Just like normal popovers created using gtk_popover_new_from_model,
    #GtkPopoverMenu instances have a single css node called "popover"
    and get the .menu style class.
*/
struct GtkPopoverMenu;

/** */
struct GtkPopoverMenuClass
{
  /** */
  GtkPopoverClass parentClass;

  /** */
  void*[10] reserved;
}

/** */
struct GtkPopoverPrivate;

/**
    A GtkPrintContext encapsulates context information that is required when
    drawing pages for printing, such as the cairo context and important
    parameters like page size and resolution. It also lets you easily
    create #PangoLayout and #PangoContext objects that match the font metrics
    of the cairo surface.
    
    GtkPrintContext objects gets passed to the #GtkPrintOperation::begin-print,
    #GtkPrintOperation::end-print, #GtkPrintOperation::request-page-setup and
    #GtkPrintOperation::draw-page signals on the #GtkPrintOperation.
    
    ## Using GtkPrintContext in a #GtkPrintOperation::draw-page callback
    
    ```c
    static void
    draw_page (GtkPrintOperation *operation,
    	   GtkPrintContext   *context,
    	   int                page_nr)
    {
      cairo_t *cr;
      PangoLayout *layout;
      PangoFontDescription *desc;
    
      cr = gtk_print_context_get_cairo_context (context);
    
      // Draw a red rectangle, as wide as the paper (inside the margins)
      cairo_set_source_rgb (cr, 1.0, 0, 0);
      cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);
    
      cairo_fill (cr);
    
      // Draw some lines
      cairo_move_to (cr, 20, 10);
      cairo_line_to (cr, 40, 20);
      cairo_arc (cr, 60, 60, 20, 0, M_PI);
      cairo_line_to (cr, 80, 20);
    
      cairo_set_source_rgb (cr, 0, 0, 0);
      cairo_set_line_width (cr, 5);
      cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);
      cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);
    
      cairo_stroke (cr);
    
      // Draw some text
      layout = gtk_print_context_create_pango_layout (context);
      pango_layout_set_text (layout, "Hello World! Printing is easy", -1);
      desc = pango_font_description_from_string ("sans 28");
      pango_layout_set_font_description (layout, desc);
      pango_font_description_free (desc);
    
      cairo_move_to (cr, 30, 20);
      pango_cairo_layout_path (cr, layout);
    
      // Font Outline
      cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);
      cairo_set_line_width (cr, 0.5);
      cairo_stroke_preserve (cr);
    
      // Font Fill
      cairo_set_source_rgb (cr, 0, 0.0, 1.0);
      cairo_fill (cr);
    
      g_object_unref (layout);
    }
    ```
    
    Printing support was added in GTK+ 2.10.
*/
struct GtkPrintContext;

/**
    GtkPrintOperation is the high-level, portable printing API.
    It looks a bit different than other GTK+ dialogs such as the
    #GtkFileChooser, since some platforms don’t expose enough
    infrastructure to implement a good print dialog. On such
    platforms, GtkPrintOperation uses the native print dialog.
    On platforms which do not provide a native print dialog, GTK+
    uses its own, see #GtkPrintUnixDialog.
    
    The typical way to use the high-level printing API is to create
    a GtkPrintOperation object with [gtk.print_operation.PrintOperation.new_] when
    the user selects to print. Then you set some properties on it,
    e.g. the page size, any #GtkPrintSettings from previous print
    operations, the number of pages, the current page, etc.
    
    Then you start the print operation by calling [gtk.print_operation.PrintOperation.run].
    It will then show a dialog, let the user select a printer and
    options. When the user finished the dialog various signals will
    be emitted on the #GtkPrintOperation, the main one being
    #GtkPrintOperation::draw-page, which you are supposed to catch
    and render the page on the provided #GtkPrintContext using Cairo.
    
    # The high-level printing API
    
    ```c
    static GtkPrintSettings *settings = NULL;
    
    static void
    do_print (void)
    {
      GtkPrintOperation *print;
      GtkPrintOperationResult res;
    
      print = gtk_print_operation_new ();
    
      if (settings != NULL)
        gtk_print_operation_set_print_settings (print, settings);
    
      g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
      g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
    
      res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                     GTK_WINDOW (main_window), NULL);
    
      if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
        {
          if (settings != NULL)
            g_object_unref (settings);
          settings = g_object_ref (gtk_print_operation_get_print_settings (print));
        }
    
      g_object_unref (print);
    }
    ```
    
    By default GtkPrintOperation uses an external application to do
    print preview. To implement a custom print preview, an application
    must connect to the preview signal. The functions
    [gtk.print_operation_preview.PrintOperationPreview.renderPage],
    [gtk.print_operation_preview.PrintOperationPreview.endPreview] and
    [gtk.print_operation_preview.PrintOperationPreview.isSelected]
    are useful when implementing a print preview.
*/
struct GtkPrintOperation
{
  /** */
  GObject parentInstance;

  /** */
  GtkPrintOperationPrivate* priv;
}

/** */
struct GtkPrintOperationClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal emitted when the print operation run has finished
         doing everything required for printing.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkPrintOperationResult result) done;

  /**
      Signal emitted after the user has finished changing
         print settings in the dialog, before the actual rendering starts.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkPrintContext* context) beginPrint;

  /**
      Signal emitted after the “begin-print” signal, but
         before the actual rendering starts.
  */
  extern(C) gboolean function(GtkPrintOperation* operation, GtkPrintContext* context) paginate;

  /**
      Emitted once for every page that is printed,
         to give the application a chance to modify the page setup.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkPrintContext* context, int pageNr, GtkPageSetup* setup) requestPageSetup;

  /**
      Signal emitted for every page that is printed.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkPrintContext* context, int pageNr) drawPage;

  /**
      Signal emitted after all pages have been rendered.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkPrintContext* context) endPrint;

  /**
      Emitted at between the various phases of the print
         operation.
  */
  extern(C) void function(GtkPrintOperation* operation) statusChanged;

  /**
      Signal emitted when displaying the print dialog.
  */
  extern(C) GtkWidget* function(GtkPrintOperation* operation) createCustomWidget;

  /**
      Signal emitted right before “begin-print” if
         you added a custom widget in the “create-custom-widget” handler.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkWidget* widget) customWidgetApply;

  /**
      Signal emitted when a preview is requested from the
         native dialog.
  */
  extern(C) gboolean function(GtkPrintOperation* operation, GtkPrintOperationPreview* preview, GtkPrintContext* context, GtkWindow* parent) preview;

  /**
      Emitted after change of selected printer.
  */
  extern(C) void function(GtkPrintOperation* operation, GtkWidget* widget, GtkPageSetup* setup, GtkPrintSettings* settings) updateCustomWidget;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkPrintOperationPreview;

/** */
struct GtkPrintOperationPreviewIface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) void function(GtkPrintOperationPreview* preview, GtkPrintContext* context) ready;

  /** */
  extern(C) void function(GtkPrintOperationPreview* preview, GtkPrintContext* context, GtkPageSetup* pageSetup) gotPageSize;

  /** */
  extern(C) void function(GtkPrintOperationPreview* preview, int pageNr) renderPage;

  /** */
  extern(C) gboolean function(GtkPrintOperationPreview* preview, int pageNr) isSelected;

  /** */
  extern(C) void function(GtkPrintOperationPreview* preview) endPreview;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/** */
struct GtkPrintOperationPrivate;

/**
    A GtkPrintSettings object represents the settings of a print dialog in
    a system-independent way. The main use for this object is that once
    you’ve printed you can get a settings object that represents the settings
    the user chose, and the next time you print you can pass that object in so
    that the user doesn’t have to re-set all his settings.
    
    Its also possible to enumerate the settings so that you can easily save
    the settings for the next time your app runs, or even store them in a
    document. The predefined keys try to use shared values as much as possible
    so that moving such a document between systems still works.
    
    Printing support was added in GTK+ 2.10.
*/
struct GtkPrintSettings;

/**
    The #GtkProgressBar is typically used to display the progress of a long
    running operation. It provides a visual clue that processing is underway.
    The GtkProgressBar can be used in two different modes: percentage mode
    and activity mode.
    
    When an application can determine how much work needs to take place
    (e.g. read a fixed number of bytes from a file) and can monitor its
    progress, it can use the GtkProgressBar in percentage mode and the
    user sees a growing bar indicating the percentage of the work that
    has been completed. In this mode, the application is required to call
    [gtk.progress_bar.ProgressBar.setFraction] periodically to update the progress bar.
    
    When an application has no accurate way of knowing the amount of work
    to do, it can use the #GtkProgressBar in activity mode, which shows
    activity by a block moving back and forth within the progress area. In
    this mode, the application is required to call [gtk.progress_bar.ProgressBar.pulse]
    periodically to update the progress bar.
    
    There is quite a bit of flexibility provided to control the appearance
    of the #GtkProgressBar. Functions are provided to control the orientation
    of the bar, optional text can be displayed along with the bar, and the
    step size used in activity mode can be set.
    
    # CSS nodes
    
    ```plain
    progressbar[.osd]
    ├── [text]
    ╰── trough[.empty][.full]
        ╰── progress[.pulse]
    ```
    
    GtkProgressBar has a main CSS node with name progressbar and subnodes with
    names text and trough, of which the latter has a subnode named progress. The
    text subnode is only present if text is shown. The progress subnode has the
    style class .pulse when in activity mode. It gets the style classes .left,
    .right, .top or .bottom added when the progress 'touches' the corresponding
    end of the GtkProgressBar. The .osd class on the progressbar node is for use
    in overlays like the one Epiphany has for page loading progress.
*/
struct GtkProgressBar
{
  /** */
  GtkWidget parent;

  /** */
  GtkProgressBarPrivate* priv;
}

/** */
struct GtkProgressBarAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkProgressBarAccessiblePrivate* priv;
}

/** */
struct GtkProgressBarAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkProgressBarAccessiblePrivate;

/** */
struct GtkProgressBarClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkProgressBarPrivate;

/**
    A #GtkRadioAction is similar to #GtkRadioMenuItem. A number of radio
    actions can be linked together so that only one may be active at any
    one time.
*/
struct GtkRadioAction
{
  /** */
  GtkToggleAction parent;

  /** */
  GtkRadioActionPrivate* privateData;
}

/** */
struct GtkRadioActionClass
{
  /** */
  GtkToggleActionClass parentClass;

  /** */
  extern(C) void function(GtkRadioAction* action, GtkRadioAction* current) changed;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    #GtkRadioActionEntry structs are used with
    [gtk.action_group.ActionGroup.addRadioActions] to construct groups of radio actions.
*/
struct GtkRadioActionEntry
{
  /**
      The name of the action.
  */
  const(char)* name;

  /**
      The stock id for the action, or the name of an icon from the
       icon theme.
  */
  const(char)* stockId;

  /**
      The label for the action. This field should typically be marked
       for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  const(char)* label;

  /**
      The accelerator for the action, in the format understood by
       [gtk.global.acceleratorParse].
  */
  const(char)* accelerator;

  /**
      The tooltip for the action. This field should typically be
       marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  const(char)* tooltip;

  /**
      The value to set on the radio action. See
       [gtk.radio_action.RadioAction.getCurrentValue].
  */
  int value;
}

/** */
struct GtkRadioActionPrivate;

/**
    A single radio button performs the same basic function as a #GtkCheckButton,
    as its position in the object hierarchy reflects. It is only when multiple
    radio buttons are grouped together that they become a different user
    interface component in their own right.
    
    Every radio button is a member of some group of radio buttons. When one is
    selected, all other radio buttons in the same group are deselected. A
    #GtkRadioButton is one way of giving the user a choice from many options.
    
    Radio button widgets are created with [gtk.radio_button.RadioButton.new_], passing null
    as the argument if this is the first radio button in a group. In subsequent
    calls, the group you wish to add this button to should be passed as an
    argument. Optionally, [gtk.radio_button.RadioButton.newWithLabel] can be used if you
    want a text label on the radio button.
    
    Alternatively, when adding widgets to an existing group of radio buttons,
    use [gtk.radio_button.RadioButton.newFromWidget] with a #GtkRadioButton that already
    has a group assigned to it. The convenience function
    [gtk.radio_button.RadioButton.newWithLabelFromWidget] is also provided.
    
    To retrieve the group a #GtkRadioButton is assigned to, use
    [gtk.radio_button.RadioButton.getGroup].
    
    To remove a #GtkRadioButton from one group and make it part of a new one,
    use [gtk.radio_button.RadioButton.setGroup].
    
    The group list does not need to be freed, as each #GtkRadioButton will remove
    itself and its list item when it is destroyed.
    
    # CSS nodes
    
    ```plain
    radiobutton
    ├── radio
    ╰── <child>
    ```
    
    A GtkRadioButton with indicator (see [gtk.toggle_button.ToggleButton.setMode]) has a
    main CSS node with name radiobutton and a subnode with name radio.
    
    ```plain
    button.radio
    ├── radio
    ╰── <child>
    ```
    
    A GtkRadioButton without indicator changes the name of its main node
    to button and adds a .radio style class to it. The subnode is invisible
    in this case.
    
    ## How to create a group of two radio buttons.
    
    ```c
    void create_radio_buttons (void) {
    
       GtkWidget *window, *radio1, *radio2, *box, *entry;
       window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
       box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 2);
       gtk_box_set_homogeneous (GTK_BOX (box), TRUE);
    
       // Create a radio button with a GtkEntry widget
       radio1 = gtk_radio_button_new (NULL);
       entry = gtk_entry_new ();
       gtk_container_add (GTK_CONTAINER (radio1), entry);
    
    
       // Create a radio button with a label
       radio2 = gtk_radio_button_new_with_label_from_widget (GTK_RADIO_BUTTON (radio1),
                                                             "I’m the second radio button.");
    
       // Pack them into a box, then show all the widgets
       gtk_box_pack_start (GTK_BOX (box), radio1);
       gtk_box_pack_start (GTK_BOX (box), radio2);
       gtk_container_add (GTK_CONTAINER (window), box);
       gtk_widget_show_all (window);
       return;
    }
    ```
    
    When an unselected button in the group is clicked the clicked button
    receives the #GtkToggleButton::toggled signal, as does the previously
    selected button.
    Inside the #GtkToggleButton::toggled handler, [gtk.toggle_button.ToggleButton.getActive]
    can be used to determine if the button has been selected or deselected.
*/
struct GtkRadioButton
{
  /** */
  GtkCheckButton checkButton;

  /** */
  GtkRadioButtonPrivate* priv;
}

/** */
struct GtkRadioButtonAccessible
{
  /** */
  GtkToggleButtonAccessible parent;

  /** */
  GtkRadioButtonAccessiblePrivate* priv;
}

/** */
struct GtkRadioButtonAccessibleClass
{
  /** */
  GtkToggleButtonAccessibleClass parentClass;
}

/** */
struct GtkRadioButtonAccessiblePrivate;

/** */
struct GtkRadioButtonClass
{
  /** */
  GtkCheckButtonClass parentClass;

  /** */
  extern(C) void function(GtkRadioButton* radioButton) groupChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkRadioButtonPrivate;

/**
    A radio menu item is a check menu item that belongs to a group. At each
    instant exactly one of the radio menu items from a group is selected.
    
    The group list does not need to be freed, as each #GtkRadioMenuItem will
    remove itself and its list item when it is destroyed.
    
    The correct way to create a group of radio menu items is approximatively
    this:
    
    ## How to create a group of radio menu items.
    
    ```c
    GSList *group = NULL;
    GtkWidget *item;
    gint i;
    
    for (i = 0; i < 5; i++)
    {
      item = gtk_radio_menu_item_new_with_label (group, "This is an example");
      group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
      if (i == 1)
        gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
    }
    ```
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── radio.left
    ╰── <child>
    ```
    
    GtkRadioMenuItem has a main CSS node with name menuitem, and a subnode
    with name radio, which gets the .left or .right style class.
*/
struct GtkRadioMenuItem
{
  /** */
  GtkCheckMenuItem checkMenuItem;

  /** */
  GtkRadioMenuItemPrivate* priv;
}

/** */
struct GtkRadioMenuItemAccessible
{
  /** */
  GtkCheckMenuItemAccessible parent;

  /** */
  GtkRadioMenuItemAccessiblePrivate* priv;
}

/** */
struct GtkRadioMenuItemAccessibleClass
{
  /** */
  GtkCheckMenuItemAccessibleClass parentClass;
}

/** */
struct GtkRadioMenuItemAccessiblePrivate;

/** */
struct GtkRadioMenuItemClass
{
  /** */
  GtkCheckMenuItemClass parentClass;

  /** */
  extern(C) void function(GtkRadioMenuItem* radioMenuItem) groupChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkRadioMenuItemPrivate;

/**
    A #GtkRadioToolButton is a #GtkToolItem that contains a radio button,
    that is, a button that is part of a group of toggle buttons where only
    one button can be active at a time.
    
    Use [gtk.radio_tool_button.RadioToolButton.new_] to create a new GtkRadioToolButton. Use
    [gtk.radio_tool_button.RadioToolButton.newFromWidget] to create a new GtkRadioToolButton
    that is part of the same group as an existing GtkRadioToolButton.
    
    # CSS nodes
    
    GtkRadioToolButton has a single CSS node with name toolbutton.
*/
struct GtkRadioToolButton
{
  /** */
  GtkToggleToolButton parent;
}

/** */
struct GtkRadioToolButtonClass
{
  /** */
  GtkToggleToolButtonClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    #GtkRange is the common base class for widgets which visualize an
    adjustment, e.g #GtkScale or #GtkScrollbar.
    
    Apart from signals for monitoring the parameters of the adjustment,
    #GtkRange provides properties and methods for influencing the sensitivity
    of the “steppers”. It also provides properties and methods for setting a
    “fill level” on range widgets. See [gtk.range.Range.setFillLevel].
*/
struct GtkRange
{
  /** */
  GtkWidget widget;

  /** */
  GtkRangePrivate* priv;
}

/** */
struct GtkRangeAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkRangeAccessiblePrivate* priv;
}

/** */
struct GtkRangeAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkRangeAccessiblePrivate;

/** */
struct GtkRangeClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  char* sliderDetail;

  /** */
  char* stepperDetail;

  /** */
  extern(C) void function(GtkRange* range) valueChanged;

  /** */
  extern(C) void function(GtkRange* range, double newValue) adjustBounds;

  /** */
  extern(C) void function(GtkRange* range, GtkScrollType scroll) moveSlider;

  /** */
  extern(C) void function(GtkRange* range, GtkBorder* border) getRangeBorder;

  /** */
  extern(C) gboolean function(GtkRange* range, GtkScrollType scroll, double newValue) changeValue;

  /** */
  extern(C) void function(GtkRange* range, GtkOrientation orientation, int* minimum, int* natural) getRangeSizeRequest;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;
}

/** */
struct GtkRangePrivate;

/** */
struct GtkRcContext;

/**
    Deprecated
*/
struct GtkRcProperty
{
  /**
      quark-ified type identifier
  */
  GQuark typeName;

  /**
      quark-ified property identifier like
        “GtkScrollbar::spacing”
  */
  GQuark propertyName;

  /**
      field similar to one found in #GtkSettingsValue
  */
  char* origin;

  /**
      field similar to one found in #GtkSettingsValue
  */
  GValue value;
}

/**
    The #GtkRcStyle-struct is used to represent a set
    of information about the appearance of a widget.
    This can later be composited together with other
    #GtkRcStyle-struct<!-- -->s to form a #GtkStyle.
*/
struct GtkRcStyle
{
  /** */
  GObject parentInstance;

  /**
      Name
  */
  char* name;

  /**
      Pixmap name
  */
  char*[5] bgPixmapName;

  /**
      A #PangoFontDescription
  */
  PangoFontDescription* fontDesc;

  /**
      #GtkRcFlags
  */
  GtkRcFlags[5] colorFlags;

  /**
      Foreground colors
  */
  GdkColor[5] fg;

  /**
      Background colors
  */
  GdkColor[5] bg;

  /**
      Text colors
  */
  GdkColor[5] text;

  /**
      Base colors
  */
  GdkColor[5] base;

  /**
      X thickness
  */
  int xthickness;

  /**
      Y thickness
  */
  int ythickness;

  /** */
  GArray* rcProperties;

  /** */
  GSList* rcStyleLists;

  /** */
  GSList* iconFactories;

  /** */
  uint engineSpecified;
}

/** */
struct GtkRcStyleClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /** */
  extern(C) GtkRcStyle* function(GtkRcStyle* rcStyle) createRcStyle;

  /** */
  extern(C) uint function(GtkRcStyle* rcStyle, GtkSettings* settings, GScanner* scanner) parse;

  /** */
  extern(C) void function(GtkRcStyle* dest, GtkRcStyle* src) merge;

  /** */
  extern(C) GtkStyle* function(GtkRcStyle* rcStyle) createStyle;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    A #GtkRecentAction represents a list of recently used files, which
    can be shown by widgets such as #GtkRecentChooserDialog or
    #GtkRecentChooserMenu.
    
    To construct a submenu showing recently used files, use a #GtkRecentAction
    as the action for a `<menuitem>`. To construct a menu toolbutton showing
    the recently used files in the popup menu, use a #GtkRecentAction as the
    action for a `<toolitem>` element.
*/
struct GtkRecentAction
{
  /** */
  GtkAction parentInstance;

  /** */
  GtkRecentActionPrivate* priv;
}

/** */
struct GtkRecentActionClass
{
  /** */
  GtkActionClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkRecentActionPrivate;

/**
    #GtkRecentChooser is an interface that can be implemented by widgets
    displaying the list of recently used files.  In GTK+, the main objects
    that implement this interface are #GtkRecentChooserWidget,
    #GtkRecentChooserDialog and #GtkRecentChooserMenu.
    
    Recently used files are supported since GTK+ 2.10.
*/
struct GtkRecentChooser;

/**
    #GtkRecentChooserDialog is a dialog box suitable for displaying the recently
    used documents.  This widgets works by putting a #GtkRecentChooserWidget inside
    a #GtkDialog.  It exposes the #GtkRecentChooserIface interface, so you can use
    all the #GtkRecentChooser functions on the recent chooser dialog as well as
    those for #GtkDialog.
    
    Note that #GtkRecentChooserDialog does not have any methods of its own.
    Instead, you should use the functions that work on a #GtkRecentChooser.
    
    ## Typical usage ## {#gtkrecentchooser-typical-usage}
    
    In the simplest of cases, you can use the following code to use
    a #GtkRecentChooserDialog to select a recently used file:
    
    ```c
    GtkWidget *dialog;
    gint res;
    
    dialog = gtk_recent_chooser_dialog_new ("Recent Documents",
                                            parent_window,
                                            _("_Cancel"),
                                            GTK_RESPONSE_CANCEL,
                                            _("_Open"),
                                            GTK_RESPONSE_ACCEPT,
                                            NULL);
    
    res = gtk_dialog_run (GTK_DIALOG (dialog));
    if (res == GTK_RESPONSE_ACCEPT)
      {
        GtkRecentInfo *info;
        GtkRecentChooser *chooser = GTK_RECENT_CHOOSER (dialog);
    
        info = gtk_recent_chooser_get_current_item (chooser);
        open_file (gtk_recent_info_get_uri (info));
        gtk_recent_info_unref (info);
      }
    
    gtk_widget_destroy (dialog);
    ```
    
    Recently used files are supported since GTK+ 2.10.
*/
struct GtkRecentChooserDialog
{
  /** */
  GtkDialog parentInstance;

  /** */
  GtkRecentChooserDialogPrivate* priv;
}

/** */
struct GtkRecentChooserDialogClass
{
  /** */
  GtkDialogClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkRecentChooserDialogPrivate;

/** */
struct GtkRecentChooserIface
{
  /** */
  GTypeInterface baseIface;

  /**
      Sets uri as the current URI for chooser.
  */
  extern(C) gboolean function(GtkRecentChooser* chooser, const(char)* uri, GError** _err) setCurrentUri;

  /**
      Gets the URI currently selected by chooser.
  */
  extern(C) char* function(GtkRecentChooser* chooser) getCurrentUri;

  /**
      Selects uri inside chooser.
  */
  extern(C) gboolean function(GtkRecentChooser* chooser, const(char)* uri, GError** _err) selectUri;

  /**
      Unselects uri inside chooser.
  */
  extern(C) void function(GtkRecentChooser* chooser, const(char)* uri) unselectUri;

  /**
      Selects all the items inside chooser, if the chooser
         supports multiple selection.
  */
  extern(C) void function(GtkRecentChooser* chooser) selectAll;

  /**
      Unselects all the items inside chooser.
  */
  extern(C) void function(GtkRecentChooser* chooser) unselectAll;

  /**
      Gets the list of recently used resources in form of
         #GtkRecentInfo objects.
  */
  extern(C) GList* function(GtkRecentChooser* chooser) getItems;

  /**
      Gets the #GtkRecentManager used by chooser.
  */
  extern(C) GtkRecentManager* function(GtkRecentChooser* chooser) getRecentManager;

  /**
      Adds filter to the list of #GtkRecentFilter objects
         held by chooser.
  */
  extern(C) void function(GtkRecentChooser* chooser, GtkRecentFilter* filter) addFilter;

  /**
      Removes filter from the list of #GtkRecentFilter
         objects held by chooser.
  */
  extern(C) void function(GtkRecentChooser* chooser, GtkRecentFilter* filter) removeFilter;

  /**
      Gets the #GtkRecentFilter objects held by chooser.
  */
  extern(C) GSList* function(GtkRecentChooser* chooser) listFilters;

  /**
      Sets the comparison function used when sorting to
         be sort_func.
  */
  extern(C) void function(GtkRecentChooser* chooser, GtkRecentSortFunc sortFunc, void* sortData, GDestroyNotify dataDestroy) setSortFunc;

  /**
      Signal emitted when the user “activates” a recent
         item in the recent chooser.
  */
  extern(C) void function(GtkRecentChooser* chooser) itemActivated;

  /**
      Signal emitted when there is a change in the
         set of selected recently used resources.
  */
  extern(C) void function(GtkRecentChooser* chooser) selectionChanged;
}

/**
    #GtkRecentChooserMenu is a widget suitable for displaying recently used files
    inside a menu.  It can be used to set a sub-menu of a #GtkMenuItem using
    [gtk.menu_item.MenuItem.setSubmenu], or as the menu of a #GtkMenuToolButton.
    
    Note that #GtkRecentChooserMenu does not have any methods of its own. Instead,
    you should use the functions that work on a #GtkRecentChooser.
    
    Note also that #GtkRecentChooserMenu does not support multiple filters, as it
    has no way to let the user choose between them as the #GtkRecentChooserWidget
    and #GtkRecentChooserDialog widgets do. Thus using [gtk.recent_chooser.RecentChooser.addFilter]
    on a #GtkRecentChooserMenu widget will yield the same effects as using
    [gtk.recent_chooser.RecentChooser.setFilter], replacing any currently set filter
    with the supplied filter; [gtk.recent_chooser.RecentChooser.removeFilter] will remove
    any currently set #GtkRecentFilter object and will unset the current filter;
    [gtk.recent_chooser.RecentChooser.listFilters] will return a list containing a single
    #GtkRecentFilter object.
    
    Recently used files are supported since GTK+ 2.10.
*/
struct GtkRecentChooserMenu
{
  /** */
  GtkMenu parentInstance;

  /** */
  GtkRecentChooserMenuPrivate* priv;
}

/** */
struct GtkRecentChooserMenuClass
{
  /** */
  GtkMenuClass parentClass;

  /** */
  extern(C) void function() gtkRecent1;

  /** */
  extern(C) void function() gtkRecent2;

  /** */
  extern(C) void function() gtkRecent3;

  /** */
  extern(C) void function() gtkRecent4;
}

/** */
struct GtkRecentChooserMenuPrivate;

/**
    #GtkRecentChooserWidget is a widget suitable for selecting recently used
    files.  It is the main building block of a #GtkRecentChooserDialog.  Most
    applications will only need to use the latter; you can use
    #GtkRecentChooserWidget as part of a larger window if you have special needs.
    
    Note that #GtkRecentChooserWidget does not have any methods of its own.
    Instead, you should use the functions that work on a #GtkRecentChooser.
    
    Recently used files are supported since GTK+ 2.10.
*/
struct GtkRecentChooserWidget
{
  /** */
  GtkBox parentInstance;

  /** */
  GtkRecentChooserWidgetPrivate* priv;
}

/** */
struct GtkRecentChooserWidgetClass
{
  /** */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkRecentChooserWidgetPrivate;

/**
    Meta-data to be passed to [gtk.recent_manager.RecentManager.addFull] when
    registering a recently used resource.
*/
struct GtkRecentData
{
  /**
      a UTF-8 encoded string, containing the name of the recently
        used resource to be displayed, or null;
  */
  char* displayName;

  /**
      a UTF-8 encoded string, containing a short description of
        the resource, or null;
  */
  char* description;

  /**
      the MIME type of the resource;
  */
  char* mimeType;

  /**
      the name of the application that is registering this recently
        used resource;
  */
  char* appName;

  /**
      command line used to launch this resource; may contain the
        “\`f`” and “\`u`” escape characters which will be expanded
        to the resource file path and URI respectively when the command line
        is retrieved;
  */
  char* appExec;

  /**
      a vector of strings containing
        groups names;
  */
  char** groups;

  /**
      whether this resource should be displayed only by the
        applications that have registered it or not.
  */
  gboolean isPrivate;
}

/**
    A #GtkRecentFilter can be used to restrict the files being shown
    in a #GtkRecentChooser.  Files can be filtered based on their name
    (with [gtk.recent_filter.RecentFilter.addPattern]), on their mime type (with
    [gtk.file_filter.FileFilter.addMimeType]), on the application that has
    registered them (with [gtk.recent_filter.RecentFilter.addApplication]), or by
    a custom filter function (with [gtk.recent_filter.RecentFilter.addCustom]).
    
    Filtering by mime type handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of text/plain.
    Note that #GtkRecentFilter allows wildcards for the subtype of a
    mime type, so you can e.g. filter for image/\*.
    
    Normally, filters are used by adding them to a #GtkRecentChooser,
    see [gtk.recent_chooser.RecentChooser.addFilter], but it is also possible to
    manually use a filter on a file with [gtk.recent_filter.RecentFilter.filter].
    
    Recently used files are supported since GTK+ 2.10.
    
    ## GtkRecentFilter as GtkBuildable
    
    The GtkRecentFilter implementation of the GtkBuildable interface
    supports adding rules using the `<mime-types>`, `<patterns>` and
    `<applications>` elements and listing the rules within. Specifying
    a `<mime-type>`, `<pattern>` or `<application>` has the same effect as
    calling [gtk.recent_filter.RecentFilter.addMimeType],
    [gtk.recent_filter.RecentFilter.addPattern] or [gtk.recent_filter.RecentFilter.addApplication].
    
    An example of a UI definition fragment specifying [gtk.recent_filter.RecentFilter]
    rules:
    
    ```xml
    <object class="GtkRecentFilter">
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/png</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
        <pattern>*.png</pattern>
      </patterns>
      <applications>
        <application>gimp</application>
        <application>gedit</application>
        <application>glade</application>
      </applications>
    </object>
    ```
*/
struct GtkRecentFilter;

/**
    A GtkRecentFilterInfo struct is used
    to pass information about the tested file to [gtk.recent_filter.RecentFilter.filter].
*/
struct GtkRecentFilterInfo
{
  /**
      #GtkRecentFilterFlags to indicate which fields are set.
  */
  GtkRecentFilterFlags contains;

  /**
      The URI of the file being tested.
  */
  const(char)* uri;

  /**
      The string that will be used to display
         the file in the recent chooser.
  */
  const(char)* displayName;

  /**
      MIME type of the file.
  */
  const(char)* mimeType;

  /**
      The list of
         applications that have registered the file.
  */
  const(char*)* applications;

  /**
      The groups to which
         the file belongs to.
  */
  const(char*)* groups;

  /**
      The number of days elapsed since the file has been
         registered.
  */
  int age;
}

/**
    #GtkRecentInfo-struct contains private data only, and should
    be accessed using the provided API.
    
    #GtkRecentInfo constains all the meta-data
    associated with an entry in the recently used files list.
*/
struct GtkRecentInfo;

/**
    #GtkRecentManager provides a facility for adding, removing and
    looking up recently used files. Each recently used file is
    identified by its URI, and has meta-data associated to it, like
    the names and command lines of the applications that have
    registered it, the number of time each application has registered
    the same file, the mime type of the file and whether the file
    should be displayed only by the applications that have
    registered it.
    
    The recently used files list is per user.
    
    The #GtkRecentManager acts like a database of all the recently
    used files. You can create new #GtkRecentManager objects, but
    it is more efficient to use the default manager created by GTK+.
    
    Adding a new recently used file is as simple as:
    
    ```c
    GtkRecentManager *manager;
    
    manager = gtk_recent_manager_get_default ();
    gtk_recent_manager_add_item (manager, file_uri);
    ```
    
    The #GtkRecentManager will try to gather all the needed information
    from the file itself through GIO.
    
    Looking up the meta-data associated with a recently used file
    given its URI requires calling [gtk.recent_manager.RecentManager.lookupItem]:
    
    ```c
    GtkRecentManager *manager;
    GtkRecentInfo *info;
    GError *error = NULL;
    
    manager = gtk_recent_manager_get_default ();
    info = gtk_recent_manager_lookup_item (manager, file_uri, &error);
    if (error)
      {
        g_warning ("Could not find the file: %s", error->message);
        g_error_free (error);
      }
    else
     {
       // Use the info object
       gtk_recent_info_unref (info);
     }
    ```
    
    In order to retrieve the list of recently used files, you can use
    [gtk.recent_manager.RecentManager.getItems], which returns a list of #GtkRecentInfo-structs.
    
    A #GtkRecentManager is the model used to populate the contents of
    one, or more #GtkRecentChooser implementations.
    
    Note that the maximum age of the recently used files list is
    controllable through the #GtkSettings:gtk-recent-files-max-age
    property.
    
    Recently used files are supported since GTK+ 2.10.
*/
struct GtkRecentManager
{
  /** */
  GObject parentInstance;

  /** */
  GtkRecentManagerPrivate* priv;
}

/**
    #GtkRecentManagerClass contains only private data.
*/
struct GtkRecentManagerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkRecentManager* manager) changed;

  /** */
  extern(C) void function() GtkRecent1;

  /** */
  extern(C) void function() GtkRecent2;

  /** */
  extern(C) void function() GtkRecent3;

  /** */
  extern(C) void function() GtkRecent4;
}

/** */
struct GtkRecentManagerPrivate;

/** */
struct GtkRendererCellAccessible
{
  /** */
  GtkCellAccessible parent;

  /** */
  GtkRendererCellAccessiblePrivate* priv;
}

/** */
struct GtkRendererCellAccessibleClass
{
  /** */
  GtkCellAccessibleClass parentClass;
}

/** */
struct GtkRendererCellAccessiblePrivate;

/**
    Represents a request of a screen object in a given orientation. These
    are primarily used in container implementations when allocating a natural
    size for children calling. See [gtk.global.distributeNaturalAllocation].
*/
struct GtkRequestedSize
{
  /**
      A client pointer
  */
  void* data;

  /**
      The minimum size needed for allocation in a given orientation
  */
  int minimumSize;

  /**
      The natural size for allocation in a given orientation
  */
  int naturalSize;
}

/**
    A #GtkRequisition-struct represents the desired size of a widget. See
    [GtkWidget’s geometry management section][geometry-management] for
    more information.
*/
struct GtkRequisition
{
  /**
      the widget’s desired width
  */
  int width;

  /**
      the widget’s desired height
  */
  int height;
}

/**
    The GtkRevealer widget is a container which animates
    the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gtk.revealer.Revealer.setTransitionType].
    
    These animations respect the #GtkSettings:gtk-enable-animations
    setting.
    
    # CSS nodes
    
    GtkRevealer has a single CSS node with name revealer.
    
    The GtkRevealer widget was added in GTK+ 3.10.
*/
struct GtkRevealer
{
  /** */
  GtkBin parentInstance;
}

/** */
struct GtkRevealerClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;
}

/**
    A GtkScale is a slider control used to select a numeric value.
    To use it, you’ll probably want to investigate the methods on
    its base class, #GtkRange, in addition to the methods for GtkScale itself.
    To set the value of a scale, you would normally use [gtk.range.Range.setValue].
    To detect changes to the value, you would normally use the
    #GtkRange::value-changed signal.
    
    Note that using the same upper and lower bounds for the #GtkScale (through
    the #GtkRange methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    GtkScale supports a custom `<marks>` element, which can contain multiple
    `<mark>` elements. The “value” and “position” attributes have the same
    meaning as [gtk.scale.Scale.addMark] parameters of the same name. If the
    element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # CSS nodes
    
    ```plain
    scale[.fine-tune][.marks-before][.marks-after]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── [value]
    ├── contents
    │   ╰── trough
    │       ├── slider
    │       ├── [highlight]
    │       ╰── [fill]
    ╰── marks.bottom
        ├── mark
        ┊    ├── indicator
        ┊    ╰── [label]
        ╰── mark
    ```
    
    GtkScale has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gtk.scale.Scale.setHasOrigin]), there is a
    subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gtk.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the contents
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see #GtkScale:draw-value), there is
    subnode with name value.
*/
struct GtkScale
{
  /** */
  GtkRange range;

  /** */
  GtkScalePrivate* priv;
}

/** */
struct GtkScaleAccessible
{
  /** */
  GtkRangeAccessible parent;

  /** */
  GtkScaleAccessiblePrivate* priv;
}

/** */
struct GtkScaleAccessibleClass
{
  /** */
  GtkRangeAccessibleClass parentClass;
}

/** */
struct GtkScaleAccessiblePrivate;

/**
    #GtkScaleButton provides a button which pops up a scale widget.
    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK+ provides a #GtkVolumeButton subclass that
    is tailored for this use case.
    
    # CSS nodes
    
    GtkScaleButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .scale style class.
    
    The popup widget that contains the scale has a .scale-popup style class.
*/
struct GtkScaleButton
{
  /** */
  GtkButton parent;

  /** */
  GtkScaleButtonPrivate* priv;
}

/** */
struct GtkScaleButtonAccessible
{
  /** */
  GtkButtonAccessible parent;

  /** */
  GtkScaleButtonAccessiblePrivate* priv;
}

/** */
struct GtkScaleButtonAccessibleClass
{
  /** */
  GtkButtonAccessibleClass parentClass;
}

/** */
struct GtkScaleButtonAccessiblePrivate;

/** */
struct GtkScaleButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function(GtkScaleButton* button, double value) valueChanged;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkScaleButtonPrivate;

/** */
struct GtkScaleClass
{
  /** */
  GtkRangeClass parentClass;

  /** */
  extern(C) char* function(GtkScale* scale, double value) formatValue;

  /** */
  extern(C) void function(GtkScale* scale) drawValue;

  /** */
  extern(C) void function(GtkScale* scale, int* x, int* y) getLayoutOffsets;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkScalePrivate;

/**
    #GtkScrollable is an interface that is implemented by widgets with native
    scrolling ability.
    
    To implement this interface you should override the
    #GtkScrollable:hadjustment and #GtkScrollable:vadjustment properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    $(LIST
      * When a parent widget sets the scrollable child widget’s adjustments,
        the widget should populate the adjustments’
        #GtkAdjustment:lower, #GtkAdjustment:upper,
        #GtkAdjustment:step-increment, #GtkAdjustment:page-increment and
        #GtkAdjustment:page-size properties and connect to the
        #GtkAdjustment::value-changed signal.
      
      * Because its preferred size is the size for a fully expanded widget,
        the scrollable widget must be able to cope with underallocations.
        This means that it must accept any value passed to its
        #GtkWidgetClass.size_allocate() function.
      
      * When the parent allocates space to the scrollable child widget,
        the widget should update the adjustments’ properties with new values.
      
      * When any of the adjustments emits the #GtkAdjustment::value-changed signal,
        the scrollable widget should scroll its contents.
    )
*/
struct GtkScrollable;

/** */
struct GtkScrollableInterface
{
  /** */
  GTypeInterface baseIface;

  /** */
  extern(C) gboolean function(GtkScrollable* scrollable, GtkBorder* border) getBorder;
}

/**
    The #GtkScrollbar widget is a horizontal or vertical scrollbar,
    depending on the value of the #GtkOrientable:orientation property.
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gtk.scrollbar.Scrollbar.new_]. See #GtkAdjustment for more details. The
    #GtkAdjustment:value field sets the position of the thumb and must be between
    #GtkAdjustment:lower and #GtkAdjustment:upper - #GtkAdjustment:page-size. The
    #GtkAdjustment:page-size represents the size of the visible scrollable area.
    The fields #GtkAdjustment:step-increment and #GtkAdjustment:page-increment
    fields are added to or subtracted from the #GtkAdjustment:value when the user
    asks to move by a step (using e.g. the cursor arrow keys or, if present, the
    stepper buttons) or by a page (using e.g. the Page Down/Up keys).
    
    # CSS nodes
    
    ```plain
    scrollbar[.fine-tune]
    ╰── contents
        ├── [button.up]
        ├── [button.down]
        ├── trough
        │   ╰── slider
        ├── [button.up]
        ╰── [button.down]
    ```
    
    GtkScrollbar has a main CSS node with name scrollbar and a subnode for its
    contents, with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.
    
    If steppers are enabled, they are represented by up to four additional
    subnodes with name button. These get the style classes .up and .down to
    indicate in which direction they are moving.
    
    Other style classes that may be added to scrollbars inside #GtkScrolledWindow
    include the positional classes (.left, .right, .top, .bottom) and style
    classes related to overlay scrolling (.overlay-indicator, .dragging, .hovering).
*/
struct GtkScrollbar
{
  /** */
  GtkRange range;
}

/** */
struct GtkScrollbarClass
{
  /** */
  GtkRangeClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    GtkScrolledWindow is a container that accepts a single child widget and makes
    that child scrollable using either internally added scrollbars or externally
    associated adjustments.
    
    Widgets with native scrolling support, i.e. those whose classes implement the
    #GtkScrollable interface, are added directly. For other types of widget, the
    class #GtkViewport acts as an adaptor, giving scrollability to other widgets.
    GtkScrolledWindow’s implementation of [gtk.container.Container.add] intelligently
    accounts for whether or not the added child is a #GtkScrollable. If it isn’t,
    #GtkScrolledWindow wraps the child in a #GtkViewport and adds that for you.
    Therefore, you can just add any child widget and not worry about the details.
    
    If [gtk.container.Container.add] has added a #GtkViewport for you, you can remove
    both your added child widget from the #GtkViewport, and the #GtkViewport
    from the GtkScrolledWindow, like this:
    
    ```c
    GtkWidget *scrolled_window = gtk_scrolled_window_new (NULL, NULL);
    GtkWidget *child_widget = gtk_button_new ();
    
    // GtkButton is not a GtkScrollable, so GtkScrolledWindow will automatically
    // add a GtkViewport.
    gtk_container_add (GTK_CONTAINER (scrolled_window),
                       child_widget);
    
    // Either of these will result in child_widget being unparented:
    gtk_container_remove (GTK_CONTAINER (scrolled_window),
                          child_widget);
    // or
    gtk_container_remove (GTK_CONTAINER (scrolled_window),
                          gtk_bin_get_child (GTK_BIN (scrolled_window)));
    ```
    
    Unless #GtkScrolledWindow:policy is GTK_POLICY_NEVER or GTK_POLICY_EXTERNAL,
    GtkScrolledWindow adds internal #GtkScrollbar widgets around its child. The
    scroll position of the child, and if applicable the scrollbars, is controlled
    by the #GtkScrolledWindow:hadjustment and #GtkScrolledWindow:vadjustment
    that are associated with the GtkScrolledWindow. See the docs on #GtkScrollbar
    for the details, but note that the “step_increment” and “page_increment”
    fields are only effective if the policy causes scrollbars to be present.
    
    If a GtkScrolledWindow doesn’t behave quite as you would like, or
    doesn’t have exactly the right layout, it’s very possible to set up
    your own scrolling with #GtkScrollbar and for example a #GtkGrid.
    
    # Touch support
    
    GtkScrolledWindow has built-in support for touch devices. When a
    touchscreen is used, swiping will move the scrolled window, and will
    expose 'kinetic' behavior. This can be turned off with the
    #GtkScrolledWindow:kinetic-scrolling property if it is undesired.
    
    GtkScrolledWindow also displays visual 'overshoot' indication when
    the content is pulled beyond the end, and this situation can be
    captured with the #GtkScrolledWindow::edge-overshot signal.
    
    If no mouse device is present, the scrollbars will overlayed as
    narrow, auto-hiding indicators over the content. If traditional
    scrollbars are desired although no mouse is present, this behaviour
    can be turned off with the #GtkScrolledWindow:overlay-scrolling
    property.
    
    # CSS nodes
    
    GtkScrolledWindow has a main CSS node with name scrolledwindow.
    
    It uses subnodes with names overshoot and undershoot to
    draw the overflow and underflow indications. These nodes get
    the .left, .right, .top or .bottom style class added depending
    on where the indication is drawn.
    
    GtkScrolledWindow also sets the positional style classes (.left,
    .right, .top, .bottom) and style classes related to overlay
    scrolling (.overlay-indicator, .dragging, .hovering) on its scrollbars.
    
    If both scrollbars are visible, the area where they meet is drawn
    with a subnode named junction.
*/
struct GtkScrolledWindow
{
  /** */
  GtkBin container;

  /** */
  GtkScrolledWindowPrivate* priv;
}

/** */
struct GtkScrolledWindowAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkScrolledWindowAccessiblePrivate* priv;
}

/** */
struct GtkScrolledWindowAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkScrolledWindowAccessiblePrivate;

/** */
struct GtkScrolledWindowClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  int scrollbarSpacing;

  /**
      Keybinding signal which gets emitted when a
         keybinding that scrolls is pressed.
  */
  extern(C) gboolean function(GtkScrolledWindow* scrolledWindow, GtkScrollType scroll, gboolean horizontal) scrollChild;

  /**
      Keybinding signal which gets emitted when focus is
         moved away from the scrolled window by a keybinding.
  */
  extern(C) void function(GtkScrolledWindow* scrolledWindow, GtkDirectionType direction) moveFocusOut;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkScrolledWindowPrivate;

/**
    #GtkSearchBar is a container made to have a search entry (possibly
    with additional connex widgets, such as drop-down menus, or buttons)
    built-in. The search bar would appear when a search is started through
    typing on the keyboard, or the application’s search mode is toggled on.
    
    For keyboard presses to start a search, events will need to be
    forwarded from the top-level window that contains the search bar.
    See [gtk.search_bar.SearchBar.handleEvent] for example code. Common shortcuts
    such as Ctrl+F should be handled as an application action, or through
    the menu items.
    
    You will also need to tell the search bar about which entry you
    are using as your search entry using [gtk.search_bar.SearchBar.connectEntry].
    The following example shows you how to create a more complex search
    entry.
    
    # CSS nodes
    
    GtkSearchBar has a single CSS node with name searchbar.
    
    ## Creating a search bar
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/blob/gtk-3-24/examples/search-bar.c)
*/
struct GtkSearchBar
{
  /** */
  GtkBin parent;
}

/** */
struct GtkSearchBarClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    #GtkSearchEntry is a subclass of #GtkEntry that has been
    tailored for use as a search entry.
    
    It will show an inactive symbolic “find” icon when the search
    entry is empty, and a symbolic “clear” icon when there is text.
    Clicking on the “clear” icon will empty the search entry.
    
    Note that the search/clear icon is shown using a secondary
    icon, and thus does not work if you are using the secondary
    icon position for some other purpose.
    
    To make filtering appear more reactive, it is a good idea to
    not react to every change in the entry text immediately, but
    only after a short delay. To support this, #GtkSearchEntry
    emits the #GtkSearchEntry::search-changed signal which can
    be used instead of the #GtkEditable::changed signal.
    
    The #GtkSearchEntry::previous-match, #GtkSearchEntry::next-match
    and #GtkSearchEntry::stop-search signals can be used to implement
    moving between search results and ending the search.
    
    Often, GtkSearchEntry will be fed events by means of being
    placed inside a #GtkSearchBar. If that is not the case,
    you can use [gtk.search_entry.SearchEntry.handleEvent] to pass events.
*/
struct GtkSearchEntry
{
  /** */
  GtkEntry parent;
}

/** */
struct GtkSearchEntryClass
{
  /** */
  GtkEntryClass parentClass;

  /** */
  extern(C) void function(GtkSearchEntry* entry) searchChanged;

  /** */
  extern(C) void function(GtkSearchEntry* entry) nextMatch;

  /** */
  extern(C) void function(GtkSearchEntry* entry) previousMatch;

  /** */
  extern(C) void function(GtkSearchEntry* entry) stopSearch;
}

/** */
struct GtkSelectionData;

/**
    GtkSeparator is a horizontal or vertical separator widget, depending on the
    value of the #GtkOrientable:orientation property, used to group the widgets
    within a window. It displays a line with a shadow to make it appear sunken
    into the interface.
    
    # CSS nodes
    
    GtkSeparator has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
*/
struct GtkSeparator
{
  /** */
  GtkWidget widget;

  /** */
  GtkSeparatorPrivate* priv;
}

/** */
struct GtkSeparatorClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The #GtkSeparatorMenuItem is a separator used to group
    items within a menu. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    # CSS nodes
    
    GtkSeparatorMenuItem has a single CSS node with name separator.
*/
struct GtkSeparatorMenuItem
{
  /** */
  GtkMenuItem menuItem;
}

/** */
struct GtkSeparatorMenuItemClass
{
  /**
      The parent class.
  */
  GtkMenuItemClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSeparatorPrivate;

/**
    A #GtkSeparatorToolItem is a #GtkToolItem that separates groups of other
    #GtkToolItems. Depending on the theme, a #GtkSeparatorToolItem will
    often look like a vertical line on horizontally docked toolbars.
    
    If the #GtkToolbar child property “expand” is true and the property
    #GtkSeparatorToolItem:draw is false, a #GtkSeparatorToolItem will act as
    a “spring” that forces other items to the ends of the toolbar.
    
    Use [gtk.separator_tool_item.SeparatorToolItem.new_] to create a new #GtkSeparatorToolItem.
    
    # CSS nodes
    
    GtkSeparatorToolItem has a single CSS node with name separator.
*/
struct GtkSeparatorToolItem
{
  /** */
  GtkToolItem parent;

  /** */
  GtkSeparatorToolItemPrivate* priv;
}

/** */
struct GtkSeparatorToolItemClass
{
  /**
      The parent class.
  */
  GtkToolItemClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSeparatorToolItemPrivate;

/**
    GtkSettings provide a mechanism to share global settings between
    applications.
    
    On the X window system, this sharing is realized by an
    [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
    manager that is usually part of the desktop environment, along with
    utilities that let the user change these settings. In the absence of
    an Xsettings manager, GTK+ reads default values for settings from
    `settings.ini` files in
    `/etc/gtk-3.0`, `$XDG_CONFIG_DIRS/gtk-3.0`
    and `$XDG_CONFIG_HOME/gtk-3.0`.
    These files must be valid key files (see #GKeyFile), and have
    a section called Settings. Themes can also provide default values
    for settings by installing a `settings.ini` file
    next to their `gtk.css` file.
    
    Applications can override system-wide settings by setting the property
    of the GtkSettings object with [gobject.object.ObjectWrap.set]. This should be restricted
    to special cases though; GtkSettings are not meant as an application
    configuration facility. When doing so, you need to be aware that settings
    that are specific to individual widgets may not be available before the
    widget type has been realized at least once. The following example
    demonstrates a way to do this:
    ```c
      gtk_init (&argc, &argv);
    
      // make sure the type is realized
      g_type_class_unref (g_type_class_ref (GTK_TYPE_IMAGE_MENU_ITEM));
    
      g_object_set (gtk_settings_get_default (), "gtk-enable-animations", FALSE, NULL);
    ```
    
    There is one GtkSettings instance per screen. It can be obtained with
    [gtk.settings.Settings.getForScreen], but in many cases, it is more convenient
    to use [gtk.widget.Widget.getSettings]. [gtk.settings.Settings.getDefault] returns the
    GtkSettings instance for the default screen.
*/
struct GtkSettings
{
  /** */
  GObject parentInstance;

  /** */
  GtkSettingsPrivate* priv;
}

/** */
struct GtkSettingsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSettingsPrivate;

/** */
struct GtkSettingsValue
{
  /**
      Origin should be something like “filename:linenumber” for
         rc files, or e.g. “XProperty” for other sources.
  */
  char* origin;

  /**
      Valid types are LONG, DOUBLE and STRING corresponding to
         the token parsed, or a GSTRING holding an unparsed statement
  */
  GValue value;
}

/**
    #GtkShortcutLabel is a widget that represents a single keyboard shortcut or gesture
    in the user interface.
*/
struct GtkShortcutLabel;

/** */
struct GtkShortcutLabelClass;

/**
    A GtkShortcutsGroup represents a group of related keyboard shortcuts
    or gestures. The group has a title. It may optionally be associated with
    a view of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with #GtkShortcutsWindow.
*/
struct GtkShortcutsGroup;

/** */
struct GtkShortcutsGroupClass;

/**
    A GtkShortcutsSection collects all the keyboard shortcuts and gestures
    for a major application mode. If your application needs multiple sections,
    you should give each section a unique #GtkShortcutsSection:section-name and
    a #GtkShortcutsSection:title that can be shown in the section selector of
    the GtkShortcutsWindow.
    
    The #GtkShortcutsSection:max-height property can be used to influence how
    the groups in the section are distributed over pages and columns.
    
    This widget is only meant to be used with #GtkShortcutsWindow.
*/
struct GtkShortcutsSection;

/** */
struct GtkShortcutsSectionClass;

/**
    A GtkShortcutsShortcut represents a single keyboard shortcut or gesture
    with a short text. This widget is only meant to be used with #GtkShortcutsWindow.
*/
struct GtkShortcutsShortcut;

/** */
struct GtkShortcutsShortcutClass;

/**
    A GtkShortcutsWindow shows brief information about the keyboard shortcuts
    and gestures of an application. The shortcuts can be grouped, and you can
    have multiple sections in this window, corresponding to the major modes of
    your application.
    
    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.
    
    The recommended way to construct a GtkShortcutsWindow is with GtkBuilder,
    by populating a #GtkShortcutsWindow with one or more #GtkShortcutsSection
    objects, which contain #GtkShortcutsGroups that in turn contain objects of
    class #GtkShortcutsShortcut.
    
    # A simple example:
    
    ![](gedit-shortcuts.png)
    
    This example has as single section. As you can see, the shortcut groups
    are arranged in columns, and spread across several pages if there are too
    many to find on a single page.
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-gedit.ui).
    
    # An example with multiple views:
    
    ![](clocks-shortcuts.png)
    
    This example shows a #GtkShortcutsWindow that has been configured to show only
    the shortcuts relevant to the "stopwatch" view.
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-clocks.ui).
    
    # An example with multiple sections:
    
    ![](builder-shortcuts.png)
    
    This example shows a #GtkShortcutsWindow with two sections, "Editor Shortcuts"
    and "Terminal Shortcuts".
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-builder.ui).
*/
struct GtkShortcutsWindow
{
  /** */
  GtkWindow window;
}

/** */
struct GtkShortcutsWindowClass
{
  /** */
  GtkWindowClass parentClass;

  /** */
  extern(C) void function(GtkShortcutsWindow* self) close;

  /** */
  extern(C) void function(GtkShortcutsWindow* self) search;
}

/**
    #GtkSizeGroup provides a mechanism for grouping a number of widgets
    together so they all request the same amount of space.  This is
    typically useful when you want a column of widgets to have the same
    size, but you can’t use a #GtkGrid widget.
    
    In detail, the size requested for each widget in a #GtkSizeGroup is
    the maximum of the sizes that would have been requested for each
    widget in the size group if they were not in the size group. The mode
    of the size group (see [gtk.size_group.SizeGroup.setMode]) determines whether
    this applies to the horizontal size, the vertical size, or both sizes.
    
    Note that size groups only affect the amount of space requested, not
    the size that the widgets finally receive. If you want the widgets in
    a #GtkSizeGroup to actually be the same size, you need to pack them in
    such a way that they get the size they request and not more. For
    example, if you are packing your widgets into a table, you would not
    include the [gtk.types.AttachOptions.Fill] flag.
    
    #GtkSizeGroup objects are referenced by each widget in the size group,
    so once you have added all widgets to a #GtkSizeGroup, you can drop
    the initial reference to the size group with [gobject.object.ObjectWrap.unref]. If the
    widgets in the size group are subsequently destroyed, then they will
    be removed from the size group and drop their references on the size
    group; when all widgets have been removed, the size group will be
    freed.
    
    Widgets can be part of multiple size groups; GTK+ will compute the
    horizontal size of a widget from the horizontal requisition of all
    widgets that can be reached from the widget by a chain of size groups
    of type [gtk.types.SizeGroupMode.Horizontal] or [gtk.types.SizeGroupMode.Both], and the
    vertical size from the vertical requisition of all widgets that can be
    reached from the widget by a chain of size groups of type
    [gtk.types.SizeGroupMode.Vertical] or [gtk.types.SizeGroupMode.Both].
    
    Note that only non-contextual sizes of every widget are ever consulted
    by size groups (since size groups have no knowledge of what size a widget
    will be allocated in one dimension, it cannot derive how much height
    a widget will receive for a given width). When grouping widgets that
    trade height for width in mode [gtk.types.SizeGroupMode.Vertical] or [gtk.types.SizeGroupMode.Both]:
    the height for the minimum width will be the requested height for all
    widgets in the group. The same is of course true when horizontally grouping
    width for height widgets.
    
    Widgets that trade height-for-width should set a reasonably large minimum width
    by way of #GtkLabel:width-chars for instance. Widgets with static sizes as well
    as widgets that grow (such as ellipsizing text) need no such considerations.
    
    # GtkSizeGroup as GtkBuildable
    
    Size groups can be specified in a UI definition by placing an `<object>`
    element with `class="GtkSizeGroup"` somewhere in the UI definition. The
    widgets that belong to the size group are specified by a `<widgets>` element
    that may contain multiple `<widget>` elements, one for each member of the
    size group. The ”name” attribute gives the id of the widget.
    
    An example of a UI definition fragment with GtkSizeGroup:
    
    ```xml
    <object class="GtkSizeGroup">
      <property name="mode">GTK_SIZE_GROUP_HORIZONTAL</property>
      <widgets>
        <widget name="radio1"/>
        <widget name="radio2"/>
      </widgets>
    </object>
    ```
*/
struct GtkSizeGroup
{
  /** */
  GObject parentInstance;

  /** */
  GtkSizeGroupPrivate* priv;
}

/** */
struct GtkSizeGroupClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSizeGroupPrivate;

/**
    Together with #GtkPlug, #GtkSocket provides the ability to embed
    widgets from one process into another process in a fashion that
    is transparent to the user. One process creates a #GtkSocket widget
    and passes that widget’s window ID to the other process, which then
    creates a #GtkPlug with that window ID. Any widgets contained in the
    #GtkPlug then will appear inside the first application’s window.
    
    The socket’s window ID is obtained by using [gtk.socket.Socket.getId].
    Before using this function, the socket must have been realized,
    and for hence, have been added to its parent.
    
    ## Obtaining the window ID of a socket.
    
    ```c
    GtkWidget *socket = gtk_socket_new ();
    gtk_widget_show (socket);
    gtk_container_add (GTK_CONTAINER (parent), socket);
    
    // The following call is only necessary if one of
    // the ancestors of the socket is not yet visible.
    gtk_widget_realize (socket);
    g_print ("The ID of the sockets window is %#x\n",
             gtk_socket_get_id (socket));
    ```
    
    Note that if you pass the window ID of the socket to another
    process that will create a plug in the socket, you must make
    sure that the socket widget is not destroyed until that plug
    is created. Violating this rule will cause unpredictable
    consequences, the most likely consequence being that the plug
    will appear as a separate toplevel window. You can check if
    the plug has been created by using [gtk.socket.Socket.getPlugWindow].
    If it returns a non-null value, then the plug has been
    successfully created inside of the socket.
    
    When GTK+ is notified that the embedded window has been destroyed,
    then it will destroy the socket as well. You should always,
    therefore, be prepared for your sockets to be destroyed at any
    time when the main event loop is running. To prevent this from
    happening, you can connect to the #GtkSocket::plug-removed signal.
    
    The communication between a #GtkSocket and a #GtkPlug follows the
    [XEmbed Protocol](http://www.freedesktop.org/Standards/xembed-spec).
    This protocol has also been implemented in other toolkits, e.g. Qt,
    allowing the same level of integration when embedding a Qt widget
    in GTK or vice versa.
    
    The #GtkPlug and #GtkSocket widgets are only available when GTK+
    is compiled for the X11 platform and `GDK_WINDOWING_X11` is defined.
    They can only be used on a #GdkX11Display. To use #GtkPlug and
    #GtkSocket, you need to include the `gtk/gtkx.h` header.
*/
struct GtkSocket
{
  /** */
  GtkContainer container;

  /** */
  GtkSocketPrivate* priv;
}

/** */
struct GtkSocketAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkSocketAccessiblePrivate* priv;
}

/** */
struct GtkSocketAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkSocketAccessiblePrivate;

/** */
struct GtkSocketClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkSocket* socket) plugAdded;

  /** */
  extern(C) gboolean function(GtkSocket* socket) plugRemoved;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSocketPrivate;

/**
    A #GtkSpinButton is an ideal way to allow the user to set the value of
    some attribute. Rather than having to directly type a number into a
    #GtkEntry, GtkSpinButton allows the user to click on one of two arrows
    to increment or decrement the displayed value. A value can still be
    typed in, with the bonus that it can be checked to ensure it is in a
    given range.
    
    The main properties of a GtkSpinButton are through an adjustment.
    See the #GtkAdjustment section for more details about an adjustment's
    properties. Note that GtkSpinButton will by default make its entry
    large enough to accomodate the lower and upper bounds of the adjustment,
    which can lead to surprising results. Best practice is to set both
    the #GtkEntry:width-chars and #GtkEntry:max-width-chars poperties
    to the desired number of characters to display in the entry.
    
    # CSS nodes
    
    ```plain
    spinbutton.horizontal
    ├── undershoot.left
    ├── undershoot.right
    ├── entry
    │   ╰── ...
    ├── button.down
    ╰── button.up
    ```
    
    ```plain
    spinbutton.vertical
    ├── undershoot.left
    ├── undershoot.right
    ├── button.up
    ├── entry
    │   ╰── ...
    ╰── button.down
    ```
    
    GtkSpinButtons main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The GtkEntry subnodes (if present) are put
    below the entry node. The orientation of the spin button is reflected in
    the .vertical or .horizontal style class on the main node.
    
    ## Using a GtkSpinButton to get an integer
    
    ```c
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.
    
    gint
    grab_int_value (GtkSpinButton *button,
                    gpointer       user_data)
    {
      return gtk_spin_button_get_value_as_int (button);
    }
    
    void
    create_integer_spin_button (void)
    {
    
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;
    
      adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      gtk_container_set_border_width (GTK_CONTAINER (window), 5);
    
      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_container_add (GTK_CONTAINER (window), button);
    
      gtk_widget_show_all (window);
    }
    ```
    
    ## Using a GtkSpinButton to get a floating point value
    
    ```c
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.
    
    gfloat
    grab_float_value (GtkSpinButton *button,
                      gpointer       user_data)
    {
      return gtk_spin_button_get_value (button);
    }
    
    void
    create_floating_spin_button (void)
    {
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;
    
      adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      gtk_container_set_border_width (GTK_CONTAINER (window), 5);
    
      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_container_add (GTK_CONTAINER (window), button);
    
      gtk_widget_show_all (window);
    }
    ```
*/
struct GtkSpinButton
{
  /** */
  GtkEntry entry;

  /** */
  GtkSpinButtonPrivate* priv;
}

/** */
struct GtkSpinButtonAccessible
{
  /** */
  GtkEntryAccessible parent;

  /** */
  GtkSpinButtonAccessiblePrivate* priv;
}

/** */
struct GtkSpinButtonAccessibleClass
{
  /** */
  GtkEntryAccessibleClass parentClass;
}

/** */
struct GtkSpinButtonAccessiblePrivate;

/** */
struct GtkSpinButtonClass
{
  /** */
  GtkEntryClass parentClass;

  /** */
  extern(C) int function(GtkSpinButton* spinButton, double* newValue) input;

  /** */
  extern(C) int function(GtkSpinButton* spinButton) output;

  /** */
  extern(C) void function(GtkSpinButton* spinButton) valueChanged;

  /** */
  extern(C) void function(GtkSpinButton* spinButton, GtkScrollType scroll) changeValue;

  /** */
  extern(C) void function(GtkSpinButton* spinButton) wrapped;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSpinButtonPrivate;

/**
    A GtkSpinner widget displays an icon-size spinning animation.
    It is often used as an alternative to a #GtkProgressBar for
    displaying indefinite activity, instead of actual progress.
    
    To start the animation, use [gtk.spinner.Spinner.start], to stop it
    use [gtk.spinner.Spinner.stop].
    
    # CSS nodes
    
    GtkSpinner has a single CSS node with the name spinner. When the animation is
    active, the :checked pseudoclass is added to this node.
*/
struct GtkSpinner
{
  /** */
  GtkWidget parent;

  /** */
  GtkSpinnerPrivate* priv;
}

/** */
struct GtkSpinnerAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkSpinnerAccessiblePrivate* priv;
}

/** */
struct GtkSpinnerAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkSpinnerAccessiblePrivate;

/** */
struct GtkSpinnerClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkSpinnerPrivate;

/**
    The GtkStack widget is a container which only shows
    one of its children at a time. In contrast to GtkNotebook,
    GtkStack does not provide a means for users to change the
    visible child. Instead, the #GtkStackSwitcher widget can be
    used with GtkStack to provide this functionality.
    
    Transitions between pages can be animated as slides or
    fades. This can be controlled with [gtk.stack.Stack.setTransitionType].
    These animations respect the #GtkSettings:gtk-enable-animations
    setting.
    
    The GtkStack widget was added in GTK+ 3.10.
    
    # CSS nodes
    
    GtkStack has a single CSS node named stack.
*/
struct GtkStack
{
  /** */
  GtkContainer parentInstance;
}

/** */
struct GtkStackAccessible
{
  /** */
  GtkContainerAccessible parent;
}

/** */
struct GtkStackAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkStackClass
{
  /** */
  GtkContainerClass parentClass;
}

/**
    A GtkStackSidebar enables you to quickly and easily provide a
    consistent "sidebar" object for your user interface.
    
    In order to use a GtkStackSidebar, you simply use a GtkStack to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gtk.stack_sidebar.StackSidebar.setStack] to connect the #GtkStackSidebar
    to the #GtkStack.
    
    # CSS nodes
    
    GtkStackSidebar has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, GtkStackSidebar adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
struct GtkStackSidebar
{
  /** */
  GtkBin parent;
}

/** */
struct GtkStackSidebarClass
{
  /** */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkStackSidebarPrivate;

/**
    The GtkStackSwitcher widget acts as a controller for a
    #GtkStack; it shows a row of buttons to switch between
    the various pages of the associated stack widget.
    
    All the content for the buttons comes from the child properties
    of the #GtkStack; the button visibility in a #GtkStackSwitcher
    widget is controlled by the visibility of the child in the
    #GtkStack.
    
    It is possible to associate multiple #GtkStackSwitcher widgets
    with the same #GtkStack widget.
    
    The GtkStackSwitcher widget was added in 3.10.
    
    # CSS nodes
    
    GtkStackSwitcher has a single CSS node named stackswitcher and
    style class .stack-switcher.
    
    When circumstances require it, GtkStackSwitcher adds the
    .needs-attention style class to the widgets representing the
    stack pages.
*/
struct GtkStackSwitcher
{
  /** */
  GtkBox widget;
}

/** */
struct GtkStackSwitcherClass
{
  /** */
  GtkBoxClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    The “system tray” or notification area is normally used for transient icons
    that indicate some special state. For example, a system tray icon might
    appear to tell the user that they have new mail, or have an incoming instant
    message, or something along those lines. The basic idea is that creating an
    icon in the notification area is less annoying than popping up a dialog.
    
    A #GtkStatusIcon object can be used to display an icon in a “system tray”.
    The icon can have a tooltip, and the user can interact with it by
    activating it or popping up a context menu.
    
    It is very important to notice that status icons depend on the existence
    of a notification area being available to the user; you should not use status
    icons as the only way to convey critical information regarding your application,
    as the notification area may not exist on the user's environment, or may have
    been removed. You should always check that a status icon has been embedded into
    a notification area by using [gtk.status_icon.StatusIcon.isEmbedded], and gracefully
    recover if the function returns false.
    
    On X11, the implementation follows the
    [FreeDesktop System Tray Specification](http://www.freedesktop.org/wiki/Specifications/systemtray-spec).
    Implementations of the “tray” side of this specification can
    be found e.g. in the GNOME 2 and KDE panel applications.
    
    Note that a GtkStatusIcon is not a widget, but just a #GObject. Making it a
    widget would be impractical, since the system tray on Windows doesn’t allow
    to embed arbitrary widgets.
    
    GtkStatusIcon has been deprecated in 3.14. You should consider using
    notifications or more modern platform-specific APIs instead. GLib provides
    the #GNotification API which works well with #GtkApplication on multiple
    platforms and environments, and should be the preferred mechanism to notify
    the users of transient status updates. See this [HowDoI](https://wiki.gnome.org/HowDoI/GNotification)
    for code examples.
*/
struct GtkStatusIcon
{
  /** */
  GObject parentInstance;

  /** */
  GtkStatusIconPrivate* priv;
}

/** */
struct GtkStatusIconClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkStatusIcon* statusIcon) activate;

  /** */
  extern(C) void function(GtkStatusIcon* statusIcon, uint button, uint activateTime) popupMenu;

  /** */
  extern(C) gboolean function(GtkStatusIcon* statusIcon, int size) sizeChanged;

  /** */
  extern(C) gboolean function(GtkStatusIcon* statusIcon, GdkEventButton* event) buttonPressEvent;

  /** */
  extern(C) gboolean function(GtkStatusIcon* statusIcon, GdkEventButton* event) buttonReleaseEvent;

  /** */
  extern(C) gboolean function(GtkStatusIcon* statusIcon, GdkEventScroll* event) scrollEvent;

  /** */
  extern(C) gboolean function(GtkStatusIcon* statusIcon, int x, int y, gboolean keyboardMode, GtkTooltip* tooltip) queryTooltip;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkStatusIconPrivate;

/**
    A #GtkStatusbar is usually placed along the bottom of an application's
    main #GtkWindow. It may provide a regular commentary of the application's
    status (as is usually the case in a web browser, for example), or may be
    used to simply output a message when the status changes, (when an upload
    is complete in an FTP client, for example).
    
    Status bars in GTK+ maintain a stack of messages. The message at
    the top of the each bar’s stack is the one that will currently be displayed.
    
    Any messages added to a statusbar’s stack must specify a
    context id that is used to uniquely identify
    the source of a message. This context id can be generated by
    [gtk.statusbar.Statusbar.getContextId], given a message and the statusbar that
    it will be added to. Note that messages are stored in a stack, and when
    choosing which message to display, the stack structure is adhered to,
    regardless of the context identifier of a message.
    
    One could say that a statusbar maintains one stack of messages for
    display purposes, but allows multiple message producers to maintain
    sub-stacks of the messages they produced (via context ids).
    
    Status bars are created using [gtk.statusbar.Statusbar.new_].
    
    Messages are added to the bar’s stack with [gtk.statusbar.Statusbar.push].
    
    The message at the top of the stack can be removed using
    [gtk.statusbar.Statusbar.pop]. A message can be removed from anywhere in the
    stack if its message id was recorded at the time it was added. This
    is done using [gtk.statusbar.Statusbar.remove].
    
    # CSS node
    
    GtkStatusbar has a single CSS node with name statusbar.
*/
struct GtkStatusbar
{
  /** */
  GtkBox parentWidget;

  /** */
  GtkStatusbarPrivate* priv;
}

/** */
struct GtkStatusbarAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkStatusbarAccessiblePrivate* priv;
}

/** */
struct GtkStatusbarAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkStatusbarAccessiblePrivate;

/** */
struct GtkStatusbarClass
{
  /** */
  GtkBoxClass parentClass;

  /** */
  void* reserved;

  /** */
  extern(C) void function(GtkStatusbar* statusbar, uint contextId, const(char)* text) textPushed;

  /** */
  extern(C) void function(GtkStatusbar* statusbar, uint contextId, const(char)* text) textPopped;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkStatusbarPrivate;

/** */
struct GtkStockItem
{
  /**
      Identifier.
  */
  char* stockId;

  /**
      User visible label.
  */
  char* label;

  /**
      Modifier type for keyboard accelerator
  */
  GdkModifierType modifier;

  /**
      Keyboard accelerator
  */
  uint keyval;

  /**
      Translation domain of the menu or toolbar item
  */
  char* translationDomain;
}

/**
    A #GtkStyle object encapsulates the information that provides the look and
    feel for a widget.
    
    > In GTK+ 3.0, GtkStyle has been deprecated and replaced by
    > #GtkStyleContext.
    
    Each #GtkWidget has an associated #GtkStyle object that is used when
    rendering that widget. Also, a #GtkStyle holds information for the five
    possible widget states though not every widget supports all five
    states; see #GtkStateType.
    
    Usually the #GtkStyle for a widget is the same as the default style that
    is set by GTK+ and modified the theme engine.
    
    Usually applications should not need to use or modify the #GtkStyle of
    their widgets.
*/
struct GtkStyle
{
  /** */
  GObject parentInstance;

  /**
      Set of foreground #GdkColor
  */
  GdkColor[5] fg;

  /**
      Set of background #GdkColor
  */
  GdkColor[5] bg;

  /**
      Set of light #GdkColor
  */
  GdkColor[5] light;

  /**
      Set of dark #GdkColor
  */
  GdkColor[5] dark;

  /**
      Set of mid #GdkColor
  */
  GdkColor[5] mid;

  /**
      Set of text #GdkColor
  */
  GdkColor[5] text;

  /**
      Set of base #GdkColor
  */
  GdkColor[5] base;

  /**
      Color halfway between text/base
  */
  GdkColor[5] textAa;

  /**
      #GdkColor to use for black
  */
  GdkColor black;

  /**
      #GdkColor to use for white
  */
  GdkColor white;

  /**
      #PangoFontDescription
  */
  PangoFontDescription* fontDesc;

  /**
      Thickness in X direction
  */
  int xthickness;

  /**
      Thickness in Y direction
  */
  int ythickness;

  /**
      Set of background #cairo_pattern_t
  */
  cairo_pattern_t*[5] background;

  /** */
  int attachCount;

  /** */
  GdkVisual* visual;

  /** */
  PangoFontDescription* privateFontDesc;

  /** */
  GtkRcStyle* rcStyle;

  /** */
  GSList* styles;

  /** */
  GArray* propertyCache;

  /** */
  GSList* iconFactories;
}

/** */
struct GtkStyleClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkStyle* style) realize;

  /** */
  extern(C) void function(GtkStyle* style) unrealize;

  /** */
  extern(C) void function(GtkStyle* style, GtkStyle* src) copy;

  /** */
  extern(C) GtkStyle* function(GtkStyle* style) clone;

  /** */
  extern(C) void function(GtkStyle* style, GtkRcStyle* rcStyle) initFromRc;

  /** */
  extern(C) void function(GtkStyle* style, GdkWindow* window, GtkStateType stateType) setBackground;

  /** */
  extern(C) GdkPixbuf* function(GtkStyle* style, const(GtkIconSource)* source, GtkTextDirection direction, GtkStateType state, GtkIconSize size, GtkWidget* widget, const(char)* detail) renderIcon;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x1, int x2, int y) drawHline;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int y1, int y2, int x) drawVline;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawShadow;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, GtkArrowType arrowType, gboolean fill, int x, int y, int width, int height) drawArrow;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawDiamond;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawBox;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawFlatBox;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawCheck;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawOption;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawTab;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide, int gapX, int gapWidth) drawShadowGap;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide, int gapX, int gapWidth) drawBoxGap;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkPositionType gapSide) drawExtension;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height) drawFocus;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkOrientation orientation) drawSlider;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkShadowType shadowType, GtkWidget* widget, const(char)* detail, int x, int y, int width, int height, GtkOrientation orientation) drawHandle;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, int x, int y, GtkExpanderStyle expanderStyle) drawExpander;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, gboolean useText, GtkWidget* widget, const(char)* detail, int x, int y, PangoLayout* layout) drawLayout;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, GdkWindowEdge edge, int x, int y, int width, int height) drawResizeGrip;

  /** */
  extern(C) void function(GtkStyle* style, cairo_t* cr, GtkStateType stateType, GtkWidget* widget, const(char)* detail, uint step, int x, int y, int width, int height) drawSpinner;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;

  /** */
  extern(C) void function() GtkReserved9;

  /** */
  extern(C) void function() GtkReserved10;

  /** */
  extern(C) void function() GtkReserved11;
}

/**
    #GtkStyleContext is an object that stores styling information affecting
    a widget defined by #GtkWidgetPath.
    
    In order to construct the final style information, #GtkStyleContext
    queries information from all attached #GtkStyleProviders. Style providers
    can be either attached explicitly to the context through
    [gtk.style_context.StyleContext.addProvider], or to the screen through
    [gtk.style_context.StyleContext.addProviderForScreen]. The resulting style is a
    combination of all providers’ information in priority order.
    
    For GTK+ widgets, any #GtkStyleContext returned by
    [gtk.widget.Widget.getStyleContext] will already have a #GtkWidgetPath, a
    #GdkScreen and RTL/LTR information set. The style context will also be
    updated automatically if any of these settings change on the widget.
    
    If you are using the theming layer standalone, you will need to set a
    widget path and a screen yourself to the created style context through
    [gtk.style_context.StyleContext.setPath] and possibly [gtk.style_context.StyleContext.setScreen]. See
    the “Foreign drawing“ example in gtk3-demo.
    
    # Style Classes # {#gtkstylecontext-classes}
    
    Widgets can add style classes to their context, which can be used to associate
    different styles by class. The documentation for individual widgets lists
    which style classes it uses itself, and which style classes may be added by
    applications to affect their appearance.
    
    GTK+ defines macros for a number of style classes.
    
    # Style Regions
    
    Widgets can also add regions with flags to their context. This feature is
    deprecated and will be removed in a future GTK+ update. Please use style
    classes instead.
    
    GTK+ defines macros for a number of style regions.
    
    # Custom styling in UI libraries and applications
    
    If you are developing a library with custom #GtkWidgets that
    render differently than standard components, you may need to add a
    #GtkStyleProvider yourself with the `GTK_STYLE_PROVIDER_PRIORITY_FALLBACK`
    priority, either a #GtkCssProvider or a custom object implementing the
    #GtkStyleProvider interface. This way themes may still attempt
    to style your UI elements in a different way if needed so.
    
    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use
    a #GtkStyleProvider with the `GTK_STYLE_PROVIDER_PRIORITY_APPLICATION`
    priority, keep in mind that the user settings in
    `XDG_CONFIG_HOME/gtk-3.0/gtk.css` will
    still take precedence over your changes, as it uses the
    `GTK_STYLE_PROVIDER_PRIORITY_USER` priority.
*/
struct GtkStyleContext
{
  /** */
  GObject parentObject;

  /** */
  GtkStyleContextPrivate* priv;
}

/** */
struct GtkStyleContextClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkStyleContext* context) changed;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkStyleContextPrivate;

/**
    GtkStyleProperties provides the storage for style information
    that is used by #GtkStyleContext and other #GtkStyleProvider
    implementations.
    
    Before style properties can be stored in GtkStyleProperties, they
    must be registered with [gtk.style_properties.StyleProperties.registerProperty].
    
    Unless you are writing a #GtkStyleProvider implementation, you
    are unlikely to use this API directly, as [gtk.style_context.StyleContext.get]
    and its variants are the preferred way to access styling information
    from widget implementations and theming engine implementations
    should use the APIs provided by #GtkThemingEngine instead.
    
    #GtkStyleProperties has been deprecated in GTK 3.16. The CSS
    machinery does not use it anymore and all users of this object
    have been deprecated.
*/
struct GtkStyleProperties
{
  /** */
  GObject parentObject;

  /** */
  GtkStylePropertiesPrivate* priv;
}

/** */
struct GtkStylePropertiesClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkStylePropertiesPrivate;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gtk.style_context.StyleContext.addProvider] and [gtk.style_context.StyleContext.addProviderForScreen].
*/
struct GtkStyleProvider;

/** */
struct GtkStyleProviderIface
{
  /** */
  GTypeInterface gIface;

  /**
      Gets a set of style information that applies to a widget path.
  */
  extern(C) GtkStyleProperties* function(GtkStyleProvider* provider, GtkWidgetPath* path) getStyle;

  /**
      Gets the value of a widget style property that applies to a widget path.
  */
  extern(C) gboolean function(GtkStyleProvider* provider, GtkWidgetPath* path, GtkStateFlags state, GParamSpec* pspec, GValue* value) getStyleProperty;

  /**
      Gets the icon factory that applies to a widget path.
  */
  extern(C) GtkIconFactory* function(GtkStyleProvider* provider, GtkWidgetPath* path) getIconFactory;
}

/**
    #GtkSwitch is a widget that has two states: on or off. The user can control
    which state should be active by clicking the empty area, or by dragging the
    handle.
    
    GtkSwitch can also handle situations where the underlying state changes with
    a delay. See #GtkSwitch::state-set for details.
    
    # CSS nodes
    
    ```plain
    switch
    ╰── slider
    ```
    
    GtkSwitch has two css nodes, the main node with the name switch and a subnode
    named slider. Neither of them is using any style classes.
*/
struct GtkSwitch
{
  /** */
  GtkWidget parentInstance;

  /** */
  GtkSwitchPrivate* priv;
}

/** */
struct GtkSwitchAccessible
{
  /** */
  GtkWidgetAccessible parent;

  /** */
  GtkSwitchAccessiblePrivate* priv;
}

/** */
struct GtkSwitchAccessibleClass
{
  /** */
  GtkWidgetAccessibleClass parentClass;
}

/** */
struct GtkSwitchAccessiblePrivate;

/** */
struct GtkSwitchClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /**
      An action signal and emitting it causes the switch to animate.
  */
  extern(C) void function(GtkSwitch* sw) activate;

  /**
      Class handler for the ::state-set signal.
  */
  extern(C) gboolean function(GtkSwitch* sw, gboolean state) stateSet;

  /** */
  extern(C) void function() SwitchPadding1;

  /** */
  extern(C) void function() SwitchPadding2;

  /** */
  extern(C) void function() SwitchPadding3;

  /** */
  extern(C) void function() SwitchPadding4;

  /** */
  extern(C) void function() SwitchPadding5;
}

/** */
struct GtkSwitchPrivate;

/**
    GtkSymbolicColor is a boxed type that represents a symbolic color.
    It is the result of parsing a
    [color expression][gtkcssprovider-symbolic-colors].
    To obtain the color represented by a GtkSymbolicColor, it has to
    be resolved with [gtk.symbolic_color.SymbolicColor.resolve], which replaces all
    symbolic color references by the colors they refer to (in a given
    context) and evaluates mix, shade and other expressions, resulting
    in a #GdkRGBA value.
    
    It is not normally necessary to deal directly with #GtkSymbolicColors,
    since they are mostly used behind the scenes by #GtkStyleContext and
    #GtkCssProvider.
    
    #GtkSymbolicColor is deprecated. Symbolic colors are considered an
    implementation detail of GTK+.
*/
struct GtkSymbolicColor;

/**
    The #GtkTable functions allow the programmer to arrange widgets in rows and
    columns, making it easy to align many widgets next to each other,
    horizontally and vertically.
    
    Tables are created with a call to [gtk.table.Table.new_], the size of which can
    later be changed with [gtk.table.Table.resize].
    
    Widgets can be added to a table using [gtk.table.Table.attach] or the more
    convenient (but slightly less flexible) [gtk.table.Table.attachDefaults].
    
    To alter the space next to a specific row, use [gtk.table.Table.setRowSpacing],
    and for a column, [gtk.table.Table.setColSpacing].
    The gaps between all rows or columns can be changed by
    calling [gtk.table.Table.setRowSpacings] or [gtk.table.Table.setColSpacings]
    respectively. Note that spacing is added between the
    children, while padding added by [gtk.table.Table.attach] is added on
    either side of the widget it belongs to.
    
    [gtk.table.Table.setHomogeneous], can be used to set whether all cells in the
    table will resize themselves to the size of the largest widget in the table.
    
    > #GtkTable has been deprecated. Use #GtkGrid instead. It provides the same
    > capabilities as GtkTable for arranging widgets in a rectangular grid, but
    > does support height-for-width geometry management.
*/
struct GtkTable
{
  /** */
  GtkContainer container;

  /** */
  GtkTablePrivate* priv;
}

/** */
struct GtkTableChild
{
  /** */
  GtkWidget* widget;

  /** */
  ushort leftAttach;

  /** */
  ushort rightAttach;

  /** */
  ushort topAttach;

  /** */
  ushort bottomAttach;

  /** */
  ushort xpadding;

  /** */
  ushort ypadding;

  /** */
  uint xexpand;

  /** */
  uint yexpand;

  /** */
  uint xshrink;

  /** */
  uint yshrink;

  /** */
  uint xfill;

  /** */
  uint yfill;
}

/** */
struct GtkTableClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTablePrivate;

/** */
struct GtkTableRowCol
{
  /** */
  ushort requisition;

  /** */
  ushort allocation;

  /** */
  ushort spacing;

  /** */
  uint needExpand;

  /** */
  uint needShrink;

  /** */
  uint expand;

  /** */
  uint shrink;

  /** */
  uint empty;
}

/**
    A #GtkTargetEntry represents a single type of
    data than can be supplied for by a widget for a selection
    or for supplied or received during drag-and-drop.
*/
struct GtkTargetEntry
{
  /**
      a string representation of the target type
  */
  char* target;

  /**
      #GtkTargetFlags for DND
  */
  uint flags;

  /**
      an application-assigned integer ID which will
          get passed as a parameter to e.g the #GtkWidget::selection-get
          signal. It allows the application to identify the target
          type without extensive string compares.
  */
  uint info;
}

/**
    A #GtkTargetList-struct is a reference counted list
    of #GtkTargetPair and should be treated as
    opaque.
*/
struct GtkTargetList;

/**
    A #GtkTargetPair is used to represent the same
    information as a table of #GtkTargetEntry, but in
    an efficient form.
*/
struct GtkTargetPair
{
  /**
      #GdkAtom representation of the target type
  */
  GdkAtom target;

  /**
      #GtkTargetFlags for DND
  */
  uint flags;

  /**
      an application-assigned integer ID which will
          get passed as a parameter to e.g the #GtkWidget::selection-get
          signal. It allows the application to identify the target
          type without extensive string compares.
  */
  uint info;
}

/**
    A #GtkTearoffMenuItem is a special #GtkMenuItem which is used to
    tear off and reattach its menu.
    
    When its menu is shown normally, the #GtkTearoffMenuItem is drawn as a
    dotted line indicating that the menu can be torn off.  Activating it
    causes its menu to be torn off and displayed in its own window
    as a tearoff menu.
    
    When its menu is shown as a tearoff menu, the #GtkTearoffMenuItem is drawn
    as a dotted line which has a left pointing arrow graphic indicating that
    the tearoff menu can be reattached.  Activating it will erase the tearoff
    menu window.
    
    > #GtkTearoffMenuItem is deprecated and should not be used in newly
    > written code. Menus are not meant to be torn around.
*/
struct GtkTearoffMenuItem
{
  /** */
  GtkMenuItem menuItem;

  /** */
  GtkTearoffMenuItemPrivate* priv;
}

/** */
struct GtkTearoffMenuItemClass
{
  /**
      The parent class.
  */
  GtkMenuItemClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTearoffMenuItemPrivate;

/** */
struct GtkTextAppearance
{
  /**
      Background #GdkColor.
  */
  GdkColor bgColor;

  /**
      Foreground #GdkColor.
  */
  GdkColor fgColor;

  /**
      Super/subscript rise, can be negative.
  */
  int rise;

  /**
      #PangoUnderline
  */
  uint underline;

  /**
      Strikethrough style
  */
  uint strikethrough;

  /**
      Whether to use background-related values; this is
        irrelevant for the values struct when in a tag, but is used for
        the composite values struct; it’s true if any of the tags being
        composited had background stuff set.
  */
  uint drawBg;

  /**
      This are only used when we are actually laying
        out and rendering a paragraph; not when a #GtkTextAppearance is
        part of a #GtkTextAttributes.
  */
  uint insideSelection;

  /**
      This are only used when we are actually laying
        out and rendering a paragraph; not when a #GtkTextAppearance is
        part of a #GtkTextAttributes.
  */
  uint isText;

  /** */
  /** */
  union
  {
    /** */
    GdkRGBA*[2] rgba;

    /** */
    uint[4] padding;
  }

}

/**
    Using #GtkTextAttributes directly should rarely be necessary.
    It’s primarily useful with [gtk.text_iter.TextIter.getAttributes].
    As with most GTK+ structs, the fields in this struct should only
    be read, never modified directly.
*/
struct GtkTextAttributes
{
  /** */
  uint refcount;

  /**
      #GtkTextAppearance for text.
  */
  GtkTextAppearance appearance;

  /**
      #GtkJustification for text.
  */
  GtkJustification justification;

  /**
      #GtkTextDirection for text.
  */
  GtkTextDirection direction;

  /**
      #PangoFontDescription for text.
  */
  PangoFontDescription* font;

  /**
      Font scale factor.
  */
  double fontScale;

  /**
      Width of the left margin in pixels.
  */
  int leftMargin;

  /**
      Width of the right margin in pixels.
  */
  int rightMargin;

  /**
      Amount to indent the paragraph, in pixels.
  */
  int indent;

  /**
      Pixels of blank space above paragraphs.
  */
  int pixelsAboveLines;

  /**
      Pixels of blank space below paragraphs.
  */
  int pixelsBelowLines;

  /**
      Pixels of blank space between wrapped lines in
        a paragraph.
  */
  int pixelsInsideWrap;

  /**
      Custom #PangoTabArray for this text.
  */
  PangoTabArray* tabs;

  /**
      #GtkWrapMode for text.
  */
  GtkWrapMode wrapMode;

  /**
      #PangoLanguage for text.
  */
  PangoLanguage* language;

  /** */
  GdkColor* pgBgColor;

  /**
      Hide the text.
  */
  uint invisible;

  /**
      Background is fit to full line height rather than
         baseline +/- ascent/descent (font height).
  */
  uint bgFullHeight;

  /**
      Can edit this text.
  */
  uint editable;

  /**
      Whether to disable font fallback.
  */
  uint noFallback;

  /** */
  GdkRGBA* pgBgRgba;

  /**
      Extra space to insert between graphemes, in Pango units
  */
  int letterSpacing;

  /** */
  /** */
  union
  {
    /** */
    char* fontFeatures;

    /** */
    uint[2] padding;
  }

}

/** */
struct GtkTextBTree;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
*/
struct GtkTextBuffer
{
  /** */
  GObject parentInstance;

  /** */
  GtkTextBufferPrivate* priv;
}

/** */
struct GtkTextBufferClass
{
  /**
      The object class structure needs to be the first.
  */
  GObjectClass parentClass;

  /**
      The class handler for the #GtkTextBuffer::insert-text signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* pos, const(char)* newText, int newTextLength) insertText;

  /**
      The class handler for the #GtkTextBuffer::insert-pixbuf
        signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* iter, GdkPixbuf* pixbuf) insertPixbuf;

  /**
      The class handler for the
        #GtkTextBuffer::insert-child-anchor signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* iter, GtkTextChildAnchor* anchor) insertChildAnchor;

  /**
      The class handler for the #GtkTextBuffer::delete-range signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* start, GtkTextIter* end) deleteRange;

  /**
      The class handler for the #GtkTextBuffer::changed signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) changed;

  /**
      The class handler for the #GtkTextBuffer::modified-changed
        signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) modifiedChanged;

  /**
      The class handler for the #GtkTextBuffer::mark-set signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, const(GtkTextIter)* location, GtkTextMark* mark) markSet;

  /**
      The class handler for the #GtkTextBuffer::mark-deleted signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextMark* mark) markDeleted;

  /**
      The class handler for the #GtkTextBuffer::apply-tag signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) applyTag;

  /**
      The class handler for the #GtkTextBuffer::remove-tag signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) removeTag;

  /**
      The class handler for the
        #GtkTextBuffer::begin-user-action signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) beginUserAction;

  /**
      The class handler for the #GtkTextBuffer::end-user-action
        signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) endUserAction;

  /**
      The class handler for the #GtkTextBuffer::paste-done signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkClipboard* clipboard) pasteDone;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTextBufferPrivate;

/** */
struct GtkTextCellAccessible
{
  /** */
  GtkRendererCellAccessible parent;

  /** */
  GtkTextCellAccessiblePrivate* priv;
}

/** */
struct GtkTextCellAccessibleClass
{
  /** */
  GtkRendererCellAccessibleClass parentClass;
}

/** */
struct GtkTextCellAccessiblePrivate;

/**
    A #GtkTextChildAnchor is a spot in the buffer where child widgets can
    be “anchored” (inserted inline, as if they were characters). The anchor
    can have multiple widgets anchored, to allow for multiple views.
*/
struct GtkTextChildAnchor
{
  /** */
  GObject parentInstance;

  /** */
  void* segment;
}

/** */
struct GtkTextChildAnchorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
*/
struct GtkTextIter
{
  /** */
  void* dummy1;

  /** */
  void* dummy2;

  /** */
  int dummy3;

  /** */
  int dummy4;

  /** */
  int dummy5;

  /** */
  int dummy6;

  /** */
  int dummy7;

  /** */
  int dummy8;

  /** */
  void* dummy9;

  /** */
  void* dummy10;

  /** */
  int dummy11;

  /** */
  int dummy12;

  /** */
  int dummy13;

  /** */
  void* dummy14;
}

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
    
    A #GtkTextMark is like a bookmark in a text buffer; it preserves a position in
    the text. You can convert the mark to an iterator using
    [gtk.text_buffer.TextBuffer.getIterAtMark]. Unlike iterators, marks remain valid across
    buffer mutations, because their behavior is defined when text is inserted or
    deleted. When text containing a mark is deleted, the mark remains in the
    position originally occupied by the deleted text. When text is inserted at a
    mark, a mark with “left gravity” will be moved to the
    beginning of the newly-inserted text, and a mark with “right
    gravity” will be moved to the end.
    
    Note that “left” and “right” here refer to logical direction (left
    is the toward the start of the buffer); in some languages such as
    Hebrew the logically-leftmost text is not actually on the left when
    displayed.
    
    Marks are reference counted, but the reference count only controls the validity
    of the memory; marks can be deleted from the buffer at any time with
    [gtk.text_buffer.TextBuffer.deleteMark]. Once deleted from the buffer, a mark is
    essentially useless.
    
    Marks optionally have names; these can be convenient to avoid passing the
    #GtkTextMark object around.
    
    Marks are typically created using the [gtk.text_buffer.TextBuffer.createMark] function.
*/
struct GtkTextMark
{
  /** */
  GObject parentInstance;

  /** */
  void* segment;
}

/** */
struct GtkTextMarkClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and
    data types related to the text widget and how they work together.
    
    Tags should be in the #GtkTextTagTable for a given #GtkTextBuffer
    before using them with that buffer.
    
    [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
    See “gtk3-demo” for numerous examples.
    
    For each property of #GtkTextTag, there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect
    whether a property has been set or not.
    They are maintained by GTK+ and you should not set them independently.
*/
struct GtkTextTag
{
  /** */
  GObject parentInstance;

  /** */
  GtkTextTagPrivate* priv;
}

/** */
struct GtkTextTagClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GtkTextTag* tag, GObject* eventObject, GdkEvent* event, const(GtkTextIter)* iter) event;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTextTagPrivate;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and
    data types related to the text widget and how they work together.
    
    # GtkTextTagTables as GtkBuildable
    
    The GtkTextTagTable implementation of the GtkBuildable interface
    supports adding tags by specifying “tag” as the “type” attribute
    of a `<child>` element.
    
    An example of a UI definition fragment specifying tags:
    
    ```xml
    <object class="GtkTextTagTable">
     <child type="tag">
       <object class="GtkTextTag"/>
     </child>
    </object>
    ```
*/
struct GtkTextTagTable
{
  /** */
  GObject parentInstance;

  /** */
  GtkTextTagTablePrivate* priv;
}

/** */
struct GtkTextTagTableClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkTextTagTable* table, GtkTextTag* tag, gboolean sizeChanged) tagChanged;

  /** */
  extern(C) void function(GtkTextTagTable* table, GtkTextTag* tag) tagAdded;

  /** */
  extern(C) void function(GtkTextTagTable* table, GtkTextTag* tag) tagRemoved;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTextTagTablePrivate;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and data
    types related to the text widget and how they work together.
    
    # CSS nodes
    
    ```plain
    textview.view
    ├── border.top
    ├── border.left
    ├── text
    │   ╰── [selection]
    ├── border.right
    ├── border.bottom
    ╰── [window.popup]
    ```
    
    GtkTextView has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area,
    with names border and text, respectively. The border nodes each get
    one of the style classes .left, .right, .top or .bottom.
    
    A node representing the selection will appear below the text node.
    
    If a context menu is opened, the window node will appear as a subnode
    of the main node.
*/
struct GtkTextView
{
  /** */
  GtkContainer parentInstance;

  /** */
  GtkTextViewPrivate* priv;
}

/** */
struct GtkTextViewAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkTextViewAccessiblePrivate* priv;
}

/** */
struct GtkTextViewAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkTextViewAccessiblePrivate;

/** */
struct GtkTextViewClass
{
  /**
      The object class structure needs to be the first
  */
  GtkContainerClass parentClass;

  /**
      The class handler for the #GtkTextView::populate-popup
        signal.
  */
  extern(C) void function(GtkTextView* textView, GtkWidget* popup) populatePopup;

  /**
      The class handler for the #GtkTextView::move-cursor
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, GtkMovementStep step, int count, gboolean extendSelection) moveCursor;

  /**
      The class handler for the #GtkTextView::set-anchor
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) setAnchor;

  /**
      The class handler for the #GtkTextView::insert-at-cursor
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, const(char)* str) insertAtCursor;

  /**
      The class handler for the #GtkTextView::delete-from-cursor
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, GtkDeleteType type, int count) deleteFromCursor;

  /**
      The class handler for the #GtkTextView::backspace
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) backspace;

  /**
      The class handler for the #GtkTextView::cut-clipboard
        keybinding signal
  */
  extern(C) void function(GtkTextView* textView) cutClipboard;

  /**
      The class handler for the #GtkTextview::copy-clipboard
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) copyClipboard;

  /**
      The class handler for the #GtkTextView::paste-clipboard
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) pasteClipboard;

  /**
      The class handler for the #GtkTextView::toggle-overwrite
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) toggleOverwrite;

  /**
      The create_buffer vfunc is called to create a #GtkTextBuffer
        for the text view. The default implementation is to just call
        [gtk.text_buffer.TextBuffer.new_]. Since: 3.10
  */
  extern(C) GtkTextBuffer* function(GtkTextView* textView) createBuffer;

  /**
      The draw_layer vfunc is called before and after the text
        view is drawing its own text. Applications can override this vfunc
        in a subclass to draw customized content underneath or above the
        text. In the [gtk.types.TextViewLayer.BelowText] and [gtk.types.TextViewLayer.AboveText]
        the drawing is done in the buffer coordinate space, but the older (deprecated)
        layers [gtk.types.TextViewLayer.Below] and [gtk.types.TextViewLayer.Above] work in viewport
        coordinates, which makes them unnecessarily hard to use. Since: 3.14
  */
  extern(C) void function(GtkTextView* textView, GtkTextViewLayer layer, cairo_t* cr) drawLayer;

  /**
      The class handler for the #GtkTextView::extend-selection
        signal. Since 3.16
  */
  extern(C) gboolean function(GtkTextView* textView, GtkTextExtendSelection granularity, const(GtkTextIter)* location, GtkTextIter* start, GtkTextIter* end) extendSelection;

  /** */
  extern(C) void function(GtkTextView* textView) insertEmoji;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTextViewPrivate;

/** */
struct GtkThemeEngine;

/**
    #GtkThemingEngine was the object used for rendering themed content
    in GTK+ widgets. It used to allow overriding GTK+'s default
    implementation of rendering functions by allowing engines to be
    loaded as modules.
    
    #GtkThemingEngine has been deprecated in GTK+ 3.14 and will be
    ignored for rendering. The advancements in CSS theming are good
    enough to allow themers to achieve their goals without the need
    to modify source code.
*/
struct GtkThemingEngine
{
  /** */
  GObject parentObject;

  /** */
  GtkThemingEnginePrivate* priv;
}

/**
    Base class for theming engines.
*/
struct GtkThemingEngineClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Renders a line between two points.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x0, double y0, double x1, double y1) renderLine;

  /**
      Renders the background area of a widget region.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderBackground;

  /**
      Renders the frame around a widget area.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderFrame;

  /**
      Renders the frame around a widget area with a gap in it.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkPositionType gapSide, double xy0Gap, double xy1Gap) renderFrameGap;

  /**
      Renders a extension to a box, usually a notebook tab.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkPositionType gapSide) renderExtension;

  /**
      Renders a checkmark, as in #GtkCheckButton.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderCheck;

  /**
      Renders an option, as in #GtkRadioButton.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderOption;

  /**
      Renders an arrow pointing to a certain direction.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double angle, double x, double y, double size) renderArrow;

  /**
      Renders an element what will expose/expand part of
                        the UI, as in #GtkExpander.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderExpander;

  /**
      Renders the focus indicator.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderFocus;

  /**
      Renders a #PangoLayout
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, PangoLayout* layout) renderLayout;

  /**
      Renders a slider control, as in #GtkScale.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkOrientation orientation) renderSlider;

  /**
      Renders a handle to drag UI elements, as in #GtkPaned.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderHandle;

  /**
      Renders an area displaying activity, such as in #GtkSpinner,
                        or #GtkProgressBar.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) renderActivity;

  /**
      Renders an icon as a #GdkPixbuf.
  */
  extern(C) GdkPixbuf* function(GtkThemingEngine* engine, const(GtkIconSource)* source, GtkIconSize size) renderIconPixbuf;

  /**
      Renders an icon given as a #GdkPixbuf.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, GdkPixbuf* pixbuf, double x, double y) renderIcon;

  /**
      Renders an icon given as a #cairo_surface_t.
  */
  extern(C) void function(GtkThemingEngine* engine, cairo_t* cr, cairo_surface_t* surface, double x, double y) renderIconSurface;

  /** */
  void*[14] padding;
}

/** */
struct GtkThemingEnginePrivate;

/**
    A #GtkToggleAction corresponds roughly to a #GtkCheckMenuItem. It has an
    “active” state specifying whether the action has been checked or not.
*/
struct GtkToggleAction
{
  /** */
  GtkAction parent;

  /** */
  GtkToggleActionPrivate* privateData;
}

/** */
struct GtkToggleActionClass
{
  /** */
  GtkActionClass parentClass;

  /** */
  extern(C) void function(GtkToggleAction* action) toggled;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    #GtkToggleActionEntry structs are used with
    [gtk.action_group.ActionGroup.addToggleActions] to construct toggle actions.
*/
struct GtkToggleActionEntry
{
  /**
      The name of the action.
  */
  const(char)* name;

  /**
      The stock id for the action, or the name of an icon from the
       icon theme.
  */
  const(char)* stockId;

  /**
      The label for the action. This field should typically be marked
       for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  const(char)* label;

  /**
      The accelerator for the action, in the format understood by
       [gtk.global.acceleratorParse].
  */
  const(char)* accelerator;

  /**
      The tooltip for the action. This field should typically be
       marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  const(char)* tooltip;

  /**
      The function to call when the action is activated.
  */
  GCallback callback;

  /**
      The initial state of the toggle action.
  */
  gboolean isActive;
}

/** */
struct GtkToggleActionPrivate;

/**
    A #GtkToggleButton is a #GtkButton which will remain “pressed-in” when
    clicked. Clicking again will cause the toggle button to return to its
    normal state.
    
    A toggle button is created by calling either [gtk.toggle_button.ToggleButton.new_] or
    [gtk.toggle_button.ToggleButton.newWithLabel]. If using the former, it is advisable to
    pack a widget, (such as a #GtkLabel and/or a #GtkImage), into the toggle
    button’s container. (See #GtkButton for more information).
    
    The state of a #GtkToggleButton can be set specifically using
    [gtk.toggle_button.ToggleButton.setActive], and retrieved using
    [gtk.toggle_button.ToggleButton.getActive].
    
    To simply switch the state of a toggle button, use [gtk.toggle_button.ToggleButton.toggled].
    
    # CSS nodes
    
    GtkToggleButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .toggle style class.
    
    ## Creating two #GtkToggleButton widgets.
    
    ```c
    static void output_state (GtkToggleButton *source, gpointer user_data) {
      printf ("Active: %d\n", gtk_toggle_button_get_active (source));
    }
    
    void make_toggles (void) {
      GtkWidget *window, *toggle1, *toggle2;
      GtkWidget *box;
      const char *text;
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
    
      text = "Hi, I’m a toggle button.";
      toggle1 = gtk_toggle_button_new_with_label (text);
    
      // Makes this toggle button invisible
      gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle1),
                                  TRUE);
    
      g_signal_connect (toggle1, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_container_add (GTK_CONTAINER (box), toggle1);
    
      text = "Hi, I’m a toggle button.";
      toggle2 = gtk_toggle_button_new_with_label (text);
      gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle2),
                                  FALSE);
      g_signal_connect (toggle2, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_container_add (GTK_CONTAINER (box), toggle2);
    
      gtk_container_add (GTK_CONTAINER (window), box);
      gtk_widget_show_all (window);
    }
    ```
*/
struct GtkToggleButton
{
  /** */
  GtkButton button;

  /** */
  GtkToggleButtonPrivate* priv;
}

/** */
struct GtkToggleButtonAccessible
{
  /** */
  GtkButtonAccessible parent;

  /** */
  GtkToggleButtonAccessiblePrivate* priv;
}

/** */
struct GtkToggleButtonAccessibleClass
{
  /** */
  GtkButtonAccessibleClass parentClass;
}

/** */
struct GtkToggleButtonAccessiblePrivate;

/** */
struct GtkToggleButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function(GtkToggleButton* toggleButton) toggled;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToggleButtonPrivate;

/**
    A #GtkToggleToolButton is a #GtkToolItem that contains a toggle
    button.
    
    Use [gtk.toggle_tool_button.ToggleToolButton.new_] to create a new GtkToggleToolButton.
    
    # CSS nodes
    
    GtkToggleToolButton has a single CSS node with name togglebutton.
*/
struct GtkToggleToolButton
{
  /** */
  GtkToolButton parent;

  /** */
  GtkToggleToolButtonPrivate* priv;
}

/** */
struct GtkToggleToolButtonClass
{
  /**
      The parent class.
  */
  GtkToolButtonClass parentClass;

  /**
      Signal emitted whenever the toggle tool button changes state.
  */
  extern(C) void function(GtkToggleToolButton* button) toggled;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToggleToolButtonPrivate;

/**
    #GtkToolButtons are #GtkToolItems containing buttons.
    
    Use [gtk.tool_button.ToolButton.new_] to create a new #GtkToolButton.
    
    The label of a #GtkToolButton is determined by the properties
    #GtkToolButton:label-widget, #GtkToolButton:label, and
    #GtkToolButton:stock-id. If #GtkToolButton:label-widget is
    non-null, then that widget is used as the label. Otherwise, if
    #GtkToolButton:label is non-null, that string is used as the label.
    Otherwise, if #GtkToolButton:stock-id is non-null, the label is
    determined by the stock item. Otherwise, the button does not have a label.
    
    The icon of a #GtkToolButton is determined by the properties
    #GtkToolButton:icon-widget and #GtkToolButton:stock-id. If
    #GtkToolButton:icon-widget is non-null, then
    that widget is used as the icon. Otherwise, if #GtkToolButton:stock-id is
    non-null, the icon is determined by the stock item. Otherwise,
    the button does not have a icon.
    
    # CSS nodes
    
    GtkToolButton has a single CSS node with name toolbutton.
*/
struct GtkToolButton
{
  /** */
  GtkToolItem parent;

  /** */
  GtkToolButtonPrivate* priv;
}

/** */
struct GtkToolButtonClass
{
  /**
      The parent class.
  */
  GtkToolItemClass parentClass;

  /** */
  GType buttonType;

  /**
      Signal emitted when the tool button is clicked with the
         mouse or activated with the keyboard.
  */
  extern(C) void function(GtkToolButton* toolItem) clicked;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToolButtonPrivate;

/**
    #GtkToolItems are widgets that can appear on a toolbar. To
    create a toolbar item that contain something else than a button, use
    [gtk.tool_item.ToolItem.new_]. Use [gtk.container.Container.add] to add a child
    widget to the tool item.
    
    For toolbar items that contain buttons, see the #GtkToolButton,
    #GtkToggleToolButton and #GtkRadioToolButton classes.
    
    See the #GtkToolbar class for a description of the toolbar widget, and
    #GtkToolShell for a description of the tool shell interface.
*/
struct GtkToolItem
{
  /** */
  GtkBin parent;

  /** */
  GtkToolItemPrivate* priv;
}

/** */
struct GtkToolItemClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Signal emitted when the toolbar needs
         information from tool_item about whether the item should appear in
         the toolbar overflow menu.
  */
  extern(C) gboolean function(GtkToolItem* toolItem) createMenuProxy;

  /**
      Signal emitted when some property of the
         toolbar that the item is a child of changes.
  */
  extern(C) void function(GtkToolItem* toolItem) toolbarReconfigured;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    A #GtkToolItemGroup is used together with #GtkToolPalette to add
    #GtkToolItems to a palette like container with different
    categories and drag and drop support.
    
    # CSS nodes
    
    GtkToolItemGroup has a single CSS node named toolitemgroup.
*/
struct GtkToolItemGroup
{
  /** */
  GtkContainer parentInstance;

  /** */
  GtkToolItemGroupPrivate* priv;
}

/** */
struct GtkToolItemGroupClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToolItemGroupPrivate;

/** */
struct GtkToolItemPrivate;

/**
    A #GtkToolPalette allows you to add #GtkToolItems to a palette-like
    container with different categories and drag and drop support.
    
    A #GtkToolPalette is created with a call to [gtk.tool_palette.ToolPalette.new_].
    
    #GtkToolItems cannot be added directly to a #GtkToolPalette -
    instead they are added to a #GtkToolItemGroup which can than be added
    to a #GtkToolPalette. To add a #GtkToolItemGroup to a #GtkToolPalette,
    use [gtk.container.Container.add].
    
    ```c
    GtkWidget *palette, *group;
    GtkToolItem *item;
    
    palette = gtk_tool_palette_new ();
    group = gtk_tool_item_group_new (_("Test Category"));
    gtk_container_add (GTK_CONTAINER (palette), group);
    
    item = gtk_tool_button_new (NULL, _("_Open"));
    gtk_tool_button_set_icon_name (GTK_TOOL_BUTTON (item), "document-open");
    gtk_tool_item_group_insert (GTK_TOOL_ITEM_GROUP (group), item, -1);
    ```
    
    The easiest way to use drag and drop with #GtkToolPalette is to call
    [gtk.tool_palette.ToolPalette.addDragDest] with the desired drag source @palette
    and the desired drag target @widget. Then [gtk.tool_palette.ToolPalette.getDragItem]
    can be used to get the dragged item in the #GtkWidget::drag-data-received
    signal handler of the drag target.
    
    ```c
    static void
    passive_canvas_drag_data_received (GtkWidget        *widget,
                                       GdkDragContext   *context,
                                       gint              x,
                                       gint              y,
                                       GtkSelectionData *selection,
                                       guint             info,
                                       guint             time,
                                       gpointer          data)
    {
      GtkWidget *palette;
      GtkWidget *item;
    
      // Get the dragged item
      palette = gtk_widget_get_ancestor (gtk_drag_get_source_widget (context),
                                         GTK_TYPE_TOOL_PALETTE);
      if (palette != NULL)
        item = gtk_tool_palette_get_drag_item (GTK_TOOL_PALETTE (palette),
                                               selection);
    
      // Do something with item
    }
    
    GtkWidget *target, palette;
    
    palette = gtk_tool_palette_new ();
    target = gtk_drawing_area_new ();
    
    g_signal_connect (G_OBJECT (target), "drag-data-received",
                      G_CALLBACK (passive_canvas_drag_data_received), NULL);
    gtk_tool_palette_add_drag_dest (GTK_TOOL_PALETTE (palette), target,
                                    GTK_DEST_DEFAULT_ALL,
                                    GTK_TOOL_PALETTE_DRAG_ITEMS,
                                    GDK_ACTION_COPY);
    ```
    
    # CSS nodes
    
    GtkToolPalette has a single CSS node named toolpalette.
*/
struct GtkToolPalette
{
  /** */
  GtkContainer parentInstance;

  /** */
  GtkToolPalettePrivate* priv;
}

/** */
struct GtkToolPaletteClass
{
  /**
      The parent class.
  */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToolPalettePrivate;

/**
    The #GtkToolShell interface allows container widgets to provide additional
    information when embedding #GtkToolItem widgets.
*/
struct GtkToolShell;

/**
    Virtual function table for the #GtkToolShell interface.
*/
struct GtkToolShellIface
{
  /** */
  GTypeInterface gIface;

  /**
      mandatory implementation of [gtk.tool_shell.ToolShell.getIconSize].
  */
  extern(C) GtkIconSize function(GtkToolShell* shell) getIconSize;

  /**
      mandatory implementation of [gtk.tool_shell.ToolShell.toolShellGetOrientation].
  */
  extern(C) GtkOrientation function(GtkToolShell* shell) getOrientation;

  /**
      mandatory implementation of [gtk.tool_shell.ToolShell.getStyle].
  */
  extern(C) GtkToolbarStyle function(GtkToolShell* shell) getStyle;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.getReliefStyle].
  */
  extern(C) GtkReliefStyle function(GtkToolShell* shell) getReliefStyle;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.rebuildMenu].
  */
  extern(C) void function(GtkToolShell* shell) rebuildMenu;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.getTextOrientation].
  */
  extern(C) GtkOrientation function(GtkToolShell* shell) getTextOrientation;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.getTextAlignment].
  */
  extern(C) float function(GtkToolShell* shell) getTextAlignment;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.getEllipsizeMode].
  */
  extern(C) PangoEllipsizeMode function(GtkToolShell* shell) getEllipsizeMode;

  /**
      optional implementation of [gtk.tool_shell.ToolShell.getTextSizeGroup].
  */
  extern(C) GtkSizeGroup* function(GtkToolShell* shell) getTextSizeGroup;
}

/**
    A toolbar is created with a call to [gtk.toolbar.Toolbar.new_].
    
    A toolbar can contain instances of a subclass of #GtkToolItem. To add
    a #GtkToolItem to the a toolbar, use [gtk.toolbar.Toolbar.insert]. To remove
    an item from the toolbar use [gtk.container.Container.remove]. To add a button
    to the toolbar, add an instance of #GtkToolButton.
    
    Toolbar items can be visually grouped by adding instances of
    #GtkSeparatorToolItem to the toolbar. If the GtkToolbar child property
    “expand” is #TRUE and the property #GtkSeparatorToolItem:draw is set to
    #FALSE, the effect is to force all following items to the end of the toolbar.
    
    By default, a toolbar can be shrunk, upon which it will add an arrow button
    to show an overflow menu offering access to any #GtkToolItem child that has
    a proxy menu item. To disable this and request enough size for all children,
    call [gtk.toolbar.Toolbar.setShowArrow] to set #GtkToolbar:show-arrow to false.
    
    Creating a context menu for the toolbar can be done by connecting to
    the #GtkToolbar::popup-context-menu signal.
    
    # CSS nodes
    
    GtkToolbar has a single CSS node with name toolbar.
*/
struct GtkToolbar
{
  /** */
  GtkContainer container;

  /** */
  GtkToolbarPrivate* priv;
}

/** */
struct GtkToolbarClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkToolbar* toolbar, GtkOrientation orientation) orientationChanged;

  /** */
  extern(C) void function(GtkToolbar* toolbar, GtkToolbarStyle style) styleChanged;

  /** */
  extern(C) gboolean function(GtkToolbar* toolbar, int x, int y, int buttonNumber) popupContextMenu;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkToolbarPrivate;

/**
    Basic tooltips can be realized simply by using [gtk.widget.Widget.setTooltipText]
    or [gtk.widget.Widget.setTooltipMarkup] without any explicit tooltip object.
    
    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per #GtkTreeView
    row or cell, you will have to do a little more work:
    
    $(LIST
      * Set the #GtkWidget:has-tooltip property to true, this will make GTK+
        monitor the widget for motion and related events which are needed to
        determine when and where to show a tooltip.
      
      * Connect to the #GtkWidget::query-tooltip signal.  This signal will be
        emitted when a tooltip is supposed to be shown. One of the arguments passed
        to the signal handler is a GtkTooltip object. This is the object that we
        are about to display as a tooltip, and can be manipulated in your callback
        using functions like [gtk.tooltip.Tooltip.setIcon]. There are functions for setting
        the tooltip’s markup, setting an image from a named icon, or even putting in
        a custom widget.
      
        Return true from your query-tooltip handler. This causes the tooltip to be
        show. If you return false, it will not be shown.
    )
      
    In the probably rare case where you want to have even more control over the
    tooltip that is about to be shown, you can set your own #GtkWindow which
    will be used as tooltip window.  This works as follows:
    
    $(LIST
      * Set #GtkWidget:has-tooltip and connect to #GtkWidget::query-tooltip as before.
        Use [gtk.widget.Widget.setTooltipWindow] to set a #GtkWindow created by you as
        tooltip window.
      
      * In the #GtkWidget::query-tooltip callback you can access your window using
        [gtk.widget.Widget.getTooltipWindow] and manipulate as you wish. The semantics of
        the return value are exactly as before, return true to show the window,
        false to not show it.
    )
*/
struct GtkTooltip;

/** */
struct GtkToplevelAccessible
{
  /** */
  AtkObject parent;

  /** */
  GtkToplevelAccessiblePrivate* priv;
}

/** */
struct GtkToplevelAccessibleClass
{
  /** */
  AtkObjectClass parentClass;
}

/** */
struct GtkToplevelAccessiblePrivate;

/** */
struct GtkTreeDragDest;

/** */
struct GtkTreeDragDestIface
{
  /** */
  GTypeInterface gIface;

  /**
      Asks the #GtkTreeDragDest to insert a row
         before the path dest, deriving the contents of the row from
         selection_data.
  */
  extern(C) gboolean function(GtkTreeDragDest* dragDest, GtkTreePath* dest, GtkSelectionData* selectionData) dragDataReceived;

  /**
      Determines whether a drop is possible before
         the given dest_path, at the same depth as dest_path.
  */
  extern(C) gboolean function(GtkTreeDragDest* dragDest, GtkTreePath* destPath, GtkSelectionData* selectionData) rowDropPossible;
}

/** */
struct GtkTreeDragSource;

/** */
struct GtkTreeDragSourceIface
{
  /** */
  GTypeInterface gIface;

  /**
      Asks the #GtkTreeDragSource whether a particular
         row can be used as the source of a DND operation.
  */
  extern(C) gboolean function(GtkTreeDragSource* dragSource, GtkTreePath* path) rowDraggable;

  /**
      Asks the #GtkTreeDragSource to fill in
         selection_data with a representation of the row at path.
  */
  extern(C) gboolean function(GtkTreeDragSource* dragSource, GtkTreePath* path, GtkSelectionData* selectionData) dragDataGet;

  /**
      Asks the #GtkTreeDragSource to delete the row at
         path, because it was moved somewhere else via drag-and-drop.
  */
  extern(C) gboolean function(GtkTreeDragSource* dragSource, GtkTreePath* path) dragDataDelete;
}

/**
    The #GtkTreeIter is the primary structure
    for accessing a #GtkTreeModel. Models are expected to put a unique
    integer in the @stamp member, and put
    model-specific data in the three @user_data
    members.
*/
struct GtkTreeIter
{
  /**
      a unique stamp to catch invalid iterators
  */
  int stamp;

  /**
      model-specific data
  */
  void* userData;

  /**
      model-specific data
  */
  void* userData2;

  /**
      model-specific data
  */
  void* userData3;
}

/**
    The #GtkTreeModel interface defines a generic tree interface for
    use by the #GtkTreeView widget. It is an abstract interface, and
    is designed to be usable with any appropriate data structure. The
    programmer just has to implement this interface on their own data
    type for it to be viewable by a #GtkTreeView widget.
    
    The model is represented as a hierarchical tree of strongly-typed,
    columned data. In other words, the model can be seen as a tree where
    every node has different values depending on which column is being
    queried. The type of data found in a column is determined by using
    the GType system (ie. #G_TYPE_INT, #GTK_TYPE_BUTTON, #G_TYPE_POINTER,
    etc). The types are homogeneous per column across all nodes. It is
    important to note that this interface only provides a way of examining
    a model and observing changes. The implementation of each individual
    model decides how and if changes are made.
    
    In order to make life simpler for programmers who do not need to
    write their own specialized model, two generic models are provided
    — the #GtkTreeStore and the #GtkListStore. To use these, the
    developer simply pushes data into these models as necessary. These
    models provide the data structure as well as all appropriate tree
    interfaces. As a result, implementing drag and drop, sorting, and
    storing data is trivial. For the vast majority of trees and lists,
    these two models are sufficient.
    
    Models are accessed on a node/column level of granularity. One can
    query for the value of a model at a certain node and a certain
    column on that node. There are two structures used to reference a
    particular node in a model. They are the #GtkTreePath-struct and
    the #GtkTreeIter-struct (“iter” is short for iterator). Most of the
    interface consists of operations on a #GtkTreeIter-struct.
    
    A path is essentially a potential node. It is a location on a model
    that may or may not actually correspond to a node on a specific
    model. The #GtkTreePath-struct can be converted into either an
    array of unsigned integers or a string. The string form is a list
    of numbers separated by a colon. Each number refers to the offset
    at that level. Thus, the path `0` refers to the root
    node and the path `2:4` refers to the fifth child of
    the third node.
    
    By contrast, a #GtkTreeIter-struct is a reference to a specific node on
    a specific model. It is a generic struct with an integer and three
    generic pointers. These are filled in by the model in a model-specific
    way. One can convert a path to an iterator by calling
    [gtk.tree_model.TreeModel.getIter]. These iterators are the primary way
    of accessing a model and are similar to the iterators used by
    #GtkTextBuffer. They are generally statically allocated on the
    stack and only used for a short time. The model interface defines
    a set of operations using them for navigating the model.
    
    It is expected that models fill in the iterator with private data.
    For example, the #GtkListStore model, which is internally a simple
    linked list, stores a list node in one of the pointers. The
    #GtkTreeModelSort stores an array and an offset in two of the
    pointers. Additionally, there is an integer field. This field is
    generally filled with a unique stamp per model. This stamp is for
    catching errors resulting from using invalid iterators with a model.
    
    The lifecycle of an iterator can be a little confusing at first.
    Iterators are expected to always be valid for as long as the model
    is unchanged (and doesn’t emit a signal). The model is considered
    to own all outstanding iterators and nothing needs to be done to
    free them from the user’s point of view. Additionally, some models
    guarantee that an iterator is valid for as long as the node it refers
    to is valid (most notably the #GtkTreeStore and #GtkListStore).
    Although generally uninteresting, as one always has to allow for
    the case where iterators do not persist beyond a signal, some very
    important performance enhancements were made in the sort model.
    As a result, the #GTK_TREE_MODEL_ITERS_PERSIST flag was added to
    indicate this behavior.
    
    To help show some common operation of a model, some examples are
    provided. The first example shows three ways of getting the iter at
    the location `3:2:5`. While the first method shown is
    easier, the second is much more common, as you often get paths from
    callbacks.
    
    ## Acquiring a #GtkTreeIter-struct
    
    ```c
    // Three ways of getting the iter pointing to the location
    GtkTreePath *path;
    GtkTreeIter iter;
    GtkTreeIter parent_iter;
    
    // get the iterator from a string
    gtk_tree_model_get_iter_from_string (model,
                                         &iter,
                                         "3:2:5");
    
    // get the iterator from a path
    path = gtk_tree_path_new_from_string ("3:2:5");
    gtk_tree_model_get_iter (model, &iter, path);
    gtk_tree_path_free (path);
    
    // walk the tree to find the iterator
    gtk_tree_model_iter_nth_child (model, &iter,
                                   NULL, 3);
    parent_iter = iter;
    gtk_tree_model_iter_nth_child (model, &iter,
                                   &parent_iter, 2);
    parent_iter = iter;
    gtk_tree_model_iter_nth_child (model, &iter,
                                   &parent_iter, 5);
    ```
    
    This second example shows a quick way of iterating through a list
    and getting a string and an integer from each row. The
    populate_model() function used below is not
    shown, as it is specific to the #GtkListStore. For information on
    how to write such a function, see the #GtkListStore documentation.
    
    ## Reading data from a #GtkTreeModel
    
    ```c
    enum
    {
      STRING_COLUMN,
      INT_COLUMN,
      N_COLUMNS
    };
    
    ...
    
    GtkTreeModel *list_store;
    GtkTreeIter iter;
    gboolean valid;
    gint row_count = 0;
    
    // make a new list_store
    list_store = gtk_list_store_new (N_COLUMNS,
                                     G_TYPE_STRING,
                                     G_TYPE_INT);
    
    // Fill the list store with data
    populate_model (list_store);
    
    // Get the first iter in the list, check it is valid and walk
    // through the list, reading each row.
    
    valid = gtk_tree_model_get_iter_first (list_store,
                                           &iter);
    while (valid)
     {
       gchar *str_data;
       gint   int_data;
    
       // Make sure you terminate calls to gtk_tree_model_get() with a “-1” value
       gtk_tree_model_get (list_store, &iter,
                           STRING_COLUMN, &str_data,
                           INT_COLUMN, &int_data,
                           -1);
    
       // Do something with the data
       g_print ("Row %d: (%s,%d)\n",
                row_count, str_data, int_data);
       g_free (str_data);
    
       valid = gtk_tree_model_iter_next (list_store,
                                         &iter);
       row_count++;
     }
    ```
    
    The #GtkTreeModel interface contains two methods for reference
    counting: [gtk.tree_model.TreeModel.refNode] and [gtk.tree_model.TreeModel.unrefNode].
    These two methods are optional to implement. The reference counting
    is meant as a way for views to let models know when nodes are being
    displayed. #GtkTreeView will take a reference on a node when it is
    visible, which means the node is either in the toplevel or expanded.
    Being displayed does not mean that the node is currently directly
    visible to the user in the viewport. Based on this reference counting
    scheme a caching model, for example, can decide whether or not to cache
    a node based on the reference count. A file-system based model would
    not want to keep the entire file hierarchy in memory, but just the
    folders that are currently expanded in every current view.
    
    When working with reference counting, the following rules must be taken
    into account:
    
    $(LIST
      * Never take a reference on a node without owning a reference on its parent.
        This means that all parent nodes of a referenced node must be referenced
        as well.
      
      * Outstanding references on a deleted node are not released. This is not
        possible because the node has already been deleted by the time the
        row-deleted signal is received.
      
      * Models are not obligated to emit a signal on rows of which none of its
        siblings are referenced. To phrase this differently, signals are only
        required for levels in which nodes are referenced. For the root level
        however, signals must be emitted at all times (however the root level
        is always referenced when any view is attached).
    )
*/
struct GtkTreeModel;

/**
    A #GtkTreeModelFilter is a tree model which wraps another tree model,
    and can do the following things:
    
    $(LIST
      * Filter specific rows, based on data from a “visible column”, a column
        storing booleans indicating whether the row should be filtered or not,
        or based on the return value of a “visible function”, which gets a
        model, iter and user_data and returns a boolean indicating whether the
        row should be filtered or not.
      
      * Modify the “appearance” of the model, using a modify function.
        This is extremely powerful and allows for just changing some
        values and also for creating a completely different model based
        on the given child model.
      
      * Set a different root node, also known as a “virtual root”. You can pass
        in a #GtkTreePath indicating the root node for the filter at construction
        time.
    )
      
    The basic API is similar to #GtkTreeModelSort. For an example on its usage,
    see the section on #GtkTreeModelSort.
    
    When using #GtkTreeModelFilter, it is important to realize that
    #GtkTreeModelFilter maintains an internal cache of all nodes which are
    visible in its clients. The cache is likely to be a subtree of the tree
    exposed by the child model. #GtkTreeModelFilter will not cache the entire
    child model when unnecessary to not compromise the caching mechanism
    that is exposed by the reference counting scheme. If the child model
    implements reference counting, unnecessary signals may not be emitted
    because of reference counting rule 3, see the #GtkTreeModel
    documentation. (Note that e.g. #GtkTreeStore does not implement
    reference counting and will always emit all signals, even when
    the receiving node is not visible).
    
    Because of this, limitations for possible visible functions do apply.
    In general, visible functions should only use data or properties from
    the node for which the visibility state must be determined, its siblings
    or its parents. Usually, having a dependency on the state of any child
    node is not possible, unless references are taken on these explicitly.
    When no such reference exists, no signals may be received for these child
    nodes (see reference couting rule number 3 in the #GtkTreeModel section).
    
    Determining the visibility state of a given node based on the state
    of its child nodes is a frequently occurring use case. Therefore,
    #GtkTreeModelFilter explicitly supports this. For example, when a node
    does not have any children, you might not want the node to be visible.
    As soon as the first row is added to the node’s child level (or the
    last row removed), the node’s visibility should be updated.
    
    This introduces a dependency from the node on its child nodes. In order
    to accommodate this, #GtkTreeModelFilter must make sure the necessary
    signals are received from the child model. This is achieved by building,
    for all nodes which are exposed as visible nodes to #GtkTreeModelFilter's
    clients, the child level (if any) and take a reference on the first node
    in this level. Furthermore, for every row-inserted, row-changed or
    row-deleted signal (also these which were not handled because the node
    was not cached), #GtkTreeModelFilter will check if the visibility state
    of any parent node has changed.
    
    Beware, however, that this explicit support is limited to these two
    cases. For example, if you want a node to be visible only if two nodes
    in a child’s child level (2 levels deeper) are visible, you are on your
    own. In this case, either rely on #GtkTreeStore to emit all signals
    because it does not implement reference counting, or for models that
    do implement reference counting, obtain references on these child levels
    yourself.
*/
struct GtkTreeModelFilter
{
  /** */
  GObject parent;

  /** */
  GtkTreeModelFilterPrivate* priv;
}

/** */
struct GtkTreeModelFilterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GtkTreeModelFilter* self, GtkTreeModel* childModel, GtkTreeIter* iter) visible;

  /** */
  extern(C) void function(GtkTreeModelFilter* self, GtkTreeModel* childModel, GtkTreeIter* iter, GValue* value, int column) modify;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTreeModelFilterPrivate;

/** */
struct GtkTreeModelIface
{
  /** */
  GTypeInterface gIface;

  /**
      Signal emitted when a row in the model has changed.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) rowChanged;

  /**
      Signal emitted when a new row has been inserted in
         the model.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) rowInserted;

  /**
      Signal emitted when a row has gotten the
         first child row or lost its last child row.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter) rowHasChildToggled;

  /**
      Signal emitted when a row has been deleted.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreePath* path) rowDeleted;

  /**
      Signal emitted when the children of a node in the
         GtkTreeModel have been reordered.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreePath* path, GtkTreeIter* iter, int* newOrder) rowsReordered;

  /**
      Get #GtkTreeModelFlags supported by this interface.
  */
  extern(C) GtkTreeModelFlags function(GtkTreeModel* treeModel) getFlags;

  /**
      Get the number of columns supported by the model.
  */
  extern(C) int function(GtkTreeModel* treeModel) getNColumns;

  /**
      Get the type of the column.
  */
  extern(C) GType function(GtkTreeModel* treeModel, int index) getColumnType;

  /**
      Sets iter to a valid iterator pointing to path.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreePath* path) getIter;

  /**
      Gets a newly-created #GtkTreePath referenced by iter.
  */
  extern(C) GtkTreePath* function(GtkTreeModel* treeModel, GtkTreeIter* iter) getPath;

  /**
      Initializes and sets value to that at column.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreeIter* iter, int column, GValue* value) getValue;

  /**
      Sets iter to point to the node following it at the
         current level.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter) iterNext;

  /**
      Sets iter to point to the previous node at the
         current level.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter) iterPrevious;

  /**
      Sets iter to point to the first child of parent.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* parent) iterChildren;

  /**
      true if iter has children, false otherwise.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter) iterHasChild;

  /**
      Gets the number of children that iter has.
  */
  extern(C) int function(GtkTreeModel* treeModel, GtkTreeIter* iter) iterNChildren;

  /**
      Sets iter to be the child of parent, using the
         given index.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* parent, int n) iterNthChild;

  /**
      Sets iter to be the parent of child.
  */
  extern(C) gboolean function(GtkTreeModel* treeModel, GtkTreeIter* iter, GtkTreeIter* child) iterParent;

  /**
      Lets the tree ref the node.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreeIter* iter) refNode;

  /**
      Lets the tree unref the node.
  */
  extern(C) void function(GtkTreeModel* treeModel, GtkTreeIter* iter) unrefNode;
}

/**
    The #GtkTreeModelSort is a model which implements the #GtkTreeSortable
    interface.  It does not hold any data itself, but rather is created with
    a child model and proxies its data.  It has identical column types to
    this child model, and the changes in the child are propagated.  The
    primary purpose of this model is to provide a way to sort a different
    model without modifying it. Note that the sort function used by
    #GtkTreeModelSort is not guaranteed to be stable.
    
    The use of this is best demonstrated through an example.  In the
    following sample code we create two #GtkTreeView widgets each with a
    view of the same data.  As the model is wrapped here by a
    #GtkTreeModelSort, the two #GtkTreeViews can each sort their
    view of the data without affecting the other.  By contrast, if we
    simply put the same model in each widget, then sorting the first would
    sort the second.
    
    ## Using a #GtkTreeModelSort
    
    ```c
    {
      GtkTreeView *tree_view1;
      GtkTreeView *tree_view2;
      GtkTreeModel *sort_model1;
      GtkTreeModel *sort_model2;
      GtkTreeModel *child_model;
    
      // get the child model
      child_model = get_my_model ();
    
      // Create the first tree
      sort_model1 = gtk_tree_model_sort_new_with_model (child_model);
      tree_view1 = gtk_tree_view_new_with_model (sort_model1);
    
      // Create the second tree
      sort_model2 = gtk_tree_model_sort_new_with_model (child_model);
      tree_view2 = gtk_tree_view_new_with_model (sort_model2);
    
      // Now we can sort the two models independently
      gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model1),
                                            COLUMN_1, GTK_SORT_ASCENDING);
      gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model2),
                                            COLUMN_1, GTK_SORT_DESCENDING);
    }
    ```
    
    To demonstrate how to access the underlying child model from the sort
    model, the next example will be a callback for the #GtkTreeSelection
    #GtkTreeSelection::changed signal.  In this callback, we get a string
    from COLUMN_1 of the model.  We then modify the string, find the same
    selected row on the child model, and change the row there.
    
    ## Accessing the child model of in a selection changed callback
    
    ```c
    void
    selection_changed (GtkTreeSelection *selection, gpointer data)
    {
      GtkTreeModel *sort_model = NULL;
      GtkTreeModel *child_model;
      GtkTreeIter sort_iter;
      GtkTreeIter child_iter;
      char *some_data = NULL;
      char *modified_data;
    
      // Get the current selected row and the model.
      if (! gtk_tree_selection_get_selected (selection,
                                             &sort_model,
                                             &sort_iter))
        return;
    
      // Look up the current value on the selected row and get
      // a new value to change it to.
      gtk_tree_model_get (GTK_TREE_MODEL (sort_model), &sort_iter,
                          COLUMN_1, &some_data,
                          -1);
    
      modified_data = change_the_data (some_data);
      g_free (some_data);
    
      // Get an iterator on the child model, instead of the sort model.
      gtk_tree_model_sort_convert_iter_to_child_iter (GTK_TREE_MODEL_SORT (sort_model),
                                                      &child_iter,
                                                      &sort_iter);
    
      // Get the child model and change the value of the row. In this
      // example, the child model is a GtkListStore. It could be any other
      // type of model, though.
      child_model = gtk_tree_model_sort_get_model (GTK_TREE_MODEL_SORT (sort_model));
      gtk_list_store_set (GTK_LIST_STORE (child_model), &child_iter,
                          COLUMN_1, &modified_data,
                          -1);
      g_free (modified_data);
    }
    ```
*/
struct GtkTreeModelSort
{
  /** */
  GObject parent;

  /** */
  GtkTreeModelSortPrivate* priv;
}

/** */
struct GtkTreeModelSortClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTreeModelSortPrivate;

/** */
struct GtkTreePath;

/**
    A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a #GtkTreePath refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with [gtk.tree_row_reference.TreeRowReference.new_].
*/
struct GtkTreeRowReference;

/**
    The #GtkTreeSelection object is a helper object to manage the selection
    for a #GtkTreeView widget.  The #GtkTreeSelection object is
    automatically created when a new #GtkTreeView widget is created, and
    cannot exist independently of this widget.  The primary reason the
    #GtkTreeSelection objects exists is for cleanliness of code and API.
    That is, there is no conceptual reason all these functions could not be
    methods on the #GtkTreeView widget instead of a separate function.
    
    The #GtkTreeSelection object is gotten from a #GtkTreeView by calling
    [gtk.tree_view.TreeView.getSelection].  It can be manipulated to check the
    selection status of the tree, as well as select and deselect individual
    rows.  Selection is done completely view side.  As a result, multiple
    views of the same model can have completely different selections.
    Additionally, you cannot change the selection of a row on the model that
    is not currently displayed by the view without expanding its parents
    first.
    
    One of the important things to remember when monitoring the selection of
    a view is that the #GtkTreeSelection::changed signal is mostly a hint.
    That is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a #GtkTreeSelection::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row).
*/
struct GtkTreeSelection
{
  /** */
  GObject parent;

  /** */
  GtkTreeSelectionPrivate* priv;
}

/** */
struct GtkTreeSelectionClass
{
  /**
      The parent class.
  */
  GObjectClass parentClass;

  /**
      Signal emitted whenever the selection has (possibly) changed.
  */
  extern(C) void function(GtkTreeSelection* selection) changed;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTreeSelectionPrivate;

/**
    #GtkTreeSortable is an interface to be implemented by tree models which
    support sorting. The #GtkTreeView uses the methods provided by this interface
    to sort the model.
*/
struct GtkTreeSortable;

/** */
struct GtkTreeSortableIface
{
  /** */
  GTypeInterface gIface;

  /**
      Signal emitted when the sort column or sort
         order of sortable is changed.
  */
  extern(C) void function(GtkTreeSortable* sortable) sortColumnChanged;

  /**
      Fills in sort_column_id and order with the
         current sort column and the order.
  */
  extern(C) gboolean function(GtkTreeSortable* sortable, int* sortColumnId, GtkSortType* order) getSortColumnId;

  /**
      Sets the current sort column to be
         sort_column_id.
  */
  extern(C) void function(GtkTreeSortable* sortable, int sortColumnId, GtkSortType order) setSortColumnId;

  /**
      Sets the comparison function used when sorting to
         be sort_func.
  */
  extern(C) void function(GtkTreeSortable* sortable, int sortColumnId, GtkTreeIterCompareFunc sortFunc, void* userData, GDestroyNotify destroy) setSortFunc;

  /**
      Sets the default comparison function used
         when sorting to be sort_func.
  */
  extern(C) void function(GtkTreeSortable* sortable, GtkTreeIterCompareFunc sortFunc, void* userData, GDestroyNotify destroy) setDefaultSortFunc;

  /**
      true if the model has a default sort
      function.
  */
  extern(C) gboolean function(GtkTreeSortable* sortable) hasDefaultSortFunc;
}

/**
    The #GtkTreeStore object is a list model for use with a #GtkTreeView
    widget.  It implements the #GtkTreeModel interface, and consequentially,
    can use all of the methods available there.  It also implements the
    #GtkTreeSortable interface so it can be sorted by the view.  Finally,
    it also implements the tree
    [drag and drop][gtk3-GtkTreeView-drag-and-drop]
    interfaces.
    
    # GtkTreeStore as GtkBuildable
    
    The GtkTreeStore implementation of the #GtkBuildable interface allows
    to specify the model columns with a `<columns>` element that may contain
    multiple `<column>` elements, each specifying one model column. The “type”
    attribute specifies the data type for the column.
    
    An example of a UI Definition fragment for a tree store:
    
    ```xml
    <object class="GtkTreeStore">
      <columns>
        <column type="gchararray"/>
        <column type="gchararray"/>
        <column type="gint"/>
      </columns>
    </object>
    ```
*/
struct GtkTreeStore
{
  /** */
  GObject parent;

  /** */
  GtkTreeStorePrivate* priv;
}

/** */
struct GtkTreeStoreClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTreeStorePrivate;

/**
    Widget that displays any object that implements the #GtkTreeModel interface.
    
    Please refer to the
    [tree widget conceptual overview](TreeWidget.html)
    for an overview of all the objects and data types related
    to the tree widget and how they work together.
    
    Several different coordinate systems are exposed in the GtkTreeView API.
    These are:
    
    ![](tree-view-coordinates.png)
    
    Coordinate systems in GtkTreeView API:
    
    $(LIST
      * Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
      
      * Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
      
      * Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
        coordinates start at (0, 0) for row 0 of the tree.
    )
      
    Several functions are available for converting between the different
    coordinate systems.  The most common translations are between widget and bin
    window coordinates and between bin window and tree coordinates. For the
    former you can use [gtk.tree_view.TreeView.convertWidgetToBinWindowCoords]
    (and vice versa), for the latter [gtk.tree_view.TreeView.convertBinWindowToTreeCoords]
    (and vice versa).
    
    # GtkTreeView as GtkBuildable
    
    The GtkTreeView implementation of the GtkBuildable interface accepts
    #GtkTreeViewColumn objects as `<child>` elements and exposes the internal
    #GtkTreeSelection in UI definitions.
    
    An example of a UI definition fragment with GtkTreeView:
    
    ```xml
    <object class="GtkTreeView" id="treeview">
      <property name="model">liststore1</property>
      <child>
        <object class="GtkTreeViewColumn" id="test-column">
          <property name="title">Test</property>
          <child>
            <object class="GtkCellRendererText" id="test-renderer"/>
            <attributes>
              <attribute name="text">1</attribute>
            </attributes>
          </child>
        </object>
      </child>
      <child internal-child="selection">
        <object class="GtkTreeSelection" id="selection">
          <signal name="changed" handler="on_treeview_selection_changed"/>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    treeview.view
    ├── header
    │   ├── <column header>
    ┊   ┊
    │   ╰── <column header>
    │
    ╰── [rubberband]
    ```
    
    GtkTreeView has a main CSS node with name treeview and style class .view.
    It has a subnode with name header, which is the parent for all the column
    header widgets' CSS nodes.
    For rubberband selection, a subnode with name rubberband is used.
*/
struct GtkTreeView
{
  /** */
  GtkContainer parent;

  /** */
  GtkTreeViewPrivate* priv;
}

/** */
struct GtkTreeViewAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkTreeViewAccessiblePrivate* priv;
}

/** */
struct GtkTreeViewAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkTreeViewAccessiblePrivate;

/** */
struct GtkTreeViewClass
{
  /** */
  GtkContainerClass parentClass;

  /** */
  extern(C) void function(GtkTreeView* treeView, GtkTreePath* path, GtkTreeViewColumn* column) rowActivated;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView, GtkTreeIter* iter, GtkTreePath* path) testExpandRow;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView, GtkTreeIter* iter, GtkTreePath* path) testCollapseRow;

  /** */
  extern(C) void function(GtkTreeView* treeView, GtkTreeIter* iter, GtkTreePath* path) rowExpanded;

  /** */
  extern(C) void function(GtkTreeView* treeView, GtkTreeIter* iter, GtkTreePath* path) rowCollapsed;

  /** */
  extern(C) void function(GtkTreeView* treeView) columnsChanged;

  /** */
  extern(C) void function(GtkTreeView* treeView) cursorChanged;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView, GtkMovementStep step, int count) moveCursor;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView) selectAll;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView) unselectAll;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView, gboolean startEditing) selectCursorRow;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView) toggleCursorRow;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView, gboolean logical, gboolean expand, gboolean openAll) expandCollapseCursorRow;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView) selectCursorParent;

  /** */
  extern(C) gboolean function(GtkTreeView* treeView) startInteractiveSearch;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;

  /** */
  extern(C) void function() GtkReserved5;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;

  /** */
  extern(C) void function() GtkReserved8;
}

/**
    The GtkTreeViewColumn object represents a visible column in a #GtkTreeView widget.
    It allows to set properties of the column header, and functions as a holding pen for
    the cell renderers which determine how the data in the column is displayed.
    
    Please refer to the [tree widget conceptual overview](TreeWidget.html)
    for an overview of all the objects and data types related to the tree widget and how
    they work together.
*/
struct GtkTreeViewColumn
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkTreeViewColumnPrivate* priv;
}

/** */
struct GtkTreeViewColumnClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /** */
  extern(C) void function(GtkTreeViewColumn* treeColumn) clicked;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkTreeViewColumnPrivate;

/** */
struct GtkTreeViewPrivate;

/**
    A #GtkUIManager constructs a user interface (menus and toolbars) from
    one or more UI definitions, which reference actions from one or more
    action groups.
    
    > GtkUIManager is deprecated since GTK+ 3.10. To construct user interfaces
    > from XML definitions, you should use #GtkBuilder, #GMenuModel, et al. To
    > work with actions, use #GAction, #GtkActionable et al. These newer classes
    > support richer functionality and integration with various desktop shells.
    > It should be possible to migrate most/all functionality from GtkUIManager.
    
    # UI Definitions # {#XML-UI}
    
    The UI definitions are specified in an XML format which can be
    roughly described by the following DTD.
    
    > Do not confuse the GtkUIManager UI Definitions described here with
    > the similarly named [GtkBuilder UI Definitions][BUILDER-UI].
    
    ```
    <!ELEMENT ui          (menubar|toolbar|popup|accelerator)* >
    <!ELEMENT menubar     (menuitem|separator|placeholder|menu)* >
    <!ELEMENT menu        (menuitem|separator|placeholder|menu)* >
    <!ELEMENT popup       (menuitem|separator|placeholder|menu)* >
    <!ELEMENT toolbar     (toolitem|separator|placeholder)* >
    <!ELEMENT placeholder (menuitem|toolitem|separator|placeholder|menu)* >
    <!ELEMENT menuitem     EMPTY >
    <!ELEMENT toolitem     (menu?) >
    <!ELEMENT separator    EMPTY >
    <!ELEMENT accelerator  EMPTY >
    <!ATTLIST menubar      name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST toolbar      name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST popup        name                      #IMPLIED
                           action                    #IMPLIED
                           accelerators (true|false) #IMPLIED >
    <!ATTLIST placeholder  name                      #IMPLIED
                           action                    #IMPLIED >
    <!ATTLIST separator    name                      #IMPLIED
                           action                    #IMPLIED
                           expand       (true|false) #IMPLIED >
    <!ATTLIST menu         name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED >
    <!ATTLIST menuitem     name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED
                           always-show-image (true|false) #IMPLIED >
    <!ATTLIST toolitem     name                      #IMPLIED
                           action                    #REQUIRED
                           position     (top|bot)    #IMPLIED >
    <!ATTLIST accelerator  name                      #IMPLIED
                           action                    #REQUIRED >
    ```
    
    There are some additional restrictions beyond those specified in the
    DTD, e.g. every toolitem must have a toolbar in its anchestry and
    every menuitem must have a menubar or popup in its anchestry. Since
    a #GMarkupParser is used to parse the UI description, it must not only
    be valid XML, but valid markup.
    
    If a name is not specified, it defaults to the action. If an action is
    not specified either, the element name is used. The name and action
    attributes must not contain “/” characters after parsing (since that
    would mess up path lookup) and must be usable as XML attributes when
    enclosed in doublequotes, thus they must not “"” characters or references
    to the &quot; entity.
    
    # A UI definition #
    
    ```xml
    <ui>
      <menubar>
        <menu name="FileMenu" action="FileMenuAction">
          <menuitem name="New" action="New2Action" />
          <placeholder name="FileMenuAdditions" />
        </menu>
        <menu name="JustifyMenu" action="JustifyMenuAction">
          <menuitem name="Left" action="justify-left"/>
          <menuitem name="Centre" action="justify-center"/>
          <menuitem name="Right" action="justify-right"/>
          <menuitem name="Fill" action="justify-fill"/>
        </menu>
      </menubar>
      <toolbar action="toolbar1">
        <placeholder name="JustifyToolItems">
          <separator/>
          <toolitem name="Left" action="justify-left"/>
          <toolitem name="Centre" action="justify-center"/>
          <toolitem name="Right" action="justify-right"/>
          <toolitem name="Fill" action="justify-fill"/>
          <separator/>
        </placeholder>
      </toolbar>
    </ui>
    ```
    
    The constructed widget hierarchy is very similar to the element tree
    of the XML, with the exception that placeholders are merged into their
    parents. The correspondence of XML elements to widgets should be
    almost obvious:
    
    $(LIST
      * menubar
      
         a #GtkMenuBar
      
      * toolbar
      
         a #GtkToolbar
      
      * popup
      
         a toplevel #GtkMenu
      
      * menu
      
         a #GtkMenu attached to a menuitem
      
      * menuitem
      
         a #GtkMenuItem subclass, the exact type depends on the action
      
      * toolitem
      
         a #GtkToolItem subclass, the exact type depends on the
         action. Note that toolitem elements may contain a menu element,
         but only if their associated action specifies a
         #GtkMenuToolButton as proxy.
      
      * separator
      
         a #GtkSeparatorMenuItem or #GtkSeparatorToolItem
      
      * accelerator
      
         a keyboard accelerator
    )
      
    The “position” attribute determines where a constructed widget is positioned
    wrt. to its siblings in the partially constructed tree. If it is
    “top”, the widget is prepended, otherwise it is appended.
    
    # UI Merging # {#UI-Merging}
    
    The most remarkable feature of #GtkUIManager is that it can overlay a set
    of menuitems and toolitems over another one, and demerge them later.
    
    Merging is done based on the names of the XML elements. Each element is
    identified by a path which consists of the names of its anchestors, separated
    by slashes. For example, the menuitem named “Left” in the example above
    has the path `/ui/menubar/JustifyMenu/Left` and the
    toolitem with the same name has path
    `/ui/toolbar1/JustifyToolItems/Left`.
    
    # Accelerators #
    
    Every action has an accelerator path. Accelerators are installed together
    with menuitem proxies, but they can also be explicitly added with
    `<accelerator>` elements in the UI definition. This makes it possible to
    have accelerators for actions even if they have no visible proxies.
    
    # Smart Separators # {#Smart-Separators}
    
    The separators created by #GtkUIManager are “smart”, i.e. they do not show up
    in the UI unless they end up between two visible menu or tool items. Separators
    which are located at the very beginning or end of the menu or toolbar
    containing them, or multiple separators next to each other, are hidden. This
    is a useful feature, since the merging of UI elements from multiple sources
    can make it hard or impossible to determine in advance whether a separator
    will end up in such an unfortunate position.
    
    For separators in toolbars, you can set `expand="true"` to
    turn them from a small, visible separator to an expanding, invisible one.
    Toolitems following an expanding separator are effectively right-aligned.
    
    # Empty Menus
    
    Submenus pose similar problems to separators inconnection with merging. It is
    impossible to know in advance whether they will end up empty after merging.
    #GtkUIManager offers two ways to treat empty submenus:
    
    $(LIST
      * make them disappear by hiding the menu item they’re attached to
      
      * add an insensitive “Empty” item
    )
      
    The behaviour is chosen based on the “hide_if_empty” property of the action
    to which the submenu is associated.
    
    # GtkUIManager as GtkBuildable # {#GtkUIManager-BUILDER-UI}
    
    The GtkUIManager implementation of the GtkBuildable interface accepts
    GtkActionGroup objects as `<child>` elements in UI definitions.
    
    A GtkUIManager UI definition as described above can be embedded in
    an GtkUIManager `<object>` element in a GtkBuilder UI definition.
    
    The widgets that are constructed by a GtkUIManager can be embedded in
    other parts of the constructed user interface with the help of the
    “constructor” attribute. See the example below.
    
    ## An embedded GtkUIManager UI definition
    
    ```xml
    <object class="GtkUIManager" id="uiman">
      <child>
        <object class="GtkActionGroup" id="actiongroup">
          <child>
            <object class="GtkAction" id="file">
              <property name="label">_File</property>
            </object>
          </child>
        </object>
      </child>
      <ui>
        <menubar name="menubar1">
          <menu action="file">
          </menu>
        </menubar>
      </ui>
    </object>
    <object class="GtkWindow" id="main-window">
      <child>
        <object class="GtkMenuBar" id="menubar1" constructor="uiman"/>
      </child>
    </object>
    ```
*/
struct GtkUIManager
{
  /** */
  GObject parent;

  /** */
  GtkUIManagerPrivate* privateData;
}

/** */
struct GtkUIManagerClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkUIManager* manager, GtkWidget* widget) addWidget;

  /** */
  extern(C) void function(GtkUIManager* manager) actionsChanged;

  /** */
  extern(C) void function(GtkUIManager* manager, GtkAction* action, GtkWidget* proxy) connectProxy;

  /** */
  extern(C) void function(GtkUIManager* manager, GtkAction* action, GtkWidget* proxy) disconnectProxy;

  /** */
  extern(C) void function(GtkUIManager* manager, GtkAction* action) preActivate;

  /** */
  extern(C) void function(GtkUIManager* manager, GtkAction* action) postActivate;

  /** */
  extern(C) GtkWidget* function(GtkUIManager* manager, const(char)* path) getWidget;

  /** */
  extern(C) GtkAction* function(GtkUIManager* manager, const(char)* path) getAction;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkUIManagerPrivate;

/**
    A #GtkVBox is a container that organizes child widgets into a single column.
    
    Use the #GtkBox packing interface to determine the arrangement,
    spacing, height, and alignment of #GtkVBox children.
    
    All children are allocated the same width.
    
    GtkVBox has been deprecated. You can use #GtkBox with a #GtkOrientable:orientation
    set to [gtk.types.Orientation.Vertical] instead when calling [gtk.box.Box.new_],
    which is a very quick and easy change.
    
    If you have derived your own classes from GtkVBox, you can change the
    inheritance to derive directly from #GtkBox, and set the #GtkOrientable:orientation
    property to [gtk.types.Orientation.Vertical] in your instance init function,
    with a call like:
    
    ```c
      gtk_orientable_set_orientation (GTK_ORIENTABLE (object),
                                      GTK_ORIENTATION_VERTICAL);
    ```
    
    If you have a grid-like layout composed of nested boxes, and you don’t
    need first-child or last-child styling, the recommendation is to switch
    to #GtkGrid. For more information about migrating to #GtkGrid, see
    [Migrating from other containers to GtkGrid][gtk-migrating-GtkGrid].
*/
struct GtkVBox
{
  /** */
  GtkBox box;
}

/** */
struct GtkVBoxClass
{
  /** */
  GtkBoxClass parentClass;
}

/** */
struct GtkVButtonBox
{
  /** */
  GtkButtonBox buttonBox;
}

/** */
struct GtkVButtonBoxClass
{
  /** */
  GtkButtonBoxClass parentClass;
}

/**
    The VPaned widget is a container widget with two
    children arranged vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle. See #GtkPaned for details.
    
    GtkVPaned has been deprecated, use #GtkPaned instead.
*/
struct GtkVPaned
{
  /** */
  GtkPaned paned;
}

/** */
struct GtkVPanedClass
{
  /** */
  GtkPanedClass parentClass;
}

/**
    The #GtkVScale widget is used to allow the user to select a value using
    a vertical slider. To create one, use [gtk.hscale.HScale.newWithRange].
    
    The position to show the current value, and the number of decimal places
    shown can be set using the parent #GtkScale class’s functions.
    
    GtkVScale has been deprecated, use #GtkScale instead.
*/
struct GtkVScale
{
  /** */
  GtkScale scale;
}

/** */
struct GtkVScaleClass
{
  /** */
  GtkScaleClass parentClass;
}

/**
    The #GtkVScrollbar widget is a widget arranged vertically creating a
    scrollbar. See #GtkScrollbar for details on
    scrollbars. #GtkAdjustment pointers may be added to handle the
    adjustment of the scrollbar or it may be left null in which case one
    will be created for you. See #GtkScrollbar for a description of what the
    fields in an adjustment represent for a scrollbar.
    
    GtkVScrollbar has been deprecated, use #GtkScrollbar instead.
*/
struct GtkVScrollbar
{
  /** */
  GtkScrollbar scrollbar;
}

/** */
struct GtkVScrollbarClass
{
  /** */
  GtkScrollbarClass parentClass;
}

/**
    The #GtkVSeparator widget is a vertical separator, used to group the
    widgets within a window. It displays a vertical line with a shadow to
    make it appear sunken into the interface.
    
    GtkVSeparator has been deprecated, use #GtkSeparator instead.
*/
struct GtkVSeparator
{
  /** */
  GtkSeparator separator;
}

/** */
struct GtkVSeparatorClass
{
  /** */
  GtkSeparatorClass parentClass;
}

/**
    The #GtkViewport widget acts as an adaptor class, implementing
    scrollability for child widgets that lack their own scrolling
    capabilities. Use GtkViewport to scroll child widgets such as
    #GtkGrid, #GtkBox, and so on.
    
    If a widget has native scrolling abilities, such as #GtkTextView,
    #GtkTreeView or #GtkIconView, it can be added to a #GtkScrolledWindow
    with [gtk.container.Container.add]. If a widget does not, you must first add the
    widget to a #GtkViewport, then add the viewport to the scrolled window.
    [gtk.container.Container.add] does this automatically if a child that does not
    implement #GtkScrollable is added to a #GtkScrolledWindow, so you can
    ignore the presence of the viewport.
    
    The GtkViewport will start scrolling content only if allocated less
    than the child widget’s minimum size in a given orientation.
    
    # CSS nodes
    
    GtkViewport has a single CSS node with name viewport.
*/
struct GtkViewport
{
  /** */
  GtkBin bin;

  /** */
  GtkViewportPrivate* priv;
}

/** */
struct GtkViewportClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkViewportPrivate;

/**
    #GtkVolumeButton is a subclass of #GtkScaleButton that has
    been tailored for use as a volume control widget with suitable
    icons, tooltips and accessible labels.
*/
struct GtkVolumeButton
{
  /** */
  GtkScaleButton parent;
}

/** */
struct GtkVolumeButtonClass
{
  /** */
  GtkScaleButtonClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    GtkWidget is the base class all widgets in GTK+ derive from. It manages the
    widget lifecycle, states and style.
    
    # Height-for-width Geometry Management # {#geometry-management}
    
    GTK+ uses a height-for-width (and width-for-height) geometry management
    system. Height-for-width means that a widget can change how much
    vertical space it needs, depending on the amount of horizontal space
    that it is given (and similar for width-for-height). The most common
    example is a label that reflows to fill up the available width, wraps
    to fewer lines, and therefore needs less height.
    
    Height-for-width geometry management is implemented in GTK+ by way
    of five virtual methods:
    
    $(LIST
      * #GtkWidgetClass.get_request_mode()
      * #GtkWidgetClass.get_preferred_width()
      * #GtkWidgetClass.get_preferred_height()
      * #GtkWidgetClass.get_preferred_height_for_width()
      * #GtkWidgetClass.get_preferred_width_for_height()
      * #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    )
      
    There are some important things to keep in mind when implementing
    height-for-width and when using it in container implementations.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the #GtkSizeRequestMode chosen by the toplevel.
    
    For example, when queried in the normal
    [gtk.types.SizeRequestMode.HeightForWidth] mode:
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gtk.widget.Widget.getPreferredWidth].
    Because the preferred widths for each container depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using
    [gtk.widget.Widget.getPreferredHeightForWidth], which will also be a highly
    recursive operation. The minimum height for the minimum width is normally
    used to set the minimum size constraint on the toplevel
    (unless [gtk.window.Window.setGeometryHints] is explicitly used instead).
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gtk.window.Window.setDefaultSize]). During the
    recursive allocation process it’s important to note that request cycles
    will be recursively executed while container widgets allocate their children.
    Each container widget, once allocated a size, will go on to first share the
    space in one orientation among its children and then request each child's
    height for its target allocated width or its width for allocated height,
    depending. In this way a #GtkWidget will typically be requested its size
    a number of times before actually being allocated a size. The size a
    widget is finally allocated can of course differ from the size it has
    requested. For this reason, #GtkWidget caches a  small number of results
    to avoid re-querying for the same sizes in one allocation cycle.
    
    See
    [GtkContainer’s geometry management section][container-geometry-management]
    to learn more about how height-for-width allocations are performed
    by container widgets.
    
    If a widget does move content around to intelligently use up the
    allocated size then it must support the request in both
    #GtkSizeRequestModes even if the widget in question only
    trades sizes in a single orientation.
    
    For instance, a #GtkLabel that does height-for-width word wrapping
    will not expect to have #GtkWidgetClass.get_preferred_height() called
    because that call is specific to a width-for-height request. In this
    case the label must return the height required for its own minimum
    possible width. By following this rule any widget that handles
    height-for-width or width-for-height requests will always be allocated
    at least enough space to fit its own content.
    
    Here are some examples of how a [gtk.types.SizeRequestMode.HeightForWidth] widget
    generally deals with width-for-height requests, for #GtkWidgetClass.get_preferred_height()
    it will do:
    
    ```c
    static void
    foo_widget_get_preferred_height (GtkWidget *widget,
                                     gint *min_height,
                                     gint *nat_height)
    {
       if (i_am_in_height_for_width_mode)
         {
           gint min_width, nat_width;
    
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               &min_width,
                                                               &nat_width);
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_height_for_width
                                                              (widget,
                                                               min_width,
                                                               min_height,
                                                               nat_height);
         }
       else
         {
            ... some widgets do both. For instance, if a GtkLabel is
            rotated to 90 degrees it will return the minimum and
            natural height for the rotated label here.
         }
    }
    ```
    
    And in #GtkWidgetClass.get_preferred_width_for_height() it will simply return
    the minimum and natural width:
    ```c
    static void
    foo_widget_get_preferred_width_for_height (GtkWidget *widget,
                                               gint for_height,
                                               gint *min_width,
                                               gint *nat_width)
    {
       if (i_am_in_height_for_width_mode)
         {
           GTK_WIDGET_GET_CLASS (widget)->get_preferred_width (widget,
                                                               min_width,
                                                               nat_width);
         }
       else
         {
            ... again if a widget is sometimes operating in
            width-for-height mode (like a rotated GtkLabel) it can go
            ahead and do its real width for height calculation here.
         }
    }
    ```
    
    Often a widget needs to get its own request during size request or
    allocation. For example, when computing height it may need to also
    compute width. Or when deciding how to use an allocation, the widget
    may need to know its natural size. In these cases, the widget should
    be careful to call its virtual methods directly, like this:
    
    ```c
    GTK_WIDGET_GET_CLASS(widget)->get_preferred_width (widget,
                                                       &min,
                                                       &natural);
    ```
    
    It will not work to use the wrapper functions, such as
    [gtk.widget.Widget.getPreferredWidth] inside your own size request
    implementation. These return a request adjusted by #GtkSizeGroup
    and by the #GtkWidgetClass.adjust_size_request() virtual method. If a
    widget used the wrappers inside its virtual method implementations,
    then the adjustments (such as widget margins) would be applied
    twice. GTK+ therefore does not allow this and will warn if you try
    to do it.
    
    Of course if you are getting the size request for
    another widget, such as a child of a
    container, you must use the wrapper APIs.
    Otherwise, you would not properly consider widget margins,
    #GtkSizeGroup, and so forth.
    
    Since 3.10 GTK+ also supports baseline vertical alignment of widgets. This
    means that widgets are positioned such that the typographical baseline of
    widgets in the same row are aligned. This happens if a widget supports baselines,
    has a vertical alignment of [gtk.types.Align.Baseline], and is inside a container
    that supports baselines and has a natural “row” that it aligns to the baseline,
    or a baseline assigned to it by the grandparent.
    
    Baseline alignment support for a widget is done by the #GtkWidgetClass.get_preferred_height_and_baseline_for_width()
    virtual function. It allows you to report a baseline in combination with the
    minimum and natural height. If there is no baseline you can return -1 to indicate
    this. The default implementation of this virtual function calls into the
    #GtkWidgetClass.get_preferred_height() and #GtkWidgetClass.get_preferred_height_for_width(),
    so if baselines are not supported it doesn’t need to be implemented.
    
    If a widget ends up baseline aligned it will be allocated all the space in the parent
    as if it was [gtk.types.Align.Fill], but the selected baseline can be found via [gtk.widget.Widget.getAllocatedBaseline].
    If this has a value other than -1 you need to align the widget such that the baseline
    appears at the position.
    
    # Style Properties
    
    #GtkWidget introduces “style
    properties” - these are basically object properties that are stored
    not on the object, but in the style object associated to the widget. Style
    properties are set in [resource files][gtk3-Resource-Files].
    This mechanism is used for configuring such things as the location of the
    scrollbar arrows through the theme, giving theme authors more control over the
    look of applications without the need to write a theme engine in C.
    
    Use [gtk.widget_class.WidgetClass.installStyleProperty] to install style properties for
    a widget class, [gtk.widget_class.WidgetClass.findStyleProperty] or
    [gtk.widget_class.WidgetClass.listStyleProperties] to get information about existing
    style properties and [gtk.widget.Widget.styleGetProperty], [gtk.widget.Widget.styleGet] or
    [gtk.widget.Widget.styleGetValist] to obtain the value of a style property.
    
    # GtkWidget as GtkBuildable
    
    The GtkWidget implementation of the GtkBuildable interface supports a
    custom `<accelerator>` element, which has attributes named ”key”, ”modifiers”
    and ”signal” and allows to specify accelerators.
    
    An example of a UI definition fragment specifying an accelerator:
    
    ```xml
    <object class="GtkButton">
      <accelerator key="q" modifiers="GDK_CONTROL_MASK" signal="clicked"/>
    </object>
    ```
    
    In addition to accelerators, GtkWidget also support a custom `<accessible>`
    element, which supports actions and relations. Properties on the accessible
    implementation of an object can be set by accessing the internal child
    “accessible” of a #GtkWidget.
    
    An example of a UI definition fragment specifying an accessible:
    
    ```xml
    <object class="GtkLabel" id="label1"/>
      <property name="label">I am a Label for a Button</property>
    </object>
    <object class="GtkButton" id="button1">
      <accessibility>
        <action action_name="click" translatable="yes">Click the button.</action>
        <relation target="label1" type="labelled-by"/>
      </accessibility>
      <child internal-child="accessible">
        <object class="AtkObject" id="a11y-button1">
          <property name="accessible-name">Clickable Button</property>
        </object>
      </child>
    </object>
    ```
    
    Finally, GtkWidget allows style information such as style classes to
    be associated with widgets, using the custom `<style>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <style>
        <class name="my-special-button-class"/>
        <class name="dark-button"/>
      </style>
    </object>
    ```
    
    # Building composite widgets from template XML ## {#composite-templates}
    
    GtkWidget exposes some facilities to automate the procedure
    of creating composite widgets using #GtkBuilder interface description
    language.
    
    To create composite widgets with #GtkBuilder XML, one must associate
    the interface description with the widget class at class initialization
    time using [gtk.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular #GtkBuilder XML.
    
    Unlike regular interface descriptions, [gtk.widget_class.WidgetClass.setTemplate] will
    expect a `<template>` tag as a direct child of the toplevel `<interface>`
    tag. The `<template>` tag must specify the “class” attribute which must be
    the type name of the widget. Optionally, the “parent” attribute may be
    specified to specify the direct parent type of the widget type, this is
    ignored by the GtkBuilder but required for Glade to introspect what kind
    of properties and internal children exist for a given type when the actual
    type does not exist.
    
    The XML which is contained inside the `<template>` tag behaves as if it were
    added to the `<object>` tag defining "widget" itself. You may set properties
    on @widget by inserting `<property>` tags into the `<template>` tag, and also
    add `<child>` tags to add children and extend "widget" in the normal way you
    would with `<object>` tags.
    
    Additionally, `<object>` tags can also be added before and after the initial
    `<template>` tag in the normal way, allowing one to define auxiliary objects
    which might be referenced by other widgets declared as children of the
    `<template>` tag.
    
    An example of a GtkBuilder Template Definition:
    
    ```xml
    <interface>
      <template class="FooWidget" parent="GtkBox">
        <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
        <property name="spacing">4</property>
        <child>
          <object class="GtkButton" id="hello_button">
            <property name="label">Hello World</property>
            <signal name="clicked" handler="hello_button_clicked" object="FooWidget" swapped="yes"/>
          </object>
        </child>
        <child>
          <object class="GtkButton" id="goodbye_button">
            <property name="label">Goodbye World</property>
          </object>
        </child>
      </template>
    </interface>
    ```
    
    Typically, you'll place the template fragment into a file that is
    bundled with your project, using #GResource. In order to load the
    template, you need to call [gtk.widget_class.WidgetClass.setTemplateFromResource]
    from the class initialization of your #GtkWidget type:
    
    ```c
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
    
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
    }
    ```
    
    You will also need to call [gtk.widget.Widget.initTemplate] from the instance
    initialization function:
    
    ```c
    static void
    foo_widget_init (FooWidget *self)
    {
      // ...
      gtk_widget_init_template (GTK_WIDGET (self));
    }
    ```
    
    You can access widgets defined in the template using the
    [gtk.widget.Widget.getTemplateChild] function, but you will typically declare
    a pointer in the instance private data structure of your type using the same
    name as the widget in the template definition, and call
    gtk_widget_class_bind_template_child_private() with that name, e.g.
    
    ```c
    typedef struct {
      GtkWidget *hello_button;
      GtkWidget *goodbye_button;
    } FooWidgetPrivate;
    
    G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
      gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
                                                    FooWidget, hello_button);
      gtk_widget_class_bind_template_child_private (GTK_WIDGET_CLASS (klass),
                                                    FooWidget, goodbye_button);
    }
    
    static void
    foo_widget_init (FooWidget *widget)
    {
    
    }
    ```
    
    You can also use gtk_widget_class_bind_template_callback() to connect a signal
    callback defined in the template with a function visible in the scope of the
    class, e.g.
    
    ```c
    // the signal handler has the instance and user data swapped
    // because of the swapped="yes" attribute in the template XML
    static void
    hello_button_clicked (FooWidget *self,
                          GtkButton *button)
    {
      g_print ("Hello, world!\n");
    }
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
      gtk_widget_class_bind_template_callback (GTK_WIDGET_CLASS (klass), hello_button_clicked);
    }
    ```
*/
struct GtkWidget
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkWidgetPrivate* priv;
}

/** */
struct GtkWidgetAccessible
{
  /** */
  GtkAccessible parent;

  /** */
  GtkWidgetAccessiblePrivate* priv;
}

/** */
struct GtkWidgetAccessibleClass
{
  /** */
  GtkAccessibleClass parentClass;

  /** */
  extern(C) void function(GObject* object, GParamSpec* pspec) notifyGtk;
}

/** */
struct GtkWidgetAccessiblePrivate;

/** */
struct GtkWidgetClass
{
  /**
      The object class structure needs to be the first
        element in the widget class structure in order for the class mechanism
        to work correctly. This allows a GtkWidgetClass pointer to be cast to
        a GObjectClass pointer.
  */
  GInitiallyUnownedClass parentClass;

  /**
      The signal to emit when a widget of this class is
        activated, [gtk.widget.Widget.activate] handles the emission.
        Implementation of this signal is optional.
  */
  uint activateSignal;

  /**
      Seldomly overidden.
  */
  extern(C) void function(GtkWidget* widget, uint nPspecs, GParamSpec** pspecs) dispatchChildPropertiesChanged;

  /**
      Signals that all holders of a reference to the widget
        should release the reference that they hold.
  */
  extern(C) void function(GtkWidget* widget) destroy;

  /**
      Signal emitted when widget is shown
  */
  extern(C) void function(GtkWidget* widget) show;

  /**
      Recursively shows a widget, and any child widgets (if the widget is
      a container).
  */
  extern(C) void function(GtkWidget* widget) showAll;

  /**
      Signal emitted when widget is hidden.
  */
  extern(C) void function(GtkWidget* widget) hide;

  /**
      Signal emitted when widget is going to be mapped, that is
        when the widget is visible (which is controlled with
        [gtk.widget.Widget.setVisible]) and all its parents up to the toplevel
        widget are also visible.
  */
  extern(C) void function(GtkWidget* widget) map;

  /**
      Signal emitted when widget is going to be unmapped, which
        means that either it or any of its parents up to the toplevel
        widget have been set as hidden.
  */
  extern(C) void function(GtkWidget* widget) unmap;

  /**
      Signal emitted when widget is associated with a
        #GdkWindow, which means that [gtk.widget.Widget.realize] has been called or
        the widget has been mapped (that is, it is going to be drawn).
  */
  extern(C) void function(GtkWidget* widget) realize;

  /**
      Signal emitted when the GdkWindow associated with
        widget is destroyed, which means that [gtk.widget.Widget.unrealize] has
        been called or the widget has been unmapped (that is, it is going
        to be hidden).
  */
  extern(C) void function(GtkWidget* widget) unrealize;

  /**
      Signal emitted to get the widget allocation.
  */
  extern(C) void function(GtkWidget* widget, GtkAllocation* allocation) sizeAllocate;

  /**
      Signal emitted when the widget state
        changes. Deprecated: 3.0
  */
  extern(C) void function(GtkWidget* widget, GtkStateType previousState) stateChanged;

  /**
      Signal emitted when the widget state changes,
        see [gtk.widget.Widget.getStateFlags].
  */
  extern(C) void function(GtkWidget* widget, GtkStateFlags previousStateFlags) stateFlagsChanged;

  /**
      Signal emitted when a new parent has been set on a
        widget.
  */
  extern(C) void function(GtkWidget* widget, GtkWidget* previousParent) parentSet;

  /**
      Signal emitted when the anchored state of a
        widget changes.
  */
  extern(C) void function(GtkWidget* widget, GtkWidget* previousToplevel) hierarchyChanged;

  /**
      Signal emitted when a new style has been set on a
      widget. Deprecated: 3.0
  */
  extern(C) void function(GtkWidget* widget, GtkStyle* previousStyle) styleSet;

  /**
      Signal emitted when the text direction of a
        widget changes.
  */
  extern(C) void function(GtkWidget* widget, GtkTextDirection previousDirection) directionChanged;

  /**
      Signal emitted when a widget becomes shadowed by a
        GTK+ grab (not a pointer or keyboard grab) on another widget, or
        when it becomes unshadowed due to a grab being removed.
  */
  extern(C) void function(GtkWidget* widget, gboolean wasGrabbed) grabNotify;

  /**
      Signal emitted for each child property that has
        changed on an object.
  */
  extern(C) void function(GtkWidget* widget, GParamSpec* childProperty) childNotify;

  /**
      Signal emitted when a widget is supposed to render itself.
  */
  extern(C) gboolean function(GtkWidget* widget, cairo_t* cr) draw;

  /**
      This allows a widget to tell its parent container whether
        it prefers to be allocated in [gtk.types.SizeRequestMode.HeightForWidth] or
        [gtk.types.SizeRequestMode.WidthForHeight] mode.
        [gtk.types.SizeRequestMode.HeightForWidth] means the widget prefers to have
        #GtkWidgetClass.get_preferred_width() called and then
        #GtkWidgetClass.get_preferred_height_for_width().
        [gtk.types.SizeRequestMode.ConstantSize] disables any height-for-width or
        width-for-height geometry management for a said widget and is the
        default return.
        It’s important to note (as described below) that any widget
        which trades height-for-width or width-for-height must respond properly
        to both of the virtual methods #GtkWidgetClass.get_preferred_height_for_width()
        and #GtkWidgetClass.get_preferred_width_for_height() since it might be
        queried in either #GtkSizeRequestMode by its parent container.
  */
  extern(C) GtkSizeRequestMode function(GtkWidget* widget) getRequestMode;

  /**
      This is called by containers to obtain the minimum
        and natural height of a widget. A widget that does not actually trade
        any height for width or width for height only has to implement these
        two virtual methods (#GtkWidgetClass.get_preferred_width() and
        #GtkWidgetClass.get_preferred_height()).
  */
  extern(C) void function(GtkWidget* widget, int* minimumHeight, int* naturalHeight) getPreferredHeight;

  /**
      This is analogous to
        #GtkWidgetClass.get_preferred_height_for_width() except that it
        operates in the oposite orientation. It’s rare that a widget actually
        does [gtk.types.SizeRequestMode.WidthForHeight] requests but this can happen
        when, for example, a widget or container gets additional columns to
        compensate for a smaller allocated height.
  */
  extern(C) void function(GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) getPreferredWidthForHeight;

  /**
      This is called by containers to obtain the minimum
        and natural width of a widget. A widget will never be allocated a width
        less than its minimum and will only ever be allocated a width greater
        than the natural width once all of the said widget’s siblings have
        received their natural widths.
        Furthermore, a widget will only ever be allocated a width greater than
        its natural width if it was configured to receive extra expand space
        from its parent container.
  */
  extern(C) void function(GtkWidget* widget, int* minimumWidth, int* naturalWidth) getPreferredWidth;

  /**
      This is similar to
        #GtkWidgetClass.get_preferred_height() except that it is passed a
        contextual width to request height for. By implementing this virtual
        method it is possible for a #GtkLabel to tell its parent how much height
        would be required if the label were to be allocated a said width.
  */
  extern(C) void function(GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) getPreferredHeightForWidth;

  /**
      Activates the @widget if @group_cycling is
        false, and just grabs the focus if @group_cycling is true.
  */
  extern(C) gboolean function(GtkWidget* widget, gboolean groupCycling) mnemonicActivate;

  /**
      Causes @widget to have the keyboard focus for the
        #GtkWindow it’s inside.
  */
  extern(C) void function(GtkWidget* widget) grabFocus;

  /** */
  extern(C) gboolean function(GtkWidget* widget, GtkDirectionType direction) focus;

  /**
      Signal emitted when a change of focus is requested
  */
  extern(C) void function(GtkWidget* widget, GtkDirectionType direction) moveFocus;

  /**
      Signal emitted if keyboard navigation fails.
  */
  extern(C) gboolean function(GtkWidget* widget, GtkDirectionType direction) keynavFailed;

  /**
      The GTK+ main loop will emit three signals for each GDK
        event delivered to a widget: one generic ::event signal, another,
        more specific, signal that matches the type of event delivered
        (e.g. "key-press-event") and finally a generic "event-after"
        signal.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEvent* event) event;

  /**
      Signal will be emitted when a button
        (typically from a mouse) is pressed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventButton* event) buttonPressEvent;

  /**
      Signal will be emitted when a button
        (typically from a mouse) is released.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventButton* event) buttonReleaseEvent;

  /**
      Signal emitted when a button in the 4 to 7 range is
        pressed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventScroll* event) scrollEvent;

  /**
      Signal emitted when the pointer moves over
        the widget’s #GdkWindow.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventMotion* event) motionNotifyEvent;

  /**
      Signal emitted if a user requests that a toplevel
        window is closed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventAny* event) deleteEvent;

  /**
      Signal is emitted when a #GdkWindow is destroyed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventAny* event) destroyEvent;

  /**
      Signal emitted when a key is pressed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventKey* event) keyPressEvent;

  /**
      Signal is emitted when a key is released.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventKey* event) keyReleaseEvent;

  /**
      Signal event will be emitted when the pointer
        enters the widget’s window.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventCrossing* event) enterNotifyEvent;

  /**
      Will be emitted when the pointer leaves the
        widget’s window.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventCrossing* event) leaveNotifyEvent;

  /**
      Signal will be emitted when the size, position or
        stacking of the widget’s window has changed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventConfigure* event) configureEvent;

  /**
      Signal emitted when the keyboard focus enters the
      widget’s window.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventFocus* event) focusInEvent;

  /**
      Signal emitted when the keyboard focus leaves the
      widget’s window.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventFocus* event) focusOutEvent;

  /**
      Signal emitted when the widget’s window is mapped.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventAny* event) mapEvent;

  /**
      Signal will be emitted when the widget’s window is
        unmapped.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventAny* event) unmapEvent;

  /**
      Signal will be emitted when a property on
        the widget’s window has been changed or deleted.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventProperty* event) propertyNotifyEvent;

  /**
      Signal will be emitted when the the
        widget’s window has lost ownership of a selection.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventSelection* event) selectionClearEvent;

  /**
      Signal will be emitted when another
        client requests ownership of the selection owned by the widget's
        window.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventSelection* event) selectionRequestEvent;

  /** */
  extern(C) gboolean function(GtkWidget* widget, GdkEventSelection* event) selectionNotifyEvent;

  /** */
  extern(C) gboolean function(GtkWidget* widget, GdkEventProximity* event) proximityInEvent;

  /** */
  extern(C) gboolean function(GtkWidget* widget, GdkEventProximity* event) proximityOutEvent;

  /**
      Signal emitted when the widget’s window is
        obscured or unobscured.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventVisibility* event) visibilityNotifyEvent;

  /**
      Signal emitted when the state of the toplevel
        window associated to the widget changes.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventWindowState* event) windowStateEvent;

  /**
      Signal emitted when a redirected window belonging to
        widget gets drawn into.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventExpose* event) damageEvent;

  /**
      Signal emitted when a pointer or keyboard grab
        on a window belonging to widget gets broken.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventGrabBroken* event) grabBrokenEvent;

  /** */
  extern(C) void function(GtkWidget* widget, GtkSelectionData* selectionData, uint info, uint time) selectionGet;

  /** */
  extern(C) void function(GtkWidget* widget, GtkSelectionData* selectionData, uint time) selectionReceived;

  /**
      Signal emitted on the drag source when a drag is
        started.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context) dragBegin;

  /**
      Signal emitted on the drag source when a drag is
        finished.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context) dragEnd;

  /**
      Signal emitted on the drag source when the drop
        site requests the data which is dragged.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context, GtkSelectionData* selectionData, uint info, uint time) dragDataGet;

  /**
      Signal emitted on the drag source when a drag
        with the action [gdk.types.DragAction.Move] is successfully completed.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context) dragDataDelete;

  /**
      Signal emitted on the drop site when the cursor leaves
        the widget.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context, uint time) dragLeave;

  /**
      signal emitted on the drop site when the user moves
        the cursor over the widget during a drag.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkDragContext* context, int x, int y, uint time) dragMotion;

  /**
      Signal emitted on the drop site when the user drops the
        data onto the widget.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkDragContext* context, int x, int y, uint time) dragDrop;

  /**
      Signal emitted on the drop site when the
        dragged data has been received.
  */
  extern(C) void function(GtkWidget* widget, GdkDragContext* context, int x, int y, GtkSelectionData* selectionData, uint info, uint time) dragDataReceived;

  /**
      Signal emitted on the drag source when a drag has
        failed.
  */
  extern(C) gboolean function(GtkWidget* widget, GdkDragContext* context, GtkDragResult result) dragFailed;

  /**
      Signal emitted whenever a widget should pop up a
        context menu.
  */
  extern(C) gboolean function(GtkWidget* widget) popupMenu;

  /** */
  extern(C) gboolean function(GtkWidget* widget, GtkWidgetHelpType helpType) showHelp;

  /**
      Returns the accessible object that describes the
        widget to an assistive technology.
  */
  extern(C) AtkObject* function(GtkWidget* widget) getAccessible;

  /**
      Signal emitted when the screen of a widget has
        changed.
  */
  extern(C) void function(GtkWidget* widget, GdkScreen* previousScreen) screenChanged;

  /**
      Signal allows applications and derived widgets
        to override the default GtkWidget handling for determining whether
        an accelerator can be activated.
  */
  extern(C) gboolean function(GtkWidget* widget, uint signalId) canActivateAccel;

  /**
      Signal emitted when the composited status of
        widgets screen changes. See [gdk.screen.Screen.isComposited].
  */
  extern(C) void function(GtkWidget* widget) compositedChanged;

  /**
      Signal emitted when “has-tooltip” is true and the
        hover timeout has expired with the cursor hovering “above”
        widget; or emitted when widget got focus in keyboard mode.
  */
  extern(C) gboolean function(GtkWidget* widget, int x, int y, gboolean keyboardTooltip, GtkTooltip* tooltip) queryTooltip;

  /**
      Computes whether a container should give this
        widget extra space when possible.
  */
  extern(C) void function(GtkWidget* widget, gboolean* hexpandP, gboolean* vexpandP) computeExpand;

  /**
      Convert an initial size request from a widget's
        #GtkSizeRequestMode virtual method implementations into a size request to
        be used by parent containers in laying out the widget.
        adjust_size_request adjusts from a child widget's
        original request to what a parent container should
        use for layout. The @for_size argument will be -1 if the request should
        not be for a particular size in the opposing orientation, i.e. if the
        request is not height-for-width or width-for-height. If @for_size is
        greater than -1, it is the proposed allocation in the opposing
        orientation that we need the request for. Implementations of
        adjust_size_request should chain up to the default implementation,
        which applies #GtkWidget’s margin properties and imposes any values
        from [gtk.widget.Widget.setSizeRequest]. Chaining up should be last,
        after your subclass adjusts the request, so
        #GtkWidget can apply constraints and add the margin properly.
  */
  extern(C) void function(GtkWidget* widget, GtkOrientation orientation, int* minimumSize, int* naturalSize) adjustSizeRequest;

  /**
      Convert an initial size allocation assigned
        by a #GtkContainer using [gtk.widget.Widget.sizeAllocate], into an actual
        size allocation to be used by the widget. adjust_size_allocation
        adjusts to a child widget’s actual allocation
        from what a parent container computed for the
        child. The adjusted allocation must be entirely within the original
        allocation. In any custom implementation, chain up to the default
        #GtkWidget implementation of this method, which applies the margin
        and alignment properties of #GtkWidget. Chain up
        before performing your own adjustments so your
        own adjustments remove more allocation after the #GtkWidget base
        class has already removed margin and alignment. The natural size
        passed in should be adjusted in the same way as the allocated size,
        which allows adjustments to perform alignments or other changes
        based on natural size.
  */
  extern(C) void function(GtkWidget* widget, GtkOrientation orientation, int* minimumSize, int* naturalSize, int* allocatedPos, int* allocatedSize) adjustSizeAllocation;

  /**
      Signal emitted when the GtkStyleContext of a widget
        is changed.
  */
  extern(C) void function(GtkWidget* widget) styleUpdated;

  /**
      Signal emitted when a touch event happens
  */
  extern(C) gboolean function(GtkWidget* widget, GdkEventTouch* event) touchEvent;

  /** */
  extern(C) void function(GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight, int* minimumBaseline, int* naturalBaseline) getPreferredHeightAndBaselineForWidth;

  /** */
  extern(C) void function(GtkWidget* widget, int* minimumBaseline, int* naturalBaseline) adjustBaselineRequest;

  /** */
  extern(C) void function(GtkWidget* widget, int* baseline) adjustBaselineAllocation;

  /**
      Invalidates the area of widget defined by
        region by calling [gdk.window.Window.invalidateRegion] on the widget's
        window and all its child windows.
  */
  extern(C) void function(GtkWidget* widget, const(cairo_region_t)* region) queueDrawRegion;

  /** */
  GtkWidgetClassPrivate* priv;

  /** */
  extern(C) void function() GtkReserved6;

  /** */
  extern(C) void function() GtkReserved7;
}

/** */
struct GtkWidgetClassPrivate;

/**
    GtkWidgetPath is a boxed type that represents a widget hierarchy from
    the topmost widget, typically a toplevel, to any child. This widget
    path abstraction is used in #GtkStyleContext on behalf of the real
    widget in order to query style information.
    
    If you are using GTK+ widgets, you probably will not need to use
    this API directly, as there is [gtk.widget.Widget.getPath], and the style
    context returned by [gtk.widget.Widget.getStyleContext] will be automatically
    updated on widget hierarchy changes.
    
    The widget path generation is generally simple:
    
    ## Defining a button within a window
    
    ```c
    {
      GtkWidgetPath *path;
    
      path = gtk_widget_path_new ();
      gtk_widget_path_append_type (path, GTK_TYPE_WINDOW);
      gtk_widget_path_append_type (path, GTK_TYPE_BUTTON);
    }
    ```
    
    Although more complex information, such as widget names, or
    different classes (property that may be used by other widget
    types) and intermediate regions may be included:
    
    ## Defining the first tab widget in a notebook
    
    ```c
    {
      GtkWidgetPath *path;
      guint pos;
    
      path = gtk_widget_path_new ();
    
      pos = gtk_widget_path_append_type (path, GTK_TYPE_NOTEBOOK);
      gtk_widget_path_iter_add_region (path, pos, "tab", GTK_REGION_EVEN | GTK_REGION_FIRST);
    
      pos = gtk_widget_path_append_type (path, GTK_TYPE_LABEL);
      gtk_widget_path_iter_set_name (path, pos, "first tab label");
    }
    ```
    
    All this information will be used to match the style information
    that applies to the described widget.
*/
struct GtkWidgetPath;

/** */
struct GtkWidgetPrivate;

/**
    A GtkWindow is a toplevel window which can contain other widgets.
    Windows normally have decorations that are under the control
    of the windowing system and allow the user to manipulate the window
    (resize it, move it, close it,...).
    
    # GtkWindow as GtkBuildable
    
    The GtkWindow implementation of the #GtkBuildable interface supports a
    custom `<accel-groups>` element, which supports any number of `<group>`
    elements representing the #GtkAccelGroup objects you want to add to
    your window (synonymous with [gtk.window.Window.addAccelGroup].
    
    It also supports the `<initial-focus>` element, whose name property names
    the widget to receive the focus when the window is mapped.
    
    An example of a UI definition fragment with accel groups:
    
    ```xml
    <object class="GtkWindow">
      <accel-groups>
        <group name="accelgroup1"/>
      </accel-groups>
      <initial-focus name="thunderclap"/>
    </object>
    
    ...
    
    <object class="GtkAccelGroup" id="accelgroup1"/>
    ```
    
    The GtkWindow implementation of the #GtkBuildable interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a `<child>` element.
    
    # CSS nodes
    
    ```plain
    window.background
    ├── decoration
    ├── <titlebar child>.titlebar [.default-decoration]
    ╰── <child>
    ```
    
    GtkWindow has a main CSS node with name window and style class .background,
    and a subnode with name decoration.
    
    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .tiled, .maximized, .fullscreen. Specialized
    types of window often add their own discriminating style classes, such as
    .popup or .tooltip.
    
    GtkWindow adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.
*/
struct GtkWindow
{
  /** */
  GtkBin bin;

  /** */
  GtkWindowPrivate* priv;
}

/** */
struct GtkWindowAccessible
{
  /** */
  GtkContainerAccessible parent;

  /** */
  GtkWindowAccessiblePrivate* priv;
}

/** */
struct GtkWindowAccessibleClass
{
  /** */
  GtkContainerAccessibleClass parentClass;
}

/** */
struct GtkWindowAccessiblePrivate;

/** */
struct GtkWindowClass
{
  /**
      The parent class.
  */
  GtkBinClass parentClass;

  /**
      Sets child as the focus widget for the window.
  */
  extern(C) void function(GtkWindow* window, GtkWidget* focus) setFocus;

  /**
      Activates the current focused widget within the window.
  */
  extern(C) void function(GtkWindow* window) activateFocus;

  /**
      Activates the default widget for the window.
  */
  extern(C) void function(GtkWindow* window) activateDefault;

  /**
      Signal gets emitted when the set of accelerators or
        mnemonics that are associated with window changes.
  */
  extern(C) void function(GtkWindow* window) keysChanged;

  /**
      Class handler for the #GtkWindow::enable-debugging
        keybinding signal. Since: 3.14
  */
  extern(C) gboolean function(GtkWindow* window, gboolean toggle) enableDebugging;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;
}

/** */
struct GtkWindowGeometryInfo;

/**
    A #GtkWindowGroup restricts the effect of grabs to windows
    in the same group, thereby making window groups almost behave
    like separate applications.
    
    A window can be a member in at most one window group at a time.
    Windows that have not been explicitly assigned to a group are
    implicitly treated like windows of the default window group.
    
    GtkWindowGroup objects are referenced by each window in the group,
    so once you have added all windows to a GtkWindowGroup, you can drop
    the initial reference to the window group with [gobject.object.ObjectWrap.unref]. If the
    windows in the window group are subsequently destroyed, then they will
    be removed from the window group and drop their references on the window
    group; when all window have been removed, the window group will be
    freed.
*/
struct GtkWindowGroup
{
  /** */
  GObject parentInstance;

  /** */
  GtkWindowGroupPrivate* priv;
}

/** */
struct GtkWindowGroupClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() GtkReserved1;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/** */
struct GtkWindowGroupPrivate;

/** */
struct GtkWindowPrivate;

/**
    Abstract interface type for the D-Bus interface <link linkend="gdbus-interface-org-Gtk-MountOperationHandler.top_of_page">org.Gtk.MountOperationHandler</link>.
*/
struct _GtkMountOperationHandler;

/**
    Class structure for #_GtkMountOperationHandlerProxy.
*/
struct _GtkMountOperationHandlerProxyClass
{
  /**
      The parent class.
  */
  GDBusProxyClass parentClass;
}

/** */
struct _GtkMountOperationHandlerProxyPrivate;

/**
    Class structure for #_GtkMountOperationHandlerSkeleton.
*/
struct _GtkMountOperationHandlerSkeletonClass
{
  /**
      The parent class.
  */
  GDBusInterfaceSkeletonClass parentClass;
}

/** */
struct _GtkMountOperationHandlerSkeletonPrivate;

alias extern(C) gboolean function(GtkAccelGroup* accelGroup, GObject* acceleratable, uint keyval, GdkModifierType modifier) GtkAccelGroupActivate;

alias extern(C) gboolean function(GtkAccelKey* key, GClosure* closure, void* data) GtkAccelGroupFindFunc;

alias extern(C) void function(void* data, const(char)* accelPath, uint accelKey, GdkModifierType accelMods, gboolean changed) GtkAccelMapForeach;

alias extern(C) int function(int currentPage, void* data) GtkAssistantPageFunc;

alias extern(C) void function(GtkBuilder* builder, GObject* object, const(char)* signalName, const(char)* handlerName, GObject* connectObject, GConnectFlags flags, void* userData) GtkBuilderConnectFunc;

alias extern(C) char* function(GtkCalendar* calendar, uint year, uint month, uint day, void* userData) GtkCalendarDetailFunc;

alias extern(C) void function(GtkWidget* widget, void* data) GtkCallback;

alias extern(C) gboolean function(GtkCellRenderer* renderer, const(GdkRectangle)* cellArea, const(GdkRectangle)* cellBackground, void* data) GtkCellAllocCallback;

alias extern(C) gboolean function(GtkCellRenderer* renderer, void* data) GtkCellCallback;

alias extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) GtkCellLayoutDataFunc;

alias extern(C) void function(GtkClipboard* clipboard, void* userDataOrOwner) GtkClipboardClearFunc;

alias extern(C) void function(GtkClipboard* clipboard, GtkSelectionData* selectionData, uint info, void* userDataOrOwner) GtkClipboardGetFunc;

alias extern(C) void function(GtkClipboard* clipboard, GdkPixbuf* pixbuf, void* data) GtkClipboardImageReceivedFunc;

alias extern(C) void function(GtkClipboard* clipboard, GtkSelectionData* selectionData, void* data) GtkClipboardReceivedFunc;

alias extern(C) void function(GtkClipboard* clipboard, GdkAtom format, const(char)* text, size_t length, void* data) GtkClipboardRichTextReceivedFunc;

alias extern(C) void function(GtkClipboard* clipboard, GdkAtom* atoms, int nAtoms, void* data) GtkClipboardTargetsReceivedFunc;

alias extern(C) void function(GtkClipboard* clipboard, const(char)* text, void* data) GtkClipboardTextReceivedFunc;

alias extern(C) void function(GtkClipboard* clipboard, char** uris, void* data) GtkClipboardURIReceivedFunc;

alias extern(C) void function(const(GdkColor)* colors, int nColors) GtkColorSelectionChangePaletteFunc;

alias extern(C) void function(GdkScreen* screen, const(GdkColor)* colors, int nColors) GtkColorSelectionChangePaletteWithScreenFunc;

alias extern(C) gboolean function(GtkEntryCompletion* completion, const(char)* key, GtkTreeIter* iter, void* userData) GtkEntryCompletionMatchFunc;

alias extern(C) gboolean function(const(GtkFileFilterInfo)* filterInfo, void* data) GtkFileFilterFunc;

alias extern(C) GtkWidget* function(GObject* item, void* userData) GtkFlowBoxCreateWidgetFunc;

alias extern(C) gboolean function(GtkFlowBoxChild* child, void* userData) GtkFlowBoxFilterFunc;

alias extern(C) void function(GtkFlowBox* box, GtkFlowBoxChild* child, void* userData) GtkFlowBoxForeachFunc;

alias extern(C) int function(GtkFlowBoxChild* child1, GtkFlowBoxChild* child2, void* userData) GtkFlowBoxSortFunc;

alias extern(C) gboolean function(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data) GtkFontFilterFunc;

alias extern(C) void function(GtkIconView* iconView, GtkTreePath* path, void* data) GtkIconViewForeachFunc;

alias extern(C) int function(GtkWidget* grabWidget, GdkEventKey* event, void* funcData) GtkKeySnoopFunc;

alias extern(C) GtkWidget* function(GObject* item, void* userData) GtkListBoxCreateWidgetFunc;

alias extern(C) gboolean function(GtkListBoxRow* row, void* userData) GtkListBoxFilterFunc;

alias extern(C) void function(GtkListBox* box, GtkListBoxRow* row, void* userData) GtkListBoxForeachFunc;

alias extern(C) int function(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData) GtkListBoxSortFunc;

alias extern(C) void function(GtkListBoxRow* row, GtkListBoxRow* before, void* userData) GtkListBoxUpdateHeaderFunc;

alias extern(C) void function(GtkWidget* attachWidget, GtkMenu* menu) GtkMenuDetachFunc;

alias extern(C) void function(GtkMenu* menu, int* x, int* y, gboolean* pushIn, void* userData) GtkMenuPositionFunc;

alias extern(C) void function(GdkDisplay* display) GtkModuleDisplayInitFunc;

alias extern(C) void function(int* argc, char*** argv) GtkModuleInitFunc;

alias extern(C) void function(GtkPageSetup* pageSetup, void* data) GtkPageSetupDoneFunc;

alias extern(C) void function(const(char)* key, const(char)* value, void* userData) GtkPrintSettingsFunc;

alias extern(C) gboolean function(const(GParamSpec)* pspec, const(GString)* rcString, GValue* propertyValue) GtkRcPropertyParser;

alias extern(C) gboolean function(const(GtkRecentFilterInfo)* filterInfo, void* userData) GtkRecentFilterFunc;

alias extern(C) int function(GtkRecentInfo* a, GtkRecentInfo* b, void* userData) GtkRecentSortFunc;

alias extern(C) gboolean function(const(char)* string_, GValue* value, GError** _err) GtkStylePropertyParser;

alias extern(C) gboolean function(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, GtkTextIter* iter, const(ubyte)* data, size_t length, gboolean createTags, void* userData, GError** _err) GtkTextBufferDeserializeFunc;

alias extern(C) ubyte* function(GtkTextBuffer* registerBuffer, GtkTextBuffer* contentBuffer, const(GtkTextIter)* start, const(GtkTextIter)* end, size_t* length, void* userData) GtkTextBufferSerializeFunc;

alias extern(C) gboolean function(dchar ch, void* userData) GtkTextCharPredicate;

alias extern(C) void function(GtkTextTag* tag, void* data) GtkTextTagTableForeach;

alias extern(C) gboolean function(GtkWidget* widget, GdkFrameClock* frameClock, void* userData) GtkTickCallback;

alias extern(C) char* function(const(char)* path, void* funcData) GtkTranslateFunc;

alias extern(C) void function(GtkTreeViewColumn* treeColumn, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) GtkTreeCellDataFunc;

alias extern(C) void function(GtkTreeView* treeView, GtkTreePath* path, int children, void* userData) GtkTreeDestroyCountFunc;

alias extern(C) int function(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) GtkTreeIterCompareFunc;

alias extern(C) void function(GtkTreeModel* model, GtkTreeIter* iter, GValue* value, int column, void* data) GtkTreeModelFilterModifyFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreeIter* iter, void* data) GtkTreeModelFilterVisibleFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) GtkTreeModelForeachFunc;

alias extern(C) void function(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) GtkTreeSelectionForeachFunc;

alias extern(C) gboolean function(GtkTreeSelection* selection, GtkTreeModel* model, GtkTreePath* path, gboolean pathCurrentlySelected, void* data) GtkTreeSelectionFunc;

alias extern(C) gboolean function(GtkTreeView* treeView, GtkTreeViewColumn* column, GtkTreeViewColumn* prevColumn, GtkTreeViewColumn* nextColumn, void* data) GtkTreeViewColumnDropFunc;

alias extern(C) void function(GtkTreeView* treeView, GtkTreePath* path, void* userData) GtkTreeViewMappingFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreeIter* iter, void* data) GtkTreeViewRowSeparatorFunc;

alias extern(C) gboolean function(GtkTreeModel* model, int column, const(char)* key, GtkTreeIter* iter, void* searchData) GtkTreeViewSearchEqualFunc;

alias extern(C) void function(GtkTreeView* treeView, GtkWidget* searchDialog, void* userData) GtkTreeViewSearchPositionFunc;

