/// C types for atk1 library
module atk.c.types;

public import gid.basictypes;
public import gobject.c.types;

/**
    This is a singly-linked list (a #GSList) of #AtkAttribute. It is
    used by [atk.text.Text.getRunAttributes],
    [atk.text.Text.getDefaultAttributes],
    [atk.editable_text.EditableText.setRunAttributes],
    [atk.document.Document.getAttributes] and [atk.object.ObjectWrap.getAttributes]
*/
alias AtkAttributeSet = GSList;

/**
    An AtkState describes a single state of an object.
    
    An AtkState describes a single state of an object. The full set of states
    that apply to an object at a given time are contained in its #AtkStateSet.
    
    See `id@atk_object_ref_state_set` and `id@atk_object_notify_state_change`
*/
alias AtkState = ulong;

/**
    Specifies how xy coordinates are to be interpreted. Used by functions such
    as [atk.component.Component.getPosition] and [atk.text.Text.getCharacterExtents]
*/
enum AtkCoordType
{
  /**
      specifies xy coordinates relative to the screen
  */
  Screen = 0,

  /**
      specifies xy coordinates relative to the widget's
      top-level window
  */
  Window = 1,

  /**
      specifies xy coordinates relative to the widget's
      immediate parent. Since: 2.30
  */
  Parent = 2,
}

/**
    Describes the type of link
*/
enum AtkHyperlinkStateFlags : uint
{
  /**
      Link is inline
  */
  Inline = 1,
}

/**
    Specifies the type of a keyboard evemt.
*/
enum AtkKeyEventType
{
  /**
      specifies a key press event
  */
  Press = 0,

  /**
      specifies a key release event
  */
  Release = 1,

  /**
      Not a valid value; specifies end of enumeration
  */
  LastDefined = 2,
}

/**
    Describes the layer of a component
    
    These enumerated "layer values" are used when determining which UI
    rendering layer a component is drawn into, which can help in making
    determinations of when components occlude one another.
*/
enum AtkLayer
{
  /**
      The object does not have a layer
  */
  Invalid = 0,

  /**
      This layer is reserved for the desktop background
  */
  Background = 1,

  /**
      This layer is used for Canvas components
  */
  Canvas = 2,

  /**
      This layer is normally used for components
  */
  Widget = 3,

  /**
      This layer is used for layered components
  */
  Mdi = 4,

  /**
      This layer is used for popup components, such as menus
  */
  Popup = 5,

  /**
      This layer is reserved for future use.
  */
  Overlay = 6,

  /**
      This layer is used for toplevel windows.
  */
  Window = 7,
}

/**
    Enumeration used to indicate a type of live region and how assertive it
    should be in terms of speaking notifications. Currently, this is only used
    for "notification" events, but it may be used for additional purposes
    in the future.
*/
enum AtkLive
{
  /**
      No live region.
  */
  None = 0,

  /**
      This live region should be considered polite.
  */
  Polite = 1,

  /**
      This live region should be considered assertive.
  */
  Assertive = 2,
}

/**
    Describes the type of the relation
*/
enum AtkRelationType
{
  /**
      Not used, represens "no relationship" or an error condition.
  */
  Null = 0,

  /**
      Indicates an object controlled by one or more target objects.
  */
  ControlledBy = 1,

  /**
      Indicates an object is an controller for one or more target objects.
  */
  ControllerFor = 2,

  /**
      Indicates an object is a label for one or more target objects.
  */
  LabelFor = 3,

  /**
      Indicates an object is labelled by one or more target objects.
  */
  LabelledBy = 4,

  /**
      Indicates an object is a member of a group of one or more target objects.
  */
  MemberOf = 5,

  /**
      Indicates an object is a cell in a treetable which is displayed because a cell in the same column is expanded and identifies that cell.
  */
  NodeChildOf = 6,

  /**
      Indicates that the object has content that flows logically to another
       AtkObject in a sequential way, (for instance text-flow).
  */
  FlowsTo = 7,

  /**
      Indicates that the object has content that flows logically from
       another AtkObject in a sequential way, (for instance text-flow).
  */
  FlowsFrom = 8,

  /**
      Indicates a subwindow attached to a component but otherwise has no connection in  the UI heirarchy to that component.
  */
  SubwindowOf = 9,

  /**
      Indicates that the object visually embeds
       another object's content, i.e. this object's content flows around
       another's content.
  */
  Embeds = 10,

  /**
      Reciprocal of [atk.types.RelationType.Embeds], indicates that
       this object's content is visualy embedded in another object.
  */
  EmbeddedBy = 11,

  /**
      Indicates that an object is a popup for another object.
  */
  PopupFor = 12,

  /**
      Indicates that an object is a parent window of another object.
  */
  ParentWindowOf = 13,

  /**
      Reciprocal of [atk.types.RelationType.DescriptionFor]. Indicates that one
      or more target objects provide descriptive information about this object. This relation
      type is most appropriate for information that is not essential as its presentation may
      be user-configurable and/or limited to an on-demand mechanism such as an assistive
      technology command. For brief, essential information such as can be found in a widget's
      on-screen label, use [atk.types.RelationType.LabelledBy]. For an on-screen error message, use
      [atk.types.RelationType.ErrorMessage]. For lengthy extended descriptive information contained in
      an on-screen object, consider using [atk.types.RelationType.Details] as assistive technologies may
      provide a means for the user to navigate to objects containing detailed descriptions so
      that their content can be more closely reviewed.
  */
  DescribedBy = 14,

  /**
      Reciprocal of [atk.types.RelationType.DescribedBy]. Indicates that this
      object provides descriptive information about the target object(s). See also
      [atk.types.RelationType.DetailsFor] and [atk.types.RelationType.ErrorFor].
  */
  DescriptionFor = 15,

  /**
      Indicates an object is a cell in a treetable and is expanded to display other cells in the same column.
  */
  NodeParentOf = 16,

  /**
      Reciprocal of [atk.types.RelationType.DetailsFor]. Indicates that this object
      has a detailed or extended description, the contents of which can be found in the target
      object(s). This relation type is most appropriate for information that is sufficiently
      lengthy as to make navigation to the container of that information desirable. For less
      verbose information suitable for announcement only, see [atk.types.RelationType.DescribedBy]. If
      the detailed information describes an error condition, [atk.types.RelationType.ErrorFor] should be
      used instead. @Since: ATK-2.26.
  */
  Details = 17,

  /**
      Reciprocal of [atk.types.RelationType.Details]. Indicates that this object
      provides a detailed or extended description about the target object(s). See also
      [atk.types.RelationType.DescriptionFor] and [atk.types.RelationType.ErrorFor]. @Since: ATK-2.26.
  */
  DetailsFor = 18,

  /**
      Reciprocal of [atk.types.RelationType.ErrorFor]. Indicates that this object
      has one or more errors, the nature of which is described in the contents of the target
      object(s). Objects that have this relation type should also contain [atk.types.StateType.InvalidEntry]
      in their #AtkStateSet. @Since: ATK-2.26.
  */
  ErrorMessage = 19,

  /**
      Reciprocal of [atk.types.RelationType.ErrorMessage]. Indicates that this object
      contains an error message describing an invalid condition in the target object(s). @Since:
      ATK_2.26.
  */
  ErrorFor = 20,

  /**
      Not used, this value indicates the end of the enumeration.
  */
  LastDefined = 21,
}

/**
    Describes the role of an object
    
    These are the built-in enumerated roles that UI components can have
    in ATK.  Other roles may be added at runtime, so an AtkRole >=
    [atk.types.Role.LastDefined] is not necessarily an error.
*/
enum AtkRole
{
  /**
      Invalid role
  */
  Invalid = 0,

  /**
      A label which represents an accelerator
  */
  AcceleratorLabel = 1,

  /**
      An object which is an alert to the user. Assistive Technologies typically respond to ATK_ROLE_ALERT by reading the entire onscreen contents of containers advertising this role.  Should be used for warning dialogs, etc.
  */
  Alert = 2,

  /**
      An object which is an animated image
  */
  Animation = 3,

  /**
      An arrow in one of the four cardinal directions
  */
  Arrow = 4,

  /**
      An object that displays a calendar and allows the user to select a date
  */
  Calendar = 5,

  /**
      An object that can be drawn into and is used to trap events
  */
  Canvas = 6,

  /**
      A choice that can be checked or unchecked and provides a separate indicator for the current state
  */
  CheckBox = 7,

  /**
      A menu item with a check box
  */
  CheckMenuItem = 8,

  /**
      A specialized dialog that lets the user choose a color
  */
  ColorChooser = 9,

  /**
      The header for a column of data
  */
  ColumnHeader = 10,

  /**
      A collapsible list of choices the user can select from
  */
  ComboBox = 11,

  /**
      An object whose purpose is to allow a user to edit a date
  */
  DateEditor = 12,

  /**
      An inconifed internal frame within a DESKTOP_PANE
  */
  DesktopIcon = 13,

  /**
      A pane that supports internal frames and iconified versions of those internal frames
  */
  DesktopFrame = 14,

  /**
      An object whose purpose is to allow a user to set a value
  */
  Dial = 15,

  /**
      A top level window with title bar and a border
  */
  Dialog = 16,

  /**
      A pane that allows the user to navigate through and select the contents of a directory
  */
  DirectoryPane = 17,

  /**
      An object used for drawing custom user interface elements
  */
  DrawingArea = 18,

  /**
      A specialized dialog that lets the user choose a file
  */
  FileChooser = 19,

  /**
      A object that fills up space in a user interface
  */
  Filler = 20,

  /**
      A specialized dialog that lets the user choose a font
  */
  FontChooser = 21,

  /**
      A top level window with a title bar, border, menubar, etc.
  */
  Frame = 22,

  /**
      A pane that is guaranteed to be painted on top of all panes beneath it
  */
  GlassPane = 23,

  /**
      A document container for HTML, whose children represent the document content
  */
  HtmlContainer = 24,

  /**
      A small fixed size picture, typically used to decorate components
  */
  Icon = 25,

  /**
      An object whose primary purpose is to display an image
  */
  Image = 26,

  /**
      A frame-like object that is clipped by a desktop pane
  */
  InternalFrame = 27,

  /**
      An object used to present an icon or short string in an interface
  */
  Label = 28,

  /**
      A specialized pane that allows its children to be drawn in layers, providing a form of stacking order
  */
  LayeredPane = 29,

  /**
      An object that presents a list of objects to the user and allows the user to select one or more of them
  */
  List = 30,

  /**
      An object that represents an element of a list
  */
  ListItem = 31,

  /**
      An object usually found inside a menu bar that contains a list of actions the user can choose from
  */
  Menu = 32,

  /**
      An object usually drawn at the top of the primary dialog box of an application that contains a list of menus the user can choose from
  */
  MenuBar = 33,

  /**
      An object usually contained in a menu that presents an action the user can choose
  */
  MenuItem = 34,

  /**
      A specialized pane whose primary use is inside a DIALOG
  */
  OptionPane = 35,

  /**
      An object that is a child of a page tab list
  */
  PageTab = 36,

  /**
      An object that presents a series of panels (or page tabs), one at a time, through some mechanism provided by the object
  */
  PageTabList = 37,

  /**
      A generic container that is often used to group objects
  */
  Panel = 38,

  /**
      A text object uses for passwords, or other places where the text content is not shown visibly to the user
  */
  PasswordText = 39,

  /**
      A temporary window that is usually used to offer the user a list of choices, and then hides when the user selects one of those choices
  */
  PopupMenu = 40,

  /**
      An object used to indicate how much of a task has been completed
  */
  ProgressBar = 41,

  /**
      An object the user can manipulate to tell the application to do something
  */
  PushButton = 42,

