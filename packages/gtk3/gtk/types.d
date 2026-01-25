/// D types for gtk3 library
module gtk.types;

import gdk.atom;
import gdk.color;
import gdk.display;
import gdk.event_key;
import gdk.frame_clock;
import gdk.rectangle;
import gdk.screen;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.string_;
import gobject.closure;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gtk.accel_group;
import gtk.builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.calendar;
import gtk.cell_layout;
import gtk.cell_renderer;
import gtk.clipboard;
import gtk.entry_completion;
import gtk.file_filter_info;
import gtk.flow_box;
import gtk.flow_box_child;
import gtk.icon_view;
import gtk.list_box;
import gtk.list_box_row;
import gtk.menu;
import gtk.page_setup;
import gtk.recent_filter_info;
import gtk.recent_info;
import gtk.selection_data;
import gtk.text_buffer;
import gtk.text_iter;
import gtk.text_tag;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_path;
import gtk.tree_selection;
import gtk.tree_view;
import gtk.tree_view_column;
import gtk.widget;
import pango.font_face;
import pango.font_family;


// Aliases

/** */
alias Allocation = gdk.rectangle.Rectangle;

/** */
alias Stock = GtkStock;

// Enums

/** */
alias AccelFlags = GtkAccelFlags;

/** */
alias Align = GtkAlign;

/** */
alias ApplicationInhibitFlags = GtkApplicationInhibitFlags;

/** */
alias ArrowPlacement = GtkArrowPlacement;

/** */
alias ArrowType = GtkArrowType;

/** */
alias AssistantPageType = GtkAssistantPageType;

/** */
alias AttachOptions = GtkAttachOptions;

/** */
alias BaselinePosition = GtkBaselinePosition;

/** */
alias BorderStyle = GtkBorderStyle;

/** */
alias BuilderError = GtkBuilderError;

/** */
alias ButtonBoxStyle = GtkButtonBoxStyle;

/** */
alias ButtonRole = GtkButtonRole;

/** */
alias ButtonsType = GtkButtonsType;

/** */
alias CalendarDisplayOptions = GtkCalendarDisplayOptions;

/** */
alias CellRendererAccelMode = GtkCellRendererAccelMode;

/** */
alias CellRendererMode = GtkCellRendererMode;

/** */
alias CellRendererState = GtkCellRendererState;

/** */
alias CornerType = GtkCornerType;

/** */
alias CssProviderError = GtkCssProviderError;

/** */
alias CssSectionType = GtkCssSectionType;

/** */
alias DebugFlag = GtkDebugFlag;

/** */
alias DeleteType = GtkDeleteType;

/** */
alias DestDefaults = GtkDestDefaults;

/** */
alias DialogFlags = GtkDialogFlags;

/** */
alias DirectionType = GtkDirectionType;

/** */
alias DragResult = GtkDragResult;

/** */
alias EntryIconPosition = GtkEntryIconPosition;

/** */
alias EventControllerScrollFlags = GtkEventControllerScrollFlags;

/** */
alias EventSequenceState = GtkEventSequenceState;

/** */
alias ExpanderStyle = GtkExpanderStyle;

/** */
alias FileChooserAction = GtkFileChooserAction;

/** */
alias FileChooserConfirmation = GtkFileChooserConfirmation;

/** */
alias FileChooserError = GtkFileChooserError;

/** */
alias FileFilterFlags = GtkFileFilterFlags;

/** */
alias FontChooserLevel = GtkFontChooserLevel;

/** */
alias IMPreeditStyle = GtkIMPreeditStyle;

/** */
alias IMStatusStyle = GtkIMStatusStyle;

/** */
alias IconLookupFlags = GtkIconLookupFlags;

/** */
alias IconSize = GtkIconSize;

/** */
alias IconThemeError = GtkIconThemeError;

/** */
alias IconViewDropPosition = GtkIconViewDropPosition;

/** */
alias ImageType = GtkImageType;

/** */
alias InputHints = GtkInputHints;

/** */
alias InputPurpose = GtkInputPurpose;

/** */
alias JunctionSides = GtkJunctionSides;

/** */
alias Justification = GtkJustification;

/** */
alias LevelBarMode = GtkLevelBarMode;

/** */
alias License = GtkLicense;

/** */
alias MenuDirectionType = GtkMenuDirectionType;

/** */
alias MessageType = GtkMessageType;

/** */
alias MovementStep = GtkMovementStep;

/** */
alias NotebookTab = GtkNotebookTab;

/** */
alias NumberUpLayout = GtkNumberUpLayout;

/** */
alias Orientation = GtkOrientation;

/** */
alias PackDirection = GtkPackDirection;

/** */
alias PackType = GtkPackType;

/** */
alias PadActionType = GtkPadActionType;

/** */
alias PageOrientation = GtkPageOrientation;

/** */
alias PageSet = GtkPageSet;

/** */
alias PanDirection = GtkPanDirection;

/** */
alias PathPriorityType = GtkPathPriorityType;

/** */
alias PathType = GtkPathType;

/** */
alias PlacesOpenFlags = GtkPlacesOpenFlags;

/** */
alias PolicyType = GtkPolicyType;

/** */
alias PopoverConstraint = GtkPopoverConstraint;

/** */
alias PositionType = GtkPositionType;

/** */
alias PrintDuplex = GtkPrintDuplex;

/** */
alias PrintError = GtkPrintError;

/** */
alias PrintOperationAction = GtkPrintOperationAction;

/** */
alias PrintOperationResult = GtkPrintOperationResult;

/** */
alias PrintPages = GtkPrintPages;

/** */
alias PrintQuality = GtkPrintQuality;

/** */
alias PrintStatus = GtkPrintStatus;

/** */
alias PropagationPhase = GtkPropagationPhase;

/** */
alias RcFlags = GtkRcFlags;

/** */
alias RcTokenType = GtkRcTokenType;

/** */
alias RecentChooserError = GtkRecentChooserError;

/** */
alias RecentFilterFlags = GtkRecentFilterFlags;

/** */
alias RecentManagerError = GtkRecentManagerError;

/** */
alias RecentSortType = GtkRecentSortType;

/** */
alias RegionFlags = GtkRegionFlags;

/** */
alias ReliefStyle = GtkReliefStyle;

/** */
alias ResizeMode = GtkResizeMode;

/** */
alias ResponseType = GtkResponseType;

/** */
alias RevealerTransitionType = GtkRevealerTransitionType;

/** */
alias ScrollStep = GtkScrollStep;

/** */
alias ScrollType = GtkScrollType;

/** */
alias ScrollablePolicy = GtkScrollablePolicy;

/** */
alias SelectionMode = GtkSelectionMode;

/** */
alias SensitivityType = GtkSensitivityType;

/** */
alias ShadowType = GtkShadowType;

/** */
alias ShortcutType = GtkShortcutType;

/** */
alias SizeGroupMode = GtkSizeGroupMode;

/** */
alias SizeRequestMode = GtkSizeRequestMode;

/** */
alias SortType = GtkSortType;

/** */
alias SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy;

/** */
alias SpinType = GtkSpinType;

/** */
alias StackTransitionType = GtkStackTransitionType;

/** */
alias StateFlags = GtkStateFlags;

/** */
alias StateType = GtkStateType;

/** */
alias StyleContextPrintFlags = GtkStyleContextPrintFlags;

/** */
alias TargetFlags = GtkTargetFlags;

/** */
alias TextBufferTargetInfo = GtkTextBufferTargetInfo;

/** */
alias TextDirection = GtkTextDirection;

/** */
alias TextExtendSelection = GtkTextExtendSelection;

/** */
alias TextSearchFlags = GtkTextSearchFlags;

/** */
alias TextViewLayer = GtkTextViewLayer;

/** */
alias TextWindowType = GtkTextWindowType;

/** */
alias ToolPaletteDragTargets = GtkToolPaletteDragTargets;

/** */
alias ToolbarSpaceStyle = GtkToolbarSpaceStyle;

/** */
alias ToolbarStyle = GtkToolbarStyle;

/** */
alias TreeModelFlags = GtkTreeModelFlags;

/** */
alias TreeViewColumnSizing = GtkTreeViewColumnSizing;

/** */
alias TreeViewDropPosition = GtkTreeViewDropPosition;

/** */
alias TreeViewGridLines = GtkTreeViewGridLines;

