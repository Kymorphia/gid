/// C types for gtk4 library
module gtk.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import gsk.c.types;

/**
    The rectangle representing the area allocated for a widget by its parent.
*/
alias GtkAllocation = GdkRectangle;

/**
    The priority of an accessibility announcement.
*/
enum GtkAccessibleAnnouncementPriority
{
  /** */
  Low = 0,

  /** */
  Medium = 1,

  /** */
  High = 2,
}

/**
    The possible values for the [gtk.types.AccessibleProperty.Autocomplete]
    accessible property.
*/
enum GtkAccessibleAutocomplete
{
  /**
      Automatic suggestions are not displayed.
  */
  None = 0,

  /**
      When a user is providing input, text
         suggesting one way to complete the provided input may be dynamically
         inserted after the caret.
  */
  Inline = 1,

  /**
      When a user is providing input, an element
         containing a collection of values that could complete the provided input
         may be displayed.
  */
  List = 2,

  /**
      When a user is providing input, an element
         containing a collection of values that could complete the provided input
         may be displayed. If displayed, one value in the collection is automatically
         selected, and the text needed to complete the automatically selected value
         appears after the caret in the input.
  */
  Both = 3,
}

/**
    The possible values for the [gtk.types.AccessibleState.Invalid]
    accessible state.
    
    Note that the [gtk.types.AccessibleInvalidState.False] and
    [gtk.types.AccessibleInvalidState.True] have the same values
    as false and true.
*/
enum GtkAccessibleInvalidState
{
  /**
      There are no detected errors in the value
  */
  False = 0,

  /**
      The value entered by the user has failed validation
  */
  True = 1,

  /**
      A grammatical error was detected
  */
  Grammar = 2,

  /**
      A spelling error was detected
  */
  Spelling = 3,
}

/**
    The various platform states which can be queried
    using [gtk.accessible.Accessible.getPlatformState].
*/
enum GtkAccessiblePlatformState
{
  /**
      whether the accessible can be focused
  */
  Focusable = 0,

  /**
      whether the accessible has focus
  */
  Focused = 1,

  /**
      whether the accessible is active
  */
  Active = 2,
}

/**
    The possible accessible properties of a `iface@Accessible`.
*/
enum GtkAccessibleProperty
{
  /**
      Indicates whether inputting text
         could trigger display of one or more predictions of the user's intended
         value for a combobox, searchbox, or textbox and specifies how predictions
         would be presented if they were made. Value type: `enum@AccessibleAutocomplete`
  */
  Autocomplete = 0,

  /**
      Defines a string value that describes
         or annotates the current element. Value type: string
  */
  Description = 1,

  /**
      Indicates the availability and type of
         interactive popup element, such as menu or dialog, that can be triggered
         by an element.
  */
  HasPopup = 2,

  /**
      Indicates keyboard shortcuts that an
         author has implemented to activate or give focus to an element. Value type:
         string
  */
  KeyShortcuts = 3,

  /**
      Defines a string value that labels the current
         element. Value type: string
  */
  Label = 4,

  /**
      Defines the hierarchical level of an element
         within a structure. Value type: integer
  */
  Level = 5,

  /**
      Indicates whether an element is modal when
         displayed. Value type: boolean
  */
  Modal = 6,

  /**
      Indicates whether a text box accepts
         multiple lines of input or only a single line. Value type: boolean
  */
  MultiLine = 7,

  /**
      Indicates that the user may select
         more than one item from the current selectable descendants. Value type:
         boolean
  */
  MultiSelectable = 8,

  /**
      Indicates whether the element's
         orientation is horizontal, vertical, or unknown/ambiguous. Value type:
         `enum@Orientation`
  */
  Orientation = 9,

  /**
      Defines a short hint (a word or short
         phrase) intended to aid the user with data entry when the control has no
         value. A hint could be a sample value or a brief description of the expected
         format. Value type: string
  */
  Placeholder = 10,

  /**
      Indicates that the element is not editable,
         but is otherwise operable. Value type: boolean
  */
  ReadOnly = 11,

  /**
      Indicates that user input is required on
         the element before a form may be submitted. Value type: boolean
  */
  Required = 12,

  /**
      Defines a human-readable,
         author-localized description for the role of an element. Value type: string
  */
  RoleDescription = 13,

  /**
      Indicates if items in a table or grid are
         sorted in ascending or descending order. Value type: `enum@AccessibleSort`
  */
  Sort = 14,

  /**
      Defines the maximum allowed value for a
         range widget. Value type: double
  */
  ValueMax = 15,

  /**
      Defines the minimum allowed value for a
         range widget. Value type: double
  */
  ValueMin = 16,

  /**
      Defines the current value for a range widget.
         Value type: double
  */
  ValueNow = 17,

  /**
      Defines the human readable text alternative
         of aria-valuenow for a range widget. Value type: string
  */
  ValueText = 18,
}

/**
    The possible accessible relations of a `iface@Accessible`.
    
    Accessible relations can be references to other widgets,
    integers or strings.
*/
enum GtkAccessibleRelation
{
  /**
      Identifies the currently active
         element when focus is on a composite widget, combobox, textbox, group,
         or application. Value type: reference
  */
  ActiveDescendant = 0,

  /**
      Defines the total number of columns
         in a table, grid, or treegrid. Value type: integer
  */
  ColCount = 1,

  /**
      Defines an element's column index or
         position with respect to the total number of columns within a table,
         grid, or treegrid. Value type: integer
  */
  ColIndex = 2,

  /**
      Defines a human readable text
        alternative of [gtk.types.AccessibleRelation.ColIndex]. Value type: string
  */
  ColIndexText = 3,

  /**
      Defines the number of columns spanned
        by a cell or gridcell within a table, grid, or treegrid. Value type: integer
  */
  ColSpan = 4,

  /**
      Identifies the element (or elements) whose
         contents or presence are controlled by the current element. Value type: reference
  */
  Controls = 5,

  /**
      Identifies the element (or elements)
         that describes the object. Value type: reference
  */
  DescribedBy = 6,

  /**
      Identifies the element (or elements) that
         provide additional information related to the object. Value type: reference
  */
  Details = 7,

  /**
      Identifies the element that provides
         an error message for an object. Value type: reference
  */
  ErrorMessage = 8,

  /**
      Identifies the next element (or elements)
         in an alternate reading order of content which, at the user's discretion,
         allows assistive technology to override the general default of reading in
         document source order. Value type: reference
  */
  FlowTo = 9,

  /**
      Identifies the element (or elements)
         that labels the current element. Value type: reference
  */
  LabelledBy = 10,

  /**
      Identifies an element (or elements) in order
         to define a visual, functional, or contextual parent/child relationship
         between elements where the widget hierarchy cannot be used to represent
         the relationship. Value type: reference
  */
  Owns = 11,

  /**
      Defines an element's number or position
         in the current set of listitems or treeitems. Value type: integer
  */
  PosInSet = 12,

  /**
      Defines the total number of rows in a table,
         grid, or treegrid. Value type: integer
  */
  RowCount = 13,

  /**
      Defines an element's row index or position
         with respect to the total number of rows within a table, grid, or treegrid.
         Value type: integer
  */
  RowIndex = 14,

  /**
      Defines a human readable text
         alternative of aria-rowindex. Value type: string
  */
  RowIndexText = 15,

  /**
      Defines the number of rows spanned by a
         cell or gridcell within a table, grid, or treegrid. Value type: integer
  */
  RowSpan = 16,

  /**
      Defines the number of items in the current
         set of listitems or treeitems. Value type: integer
  */
  SetSize = 17,
}

/**
    The accessible role for a `iface@Accessible` implementation.
    
    Abstract roles are only used as part of the ontology; application
    developers must not use abstract roles in their code.
*/
enum GtkAccessibleRole
{
  /**
      An element with important, and usually
        time-sensitive, information
  */
  Alert = 0,

  /**
      A type of dialog that contains an
        alert message
  */
  AlertDialog = 1,

  /**
      Unused
  */
  Banner = 2,

  /**
      An input element that allows for
        user-triggered actions when clicked or pressed
  */
  Button = 3,

  /**
      Unused
  */
  Caption = 4,

  /**
      Unused
  */
  Cell = 5,

  /**
      A checkable input element that has
        three possible values: `true`, `false`, or `mixed`
  */
  Checkbox = 6,

  /**
      A header in a columned list.
  */
  ColumnHeader = 7,

  /**
      An input that controls another element,
        such as a list or a grid, that can dynamically pop up to help the user
        set the value of the input
  */
  ComboBox = 8,

  /**
      Abstract role.
  */
  Command = 9,

  /**
      Abstract role.
  */
  Composite = 10,

  /**
      A dialog is a window that is designed to interrupt
        the current processing of an application in order to prompt the user to enter
        information or require a response.
  */
  Dialog = 11,

  /**
      Content that assistive technology users may want to
        browse in a reading mode.
  */
  Document = 12,

  /**
      Unused
  */
  Feed = 13,

  /**
      Unused
  */
  Form = 14,

  /**
      A nameless container that has no semantic meaning
        of its own. This is the role that GTK uses by default for widgets.
  */
  Generic = 15,

  /**
      A grid of items.
  */
  Grid = 16,

  /**
      An item in a grid or tree grid.
  */
  GridCell = 17,

  /**
      An element that groups multiple related widgets. GTK uses
        this role for various containers, like [gtk.header_bar.HeaderBar] or [gtk.notebook.Notebook].
  */
  Group = 18,

  /**
      Unused
  */
  Heading = 19,

  /**
      An image.
  */
  Img = 20,

  /**
      Abstract role.
  */
  Input = 21,

  /**
      A visible name or caption for a user interface component.
  */
  Label = 22,

  /**
      Abstract role.
  */
  Landmark = 23,

  /**
      Unused
  */
  Legend = 24,

  /**
      A clickable link.
  */
  Link = 25,

  /**
      A list of items.
  */
  List = 26,

  /**
      Unused.
  */
  ListBox = 27,

  /**
      An item in a list.
  */
  ListItem = 28,

  /**
      Unused
  */
  Log = 29,

  /**
      Unused
  */
  Main = 30,

  /**
      Unused
  */
  Marquee = 31,

  /**
      Unused
  */
  Math = 32,

  /**
      An element that represents a value within a known range.
  */
  Meter = 33,

  /**
      A menu.
  */
  Menu = 34,

  /**
      A menubar.
  */
  MenuBar = 35,

  /**
      An item in a menu.
  */
  MenuItem = 36,

  /**
      A check item in a menu.
  */
  MenuItemCheckbox = 37,

  /**
      A radio item in a menu.
  */
  MenuItemRadio = 38,

  /**
      Unused
  */
  Navigation = 39,

  /**
      An element that is not represented to accessibility technologies.
        This role is synonymous to @GTK_ACCESSIBLE_ROLE_PRESENTATION.
  */
  None = 40,

  /**
      Unused
  */
  Note = 41,

  /**
      Unused
  */
  Option = 42,

  /**
      An element that is not represented to accessibility technologies.
        This role is synonymous to @GTK_ACCESSIBLE_ROLE_NONE.
  */
  Presentation = 43,

  /**
      An element that displays the progress
        status for tasks that take a long time.
  */
  ProgressBar = 44,

  /**
      A checkable input in a group of radio roles,
        only one of which can be checked at a time.
  */
  Radio = 45,

  /**
      Unused
  */
  RadioGroup = 46,

  /**
      Abstract role.
  */
  Range = 47,

  /**
      Unused
  */
  Region = 48,

  /**
      A row in a columned list.
  */
  Row = 49,

  /**
      Unused
  */
  RowGroup = 50,

  /**
      Unused
  */
  RowHeader = 51,

  /**
      A graphical object that controls the scrolling
        of content within a viewing area, regardless of whether the content is fully
        displayed within the viewing area.
  */
  Scrollbar = 52,

  /**
      Unused
  */
  Search = 53,

  /**
      A type of textbox intended for specifying
        search criteria.
  */
  SearchBox = 54,

  /**
      Abstract role.
  */
  Section = 55,

  /**
      Abstract role.
  */
  SectionHead = 56,

  /**
      Abstract role.
  */
  Select = 57,

  /**
      A divider that separates and distinguishes
        sections of content or groups of menuitems.
  */
  Separator = 58,

  /**
      A user input where the user selects a value
        from within a given range.
  */
  Slider = 59,

  /**
      A form of range that expects the user to
        select from among discrete choices.
  */
  SpinButton = 60,

  /**
      Unused
  */
  Status = 61,

  /**
      Abstract role.
  */
  Structure = 62,

  /**
      A type of checkbox that represents on/off values,
        as opposed to checked/unchecked values.
  */
  Switch = 63,

  /**
      An item in a list of tab used for switching pages.
  */
  Tab = 64,

  /**
      Unused
  */
  Table = 65,

  /**
      A list of tabs for switching pages.
  */
  TabList = 66,

  /**
      A page in a notebook or stack.
  */
  TabPanel = 67,

  /**
      A type of input that allows free-form text
        as its value.
  */
  TextBox = 68,

  /**
      Unused
  */
  Time = 69,

  /**
      Unused
  */
  Timer = 70,

  /**
      Unused
  */
  Toolbar = 71,

  /**
      Unused
  */
  Tooltip = 72,

  /**
      Unused
  */
  Tree = 73,

  /**
      A treeview-like, columned list.
  */
  TreeGrid = 74,

  /**
      Unused
  */
  TreeItem = 75,

  /**
      Abstract role for interactive components of a
        graphical user interface
  */
  Widget = 76,

  /**
      Abstract role for windows.
  */
  Window = 77,

  /**
      A type of push button which stays pressed until depressed by a second
      activation.
  */
  ToggleButton = 78,

  /**
      A toplevel element of a graphical user interface.
      
      This is the role that GTK uses by default for windows.
  */
  Application = 79,

  /**
      A paragraph of content.
  */
  Paragraph = 80,

  /**
      A section of content that is quoted from another source.
  */
  BlockQuote = 81,

  /**
      A section of a page that consists of a composition that forms an independent
      part of a document, page, or site.
  */
  Article = 82,

  /**
      A comment contains content expressing reaction to other content.
  */
  Comment = 83,

  /**
      A virtual terminal.
  */
  Terminal = 84,
}

/**
    The possible values for the [gtk.types.AccessibleProperty.Sort]
    accessible property.
*/
enum GtkAccessibleSort
{
  /**
      There is no defined sort applied to the column.
  */
  None = 0,

  /**
      Items are sorted in ascending order by this column.
  */
  Ascending = 1,

  /**
      Items are sorted in descending order by this column.
  */
  Descending = 2,

  /**
      A sort algorithm other than ascending or
         descending has been applied.
  */
  Other = 3,
}

/**
    The possible accessible states of a `iface@Accessible`.
*/
enum GtkAccessibleState
{
  /**
      A “busy” state. This state has boolean values
  */
  Busy = 0,

  /**
      A “checked” state; indicates the current
        state of a `class@CheckButton`. Value type: `enum@AccessibleTristate`
  */
  Checked = 1,

  /**
      A “disabled” state; corresponds to the
        `property@Widget:sensitive` property. It indicates a UI element
        that is perceivable, but not editable or operable. Value type: boolean
  */
  Disabled = 2,

  /**
      An “expanded” state; corresponds to the
        `property@Expander:expanded` property. Value type: boolean
        or undefined
  */
  Expanded = 3,

  /**
      A “hidden” state; corresponds to the
        `property@Widget:visible` property. You can use this state
        explicitly on UI elements that should not be exposed to an assistive
        technology. Value type: boolean
        See also: [gtk.types.AccessibleState.Disabled]
  */
  Hidden = 4,

  /**
      An “invalid” state; set when a widget
        is showing an error. Value type: `enum@AccessibleInvalidState`
  */
  Invalid = 5,

  /**
      A “pressed” state; indicates the current
        state of a `class@ToggleButton`. Value type: `enum@AccessibleTristate`
        enumeration
  */
  Pressed = 6,

  /**
      A “selected” state; set when a widget
        is selected. Value type: boolean or undefined
  */
  Selected = 7,

  /**
      Indicates that a widget with the GTK_ACCESSIBLE_ROLE_LINK has been visited.
      Value type: boolean.
  */
  Visited = 8,
}

/**
    The type of contents change operation.
*/
enum GtkAccessibleTextContentChange
{
  /**
      contents change as the result of
        an insert operation
  */
  Insert = 0,

  /**
      contents change as the result of
        a remove operation
  */
  Remove = 1,
}

/**
    The granularity for queries about the text contents of a [gtk.accessible_text.AccessibleText]
    implementation.
*/
enum GtkAccessibleTextGranularity
{
  /**
      Use the boundary between
        characters (including non-printing characters)
  */
  Character = 0,

  /**
      Use the boundary between words,
        starting from the beginning of the current word and ending at the
        beginning of the next word
  */
  Word = 1,

  /**
      Use the boundary between
        sentences, starting from the beginning of the current sentence and
        ending at the beginning of the next sentence
  */
  Sentence = 2,

  /**
      Use the boundary between lines,
        starting from the beginning of the current line and ending at the
        beginning of the next line
  */
  Line = 3,

  /**
      Use the boundary between
        paragraphs, starting from the beginning of the current paragraph and
        ending at the beginning of the next paragraph
  */
  Paragraph = 4,
}

/**
    The possible values for the [gtk.types.AccessibleState.Pressed]
    accessible state.
    
    Note that the [gtk.types.AccessibleTristate.False] and
    [gtk.types.AccessibleTristate.True] have the same values
    as false and true.
*/
enum GtkAccessibleTristate
{
  /**
      The state is `false`
  */
  False = 0,

  /**
      The state is `true`
  */
  True = 1,

  /**
      The state is `mixed`
  */
  Mixed = 2,
}

/**
    Controls how a widget deals with extra space in a single dimension.
    
    Alignment only matters if the widget receives a “too large” allocation,
    for example if you packed the widget with the [gtk.widget.Widget.hexpand]
    property inside a `class@Box`, then the widget might get extra space.
    If you have for example a 16x16 icon inside a 32x32 space, the icon
    could be scaled and stretched, it could be centered, or it could be
    positioned to one side of the space.
    
    Note that in horizontal context [gtk.types.Align.Start] and [gtk.types.Align.End]
    are interpreted relative to text direction.
    
    Baseline support is optional for containers and widgets, and is only available
    for vertical alignment. `GTK_ALIGN_BASELINE_CENTER and [gtk.types.Align.BaselineFill]
    are treated similar to [gtk.types.Align.Center] and [gtk.types.Align.Fill], except that it
    positions the widget to line up the baselines, where that is supported.
*/
enum GtkAlign
{
  /**
      stretch to fill all space if possible, center if
        no meaningful way to stretch
  */
  Fill = 0,

  /**
      snap to left or top side, leaving space on right or bottom
  */
  Start = 1,

  /**
      snap to right or bottom side, leaving space on left or top
  */
  End = 2,

  /**
      center natural width of widget inside the allocation
  */
  Center = 3,

  /**
      a different name for [gtk.types.Align.Baseline].
  */
  BaselineFill = 4,

  /**
      align the widget according to the baseline.
  
      Deprecated: Use [gtk.types.Align.BaselineFill] instead
  */
  Baseline = 4,

  /**
      stretch to fill all space, but align the baseline.
  */
  BaselineCenter = 5,
}

/**
    Types of user actions that may be blocked by [gtk.application.Application].
    
    See [gtk.application.Application.inhibit].
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
      No arrow.
  */
  None = 4,
}

/**
    Determines the page role inside a [gtk.assistant.Assistant].
    
    The role is used to handle buttons sensitivity and visibility.
    
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
    Baseline position in a row of widgets.
    
    Whenever a container has some form of natural row it may align
    children in that row along a common typographical baseline. If
    the amount of vertical space in the row is taller than the total
    requested height of the baseline-aligned children then it can use a
    [gtk.types.BaselinePosition] to select where to put the baseline inside the
    extra available space.
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
      Same as [gtk.types.BorderStyle.None]
  */
  Hidden = 1,

  /**
      A single line segment
  */
  Solid = 2,

  /**
      Looks as if the content is sunken into the canvas
  */
  Inset = 3,

  /**
      Looks as if the content is coming out of the canvas
  */
  Outset = 4,

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
    The list of flags that can be passed to [gtk.builder.Builder.createClosure].
    
    New values may be added in the future for new features, so external
    implementations of [gtk.builder_scope.BuilderScope] should test the flags
    for unknown values and raise a [gtk.types.BuilderError.InvalidAttribute] error
    when they encounter one.
*/
enum GtkBuilderClosureFlags : uint
{
  /**
      The closure should be created swapped. See
        [gobject.cclosure.CClosure.newSwap] for details.
  */
  Swapped = 1,
}

/**
    Error codes that identify various errors that can occur while using
    [gtk.builder.Builder].
*/
enum GtkBuilderError
{
  /**
      A type-func attribute didn’t name
       a function that returns a `GType`.
  */
  InvalidTypeFunction = 0,

  /**
      The input contained a tag that [gtk.builder.Builder]
       can’t handle.
  */
  UnhandledTag = 1,

  /**
      An attribute that is required by
       [gtk.builder.Builder] was missing.
  */
  MissingAttribute = 2,

  /**
      [gtk.builder.Builder] found an attribute that
       it doesn’t understand.
  */
  InvalidAttribute = 3,

  /**
      [gtk.builder.Builder] found a tag that
       it doesn’t understand.
  */
  InvalidTag = 4,

  /**
      A required property value was
       missing.
  */
  MissingPropertyValue = 5,

  /**
      [gtk.builder.Builder] couldn’t parse
       some attribute value.
  */
  InvalidValue = 6,

  /**
      The input file requires a newer version
       of GTK.
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
      An object id is unknown.
  */
  InvalidId = 13,

  /**
      A function could not be found. This often happens
        when symbols are set to be kept private. Compiling code with -rdynamic or using the
        `gmodule-export-2.0` pkgconfig module can fix this problem.
  */
  InvalidFunction = 14,
}

/**
    Prebuilt sets of buttons for [gtk.dialog.Dialog].
    
    If none of these choices are appropriate, simply use
    [gtk.types.ButtonsType.None] and call [gtk.dialog.Dialog.addButtons].
    
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
    The available modes for `property@Gtk.CellRendererAccel:accel-mode`.
*/
enum GtkCellRendererAccelMode
{
  /**
      GTK accelerators mode
  */
  Gtk = 0,

  /**
      Other accelerator mode
  */
  Other = 1,
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
      The cell is in a row that can be expanded
  */
  Expandable = 32,

  /**
      The cell is in a row that is expanded
  */
  Expanded = 64,
}

/**
    Describes how a [gtk.string_sorter.StringSorter] turns strings into sort keys to
    compare them.
    
    Note that the result of sorting will in general depend on the current locale
    unless the mode is @GTK_COLLATION_NONE.
*/
enum GtkCollation
{
  /**
      Don't do any collation
  */
  None = 0,

  /**
      Use `func@GLib.utf8_collate_key`
  */
  Unicode = 1,

  /**
      Use `func@GLib.utf8_collate_key_for_filename`
  */
  Filename = 2,
}

/**
    The widget attributes that can be used when creating a `class@Constraint`.
*/
enum GtkConstraintAttribute
{
  /**
      No attribute, used for constant
        relations
  */
  None = 0,

  /**
      The left edge of a widget, regardless of
        text direction
  */
  Left = 1,

  /**
      The right edge of a widget, regardless
        of text direction
  */
  Right = 2,

  /**
      The top edge of a widget
  */
  Top = 3,

  /**
      The bottom edge of a widget
  */
  Bottom = 4,

  /**
      The leading edge of a widget, depending
        on text direction; equivalent to [gtk.types.ConstraintAttribute.Left] for LTR
        languages, and [gtk.types.ConstraintAttribute.Right] for RTL ones
  */
  Start = 5,

  /**
      The trailing edge of a widget, depending
        on text direction; equivalent to [gtk.types.ConstraintAttribute.Right] for LTR
        languages, and [gtk.types.ConstraintAttribute.Left] for RTL ones
  */
  End = 6,

  /**
      The width of a widget
  */
  Width = 7,

  /**
      The height of a widget
  */
  Height = 8,

  /**
      The center of a widget, on the
        horizontal axis
  */
  CenterX = 9,

  /**
      The center of a widget, on the
        vertical axis
  */
  CenterY = 10,

  /**
      The baseline of a widget
  */
  Baseline = 11,
}

/**
    The relation between two terms of a constraint.
*/
enum GtkConstraintRelation
{
  /**
      Less than, or equal
  */
  Le = -1,

  /**
      Equal
  */
  Eq = 0,

  /**
      Greater than, or equal
  */
  Ge = 1,
}

/**
    The strength of a constraint, expressed as a symbolic constant.
    
    The strength of a `class@Constraint` can be expressed with any positive
    integer; the values of this enumeration can be used for readability.
*/
enum GtkConstraintStrength
{
  /**
      The constraint is required towards solving the layout
  */
  Required = 1001001000,

  /**
      A strong constraint
  */
  Strong = 1000000000,

  /**
      A medium constraint
  */
  Medium = 1000,

  /**
      A weak constraint
  */
  Weak = 1,
}

/**
    Domain for VFL parsing errors.
*/
enum GtkConstraintVflParserError
{
  /**
      Invalid or unknown symbol
  */
  Symbol = 0,

  /**
      Invalid or unknown attribute
  */
  Attribute = 1,

  /**
      Invalid or unknown view
  */
  View = 2,

  /**
      Invalid or unknown metric
  */
  Metric = 3,

  /**
      Invalid or unknown priority
  */
  Priority = 4,

  /**
      Invalid or unknown relation
  */
  Relation = 5,
}

/**
    Controls how a content should be made to fit inside an allocation.
*/
enum GtkContentFit
{
  /**
      Make the content fill the entire allocation,
        without taking its aspect ratio in consideration. The resulting
        content will appear as stretched if its aspect ratio is different
        from the allocation aspect ratio.
  */
  Fill = 0,

  /**
      Scale the content to fit the allocation,
        while taking its aspect ratio in consideration. The resulting
        content will appear as letterboxed if its aspect ratio is different
        from the allocation aspect ratio.
  */
  Contain = 1,

  /**
      Cover the entire allocation, while taking
        the content aspect ratio in consideration. The resulting content
        will appear as clipped if its aspect ratio is different from the
        allocation aspect ratio.
  */
  Cover = 2,

  /**
      The content is scaled down to fit the
        allocation, if needed, otherwise its original size is used.
  */
  ScaleDown = 3,
}

/**
    Specifies which corner a child widget should be placed in when packed into
    a `GtkScrolledWindow.`
    
    This is effectively the opposite of where the scroll bars are placed.
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
    Errors that can occur while parsing CSS.
    
    These errors are unexpected and will cause parts of the given CSS
    to be ignored.
*/
enum GtkCssParserError
{
  /**
      Unknown failure.
  */
  Failed = 0,

  /**
      The given text does not form valid syntax
  */
  Syntax = 1,

  /**
      Failed to import a resource
  */
  Import = 2,

  /**
      The given name has not been defined
  */
  Name = 3,

  /**
      The given value is not correct
  */
  UnknownValue = 4,
}

/**
    Warnings that can occur while parsing CSS.
    
    Unlike [gtk.types.CssParserError]s, warnings do not cause the parser to
    skip any input, but they indicate issues that should be fixed.
*/
enum GtkCssParserWarning
{
  /**
      The given construct is
        deprecated and will be removed in a future version
  */
  Deprecated = 0,

  /**
      A syntax construct was used
        that should be avoided
  */
  Syntax = 1,

  /**
      A feature is not implemented
  */
  Unimplemented = 2,
}

/**
    Flags to use with [gtk.global.setDebugFlags].
    
    Settings these flags causes GTK to print out different
    types of debugging information. Some of these flags are
    only available when GTK has been configured with `-Ddebug=true`.
*/
enum GtkDebugFlags : uint
{
  /**
      Information about GtkTextView
  */
  Text = 1,

  /**
      Information about GtkTreeView
  */
  Tree = 2,

  /**
      Information about keyboard shortcuts
  */
  Keybindings = 4,

  /**
      Information about modules and extensions
  */
  Modules = 8,

  /**
      Information about size allocation
  */
  Geometry = 16,

  /**
      Information about icon themes
  */
  Icontheme = 32,

  /**
      Information about printing
  */
  Printing = 64,

  /**
      Trace GtkBuilder operation
  */
  Builder = 128,

  /**
      Information about size requests
  */
  SizeRequest = 256,

  /**
      Disable the style property cache
  */
  NoCssCache = 512,

  /**
      Open the GTK inspector
  */
  Interactive = 1024,

  /**
      Information about actions and menu models
  */
  Actions = 4096,

  /**
      Information from layout managers
  */
  Layout = 8192,

  /**
      Include debug render nodes in the generated snapshots
  */
  Snapshot = 16384,

  /**
      Information from the constraints solver
  */
  Constraints = 32768,

  /**
      Log unused GtkBuilder objects
  */
  BuilderObjects = 65536,

  /**
      Information about accessibility state changes
  */
  A11y = 131072,

  /**
      Information about icon fallback.
  */
  Iconfallback = 262144,

  /**
      Inverts the default text-direction.
  */
  InvertTextDir = 524288,
}

/**
    Passed to various keybinding signals for deleting text.
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
        refers to the visible lines, with respect to the current line
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
    Error codes in the `GTK_DIALOG_ERROR` domain that can be returned
    by async dialog functions.
*/
enum GtkDialogError
{
  /**
      Generic error condition for when
        an operation fails and no more specific code is applicable
  */
  Failed = 0,

  /**
      The async function call was cancelled
        via its [gio.cancellable.Cancellable]
  */
  Cancelled = 1,

  /**
      The operation was cancelled
        by the user (via a Cancel or Close button)
  */
  Dismissed = 2,
}

/**
    Flags used to influence dialog construction.
*/
enum GtkDialogFlags : uint
{
  /**
      Make the constructed dialog modal
  */
  Modal = 1,

  /**
      Destroy the dialog when its parent is destroyed
  */
  DestroyWithParent = 2,

  /**
      Create dialog with actions in header
        bar instead of action area
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
    The identifiers for [gtk.editable.Editable] properties.
    
    See [gtk.editable.Editable.installProperties] for details on how to
    implement the [gtk.editable.Editable] interface.
*/
enum GtkEditableProperties
{
  /**
      the property id for [gtk.editable.Editable.text]
  */
  PropText = 0,

  /**
      the property id for `property@Gtk.Editable:cursor-position`
  */
  PropCursorPosition = 1,

  /**
      the property id for `property@Gtk.Editable:selection-bound`
  */
  PropSelectionBound = 2,

  /**
      the property id for [gtk.editable.Editable.editable]
  */
  PropEditable = 3,

  /**
      the property id for `property@Gtk.Editable:width-chars`
  */
  PropWidthChars = 4,

  /**
      the property id for `property@Gtk.Editable:max-width-chars`
  */
  PropMaxWidthChars = 5,

  /**
      the property id for [gtk.editable.Editable.xalign]
  */
  PropXalign = 6,

  /**
      the property id for `property@Gtk.Editable:enable-undo`
  */
  PropEnableUndo = 7,

  /**
      the number of properties
  */
  NumProperties = 8,
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
    Describes the behavior of a [gtk.event_controller_scroll.EventControllerScroll].
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
      Emit ::decelerate after continuous scroll finishes.
  */
  Kinetic = 8,

  /**
      Emit scroll on both axes.
  */
  BothAxes = 3,
}

/**
    Describes the state of a [gdk.event_sequence.EventSequence] in a `class@Gesture`.
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
    Describes whether a [gtk.file_chooser.FileChooser] is being used to open existing files
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
}

/**
    These identify the various errors that can occur while calling
    [gtk.file_chooser.FileChooser] functions.
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
      Indicates an incomplete hostname
       (e.g. "http://foo" without a slash after that).
  */
  IncompleteHostname = 3,
}

/**
    Describes changes in a filter in more detail and allows objects
    using the filter to optimize refiltering items.
    
    If you are writing an implementation and are not sure which
    value to pass, [gtk.types.FilterChange.Different] is always a correct
    choice.
*/
enum GtkFilterChange
{
  /**
      The filter change cannot be
        described with any of the other enumeration values.
  */
  Different = 0,

  /**
      The filter is less strict than
        it was before: All items that it used to return true for
        still return true, others now may, too.
  */
  LessStrict = 1,

  /**
      The filter is more strict than
        it was before: All items that it used to return false for
        still return false, others now may, too.
  */
  MoreStrict = 2,
}

/**
    Describes the known strictness of a filter.
    
    Note that for filters where the strictness is not known,
    [gtk.types.FilterMatch.Some] is always an acceptable value,
    even if a filter does match all or no items.
*/
enum GtkFilterMatch
{
  /**
      The filter matches some items,
        [gtk.filter.Filter.match] may return true or false
  */
  Some = 0,

  /**
      The filter does not match any item,
        [gtk.filter.Filter.match] will always return false.
  */
  None = 1,

  /**
      The filter matches all items,
        [gtk.filter.Filter.match] will alays return true.
  */
  All = 2,
}

/**
    Specifies the granularity of font selection
    that is desired in a [gtk.font_chooser.FontChooser].
    
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

  /**
      Allow changing OpenType font variation axes
  */
  Variations = 4,

  /**
      Allow selecting specific OpenType font features
  */
  Features = 8,
}

/**
    The level of granularity for the font selection.
    
    Depending on this value, the [pango.font_description.FontDescription] that
    is returned by [gtk.font_dialog_button.FontDialogButton.getFontDesc]
    will have more or less fields set.
*/
enum GtkFontLevel
{
  /**
      Select a font family
  */
  Family = 0,

  /**
      Select a font face (i.e. a family and a style)
  */
  Face = 1,

  /**
      Select a font (i.e. a face with a size, and possibly font variations)
  */
  Font = 2,

  /**
      Select a font and font features
  */
  Features = 3,
}

/**
    Represents the state of graphics offlodading.
*/
enum GtkGraphicsOffloadEnabled
{
  /**
      Graphics offloading is enabled.
  */
  Enabled = 0,

  /**
      Graphics offloading is disabled.
  */
  Disabled = 1,
}

/**
    Used to specify options for [gtk.icon_theme.IconTheme.lookupIcon].
*/
enum GtkIconLookupFlags : uint
{
  /**
      Try to always load regular icons, even
        when symbolic icon names are given
  */
  ForceRegular = 1,

  /**
      Try to always load symbolic icons, even
        when regular icon names are given
  */
  ForceSymbolic = 2,

  /**
      Starts loading the texture in the background
        so it is ready when later needed.
  */
  Preload = 4,
}

/**
    Built-in icon sizes.
    
    Icon sizes default to being inherited. Where they cannot be
    inherited, text size is the default.
    
    All widgets which use [gtk.types.IconSize] set the normal-icons or
    large-icons style classes correspondingly, and let themes
    determine the actual size to be used with the
    `-gtk-icon-size` CSS property.
*/
enum GtkIconSize
{
  /**
      Keep the size of the parent element
  */
  Inherit = 0,

  /**
      Size similar to text size
  */
  Normal = 1,

  /**
      Large size, for example in an icon view
  */
  Large = 2,
}

/**
    Error codes for [gtk.icon_theme.IconTheme] operations.
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
      dropped item is inserted to the left
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
    Describes the image data representation used by a [gtk.image.Image].
    
    If you want to get the image from the widget, you can only get the
    currently-stored representation; for instance, if the [gtk.image.Image.getStorageType]
    returns [gtk.types.ImageType.Paintable], then you can call [gtk.image.Image.getPaintable].
    
    For empty images, you can request any storage type (call any of the "get"
    functions), but they will all return null values.
*/
enum GtkImageType
{
  /**
      there is no image displayed by the widget
  */
  Empty = 0,

  /**
      the widget contains a named icon
  */
  IconName = 1,

  /**
      the widget contains a [gio.icon.Icon]
  */
  Gicon = 2,

  /**
      the widget contains a [gdk.paintable.Paintable]
  */
  Paintable = 3,
}

/**
    Describes hints that might be taken into account by input methods
    or applications.
    
    Note that input methods may already tailor their behaviour according
    to the `enum@InputPurpose` of the entry.
    
    Some common sense is expected when using these flags - mixing
    [gtk.types.InputHints.Lowercase] with any of the uppercase hints makes no sense.
    
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
      The text is vertical
  */
  VerticalWriting = 256,

  /**
      Suggest offering Emoji support
  */
  Emoji = 512,

  /**
      Suggest not offering Emoji support
  */
  NoEmoji = 1024,

  /**
      Request that the input method should not
         update personalized data (like typing history)
  */
  Private = 2048,
}

/**
    Describes primary purpose of the input widget.
    
    This information is useful for on-screen keyboards and similar input
    methods to decide which keys should be presented to the user.
    
    Note that the purpose is not meant to impose a totally strict rule
    about allowed characters, and does not replace input validation.
    It is fine for an on-screen keyboard to let the user override the
    character set restriction that is expressed by the purpose. The
    application is expected to validate the entry contents, even if
    it specified a purpose.
    
    The difference between [gtk.types.InputPurpose.Digits] and
    [gtk.types.InputPurpose.Number] is that the former accepts only digits
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
      Like [gtk.types.InputPurpose.FreeForm], but characters are hidden
  */
  Password = 8,

  /**
      Like [gtk.types.InputPurpose.Digits], but characters are hidden
  */
  Pin = 9,

  /**
      Allow any character, in addition to control codes
  */
  Terminal = 10,
}

/**
    The different methods to handle text in #GtkInscription when it doesn't
    fit the available space.
*/
enum GtkInscriptionOverflow
{
  /**
      Clip the remaining text
  */
  Clip = 0,

  /**
      Omit characters at the start of the text
  */
  EllipsizeStart = 1,

  /**
      Omit characters at the middle of the text
  */
  EllipsizeMiddle = 2,

  /**
      Omit characters at the end of the text
  */
  EllipsizeEnd = 3,
}

/**
    Used for justifying the text inside a `class@Label` widget.
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
    Describes how `class@LevelBar` contents should be rendered.
    
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
      The GNU General Public License, version 2.0 only
  */
  Gpl20Only = 9,

  /**
      The GNU General Public License, version 3.0 only
  */
  Gpl30Only = 10,

  /**
      The GNU Lesser General Public License, version 2.1 only
  */
  Lgpl21Only = 11,

  /**
      The GNU Lesser General Public License, version 3.0 only
  */
  Lgpl30Only = 12,

  /**
      The GNU Affero General Public License, version 3.0 or later
  */
  Agpl30 = 13,

  /**
      The GNU Affero General Public License, version 3.0 only
  */
  Agpl30Only = 14,

  /**
      The 3-clause BSD licence
  */
  Bsd3 = 15,

  /**
      The Apache License, version 2.0
  */
  Apache20 = 16,

  /**
      The Mozilla Public License, version 2.0
  */
  Mpl20 = 17,

  /**
      Zero-Clause BSD license
  */
  _0bsd = 18,
}

/**
    List of actions to perform when scrolling to items in
    a list widget.
*/
enum GtkListScrollFlags : uint
{
  /**
      Don't do anything extra
  */
  None = 0,

  /**
      Focus the target item
  */
  Focus = 1,

  /**
      Select the target item and
        unselect all other items.
  */
  Select = 2,
}

/**
    Used to configure the focus behavior in the [gtk.types.DirectionType.TabForward]
    and [gtk.types.DirectionType.TabBackward] direction, like the <kbd>Tab</kbd> key
    in a [gtk.list_view.ListView].
*/
enum GtkListTabBehavior
{
  /**
      Cycle through all focusable items of the list
  */
  All = 0,

  /**
      Cycle through a single list element, then move
        focus out of the list. Moving focus between items needs to be
        done with the arrow keys.
  */
  Item = 1,

  /**
      Cycle only through a single cell, then
        move focus out of the list. Moving focus between cells needs to
        be done with the arrow keys. This is only relevant for
        cell-based widgets like #GtkColumnView, otherwise it behaves
        like [gtk.types.ListTabBehavior.Item].
  */
  Cell = 2,
}

/**
    The type of message being displayed in a `class@MessageDialog`.
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

/**
    Passed as argument to various keybinding signals for moving the
    cursor position.
*/
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

/**
    Options for selecting a different wrap mode for natural size
    requests.
    
    See for example the `property@Gtk.Label:natural-wrap-mode` property.
*/
enum GtkNaturalWrapMode
{
  /**
      Inherit the minimum size request.
        In particular, this should be used with [pango.types.WrapMode.Char].
  */
  Inherit = 0,

  /**
      Try not to wrap the text. This mode is the
        closest to GTK3's behavior but can lead to a wide label leaving
        lots of empty space below the text.
  */
  None = 1,

  /**
      Attempt to wrap at word boundaries. This
        is useful in particular when using [pango.types.WrapMode.WordChar] as the
        wrap mode.
  */
  Word = 2,
}

/**
    The parameter used in the action signals of [gtk.notebook.Notebook].
*/
enum GtkNotebookTab
{
  /**
      the first tab in the notebook
  */
  First = 0,

  /**
      the last tab in the notebook
  */
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
    Describes the way two values can be compared.
    
    These values can be used with a [glib.types.CompareFunc]. However,
    a [glib.types.CompareFunc] is allowed to return any integer values.
    For converting such a value to a [gtk.types.Ordering] value, use
    `func@Gtk.Ordering.from_cmpfunc`.
*/
enum GtkOrdering
{
  /**
      the first value is smaller than the second
  */
  Smaller = -1,

  /**
      the two values are equal
  */
  Equal = 0,

  /**
      the first value is larger than the second
  */
  Larger = 1,
}

/**
    Represents the orientation of widgets and other objects.
    
    Typical examples are `class@Box` or `class@GesturePan`.
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
    Defines how content overflowing a given area should be handled.
    
    This is used in [gtk.widget.Widget.setOverflow]. The
    [gtk.widget.Widget.overflow] property is modeled after the
    CSS overflow property, but implements it only partially.
*/
enum GtkOverflow
{
  /**
      No change is applied. Content is drawn at the specified
        position.
  */
  Visible = 0,

  /**
      Content is clipped to the bounds of the area. Content
        outside the area is not drawn and cannot be interacted with.
  */
  Hidden = 1,
}

/**
    Represents the packing location of a children in its parent.
    
    See `class@WindowControls` for example.
*/
enum GtkPackType
{
  /**
      The child is packed into the start of the widget
  */
  Start = 0,

  /**
      The child is packed into the end of the widget
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
    Describes the panning direction of a `class@GesturePan`.
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
    Flags that influence the behavior of [gtk.widget.Widget.pick].
*/
enum GtkPickFlags : uint
{
  /**
      The default behavior, include widgets that are receiving events
  */
  Default = 0,

  /**
      Include widgets that are insensitive
  */
  Insensitive = 1,

  /**
      Include widgets that are marked as non-targetable. See `property@Widget:can-target`
  */
  NonTargetable = 2,
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
        For example, when all of a [gtk.tree_view.TreeView] can not be seen.
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
        scrolled windows share a scrollbar.
  */
  External = 3,
}

/**
    Flags that affect how [gtk.popover_menu.PopoverMenu] widgets built from
    a [gio.menu_model.MenuModel] are created and displayed.
*/
enum GtkPopoverMenuFlags : uint
{
  /**
      Submenus are presented as sliding submenus that replace the main menu.
  */
  Sliding = 0,

  /**
      Submenus are presented as traditional, nested
        popovers.
  */
  Nested = 1,
}

/**
    Describes which edge of a widget a certain feature is positioned at.
    
    For examples, see the tabs of a `class@Notebook`, or the label
    of a `class@Scale`.
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
    Specifies which features the print dialog should offer.
    
    If neither [gtk.types.PrintCapabilities.GeneratePdf] nor
    [gtk.types.PrintCapabilities.GeneratePs] is specified, GTK assumes that all
    formats are supported.
*/
enum GtkPrintCapabilities : uint
{
  /**
      Print dialog will offer printing even/odd pages.
  */
  PageSet = 1,

  /**
      Print dialog will allow to print multiple copies.
  */
  Copies = 2,

  /**
      Print dialog will allow to collate multiple copies.
  */
  Collate = 4,

  /**
      Print dialog will allow to print pages in reverse order.
  */
  Reverse = 8,

  /**
      Print dialog will allow to scale the output.
  */
  Scale = 16,

  /**
      The program will send the document to
        the printer in PDF format
  */
  GeneratePdf = 32,

  /**
      The program will send the document to
        the printer in Postscript format
  */
  GeneratePs = 64,

  /**
      Print dialog will offer a preview
  */
  Preview = 128,

  /**
      Print dialog will offer printing multiple
        pages per sheet
  */
  NumberUp = 256,

  /**
      Print dialog will allow to rearrange
        pages when printing multiple pages per sheet
  */
  NumberUpLayout = 512,
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
    using the GTK printing support.
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
    Determines what action the print operation should perform.
    
    A parameter of this typs is passed to [gtk.print_operation.PrintOperation.run].
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
    The result of a print operation.
    
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
    Describes limits of a `class@EventController` for handling events
    targeting other widgets.
*/
enum GtkPropagationLimit
{
  /**
      Events are handled regardless of what their
        target is.
  */
  None = 0,

  /**
      Events are only handled if their target
        is in the same `iface@Native` as the event controllers widget. Note
        that some event types have two targets (origin and destination).
  */
  SameNative = 1,
}

/**
    Describes the stage at which events are fed into a `class@EventController`.
*/
enum GtkPropagationPhase
{
  /**
      Events are not delivered.
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
    Error codes for [gtk.recent_manager.RecentManager] operations
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
    Predefined values for use as response ids in [gtk.dialog.Dialog.addButton].
    
    All predefined values are negative; GTK leaves values of 0 or greater for
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
      Generic response id, not used by GTK dialogs
  */
  Reject = -2,

  /**
      Generic response id, not used by GTK dialogs
  */
  Accept = -3,

  /**
      Returned if the dialog is deleted
  */
  DeleteEvent = -4,

  /**
      Returned by OK buttons in GTK dialogs
  */
  Ok = -5,

  /**
      Returned by Cancel buttons in GTK dialogs
  */
  Cancel = -6,

  /**
      Returned by Close buttons in GTK dialogs
  */
  Close = -7,

  /**
      Returned by Yes buttons in GTK dialogs
  */
  Yes = -8,

  /**
      Returned by No buttons in GTK dialogs
  */
  No = -9,

  /**
      Returned by Apply buttons in GTK dialogs
  */
  Apply = -10,

  /**
      Returned by Help buttons in GTK dialogs
  */
  Help = -11,
}

/**
    These enumeration values describe the possible transitions
    when the child of a [gtk.revealer.Revealer] widget is shown or hidden.
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

  /**
      Floop in from the left
  */
  SwingRight = 6,

  /**
      Floop in from the right
  */
  SwingLeft = 7,

  /**
      Floop in from the bottom
  */
  SwingUp = 8,

  /**
      Floop in from the top
  */
  SwingDown = 9,
}

/**
    Passed as argument to various keybinding signals.
*/
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
    Determines how GTK handles the sensitivity of various controls,
    such as combo box buttons.
*/
enum GtkSensitivityType
{
  /**
      The control is made insensitive if no
        action can be triggered
  */
  Auto = 0,

  /**
      The control is always sensitive
  */
  On = 1,

  /**
      The control is always insensitive
  */
  Off = 2,
}

/**
    List of flags that can be passed to action activation.
    
    More flags may be added in the future.
*/
enum GtkShortcutActionFlags : uint
{
  /**
      The action is the only
        action that can be activated. If this flag is not set,
        a future activation may select a different action.
  */
  Exclusive = 1,
}

/**
    Describes where `class@Shortcut`s added to a
    `class@ShortcutController` get handled.
*/
enum GtkShortcutScope
{
  /**
      Shortcuts are handled inside
        the widget the controller belongs to.
  */
  Local = 0,

  /**
      Shortcuts are handled by
        the first ancestor that is a `iface@ShortcutManager`
  */
  Managed = 1,

  /**
      Shortcuts are handled by
        the root widget.
  */
  Global = 2,
}

/**
    GtkShortcutType specifies the kind of shortcut that is being described.
    
    More values may be added to this enumeration over time.
*/
enum GtkShortcutType
{
  /**
      The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
        property will be used.
  */
  Accelerator = 0,

  /**
      The shortcut is a pinch gesture. GTK provides an icon and subtitle.
  */
  GesturePinch = 1,

  /**
      The shortcut is a stretch gesture. GTK provides an icon and subtitle.
  */
  GestureStretch = 2,

  /**
      The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle.
  */
  GestureRotateClockwise = 3,

  /**
      The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle.
  */
  GestureRotateCounterclockwise = 4,

  /**
      The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
  */
  GestureTwoFingerSwipeLeft = 5,

  /**
      The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
  */
  GestureTwoFingerSwipeRight = 6,

  /**
      The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
        used.
  */
  Gesture = 7,

  /**
      The shortcut is a swipe gesture. GTK provides an icon and subtitle.
  */
  GestureSwipeLeft = 8,

  /**
      The shortcut is a swipe gesture. GTK provides an icon and subtitle.
  */
  GestureSwipeRight = 9,
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
    Describes changes in a sorter in more detail and allows users
    to optimize resorting.
*/
enum GtkSorterChange
{
  /**
      The sorter change cannot be described
        by any of the other enumeration values
  */
  Different = 0,

  /**
      The sort order was inverted. Comparisons
        that returned [gtk.types.Ordering.Smaller] now return [gtk.types.Ordering.Larger]
        and vice versa. Other comparisons return the same values as before.
  */
  Inverted = 1,

  /**
      The sorter is less strict: Comparisons
        may now return [gtk.types.Ordering.Equal] that did not do so before.
  */
  LessStrict = 2,

  /**
      The sorter is more strict: Comparisons
        that did return [gtk.types.Ordering.Equal] may not do so anymore.
  */
  MoreStrict = 3,
}

/**
    Describes the type of order that a [gtk.sorter.Sorter] may produce.
*/
enum GtkSorterOrder
{
  /**
      A partial order. Any [gtk.types.Ordering] is possible.
  */
  Partial = 0,

  /**
      No order, all elements are considered equal.
        [gtk.sorter.Sorter.compare] will only return [gtk.types.Ordering.Equal].
  */
  None = 1,

  /**
      A total order. [gtk.sorter.Sorter.compare] will only
        return [gtk.types.Ordering.Equal] if an item is compared with itself. Two
        different items will never cause this value to be returned.
  */
  Total = 2,
}

/**
    Determines whether the spin button displays values outside the adjustment
    bounds.
    
    See [gtk.spin_button.SpinButton.setUpdatePolicy].
*/
enum GtkSpinButtonUpdatePolicy
{
  /**
      When refreshing your [gtk.spin_button.SpinButton], the value is
        always displayed
  */
  Always = 0,

  /**
      When refreshing your [gtk.spin_button.SpinButton], the value is
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
    Possible transitions between pages in a [gtk.stack.Stack] widget.
    
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
      Cover the old page by sliding up
  */
  OverUp = 8,

  /**
      Cover the old page by sliding down
  */
  OverDown = 9,

  /**
      Cover the old page by sliding to the left
  */
  OverLeft = 10,

  /**
      Cover the old page by sliding to the right
  */
  OverRight = 11,

  /**
      Uncover the new page by sliding up
  */
  UnderUp = 12,

  /**
      Uncover the new page by sliding down
  */
  UnderDown = 13,

  /**
      Uncover the new page by sliding to the left
  */
  UnderLeft = 14,

  /**
      Uncover the new page by sliding to the right
  */
  UnderRight = 15,

  /**
      Cover the old page sliding up or uncover the new page sliding down, according to order
  */
  OverUpDown = 16,

  /**
      Cover the old page sliding down or uncover the new page sliding up, according to order
  */
  OverDownUp = 17,

  /**
      Cover the old page sliding left or uncover the new page sliding right, according to order
  */
  OverLeftRight = 18,

  /**
      Cover the old page sliding right or uncover the new page sliding left, according to order
  */
  OverRightLeft = 19,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the left
  */
  RotateLeft = 20,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the right
  */
  RotateRight = 21,

  /**
      Pretend the pages are sides of a cube and rotate that cube to the left or right according to the children order
  */
  RotateLeftRight = 22,
}

/**
    Describes a widget state.
    
    Widget states are used to match the widget against CSS pseudo-classes.
    Note that GTK extends the regular CSS classes and sometimes uses
    different names.
*/
enum GtkStateFlags : uint
{
  /**
      State during normal operation
  */
  Normal = 0,

  /**
      Widget is active
  */
  Active = 1,

  /**
      Widget has a mouse pointer over it
  */
  Prelight = 2,

  /**
      Widget is selected
  */
  Selected = 4,

  /**
      Widget is insensitive
  */
  Insensitive = 8,

  /**
      Widget is inconsistent
  */
  Inconsistent = 16,

  /**
      Widget has the keyboard focus
  */
  Focused = 32,

  /**
      Widget is in a background toplevel window
  */
  Backdrop = 64,

  /**
      Widget is in left-to-right text direction
  */
  DirLtr = 128,

  /**
      Widget is in right-to-left text direction
  */
  DirRtl = 256,

  /**
      Widget is a link
  */
  Link = 512,

  /**
      The location the widget points to has already been visited
  */
  Visited = 1024,

  /**
      Widget is checked
  */
  Checked = 2048,

  /**
      Widget is highlighted as a drop target for DND
  */
  DropActive = 4096,

  /**
      Widget has the visible focus
  */
  FocusVisible = 8192,

  /**
      Widget contains the keyboard focus
  */
  FocusWithin = 16384,
}

/**
    Specifies how search strings are matched inside text.
*/
enum GtkStringFilterMatchMode
{
  /**
      The search string and
        text must match exactly.
  */
  Exact = 0,

  /**
      The search string
        must be contained as a substring inside the text.
  */
  Substring = 1,

  /**
      The text must begin
        with the search string.
  */
  Prefix = 2,
}

/**
    Flags that modify the behavior of [gtk.style_context.StyleContext.toString_].
    
    New values may be added to this enumeration.
*/
enum GtkStyleContextPrintFlags : uint
{
  /**
      Default value.
  */
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

  /**
      Show information about
        what changes affect the styles
  */
  ShowChange = 4,
}

/**
    The indexes of colors passed to symbolic color rendering, such as
    `vfunc@Gtk.SymbolicPaintable.snapshot_symbolic`.
    
    More values may be added over time.
*/
enum GtkSymbolicColor
{
  /**
      The default foreground color
  */
  Foreground = 0,

  /**
      Indication color for errors
  */
  Error = 1,

  /**
      Indication color for warnings
  */
  Warning = 2,

  /**
      Indication color for success
  */
  Success = 3,
}

/**
    Values that can be passed to the `vfunc@Gtk.Widget.system_setting_changed`
    vfunc.
    
    The values indicate which system setting has changed.
    Widgets may need to drop caches, or react otherwise.
    
    Most of the values correspond to `class@Settings` properties.
    
    More values may be added over time.
*/
enum GtkSystemSetting
{
  /**
      the `property@Gtk.Settings:gtk-xft-dpi` setting has changed
  */
  Dpi = 0,

  /**
      The `property@Gtk.Settings:gtk-font-name` setting has changed
  */
  FontName = 1,

  /**
      The font configuration has changed in a way that
        requires text to be redrawn. This can be any of the
        `property@Gtk.Settings:gtk-xft-antialias`,
        `property@Gtk.Settings:gtk-xft-hinting`,
        `property@Gtk.Settings:gtk-xft-hintstyle`,
        `property@Gtk.Settings:gtk-xft-rgba` or
        `property@Gtk.Settings:gtk-fontconfig-timestamp` settings
  */
  FontConfig = 2,

  /**
      The display has changed
  */
  Display = 3,

  /**
      The icon theme has changed in a way that requires
        icons to be looked up again
  */
  IconTheme = 4,
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
    `GtkTextView::extend-selection` signal to customize the selection.
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
    
    If neither [gtk.types.TextSearchFlags.VisibleOnly] nor [gtk.types.TextSearchFlags.TextOnly] are
    enabled, the match must be exact; the special 0xFFFC character will match
    embedded paintables or child widgets.
*/
enum GtkTextSearchFlags : uint
{
  /**
      Search only visible data. A search match may
      have invisible text interspersed.
  */
  VisibleOnly = 1,

  /**
      Search only text. A match may have paintables or
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
    Used to reference the layers of [gtk.text_view.TextView] for the purpose of customized
    drawing with the ::snapshot_layer vfunc.
*/
enum GtkTextViewLayer
{
  /**
      The layer rendered below the text (but above the background).
  */
  BelowText = 0,

  /**
      The layer rendered above the text.
  */
  AboveText = 1,
}

/**
    Used to reference the parts of [gtk.text_view.TextView].
*/
enum GtkTextWindowType
{
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
    These flags indicate various properties of a [gtk.tree_model.TreeModel].
    
    They are returned by [gtk.tree_model.TreeModel.getFlags], and must be
    static for the lifetime of the object. A more complete description
    of [gtk.types.TreeModelFlags.ItersPersist] can be found in the overview of
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
    that [gtk.types.TreeViewColumnSizing.Autosize] are inefficient for large views, and
    can make columns appear choppy.
*/
enum GtkTreeViewColumnSizing
{
  /**
      Columns only get bigger in reaction to changes in the model
  */
  GrowOnly = 0,

  /**
      Columns resize to be the optimal size every time the model changes.
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
    [gtk.atcontext.ATContext] is an abstract class provided by GTK to communicate to
    platform-specific assistive technologies API.
    
    Each platform supported by GTK implements a [gtk.atcontext.ATContext] subclass, and
    is responsible for updating the accessible state in response to state
    changes in [gtk.accessible.Accessible].
*/
struct GtkATContext;

/** */
struct GtkATContextClass;

/**
    The [gtk.about_dialog.AboutDialog] offers a simple way to display information about
    a program.
    
    The shown information includes the programs' logo, name, copyright,
    website and license. It is also possible to give credits to the authors,
    documenters, translators and artists who have worked on the program.
    
    An about dialog is typically opened when the user selects the `About`
    option from the `Help` menu. All parts of the dialog are optional.
    
    ![An example GtkAboutDialog](aboutdialog.png)
    
    About dialogs often contain links and email addresses. [gtk.about_dialog.AboutDialog]
    displays these as clickable links. By default, it calls [gtk.file_launcher.FileLauncher.launch]
    when a user clicks one. The behaviour can be overridden with the
    `signal@Gtk.AboutDialog::activate-link` signal.
    
    To specify a person with an email address, use a string like
    `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title,
    use a string like `GTK team https://www.gtk.org`.
    
    To make constructing a [gtk.about_dialog.AboutDialog] as convenient as possible, you can
    use the function `func@Gtk.show_about_dialog` which constructs and shows
    a dialog and keeps it around so that it can be shown again.
    
    Note that GTK sets a default title of `_("About `s`")` on the dialog
    window (where ``s`` is replaced by the name of the application, but in
    order to ensure proper translation of the title, applications should
    set the title property explicitly when constructing a [gtk.about_dialog.AboutDialog],
    as shown in the following example:
    
    ```c
    GFile *logo_file = g_file_new_for_path ("./logo.png");
    GdkTexture *example_logo = gdk_texture_new_from_file (logo_file, NULL);
    g_object_unref (logo_file);
    
    gtk_show_about_dialog (NULL,
                           "program-name", "ExampleCode",
                           "logo", example_logo,
                           "title", _("About ExampleCode"),
                           NULL);
    ```
    
    ## CSS nodes
    
    [gtk.about_dialog.AboutDialog] has a single CSS node with the name `window` and style
    class `.aboutdialog`.
*/
struct GtkAboutDialog;

/**
    [gtk.accessible.Accessible] is an interface for describing UI elements for
    Assistive Technologies.
    
    Every accessible implementation has:
    
     $(LIST
        * a “role”, represented by a value of the [gtk.types.AccessibleRole] enumeration
        * an “attribute”, represented by a set of [gtk.types.AccessibleState],
          [gtk.types.AccessibleProperty] and [gtk.types.AccessibleRelation] values
     )
       
    The role cannot be changed after instantiating a [gtk.accessible.Accessible]
    implementation.
    
    The attributes are updated every time a UI element's state changes in
    a way that should be reflected by assistive technologies. For instance,
    if a [gtk.widget.Widget] visibility changes, the [gtk.types.AccessibleState.Hidden]
    state will also change to reflect the [gtk.widget.Widget.visible] property.
    
    Every accessible implementation is part of a tree of accessible objects.
    Normally, this tree corresponds to the widget tree, but can be customized
    by reimplementing the `vfunc@Gtk.Accessible.get_accessible_parent`,
    `vfunc@Gtk.Accessible.get_first_accessible_child` and
    `vfunc@Gtk.Accessible.get_next_accessible_sibling` virtual functions.
    Note that you can not create a top-level accessible object as of now,
    which means that you must always have a parent accessible object.
    Also note that when an accessible object does not correspond to a widget,
    and it has children, whose implementation you don't control,
    it is necessary to ensure the correct shape of the a11y tree
    by calling [gtk.accessible.Accessible.setAccessibleParent] and
    updating the sibling by [gtk.accessible.Accessible.updateNextAccessibleSibling].
*/
struct GtkAccessible;

/**
    The common interface for accessible objects.
*/
struct GtkAccessibleInterface
{
  /** */
  GTypeInterface gIface;

  /**
      retrieve the platform-specific accessibility context
        for the accessible implementation
  */
  extern(C) GtkATContext* function(GtkAccessible* self) getAtContext;

  /**
      retrieve the accessible state
  */
  extern(C) gboolean function(GtkAccessible* self, GtkAccessiblePlatformState state) getPlatformState;

  /** */
  extern(C) GtkAccessible* function(GtkAccessible* self) getAccessibleParent;

  /** */
  extern(C) GtkAccessible* function(GtkAccessible* self) getFirstAccessibleChild;

  /** */
  extern(C) GtkAccessible* function(GtkAccessible* self) getNextAccessibleSibling;

  /** */
  extern(C) gboolean function(GtkAccessible* self, int* x, int* y, int* width, int* height) getBounds;
}

/**
    A boxed type which wraps a list of references to GtkAccessible objects.
*/
struct GtkAccessibleList;

/**
    This interface describes ranged controls, e.g. controls which have a single
    value within an allowed range and that can optionally be changed by the user.
    
    This interface is expected to be implemented by controls using the following
    roles:
    
    $(LIST
      * [gtk.types.AccessibleRole.Meter]
      * [gtk.types.AccessibleRole.ProgressBar]
      * [gtk.types.AccessibleRole.Scrollbar]
      * [gtk.types.AccessibleRole.Slider]
      * [gtk.types.AccessibleRole.SpinButton]
    )
      
    If that is not the case, a warning will be issued at run time.
    
    In addition to this interface, its implementers are expected to provide the
    correct values for the following properties:
    
    $(LIST
      * [gtk.types.AccessibleProperty.ValueMax]
      * [gtk.types.AccessibleProperty.ValueMin]
      * [gtk.types.AccessibleProperty.ValueNow]
      * [gtk.types.AccessibleProperty.ValueText]
    )
*/
struct GtkAccessibleRange;

/** */
struct GtkAccessibleRangeInterface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) gboolean function(GtkAccessibleRange* self, double value) setCurrentValue;
}

/**
    An interface for accessible objects containing formatted text.
    
    The [gtk.accessible_text.AccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text contents.
    
    You should use the `enum@Gtk.AccessibleProperty.LABEL` or the
    `enum@Gtk.AccessibleProperty.DESCRIPTION` properties for accessible
    objects containing simple, unformatted text.
*/
struct GtkAccessibleText;

/**
    The interface vtable for accessible objects containing text.
*/
struct GtkAccessibleTextInterface
{
  /** */
  GTypeInterface gIface;

  /** */
  extern(C) GBytes* function(GtkAccessibleText* self, uint start, uint end) getContents;

  /** */
  extern(C) GBytes* function(GtkAccessibleText* self, uint offset, GtkAccessibleTextGranularity granularity, uint* start, uint* end) getContentsAt;

  /** */
  extern(C) uint function(GtkAccessibleText* self) getCaretPosition;

  /** */
  extern(C) gboolean function(GtkAccessibleText* self, size_t* nRanges, GtkAccessibleTextRange** ranges) getSelection;

  /** */
  extern(C) gboolean function(GtkAccessibleText* self, uint offset, size_t* nRanges, GtkAccessibleTextRange** ranges, char*** attributeNames, char*** attributeValues) getAttributes;

  /** */
  extern(C) void function(GtkAccessibleText* self, char*** attributeNames, char*** attributeValues) getDefaultAttributes;
}

/**
    A range inside the text of an accessible object.
*/
struct GtkAccessibleTextRange
{
  /**
      the start of the range, in characters
  */
  size_t start;

  /**
      the length of the range, in characters
  */
  size_t length;
}

/**
    [gtk.action_bar.ActionBar] is designed to present contextual actions.
    
    ![An example GtkActionBar](action-bar.png)
    
    It is expected to be displayed below the content and expand
    horizontally to fill the area.
    
    It allows placing children at the start or the end. In addition, it
    contains an internal centered box which is centered with respect to
    the full width of the box, even if the children at either side take
    up different amounts of space.
    
    # GtkActionBar as GtkBuildable
    
    The [gtk.action_bar.ActionBar] implementation of the [gtk.buildable.Buildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a `<child>` element, or setting the center widget
    by specifying “center” value.
    
    # CSS nodes
    
    ```
    actionbar
    ╰── revealer
        ╰── box
            ├── box.start
            │   ╰── [start children]
            ├── [center widget]
            ╰── box.end
                ╰── [end children]
    ```
    
    A [gtk.action_bar.ActionBar]'s CSS node is called `actionbar`. It contains a `revealer`
    subnode, which contains a `box` subnode, which contains two `box` subnodes at
    the start and end of the action bar, with `start` and `end style classes
    respectively, as well as a center node that represents the center child.
    
    Each of the boxes contains children packed for that side.
*/
struct GtkActionBar;

/**
    The [gtk.actionable.Actionable] interface provides a convenient way of associating
    widgets with actions.
    
    It primarily consists of two properties: `property@Gtk.Actionable:action-name`
    and `property@Gtk.Actionable:action-target`. There are also some convenience
    APIs for setting these properties.
    
    The action will be looked up in action groups that are found among
    the widgets ancestors. Most commonly, these will be the actions with
    the “win.” or “app.” prefix that are associated with the
    [gtk.application_window.ApplicationWindow] or [gtk.application.Application], but other action groups that
    are added with [gtk.widget.Widget.insertActionGroup] will be consulted
    as well.
*/
struct GtkActionable;

/**
    The interface vtable for [gtk.actionable.Actionable].
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
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.activate].
*/
struct GtkActivateAction;

/** */
struct GtkActivateActionClass;

/**
    [gtk.adjustment.Adjustment] is a model for a numeric value.
    
    The [gtk.adjustment.Adjustment] has an associated lower and upper bound.
    It also contains step and page increments, and a page size.
    
    Adjustments are used within several GTK widgets, including
    [gtk.spin_button.SpinButton], [gtk.viewport.Viewport], [gtk.scrollbar.Scrollbar]
    and [gtk.scale.Scale].
    
    The [gtk.adjustment.Adjustment] object does not update the value itself. Instead
    it is left up to the owner of the [gtk.adjustment.Adjustment] to control the value.
*/
struct GtkAdjustment
{
  /** */
  GInitiallyUnowned parentInstance;
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

/**
    A [gtk.alert_dialog.AlertDialog] object collects the arguments that
    are needed to present a message to the user.
    
    The message is shown with the [gtk.alert_dialog.AlertDialog.choose]
    function. This API follows the GIO async pattern, and the result can
    be obtained by calling [gtk.alert_dialog.AlertDialog.chooseFinish].
    
    If you don't need to wait for a button to be clicked, you can use
    [gtk.alert_dialog.AlertDialog.show].
*/
struct GtkAlertDialog;

/** */
struct GtkAlertDialogClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that combines two triggers.
    
    The [gtk.alternative_trigger.AlternativeTrigger] triggers when either of two trigger.
    
    This can be cascaded to combine more than two triggers.
*/
struct GtkAlternativeTrigger;

/** */
struct GtkAlternativeTriggerClass;

/**
    [gtk.any_filter.AnyFilter] matches an item when at least one of its filters matches.
    
    To add filters to a [gtk.any_filter.AnyFilter], use [gtk.multi_filter.MultiFilter.append].
*/
struct GtkAnyFilter;

/** */
struct GtkAnyFilterClass;

/**
    [gtk.app_chooser.AppChooser] is an interface for widgets which allow the user to
    choose an application.
    
    The main objects that implement this interface are
    [gtk.app_chooser_widget.AppChooserWidget],
    [gtk.app_chooser_dialog.AppChooserDialog] and [gtk.app_chooser_button.AppChooserButton].
    
    Applications are represented by GIO [gio.app_info.AppInfo] objects here.
    GIO has a concept of recommended and fallback applications for a
    given content type. Recommended applications are those that claim
    to handle the content type itself, while fallback also includes
    applications that handle a more generic content type. GIO also
    knows the default and last-used application for a given content
    type. The [gtk.app_chooser_widget.AppChooserWidget] provides detailed control over
    whether the shown list of applications should include default,
    recommended or fallback applications.
    
    To obtain the application that has been selected in a [gtk.app_chooser.AppChooser],
    use [gtk.app_chooser.AppChooser.getAppInfo].

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
struct GtkAppChooser;

/**
    The [gtk.app_chooser_button.AppChooserButton] lets the user select an application.
    
    ![An example GtkAppChooserButton](appchooserbutton.png)
    
    Initially, a [gtk.app_chooser_button.AppChooserButton] selects the first application
    in its list, which will either be the most-recently used application
    or, if `property@Gtk.AppChooserButton:show-default-item` is true, the
    default application.
    
    The list of applications shown in a [gtk.app_chooser_button.AppChooserButton] includes
    the recommended applications for the given content type. When
    `property@Gtk.AppChooserButton:show-default-item` is set, the default
    application is also included. To let the user chooser other applications,
    you can set the `property@Gtk.AppChooserButton:show-dialog-item` property,
    which allows to open a full [gtk.app_chooser_dialog.AppChooserDialog].
    
    It is possible to add custom items to the list, using
    [gtk.app_chooser_button.AppChooserButton.appendCustomItem]. These items cause
    the `signal@Gtk.AppChooserButton::custom-item-activated` signal to be
    emitted when they are selected.
    
    To track changes in the selected application, use the
    [gtk.app_chooser_button.AppChooserButton.changed] signal.
    
    ## CSS nodes
    
    [gtk.app_chooser_button.AppChooserButton] has a single CSS node with the name “appchooserbutton”.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
struct GtkAppChooserButton;

/**
    [gtk.app_chooser_dialog.AppChooserDialog] shows a [gtk.app_chooser_widget.AppChooserWidget] inside a [gtk.dialog.Dialog].
    
    ![An example GtkAppChooserDialog](appchooserdialog.png)
    
    Note that [gtk.app_chooser_dialog.AppChooserDialog] does not have any interesting methods
    of its own. Instead, you should get the embedded [gtk.app_chooser_widget.AppChooserWidget]
    using [gtk.app_chooser_dialog.AppChooserDialog.getWidget] and call its methods if
    the generic [gtk.app_chooser.AppChooser] interface is not sufficient for
    your needs.
    
    To set the heading that is shown above the [gtk.app_chooser_widget.AppChooserWidget],
    use [gtk.app_chooser_dialog.AppChooserDialog.setHeading].
    
    ## CSS nodes
    
    [gtk.app_chooser_dialog.AppChooserDialog] has a single CSS node with the name `window` and style
    class `.appchooser`.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
struct GtkAppChooserDialog;

/**
    [gtk.app_chooser_widget.AppChooserWidget] is a widget for selecting applications.
    
    It is the main building block for [gtk.app_chooser_dialog.AppChooserDialog].
    Most applications only need to use the latter; but you can use
    this widget as part of a larger widget if you have special needs.
    
    [gtk.app_chooser_widget.AppChooserWidget] offers detailed control over what applications
    are shown, using the
    `property@Gtk.AppChooserWidget:show-default`,
    `property@Gtk.AppChooserWidget:show-recommended`,
    `property@Gtk.AppChooserWidget:show-fallback`,
    `property@Gtk.AppChooserWidget:show-other` and
    `property@Gtk.AppChooserWidget:show-all` properties. See the
    [gtk.app_chooser.AppChooser] documentation for more information about these
    groups of applications.
    
    To keep track of the selected application, use the
    `signal@Gtk.AppChooserWidget::application-selected` and
    `signal@Gtk.AppChooserWidget::application-activated` signals.
    
    ## CSS nodes
    
    [gtk.app_chooser_widget.AppChooserWidget] has a single CSS node with name appchooser.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
struct GtkAppChooserWidget;

/**
    [gtk.application.Application] is a high-level API for writing applications.
    
    It supports many aspects of writing a GTK application in a convenient
    fashion, without enforcing a one-size-fits-all model.
    
    Currently, [gtk.application.Application] handles GTK initialization, application
    uniqueness, session management, provides some basic scriptability and
    desktop shell integration by exporting actions and menus and manages a
    list of toplevel windows whose life-cycle is automatically tied to the
    life-cycle of your application.
    
    While [gtk.application.Application] works fine with plain [gtk.window.Window]s, it is
    recommended to use it together with [gtk.application_window.ApplicationWindow].
    
    ## Automatic resources
    
    [gtk.application.Application] will automatically load menus from the [gtk.builder.Builder]
    resource located at "gtk/menus.ui", relative to the application's
    resource base path (see [gio.application.Application.setResourceBasePath]).
    The menu with the ID "menubar" is taken as the application's
    menubar. Additional menus (most interesting submenus) can be named
    and accessed via [gtk.application.Application.getMenuById] which allows for
    dynamic population of a part of the menu structure.
    
    Note that automatic resource loading uses the resource base path
    that is set at construction time and will not work if the resource
    base path is changed at a later time.
    
    It is also possible to provide the menubar manually using
    [gtk.application.Application.setMenubar].
    
    [gtk.application.Application] will also automatically setup an icon search path for
    the default icon theme by appending "icons" to the resource base
    path. This allows your application to easily store its icons as
    resources. See [gtk.icon_theme.IconTheme.addResourcePath] for more
    information.
    
    If there is a resource located at `gtk/help-overlay.ui` which
    defines a [gtk.shortcuts_window.ShortcutsWindow] with ID `help_overlay` then
    [gtk.application.Application] associates an instance of this shortcuts window with
    each [gtk.application_window.ApplicationWindow] and sets up the keyboard accelerator
    <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that
    displays the shortcuts window, associate the item with the action
    `win.show-help-overlay`.
    
    ## A simple application
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c)
    is available in the GTK source code repository
    
    [gtk.application.Application] optionally registers with a session manager of the
    users session (if you set the `property@Gtk.Application:register-session`
    property) and offers various functionality related to the session
    life-cycle.
    
    An application can block various ways to end the session with
    the [gtk.application.Application.inhibit] function. Typical use cases for
    this kind of inhibiting are long-running, uninterruptible operations,
    such as burning a CD or performing a disk backup. The session
    manager may not honor the inhibitor, but it can be expected to
    inform the user about the negative consequences of ending the
    session while inhibitors are present.
    
    ## See Also
    
    [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
    [Getting Started with GTK: Basics](getting_started.html#basics)
*/
struct GtkApplication
{
  /** */
  GApplication parentInstance;
}

/** */
struct GtkApplicationClass
{
  /**
      The parent class.
  */
  GApplicationClass parentClass;

  /**
      Signal emitted when a [gtk.window.Window] is added to
         application through [gtk.application.Application.addWindow].
  */
  extern(C) void function(GtkApplication* application, GtkWindow* window) windowAdded;

  /**
      Signal emitted when a [gtk.window.Window] is removed from
         application, either as a side-effect of being destroyed or
         explicitly through [gtk.application.Application.removeWindow].
  */
  extern(C) void function(GtkApplication* application, GtkWindow* window) windowRemoved;

  /** */
  void*[8] padding;
}

/**
    [gtk.application_window.ApplicationWindow] is a [gtk.window.Window] subclass that integrates with
    [gtk.application.Application].
    
    Notably, [gtk.application_window.ApplicationWindow] can handle an application menubar.
    
    This class implements the [gio.action_group.ActionGroup] and [gio.action_map.ActionMap] interfaces,
    to let you add window-specific actions that will be exported by the
    associated [gtk.application.Application], together with its application-wide
    actions. Window-specific actions are prefixed with the “win.”
    prefix and application-wide actions are prefixed with the “app.”
    prefix. Actions must be addressed with the prefixed name when
    referring to them from a [gio.menu_model.MenuModel].
    
    Note that widgets that are placed inside a [gtk.application_window.ApplicationWindow]
    can also activate these actions, if they implement the
    [gtk.actionable.Actionable] interface.
    
    The settings `property@Gtk.Settings:gtk-shell-shows-app-menu` and
    `property@Gtk.Settings:gtk-shell-shows-menubar` tell GTK whether the
    desktop environment is showing the application menu and menubar
    models outside the application as part of the desktop shell.
    For instance, on OS X, both menus will be displayed remotely;
    on Windows neither will be.
    
    If the desktop environment does not display the menubar, then
    [gtk.application_window.ApplicationWindow] will automatically show a menubar for it.
    This behaviour can be overridden with the
    `property@Gtk.ApplicationWindow:show-menubar` property. If the
    desktop environment does not display the application menu, then
    it will automatically be included in the menubar or in the windows
    client-side decorations.
    
    See [gtk.popover_menu.PopoverMenu] for information about the XML language
    used by [gtk.builder.Builder] for menu models.
    
    See also: [gtk.application.Application.setMenubar].
    
    ## A GtkApplicationWindow with a menubar
    
    The code sample below shows how to set up a [gtk.application_window.ApplicationWindow]
    with a menu bar defined on the [gtk.application.Application]:
    
    ```c
    GtkApplication *app = gtk_application_new ("org.gtk.test", 0);
    
    GtkBuilder *builder = gtk_builder_new_from_string (
        "<interface>"
        "  <menu id='menubar'>"
        "    <submenu>"
        "      <attribute name='label' translatable='yes'>_Edit</attribute>"
        "      <item>"
        "        <attribute name='label' translatable='yes'>_Copy</attribute>"
        "        <attribute name='action'>win.copy</attribute>"
        "      </item>"
        "      <item>"
        "        <attribute name='label' translatable='yes'>_Paste</attribute>"
        "        <attribute name='action'>win.paste</attribute>"
        "      </item>"
        "    </submenu>"
        "  </menu>"
        "</interface>",
        -1);
    
    GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder, "menubar"));
    gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
    g_object_unref (builder);
    
    // ...
    
    GtkWidget *window = gtk_application_window_new (app);
    ```
*/
struct GtkApplicationWindow
{
  /** */
  GtkWindow parentInstance;
}

/** */
struct GtkApplicationWindowClass
{
  /**
      The parent class.
  */
  GtkWindowClass parentClass;

  /** */
  void*[8] padding;
}

/**
    [gtk.aspect_frame.AspectFrame] preserves the aspect ratio of its child.
    
    The frame can respect the aspect ratio of the child widget,
    or use its own aspect ratio.
    
    # CSS nodes
    
    [gtk.aspect_frame.AspectFrame] uses a CSS node with name `frame`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.aspect_frame.AspectFrame] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.aspect_frame.AspectFrame] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkAspectFrame;

/**
    [gtk.assistant.Assistant] is used to represent a complex as a series of steps.
    
    ![An example GtkAssistant](assistant.png)
    
    Each step consists of one or more pages. [gtk.assistant.Assistant] guides the user
    through the pages, and controls the page flow to collect the data needed
    for the operation.
    
    [gtk.assistant.Assistant] handles which buttons to show and to make sensitive based
    on page sequence knowledge and the [gtk.types.AssistantPageType] of each
    page in addition to state information like the *completed* and *committed*
    page statuses.
    
    If you have a case that doesn’t quite fit in [gtk.assistant.Assistant]s way of
    handling buttons, you can use the [gtk.types.AssistantPageType.Custom] page
    type and handle buttons yourself.
    
    [gtk.assistant.Assistant] maintains a [gtk.assistant_page.AssistantPage] object for each added
    child, which holds additional per-child properties. You
    obtain the [gtk.assistant_page.AssistantPage] for a child with [gtk.assistant.Assistant.getPage].
    
    # GtkAssistant as GtkBuildable
    
    The [gtk.assistant.Assistant] implementation of the [gtk.buildable.Buildable] interface
    exposes the @action_area as internal children with the name
    “action_area”.
    
    To add pages to an assistant in [gtk.builder.Builder], simply add it as a
    child to the [gtk.assistant.Assistant] object. If you need to set per-object
    properties, create a [gtk.assistant_page.AssistantPage] object explicitly, and
    set the child widget as a property on it.
    
    # CSS nodes
    
    [gtk.assistant.Assistant] has a single CSS node with the name window and style
    class .assistant.

    Deprecated: This widget will be removed in GTK 5
*/
struct GtkAssistant;

/**
    [gtk.assistant_page.AssistantPage] is an auxiliary object used by `GtkAssistant.

    Deprecated: This object will be removed in GTK 5
*/
struct GtkAssistantPage;

/**
    [gtk.bin_layout.BinLayout] is a [gtk.layout_manager.LayoutManager] subclass useful for create "bins" of
    widgets.
    
    [gtk.bin_layout.BinLayout] will stack each child of a widget on top of each other,
    using the [gtk.widget.Widget.hexpand], [gtk.widget.Widget.vexpand],
    [gtk.widget.Widget.halign], and [gtk.widget.Widget.valign] properties
    of each child to determine where they should be positioned.
*/
struct GtkBinLayout;

/** */
struct GtkBinLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    A [gtk.bitset.Bitset] represents a set of unsigned integers.
    
    Another name for this data structure is "bitmap".
    
    The current implementation is based on [roaring bitmaps](https://roaringbitmap.org/).
    
    A bitset allows adding a set of integers and provides support for set operations
    like unions, intersections and checks for equality or if a value is contained
    in the set. [gtk.bitset.Bitset] also contains various functions to query metadata about
    the bitset, such as the minimum or maximum values or its size.
    
    The fastest way to iterate values in a bitset is [gtk.bitset_iter.BitsetIter].
    
    The main use case for [gtk.bitset.Bitset] is implementing complex selections for
    [gtk.selection_model.SelectionModel].
*/
struct GtkBitset;

/**
    An opaque, stack-allocated struct for iterating
    over the elements of a [gtk.bitset.Bitset].
    
    Before a [gtk.bitset_iter.BitsetIter] can be used, it needs to be initialized with
    [gtk.bitset_iter.BitsetIter.initFirst], [gtk.bitset_iter.BitsetIter.initLast]
    or [gtk.bitset_iter.BitsetIter.initAt].
*/
struct GtkBitsetIter
{
  /** */
  void*[10] privateData;
}

/**
    [gtk.bookmark_list.BookmarkList] is a list model that wraps [glib.bookmark_file.BookmarkFile].
    
    It presents a [gio.list_model.ListModel] and fills it asynchronously with the
    [gio.file_info.FileInfo]s returned from that function.
    
    The [gio.file_info.FileInfo]s in the list have some attributes in the recent
    namespace added: `recent::private` (boolean) and `recent:applications`
    (stringv).
*/
struct GtkBookmarkList;

/** */
struct GtkBookmarkListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.bool_filter.BoolFilter] evaluates a boolean [gtk.expression.Expression]
    to determine whether to include items.
*/
struct GtkBoolFilter;

/** */
struct GtkBoolFilterClass
{
  /** */
  GtkFilterClass parentClass;
}

/**
    A struct that specifies a border around a rectangular area.
    
    Each side can have different width.
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
    The [gtk.box.Box] widget arranges child widgets into a single row or column.
    
    ![An example GtkBox](box.png)
    
    Whether it is a row or column depends on the value of its
    [gtk.orientable.Orientable.orientation] property. Within the other
    dimension, all children are allocated the same size. Of course, the
    [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign] properties
    can be used on the children to influence their allocation.
    
    Use repeated calls to [gtk.box.Box.append] to pack widgets into a
    [gtk.box.Box] from start to end. Use [gtk.box.Box.remove] to remove widgets
    from the [gtk.box.Box]. [gtk.box.Box.insertChildAfter] can be used to add
    a child at a particular position.
    
    Use [gtk.box.Box.setHomogeneous] to specify whether or not all children
    of the [gtk.box.Box] are forced to get the same amount of space.
    
    Use [gtk.box.Box.setSpacing] to determine how much space will be minimally
    placed between all children in the [gtk.box.Box]. Note that spacing is added
    *between* the children.
    
    Use [gtk.box.Box.reorderChildAfter] to move a child to a different
    place in the box.
    
    # CSS nodes
    
    [gtk.box.Box] uses a single CSS node with name box.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.box.Box] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.box.Box] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkBox
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkBoxClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /** */
  void*[8] padding;
}

/**
    [gtk.box_layout.BoxLayout] is a layout manager that arranges children in a single
    row or column.
    
    Whether it is a row or column depends on the value of its
    [gtk.orientable.Orientable.orientation] property. Within the other dimension
    all children all allocated the same size. The [gtk.box_layout.BoxLayout] will respect
    the [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties of each child widget.
    
    If you want all children to be assigned the same size, you can use
    the [gtk.box_layout.BoxLayout.homogeneous] property.
    
    If you want to specify the amount of space placed between each child,
    you can use the [gtk.box_layout.BoxLayout.spacing] property.
*/
struct GtkBoxLayout;

/** */
struct GtkBoxLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    [gtk.buildable.Buildable] allows objects to extend and customize their deserialization
    from ui files.
    
    The interface includes methods for setting names and properties of objects,
    parsing custom tags and constructing child objects.
    
    The [gtk.buildable.Buildable] interface is implemented by all widgets and
    many of the non-widget objects that are provided by GTK. The
    main user of this interface is [gtk.builder.Builder]. There should be
    very little need for applications to call any of these functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    [gtk.builder.Builder] XML format or run any extra routines at deserialization time.
*/
struct GtkBuildable;

/**
    The [gtk.buildable_iface.BuildableIface] interface contains methods that are
    necessary to allow [gtk.builder.Builder] to construct an object from
    a [gtk.builder.Builder] UI definition.
*/
struct GtkBuildableIface
{
  /**
      the parent class
  */
  GTypeInterface gIface;

  /**
      Stores the id attribute given in the [gtk.builder.Builder] UI definition.
        [gtk.widget.Widget] stores the name as object data. Implement this method if your
        object has some notion of “ID” and it makes sense to map the XML id
        attribute to it.
  */
  extern(C) void function(GtkBuildable* buildable, const(char)* id) setId;

  /**
      The getter corresponding to @set_id. Implement this
        if you implement @set_id.
  */
  extern(C) const(char)* function(GtkBuildable* buildable) getId;

  /**
      Adds a child. The @type parameter can be used to
        differentiate the kind of child. [gtk.widget.Widget] implements this
        to add event controllers to the widget, [gtk.notebook.Notebook] uses
        the @type to distinguish between page labels (of type "page-label")
        and normal children.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* type) addChild;

  /**
      Sets a property of a buildable object.
       It is normally not necessary to implement this, [gobject.object.ObjectWrap.setProperty]
       is used by default. [gtk.window.Window] implements this to delay showing itself
       (i.e. setting the [gtk.widget.Widget.visible] property) until the whole
       interface is created.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name, const(GValue)* value) setBuildableProperty;

  /**
      Constructs a child of a buildable that has been
       specified as “constructor” in the UI definition. This can be used to
       reference a widget created in a `<ui>` tag which is outside
       of the normal GtkBuilder UI definition hierarchy.  A reference to the
       constructed object is returned and becomes owned by the caller.
  */
  extern(C) GObject* function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* name) constructChild;

  /**
      Implement this if the buildable needs to parse
       content below `<child>`. To handle an element, the implementation
       must fill in the @parser and @user_data and return true.
       [gtk.widget.Widget] implements this to parse accessible attributes specified
       in `<accessibility>` elements.
       Note that @user_data must be freed in @custom_tag_end or @custom_finished.
  */
  extern(C) gboolean function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, GtkBuildableParser* parser, void** data) customTagStart;

  /**
      Called for the end tag of each custom element that is
       handled by the buildable (see @custom_tag_start).
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) customTagEnd;

  /**
      Called for each custom tag handled by the buildable
       when the builder finishes parsing (see @custom_tag_start)
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder, GObject* child, const(char)* tagname, void* data) customFinished;

  /**
      Called when a builder finishes the parsing
       of a UI definition. It is normally not necessary to implement this,
       unless you need to perform special cleanup actions. [gtk.window.Window] sets
       the `GtkWidget:visible` property here.
  */
  extern(C) void function(GtkBuildable* buildable, GtkBuilder* builder) parserFinished;

  /**
      Returns an internal child of a buildable.
       [gtk.dialog.Dialog] implements this to give access to its @vbox, making
       it possible to add children to the vbox in a UI definition.
       Implement this if the buildable has internal children that may
       need to be accessed from a UI definition.
  */
  extern(C) GObject* function(GtkBuildable* buildable, GtkBuilder* builder, const(char)* childname) getInternalChild;
}

/**
    An opaque context struct for [gtk.types.BuildableParser].
*/
struct GtkBuildableParseContext;

/**
    A sub-parser for [gtk.buildable.Buildable] implementations.
*/
struct GtkBuildableParser
{
  /**
      function called for open elements
  */
  extern(C) void function(GtkBuildableParseContext* context, const(char)* elementName, const(char*)* attributeNames, const(char*)* attributeValues, void* userData, GError** _err) startElement;

  /**
      function called for close elements
  */
  extern(C) void function(GtkBuildableParseContext* context, const(char)* elementName, void* userData, GError** _err) endElement;

  /**
      function called for character data
  */
  extern(C) void function(GtkBuildableParseContext* context, const(char)* text, size_t textLen, void* userData, GError** _err) text;

  /**
      function called on error
  */
  extern(C) void function(GtkBuildableParseContext* context, GError* error, void* userData) error;

  /** */
  void*[4] padding;
}

/**
    A [gtk.builder.Builder] reads XML descriptions of a user interface and
    instantiates the described objects.
    
    To create a [gtk.builder.Builder] from a user interface description, call
    [gtk.builder.Builder.newFromFile], [gtk.builder.Builder.newFromResource]
    or [gtk.builder.Builder.newFromString].
    
    In the (unusual) case that you want to add user interface
    descriptions from multiple sources to the same [gtk.builder.Builder] you can
    call [gtk.builder.Builder.new_] to get an empty builder and populate it by
    (multiple) calls to [gtk.builder.Builder.addFromFile],
    [gtk.builder.Builder.addFromResource] or
    [gtk.builder.Builder.addFromString].
    
    A [gtk.builder.Builder] holds a reference to all objects that it has constructed
    and drops these references when it is finalized. This finalization can
    cause the destruction of non-widget objects or widgets which are not
    contained in a toplevel window. For toplevel windows constructed by a
    builder, it is the responsibility of the user to call
    [gtk.window.Window.destroy] to get rid of them and all the widgets
    they contain.
    
    The functions [gtk.builder.Builder.getObject] and
    [gtk.builder.Builder.getObjects] can be used to access the widgets in
    the interface by the names assigned to them inside the UI description.
    Toplevel windows returned by these functions will stay around until the
    user explicitly destroys them with [gtk.window.Window.destroy]. Other
    widgets will either be part of a larger hierarchy constructed by the
    builder (in which case you should not have to worry about their lifecycle),
    or without a parent, in which case they have to be added to some container
    to make use of them. Non-widget objects need to be reffed with
    [gobject.object.ObjectWrap.ref_] to keep them beyond the lifespan of the builder.
    
    ## GtkBuilder UI Definitions
    
    [gtk.builder.Builder] parses textual descriptions of user interfaces which are
    specified in XML format. We refer to these descriptions as “GtkBuilder
    UI definitions” or just “UI definitions” if the context is clear.
    
    ### Structure of UI definitions
    
    UI definition files are always encoded in UTF-8.
    
    The toplevel element is `<interface>`. It optionally takes a “domain”
    attribute, which will make the builder look for translated strings
    using `dgettext()` in the domain specified. This can also be done by
    calling [gtk.builder.Builder.setTranslationDomain] on the builder.
    For example:
    
    ```xml
    <?xml version="1.0" encoding="UTF-8">
    <interface domain="your-app">
      ...
    </interface>
    ```
    
    ### Requirements
    
    The target toolkit version(s) are described by `<requires>` elements,
    the “lib” attribute specifies the widget library in question (currently
    the only supported value is “gtk”) and the “version” attribute specifies
    the target version in the form “`<major>`.`<minor>`”. [gtk.builder.Builder] will
    error out if the version requirements are not met. For example:
    
    ```xml
    <?xml version="1.0" encoding="UTF-8">
    <interface domain="your-app">
      <requires lib="gtk" version="4.0" />
    </interface>
    ```
    
    ### Objects
    
    Objects are defined as children of the `<interface>` element.
    
    Objects are described by `<object>` elements, which can contain
    `<property>` elements to set properties, `<signal>` elements which
    connect signals to handlers, and `<child>` elements, which describe
    child objects.
    
    Typically, the specific kind of object represented by an `<object>`
    element is specified by the “class” attribute. If the type has not
    been loaded yet, GTK tries to find the `get_type()` function from the
    class name by applying heuristics. This works in most cases, but if
    necessary, it is possible to specify the name of the `get_type()`
    function explicitly with the "type-func" attribute. If your UI definition
    is referencing internal types, you should make sure to call
    `[gobject.global.typeEnsure]` for each object type before parsing the UI definition.
    
    Objects may be given a name with the “id” attribute, which allows the
    application to retrieve them from the builder with
    [gtk.builder.Builder.getObject]. An id is also necessary to use the
    object as property value in other parts of the UI definition. GTK
    reserves ids starting and ending with `___` (three consecutive
    underscores) for its own purposes.
    
    ### Properties
    
    Setting properties of objects is pretty straightforward with the
    `<property>` element: the “name” attribute specifies the name of the
    property, and the content of the element specifies the value:
    
    ```xml
    <object class="GtkButton">
      <property name="label">Hello, world</property>
    </object>
    ```
    
    If the “translatable” attribute is set to a true value, GTK uses
    `gettext()` (or `dgettext()` if the builder has a translation domain set)
    to find a translation for the value. This happens before the value
    is parsed, so it can be used for properties of any type, but it is
    probably most useful for string properties. It is also possible to
    specify a context to disambiguate short strings, and comments which
    may help the translators:
    
    ```xml
    <object class="GtkButton">
      <property name="label" translatable="yes" context="button">Hello, world</property>
    </object>
    ```
    
    [gtk.builder.Builder] can parse textual representations for the most common
    property types:
    
    $(LIST
      * characters
      * strings
      * integers
      * floating-point numbers
      * booleans (strings like “TRUE”, “t”, “yes”, “y”, “1” are interpreted
        as true values, strings like “FALSE”, “f”, “no”, “n”, “0” are interpreted
        as false values)
      * enumeration types (can be specified by their full C identifier their short
        name used when registering the enumeration type, or their integer value)
      * flag types (can be specified by their C identifier, short name, integer
        value, and optionally combined with “|” for bitwise OR, e.g.
        “GTK_INPUT_HINT_EMOJI|GTK_INPUT_HINT_LOWERCASE”, or “emoji|lowercase”)
      * colors (in a format understood by [gdk.rgba.RGBA.parse])
      * [glib.variant.Variant] (can be specified in the format understood by
         [glib.variant.Variant.parse])
      * pixbufs (can be specified as a filename of an image file to load)
    )
      
    Objects can be referred to by their name and by default refer to
    objects declared in the local XML fragment and objects exposed via
    [gtk.builder.Builder.exposeObject]. In general, [gtk.builder.Builder] allows
    forward references to objects declared in the local XML; an object
    doesn’t have to be constructed before it can be referred to. The
    exception to this rule is that an object has to be constructed before
    it can be used as the value of a construct-only property.
    
    ### Child objects
    
    Many widgets have properties for child widgets, such as
    [gtk.expander.Expander.child]. In this case, the preferred way to
    specify the child widget in a ui file is to simply set the property:
    
    ```xml
    <object class="GtkExpander">
      <property name="child">
        <object class="GtkLabel">
        ...
        </object>
      </property>
    </object>
    ```
    
    Generic containers that can contain an arbitrary number of children,
    such as [gtk.box.Box] instead use the `<child>` element. A `<child>`
    element contains an `<object>` element which describes the child object.
    Most often, child objects are widgets inside a container, but they can
    also be, e.g., actions in an action group, or columns in a tree model.
    
    Any object type that implements the [gtk.buildable.Buildable] interface can
    specify how children may be added to it. Since many objects and widgets that
    are included with GTK already implement the [gtk.buildable.Buildable] interface,
    typically child objects can be added using the `<child>` element without
    having to be concerned about the underlying implementation.
    
    See the [[gtk.widget.Widget] documentation](class.Widget.html#gtkwidget-as-gtkbuildable)
    for many examples of using [gtk.builder.Builder] with widgets, including setting
    child objects using the `<child>` element.
    
    A noteworthy special case to the general rule that only objects implementing
    [gtk.buildable.Buildable] may specify how to handle the `<child>` element is that
    [gtk.builder.Builder] provides special support for adding objects to a
    [gio.list_store.ListStore] by using the `<child>` element. For instance:
    
    ```xml
    <object class="GListStore">
      <property name="item-type">MyObject</property>
      <child>
        <object class="MyObject" />
      </child>
      ...
    </object>
    ```
    
    ### Property bindings
    
    It is also possible to bind a property value to another object's
    property value using the attributes "bind-source" to specify the
    source object of the binding, and optionally, "bind-property" and
    "bind-flags" to specify the source property and source binding flags
    respectively. Internally, [gtk.builder.Builder] implements this using
    [gobject.binding.Binding] objects.
    
    For instance, in the example below the “label” property of the
    `bottom_label` widget is bound to the “label” property of the
    `top_button` widget:
    
    ```xml
    <object class="GtkBox">
      <property name="orientation">vertical</property>
      <child>
        <object class="GtkButton" id="top_button">
          <property name="label">Hello, world</property>
        </object>
      </child>
      <child>
        <object class="GtkLabel" id="bottom_label">
          <property name="label"
                    bind-source="top_button"
                    bind-property="label"
                    bind-flags="sync-create" />
        </object>
      </child>
    </object>
    ```
    
    For more information, see the documentation of the
    [gobject.object.ObjectWrap.bindProperty] method.
    
    Please note that another way to set up bindings between objects in .ui files
    is to use the [gtk.expression.Expression] methodology. See the
    [[gtk.expression.Expression] documentation](class.Expression.html#gtkexpression-in-ui-files)
    for more information.
    
    ### Internal children
    
    Sometimes it is necessary to refer to widgets which have implicitly
    been constructed by GTK as part of a composite widget, to set
    properties on them or to add further children (e.g. the content area
    of a [gtk.dialog.Dialog]). This can be achieved by setting the “internal-child”
    property of the `<child>` element to a true value. Note that [gtk.builder.Builder]
    still requires an `<object>` element for the internal child, even if it
    has already been constructed.
    
    ### Specialized children
    
    A number of widgets have different places where a child can be added
    (e.g. tabs vs. page content in notebooks). This can be reflected in
    a UI definition by specifying the “type” attribute on a `<child>`
    The possible values for the “type” attribute are described in the
    sections describing the widget-specific portions of UI definitions.
    
    ### Signal handlers and function pointers
    
    Signal handlers are set up with the `<signal>` element. The “name”
    attribute specifies the name of the signal, and the “handler” attribute
    specifies the function to connect to the signal.
    
    ```xml
    <object class="GtkButton" id="hello_button">
      <signal name="clicked" handler="hello_button__clicked" />
    </object>
    ```
    
    The remaining attributes, “after”, “swapped” and “object”, have the
    same meaning as the corresponding parameters of the
    `func@GObject.signal_connect_object` or `func@GObject.signal_connect_data`
    functions:
    
    $(LIST
      * “after” matches the `G_CONNECT_AFTER` flag, and will ensure that the
        handler is called after the default class closure for the signal
      * “swapped” matches the `G_CONNECT_SWAPPED` flag, and will swap the
        instance and closure arguments when invoking the signal handler
      * “object” will bind the signal handler to the lifetime of the object
        referenced by the attribute
    )
      
    By default "swapped" will be set to "yes" if not specified otherwise, in
    the case where "object" is set, for convenience. A “last_modification_time”
    attribute is also allowed, but it does not have a meaning to the builder.
    
    When compiling applications for Windows, you must declare signal callbacks
    with the `G_MODULE_EXPORT` decorator, or they will not be put in the symbol
    table:
    
    ```c
    G_MODULE_EXPORT void
    hello_button__clicked (GtkButton *button,
                           gpointer data)
    {
      // ...
    }
    ```
    
    On Linux and Unix, this is not necessary; applications should instead
    be compiled with the `-Wl,--export-dynamic` argument inside their compiler
    flags, and linked against `gmodule-export-2.0`.
    
    ## Example UI Definition
    
    ```xml
    <interface>
      <object class="GtkDialog" id="dialog1">
        <child internal-child="content_area">
          <object class="GtkBox">
            <child internal-child="action_area">
              <object class="GtkBox">
                <child>
                  <object class="GtkButton" id="ok_button">
                    <property name="label" translatable="yes">_Ok</property>
                    <property name="use-underline">True</property>
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
    
    ## Using GtkBuildable for extending UI definitions
    
    Objects can implement the [gtk.buildable.Buildable] interface to add custom
    elements and attributes to the XML. Typically, any extension will be
    documented in each type that implements the interface.
    
    ## Templates
    
    When describing a [gtk.widget.Widget], you can use the `<template>` tag to
    describe a UI bound to a specific widget type. GTK will automatically load
    the UI definition when instantiating the type, and bind children and
    signal handlers to instance fields and function symbols.
    
    For more information, see the [[gtk.widget.Widget] documentation](class.Widget.html#building-composite-widgets-from-template-xml)
    for details.
*/
struct GtkBuilder;

/**
    A [gtk.builder_scope.BuilderScope] implementation for the C language.
    
    [gtk.builder_cscope.BuilderCScope] instances use symbols explicitly added to @builder
    with prior calls to [gtk.builder_cscope.BuilderCScope.addCallbackSymbol].
    If developers want to do that, they are encouraged to create their
    own scopes for that purpose.
    
    In the case that symbols are not explicitly added; GTK will uses
    [gmodule.module_.Module]’s introspective features (by opening the module null) to
    look at the application’s symbol table. From here it tries to match
    the signal function names given in the interface description with
    symbols in the application.
    
    Note that unless [gtk.builder_cscope.BuilderCScope.addCallbackSymbol] is
    called for all signal callbacks which are referenced by the loaded XML,
    this functionality will require that [gmodule.module_.Module] be supported on the platform.
*/
struct GtkBuilderCScope
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkBuilderCScopeClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GtkBuilderClass;

/**
    [gtk.builder_list_item_factory.BuilderListItemFactory] is a [gtk.list_item_factory.ListItemFactory] that creates
    widgets by instantiating [gtk.builder.Builder] UI templates.
    
    The templates must be extending [gtk.list_item.ListItem], and typically use
    [gtk.expression.Expression]s to obtain data from the items in the model.
    
    Example:
    ```xml
      <interface>
        <template class="GtkListItem">
          <property name="child">
            <object class="GtkLabel">
              <property name="xalign">0</property>
              <binding name="label">
                <lookup name="name" type="SettingsKey">
                  <lookup name="item">GtkListItem</lookup>
                </lookup>
              </binding>
            </object>
          </property>
        </template>
      </interface>
    ```
*/
struct GtkBuilderListItemFactory;

/** */
struct GtkBuilderListItemFactoryClass;

/**
    [gtk.builder_scope.BuilderScope] is an interface to provide language binding support
    to [gtk.builder.Builder].
    
    The goal of [gtk.builder_scope.BuilderScope] is to look up programming-language-specific
    values for strings that are given in a [gtk.builder.Builder] UI file.
    
    The primary intended audience is bindings that want to provide deeper
    integration of [gtk.builder.Builder] into the language.
    
    A [gtk.builder_scope.BuilderScope] instance may be used with multiple [gtk.builder.Builder] objects,
    even at once.
    
    By default, GTK will use its own implementation of [gtk.builder_scope.BuilderScope]
    for the C language which can be created via [gtk.builder_cscope.BuilderCScope.new_].
    
    If you implement [gtk.builder_scope.BuilderScope] for a language binding, you
    may want to (partially) derive from or fall back to a [gtk.builder_cscope.BuilderCScope],
    as that class implements support for automatic lookups from C symbols.
*/
struct GtkBuilderScope;

/**
    The virtual function table to implement for [gtk.builder_scope.BuilderScope] implementations.
    Default implementations for each function do exist, but they usually just fail,
    so it is suggested that implementations implement all of them.
*/
struct GtkBuilderScopeInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Try to lookup a `GType` via the its name. See
        [gtk.builder.Builder.getTypeFromName] for more details.
        The C implementation will use [gobject.global.typeFromName] and if that fails try to guess the
        correct function name for registering the type and then use dlsym() to load it.
        The default implementation just tries [gobject.global.typeFromName] and otherwise fails.
  */
  extern(C) GType function(GtkBuilderScope* self, GtkBuilder* builder, const(char)* typeName) getTypeFromName;

  /**
      Try to lookup a `GType` via the given function name, specified
        explicitly in a GtkBuilder file, like via the "type-func" attribute in the `<object>` tag.
        This function is very rarely used.
        The C implementation will use dlsym() and call the resulting function as a `GTypeFunc`.
        The default implementation will fail and just return `G_TYPE_INVALID`.
  */
  extern(C) GType function(GtkBuilderScope* self, GtkBuilder* builder, const(char)* functionName) getTypeFromFunction;

  /**
      Create a closure with the given arguments. See [gtk.builder.Builder.createClosure]
        for more details on those.
        The C implementation will try to use dlsym() to locate the function name and then
        [gobject.cclosure.CClosure.new_] to create a closure for the symbol.
        The default implementation just fails and returns null.
  */
  extern(C) GClosure* function(GtkBuilderScope* self, GtkBuilder* builder, const(char)* functionName, GtkBuilderClosureFlags flags, GObject* object, GError** _err) createClosure;
}

/**
    The [gtk.button.Button] widget is generally used to trigger a callback function that is
    called when the button is pressed.
    
    ![An example GtkButton](button.png)
    
    The [gtk.button.Button] widget can hold any valid child widget. That is, it can hold
    almost any other standard [gtk.widget.Widget]. The most commonly used child is the
    [gtk.label.Label].
    
    # CSS nodes
    
    [gtk.button.Button] has a single CSS node with name button. The node will get the
    style classes .image-button or .text-button, if the content is just an
    image or label, respectively. It may also receive the .flat style class.
    When activating a button via the keyboard, the button will temporarily
    gain the .keyboard-activating style class.
    
    Other style classes that are commonly used with [gtk.button.Button] include
    .suggested-action and .destructive-action. In special cases, buttons
    can be made round by adding the .circular style class.
    
    Button-like widgets like [gtk.toggle_button.ToggleButton], [gtk.menu_button.MenuButton],
    [gtk.volume_button.VolumeButton], [gtk.lock_button.LockButton], [gtk.color_button.ColorButton]
    or [gtk.font_button.FontButton] use style classes such as .toggle, .popup, .scale,
    .lock, .color on the button node to differentiate themselves from a plain
    [gtk.button.Button].
    
    # Accessibility
    
    [gtk.button.Button] uses the [gtk.types.AccessibleRole.Button] role.
*/
struct GtkButton
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkButtonClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /**
      Signal emitted when the button has been activated (pressed and released).
  */
  extern(C) void function(GtkButton* button) clicked;

  /**
      Signal that causes the button to animate press then
         release. Applications should never connect to this signal, but use
         the @clicked signal.
  */
  extern(C) void function(GtkButton* button) activate;

  /** */
  void*[8] padding;
}

/** */
struct GtkButtonPrivate;

/**
    A variant of [gtk.closure_expression.ClosureExpression] using a C closure.
*/
struct GtkCClosureExpression;

/**
    [gtk.calendar.Calendar] is a widget that displays a Gregorian calendar, one month
    at a time.
    
    ![An example GtkCalendar](calendar.png)
    
    A [gtk.calendar.Calendar] can be created with [gtk.calendar.Calendar.new_].
    
    The date that is currently displayed can be altered with
    [gtk.calendar.Calendar.selectDay].
    
    To place a visual marker on a particular day, use
    [gtk.calendar.Calendar.markDay] and to remove the marker,
    [gtk.calendar.Calendar.unmarkDay]. Alternative, all
    marks can be cleared with [gtk.calendar.Calendar.clearMarks].
    
    The selected date can be retrieved from a [gtk.calendar.Calendar] using
    [gtk.calendar.Calendar.getDate].
    
    Users should be aware that, although the Gregorian calendar is the
    legal calendar in most countries, it was adopted progressively
    between 1582 and 1929. Display before these dates is likely to be
    historically incorrect.
    
    # CSS nodes
    
    ```
    calendar.view
    ├── header
    │   ├── button
    │   ├── stack.month
    │   ├── button
    │   ├── button
    │   ├── label.year
    │   ╰── button
    ╰── grid
        ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
    ```
    
    [gtk.calendar.Calendar] has a main node with name calendar. It contains a subnode
    called header containing the widgets for switching between years and months.
    
    The grid subnode contains all day labels, including week numbers on the left
    (marked with the .week-number css class) and day names on top (marked with the
    .day-name css class).
    
    Day labels that belong to the previous or next month get the .other-month
    style class. The label of the current day get the .today style class.
    
    Marked day labels get the :selected state assigned.
*/
struct GtkCalendar;

/**
    A [gtk.shortcut_action.ShortcutAction] that invokes a callback.
*/
struct GtkCallbackAction;

/** */
struct GtkCallbackActionClass;

/**
    An abstract class for laying out [gtk.cell_renderer.CellRenderer]s
    
    The [gtk.cell_area.CellArea] is an abstract class for [gtk.cell_layout.CellLayout]
    widgets (also referred to as "layouting widgets") to interface with
    an arbitrary number of [gtk.cell_renderer.CellRenderer]s and interact with the user
    for a given [gtk.tree_model.TreeModel] row.
    
    The cell area handles events, focus navigation, drawing and
    size requests and allocations for a given row of data.
    
    Usually users dont have to interact with the [gtk.cell_area.CellArea] directly
    unless they are implementing a cell-layouting widget themselves.
    
    ## Requesting area sizes
    
    As outlined in
    [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management),
    GTK uses a height-for-width
    geometry management system to compute the sizes of widgets and user
    interfaces. [gtk.cell_area.CellArea] uses the same semantics to calculate the
    size of an area for an arbitrary number of [gtk.tree_model.TreeModel] rows.
    
    When requesting the size of a cell area one needs to calculate
    the size for a handful of rows, and this will be done differently by
    different layouting widgets. For instance a [gtk.tree_view_column.TreeViewColumn]
    always lines up the areas from top to bottom while a [gtk.icon_view.IconView]
    on the other hand might enforce that all areas received the same
    width and wrap the areas around, requesting height for more cell
    areas when allocated less width.
    
    It’s also important for areas to maintain some cell
    alignments with areas rendered for adjacent rows (cells can
    appear “columnized” inside an area even when the size of
    cells are different in each row). For this reason the [gtk.cell_area.CellArea]
    uses a [gtk.cell_area_context.CellAreaContext] object to store the alignments
    and sizes along the way (as well as the overall largest minimum
    and natural size for all the rows which have been calculated
    with the said context).
    
    The [gtk.cell_area_context.CellAreaContext] is an opaque object specific to the
    [gtk.cell_area.CellArea] which created it (see [gtk.cell_area.CellArea.createContext]).
    
    The owning cell-layouting widget can create as many contexts as
    it wishes to calculate sizes of rows which should receive the
    same size in at least one orientation (horizontally or vertically),
    However, it’s important that the same [gtk.cell_area_context.CellAreaContext] which
    was used to request the sizes for a given [gtk.tree_model.TreeModel] row be
    used when rendering or processing events for that row.
    
    In order to request the width of all the rows at the root level
    of a [gtk.tree_model.TreeModel] one would do the following:
    
    ```c
    GtkTreeIter iter;
    int minimum_width;
    int natural_width;
    
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
    in the accompanying [gtk.cell_area_context.CellAreaContext] object and can be consulted
    at any time.
    
    This can be useful since [gtk.cell_layout.CellLayout] widgets usually have to
    support requesting and rendering rows in treemodels with an
    exceedingly large amount of rows. The [gtk.cell_layout.CellLayout] widget in
    that case would calculate the required width of the rows in an
    idle or timeout source (see `func@GLib.timeout_add`) and when the widget
    is requested its actual width in `vfunc@Gtk.Widget.measure`
    it can simply consult the width accumulated so far in the
    [gtk.cell_area_context.CellAreaContext] object.
    
    A simple example where rows are rendered from top to bottom and
    take up the full width of the layouting widget would look like:
    
    ```c
    static void
    foo_get_preferred_width (GtkWidget *widget,
                             int       *minimum_size,
                             int       *natural_size)
    {
      Foo *self = FOO (widget);
      FooPrivate *priv = foo_get_instance_private (self);
    
      foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);
    
      gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, natural_size);
    }
    ```
    
    In the above example the `Foo` widget has to make sure that some
    row sizes have been calculated (the amount of rows that `Foo` judged
    was appropriate to request space for in a single timeout iteration)
    before simply returning the amount of space required by the area via
    the [gtk.cell_area_context.CellAreaContext].
    
    Requesting the height for width (or width for height) of an area is
    a similar task except in this case the [gtk.cell_area_context.CellAreaContext] does not
    store the data (actually, it does not know how much space the layouting
    widget plans to allocate it for every row. It’s up to the layouting
    widget to render each row of data with the appropriate height and
    width which was requested by the [gtk.cell_area.CellArea]).
    
    In order to request the height for width of all the rows at the
    root level of a [gtk.tree_model.TreeModel] one would do the following:
    
    ```c
    GtkTreeIter iter;
    int minimum_height;
    int natural_height;
    int full_minimum_height = 0;
    int full_natural_height = 0;
    
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
    call to `vfunc@Gtk.Widget.measure`. Returning
    a perfect height for width that is larger than the screen area is
    inconsequential since after the layouting receives an allocation
    from a scrolled window it simply continues to drive the scrollbar
    values while more and more height is required for the row heights
    that are calculated in the background.
    
    ## Rendering Areas
    
    Once area sizes have been acquired at least for the rows in the
    visible area of the layouting widget they can be rendered at
    `vfunc@Gtk.Widget.snapshot` time.
    
    A crude example of how to render all the rows at the root level
    runs as follows:
    
    ```c
    GtkAllocation allocation;
    GdkRectangle cell_area = { 0, };
    GtkTreeIter iter;
    int minimum_width;
    int natural_width;
    
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
    the time the widget is allocated using `func@Gtk.distribute_natural_allocation`.
    
    ## Handling Events and Driving Keyboard Focus
    
    Passing events to the area is as simple as handling events on any
    normal widget and then passing them to the [gtk.cell_area.CellArea.event]
    API as they come in. Usually [gtk.cell_area.CellArea] is only interested in
    button events, however some customized derived areas can be implemented
    who are interested in handling other events. Handling an event can
    trigger the `signal@Gtk.CellArea::focus-changed` signal to fire; as well
    as `signal@Gtk.CellArea::add-editable` in the case that an editable cell
    was clicked and needs to start editing. You can call
    [gtk.cell_area.CellArea.stopEditing] at any time to cancel any cell editing
    that is currently in progress.
    
    The [gtk.cell_area.CellArea] drives keyboard focus from cell to cell in a way
    similar to [gtk.widget.Widget]. For layouting widgets that support giving
    focus to cells it’s important to remember to pass [gtk.types.CellRendererState.Focused]
    to the area functions for the row that has focus and to tell the
    area to paint the focus at render time.
    
    Layouting widgets that accept focus on cells should implement the
    `vfunc@Gtk.Widget.focus` virtual method. The layouting widget is always
    responsible for knowing where [gtk.tree_model.TreeModel] rows are rendered inside
    the widget, so at `vfunc@Gtk.Widget.focus` time the layouting widget
    should use the [gtk.cell_area.CellArea] methods to navigate focus inside the area
    and then observe the [gtk.types.DirectionType] to pass the focus to adjacent
    rows and areas.
    
    A basic example of how the `vfunc@Gtk.Widget.focus` virtual method
    should be implemented:
    
    ```
    static gboolean
    foo_focus (GtkWidget       *widget,
               GtkDirectionType direction)
    {
      Foo *self = FOO (widget);
      FooPrivate *priv = foo_get_instance_private (self);
      int focus_row = priv->focus_row;
      gboolean have_focus = FALSE;
    
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
    [gtk.types.DirectionType] values to the way it lays out its cells.
    
    ## Cell Properties
    
    The [gtk.cell_area.CellArea] introduces cell properties for [gtk.cell_renderer.CellRenderer]s.
    This provides some general interfaces for defining the relationship
    cell areas have with their cells. For instance in a [gtk.cell_area_box.CellAreaBox]
    a cell might “expand” and receive extra space when the area is allocated
    more than its full natural request, or a cell might be configured to “align”
    with adjacent rows which were requested and rendered with the same
    [gtk.cell_area_context.CellAreaContext].
    
    Use [gtk.cell_area_class.CellAreaClass.installCellProperty] to install cell
    properties for a cell area class and [gtk.cell_area_class.CellAreaClass.findCellProperty]
    or [gtk.cell_area_class.CellAreaClass.listCellProperties] to get information about
    existing cell properties.
    
    To set the value of a cell property, use [gtk.cell_area.CellArea.cellSetProperty],
    [gtk.cell_area.CellArea.cellSet] or [gtk.cell_area.CellArea.cellSetValist]. To obtain
    the value of a cell property, use [gtk.cell_area.CellArea.cellGetProperty]
    [gtk.cell_area.CellArea.cellGet] or [gtk.cell_area.CellArea.cellGetValist].

    Deprecated: List views use widgets for displaying their
        contents
*/
struct GtkCellArea
{
  /** */
  GInitiallyUnowned parentInstance;
}

/**
    A cell area that renders GtkCellRenderers into a row or a column
    
    The [gtk.cell_area_box.CellAreaBox] renders cell renderers into a row or a column
    depending on its [gtk.types.Orientation].
    
    GtkCellAreaBox uses a notion of packing. Packing
    refers to adding cell renderers with reference to a particular position
    in a [gtk.cell_area_box.CellAreaBox]. There are two reference positions: the
    start and the end of the box.
    When the [gtk.cell_area_box.CellAreaBox] is oriented in the [gtk.types.Orientation.Vertical]
    orientation, the start is defined as the top of the box and the end is
    defined as the bottom. In the [gtk.types.Orientation.Horizontal] orientation
    start is defined as the left side and the end is defined as the right
    side.
    
    Alignments of [gtk.cell_renderer.CellRenderer]s rendered in adjacent rows can be
    configured by configuring the [gtk.cell_area_box.CellAreaBox] align child cell property
    with [gtk.cell_area.CellArea.cellSetProperty] or by specifying the "align"
    argument to [gtk.cell_area_box.CellAreaBox.packStart] and [gtk.cell_area_box.CellAreaBox.packEnd].

    Deprecated: List views use widgets for displaying their
        contents
*/
struct GtkCellAreaBox;

/** */
struct GtkCellAreaClass
{
  /** */
  GInitiallyUnownedClass parentClass;

  /**
      adds a [gtk.cell_renderer.CellRenderer] to the area.
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer) add;

  /**
      removes a [gtk.cell_renderer.CellRenderer] from the area.
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer) remove;

  /**
      calls the [gtk.types.CellCallback] function on every [gtk.cell_renderer.CellRenderer] in
        the area with the provided user data until the callback returns true.
  */
  extern(C) void function(GtkCellArea* area, GtkCellCallback callback, void* callbackData) foreach_;

  /**
      Calls the [gtk.types.CellAllocCallback] function on every
        [gtk.cell_renderer.CellRenderer] in the area with the allocated area for the cell
        and the provided user data until the callback returns true.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, const(GdkRectangle)* cellArea, const(GdkRectangle)* backgroundArea, GtkCellAllocCallback callback, void* callbackData) foreachAlloc;

  /**
      Handle an event in the area, this is generally used to activate
        a cell at the event location for button events but can also be used
        to generically pass events to [gtk.widget.Widget]s drawn onto the area.
  */
  extern(C) int function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, GdkEvent* event, const(GdkRectangle)* cellArea, GtkCellRendererState flags) event;

  /**
      Actually snapshot the area’s cells to the specified rectangle,
        @background_area should be correctly distributed to the cells
        corresponding background areas.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, GtkSnapshot* snapshot, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean paintFocus) snapshot;

  /**
      Apply the cell attributes to the cells. This is
        implemented as a signal and generally [gtk.cell_area.CellArea] subclasses don't
        need to implement it since it is handled by the base class.
  */
  extern(C) void function(GtkCellArea* area, GtkTreeModel* treeModel, GtkTreeIter* iter, gboolean isExpander, gboolean isExpanded) applyAttributes;

  /**
      Creates and returns a class specific [gtk.cell_area_context.CellAreaContext]
        to store cell alignment and allocation details for a said [gtk.cell_area.CellArea]
        class.
  */
  extern(C) GtkCellAreaContext* function(GtkCellArea* area) createContext;

  /**
      Creates a new [gtk.cell_area_context.CellAreaContext] in the same state as
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
        the particular layouting details of the said [gtk.cell_area.CellArea]. While
        requests are performed over a series of rows, alignments and overall
        minimum and natural sizes should be stored in the corresponding
        [gtk.cell_area_context.CellAreaContext].
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumWidth, int* naturalWidth) getPreferredWidth;

  /**
      Calculates the minimum and natural height
        for the area if the passed @context would be allocated the given width.
        When implementing this virtual method it is safe to assume that @context
        has already stored the aligned cell widths for every [gtk.tree_model.TreeModel] row
        that @context will be allocated for since this information was stored
        at `GtkCellAreaClass.get_preferred_width()` time. This virtual method
        should also store any necessary alignments of cell heights for the
        case that the context is allocated a height.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int width, int* minimumHeight, int* naturalHeight) getPreferredHeightForWidth;

  /**
      Calculates the minimum and natural height of the
        areas cells with the current attributes applied. Essentially this is
        the same as `GtkCellAreaClass.get_preferred_width()` only for areas
        that are being requested as [gtk.types.SizeRequestMode.WidthForHeight].
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int* minimumHeight, int* naturalHeight) getPreferredHeight;

  /**
      Calculates the minimum and natural width
        for the area if the passed @context would be allocated the given
        height. The same as `GtkCellAreaClass.get_preferred_height_for_width()`
        only for handling requests in the [gtk.types.SizeRequestMode.WidthForHeight]
        mode.
  */
  extern(C) void function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, int height, int* minimumWidth, int* naturalWidth) getPreferredWidthForHeight;

  /**
      This should be implemented to handle changes in child
        cell properties for a given [gtk.cell_renderer.CellRenderer] that were previously
        installed on the [gtk.cell_area_class.CellAreaClass] with [gtk.cell_area_class.CellAreaClass.installCellProperty].
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, const(GValue)* value, GParamSpec* pspec) setCellProperty;

  /**
      This should be implemented to report the values of
        child cell properties for a given child [gtk.cell_renderer.CellRenderer].
  */
  extern(C) void function(GtkCellArea* area, GtkCellRenderer* renderer, uint propertyId, GValue* value, GParamSpec* pspec) getCellProperty;

  /**
      This virtual method should be implemented to navigate focus from
        cell to cell inside the [gtk.cell_area.CellArea]. The [gtk.cell_area.CellArea] should move
        focus from cell to cell inside the area and return false if focus
        logically leaves the area with the following exceptions: When the
        area contains no activatable cells, the entire area receives focus.
        Focus should not be given to cells that are actually “focus siblings”
        of other sibling cells (see [gtk.cell_area.CellArea.getFocusFromSibling]).
        Focus is set by calling [gtk.cell_area.CellArea.setFocusCell].
  */
  extern(C) gboolean function(GtkCellArea* area, GtkDirectionType direction) focus;

  /**
      Returns whether the [gtk.cell_area.CellArea] can respond to
        `GtkCellAreaClass.activate()`, usually this does not need to be
        implemented since the base class takes care of this however it can
        be enhanced if the [gtk.cell_area.CellArea] subclass can handle activation in
        other ways than activating its `GtkCellRenderers`.
  */
  extern(C) gboolean function(GtkCellArea* area) isActivatable;

  /**
      This is called when the layouting widget rendering the
        [gtk.cell_area.CellArea] activates the focus cell (see [gtk.cell_area.CellArea.getFocusCell]).
  */
  extern(C) gboolean function(GtkCellArea* area, GtkCellAreaContext* context, GtkWidget* widget, const(GdkRectangle)* cellArea, GtkCellRendererState flags, gboolean editOnly) activate;

  /** */
  void*[8] padding;
}

/**
    Stores geometrical information for a series of rows in a GtkCellArea
    
    The [gtk.cell_area_context.CellAreaContext] object is created by a given [gtk.cell_area.CellArea]
    implementation via its `GtkCellAreaClass.create_context()` virtual
    method and is used to store cell sizes and alignments for a series of
    [gtk.tree_model.TreeModel] rows that are requested and rendered in the same context.
    
    [gtk.cell_layout.CellLayout] widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given [gtk.tree_model.TreeModel]
    row also be used for the same row when calling other [gtk.cell_area.CellArea] APIs
    such as [gtk.cell_area.CellArea.render] and [gtk.cell_area.CellArea.event].

    Deprecated: This object will be removed in GTK 5
*/
struct GtkCellAreaContext
{
  /** */
  GObject parentInstance;
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
  void*[8] padding;
}

/** */
struct GtkCellAreaContextPrivate;

/**
    Interface for widgets that can be used for editing cells
    
    The [gtk.cell_editable.CellEditable] interface must be implemented for widgets to be usable
    to edit the contents of a [gtk.tree_view.TreeView] cell. It provides a way to specify how
    temporary widgets should be configured for editing, get the new value, etc.

    Deprecated: List views use widgets for displaying their
        contents. See [gtk.editable.Editable] for editable text widgets
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
    An interface for packing cells
    
    [gtk.cell_layout.CellLayout] is an interface to be implemented by all objects which
    want to provide a [gtk.tree_view_column.TreeViewColumn] like API for packing cells,
    setting attributes and data funcs.
    
    One of the notable features provided by implementations of
    [gtk.cell_layout.CellLayout] are attributes. Attributes let you set the properties
    in flexible ways. They can just be set to constant values like regular
    properties. But they can also be mapped to a column of the underlying
    tree model with [gtk.cell_layout.CellLayout.setAttributes], which means that the value
    of the attribute can change from cell to cell as they are rendered by
    the cell renderer. Finally, it is possible to specify a function with
    [gtk.cell_layout.CellLayout.setCellDataFunc] that is called to determine the
    value of the attribute for each cell that is rendered.
    
    ## GtkCellLayouts as GtkBuildable
    
    Implementations of GtkCellLayout which also implement the GtkBuildable
    interface ([gtk.cell_view.CellView], [gtk.icon_view.IconView], [gtk.combo_box.ComboBox],
    [gtk.entry_completion.EntryCompletion], [gtk.tree_view_column.TreeViewColumn]) accept [gtk.cell_renderer.CellRenderer] objects
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
    
    Furthermore for implementations of [gtk.cell_layout.CellLayout] that use a [gtk.cell_area.CellArea]
    to lay out cells (all [gtk.cell_layout.CellLayout]s in GTK use a [gtk.cell_area.CellArea])
    [cell properties](class.CellArea.html#cell-properties) can also be defined
    in the format by specifying the custom `<cell-packing>` attribute which can
    contain multiple `<property>` elements.
    
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
    
    ## Subclassing GtkCellLayout implementations
    
    When subclassing a widget that implements [gtk.cell_layout.CellLayout] like
    [gtk.icon_view.IconView] or [gtk.combo_box.ComboBox], there are some considerations related
    to the fact that these widgets internally use a [gtk.cell_area.CellArea].
    The cell area is exposed as a construct-only property by these
    widgets. This means that it is possible to e.g. do
    
    ```c
    GtkWIdget *combo =
      g_object_new (GTK_TYPE_COMBO_BOX, "cell-area", my_cell_area, NULL);
    ```
    
    to use a custom cell area with a combo box. But construct properties
    are only initialized after instance `init()`
    functions have run, which means that using functions which rely on
    the existence of the cell area in your subclass `init()` function will
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
    problematic calls out of `init()` and into a `constructor()`
    for your class.

    Deprecated: List views use widgets to display their contents.
        See [gtk.layout_manager.LayoutManager] for layout manager delegate objects
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
      Sets the [gtk.cell_layout.CellLayout]DataFunc to use for
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
      Get the underlying [gtk.cell_area.CellArea] which might be
         cell_layout if called on a [gtk.cell_area.CellArea] or might be NULL if no
         [gtk.cell_area.CellArea] is used by cell_layout.
  */
  extern(C) GtkCellArea* function(GtkCellLayout* cellLayout) getArea;
}

/**
    An object for rendering a single cell
    
    The [gtk.cell_renderer.CellRenderer] is a base class of a set of objects used for
    rendering a cell to a [cairo.context.Context].  These objects are used primarily by
    the [gtk.tree_view.TreeView] widget, though they aren’t tied to them in any
    specific way.  It is worth noting that [gtk.cell_renderer.CellRenderer] is not a
    [gtk.widget.Widget] and cannot be treated as such.
    
    The primary use of a [gtk.cell_renderer.CellRenderer] is for drawing a certain graphical
    elements on a [cairo.context.Context]. Typically, one cell renderer is used to
    draw many cells on the screen.  To this extent, it isn’t expected that a
    CellRenderer keep any permanent state around.  Instead, any state is set
    just prior to use using [gobject.object.ObjectWrap]s property system.  Then, the
    cell is measured using [gtk.cell_renderer.CellRenderer.getPreferredSize]. Finally, the cell
    is rendered in the correct location using [gtk.cell_renderer.CellRenderer.snapshot].
    
    There are a number of rules that must be followed when writing a new
    [gtk.cell_renderer.CellRenderer].  First and foremost, it’s important that a certain set
    of properties will always yield a cell renderer of the same size,
    barring a style change. The [gtk.cell_renderer.CellRenderer] also has a number of
    generic properties that are expected to be honored by all children.
    
    Beyond merely rendering a cell, cell renderers can optionally
    provide active user interface elements. A cell renderer can be
    “activatable” like [gtk.cell_renderer.CellRenderer]Toggle,
    which toggles when it gets activated by a mouse click, or it can be
    “editable” like [gtk.cell_renderer.CellRenderer]Text, which
    allows the user to edit the text using a widget implementing the
    [gtk.cell_editable.CellEditable] interface, e.g. [gtk.entry.Entry].
    To make a cell renderer activatable or editable, you have to
    implement the [gtk.cell_renderer.CellRenderer]Class.activate or
    [gtk.cell_renderer.CellRenderer]Class.start_editing virtual functions, respectively.
    
    Many properties of [gtk.cell_renderer.CellRenderer] and its subclasses have a
    corresponding “set” property, e.g. “cell-background-set” corresponds
    to “cell-background”. These “set” properties reflect whether a property
    has been set or not. You should not set them independently.

    Deprecated: List views use widgets for displaying their
        contents
*/
struct GtkCellRenderer
{
  /** */
  GInitiallyUnowned parentInstance;

  /** */
  GtkCellRendererPrivate* priv;
}

/**
    Renders a keyboard accelerator in a cell
    
    [gtk.cell_renderer_accel.CellRendererAccel] displays a keyboard accelerator (i.e. a key
    combination like `Control + a`). If the cell renderer is editable,
    the accelerator can be changed by simply typing the new combination.

    Deprecated: Applications editing keyboard accelerators should
        provide their own implementation according to platform design
        guidelines
*/
struct GtkCellRendererAccel;

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
      Called to snapshot the content of the [gtk.cell_renderer.CellRenderer].
  */
  extern(C) void function(GtkCellRenderer* cell, GtkSnapshot* snapshot, GtkWidget* widget, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) snapshot;

  /**
      Called to activate the content of the [gtk.cell_renderer.CellRenderer].
  */
  extern(C) gboolean function(GtkCellRenderer* cell, GdkEvent* event, GtkWidget* widget, const(char)* path, const(GdkRectangle)* backgroundArea, const(GdkRectangle)* cellArea, GtkCellRendererState flags) activate;

  /**
      Called to initiate editing the content of the [gtk.cell_renderer.CellRenderer].
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
  void*[8] padding;
}

/** */
struct GtkCellRendererClassPrivate;

/**
    Renders a combobox in a cell
    
    [gtk.cell_renderer_combo.CellRendererCombo] renders text in a cell like [gtk.cell_renderer_text.CellRendererText] from
    which it is derived. But while [gtk.cell_renderer_text.CellRendererText] offers a simple entry to
    edit the text, [gtk.cell_renderer_combo.CellRendererCombo] offers a [gtk.combo_box.ComboBox]
    widget to edit the text. The values to display in the combo box are taken from
    the tree model specified in the [gtk.cell_renderer_combo.CellRendererCombo]:model property.
    
    The combo cell renderer takes care of adding a text cell renderer to the combo
    box and sets it to display the column specified by its
    [gtk.cell_renderer_combo.CellRendererCombo]:text-column property. Further properties of the combo box
    can be set in a handler for the `GtkCellRenderer::editing-started` signal.

    Deprecated: List views use widgets to display their contents. You
        should use [gtk.drop_down.DropDown] instead
*/
struct GtkCellRendererCombo;

/**
    Renders a pixbuf in a cell
    
    A [gtk.cell_renderer_pixbuf.CellRendererPixbuf] can be used to render an image in a cell. It allows
    to render either a given [gdkpixbuf.pixbuf.Pixbuf] (set via the
    `GtkCellRendererPixbuf:pixbuf` property) or a named icon (set via the
    `GtkCellRendererPixbuf:icon-name` property).
    
    To support the tree view, [gtk.cell_renderer_pixbuf.CellRendererPixbuf] also supports rendering two
    alternative pixbufs, when the `GtkCellRenderer:is-expander` property is true.
    If the `GtkCellRenderer:is-expanded property` is true and the
    `GtkCellRendererPixbuf:pixbuf-expander-open` property is set to a pixbuf, it
    renders that pixbuf, if the `GtkCellRenderer:is-expanded` property is false
    and the `GtkCellRendererPixbuf:pixbuf-expander-closed` property is set to a
    pixbuf, it renders that one.

    Deprecated: List views use widgets to display their contents. You
        should use [gtk.image.Image] for icons, and [gtk.picture.Picture] for images
*/
struct GtkCellRendererPixbuf;

/** */
struct GtkCellRendererPrivate;

/**
    Renders numbers as progress bars
    
    [gtk.cell_renderer_progress.CellRendererProgress] renders a numeric value as a progress par in a cell.
    Additionally, it can display a text on top of the progress bar.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.progress_bar.ProgressBar] instead
*/
struct GtkCellRendererProgress;

/**
    Renders a spin button in a cell
    
    [gtk.cell_renderer_spin.CellRendererSpin] renders text in a cell like [gtk.cell_renderer_text.CellRendererText] from
    which it is derived. But while [gtk.cell_renderer_text.CellRendererText] offers a simple entry to
    edit the text, [gtk.cell_renderer_spin.CellRendererSpin] offers a [gtk.spin_button.SpinButton] widget. Of course,
    that means that the text has to be parseable as a floating point number.
    
    The range of the spinbutton is taken from the adjustment property of the
    cell renderer, which can be set explicitly or mapped to a column in the
    tree model, like all properties of cell renders. [gtk.cell_renderer_spin.CellRendererSpin]
    also has properties for the `GtkCellRendererSpin:climb-rate` and the number
    of `GtkCellRendererSpin:digits` to display. Other [gtk.spin_button.SpinButton] properties
    can be set in a handler for the `GtkCellRenderer::editing-started` signal.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.spin_button.SpinButton] instead
*/
struct GtkCellRendererSpin;

/**
    Renders a spinning animation in a cell
    
    [gtk.cell_renderer_spinner.CellRendererSpinner] renders a spinning animation in a cell, very
    similar to [gtk.spinner.Spinner]. It can often be used as an alternative
    to a [gtk.cell_renderer_progress.CellRendererProgress] for displaying indefinite activity,
    instead of actual progress.
    
    To start the animation in a cell, set the `GtkCellRendererSpinner:active`
    property to true and increment the `GtkCellRendererSpinner:pulse` property
    at regular intervals. The usual way to set the cell renderer properties
    for each cell is to bind them to columns in your tree model using e.g.
    [gtk.tree_view_column.TreeViewColumn.addAttribute].

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.spinner.Spinner] instead
*/
struct GtkCellRendererSpinner;

/**
    Renders text in a cell
    
    A [gtk.cell_renderer_text.CellRendererText] renders a given text in its cell, using the font, color and
    style information provided by its properties. The text will be ellipsized if it is
    too long and the `GtkCellRendererText:ellipsize` property allows it.
    
    If the `GtkCellRenderer:mode` is [gtk.types.CellRendererMode.Editable],
    the [gtk.cell_renderer_text.CellRendererText] allows to edit its text using an entry.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.inscription.Inscription] or [gtk.label.Label] instead
*/
struct GtkCellRendererText
{
  /** */
  GtkCellRenderer parent;
}

/** */
struct GtkCellRendererTextClass
{
  /** */
  GtkCellRendererClass parentClass;

  /** */
  extern(C) void function(GtkCellRendererText* cellRendererText, const(char)* path, const(char)* newText) edited;

  /** */
  void*[8] padding;
}

/**
    Renders a toggle button in a cell
    
    [gtk.cell_renderer_toggle.CellRendererToggle] renders a toggle button in a cell. The
    button is drawn as a radio or a checkbutton, depending on the
    `GtkCellRendererToggle:radio` property.
    When activated, it emits the `GtkCellRendererToggle::toggled` signal.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.toggle_button.ToggleButton] instead
*/
struct GtkCellRendererToggle;

/**
    A widget displaying a single row of a GtkTreeModel
    
    A [gtk.cell_view.CellView] displays a single row of a [gtk.tree_model.TreeModel] using a [gtk.cell_area.CellArea]
    and [gtk.cell_area_context.CellAreaContext]. A [gtk.cell_area_context.CellAreaContext] can be provided to the
    [gtk.cell_view.CellView] at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with each other (like the aligned cells in the menus
    of [gtk.combo_box.ComboBox]).
    
    [gtk.cell_view.CellView] is [gtk.orientable.Orientable] in order to decide in which orientation
    the underlying [gtk.cell_area_context.CellAreaContext] should be allocated. Taking the [gtk.combo_box.ComboBox]
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    ## CSS nodes
    
    GtkCellView has a single CSS node with name cellview.

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.box.Box] instead
*/
struct GtkCellView;

/**
    [gtk.center_box.CenterBox] arranges three children in a row, keeping the middle child
    centered as well as possible.
    
    ![An example GtkCenterBox](centerbox.png)
    
    To add children to [gtk.center_box.CenterBox], use [gtk.center_box.CenterBox.setStartWidget],
    [gtk.center_box.CenterBox.setCenterWidget] and
    [gtk.center_box.CenterBox.setEndWidget].
    
    The sizing and positioning of children can be influenced with the
    align and expand properties of the children.
    
    # GtkCenterBox as GtkBuildable
    
    The [gtk.center_box.CenterBox] implementation of the [gtk.buildable.Buildable] interface
    supports placing children in the 3 positions by specifying “start”, “center”
    or “end” as the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gtk.center_box.CenterBox] uses a single CSS node with the name “box”,
    
    The first child of the [gtk.center_box.CenterBox] will be allocated depending on the
    text direction, i.e. in left-to-right layouts it will be allocated on the
    left and in right-to-left layouts on the right.
    
    In vertical orientation, the nodes of the children are arranged from top to
    bottom.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.center_box.CenterBox] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.center_box.CenterBox] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkCenterBox;

/** */
struct GtkCenterBoxClass;

/**
    [gtk.center_layout.CenterLayout] is a layout manager that manages up to three children.
    
    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end
    widget at the end.
    
    The center widget is centered regarding the full width of the layout's.
*/
struct GtkCenterLayout;

/** */
struct GtkCenterLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    A [gtk.check_button.CheckButton] places a label next to an indicator.
    
    ![Example GtkCheckButtons](check-button.png)
    
    A [gtk.check_button.CheckButton] is created by calling either [gtk.check_button.CheckButton.new_]
    or [gtk.check_button.CheckButton.newWithLabel].
    
    The state of a [gtk.check_button.CheckButton] can be set specifically using
    [gtk.check_button.CheckButton.setActive], and retrieved using
    [gtk.check_button.CheckButton.getActive].
    
    # Inconsistent state
    
    In addition to "on" and "off", check buttons can be an
    "in between" state that is neither on nor off. This can be used
    e.g. when the user has selected a range of elements (such as some
    text or spreadsheet cells) that are affected by a check button,
    and the current values in that range are inconsistent.
    
    To set a [gtk.check_button.CheckButton] to inconsistent state, use
    [gtk.check_button.CheckButton.setInconsistent].
    
    # Grouping
    
    Check buttons can be grouped together, to form mutually exclusive
    groups - only one of the buttons can be toggled at a time, and toggling
    another one will switch the currently toggled one off.
    
    Grouped check buttons use a different indicator, and are commonly referred
    to as *radio buttons*.
    
    ![Example GtkCheckButtons](radio-button.png)
    
    To add a [gtk.check_button.CheckButton] to a group, use [gtk.check_button.CheckButton.setGroup].
    
    When the code must keep track of the state of a group of radio buttons, it
    is recommended to keep track of such state through a stateful
    [gio.action.Action] with a target for each button. Using the `toggled` signals to keep
    track of the group changes and state is discouraged.
    
    # CSS nodes
    
    ```
    checkbutton[.text-button]
    ├── check
    ╰── [label]
    ```
    
    A [gtk.check_button.CheckButton] has a main node with name checkbutton. If the
    [gtk.check_button.CheckButton.label] or [gtk.check_button.CheckButton.child]
    properties are set, it contains a child widget. The indicator node
    is named check when no group is set, and radio if the checkbutton
    is grouped together with other checkbuttons.
    
    # Accessibility
    
    [gtk.check_button.CheckButton] uses the [gtk.types.AccessibleRole.Checkbox] role.
*/
struct GtkCheckButton
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkCheckButtonClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkCheckButton* checkButton) toggled;

  /** */
  extern(C) void function(GtkCheckButton* checkButton) activate;

  /** */
  void*[7] padding;
}

/**
    An expression using a custom [gobject.closure.Closure] to compute the value from
    its parameters.
*/
struct GtkClosureExpression;

/**
    The [gtk.color_button.ColorButton] allows to open a color chooser dialog to change
    the color.
    
    ![An example GtkColorButton](color-button.png)
    
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    ```
    colorbutton
    ╰── button.color
        ╰── [content]
    ```
    
    [gtk.color_button.ColorButton] has a single CSS node with name colorbutton which
    contains a button node. To differentiate it from a plain [gtk.button.Button],
    it gets the .color style class.

    Deprecated: Use [gtk.color_dialog_button.ColorDialogButton] instead
*/
struct GtkColorButton;

/**
    [gtk.color_chooser.ColorChooser] is an interface that is implemented by widgets
    for choosing colors.
    
    Depending on the situation, colors may be allowed to have alpha (translucency).
    
    In GTK, the main widgets that implement this interface are
    [gtk.color_chooser_widget.ColorChooserWidget], [gtk.color_chooser_dialog.ColorChooserDialog] and
    [gtk.color_button.ColorButton].

    Deprecated: Use [gtk.color_dialog.ColorDialog] and [gtk.color_dialog_button.ColorDialogButton]
        instead of widgets implementing [gtk.color_chooser.ColorChooser]
*/
struct GtkColorChooser;

/**
    A dialog for choosing a color.
    
    ![An example GtkColorChooserDialog](colorchooser.png)
    
    [gtk.color_chooser_dialog.ColorChooserDialog] implements the [gtk.color_chooser.ColorChooser] interface
    and does not provide much API of its own.
    
    To create a [gtk.color_chooser_dialog.ColorChooserDialog], use [gtk.color_chooser_dialog.ColorChooserDialog.new_].
    
    To change the initially selected color, use
    [gtk.color_chooser.ColorChooser.setRgba]. To get the selected color use
    [gtk.color_chooser.ColorChooser.getRgba].
    
    [gtk.color_chooser_dialog.ColorChooserDialog] has been deprecated in favor of [gtk.color_dialog.ColorDialog].
    
    ## CSS nodes
    
    [gtk.color_chooser_dialog.ColorChooserDialog] has a single CSS node with the name `window` and style
    class `.colorchooser`.

    Deprecated: Use [gtk.color_dialog.ColorDialog] instead
*/
struct GtkColorChooserDialog;

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
    The [gtk.color_chooser_widget.ColorChooserWidget] widget lets the user select a color.
    
    By default, the chooser presents a predefined palette of colors,
    plus a small number of settable custom colors. It is also possible
    to select a different color with the single-color editor.
    
    To enter the single-color editing mode, use the context menu of any
    color of the palette, or use the '+' button to add a new custom color.
    
    The chooser automatically remembers the last selection, as well
    as custom colors.
    
    To create a [gtk.color_chooser_widget.ColorChooserWidget], use [gtk.color_chooser_widget.ColorChooserWidget.new_].
    
    To change the initially selected color, use
    [gtk.color_chooser.ColorChooser.setRgba]. To get the selected color use
    [gtk.color_chooser.ColorChooser.getRgba].
    
    The [gtk.color_chooser_widget.ColorChooserWidget] is used in the [gtk.color_chooser_dialog.ColorChooserDialog]
    to provide a dialog for selecting colors.
    
    # CSS names
    
    [gtk.color_chooser_widget.ColorChooserWidget] has a single CSS node with name colorchooser.

    Deprecated: Direct use of [gtk.color_chooser_widget.ColorChooserWidget] is deprecated.
*/
struct GtkColorChooserWidget;

/**
    A [gtk.color_dialog.ColorDialog] object collects the arguments that
    are needed to present a color chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with the [gtk.color_dialog.ColorDialog.chooseRgba]
    function. This API follows the GIO async pattern, and the
    result can be obtained by calling
    [gtk.color_dialog.ColorDialog.chooseRgbaFinish].
    
    See [gtk.color_dialog_button.ColorDialogButton] for a convenient control
    that uses [gtk.color_dialog.ColorDialog] and presents the results.
*/
struct GtkColorDialog;

/**
    The [gtk.color_dialog_button.ColorDialogButton] is a wrapped around a [gtk.color_dialog.ColorDialog]
    and allows to open a color chooser dialog to change the color.
    
    ![An example GtkColorDialogButton](color-button.png)
    
    It is suitable widget for selecting a color in a preference dialog.
    
    # CSS nodes
    
    ```
    colorbutton
    ╰── button.color
        ╰── [content]
    ```
    
    [gtk.color_dialog_button.ColorDialogButton] has a single CSS node with name colorbutton which
    contains a button node. To differentiate it from a plain [gtk.button.Button],
    it gets the .color style class.
*/
struct GtkColorDialogButton;

/** */
struct GtkColorDialogButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct GtkColorDialogClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.column_view.ColumnView] presents a large dynamic list of items using multiple columns
    with headers.
    
    [gtk.column_view.ColumnView] uses the factories of its columns to generate a cell widget for
    each column, for each visible item and displays them together as the row for
    this item.
    
    The `property@Gtk.ColumnView:show-row-separators` and
    `property@Gtk.ColumnView:show-column-separators` properties offer a simple way
    to display separators between the rows or columns.
    
    [gtk.column_view.ColumnView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on *rubberband selection*, using
    `property@Gtk.ColumnView:enable-rubberband`.
    
    The column view supports sorting that can be customized by the user by
    clicking on column headers. To set this up, the [gtk.sorter.Sorter] returned by
    [gtk.column_view.ColumnView.getSorter] must be attached to a sort model for the
    data that the view is showing, and the columns must have sorters attached to
    them by calling [gtk.column_view_column.ColumnViewColumn.setSorter]. The initial sort
    order can be set with [gtk.column_view.ColumnView.sortByColumn].
    
    The column view also supports interactive resizing and reordering of
    columns, via Drag-and-Drop of the column headers. This can be enabled or
    disabled with the [gtk.column_view.ColumnView.reorderable] and
    [gtk.column_view_column.ColumnViewColumn.resizable] properties.
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    # CSS nodes
    
    ```
    columnview[.column-separators][.rich-list][.navigation-sidebar][.data-table]
    ├── header
    │   ├── <column header>
    ┊   ┊
    │   ╰── <column header>
    │
    ├── listview
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.column_view.ColumnView] uses a single CSS node named columnview. It may carry the
    .column-separators style class, when `property@Gtk.ColumnView:show-column-separators`
    property is set. Header widgets appear below a node with name header.
    The rows are contained in a [gtk.list_view.ListView] widget, so there is a listview
    node with the same structure as for a standalone [gtk.list_view.ListView] widget.
    If `property@Gtk.ColumnView:show-row-separators` is set, it will be passed
    on to the list view, causing its CSS node to carry the .separators style class.
    For rubberband selection, a node with name rubberband is used.
    
    The main columnview node may also carry style classes to select
    the style of [list presentation](section-list-widget.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gtk.column_view.ColumnView] uses the [gtk.types.AccessibleRole.TreeGrid] role, header title
    widgets are using the [gtk.types.AccessibleRole.ColumnHeader] role. The row widgets
    are using the [gtk.types.AccessibleRole.Row] role, and individual cells are using
    the [gtk.types.AccessibleRole.GridCell] role
*/
struct GtkColumnView;

/**
    [gtk.column_view_cell.ColumnViewCell] is used by [gtk.column_view_column.ColumnViewColumn] to represent items
    in a cell in [gtk.column_view.ColumnView].
    
    The [gtk.column_view_cell.ColumnViewCell]s are managed by the columnview widget (with its factory)
    and cannot be created by applications, but they need to be populated
    by application code. This is done by calling [gtk.column_view_cell.ColumnViewCell.setChild].
    
    [gtk.column_view_cell.ColumnViewCell]s exist in 2 stages:
    
    1. The unbound stage where the listitem is not currently connected to
       an item in the list. In that case, the [gtk.column_view_cell.ColumnViewCell.item]
       property is set to null.
    
    2. The bound stage where the listitem references an item from the list.
       The [gtk.column_view_cell.ColumnViewCell.item] property is not null.
*/
struct GtkColumnViewCell;

/** */
struct GtkColumnViewCellClass;

/** */
struct GtkColumnViewClass;

/**
    [gtk.column_view_column.ColumnViewColumn] represents the columns being added to a [gtk.column_view.ColumnView].
    
    The main ingredient for a [gtk.column_view_column.ColumnViewColumn] is the [gtk.list_item_factory.ListItemFactory]
    that tells the columnview how to create cells for this column from items in
    the model.
    
    Columns have a title, and can optionally have a header menu set
    with [gtk.column_view_column.ColumnViewColumn.setHeaderMenu].
    
    A sorter can be associated with a column using
    [gtk.column_view_column.ColumnViewColumn.setSorter], to let users influence sorting
    by clicking on the column header.
*/
struct GtkColumnViewColumn;

/** */
struct GtkColumnViewColumnClass;

/**
    [gtk.column_view_row.ColumnViewRow] is used by [gtk.column_view.ColumnView] to allow configuring
    how rows are displayed.
    
    It is not used to set the widgets displayed in the individual cells. For that
    see `method@GtkColumnViewColumn.set_factory` and `class@GtkColumnViewCell`.
*/
struct GtkColumnViewRow;

/** */
struct GtkColumnViewRowClass;

/**
    [gtk.column_view_sorter.ColumnViewSorter] is a sorter implementation that
    is geared towards the needs of [gtk.column_view.ColumnView].
    
    The sorter returned by [gtk.column_view.ColumnView.getSorter] is
    a [gtk.column_view_sorter.ColumnViewSorter].
    
    In column views, sorting can be configured by associating
    sorters with columns, and users can invert sort order by clicking
    on column headers. The API of [gtk.column_view_sorter.ColumnViewSorter] is designed
    to allow saving and restoring this configuration.
    
    If you are only interested in the primary sort column (i.e. the
    column where a sort indicator is shown in the header), then
    you can just look at `property@Gtk.ColumnViewSorter:primary-sort-column`
    and `property@Gtk.ColumnViewSorter:primary-sort-order`.
    
    If you want to store the full sort configuration, including
    secondary sort columns that are used for tie breaking, then
    you can use [gtk.column_view_sorter.ColumnViewSorter.getNthSortColumn].
    To get notified about changes, use [gtk.sorter.Sorter.changed].
    
    To restore a saved sort configuration on a [gtk.column_view.ColumnView],
    use code like:
    
    ```
    sorter = gtk_column_view_get_sorter (view);
    for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
      {
        column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
        gtk_column_view_sort_by_column (view, column, order);
      }
    ```
*/
struct GtkColumnViewSorter;

/** */
struct GtkColumnViewSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    A [gtk.combo_box.ComboBox] is a widget that allows the user to choose from a list of
    valid choices.
    
    ![An example GtkComboBox](combo-box.png)
    
    The [gtk.combo_box.ComboBox] displays the selected choice; when activated, the
    [gtk.combo_box.ComboBox] displays a popup which allows the user to make a new choice.
    
    The [gtk.combo_box.ComboBox] uses the model-view pattern; the list of valid choices
    is specified in the form of a tree model, and the display of the choices
    can be adapted to the data in the model by using cell renderers, as you
    would in a tree view. This is possible since [gtk.combo_box.ComboBox] implements the
    [gtk.cell_layout.CellLayout] interface. The tree model holding the valid
    choices is not restricted to a flat list, it can be a real tree, and the
    popup will reflect the tree structure.
    
    To allow the user to enter values not in the model, the
    `property@Gtk.ComboBox:has-entry` property allows the [gtk.combo_box.ComboBox] to
    contain a [gtk.entry.Entry]. This entry can be accessed by calling
    [gtk.combo_box.ComboBox.getChild] on the combo box.
    
    For a simple list of textual choices, the model-view API of [gtk.combo_box.ComboBox]
    can be a bit overwhelming. In this case, [gtk.combo_box_text.ComboBoxText] offers
    a simple alternative. Both [gtk.combo_box.ComboBox] and [gtk.combo_box_text.ComboBoxText] can contain
    an entry.
    
    ## CSS nodes
    
    ```
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
    
    ```
    combobox
    ├── box.linked
    │   ├── entry.combo
    │   ╰── button.combo
    │       ╰── box
    │           ╰── arrow
    ╰── window.popup
    ```
    
    A [gtk.combo_box.ComboBox] with an entry has a single CSS node with name combobox.
    It contains a box with the .linked class. That box contains an entry and
    a button, both with the .combo class added. The button also contains another
    node with name arrow.
    
    ## Accessibility
    
    [gtk.combo_box.ComboBox] uses the [gtk.types.AccessibleRole.ComboBox] role.

    Deprecated: Use [gtk.drop_down.DropDown] instead
*/
struct GtkComboBox
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkComboBoxClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

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
  extern(C) void function(GtkComboBox* comboBox) activate;

  /** */
  void*[7] padding;
}

/**
    A [gtk.combo_box_text.ComboBoxText] is a simple variant of [gtk.combo_box.ComboBox] for text-only
    use cases.
    
    ![An example GtkComboBoxText](combo-box-text.png)
    
    [gtk.combo_box_text.ComboBoxText] hides the model-view complexity of [gtk.combo_box.ComboBox].
    
    To create a [gtk.combo_box_text.ComboBoxText], use [gtk.combo_box_text.ComboBoxText.new_] or
    [gtk.combo_box_text.ComboBoxText.newWithEntry].
    
    You can add items to a [gtk.combo_box_text.ComboBoxText] with
    [gtk.combo_box_text.ComboBoxText.appendText],
    [gtk.combo_box_text.ComboBoxText.insertText] or
    [gtk.combo_box_text.ComboBoxText.prependText] and remove options with
    [gtk.combo_box_text.ComboBoxText.remove].
    
    If the [gtk.combo_box_text.ComboBoxText] contains an entry (via the
    `property@Gtk.ComboBox:has-entry` property), its contents can be retrieved
    using [gtk.combo_box_text.ComboBoxText.getActiveText].
    
    You should not call [gtk.combo_box.ComboBox.setModel] or attempt to pack more
    cells into this combo box via its [gtk.cell_layout.CellLayout] interface.
    
    ## GtkComboBoxText as GtkBuildable
    
    The [gtk.combo_box_text.ComboBoxText] implementation of the [gtk.buildable.Buildable] interface supports
    adding items directly using the `<items>` element and specifying `<item>`
    elements for each item. Each `<item>` element can specify the “id”
    corresponding to the appended text and also supports the regular
    translation attributes “translatable”, “context” and “comments”.
    
    Here is a UI definition fragment specifying [gtk.combo_box_text.ComboBoxText] items:
    ```xml
    <object class="GtkComboBoxText">
      <items>
        <item translatable="yes" id="factory">Factory</item>
        <item translatable="yes" id="home">Home</item>
        <item translatable="yes" id="subway">Subway</item>
      </items>
    </object>
    ```
    
    ## CSS nodes
    
    ```
    combobox
    ╰── box.linked
        ├── entry.combo
        ├── button.combo
        ╰── window.popup
    ```
    
    [gtk.combo_box_text.ComboBoxText] has a single CSS node with name combobox. It adds
    the style class .combo to the main CSS nodes of its entry and button
    children, and the .linked class to the node of its internal box.

    Deprecated: Use [gtk.drop_down.DropDown] with a [gtk.string_list.StringList]
        instead
*/
struct GtkComboBoxText;

/**
    A constant value in a [gtk.expression.Expression].
*/
struct GtkConstantExpression;

/**
    [gtk.constraint.Constraint] describes a constraint between attributes of two widgets,
     expressed as a linear equation.
    
    The typical equation for a constraint is:
    
    ```
      target.target_attr = source.source_attr × multiplier + constant
    ```
    
    Each [gtk.constraint.Constraint] is part of a system that will be solved by a
    [gtk.constraint_layout.ConstraintLayout] in order to allocate and position each
    child widget or guide.
    
    The source and target, as well as their attributes, of a [gtk.constraint.Constraint]
    instance are immutable after creation.
*/
struct GtkConstraint;

/** */
struct GtkConstraintClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.constraint_guide.ConstraintGuide] is an invisible layout element in a
    [gtk.constraint_layout.ConstraintLayout].
    
    The [gtk.constraint_layout.ConstraintLayout] treats guides like widgets. They
    can be used as the source or target of a [gtk.constraint.Constraint].
    
    Guides have a minimum, maximum and natural size. Depending
    on the constraints that are applied, they can act like a
    guideline that widgets can be aligned to, or like *flexible
    space*.
    
    Unlike a [gtk.widget.Widget], a [gtk.constraint_guide.ConstraintGuide] will not be drawn.
*/
struct GtkConstraintGuide;

/** */
struct GtkConstraintGuideClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A layout manager using constraints to describe relations between widgets.
    
    [gtk.constraint_layout.ConstraintLayout] is a layout manager that uses relations between
    widget attributes, expressed via [gtk.constraint.Constraint] instances, to
    measure and allocate widgets.
    
    ### How do constraints work
    
    Constraints are objects defining the relationship between attributes
    of a widget; you can read the description of the [gtk.constraint.Constraint]
    class to have a more in depth definition.
    
    By taking multiple constraints and applying them to the children of
    a widget using [gtk.constraint_layout.ConstraintLayout], it's possible to describe
    complex layout policies; each constraint applied to a child or to the parent
    widgets contributes to the full description of the layout, in terms of
    parameters for resolving the value of each attribute.
    
    It is important to note that a layout is defined by the totality of
    constraints; removing a child, or a constraint, from an existing layout
    without changing the remaining constraints may result in an unstable
    or unsolvable layout.
    
    Constraints have an implicit "reading order"; you should start describing
    each edge of each child, as well as their relationship with the parent
    container, from the top left (or top right, in RTL languages), horizontally
    first, and then vertically.
    
    A constraint-based layout with too few constraints can become "unstable",
    that is: have more than one solution. The behavior of an unstable layout
    is undefined.
    
    A constraint-based layout with conflicting constraints may be unsolvable,
    and lead to an unstable layout. You can use the [gtk.constraint.Constraint.strength]
    property of [gtk.constraint.Constraint] to "nudge" the layout towards a solution.
    
    ### GtkConstraintLayout as GtkBuildable
    
    [gtk.constraint_layout.ConstraintLayout] implements the [gtk.buildable.Buildable] interface and
    has a custom "constraints" element which allows describing constraints in
    a [gtk.builder.Builder] UI file.
    
    An example of a UI definition fragment specifying a constraint:
    
    ```xml
      <object class="GtkConstraintLayout">
        <constraints>
          <constraint target="button" target-attribute="start"
                      relation="eq"
                      source="super" source-attribute="start"
                      constant="12"
                      strength="required" />
          <constraint target="button" target-attribute="width"
                      relation="ge"
                      constant="250"
                      strength="strong" />
        </constraints>
      </object>
    ```
    
    The definition above will add two constraints to the GtkConstraintLayout:
    
     $(LIST
        * a required constraint between the leading edge of "button" and
          the leading edge of the widget using the constraint layout, plus
          12 pixels
        * a strong, constant constraint making the width of "button" greater
          than, or equal to 250 pixels
     )
       
    The "target" and "target-attribute" attributes are required.
    
    The "source" and "source-attribute" attributes of the "constraint"
    element are optional; if they are not specified, the constraint is
    assumed to be a constant.
    
    The "relation" attribute is optional; if not specified, the constraint
    is assumed to be an equality.
    
    The "strength" attribute is optional; if not specified, the constraint
    is assumed to be required.
    
    The "source" and "target" attributes can be set to "super" to indicate
    that the constraint target is the widget using the GtkConstraintLayout.
    
    There can be "constant" and "multiplier" attributes.
    
    Additionally, the "constraints" element can also contain a description
    of the `GtkConstraintGuides` used by the layout:
    
    ```xml
      <constraints>
        <guide min-width="100" max-width="500" name="hspace"/>
        <guide min-height="64" nat-height="128" name="vspace" strength="strong"/>
      </constraints>
    ```
    
    The "guide" element has the following optional attributes:
    
      $(LIST
          * "min-width", "nat-width", and "max-width", describe the minimum,
            natural, and maximum width of the guide, respectively
          * "min-height", "nat-height", and "max-height", describe the minimum,
            natural, and maximum height of the guide, respectively
          * "strength" describes the strength of the constraint on the natural
            size of the guide; if not specified, the constraint is assumed to
            have a medium strength
          * "name" describes a name for the guide, useful when debugging
      )
        
    ### Using the Visual Format Language
    
    Complex constraints can be described using a compact syntax called VFL,
    or *Visual Format Language*.
    
    The Visual Format Language describes all the constraints on a row or
    column, typically starting from the leading edge towards the trailing
    one. Each element of the layout is composed by "views", which identify
    a [gtk.constraint_target.ConstraintTarget].
    
    For instance:
    
    ```
      [button]-[textField]
    ```
    
    Describes a constraint that binds the trailing edge of "button" to the
    leading edge of "textField", leaving a default space between the two.
    
    Using VFL is also possible to specify predicates that describe constraints
    on attributes like width and height:
    
    ```
      // Width must be greater than, or equal to 50
      [button(>=50)]
    
      // Width of button1 must be equal to width of button2
      [button1(==button2)]
    ```
    
    The default orientation for a VFL description is horizontal, unless
    otherwise specified:
    
    ```
      // horizontal orientation, default attribute: width
      H:[button(>=150)]
    
      // vertical orientation, default attribute: height
      V:[button1(==button2)]
    ```
    
    It's also possible to specify multiple predicates, as well as their
    strength:
    
    ```
      // minimum width of button must be 150
      // natural width of button can be 250
      [button(>=150@required, ==250@medium)]
    ```
    
    Finally, it's also possible to use simple arithmetic operators:
    
    ```
      // width of button1 must be equal to width of button2
      // divided by 2 plus 12
      [button1(button2 / 2 + 12)]
    ```
*/
struct GtkConstraintLayout;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.constraint_layout.ConstraintLayout].
*/
struct GtkConstraintLayoutChild;

/** */
struct GtkConstraintLayoutChildClass
{
  /** */
  GtkLayoutChildClass parentClass;
}

/** */
struct GtkConstraintLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    The [gtk.constraint_target.ConstraintTarget] interface is implemented by objects that
    can be used as source or target in [gtk.constraint.Constraint]s.
    
    Besides [gtk.widget.Widget], it is also implemented by [gtk.constraint_guide.ConstraintGuide].
*/
struct GtkConstraintTarget;

/** */
struct GtkConstraintTargetInterface;

/** */
struct GtkCssLocation
{
  /** */
  size_t bytes;

  /** */
  size_t chars;

  /** */
  size_t lines;

  /** */
  size_t lineBytes;

  /** */
  size_t lineChars;
}

/**
    [gtk.css_provider.CssProvider] is an object implementing the [gtk.style_provider.StyleProvider] interface
    for CSS.
    
    It is able to parse CSS-like input in order to style widgets.
    
    An application can make GTK parse a specific CSS style sheet by calling
    [gtk.css_provider.CssProvider.loadFromFile] or
    [gtk.css_provider.CssProvider.loadFromResource]
    and adding the provider with [gtk.style_context.StyleContext.addProvider] or
    [gtk.style_context.StyleContext.addProviderForDisplay].
    
    In addition, certain files will be read when GTK is initialized.
    First, the file `$XDG_CONFIG_HOME/gtk-4.0/gtk.css` is loaded if it
    exists. Then, GTK loads the first existing file among
    `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    `$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css` and
    `DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
    where `THEME` is the name of the current theme (see the
    `property@Gtk.Settings:gtk-theme-name` setting), `VARIANT` is the
    variant to load (see the
    `property@Gtk.Settings:gtk-application-prefer-dark-theme` setting),
    `DATADIR` is the prefix configured when GTK was compiled (unless
    overridden by the `GTK_DATA_PREFIX` environment variable), and
    `VERSION` is the GTK version number. If no file is found for the
    current version, GTK tries older versions all the way back to 4.0.
    
    To track errors while loading CSS, connect to the
    `signal@Gtk.CssProvider::parsing-error` signal.
*/
struct GtkCssProvider
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkCssProviderClass;

/** */
struct GtkCssProviderPrivate;

/**
    Defines a part of a CSS document.
    
    Because sections are nested into one another, you can use
    [gtk.css_section.CssSection.getParent] to get the containing region.
*/
struct GtkCssSection;

/** */
struct GtkCssStyleChange;

/**
    [gtk.custom_filter.CustomFilter] determines whether to include items with a callback.
*/
struct GtkCustomFilter;

/** */
struct GtkCustomFilterClass
{
  /** */
  GtkFilterClass parentClass;
}

/**
    [gtk.custom_layout.CustomLayout] uses closures for size negotiation.
    
    A `GtkCustomLayout `uses closures matching to the old [gtk.widget.Widget]
    virtual functions for size negotiation, as a convenience API to
    ease the porting towards the corresponding `GtkLayoutManager
    virtual functions.
*/
struct GtkCustomLayout;

/** */
struct GtkCustomLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    [gtk.custom_sorter.CustomSorter] is a [gtk.sorter.Sorter] implementation that sorts via a callback
    function.
*/
struct GtkCustomSorter;

/** */
struct GtkCustomSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    Dialogs are a convenient way to prompt the user for a small amount
    of input.
    
    ![An example GtkDialog](dialog.png)
    
    Typical uses are to display a message, ask a question, or anything else
    that does not require extensive effort on the user’s part.
    
    The main area of a [gtk.dialog.Dialog] is called the "content area", and is yours
    to populate with widgets such a [gtk.label.Label] or [gtk.entry.Entry], to present
    your information, questions, or tasks to the user.
    
    In addition, dialogs allow you to add "action widgets". Most commonly,
    action widgets are buttons. Depending on the platform, action widgets may
    be presented in the header bar at the top of the window, or at the bottom
    of the window. To add action widgets, create your [gtk.dialog.Dialog] using
    [gtk.dialog.Dialog.newWithButtons], or use
    [gtk.dialog.Dialog.addButton], [gtk.dialog.Dialog.addButtons],
    or [gtk.dialog.Dialog.addActionWidget].
    
    `GtkDialogs` uses some heuristics to decide whether to add a close
    button to the window decorations. If any of the action buttons use
    the response ID [gtk.types.ResponseType.Close] or [gtk.types.ResponseType.Cancel], the
    close button is omitted.
    
    Clicking a button that was added as an action widget will emit the
    [gtk.dialog.Dialog.response] signal with a response ID that you specified.
    GTK will never assign a meaning to positive response IDs; these are
    entirely user-defined. But for convenience, you can use the response
    IDs in the [gtk.types.ResponseType] enumeration (these all have values
    less than zero). If a dialog receives a delete event, the
    [gtk.dialog.Dialog.response] signal will be emitted with the
    [gtk.types.ResponseType.DeleteEvent] response ID.
    
    Dialogs are created with a call to [gtk.dialog.Dialog.new_] or
    [gtk.dialog.Dialog.newWithButtons]. The latter is recommended; it allows
    you to set the dialog title, some convenient flags, and add buttons.
    
    A “modal” dialog (that is, one which freezes the rest of the application
    from user input), can be created by calling [gtk.window.Window.setModal]
    on the dialog. When using [gtk.dialog.Dialog.newWithButtons], you can also
    pass the [gtk.types.DialogFlags.Modal] flag to make a dialog modal.
    
    For the simple dialog in the following example, a [gtk.message_dialog.MessageDialog]
    would save some effort. But you’d need to create the dialog contents manually
    if you had more than a simple message in the dialog.
    
    An example for simple [gtk.dialog.Dialog] usage:
    
    ```c
    // Function to open a dialog box with a message
    void
    quick_message (GtkWindow *parent, char *message)
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
                               G_CALLBACK (gtk_window_destroy),
                               dialog);
    
     // Add the label, and show everything we’ve added
    
     gtk_box_append (GTK_BOX (content_area), label);
     gtk_widget_show (dialog);
    }
    ```
    
    # GtkDialog as GtkBuildable
    
    The [gtk.dialog.Dialog] implementation of the [gtk.buildable.Buildable] interface exposes the
    @content_area as an internal child with the name “content_area”.
    
    [gtk.dialog.Dialog] supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area). To mark a response
    as default, set the “default” attribute of the `<action-widget>` element
    to true.
    
    [gtk.dialog.Dialog] supports adding action widgets by specifying “action” as
    the “type” attribute of a `<child>` element. The widget will be added
    either to the action area or the headerbar of the dialog, depending
    on the “use-header-bar” property. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    An example of a [gtk.dialog.Dialog] UI definition fragment:
    
    ```xml
    <object class="GtkDialog" id="dialog1">
      <child type="action">
        <object class="GtkButton" id="button_cancel"/>
      </child>
      <child type="action">
        <object class="GtkButton" id="button_ok">
        </object>
      </child>
      <action-widgets>
        <action-widget response="cancel">button_cancel</action-widget>
        <action-widget response="ok" default="true">button_ok</action-widget>
      </action-widgets>
    </object>
    ```
    
    # Accessibility
    
    [gtk.dialog.Dialog] uses the [gtk.types.AccessibleRole.Dialog] role.

    Deprecated: Use [gtk.window.Window] instead
*/
struct GtkDialog
{
  /** */
  GtkWindow parentInstance;
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
  void*[8] padding;
}

/**
    [gtk.directory_list.DirectoryList] is a list model that wraps [gio.file.File.enumerateChildrenAsync].
    
    It presents a [gio.list_model.ListModel] and fills it asynchronously with the [gio.file_info.FileInfo]s
    returned from that function.
    
    Enumeration will start automatically when the
    [gtk.directory_list.DirectoryList.file] property is set.
    
    While the [gtk.directory_list.DirectoryList] is being filled, the
    [gtk.directory_list.DirectoryList.loading] property will be set to true. You can
    listen to that property if you want to show information like a [gtk.spinner.Spinner]
    or a "Loading..." text.
    
    If loading fails at any point, the [gtk.directory_list.DirectoryList.error]
    property will be set to give more indication about the failure.
    
    The [gio.file_info.FileInfo]s returned from a [gtk.directory_list.DirectoryList] have the "standard::file"
    attribute set to the [gio.file.File] they refer to. This way you can get at the file
    that is referred to in the same way you would via [gio.file_enumerator.FileEnumerator.getChild].
    This means you do not need access to the [gtk.directory_list.DirectoryList], but can access
    the [gio.file.File] directly from the [gio.file_info.FileInfo] when operating with a [gtk.list_view.ListView]
    or similar.
*/
struct GtkDirectoryList;

/** */
struct GtkDirectoryListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.drag_icon.DragIcon] is a [gtk.root.Root] implementation for drag icons.
    
    A drag icon moves with the pointer during a Drag-and-Drop operation
    and is destroyed when the drag ends.
    
    To set up a drag icon and associate it with an ongoing drag operation,
    use [gtk.drag_icon.DragIcon.getForDrag] to get the icon for a drag. You can
    then use it like any other widget and use [gtk.drag_icon.DragIcon.setChild]
    to set whatever widget should be used for the drag icon.
    
    Keep in mind that drag icons do not allow user input.
*/
struct GtkDragIcon;

/** */
struct GtkDragIconClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.drag_source.DragSource] is an event controller to initiate Drag-And-Drop operations.
    
    [gtk.drag_source.DragSource] can be set up with the necessary
    ingredients for a DND operation ahead of time. This includes
    the source for the data that is being transferred, in the form
    of a [gdk.content_provider.ContentProvider], the desired action, and the icon to
    use during the drag operation. After setting it up, the drag
    source must be added to a widget as an event controller, using
    [gtk.widget.Widget.addController].
    
    ```c
    static void
    my_widget_init (MyWidget *self)
    {
      GtkDragSource *drag_source = gtk_drag_source_new ();
    
      g_signal_connect (drag_source, "prepare", G_CALLBACK (on_drag_prepare), self);
      g_signal_connect (drag_source, "drag-begin", G_CALLBACK (on_drag_begin), self);
    
      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (drag_source));
    }
    ```
    
    Setting up the content provider and icon ahead of time only makes
    sense when the data does not change. More commonly, you will want
    to set them up just in time. To do so, [gtk.drag_source.DragSource] has
    [gtk.drag_source.DragSource.prepare] and `signal@Gtk.DragSource::drag-begin`
    signals.
    
    The ::prepare signal is emitted before a drag is started, and
    can be used to set the content provider and actions that the
    drag should be started with.
    
    ```c
    static GdkContentProvider *
    on_drag_prepare (GtkDragSource *source,
                     double         x,
                     double         y,
                     MyWidget      *self)
    {
      // This widget supports two types of content: GFile objects
      // and GdkPixbuf objects; GTK will handle the serialization
      // of these types automatically
      GFile *file = my_widget_get_file (self);
      GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);
    
      return gdk_content_provider_new_union ((GdkContentProvider *[2]) {
          gdk_content_provider_new_typed (G_TYPE_FILE, file),
          gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),
        }, 2);
    }
    ```
    
    The ::drag-begin signal is emitted after the [gdk.drag.Drag] object has
    been created, and can be used to set up the drag icon.
    
    ```c
    static void
    on_drag_begin (GtkDragSource *source,
                   GdkDrag       *drag,
                   MyWidget      *self)
    {
      // Set the widget as the drag icon
      GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));
      gtk_drag_source_set_icon (source, paintable, 0, 0);
      g_object_unref (paintable);
    }
    ```
    
    During the DND operation, [gtk.drag_source.DragSource] emits signals that
    can be used to obtain updates about the status of the operation,
    but it is not normally necessary to connect to any signals,
    except for one case: when the supported actions include
    [gdk.types.DragAction.Move], you need to listen for the
    `signal@Gtk.DragSource::drag-end` signal and delete the
    data after it has been transferred.
*/
struct GtkDragSource;

/** */
struct GtkDragSourceClass;

/**
    [gtk.drawing_area.DrawingArea] is a widget that allows drawing with cairo.
    
    ![An example GtkDrawingArea](drawingarea.png)
    
    It’s essentially a blank widget; you can draw on it. After
    creating a drawing area, the application may want to connect to:
    
    $(LIST
      * The [gtk.widget.Widget.realize] signal to take any necessary actions
        when the widget is instantiated on a particular display.
        (Create GDK resources in response to this signal.)
      
      * The [gtk.drawing_area.DrawingArea.resize] signal to take any necessary
        actions when the widget changes size.
      
      * Call [gtk.drawing_area.DrawingArea.setDrawFunc] to handle redrawing the
        contents of the widget.
    )
      
    The following code portion demonstrates using a drawing
    area to display a circle in the normal widget foreground
    color.
    
    ## Simple GtkDrawingArea usage
    
    ```c
    static void
    draw_function (GtkDrawingArea *area,
                   cairo_t        *cr,
                   int             width,
                   int             height,
                   gpointer        data)
    {
      GdkRGBA color;
    
      cairo_arc (cr,
                 width / 2.0, height / 2.0,
                 MIN (width, height) / 2.0,
                 0, 2 * G_PI);
    
      gtk_widget_get_color (GTK_WIDGET (area),
                            &color);
      gdk_cairo_set_source_rgba (cr, &color);
    
      cairo_fill (cr);
    }
    
    int
    main (int argc, char **argv)
    {
      gtk_init ();
    
      GtkWidget *area = gtk_drawing_area_new ();
      gtk_drawing_area_set_content_width (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_content_height (GTK_DRAWING_AREA (area), 100);
      gtk_drawing_area_set_draw_func (GTK_DRAWING_AREA (area),
                                      draw_function,
                                      NULL, NULL);
      return 0;
    }
    ```
    
    The draw function is normally called when a drawing area first comes
    onscreen, or when it’s covered by another window and then uncovered.
    You can also force a redraw by adding to the “damage region” of the
    drawing area’s window using [gtk.widget.Widget.queueDraw].
    This will cause the drawing area to call the draw function again.
    
    The available routines for drawing are documented in the
    [Cairo documentation](https://www.cairographics.org/manual/); GDK
    offers additional API to integrate with Cairo, like `func@Gdk.cairo_set_source_rgba`
    or `func@Gdk.cairo_set_source_pixbuf`.
    
    To receive mouse events on a drawing area, you will need to use
    event controllers. To receive keyboard events, you will need to set
    the “can-focus” property on the drawing area, and you should probably
    draw some user-visible indication that the drawing area is focused.
    
    If you need more complex control over your widget, you should consider
    creating your own [gtk.widget.Widget] subclass.
*/
struct GtkDrawingArea
{
  /** */
  GtkWidget widget;
}

/** */
struct GtkDrawingAreaClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkDrawingArea* area, int width, int height) resize;

  /** */
  void*[8] padding;
}

/**
    [gtk.drop_controller_motion.DropControllerMotion] is an event controller tracking
    the pointer during Drag-and-Drop operations.
    
    It is modeled after [gtk.event_controller_motion.EventControllerMotion] so if you
    have used that, this should feel really familiar.
    
    This controller is not able to accept drops, use [gtk.drop_target.DropTarget]
    for that purpose.
*/
struct GtkDropControllerMotion;

/** */
struct GtkDropControllerMotionClass;

/**
    [gtk.drop_down.DropDown] is a widget that allows the user to choose an item
    from a list of options.
    
    ![An example GtkDropDown](drop-down.png)
    
    The [gtk.drop_down.DropDown] displays the [selected][gtk.drop_down.DropDown.selected]
    choice.
    
    The options are given to [gtk.drop_down.DropDown] in the form of [gio.list_model.ListModel]
    and how the individual options are represented is determined by
    a [gtk.list_item_factory.ListItemFactory]. The default factory displays simple strings,
    and adds a checkmark to the selected item in the popup.
    
    To set your own factory, use [gtk.drop_down.DropDown.setFactory]. It is
    possible to use a separate factory for the items in the popup, with
    [gtk.drop_down.DropDown.setListFactory].
    
    [gtk.drop_down.DropDown] knows how to obtain strings from the items in a
    [gtk.string_list.StringList]; for other models, you have to provide an expression
    to find the strings via [gtk.drop_down.DropDown.setExpression].
    
    [gtk.drop_down.DropDown] can optionally allow search in the popup, which is
    useful if the list of options is long. To enable the search entry,
    use [gtk.drop_down.DropDown.setEnableSearch].
    
    Here is a UI definition example for [gtk.drop_down.DropDown] with a simple model:
    
    ```xml
    <object class="GtkDropDown">
      <property name="model">
        <object class="GtkStringList">
          <items>
            <item translatable="yes">Factory</item>
            <item translatable="yes">Home</item>
            <item translatable="yes">Subway</item>
          </items>
        </object>
      </property>
    </object>
    ```
    
    If a [gtk.drop_down.DropDown] is created in this manner, or with
    [gtk.drop_down.DropDown.newFromStrings], for instance, the object returned from
    [gtk.drop_down.DropDown.getSelectedItem] will be a [gtk.string_object.StringObject].
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    ## CSS nodes
    
    [gtk.drop_down.DropDown] has a single CSS node with name dropdown,
    with the button and popover nodes as children.
    
    ## Accessibility
    
    [gtk.drop_down.DropDown] uses the [gtk.types.AccessibleRole.ComboBox] role.
*/
struct GtkDropDown;

/** */
struct GtkDropDownClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.drop_target.DropTarget] is an event controller to receive Drag-and-Drop operations.
    
    The most basic way to use a [gtk.drop_target.DropTarget] to receive drops on a
    widget is to create it via [gtk.drop_target.DropTarget.new_], passing in the
    `GType` of the data you want to receive and connect to the
    [gtk.drop_target.DropTarget.drop] signal to receive the data:
    
    ```c
    static gboolean
    on_drop (GtkDropTarget *target,
             const GValue  *value,
             double         x,
             double         y,
             gpointer       data)
    {
      MyWidget *self = data;
    
      // Call the appropriate setter depending on the type of data
      // that we received
      if (G_VALUE_HOLDS (value, G_TYPE_FILE))
        my_widget_set_file (self, g_value_get_object (value));
      else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
        my_widget_set_pixbuf (self, g_value_get_object (value));
      else
        return FALSE;
    
      return TRUE;
    }
    
    static void
    my_widget_init (MyWidget *self)
    {
      GtkDropTarget *target =
        gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
    
      // This widget accepts two types of drop types: GFile objects
      // and GdkPixbuf objects
      gtk_drop_target_set_gtypes (target, (GType [2]) {
        G_TYPE_FILE,
        GDK_TYPE_PIXBUF,
      }, 2);
    
      g_signal_connect (target, "drop", G_CALLBACK (on_drop), self);
      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
    }
    ```
    
    [gtk.drop_target.DropTarget] supports more options, such as:
    
     $(LIST
        * rejecting potential drops via the [gtk.drop_target.DropTarget.accept] signal
          and the [gtk.drop_target.DropTarget.reject] function to let other drop
          targets handle the drop
        * tracking an ongoing drag operation before the drop via the
          [gtk.drop_target.DropTarget.enter], [gtk.drop_target.DropTarget.motion] and
          [gtk.drop_target.DropTarget.leave] signals
        * configuring how to receive data by setting the
          [gtk.drop_target.DropTarget.preload] property and listening for its
          availability via the [gtk.drop_target.DropTarget.value] property
     )
       
    However, [gtk.drop_target.DropTarget] is ultimately modeled in a synchronous way
    and only supports data transferred via `GType`. If you want full control
    over an ongoing drop, the [gtk.drop_target_async.DropTargetAsync] object gives you
    this ability.
    
    While a pointer is dragged over the drop target's widget and the drop
    has not been rejected, that widget will receive the
    [gtk.types.StateFlags.DropActive] state, which can be used to style the widget.
    
    If you are not interested in receiving the drop, but just want to update
    UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
    use [gtk.drop_controller_motion.DropControllerMotion].
*/
struct GtkDropTarget;

/**
    [gtk.drop_target_async.DropTargetAsync] is an event controller to receive Drag-and-Drop
    operations, asynchronously.
    
    It is the more complete but also more complex method of handling drop
    operations compared to [gtk.drop_target.DropTarget], and you should only use
    it if [gtk.drop_target.DropTarget] doesn't provide all the features you need.
    
    To use a [gtk.drop_target_async.DropTargetAsync] to receive drops on a widget, you create
    a [gtk.drop_target_async.DropTargetAsync] object, configure which data formats and actions
    you support, connect to its signals, and then attach it to the widget
    with [gtk.widget.Widget.addController].
    
    During a drag operation, the first signal that a [gtk.drop_target_async.DropTargetAsync]
    emits is [gtk.drop_target_async.DropTargetAsync.accept], which is meant to determine
    whether the target is a possible drop site for the ongoing drop. The
    default handler for the ::accept signal accepts the drop if it finds
    a compatible data format and an action that is supported on both sides.
    
    If it is, and the widget becomes a target, you will receive a
    `signal@Gtk.DropTargetAsync::drag-enter` signal, followed by
    `signal@Gtk.DropTargetAsync::drag-motion` signals as the pointer moves,
    optionally a [gtk.drop_target_async.DropTargetAsync.drop] signal when a drop happens,
    and finally a `signal@Gtk.DropTargetAsync::drag-leave` signal when the
    pointer moves off the widget.
    
    The ::drag-enter and ::drag-motion handler return a [gdk.types.DragAction]
    to update the status of the ongoing operation. The ::drop handler
    should decide if it ultimately accepts the drop and if it does, it
    should initiate the data transfer and finish the operation by calling
    [gdk.drop.Drop.finish].
    
    Between the ::drag-enter and ::drag-leave signals the widget is a
    current drop target, and will receive the [gtk.types.StateFlags.DropActive]
    state, which can be used by themes to style the widget as a drop target.
*/
struct GtkDropTargetAsync;

/** */
struct GtkDropTargetAsyncClass;

/** */
struct GtkDropTargetClass;

/**
    [gtk.editable.Editable] is an interface for text editing widgets.
    
    Typical examples of editable widgets are [gtk.entry.Entry] and
    [gtk.spin_button.SpinButton]. It contains functions for generically manipulating
    an editable widget, a large number of action signals used for key bindings,
    and several signals that an application can connect to modify the behavior
    of a widget.
    
    As an example of the latter usage, by connecting the following handler to
    `signal@Gtk.Editable::insert-text`, an application can convert all entry
    into a widget into uppercase.
    
    ## Forcing entry to uppercase.
    
    ```c
    #include <ctype.h>
    
    void
    insert_text_handler (GtkEditable *editable,
                         const char  *text,
                         int          length,
                         int         *position,
                         gpointer     data)
    {
      char *result = g_utf8_strup (text, length);
    
      g_signal_handlers_block_by_func (editable,
                                   (gpointer) insert_text_handler, data);
      gtk_editable_insert_text (editable, result, length, position);
      g_signal_handlers_unblock_by_func (editable,
                                         (gpointer) insert_text_handler, data);
    
      g_signal_stop_emission_by_name (editable, "insert_text");
    
      g_free (result);
    }
    ```
    
    ## Implementing GtkEditable
    
    The most likely scenario for implementing [gtk.editable.Editable] on your own widget
    is that you will embed a [gtk.text.Text] inside a complex widget, and want to
    delegate the editable functionality to that text widget. [gtk.editable.Editable]
    provides some utility functions to make this easy.
    
    In your class_init function, call [gtk.editable.Editable.installProperties],
    passing the first available property ID:
    
    ```c
    static void
    my_class_init (MyClass *class)
    {
      ...
      g_object_class_install_properties (object_class, NUM_PROPERTIES, props);
      gtk_editable_install_properties (object_clas, NUM_PROPERTIES);
      ...
    }
    ```
    
    In your interface_init function for the [gtk.editable.Editable] interface, provide
    an implementation for the get_delegate vfunc that returns your text widget:
    
    ```c
    GtkEditable *
    get_editable_delegate (GtkEditable *editable)
    {
      return GTK_EDITABLE (MY_WIDGET (editable)->text_widget);
    }
    
    static void
    my_editable_init (GtkEditableInterface *iface)
    {
      iface->get_delegate = get_editable_delegate;
    }
    ```
    
    You don't need to provide any other vfuncs. The default implementations
    work by forwarding to the delegate that the GtkEditableInterface.get_delegate()
    vfunc returns.
    
    In your instance_init function, create your text widget, and then call
    [gtk.editable.Editable.initDelegate]:
    
    ```c
    static void
    my_widget_init (MyWidget *self)
    {
      ...
      self->text_widget = gtk_text_new ();
      gtk_editable_init_delegate (GTK_EDITABLE (self));
      ...
    }
    ```
    
    In your dispose function, call [gtk.editable.Editable.finishDelegate] before
    destroying your text widget:
    
    ```c
    static void
    my_widget_dispose (GObject *object)
    {
      ...
      gtk_editable_finish_delegate (GTK_EDITABLE (self));
      g_clear_pointer (&self->text_widget, gtk_widget_unparent);
      ...
    }
    ```
    
    Finally, use [gtk.editable.Editable.delegateSetProperty] in your `set_property`
    function (and similar for `get_property`), to set the editable properties:
    
    ```c
      ...
      if (gtk_editable_delegate_set_property (object, prop_id, value, pspec))
        return;
    
      switch (prop_id)
      ...
    ```
    
    It is important to note that if you create a [gtk.editable.Editable] that uses
    a delegate, the low level `signal@Gtk.Editable::insert-text` and
    `signal@Gtk.Editable::delete-text` signals will be propagated from the
    "wrapper" editable to the delegate, but they will not be propagated from
    the delegate to the "wrapper" editable, as they would cause an infinite
    recursion. If you wish to connect to the `signal@Gtk.Editable::insert-text`
    and `signal@Gtk.Editable::delete-text` signals, you will need to connect
    to them on the delegate obtained via [gtk.editable.Editable.getDelegate].
*/
struct GtkEditable;

/** */
struct GtkEditableInterface
{
  /** */
  GTypeInterface baseIface;

  /** */
  extern(C) void function(GtkEditable* editable, const(char)* text, int length, int* position) insertText;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) deleteText;

  /** */
  extern(C) void function(GtkEditable* editable) changed;

  /** */
  extern(C) const(char)* function(GtkEditable* editable) getText;

  /** */
  extern(C) void function(GtkEditable* editable, const(char)* text, int length, int* position) doInsertText;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) doDeleteText;

  /** */
  extern(C) gboolean function(GtkEditable* editable, int* startPos, int* endPos) getSelectionBounds;

  /** */
  extern(C) void function(GtkEditable* editable, int startPos, int endPos) setSelectionBounds;

  /** */
  extern(C) GtkEditable* function(GtkEditable* editable) getDelegate;
}

/**
    A [gtk.editable_label.EditableLabel] is a label that allows users to
    edit the text by switching to an “edit mode”.
    
    ![An example GtkEditableLabel](editable-label.png)
    
    [gtk.editable_label.EditableLabel] does not have API of its own, but it
    implements the [gtk.editable.Editable] interface.
    
    The default bindings for activating the edit mode is
    to click or press the Enter key. The default bindings
    for leaving the edit mode are the Enter key (to save
    the results) or the Escape key (to cancel the editing).
    
    # CSS nodes
    
    ```
    editablelabel[.editing]
    ╰── stack
        ├── label
        ╰── text
    ```
    
    [gtk.editable_label.EditableLabel] has a main node with the name editablelabel.
    When the entry is in editing mode, it gets the .editing style
    class.
    
    For all the subnodes added to the text node in various situations,
    see [gtk.text.Text].
*/
struct GtkEditableLabel;

/** */
struct GtkEditableLabelClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    The [gtk.emoji_chooser.EmojiChooser] is used by text widgets such as [gtk.entry.Entry] or
    [gtk.text_view.TextView] to let users insert Emoji characters.
    
    ![An example GtkEmojiChooser](emojichooser.png)
    
    [gtk.emoji_chooser.EmojiChooser] emits the `signal@Gtk.EmojiChooser::emoji-picked`
    signal when an Emoji is selected.
    
    # CSS nodes
    
    ```
    popover
    ├── box.emoji-searchbar
    │   ╰── entry.search
    ╰── box.emoji-toolbar
        ├── button.image-button.emoji-section
        ├── ...
        ╰── button.image-button.emoji-section
    ```
    
    Every [gtk.emoji_chooser.EmojiChooser] consists of a main node called popover.
    The contents of the popover are largely implementation defined
    and supposed to inherit general styles.
    The top searchbar used to search emoji and gets the .emoji-searchbar
    style class itself.
    The bottom toolbar used to switch between different emoji categories
    consists of buttons with the .emoji-section style class and gets the
    .emoji-toolbar style class itself.
*/
struct GtkEmojiChooser;

/** */
struct GtkEmojiChooserClass;

/**
    [gtk.entry.Entry] is a single line text entry widget.
    
    ![An example GtkEntry](entry.png)
    
    A fairly large set of key bindings are supported by default. If the
    entered text is longer than the allocation of the widget, the widget
    will scroll so that the cursor position is visible.
    
    When using an entry for passwords and other sensitive information, it
    can be put into “password mode” using [gtk.entry.Entry.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.entry.Entry.setInvisibleChar].
    
    [gtk.entry.Entry] has the ability to display progress or activity
    information behind the text. To make an entry display such information,
    use [gtk.entry.Entry.setProgressFraction] or
    [gtk.entry.Entry.setProgressPulseStep].
    
    Additionally, [gtk.entry.Entry] can show icons at either side of the entry.
    These icons can be activatable by clicking, can be set up as drag source
    and can have tooltips. To add an icon, use
    [gtk.entry.Entry.setIconFromGicon] or one of the various other functions
    that set an icon from an icon name or a paintable. To trigger an action when
    the user clicks an icon, connect to the `signal@Gtk.Entry::icon-press` signal.
    To allow DND operations from an icon, use
    [gtk.entry.Entry.setIconDragSource]. To set a tooltip on an icon, use
    [gtk.entry.Entry.setIconTooltipText] or the corresponding function
    for markup.
    
    Note that functionality or information that is only available by clicking
    on an icon in an entry may not be accessible at all to users which are not
    able to use a mouse or other pointing device. It is therefore recommended
    that any such functionality should also be available by other means, e.g.
    via the context menu of the entry.
    
    # CSS nodes
    
    ```
    entry[.flat][.warning][.error]
    ├── text[.readonly]
    ├── image.left
    ├── image.right
    ╰── [progress[.pulse]]
    ```
    
    [gtk.entry.Entry] has a main node with the name entry. Depending on the properties
    of the entry, the style classes .read-only and .flat may appear. The style
    classes .warning and .error may also be used with entries.
    
    When the entry shows icons, it adds subnodes with the name image and the
    style class .left or .right, depending on where the icon appears.
    
    When the entry shows progress, it adds a subnode with the name progress.
    The node has the style class .pulse when the shown progress is pulsing.
    
    For all the subnodes added to the text node in various situations,
    see [gtk.text.Text].
    
    # GtkEntry as GtkBuildable
    
    The [gtk.entry.Entry] implementation of the [gtk.buildable.Buildable] interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify [pango.attribute.Attribute] values for
    this label.
    
    An example of a UI definition fragment specifying Pango attributes:
    ```xml
    <object class="GtkEntry">
      <attributes>
        <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
        <attribute name="background" value="red" start="5" end="10"/>
      </attributes>
    </object>
    ```
    
    The start and end attributes specify the range of characters to which the
    Pango attribute applies. If start and end are not specified, the attribute
    is applied to the whole text. Note that specifying ranges does not make much
    sense with translatable attributes. Use markup embedded in the translatable
    content instead.
    
    # Accessibility
    
    [gtk.entry.Entry] uses the [gtk.types.AccessibleRole.TextBox] role.
*/
struct GtkEntry
{
  /** */
  GtkWidget parentInstance;
}

/**
    A [gtk.entry_buffer.EntryBuffer] hold the text displayed in a [gtk.text.Text] widget.
    
    A single [gtk.entry_buffer.EntryBuffer] object can be shared by multiple widgets
    which will then share the same text content, but not the cursor
    position, visibility attributes, icon etc.
    
    [gtk.entry_buffer.EntryBuffer] may be derived from. Such a derived class might allow
    text to be stored in an alternate location, such as non-pageable memory,
    useful in the case of important passwords. Or a derived class could
    integrate with an application’s concept of undo/redo.
*/
struct GtkEntryBuffer
{
  /** */
  GObject parentInstance;
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

/**
    Class structure for [gtk.entry.Entry]. All virtual functions have a default
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
      Class handler for the `GtkEntry::activate` signal. The default
        implementation activates the gtk.activate-default action.
  */
  extern(C) void function(GtkEntry* entry) activate;

  /** */
  void*[8] padding;
}

/**
    [gtk.entry_completion.EntryCompletion] is an auxiliary object to provide completion functionality
    for [gtk.entry.Entry].
    
    It implements the [gtk.cell_layout.CellLayout] interface, to allow the user
    to add extra cells to the [gtk.tree_view.TreeView] with completion matches.
    
    “Completion functionality” means that when the user modifies the text
    in the entry, [gtk.entry_completion.EntryCompletion] checks which rows in the model match
    the current content of the entry, and displays a list of matches.
    By default, the matching is done by comparing the entry text
    case-insensitively against the text column of the model (see
    [gtk.entry_completion.EntryCompletion.setTextColumn]), but this can be overridden
    with a custom match function (see [gtk.entry_completion.EntryCompletion.setMatchFunc]).
    
    When the user selects a completion, the content of the entry is
    updated. By default, the content of the entry is replaced by the
    text column of the model, but this can be overridden by connecting
    to the `signal@Gtk.EntryCompletion::match-selected` signal and updating the
    entry in the signal handler. Note that you should return true from
    the signal handler to suppress the default behaviour.
    
    To add completion functionality to an entry, use
    [gtk.entry.Entry.setCompletion].
    
    [gtk.entry_completion.EntryCompletion] uses a [gtk.tree_model_filter.TreeModelFilter] model to
    represent the subset of the entire model that is currently matching.
    While the [gtk.entry_completion.EntryCompletion] signals
    `signal@Gtk.EntryCompletion::match-selected` and
    `signal@Gtk.EntryCompletion::cursor-on-match` take the original model
    and an iter pointing to that model as arguments, other callbacks and
    signals (such as [gtk.types.CellLayoutDataFunc] or
    `signal@Gtk.CellArea::apply-attributes)`
    will generally take the filter model as argument. As long as you are
    only calling [gtk.tree_model.TreeModel.get], this will make no difference to
    you. If for some reason, you need the original model, use
    [gtk.tree_model_filter.TreeModelFilter.getModel]. Don’t forget to use
    [gtk.tree_model_filter.TreeModelFilter.convertIterToChildIter] to obtain a
    matching iter.
*/
struct GtkEntryCompletion;

/**
    [gtk.event_controller.EventController] is the base class for event controllers.
    
    These are ancillary objects associated to widgets, which react
    to `GdkEvents`, and possibly trigger actions as a consequence.
    
    Event controllers are added to a widget with
    [gtk.widget.Widget.addController]. It is rarely necessary to
    explicitly remove a controller with [gtk.widget.Widget.removeController].
    
    See the chapter on [input handling](input-handling.html) for
    an overview of the basic concepts, such as the capture and bubble
    phases of event propagation.
*/
struct GtkEventController;

/** */
struct GtkEventControllerClass;

/**
    [gtk.event_controller_focus.EventControllerFocus] is an event controller to keep track of
    keyboard focus.
    
    The event controller offers [gtk.event_controller_focus.EventControllerFocus.enter]
    and [gtk.event_controller_focus.EventControllerFocus.leave] signals, as well as
    `property@Gtk.EventControllerFocus:is-focus` and
    `property@Gtk.EventControllerFocus:contains-focus` properties
    which are updated to reflect focus changes inside the widget hierarchy
    that is rooted at the controllers widget.
*/
struct GtkEventControllerFocus;

/** */
struct GtkEventControllerFocusClass;

/**
    [gtk.event_controller_key.EventControllerKey] is an event controller that provides access
    to key events.
*/
struct GtkEventControllerKey;

/** */
struct GtkEventControllerKeyClass;

/**
    [gtk.event_controller_legacy.EventControllerLegacy] is an event controller that provides raw
    access to the event stream.
    
    It should only be used as a last resort if none of the other event
    controllers or gestures do the job.
*/
struct GtkEventControllerLegacy;

/** */
struct GtkEventControllerLegacyClass;

/**
    [gtk.event_controller_motion.EventControllerMotion] is an event controller tracking the pointer
    position.
    
    The event controller offers [gtk.event_controller_motion.EventControllerMotion.enter]
    and [gtk.event_controller_motion.EventControllerMotion.leave] signals, as well as
    `property@Gtk.EventControllerMotion:is-pointer` and
    `property@Gtk.EventControllerMotion:contains-pointer` properties
    which are updated to reflect changes in the pointer position as it
    moves over the widget.
*/
struct GtkEventControllerMotion;

/** */
struct GtkEventControllerMotionClass;

/**
    [gtk.event_controller_scroll.EventControllerScroll] is an event controller that handles scroll
    events.
    
    It is capable of handling both discrete and continuous scroll
    events from mice or touchpads, abstracting them both with the
    [gtk.event_controller_scroll.EventControllerScroll.scroll] signal. Deltas in
    the discrete case are multiples of 1.
    
    In the case of continuous scroll events, [gtk.event_controller_scroll.EventControllerScroll]
    encloses all [gtk.event_controller_scroll.EventControllerScroll.scroll] emissions
    between two [gtk.event_controller_scroll.EventControllerScroll.scroll] and
    [gtk.event_controller_scroll.EventControllerScroll.scroll] signals.
    
    The behavior of the event controller can be modified by the flags
    given at creation time, or modified at a later point through
    [gtk.event_controller_scroll.EventControllerScroll.setFlags] (e.g. because the scrolling
    conditions of the widget changed).
    
    The controller can be set up to emit motion for either/both vertical
    and horizontal scroll events through [gtk.types.EventControllerScrollFlags.Vertical],
    [gtk.types.EventControllerScrollFlags.Horizontal] and [gtk.types.EventControllerScrollFlags.BothAxes].
    If any axis is disabled, the respective [gtk.event_controller_scroll.EventControllerScroll.scroll]
    delta will be 0. Vertical scroll events will be translated to horizontal
    motion for the devices incapable of horizontal scrolling.
    
    The event controller can also be forced to emit discrete events on all
    devices through [gtk.types.EventControllerScrollFlags.Discrete]. This can be used
    to implement discrete actions triggered through scroll events (e.g.
    switching across combobox options).
    
    The [gtk.types.EventControllerScrollFlags.Kinetic] flag toggles the emission of the
    [gtk.event_controller_scroll.EventControllerScroll.decelerate] signal, emitted at the end
    of scrolling with two X/Y velocity arguments that are consistent with the
    motion that was received.
*/
struct GtkEventControllerScroll;

/** */
struct GtkEventControllerScrollClass;

/**
    [gtk.every_filter.EveryFilter] matches an item when each of its filters matches.
    
    To add filters to a [gtk.every_filter.EveryFilter], use [gtk.multi_filter.MultiFilter.append].
*/
struct GtkEveryFilter;

/** */
struct GtkEveryFilterClass;

/**
    [gtk.expander.Expander] allows the user to reveal its child by clicking
    on an expander triangle.
    
    ![An example GtkExpander](expander.png)
    
    This is similar to the triangles used in a [gtk.tree_view.TreeView].
    
    Normally you use an expander as you would use a frame; you create
    the child widget and use [gtk.expander.Expander.setChild] to add it
    to the expander. When the expander is toggled, it will take care of
    showing and hiding the child automatically.
    
    # Special Usage
    
    There are situations in which you may prefer to show and hide the
    expanded widget yourself, such as when you want to actually create
    the widget at expansion time. In this case, create a [gtk.expander.Expander]
    but do not add a child to it. The expander widget has an
    [gtk.expander.Expander.expanded] property which can be used to
    monitor its expansion state. You should watch this property with
    a signal connection as follows:
    
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
    
    The [gtk.expander.Expander] implementation of the [gtk.buildable.Buildable] interface supports
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
    
    ```
    expander-widget
    ╰── box
        ├── title
        │   ├── expander
        │   ╰── <label widget>
        ╰── <child>
    ```
    
    [gtk.expander.Expander] has a main node `expander-widget`, and subnode `box` containing
    the title and child widget. The box subnode `title` contains node `expander`,
    i.e. the expand/collapse arrow; then the label widget if any. The arrow of an
    expander that is showing its child gets the `:checked` pseudoclass set on it.
    
    # Accessibility
    
    [gtk.expander.Expander] uses the [gtk.types.AccessibleRole.Button] role.
*/
struct GtkExpander;

/**
    [gtk.expression.Expression] provides a way to describe references to values.
    
    An important aspect of expressions is that the value can be obtained
    from a source that is several steps away. For example, an expression
    may describe ‘the value of property A of `object1`, which is itself the
    value of a property of `object2`’. And `object1` may not even exist yet
    at the time that the expression is created. This is contrast to [gobject.object.ObjectWrap]
    property bindings, which can only create direct connections between
    the properties of two objects that must both exist for the duration
    of the binding.
    
    An expression needs to be "evaluated" to obtain the value that it currently
    refers to. An evaluation always happens in the context of a current object
    called `this` (it mirrors the behavior of object-oriented languages),
    which may or may not influence the result of the evaluation. Use
    [gtk.expression.Expression.evaluate] for evaluating an expression.
    
    Various methods for defining expressions exist, from simple constants via
    [gtk.constant_expression.ConstantExpression.new_] to looking up properties in a [gobject.object.ObjectWrap]
    (even recursively) via [gtk.property_expression.PropertyExpression.new_] or providing
    custom functions to transform and combine expressions via
    [gtk.closure_expression.ClosureExpression.new_].
    
    Here is an example of a complex expression:
    
    ```c
      color_expr = gtk_property_expression_new (GTK_TYPE_LIST_ITEM,
                                                NULL, "item");
      expression = gtk_property_expression_new (GTK_TYPE_COLOR,
                                                color_expr, "name");
    ```
    
    when evaluated with `this` being a [gtk.list_item.ListItem], it will obtain the
    "item" property from the [gtk.list_item.ListItem], and then obtain the "name" property
    from the resulting object (which is assumed to be of type `GTK_TYPE_COLOR`).
    
    A more concise way to describe this would be
    
    ```
      this->item->name
    ```
    
    The most likely place where you will encounter expressions is in the context
    of list models and list widgets using them. For example, [gtk.drop_down.DropDown] is
    evaluating a [gtk.expression.Expression] to obtain strings from the items in its model
    that it can then use to match against the contents of its search entry.
    [gtk.string_filter.StringFilter] is using a [gtk.expression.Expression] for similar reasons.
    
    By default, expressions are not paying attention to changes and evaluation is
    just a snapshot of the current state at a given time. To get informed about
    changes, an expression needs to be "watched" via a [gtk.expression_watch.ExpressionWatch],
    which will cause a callback to be called whenever the value of the expression may
    have changed; [gtk.expression.Expression.watch] starts watching an expression, and
    [gtk.expression_watch.ExpressionWatch.unwatch] stops.
    
    Watches can be created for automatically updating the property of an object,
    similar to GObject's [gobject.binding.Binding] mechanism, by using [gtk.expression.Expression.bind].
    
    ## GtkExpression in GObject properties
    
    In order to use a [gtk.expression.Expression] as a [gobject.object.ObjectWrap] property, you must use the
    `func@Gtk.param_spec_expression` when creating a [gobject.param_spec.ParamSpec] to install in the
    [gobject.object.ObjectWrap] class being defined; for instance:
    
    ```c
    obj_props[PROP_EXPRESSION] =
      gtk_param_spec_expression ("expression",
                                 "Expression",
                                 "The expression used by the widget",
                                 G_PARAM_READWRITE |
                                 G_PARAM_STATIC_STRINGS |
                                 G_PARAM_EXPLICIT_NOTIFY);
    ```
    
    When implementing the `GObjectClass.set_property` and `GObjectClass.get_property`
    virtual functions, you must use `func@Gtk.value_get_expression`, to retrieve the
    stored [gtk.expression.Expression] from the [gobject.value.Value] container, and `func@Gtk.value_set_expression`,
    to store the [gtk.expression.Expression] into the [gobject.value.Value]; for instance:
    
    ```c
      // in set_property()...
      case PROP_EXPRESSION:
        foo_widget_set_expression (foo, gtk_value_get_expression (value));
        break;
    
      // in get_property()...
      case PROP_EXPRESSION:
        gtk_value_set_expression (value, foo->expression);
        break;
    ```
    
    ## GtkExpression in .ui files
    
    [gtk.builder.Builder] has support for creating expressions. The syntax here can be used where
    a [gtk.expression.Expression] object is needed like in a `<property>` tag for an expression
    property, or in a `<binding name="property">` tag to bind a property to an expression.
    
    To create a property expression, use the `<lookup>` element. It can have a `type`
    attribute to specify the object type, and a `name` attribute to specify the property
    to look up. The content of `<lookup>` can either be an element specifying the expression
    to use the object, or a string that specifies the name of the object to use.
    
    Example:
    
    ```xml
      <lookup name='search'>string_filter</lookup>
    ```
    
    Since the `<lookup>` element creates an expression and its element content can
    itself be an expression, this means that `<lookup>` tags can also be nested.
    This is a common idiom when dealing with [gtk.list_item.ListItem]s. See
    [gtk.builder_list_item_factory.BuilderListItemFactory] for an example of this technique.
    
    To create a constant expression, use the `<constant>` element. If the type attribute
    is specified, the element content is interpreted as a value of that type. Otherwise,
    it is assumed to be an object. For instance:
    
    ```xml
      <constant>string_filter</constant>
      <constant type='gchararray'>Hello, world</constant>
    ```
    
    To create a closure expression, use the `<closure>` element. The `function`
    attribute specifies what function to use for the closure, and the `type`
    attribute specifies its return type. The content of the element contains the
    expressions for the parameters. For instance:
    
    ```xml
      <closure type='gchararray' function='combine_args_somehow'>
        <constant type='gchararray'>File size:</constant>
        <lookup type='GFile' name='size'>myfile</lookup>
      </closure>
    ```
    
    To create a property binding, use the `<binding>` element in place of where a
    `<property>` tag would ordinarily be used. The `name` and `object` attributes are
    supported. The `name` attribute is required, and pertains to the applicable property
    name. The `object` attribute is optional. If provided, it will use the specified object
    as the `this` object when the expression is evaluated. Here is an example in which the
    `label` property of a [gtk.label.Label] is bound to the `string` property of another arbitrary
    object:
    
    ```xml
      <object class='GtkLabel'>
        <binding name='label'>
          <lookup name='string'>some_other_object</lookup>
        </binding>
      </object>
    ```
*/
struct GtkExpression;

/**
    An opaque structure representing a watched [gtk.expression.Expression].
    
    The contents of [gtk.expression_watch.ExpressionWatch] should only be accessed through the
    provided API.
*/
struct GtkExpressionWatch;

/**
    [gtk.file_chooser.FileChooser] is an interface that can be implemented by file
    selection widgets.
    
    In GTK, the main objects that implement this interface are
    [gtk.file_chooser_widget.FileChooserWidget] and [gtk.file_chooser_dialog.FileChooserDialog].
    
    You do not need to write an object that implements the [gtk.file_chooser.FileChooser]
    interface unless you are trying to adapt an existing file selector to
    expose a standard programming interface.
    
    [gtk.file_chooser.FileChooser] allows for shortcuts to various places in the filesystem.
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
    
    When the user is finished selecting files in a [gtk.file_chooser.FileChooser], your
    program can get the selected filenames as [gio.file.File]s.
    
    # Adding options
    
    You can add extra widgets to a file chooser to provide options
    that are not present in the default design, by using
    [gtk.file_chooser.FileChooser.addChoice]. Each choice has an identifier and
    a user visible label; additionally, each choice can have multiple
    options. If a choice has no option, it will be rendered as a
    check button with the given label; if a choice has options, it will
    be rendered as a combo box.

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
struct GtkFileChooser;

/**
    [gtk.file_chooser_dialog.FileChooserDialog] is a dialog suitable for use with
    “File Open” or “File Save” commands.
    
    ![An example GtkFileChooserDialog](filechooser.png)
    
    This widget works by putting a [gtk.file_chooser_widget.FileChooserWidget]
    inside a [gtk.dialog.Dialog]. It exposes the [gtk.file_chooser.FileChooser]
    interface, so you can use all of the [gtk.file_chooser.FileChooser] functions
    on the file chooser dialog as well as those for [gtk.dialog.Dialog].
    
    Note that [gtk.file_chooser_dialog.FileChooserDialog] does not have any methods of its
    own. Instead, you should use the functions that work on a
    [gtk.file_chooser.FileChooser].
    
    If you want to integrate well with the platform you should use the
    [gtk.file_chooser_native.FileChooserNative] API, which will use a platform-specific
    dialog if available and fall back to [gtk.file_chooser_dialog.FileChooserDialog]
    otherwise.
    
    ## Typical usage
    
    In the simplest of cases, you can the following code to use
    [gtk.file_chooser_dialog.FileChooserDialog] to select a file for opening:
    
    ```c
    static void
    on_open_response (GtkDialog *dialog,
                      int        response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
    
          g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
    
          open_file (file);
        }
    
      gtk_window_destroy (GTK_WINDOW (dialog));
    }
    
      // ...
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
    
      gtk_window_present (GTK_WINDOW (dialog));
    
      g_signal_connect (dialog, "response",
                        G_CALLBACK (on_open_response),
                        NULL);
    ```
    
    To use a dialog for saving, you can use this:
    
    ```c
    static void
    on_save_response (GtkDialog *dialog,
                      int        response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
    
          g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
    
          save_to_file (file);
        }
    
      gtk_window_destroy (GTK_WINDOW (dialog));
    }
    
      // ...
      GtkWidget *dialog;
      GtkFileChooser *chooser;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    
      dialog = gtk_file_chooser_dialog_new ("Save File",
                                            parent_window,
                                            action,
                                            _("_Cancel"),
                                            GTK_RESPONSE_CANCEL,
                                            _("_Save"),
                                            GTK_RESPONSE_ACCEPT,
                                            NULL);
      chooser = GTK_FILE_CHOOSER (dialog);
    
      if (user_edited_a_new_document)
        gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
      else
        gtk_file_chooser_set_file (chooser, existing_filename);
    
      gtk_window_present (GTK_WINDOW (dialog));
    
      g_signal_connect (dialog, "response",
                        G_CALLBACK (on_save_response),
                        NULL);
    ```
    
    ## Setting up a file chooser dialog
    
    There are various cases in which you may need to use a [gtk.file_chooser_dialog.FileChooserDialog]:
    
    $(LIST
      * To select a file for opening, use [gtk.types.FileChooserAction.Open].
      
      * To save a file for the first time, use [gtk.types.FileChooserAction.Save],
        and suggest a name such as “Untitled” with
        [gtk.file_chooser.FileChooser.setCurrentName].
      
      * To save a file under a different name, use [gtk.types.FileChooserAction.Save],
        and set the existing file with [gtk.file_chooser.FileChooser.setFile].
      
      * To choose a folder instead of a filem use [gtk.types.FileChooserAction.SelectFolder].
    )
      
    In general, you should only cause the file chooser to show a specific
    folder when it is appropriate to use [gtk.file_chooser.FileChooser.setFile],
    i.e. when you are doing a “Save As” command and you already have a file
    saved somewhere.
    
    ## Response Codes
    
    [gtk.file_chooser_dialog.FileChooserDialog] inherits from [gtk.dialog.Dialog], so buttons that
    go in its action area have response codes such as [gtk.types.ResponseType.Accept] and
    [gtk.types.ResponseType.Cancel]. For example, you could call
    [gtk.file_chooser_dialog.FileChooserDialog.new_] as follows:
    
    ```c
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
    
    This will create buttons for “Cancel” and “Open” that use predefined
    response identifiers from [gtk.types.ResponseType].  For most dialog
    boxes you can use your own custom response codes rather than the
    ones in [gtk.types.ResponseType], but [gtk.file_chooser_dialog.FileChooserDialog] assumes that
    its “accept”-type action, e.g. an “Open” or “Save” button,
    will have one of the following response codes:
    
    $(LIST
      * [gtk.types.ResponseType.Accept]
      * [gtk.types.ResponseType.Ok]
      * [gtk.types.ResponseType.Yes]
      * [gtk.types.ResponseType.Apply]
    )
      
    This is because [gtk.file_chooser_dialog.FileChooserDialog] must intercept responses and switch
    to folders if appropriate, rather than letting the dialog terminate — the
    implementation uses these known response codes to know which responses can
    be blocked if appropriate.
    
    To summarize, make sure you use a predefined response code
    when you use [gtk.file_chooser_dialog.FileChooserDialog] to ensure proper operation.
    
    ## CSS nodes
    
    [gtk.file_chooser_dialog.FileChooserDialog] has a single CSS node with the name `window` and style
    class `.filechooser`.

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
struct GtkFileChooserDialog;

/**
    [gtk.file_chooser_native.FileChooserNative] is an abstraction of a dialog suitable
    for use with “File Open” or “File Save as” commands.
    
    By default, this just uses a [gtk.file_chooser_dialog.FileChooserDialog] to implement
    the actual dialog. However, on some platforms, such as Windows and
    macOS, the native platform file chooser is used instead. When the
    application is running in a sandboxed environment without direct
    filesystem access (such as Flatpak), [gtk.file_chooser_native.FileChooserNative] may call
    the proper APIs (portals) to let the user choose a file and make it
    available to the application.
    
    While the API of [gtk.file_chooser_native.FileChooserNative] closely mirrors [gtk.file_chooser_dialog.FileChooserDialog],
    the main difference is that there is no access to any [gtk.window.Window] or [gtk.widget.Widget]
    for the dialog. This is required, as there may not be one in the case of a
    platform native dialog.
    
    Showing, hiding and running the dialog is handled by the
    [gtk.native_dialog.NativeDialog] functions.
    
    Note that unlike [gtk.file_chooser_dialog.FileChooserDialog], [gtk.file_chooser_native.FileChooserNative] objects
    are not toplevel widgets, and GTK does not keep them alive. It is your
    responsibility to keep a reference until you are done with the
    object.
    
    ## Typical usage
    
    In the simplest of cases, you can the following code to use
    [gtk.file_chooser_native.FileChooserNative] to select a file for opening:
    
    ```c
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);
    
          open_file (file);
    
          g_object_unref (file);
        }
    
      g_object_unref (native);
    }
    
      // ...
      GtkFileChooserNative *native;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
    
      native = gtk_file_chooser_native_new ("Open File",
                                            parent_window,
                                            action,
                                            "_Open",
                                            "_Cancel");
    
      g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ```
    
    To use a [gtk.file_chooser_native.FileChooserNative] for saving, you can use this:
    
    ```c
    static void
    on_response (GtkNativeDialog *native,
                 int              response)
    {
      if (response == GTK_RESPONSE_ACCEPT)
        {
          GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
          GFile *file = gtk_file_chooser_get_file (chooser);
    
          save_to_file (file);
    
          g_object_unref (file);
        }
    
      g_object_unref (native);
    }
    
      // ...
      GtkFileChooserNative *native;
      GtkFileChooser *chooser;
      GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
    
      native = gtk_file_chooser_native_new ("Save File",
                                            parent_window,
                                            action,
                                            "_Save",
                                            "_Cancel");
      chooser = GTK_FILE_CHOOSER (native);
    
      if (user_edited_a_new_document)
        gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
      else
        gtk_file_chooser_set_file (chooser, existing_file, NULL);
    
      g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
      gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
    ```
    
    For more information on how to best set up a file dialog,
    see the [gtk.file_chooser_dialog.FileChooserDialog] documentation.
    
    ## Response Codes
    
    [gtk.file_chooser_native.FileChooserNative] inherits from [gtk.native_dialog.NativeDialog],
    which means it will return [gtk.types.ResponseType.Accept] if the user accepted,
    and [gtk.types.ResponseType.Cancel] if he pressed cancel. It can also return
    [gtk.types.ResponseType.DeleteEvent] if the window was unexpectedly closed.
    
    ## Differences from [gtk.file_chooser_dialog.FileChooserDialog]
    
    There are a few things in the [gtk.file_chooser.FileChooser] interface that
    are not possible to use with [gtk.file_chooser_native.FileChooserNative], as such use would
    prohibit the use of a native dialog.
    
    No operations that change the dialog work while the dialog is visible.
    Set all the properties that are required before showing the dialog.
    
    ## Win32 details
    
    On windows the `IFileDialog` implementation (added in Windows Vista) is
    used. It supports many of the features that [gtk.file_chooser.FileChooser] has, but
    there are some things it does not handle:
    
    $(LIST
      * Any [gtk.file_filter.FileFilter] added using a mimetype
    )
      
    If any of these features are used the regular [gtk.file_chooser_dialog.FileChooserDialog]
    will be used in place of the native one.
    
    ## Portal details
    
    When the `org.freedesktop.portal.FileChooser` portal is available on
    the session bus, it is used to bring up an out-of-process file chooser.
    Depending on the kind of session the application is running in, this may
    or may not be a GTK file chooser.
    
    ## macOS details
    
    On macOS the `NSSavePanel` and `NSOpenPanel` classes are used to provide
    native file chooser dialogs. Some features provided by [gtk.file_chooser.FileChooser]
    are not supported:
    
    $(LIST
      * Shortcut folders.
    )

    Deprecated: Use [gtk.file_dialog.FileDialog] instead
*/
struct GtkFileChooserNative;

/** */
struct GtkFileChooserNativeClass
{
  /** */
  GtkNativeDialogClass parentClass;
}

/**
    [gtk.file_chooser_widget.FileChooserWidget] is a widget for choosing files.
    
    It exposes the [gtk.file_chooser.FileChooser] interface, and you should
    use the methods of this interface to interact with the
    widget.
    
    # CSS nodes
    
    [gtk.file_chooser_widget.FileChooserWidget] has a single CSS node with name filechooser.

    Deprecated: Direct use of [gtk.file_chooser_widget.FileChooserWidget] is deprecated
*/
struct GtkFileChooserWidget;

/**
    A [gtk.file_dialog.FileDialog] object collects the arguments that
    are needed to present a file chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with [gtk.file_dialog.FileDialog.open],
    [gtk.file_dialog.FileDialog.save], etc. These APIs follow the
    GIO async pattern, and the result can be obtained by calling
    the corresponding finish function, for example
    [gtk.file_dialog.FileDialog.openFinish].
*/
struct GtkFileDialog;

/** */
struct GtkFileDialogClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.file_filter.FileFilter] filters files by name or mime type.
    
    [gtk.file_filter.FileFilter] can be used to restrict the files being shown in a
    [gtk.file_chooser.FileChooser]. Files can be filtered based on their name (with
    [gtk.file_filter.FileFilter.addPattern] or [gtk.file_filter.FileFilter.addSuffix])
    or on their mime type (with [gtk.file_filter.FileFilter.addMimeType]).
    
    Filtering by mime types handles aliasing and subclassing of mime
    types; e.g. a filter for text/plain also matches a file with mime
    type application/rtf, since application/rtf is a subclass of
    text/plain. Note that [gtk.file_filter.FileFilter] allows wildcards for the
    subtype of a mime type, so you can e.g. filter for image/\*.
    
    Normally, file filters are used by adding them to a [gtk.file_chooser.FileChooser]
    (see [gtk.file_chooser.FileChooser.addFilter]), but it is also possible to
    manually use a file filter on any [gtk.filter_list_model.FilterListModel] containing
    [gio.file_info.FileInfo] objects.
    
    # GtkFileFilter as GtkBuildable
    
    The [gtk.file_filter.FileFilter] implementation of the [gtk.buildable.Buildable] interface
    supports adding rules using the `<mime-types>` and `<patterns>` and
    `<suffixes>` elements and listing the rules within. Specifying a
    `<mime-type>` or `<pattern>` or `<suffix>` has the same effect as
    as calling
    [gtk.file_filter.FileFilter.addMimeType] or
    [gtk.file_filter.FileFilter.addPattern] or
    [gtk.file_filter.FileFilter.addSuffix].
    
    An example of a UI definition fragment specifying [gtk.file_filter.FileFilter]
    rules:
    ```xml
    <object class="GtkFileFilter">
      <property name="name" translatable="yes">Text and Images</property>
      <mime-types>
        <mime-type>text/plain</mime-type>
        <mime-type>image/ *</mime-type>
      </mime-types>
      <patterns>
        <pattern>*.txt</pattern>
      </patterns>
      <suffixes>
        <suffix>png</suffix>
      </suffixes>
    </object>
    ```
*/
struct GtkFileFilter;

/**
    A [gtk.file_launcher.FileLauncher] object collects the arguments that are needed to open a
    file with an application.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gtk.file_launcher.FileLauncher.launch] function.
    This API follows the GIO async pattern, and the result can be obtained by
    calling [gtk.file_launcher.FileLauncher.launchFinish].
    
    To launch uris that don't represent files, use [gtk.uri_launcher.UriLauncher].
*/
struct GtkFileLauncher;

/** */
struct GtkFileLauncherClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.filter.Filter] object describes the filtering to be performed by a
    [gtk.filter_list_model.FilterListModel].
    
    The model will use the filter to determine if it should include items
    or not by calling [gtk.filter.Filter.match] for each item and only
    keeping the ones that the function returns true for.
    
    Filters may change what items they match through their lifetime. In that
    case, they will emit the [gtk.filter.Filter.changed] signal to notify
    that previous filter results are no longer valid and that items should
    be checked again via [gtk.filter.Filter.match].
    
    GTK provides various pre-made filter implementations for common filtering
    operations. These filters often include properties that can be linked to
    various widgets to easily allow searches.
    
    However, in particular for large lists or complex search methods, it is
    also possible to subclass [gtk.filter.Filter] and provide one's own filter.
*/
struct GtkFilter
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkFilterClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GtkFilter* self, GObject* item) match;

  /** */
  extern(C) GtkFilterMatch function(GtkFilter* self) getStrictness;

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
    [gtk.filter_list_model.FilterListModel] is a list model that filters the elements of
    the underlying model according to a [gtk.filter.Filter].
    
    It hides some elements from the other model according to
    criteria given by a [gtk.filter.Filter].
    
    The model can be set up to do incremental filtering, so that
    filtering long lists doesn't block the UI. See
    [gtk.filter_list_model.FilterListModel.setIncremental] for details.
    
    [gtk.filter_list_model.FilterListModel] passes through sections from the underlying model.
*/
struct GtkFilterListModel;

/** */
struct GtkFilterListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.fixed.Fixed] places its child widgets at fixed positions and with fixed sizes.
    
    [gtk.fixed.Fixed] performs no automatic layout management.
    
    For most applications, you should not use this container! It keeps
    you from having to learn about the other GTK containers, but it
    results in broken applications.  With [gtk.fixed.Fixed], the following
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
      
    In addition, [gtk.fixed.Fixed] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately for the text direction, e.g. to put labels to
    the right of the thing they label when using an RTL language, but it can’t
    do that with [gtk.fixed.Fixed]. So if you need to reorder widgets depending on
    the text direction, you would need to manually detect it and adjust child
    positions accordingly.
    
    Finally, fixed positioning makes it kind of annoying to add/remove
    UI elements, since you have to reposition all the other elements. This
    is a long-term maintenance problem for your application.
    
    If you know none of these things are an issue for your application,
    and prefer the simplicity of [gtk.fixed.Fixed], by all means use the
    widget. But you should be aware of the tradeoffs.
*/
struct GtkFixed
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkFixedClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  void*[8] padding;
}

/**
    [gtk.fixed_layout.FixedLayout] is a layout manager which can place child widgets
    at fixed positions.
    
    Most applications should never use this layout manager; fixed positioning
    and sizing requires constant recalculations on where children need to be
    positioned and sized. Other layout managers perform this kind of work
    internally so that application developers don't need to do it. Specifically,
    widgets positioned in a fixed layout manager will need to take into account:
    
    $(LIST
      * Themes, which may change widget sizes.
      
      * Fonts other than the one you used to write the app will of course
        change the size of widgets containing text; keep in mind that
        users may use a larger font because of difficulty reading the
        default, or they may be using a different OS that provides different
        fonts.
      
      * Translation of text into other languages changes its size. Also,
        display of non-English text will use a different font in many
        cases.
    )
      
    In addition, [gtk.fixed_layout.FixedLayout] does not pay attention to text direction and
    thus may produce unwanted results if your app is run under right-to-left
    languages such as Hebrew or Arabic. That is: normally GTK will order
    containers appropriately depending on the text direction, e.g. to put labels
    to the right of the thing they label when using an RTL language;
    [gtk.fixed_layout.FixedLayout] won't be able to do that for you.
    
    Finally, fixed positioning makes it kind of annoying to add/remove UI
    elements, since you have to reposition all the other  elements. This is a
    long-term maintenance problem for your application.
*/
struct GtkFixedLayout;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.fixed_layout.FixedLayout].
*/
struct GtkFixedLayoutChild;

/** */
struct GtkFixedLayoutChildClass
{
  /** */
  GtkLayoutChildClass parentClass;
}

/** */
struct GtkFixedLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    [gtk.flatten_list_model.FlattenListModel] is a list model that concatenates other list models.
    
    [gtk.flatten_list_model.FlattenListModel] takes a list model containing list models, and flattens
    it into a single model. Each list model becomes a section in the single model.
*/
struct GtkFlattenListModel;

/** */
struct GtkFlattenListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.flow_box.FlowBox] puts child widgets in reflowing grid.
    
    For instance, with the horizontal orientation, the widgets will be
    arranged from left to right, starting a new row under the previous
    row when necessary. Reducing the width in this case will require more
    rows, so a larger height will be requested.
    
    Likewise, with the vertical orientation, the widgets will be arranged
    from top to bottom, starting a new column to the right when necessary.
    Reducing the height will require more columns, so a larger width will
    be requested.
    
    The size request of a [gtk.flow_box.FlowBox] alone may not be what you expect;
    if you need to be able to shrink it along both axes and dynamically
    reflow its children, you may have to wrap it in a [gtk.scrolled_window.ScrolledWindow]
    to enable that.
    
    The children of a [gtk.flow_box.FlowBox] can be dynamically sorted and filtered.
    
    Although a [gtk.flow_box.FlowBox] must have only [gtk.flow_box_child.FlowBoxChild] children, you
    can add any kind of widget to it via [gtk.flow_box.FlowBox.insert], and a
    [gtk.flow_box_child.FlowBoxChild] widget will automatically be inserted between the box
    and the widget.
    
    Also see [gtk.list_box.ListBox].
    
    # CSS nodes
    
    ```
    flowbox
    ├── flowboxchild
    │   ╰── <child>
    ├── flowboxchild
    │   ╰── <child>
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.flow_box.FlowBox] uses a single CSS node with name flowbox. [gtk.flow_box_child.FlowBoxChild]
    uses a single CSS node with name flowboxchild. For rubberband selection,
    a subnode with name rubberband is used.
    
    # Accessibility
    
    [gtk.flow_box.FlowBox] uses the [gtk.types.AccessibleRole.Grid] role, and [gtk.flow_box_child.FlowBoxChild]
    uses the [gtk.types.AccessibleRole.GridCell] role.
*/
struct GtkFlowBox;

/**
    [gtk.flow_box_child.FlowBoxChild] is the kind of widget that can be added to a [gtk.flow_box.FlowBox].
*/
struct GtkFlowBoxChild
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkFlowBoxChildClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkFlowBoxChild* child) activate;

  /** */
  void*[8] padding;
}

/**
    The [gtk.font_button.FontButton] allows to open a font chooser dialog to change
    the font.
    
    ![An example GtkFontButton](font-button.png)
    
    It is suitable widget for selecting a font in a preference dialog.
    
    # CSS nodes
    
    ```
    fontbutton
    ╰── button.font
        ╰── [content]
    ```
    
    [gtk.font_button.FontButton] has a single CSS node with name fontbutton which
    contains a button node with the .font style class.

    Deprecated: Use [gtk.font_dialog_button.FontDialogButton] instead
*/
struct GtkFontButton;

/**
    [gtk.font_chooser.FontChooser] is an interface that can be implemented by widgets
    for choosing fonts.
    
    In GTK, the main objects that implement this interface are
    [gtk.font_chooser_widget.FontChooserWidget], [gtk.font_chooser_dialog.FontChooserDialog] and
    [gtk.font_button.FontButton].

    Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
      instead
*/
struct GtkFontChooser;

/**
    The [gtk.font_chooser_dialog.FontChooserDialog] widget is a dialog for selecting a font.
    
    ![An example GtkFontChooserDialog](fontchooser.png)
    
    [gtk.font_chooser_dialog.FontChooserDialog] implements the [gtk.font_chooser.FontChooser] interface
    and does not provide much API of its own.
    
    To create a [gtk.font_chooser_dialog.FontChooserDialog], use [gtk.font_chooser_dialog.FontChooserDialog.new_].
    
    # GtkFontChooserDialog as GtkBuildable
    
    The [gtk.font_chooser_dialog.FontChooserDialog] implementation of the [gtk.buildable.Buildable]
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
    
    ## CSS nodes
    
    [gtk.font_chooser_dialog.FontChooserDialog] has a single CSS node with the name `window` and style
    class `.fontchooser`.

    Deprecated: Use [gtk.font_dialog.FontDialog] instead
*/
struct GtkFontChooserDialog;

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
    The [gtk.font_chooser_widget.FontChooserWidget] widget lets the user select a font.
    
    It is used in the [gtk.font_chooser_dialog.FontChooserDialog] widget to provide a
    dialog for selecting fonts.
    
    To set the font which is initially selected, use
    [gtk.font_chooser.FontChooser.setFont] or [gtk.font_chooser.FontChooser.setFontDesc].
    
    To get the selected font use [gtk.font_chooser.FontChooser.getFont] or
    [gtk.font_chooser.FontChooser.getFontDesc].
    
    To change the text which is shown in the preview area, use
    [gtk.font_chooser.FontChooser.setPreviewText].
    
    # CSS nodes
    
    [gtk.font_chooser_widget.FontChooserWidget] has a single CSS node with name fontchooser.

    Deprecated: Direct use of [gtk.font_chooser_widget.FontChooserWidget] is deprecated.
*/
struct GtkFontChooserWidget;

/**
    A [gtk.font_dialog.FontDialog] object collects the arguments that
    are needed to present a font chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with the [gtk.font_dialog.FontDialog.chooseFont]
    function or its variants. This API follows the GIO async pattern,
    and the result can be obtained by calling the corresponding
    finish function, such as [gtk.font_dialog.FontDialog.chooseFontFinish].
    
    See [gtk.font_dialog_button.FontDialogButton] for a convenient control
    that uses [gtk.font_dialog.FontDialog] and presents the results.
*/
struct GtkFontDialog;

/**
    The [gtk.font_dialog_button.FontDialogButton] is wrapped around a [gtk.font_dialog.FontDialog]
    and allows to open a font chooser dialog to change the font.
    
    ![An example GtkFontDialogButton](font-button.png)
    
    It is suitable widget for selecting a font in a preference dialog.
    
    # CSS nodes
    
    ```
    fontbutton
    ╰── button.font
        ╰── [content]
    ```
    
    [gtk.font_dialog_button.FontDialogButton] has a single CSS node with name fontbutton which
    contains a button node with the .font style class.
*/
struct GtkFontDialogButton;

/** */
struct GtkFontDialogButtonClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct GtkFontDialogClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.frame.Frame] is a widget that surrounds its child with a decorative
    frame and an optional label.
    
    ![An example GtkFrame](frame.png)
    
    If present, the label is drawn inside the top edge of the frame.
    The horizontal position of the label can be controlled with
    [gtk.frame.Frame.setLabelAlign].
    
    [gtk.frame.Frame] clips its child. You can use this to add rounded corners
    to widgets, but be aware that it also cuts off shadows.
    
    # GtkFrame as GtkBuildable
    
    The [gtk.frame.Frame] implementation of the [gtk.buildable.Buildable] interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can
    be specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with GtkFrame:
    ```xml
    <object class="GtkFrame">
      <child type="label">
        <object class="GtkLabel" id="frame_label"/>
      </child>
      <child>
        <object class="GtkEntry" id="frame_content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```
    frame
    ├── <label widget>
    ╰── <child>
    ```
    
    [gtk.frame.Frame] has a main CSS node with name “frame”, which is used to draw the
    visible border. You can set the appearance of the border using CSS properties
    like “border-style” on this node.
    
    # Accessibility
    
    [gtk.frame.Frame] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct GtkFrame
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkFrameClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkFrame* frame, GtkAllocation* allocation) computeChildAllocation;

  /** */
  void*[8] padding;
}

/**
    [gtk.glarea.GLArea] is a widget that allows drawing with OpenGL.
    
    ![An example GtkGLArea](glarea.png)
    
    [gtk.glarea.GLArea] sets up its own [gdk.glcontext.GLContext], and creates a custom
    GL framebuffer that the widget will do GL rendering onto. It also ensures
    that this framebuffer is the default GL rendering target when rendering.
    The completed rendering is integrated into the larger GTK scene graph as
    a texture.
    
    In order to draw, you have to connect to the [gtk.glarea.GLArea.render]
    signal, or subclass [gtk.glarea.GLArea] and override the GtkGLAreaClass.render
    virtual function.
    
    The [gtk.glarea.GLArea] widget ensures that the [gdk.glcontext.GLContext] is associated with
    the widget's drawing area, and it is kept updated when the size and
    position of the drawing area changes.
    
    ## Drawing with GtkGLArea
    
    The simplest way to draw using OpenGL commands in a [gtk.glarea.GLArea] is to
    create a widget instance and connect to the [gtk.glarea.GLArea.render] signal:
    
    The `render()` function will be called when the [gtk.glarea.GLArea] is ready
    for you to draw its content:
    
    The initial contents of the framebuffer are transparent.
    
    ```c
    static gboolean
    render (GtkGLArea *area, GdkGLContext *context)
    {
      // inside this function it's safe to use GL; the given
      // GdkGLContext has been made current to the drawable
      // surface used by the `GtkGLArea` and the viewport has
      // already been set to be the size of the allocation
    
      // we can start by clearing the buffer
      glClearColor (0, 0, 0, 0);
      glClear (GL_COLOR_BUFFER_BIT);
    
      // draw your object
      // draw_an_object ();
    
      // we completed our drawing; the draw commands will be
      // flushed at the end of the signal emission chain, and
      // the buffers will be drawn on the window
      return TRUE;
    }
    
    void setup_glarea (void)
    {
      // create a GtkGLArea instance
      GtkWidget *gl_area = gtk_gl_area_new ();
    
      // connect to the "render" signal
      g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
    }
    ```
    
    If you need to initialize OpenGL state, e.g. buffer objects or
    shaders, you should use the [gtk.widget.Widget.realize] signal;
    you can use the [gtk.widget.Widget.unrealize] signal to clean up.
    Since the [gdk.glcontext.GLContext] creation and initialization may fail, you
    will need to check for errors, using [gtk.glarea.GLArea.getError].
    
    An example of how to safely initialize the GL state is:
    
    ```c
    static void
    on_realize (GtkGLarea *area)
    {
      // We need to make the context current if we want to
      // call GL API
      gtk_gl_area_make_current (area);
    
      // If there were errors during the initialization or
      // when trying to make the context current, this
      // function will return a GError for you to catch
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
    
    If you need to change the options for creating the [gdk.glcontext.GLContext]
    you should use the `signal@Gtk.GLArea::create-context` signal.
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
      class closure for the `GtkGLArea::render` signal
  */
  extern(C) gboolean function(GtkGLArea* area, GdkGLContext* context) render;

  /**
      class closeure for the `GtkGLArea::resize` signal
  */
  extern(C) void function(GtkGLArea* area, int width, int height) resize;

  /**
      class closure for the `GtkGLArea::create-context` signal
  */
  extern(C) GdkGLContext* function(GtkGLArea* area) createContext;

  /** */
  void*[8] Padding;
}

/**
    [gtk.gesture.Gesture] is the base class for gesture recognition.
    
    Although [gtk.gesture.Gesture] is quite generalized to serve as a base for
    multi-touch gestures, it is suitable to implement single-touch and
    pointer-based gestures (using the special null [gdk.event_sequence.EventSequence]
    value for these).
    
    The number of touches that a [gtk.gesture.Gesture] need to be recognized is
    controlled by the `property@Gtk.Gesture:n-points` property, if a
    gesture is keeping track of less or more than that number of sequences,
    it won't check whether the gesture is recognized.
    
    As soon as the gesture has the expected number of touches, it will check
    regularly if it is recognized, the criteria to consider a gesture as
    "recognized" is left to [gtk.gesture.Gesture] subclasses.
    
    A recognized gesture will then emit the following signals:
    
    $(LIST
      * [gtk.gesture.Gesture.begin] when the gesture is recognized.
      * [gtk.gesture.Gesture.update], whenever an input event is processed.
      * [gtk.gesture.Gesture.end] when the gesture is no longer recognized.
    )
      
    ## Event propagation
    
    In order to receive events, a gesture needs to set a propagation phase
    through [gtk.event_controller.EventController.setPropagationPhase].
    
    In the capture phase, events are propagated from the toplevel down
    to the target widget, and gestures that are attached to containers
    above the widget get a chance to interact with the event before it
    reaches the target.
    
    In the bubble phase, events are propagated up from the target widget
    to the toplevel, and gestures that are attached to containers above
    the widget get a chance to interact with events that have not been
    handled yet.
    
    ## States of a sequence
    
    Whenever input interaction happens, a single event may trigger a cascade
    of [gtk.gesture.Gesture]s, both across the parents of the widget receiving the
    event and in parallel within an individual widget. It is a responsibility
    of the widgets using those gestures to set the state of touch sequences
    accordingly in order to enable cooperation of gestures around the
    [gdk.event_sequence.EventSequence]s triggering those.
    
    Within a widget, gestures can be grouped through [gtk.gesture.Gesture.group].
    Grouped gestures synchronize the state of sequences, so calling
    [gtk.gesture.Gesture.setState] on one will effectively propagate
    the state throughout the group.
    
    By default, all sequences start out in the [gtk.types.EventSequenceState.None] state,
    sequences in this state trigger the gesture event handler, but event
    propagation will continue unstopped by gestures.
    
    If a sequence enters into the [gtk.types.EventSequenceState.Denied] state, the gesture
    group will effectively ignore the sequence, letting events go unstopped
    through the gesture, but the "slot" will still remain occupied while
    the touch is active.
    
    If a sequence enters in the [gtk.types.EventSequenceState.Claimed] state, the gesture
    group will grab all interaction on the sequence, by:
    
    $(LIST
      * Setting the same sequence to [gtk.types.EventSequenceState.Denied] on every other
        gesture group within the widget, and every gesture on parent widgets
        in the propagation chain.
      * Emitting [gtk.gesture.Gesture.cancel] on every gesture in widgets
        underneath in the propagation chain.
      * Stopping event propagation after the gesture group handles the event.
    )
      
    Note: if a sequence is set early to [gtk.types.EventSequenceState.Claimed] on
    [gdk.types.EventType.TouchBegin]/[gdk.types.EventType.ButtonPress] (so those events are captured before
    reaching the event widget, this implies [gtk.types.PropagationPhase.Capture]), one similar
    event will be emulated if the sequence changes to [gtk.types.EventSequenceState.Denied].
    This way event coherence is preserved before event propagation is unstopped
    again.
    
    Sequence states can't be changed freely.
    See [gtk.gesture.Gesture.setState] to know about the possible
    lifetimes of a [gdk.event_sequence.EventSequence].
    
    ## Touchpad gestures
    
    On the platforms that support it, [gtk.gesture.Gesture] will handle transparently
    touchpad gesture events. The only precautions users of [gtk.gesture.Gesture] should
    do to enable this support are:
    
    $(LIST
      * If the gesture has [gtk.types.PropagationPhase.None], ensuring events of type
        [gdk.types.EventType.TouchpadSwipe] and [gdk.types.EventType.TouchpadPinch] are handled by the [gtk.gesture.Gesture]
    )
*/
struct GtkGesture;

/** */
struct GtkGestureClass;

/**
    [gtk.gesture_click.GestureClick] is a [gtk.gesture.Gesture] implementation for clicks.
    
    It is able to recognize multiple clicks on a nearby zone, which
    can be listened for through the [gtk.gesture_click.GestureClick.pressed]
    signal. Whenever time or distance between clicks exceed the GTK
    defaults, [gtk.gesture_click.GestureClick.stopped] is emitted, and the
    click counter is reset.
*/
struct GtkGestureClick;

/** */
struct GtkGestureClickClass;

/**
    [gtk.gesture_drag.GestureDrag] is a [gtk.gesture.Gesture] implementation for drags.
    
    The drag operation itself can be tracked throughout the
    `signal@Gtk.GestureDrag::drag-begin`,
    `signal@Gtk.GestureDrag::drag-update` and
    `signal@Gtk.GestureDrag::drag-end` signals, and the relevant
    coordinates can be extracted through
    [gtk.gesture_drag.GestureDrag.getOffset] and
    [gtk.gesture_drag.GestureDrag.getStartPoint].
*/
struct GtkGestureDrag;

/** */
struct GtkGestureDragClass;

/**
    [gtk.gesture_long_press.GestureLongPress] is a [gtk.gesture.Gesture] for long presses.
    
    This gesture is also known as “Press and Hold”.
    
    When the timeout is exceeded, the gesture is triggering the
    [gtk.gesture_long_press.GestureLongPress.pressed] signal.
    
    If the touchpoint is lifted before the timeout passes, or if
    it drifts too far of the initial press point, the
    [gtk.gesture_long_press.GestureLongPress.cancelled] signal will be emitted.
    
    How long the timeout is before the ::pressed signal gets emitted is
    determined by the `property@Gtk.Settings:gtk-long-press-time` setting.
    It can be modified by the `property@Gtk.GestureLongPress:delay-factor`
    property.
*/
struct GtkGestureLongPress;

/** */
struct GtkGestureLongPressClass;

/**
    [gtk.gesture_pan.GesturePan] is a [gtk.gesture.Gesture] for pan gestures.
    
    These are drags that are locked to happen along one axis. The axis
    that a [gtk.gesture_pan.GesturePan] handles is defined at construct time, and
    can be changed through [gtk.gesture_pan.GesturePan.setOrientation].
    
    When the gesture starts to be recognized, [gtk.gesture_pan.GesturePan] will
    attempt to determine as early as possible whether the sequence
    is moving in the expected direction, and denying the sequence if
    this does not happen.
    
    Once a panning gesture along the expected axis is recognized,
    the [gtk.gesture_pan.GesturePan.pan] signal will be emitted as input
    events are received, containing the offset in the given axis.
*/
struct GtkGesturePan;

/** */
struct GtkGesturePanClass;

/**
    [gtk.gesture_rotate.GestureRotate] is a [gtk.gesture.Gesture] for 2-finger rotations.
    
    Whenever the angle between both handled sequences changes, the
    `signal@Gtk.GestureRotate::angle-changed` signal is emitted.
*/
struct GtkGestureRotate;

/** */
struct GtkGestureRotateClass;

/**
    [gtk.gesture_single.GestureSingle] is a `GtkGestures` subclass optimized for singe-touch
    and mouse gestures.
    
    Under interaction, these gestures stick to the first interacting sequence,
    which is accessible through [gtk.gesture_single.GestureSingle.getCurrentSequence]
    while the gesture is being interacted with.
    
    By default gestures react to both [gdk.types.BUTTON_PRIMARY] and touch events.
    [gtk.gesture_single.GestureSingle.setTouchOnly] can be used to change the
    touch behavior. Callers may also specify a different mouse button number
    to interact with through [gtk.gesture_single.GestureSingle.setButton], or react
    to any mouse button by setting it to 0. While the gesture is active, the
    button being currently pressed can be known through
    [gtk.gesture_single.GestureSingle.getCurrentButton].
*/
struct GtkGestureSingle;

/** */
struct GtkGestureSingleClass;

/**
    [gtk.gesture_stylus.GestureStylus] is a [gtk.gesture.Gesture] specific to stylus input.
    
    The provided signals just relay the basic information of the
    stylus events.
*/
struct GtkGestureStylus;

/** */
struct GtkGestureStylusClass;

/**
    [gtk.gesture_swipe.GestureSwipe] is a [gtk.gesture.Gesture] for swipe gestures.
    
    After a press/move/.../move/release sequence happens, the
    [gtk.gesture_swipe.GestureSwipe.swipe] signal will be emitted,
    providing the velocity and directionality of the sequence
    at the time it was lifted.
    
    If the velocity is desired in intermediate points,
    [gtk.gesture_swipe.GestureSwipe.getVelocity] can be called in a
    [gtk.gesture.Gesture.update] handler.
    
    All velocities are reported in pixels/sec units.
*/
struct GtkGestureSwipe;

/** */
struct GtkGestureSwipeClass;

/**
    [gtk.gesture_zoom.GestureZoom] is a [gtk.gesture.Gesture] for 2-finger pinch/zoom gestures.
    
    Whenever the distance between both tracked sequences changes, the
    `signal@Gtk.GestureZoom::scale-changed` signal is emitted to report
    the scale factor.
*/
struct GtkGestureZoom;

/** */
struct GtkGestureZoomClass;

/**
    A widget that allows to bypass gsk rendering for its child by passing the content
    directly to the compositor.
    
    Graphics offload is an optimization to reduce overhead and battery use that is
    most useful for video content. It only works on some platforms and in certain
    situations. GTK will automatically fall back to normal rendering if it doesn't.
    
    Graphics offload is most efficient if there are no controls drawn on top of the
    video content.
    
    You should consider using graphics offload for your main widget if it shows
    frequently changing content (such as a video, or a VM display) and you provide
    the content in the form of dmabuf textures (see [gdk.dmabuf_texture_builder.DmabufTextureBuilder]),
    in particular if it may be fullscreen.
    
    Numerous factors can prohibit graphics offload:
    
    $(LIST
      * Unsupported platforms. Currently, graphics offload only works on Linux with Wayland.
      
      * Clipping, such as rounded corners that cause the video content to not be rectangular
      
      * Unsupported dmabuf formats (see [gdk.display.Display.getDmabufFormats])
      
      * Translucent video content (content with an alpha channel, even if it isn't used)
      
      * Transforms that are more complex than translations and scales
      
      * Filters such as opacity, grayscale or similar
    )
      
    To investigate problems related graphics offload, GTK offers debug flags to print
    out information about graphics offload and dmabuf use:
    
        GDK_DEBUG=offload
        GDK_DEBUG=dmabuf
    
    The GTK inspector provides a visual debugging tool for graphics offload.
*/
struct GtkGraphicsOffload;

/** */
struct GtkGraphicsOffloadClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.grid.Grid] is a container which arranges its child widgets in
    rows and columns.
    
    ![An example GtkGrid](grid.png)
    
    It supports arbitrary positions and horizontal/vertical spans.
    
    Children are added using [gtk.grid.Grid.attach]. They can span multiple
    rows or columns. It is also possible to add a child next to an existing
    child, using [gtk.grid.Grid.attachNextTo]. To remove a child from the
    grid, use [gtk.grid.Grid.remove].
    
    The behaviour of [gtk.grid.Grid] when several children occupy the same grid
    cell is undefined.
    
    # GtkGrid as GtkBuildable
    
    Every child in a [gtk.grid.Grid] has access to a custom [gtk.buildable.Buildable]
    element, called `<layout>`. It can by used to specify a position in the
    grid and optionally spans. All properties that can be used in the `<layout>`
    element are implemented by [gtk.grid_layout_child.GridLayoutChild].
    
    It is implemented by [gtk.widget.Widget] using [gtk.layout_manager.LayoutManager].
    
    To showcase it, here is a simple example:
    
    ```xml
    <object class="GtkGrid" id="my_grid">
      <child>
        <object class="GtkButton" id="button1">
          <property name="label">Button 1</property>
          <layout>
            <property name="column">0</property>
            <property name="row">0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button2">
          <property name="label">Button 2</property>
          <layout>
            <property name="column">1</property>
            <property name="row">0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button3">
          <property name="label">Button 3</property>
          <layout>
            <property name="column">2</property>
            <property name="row">0</property>
            <property name="row-span">2</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkButton" id="button4">
          <property name="label">Button 4</property>
          <layout>
            <property name="column">0</property>
            <property name="row">1</property>
            <property name="column-span">2</property>
          </layout>
        </object>
      </child>
    </object>
    ```
    
    It organizes the first two buttons side-by-side in one cell each.
    The third button is in the last column but spans across two rows.
    This is defined by the `row-span` property. The last button is
    located in the second row and spans across two columns, which is
    defined by the `column-span` property.
    
    # CSS nodes
    
    [gtk.grid.Grid] uses a single CSS node with name `grid`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.grid.Grid] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.grid.Grid] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkGrid
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkGridClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /** */
  void*[8] padding;
}

/**
    [gtk.grid_layout.GridLayout] is a layout manager which arranges child widgets in
    rows and columns.
    
    Children have an "attach point" defined by the horizontal and vertical
    index of the cell they occupy; children can span multiple rows or columns.
    The layout properties for setting the attach points and spans are set
    using the [gtk.grid_layout_child.GridLayoutChild] associated to each child widget.
    
    The behaviour of [gtk.grid_layout.GridLayout] when several children occupy the same
    grid cell is undefined.
    
    [gtk.grid_layout.GridLayout] can be used like a [gtk.box_layout.BoxLayout] if all children are
    attached to the same row or column; however, if you only ever need a
    single row or column, you should consider using [gtk.box_layout.BoxLayout].
*/
struct GtkGridLayout;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.grid_layout.GridLayout].
*/
struct GtkGridLayoutChild;

/** */
struct GtkGridLayoutChildClass
{
  /** */
  GtkLayoutChildClass parentClass;
}

/** */
struct GtkGridLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

/**
    [gtk.grid_view.GridView] presents a large dynamic grid of items.
    
    [gtk.grid_view.GridView] uses its factory to generate one child widget for each
    visible item and shows them in a grid. The orientation of the grid view
    determines if the grid reflows vertically or horizontally.
    
    [gtk.grid_view.GridView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    `property@Gtk.GridView:enable-rubberband`.
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    # CSS nodes
    
    ```
    gridview
    ├── child[.activatable]
    │
    ├── child[.activatable]
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.grid_view.GridView] uses a single CSS node with name `gridview`. Each child uses
    a single CSS node with name `child`. If the [gtk.list_item.ListItem.activatable]
    property is set, the corresponding row will have the `.activatable` style
    class. For rubberband selection, a subnode with name `rubberband` is used.
    
    # Accessibility
    
    [gtk.grid_view.GridView] uses the [gtk.types.AccessibleRole.Grid] role, and the items
    use the [gtk.types.AccessibleRole.GridCell] role.
*/
struct GtkGridView;

/** */
struct GtkGridViewClass;

/**
    [gtk.header_bar.HeaderBar] is a widget for creating custom title bars for windows.
    
    ![An example GtkHeaderBar](headerbar.png)
    
    [gtk.header_bar.HeaderBar] is similar to a horizontal [gtk.center_box.CenterBox]. It allows
    children to be placed at the start or the end. In addition, it allows
    the window title to be displayed. The title will be centered with respect
    to the width of the box, even if the children at either side take up
    different amounts of space.
    
    [gtk.header_bar.HeaderBar] can add typical window frame controls, such as minimize,
    maximize and close buttons, or the window icon.
    
    For these reasons, [gtk.header_bar.HeaderBar] is the natural choice for use as the
    custom titlebar widget of a [gtk.window.Window] (see [gtk.window.Window.setTitlebar]),
    as it gives features typical of titlebars while allowing the addition of
    child widgets.
    
    ## GtkHeaderBar as GtkBuildable
    
    The [gtk.header_bar.HeaderBar] implementation of the [gtk.buildable.Buildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a `<child>` element, or setting the title widget by
    specifying “title” value.
    
    By default the [gtk.header_bar.HeaderBar] uses a [gtk.label.Label] displaying the title of the
    window it is contained in as the title widget, equivalent to the following
    UI definition:
    
    ```xml
    <object class="GtkHeaderBar">
      <property name="title-widget">
        <object class="GtkLabel">
          <property name="label" translatable="yes">Label</property>
          <property name="single-line-mode">True</property>
          <property name="ellipsize">end</property>
          <property name="width-chars">5</property>
          <style>
            <class name="title"/>
          </style>
        </object>
      </property>
    </object>
    ```
    
    # CSS nodes
    
    ```
    headerbar
    ╰── windowhandle
        ╰── box
            ├── box.start
            │   ├── windowcontrols.start
            │   ╰── [other children]
            ├── [Title Widget]
            ╰── box.end
                ├── [other children]
                ╰── windowcontrols.end
    ```
    
    A [gtk.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains two `box` subnodes at
    the start and end of the header bar, as well as a center node that represents
    the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gtk.window_controls.WindowControls] for details, as well as other children.
    
    # Accessibility
    
    [gtk.header_bar.HeaderBar] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct GtkHeaderBar;

/**
    [gtk.imcontext.IMContext] defines the interface for GTK input methods.
    
    [gtk.imcontext.IMContext] is used by GTK text input widgets like [gtk.text.Text]
    to map from key events to Unicode character strings.
    
    An input method may consume multiple key events in sequence before finally
    outputting the composed result. This is called *preediting*, and an input
    method may provide feedback about this process by displaying the intermediate
    composition states as preedit text. To do so, the [gtk.imcontext.IMContext] will emit
    `signal@Gtk.IMContext::preedit-start`, `signal@Gtk.IMContext::preedit-changed`
    and `signal@Gtk.IMContext::preedit-end` signals.
    
    For instance, the built-in GTK input method [gtk.imcontext_simple.IMContextSimple]
    implements the input of arbitrary Unicode code points by holding down the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>
    followed by the hexadecimal digits of the code point. When releasing the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the
    character is inserted as text. For example,
    
        Ctrl+Shift+u 2 0 A C
    
    results in the € sign.
    
    Additional input methods can be made available for use by GTK widgets as
    loadable modules. An input method module is a small shared library which
    provides a [gio.ioextension.IOExtension] for the extension point named "gtk-im-module".
    
    To connect a widget to the users preferred input method, you should use
    [gtk.immulticontext.IMMulticontext].
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
      Default handler of the `signal@Gtk.IMContext::preedit-start` signal.
  */
  extern(C) void function(GtkIMContext* context) preeditStart;

  /**
      Default handler of the `signal@Gtk.IMContext::preedit-end` signal.
  */
  extern(C) void function(GtkIMContext* context) preeditEnd;

  /**
      Default handler of the `signal@Gtk.IMContext::preedit-changed`
        signal.
  */
  extern(C) void function(GtkIMContext* context) preeditChanged;

  /**
      Default handler of the [gtk.imcontext.IMContext.commit] signal.
  */
  extern(C) void function(GtkIMContext* context, const(char)* str) commit;

  /**
      Default handler of the
        `signal@Gtk.IMContext::retrieve-surrounding` signal.
  */
  extern(C) gboolean function(GtkIMContext* context) retrieveSurrounding;

  /**
      Default handler of the
        `signal@Gtk.IMContext::delete-surrounding` signal.
  */
  extern(C) gboolean function(GtkIMContext* context, int offset, int nChars) deleteSurrounding;

  /**
      Called via [gtk.imcontext.IMContext.setClientWidget] when
        the input window where the entered text will appear changes. Override this
        to keep track of the current input window, for instance for the purpose of
        positioning a status display of your input method.
  */
  extern(C) void function(GtkIMContext* context, GtkWidget* widget) setClientWidget;

  /**
      Called via [gtk.imcontext.IMContext.getPreeditString]
        to retrieve the text currently being preedited for display at the cursor
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
        consumed by the input method. In that case, the [gtk.imcontext.IMContext.commit]
        signal should be emitted upon completion of a key sequence to pass the
        resulting text back to the input widget. Alternatively, false may be
        returned to indicate that the event wasn’t handled by the input method.
        If a builtin mapping exists for the key, it is used to produce a
        character.
  */
  extern(C) gboolean function(GtkIMContext* context, GdkEvent* event) filterKeypress;

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
      Called via [gtk.imcontext.IMContext.setSurrounding] in
        response to `signal@Gtk.IMContext::retrieve-surrounding` signal to update
        the input method’s idea of the context around the cursor. It is not necessary
        to override this method even with input methods which implement
        context-dependent behavior. The base implementation is sufficient for
        [gtk.imcontext.IMContext.getSurrounding] to work.
  */
  extern(C) void function(GtkIMContext* context, const(char)* text, int len, int cursorIndex) setSurrounding;

  /**
      Called via [gtk.imcontext.IMContext.getSurrounding] to update
        the context around the cursor location. It is not necessary to override this
        method even with input methods which implement context-dependent behavior.
        The base implementation emits `signal@Gtk.IMContext::retrieve-surrounding`
        and records the context received by the subsequent invocation of
        `vfunc@Gtk.IMContext.get_surrounding`.
  */
  extern(C) gboolean function(GtkIMContext* context, char** text, int* cursorIndex) getSurrounding;

  /**
      Called via
        [gtk.imcontext.IMContext.setSurroundingWithSelection] in response to the
        `signal@Gtk.IMContext::retrieve-surrounding` signal to update the input
        method’s idea of the context around the cursor. It is not necessary to
        override this method even with input methods which implement
        context-dependent behavior. The base implementation is sufficient for
        [gtk.imcontext.IMContext.getSurrounding] to work.
  */
  extern(C) void function(GtkIMContext* context, const(char)* text, int len, int cursorIndex, int anchorIndex) setSurroundingWithSelection;

  /**
      Called via
        [gtk.imcontext.IMContext.getSurroundingWithSelection] to update the
        context around the cursor location. It is not necessary to override
        this method even with input methods which implement context-dependent
        behavior. The base implementation emits
        `signal@Gtk.IMContext::retrieve-surrounding` and records the context
        received by the subsequent invocation of `vfunc@Gtk.IMContext.get_surrounding`.
  */
  extern(C) gboolean function(GtkIMContext* context, char** text, int* cursorIndex, int* anchorIndex) getSurroundingWithSelection;

  /** */
  extern(C) void function(GtkIMContext* context) activateOsk;

  /** */
  extern(C) gboolean function(GtkIMContext* context, GdkEvent* event) activateOskWithEvent;

  /** */
  extern(C) void function() GtkReserved2;

  /** */
  extern(C) void function() GtkReserved3;

  /** */
  extern(C) void function() GtkReserved4;
}

/**
    [gtk.imcontext_simple.IMContextSimple] is an input method supporting table-based input methods.
    
    ## Compose sequences
    
    [gtk.imcontext_simple.IMContextSimple] reads compose sequences from the first of the
    following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
    /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
    Compose file). A subset of the file syntax described in the Compose(5)
    manual page is supported. Additionally, `include "`L`"` loads GTK’s built-in
    table of compose sequences rather than the locale-specific one from X11.
    
    If none of these files is found, [gtk.imcontext_simple.IMContextSimple] uses a built-in table
    of compose sequences that is derived from the X11 Compose files.
    
    Note that compose sequences typically start with the Compose_key, which is
    often not available as a dedicated key on keyboards. Keyboard layouts may
    map this keysym to other keys, such as the right Control key.
    
    ## Unicode characters
    
    [gtk.imcontext_simple.IMContextSimple] also supports numeric entry of Unicode characters
    by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
    hexadecimal Unicode codepoint.
    
    For example,
    
        Ctrl-Shift-u 1 2 3 Enter
    
    yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.
    
    ## Dead keys
    
    [gtk.imcontext_simple.IMContextSimple] supports dead keys. For example, typing
    
        dead_acute a
    
     yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this
     depends on the keyboard layout including dead keys.
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

/**
    [gtk.immulticontext.IMMulticontext] is an input method context supporting multiple,
    switchable input methods.
    
    Text widgets such as [gtk.text.Text] or [gtk.text_view.TextView] use a `GtkIMMultiContext`
    to implement their `im-module` property for switching between different
    input methods.
*/
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
    Contains information found when looking up an icon in [gtk.icon_theme.IconTheme].
    
    [gtk.icon_paintable.IconPaintable] implements [gdk.paintable.Paintable].
*/
struct GtkIconPaintable;

/**
    [gtk.icon_theme.IconTheme] provides a facility for loading themed icons.
    
    The main reason for using a name rather than simply providing a filename
    is to allow different icons to be used depending on what “icon theme” is
    selected by the user. The operation of icon themes on Linux and Unix
    follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
    There is a fallback icon theme, named `hicolor`, where applications
    should install their icons, but additional icon themes can be installed
    as operating system vendors and users choose.
    
    In many cases, named themes are used indirectly, via [gtk.image.Image]
    rather than directly, but looking up icons directly is also simple. The
    [gtk.icon_theme.IconTheme] object acts as a database of all the icons in the current
    theme. You can create new [gtk.icon_theme.IconTheme] objects, but it’s much more
    efficient to use the standard icon theme of the [gtk.widget.Widget] so that the
    icon information is shared with other people looking up icons.
    
    ```c
    GtkIconTheme *icon_theme;
    GtkIconPaintable *icon;
    GdkPaintable *paintable;
    
    icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display (my_widget));
    icon = gtk_icon_theme_lookup_icon (icon_theme,
                                       "my-icon-name", // icon name
                                       48, // icon size
                                       1,  // scale
                                       0,  // flags);
    paintable = GDK_PAINTABLE (icon);
    // Use the paintable
    g_object_unref (icon);
    ```
*/
struct GtkIconTheme;

/**
    [gtk.icon_view.IconView] is a widget which displays data in a grid of icons.
    
    [gtk.icon_view.IconView] provides an alternative view on a [gtk.tree_model.TreeModel].
    It displays the model as a grid of icons with labels. Like
    [gtk.tree_view.TreeView], it allows to select one or multiple items
    (depending on the selection mode, see [gtk.icon_view.IconView.setSelectionMode]).
    In addition to selection with the arrow keys, [gtk.icon_view.IconView] supports
    rubberband selection, which is controlled by dragging the pointer.
    
    Note that if the tree model is backed by an actual tree store (as
    opposed to a flat list where the mapping to icons is obvious),
    [gtk.icon_view.IconView] will only display the first level of the tree and
    ignore the tree’s branches.
    
    ## CSS nodes
    
    ```
    iconview.view
    ╰── [rubberband]
    ```
    
    [gtk.icon_view.IconView] has a single CSS node with name iconview and style class .view.
    For rubberband selection, a subnode with name rubberband is used.

    Deprecated: Use [gtk.grid_view.GridView] instead
*/
struct GtkIconView;

/**
    The [gtk.image.Image] widget displays an image.
    
    ![An example GtkImage](image.png)
    
    Various kinds of object can be displayed as an image; most typically,
    you would load a [gdk.texture.Texture] from a file, using the convenience function
    [gtk.image.Image.newFromFile], for instance:
    
    ```c
    GtkWidget *image = gtk_image_new_from_file ("myfile.png");
    ```
    
    If the file isn’t loaded successfully, the image will contain a
    “broken image” icon similar to that used in many web browsers.
    
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gdk.texture.Texture.newFromFile], then create the [gtk.image.Image] with
    [gtk.image.Image.newFromPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gio.resource.Resource] inside
    GIO, for details. In this case, [gtk.image.Image.resource],
    [gtk.image.Image.newFromResource], and [gtk.image.Image.setFromResource]
    should be used.
    
    [gtk.image.Image] displays its image as an icon, with a size that is determined
    by the application. See [gtk.picture.Picture] if you want to show an image
    at is actual size.
    
    ## CSS nodes
    
    [gtk.image.Image] has a single CSS node with the name `image`. The style classes
    `.normal-icons` or `.large-icons` may appear, depending on the
    `property@Gtk.Image:icon-size` property.
    
    ## Accessibility
    
    [gtk.image.Image] uses the [gtk.types.AccessibleRole.Img] role.
*/
struct GtkImage;

/**
    [gtk.info_bar.InfoBar] can be used to show messages to the user without a dialog.
    
    ![An example GtkInfoBar](info-bar.png)
    
    It is often temporarily shown at the top or bottom of a document.
    In contrast to [gtk.dialog.Dialog], which has an action area at the
    bottom, [gtk.info_bar.InfoBar] has an action area at the side.
    
    The API of [gtk.info_bar.InfoBar] is very similar to [gtk.dialog.Dialog], allowing you
    to add buttons to the action area with [gtk.info_bar.InfoBar.addButton]
    or [gtk.info_bar.InfoBar.newWithButtons]. The sensitivity of action widgets
    can be controlled with [gtk.info_bar.InfoBar.setResponseSensitive].
    
    To add widgets to the main content area of a [gtk.info_bar.InfoBar], use
    [gtk.info_bar.InfoBar.addChild].
    
    Similar to [gtk.message_dialog.MessageDialog], the contents of a [gtk.info_bar.InfoBar]
    can by classified as error message, warning, informational message, etc,
    by using [gtk.info_bar.InfoBar.setMessageType]. GTK may use the message
    type to determine how the message is displayed.
    
    A simple example for using a [gtk.info_bar.InfoBar]:
    ```c
    GtkWidget *message_label;
    GtkWidget *widget;
    GtkWidget *grid;
    GtkInfoBar *bar;
    
    // set up info bar
    widget = gtk_info_bar_new ();
    bar = GTK_INFO_BAR (widget);
    grid = gtk_grid_new ();
    
    message_label = gtk_label_new ("");
    gtk_info_bar_add_child (bar, message_label);
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
    gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);
    gtk_widget_show (bar);
    ```
    
    # GtkInfoBar as GtkBuildable
    
    [gtk.info_bar.InfoBar] supports a custom `<action-widgets>` element, which can contain
    multiple `<action-widget>` elements. The “response” attribute specifies a
    numeric response, and the content of the element is the id of widget
    (which should be a child of the dialogs @action_area).
    
    [gtk.info_bar.InfoBar] supports adding action widgets by specifying “action” as
    the “type” attribute of a `<child>` element. The widget will be added
    either to the action area. The response id has to be associated
    with the action widget using the `<action-widgets>` element.
    
    # CSS nodes
    
    [gtk.info_bar.InfoBar] has a single CSS node with name infobar. The node may get
    one of the style classes .info, .warning, .error or .question, depending
    on the message type.
    If the info bar shows a close button, that button will have the .close
    style class applied.

    Deprecated: There is no replacement in GTK for an "info bar" widget;
        you can use [gtk.revealer.Revealer] with a [gtk.box.Box] containing a
        [gtk.label.Label] and an optional [gtk.button.Button], according to
        your application's design.
*/
struct GtkInfoBar;

/**
    [gtk.inscription.Inscription] is a widget to show text in a predefined area.
    
    You likely want to use [gtk.label.Label] instead as this widget is intended only
    for a small subset of use cases. The main scenario envisaged is inside lists
    such as [gtk.column_view.ColumnView].
    
    While a [gtk.label.Label] sizes itself depending on the text that is displayed,
    [gtk.inscription.Inscription] is given a size and inscribes the given text into that
    space as well as it can.
    
    Users of this widget should take care to plan behaviour for the common case
    where the text doesn't fit exactly in the allocated space.
*/
struct GtkInscription;

/** */
struct GtkInscriptionClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that triggers when a specific keyval and modifiers are pressed.
*/
struct GtkKeyvalTrigger;

/** */
struct GtkKeyvalTriggerClass;

/**
    The [gtk.label.Label] widget displays a small amount of text.
    
    As the name implies, most labels are used to label another widget
    such as a `class@Button`.
    
    ![An example GtkLabel](label.png)
    
    ## CSS nodes
    
    ```
    label
    ├── [selection]
    ├── [link]
    ┊
    ╰── [link]
    ```
    
    [gtk.label.Label] has a single CSS node with the name label. A wide variety
    of style classes may be applied to labels, such as .title, .subtitle,
    .dim-label, etc. In the [gtk.shortcuts_window.ShortcutsWindow], labels are used with the
    .keycap style class.
    
    If the label has a selection, it gets a subnode with name selection.
    
    If the label has links, there is one subnode per link. These subnodes
    carry the link or visited state depending on whether they have been
    visited. In this case, label node also gets a .link style class.
    
    ## GtkLabel as GtkBuildable
    
    The GtkLabel implementation of the GtkBuildable interface supports a
    custom `<attributes>` element, which supports any number of `<attribute>`
    elements. The `<attribute>` element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify [pango.attribute.Attribute]
    values for this label.
    
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
    
    ## Accessibility
    
    [gtk.label.Label] uses the [gtk.types.AccessibleRole.Label] role.
    
    ## Mnemonics
    
    Labels may contain “mnemonics”. Mnemonics are underlined characters in the
    label, used for keyboard navigation. Mnemonics are created by providing a
    string with an underscore before the mnemonic character, such as `"_File"`,
    to the functions [gtk.label.Label.newWithMnemonic] or
    [gtk.label.Label.setTextWithMnemonic].
    
    Mnemonics automatically activate any activatable widget the label is
    inside, such as a [gtk.button.Button]; if the label is not inside the
    mnemonic’s target widget, you have to tell the label about the target
    using [gtk.label.Label.setMnemonicWidget].
    
    Here’s a simple example where the label is inside a button:
    
    ```c
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
    gtk_button_set_child (GTK_BUTTON (button), label);
    ```
    
    There’s a convenience function to create buttons with a mnemonic label
    already inside:
    
    ```c
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
    ```
    
    To create a mnemonic for a widget alongside the label, such as a
    [gtk.entry.Entry], you have to point the label at the entry with
    [gtk.label.Label.setMnemonicWidget]:
    
    ```c
    // Pressing Alt+H will focus the entry
    GtkWidget *entry = gtk_entry_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
    gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
    ```
    
    ## Markup (styled text)
    
    To make it easy to format text in a label (changing colors,
    fonts, etc.), label text can be provided in a simple
    markup format:
    
    Here’s how to create a label with a small font:
    ```c
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
    ```
    
    (See the Pango manual for complete documentation] of available
    tags, `func@Pango.parse_markup`)
    
    The markup passed to [gtk.label.Label.setMarkup] must be valid; for example,
    literal `<`, `>` and `&` characters must be escaped as `&lt;`, `&gt;`, and `&amp;`.
    If you pass text obtained from the user, file, or a network to
    [gtk.label.Label.setMarkup], you’ll want to escape it with
    `func@GLib.markup_escape_text` or `func@GLib.markup_printf_escaped`.
    
    Markup strings are just a convenient way to set the [pango.attr_list.AttrList]
    on a label; [gtk.label.Label.setAttributes] may be a simpler way to set
    attributes in some cases. Be careful though; [pango.attr_list.AttrList] tends
    to cause internationalization problems, unless you’re applying attributes
    to the entire string (i.e. unless you set the range of each attribute
    to [0, `G_MAXINT`)). The reason is that specifying the start_index and
    end_index for a [pango.attribute.Attribute] requires knowledge of the exact
    string being displayed, so translations will cause problems.
    
    ## Selectable labels
    
    Labels can be made selectable with [gtk.label.Label.setSelectable].
    Selectable labels allow the user to copy the label contents to
    the clipboard. Only labels that contain useful-to-copy information—such
    as error messages—should be made selectable.
    
    ## Text layout
    
    A label can contain any number of paragraphs, but will have
    performance problems if it contains more than a small number.
    Paragraphs are separated by newlines or other paragraph separators
    understood by Pango.
    
    Labels can automatically wrap text if you call [gtk.label.Label.setWrap].
    
    [gtk.label.Label.setJustify] sets how the lines in a label align
    with one another. If you want to set how the label as a whole aligns
    in its available space, see the [gtk.widget.Widget.halign] and
    [gtk.widget.Widget.valign] properties.
    
    The `property@Gtk.Label:width-chars` and `property@Gtk.Label:max-width-chars`
    properties can be used to control the size allocation of ellipsized or
    wrapped labels. For ellipsizing labels, if either is specified (and less
    than the actual text size), it is used as the minimum width, and the actual
    text size is used as the natural width of the label. For wrapping labels,
    width-chars is used as the minimum width, if specified, and max-width-chars
    is used as the natural width. Even if max-width-chars specified, wrapping
    labels will be rewrapped to use all of the available width.
    
    ## Links
    
    GTK supports markup for clickable hyperlinks in addition to regular Pango
    markup. The markup for links is borrowed from HTML, using the `<a>` with
    “href“, “title“ and “class“ attributes. GTK renders links similar to the
    way they appear in web browsers, with colored, underlined text. The “title“
    attribute is displayed as a tooltip on the link. The “class“ attribute is
    used as style class on the CSS node for the link.
    
    An example of inline links looks like this:
    
    ```c
    const char *text =
    "Go to the "
    "<a href=\"https://www.gtk.org\" title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
    "GTK website</a> for more...";
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), text);
    ```
    
    It is possible to implement custom handling for links and their tooltips
    with the `signal@Gtk.Label::activate-link` signal and the
    [gtk.label.Label.getCurrentUri] function.
*/
struct GtkLabel;

/**
    [gtk.layout_child.LayoutChild] is the base class for objects that are meant to hold
    layout properties.
    
    If a [gtk.layout_manager.LayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [gtk.layout_child.LayoutChild] implementation to store those properties.
    
    A [gtk.layout_child.LayoutChild] instance is only ever valid while a widget is part
    of a layout.
*/
struct GtkLayoutChild
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkLayoutChildClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Layout managers are delegate classes that handle the preferred size
    and the allocation of a widget.
    
    You typically subclass [gtk.layout_manager.LayoutManager] if you want to implement a
    layout policy for the children of a widget, or if you want to determine
    the size of a widget depending on its contents.
    
    Each [gtk.widget.Widget] can only have a [gtk.layout_manager.LayoutManager] instance associated
    to it at any given time; it is possible, though, to replace the layout
    manager instance using [gtk.widget.Widget.setLayoutManager].
    
    ## Layout properties
    
    A layout manager can expose properties for controlling the layout of
    each child, by creating an object type derived from [gtk.layout_child.LayoutChild]
    and installing the properties on it as normal [gobject.object.ObjectWrap] properties.
    
    Each [gtk.layout_child.LayoutChild] instance storing the layout properties for a
    specific child is created through the [gtk.layout_manager.LayoutManager.getLayoutChild]
    method; a [gtk.layout_manager.LayoutManager] controls the creation of its [gtk.layout_child.LayoutChild]
    instances by overriding the GtkLayoutManagerClass.create_layout_child()
    virtual function. The typical implementation should look like:
    
    ```c
    static GtkLayoutChild *
    create_layout_child (GtkLayoutManager *manager,
                         GtkWidget        *container,
                         GtkWidget        *child)
    {
      return g_object_new (your_layout_child_get_type (),
                           "layout-manager", manager,
                           "child-widget", child,
                           NULL);
    }
    ```
    
    The `property@Gtk.LayoutChild:layout-manager` and
    `property@Gtk.LayoutChild:child-widget` properties
    on the newly created [gtk.layout_child.LayoutChild] instance are mandatory. The
    [gtk.layout_manager.LayoutManager] will cache the newly created [gtk.layout_child.LayoutChild] instance
    until the widget is removed from its parent, or the parent removes the
    layout manager.
    
    Each [gtk.layout_manager.LayoutManager] instance creating a [gtk.layout_child.LayoutChild] should use
    [gtk.layout_manager.LayoutManager.getLayoutChild] every time it needs to query
    the layout properties; each [gtk.layout_child.LayoutChild] instance should call
    [gtk.layout_manager.LayoutManager.layoutChanged] every time a property is
    updated, in order to queue a new size measuring and allocation.
*/
struct GtkLayoutManager
{
  /** */
  GObject parentInstance;
}

/**
    The [gtk.layout_manager_class.LayoutManagerClass] structure contains only private data, and
    should only be accessed through the provided API, or when subclassing
    [gtk.layout_manager.LayoutManager].
*/
struct GtkLayoutManagerClass
{
  /** */
  GObjectClass parentClass;

  /**
      a virtual function, used to return the preferred
        request mode for the layout manager; for instance, "width for height"
        or "height for width"; see [gtk.types.SizeRequestMode]
  */
  extern(C) GtkSizeRequestMode function(GtkLayoutManager* manager, GtkWidget* widget) getRequestMode;

  /**
      a virtual function, used to measure the minimum and preferred
        sizes of the widget using the layout manager for a given orientation
  */
  extern(C) void function(GtkLayoutManager* manager, GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline) measure;

  /**
      a virtual function, used to allocate the size of the widget
        using the layout manager
  */
  extern(C) void function(GtkLayoutManager* manager, GtkWidget* widget, int width, int height, int baseline) allocate;

  /**
      the type of [gtk.layout_child.LayoutChild] used by this layout manager
  */
  GType layoutChildType;

  /**
      a virtual function, used to create a [gtk.layout_child.LayoutChild]
        meta object for the layout properties
  */
  extern(C) GtkLayoutChild* function(GtkLayoutManager* manager, GtkWidget* widget, GtkWidget* forChild) createLayoutChild;

  /**
      a virtual function, called when the widget using the layout
        manager is attached to a [gtk.root.Root]
  */
  extern(C) void function(GtkLayoutManager* manager) root;

  /**
      a virtual function, called when the widget using the layout
        manager is detached from a [gtk.root.Root]
  */
  extern(C) void function(GtkLayoutManager* manager) unroot;

  /** */
  void*[16] Padding;
}

/**
    [gtk.level_bar.LevelBar] is a widget that can be used as a level indicator.
    
    Typical use cases are displaying the strength of a password, or
    showing the charge level of a battery.
    
    ![An example GtkLevelBar](levelbar.png)
    
    Use [gtk.level_bar.LevelBar.setValue] to set the current value, and
    [gtk.level_bar.LevelBar.addOffsetValue] to set the value offsets at which
    the bar will be considered in a different state. GTK will add a few
    offsets by default on the level bar: [gtk.types.LEVEL_BAR_OFFSET_LOW],
    [gtk.types.LEVEL_BAR_OFFSET_HIGH] and [gtk.types.LEVEL_BAR_OFFSET_FULL], with
    values 0.25, 0.75 and 1.0 respectively.
    
    Note that it is your responsibility to update preexisting offsets
    when changing the minimum or maximum value. GTK will simply clamp
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
      //   border-width: 1px;
      // }
    
      gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
    
      return widget;
    }
    ```
    
    The default interval of values is between zero and one, but it’s possible
    to modify the interval using [gtk.level_bar.LevelBar.setMinValue] and
    [gtk.level_bar.LevelBar.setMaxValue]. The value will be always drawn in
    proportion to the admissible interval, i.e. a value of 15 with a specified
    interval between 10 and 20 is equivalent to a value of 0.5 with an interval
    between 0 and 1. When [gtk.types.LevelBarMode.Discrete] is used, the bar level
    is rendered as a finite number of separated blocks instead of a single one.
    The number of blocks that will be rendered is equal to the number of units
    specified by the admissible interval.
    
    For instance, to build a bar rendered with five blocks, it’s sufficient to
    set the minimum value to 0 and the maximum value to 5 after changing the
    indicator mode to discrete.
    
    # GtkLevelBar as GtkBuildable
    
    The [gtk.level_bar.LevelBar] implementation of the [gtk.buildable.Buildable] interface supports a
    custom `<offsets>` element, which can contain any number of `<offset>` elements,
    each of which must have "name" and "value" attributes.
    
    # CSS nodes
    
    ```
    levelbar[.discrete]
    ╰── trough
        ├── block.filled.level-name
        ┊
        ├── block.empty
        ┊
    ```
    
    [gtk.level_bar.LevelBar] has a main CSS node with name levelbar and one of the style
    classes .discrete or .continuous and a subnode with name trough. Below the
    trough node are a number of nodes with name block and style class .filled
    or .empty. In continuous mode, there is exactly one node of each, in discrete
    mode, the number of filled and unfilled nodes corresponds to blocks that are
    drawn. The block.filled nodes also get a style class .level-name corresponding
    to the level for the current value.
    
    In horizontal orientation, the nodes are always arranged from left to right,
    regardless of text direction.
    
    # Accessibility
    
    [gtk.level_bar.LevelBar] uses the [gtk.types.AccessibleRole.Meter] role.
*/
struct GtkLevelBar;

/**
    A [gtk.link_button.LinkButton] is a button with a hyperlink.
    
    ![An example GtkLinkButton](link-button.png)
    
    It is useful to show quick links to resources.
    
    A link button is created by calling either [gtk.link_button.LinkButton.new_] or
    [gtk.link_button.LinkButton.newWithLabel]. If using the former, the URI you
    pass to the constructor is used as a label for the widget.
    
    The URI bound to a [gtk.link_button.LinkButton] can be set specifically using
    [gtk.link_button.LinkButton.setUri].
    
    By default, [gtk.link_button.LinkButton] calls [gtk.file_launcher.FileLauncher.launch] when the button
    is clicked. This behaviour can be overridden by connecting to the
    `signal@Gtk.LinkButton::activate-link` signal and returning true from
    the signal handler.
    
    # CSS nodes
    
    [gtk.link_button.LinkButton] has a single CSS node with name button. To differentiate
    it from a plain [gtk.button.Button], it gets the .link style class.
    
    # Accessibility
    
    [gtk.link_button.LinkButton] uses the [gtk.types.AccessibleRole.Link] role.
*/
struct GtkLinkButton;

/**
    [gtk.list_base.ListBase] is the abstract base class for GTK's list widgets.
*/
struct GtkListBase;

/** */
struct GtkListBaseClass;

/**
    [gtk.list_box.ListBox] is a vertical list.
    
    A [gtk.list_box.ListBox] only contains [gtk.list_box_row.ListBoxRow] children. These rows can
    by dynamically sorted and filtered, and headers can be added dynamically
    depending on the row content. It also allows keyboard and mouse navigation
    and selection like a typical list.
    
    Using [gtk.list_box.ListBox] is often an alternative to [gtk.tree_view.TreeView], especially
    when the list contents has a more complicated layout than what is allowed
    by a [gtk.cell_renderer.CellRenderer], or when the contents is interactive (i.e. has a
    button in it).
    
    Although a [gtk.list_box.ListBox] must have only [gtk.list_box_row.ListBoxRow] children, you can
    add any kind of widget to it via [gtk.list_box.ListBox.prepend],
    [gtk.list_box.ListBox.append] and [gtk.list_box.ListBox.insert] and a
    [gtk.list_box_row.ListBoxRow] widget will automatically be inserted between the list
    and the widget.
    
    `GtkListBoxRows` can be marked as activatable or selectable. If a row is
    activatable, `signal@Gtk.ListBox::row-activated` will be emitted for it when
    the user tries to activate it. If it is selectable, the row will be marked
    as selected when the user tries to select it.
    
    # GtkListBox as GtkBuildable
    
    The [gtk.list_box.ListBox] implementation of the [gtk.buildable.Buildable] interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a `<child>` element. See [gtk.list_box.ListBox.setPlaceholder]
    for info.
    
    # CSS nodes
    
    ```plain
    list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
    ╰── row[.activatable]
    ```
    
    [gtk.list_box.ListBox] uses a single CSS node named list. It may carry the .separators
    style class, when the `property@Gtk.ListBox:show-separators` property is set.
    Each [gtk.list_box_row.ListBoxRow] uses a single CSS node named row. The row nodes get the
    .activatable style class added when appropriate.
    
    It may also carry the .boxed-list style class. In this case, the list will be
    automatically surrounded by a frame and have separators.
    
    The main list node may also carry style classes to select
    the style of [list presentation](section-list-widget.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gtk.list_box.ListBox] uses the [gtk.types.AccessibleRole.List] role and [gtk.list_box_row.ListBoxRow] uses
    the [gtk.types.AccessibleRole.ListItem] role.
*/
struct GtkListBox;

/**
    [gtk.list_box_row.ListBoxRow] is the kind of widget that can be added to a [gtk.list_box.ListBox].
*/
struct GtkListBoxRow
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkListBoxRowClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkListBoxRow* row) activate;

  /** */
  void*[8] padding;
}

/**
    [gtk.list_header.ListHeader] is used by list widgets to represent the headers they
    display.
    
    [gtk.list_header.ListHeader] objects are managed just like [gtk.list_item.ListItem]
    objects via their factory, but provide a different set of properties suitable
    for managing the header instead of individual items.
*/
struct GtkListHeader;

/** */
struct GtkListHeaderClass;

/**
    [gtk.list_item.ListItem] is used by list widgets to represent items in a
    [gio.list_model.ListModel].
    
    [gtk.list_item.ListItem] objects are managed by the list widget (with its factory)
    and cannot be created by applications, but they need to be populated
    by application code. This is done by calling [gtk.list_item.ListItem.setChild].
    
    [gtk.list_item.ListItem] objects exist in 2 stages:
    
    1. The unbound stage where the listitem is not currently connected to
       an item in the list. In that case, the [gtk.list_item.ListItem.item]
       property is set to null.
    
    2. The bound stage where the listitem references an item from the list.
       The [gtk.list_item.ListItem.item] property is not null.
*/
struct GtkListItem;

/** */
struct GtkListItemClass;

/**
    A [gtk.list_item_factory.ListItemFactory] creates widgets for the items taken from a [gio.list_model.ListModel].
    
    This is one of the core concepts of handling list widgets such
    as [gtk.list_view.ListView] or [gtk.grid_view.GridView].
    
    The [gtk.list_item_factory.ListItemFactory] is tasked with creating widgets for items
    taken from the model when the views need them and updating them as
    the items displayed by the view change.
    
    A view is usually only able to display anything after both a factory
    and a model have been set on the view. So it is important that you do
    not skip this step when setting up your first view.
    
    Because views do not display the whole list at once but only a few
    items, they only need to maintain a few widgets at a time. They will
    instruct the [gtk.list_item_factory.ListItemFactory] to create these widgets and bind them
    to the items that are currently displayed.
    
    As the list model changes or the user scrolls to the list, the items will
    change and the view will instruct the factory to bind the widgets to those
    new items.
    
    The actual widgets used for displaying those widgets is provided by you.
    
    When the factory needs widgets created, it will create a [gtk.list_item.ListItem]
    and hand it to your code to set up a widget for. This list item will provide
    various properties with information about what item to display and provide
    you with some opportunities to configure its behavior. See the
    [gtk.list_item.ListItem] documentation for further details.
    
    Various implementations of [gtk.list_item_factory.ListItemFactory] exist to allow you different
    ways to provide those widgets. The most common implementations are
    [gtk.builder_list_item_factory.BuilderListItemFactory] which takes a [gtk.builder.Builder] .ui file
    and then creates widgets and manages everything automatically from the
    information in that file and [gtk.signal_list_item_factory.SignalListItemFactory] which allows
    you to connect to signals with your own code and retain full control over
    how the widgets are setup and managed.
    
    A [gtk.list_item_factory.ListItemFactory] is supposed to be final - that means its behavior should
    not change and the first widget created from it should behave the same way as
    the last widget created from it.
    If you intend to do changes to the behavior, it is recommended that you create
    a new [gtk.list_item_factory.ListItemFactory] which will allow the views to recreate its widgets.
    
    Once you have chosen your factory and created it, you need to set it
    on the view widget you want to use it with, such as via
    [gtk.list_view.ListView.setFactory]. Reusing factories across different
    views is allowed, but very uncommon.
*/
struct GtkListItemFactory;

/** */
struct GtkListItemFactoryClass;

/**
    A list-like data structure that can be used with the [gtk.tree_view.TreeView].
    
    The [gtk.list_store.ListStore] object is a list model for use with a [gtk.tree_view.TreeView]
    widget.  It implements the [gtk.tree_model.TreeModel] interface, and consequentialy,
    can use all of the methods available there.  It also implements the
    [gtk.tree_sortable.TreeSortable] interface so it can be sorted by the view.
    Finally, it also implements the tree
    [drag](iface.TreeDragSource.html) and [drop](iface.TreeDragDest.html)
    interfaces.
    
    The [gtk.list_store.ListStore] can accept most `GType`s as a column type, though
    it can’t accept all custom types.  Internally, it will keep a copy of
    data passed in (such as a string or a boxed pointer).  Columns that
    accept [gobject.object.ObjectWrap]s are handled a little differently.  The
    [gtk.list_store.ListStore] will keep a reference to the object instead of copying the
    value.  As a result, if the object is modified, it is up to the
    application writer to call [gtk.tree_model.TreeModel.rowChanged] to emit the
    `signal@Gtk.TreeModel::row_changed` signal. This most commonly affects lists
    with [gdk.texture.Texture]s stored.
    
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
      int i;
    
      list_store = gtk_list_store_new (N_COLUMNS,
                                       G_TYPE_STRING,
                                       G_TYPE_INT,
                                       G_TYPE_BOOLEAN);
    
      for (i = 0; i < 10; i++)
        {
          char *some_data;
    
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
    
    [gtk.list_store.ListStore] is deprecated since GTK 4.10, and should not be used in newly
    written code. You should use [gio.list_store.ListStore] instead, and the various
    list models provided by GTK.
    
    ## Performance Considerations
    
    Internally, the [gtk.list_store.ListStore] was originally implemented with a linked list
    with a tail pointer.  As a result, it was fast at data insertion and deletion,
    and not fast at random data access.  The [gtk.list_store.ListStore] sets the
    [gtk.types.TreeModelFlags.ItersPersist] flag, which means that [gtk.tree_iter.TreeIter]s can be
    cached while the row exists.  Thus, if access to a particular row is needed
    often and your code is expected to run on older versions of GTK, it is worth
    keeping the iter around.
    
    ## Atomic Operations
    
    It is important to note that only the methods
    [gtk.list_store.ListStore.insertWithValues] and [gtk.list_store.ListStore.insertWithValuesv]
    are atomic, in the sense that the row is being appended to the store and the
    values filled in in a single operation with regard to [gtk.tree_model.TreeModel] signaling.
    In contrast, using e.g. [gtk.list_store.ListStore.append] and then [gtk.list_store.ListStore.set]
    will first create a row, which triggers the `GtkTreeModel::row-inserted` signal
    on [gtk.list_store.ListStore]. The row, however, is still empty, and any signal handler
    connecting to `GtkTreeModel::row-inserted` on this particular store should be prepared
    for the situation that the row might be empty. This is especially important
    if you are wrapping the [gtk.list_store.ListStore] inside a [gtk.tree_model.TreeModel]Filter and are
    using a [gtk.tree_model.TreeModel]FilterVisibleFunc. Using any of the non-atomic operations
    to append rows to the [gtk.list_store.ListStore] will cause the
    [gtk.tree_model.TreeModel]FilterVisibleFunc to be visited with an empty row first; the
    function must be prepared for that.
    
    ## GtkListStore as GtkBuildable
    
    The GtkListStore implementation of the [gtk.buildable.Buildable] interface allows
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

    Deprecated: Use [gio.list_store.ListStore] instead
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
  void*[8] padding;
}

/** */
struct GtkListStorePrivate;

/**
    [gtk.list_view.ListView] presents a large dynamic list of items.
    
    [gtk.list_view.ListView] uses its factory to generate one row widget for each visible
    item and shows them in a linear display, either vertically or horizontally.
    
    The `property@Gtk.ListView:show-separators` property offers a simple way to
    display separators between the rows.
    
    [gtk.list_view.ListView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on _rubberband selection_, using
    `property@Gtk.ListView:enable-rubberband`.
    
    If you need multiple columns with headers, see [gtk.column_view.ColumnView].
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    An example of using [gtk.list_view.ListView]:
    ```c
    static void
    setup_listitem_cb (GtkListItemFactory *factory,
                       GtkListItem        *list_item)
    {
      GtkWidget *image;
    
      image = gtk_image_new ();
      gtk_image_set_icon_size (GTK_IMAGE (image), GTK_ICON_SIZE_LARGE);
      gtk_list_item_set_child (list_item, image);
    }
    
    static void
    bind_listitem_cb (GtkListItemFactory *factory,
                      GtkListItem        *list_item)
    {
      GtkWidget *image;
      GAppInfo *app_info;
    
      image = gtk_list_item_get_child (list_item);
      app_info = gtk_list_item_get_item (list_item);
      gtk_image_set_from_gicon (GTK_IMAGE (image), g_app_info_get_icon (app_info));
    }
    
    static void
    activate_cb (GtkListView  *list,
                 guint         position,
                 gpointer      unused)
    {
      GAppInfo *app_info;
    
      app_info = g_list_model_get_item (G_LIST_MODEL (gtk_list_view_get_model (list)), position);
      g_app_info_launch (app_info, NULL, NULL, NULL);
      g_object_unref (app_info);
    }
    
    ...
    
      model = create_application_list ();
    
      factory = gtk_signal_list_item_factory_new ();
      g_signal_connect (factory, "setup", G_CALLBACK (setup_listitem_cb), NULL);
      g_signal_connect (factory, "bind", G_CALLBACK (bind_listitem_cb), NULL);
    
      list = gtk_list_view_new (GTK_SELECTION_MODEL (gtk_single_selection_new (model)), factory);
    
      g_signal_connect (list, "activate", G_CALLBACK (activate_cb), NULL);
    
      gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (sw), list);
    ```
    
    # CSS nodes
    
    ```
    listview[.separators][.rich-list][.navigation-sidebar][.data-table]
    ├── row[.activatable]
    │
    ├── row[.activatable]
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.list_view.ListView] uses a single CSS node named `listview`. It may carry the
    `.separators` style class, when `property@Gtk.ListView:show-separators`
    property is set. Each child widget uses a single CSS node named `row`.
    If the [gtk.list_item.ListItem.activatable] property is set, the
    corresponding row will have the `.activatable` style class. For
    rubberband selection, a node with name `rubberband` is used.
    
    The main listview node may also carry style classes to select
    the style of [list presentation](ListContainers.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gtk.list_view.ListView] uses the [gtk.types.AccessibleRole.List] role, and the list
    items use the [gtk.types.AccessibleRole.ListItem] role.
*/
struct GtkListView;

/** */
struct GtkListViewClass;

/**
    [gtk.lock_button.LockButton] is a widget to obtain and revoke authorizations
    needed to operate the controls.
    
    ![An example GtkLockButton](lock-button.png)
    
    It is typically used in preference dialogs or control panels.
    
    The required authorization is represented by a [gio.permission.Permission] object.
    Concrete implementations of [gio.permission.Permission] may use PolicyKit or some
    other authorization framework. To obtain a PolicyKit-based
    [gio.permission.Permission], use `polkit_permission_new()`.
    
    If the user is not currently allowed to perform the action, but can
    obtain the permission, the widget looks like this:
    
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
    with the `property@Gtk.LockButton:text-lock`,
    `property@Gtk.LockButton:text-unlock`,
    `property@Gtk.LockButton:tooltip-lock`,
    `property@Gtk.LockButton:tooltip-unlock` and
    `property@Gtk.LockButton:tooltip-not-authorized` properties.

    Deprecated: This widget will be removed in GTK 5
*/
struct GtkLockButton;

/**
    A [gtk.map_list_model.MapListModel] maps the items in a list model to different items.
    
    [gtk.map_list_model.MapListModel] uses a [gtk.types.MapListModelMapFunc].
    
    Example: Create a list of `GtkEventControllers`
    ```c
    static gpointer
    map_to_controllers (gpointer widget,
                        gpointer data)
    {
      gpointer result = gtk_widget_observe_controllers (widget);
      g_object_unref (widget);
      return result;
    }
    
    widgets = gtk_widget_observe_children (widget);
    
    controllers = gtk_map_list_model_new (widgets,
                                          map_to_controllers,
                                          NULL, NULL);
    
    model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
                                        controllers);
    ```
    
    [gtk.map_list_model.MapListModel] will attempt to discard the mapped objects as soon as
    they are no longer needed and recreate them if necessary.
    
    [gtk.map_list_model.MapListModel] passes through sections from the underlying model.
*/
struct GtkMapListModel;

/** */
struct GtkMapListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.media_controls.MediaControls] is a widget to show controls for a video.
    
    ![An example GtkMediaControls](media-controls.png)
    
    Usually, [gtk.media_controls.MediaControls] is used as part of [gtk.video.Video].
*/
struct GtkMediaControls;

/** */
struct GtkMediaControlsClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.media_file.MediaFile] implements [gtk.media_stream.MediaStream] for files.
    
    This provides a simple way to play back video files with GTK.
    
    GTK provides a GIO extension point for [gtk.media_file.MediaFile] implementations
    to allow for external implementations using various media frameworks.
    
    GTK itself includes an implementation using GStreamer.
*/
struct GtkMediaFile
{
  /** */
  GtkMediaStream parentInstance;
}

/** */
struct GtkMediaFileClass
{
  /** */
  GtkMediaStreamClass parentClass;

  /** */
  extern(C) void function(GtkMediaFile* self) open;

  /** */
  extern(C) void function(GtkMediaFile* self) close;

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
    [gtk.media_stream.MediaStream] is the integration point for media playback inside GTK.
    
    GTK provides an implementation of the [gtk.media_stream.MediaStream] interface that
    is called [gtk.media_file.MediaFile].
    
    Apart from application-facing API for stream playback, [gtk.media_stream.MediaStream]
    has a number of APIs that are only useful for implementations and should
    not be used in applications:
    [gtk.media_stream.MediaStream.prepared],
    [gtk.media_stream.MediaStream.unprepared],
    [gtk.media_stream.MediaStream.update],
    [gtk.media_stream.MediaStream.ended],
    [gtk.media_stream.MediaStream.seekSuccess],
    [gtk.media_stream.MediaStream.seekFailed],
    [gtk.media_stream.MediaStream.gerror],
    [gtk.media_stream.MediaStream.error],
    [gtk.media_stream.MediaStream.errorValist].
*/
struct GtkMediaStream
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkMediaStreamClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) gboolean function(GtkMediaStream* self) play;

  /** */
  extern(C) void function(GtkMediaStream* self) pause;

  /** */
  extern(C) void function(GtkMediaStream* self, long timestamp) seek;

  /** */
  extern(C) void function(GtkMediaStream* self, gboolean muted, double volume) updateAudio;

  /** */
  extern(C) void function(GtkMediaStream* self, GdkSurface* surface) realize;

  /** */
  extern(C) void function(GtkMediaStream* self, GdkSurface* surface) unrealize;

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
    The [gtk.menu_button.MenuButton] widget is used to display a popup when clicked.
    
    ![An example GtkMenuButton](menu-button.png)
    
    This popup can be provided either as a [gtk.popover.Popover] or as an abstract
    [gio.menu_model.MenuModel].
    
    The [gtk.menu_button.MenuButton] widget can show either an icon (set with the
    `property@Gtk.MenuButton:icon-name` property) or a label (set with the
    [gtk.menu_button.MenuButton.label] property). If neither is explicitly set,
    a [gtk.image.Image] is automatically created, using an arrow image oriented
    according to [gtk.menu_button.MenuButton.direction] or the generic
    “open-menu-symbolic” icon if the direction is not set.
    
    The positioning of the popup is determined by the
    [gtk.menu_button.MenuButton.direction] property of the menu button.
    
    For menus, the [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties of the menu are also taken into account. For example, when the
    direction is [gtk.types.ArrowType.Down] and the horizontal alignment is [gtk.types.Align.Start],
    the menu will be positioned below the button, with the starting edge
    (depending on the text direction) of the menu aligned with the starting
    edge of the button. If there is not enough space below the button, the
    menu is popped up above the button instead. If the alignment would move
    part of the menu offscreen, it is “pushed in”.
    
    |           | start                | center                | end                |
    | -         | ---                  | ---                   | ---                |
    | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
    | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
    | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
    | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
    
    # CSS nodes
    
    ```
    menubutton
    ╰── button.toggle
        ╰── <content>
             ╰── [arrow]
    ```
    
    [gtk.menu_button.MenuButton] has a single CSS node with name `menubutton`
    which contains a `button` node with a `.toggle` style class.
    
    If the button contains an icon, it will have the `.image-button` style class,
    if it contains text, it will have `.text-button` style class. If an arrow is
    visible in addition to an icon, text or a custom child, it will also have
    `.arrow-button` style class.
    
    Inside the toggle button content, there is an `arrow` node for
    the indicator, which will carry one of the `.none`, `.up`, `.down`,
    `.left` or `.right` style classes to indicate the direction that
    the menu will appear in. The CSS is expected to provide a suitable
    image for each of these cases using the `-gtk-icon-source` property.
    
    Optionally, the `menubutton` node can carry the `.circular` style class
    to request a round appearance.
    
    # Accessibility
    
    [gtk.menu_button.MenuButton] uses the [gtk.types.AccessibleRole.Button] role.
*/
struct GtkMenuButton;

/**
    [gtk.message_dialog.MessageDialog] presents a dialog with some message text.
    
    ![An example GtkMessageDialog](messagedialog.png)
    
    It’s simply a convenience widget; you could construct the equivalent of
    [gtk.message_dialog.MessageDialog] from [gtk.dialog.Dialog] without too much effort, but
    [gtk.message_dialog.MessageDialog] saves typing.
    
    The easiest way to do a modal message dialog is to use the [gtk.types.DialogFlags.Modal]
    flag, which will call [gtk.window.Window.setModal] internally. The dialog will
    prevent interaction with the parent window until it's hidden or destroyed.
    You can use the [gtk.dialog.Dialog.response] signal to know when the user
    dismissed the dialog.
    
    An example for using a modal dialog:
    ```c
    GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT | GTK_DIALOG_MODAL;
    dialog = gtk_message_dialog_new (parent_window,
                                     flags,
                                     GTK_MESSAGE_ERROR,
                                     GTK_BUTTONS_CLOSE,
                                     "Error reading “%s”: %s",
                                     filename,
                                     g_strerror (errno));
    // Destroy the dialog when the user responds to it
    // (e.g. clicks a button)
    
    g_signal_connect (dialog, "response",
                      G_CALLBACK (gtk_window_destroy),
                      NULL);
    ```
    
    You might do a non-modal [gtk.message_dialog.MessageDialog] simply by omitting the
    [gtk.types.DialogFlags.Modal] flag:
    
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
    g_signal_connect (dialog, "response",
                      G_CALLBACK (gtk_window_destroy),
                      NULL);
    ```
    
    # GtkMessageDialog as GtkBuildable
    
    The [gtk.message_dialog.MessageDialog] implementation of the [gtk.buildable.Buildable] interface exposes
    the message area as an internal child with the name “message_area”.

    Deprecated: Use [gtk.alert_dialog.AlertDialog] instead
*/
struct GtkMessageDialog
{
  /** */
  GtkDialog parentInstance;
}

/** */
struct GtkMessageDialogClass;

/**
    A [gtk.shortcut_action.ShortcutAction] that calls [gtk.widget.Widget.mnemonicActivate].
*/
struct GtkMnemonicAction;

/** */
struct GtkMnemonicActionClass;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that triggers when a specific mnemonic is pressed.
    
    Mnemonics require a *mnemonic modifier* (typically <kbd>Alt</kbd>) to be
    pressed together with the mnemonic key.
*/
struct GtkMnemonicTrigger;

/** */
struct GtkMnemonicTriggerClass;

/**
    [gtk.mount_operation.MountOperation] is an implementation of [gio.mount_operation.MountOperation].
    
    The functions and objects described here make working with GTK and
    GIO more convenient.
    
    [gtk.mount_operation.MountOperation] is needed when mounting volumes:
    It is an implementation of [gio.mount_operation.MountOperation] that can be used with
    GIO functions for mounting volumes such as
    [gio.file.File.mountEnclosingVolume], [gio.file.File.mountMountable],
    [gio.volume.Volume.mount], [gio.mount.Mount.unmountWithOperation] and others.
    
    When necessary, [gtk.mount_operation.MountOperation] shows dialogs to let the user
    enter passwords, ask questions or show processes blocking unmount.
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

/** */
struct GtkMountOperationPrivate;

/**
    [gtk.multi_filter.MultiFilter] is the base class for filters that combine multiple filters.
*/
struct GtkMultiFilter;

/** */
struct GtkMultiFilterClass;

/**
    [gtk.multi_selection.MultiSelection] is a [gtk.selection_model.SelectionModel] that allows selecting multiple
    elements.
*/
struct GtkMultiSelection;

/** */
struct GtkMultiSelectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.multi_sorter.MultiSorter] combines multiple sorters by trying them
    in turn.
    
    If the first sorter compares two items as equal,
    the second is tried next, and so on.
*/
struct GtkMultiSorter;

/** */
struct GtkMultiSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    A [gtk.shortcut_action.ShortcutAction] that activates an action by name.
*/
struct GtkNamedAction;

/** */
struct GtkNamedActionClass;

/**
    [gtk.native.Native] is the interface implemented by all widgets that have
    their own [gdk.surface.Surface].
    
    The obvious example of a [gtk.native.Native] is [gtk.window.Window].
    
    Every widget that is not itself a [gtk.native.Native] is contained in one,
    and you can get it with [gtk.widget.Widget.getNative].
    
    To get the surface of a [gtk.native.Native], use [gtk.native.Native.getSurface].
    It is also possible to find the [gtk.native.Native] to which a surface
    belongs, with [gtk.native.Native.getForSurface].
    
    In addition to a [gdk.surface.Surface], a [gtk.native.Native] also provides
    a [gsk.renderer.Renderer] for rendering on that surface. To get the
    renderer, use [gtk.native.Native.getRenderer].
*/
struct GtkNative;

/**
    Native dialogs are platform dialogs that don't use [gtk.dialog.Dialog].
    
    They are used in order to integrate better with a platform, by
    looking the same as other native applications and supporting
    platform specific features.
    
    The [gtk.dialog.Dialog] functions cannot be used on such objects,
    but we need a similar API in order to drive them. The [gtk.native_dialog.NativeDialog]
    object is an API that allows you to do this. It allows you to set
    various common properties on the dialog, as well as show and hide
    it and get a [gtk.native_dialog.NativeDialog.response] signal when the user
    finished with the dialog.
    
    Note that unlike [gtk.dialog.Dialog], [gtk.native_dialog.NativeDialog] objects are not
    toplevel widgets, and GTK does not keep them alive. It is your
    responsibility to keep a reference until you are done with the
    object.
*/
struct GtkNativeDialog
{
  /** */
  GObject parentInstance;
}

/**
    Class structure for [gtk.native_dialog.NativeDialog].
*/
struct GtkNativeDialogClass
{
  /** */
  GObjectClass parentClass;

  /**
      class handler for the `GtkNativeDialog::response` signal
  */
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

/** */
struct GtkNativeInterface;

/**
    A [gtk.shortcut_trigger.ShortcutTrigger] that never triggers.
*/
struct GtkNeverTrigger;

/** */
struct GtkNeverTriggerClass;

/**
    [gtk.no_selection.NoSelection] is a [gtk.selection_model.SelectionModel] that does not allow selecting
    anything.
    
    This model is meant to be used as a simple wrapper around a [gio.list_model.ListModel]
    when a [gtk.selection_model.SelectionModel] is required.
    
    [gtk.no_selection.NoSelection] passes through sections from the underlying model.
*/
struct GtkNoSelection;

/** */
struct GtkNoSelectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.notebook.Notebook] is a container whose children are pages switched
    between using tabs.
    
    ![An example GtkNotebook](notebook.png)
    
    There are many configuration options for [gtk.notebook.Notebook]. Among
    other things, you can choose on which edge the tabs appear
    (see [gtk.notebook.Notebook.setTabPos]), whether, if there are
    too many tabs to fit the notebook should be made bigger or scrolling
    arrows added (see [gtk.notebook.Notebook.setScrollable]), and whether
    there will be a popup menu allowing the users to switch pages.
    (see [gtk.notebook.Notebook.popupEnable]).
    
    # GtkNotebook as GtkBuildable
    
    The [gtk.notebook.Notebook] implementation of the [gtk.buildable.Buildable] interface
    supports placing children into tabs by specifying “tab” as the
    “type” attribute of a `<child>` element. Note that the content
    of the tab must be created before the tab can be filled.
    A tab child can be specified without specifying a `<child>`
    type attribute.
    
    To add a child widget in the notebooks action area, specify
    "action-start" or “action-end” as the “type” attribute of the
    `<child>` element.
    
    An example of a UI definition fragment with [gtk.notebook.Notebook]:
    
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
    
    ```
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
    
    [gtk.notebook.Notebook] has a main CSS node with name `notebook`, a subnode
    with name `header` and below that a subnode with name `tabs` which
    contains one subnode per tab with name `tab`.
    
    If action widgets are present, their CSS nodes are placed next
    to the `tabs` node. If the notebook is scrollable, CSS nodes with
    name `arrow` are placed as first and last child of the `tabs` node.
    
    The main node gets the `.frame` style class when the notebook
    has a border (see [gtk.notebook.Notebook.setShowBorder]).
    
    The header node gets one of the style class `.top`, `.bottom`,
    `.left` or `.right`, depending on where the tabs are placed. For
    reorderable pages, the tab node gets the `.reorderable-page` class.
    
    A `tab` node gets the `.dnd` style class while it is moved with drag-and-drop.
    
    The nodes are always arranged from left-to-right, regardless of text direction.
    
    # Accessibility
    
    [gtk.notebook.Notebook] uses the following roles:
    
     $(LIST
        * [gtk.types.AccessibleRole.Group] for the notebook widget
        * [gtk.types.AccessibleRole.TabList] for the list of tabs
        * [gtk.types.AccessibleRole.Tab] role for each tab
        * [gtk.types.AccessibleRole.TabPanel] for each page
     )
*/
struct GtkNotebook;

/**
    [gtk.notebook_page.NotebookPage] is an auxiliary object used by [gtk.notebook.Notebook].
*/
struct GtkNotebookPage;

/**
    A [gtk.shortcut_action.ShortcutAction] that does nothing.
*/
struct GtkNothingAction;

/** */
struct GtkNothingActionClass;

/**
    [gtk.numeric_sorter.NumericSorter] is a [gtk.sorter.Sorter] that compares numbers.
    
    To obtain the numbers to compare, this sorter evaluates a
    [gtk.expression.Expression].
*/
struct GtkNumericSorter;

/** */
struct GtkNumericSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    A [gobject.object.ObjectWrap] value in a [gtk.expression.Expression].
*/
struct GtkObjectExpression;

/**
    The [gtk.orientable.Orientable] interface is implemented by all widgets that can be
    oriented horizontally or vertically.
    
    [gtk.orientable.Orientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.
    
    ## CSS nodes
    
    [gtk.widget.Widget] types implementing the [gtk.orientable.Orientable] interface will
    automatically acquire the `horizontal` or `vertical` CSS class depending on
    the value of the [gtk.orientable.Orientable.orientation] property.
*/
struct GtkOrientable;

/** */
struct GtkOrientableIface
{
  /** */
  GTypeInterface baseIface;
}

/**
    [gtk.overlay.Overlay] is a container which contains a single main child, on top
    of which it can place “overlay” widgets.
    
    ![An example GtkOverlay](overlay.png)
    
    The position of each overlay widget is determined by its
    [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties. E.g. a widget with both alignments set to [gtk.types.Align.Start]
    will be placed at the top left corner of the [gtk.overlay.Overlay] container,
    whereas an overlay with halign set to [gtk.types.Align.Center] and valign set
    to [gtk.types.Align.End] will be placed a the bottom edge of the [gtk.overlay.Overlay],
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the `signal@Gtk.Overlay::get-child-position` signal.
    
    An overlay’s minimum and natural sizes are those of its main child.
    The sizes of overlay children are not considered when measuring these
    preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The [gtk.overlay.Overlay] implementation of the [gtk.buildable.Buildable] interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gtk.overlay.Overlay] has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
struct GtkOverlay;

/**
    [gtk.overlay_layout.OverlayLayout] is the layout manager used by [gtk.overlay.Overlay].
    
    It places widgets as overlays on top of the main child.
    
    This is not a reusable layout manager, since it expects its widget
    to be a [gtk.overlay.Overlay]. It is only listed here so that its layout
    properties get documented.
*/
struct GtkOverlayLayout;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.overlay_layout.OverlayLayout].
*/
struct GtkOverlayLayoutChild;

/** */
struct GtkOverlayLayoutChildClass
{
  /** */
  GtkLayoutChildClass parentClass;
}

/** */
struct GtkOverlayLayoutClass
{
  /** */
  GtkLayoutManagerClass parentClass;
}

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
  const(char)* label;

  /**
      action name that will be activated in the [gio.action_group.ActionGroup].
  */
  const(char)* actionName;
}

/**
    [gtk.pad_controller.PadController] is an event controller for the pads found in drawing
    tablets.
    
    Pads are the collection of buttons and tactile sensors often found around
    the stylus-sensitive area.
    
    These buttons and sensors have no implicit meaning, and by default they
    perform no action. [gtk.pad_controller.PadController] is provided to map those to
    [gio.action.Action] objects, thus letting the application give them a more
    semantic meaning.
    
    Buttons and sensors are not constrained to triggering a single action,
    some [gdk.types.InputSource.TabletPad] devices feature multiple "modes". All these
    input elements have one current mode, which may determine the final action
    being triggered.
    
    Pad devices often divide buttons and sensors into groups. All elements
    in a group share the same current mode, but different groups may have
    different modes. See [gdk.device_pad.DevicePad.getNGroups] and
    [gdk.device_pad.DevicePad.getGroupNModes].
    
    Each of the actions that a given button/strip/ring performs for a given mode
    is defined by a [gtk.pad_action_entry.PadActionEntry]. It contains an action name that
    will be looked up in the given [gio.action_group.ActionGroup] and activated whenever
    the specified input element and mode are triggered.
    
    A simple example of [gtk.pad_controller.PadController] usage: Assigning button 1 in all
    modes and pad devices to an "invert-selection" action:
    
    ```c
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
    pad_controller = gtk_pad_controller_new (action_group, NULL);
    ```
    
    The actions belonging to rings/strips will be activated with a parameter
    of type `G_VARIANT_TYPE_DOUBLE` bearing the value of the given axis, it
    is required that those are made stateful and accepting this [glib.variant_type.VariantType].
*/
struct GtkPadController;

/** */
struct GtkPadControllerClass;

/**
    A range of pages to print.
    
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
    A [gtk.page_setup.PageSetup] object stores the page size, orientation and margins.
    
    The idea is that you can get one of these from the page setup dialog
    and then pass it to the [gtk.print_operation.PrintOperation] when printing.
    The benefit of splitting this out of the [gtk.print_settings.PrintSettings] is that
    these affect the actual layout of the page, and thus need to be set
    long before user prints.
    
    ## Margins
    
    The margins specified in this object are the “print margins”, i.e. the
    parts of the page that the printer cannot print on. These are different
    from the layout margins that a word processor uses; they are typically
    used to determine the minimal size for the layout margins.
    
    To obtain a [gtk.page_setup.PageSetup] use [gtk.page_setup.PageSetup.new_] to get the defaults,
    or use `func@Gtk.print_run_page_setup_dialog` to show the page setup dialog
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
*/
struct GtkPageSetup;

/**
    [gtk.page_setup_unix_dialog.PageSetupUnixDialog] implements a page setup dialog for platforms
    which don’t provide a native page setup dialog, like Unix.
    
    ![An example GtkPageSetupUnixDialog](pagesetupdialog.png)
    
    It can be used very much like any other GTK dialog, at the
    cost of the portability offered by the high-level printing
    API in [gtk.print_operation.PrintOperation].
    
    ## CSS nodes
    
    [gtk.page_setup_unix_dialog.PageSetupUnixDialog] has a single CSS node with the name `window` and
    style class `.pagesetup`.
*/
struct GtkPageSetupUnixDialog;

/**
    A widget with two panes, arranged either horizontally or vertically.
    
    ![An example GtkPaned](panes.png)
    
    The division between the two panes is adjustable by the user
    by dragging a handle.
    
    Child widgets are added to the panes of the widget with
    [gtk.paned.Paned.setStartChild] and [gtk.paned.Paned.setEndChild].
    The division between the two children is set by default from the size
    requests of the children, but it can be adjusted by the user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a [gtk.frame.Frame] so that the gutter appears as a
    ridge. No separator is drawn if one of the children is missing.
    
    Each child has two options that can be set, "resize" and "shrink". If
    "resize" is true then, when the [gtk.paned.Paned] is resized, that child will
    expand or shrink along with the paned widget. If "shrink" is true, then
    that child can be made smaller than its requisition by the user.
    Setting "shrink" to false allows the application to set a minimum size.
    If "resize" is false for both children, then this is treated as if
    "resize" is true for both children.
    
    The application can set the position of the slider as if it were set
    by the user, by calling [gtk.paned.Paned.setPosition].
    
    # CSS nodes
    
    ```
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ```
    
    [gtk.paned.Paned] has a main CSS node with name paned, and a subnode for
    the separator with name separator. The subnode gets a .wide style
    class when the paned is supposed to be wide.
    
    In horizontal orientation, the nodes are arranged based on the text
    direction, so in left-to-right mode, :first-child will select the
    leftmost child, while it will select the rightmost child in
    RTL layouts.
    
    ## Creating a paned widget with minimum sizes.
    
    ```c
    GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
    GtkWidget *frame1 = gtk_frame_new (NULL);
    GtkWidget *frame2 = gtk_frame_new (NULL);
    
    gtk_widget_set_size_request (hpaned, 200, -1);
    
    gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);
    gtk_paned_set_resize_start_child (GTK_PANED (hpaned), TRUE);
    gtk_paned_set_shrink_start_child (GTK_PANED (hpaned), FALSE);
    gtk_widget_set_size_request (frame1, 50, -1);
    
    gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);
    gtk_paned_set_resize_end_child (GTK_PANED (hpaned), FALSE);
    gtk_paned_set_shrink_end_child (GTK_PANED (hpaned), FALSE);
    gtk_widget_set_size_request (frame2, 50, -1);
    ```
*/
struct GtkPaned;

/**
    [gtk.paper_size.PaperSize] handles paper sizes.
    
    It uses the standard called
    [PWG 5101.1-2002 PWG: Standard for Media Standardized Names](http://www.pwg.org/standards.html)
    to name the paper sizes (and to get the data for the page sizes).
    In addition to standard paper sizes, [gtk.paper_size.PaperSize] allows to
    construct custom paper sizes with arbitrary dimensions.
    
    The [gtk.paper_size.PaperSize] object stores not only the dimensions (width
    and height) of a paper size and its name, it also provides
    default print margins.
*/
struct GtkPaperSize;

/**
    A [gobject.param_spec.ParamSpec] for properties holding a [gtk.expression.Expression].
*/
struct GtkParamSpecExpression
{
  /** */
  GParamSpec parentInstance;
}

/**
    [gtk.password_entry.PasswordEntry] is an entry that has been tailored for entering secrets.
    
    ![An example GtkPasswordEntry](password-entry.png)
    
    It does not show its contents in clear text, does not allow to copy it
    to the clipboard, and it shows a warning when Caps Lock is engaged. If
    the underlying platform allows it, [gtk.password_entry.PasswordEntry] will also place
    the text in a non-pageable memory area, to avoid it being written out
    to disk by the operating system.
    
    Optionally, it can offer a way to reveal the contents in clear text.
    
    [gtk.password_entry.PasswordEntry] provides only minimal API and should be used with
    the [gtk.editable.Editable] API.
    
    # CSS Nodes
    
    ```
    entry.password
    ╰── text
        ├── image.caps-lock-indicator
        ┊
    ```
    
    [gtk.password_entry.PasswordEntry] has a single CSS node with name entry that carries
    a .passwordstyle class. The text Css node below it has a child with
    name image and style class .caps-lock-indicator for the Caps Lock
    icon, and possibly other children.
    
    # Accessibility
    
    [gtk.password_entry.PasswordEntry] uses the [gtk.types.AccessibleRole.TextBox] role.
*/
struct GtkPasswordEntry;

/**
    A [gtk.entry_buffer.EntryBuffer] that locks the underlying memory to prevent it
    from being swapped to disk.
    
    [gtk.password_entry.PasswordEntry] uses a [gtk.password_entry_buffer.PasswordEntryBuffer].
*/
struct GtkPasswordEntryBuffer;

/** */
struct GtkPasswordEntryBufferClass
{
  /** */
  GtkEntryBufferClass parentClass;
}

/** */
struct GtkPasswordEntryClass;

/**
    The [gtk.picture.Picture] widget displays a [gdk.paintable.Paintable].
    
    ![An example GtkPicture](picture.png)
    
    Many convenience functions are provided to make pictures simple to use.
    For example, if you want to load an image from a file, and then display
    it, there’s a convenience function to do this:
    
    ```c
    GtkWidget *widget = gtk_picture_new_for_filename ("myfile.png");
    ```
    
    If the file isn’t loaded successfully, the picture will contain a
    “broken image” icon similar to that used in many web browsers.
    If you want to handle errors in loading the file yourself,
    for example by displaying an error message, then load the image with
    [gdk.texture.Texture.newFromFile], then create the [gtk.picture.Picture] with
    [gtk.picture.Picture.newForPaintable].
    
    Sometimes an application will want to avoid depending on external data
    files, such as image files. See the documentation of [gio.resource.Resource] for details.
    In this case, [gtk.picture.Picture.newForResource] and
    [gtk.picture.Picture.setResource] should be used.
    
    [gtk.picture.Picture] displays an image at its natural size. See [gtk.image.Image]
    if you want to display a fixed-size image, such as an icon.
    
    ## Sizing the paintable
    
    You can influence how the paintable is displayed inside the [gtk.picture.Picture]
    by changing `property@Gtk.Picture:content-fit`. See [gtk.types.ContentFit]
    for details. `property@Gtk.Picture:can-shrink` can be unset to make sure
    that paintables are never made smaller than their ideal size - but
    be careful if you do not know the size of the paintable in use (like
    when displaying user-loaded images). This can easily cause the picture to
    grow larger than the screen. And [gtk.widget.Widget.halign] and
    [gtk.widget.Widget.valign] can be used to make sure the paintable doesn't
    fill all available space but is instead displayed at its original size.
    
    ## CSS nodes
    
    [gtk.picture.Picture] has a single CSS node with the name `picture`.
    
    ## Accessibility
    
    [gtk.picture.Picture] uses the [gtk.types.AccessibleRole.Img] role.
*/
struct GtkPicture;

/** */
struct GtkPictureClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.popover.Popover] is a bubble-like context popup.
    
    ![An example GtkPopover](popover.png)
    
    It is primarily meant to provide context-dependent information
    or options. Popovers are attached to a parent widget. By default,
    they point to the whole widget area, although this behavior can be
    changed with [gtk.popover.Popover.setPointingTo].
    
    The position of a popover relative to the widget it is attached to
    can also be changed with [gtk.popover.Popover.setPosition]
    
    By default, [gtk.popover.Popover] performs a grab, in order to ensure input
    events get redirected to it while it is shown, and also so the popover
    is dismissed in the expected situations (clicks outside the popover,
    or the Escape key being pressed). If no such modal behavior is desired
    on a popover, [gtk.popover.Popover.setAutohide] may be called on it to
    tweak its behavior.
    
    ## GtkPopover as menu replacement
    
    [gtk.popover.Popover] is often used to replace menus. The best was to do this
    is to use the [gtk.popover_menu.PopoverMenu] subclass which supports being
    populated from a [gio.menu_model.MenuModel] with [gtk.popover_menu.PopoverMenu.newFromModel].
    
    ```xml
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
    
    ```
    popover.background[.menu]
    ├── arrow
    ╰── contents
        ╰── <child>
    ```
    
    [gtk.popover.Popover] has a main node with name `popover`, an arrow with name `arrow`,
    and another node for the content named `contents`. The `popover` node always
    gets the `.background` style class. It also gets the `.menu` style class
    if the popover is menu-like, e.g. is a [gtk.popover_menu.PopoverMenu].
    
    Particular uses of [gtk.popover.Popover], such as touch selection popups or
    magnifiers in [gtk.entry.Entry] or [gtk.text_view.TextView] get style classes like
    `.touch-selection` or `.magnifier` to differentiate from plain popovers.
    
    When styling a popover directly, the `popover` node should usually
    not have any background. The visible part of the popover can have
    a shadow. To specify it in CSS, set the box-shadow of the `contents` node.
    
    Note that, in order to accomplish appropriate arrow visuals, [gtk.popover.Popover]
    uses custom drawing for the `arrow` node. This makes it possible for the
    arrow to change its shape dynamically, but it also limits the possibilities
    of styling it using CSS. In particular, the `arrow` gets drawn over the
    `content` node's border and shadow, so they look like one shape, which
    means that the border width of the `content` node and the `arrow` node should
    be the same. The arrow also does not support any border shape other than
    solid, no border-radius, only one border width (border-bottom-width is
    used) and no box-shadow.
*/
struct GtkPopover
{
  /** */
  GtkWidget parent;
}

/** */
struct GtkPopoverClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkPopover* popover) closed;

  /** */
  extern(C) void function(GtkPopover* popover) activateDefault;

  /** */
  void*[8] reserved;
}

/**
    [gtk.popover_menu.PopoverMenu] is a subclass of [gtk.popover.Popover] that implements menu
    behavior.
    
    ![An example GtkPopoverMenu](menu.png)
    
    [gtk.popover_menu.PopoverMenu] treats its children like menus and allows switching
    between them. It can open submenus as traditional, nested submenus,
    or in a more touch-friendly sliding fashion.
    The property [gtk.popover_menu.PopoverMenu.flags] controls this appearance.
    
    [gtk.popover_menu.PopoverMenu] is meant to be used primarily with menu models,
    using [gtk.popover_menu.PopoverMenu.newFromModel]. If you need to put
    other widgets such as a [gtk.spin_button.SpinButton] or a [gtk.switch_.Switch] into a popover,
    you can use [gtk.popover_menu.PopoverMenu.addChild].
    
    For more dialog-like behavior, use a plain [gtk.popover.Popover].
    
    ## Menu models
    
    The XML format understood by [gtk.builder.Builder] for [gio.menu_model.MenuModel] consists
    of a toplevel `<menu>` element, which contains one or more `<item>`
    elements. Each `<item>` element contains `<attribute>` and `<link>`
    elements with a mandatory name attribute. `<link>` elements have the
    same content model as `<menu>`. Instead of `<link name="submenu">`
    or `<link name="section">`, you can use `<submenu>` or `<section>`
    elements.
    
    ```xml
    <menu id='app-menu'>
      <section>
        <item>
          <attribute name='label' translatable='yes'>_New Window</attribute>
          <attribute name='action'>app.new</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_About Sunny</attribute>
          <attribute name='action'>app.about</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_Quit</attribute>
          <attribute name='action'>app.quit</attribute>
        </item>
      </section>
    </menu>
    ```
    
    Attribute values can be translated using gettext, like other [gtk.builder.Builder]
    content. `<attribute>` elements can be marked for translation with a
    `translatable="yes"` attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the [gtk.builder.Builder] must have been given the gettext
    domain to use.
    
    The following attributes are used when constructing menu items:
    
    $(LIST
      * "label": a user-visible string to display
      * "use-markup": whether the text in the menu item includes [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)
      * "action": the prefixed name of the action to trigger
      * "target": the parameter to use when activating the action
      * "icon" and "verb-icon": names of icons that may be displayed
      * "submenu-action": name of an action that may be used to track
           whether a submenu is open
      * "hidden-when": a string used to determine when the item will be hidden.
           Possible values include "action-disabled", "action-missing", "macos-menubar".
           This is mainly useful for exported menus, see [gtk.application.Application.setMenubar].
      * "custom": a string used to match against the ID of a custom child added with
           [gtk.popover_menu.PopoverMenu.addChild], [gtk.popover_menu_bar.PopoverMenuBar.addChild],
           or in the ui file with `<child type="ID">`.
    )
      
    The following attributes are used when constructing sections:
    
    $(LIST
      * "label": a user-visible string to use as section heading
      * "display-hint": a string used to determine special formatting for the section.
          Possible values include "horizontal-buttons", "circular-buttons" and
          "inline-buttons". They all indicate that section should be
          displayed as a horizontal row of buttons.
      * "text-direction": a string used to determine the [gtk.types.TextDirection] to use
          when "display-hint" is set to "horizontal-buttons". Possible values
          include "rtl", "ltr", and "none".
    )
      
    The following attributes are used when constructing submenus:
    
    $(LIST
      * "label": a user-visible string to display
      * "icon": icon name to display
    )
      
    Menu items will also show accelerators, which are usually associated
    with actions via [gtk.application.Application.setAccelsForAction],
    [gtk.widget_class.WidgetClass.addBindingAction] or
    [gtk.shortcut_controller.ShortcutController.addShortcut].
    
    # CSS Nodes
    
    [gtk.popover_menu.PopoverMenu] is just a subclass of [gtk.popover.Popover] that adds custom content
    to it, therefore it has the same CSS nodes. It is one of the cases that add
    a `.menu` style class to the main `popover` node.
    
    Menu items have nodes with name `button` and class `.model`. If a section
    display-hint is set, the section gets a node `box` with class `horizontal`
    plus a class with the same text as the display hint. Note that said box may
    not be the direct ancestor of the item `button`s. Thus, for example, to style
    items in an `inline-buttons` section, select `.inline-buttons button.model`.
    Other things that may be of interest to style in menus include `label` nodes.
    
    # Accessibility
    
    [gtk.popover_menu.PopoverMenu] uses the [gtk.types.AccessibleRole.Menu] role, and its
    items use the [gtk.types.AccessibleRole.MenuItem],
    [gtk.types.AccessibleRole.MenuItemCheckbox] or
    [gtk.types.AccessibleRole.MenuItemRadio] roles, depending on the
    action they are connected to.
*/
struct GtkPopoverMenu;

/**
    [gtk.popover_menu_bar.PopoverMenuBar] presents a horizontal bar of items that pop
    up popover menus when clicked.
    
    ![An example GtkPopoverMenuBar](menubar.png)
    
    The only way to create instances of [gtk.popover_menu_bar.PopoverMenuBar] is
    from a [gio.menu_model.MenuModel].
    
    # CSS nodes
    
    ```
    menubar
    ├── item[.active]
    ┊   ╰── popover
    ╰── item
        ╰── popover
    ```
    
    [gtk.popover_menu_bar.PopoverMenuBar] has a single CSS node with name menubar, below which
    each item has its CSS node, and below that the corresponding popover.
    
    The item whose popover is currently open gets the .active
    style class.
    
    # Accessibility
    
    [gtk.popover_menu_bar.PopoverMenuBar] uses the [gtk.types.AccessibleRole.MenuBar] role,
    the menu items use the [gtk.types.AccessibleRole.MenuItem] role and
    the menus use the [gtk.types.AccessibleRole.Menu] role.
*/
struct GtkPopoverMenuBar;

/** */
struct GtkPrintBackend;

/**
    A [gtk.print_context.PrintContext] encapsulates context information that is required when
    drawing pages for printing.
    
    This includes the cairo context and important parameters like page size
    and resolution. It also lets you easily create [pango.layout.Layout] and
    [pango.context.Context] objects that match the font metrics of the cairo surface.
    
    [gtk.print_context.PrintContext] objects get passed to the
    `signal@Gtk.PrintOperation::begin-print`,
    `signal@Gtk.PrintOperation::end-print`,
    `signal@Gtk.PrintOperation::request-page-setup` and
    `signal@Gtk.PrintOperation::draw-page` signals on the
    [gtk.print_operation.PrintOperation] object.
    
    ## Using GtkPrintContext in a ::draw-page callback
    
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
*/
struct GtkPrintContext;

/**
    A [gtk.print_dialog.PrintDialog] object collects the arguments that
    are needed to present a print dialog to the user, such
    as a title for the dialog and whether it should be modal.
    
    The dialog is shown with the [gtk.print_dialog.PrintDialog.setup] function.
    The actual printing can be done with [gtk.print_dialog.PrintDialog.print] or
    [gtk.print_dialog.PrintDialog.printFile]. These APIs follows the GIO async pattern,
    and the results can be obtained by calling the corresponding finish methods.
*/
struct GtkPrintDialog;

/** */
struct GtkPrintDialogClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A [gtk.print_job.PrintJob] object represents a job that is sent to a printer.
    
    You only need to deal directly with print jobs if you use the
    non-portable [gtk.print_unix_dialog.PrintUnixDialog] API.
    
    Use [gtk.print_job.PrintJob.getSurface] to obtain the cairo surface
    onto which the pages must be drawn. Use [gtk.print_job.PrintJob.send]
    to send the finished job to the printer. If you don’t use cairo
    [gtk.print_job.PrintJob] also supports printing of manually generated PostScript,
    via [gtk.print_job.PrintJob.setSourceFile].
*/
struct GtkPrintJob;

/**
    [gtk.print_operation.PrintOperation] is the high-level, portable printing API.
    
    It looks a bit different than other GTK dialogs such as the
    [gtk.file_chooser.FileChooser], since some platforms don’t expose enough
    infrastructure to implement a good print dialog. On such
    platforms, [gtk.print_operation.PrintOperation] uses the native print dialog.
    On platforms which do not provide a native print dialog, GTK
    uses its own, see [gtk.print_unix_dialog.PrintUnixDialog].
    
    The typical way to use the high-level printing API is to create
    a [gtk.print_operation.PrintOperation] object with [gtk.print_operation.PrintOperation.new_]
    when the user selects to print. Then you set some properties on it,
    e.g. the page size, any [gtk.print_settings.PrintSettings] from previous print
    operations, the number of pages, the current page, etc.
    
    Then you start the print operation by calling [gtk.print_operation.PrintOperation.run].
    It will then show a dialog, let the user select a printer and options.
    When the user finished the dialog, various signals will be emitted on
    the [gtk.print_operation.PrintOperation], the main one being
    `signal@Gtk.PrintOperation::draw-page`, which you are supposed to handle
    and render the page on the provided [gtk.print_context.PrintContext] using Cairo.
    
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
    
    By default [gtk.print_operation.PrintOperation] uses an external application to do
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
  void*[8] padding;
}

/**
    [gtk.print_operation_preview.PrintOperationPreview] is the interface that is used to
    implement print preview.
    
    A [gtk.print_operation_preview.PrintOperationPreview] object is passed to the
    [gtk.print_operation.PrintOperation.preview] signal by
    [gtk.print_operation.PrintOperation].
*/
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
    A [gtk.print_settings.PrintSettings] object represents the settings of a print dialog in
    a system-independent way.
    
    The main use for this object is that once you’ve printed you can get a
    settings object that represents the settings the user chose, and the next
    time you print you can pass that object in so that the user doesn’t have
    to re-set all his settings.
    
    Its also possible to enumerate the settings so that you can easily save
    the settings for the next time your app runs, or even store them in a
    document. The predefined keys try to use shared values as much as possible
    so that moving such a document between systems still works.
*/
struct GtkPrintSettings;

/**
    A [gtk.print_setup.PrintSetup] is an auxiliary object for printing that allows decoupling
    the setup from the printing.
    
    A print setup is obtained by calling [gtk.print_dialog.PrintDialog.setup],
    and can later be passed to print functions such as [gtk.print_dialog.PrintDialog.print].
    
    Print setups can be reused for multiple print calls.
    
    Applications may wish to store the page_setup and print_settings from the print setup
    and copy them to the PrintDialog if they want to keep using them.
*/
struct GtkPrintSetup;

/**
    [gtk.print_unix_dialog.PrintUnixDialog] implements a print dialog for platforms
    which don’t provide a native print dialog, like Unix.
    
    ![An example GtkPrintUnixDialog](printdialog.png)
    
    It can be used very much like any other GTK dialog, at the cost of
    the portability offered by the high-level printing API with
    [gtk.print_operation.PrintOperation].
    
    In order to print something with [gtk.print_unix_dialog.PrintUnixDialog], you need to
    use [gtk.print_unix_dialog.PrintUnixDialog.getSelectedPrinter] to obtain a
    [gtk.printer.Printer] object and use it to construct a [gtk.print_job.PrintJob]
    using [gtk.print_job.PrintJob.new_].
    
    [gtk.print_unix_dialog.PrintUnixDialog] uses the following response values:
    
    $(LIST
      * [gtk.types.ResponseType.Ok]: for the “Print” button
      * [gtk.types.ResponseType.Apply]: for the “Preview” button
      * [gtk.types.ResponseType.Cancel]: for the “Cancel” button
    )
      
    # GtkPrintUnixDialog as GtkBuildable
    
    The [gtk.print_unix_dialog.PrintUnixDialog] implementation of the [gtk.buildable.Buildable] interface
    exposes its @notebook internal children with the name “notebook”.
    
    An example of a [gtk.print_unix_dialog.PrintUnixDialog] UI definition fragment:
    
    ```xml
    <object class="GtkPrintUnixDialog" id="dialog1">
      <child internal-child="notebook">
        <object class="GtkNotebook" id="notebook">
          <child>
            <object type="GtkNotebookPage">
              <property name="tab_expand">False</property>
              <property name="tab_fill">False</property>
              <property name="tab">
                <object class="GtkLabel" id="tablabel">
                  <property name="label">Tab label</property>
                </object>
              </property>
              <property name="child">
                <object class="GtkLabel" id="tabcontent">
                  <property name="label">Content on notebook tab</property>
                </object>
              </property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    [gtk.print_unix_dialog.PrintUnixDialog] has a single CSS node with name window. The style classes
    dialog and print are added.
*/
struct GtkPrintUnixDialog;

/**
    A [gtk.printer.Printer] object represents a printer.
    
    You only need to deal directly with printers if you use the
    non-portable [gtk.print_unix_dialog.PrintUnixDialog] API.
    
    A [gtk.printer.Printer] allows to get status information about the printer,
    such as its description, its location, the number of queued jobs,
    etc. Most importantly, a [gtk.printer.Printer] object can be used to create
    a [gtk.print_job.PrintJob] object, which lets you print to the printer.
*/
struct GtkPrinter;

/**
    [gtk.progress_bar.ProgressBar] is typically used to display the progress of a long
    running operation.
    
    It provides a visual clue that processing is underway. [gtk.progress_bar.ProgressBar]
    can be used in two different modes: percentage mode and activity mode.
    
    ![An example GtkProgressBar](progressbar.png)
    
    When an application can determine how much work needs to take place
    (e.g. read a fixed number of bytes from a file) and can monitor its
    progress, it can use the [gtk.progress_bar.ProgressBar] in percentage mode and the
    user sees a growing bar indicating the percentage of the work that
    has been completed. In this mode, the application is required to call
    [gtk.progress_bar.ProgressBar.setFraction] periodically to update the progress bar.
    
    When an application has no accurate way of knowing the amount of work
    to do, it can use the [gtk.progress_bar.ProgressBar] in activity mode, which shows
    activity by a block moving back and forth within the progress area. In
    this mode, the application is required to call [gtk.progress_bar.ProgressBar.pulse]
    periodically to update the progress bar.
    
    There is quite a bit of flexibility provided to control the appearance
    of the [gtk.progress_bar.ProgressBar]. Functions are provided to control the orientation
    of the bar, optional text can be displayed along with the bar, and the
    step size used in activity mode can be set.
    
    # CSS nodes
    
    ```
    progressbar[.osd]
    ├── [text]
    ╰── trough[.empty][.full]
        ╰── progress[.pulse]
    ```
    
    [gtk.progress_bar.ProgressBar] has a main CSS node with name progressbar and subnodes with
    names text and trough, of which the latter has a subnode named progress. The
    text subnode is only present if text is shown. The progress subnode has the
    style class .pulse when in activity mode. It gets the style classes .left,
    .right, .top or .bottom added when the progress 'touches' the corresponding
    end of the GtkProgressBar. The .osd class on the progressbar node is for use
    in overlays like the one Epiphany has for page loading progress.
    
    # Accessibility
    
    [gtk.progress_bar.ProgressBar] uses the [gtk.types.AccessibleRole.ProgressBar] role.
*/
struct GtkProgressBar;

/**
    A [gobject.object.ObjectWrap] property value in a [gtk.expression.Expression].
*/
struct GtkPropertyExpression;

/**
    [gtk.range.Range] is the common base class for widgets which visualize an
    adjustment.
    
    Widgets that are derived from [gtk.range.Range] include
    [gtk.scale.Scale] and [gtk.scrollbar.Scrollbar].
    
    Apart from signals for monitoring the parameters of the adjustment,
    [gtk.range.Range] provides properties and methods for setting a
    “fill level” on range widgets. See [gtk.range.Range.setFillLevel].
*/
struct GtkRange
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkRangeClass
{
  /** */
  GtkWidgetClass parentClass;

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
  void*[8] padding;
}

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
    [gtk.recent_info.RecentInfo] contains the metadata associated with an item in the
    recently used files list.
*/
struct GtkRecentInfo;

/**
    [gtk.recent_manager.RecentManager] manages and looks up recently used files.
    
    Each recently used file is identified by its URI, and has meta-data
    associated to it, like the names and command lines of the applications
    that have registered it, the number of time each application has
    registered the same file, the mime type of the file and whether
    the file should be displayed only by the applications that have
    registered it.
    
    The recently used files list is per user.
    
    [gtk.recent_manager.RecentManager] acts like a database of all the recently
    used files. You can create new [gtk.recent_manager.RecentManager] objects, but
    it is more efficient to use the default manager created by GTK.
    
    Adding a new recently used file is as simple as:
    
    ```c
    GtkRecentManager *manager;
    
    manager = gtk_recent_manager_get_default ();
    gtk_recent_manager_add_item (manager, file_uri);
    ```
    
    The [gtk.recent_manager.RecentManager] will try to gather all the needed information
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
    [gtk.recent_manager.RecentManager.getItems], which returns a list of
    [gtk.recent_info.RecentInfo].
    
    Note that the maximum age of the recently used files list is
    controllable through the `property@Gtk.Settings:gtk-recent-files-max-age`
    property.
*/
struct GtkRecentManager
{
  /** */
  GObject parentInstance;

  /** */
  GtkRecentManagerPrivate* priv;
}

/**
    [gtk.recent_manager_class.RecentManagerClass] contains only private data.
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

/**
    Represents a request of a screen object in a given orientation. These
    are primarily used in container implementations when allocating a natural
    size for children calling. See `func@distribute_natural_allocation`.
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
    A [gtk.requisition.Requisition] represents the desired size of a widget. See
    [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
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
    A [gtk.revealer.Revealer] animates the transition of its child from invisible to visible.
    
    The style of transition can be controlled with
    [gtk.revealer.Revealer.setTransitionType].
    
    These animations respect the `property@Gtk.Settings:gtk-enable-animations`
    setting.
    
    # CSS nodes
    
    [gtk.revealer.Revealer] has a single CSS node with name revealer.
    When styling [gtk.revealer.Revealer] using CSS, remember that it only hides its contents,
    not itself. That means applied margin, padding and borders will be visible even
    when the `property@Gtk.Revealer:reveal-child` property is set to false.
    
    # Accessibility
    
    [gtk.revealer.Revealer] uses the [gtk.types.AccessibleRole.Group] role.
    
    The child of [gtk.revealer.Revealer], if set, is always available in the accessibility
    tree, regardless of the state of the revealer widget.
*/
struct GtkRevealer;

/**
    [gtk.root.Root] is the interface implemented by all widgets that can act as a toplevel
    widget.
    
    The root widget takes care of providing the connection to the windowing system
    and manages layout, drawing and event delivery for its widget hierarchy.
    
    The obvious example of a [gtk.root.Root] is [gtk.window.Window].
    
    To get the display to which a [gtk.root.Root] belongs, use
    [gtk.root.Root.getDisplay].
    
    [gtk.root.Root] also maintains the location of keyboard focus inside its widget
    hierarchy, with [gtk.root.Root.setFocus] and [gtk.root.Root.getFocus].
*/
struct GtkRoot;

/** */
struct GtkRootInterface;

/**
    A [gtk.scale.Scale] is a slider control used to select a numeric value.
    
    ![An example GtkScale](scales.png)
    
    To use it, you’ll probably want to investigate the methods on its base
    class, [gtk.range.Range], in addition to the methods for [gtk.scale.Scale] itself.
    To set the value of a scale, you would normally use [gtk.range.Range.setValue].
    To detect changes to the value, you would normally use the
    `signal@Gtk.Range::value-changed` signal.
    
    Note that using the same upper and lower bounds for the [gtk.scale.Scale] (through
    the [gtk.range.Range] methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    [gtk.scale.Scale] supports a custom `<marks>` element, which can contain multiple
    `<mark\>` elements. The “value” and “position” attributes have the same
    meaning as [gtk.scale.Scale.addMark] parameters of the same name. If
    the element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # CSS nodes
    
    ```
    scale[.fine-tune][.marks-before][.marks-after]
    ├── [value][.top][.right][.bottom][.left]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── marks.bottom
    │   ├── mark
    │   ┊    ├── indicator
    │   ┊    ╰── [label]
    ┊   ┊
    │   ╰── mark
    ╰── trough
        ├── [fill]
        ├── [highlight]
        ╰── slider
    ```
    
    [gtk.scale.Scale] has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gtk.scale.Scale.setHasOrigin]), there is
    a subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gtk.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the trough
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see `property@Gtk.Scale:draw-value`),
    there is subnode with name value. This node will get the .top or .bottom style
    classes similar to the marks node.
    
    # Accessibility
    
    [gtk.scale.Scale] uses the [gtk.types.AccessibleRole.Slider] role.
*/
struct GtkScale
{
  /** */
  GtkRange parentInstance;
}

/**
    [gtk.scale_button.ScaleButton] provides a button which pops up a scale widget.
    
    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [gtk.volume_button.VolumeButton] subclass that
    is tailored for this use case.
    
    # CSS nodes
    
    ```
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ```
    
    [gtk.scale_button.ScaleButton] has a single CSS node with name scalebutton and `.scale`
    style class, and contains a `button` node with a `.toggle` style class.
*/
struct GtkScaleButton
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkScaleButtonClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkScaleButton* button, double value) valueChanged;

  /** */
  void*[8] padding;
}

/** */
struct GtkScaleClass
{
  /** */
  GtkRangeClass parentClass;

  /** */
  extern(C) void function(GtkScale* scale, int* x, int* y) getLayoutOffsets;

  /** */
  void*[8] padding;
}

/**
    The [gtk.scroll_info.ScrollInfo] can be used to provide more accurate data on how a scroll
    operation should be performed.
    
    Scrolling functions usually allow passing a null scroll info which will cause
    the default values to be used and just scroll the element into view.
*/
struct GtkScrollInfo;

/**
    [gtk.scrollable.Scrollable] is an interface for widgets with native scrolling ability.
    
    To implement this interface you should override the
    [gtk.scrollable.Scrollable.hadjustment] and
    [gtk.scrollable.Scrollable.vadjustment] properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    $(LIST
      * When a parent widget sets the scrollable child widget’s adjustments,
        the widget should connect to the `signal@Gtk.Adjustment::value-changed`
        signal. The child widget should then populate the adjustments’ properties
        as soon as possible, which usually means queueing an allocation right away
        and populating the properties in the `vfunc@Gtk.Widget.size_allocate`
        implementation.
      
      * Because its preferred size is the size for a fully expanded widget,
        the scrollable widget must be able to cope with underallocations.
        This means that it must accept any value passed to its
        `vfunc@Gtk.Widget.size_allocate` implementation.
      
      * When the parent allocates space to the scrollable child widget,
        the widget must ensure the adjustments’ property values are correct and up
        to date, for example using [gtk.adjustment.Adjustment.configure].
      
      * When any of the adjustments emits the `signal@Gtk.Adjustment::value-changed`
        signal, the scrollable widget should scroll its contents.
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
    The [gtk.scrollbar.Scrollbar] widget is a horizontal or vertical scrollbar.
    
    ![An example GtkScrollbar](scrollbar.png)
    
    Its position and movement are controlled by the adjustment that is passed to
    or created by [gtk.scrollbar.Scrollbar.new_]. See [gtk.adjustment.Adjustment] for more
    details. The [gtk.adjustment.Adjustment.value] field sets the position of the
    thumb and must be between [gtk.adjustment.Adjustment.lower] and
    [gtk.adjustment.Adjustment.upper] - `property@Gtk.Adjustment:page-size`.
    The `property@Gtk.Adjustment:page-size` represents the size of the visible
    scrollable area.
    
    The fields `property@Gtk.Adjustment:step-increment` and
    `property@Gtk.Adjustment:page-increment` fields are added to or subtracted
    from the [gtk.adjustment.Adjustment.value] when the user asks to move by a step
    (using e.g. the cursor arrow keys) or by a page (using e.g. the Page Down/Up
    keys).
    
    # CSS nodes
    
    ```
    scrollbar
    ╰── range[.fine-tune]
        ╰── trough
            ╰── slider
    ```
    
    [gtk.scrollbar.Scrollbar] has a main CSS node with name scrollbar and a subnode for its
    contents. The main node gets the .horizontal or .vertical style classes applied,
    depending on the scrollbar's orientation.
    
    The range node gets the style class .fine-tune added when the scrollbar is
    in 'fine-tuning' mode.
    
    Other style classes that may be added to scrollbars inside
    [gtk.scrolled_window.ScrolledWindow] include the positional classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling (.overlay-indicator,
    .dragging, .hovering).
    
    # Accessibility
    
    [gtk.scrollbar.Scrollbar] uses the [gtk.types.AccessibleRole.Scrollbar] role.
*/
struct GtkScrollbar;

/**
    [gtk.scrolled_window.ScrolledWindow] is a container that makes its child scrollable.
    
    It does so using either internally added scrollbars or externally
    associated adjustments, and optionally draws a frame around the child.
    
    Widgets with native scrolling support, i.e. those whose classes implement
    the [gtk.scrollable.Scrollable] interface, are added directly. For other types
    of widget, the class [gtk.viewport.Viewport] acts as an adaptor, giving
    scrollability to other widgets. [gtk.scrolled_window.ScrolledWindow.setChild]
    intelligently accounts for whether or not the added child is a [gtk.scrollable.Scrollable].
    If it isn’t, then it wraps the child in a [gtk.viewport.Viewport]. Therefore, you can
    just add any child widget and not worry about the details.
    
    If [gtk.scrolled_window.ScrolledWindow.setChild] has added a [gtk.viewport.Viewport] for you,
    it will be automatically removed when you unset the child.
    Unless `property@Gtk.ScrolledWindow:hscrollbar-policy` and
    `property@Gtk.ScrolledWindow:vscrollbar-policy` are [gtk.types.PolicyType.Never] or
    [gtk.types.PolicyType.External], [gtk.scrolled_window.ScrolledWindow] adds internal [gtk.scrollbar.Scrollbar] widgets
    around its child. The scroll position of the child, and if applicable the
    scrollbars, is controlled by the [gtk.scrolled_window.ScrolledWindow.hadjustment]
    and [gtk.scrolled_window.ScrolledWindow.vadjustment] that are associated with the
    [gtk.scrolled_window.ScrolledWindow]. See the docs on [gtk.scrollbar.Scrollbar] for the details,
    but note that the “step_increment” and “page_increment” fields are only
    effective if the policy causes scrollbars to be present.
    
    If a [gtk.scrolled_window.ScrolledWindow] doesn’t behave quite as you would like, or
    doesn’t have exactly the right layout, it’s very possible to set up
    your own scrolling with [gtk.scrollbar.Scrollbar] and for example a [gtk.grid.Grid].
    
    # Touch support
    
    [gtk.scrolled_window.ScrolledWindow] has built-in support for touch devices. When a
    touchscreen is used, swiping will move the scrolled window, and will
    expose 'kinetic' behavior. This can be turned off with the
    `property@Gtk.ScrolledWindow:kinetic-scrolling` property if it is undesired.
    
    [gtk.scrolled_window.ScrolledWindow] also displays visual 'overshoot' indication when
    the content is pulled beyond the end, and this situation can be
    captured with the `signal@Gtk.ScrolledWindow::edge-overshot` signal.
    
    If no mouse device is present, the scrollbars will overlaid as
    narrow, auto-hiding indicators over the content. If traditional
    scrollbars are desired although no mouse is present, this behaviour
    can be turned off with the `property@Gtk.ScrolledWindow:overlay-scrolling`
    property.
    
    # CSS nodes
    
    [gtk.scrolled_window.ScrolledWindow] has a main CSS node with name scrolledwindow.
    It gets a .frame style class added when `property@Gtk.ScrolledWindow:has-frame`
    is true.
    
    It uses subnodes with names overshoot and undershoot to draw the overflow
    and underflow indications. These nodes get the .left, .right, .top or .bottom
    style class added depending on where the indication is drawn.
    
    [gtk.scrolled_window.ScrolledWindow] also sets the positional style classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling
    (.overlay-indicator, .dragging, .hovering) on its scrollbars.
    
    If both scrollbars are visible, the area where they meet is drawn
    with a subnode named junction.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.scrolled_window.ScrolledWindow] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.scrolled_window.ScrolledWindow] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkScrolledWindow;

/**
    [gtk.search_bar.SearchBar] is a container made to have a search entry.
    
    ![An example GtkSearchBar](search-bar.png)
    
    It can also contain additional widgets, such as drop-down menus,
    or buttons.  The search bar would appear when a search is started
    through typing on the keyboard, or the application’s search mode
    is toggled on.
    
    For keyboard presses to start a search, the search bar must be told
    of a widget to capture key events from through
    [gtk.search_bar.SearchBar.setKeyCaptureWidget]. This widget will
    typically be the top-level window, or a parent container of the
    search bar. Common shortcuts such as Ctrl+F should be handled as an
    application action, or through the menu items.
    
    You will also need to tell the search bar about which entry you
    are using as your search entry using [gtk.search_bar.SearchBar.connectEntry].
    
    ## Creating a search bar
    
    The following example shows you how to create a more complex search
    entry.
    
    [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c)
    
    # CSS nodes
    
    ```
    searchbar
    ╰── revealer
        ╰── box
             ├── [child]
             ╰── [button.close]
    ```
    
    [gtk.search_bar.SearchBar] has a main CSS node with name searchbar. It has a child
    node with name revealer that contains a node with name box. The box node
    contains both the CSS node of the child widget as well as an optional button
    node which gets the .close style class applied.
    
    # Accessibility
    
    [gtk.search_bar.SearchBar] uses the [gtk.types.AccessibleRole.Search] role.
*/
struct GtkSearchBar;

/**
    [gtk.search_entry.SearchEntry] is an entry widget that has been tailored for use
    as a search entry.
    
    The main API for interacting with a [gtk.search_entry.SearchEntry] as entry
    is the [gtk.editable.Editable] interface.
    
    ![An example GtkSearchEntry](search-entry.png)
    
    It will show an inactive symbolic “find” icon when the search
    entry is empty, and a symbolic “clear” icon when there is text.
    Clicking on the “clear” icon will empty the search entry.
    
    To make filtering appear more reactive, it is a good idea to
    not react to every change in the entry text immediately, but
    only after a short delay. To support this, [gtk.search_entry.SearchEntry]
    emits the `signal@Gtk.SearchEntry::search-changed` signal which
    can be used instead of the [gtk.editable.Editable.changed] signal.
    
    The `signal@Gtk.SearchEntry::previous-match`,
    `signal@Gtk.SearchEntry::next-match` and
    `signal@Gtk.SearchEntry::stop-search` signals can be used to
    implement moving between search results and ending the search.
    
    Often, [gtk.search_entry.SearchEntry] will be fed events by means of being
    placed inside a [gtk.search_bar.SearchBar]. If that is not the case,
    you can use [gtk.search_entry.SearchEntry.setKeyCaptureWidget] to
    let it capture key input from another widget.
    
    [gtk.search_entry.SearchEntry] provides only minimal API and should be used with
    the [gtk.editable.Editable] API.
    
    ## CSS Nodes
    
    ```
    entry.search
    ╰── text
    ```
    
    [gtk.search_entry.SearchEntry] has a single CSS node with name entry that carries
    a `.search` style class, and the text node is a child of that.
    
    ## Accessibility
    
    [gtk.search_entry.SearchEntry] uses the [gtk.types.AccessibleRole.SearchBox] role.
*/
struct GtkSearchEntry;

/**
    [gtk.section_model.SectionModel] is an interface that adds support for sections to list models.
    
    A [gtk.section_model.SectionModel] groups successive items into so-called sections. List widgets
    like [gtk.list_view.ListView] and [gtk.grid_view.GridView] then allow displaying section headers for
    these sections by installing a header factory.
    
    Many GTK list models support sections inherently, or they pass through the sections
    of a model they are wrapping.
    
    When the section groupings of a model change, the model will emit the
    `signal@Gtk.SectionModel::sections-changed` signal by calling the
    [gtk.section_model.SectionModel.sectionsChanged] function. All sections in the given range
    then need to be queried again.
    The `signal@Gio.ListModel::items-changed` signal has the same effect, all sections in
    that range are invalidated, too.
*/
struct GtkSectionModel;

/**
    The list of virtual functions for the [gtk.section_model.SectionModel] interface.
    No function must be implemented, but unless `GtkSectionModel::get_section()`
    is implemented, the whole model will just be a single section.
*/
struct GtkSectionModelInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Return the section that covers the given position. If
        the position is outside the number of items, returns a single range from
        n_items to G_MAXUINT
  */
  extern(C) void function(GtkSectionModel* self, uint position, uint* outStart, uint* outEnd) getSection;
}

/**
    [gtk.selection_filter_model.SelectionFilterModel] is a list model that presents the selection from
    a [gtk.selection_model.SelectionModel].
*/
struct GtkSelectionFilterModel;

/** */
struct GtkSelectionFilterModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.selection_model.SelectionModel] is an interface that add support for selection to list models.
    
    This support is then used by widgets using list models to add the ability
    to select and unselect various items.
    
    GTK provides default implementations of the most common selection modes such
    as [gtk.single_selection.SingleSelection], so you will only need to implement this
    interface if you want detailed control about how selections should be handled.
    
    A [gtk.selection_model.SelectionModel] supports a single boolean per item indicating if an item is
    selected or not. This can be queried via [gtk.selection_model.SelectionModel.isSelected].
    When the selected state of one or more items changes, the model will emit the
    `signal@Gtk.SelectionModel::selection-changed` signal by calling the
    [gtk.selection_model.SelectionModel.selectionChanged] function. The positions given
    in that signal may have their selection state changed, though that is not a
    requirement. If new items added to the model via the
    `signal@Gio.ListModel::items-changed` signal are selected or not is up to the
    implementation.
    
    Note that items added via `signal@Gio.ListModel::items-changed` may already
    be selected and no `signal@Gtk.SelectionModel::selection-changed` will be
    emitted for them. So to track which items are selected, it is necessary to
    listen to both signals.
    
    Additionally, the interface can expose functionality to select and unselect
    items. If these functions are implemented, GTK's list widgets will allow users
    to select and unselect items. However, [gtk.selection_model.SelectionModel]s are free to only
    implement them partially or not at all. In that case the widgets will not
    support the unimplemented operations.
    
    When selecting or unselecting is supported by a model, the return values of
    the selection functions do *not* indicate if selection or unselection happened.
    They are only meant to indicate complete failure, like when this mode of
    selecting is not supported by the model.
    
    Selections may happen asynchronously, so the only reliable way to find out
    when an item was selected is to listen to the signals that indicate selection.
*/
struct GtkSelectionModel;

/**
    The list of virtual functions for the [gtk.selection_model.SelectionModel] interface.
    No function must be implemented, but unless `GtkSelectionModel::is_selected()`
    is implemented, it will not be possible to select items in the set.
    
    The model does not need to implement any functions to support either
    selecting or unselecting items. Of course, if the model does not do that,
    it means that users cannot select or unselect items in a list widget
    using the model.
    
    All selection functions fall back to `GtkSelectionModel::set_selection()`
    so it is sufficient to implement just that function for full selection
    support.
*/
struct GtkSelectionModelInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Return if the item at the given position is selected.
  */
  extern(C) gboolean function(GtkSelectionModel* model, uint position) isSelected;

  /**
      Return a bitset with all currently selected
        items in the given range. By default, this function will call
        `GtkSelectionModel::is_selected()` on all items in the given range.
  */
  extern(C) GtkBitset* function(GtkSelectionModel* model, uint position, uint nItems) getSelectionInRange;

  /**
      Select the item in the given position. If the operation
        is known to fail, return false.
  */
  extern(C) gboolean function(GtkSelectionModel* model, uint position, gboolean unselectRest) selectItem;

  /**
      Unselect the item in the given position. If the
        operation is known to fail, return false.
  */
  extern(C) gboolean function(GtkSelectionModel* model, uint position) unselectItem;

  /**
      Select all items in the given range. If the operation
        is unsupported or known to fail for all items, return false.
  */
  extern(C) gboolean function(GtkSelectionModel* model, uint position, uint nItems, gboolean unselectRest) selectRange;

  /**
      Unselect all items in the given range. If the
        operation is unsupported or known to fail for all items, return
        false.
  */
  extern(C) gboolean function(GtkSelectionModel* model, uint position, uint nItems) unselectRange;

  /**
      Select all items in the model. If the operation is
        unsupported or known to fail for all items, return false.
  */
  extern(C) gboolean function(GtkSelectionModel* model) selectAll;

  /**
      Unselect all items in the model. If the operation is
        unsupported or known to fail for all items, return false.
  */
  extern(C) gboolean function(GtkSelectionModel* model) unselectAll;

  /**
      Set selection state of all items in mask to selected.
        See [gtk.selection_model.SelectionModel.setSelection] for a detailed explanation
        of this function.
  */
  extern(C) gboolean function(GtkSelectionModel* model, GtkBitset* selected, GtkBitset* mask) setSelection;
}

/**
    [gtk.separator.Separator] is a horizontal or vertical separator widget.
    
    ![An example GtkSeparator](separator.png)
    
    A [gtk.separator.Separator] can be used to group the widgets within a window.
    It displays a line with a shadow to make it appear sunken into the
    interface.
    
    # CSS nodes
    
    [gtk.separator.Separator] has a single CSS node with name separator. The node
    gets one of the .horizontal or .vertical style classes.
    
    # Accessibility
    
    [gtk.separator.Separator] uses the [gtk.types.AccessibleRole.Separator] role.
*/
struct GtkSeparator;

/**
    [gtk.settings.Settings] provides a mechanism to share global settings between
    applications.
    
    On the X window system, this sharing is realized by an
    [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
    manager that is usually part of the desktop environment, along with
    utilities that let the user change these settings.
    
    On Wayland, the settings are obtained either via a settings portal,
    or by reading desktop settings from DConf.
    
    On macOS, the settings are obtained from `NSUserDefaults`.
    
    In the absence of these sharing mechanisms, GTK reads default values for
    settings from `settings.ini` files in `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
    and `$XDG_CONFIG_HOME/gtk-4.0`. These files must be valid key files (see
    [glib.key_file.KeyFile]), and have a section called Settings. Themes can also provide
    default values for settings by installing a `settings.ini` file
    next to their `gtk.css` file.
    
    Applications can override system-wide settings by setting the property
    of the [gtk.settings.Settings] object with [gobject.object.ObjectWrap.set]. This should be restricted
    to special cases though; [gtk.settings.Settings] are not meant as an application
    configuration facility.
    
    There is one [gtk.settings.Settings] instance per display. It can be obtained with
    [gtk.settings.Settings.getForDisplay], but in many cases, it is more
    convenient to use [gtk.widget.Widget.getSettings].
*/
struct GtkSettings;

/**
    A [gtk.shortcut.Shortcut] describes a keyboard shortcut.
    
    It contains a description of how to trigger the shortcut via a
    [gtk.shortcut_trigger.ShortcutTrigger] and a way to activate the shortcut
    on a widget via a [gtk.shortcut_action.ShortcutAction].
    
    The actual work is usually done via [gtk.shortcut_controller.ShortcutController],
    which decides if and when to activate a shortcut. Using that controller
    directly however is rarely necessary as various higher level
    convenience APIs exist on [gtk.widget.Widget]s that make it easier to use
    shortcuts in GTK.
    
    [gtk.shortcut.Shortcut] does provide functionality to make it easy for users
    to work with shortcuts, either by providing informational strings
    for display purposes or by allowing shortcuts to be configured.
*/
struct GtkShortcut;

/**
    [gtk.shortcut_action.ShortcutAction] encodes an action that can be triggered by a
    keyboard shortcut.
    
    `GtkShortcutActions` contain functions that allow easy presentation
    to end users as well as being printed for debugging.
    
    All `GtkShortcutActions` are immutable, you can only specify their
    properties during construction. If you want to change a action, you
    have to replace it with a new one. If you need to pass arguments to
    an action, these are specified by the higher-level [gtk.shortcut.Shortcut] object.
    
    To activate a [gtk.shortcut_action.ShortcutAction] manually, [gtk.shortcut_action.ShortcutAction.activate]
    can be called.
    
    GTK provides various actions:
    
     $(LIST
        * [gtk.mnemonic_action.MnemonicAction]: a shortcut action that calls
          [gtk.widget.Widget.mnemonicActivate]
        * [gtk.callback_action.CallbackAction]: a shortcut action that invokes
          a given callback
        * [gtk.signal_action.SignalAction]: a shortcut action that emits a
          given signal
        * [gtk.activate_action.ActivateAction]: a shortcut action that calls
          [gtk.widget.Widget.activate]
        * [gtk.named_action.NamedAction]: a shortcut action that calls
          [gtk.widget.Widget.activateAction]
        * [gtk.nothing_action.NothingAction]: a shortcut action that does nothing
     )
*/
struct GtkShortcutAction;

/** */
struct GtkShortcutActionClass;

/** */
struct GtkShortcutClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.shortcut_controller.ShortcutController] is an event controller that manages shortcuts.
    
    Most common shortcuts are using this controller implicitly, e.g. by
    adding a mnemonic underline to a [gtk.label.Label], or by installing a key
    binding using [gtk.widget_class.WidgetClass.addBinding], or by adding accelerators
    to global actions using [gtk.application.Application.setAccelsForAction].
    
    But it is possible to create your own shortcut controller, and add
    shortcuts to it.
    
    [gtk.shortcut_controller.ShortcutController] implements [gio.list_model.ListModel] for querying the
    shortcuts that have been added to it.
    
    # GtkShortcutController as GtkBuildable
    
    [gtk.shortcut_controller.ShortcutController]s can be created in [gtk.builder.Builder] ui files, to set up
    shortcuts in the same place as the widgets.
    
    An example of a UI definition fragment with [gtk.shortcut_controller.ShortcutController]:
    ```xml
      <object class='GtkButton'>
        <child>
          <object class='GtkShortcutController'>
            <property name='scope'>managed</property>
            <child>
              <object class='GtkShortcut'>
                <property name='trigger'>&lt;Control&gt;k</property>
                <property name='action'>activate</property>
              </object>
            </child>
          </object>
        </child>
      </object>
    ```
    
    This example creates a [gtk.activate_action.ActivateAction] for triggering the
    `activate` signal of the [gtk.button.Button]. See [gtk.shortcut_action.ShortcutAction.parseString]
    for the syntax for other kinds of [gtk.shortcut_action.ShortcutAction]. See
    [gtk.shortcut_trigger.ShortcutTrigger.parseString] to learn more about the syntax
    for triggers.
*/
struct GtkShortcutController;

/** */
struct GtkShortcutControllerClass;

/**
    [gtk.shortcut_label.ShortcutLabel] displays a single keyboard shortcut or gesture.
    
    The main use case for [gtk.shortcut_label.ShortcutLabel] is inside a [gtk.shortcuts_window.ShortcutsWindow].
*/
struct GtkShortcutLabel;

/** */
struct GtkShortcutLabelClass;

/**
    The [gtk.shortcut_manager.ShortcutManager] interface is used to implement
    shortcut scopes.
    
    This is important for [gtk.native.Native] widgets that have their
    own surface, since the event controllers that are used to implement
    managed and global scopes are limited to the same native.
    
    Examples for widgets implementing [gtk.shortcut_manager.ShortcutManager] are
    [gtk.window.Window] and [gtk.popover.Popover].
    
    Every widget that implements [gtk.shortcut_manager.ShortcutManager] will be used as a
    [gtk.types.ShortcutScope.Managed].
*/
struct GtkShortcutManager;

/**
    The list of functions that can be implemented for the [gtk.shortcut_manager.ShortcutManager]
    interface.
    
    Note that no function is mandatory to implement, the default implementation
    will work fine.
*/
struct GtkShortcutManagerInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Add a [gtk.shortcut_controller.ShortcutController] to be managed.
  */
  extern(C) void function(GtkShortcutManager* self, GtkShortcutController* controller) addController;

  /**
      Remove a [gtk.shortcut_controller.ShortcutController] that had previously
        been added
  */
  extern(C) void function(GtkShortcutManager* self, GtkShortcutController* controller) removeController;
}

/**
    [gtk.shortcut_trigger.ShortcutTrigger] tracks how a [gtk.shortcut.Shortcut] should be activated.
    
    To find out if a [gtk.shortcut_trigger.ShortcutTrigger] triggers, you can call
    [gtk.shortcut_trigger.ShortcutTrigger.trigger] on a [gdk.event.Event].
    
    `GtkShortcutTriggers` contain functions that allow easy presentation
    to end users as well as being printed for debugging.
    
    All `GtkShortcutTriggers` are immutable, you can only specify their
    properties during construction. If you want to change a trigger, you
    have to replace it with a new one.
*/
struct GtkShortcutTrigger;

/** */
struct GtkShortcutTriggerClass;

/**
    A [gtk.shortcuts_group.ShortcutsGroup] represents a group of related keyboard shortcuts
    or gestures.
    
    The group has a title. It may optionally be associated with a view
    of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
    
    The recommended way to construct a [gtk.shortcuts_group.ShortcutsGroup] is with
    [gtk.builder.Builder], by using the `<child>` tag to populate a
    [gtk.shortcuts_group.ShortcutsGroup] with one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
    instances.
    
    If you need to add a shortcut programmatically, use
    [gtk.shortcuts_group.ShortcutsGroup.addShortcut].
*/
struct GtkShortcutsGroup;

/** */
struct GtkShortcutsGroupClass;

/**
    A [gtk.shortcuts_section.ShortcutsSection] collects all the keyboard shortcuts and gestures
    for a major application mode.
    
    If your application needs multiple sections, you should give each
    section a unique `property@Gtk.ShortcutsSection:section-name` and
    a [gtk.shortcuts_section.ShortcutsSection.title] that can be shown in the
    section selector of the [gtk.shortcuts_window.ShortcutsWindow].
    
    The `property@Gtk.ShortcutsSection:max-height` property can be used
    to influence how the groups in the section are distributed over pages
    and columns.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
    
    The recommended way to construct a [gtk.shortcuts_section.ShortcutsSection] is with
    [gtk.builder.Builder], by using the `<child>` tag to populate a
    [gtk.shortcuts_section.ShortcutsSection] with one or more [gtk.shortcuts_group.ShortcutsGroup]
    instances, which in turn contain one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
    objects.
    
    If you need to add a group programmatically, use
    [gtk.shortcuts_section.ShortcutsSection.addGroup].
*/
struct GtkShortcutsSection;

/** */
struct GtkShortcutsSectionClass;

/**
    A [gtk.shortcuts_shortcut.ShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
*/
struct GtkShortcutsShortcut;

/** */
struct GtkShortcutsShortcutClass;

/**
    A [gtk.shortcuts_window.ShortcutsWindow] shows information about the keyboard shortcuts
    and gestures of an application.
    
    The shortcuts can be grouped, and you can have multiple sections in this
    window, corresponding to the major modes of your application.
    
    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.
    
    The recommended way to construct a [gtk.shortcuts_window.ShortcutsWindow] is with
    [gtk.builder.Builder], by using the `<child>` tag to populate a
    [gtk.shortcuts_window.ShortcutsWindow] with one or more [gtk.shortcuts_section.ShortcutsSection] objects,
    which contain one or more [gtk.shortcuts_group.ShortcutsGroup] instances, which, in turn,
    contain [gtk.shortcuts_shortcut.ShortcutsShortcut] instances.
    
    If you need to add a section programmatically, use [gtk.shortcuts_window.ShortcutsWindow.addSection]
    instead of [gtk.window.Window.setChild], as the shortcuts window manages
    its children directly.
    
    # A simple example:
    
    ![](gedit-shortcuts.png)
    
    This example has as single section. As you can see, the shortcut groups
    are arranged in columns, and spread across several pages if there are too
    many to find on a single page.
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-gedit.ui).
    
    # An example with multiple views:
    
    ![](clocks-shortcuts.png)
    
    This example shows a [gtk.shortcuts_window.ShortcutsWindow] that has been configured to show only
    the shortcuts relevant to the "stopwatch" view.
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-clocks.ui).
    
    # An example with multiple sections:
    
    ![](builder-shortcuts.png)
    
    This example shows a [gtk.shortcuts_window.ShortcutsWindow] with two sections, "Editor Shortcuts"
    and "Terminal Shortcuts".
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-builder.ui).
    
    ## CSS nodes
    
    [gtk.shortcuts_window.ShortcutsWindow] has a single CSS node with the name `window` and style
    class `.shortcuts`.
*/
struct GtkShortcutsWindow;

/**
    A [gtk.shortcut.Shortcut]Action that emits a signal.
    
    Signals that are used in this way are referred to as keybinding signals,
    and they are expected to be defined with the `G_SIGNAL_ACTION` flag.
*/
struct GtkSignalAction;

/** */
struct GtkSignalActionClass;

/**
    [gtk.signal_list_item_factory.SignalListItemFactory] is a [gtk.list_item_factory.ListItemFactory] that emits signals
    to manage listitems.
    
    Signals are emitted for every listitem in the same order:
    
     1. [gtk.signal_list_item_factory.SignalListItemFactory.setup] is emitted to set up permanent
     things on the listitem. This usually means constructing the widgets used in
     the row and adding them to the listitem.
    
     2. [gtk.signal_list_item_factory.SignalListItemFactory.bind] is emitted to bind the item passed
     via [gtk.list_item.ListItem.item] to the widgets that have been created in
     step 1 or to add item-specific widgets. Signals are connected to listen to
     changes - both to changes in the item to update the widgets or to changes
     in the widgets to update the item. After this signal has been called, the
     listitem may be shown in a list widget.
    
     3. [gtk.signal_list_item_factory.SignalListItemFactory.unbind] is emitted to undo everything
     done in step 2. Usually this means disconnecting signal handlers. Once this
     signal has been called, the listitem will no longer be used in a list
     widget.
    
     4. [gtk.signal_list_item_factory.SignalListItemFactory.bind] and
     [gtk.signal_list_item_factory.SignalListItemFactory.unbind] may be emitted multiple times
     again to bind the listitem for use with new items. By reusing listitems,
     potentially costly setup can be avoided. However, it means code needs to
     make sure to properly clean up the listitem in step 3 so that no information
     from the previous use leaks into the next use.
    
    5. [gtk.signal_list_item_factory.SignalListItemFactory.teardown] is emitted to allow undoing
    the effects of [gtk.signal_list_item_factory.SignalListItemFactory.setup]. After this signal
    was emitted on a listitem, the listitem will be destroyed and not be used again.
    
    Note that during the signal emissions, changing properties on the
    listitems passed will not trigger notify signals as the listitem's
    notifications are frozen. See [gobject.object.ObjectWrap.freezeNotify] for details.
    
    For tracking changes in other properties in the listitem, the
    ::notify signal is recommended. The signal can be connected in the
    [gtk.signal_list_item_factory.SignalListItemFactory.setup] signal and removed again during
    [gtk.signal_list_item_factory.SignalListItemFactory.teardown].
*/
struct GtkSignalListItemFactory;

/** */
struct GtkSignalListItemFactoryClass;

/**
    [gtk.single_selection.SingleSelection] is a [gtk.selection_model.SelectionModel] that allows selecting a single
    item.
    
    Note that the selection is *persistent* -- if the selected item is removed
    and re-added in the same `signal@Gio.ListModel::items-changed` emission, it
    stays selected. In particular, this means that changing the sort order of an
    underlying sort model will preserve the selection.
*/
struct GtkSingleSelection;

/** */
struct GtkSingleSelectionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.size_group.SizeGroup] groups widgets together so they all request the same size.
    
    This is typically useful when you want a column of widgets to have the
    same size, but you can’t use a [gtk.grid.Grid].
    
    In detail, the size requested for each widget in a [gtk.size_group.SizeGroup] is
    the maximum of the sizes that would have been requested for each
    widget in the size group if they were not in the size group. The mode
    of the size group (see [gtk.size_group.SizeGroup.setMode]) determines whether
    this applies to the horizontal size, the vertical size, or both sizes.
    
    Note that size groups only affect the amount of space requested, not
    the size that the widgets finally receive. If you want the widgets in
    a [gtk.size_group.SizeGroup] to actually be the same size, you need to pack them in
    such a way that they get the size they request and not more.
    
    [gtk.size_group.SizeGroup] objects are referenced by each widget in the size group,
    so once you have added all widgets to a [gtk.size_group.SizeGroup], you can drop
    the initial reference to the size group with [gobject.object.ObjectWrap.unref]. If the
    widgets in the size group are subsequently destroyed, then they will
    be removed from the size group and drop their references on the size
    group; when all widgets have been removed, the size group will be
    freed.
    
    Widgets can be part of multiple size groups; GTK will compute the
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
    
    Widgets that trade height-for-width should set a reasonably large minimum
    width by way of `property@Gtk.Label:width-chars` for instance. Widgets with
    static sizes as well as widgets that grow (such as ellipsizing text) need no
    such considerations.
    
    # GtkSizeGroup as GtkBuildable
    
    Size groups can be specified in a UI definition by placing an `<object>`
    element with `class="GtkSizeGroup"` somewhere in the UI definition. The
    widgets that belong to the size group are specified by a `<widgets>` element
    that may contain multiple `<widget>` elements, one for each member of the
    size group. The ”name” attribute gives the id of the widget.
    
    An example of a UI definition fragment with [gtk.size_group.SizeGroup]:
    ```xml
    <object class="GtkSizeGroup">
      <property name="mode">horizontal</property>
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
}

/**
    [gtk.slice_list_model.SliceListModel] is a list model that presents a slice of another model.
    
    This is useful when implementing paging by setting the size to the number
    of elements per page and updating the offset whenever a different page is
    opened.
    
    [gtk.slice_list_model.SliceListModel] passes through sections from the underlying model.
*/
struct GtkSliceListModel;

/** */
struct GtkSliceListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.snapshot.Snapshot] assists in creating [gsk.render_node.RenderNode]s for widgets.
    
    It functions in a similar way to a cairo context, and maintains a stack
    of render nodes and their associated transformations.
    
    The node at the top of the stack is the one that `gtk_snapshot_append_…()`
    functions operate on. Use the `gtk_snapshot_push_…()` functions and
    [gtk.snapshot.Snapshot.pop] to change the current node.
    
    The typical way to obtain a [gtk.snapshot.Snapshot] object is as an argument to
    the `vfunc@Gtk.Widget.snapshot` vfunc. If you need to create your own
    [gtk.snapshot.Snapshot], use [gtk.snapshot.Snapshot.new_].
*/
struct GtkSnapshot;

/** */
struct GtkSnapshotClass;

/**
    A [gio.list_model.ListModel] that sorts the elements of an underlying model
    according to a [gtk.sorter.Sorter].
    
    The model is a stable sort. If two items compare equal according
    to the sorter, the one that appears first in the original model will
    also appear first after sorting.
    Note that if you change the sorter, the previous order will have no
    influence on the new order. If you want that, consider using a
    [gtk.multi_sorter.MultiSorter] and appending the previous sorter to it.
    
    The model can be set up to do incremental sorting, so that
    sorting long lists doesn't block the UI. See
    [gtk.sort_list_model.SortListModel.setIncremental] for details.
    
    [gtk.sort_list_model.SortListModel] is a generic model and because of that it
    cannot take advantage of any external knowledge when sorting.
    If you run into performance issues with [gtk.sort_list_model.SortListModel],
    it is strongly recommended that you write your own sorting list
    model.
    
    [gtk.sort_list_model.SortListModel] allows sorting the items into sections. It
    implements [gtk.section_model.SectionModel] and when `property@Gtk.SortListModel:section-sorter`
    is set, it will sort all items with that sorter and items comparing
    equal with it will be put into the same section.
    The [gtk.sort_list_model.SortListModel.sorter] will then be used to sort items
    inside their sections.
*/
struct GtkSortListModel;

/** */
struct GtkSortListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.sorter.Sorter] is an object to describe sorting criteria.
    
    Its primary user is [gtk.sort_list_model.SortListModel]
    
    The model will use a sorter to determine the order in which
    its items should appear by calling [gtk.sorter.Sorter.compare]
    for pairs of items.
    
    Sorters may change their sorting behavior through their lifetime.
    In that case, they will emit the [gtk.sorter.Sorter.changed] signal
    to notify that the sort order is no longer valid and should be updated
    by calling [gtk.sorter.Sorter.compare] again.
    
    GTK provides various pre-made sorter implementations for common sorting
    operations. [gtk.column_view.ColumnView] has built-in support for sorting lists
    via the [gtk.column_view_column.ColumnViewColumn.sorter] property, where the user can
    change the sorting by clicking on list headers.
    
    Of course, in particular for large lists, it is also possible to subclass
    [gtk.sorter.Sorter] and provide one's own sorter.
*/
struct GtkSorter
{
  /** */
  GObject parentInstance;
}

/**
    The virtual table for [gtk.sorter.Sorter].
*/
struct GtkSorterClass
{
  /** */
  GObjectClass parentClass;

  /**
      Compare two items. See [gtk.sorter.Sorter.compare] for details.
  */
  extern(C) GtkOrdering function(GtkSorter* self, GObject* item1, GObject* item2) compare;

  /**
      Get the `GtkSorderOrder` that applies to the current sorter.
        If unimplemented, it returns [gtk.types.SorterOrder.Partial].
  */
  extern(C) GtkSorterOrder function(GtkSorter* self) getOrder;

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
    A [gtk.spin_button.SpinButton] is an ideal way to allow the user to set the
    value of some attribute.
    
    ![An example GtkSpinButton](spinbutton.png)
    
    Rather than having to directly type a number into a [gtk.entry.Entry],
    [gtk.spin_button.SpinButton] allows the user to click on one of two arrows
    to increment or decrement the displayed value. A value can still be
    typed in, with the bonus that it can be checked to ensure it is in a
    given range.
    
    The main properties of a [gtk.spin_button.SpinButton] are through an adjustment.
    See the [gtk.adjustment.Adjustment] documentation for more details about
    an adjustment's properties.
    
    Note that [gtk.spin_button.SpinButton] will by default make its entry large enough
    to accommodate the lower and upper bounds of the adjustment. If this
    is not desired, the automatic sizing can be turned off by explicitly
    setting `property@Gtk.Editable:width-chars` to a value != -1.
    
    ## Using a GtkSpinButton to get an integer
    
    ```c
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.
    
    int
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
    
      window = gtk_window_new ();
    
      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_window_set_child (GTK_WINDOW (window), button);
    
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
    
    ## Using a GtkSpinButton to get a floating point value
    
    ```c
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.
    
    float
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
    
      window = gtk_window_new ();
    
      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_window_set_child (GTK_WINDOW (window), button);
    
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
    
    # CSS nodes
    
    ```
    spinbutton.horizontal
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ├── button.down
    ╰── button.up
    ```
    
    ```
    spinbutton.vertical
    ├── button.up
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ╰── button.down
    ```
    
    [gtk.spin_button.SpinButton]s main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The [gtk.text.Text] subnodes (if present) are put
    below the text node. The orientation of the spin button is reflected in
    the .vertical or .horizontal style class on the main node.
    
    # Accessibility
    
    [gtk.spin_button.SpinButton] uses the [gtk.types.AccessibleRole.SpinButton] role.
*/
struct GtkSpinButton;

/**
    A [gtk.spinner.Spinner] widget displays an icon-size spinning animation.
    
    It is often used as an alternative to a [gtk.progress_bar.ProgressBar]
    for displaying indefinite activity, instead of actual progress.
    
    ![An example GtkSpinner](spinner.png)
    
    To start the animation, use [gtk.spinner.Spinner.start], to stop it
    use [gtk.spinner.Spinner.stop].
    
    # CSS nodes
    
    [gtk.spinner.Spinner] has a single CSS node with the name spinner.
    When the animation is active, the :checked pseudoclass is
    added to this node.
*/
struct GtkSpinner;

/**
    [gtk.stack.Stack] is a container which only shows one of its children
    at a time.
    
    In contrast to [gtk.notebook.Notebook], [gtk.stack.Stack] does not provide a means
    for users to change the visible child. Instead, a separate widget
    such as [gtk.stack_switcher.StackSwitcher] or [gtk.stack_sidebar.StackSidebar] can
    be used with [gtk.stack.Stack] to provide this functionality.
    
    Transitions between pages can be animated as slides or fades. This
    can be controlled with [gtk.stack.Stack.setTransitionType].
    These animations respect the `property@Gtk.Settings:gtk-enable-animations`
    setting.
    
    [gtk.stack.Stack] maintains a [gtk.stack_page.StackPage] object for each added
    child, which holds additional per-child properties. You
    obtain the [gtk.stack_page.StackPage] for a child with [gtk.stack.Stack.getPage]
    and you can obtain a [gtk.selection_model.SelectionModel] containing all the pages
    with [gtk.stack.Stack.getPages].
    
    # GtkStack as GtkBuildable
    
    To set child-specific properties in a .ui file, create [gtk.stack_page.StackPage]
    objects explicitly, and set the child widget as a property on it:
    
    ```xml
      <object class="GtkStack" id="stack">
        <child>
          <object class="GtkStackPage">
            <property name="name">page1</property>
            <property name="title">In the beginning…</property>
            <property name="child">
              <object class="GtkLabel">
                <property name="label">It was dark</property>
              </object>
            </property>
          </object>
        </child>
    ```
    
    # CSS nodes
    
    [gtk.stack.Stack] has a single CSS node named stack.
    
    # Accessibility
    
    [gtk.stack.Stack] uses the [gtk.types.AccessibleRole.TabPanel] for the stack
    pages, which are the accessible parent objects of the child widgets.
*/
struct GtkStack;

/**
    [gtk.stack_page.StackPage] is an auxiliary class used by [gtk.stack.Stack].
*/
struct GtkStackPage;

/**
    A [gtk.stack_sidebar.StackSidebar] uses a sidebar to switch between [gtk.stack.Stack] pages.
    
    In order to use a [gtk.stack_sidebar.StackSidebar], you simply use a [gtk.stack.Stack] to
    organize your UI flow, and add the sidebar to your sidebar area. You
    can use [gtk.stack_sidebar.StackSidebar.setStack] to connect the [gtk.stack_sidebar.StackSidebar]
    to the [gtk.stack.Stack].
    
    # CSS nodes
    
    [gtk.stack_sidebar.StackSidebar] has a single CSS node with name stacksidebar and
    style class .sidebar.
    
    When circumstances require it, [gtk.stack_sidebar.StackSidebar] adds the
    .needs-attention style class to the widgets representing the stack
    pages.
*/
struct GtkStackSidebar;

/**
    The [gtk.stack_switcher.StackSwitcher] shows a row of buttons to switch between [gtk.stack.Stack]
    pages.
    
    ![An example GtkStackSwitcher](stackswitcher.png)
    
    It acts as a controller for the associated [gtk.stack.Stack].
    
    All the content for the buttons comes from the properties of the stacks
    [gtk.stack_page.StackPage] objects; the button visibility in a [gtk.stack_switcher.StackSwitcher]
    widget is controlled by the visibility of the child in the [gtk.stack.Stack].
    
    It is possible to associate multiple [gtk.stack_switcher.StackSwitcher] widgets
    with the same [gtk.stack.Stack] widget.
    
    # CSS nodes
    
    [gtk.stack_switcher.StackSwitcher] has a single CSS node named stackswitcher and
    style class .stack-switcher.
    
    When circumstances require it, [gtk.stack_switcher.StackSwitcher] adds the
    .needs-attention style class to the widgets representing the
    stack pages.
    
    # Accessibility
    
    [gtk.stack_switcher.StackSwitcher] uses the [gtk.types.AccessibleRole.TabList] role
    and uses the [gtk.types.AccessibleRole.Tab] for its buttons.
    
    # Orientable
    
    Since GTK 4.4, [gtk.stack_switcher.StackSwitcher] implements [gtk.orientable.Orientable] allowing
    the stack switcher to be made vertical with
    `[gtk.orientable.Orientable.setOrientation]`.
*/
struct GtkStackSwitcher;

/**
    A [gtk.statusbar.Statusbar] widget is usually placed along the bottom of an application's
    main [gtk.window.Window].
    
    ![An example GtkStatusbar](statusbar.png)
    
    A `GtkStatusBar` may provide a regular commentary of the application's
    status (as is usually the case in a web browser, for example), or may be
    used to simply output a message when the status changes, (when an upload
    is complete in an FTP client, for example).
    
    Status bars in GTK maintain a stack of messages. The message at
    the top of the each bar’s stack is the one that will currently be displayed.
    
    Any messages added to a statusbar’s stack must specify a context id that
    is used to uniquely identify the source of a message. This context id can
    be generated by [gtk.statusbar.Statusbar.getContextId], given a message and
    the statusbar that it will be added to. Note that messages are stored in a
    stack, and when choosing which message to display, the stack structure is
    adhered to, regardless of the context identifier of a message.
    
    One could say that a statusbar maintains one stack of messages for
    display purposes, but allows multiple message producers to maintain
    sub-stacks of the messages they produced (via context ids).
    
    Status bars are created using [gtk.statusbar.Statusbar.new_].
    
    Messages are added to the bar’s stack with [gtk.statusbar.Statusbar.push].
    
    The message at the top of the stack can be removed using
    [gtk.statusbar.Statusbar.pop]. A message can be removed from anywhere in the
    stack if its message id was recorded at the time it was added. This is done
    using [gtk.statusbar.Statusbar.remove].
    
    ## CSS node
    
    [gtk.statusbar.Statusbar] has a single CSS node with name `statusbar`.

    Deprecated: This widget will be removed in GTK 5
*/
struct GtkStatusbar;

/**
    [gtk.string_filter.StringFilter] determines whether to include items by comparing
    strings to a fixed search term.
    
    The strings are obtained from the items by evaluating a [gtk.expression.Expression]
    set with [gtk.string_filter.StringFilter.setExpression], and they are
    compared against a search term set with [gtk.string_filter.StringFilter.setSearch].
    
    [gtk.string_filter.StringFilter] has several different modes of comparison - it
    can match the whole string, just a prefix, or any substring. Use
    [gtk.string_filter.StringFilter.setMatchMode] choose a mode.
    
    It is also possible to make case-insensitive comparisons, with
    [gtk.string_filter.StringFilter.setIgnoreCase].
*/
struct GtkStringFilter;

/** */
struct GtkStringFilterClass
{
  /** */
  GtkFilterClass parentClass;
}

/**
    [gtk.string_list.StringList] is a list model that wraps an array of strings.
    
    The objects in the model are of type [gtk.string_object.StringObject] and have
    a "string" property that can be used inside expressions.
    
    [gtk.string_list.StringList] is well-suited for any place where you would
    typically use a `char*[]`, but need a list model.
    
    ## GtkStringList as GtkBuildable
    
    The [gtk.string_list.StringList] implementation of the [gtk.buildable.Buildable] interface
    supports adding items directly using the `<items>` element and
    specifying `<item>` elements for each item. Each `<item>` element
    supports the regular translation attributes “translatable”,
    “context” and “comments”.
    
    Here is a UI definition fragment specifying a [gtk.string_list.StringList]
    
    ```xml
    <object class="GtkStringList">
      <items>
        <item translatable="yes">Factory</item>
        <item translatable="yes">Home</item>
        <item translatable="yes">Subway</item>
      </items>
    </object>
    ```
*/
struct GtkStringList;

/** */
struct GtkStringListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.string_object.StringObject] is the type of items in a [gtk.string_list.StringList].
    
    A [gtk.string_object.StringObject] is a wrapper around a `const char*`; it has
    a [gtk.string_object.StringObject.string_] property that can be used
    for property bindings and expressions.
*/
struct GtkStringObject;

/** */
struct GtkStringObjectClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.string_sorter.StringSorter] is a [gtk.sorter.Sorter] that compares strings.
    
    It does the comparison in a linguistically correct way using the
    current locale by normalizing Unicode strings and possibly case-folding
    them before performing the comparison.
    
    To obtain the strings to compare, this sorter evaluates a
    [gtk.expression.Expression].
*/
struct GtkStringSorter;

/** */
struct GtkStringSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    [gtk.style_context.StyleContext] stores styling information affecting a widget.
    
    In order to construct the final style information, [gtk.style_context.StyleContext]
    queries information from all attached `GtkStyleProviders`. Style
    providers can be either attached explicitly to the context through
    [gtk.style_context.StyleContext.addProvider], or to the display through
    [gtk.style_context.StyleContext.addProviderForDisplay]. The resulting
    style is a combination of all providers’ information in priority order.
    
    For GTK widgets, any [gtk.style_context.StyleContext] returned by
    [gtk.widget.Widget.getStyleContext] will already have a [gdk.display.Display]
    and RTL/LTR information set. The style context will also be updated
    automatically if any of these settings change on the widget.
    
    ## Style Classes
    
    Widgets can add style classes to their context, which can be used to associate
    different styles by class. The documentation for individual widgets lists
    which style classes it uses itself, and which style classes may be added by
    applications to affect their appearance.
    
    # Custom styling in UI libraries and applications
    
    If you are developing a library with custom widgets that render differently
    than standard components, you may need to add a [gtk.style_provider.StyleProvider] yourself
    with the [gtk.types.STYLE_PROVIDER_PRIORITY_FALLBACK] priority, either a
    [gtk.css_provider.CssProvider] or a custom object implementing the [gtk.style_provider.StyleProvider]
    interface. This way themes may still attempt to style your UI elements in
    a different way if needed so.
    
    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use
    a [gtk.style_provider.StyleProvider] with the [gtk.types.STYLE_PROVIDER_PRIORITY_APPLICATION]
    priority, keep in mind that the user settings in
    `XDG_CONFIG_HOME/gtk-4.0/gtk.css` will
    still take precedence over your changes, as it uses the
    [gtk.types.STYLE_PROVIDER_PRIORITY_USER] priority.

    Deprecated: The relevant API has been moved to [gtk.widget.Widget]
        where applicable; otherwise, there is no replacement for querying the
        style machinery. Stylable UI elements should use widgets.
*/
struct GtkStyleContext
{
  /** */
  GObject parentObject;
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

/**
    [gtk.style_provider.StyleProvider] is an interface for style information used by
    [gtk.style_context.StyleContext].
    
    See [gtk.style_context.StyleContext.addProvider] and
    [gtk.style_context.StyleContext.addProviderForDisplay] for
    adding `GtkStyleProviders`.
    
    GTK uses the [gtk.style_provider.StyleProvider] implementation for CSS in
    [gtk.css_provider.CssProvider].
*/
struct GtkStyleProvider;

/**
    [gtk.switch_.Switch] is a "light switch" that has two states: on or off.
    
    ![An example GtkSwitch](switch.png)
    
    The user can control which state should be active by clicking the
    empty area, or by dragging the handle.
    
    [gtk.switch_.Switch] can also handle situations where the underlying state
    changes with a delay. In this case, the slider position indicates
    the user's recent change (as indicated by the [gtk.switch_.Switch.active]
    property), and the color indicates whether the underlying state (represented
    by the [gtk.switch_.Switch.state] property) has been updated yet.
    
    ![GtkSwitch with delayed state change](switch-state.png)
    
    See `signal@Gtk.Switch::state-set` for details.
    
    # CSS nodes
    
    ```
    switch
    ├── image
    ├── image
    ╰── slider
    ```
    
    [gtk.switch_.Switch] has four css nodes, the main node with the name switch and
    subnodes for the slider and the on and off images. Neither of them is
    using any style classes.
    
    # Accessibility
    
    [gtk.switch_.Switch] uses the [gtk.types.AccessibleRole.Switch] role.
*/
struct GtkSwitch;

/**
    [gtk.symbolic_paintable.SymbolicPaintable] is an interface that support symbolic colors in
    paintables.
    
    [gdk.paintable.Paintable]s implementing the interface will have the
    `vfunc@Gtk.SymbolicPaintable.snapshot_symbolic` function called and
    have the colors for drawing symbolic icons passed. At least 4 colors are guaranteed
    to be passed every time.
    
    These 4 colors are the foreground color, and the colors to use for errors, warnings
    and success information in that order.
    
    More colors may be added in the future.
*/
struct GtkSymbolicPaintable;

/**
    The list of virtual functions for the [gtk.symbolic_paintable.SymbolicPaintable] interface.
    No function must be implemented, default implementations exist for each one.
*/
struct GtkSymbolicPaintableInterface
{
  /** */
  GTypeInterface gIface;

  /**
      Snapshot the paintable using the given colors.
        See `GtkSymbolicPaintable::snapshot_symbolic()` for details.
        If this function is not implemented, `vfunc@Gdk.Paintable.snapshot`
        will be called.
  */
  extern(C) void function(GtkSymbolicPaintable* paintable, GdkSnapshot* snapshot, double width, double height, const(GdkRGBA)* colors, size_t nColors) snapshotSymbolic;
}

/**
    The [gtk.text.Text] widget is a single-line text entry widget.
    
    [gtk.text.Text] is the common implementation of single-line text editing
    that is shared between [gtk.entry.Entry], [gtk.password_entry.PasswordEntry],
    [gtk.spin_button.SpinButton], and other widgets. In all of these, [gtk.text.Text] is
    used as the delegate for the [gtk.editable.Editable] implementation.
    
    A fairly large set of key bindings are supported by default. If the
    entered text is longer than the allocation of the widget, the widget
    will scroll so that the cursor position is visible.
    
    When using an entry for passwords and other sensitive information,
    it can be put into “password mode” using [gtk.text.Text.setVisibility].
    In this mode, entered text is displayed using a “invisible” character.
    By default, GTK picks the best invisible character that is available
    in the current font, but it can be changed with
    [gtk.text.Text.setInvisibleChar].
    
    If you are looking to add icons or progress display in an entry, look
    at [gtk.entry.Entry]. There other alternatives for more specialized use
    cases, such as [gtk.search_entry.SearchEntry].
    
    If you need multi-line editable text, look at [gtk.text_view.TextView].
    
    # CSS nodes
    
    ```
    text[.read-only]
    ├── placeholder
    ├── undershoot.left
    ├── undershoot.right
    ├── [selection]
    ├── [block-cursor]
    ╰── [window.popup]
    ```
    
    [gtk.text.Text] has a main node with the name `text`. Depending on the properties
    of the widget, the `.read-only` style class may appear.
    
    When the entry has a selection, it adds a subnode with the name `selection`.
    
    When the entry is in overwrite mode, it adds a subnode with the name
    `block-cursor` that determines how the block cursor is drawn.
    
    The CSS node for a context menu is added as a subnode with the name `popup`.
    
    The `undershoot` nodes are used to draw the underflow indication when content
    is scrolled out of view. These nodes get the `.left` or `.right` style class
    added depending on where the indication is drawn.
    
    When touch is used and touch selection handles are shown, they are using
    CSS nodes with name `cursor-handle`. They get the `.top` or `.bottom` style
    class depending on where they are shown in relation to the selection. If
    there is just a single handle for the text cursor, it gets the style class
    `.insertion-cursor`.
    
    # Accessibility
    
    [gtk.text.Text] uses the [gtk.types.AccessibleRole.None] role, which causes it to be
    skipped for accessibility. This is because [gtk.text.Text] is expected to be used
    as a delegate for a [gtk.editable.Editable] implementation that will be represented
    to accessibility.
*/
struct GtkText
{
  /** */
  GtkWidget parentInstance;
}

/**
    Stores text and attributes for display in a [gtk.text_view.TextView].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    GtkTextBuffer can support undoing changes to the buffer
    content, see [gtk.text_buffer.TextBuffer.setEnableUndo].
*/
struct GtkTextBuffer
{
  /** */
  GObject parentInstance;

  /** */
  GtkTextBufferPrivate* priv;
}

/**
    The class structure for [gtk.text_buffer.TextBuffer].
*/
struct GtkTextBufferClass
{
  /**
      The object class structure needs to be the first.
  */
  GObjectClass parentClass;

  /**
      The class handler for the `GtkTextBuffer::insert-text` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* pos, const(char)* newText, int newTextLength) insertText;

  /**
      The class handler for the `GtkTextBuffer::insert-paintable` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* iter, GdkPaintable* paintable) insertPaintable;

  /**
      The class handler for the `GtkTextBuffer::insert-child-anchor` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* iter, GtkTextChildAnchor* anchor) insertChildAnchor;

  /**
      The class handler for the `GtkTextBuffer::delete-range` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextIter* start, GtkTextIter* end) deleteRange;

  /**
      The class handler for the `GtkTextBuffer::changed` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) changed;

  /**
      The class handler for the `GtkTextBuffer::modified-changed` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) modifiedChanged;

  /**
      The class handler for the `GtkTextBuffer::mark-set` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, const(GtkTextIter)* location, GtkTextMark* mark) markSet;

  /**
      The class handler for the `GtkTextBuffer::mark-deleted` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextMark* mark) markDeleted;

  /**
      The class handler for the `GtkTextBuffer::apply-tag` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) applyTag;

  /**
      The class handler for the `GtkTextBuffer::remove-tag` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GtkTextTag* tag, const(GtkTextIter)* start, const(GtkTextIter)* end) removeTag;

  /**
      The class handler for the `GtkTextBuffer::begin-user-action` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) beginUserAction;

  /**
      The class handler for the `GtkTextBuffer::end-user-action` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer) endUserAction;

  /**
      The class handler for the `GtkTextBuffer::paste-done` signal.
  */
  extern(C) void function(GtkTextBuffer* buffer, GdkClipboard* clipboard) pasteDone;

  /**
      The class handler for the `GtkTextBuffer::undo` signal
  */
  extern(C) void function(GtkTextBuffer* buffer) undo;

  /**
      The class handler for the `GtkTextBuffer::redo` signal
  */
  extern(C) void function(GtkTextBuffer* buffer) redo;

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

/**
    A [gtk.text_child_anchor.TextChildAnchor] is a spot in a [gtk.text_buffer.TextBuffer] where child widgets can
    be “anchored”.
    
    The anchor can have multiple widgets anchored, to allow for multiple views.
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
    An iterator for the contents of a [gtk.text_buffer.TextBuffer].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
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
    A [gtk.text_mark.TextMark] is a position in a `GtkTextbuffer` that is preserved
    across modifications.
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    A [gtk.text_mark.TextMark] is like a bookmark in a text buffer; it preserves
    a position in the text. You can convert the mark to an iterator using
    [gtk.text_buffer.TextBuffer.getIterAtMark]. Unlike iterators, marks remain
    valid across buffer mutations, because their behavior is defined when
    text is inserted or deleted. When text containing a mark is deleted,
    the mark remains in the position originally occupied by the deleted
    text. When text is inserted at a mark, a mark with “left gravity” will
    be moved to the beginning of the newly-inserted text, and a mark with
    “right gravity” will be moved to the end.
    
    Note that “left” and “right” here refer to logical direction (left
    is the toward the start of the buffer); in some languages such as
    Hebrew the logically-leftmost text is not actually on the left when
    displayed.
    
    Marks are reference counted, but the reference count only controls
    the validity of the memory; marks can be deleted from the buffer at
    any time with [gtk.text_buffer.TextBuffer.deleteMark]. Once deleted from
    the buffer, a mark is essentially useless.
    
    Marks optionally have names; these can be convenient to avoid passing
    the [gtk.text_mark.TextMark] object around.
    
    Marks are typically created using the [gtk.text_buffer.TextBuffer.createMark]
    function.
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
  void*[8] padding;
}

/**
    A tag that can be applied to text contained in a [gtk.text_buffer.TextBuffer].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    Tags should be in the [gtk.text_tag_table.TextTagTable] for a given
    [gtk.text_buffer.TextBuffer] before using them with that buffer.
    
    [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
    See “gtk4-demo” for numerous examples.
    
    For each property of [gtk.text_tag.TextTag], there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect
    whether a property has been set or not.
    
    They are maintained by GTK and you should not set them independently.
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
  void*[8] padding;
}

/** */
struct GtkTextTagPrivate;

/**
    The collection of tags in a [gtk.text_buffer.TextBuffer]
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    # GtkTextTagTables as GtkBuildable
    
    The [gtk.text_tag_table.TextTagTable] implementation of the [gtk.buildable.Buildable] interface
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
struct GtkTextTagTable;

/**
    A widget that displays the contents of a [gtk.text_buffer.TextBuffer].
    
    ![An example GtkTextview](multiline-text.png)
    
    You may wish to begin by reading the [conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types related to the
    text widget and how they work together.
    
    ## CSS nodes
    
    ```
    textview.view
    ├── border.top
    ├── border.left
    ├── text
    │   ╰── [selection]
    ├── border.right
    ├── border.bottom
    ╰── [window.popup]
    ```
    
    [gtk.text_view.TextView] has a main css node with name textview and style class .view,
    and subnodes for each of the border windows, and the main text area,
    with names border and text, respectively. The border nodes each get
    one of the style classes .left, .right, .top or .bottom.
    
    A node representing the selection will appear below the text node.
    
    If a context menu is opened, the window node will appear as a subnode
    of the main node.
    
    ## Accessibility
    
    [gtk.text_view.TextView] uses the [gtk.types.AccessibleRole.TextBox] role.
*/
struct GtkTextView
{
  /** */
  GtkWidget parentInstance;

  /** */
  GtkTextViewPrivate* priv;
}

/** */
struct GtkTextViewClass
{
  /**
      The object class structure needs to be the first
  */
  GtkWidgetClass parentClass;

  /**
      The class handler for the `GtkTextView::move-cursor`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, GtkMovementStep step, int count, gboolean extendSelection) moveCursor;

  /**
      The class handler for the `GtkTextView::set-anchor`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) setAnchor;

  /**
      The class handler for the `GtkTextView::insert-at-cursor`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, const(char)* str) insertAtCursor;

  /**
      The class handler for the `GtkTextView::delete-from-cursor`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView, GtkDeleteType type, int count) deleteFromCursor;

  /**
      The class handler for the `GtkTextView::backspace`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) backspace;

  /**
      The class handler for the `GtkTextView::cut-clipboard`
        keybinding signal
  */
  extern(C) void function(GtkTextView* textView) cutClipboard;

  /**
      The class handler for the `GtkTextView::copy-clipboard`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) copyClipboard;

  /**
      The class handler for the `GtkTextView::paste-clipboard`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) pasteClipboard;

  /**
      The class handler for the `GtkTextView::toggle-overwrite`
        keybinding signal.
  */
  extern(C) void function(GtkTextView* textView) toggleOverwrite;

  /**
      The create_buffer vfunc is called to create a [gtk.text_buffer.TextBuffer]
        for the text view. The default implementation is to just call
        [gtk.text_buffer.TextBuffer.new_].
  */
  extern(C) GtkTextBuffer* function(GtkTextView* textView) createBuffer;

  /**
      The snapshot_layer vfunc is called before and after the text
        view is drawing its own text. Applications can override this vfunc
        in a subclass to draw customized content underneath or above the
        text. In the [gtk.types.TextViewLayer.BelowText] and [gtk.types.TextViewLayer.AboveText]
        layers the drawing is done in the buffer coordinate space.
  */
  extern(C) void function(GtkTextView* textView, GtkTextViewLayer layer, GtkSnapshot* snapshot) snapshotLayer;

  /**
      The class handler for the `GtkTextView::extend-selection` signal.
  */
  extern(C) gboolean function(GtkTextView* textView, GtkTextExtendSelection granularity, const(GtkTextIter)* location, GtkTextIter* start, GtkTextIter* end) extendSelection;

  /**
      The class handler for the `GtkTextView::insert-emoji` signal.
  */
  extern(C) void function(GtkTextView* textView) insertEmoji;

  /** */
  void*[8] padding;
}

/** */
struct GtkTextViewPrivate;

/**
    A [gtk.toggle_button.ToggleButton] is a button which remains “pressed-in” when
    clicked.
    
    Clicking again will cause the toggle button to return to its normal state.
    
    A toggle button is created by calling either [gtk.toggle_button.ToggleButton.new_] or
    [gtk.toggle_button.ToggleButton.newWithLabel]. If using the former, it is advisable
    to pack a widget, (such as a [gtk.label.Label] and/or a [gtk.image.Image]), into the toggle
    button’s container. (See [gtk.button.Button] for more information).
    
    The state of a [gtk.toggle_button.ToggleButton] can be set specifically using
    [gtk.toggle_button.ToggleButton.setActive], and retrieved using
    [gtk.toggle_button.ToggleButton.getActive].
    
    To simply switch the state of a toggle button, use
    [gtk.toggle_button.ToggleButton.toggled].
    
    ## Grouping
    
    Toggle buttons can be grouped together, to form mutually exclusive
    groups - only one of the buttons can be toggled at a time, and toggling
    another one will switch the currently toggled one off.
    
    To add a [gtk.toggle_button.ToggleButton] to a group, use [gtk.toggle_button.ToggleButton.setGroup].
    
    ## CSS nodes
    
    [gtk.toggle_button.ToggleButton] has a single CSS node with name button. To differentiate
    it from a plain [gtk.button.Button], it gets the `.toggle` style class.
    
    ## Accessibility
    
    [gtk.toggle_button.ToggleButton] uses the [gtk.types.AccessibleRole.ToggleButton] role.
    
    ## Creating two [gtk.toggle_button.ToggleButton] widgets.
    
    ```c
    static void
    output_state (GtkToggleButton *source,
                  gpointer         user_data)
    {
      g_print ("Toggle button "%s" is active: %s",
               gtk_button_get_label (GTK_BUTTON (source)),
               gtk_toggle_button_get_active (source) ? "Yes" : "No");
    }
    
    static void
    make_toggles (void)
    {
      GtkWidget *window, *toggle1, *toggle2;
      GtkWidget *box;
      const char *text;
    
      window = gtk_window_new ();
      box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
    
      text = "Hi, I’m toggle button one";
      toggle1 = gtk_toggle_button_new_with_label (text);
    
      g_signal_connect (toggle1, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle1);
    
      text = "Hi, I’m toggle button two";
      toggle2 = gtk_toggle_button_new_with_label (text);
      g_signal_connect (toggle2, "toggled",
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle2);
    
      gtk_window_set_child (GTK_WINDOW (window), box);
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
*/
struct GtkToggleButton
{
  /** */
  GtkButton button;
}

/** */
struct GtkToggleButtonClass
{
  /** */
  GtkButtonClass parentClass;

  /** */
  extern(C) void function(GtkToggleButton* toggleButton) toggled;

  /** */
  void*[8] padding;
}

/**
    [gtk.tooltip.Tooltip] is an object representing a widget tooltip.
    
    Basic tooltips can be realized simply by using
    [gtk.widget.Widget.setTooltipText] or
    [gtk.widget.Widget.setTooltipMarkup] without
    any explicit tooltip object.
    
    When you need a tooltip with a little more fancy contents,
    like adding an image, or you want the tooltip to have different
    contents per [gtk.tree_view.TreeView] row or cell, you will have to do a
    little more work:
    
    $(LIST
      * Set the `property@Gtk.Widget:has-tooltip` property to true.
        This will make GTK monitor the widget for motion and related events
        which are needed to determine when and where to show a tooltip.
      
      * Connect to the `signal@Gtk.Widget::query-tooltip` signal.
        This signal will be emitted when a tooltip is supposed to be shown.
        One of the arguments passed to the signal handler is a [gtk.tooltip.Tooltip]
        object. This is the object that we are about to display as a tooltip,
        and can be manipulated in your callback using functions like
        [gtk.tooltip.Tooltip.setIcon]. There are functions for setting
        the tooltip’s markup, setting an image from a named icon, or even
        putting in a custom widget.
      
      * Return true from your ::query-tooltip handler. This causes the tooltip
        to be show. If you return false, it will not be shown.
    )
*/
struct GtkTooltip;

/**
    Interface for Drag-and-Drop destinations in [gtk.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.drop_target.DropTarget] to implement a drop destination
*/
struct GtkTreeDragDest;

/** */
struct GtkTreeDragDestIface
{
  /** */
  GTypeInterface gIface;

  /**
      Asks the [gtk.tree_drag_dest.TreeDragDest] to insert a row
         before the path dest, deriving the contents of the row from
         selection_data.
  */
  extern(C) gboolean function(GtkTreeDragDest* dragDest, GtkTreePath* dest, const(GValue)* value) dragDataReceived;

  /**
      Determines whether a drop is possible before
         the given dest_path, at the same depth as dest_path.
  */
  extern(C) gboolean function(GtkTreeDragDest* dragDest, GtkTreePath* destPath, const(GValue)* value) rowDropPossible;
}

/**
    Interface for Drag-and-Drop destinations in [gtk.tree_view.TreeView].

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.drag_source.DragSource] to implement a drag source
*/
struct GtkTreeDragSource;

/** */
struct GtkTreeDragSourceIface
{
  /** */
  GTypeInterface gIface;

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] whether a particular
         row can be used as the source of a DND operation.
  */
  extern(C) gboolean function(GtkTreeDragSource* dragSource, GtkTreePath* path) rowDraggable;

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] to fill in
         selection_data with a representation of the row at path.
  */
  extern(C) GdkContentProvider* function(GtkTreeDragSource* dragSource, GtkTreePath* path) dragDataGet;

  /**
      Asks the [gtk.tree_drag_source.TreeDragSource] to delete the row at
         path, because it was moved somewhere else via drag-and-drop.
  */
  extern(C) gboolean function(GtkTreeDragSource* dragSource, GtkTreePath* path) dragDataDelete;
}

/**
    [gtk.tree_expander.TreeExpander] is a widget that provides an expander for a list.
    
    It is typically placed as a bottommost child into a [gtk.list_view.ListView]
    to allow users to expand and collapse children in a list with a
    [gtk.tree_list_model.TreeListModel]. [gtk.tree_expander.TreeExpander] provides the common UI
    elements, gestures and keybindings for this purpose.
    
    On top of this, the "listitem.expand", "listitem.collapse" and
    "listitem.toggle-expand" actions are provided to allow adding custom
    UI for managing expanded state.
    
    It is important to mention that you want to set the
    [gtk.list_item.ListItem.focusable] property to FALSE when using this
    widget, as you want the keyboard focus to be in the treexpander, and not
    inside the list to make use of the keybindings.
    
    The [gtk.tree_list_model.TreeListModel] must be set to not be passthrough. Then it
    will provide [gtk.tree_list_row.TreeListRow] items which can be set via
    [gtk.tree_expander.TreeExpander.setListRow] on the expander.
    The expander will then watch that row item automatically.
    [gtk.tree_expander.TreeExpander.setChild] sets the widget that displays
    the actual row contents.
    
    [gtk.tree_expander.TreeExpander] can be modified with properties such as
    `property@Gtk.TreeExpander:indent-for-icon`,
    `property@Gtk.TreeExpander:indent-for-depth`, and
    `property@Gtk.TreeExpander:hide-expander` to achieve a different appearance.
    This can even be done to influence individual rows, for example by binding
    the `property@Gtk.TreeExpander:hide-expander` property to the item count of
    the model of the treelistrow, to hide the expander for rows without children,
    even if the row is expandable.
    
    ## CSS nodes
    
    ```
    treeexpander
    ├── [indent]*
    ├── [expander]
    ╰── <child>
    ```
    
    [gtk.tree_expander.TreeExpander] has zero or one CSS nodes with the name "expander" that
    should display the expander icon. The node will be `:checked` when it
    is expanded. If the node is not expandable, an "indent" node will be
    displayed instead.
    
    For every level of depth, another "indent" node is prepended.
    
    ## Accessibility
    
    Until GTK 4.10, [gtk.tree_expander.TreeExpander] used the [gtk.types.AccessibleRole.Group] role.
    
    Since GTK 4.12, [gtk.tree_expander.TreeExpander] uses the [gtk.types.AccessibleRole.Button] role.
    Toggling it will change the [gtk.types.AccessibleState.Expanded] state.
*/
struct GtkTreeExpander;

/** */
struct GtkTreeExpanderClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    The [gtk.tree_iter.TreeIter] is the primary structure
    for accessing a [gtk.tree_model.TreeModel]. Models are expected to put a unique
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
    [gtk.tree_list_model.TreeListModel] is a list model that can create child models on demand.
*/
struct GtkTreeListModel;

/** */
struct GtkTreeListModelClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.tree_list_row.TreeListRow] is used by [gtk.tree_list_model.TreeListModel] to represent items.
    
    It allows navigating the model as a tree and modify the state of rows.
    
    [gtk.tree_list_row.TreeListRow] instances are created by a [gtk.tree_list_model.TreeListModel] only
    when the [gtk.tree_list_model.TreeListModel.passthrough] property is not set.
    
    There are various support objects that can make use of [gtk.tree_list_row.TreeListRow]
    objects, such as the [gtk.tree_expander.TreeExpander] widget that allows displaying
    an icon to expand or collapse a row or [gtk.tree_list_row_sorter.TreeListRowSorter] that
    makes it possible to sort trees properly.
*/
struct GtkTreeListRow;

/** */
struct GtkTreeListRowClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.tree_list_row_sorter.TreeListRowSorter] is a special-purpose sorter that will apply a given
    sorter to the levels in a tree.
    
    Here is an example for setting up a column view with a tree model and
    a `GtkTreeListSorter`:
    
    ```c
    column_sorter = gtk_column_view_get_sorter (view);
    sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new (sort_model);
    gtk_column_view_set_model (view, G_LIST_MODEL (selection));
    ```
*/
struct GtkTreeListRowSorter;

/** */
struct GtkTreeListRowSorterClass
{
  /** */
  GtkSorterClass parentClass;
}

/**
    The tree interface used by GtkTreeView
    
    The [gtk.tree_model.TreeModel] interface defines a generic tree interface for
    use by the [gtk.tree_view.TreeView] widget. It is an abstract interface, and
    is designed to be usable with any appropriate data structure. The
    programmer just has to implement this interface on their own data
    type for it to be viewable by a [gtk.tree_view.TreeView] widget.
    
    The model is represented as a hierarchical tree of strongly-typed,
    columned data. In other words, the model can be seen as a tree where
    every node has different values depending on which column is being
    queried. The type of data found in a column is determined by using
    the GType system (ie. `G_TYPE_INT`, `GTK_TYPE_BUTTON`, `G_TYPE_POINTER`,
    etc). The types are homogeneous per column across all nodes. It is
    important to note that this interface only provides a way of examining
    a model and observing changes. The implementation of each individual
    model decides how and if changes are made.
    
    In order to make life simpler for programmers who do not need to
    write their own specialized model, two generic models are provided
    — the [gtk.tree_store.TreeStore] and the [gtk.list_store.ListStore]. To use these, the
    developer simply pushes data into these models as necessary. These
    models provide the data structure as well as all appropriate tree
    interfaces. As a result, implementing drag and drop, sorting, and
    storing data is trivial. For the vast majority of trees and lists,
    these two models are sufficient.
    
    Models are accessed on a node/column level of granularity. One can
    query for the value of a model at a certain node and a certain
    column on that node. There are two structures used to reference a
    particular node in a model. They are the [gtk.tree_path.TreePath] and
    the [gtk.tree_iter.TreeIter] (“iter” is short for iterator). Most of the
    interface consists of operations on a [gtk.tree_iter.TreeIter].
    
    A path is essentially a potential node. It is a location on a model
    that may or may not actually correspond to a node on a specific
    model. A [gtk.tree_path.TreePath] can be converted into either an
    array of unsigned integers or a string. The string form is a list
    of numbers separated by a colon. Each number refers to the offset
    at that level. Thus, the path `0` refers to the root
    node and the path `2:4` refers to the fifth child of
    the third node.
    
    By contrast, a [gtk.tree_iter.TreeIter] is a reference to a specific node on
    a specific model. It is a generic struct with an integer and three
    generic pointers. These are filled in by the model in a model-specific
    way. One can convert a path to an iterator by calling
    [gtk.tree_model.TreeModel.getIter]. These iterators are the primary way
    of accessing a model and are similar to the iterators used by
    [gtk.text_buffer.TextBuffer]. They are generally statically allocated on the
    stack and only used for a short time. The model interface defines
    a set of operations using them for navigating the model.
    
    It is expected that models fill in the iterator with private data.
    For example, the [gtk.list_store.ListStore] model, which is internally a simple
    linked list, stores a list node in one of the pointers. The
    [gtk.tree_model.TreeModel]Sort stores an array and an offset in two of the
    pointers. Additionally, there is an integer field. This field is
    generally filled with a unique stamp per model. This stamp is for
    catching errors resulting from using invalid iterators with a model.
    
    The lifecycle of an iterator can be a little confusing at first.
    Iterators are expected to always be valid for as long as the model
    is unchanged (and doesn’t emit a signal). The model is considered
    to own all outstanding iterators and nothing needs to be done to
    free them from the user’s point of view. Additionally, some models
    guarantee that an iterator is valid for as long as the node it refers
    to is valid (most notably the [gtk.tree_store.TreeStore] and [gtk.list_store.ListStore]).
    Although generally uninteresting, as one always has to allow for
    the case where iterators do not persist beyond a signal, some very
    important performance enhancements were made in the sort model.
    As a result, the [gtk.types.TreeModelFlags.ItersPersist] flag was added to
    indicate this behavior.
    
    To help show some common operation of a model, some examples are
    provided. The first example shows three ways of getting the iter at
    the location `3:2:5`. While the first method shown is
    easier, the second is much more common, as you often get paths from
    callbacks.
    
    ## Acquiring a [gtk.tree_iter.TreeIter]
    
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
    shown, as it is specific to the [gtk.list_store.ListStore]. For information on
    how to write such a function, see the [gtk.list_store.ListStore] documentation.
    
    ## Reading data from a [gtk.tree_model.TreeModel]
    
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
    int row_count = 0;
    
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
       char *str_data;
       int    int_data;
    
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
    
    The [gtk.tree_model.TreeModel] interface contains two methods for reference
    counting: [gtk.tree_model.TreeModel.refNode] and [gtk.tree_model.TreeModel.unrefNode].
    These two methods are optional to implement. The reference counting
    is meant as a way for views to let models know when nodes are being
    displayed. [gtk.tree_view.TreeView] will take a reference on a node when it is
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

    Deprecated: Use [gio.list_model.ListModel] instead
*/
struct GtkTreeModel;

/**
    A [gtk.tree_model.TreeModel] which hides parts of an underlying tree model
    
    A [gtk.tree_model_filter.TreeModelFilter] is a tree model which wraps another tree model,
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
        in a [gtk.tree_path.TreePath] indicating the root node for the filter at construction
        time.
    )
      
    The basic API is similar to [gtk.tree_model_sort.TreeModelSort]. For an example on its usage,
    see the section on [gtk.tree_model_sort.TreeModelSort].
    
    When using [gtk.tree_model_filter.TreeModelFilter], it is important to realize that
    [gtk.tree_model_filter.TreeModelFilter] maintains an internal cache of all nodes which are
    visible in its clients. The cache is likely to be a subtree of the tree
    exposed by the child model. [gtk.tree_model_filter.TreeModelFilter] will not cache the entire
    child model when unnecessary to not compromise the caching mechanism
    that is exposed by the reference counting scheme. If the child model
    implements reference counting, unnecessary signals may not be emitted
    because of reference counting rule 3, see the [gtk.tree_model.TreeModel]
    documentation. (Note that e.g. [gtk.tree_store.TreeStore] does not implement
    reference counting and will always emit all signals, even when
    the receiving node is not visible).
    
    Because of this, limitations for possible visible functions do apply.
    In general, visible functions should only use data or properties from
    the node for which the visibility state must be determined, its siblings
    or its parents. Usually, having a dependency on the state of any child
    node is not possible, unless references are taken on these explicitly.
    When no such reference exists, no signals may be received for these child
    nodes (see reference counting rule number 3 in the [gtk.tree_model.TreeModel] section).
    
    Determining the visibility state of a given node based on the state
    of its child nodes is a frequently occurring use case. Therefore,
    [gtk.tree_model_filter.TreeModelFilter] explicitly supports this. For example, when a node
    does not have any children, you might not want the node to be visible.
    As soon as the first row is added to the node’s child level (or the
    last row removed), the node’s visibility should be updated.
    
    This introduces a dependency from the node on its child nodes. In order
    to accommodate this, [gtk.tree_model_filter.TreeModelFilter] must make sure the necessary
    signals are received from the child model. This is achieved by building,
    for all nodes which are exposed as visible nodes to [gtk.tree_model_filter.TreeModelFilter]'s
    clients, the child level (if any) and take a reference on the first node
    in this level. Furthermore, for every row-inserted, row-changed or
    row-deleted signal (also these which were not handled because the node
    was not cached), [gtk.tree_model_filter.TreeModelFilter] will check if the visibility state
    of any parent node has changed.
    
    Beware, however, that this explicit support is limited to these two
    cases. For example, if you want a node to be visible only if two nodes
    in a child’s child level (2 levels deeper) are visible, you are on your
    own. In this case, either rely on [gtk.tree_store.TreeStore] to emit all signals
    because it does not implement reference counting, or for models that
    do implement reference counting, obtain references on these child levels
    yourself.

    Deprecated: Use [gtk.filter_list_model.FilterListModel] instead.
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
  void*[8] padding;
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
      Get [gtk.types.TreeModelFlags] supported by this interface.
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
      Gets a newly-created [gtk.tree_path.TreePath] referenced by iter.
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
    A GtkTreeModel which makes an underlying tree model sortable
    
    The [gtk.tree_model_sort.TreeModelSort] is a model which implements the [gtk.tree_sortable.TreeSortable]
    interface.  It does not hold any data itself, but rather is created with
    a child model and proxies its data.  It has identical column types to
    this child model, and the changes in the child are propagated.  The
    primary purpose of this model is to provide a way to sort a different
    model without modifying it. Note that the sort function used by
    [gtk.tree_model_sort.TreeModelSort] is not guaranteed to be stable.
    
    The use of this is best demonstrated through an example.  In the
    following sample code we create two [gtk.tree_view.TreeView] widgets each with a
    view of the same data.  As the model is wrapped here by a
    [gtk.tree_model_sort.TreeModelSort], the two [gtk.tree_view.TreeView]s can each sort their
    view of the data without affecting the other.  By contrast, if we
    simply put the same model in each widget, then sorting the first would
    sort the second.
    
    ## Using a [gtk.tree_model_sort.TreeModelSort]
    
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
    model, the next example will be a callback for the [gtk.tree_selection.TreeSelection]
    `GtkTreeSelection::changed` signal.  In this callback, we get a string
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

    Deprecated: Use [gtk.sort_list_model.SortListModel] instead
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
  void*[8] padding;
}

/** */
struct GtkTreeModelSortPrivate;

/**
    An opaque structure representing a path to a row in a model.
*/
struct GtkTreePath;

/**
    A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [gtk.tree_path.TreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with [gtk.tree_row_reference.TreeRowReference.new_].

    Deprecated: Use [gio.list_model.ListModel] instead
*/
struct GtkTreeRowReference;

/**
    The selection object for GtkTreeView
    
    The [gtk.tree_selection.TreeSelection] object is a helper object to manage the selection
    for a [gtk.tree_view.TreeView] widget.  The [gtk.tree_selection.TreeSelection] object is
    automatically created when a new [gtk.tree_view.TreeView] widget is created, and
    cannot exist independently of this widget.  The primary reason the
    [gtk.tree_selection.TreeSelection] objects exists is for cleanliness of code and API.
    That is, there is no conceptual reason all these functions could not be
    methods on the [gtk.tree_view.TreeView] widget instead of a separate function.
    
    The [gtk.tree_selection.TreeSelection] object is gotten from a [gtk.tree_view.TreeView] by calling
    [gtk.tree_view.TreeView.getSelection].  It can be manipulated to check the
    selection status of the tree, as well as select and deselect individual
    rows.  Selection is done completely view side.  As a result, multiple
    views of the same model can have completely different selections.
    Additionally, you cannot change the selection of a row on the model that
    is not currently displayed by the view without expanding its parents
    first.
    
    One of the important things to remember when monitoring the selection of
    a view is that the [gtk.tree_selection.TreeSelection]::changed signal is mostly a hint.
    That is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a [gtk.tree_selection.TreeSelection]::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row).

    Deprecated: Use [gtk.selection_model.SelectionModel] instead
*/
struct GtkTreeSelection;

/**
    The interface for sortable models used by GtkTreeView
    
    [gtk.tree_sortable.TreeSortable] is an interface to be implemented by tree models which
    support sorting. The [gtk.tree_view.TreeView] uses the methods provided by this interface
    to sort the model.

    Deprecated: There is no replacement for this interface. You should
        use [gtk.sort_list_model.SortListModel] to wrap your list model instead
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
    A tree-like data structure that can be used with the [gtk.tree_view.TreeView].
    
    The [gtk.tree_store.TreeStore] object is a list model for use with a [gtk.tree_view.TreeView]
    widget. It implements the [gtk.tree_model.TreeModel] interface, and consequently,
    can use all of the methods available there. It also implements the
    [gtk.tree_sortable.TreeSortable] interface so it can be sorted by the view.
    Finally, it also implements the tree [drag][gtk.tree_drag_source.TreeDragSource]
    and [drop][gtk.tree_drag_dest.TreeDragDest] interfaces.
    
    [gtk.tree_store.TreeStore] is deprecated since GTK 4.10, and should not be used in newly
    written code. You should use [gtk.tree_list_model.TreeListModel] for a tree-like model
    object.
    
    ## GtkTreeStore as GtkBuildable
    
    The GtkTreeStore implementation of the [gtk.buildable.Buildable] interface allows
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

    Deprecated: Use [gtk.tree_list_model.TreeListModel] instead
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
  void*[8] padding;
}

/** */
struct GtkTreeStorePrivate;

/**
    A widget for displaying both trees and lists
    
    Widget that displays any object that implements the [gtk.tree_model.TreeModel] interface.
    
    Please refer to the [tree widget conceptual overview](section-tree-widget.html)
    for an overview of all the objects and data types related to the tree
    widget and how they work together.
    
    ## Coordinate systems in GtkTreeView API
    
    Several different coordinate systems are exposed in the [gtk.tree_view.TreeView] API.
    These are:
    
    ![](tree-view-coordinates.png)
    
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
    
    ## [gtk.tree_view.TreeView] as [gtk.buildable.Buildable]
    
    The [gtk.tree_view.TreeView] implementation of the [gtk.buildable.Buildable] interface accepts
    [gtk.tree_view_column.TreeViewColumn] objects as `<child>` elements and exposes the
    internal [gtk.tree_selection.TreeSelection] in UI definitions.
    
    An example of a UI definition fragment with [gtk.tree_view.TreeView]:
    
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
    
    ## CSS nodes
    
    ```
    treeview.view
    ├── header
    │   ├── button
    │   │   ╰── [sort-indicator]
    ┊   ┊
    │   ╰── button
    │       ╰── [sort-indicator]
    │
    ├── [rubberband]
    ╰── [dndtarget]
    ```
    
    [gtk.tree_view.TreeView] has a main CSS node with name `treeview` and style class `.view`.
    It has a subnode with name `header`, which is the parent for all the column
    header widgets' CSS nodes.
    
    Each column header consists of a `button`, which among other content, has a
    child with name `sort-indicator`, which carries the `.ascending` or `.descending`
    style classes when the column header should show a sort indicator. The CSS
    is expected to provide a suitable image using the `-gtk-icon-source` property.
    
    For rubberband selection, a subnode with name `rubberband` is used.
    
    For the drop target location during DND, a subnode with name `dndtarget` is used.

    Deprecated: Use [gtk.list_view.ListView] for lists, and [gtk.column_view.ColumnView]
        for tabular lists
*/
struct GtkTreeView
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkTreeViewClass
{
  /** */
  GtkWidgetClass parentClass;

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
  extern(C) gboolean function(GtkTreeView* treeView, GtkMovementStep step, int count, gboolean extend, gboolean modify) moveCursor;

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
  void*[16] Reserved;
}

/**
    A visible column in a [gtk.tree_view.TreeView] widget
    
    The [gtk.tree_view_column.TreeViewColumn] object represents a visible column in a [gtk.tree_view.TreeView] widget.
    It allows to set properties of the column header, and functions as a holding pen
    for the cell renderers which determine how the data in the column is displayed.
    
    Please refer to the [tree widget conceptual overview](section-tree-widget.html)
    for an overview of all the objects and data types related to the tree widget and
    how they work together, and to the [gtk.tree_view.TreeView] documentation for specifics
    about the CSS node structure for treeviews and their headers.

    Deprecated: Use [gtk.column_view.ColumnView] and [gtk.column_view_column.ColumnViewColumn]
        instead of [gtk.tree_view.TreeView] to show a tabular list
*/
struct GtkTreeViewColumn;

/**
    A [gtk.uri_launcher.UriLauncher] object collects the arguments that are needed to open a uri
    with an application.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gtk.uri_launcher.UriLauncher.launch] function.
    This API follows the GIO async pattern, and the result can be obtained by
    calling [gtk.uri_launcher.UriLauncher.launchFinish].
    
    To launch a file, use [gtk.file_launcher.FileLauncher].
*/
struct GtkUriLauncher;

/** */
struct GtkUriLauncherClass
{
  /** */
  GObjectClass parentClass;
}

/**
    [gtk.video.Video] is a widget to show a [gtk.media_stream.MediaStream] with media controls.
    
    ![An example GtkVideo](video.png)
    
    The controls are available separately as [gtk.media_controls.MediaControls].
    If you just want to display a video without controls, you can treat it
    like any other paintable and for example put it into a [gtk.picture.Picture].
    
    [gtk.video.Video] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does
    not have support for video overlays, multichannel audio, device
    selection, or input. If you are writing a full-fledged video player,
    you may want to use the [gdk.paintable.Paintable] API and a media framework
    such as Gstreamer directly.
*/
struct GtkVideo;

/** */
struct GtkVideoClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.viewport.Viewport] implements scrollability for widgets that lack their
    own scrolling capabilities.
    
    Use [gtk.viewport.Viewport] to scroll child widgets such as [gtk.grid.Grid],
    [gtk.box.Box], and so on.
    
    The [gtk.viewport.Viewport] will start scrolling content only if allocated
    less than the child widget’s minimum size in a given orientation.
    
    # CSS nodes
    
    [gtk.viewport.Viewport] has a single CSS node with name `viewport`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.viewport.Viewport] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.viewport.Viewport] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkViewport;

/**
    [gtk.volume_button.VolumeButton] is a [gtk.scale_button.ScaleButton] subclass tailored for
    volume control.
    
    ![An example GtkVolumeButton](volumebutton.png)

    Deprecated: This widget will be removed in GTK 5
*/
struct GtkVolumeButton
{
  /** */
  GtkScaleButton parent;
}

/**
    The base class for all widgets.
    
    [gtk.widget.Widget] is the base class all widgets in GTK derive from. It manages the
    widget lifecycle, layout, states and style.
    
    ### Height-for-width Geometry Management
    
    GTK uses a height-for-width (and width-for-height) geometry management
    system. Height-for-width means that a widget can change how much
    vertical space it needs, depending on the amount of horizontal space
    that it is given (and similar for width-for-height). The most common
    example is a label that reflows to fill up the available width, wraps
    to fewer lines, and therefore needs less height.
    
    Height-for-width geometry management is implemented in GTK by way
    of two virtual methods:
    
    $(LIST
      * `vfunc@Gtk.Widget.get_request_mode`
      * `vfunc@Gtk.Widget.measure`
    )
      
    There are some important things to keep in mind when implementing
    height-for-width and when using it in widget implementations.
    
    If you implement a direct [gtk.widget.Widget] subclass that supports
    height-for-width or width-for-height geometry management for itself
    or its child widgets, the `vfunc@Gtk.Widget.get_request_mode` virtual
    function must be implemented as well and return the widget's preferred
    request mode. The default implementation of this virtual function
    returns [gtk.types.SizeRequestMode.ConstantSize], which means that the widget will
    only ever get -1 passed as the for_size value to its
    `vfunc@Gtk.Widget.measure` implementation.
    
    The geometry management system will query a widget hierarchy in
    only one orientation at a time. When widgets are initially queried
    for their minimum sizes it is generally done in two initial passes
    in the [gtk.types.SizeRequestMode] chosen by the toplevel.
    
    For example, when queried in the normal [gtk.types.SizeRequestMode.HeightForWidth] mode:
    
    First, the default minimum and natural width for each widget
    in the interface will be computed using [gtk.widget.Widget.measure] with an
    orientation of [gtk.types.Orientation.Horizontal] and a for_size of -1.
    Because the preferred widths for each widget depend on the preferred
    widths of their children, this information propagates up the hierarchy,
    and finally a minimum and natural width is determined for the entire
    toplevel. Next, the toplevel will use the minimum width to query for the
    minimum height contextual to that width using [gtk.widget.Widget.measure] with an
    orientation of [gtk.types.Orientation.Vertical] and a for_size of the just computed
    width. This will also be a highly recursive operation. The minimum height
    for the minimum width is normally used to set the minimum size constraint
    on the toplevel.
    
    After the toplevel window has initially requested its size in both
    dimensions it can go on to allocate itself a reasonable size (or a size
    previously specified with [gtk.window.Window.setDefaultSize]). During the
    recursive allocation process it’s important to note that request cycles
    will be recursively executed while widgets allocate their children.
    Each widget, once allocated a size, will go on to first share the
    space in one orientation among its children and then request each child's
    height for its target allocated width or its width for allocated height,
    depending. In this way a [gtk.widget.Widget] will typically be requested its size
    a number of times before actually being allocated a size. The size a
    widget is finally allocated can of course differ from the size it has
    requested. For this reason, [gtk.widget.Widget] caches a  small number of results
    to avoid re-querying for the same sizes in one allocation cycle.
    
    If a widget does move content around to intelligently use up the
    allocated size then it must support the request in both
    [gtk.types.SizeRequestMode]s even if the widget in question only
    trades sizes in a single orientation.
    
    For instance, a [gtk.label.Label] that does height-for-width word wrapping
    will not expect to have `vfunc@Gtk.Widget.measure` with an orientation of
    [gtk.types.Orientation.Vertical] called because that call is specific to a
    width-for-height request. In this case the label must return the height
    required for its own minimum possible width. By following this rule any
    widget that handles height-for-width or width-for-height requests will
    always be allocated at least enough space to fit its own content.
    
    Here are some examples of how a [gtk.types.SizeRequestMode.HeightForWidth] widget
    generally deals with width-for-height requests:
    
    ```c
    static void
    foo_widget_measure (GtkWidget      *widget,
                        GtkOrientation  orientation,
                        int             for_size,
                        int            *minimum_size,
                        int            *natural_size,
                        int            *minimum_baseline,
                        int            *natural_baseline)
    {
      if (orientation == GTK_ORIENTATION_HORIZONTAL)
        {
          // Calculate minimum and natural width
        }
      else // VERTICAL
        {
          if (i_am_in_height_for_width_mode)
            {
              int min_width, dummy;
    
              // First, get the minimum width of our widget
              GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_HORIZONTAL, -1,
                                                      &min_width, &dummy, &dummy, &dummy);
    
              // Now use the minimum width to retrieve the minimum and natural height to display
              // that width.
              GTK_WIDGET_GET_CLASS (widget)->measure (widget, GTK_ORIENTATION_VERTICAL, min_width,
                                                      minimum_size, natural_size, &dummy, &dummy);
            }
          else
            {
              // ... some widgets do both.
            }
        }
    }
    ```
    
    Often a widget needs to get its own request during size request or
    allocation. For example, when computing height it may need to also
    compute width. Or when deciding how to use an allocation, the widget
    may need to know its natural size. In these cases, the widget should
    be careful to call its virtual methods directly, like in the code
    example above.
    
    It will not work to use the wrapper function [gtk.widget.Widget.measure]
    inside your own `vfunc@Gtk.Widget.size_allocate` implementation.
    These return a request adjusted by [gtk.size_group.SizeGroup], the widget's
    align and expand flags, as well as its CSS style.
    
    If a widget used the wrappers inside its virtual method implementations,
    then the adjustments (such as widget margins) would be applied
    twice. GTK therefore does not allow this and will warn if you try
    to do it.
    
    Of course if you are getting the size request for another widget, such
    as a child widget, you must use [gtk.widget.Widget.measure]; otherwise, you
    would not properly consider widget margins, [gtk.size_group.SizeGroup], and
    so forth.
    
    GTK also supports baseline vertical alignment of widgets. This
    means that widgets are positioned such that the typographical baseline of
    widgets in the same row are aligned. This happens if a widget supports
    baselines, has a vertical alignment using baselines, and is inside
    a widget that supports baselines and has a natural “row” that it aligns to
    the baseline, or a baseline assigned to it by the grandparent.
    
    Baseline alignment support for a widget is also done by the
    `vfunc@Gtk.Widget.measure` virtual function. It allows you to report
    both a minimum and natural size.
    
    If a widget ends up baseline aligned it will be allocated all the space in
    the parent as if it was [gtk.types.Align.Fill], but the selected baseline can be
    found via [gtk.widget.Widget.getBaseline]. If the baseline has a
    value other than -1 you need to align the widget such that the baseline
    appears at the position.
    
    ### GtkWidget as GtkBuildable
    
    The [gtk.widget.Widget] implementation of the [gtk.buildable.Buildable] interface
    supports various custom elements to specify additional aspects of widgets
    that are not directly expressed as properties.
    
    If the widget uses a [gtk.layout_manager.LayoutManager], [gtk.widget.Widget] supports
    a custom `<layout>` element, used to define layout properties:
    
    ```xml
    <object class="GtkGrid" id="my_grid">
      <child>
        <object class="GtkLabel" id="label1">
          <property name="label">Description</property>
          <layout>
            <property name="column">0</property>
            <property name="row">0</property>
            <property name="row-span">1</property>
            <property name="column-span">1</property>
          </layout>
        </object>
      </child>
      <child>
        <object class="GtkEntry" id="description_entry">
          <layout>
            <property name="column">1</property>
            <property name="row">0</property>
            <property name="row-span">1</property>
            <property name="column-span">1</property>
          </layout>
        </object>
      </child>
    </object>
    ```
    
    [gtk.widget.Widget] allows style information such as style classes to
    be associated with widgets, using the custom `<style>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <style>
        <class name="my-special-button-class"/>
        <class name="dark-button"/>
      </style>
    </object>
    ```
    
    [gtk.widget.Widget] allows defining accessibility information, such as properties,
    relations, and states, using the custom `<accessibility>` element:
    
    ```xml
    <object class="GtkButton" id="button1">
      <accessibility>
        <property name="label">Download</property>
        <relation name="labelled-by">label1</relation>
      </accessibility>
    </object>
    ```
    
    ### Building composite widgets from template XML
    
    `GtkWidget `exposes some facilities to automate the procedure
    of creating composite widgets using "templates".
    
    To create composite widgets with [gtk.builder.Builder] XML, one must associate
    the interface description with the widget class at class initialization
    time using [gtk.widget_class.WidgetClass.setTemplate].
    
    The interface description semantics expected in composite template descriptions
    is slightly different from regular [gtk.builder.Builder] XML.
    
    Unlike regular interface descriptions, [gtk.widget_class.WidgetClass.setTemplate]
    will expect a `<template>` tag as a direct child of the toplevel
    `<interface>` tag. The `<template>` tag must specify the “class” attribute
    which must be the type name of the widget. Optionally, the “parent”
    attribute may be specified to specify the direct parent type of the widget
    type; this is ignored by [gtk.builder.Builder] but can be used by UI design tools to
    introspect what kind of properties and internal children exist for a given
    type when the actual type does not exist.
    
    The XML which is contained inside the `<template>` tag behaves as if it were
    added to the `<object>` tag defining the widget itself. You may set properties
    on a widget by inserting `<property>` tags into the `<template>` tag, and also
    add `<child>` tags to add children and extend a widget in the normal way you
    would with `<object>` tags.
    
    Additionally, `<object>` tags can also be added before and after the initial
    `<template>` tag in the normal way, allowing one to define auxiliary objects
    which might be referenced by other widgets declared as children of the
    `<template>` tag.
    
    Since, unlike the `<object>` tag, the `<template>` tag does not contain an
    “id” attribute, if you need to refer to the instance of the object itself that
    the template will create, simply refer to the template class name in an
    applicable element content.
    
    Here is an example of a template definition, which includes an example of
    this in the `<signal>` tag:
    
    ```xml
    <interface>
      <template class="FooWidget" parent="GtkBox">
        <property name="orientation">horizontal</property>
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
    bundled with your project, using [gio.resource.Resource]. In order to load the
    template, you need to call [gtk.widget_class.WidgetClass.setTemplateFromResource]
    from the class initialization of your [gtk.widget.Widget] type:
    
    ```c
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
    
      gtk_widget_class_set_template_from_resource (GTK_WIDGET_CLASS (klass),
                                                   "/com/example/ui/foowidget.ui");
    }
    ```
    
    You will also need to call [gtk.widget.Widget.initTemplate] from the
    instance initialization function:
    
    ```c
    static void
    foo_widget_init (FooWidget *self)
    {
      gtk_widget_init_template (GTK_WIDGET (self));
    
      // Initialize the rest of the widget...
    }
    ```
    
    as well as calling [gtk.widget.Widget.disposeTemplate] from the dispose
    function:
    
    ```c
    static void
    foo_widget_dispose (GObject *gobject)
    {
      FooWidget *self = FOO_WIDGET (gobject);
    
      // Dispose objects for which you have a reference...
    
      // Clear the template children for this widget type
      gtk_widget_dispose_template (GTK_WIDGET (self), FOO_TYPE_WIDGET);
    
      G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);
    }
    ```
    
    You can access widgets defined in the template using the
    [gtk.widget.Widget.getTemplateChild] function, but you will typically declare
    a pointer in the instance private data structure of your type using the same
    name as the widget in the template definition, and call
    [gtk.widget_class.WidgetClass.bindTemplateChildFull] (or one of its wrapper macros
    `func@Gtk.widget_class_bind_template_child` and `func@Gtk.widget_class_bind_template_child_private`)
    with that name, e.g.
    
    ```c
    typedef struct {
      GtkWidget *hello_button;
      GtkWidget *goodbye_button;
    } FooWidgetPrivate;
    
    G_DEFINE_TYPE_WITH_PRIVATE (FooWidget, foo_widget, GTK_TYPE_BOX)
    
    static void
    foo_widget_dispose (GObject *gobject)
    {
      gtk_widget_dispose_template (GTK_WIDGET (gobject), FOO_TYPE_WIDGET);
    
      G_OBJECT_CLASS (foo_widget_parent_class)->dispose (gobject);
    }
    
    static void
    foo_widget_class_init (FooWidgetClass *klass)
    {
      // ...
      G_OBJECT_CLASS (klass)->dispose = foo_widget_dispose;
    
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
      gtk_widget_init_template (GTK_WIDGET (widget));
    }
    ```
    
    You can also use [gtk.widget_class.WidgetClass.bindTemplateCallbackFull] (or
    is wrapper macro `func@Gtk.widget_class_bind_template_callback`) to connect
    a signal callback defined in the template with a function visible in the
    scope of the class, e.g.
    
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
      Signal emitted when widget is shown
  */
  extern(C) void function(GtkWidget* widget) show;

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
        [gdk.surface.Surface], which means that [gtk.widget.Widget.realize] has been called or
        the widget has been mapped (that is, it is going to be drawn).
  */
  extern(C) void function(GtkWidget* widget) realize;

  /**
      Signal emitted when the GdkSurface associated with
        widget is destroyed, which means that [gtk.widget.Widget.unrealize] has
        been called or the widget has been unmapped (that is, it is going
        to be hidden).
  */
  extern(C) void function(GtkWidget* widget) unrealize;

  /**
      Called when the widget gets added to a [gtk.root.Root] widget. Must
        chain up
  */
  extern(C) void function(GtkWidget* widget) root;

  /**
      Called when the widget is about to be removed from its
        [gtk.root.Root] widget. Must chain up
  */
  extern(C) void function(GtkWidget* widget) unroot;

  /**
      Called to set the allocation, if the widget does
        not have a layout manager.
  */
  extern(C) void function(GtkWidget* widget, int width, int height, int baseline) sizeAllocate;

  /**
      Signal emitted when the widget state changes,
        see [gtk.widget.Widget.getStateFlags].
  */
  extern(C) void function(GtkWidget* widget, GtkStateFlags previousStateFlags) stateFlagsChanged;

  /**
      Signal emitted when the text direction of a
        widget changes.
  */
  extern(C) void function(GtkWidget* widget, GtkTextDirection previousDirection) directionChanged;

  /**
      Called to get the request mode, if the widget
        does not have a layout manager.
        This allows a widget to tell its parent container whether
        it prefers to be allocated in [gtk.types.SizeRequestMode.HeightForWidth] or
        [gtk.types.SizeRequestMode.WidthForHeight] mode.
        [gtk.types.SizeRequestMode.HeightForWidth] means the widget prefers to have
        `GtkWidgetClass.measure()` called first to get the default width (passing
        a for_size of -1), then again to get the height for said default width.
        [gtk.types.SizeRequestMode.ConstantSize] disables any height-for-width or
        width-for-height geometry management for said widget and is the
        default return.
        It’s important to note that any widget
        which trades height-for-width or width-for-height must respond properly
        to a for_size value >= -1 passed to `GtkWidgetClass.measure`, for both
        possible orientations.
  */
  extern(C) GtkSizeRequestMode function(GtkWidget* widget) getRequestMode;

  /**
      Called to obtain the minimum and natural size of the widget,
        if the widget does not have a layout manager.
        Depending on the orientation parameter, the passed for_size can be
        interpreted as width or height. A widget will never be allocated less
        than its minimum size.
  */
  extern(C) void function(GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline) measure;

  /**
      Activates the @widget if @group_cycling is
        false, and just grabs the focus if @group_cycling is true.
  */
  extern(C) gboolean function(GtkWidget* widget, gboolean groupCycling) mnemonicActivate;

  /**
      Causes @widget to have the keyboard focus for the
        [gtk.window.Window] it’s inside.
  */
  extern(C) gboolean function(GtkWidget* widget) grabFocus;

  /**
      Vfunc for [gtk.widget.Widget.childFocus]
  */
  extern(C) gboolean function(GtkWidget* widget, GtkDirectionType direction) focus;

  /**
      Sets the focused child of a widget. Must chain up
  */
  extern(C) void function(GtkWidget* widget, GtkWidget* child) setFocusChild;

  /**
      Signal emitted when a change of focus is requested
  */
  extern(C) void function(GtkWidget* widget, GtkDirectionType direction) moveFocus;

  /**
      Signal emitted if keyboard navigation fails.
  */
  extern(C) gboolean function(GtkWidget* widget, GtkDirectionType direction) keynavFailed;

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
      Vfunc called when the CSS used by widget was changed. Widgets
        should then discard their caches that depend on CSS and queue resizes or
        redraws accordingly. The default implementation will take care of this for
        all the default CSS properties, so implementations must chain up.
  */
  extern(C) void function(GtkWidget* widget, GtkCssStyleChange* change) cssChanged;

  /**
      Emitted when a system setting was changed. Must chain up.
  */
  extern(C) void function(GtkWidget* widget, GtkSystemSetting settings) systemSettingChanged;

  /**
      Vfunc called when a new snapshot of the widget has to be taken.
  */
  extern(C) void function(GtkWidget* widget, GtkSnapshot* snapshot) snapshot;

  /**
      Vfunc for [gtk.widget.Widget.contains].
  */
  extern(C) gboolean function(GtkWidget* widget, double x, double y) contains;

  /** */
  GtkWidgetClassPrivate* priv;

  /** */
  void*[8] padding;
}

/** */
struct GtkWidgetClassPrivate;

/**
    [gtk.widget_paintable.WidgetPaintable] is a [gdk.paintable.Paintable] that displays the contents
    of a widget.
    
    [gtk.widget_paintable.WidgetPaintable] will also take care of the widget not being in a
    state where it can be drawn (like when it isn't shown) and just draw
    nothing or where it does not have a size (like when it is hidden) and
    report no size in that case.
    
    Of course, [gtk.widget_paintable.WidgetPaintable] allows you to monitor widgets for size
    changes by emitting the `signal@Gdk.Paintable::invalidate-size` signal
    whenever the size of the widget changes as well as for visual changes by
    emitting the `signal@Gdk.Paintable::invalidate-contents` signal whenever
    the widget changes.
    
    You can use a [gtk.widget_paintable.WidgetPaintable] everywhere a [gdk.paintable.Paintable] is allowed,
    including using it on a [gtk.picture.Picture] (or one of its parents) that it was
    set on itself via [gtk.picture.Picture.setPaintable]. The paintable will take care
    of recursion when this happens. If you do this however, ensure that the
    `property@Gtk.Picture:can-shrink` property is set to true or you might
    end up with an infinitely growing widget.
*/
struct GtkWidgetPaintable;

/** */
struct GtkWidgetPaintableClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GtkWidgetPrivate;

/**
    A [gtk.window.Window] is a toplevel window which can contain other widgets.
    
    ![An example GtkWindow](window.png)
    
    Windows normally have decorations that are under the control
    of the windowing system and allow the user to manipulate the window
    (resize it, move it, close it,...).
    
    # GtkWindow as GtkBuildable
    
    The [gtk.window.Window] implementation of the [gtk.buildable.Buildable] interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a `<child>` element.
    
    # CSS nodes
    
    ```
    window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
    ├── <child>
    ╰── <titlebar child>.titlebar [.default-decoration]
    ```
    
    [gtk.window.Window] has a main CSS node with name window and style class .background.
    
    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
    also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
    
    [gtk.window.Window] subclasses often add their own discriminating style classes,
    such as .dialog, .popup or .tooltip.
    
    Generally, some CSS properties don't make sense on the toplevel window node,
    such as margins or padding. When client-side decorations without invisible
    borders are in use (i.e. the .solid-csd style class is added to the
    main window node), the CSS border of the toplevel window is used for
    resize drags. In the .csd case, the shadow area outside of the window
    can be used to resize it.
    
    [gtk.window.Window] adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.window.Window] used the [gtk.types.AccessibleRole.Window] role.
    
    Since GTK 4.12, [gtk.window.Window] uses the [gtk.types.AccessibleRole.Application] role.
    
    # Actions
    
    [gtk.window.Window] defines a set of built-in actions:
    $(LIST
      * `default.activate`: Activate the default widget.
      * `window.minimize`: Minimize the window.
      * `window.toggle-maximized`: Maximize or restore the window.
      * `window.close`: Close the window.
    )
*/
struct GtkWindow
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkWindowClass
{
  /**
      The parent class.
  */
  GtkWidgetClass parentClass;

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
      Class handler for the `GtkWindow::enable-debugging`
        keybinding signal.
  */
  extern(C) gboolean function(GtkWindow* window, gboolean toggle) enableDebugging;

  /**
      Class handler for the `GtkWindow::close-request` signal.
  */
  extern(C) gboolean function(GtkWindow* window) closeRequest;

  /** */
  void*[8] padding;
}

/**
    [gtk.window_controls.WindowControls] shows window frame controls.
    
    Typical window frame controls are minimize, maximize and close buttons,
    and the window icon.
    
    ![An example GtkWindowControls](windowcontrols.png)
    
    [gtk.window_controls.WindowControls] only displays start or end side of the controls (see
    [gtk.window_controls.WindowControls.side]), so it's intended to be always used
    in pair with another [gtk.window_controls.WindowControls] for the opposite side, for example:
    
    ```xml
    <object class="GtkBox">
      <child>
        <object class="GtkWindowControls">
          <property name="side">start</property>
        </object>
      </child>
    
      ...
    
      <child>
        <object class="GtkWindowControls">
          <property name="side">end</property>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```
    windowcontrols
    ├── [image.icon]
    ├── [button.minimize]
    ├── [button.maximize]
    ╰── [button.close]
    ```
    
    A [gtk.window_controls.WindowControls]' CSS node is called windowcontrols. It contains
    subnodes corresponding to each title button. Which of the title buttons
    exist and where they are placed exactly depends on the desktop environment
    and `property@Gtk.WindowControls:decoration-layout` value.
    
    When [gtk.window_controls.WindowControls.empty] is true, it gets the .empty
    style class.
    
    # Accessibility
    
    [gtk.window_controls.WindowControls] uses the [gtk.types.AccessibleRole.Group] role.
*/
struct GtkWindowControls;

/** */
struct GtkWindowControlsClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    [gtk.window_group.WindowGroup] makes group of windows behave like separate applications.
    
    It achieves this by limiting the effect of GTK grabs and modality
    to windows in the same group.
    
    A window can be a member in at most one window group at a time.
    Windows that have not been explicitly assigned to a group are
    implicitly treated like windows of the default window group.
    
    [gtk.window_group.WindowGroup] objects are referenced by each window in the group,
    so once you have added all windows to a [gtk.window_group.WindowGroup], you can drop
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

/**
    [gtk.window_handle.WindowHandle] is a titlebar area widget.
    
    When added into a window, it can be dragged to move the window, and handles
    right click, double click and middle click as expected of a titlebar.
    
    # CSS nodes
    
    [gtk.window_handle.WindowHandle] has a single CSS node with the name `windowhandle`.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.window_handle.WindowHandle] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.window_handle.WindowHandle] uses the [gtk.types.AccessibleRole.Generic] role.
*/
struct GtkWindowHandle;

/** */
struct GtkWindowHandleClass
{
  /** */
  GtkWidgetClass parentClass;
}

alias extern(C) int function(int currentPage, void* data) GtkAssistantPageFunc;

alias extern(C) gboolean function(GtkCellRenderer* renderer, const(GdkRectangle)* cellArea, const(GdkRectangle)* cellBackground, void* data) GtkCellAllocCallback;

alias extern(C) gboolean function(GtkCellRenderer* renderer, void* data) GtkCellCallback;

alias extern(C) void function(GtkCellLayout* cellLayout, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) GtkCellLayoutDataFunc;

alias extern(C) void function(GtkWidget* widget, int width, int height, int baseline) GtkCustomAllocateFunc;

alias extern(C) gboolean function(GObject* item, void* userData) GtkCustomFilterFunc;

alias extern(C) void function(GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline) GtkCustomMeasureFunc;

alias extern(C) GtkSizeRequestMode function(GtkWidget* widget) GtkCustomRequestModeFunc;

alias extern(C) void function(GtkDrawingArea* drawingArea, cairo_t* cr, int width, int height, void* userData) GtkDrawingAreaDrawFunc;

alias extern(C) gboolean function(GtkEntryCompletion* completion, const(char)* key, GtkTreeIter* iter, void* userData) GtkEntryCompletionMatchFunc;

alias extern(C) void function(void* userData) GtkExpressionNotify;

alias extern(C) GtkWidget* function(GObject* item, void* userData) GtkFlowBoxCreateWidgetFunc;

alias extern(C) gboolean function(GtkFlowBoxChild* child, void* userData) GtkFlowBoxFilterFunc;

alias extern(C) void function(GtkFlowBox* box, GtkFlowBoxChild* child, void* userData) GtkFlowBoxForeachFunc;

alias extern(C) int function(GtkFlowBoxChild* child1, GtkFlowBoxChild* child2, void* userData) GtkFlowBoxSortFunc;

alias extern(C) gboolean function(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data) GtkFontFilterFunc;

alias extern(C) void function(GtkIconView* iconView, GtkTreePath* path, void* data) GtkIconViewForeachFunc;

alias extern(C) GtkWidget* function(GObject* item, void* userData) GtkListBoxCreateWidgetFunc;

alias extern(C) gboolean function(GtkListBoxRow* row, void* userData) GtkListBoxFilterFunc;

alias extern(C) void function(GtkListBox* box, GtkListBoxRow* row, void* userData) GtkListBoxForeachFunc;

alias extern(C) int function(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData) GtkListBoxSortFunc;

alias extern(C) void function(GtkListBoxRow* row, GtkListBoxRow* before, void* userData) GtkListBoxUpdateHeaderFunc;

alias extern(C) GObject* function(GObject* item, void* userData) GtkMapListModelMapFunc;

alias extern(C) void function(GtkMenuButton* menuButton, void* userData) GtkMenuButtonCreatePopupFunc;

alias extern(C) void function(GtkPageSetup* pageSetup, void* data) GtkPageSetupDoneFunc;

alias extern(C) void function(GtkPrintJob* printJob, void* userData, const(GError)* error) GtkPrintJobCompleteFunc;

alias extern(C) void function(const(char)* key, const(char)* value, void* userData) GtkPrintSettingsFunc;

alias extern(C) gboolean function(GtkPrinter* printer, void* data) GtkPrinterFunc;

alias extern(C) char* function(GtkScale* scale, double value, void* userData) GtkScaleFormatValueFunc;

alias extern(C) gboolean function(GtkWidget* widget, GVariant* args, void* userData) GtkShortcutFunc;

alias extern(C) gboolean function(dchar ch, void* userData) GtkTextCharPredicate;

alias extern(C) void function(GtkTextTag* tag, void* data) GtkTextTagTableForeach;

alias extern(C) gboolean function(GtkWidget* widget, GdkFrameClock* frameClock, void* userData) GtkTickCallback;

alias extern(C) void function(GtkTreeViewColumn* treeColumn, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) GtkTreeCellDataFunc;

alias extern(C) int function(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) GtkTreeIterCompareFunc;

alias extern(C) GListModel* function(GObject* item, void* userData) GtkTreeListModelCreateModelFunc;

alias extern(C) void function(GtkTreeModel* model, GtkTreeIter* iter, GValue* value, int column, void* data) GtkTreeModelFilterModifyFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreeIter* iter, void* data) GtkTreeModelFilterVisibleFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) GtkTreeModelForeachFunc;

alias extern(C) void function(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) GtkTreeSelectionForeachFunc;

alias extern(C) gboolean function(GtkTreeSelection* selection, GtkTreeModel* model, GtkTreePath* path, gboolean pathCurrentlySelected, void* data) GtkTreeSelectionFunc;

alias extern(C) gboolean function(GtkTreeView* treeView, GtkTreeViewColumn* column, GtkTreeViewColumn* prevColumn, GtkTreeViewColumn* nextColumn, void* data) GtkTreeViewColumnDropFunc;

alias extern(C) void function(GtkTreeView* treeView, GtkTreePath* path, void* userData) GtkTreeViewMappingFunc;

alias extern(C) gboolean function(GtkTreeModel* model, GtkTreeIter* iter, void* data) GtkTreeViewRowSeparatorFunc;

alias extern(C) gboolean function(GtkTreeModel* model, int column, const(char)* key, GtkTreeIter* iter, void* searchData) GtkTreeViewSearchEqualFunc;

alias extern(C) void function(GtkWidget* widget, const(char)* actionName, GVariant* parameter) GtkWidgetActionActivateFunc;