  /**
      A specialized check box that will cause other radio buttons in the same group to become unchecked when this one is checked
  */
  RadioButton = 43,

  /**
      A check menu item which belongs to a group. At each instant exactly one of the radio menu items from a group is selected
  */
  RadioMenuItem = 44,

  /**
      A specialized pane that has a glass pane and a layered pane as its children
  */
  RootPane = 45,

  /**
      The header for a row of data
  */
  RowHeader = 46,

  /**
      An object usually used to allow a user to incrementally view a large amount of data.
  */
  ScrollBar = 47,

  /**
      An object that allows a user to incrementally view a large amount of information
  */
  ScrollPane = 48,

  /**
      An object usually contained in a menu to provide a visible and logical separation of the contents in a menu
  */
  Separator = 49,

  /**
      An object that allows the user to select from a bounded range
  */
  Slider = 50,

  /**
      A specialized panel that presents two other panels at the same time
  */
  SplitPane = 51,

  /**
      An object used to get an integer or floating point number from the user
  */
  SpinButton = 52,

  /**
      An object which reports messages of minor importance to the user
  */
  Statusbar = 53,

  /**
      An object used to represent information in terms of rows and columns
  */
  Table = 54,

  /**
      A cell in a table
  */
  TableCell = 55,

  /**
      The header for a column of a table
  */
  TableColumnHeader = 56,

  /**
      The header for a row of a table
  */
  TableRowHeader = 57,

  /**
      A menu item used to tear off and reattach its menu
  */
  TearOffMenuItem = 58,

  /**
      An object that represents an accessible terminal.  (Since: 0.6)
  */
  Terminal = 59,

  /**
      An interactive widget that supports multiple lines of text and
      optionally accepts user input, but whose purpose is not to solicit user input.
      Thus ATK_ROLE_TEXT is appropriate for the text view in a plain text editor
      but inappropriate for an input field in a dialog box or web form. For widgets
      whose purpose is to solicit input from the user, see ATK_ROLE_ENTRY and
      ATK_ROLE_PASSWORD_TEXT. For generic objects which display a brief amount of
      textual information, see ATK_ROLE_STATIC.
  */
  Text = 60,

  /**
      A specialized push button that can be checked or unchecked, but does not provide a separate indicator for the current state
  */
  ToggleButton = 61,

  /**
      A bar or palette usually composed of push buttons or toggle buttons
  */
  ToolBar = 62,

  /**
      An object that provides information about another object
  */
  ToolTip = 63,

  /**
      An object used to represent hierarchical information to the user
  */
  Tree = 64,

  /**
      An object capable of expanding and collapsing rows as well as showing multiple columns of data.   (Since: 0.7)
  */
  TreeTable = 65,

  /**
      The object contains some Accessible information, but its role is not known
  */
  Unknown = 66,

  /**
      An object usually used in a scroll pane
  */
  Viewport = 67,

  /**
      A top level window with no title or border.
  */
  Window = 68,

  /**
      An object that serves as a document header. (Since: 1.1.1)
  */
  Header = 69,

  /**
      An object that serves as a document footer.  (Since: 1.1.1)
  */
  Footer = 70,

  /**
      An object which is contains a paragraph of text content.   (Since: 1.1.1)
  */
  Paragraph = 71,

  /**
      An object which describes margins and tab stops, etc. for text objects which it controls (should have CONTROLLER_FOR relation to such).   (Since: 1.1.1)
  */
  Ruler = 72,

  /**
      The object is an application object, which may contain @ATK_ROLE_FRAME objects or other types of accessibles.  The root accessible of any application's ATK hierarchy should have ATK_ROLE_APPLICATION.   (Since: 1.1.4)
  */
  Application = 73,

  /**
      The object is a dialog or list containing items for insertion into an entry widget, for instance a list of words for completion of a text entry.   (Since: 1.3)
  */
  Autocomplete = 74,

  /**
      The object is an editable text object in a toolbar.  (Since: 1.5)
  */
  EditBar = 75,

  /**
      The object is an embedded container within a document or panel.  This role is a grouping "hint" indicating that the contained objects share a context.  (Since: 1.7.2)
  */
  Embedded = 76,

  /**
      The object is a component whose textual content may be entered or modified by the user, provided @ATK_STATE_EDITABLE is present.   (Since: 1.11)
  */
  Entry = 77,

  /**
      The object is a graphical depiction of quantitative data. It may contain multiple subelements whose attributes and/or description may be queried to obtain both the quantitative data and information about how the data is being presented. The LABELLED_BY relation is particularly important in interpreting objects of this type, as is the accessible-description property.  (Since: 1.11)
  */
  Chart = 78,

  /**
      The object contains descriptive information, usually textual, about another user interface element such as a table, chart, or image.  (Since: 1.11)
  */
  Caption = 79,

  /**
      The object is a visual frame or container which contains a view of document content. Document frames may occur within another Document instance, in which case the second document may be said to be embedded in the containing instance. HTML frames are often ROLE_DOCUMENT_FRAME. Either this object, or a singleton descendant, should implement the Document interface.  (Since: 1.11)
  */
  DocumentFrame = 80,

  /**
      The object serves as a heading for content which follows it in a document. The 'heading level' of the heading, if availabe, may be obtained by querying the object's attributes.
  */
  Heading = 81,

  /**
      The object is a containing instance which encapsulates a page of information. @ATK_ROLE_PAGE is used in documents and content which support a paginated navigation model.  (Since: 1.11)
  */
  Page = 82,

  /**
      The object is a containing instance of document content which constitutes a particular 'logical' section of the document. The type of content within a section, and the nature of the section division itself, may be obtained by querying the object's attributes. Sections may be nested. (Since: 1.11)
  */
  Section = 83,

  /**
      The object is redundant with another object in the hierarchy, and is exposed for purely technical reasons.  Objects of this role should normally be ignored by clients. (Since: 1.11)
  */
  RedundantObject = 84,

  /**
      The object is a container for form controls, for instance as part of a
      web form or user-input form within a document.  This role is primarily a tag/convenience for
      clients when navigating complex documents, it is not expected that ordinary GUI containers will
      always have ATK_ROLE_FORM. (Since: 1.12.0)
  */
  Form = 85,

  /**
      The object is a hypertext anchor, i.e. a "link" in a
      hypertext document.  Such objects are distinct from 'inline'
      content which may also use the Hypertext/Hyperlink interfaces
      to indicate the range/location within a text object where
      an inline or embedded object lies.  (Since: 1.12.1)
  */
  Link = 86,

  /**
      The object is a window or similar viewport
      which is used to allow composition or input of a 'complex character',
      in other words it is an "input method window." (Since: 1.12.1)
  */
  InputMethodWindow = 87,

  /**
      A row in a table.  (Since: 2.1.0)
  */
  TableRow = 88,

  /**
      An object that represents an element of a tree.  (Since: 2.1.0)
  */
  TreeItem = 89,

  /**
      A document frame which contains a spreadsheet.  (Since: 2.1.0)
  */
  DocumentSpreadsheet = 90,

  /**
      A document frame which contains a presentation or slide content.  (Since: 2.1.0)
  */
  DocumentPresentation = 91,

  /**
      A document frame which contains textual content, such as found in a word processing application.  (Since: 2.1.0)
  */
  DocumentText = 92,

  /**
      A document frame which contains HTML or other markup suitable for display in a web browser.  (Since: 2.1.0)
  */
  DocumentWeb = 93,

  /**
      A document frame which contains email content to be displayed or composed either in plain text or HTML.  (Since: 2.1.0)
  */
  DocumentEmail = 94,

  /**
      An object found within a document and designed to present a comment, note, or other annotation. In some cases, this object might not be visible until activated.  (Since: 2.1.0)
  */
  Comment = 95,

  /**
      A non-collapsible list of choices the user can select from. (Since: 2.1.0)
  */
  ListBox = 96,

  /**
      A group of related widgets. This group typically has a label. (Since: 2.1.0)
  */
  Grouping = 97,

  /**
      An image map object. Usually a graphic with multiple hotspots, where each hotspot can be activated resulting in the loading of another document or section of a document. (Since: 2.1.0)
  */
  ImageMap = 98,

  /**
      A transitory object designed to present a message to the user, typically at the desktop level rather than inside a particular application.  (Since: 2.1.0)
  */
  Notification = 99,

  /**
      An object designed to present a message to the user within an existing window. (Since: 2.1.0)
  */
  InfoBar = 100,

  /**
      A bar that serves as a level indicator to, for instance, show the strength of a password or the state of a battery.  (Since: 2.7.3)
  */
  LevelBar = 101,

  /**
      A bar that serves as the title of a window or a
      dialog. (Since: 2.12)
  */
  TitleBar = 102,

  /**
      An object which contains a text section
      that is quoted from another source. (Since: 2.12)
  */
  BlockQuote = 103,

  /**
      An object which represents an audio element. (Since: 2.12)
  */
  Audio = 104,

  /**
      An object which represents a video element. (Since: 2.12)
  */
  Video = 105,

  /**
      A definition of a term or concept. (Since: 2.12)
  */
  Definition = 106,

  /**
      A section of a page that consists of a
      composition that forms an independent part of a document, page, or
      site. Examples: A blog entry, a news story, a forum post. (Since: 2.12)
  */
  Article = 107,

  /**
      A region of a web page intended as a
      navigational landmark. This is designed to allow Assistive
      Technologies to provide quick navigation among key regions within a
      document. (Since: 2.12)
  */
  Landmark = 108,

  /**
      A text widget or container holding log content, such
      as chat history and error logs. In this role there is a
      relationship between the arrival of new items in the log and the
      reading order. The log contains a meaningful sequence and new
      information is added only to the end of the log, not at arbitrary
      points. (Since: 2.12)
  */
  Log = 109,

  /**
      A container where non-essential information
      changes frequently. Common usages of marquee include stock tickers
      and ad banners. The primary difference between a marquee and a log
      is that logs usually have a meaningful order or sequence of
      important content changes. (Since: 2.12)
  */
  Marquee = 110,

  /**
      A text widget or container that holds a mathematical
      expression. (Since: 2.12)
  */
  Math = 111,

  /**
      A widget whose purpose is to display a rating,
      such as the number of stars associated with a song in a media
      player. Objects of this role should also implement
      AtkValue. (Since: 2.12)
  */
  Rating = 112,

  /**
      An object containing a numerical counter which
      indicates an amount of elapsed time from a start point, or the time
      remaining until an end point. (Since: 2.12)
  */
  Timer = 113,

  /**
      An object that represents a list of
      term-value groups. A term-value group represents a individual
      description and consist of one or more names
      (ATK_ROLE_DESCRIPTION_TERM) followed by one or more values
      (ATK_ROLE_DESCRIPTION_VALUE). For each list, there should not be
      more than one group with the same term name. (Since: 2.12)
  */
  DescriptionList = 114,

  /**
      An object that represents a term or phrase
      with a corresponding definition. (Since: 2.12)
  */
  DescriptionTerm = 115,

  /**
      An object that represents the
      description, definition or value of a term. (Since: 2.12)
  */
  DescriptionValue = 116,

  /**
      A generic non-container object whose purpose is to display a
      brief amount of information to the user and whose role is known by the
      implementor but lacks semantic value for the user. Examples in which
      [atk.types.Role.Static] is appropriate include the message displayed in a message box
      and an image used as an alternative means to display text. [atk.types.Role.Static]
      should not be applied to widgets which are traditionally interactive, objects
      which display a significant amount of content, or any object which has an
      accessible relation pointing to another object. Implementors should expose the
      displayed information through the accessible name of the object. If doing so seems
      inappropriate, it may indicate that a different role should be used. For
      labels which describe another widget, see [atk.types.Role.Label]. For text views, see
      [atk.types.Role.Text]. For generic containers, see [atk.types.Role.Panel]. For objects whose
      role is not known by the implementor, see [atk.types.Role.Unknown]. (Since: 2.16)
  */
  Static = 117,