/** */
alias UIManagerItemType = GtkUIManagerItemType;

/** */
alias Unit = GtkUnit;

/** */
alias WidgetHelpType = GtkWidgetHelpType;

/** */
alias WindowPosition = GtkWindowPosition;

/** */
alias WindowType = GtkWindowType;

/** */
alias WrapMode = GtkWrapMode;

// Structs

/** */
alias AccelKey = GtkAccelKey;

/** */
alias LabelSelectionInfo = GtkLabelSelectionInfo*;

/** */
alias PageRange = GtkPageRange;

/** */
alias RcContext = GtkRcContext*;

/** */
alias RequestedSize = GtkRequestedSize;

/** */
alias TableRowCol = GtkTableRowCol;

/** */
alias TextBTree = GtkTextBTree*;

/** */
alias ThemeEngine = GtkThemeEngine*;

/** */
alias WindowGeometryInfo = GtkWindowGeometryInfo*;

/** */
alias _MountOperationHandler = _GtkMountOperationHandler*;

// Callbacks

/** */
alias AccelGroupActivate = bool delegate(gtk.accel_group.AccelGroup accelGroup, gobject.object.ObjectWrap acceleratable, uint keyval, gdk.types.ModifierType modifier);

/** */
alias AccelGroupFindFunc = bool delegate(gtk.types.AccelKey key, gobject.closure.Closure closure);

/** */
alias AccelMapForeach = void delegate(string accelPath, uint accelKey, gdk.types.ModifierType accelMods, bool changed);

/**
    A function used by [gtk.assistant.Assistant.setForwardPageFunc] to know which
    is the next page given a current one. It’s called both for computing the
    next page when the user presses the “forward” button and for handling
    the behavior of the “last” button.

    Params:
      currentPage = The page number used to calculate the next page.
    Returns: The next page number.
*/
alias AssistantPageFunc = int delegate(int currentPage);

/**
    This is the signature of a function used to connect signals.  It is used
    by the [gtk.builder.Builder.connectSignals] and [gtk.builder.Builder.connectSignalsFull]
    methods.  It is mainly intended for interpreted language bindings, but
    could be useful where the programmer wants more control over the signal
    connection process. Note that this function can only be called once,
    subsequent calls will do nothing.

    Params:
      builder = a #GtkBuilder
      object = object to connect a signal to
      signalName = name of the signal
      handlerName = name of the handler
      connectObject = a #GObject, if non-null, use [gobject.global.signalConnectObject]
      flags = #GConnectFlags to use
*/
alias BuilderConnectFunc = void delegate(gtk.builder.Builder builder, gobject.object.ObjectWrap object, string signalName, string handlerName, gobject.object.ObjectWrap connectObject, gobject.types.ConnectFlags flags);

/**
    This kind of functions provide Pango markup with detail information for the
    specified day. Examples for such details are holidays or appointments. The
    function returns null when no information is available.

    Params:
      calendar = a #GtkCalendar.
      year = the year for which details are needed.
      month = the month for which details are needed.
      day = the day of month for which details are needed.
    Returns: Newly allocated string with Pango markup
          with details for the specified day or null.
*/
alias CalendarDetailFunc = string delegate(gtk.calendar.Calendar calendar, uint year, uint month, uint day);

/**
    The type of the callback functions used for e.g. iterating over
    the children of a container, see [gtk.container.Container.foreach_].

    Params:
      widget = the widget to operate on
*/
alias Callback = void delegate(gtk.widget.Widget widget);

/**
    The type of the callback functions used for iterating over the
    cell renderers and their allocated areas inside a #GtkCellArea,
    see [gtk.cell_area.CellArea.foreachAlloc].

    Params:
      renderer = the cell renderer to operate on
      cellArea = the area allocated to renderer inside the rectangle
            provided to [gtk.cell_area.CellArea.foreachAlloc].
      cellBackground = the background area for renderer inside the
            background area provided to [gtk.cell_area.CellArea.foreachAlloc].
    Returns: true to stop iterating over cells.
*/
alias CellAllocCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer, gdk.rectangle.Rectangle cellArea, gdk.rectangle.Rectangle cellBackground);

/**
    The type of the callback functions used for iterating over
    the cell renderers of a #GtkCellArea, see [gtk.cell_area.CellArea.foreach_].

    Params:
      renderer = the cell renderer to operate on
    Returns: true to stop iterating over cells.
*/
alias CellCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer);

/**
    A function which should set the value of cell_layout’s cell renderer(s)
    as appropriate.

    Params:
      cellLayout = a #GtkCellLayout
      cell = the cell renderer whose value is to be set
      treeModel = the model
      iter = a #GtkTreeIter indicating the row to set the value for
*/
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A function that will be called when the contents of the clipboard are changed
    or cleared. Once this has called, the user_data_or_owner argument
    will not be used again.

    Params:
      clipboard = the #GtkClipboard
*/
alias ClipboardClearFunc = void delegate(gtk.clipboard.Clipboard clipboard);

/**
    A function that will be called to provide the contents of the selection.
    If multiple types of data were advertised, the requested type can
    be determined from the info parameter or by checking the target field
    of selection_data. If the data could successfully be converted into
    then it should be stored into the selection_data object by
    calling [gtk.selection_data.SelectionData.set] (or related functions such
    as [gtk.selection_data.SelectionData.setText]). If no data is set, the requestor
    will be informed that the attempt to get the data failed.

    Params:
      clipboard = the #GtkClipboard
      selectionData = a #GtkSelectionData argument in which the requested
          data should be stored.
      info = the info field corresponding to the requested target from the
          #GtkTargetEntry array passed to [gtk.clipboard.Clipboard.setWithData] or
          [gtk.clipboard.Clipboard.setWithOwner].
*/
alias ClipboardGetFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData, uint info);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestImage]
    are received, or when the request fails.

    Params:
      clipboard = the #GtkClipboard
      pixbuf = the received image
*/
alias ClipboardImageReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdkpixbuf.pixbuf.Pixbuf pixbuf);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestContents]
    are received, or when the request fails.

    Params:
      clipboard = the #GtkClipboard
      selectionData = a #GtkSelectionData containing the data was received.
          If retrieving the data failed, then then length field
          of selection_data will be negative.
*/
alias ClipboardReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gtk.selection_data.SelectionData selectionData);

/**
    A function to be called when the results of
    [gtk.clipboard.Clipboard.requestRichText] are received, or when the request
    fails.

    Params:
      clipboard = the #GtkClipboard
      format = The format of the rich text
      text = the rich text received, as
          a UTF-8 encoded string, or null if retrieving the data failed.
*/
alias ClipboardRichTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, gdk.atom.Atom format, char[] text);

/**
    A function to be called when the results of [gtk.clipboard.Clipboard.requestText]
    are received, or when the request fails.

    Params:
      clipboard = the #GtkClipboard
      text = the text received, as a UTF-8 encoded string, or
          null if retrieving the data failed.
*/
alias ClipboardTextReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string text);

/**
    A function to be called when the results of
    [gtk.clipboard.Clipboard.requestUris] are received, or when the request
    fails.

    Params:
      clipboard = the #GtkClipboard
      uris = the received URIs
*/
alias ClipboardURIReceivedFunc = void delegate(gtk.clipboard.Clipboard clipboard, string[] uris);

/** */
alias ColorSelectionChangePaletteFunc = void delegate(gdk.color.Color[] colors);

/** */
alias ColorSelectionChangePaletteWithScreenFunc = void delegate(gdk.screen.Screen screen, gdk.color.Color[] colors);

/**
    A function which decides whether the row indicated by iter matches
    a given key, and should be displayed as a possible completion for key.
    Note that key is normalized and case-folded (see [glib.global.utf8Normalize]
    and [glib.global.utf8Casefold]). If this is not appropriate, match functions
    have access to the unmodified key via
    `gtk_entry_get_text (GTK_ENTRY (gtk_entry_completion_get_entry ()))`.

    Params:
      completion = the #GtkEntryCompletion
      key = the string to match, normalized and case-folded
      iter = a #GtkTreeIter indicating the row to match
    Returns: true if iter should be displayed as a possible completion
          for key
*/
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);