  /**
      An object that represents a mathematical fraction.
      (Since: 2.16)
  */
  MathFraction = 118,

  /**
      An object that represents a mathematical expression
      displayed with a radical. (Since: 2.16)
  */
  MathRoot = 119,

  /**
      An object that contains text that is displayed as a
      subscript. (Since: 2.16)
  */
  Subscript = 120,

  /**
      An object that contains text that is displayed as a
      superscript. (Since: 2.16)
  */
  Superscript = 121,

  /**
      An object that contains the text of a footnote. (Since: 2.26)
  */
  Footnote = 122,

  /**
      Content previously deleted or proposed to be
      deleted, e.g. in revision history or a content view providing suggestions
      from reviewers. (Since: 2.34)
  */
  ContentDeletion = 123,

  /**
      Content previously inserted or proposed to be
      inserted, e.g. in revision history or a content view providing suggestions
      from reviewers. (Since: 2.34)
  */
  ContentInsertion = 124,

  /**
      A run of content that is marked or highlighted, such as for
      reference purposes, or to call it out as having a special purpose. If the
      marked content has an associated section in the document elaborating on the
      reason for the mark, then [atk.types.RelationType.Details] should be used on the mark
      to point to that associated section. In addition, the reciprocal relation
      [atk.types.RelationType.DetailsFor] should be used on the associated content section
      to point back to the mark. (Since: 2.36)
  */
  Mark = 125,

  /**
      A container for content that is called out as a proposed
      change from the current version of the document, such as by a reviewer of the
      content. This role should include either [atk.types.Role.ContentDeletion] and/or
      [atk.types.Role.ContentInsertion] children, in any order, to indicate what the
      actual change is. (Since: 2.36)
  */
  Suggestion = 126,

  /**
      A specialized push button to open a menu.
      (Since: 2.46)
  */
  PushButtonMenu = 127,

  /**
      not a valid role, used for finding end of the enumeration
  */
  LastDefined = 128,
}

/**
    Specifies where an object should be placed on the screen when using scroll_to.
*/
enum AtkScrollType
{
  /**
      Scroll the object vertically and horizontally to bring
        its top left corner to the top left corner of the window.
  */
  TopLeft = 0,

  /**
      Scroll the object vertically and horizontally to
        bring its bottom right corner to the bottom right corner of the window.
  */
  BottomRight = 1,

  /**
      Scroll the object vertically to bring its top edge to
        the top edge of the window.
  */
  TopEdge = 2,

  /**
      Scroll the object vertically to bring its bottom
        edge to the bottom edge of the window.
  */
  BottomEdge = 3,

  /**
      Scroll the object vertically and horizontally to bring
        its left edge to the left edge of the window.
  */
  LeftEdge = 4,

  /**
      Scroll the object vertically and horizontally to
        bring its right edge to the right edge of the window.
  */
  RightEdge = 5,

  /**
      Scroll the object vertically and horizontally so that
        as much as possible of the object becomes visible. The exact placement is
        determined by the application.
  */
  Anywhere = 6,
}

/**
    The possible types of states of an object
*/
enum AtkStateType
{
  /**
      Indicates an invalid state - probably an error condition.
  */
  Invalid = 0,

  /**
      Indicates a window is currently the active window, or an object is the active subelement within a container or table. ATK_STATE_ACTIVE should not be used for objects which have ATK_STATE_FOCUSABLE or ATK_STATE_SELECTABLE: Those objects should use ATK_STATE_FOCUSED and ATK_STATE_SELECTED respectively. ATK_STATE_ACTIVE is a means to indicate that an object which is not focusable and not selectable is the currently-active item within its parent container.
  */
  Active = 1,

  /**
      Indicates that the object is 'armed', i.e. will be activated by if a pointer button-release event occurs within its bounds.  Buttons often enter this state when a pointer click occurs within their bounds, as a precursor to activation. ATK_STATE_ARMED has been deprecated since ATK-2.16 and should not be used in newly-written code.
  */
  Armed = 2,

  /**
      Indicates the current object is busy, i.e. onscreen representation is in the process of changing, or the object is temporarily unavailable for interaction due to activity already in progress.  This state may be used by implementors of Document to indicate that content loading is underway.  It also may indicate other 'pending' conditions; clients may wish to interrogate this object when the ATK_STATE_BUSY flag is removed.
  */
  Busy = 3,

  /**
      Indicates this object is currently checked, for instance a checkbox is 'non-empty'.
  */
  Checked = 4,

  /**
      Indicates that this object no longer has a valid backing widget (for instance, if its peer object has been destroyed)
  */
  Defunct = 5,

  /**
      Indicates that this object can contain text, and that the
      user can change the textual contents of this object by editing those contents
      directly. For an object which is expected to be editable due to its type, but
      which cannot be edited due to the application or platform preventing the user
      from doing so, that object's #AtkStateSet should lack ATK_STATE_EDITABLE and
      should contain ATK_STATE_READ_ONLY.
  */
  Editable = 6,

  /**
      Indicates that this object is enabled, i.e. that it currently reflects some application state. Objects that are "greyed out" may lack this state, and may lack the STATE_SENSITIVE if direct user interaction cannot cause them to acquire STATE_ENABLED. See also: ATK_STATE_SENSITIVE
  */
  Enabled = 7,

  /**
      Indicates this object allows progressive disclosure of its children
  */
  Expandable = 8,

  /**
      Indicates this object its expanded - see ATK_STATE_EXPANDABLE above
  */
  Expanded = 9,

  /**
      Indicates this object can accept keyboard focus, which means all events resulting from typing on the keyboard will normally be passed to it when it has focus
  */
  Focusable = 10,

  /**
      Indicates this object currently has the keyboard focus
  */
  Focused = 11,

  /**
      Indicates the orientation of this object is horizontal; used, for instance, by objects of ATK_ROLE_SCROLL_BAR.  For objects where vertical/horizontal orientation is especially meaningful.
  */
  Horizontal = 12,

  /**
      Indicates this object is minimized and is represented only by an icon
  */
  Iconified = 13,

  /**
      Indicates something must be done with this object before the user can interact with an object in a different window
  */
  Modal = 14,

  /**
      Indicates this (text) object can contain multiple lines of text
  */
  MultiLine = 15,

  /**
      Indicates this object allows more than one of its children to be selected at the same time, or in the case of text objects, that the object supports non-contiguous text selections.
  */
  Multiselectable = 16,

  /**
      Indicates this object paints every pixel within its rectangular region.
  */
  Opaque = 17,

  /**
      Indicates this object is currently pressed.
  */
  Pressed = 18,

  /**
      Indicates the size of this object is not fixed
  */
  Resizable = 19,

  /**
      Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that can be selected
  */
  Selectable = 20,

  /**
      Indicates this object is the child of an object that allows its children to be selected and that this child is one of those children that has been selected
  */
  Selected = 21,

  /**
      Indicates this object is sensitive, e.g. to user interaction.
      STATE_SENSITIVE usually accompanies STATE_ENABLED for user-actionable controls,
      but may be found in the absence of STATE_ENABLED if the current visible state of the
      control is "disconnected" from the application state.  In such cases, direct user interaction
      can often result in the object gaining STATE_SENSITIVE, for instance if a user makes
      an explicit selection using an object whose current state is ambiguous or undefined.
      @see STATE_ENABLED, STATE_INDETERMINATE.
  */
  Sensitive = 22,

  /**
      Indicates this object, the object's parent, the object's parent's parent, and so on,
      are all 'shown' to the end-user, i.e. subject to "exposure" if blocking or obscuring objects do not interpose
      between this object and the top of the window stack.
  */
  Showing = 23,

  /**
      Indicates this (text) object can contain only a single line of text
  */
  SingleLine = 24,

  /**
      Indicates that the information returned for this object may no longer be
      synchronized with the application state.  This is implied if the object has STATE_TRANSIENT,
      and can also occur towards the end of the object peer's lifecycle. It can also be used to indicate that
      the index associated with this object has changed since the user accessed the object (in lieu of
      "index-in-parent-changed" events).
  */
  Stale = 25,

  /**
      Indicates this object is transient, i.e. a snapshot which may not emit events when its
      state changes.  Data from objects with ATK_STATE_TRANSIENT should not be cached, since there may be no
      notification given when the cached data becomes obsolete.
  */
  Transient = 26,

  /**
      Indicates the orientation of this object is vertical
  */
  Vertical = 27,

  /**
      Indicates this object is visible, e.g. has been explicitly marked for exposure to the user.
      **note**: [atk.types.StateType.Visible] is no guarantee that the object is actually unobscured on the screen, only
      that it is 'potentially' visible, barring obstruction, being scrolled or clipped out of the
      field of view, or having an ancestor container that has not yet made visible.
      A widget is potentially onscreen if it has both [atk.types.StateType.Visible] and [atk.types.StateType.Showing].
      The absence of [atk.types.StateType.Visible] and [atk.types.StateType.Showing] is semantically equivalent to saying
      that an object is 'hidden'.  See also [atk.types.StateType.Truncated], which applies if an object with
      [atk.types.StateType.Visible] and [atk.types.StateType.Showing] set lies within a viewport which means that its
      contents are clipped, e.g. a truncated spreadsheet cell or
      an image within a scrolling viewport.  Mostly useful for screen-review and magnification
      algorithms.
  */
  Visible = 28,

  /**
      Indicates that "active-descendant-changed" event
      is sent when children become 'active' (i.e. are selected or navigated to onscreen).
      Used to prevent need to enumerate all children in very large containers, like tables.
      The presence of STATE_MANAGES_DESCENDANTS is an indication to the client.
      that the children should not, and need not, be enumerated by the client.
      Objects implementing this state are expected to provide relevant state
      notifications to listening clients, for instance notifications of visibility
      changes and activation of their contained child objects, without the client
      having previously requested references to those children.
  */
  ManagesDescendants = 29,

  /**
      Indicates that the value, or some other quantifiable
      property, of this AtkObject cannot be fully determined. In the case of a large
      data set in which the total number of items in that set is unknown (e.g. 1 of
      999+), implementors should expose the currently-known set size (999) along
      with this state. In the case of a check box, this state should be used to
      indicate that the check box is a tri-state check box which is currently
      neither checked nor unchecked.
  */
  Indeterminate = 30,

  /**
      Indicates that an object is truncated, e.g. a text value in a speradsheet cell.
  */
  Truncated = 31,

  /**
      Indicates that explicit user interaction with an object is required by the user interface, e.g. a required field in a "web-form" interface.
  */
  Required = 32,

  /**
      Indicates that the object has encountered an error condition due to failure of input validation. For instance, a form control may acquire this state in response to invalid or malformed user input.
  */
  InvalidEntry = 33,

  /**
      Indicates that the object in question implements some form of ¨typeahead¨ or
      pre-selection behavior whereby entering the first character of one or more sub-elements
      causes those elements to scroll into view or become selected.  Subsequent character input
      may narrow the selection further as long as one or more sub-elements match the string.
      This state is normally only useful and encountered on objects that implement Selection.
      In some cases the typeahead behavior may result in full or partial ¨completion¨ of
      the data in the input field, in which case these input events may trigger text-changed
      events from the AtkText interface.  This state supplants @ATK_ROLE_AUTOCOMPLETE.
  */
  SupportsAutocompletion = 34,

  /**
      Indicates that the object in question supports text selection. It should only be exposed on objects which implement the Text interface, in order to distinguish this state from @ATK_STATE_SELECTABLE, which infers that the object in question is a selectable child of an object which implements Selection. While similar, text selection and subelement selection are distinct operations.
  */
  SelectableText = 35,