/**
    The type of function that is used with custom filters, see
    [gtk.file_filter.FileFilter.addCustom].

    Params:
      filterInfo = a #GtkFileFilterInfo that is filled according
          to the needed flags passed to [gtk.file_filter.FileFilter.addCustom]
    Returns: true if the file should be displayed
*/
alias FileFilterFunc = bool delegate(gtk.file_filter_info.FileFilterInfo filterInfo);

/**
    Called for flow boxes that are bound to a #GListModel with
    [gtk.flow_box.FlowBox.bindModel] for each item that gets added to the model.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a #GtkWidget that represents item
*/
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectWrap item);

/**
    A function that will be called whenrever a child changes
    or is added. It lets you control if the child should be
    visible or not.

    Params:
      child = a #GtkFlowBoxChild that may be filtered
    Returns: true if the row should be visible, false otherwise
*/
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);

/**
    A function used by [gtk.flow_box.FlowBox.selectedForeach].
    It will be called on every selected child of the box.

    Params:
      box = a #GtkFlowBox
      child = a #GtkFlowBoxChild
*/
alias FlowBoxForeachFunc = void delegate(gtk.flow_box.FlowBox box, gtk.flow_box_child.FlowBoxChild child);

/**
    A function to compare two children to determine which
    should come first.

    Params:
      child1 = the first child
      child2 = the second child
    Returns: < 0 if child1 should be before child2, 0 if
          the are equal, and > 0 otherwise
*/
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);

/**
    The type of function that is used for deciding what fonts get
    shown in a #GtkFontChooser. See [gtk.font_chooser.FontChooser.setFilterFunc].

    Params:
      family = a #PangoFontFamily
      face = a #PangoFontFace belonging to family
    Returns: true if the font should be displayed
*/
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);

/**
    A function used by [gtk.icon_view.IconView.selectedForeach] to map all
    selected rows.  It will be called on every selected row in the view.

    Params:
      iconView = a #GtkIconView
      path = The #GtkTreePath of a selected row
*/
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);

/**
    Key snooper functions are called before normal event delivery.
    They can be used to implement custom key event handling.

    Params:
      grabWidget = the widget to which the event will be delivered
      event = the key event
    Returns: true to stop further processing of event, false to continue.
*/
alias KeySnoopFunc = int delegate(gtk.widget.Widget grabWidget, gdk.event_key.EventKey event);

/**
    Called for list boxes that are bound to a #GListModel with
    [gtk.list_box.ListBox.bindModel] for each item that gets added to the model.
    
    Versions of GTK+ prior to 3.18 called [gtk.widget.Widget.showAll] on the rows
    created by the GtkListBoxCreateWidgetFunc, but this forced all widgets
    inside the row to be shown, and is no longer the case. Applications should
    be updated to show the desired row widgets.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a #GtkWidget that represents item
*/
alias ListBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectWrap item);

/**
    Will be called whenever the row changes or is added and lets you control
    if the row should be visible or not.

    Params:
      row = the row that may be filtered
    Returns: true if the row should be visible, false otherwise
*/
alias ListBoxFilterFunc = bool delegate(gtk.list_box_row.ListBoxRow row);

/**
    A function used by [gtk.list_box.ListBox.selectedForeach].
    It will be called on every selected child of the box.

    Params:
      box = a #GtkListBox
      row = a #GtkListBoxRow
*/
alias ListBoxForeachFunc = void delegate(gtk.list_box.ListBox box, gtk.list_box_row.ListBoxRow row);

/**
    Compare two rows to determine which should be first.

    Params:
      row1 = the first row
      row2 = the second row
    Returns: < 0 if row1 should be before row2, 0 if they are
          equal and > 0 otherwise
*/
alias ListBoxSortFunc = int delegate(gtk.list_box_row.ListBoxRow row1, gtk.list_box_row.ListBoxRow row2);

/**
    Whenever row changes or which row is before row changes this
    is called, which lets you update the header on row. You may
    remove or set a new one via [gtk.list_box_row.ListBoxRow.setHeader] or
    just change the state of the current header widget.

    Params:
      row = the row to update
      before = the row before row, or null if it is first
*/
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);

/**
    A user function supplied when calling [gtk.menu.Menu.attachToWidget] which
    will be called when the menu is later detached from the widget.

    Params:
      attachWidget = the #GtkWidget that the menu is being detached from.
      menu = the #GtkMenu being detached.
*/
alias MenuDetachFunc = void delegate(gtk.widget.Widget attachWidget, gtk.menu.Menu menu);

/**
    A user function supplied when calling [gtk.menu.Menu.popup] which
    controls the positioning of the menu when it is displayed.  The
    function sets the `x` and `y` parameters to the coordinates where the
    menu is to be drawn.  To make the menu appear on a different
    monitor than the mouse pointer, [gtk.menu.Menu.setMonitor] must be
    called.

    Params:
      menu = a #GtkMenu.
      x = address of the #gint representing the horizontal
            position where the menu shall be drawn.
      y = address of the #gint representing the vertical position
            where the menu shall be drawn.  This is an output parameter.
      pushIn = This parameter controls how menus placed outside
            the monitor are handled.  If this is set to true and part of
            the menu is outside the monitor then GTK+ pushes the window
            into the visible area, effectively modifying the popup
            position.  Note that moving and possibly resizing the menu
            around will alter the scroll position to keep the menu items
            “in place”, i.e. at the same monitor position they would have
            been without resizing.  In practice, this behavior is only
            useful for combobox popups or option menus and cannot be used
            to simply confine a menu to monitor boundaries.  In that case,
            changing the scroll offset is not desirable.
*/
alias MenuPositionFunc = void delegate(gtk.menu.Menu menu, ref int x, ref int y, out bool pushIn);

/**
    A multihead-aware GTK+ module may have a gtk_module_display_init() function
    with this prototype. GTK+ calls this function for each opened display.

    Params:
      display = an open #GdkDisplay
*/
alias ModuleDisplayInitFunc = void delegate(gdk.display.Display display);

/**
    The type of function that is passed to
    [gtk.global.printRunPageSetupDialogAsync].
    
    This function will be called when the page setup dialog
    is dismissed, and also serves as destroy notify for data.

    Params:
      pageSetup = the #GtkPageSetup that has been
*/
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);

/** */
alias PrintSettingsFunc = void delegate(string key, string value);

/** */
alias RcPropertyParser = bool delegate(gobject.param_spec.ParamSpec pspec, glib.string_.String rcString, gobject.value.Value propertyValue);

/**
    The type of function that is used with custom filters,
    see [gtk.recent_filter.RecentFilter.addCustom].

    Params:
      filterInfo = a #GtkRecentFilterInfo that is filled according
         to the needed flags passed to [gtk.recent_filter.RecentFilter.addCustom]
    Returns: true if the file should be displayed
*/
alias RecentFilterFunc = bool delegate(gtk.recent_filter_info.RecentFilterInfo filterInfo);

/** */
alias RecentSortFunc = int delegate(gtk.recent_info.RecentInfo a, gtk.recent_info.RecentInfo b);

/** */
alias StylePropertyParser = bool delegate(string string_, gobject.value.Value value, GError **_err);

/**
    A function that is called to deserialize rich text that has been
    serialized with [gtk.text_buffer.TextBuffer.serialize], and insert it at iter.

    Params:
      registerBuffer = the #GtkTextBuffer the format is registered with
      contentBuffer = the #GtkTextBuffer to deserialize into
      iter = insertion point for the deserialized text
      data = data to deserialize
      createTags = true if deserializing may create tags
    Returns: true on success, false otherwise
    Throws: [ErrorWrap]
*/
alias TextBufferDeserializeFunc = bool delegate(gtk.text_buffer.TextBuffer registerBuffer, gtk.text_buffer.TextBuffer contentBuffer, gtk.text_iter.TextIter iter, ubyte[] data, bool createTags, GError **_err);

/**
    A function that is called to serialize the content of a text buffer.
    It must return the serialized form of the content.

    Params:
      registerBuffer = the #GtkTextBuffer for which the format is registered
      contentBuffer = the #GtkTextBuffer to serialize
      start = start of the block of text to serialize
      end = end of the block of text to serialize
    Returns: a newly-allocated array of guint8
      which contains the serialized data, or null if an error occurred
*/
alias TextBufferSerializeFunc = ubyte[] delegate(gtk.text_buffer.TextBuffer registerBuffer, gtk.text_buffer.TextBuffer contentBuffer, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end);

/** */
alias TextCharPredicate = bool delegate(dchar ch);