  /**
      Indicates that the object is the "default" active component, i.e. the object which is activated by an end-user press of the "Enter" or "Return" key.  Typically a "close" or "submit" button.
  */
  Default = 36,

  /**
      Indicates that the object changes its appearance dynamically as an inherent part of its presentation.  This state may come and go if an object is only temporarily animated on the way to a 'final' onscreen presentation.
      **note**: some applications, notably content viewers, may not be able to detect
      all kinds of animated content.  Therefore the absence of this state should not
      be taken as definitive evidence that the object's visual representation is
      static; this state is advisory.
  */
  Animated = 37,

  /**
      Indicates that the object (typically a hyperlink) has already been 'activated', and/or its backing data has already been downloaded, rendered, or otherwise "visited".
  */
  Visited = 38,

  /**
      Indicates this object has the potential to be
       checked, such as a checkbox or toggle-able table cell. @Since:
       ATK-2.12
  */
  Checkable = 39,

  /**
      Indicates that the object has a popup context
      menu or sub-level menu which may or may not be showing. This means
      that activation renders conditional content.  Note that ordinary
      tooltips are not considered popups in this context. @Since: ATK-2.12
  */
  HasPopup = 40,

  /**
      Indicates this object has a tooltip. @Since: ATK-2.16
  */
  HasTooltip = 41,

  /**
      Indicates that a widget which is ENABLED and SENSITIVE
      has a value which can be read, but not modified, by the user. Note that this
      state should only be applied to widget types whose value is normally directly
      user modifiable, such as check boxes, radio buttons, spin buttons, text input
      fields, and combo boxes, as a means to convey that the expected interaction
      with that widget is not possible. When the expected interaction with a
      widget does not include modification by the user, as is the case with
      labels and containers, ATK_STATE_READ_ONLY should not be applied. See also
      ATK_STATE_EDITABLE. @Since: ATK-2-16
  */
  ReadOnly = 42,

  /**
      Indicates this object is collapsed. @Since: ATK-2.38
  */
  Collapsed = 43,

  /**
      Not a valid state, used for finding end of enumeration
  */
  LastDefined = 44,
}

/**
    Describes the text attributes supported
*/
enum AtkTextAttribute
{
  /**
      Invalid attribute, like bad spelling or grammar.
  */
  Invalid = 0,

  /**
      The pixel width of the left margin
  */
  LeftMargin = 1,

  /**
      The pixel width of the right margin
  */
  RightMargin = 2,

  /**
      The number of pixels that the text is indented
  */
  Indent = 3,

  /**
      Either "true" or "false" indicating whether text is visible or not
  */
  Invisible = 4,

  /**
      Either "true" or "false" indicating whether text is editable or not
  */
  Editable = 5,

  /**
      Pixels of blank space to leave above each newline-terminated line.
  */
  PixelsAboveLines = 6,

  /**
      Pixels of blank space to leave below each newline-terminated line.
  */
  PixelsBelowLines = 7,

  /**
      Pixels of blank space to leave between wrapped lines inside the same newline-terminated line (paragraph).
  */
  PixelsInsideWrap = 8,

  /**
      "true" or "false" whether to make the background color for each character the height of the highest font used on the current line, or the height of the font used for the current character.
  */
  BgFullHeight = 9,

  /**
      Number of pixels that the characters are risen above the baseline. See also ATK_TEXT_ATTR_TEXT_POSITION.
  */
  Rise = 10,

  /**
      "none", "single", "double", "low", or "error"
  */
  Underline = 11,

  /**
      "true" or "false" whether the text is strikethrough
  */
  Strikethrough = 12,

  /**
      The size of the characters in points. eg: 10
  */
  Size = 13,

  /**
      The scale of the characters. The value is a string representation of a double
  */
  Scale = 14,

  /**
      The weight of the characters.
  */
  Weight = 15,

  /**
      The language used
  */
  Language = 16,

  /**
      The font family name
  */
  FamilyName = 17,

  /**
      The background color. The value is an RGB value of the format "`u`,`u`,`u`"
  */
  BgColor = 18,

  /**
      The foreground color. The value is an RGB value of the format "`u`,`u`,`u`"
  */
  FgColor = 19,

  /**
      "true" if a #GdkBitmap is set for stippling the background color.
  */
  BgStipple = 20,

  /**
      "true" if a #GdkBitmap is set for stippling the foreground color.
  */
  FgStipple = 21,

  /**
      The wrap mode of the text, if any. Values are "none", "char", "word", or "word_char".
  */
  WrapMode = 22,

  /**
      The direction of the text, if set. Values are "none", "ltr" or "rtl"
  */
  Direction = 23,

  /**
      The justification of the text, if set. Values are "left", "right", "center" or "fill"
  */
  Justification = 24,

  /**
      The stretch of the text, if set. Values are "ultra_condensed", "extra_condensed", "condensed", "semi_condensed", "normal", "semi_expanded", "expanded", "extra_expanded" or "ultra_expanded"
  */
  Stretch = 25,

  /**
      The capitalization variant of the text, if set. Values are "normal" or "small_caps"
  */
  Variant = 26,

  /**
      The slant style of the text, if set. Values are "normal", "oblique" or "italic"
  */
  Style = 27,

  /**
      The vertical position with respect to the baseline. Values are "baseline", "super", or "sub". Note that a super or sub text attribute refers to position with respect to the baseline of the prior character.
  */
  TextPosition = 28,

  /**
      not a valid text attribute, used for finding end of enumeration
  */
  LastDefined = 29,
}

/**
    Text boundary types used for specifying boundaries for regions of text.
    This enumeration is deprecated since 2.9.4 and should not be used. Use
    AtkTextGranularity with #atk_text_get_string_at_offset instead.
*/
enum AtkTextBoundary
{
  /**
      Boundary is the boundary between characters
      (including non-printing characters)
  */
  Char = 0,

  /**
      Boundary is the start (i.e. first character) of a word.
  */
  WordStart = 1,

  /**
      Boundary is the end (i.e. last
      character) of a word.
  */
  WordEnd = 2,

  /**
      Boundary is the first character in a sentence.
  */
  SentenceStart = 3,

  /**
      Boundary is the last (terminal)
      character in a sentence; in languages which use "sentence stop"
      punctuation such as English, the boundary is thus the '.', '?', or
      similar terminal punctuation character.
  */
  SentenceEnd = 4,

  /**
      Boundary is the initial character of the content or a
      character immediately following a newline, linefeed, or return character.
  */
  LineStart = 5,

  /**
      Boundary is the linefeed, or return
      character.
  */
  LineEnd = 6,
}

/**
    Describes the type of clipping required.
*/
enum AtkTextClipType
{
  /**
      No clipping to be done
  */
  None = 0,

  /**
      Text clipped by min coordinate is omitted
  */
  Min = 1,

  /**
      Text clipped by max coordinate is omitted
  */
  Max = 2,

  /**
      Only text fully within mix/max bound is retained
  */
  Both = 3,
}

/**
    Text granularity types used for specifying the granularity of the region of
    text we are interested in.
*/
enum AtkTextGranularity
{
  /**
      Granularity is defined by the boundaries between characters
      (including non-printing characters)
  */
  Char = 0,

  /**
      Granularity is defined by the boundaries of a word,
      starting at the beginning of the current word and finishing at the beginning of
      the following one, if present.
  */
  Word = 1,

  /**
      Granularity is defined by the boundaries of a sentence,
      starting at the beginning of the current sentence and finishing at the beginning of
      the following one, if present.
  */
  Sentence = 2,

  /**
      Granularity is defined by the boundaries of a line,
      starting at the beginning of the current line and finishing at the beginning of
      the following one, if present.
  */
  Line = 3,

  /**
      Granularity is defined by the boundaries of a paragraph,
      starting at the beginning of the current paragraph and finishing at the beginning of
      the following one, if present.
  */
  Paragraph = 4,
}

/**
    Default types for a given value. Those are defined in order to
    easily get localized strings to describe a given value or a given
    subrange, using [atk.global.valueTypeGetLocalizedName].
*/
enum AtkValueType
{
  /** */
  VeryWeak = 0,

  /** */
  Weak = 1,

  /** */
  Acceptable = 2,

  /** */
  Strong = 3,

  /** */
  VeryStrong = 4,

  /** */
  VeryLow = 5,

  /** */
  Low = 6,

  /** */
  Medium = 7,

  /** */
  High = 8,

  /** */
  VeryHigh = 9,

  /** */
  VeryBad = 10,

  /** */
  Bad = 11,

  /** */
  Good = 12,

  /** */
  VeryGood = 13,

  /** */
  Best = 14,

  /** */
  LastDefined = 15,
}

/**
    The ATK interface provided by UI components
    which the user can activate/interact with.
    
    #AtkAction should be implemented by instances of #AtkObject classes
    with which the user can interact directly, i.e. buttons,
    checkboxes, scrollbars, e.g. components which are not "passive"
    providers of UI information.
    
    Exceptions: when the user interaction is already covered by another
    appropriate interface such as #AtkEditableText (insert/delete text,
    etc.) or #AtkValue (set value) then these actions should not be
    exposed by #AtkAction as well.
    
    Though most UI interactions on components should be invocable via
    keyboard as well as mouse, there will generally be a close mapping
    between "mouse actions" that are possible on a component and the
    AtkActions.  Where mouse and keyboard actions are redundant in
    effect, #AtkAction should expose only one action rather than
    exposing redundant actions if possible.  By convention we have been
    using "mouse centric" terminology for #AtkAction names.
*/
struct AtkAction;

/**
    The #AtkAction interface should be supported by any object that can
    perform one or more actions. The interface provides the standard
    mechanism for an assistive technology to determine what those actions
    are as well as tell the object to perform them. Any object that can
    be manipulated should support this interface.
*/
struct AtkActionIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) gboolean function(AtkAction* action, int i) doAction;

  /** */
  extern(C) int function(AtkAction* action) getNActions;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getDescription;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getName;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getKeybinding;

  /** */
  extern(C) gboolean function(AtkAction* action, int i, const(char)* desc) setDescription;

  /** */
  extern(C) const(char)* function(AtkAction* action, int i) getLocalizedName;
}

/**
    AtkAttribute is a string name/value pair representing a generic
    attribute. This can be used to expose additional information from
    an accessible object as a whole (see [atk.object.ObjectWrap.getAttributes])
    or an document (see [atk.document.Document.getAttributes]). In the case of
    text attributes (see [atk.text.Text.getDefaultAttributes]),
    #AtkTextAttribute enum defines all the possible text attribute
    names. You can use [atk.global.textAttributeGetName] to get the string
    name from the enum value. See also [atk.global.textAttributeForName]
    and [atk.global.textAttributeGetValue] for more information.
    
    A string name/value pair representing a generic attribute.
*/
struct AtkAttribute
{
  /**
      The attribute name.
  */
  char* name;

  /**
      the value of the attribute, represented as a string.
  */
  char* value;
}

/**
    The ATK interface provided by UI components
    which occupy a physical area on the screen.
    which the user can activate/interact with.
    
    #AtkComponent should be implemented by most if not all UI elements
    with an actual on-screen presence, i.e. components which can be
    said to have a screen-coordinate bounding box.  Virtually all
    widgets will need to have #AtkComponent implementations provided
    for their corresponding #AtkObject class.  In short, only UI
    elements which are *not* GUI elements will omit this ATK interface.
    
    A possible exception might be textual information with a
    transparent background, in which case text glyph bounding box
    information is provided by #AtkText.
*/
struct AtkComponent;

/**
    The AtkComponent interface should be supported by any object that is
    rendered on the screen. The interface provides the standard mechanism
    for an assistive technology to determine and set the graphical
    representation of an object.
*/
struct AtkComponentIface
{
  /** */
  GTypeInterface parent;

  /**
      This virtual function is deprecated since 2.9.4
        and it should not be overriden. See [atk.component.Component.addFocusHandler]
        for more information.
  */
  extern(C) uint function(AtkComponent* component, AtkFocusHandler handler) addFocusHandler;

  /** */
  extern(C) gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) contains;

  /** */
  extern(C) AtkObject* function(AtkComponent* component, int x, int y, AtkCoordType coordType) refAccessibleAtPoint;

  /** */
  extern(C) void function(AtkComponent* component, int* x, int* y, int* width, int* height, AtkCoordType coordType) getExtents;

  /**
      This virtual function is deprecated since 2.12 and
        it should not be overriden. Use @AtkComponentIface.get_extents instead.
  */
  extern(C) void function(AtkComponent* component, int* x, int* y, AtkCoordType coordType) getPosition;

  /**
      This virtual function is deprecated since 2.12 and it
        should not be overriden. Use @AtkComponentIface.get_extents instead.
  */
  extern(C) void function(AtkComponent* component, int* width, int* height) getSize;

  /** */
  extern(C) gboolean function(AtkComponent* component) grabFocus;

  /**
      This virtual function is deprecated since
        2.9.4 and it should not be overriden. See [atk.component.Component.removeFocusHandler]
        for more information.
  */
  extern(C) void function(AtkComponent* component, uint handlerId) removeFocusHandler;

  /** */
  extern(C) gboolean function(AtkComponent* component, int x, int y, int width, int height, AtkCoordType coordType) setExtents;

  /** */
  extern(C) gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) setPosition;

  /** */
  extern(C) gboolean function(AtkComponent* component, int width, int height) setSize;

  /** */
  extern(C) AtkLayer function(AtkComponent* component) getLayer;

  /** */
  extern(C) int function(AtkComponent* component) getMdiZorder;

  /** */
  extern(C) void function(AtkComponent* component, AtkRectangle* bounds) boundsChanged;

  /** */
  extern(C) double function(AtkComponent* component) getAlpha;

  /** */
  extern(C) gboolean function(AtkComponent* component, AtkScrollType type) scrollTo;

  /** */
  extern(C) gboolean function(AtkComponent* component, AtkCoordType coords, int x, int y) scrollToPoint;
}

/**
    The ATK interface which represents the toplevel
     container for document content.
    
    The AtkDocument interface should be supported by any object whose
    content is a representation or view of a document.  The AtkDocument
    interface should appear on the toplevel container for the document
    content; however AtkDocument instances may be nested (i.e. an
    AtkDocument may be a descendant of another AtkDocument) in those
    cases where one document contains "embedded content" which can
    reasonably be considered a document in its own right.
*/
struct AtkDocument;

/** */
struct AtkDocumentIface
{
  /** */
  GTypeInterface parent;

  /**
      gets a string indicating the document
        type. This virtual function is deprecated since 2.12 and it
        should not be overriden.
  */
  extern(C) const(char)* function(AtkDocument* document) getDocumentType;

  /**
      a #GObject instance that implements
        AtkDocumentIface. This virtual method is deprecated since 2.12
        and it should not be overriden.
  */
  extern(C) void* function(AtkDocument* document) getDocument;

  /**
      gets locale. This virtual function is
        deprecated since 2.7.90 and it should not be overriden.
  */
  extern(C) const(char)* function(AtkDocument* document) getDocumentLocale;

  /**
      gets an AtkAttributeSet which describes
        document-wide attributes as name-value pairs.
  */
  extern(C) AtkAttributeSet* function(AtkDocument* document) getDocumentAttributes;

  /**
      returns a string value assocciated
        with the named attribute for this document, or NULL
  */
  extern(C) const(char)* function(AtkDocument* document, const(char)* attributeName) getDocumentAttributeValue;

  /**
      sets the value of an attribute. Returns
        TRUE on success, FALSE otherwise
  */
  extern(C) gboolean function(AtkDocument* document, const(char)* attributeName, const(char)* attributeValue) setDocumentAttribute;

  /**
      gets the current page number. Since 2.12
  */
  extern(C) int function(AtkDocument* document) getCurrentPageNumber;

  /**
      gets the page count of the document. Since 2.12
  */
  extern(C) int function(AtkDocument* document) getPageCount;

  /** */
  extern(C) GArray* function(AtkDocument* document) getTextSelections;

  /** */
  extern(C) gboolean function(AtkDocument* document, GArray* selections) setTextSelections;
}

/**
    The ATK interface implemented by components containing user-editable text content.
    
    #AtkEditableText should be implemented by UI components which
    contain text which the user can edit, via the #AtkObject
    corresponding to that component (see #AtkObject).
    
    #AtkEditableText is a subclass of #AtkText, and as such, an object
    which implements #AtkEditableText is by definition an #AtkText
    implementor as well.
    
    See `iface@AtkText`
*/
struct AtkEditableText;

/** */
struct AtkEditableTextIface
{
  /** */
  GTypeInterface parentInterface;

  /** */
  extern(C) gboolean function(AtkEditableText* text, AtkAttributeSet* attribSet, int startOffset, int endOffset) setRunAttributes;

  /** */
  extern(C) void function(AtkEditableText* text, const(char)* string_) setTextContents;

  /** */
  extern(C) void function(AtkEditableText* text, const(char)* string_, int length, int* position) insertText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) copyText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) cutText;

  /** */
  extern(C) void function(AtkEditableText* text, int startPos, int endPos) deleteText;

  /** */
  extern(C) void function(AtkEditableText* text, int position) pasteText;
}

/**
    This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
    
    This object class is derived from AtkObject. It can be used as a
    basis for implementing accessible objects for GObjects which are
    not derived from GtkWidget. One example of its use is in providing
    an accessible object for GnomeCanvasItem in the GAIL library.
*/
struct AtkGObjectAccessible
{
  /** */
  AtkObject parent;
}

/** */
struct AtkGObjectAccessibleClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    An ATK object which encapsulates a link or set of links in a hypertext document.
    
    An ATK object which encapsulates a link or set of links (for
    instance in the case of client-side image maps) in a hypertext
    document.  It may implement the AtkAction interface.  AtkHyperlink
    may also be used to refer to inline embedded content, since it
    allows specification of a start and end offset within the host
    AtkHypertext object.
*/
struct AtkHyperlink
{
  /** */
  GObject parent;
}

/** */
struct AtkHyperlinkClass
{
  /** */
  GObjectClass parent;

  /** */
  extern(C) char* function(AtkHyperlink* link, int i) getUri;

  /** */
  extern(C) AtkObject* function(AtkHyperlink* link, int i) getObject;

  /** */
  extern(C) int function(AtkHyperlink* link) getEndIndex;

  /** */
  extern(C) int function(AtkHyperlink* link) getStartIndex;

  /** */
  extern(C) gboolean function(AtkHyperlink* link) isValid;

  /** */
  extern(C) int function(AtkHyperlink* link) getNAnchors;

  /** */
  extern(C) uint function(AtkHyperlink* link) linkState;

  /** */
  extern(C) gboolean function(AtkHyperlink* link) isSelectedLink;

  /** */
  extern(C) void function(AtkHyperlink* link) linkActivated;

  /** */
  AtkFunction pad1;
}

/**
    A queryable interface which allows AtkHyperlink instances
    associated with an AtkObject to be obtained.  AtkHyperlinkImpl
    corresponds to AT-SPI's Hyperlink interface, and differs from
    AtkHyperlink in that AtkHyperlink is an object type, rather than an
    interface, and thus cannot be directly queried. FTW
*/
struct AtkHyperlinkImpl;

/** */
struct AtkHyperlinkImplIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkHyperlink* function(AtkHyperlinkImpl* impl) getHyperlink;
}

/**
    The ATK interface which provides standard mechanism for manipulating hyperlinks.
    
    An interface used for objects which implement linking between
    multiple resource or content locations, or multiple 'markers'
    within a single document.  A Hypertext instance is associated with
    one or more Hyperlinks, which are associated with particular
    offsets within the Hypertext's included content.  While this
    interface is derived from Text, there is no requirement that
    Hypertext instances have textual content; they may implement Image
    as well, and Hyperlinks need not have non-zero text offsets.
*/
struct AtkHypertext;

/** */
struct AtkHypertextIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkHyperlink* function(AtkHypertext* hypertext, int linkIndex) getLink;

  /** */
  extern(C) int function(AtkHypertext* hypertext) getNLinks;

  /** */
  extern(C) int function(AtkHypertext* hypertext, int charIndex) getLinkIndex;

  /** */
  extern(C) void function(AtkHypertext* hypertext, int linkIndex) linkSelected;
}

/**
    The ATK Interface implemented by components
     which expose image or pixmap content on-screen.
    
    #AtkImage should be implemented by #AtkObject subtypes on behalf of
    components which display image/pixmap information onscreen, and
    which provide information (other than just widget borders, etc.)
    via that image content.  For instance, icons, buttons with icons,
    toolbar elements, and image viewing panes typically should
    implement #AtkImage.
    
    #AtkImage primarily provides two types of information: coordinate
    information (useful for screen review mode of screenreaders, and
    for use by onscreen magnifiers), and descriptive information.  The
    descriptive information is provided for alternative, text-only
    presentation of the most significant information present in the
    image.
*/
struct AtkImage;

/** */
struct AtkImageIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) void function(AtkImage* image, int* x, int* y, AtkCoordType coordType) getImagePosition;

  /** */
  extern(C) const(char)* function(AtkImage* image) getImageDescription;

  /** */
  extern(C) void function(AtkImage* image, int* width, int* height) getImageSize;

  /** */
  extern(C) gboolean function(AtkImage* image, const(char)* description) setImageDescription;

  /** */
  extern(C) const(char)* function(AtkImage* image) getImageLocale;
}

/** */
struct AtkImplementor;

/**
    The AtkImplementor interface is implemented by objects for which
    AtkObject peers may be obtained via calls to
    iface->(ref_accessible)(implementor);
*/
struct AtkImplementorIface;

/**
    Encapsulates information about a key event.
*/
struct AtkKeyEventStruct
{
  /**
      An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
  */
  int type;

  /**
      A bitmask representing the state of the modifier keys immediately after the event takes place.
      The meaning of the bits is currently defined to match the bitmask used by GDK in
      GdkEventType.state, see
      http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html#GdkEventKey
  */
  uint state;

  /**
      A guint representing a keysym value corresponding to those used by GDK and X11: see
      /usr/X11/include/keysymdef.h.
  */
  uint keyval;

  /**
      The length of member #string.
  */
  int length;

  /**
      A string containing one of the following: either a string approximating the text that would
      result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress.
      Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0",
      "semicolon", "aacute".  Keypad keys have the prefix "KP".
  */
  char* string_;

  /**
      The raw hardware code that generated the key event.  This field is raraly useful.
  */
  ushort keycode;

  /**
      A timestamp in milliseconds indicating when the event occurred.
      These timestamps are relative to a starting point which should be considered arbitrary,
      and only used to compare the dispatch times of events to one another.
  */
  uint timestamp;
}

/**
    A set of ATK utility functions for thread locking
    
    A set of utility functions for thread locking. This interface and
    all his related methods are deprecated since 2.12.
*/
struct AtkMisc
{
  /** */
  GObject parent;
}

/**
    Usage of AtkMisc is deprecated since 2.12 and heavily discouraged.
*/
struct AtkMiscClass
{
  /** */
  GObjectClass parent;

  /**
      This virtual function is deprecated since 2.12 and
        it should not be overriden.
  */
  extern(C) void function(AtkMisc* misc) threadsEnter;