/** */
alias TextTagTableForeach = void delegate(gtk.text_tag.TextTag tag);

/**
    Callback type for adding a function to update animations. See [gtk.widget.Widget.addTickCallback].

    Params:
      widget = the widget
      frameClock = the frame clock for the widget (same as calling [gtk.widget.Widget.getFrameClock])
    Returns: [glib.types.SOURCE_CONTINUE] if the tick callback should continue to be called,
       [glib.types.SOURCE_REMOVE] if the tick callback should be removed.
*/
alias TickCallback = bool delegate(gtk.widget.Widget widget, gdk.frame_clock.FrameClock frameClock);

/**
    The function used to translate messages in e.g. #GtkIconFactory
    and #GtkActionGroup.

    Params:
      path = The id of the message. In #GtkActionGroup this will be a label
          or tooltip from a #GtkActionEntry.
    Returns: the translated message
*/
alias TranslateFunc = string delegate(string path);

/**
    A function to set the properties of a cell instead of just using the
    straight mapping between the cell and the model.  This is useful for
    customizing the cell renderer.  For example, a function might get an
    integer from the tree_model, and render it to the “text” attribute of
    “cell” by converting it to its written equivalent.  This is set by
    calling [gtk.tree_view_column.TreeViewColumn.setCellDataFunc]

    Params:
      treeColumn = A #GtkTreeViewColumn
      cell = The #GtkCellRenderer that is being rendered by tree_column
      treeModel = The #GtkTreeModel being rendered
      iter = A #GtkTreeIter of the current row rendered
*/
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/** */
alias TreeDestroyCountFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path, int children);

/**
    A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
    integer if `a` sorts before `b`, `a` sorts with `b`, or `a` sorts after `b`
    respectively. If two iters compare as equal, their order in the sorted model
    is undefined. In order to ensure that the #GtkTreeSortable behaves as
    expected, the GtkTreeIterCompareFunc must define a partial order on
    the model, i.e. it must be reflexive, antisymmetric and transitive.
    
    For example, if model is a product catalogue, then a compare function
    for the “price” column could be one which returns
    `price_of(`a`) - price_of(`b`)`.

    Params:
      model = The #GtkTreeModel the comparison is within
      a = A #GtkTreeIter in model
      b = Another #GtkTreeIter in model
    Returns: a negative integer, zero or a positive integer depending on whether
        `a` sorts before, with or after `b`
*/
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);

/**
    A function which calculates display values from raw values in the model.
    It must fill value with the display value for the column column in the
    row indicated by iter.
    
    Since this function is called for each data access, it’s not a
    particularly efficient operation.

    Params:
      model = the #GtkTreeModelFilter
      iter = a #GtkTreeIter pointing to the row whose display values are determined
      value = A #GValue which is already initialized for
         with the correct type for the column column.
      column = the column whose display value is determined
*/
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);

/**
    A function which decides whether the row indicated by iter is visible.

    Params:
      model = the child model of the #GtkTreeModelFilter
      iter = a #GtkTreeIter pointing to the row in model whose visibility
          is determined
    Returns: Whether the row indicated by iter is visible.
*/
alias TreeModelFilterVisibleFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    Type of the callback passed to [gtk.tree_model.TreeModel.foreach_] to
    iterate over the rows in a tree model.

    Params:
      model = the #GtkTreeModel being iterated
      path = the current #GtkTreePath
      iter = the current #GtkTreeIter
    Returns: true to stop iterating, false to continue
*/
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.selectedForeach] to map all
    selected rows.  It will be called on every selected row in the view.

    Params:
      model = The #GtkTreeModel being viewed
      path = The #GtkTreePath of a selected row
      iter = A #GtkTreeIter pointing to a selected row
*/
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.setSelectFunction] to filter
    whether or not a row may be selected.  It is called whenever a row's
    state might change.  A return value of true indicates to selection
    that it is okay to change the selection.

    Params:
      selection = A #GtkTreeSelection
      model = A #GtkTreeModel being viewed
      path = The #GtkTreePath of the row in question
      pathCurrentlySelected = true, if the path is currently selected
    Returns: true, if the selection state of the row can be toggled
*/
alias TreeSelectionFunc = bool delegate(gtk.tree_selection.TreeSelection selection, gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, bool pathCurrentlySelected);

/**
    Function type for determining whether column can be dropped in a
    particular spot (as determined by prev_column and next_column).  In
    left to right locales, prev_column is on the left of the potential drop
    spot, and next_column is on the right.  In right to left mode, this is
    reversed.  This function should return true if the spot is a valid drop
    spot.  Please note that returning true does not actually indicate that
    the column drop was made, but is meant only to indicate a possible drop
    spot to the user.

    Params:
      treeView = A #GtkTreeView
      column = The #GtkTreeViewColumn being dragged
      prevColumn = A #GtkTreeViewColumn on one side of column
      nextColumn = A #GtkTreeViewColumn on the other side of column
    Returns: true, if column can be dropped in this spot
*/
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);

/**
    Function used for [gtk.tree_view.TreeView.mapExpandedRows].

    Params:
      treeView = A #GtkTreeView
      path = The path that’s expanded
*/
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);

/**
    Function type for determining whether the row pointed to by iter should
    be rendered as a separator. A common way to implement this is to have a
    boolean column in the model, whose values the #GtkTreeViewRowSeparatorFunc
    returns.

    Params:
      model = the #GtkTreeModel
      iter = a #GtkTreeIter pointing at a row in model
    Returns: true if the row is a separator
*/
alias TreeViewRowSeparatorFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    A function used for checking whether a row in model matches
    a search key string entered by the user. Note the return value
    is reversed from what you would normally expect, though it
    has some similarity to strcmp() returning 0 for equal strings.

    Params:
      model = the #GtkTreeModel being searched
      column = the search column set by [gtk.tree_view.TreeView.setSearchColumn]
      key = the key string to compare with
      iter = a #GtkTreeIter pointing the row of model that should be compared
         with key.
    Returns: false if the row matches, true otherwise.
*/
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);

/** */
alias TreeViewSearchPositionFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.widget.Widget searchDialog);

/**
    Like [gtk.global.getBinaryAge], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum BINARY_AGE = 2443;

/**
    Constant to return from a signal handler for the #GtkSpinButton::input
    signal in case of conversion failure.
*/
enum INPUT_ERROR = -1;

/**
    Like [gtk.global.getInterfaceAge], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum INTERFACE_AGE = 32;

/**
    The name used for the stock full offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_FULL = "full";

/**
    The name used for the stock high offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_HIGH = "high";

/**
    The name used for the stock low offset included by #GtkLevelBar.
*/
enum LEVEL_BAR_OFFSET_LOW = "low";

/**
    Like [gtk.global.getMajorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 3;

/**
    The maximum length of sequences in compose tables.
*/
enum MAX_COMPOSE_LEN = 7;

/**
    Like [gtk.global.getMicroVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 43;

/**
    Like [gtk.global.getMinorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 24;

/**
    Name for the A3 paper size.
*/
enum PAPER_NAME_A3 = "iso_a3";

/**
    Name for the A4 paper size.
*/
enum PAPER_NAME_A4 = "iso_a4";

/**
    Name for the A5 paper size.
*/
enum PAPER_NAME_A5 = "iso_a5";

/**
    Name for the B5 paper size.
*/
enum PAPER_NAME_B5 = "iso_b5";

/**
    Name for the Executive paper size.
*/
enum PAPER_NAME_EXECUTIVE = "na_executive";

/**
    Name for the Legal paper size.
*/
enum PAPER_NAME_LEGAL = "na_legal";

/**
    Name for the Letter paper size.
*/
enum PAPER_NAME_LETTER = "na_letter";

/** */
enum PATH_PRIO_MASK = 15;

/** */
enum PRINT_SETTINGS_COLLATE = "collate";

/** */
enum PRINT_SETTINGS_DEFAULT_SOURCE = "default-source";

/** */
enum PRINT_SETTINGS_DITHER = "dither";

/** */
enum PRINT_SETTINGS_DUPLEX = "duplex";

/** */
enum PRINT_SETTINGS_FINISHINGS = "finishings";

/** */
enum PRINT_SETTINGS_MEDIA_TYPE = "media-type";

/** */
enum PRINT_SETTINGS_NUMBER_UP = "number-up";

/** */
enum PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout";