  /**
      This virtual function is deprecated sice 2.12 and
        it should not be overriden.
  */
  extern(C) void function(AtkMisc* misc) threadsLeave;

  /** */
  void*[32] vfuncs;
}

/**
    An AtkObject which purports to implement all ATK interfaces.
    
    An AtkNoOpObject is an AtkObject which purports to implement all
    ATK interfaces. It is the type of AtkObject which is created if an
    accessible object is requested for an object type for which no
    factory type is specified.
*/
struct AtkNoOpObject
{
  /** */
  AtkObject parent;
}

/** */
struct AtkNoOpObjectClass
{
  /** */
  AtkObjectClass parentClass;
}

/**
    The AtkObjectFactory which creates an AtkNoOpObject.
    
    The AtkObjectFactory which creates an AtkNoOpObject. An instance of
    this is created by an AtkRegistry if no factory type has not been
    specified to create an accessible object of a particular type.
*/
struct AtkNoOpObjectFactory
{
  /** */
  AtkObjectFactory parent;
}

/** */
struct AtkNoOpObjectFactoryClass
{
  /** */
  AtkObjectFactoryClass parentClass;
}

/** */
struct AtkObjectClass
{
  /** */
  GObjectClass parent;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getName;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getDescription;

  /** */
  extern(C) AtkObject* function(AtkObject* accessible) getParent;

  /** */
  extern(C) int function(AtkObject* accessible) getNChildren;

  /** */
  extern(C) AtkObject* function(AtkObject* accessible, int i) refChild;

  /** */
  extern(C) int function(AtkObject* accessible) getIndexInParent;

  /** */
  extern(C) AtkRelationSet* function(AtkObject* accessible) refRelationSet;

  /** */
  extern(C) AtkRole function(AtkObject* accessible) getRole;

  /** */
  extern(C) AtkLayer function(AtkObject* accessible) getLayer;

  /** */
  extern(C) int function(AtkObject* accessible) getMdiZorder;

  /** */
  extern(C) AtkStateSet* function(AtkObject* accessible) refStateSet;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* name) setName;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* description) setDescription;

  /** */
  extern(C) void function(AtkObject* accessible, AtkObject* parent) setParent;

  /** */
  extern(C) void function(AtkObject* accessible, AtkRole role) setRole;

  /**
      specifies a function to be called
        when a property changes value. This virtual function is
        deprecated since 2.12 and it should not be overriden. Connect
        directly to property-change or notify signal instead.
  */
  extern(C) uint function(AtkObject* accessible, AtkPropertyChangeHandler* handler) connectPropertyChangeHandler;

  /**
      removes a property changed handler
        as returned by @connect_property_change_handler. This virtual
        function is deprecated sice 2.12 and it should not be overriden.
  */
  extern(C) void function(AtkObject* accessible, uint handlerId) removePropertyChangeHandler;

  /** */
  extern(C) void function(AtkObject* accessible, void* data) initialize;

  /** */
  extern(C) void function(AtkObject* accessible, uint changeIndex, void* changedChild) childrenChanged;

  /**
      The signal handler which is executed when there is a
        focus event for an object. This virtual function is deprecated
        since 2.9.4 and it should not be overriden. Use
        the #AtkObject::state-change "focused" signal instead.
  */
  extern(C) void function(AtkObject* accessible, gboolean focusIn) focusEvent;

  /** */
  extern(C) void function(AtkObject* accessible, AtkPropertyValues* values) propertyChange;

  /** */
  extern(C) void function(AtkObject* accessible, const(char)* name, gboolean stateSet) stateChange;

  /** */
  extern(C) void function(AtkObject* accessible) visibleDataChanged;

  /** */
  extern(C) void function(AtkObject* accessible, void** child) activeDescendantChanged;

  /** */
  extern(C) AtkAttributeSet* function(AtkObject* accessible) getAttributes;

  /** */
  extern(C) const(char)* function(AtkObject* accessible) getObjectLocale;

  /** */
  AtkFunction pad1;
}

/**
    The base object class for a factory used to
     create accessible objects for objects of a specific GType.
    
    This class is the base object class for a factory used to create an
    accessible object for a specific GType. The function
    [atk.registry.Registry.setFactoryType] is normally called to store in the
    registry the factory type to be used to create an accessible of a
    particular GType.
*/
struct AtkObjectFactory
{
  /** */
  GObject parent;
}

/** */
struct AtkObjectFactoryClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) AtkObject* function(GObject* obj) createAccessible;

  /** */
  extern(C) void function(AtkObjectFactory* factory) invalidate;

  /** */
  extern(C) GType function() getAccessibleType;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    The base object class for the Accessibility Toolkit API.
    
    This class is the primary class for accessibility support via the
    Accessibility ToolKit (ATK).  Objects which are instances of
    #AtkObject (or instances of AtkObject-derived types) are queried
    for properties which relate basic (and generic) properties of a UI
    component such as name and description.  Instances of #AtkObject
    may also be queried as to whether they implement other ATK
    interfaces (e.g. #AtkAction, #AtkComponent, etc.), as appropriate
    to the role which a given UI component plays in a user interface.
    
    All UI components in an application which provide useful
    information or services to the user must provide corresponding
    #AtkObject instances on request (in GTK+, for instance, usually on
    a call to #gtk_widget_get_accessible ()), either via ATK support
    built into the toolkit for the widget class or ancestor class, or
    in the case of custom widgets, if the inherited #AtkObject
    implementation is insufficient, via instances of a new #AtkObject
    subclass.
    
    See `class@AtkObjectFactory`, `class@AtkRegistry`.  (GTK+ users see also
    #GtkAccessible).
*/
struct AtkObject
{
  /** */
  GObject parent;

  /** */
  char* description;

  /** */
  char* name;

  /** */
  AtkObject* accessibleParent;

  /** */
  AtkRole role;

  /** */
  AtkRelationSet* relationSet;

  /** */
  AtkLayer layer;
}

/**
    Toplevel for embedding into other processes
    
    See `class@AtkSocket`
*/
struct AtkPlug
{
  /** */
  AtkObject parent;
}

/** */
struct AtkPlugClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  extern(C) char* function(AtkPlug* obj) getObjectId;
}

/**
    Note: @old_value field of #AtkPropertyValues will not contain a
    valid value. This is a field defined with the purpose of contain
    the previous value of the property, but is not used anymore.
*/
struct AtkPropertyValues
{
  /**
      The name of the ATK property which has changed.
  */
  const(char)* propertyName;

  /**
      NULL. This field is not used anymore.
  */
  GValue oldValue;

  /**
      The new value of the named property.
  */
  GValue newValue;
}

/**
    A given range or subrange, to be used with #AtkValue
    
    #AtkRange are used on #AtkValue, in order to represent the full
    range of a given component (for example an slider or a range
    control), or to define each individual subrange this full range is
    splitted if available. See #AtkValue documentation for further
    details.
*/
struct AtkRange;

/**
    A data structure for holding a rectangle. Those coordinates are
    relative to the component top-level parent.
*/
struct AtkRectangle
{
  /**
      X coordinate of the left side of the rectangle.
  */
  int x;

  /**
      Y coordinate of the top side of the rectangle.
  */
  int y;

  /**
      width of the rectangle.
  */
  int width;

  /**
      height of the rectangle.
  */
  int height;
}

/**
    An object used to store the GType of the
    factories used to create an accessible object for an object of a
    particular GType.
    
    The AtkRegistry is normally used to create appropriate ATK "peers"
    for user interface components.  Application developers usually need
    only interact with the AtkRegistry by associating appropriate ATK
    implementation classes with GObject classes via the
    atk_registry_set_factory_type call, passing the appropriate GType
    for application custom widget classes.
*/
struct AtkRegistry
{
  /** */
  GObject parent;

  /** */
  GHashTable* factoryTypeRegistry;

  /** */
  GHashTable* factorySingletonCache;
}

/** */
struct AtkRegistryClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An object used to describe a relation between a
     object and one or more other objects.
    
    An AtkRelation describes a relation between an object and one or
    more other objects. The actual relations that an object has with
    other objects are defined as an AtkRelationSet, which is a set of
    AtkRelations.
*/
struct AtkRelation
{
  /** */
  GObject parent;

  /** */
  GPtrArray* target;

  /** */
  AtkRelationType relationship;
}

/** */
struct AtkRelationClass
{
  /** */
  GObjectClass parent;
}

/**
    A set of AtkRelations, normally the set of
     AtkRelations which an AtkObject has.
    
    The AtkRelationSet held by an object establishes its relationships
    with objects beyond the normal "parent/child" hierarchical
    relationships that all user interface objects have.
    AtkRelationSets establish whether objects are labelled or
    controlled by other components, share group membership with other
    components (for instance within a radio-button group), or share
    content which "flows" between them, among other types of possible
    relationships.
*/
struct AtkRelationSet
{
  /** */
  GObject parent;

  /** */
  GPtrArray* relations;
}

/** */
struct AtkRelationSetClass
{
  /** */
  GObjectClass parent;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;
}

/**
    The ATK interface implemented by container objects whose #AtkObject children can be selected.
    
    #AtkSelection should be implemented by UI components with children
    which are exposed by #atk_object_ref_child and
    #atk_object_get_n_children, if the use of the parent UI component
    ordinarily involves selection of one or more of the objects
    corresponding to those #AtkObject children - for example,
    selectable lists.
    
    Note that other types of "selection" (for instance text selection)
    are accomplished a other ATK interfaces - #AtkSelection is limited
    to the selection/deselection of children.
*/
struct AtkSelection;

/** */
struct AtkSelectionIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) gboolean function(AtkSelection* selection, int i) addSelection;

  /** */
  extern(C) gboolean function(AtkSelection* selection) clearSelection;

  /** */
  extern(C) AtkObject* function(AtkSelection* selection, int i) refSelection;

  /** */
  extern(C) int function(AtkSelection* selection) getSelectionCount;

  /** */
  extern(C) gboolean function(AtkSelection* selection, int i) isChildSelected;

  /** */
  extern(C) gboolean function(AtkSelection* selection, int i) removeSelection;

  /** */
  extern(C) gboolean function(AtkSelection* selection) selectAllSelection;

  /** */
  extern(C) void function(AtkSelection* selection) selectionChanged;
}

/**
    Container for AtkPlug objects from other processes
    
    Together with #AtkPlug, #AtkSocket provides the ability to embed
    accessibles from one process into another in a fashion that is
    transparent to assistive technologies. #AtkSocket works as the
    container of #AtkPlug, embedding it using the method
    [atk.socket.Socket.embed]. Any accessible contained in the #AtkPlug will
    appear to the assistive technologies as being inside the
    application that created the #AtkSocket.
    
    The communication between a #AtkSocket and a #AtkPlug is done by
    the IPC layer of the accessibility framework, normally implemented
    by the D-Bus based implementation of AT-SPI (at-spi2). If that is
    the case, at-spi-atk2 is the responsible to implement the abstract
    methods [atk.plug.Plug.getId] and [atk.socket.Socket.embed], so an ATK
    implementor shouldn't reimplement them. The process that contains
    the #AtkPlug is responsible to send the ID returned by
    atk_plug_id() to the process that contains the #AtkSocket, so it
    could call the method [atk.socket.Socket.embed] in order to embed it.
    
    For the same reasons, an implementor doesn't need to implement
    [atk.object.ObjectWrap.getNAccessibleChildren] and
    [atk.object.ObjectWrap.refAccessibleChild]. All the logic related to those
    functions will be implemented by the IPC layer.
    
    See `class@AtkPlug`
*/
struct AtkSocket
{
  /** */
  AtkObject parent;

  /** */
  char* embeddedPlugId;
}

/** */
struct AtkSocketClass
{
  /** */
  AtkObjectClass parentClass;