/** */
enum PRINT_SETTINGS_N_COPIES = "n-copies";

/** */
enum PRINT_SETTINGS_ORIENTATION = "orientation";

/**
    The key used by the “Print to file” printer to store the file
    name of the output without the path to the directory and the
    file extension.
*/
enum PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename";

/** */
enum PRINT_SETTINGS_OUTPUT_BIN = "output-bin";

/**
    The key used by the “Print to file” printer to store the
    directory to which the output should be written.
*/
enum PRINT_SETTINGS_OUTPUT_DIR = "output-dir";

/**
    The key used by the “Print to file” printer to store the format
    of the output. The supported values are “PS” and “PDF”.
*/
enum PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format";

/**
    The key used by the “Print to file” printer to store the URI
    to which the output should be written. GTK+ itself supports
    only “file://” URIs.
*/
enum PRINT_SETTINGS_OUTPUT_URI = "output-uri";

/** */
enum PRINT_SETTINGS_PAGE_RANGES = "page-ranges";

/** */
enum PRINT_SETTINGS_PAGE_SET = "page-set";

/** */
enum PRINT_SETTINGS_PAPER_FORMAT = "paper-format";

/** */
enum PRINT_SETTINGS_PAPER_HEIGHT = "paper-height";

/** */
enum PRINT_SETTINGS_PAPER_WIDTH = "paper-width";

/** */
enum PRINT_SETTINGS_PRINTER = "printer";

/** */
enum PRINT_SETTINGS_PRINTER_LPI = "printer-lpi";

/** */
enum PRINT_SETTINGS_PRINT_PAGES = "print-pages";

/** */
enum PRINT_SETTINGS_QUALITY = "quality";

/** */
enum PRINT_SETTINGS_RESOLUTION = "resolution";

/** */
enum PRINT_SETTINGS_RESOLUTION_X = "resolution-x";

/** */
enum PRINT_SETTINGS_RESOLUTION_Y = "resolution-y";

/** */
enum PRINT_SETTINGS_REVERSE = "reverse";

/** */
enum PRINT_SETTINGS_SCALE = "scale";

/** */
enum PRINT_SETTINGS_USE_COLOR = "use-color";

/** */
enum PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra";

/** */
enum PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version";

/**
    Use this priority for functionality related to size allocation.
    
    It is used internally by GTK+ to compute the sizes of widgets.
    This priority is higher than [gdk.types.PRIORITY_REDRAW] to avoid
    resizing a widget which was just redrawn.
*/
enum PRIORITY_RESIZE = 110;

/**
    The “About” item.
    ![](help-about.png)

    Deprecated: Use named icon &quot;help-about&quot; or the label &quot;_About&quot;.
*/
enum STOCK_ABOUT = "gtk-about";

/**
    The “Add” item and icon.

    Deprecated: Use named icon &quot;list-add&quot; or the label &quot;_Add&quot;.
*/
enum STOCK_ADD = "gtk-add";

/**
    The “Apply” item and icon.

    Deprecated: Do not use an icon. Use label &quot;_Apply&quot;.
*/
enum STOCK_APPLY = "gtk-apply";

/**
    The “Bold” item and icon.

    Deprecated: Use named icon &quot;format-text-bold&quot;.
*/
enum STOCK_BOLD = "gtk-bold";

/**
    The “Cancel” item and icon.

    Deprecated: Do not use an icon. Use label &quot;_Cancel&quot;.
*/
enum STOCK_CANCEL = "gtk-cancel";

/**
    The “Caps Lock Warning” icon.

    Deprecated: Use named icon &quot;dialog-warning-symbolic&quot;.
*/
enum STOCK_CAPS_LOCK_WARNING = "gtk-caps-lock-warning";

/**
    The “CD-Rom” item and icon.

    Deprecated: Use named icon &quot;media-optical&quot;.
*/
enum STOCK_CDROM = "gtk-cdrom";

/**
    The “Clear” item and icon.

    Deprecated: Use named icon &quot;edit-clear&quot;.
*/
enum STOCK_CLEAR = "gtk-clear";

/**
    The “Close” item and icon.

    Deprecated: Use named icon &quot;window-close&quot; or the label &quot;_Close&quot;.
*/
enum STOCK_CLOSE = "gtk-close";

/**
    The “Color Picker” item and icon.
*/
enum STOCK_COLOR_PICKER = "gtk-color-picker";

/**
    The “Connect” icon.
*/
enum STOCK_CONNECT = "gtk-connect";

/**
    The “Convert” item and icon.
*/
enum STOCK_CONVERT = "gtk-convert";

/**
    The “Copy” item and icon.

    Deprecated: Use the named icon &quot;edit-copy&quot; or the label &quot;_Copy&quot;.
*/
enum STOCK_COPY = "gtk-copy";

/**
    The “Cut” item and icon.

    Deprecated: Use the named icon &quot;edit-cut&quot; or the label &quot;Cu_t&quot;.
*/
enum STOCK_CUT = "gtk-cut";

/**
    The “Delete” item and icon.

    Deprecated: Use the named icon &quot;edit-delete&quot; or the label &quot;_Delete&quot;.
*/
enum STOCK_DELETE = "gtk-delete";

/**
    The “Authentication” item and icon.

    Deprecated: Use named icon &quot;dialog-password&quot;.
*/
enum STOCK_DIALOG_AUTHENTICATION = "gtk-dialog-authentication";

/**
    The “Error” item and icon.

    Deprecated: Use named icon &quot;dialog-error&quot;.
*/
enum STOCK_DIALOG_ERROR = "gtk-dialog-error";

/**
    The “Information” item and icon.

    Deprecated: Use named icon &quot;dialog-information&quot;.
*/
enum STOCK_DIALOG_INFO = "gtk-dialog-info";

/**
    The “Question” item and icon.

    Deprecated: Use named icon &quot;dialog-question&quot;.
*/
enum STOCK_DIALOG_QUESTION = "gtk-dialog-question";

/**
    The “Warning” item and icon.

    Deprecated: Use named icon &quot;dialog-warning&quot;.
*/
enum STOCK_DIALOG_WARNING = "gtk-dialog-warning";

/**
    The “Directory” icon.

    Deprecated: Use named icon &quot;folder&quot;.
*/
enum STOCK_DIRECTORY = "gtk-directory";

/**
    The “Discard” item.
*/
enum STOCK_DISCARD = "gtk-discard";

/**
    The “Disconnect” icon.
*/
enum STOCK_DISCONNECT = "gtk-disconnect";

/**
    The “Drag-And-Drop” icon.
*/
enum STOCK_DND = "gtk-dnd";

/**
    The “Drag-And-Drop multiple” icon.
*/
enum STOCK_DND_MULTIPLE = "gtk-dnd-multiple";

/**
    The “Edit” item and icon.
*/
enum STOCK_EDIT = "gtk-edit";

/**
    The “Execute” item and icon.

    Deprecated: Use named icon &quot;system-run&quot;.
*/
enum STOCK_EXECUTE = "gtk-execute";

/**
    The “File” item and icon.
    
    Since 3.0, this item has a label, before it only had an icon.

    Deprecated: Use named icon &quot;text-x-generic&quot;.
*/
enum STOCK_FILE = "gtk-file";

/**
    The “Find” item and icon.

    Deprecated: Use named icon &quot;edit-find&quot;.
*/
enum STOCK_FIND = "gtk-find";

/**
    The “Find and Replace” item and icon.

    Deprecated: Use named icon &quot;edit-find-replace&quot;.
*/
enum STOCK_FIND_AND_REPLACE = "gtk-find-and-replace";

/**
    The “Floppy” item and icon.
*/
enum STOCK_FLOPPY = "gtk-floppy";

/**
    The “Fullscreen” item and icon.

    Deprecated: Use named icon &quot;view-fullscreen&quot;.
*/
enum STOCK_FULLSCREEN = "gtk-fullscreen";

/**
    The “Bottom” item and icon.

    Deprecated: Use named icon &quot;go-bottom&quot;.
*/
enum STOCK_GOTO_BOTTOM = "gtk-goto-bottom";

/**
    The “First” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;go-first&quot;.
*/
enum STOCK_GOTO_FIRST = "gtk-goto-first";

/**
    The “Last” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;go-last&quot;.
*/
enum STOCK_GOTO_LAST = "gtk-goto-last";