  /** */
  extern(C) void function(AtkSocket* obj, const(char)* plugId) embed;
}

/**
    An AtkStateSet contains the states of an object.
    
    An AtkStateSet is a read-only representation of the full set of #AtkStates
    that apply to an object at a given time. This set is not meant to be
    modified, but rather created when #[atk.object.ObjectWrap.refStateSet] is called.
*/
struct AtkStateSet
{
  /** */
  GObject parent;
}

/** */
struct AtkStateSetClass
{
  /** */
  GObjectClass parent;
}

/**
    The ATK interface which provides access to streamable content.
    
    An interface whereby an object allows its backing content to be
    streamed to clients.  Typical implementors would be images or
    icons, HTML content, or multimedia display/rendering widgets.
    
    Negotiation of content type is allowed. Clients may examine the
    backing data and transform, convert, or parse the content in order
    to present it in an alternate form to end-users.
    
    The AtkStreamableContent interface is particularly useful for
    saving, printing, or post-processing entire documents, or for
    persisting alternate views of a document. If document content
    itself is being serialized, stored, or converted, then use of the
    AtkStreamableContent interface can help address performance
    issues. Unlike most ATK interfaces, this interface is not strongly
    tied to the current user-agent view of the a particular document,
    but may in some cases give access to the underlying model data.
*/
struct AtkStreamableContent;

/** */
struct AtkStreamableContentIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) int function(AtkStreamableContent* streamable) getNMimeTypes;

  /** */
  extern(C) const(char)* function(AtkStreamableContent* streamable, int i) getMimeType;

  /** */
  extern(C) GIOChannel* function(AtkStreamableContent* streamable, const(char)* mimeType) getStream;

  /** */
  extern(C) const(char)* function(AtkStreamableContent* streamable, const(char)* mimeType) getUri;

  /** */
  AtkFunction pad1;

  /** */
  AtkFunction pad2;

  /** */
  AtkFunction pad3;
}

/**
    The ATK interface implemented for UI components which contain tabular or row/column information.
    
    #AtkTable should be implemented by components which present
    elements ordered via rows and columns.  It may also be used to
    present tree-structured information if the nodes of the trees can
    be said to contain multiple "columns".  Individual elements of an
    #AtkTable are typically referred to as "cells". Those cells should
    implement the interface #AtkTableCell, but #Atk doesn't require
    them to be direct children of the current #AtkTable. They can be
    grand-children, grand-grand-children etc. #AtkTable provides the
    API needed to get a individual cell based on the row and column
    numbers.
    
    Children of #AtkTable are frequently "lightweight" objects, that
    is, they may not have backing widgets in the host UI toolkit.  They
    are therefore often transient.
    
    Since tables are often very complex, #AtkTable includes provision
    for offering simplified summary information, as well as row and
    column headers and captions.  Headers and captions are #AtkObjects
    which may implement other interfaces (#AtkText, #AtkImage, etc.) as
    appropriate.  #AtkTable summaries may themselves be (simplified)
    #AtkTables, etc.
    
    Note for implementors: in the past, #AtkTable required that all the
    cells should be direct children of #AtkTable, and provided some
    index based methods to request the cells. The practice showed that
    that forcing made #AtkTable implementation complex, and hard to
    expose other kind of children, like rows or captions. Right now,
    index-based methods are deprecated.
*/
struct AtkTable;

/**
    The ATK interface implemented for a cell inside a two-dimentional #AtkTable
    
    Being #AtkTable a component which present elements ordered via rows
    and columns, an #AtkTableCell is the interface which each of those
    elements, so "cells" should implement.
    
    See `iface@AtkTable`
*/
struct AtkTableCell;

/**
    AtkTableCell is an interface for cells inside an #AtkTable.
*/
struct AtkTableCellIface
{
  /** */
  GTypeInterface parent;

  /**
      virtual function that returns the number of
        columns occupied by this cell accessible
  */
  extern(C) int function(AtkTableCell* cell) getColumnSpan;

  /**
      virtual function that returns the column
        headers as an array of cell accessibles
  */
  extern(C) GPtrArray* function(AtkTableCell* cell) getColumnHeaderCells;

  /**
      virtual function that retrieves the tabular position
        of this cell
  */
  extern(C) gboolean function(AtkTableCell* cell, int* row, int* column) getPosition;

  /**
      virtual function that returns the number of rows
        occupied by this cell
  */
  extern(C) int function(AtkTableCell* cell) getRowSpan;

  /**
      virtual function that returns the row
        headers as an array of cell accessibles
  */
  extern(C) GPtrArray* function(AtkTableCell* cell) getRowHeaderCells;

  /**
      virtual function that get the row an column
        indexes and span of this cell
  */
  extern(C) gboolean function(AtkTableCell* cell, int* row, int* column, int* rowSpan, int* columnSpan) getRowColumnSpan;

  /**
      virtual function that returns a reference to the
        accessible of the containing table
  */
  extern(C) AtkObject* function(AtkTableCell* cell) getTable;
}

/** */
struct AtkTableIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int row, int column) refAt;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getIndexAt;

  /** */
  extern(C) int function(AtkTable* table, int index) getColumnAtIndex;

  /** */
  extern(C) int function(AtkTable* table, int index) getRowAtIndex;

  /** */
  extern(C) int function(AtkTable* table) getNColumns;

  /** */
  extern(C) int function(AtkTable* table) getNRows;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getColumnExtentAt;

  /** */
  extern(C) int function(AtkTable* table, int row, int column) getRowExtentAt;

  /** */
  extern(C) AtkObject* function(AtkTable* table) getCaption;

  /** */
  extern(C) const(char)* function(AtkTable* table, int column) getColumnDescription;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int column) getColumnHeader;

  /** */
  extern(C) const(char)* function(AtkTable* table, int row) getRowDescription;

  /** */
  extern(C) AtkObject* function(AtkTable* table, int row) getRowHeader;

  /** */
  extern(C) AtkObject* function(AtkTable* table) getSummary;

  /** */
  extern(C) void function(AtkTable* table, AtkObject* caption) setCaption;

  /** */
  extern(C) void function(AtkTable* table, int column, const(char)* description) setColumnDescription;

  /** */
  extern(C) void function(AtkTable* table, int column, AtkObject* header) setColumnHeader;

  /** */
  extern(C) void function(AtkTable* table, int row, const(char)* description) setRowDescription;

  /** */
  extern(C) void function(AtkTable* table, int row, AtkObject* header) setRowHeader;

  /** */
  extern(C) void function(AtkTable* table, AtkObject* accessible) setSummary;

  /** */
  extern(C) int function(AtkTable* table, int** selected) getSelectedColumns;

  /** */
  extern(C) int function(AtkTable* table, int** selected) getSelectedRows;

  /** */
  extern(C) gboolean function(AtkTable* table, int column) isColumnSelected;

  /** */
  extern(C) gboolean function(AtkTable* table, int row) isRowSelected;

  /** */
  extern(C) gboolean function(AtkTable* table, int row, int column) isSelected;

  /** */
  extern(C) gboolean function(AtkTable* table, int row) addRowSelection;

  /** */
  extern(C) gboolean function(AtkTable* table, int row) removeRowSelection;

  /** */
  extern(C) gboolean function(AtkTable* table, int column) addColumnSelection;

  /** */
  extern(C) gboolean function(AtkTable* table, int column) removeColumnSelection;

  /** */
  extern(C) void function(AtkTable* table, int row, int numInserted) rowInserted;

  /** */
  extern(C) void function(AtkTable* table, int column, int numInserted) columnInserted;

  /** */
  extern(C) void function(AtkTable* table, int row, int numDeleted) rowDeleted;

  /** */
  extern(C) void function(AtkTable* table, int column, int numDeleted) columnDeleted;

  /** */
  extern(C) void function(AtkTable* table) rowReordered;

  /** */
  extern(C) void function(AtkTable* table) columnReordered;

  /** */
  extern(C) void function(AtkTable* table) modelChanged;
}

/**
    The ATK interface implemented by components with text content.
    
    #AtkText should be implemented by #AtkObjects on behalf of widgets
    that have text content which is either attributed or otherwise
    non-trivial.  #AtkObjects whose text content is simple,
    unattributed, and very brief may expose that content via
    #atk_object_get_name instead; however if the text is editable,
    multi-line, typically longer than three or four words, attributed,
    selectable, or if the object already uses the 'name' ATK property
    for other information, the #AtkText interface should be used to
    expose the text content.  In the case of editable text content,
    #AtkEditableText (a subtype of the #AtkText interface) should be
    implemented instead.
    
     #AtkText provides not only traversal facilities and change
    notification for text content, but also caret tracking and glyph
    bounding box calculations.  Note that the text strings are exposed
    as UTF-8, and are therefore potentially multi-byte, and
    caret-to-byte offset mapping makes no assumptions about the
    character length; also bounding box glyph-to-offset mapping may be
    complex for languages which use ligatures.
*/
struct AtkText;

/** */
struct AtkTextIface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) char* function(AtkText* text, int startOffset, int endOffset) getText;

  /**
      Gets specified text. This virtual function
        is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextAfterOffset;

  /**
      Gets specified text. This virtual function
        is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextAtOffset;

  /** */
  extern(C) dchar function(AtkText* text, int offset) getCharacterAtOffset;

  /**
      Gets specified text. This virtual function
        is deprecated and it should not be overridden.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) getTextBeforeOffset;

  /** */
  extern(C) int function(AtkText* text) getCaretOffset;

  /** */
  extern(C) AtkAttributeSet* function(AtkText* text, int offset, int* startOffset, int* endOffset) getRunAttributes;

  /** */
  extern(C) AtkAttributeSet* function(AtkText* text) getDefaultAttributes;

  /** */
  extern(C) void function(AtkText* text, int offset, int* x, int* y, int* width, int* height, AtkCoordType coords) getCharacterExtents;

  /** */
  extern(C) int function(AtkText* text) getCharacterCount;

  /** */
  extern(C) int function(AtkText* text, int x, int y, AtkCoordType coords) getOffsetAtPoint;

  /** */
  extern(C) int function(AtkText* text) getNSelections;

  /** */
  extern(C) char* function(AtkText* text, int selectionNum, int* startOffset, int* endOffset) getSelection;

  /** */
  extern(C) gboolean function(AtkText* text, int startOffset, int endOffset) addSelection;

  /** */
  extern(C) gboolean function(AtkText* text, int selectionNum) removeSelection;

  /** */
  extern(C) gboolean function(AtkText* text, int selectionNum, int startOffset, int endOffset) setSelection;

  /** */
  extern(C) gboolean function(AtkText* text, int offset) setCaretOffset;

  /**
      the signal handler which is executed when there is a
        text change. This virtual function is deprecated sice 2.9.4 and
        it should not be overriden.
  */
  extern(C) void function(AtkText* text, int position, int length) textChanged;

  /** */
  extern(C) void function(AtkText* text, int location) textCaretMoved;

  /** */
  extern(C) void function(AtkText* text) textSelectionChanged;

  /** */
  extern(C) void function(AtkText* text) textAttributesChanged;

  /** */
  extern(C) void function(AtkText* text, int startOffset, int endOffset, AtkCoordType coordType, AtkTextRectangle* rect) getRangeExtents;

  /** */
  extern(C) AtkTextRange** function(AtkText* text, AtkTextRectangle* rect, AtkCoordType coordType, AtkTextClipType xClipType, AtkTextClipType yClipType) getBoundedRanges;

  /**
      Gets a portion of the text exposed through
        an AtkText according to a given offset and a specific
        granularity, along with the start and end offsets defining the
        boundaries of such a portion of text.
  */
  extern(C) char* function(AtkText* text, int offset, AtkTextGranularity granularity, int* startOffset, int* endOffset) getStringAtOffset;

  /** */
  extern(C) gboolean function(AtkText* text, int startOffset, int endOffset, AtkScrollType type) scrollSubstringTo;

  /** */
  extern(C) gboolean function(AtkText* text, int startOffset, int endOffset, AtkCoordType coords, int x, int y) scrollSubstringToPoint;
}