/**
    The “Top” item and icon.

    Deprecated: Use named icon &quot;go-top&quot;.
*/
enum STOCK_GOTO_TOP = "gtk-goto-top";

/**
    The “Back” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;go-previous&quot;.
*/
enum STOCK_GO_BACK = "gtk-go-back";

/**
    The “Down” item and icon.

    Deprecated: Use named icon &quot;go-down&quot;.
*/
enum STOCK_GO_DOWN = "gtk-go-down";

/**
    The “Forward” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;go-next&quot;.
*/
enum STOCK_GO_FORWARD = "gtk-go-forward";

/**
    The “Up” item and icon.

    Deprecated: Use named icon &quot;go-up&quot;.
*/
enum STOCK_GO_UP = "gtk-go-up";

/**
    The “Harddisk” item and icon.

    Deprecated: Use named icon &quot;drive-harddisk&quot;.
*/
enum STOCK_HARDDISK = "gtk-harddisk";

/**
    The “Help” item and icon.

    Deprecated: Use named icon &quot;help-browser&quot;.
*/
enum STOCK_HELP = "gtk-help";

/**
    The “Home” item and icon.

    Deprecated: Use named icon &quot;go-home&quot;.
*/
enum STOCK_HOME = "gtk-home";

/**
    The “Indent” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;format-indent-more&quot;.
*/
enum STOCK_INDENT = "gtk-indent";

/**
    The “Index” item and icon.
*/
enum STOCK_INDEX = "gtk-index";

/**
    The “Info” item and icon.

    Deprecated: Use named icon &quot;dialog-information&quot;.
*/
enum STOCK_INFO = "gtk-info";

/**
    The “Italic” item and icon.

    Deprecated: Use named icon &quot;format-text-italic&quot;.
*/
enum STOCK_ITALIC = "gtk-italic";

/**
    The “Jump to” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;go-jump&quot;.
*/
enum STOCK_JUMP_TO = "gtk-jump-to";

/**
    The “Center” item and icon.

    Deprecated: Use named icon &quot;format-justify-center&quot;.
*/
enum STOCK_JUSTIFY_CENTER = "gtk-justify-center";

/**
    The “Fill” item and icon.

    Deprecated: Use named icon &quot;format-justify-fill&quot;.
*/
enum STOCK_JUSTIFY_FILL = "gtk-justify-fill";

/**
    The “Left” item and icon.

    Deprecated: Use named icon &quot;format-justify-left&quot;.
*/
enum STOCK_JUSTIFY_LEFT = "gtk-justify-left";

/**
    The “Right” item and icon.

    Deprecated: Use named icon &quot;format-justify-right&quot;.
*/
enum STOCK_JUSTIFY_RIGHT = "gtk-justify-right";

/**
    The “Leave Fullscreen” item and icon.

    Deprecated: Use named icon &quot;view-restore&quot;.
*/
enum STOCK_LEAVE_FULLSCREEN = "gtk-leave-fullscreen";

/**
    The “Media Forward” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;media-seek-forward&quot; or the label &quot;_Forward&quot;.
*/
enum STOCK_MEDIA_FORWARD = "gtk-media-forward";

/**
    The “Media Next” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;media-skip-forward&quot; or the label &quot;_Next&quot;.
*/
enum STOCK_MEDIA_NEXT = "gtk-media-next";

/**
    The “Media Pause” item and icon.

    Deprecated: Use named icon &quot;media-playback-pause&quot; or the label &quot;P_ause&quot;.
*/
enum STOCK_MEDIA_PAUSE = "gtk-media-pause";

/**
    The “Media Play” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;media-playback-start&quot; or the label &quot;_Play&quot;.
*/
enum STOCK_MEDIA_PLAY = "gtk-media-play";

/**
    The “Media Previous” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;media-skip-backward&quot; or the label &quot;Pre_vious&quot;.
*/
enum STOCK_MEDIA_PREVIOUS = "gtk-media-previous";

/**
    The “Media Record” item and icon.

    Deprecated: Use named icon &quot;media-record&quot; or the label &quot;_Record&quot;.
*/
enum STOCK_MEDIA_RECORD = "gtk-media-record";

/**
    The “Media Rewind” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;media-seek-backward&quot; or the label &quot;R_ewind&quot;.
*/
enum STOCK_MEDIA_REWIND = "gtk-media-rewind";

/**
    The “Media Stop” item and icon.

    Deprecated: Use named icon &quot;media-playback-stop&quot; or the label &quot;_Stop&quot;.
*/
enum STOCK_MEDIA_STOP = "gtk-media-stop";

/**
    The “Missing image” icon.

    Deprecated: Use named icon &quot;image-missing&quot;.
*/
enum STOCK_MISSING_IMAGE = "gtk-missing-image";

/**
    The “Network” item and icon.

    Deprecated: Use named icon &quot;network-workgroup&quot;.
*/
enum STOCK_NETWORK = "gtk-network";

/**
    The “New” item and icon.

    Deprecated: Use named icon &quot;document-new&quot; or the label &quot;_New&quot;.
*/
enum STOCK_NEW = "gtk-new";

/**
    The “No” item and icon.
*/
enum STOCK_NO = "gtk-no";

/**
    The “OK” item and icon.

    Deprecated: Do not use an icon. Use label &quot;_OK&quot;.
*/
enum STOCK_OK = "gtk-ok";

/**
    The “Open” item and icon.

    Deprecated: Use named icon &quot;document-open&quot; or the label &quot;_Open&quot;.
*/
enum STOCK_OPEN = "gtk-open";

/**
    The “Landscape Orientation” item and icon.
*/
enum STOCK_ORIENTATION_LANDSCAPE = "gtk-orientation-landscape";

/**
    The “Portrait Orientation” item and icon.
*/
enum STOCK_ORIENTATION_PORTRAIT = "gtk-orientation-portrait";

/**
    The “Reverse Landscape Orientation” item and icon.
*/
enum STOCK_ORIENTATION_REVERSE_LANDSCAPE = "gtk-orientation-reverse-landscape";

/**
    The “Reverse Portrait Orientation” item and icon.
*/
enum STOCK_ORIENTATION_REVERSE_PORTRAIT = "gtk-orientation-reverse-portrait";

/**
    The “Page Setup” item and icon.

    Deprecated: Use named icon &quot;document-page-setup&quot; or the label &quot;Page Set_up&quot;.
*/
enum STOCK_PAGE_SETUP = "gtk-page-setup";

/**
    The “Paste” item and icon.

    Deprecated: Use named icon &quot;edit-paste&quot; or the label &quot;_Paste&quot;.
*/
enum STOCK_PASTE = "gtk-paste";

/**
    The “Preferences” item and icon.

    Deprecated: Use named icon &quot;preferences-system&quot; or the label &quot;_Preferences&quot;.
*/
enum STOCK_PREFERENCES = "gtk-preferences";

/**
    The “Print” item and icon.

    Deprecated: Use named icon &quot;document-print&quot; or the label &quot;_Print&quot;.
*/
enum STOCK_PRINT = "gtk-print";

/**
    The “Print Error” icon.

    Deprecated: Use named icon &quot;printer-error&quot;.
*/
enum STOCK_PRINT_ERROR = "gtk-print-error";

/**
    The “Print Paused” icon.
*/
enum STOCK_PRINT_PAUSED = "gtk-print-paused";

/**
    The “Print Preview” item and icon.

    Deprecated: Use label &quot;Pre_view&quot;.
*/
enum STOCK_PRINT_PREVIEW = "gtk-print-preview";

/**
    The “Print Report” icon.
*/
enum STOCK_PRINT_REPORT = "gtk-print-report";

/**
    The “Print Warning” icon.
*/
enum STOCK_PRINT_WARNING = "gtk-print-warning";

/**
    The “Properties” item and icon.

    Deprecated: Use named icon &quot;document-properties&quot; or the label &quot;_Properties&quot;.
*/
enum STOCK_PROPERTIES = "gtk-properties";

/**
    The “Quit” item and icon.

    Deprecated: Use named icon &quot;application-exit&quot; or the label &quot;_Quit&quot;.
*/
enum STOCK_QUIT = "gtk-quit";

/**
    The “Redo” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;edit-redo&quot; or the label &quot;_Redo&quot;.
*/
enum STOCK_REDO = "gtk-redo";

/**
    The “Refresh” item and icon.

    Deprecated: Use named icon &quot;view-refresh&quot; or the label &quot;_Refresh&quot;.
*/
enum STOCK_REFRESH = "gtk-refresh";

/**
    The “Remove” item and icon.

    Deprecated: Use named icon &quot;list-remove&quot; or the label &quot;_Remove&quot;.
*/
enum STOCK_REMOVE = "gtk-remove";

/**
    The “Revert” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;document-revert&quot; or the label &quot;_Revert&quot;.
*/
enum STOCK_REVERT_TO_SAVED = "gtk-revert-to-saved";

/**
    The “Save” item and icon.

    Deprecated: Use named icon &quot;document-save&quot; or the label &quot;_Save&quot;.
*/
enum STOCK_SAVE = "gtk-save";

/**
    The “Save As” item and icon.

    Deprecated: Use named icon &quot;document-save-as&quot; or the label &quot;Save _As&quot;.
*/
enum STOCK_SAVE_AS = "gtk-save-as";

/**
    The “Select All” item and icon.

    Deprecated: Use named icon &quot;edit-select-all&quot; or the label &quot;Select _All&quot;.
*/
enum STOCK_SELECT_ALL = "gtk-select-all";

/**
    The “Color” item and icon.
*/
enum STOCK_SELECT_COLOR = "gtk-select-color";

/**
    The “Font” item and icon.
*/
enum STOCK_SELECT_FONT = "gtk-select-font";

/**
    The “Ascending” item and icon.

    Deprecated: Use named icon &quot;view-sort-ascending&quot;.
*/
enum STOCK_SORT_ASCENDING = "gtk-sort-ascending";

/**
    The “Descending” item and icon.

    Deprecated: Use named icon &quot;view-sort-descending&quot;.
*/
enum STOCK_SORT_DESCENDING = "gtk-sort-descending";

/**
    The “Spell Check” item and icon.

    Deprecated: Use named icon &quot;tools-check-spelling&quot;.
*/
enum STOCK_SPELL_CHECK = "gtk-spell-check";

/**
    The “Stop” item and icon.

    Deprecated: Use named icon &quot;process-stop&quot; or the label &quot;_Stop&quot;.
*/
enum STOCK_STOP = "gtk-stop";

/**
    The “Strikethrough” item and icon.

    Deprecated: Use named icon &quot;format-text-strikethrough&quot; or the label &quot;_Strikethrough&quot;.
*/
enum STOCK_STRIKETHROUGH = "gtk-strikethrough";

/**
    The “Undelete” item and icon. The icon has an RTL variant.
*/
enum STOCK_UNDELETE = "gtk-undelete";

/**
    The “Underline” item and icon.

    Deprecated: Use named icon &quot;format-text-underline&quot; or the label &quot;_Underline&quot;.
*/
enum STOCK_UNDERLINE = "gtk-underline";

/**
    The “Undo” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;edit-undo&quot; or the label &quot;_Undo&quot;.
*/
enum STOCK_UNDO = "gtk-undo";

/**
    The “Unindent” item and icon. The icon has an RTL variant.

    Deprecated: Use named icon &quot;format-indent-less&quot;.
*/
enum STOCK_UNINDENT = "gtk-unindent";

/**
    The “Yes” item and icon.
*/
enum STOCK_YES = "gtk-yes";

/**
    The “Zoom 100%” item and icon.

    Deprecated: Use named icon &quot;zoom-original&quot; or the label &quot;_Normal Size&quot;.
*/
enum STOCK_ZOOM_100 = "gtk-zoom-100";

/**
    The “Zoom to Fit” item and icon.

    Deprecated: Use named icon &quot;zoom-fit-best&quot; or the label &quot;Best _Fit&quot;.
*/
enum STOCK_ZOOM_FIT = "gtk-zoom-fit";

/**
    The “Zoom In” item and icon.

    Deprecated: Use named icon &quot;zoom-in&quot; or the label &quot;Zoom _In&quot;.
*/
enum STOCK_ZOOM_IN = "gtk-zoom-in";

/**
    The “Zoom Out” item and icon.

    Deprecated: Use named icon &quot;zoom-out&quot; or the label &quot;Zoom _Out&quot;.
*/
enum STOCK_ZOOM_OUT = "gtk-zoom-out";