/**
    A structure used to describe a text range.
*/
struct AtkTextRange
{
  /**
      A rectangle giving the bounds of the text range
  */
  AtkTextRectangle bounds;

  /**
      The start offset of a AtkTextRange
  */
  int startOffset;

  /**
      The end offset of a AtkTextRange
  */
  int endOffset;

  /**
      The text in the text range
  */
  char* content;
}

/**
    A structure used to store a rectangle used by AtkText.
*/
struct AtkTextRectangle
{
  /**
      The horizontal coordinate of a rectangle
  */
  int x;

  /**
      The vertical coordinate of a rectangle
  */
  int y;

  /**
      The width of a rectangle
  */
  int width;

  /**
      The height of a rectangle
  */
  int height;
}

/**
    This structure represents a single  text selection within a document. This
    selection is defined by two points in the content, where each one is defined
    by an AtkObject supporting the AtkText interface and a character offset
    relative to it.
    
    The end object must appear after the start object in the accessibility tree,
    i.e. the end object must be reachable from the start object by navigating
    forward (next, first child etc).
    
    This struct also contains a @start_is_active boolean, to communicate if the
    start of the selection is the active point or not.
    
    The active point corresponds to the user's focus or point of interest. The
    user moves the active point to expand or collapse the range. The anchor
    point is the other point of the range and typically remains constant. In
    most cases, anchor is the start of the range and active is the end. However,
    when selecting backwards (e.g. pressing shift+left arrow in a text field),
    the start of the range is the active point, as the user moves this to
    manipulate the selection.
*/
struct AtkTextSelection
{
  /**
      the AtkText containing the start of the selection.
  */
  AtkObject* startObject;

  /**
      the text offset of the beginning of the selection within
                     @start_object.
  */
  int startOffset;

  /**
      the AtkText containing the end of the selection.
  */
  AtkObject* endObject;

  /**
      the text offset of the end of the selection within @end_object.
  */
  int endOffset;

  /**
      a gboolean indicating whether the start of the selection
                       is the active point.
  */
  gboolean startIsActive;
}

/**
    A set of ATK utility functions for event and toolkit support.
    
    A set of ATK utility functions which are used to support event
    registration of various types, and obtaining the 'root' accessible
    of a process and information about the current ATK implementation
    and toolkit version.
*/
struct AtkUtil
{
  /** */
  GObject parent;
}

/** */
struct AtkUtilClass
{
  /** */
  GObjectClass parent;

  /**
      adds the specified function to the list
       of functions to be called when an ATK event occurs. ATK
       implementors are discouraged from reimplementing this method.
  */
  extern(C) uint function(GSignalEmissionHook listener, const(char)* eventType) addGlobalEventListener;

  /**
      removes the specified function to
       the list of functions to be called when an ATK event occurs. ATK
       implementors are discouraged from reimplementing this method.
  */
  extern(C) void function(uint listenerId) removeGlobalEventListener;

  /**
      adds the specified function to the list of
       functions to be called when a key event occurs.
  */
  extern(C) uint function(AtkKeySnoopFunc listener, void* data) addKeyEventListener;

  /**
      remove the specified function to the
       list of functions to be called when a key event occurs.
  */
  extern(C) void function(uint listenerId) removeKeyEventListener;

  /**
      gets the root accessible container for the current
       application.
  */
  extern(C) AtkObject* function() getRoot;

  /**
      gets name string for the GUI toolkit
       implementing ATK for this application.
  */
  extern(C) const(char)* function() getToolkitName;

  /**
      gets version string for the GUI toolkit
       implementing ATK for this application.
  */
  extern(C) const(char)* function() getToolkitVersion;
}

/**
    The ATK interface implemented by valuators and components which display or select a value from a bounded range of values.
    
    #AtkValue should be implemented for components which either display
    a value from a bounded range, or which allow the user to specify a
    value from a bounded range, or both. For instance, most sliders and
    range controls, as well as dials, should have #AtkObject
    representations which implement #AtkValue on the component's
    behalf. #AtKValues may be read-only, in which case attempts to
    alter the value return would fail.
    
    <refsect1 id="current-value-text">
    <title>On the subject of current value text</title>
    <para>
    In addition to providing the current value, implementors can
    optionally provide an end-user-consumable textual description
    associated with this value. This description should be included
    when the numeric value fails to convey the full, on-screen
    representation seen by users.
    </para>
    
    <example>
    <title>Password strength</title>
    A password strength meter whose value changes as the user types
    their new password. Red is used for values less than 4.0, yellow
    for values between 4.0 and 7.0, and green for values greater than
    7.0. In this instance, value text should be provided by the
    implementor. Appropriate value text would be "weak", "acceptable,"
    and "strong" respectively.
    </example>
    
    A level bar whose value changes to reflect the battery charge. The
    color remains the same regardless of the charge and there is no
    on-screen text reflecting the fullness of the battery. In this
    case, because the position within the bar is the only indication
    the user has of the current charge, value text should not be
    provided by the implementor.
    
    <refsect2 id="implementor-notes">
    <title>Implementor Notes</title>
    <para>
    Implementors should bear in mind that assistive technologies will
    likely prefer the value text provided over the numeric value when
    presenting a widget's value. As a result, strings not intended for
    end users should not be exposed in the value text, and strings
    which are exposed should be localized. In the case of widgets which
    display value text on screen, for instance through a separate label
    in close proximity to the value-displaying widget, it is still
    expected that implementors will expose the value text using the
    above API.
    </para>
    
    <para>
    #AtkValue should NOT be implemented for widgets whose displayed
    value is not reflective of a meaningful amount. For instance, a
    progress pulse indicator whose value alternates between 0.0 and 1.0
    to indicate that some process is still taking place should not
    implement #AtkValue because the current value does not reflect
    progress towards completion.
    </para>
    </refsect2>
    </refsect1>
    
    <refsect1 id="ranges">
    <title>On the subject of ranges</title>
    <para>
    In addition to providing the minimum and maximum values,
    implementors can optionally provide details about subranges
    associated with the widget. These details should be provided by the
    implementor when both of the following are communicated visually to
    the end user:
    </para>
    <itemizedlist>
      <listitem>The existence of distinct ranges such as "weak",
      "acceptable", and "strong" indicated by color, bar tick marks,
      and/or on-screen text.</listitem>
      <listitem>Where the current value stands within a given subrange,
      for instance illustrating progression from very "weak" towards
      nearly "acceptable" through changes in shade and/or position on
      the bar within the "weak" subrange.</listitem>
    </itemizedlist>
    <para>
    If both of the above do not apply to the widget, it should be
    sufficient to expose the numeric value, along with the value text
    if appropriate, to make the widget accessible.
    </para>
    
    <refsect2 id="ranges-implementor-notes">
    <title>Implementor Notes</title>
    <para>
    If providing subrange details is deemed necessary, all possible
    values of the widget are expected to fall within one of the
    subranges defined by the implementor.
    </para>
    </refsect2>
    </refsect1>
    
    <refsect1 id="localization">
    <title>On the subject of localization of end-user-consumable text
    values</title>
    <para>
    Because value text and subrange descriptors are human-consumable,
    implementors are expected to provide localized strings which can be
    directly presented to end users via their assistive technology. In
    order to simplify this for implementors, implementors can use
    [atk.global.valueTypeGetLocalizedName] with the following
    already-localized constants for commonly-needed values can be used:
    </para>
    
    <itemizedlist>
      <listitem>ATK_VALUE_VERY_WEAK</listitem>
      <listitem>ATK_VALUE_WEAK</listitem>
      <listitem>ATK_VALUE_ACCEPTABLE</listitem>
      <listitem>ATK_VALUE_STRONG</listitem>
      <listitem>ATK_VALUE_VERY_STRONG</listitem>
      <listitem>ATK_VALUE_VERY_LOW</listitem>
      <listitem>ATK_VALUE_LOW</listitem>
      <listitem>ATK_VALUE_MEDIUM</listitem>
      <listitem>ATK_VALUE_HIGH</listitem>
      <listitem>ATK_VALUE_VERY_HIGH</listitem>
      <listitem>ATK_VALUE_VERY_BAD</listitem>
      <listitem>ATK_VALUE_BAD</listitem>
      <listitem>ATK_VALUE_GOOD</listitem>
      <listitem>ATK_VALUE_VERY_GOOD</listitem>
      <listitem>ATK_VALUE_BEST</listitem>
      <listitem>ATK_VALUE_SUBSUBOPTIMAL</listitem>
      <listitem>ATK_VALUE_SUBOPTIMAL</listitem>
      <listitem>ATK_VALUE_OPTIMAL</listitem>
    </itemizedlist>
    <para>
    Proposals for additional constants, along with their use cases,
    should be submitted to the GNOME Accessibility Team.
    </para>
    </refsect1>
    
    <refsect1 id="changes">
    <title>On the subject of changes</title>
    <para>
    Note that if there is a textual description associated with the new
    numeric value, that description should be included regardless of
    whether or not it has also changed.
    </para>
    </refsect1>
*/
struct AtkValue;

/** */
struct AtkValueIface
{
  /** */
  GTypeInterface parent;

  /**
      This virtual function is deprecated since 2.12
       and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getCurrentValue;

  /**
      This virtual function is deprecated since 2.12
       and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMaximumValue;

  /**
      This virtual function is deprecated since 2.12
       and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMinimumValue;

  /**
      This virtual function is deprecated since 2.12
       and it should not be overriden.
  */
  extern(C) gboolean function(AtkValue* obj, const(GValue)* value) setCurrentValue;

  /**
      This virtual function is deprecated since
       2.12 and it should not be overriden.
  */
  extern(C) void function(AtkValue* obj, GValue* value) getMinimumIncrement;

  /**
      gets the current value and the human readable
      text alternative (if available) of this object. Since 2.12.
  */
  extern(C) void function(AtkValue* obj, double* value, char** text) getValueAndText;

  /**
      gets the range that defines the minimum and maximum
       value of this object. Returns NULL if there is no range
       defined. Since 2.12.
  */
  extern(C) AtkRange* function(AtkValue* obj) getRange;

  /**
      gets the minimum increment by which the value of
       this object may be changed. If zero it is undefined. Since 2.12.
  */
  extern(C) double function(AtkValue* obj) getIncrement;

  /**
      returns a list of different subranges, and their
       description (if available) of this object. Returns NULL if there
       is not subranges defined. Since 2.12.
  */
  extern(C) GSList* function(AtkValue* obj) getSubRanges;

  /**
      sets the value of this object. Since 2.12.
  */
  extern(C) void function(AtkValue* obj, double newValue) setValue;
}

/**
    The ATK Interface provided by UI components that represent a top-level window.
    
    #AtkWindow should be implemented by the UI elements that represent
    a top-level window, such as the main window of an application or
    dialog.
    
    See `class@AtkObject`
*/
struct AtkWindow;

/** */
struct AtkWindowIface
{
  /** */
  GTypeInterface parent;
}

alias extern(C) void function(AtkObject* obj) AtkEventListener;

alias extern(C) void function() AtkEventListenerInit;

alias extern(C) void function(AtkObject* object, gboolean focusIn) AtkFocusHandler;

alias extern(C) gboolean function(void* userData) AtkFunction;

alias extern(C) int function(AtkKeyEventStruct* event, void* userData) AtkKeySnoopFunc;

alias extern(C) void function(AtkObject* obj, AtkPropertyValues* vals) AtkPropertyChangeHandler;