/**
    A CSS class to match an accelerator.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ACCELERATOR = "accelerator";

/**
    A CSS class used when rendering an arrow element.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ARROW = "arrow";

/**
    A CSS class to match the window background.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BACKGROUND = "background";

/**
    A CSS class to indicate an area at the bottom of a widget.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BOTTOM = "bottom";

/**
    A CSS class to match buttons.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_BUTTON = "button";

/**
    A CSS class to match calendars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CALENDAR = "calendar";

/**
    A CSS class to match content rendered in cell views.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CELL = "cell";

/**
    A CSS class to match check boxes.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CHECK = "check";

/**
    A CSS class to match combobox entries.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_COMBOBOX_ENTRY = "combobox-entry";

/**
    A CSS class to match context menus.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CONTEXT_MENU = "context-menu";

/**
    A CSS class that gets added to windows which have client-side decorations.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CSD = "csd";

/**
    A CSS class used when rendering a drag handle for
    text selection.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_CURSOR_HANDLE = "cursor-handle";

/**
    A CSS class to match the default widget.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DEFAULT = "default";

/**
    A CSS class used when an action (usually a button) is
    one that is expected to remove or destroy something visible
    to the user.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DESTRUCTIVE_ACTION = "destructive-action";

/**
    A CSS class to match dimmed labels.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DIM_LABEL = "dim-label";

/**
    A CSS class for a drag-and-drop indicator.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DND = "dnd";

/**
    A CSS class defining a dock area.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_DOCK = "dock";

/**
    A CSS class to match text entries.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ENTRY = "entry";

/**
    A CSS class for an area displaying an error message,
    such as those in infobars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_ERROR = "error";

/**
    A CSS class defining an expander, such as those in treeviews.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_EXPANDER = "expander";

/**
    A CSS class that is added when widgets that usually have
    a frame or border (like buttons or entries) should appear
    without it.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_FLAT = "flat";

/**
    A CSS class defining a frame delimiting content, such as
    #GtkFrame or the scrolled window frame around the
    scrollable area.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_FRAME = "frame";

/**
    A CSS class defining a resize grip.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_GRIP = "grip";

/**
    A CSS class to match a header element.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HEADER = "header";

/**
    A CSS class defining a highlighted area, such as headings in
    assistants and calendars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HIGHLIGHT = "highlight";

/**
    A CSS class for horizontally layered widgets.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_HORIZONTAL = "horizontal";

/**
    A CSS class defining an image, such as the icon in an entry.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_IMAGE = "image";

/**
    A CSS class for an area displaying an informational message,
    such as those in infobars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INFO = "info";

/**
    A CSS class to match inline toolbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INLINE_TOOLBAR = "inline-toolbar";

/**
    A CSS class used when rendering a drag handle for
    the insertion cursor position.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_INSERTION_CURSOR = "insertion-cursor";

/**
    A CSS class to match labels.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LABEL = "label";

/**
    A CSS class to indicate an area at the left of a widget.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LEFT = "left";

/**
    A CSS class used when rendering a level indicator, such
    as a battery charge level, or a password strength.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LEVEL_BAR = "level-bar";

/**
    A CSS class to match a linked area, such as a box containing buttons
    belonging to the same control.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LINKED = "linked";

/**
    A CSS class to match lists.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LIST = "list";

/**
    A CSS class to match list rows.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_LIST_ROW = "list-row";

/**
    A CSS class defining marks in a widget, such as in scales.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MARK = "mark";

/**
    A CSS class to match menus.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENU = "menu";

/**
    A CSS class to menubars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENUBAR = "menubar";

/**
    A CSS class to match menu items.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MENUITEM = "menuitem";

/**
    A CSS class that is added to message dialogs.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MESSAGE_DIALOG = "message-dialog";

/**
    A CSS class that is added to text view that should use
    a monospace font.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_MONOSPACE = "monospace";

/**
    A CSS class used when an element needs the user attention,
    for instance a button in a stack switcher corresponding to
    a hidden page that changed state.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_NEEDS_ATTENTION = "needs-attention";

/**
    A CSS class defining a notebook.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_NOTEBOOK = "notebook";

/**
    A CSS class used when rendering an OSD (On Screen Display) element,
    on top of another container.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_OSD = "osd";

/**
    A CSS class that is added on the visual hints that happen
    when scrolling is attempted past the limits of a scrollable
    area.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_OVERSHOOT = "overshoot";

/**
    A CSS class for a pane separator, such as those in #GtkPaned.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PANE_SEPARATOR = "pane-separator";

/**
    A CSS class that is added to areas that should look like paper.
    
    This is used in print previews and themes are encouraged to
    style it as black text on white background.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PAPER = "paper";

/**
    A CSS class that matches popovers.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_POPOVER = "popover";

/**
    A CSS class that is added to the toplevel windows used for menus.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_POPUP = "popup";

/**
    A CSS class to match primary toolbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PRIMARY_TOOLBAR = "primary-toolbar";

/**
    A CSS class to use when rendering activity as a progressbar.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PROGRESSBAR = "progressbar";

/**
    A CSS class to use when rendering a pulse in an indeterminate progress bar.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_PULSE = "pulse";

/**
    A CSS class for an area displaying a question to the user,
    such as those in infobars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_QUESTION = "question";

/**
    A CSS class to match radio buttons.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RADIO = "radio";

/**
    A CSS class to match a raised control, such as a raised
    button on a toolbar.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RAISED = "raised";

/**
    A CSS class used to indicate a read-only state.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_READ_ONLY = "read-only";

/**
    A CSS class to indicate an area at the right of a widget.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RIGHT = "right";

/**
    A CSS class to match the rubberband selection rectangle.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_RUBBERBAND = "rubberband";

/**
    A CSS class to match scale widgets.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE = "scale";

/**
    A CSS class to match scale widgets with marks attached,
    all the marks are above for horizontal #GtkScale.
    left for vertical #GtkScale.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE_HAS_MARKS_ABOVE = "scale-has-marks-above";

/**
    A CSS class to match scale widgets with marks attached,
    all the marks are below for horizontal #GtkScale,
    right for vertical #GtkScale.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCALE_HAS_MARKS_BELOW = "scale-has-marks-below";

/**
    A CSS class to match scrollbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCROLLBAR = "scrollbar";

/**
    A CSS class to match the junction area between an horizontal
    and vertical scrollbar, when they’re both shown.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SCROLLBARS_JUNCTION = "scrollbars-junction";

/**
    A CSS class for a separator.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SEPARATOR = "separator";

/**
    A CSS class defining a sidebar, such as the left side in
    a file chooser.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SIDEBAR = "sidebar";

/**
    A CSS class to match sliders.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SLIDER = "slider";

/**
    A CSS class defining an spinbutton.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SPINBUTTON = "spinbutton";

/**
    A CSS class to use when rendering activity as a “spinner”.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SPINNER = "spinner";

/**
    A CSS class to match statusbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_STATUSBAR = "statusbar";

/**
    A CSS class used for the subtitle label in a titlebar in
    a toplevel window.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SUBTITLE = "subtitle";

/**
    A CSS class used when an action (usually a button) is the
    primary suggested action in a specific context.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_SUGGESTED_ACTION = "suggested-action";

/**
    A CSS class used for the title label in a titlebar in
    a toplevel window.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TITLE = "title";

/**
    A CSS class used when rendering a titlebar in a toplevel window.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TITLEBAR = "titlebar";

/**
    A CSS class to match toolbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOOLBAR = "toolbar";

/**
    A CSS class to match tooltip windows.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOOLTIP = "tooltip";

/**
    A CSS class to indicate an area at the top of a widget.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOP = "top";

/**
    A CSS class for touch selection popups on entries
    and text views.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TOUCH_SELECTION = "touch-selection";

/**
    A CSS class to match troughs, as in scrollbars and progressbars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_TROUGH = "trough";

/**
    A CSS class that is added on the visual hints that happen
    where content is 'scrolled off' and can be made visible
    by scrolling.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_UNDERSHOOT = "undershoot";

/**
    A CSS class for vertically layered widgets.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_VERTICAL = "vertical";

/**
    A CSS class defining a view, such as iconviews or treeviews.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_VIEW = "view";

/**
    A CSS class for an area displaying a warning message,
    such as those in infobars.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_WARNING = "warning";

/**
    A CSS class to indicate that a UI element should be 'wide'.
    Used by #GtkPaned.
    
    Refer to individual widget documentation for used style classes.
*/
enum STYLE_CLASS_WIDE = "wide";

/**
    A property holding the background color of rendered elements as a #GdkRGBA.
*/
enum STYLE_PROPERTY_BACKGROUND_COLOR = "background-color";

/**
    A property holding the element’s background as a #cairo_pattern_t.
*/
enum STYLE_PROPERTY_BACKGROUND_IMAGE = "background-image";

/**
    A property holding the element’s border color as a #GdkRGBA.
*/
enum STYLE_PROPERTY_BORDER_COLOR = "border-color";

/**
    A property holding the rendered element’s border radius in pixels as a #gint.
*/
enum STYLE_PROPERTY_BORDER_RADIUS = "border-radius";

/**
    A property holding the element’s border style as a #GtkBorderStyle.
*/
enum STYLE_PROPERTY_BORDER_STYLE = "border-style";

/**
    A property holding the rendered element’s border width in pixels as
    a #GtkBorder. The border is the intermediary spacing property of the
    padding/border/margin series.
    
    [gtk.global.renderFrame] uses this property to find out the frame line width,
    so #GtkWidgets rendering frames may need to add up this padding when
    requesting size
*/
enum STYLE_PROPERTY_BORDER_WIDTH = "border-width";

/**
    A property holding the foreground color of rendered elements as a #GdkRGBA.
*/
enum STYLE_PROPERTY_COLOR = "color";

/**
    A property holding the font properties used when rendering text
    as a #PangoFontDescription.
*/
enum STYLE_PROPERTY_FONT = "font";

/**
    A property holding the rendered element’s margin as a #GtkBorder. The
    margin is defined as the spacing between the border of the element
    and its surrounding elements. It is external to #GtkWidget's
    size allocations, and the most external spacing property of the
    padding/border/margin series.
*/
enum STYLE_PROPERTY_MARGIN = "margin";

/**
    A property holding the rendered element’s padding as a #GtkBorder. The
    padding is defined as the spacing between the inner part of the element border
    and its child. It’s the innermost spacing property of the padding/border/margin
    series.
*/
enum STYLE_PROPERTY_PADDING = "padding";

/**
    A priority that can be used when adding a #GtkStyleProvider
    for application-specific style information.
*/
enum STYLE_PROVIDER_PRIORITY_APPLICATION = 600;

/**
    The priority used for default style information
    that is used in the absence of themes.
    
    Note that this is not very useful for providing default
    styling for custom style classes - themes are likely to
    override styling provided at this priority with
    catch-all `* {...}` rules.
*/
enum STYLE_PROVIDER_PRIORITY_FALLBACK = 1;

/**
    The priority used for style information provided
    via #GtkSettings.
    
    This priority is higher than #GTK_STYLE_PROVIDER_PRIORITY_THEME
    to let settings override themes.
*/
enum STYLE_PROVIDER_PRIORITY_SETTINGS = 400;

/**
    The priority used for style information provided
    by themes.
*/
enum STYLE_PROVIDER_PRIORITY_THEME = 200;

/**
    The priority used for the style information from
    `XDG_CONFIG_HOME/gtk-3.0/gtk.css`.
    
    You should not use priorities higher than this, to
    give the user the last word.
*/
enum STYLE_PROVIDER_PRIORITY_USER = 800;

/**
    A widget region name to define a treeview column.

    Deprecated: Don't use regions.
*/
enum STYLE_REGION_COLUMN = "column";

/**
    A widget region name to define a treeview column header.

    Deprecated: Don't use regions.
*/
enum STYLE_REGION_COLUMN_HEADER = "column-header";

/**
    A widget region name to define a treeview row.

    Deprecated: Don't use regions.
*/
enum STYLE_REGION_ROW = "row";

/**
    A widget region name to define a notebook tab.

    Deprecated: Don't use regions.
*/
enum STYLE_REGION_TAB = "tab";

/**
    The priority at which the text view validates onscreen lines
    in an idle job in the background.
*/
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;

/**
    The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
    #GtkTreeSortable use the default sort function.
    
    See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;

/**
    The GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID can be used to make a
    #GtkTreeSortable use no sorting.
    
    See also [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;
