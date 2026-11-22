/// D types for gtk4 library
module gid.gtk4.types;

import gid.cairo1.context;
import gid.core.utils;
import gid.gdk4.frame_clock;
import gid.gdk4.rectangle;
import gid.gio2.list_model;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_layout;
import gid.gtk4.cell_renderer;
import gid.gtk4.drawing_area;
import gid.gtk4.entry_completion;
import gid.gtk4.flow_box;
import gid.gtk4.flow_box_child;
import gid.gtk4.icon_view;
import gid.gtk4.list_box;
import gid.gtk4.list_box_row;
import gid.gtk4.menu_button;
import gid.gtk4.page_setup;
import gid.gtk4.print_job;
import gid.gtk4.printer;
import gid.gtk4.scale;
import gid.gtk4.text_buffer;
import gid.gtk4.text_tag;
import gid.gtk4.tree_iter;
import gid.gtk4.tree_model;
import gid.gtk4.tree_path;
import gid.gtk4.tree_selection;
import gid.gtk4.tree_view;
import gid.gtk4.tree_view_column;
import gid.gtk4.widget;
import gid.pango1.font_face;
import gid.pango1.font_family;


// Aliases

/** */
alias Allocation = gid.gdk4.rectangle.Rectangle;

// Enums

/** */
alias AccessibleAnnouncementPriority = GtkAccessibleAnnouncementPriority;

/** */
alias AccessibleAutocomplete = GtkAccessibleAutocomplete;

/** */
alias AccessibleInvalidState = GtkAccessibleInvalidState;

/** */
alias AccessiblePlatformState = GtkAccessiblePlatformState;

/** */
alias AccessibleProperty = GtkAccessibleProperty;

/** */
alias AccessibleRelation = GtkAccessibleRelation;

/** */
alias AccessibleRole = GtkAccessibleRole;

/** */
alias AccessibleSort = GtkAccessibleSort;

/** */
alias AccessibleState = GtkAccessibleState;

/** */
alias AccessibleTextContentChange = GtkAccessibleTextContentChange;

/** */
alias AccessibleTextGranularity = GtkAccessibleTextGranularity;

/** */
alias AccessibleTristate = GtkAccessibleTristate;

/** */
alias Align = GtkAlign;

/** */
alias ApplicationInhibitFlags = GtkApplicationInhibitFlags;

/** */
alias ArrowType = GtkArrowType;

/** */
alias AssistantPageType = GtkAssistantPageType;

/** */
alias BaselinePosition = GtkBaselinePosition;

/** */
alias BorderStyle = GtkBorderStyle;

/** */
alias BuilderClosureFlags = GtkBuilderClosureFlags;

/** */
alias BuilderError = GtkBuilderError;

/** */
alias ButtonsType = GtkButtonsType;

/** */
alias CellRendererAccelMode = GtkCellRendererAccelMode;

/** */
alias CellRendererMode = GtkCellRendererMode;

/** */
alias CellRendererState = GtkCellRendererState;

/** */
alias Collation = GtkCollation;

/** */
alias ConstraintAttribute = GtkConstraintAttribute;

/** */
alias ConstraintRelation = GtkConstraintRelation;

/** */
alias ConstraintStrength = GtkConstraintStrength;

/** */
alias ConstraintVflParserError = GtkConstraintVflParserError;

/** */
alias ContentFit = GtkContentFit;

/** */
alias CornerType = GtkCornerType;

/** */
alias CssParserError = GtkCssParserError;

/** */
alias CssParserWarning = GtkCssParserWarning;

/** */
alias DebugFlags = GtkDebugFlags;

/** */
alias DeleteType = GtkDeleteType;

/** */
alias DialogError = GtkDialogError;

/** */
alias DialogFlags = GtkDialogFlags;

/** */
alias DirectionType = GtkDirectionType;

/** */
alias EditableProperties = GtkEditableProperties;

/** */
alias EntryIconPosition = GtkEntryIconPosition;

/** */
alias EventControllerScrollFlags = GtkEventControllerScrollFlags;

/** */
alias EventSequenceState = GtkEventSequenceState;

/** */
alias FileChooserAction = GtkFileChooserAction;

/** */
alias FileChooserError = GtkFileChooserError;

/** */
alias FilterChange = GtkFilterChange;

/** */
alias FilterMatch = GtkFilterMatch;

/** */
alias FontChooserLevel = GtkFontChooserLevel;

/** */
alias FontLevel = GtkFontLevel;

/** */
alias FontRendering = GtkFontRendering;

/** */
alias GraphicsOffloadEnabled = GtkGraphicsOffloadEnabled;

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
alias InscriptionOverflow = GtkInscriptionOverflow;

/** */
alias InterfaceColorScheme = GtkInterfaceColorScheme;

/** */
alias InterfaceContrast = GtkInterfaceContrast;

/** */
alias Justification = GtkJustification;

/** */
alias LevelBarMode = GtkLevelBarMode;

/** */
alias License = GtkLicense;

/** */
alias ListScrollFlags = GtkListScrollFlags;

/** */
alias ListTabBehavior = GtkListTabBehavior;

/** */
alias MessageType = GtkMessageType;

/** */
alias MovementStep = GtkMovementStep;

/** */
alias NaturalWrapMode = GtkNaturalWrapMode;

/** */
alias NotebookTab = GtkNotebookTab;

/** */
alias NumberUpLayout = GtkNumberUpLayout;

/** */
alias Ordering = GtkOrdering;

/** */
alias Orientation = GtkOrientation;

/** */
alias Overflow = GtkOverflow;

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
alias PickFlags = GtkPickFlags;

/** */
alias PolicyType = GtkPolicyType;

/** */
alias PopoverMenuFlags = GtkPopoverMenuFlags;

/** */
alias PositionType = GtkPositionType;

/** */
alias PrintCapabilities = GtkPrintCapabilities;

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
alias PropagationLimit = GtkPropagationLimit;

/** */
alias PropagationPhase = GtkPropagationPhase;

/** */
alias RecentManagerError = GtkRecentManagerError;

/** */
alias ReducedMotion = GtkReducedMotion;

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
alias ShortcutActionFlags = GtkShortcutActionFlags;

/** */
alias ShortcutScope = GtkShortcutScope;

/** */
alias ShortcutType = GtkShortcutType;

/** */
alias SizeGroupMode = GtkSizeGroupMode;

/** */
alias SizeRequestMode = GtkSizeRequestMode;

/** */
alias SortType = GtkSortType;

/** */
alias SorterChange = GtkSorterChange;

/** */
alias SorterOrder = GtkSorterOrder;

/** */
alias SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy;

/** */
alias SpinType = GtkSpinType;

/** */
alias StackTransitionType = GtkStackTransitionType;

/** */
alias StateFlags = GtkStateFlags;

/** */
alias StringFilterMatchMode = GtkStringFilterMatchMode;

/** */
alias StyleContextPrintFlags = GtkStyleContextPrintFlags;

/** */
alias SvgError = GtkSvgError;

/** */
alias SvgFeatures = GtkSvgFeatures;

/** */
alias SymbolicColor = GtkSymbolicColor;

/** */
alias SystemSetting = GtkSystemSetting;

/** */
alias TextBufferNotifyFlags = GtkTextBufferNotifyFlags;

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
alias TreeModelFlags = GtkTreeModelFlags;

/** */
alias TreeViewColumnSizing = GtkTreeViewColumnSizing;

/** */
alias TreeViewDropPosition = GtkTreeViewDropPosition;

/** */
alias TreeViewGridLines = GtkTreeViewGridLines;

/** */
alias Unit = GtkUnit;

/** */
alias WindowGravity = GtkWindowGravity;

/** */
alias WrapMode = GtkWrapMode;

// Structs

/** */
alias AccessibleTextRange = GtkAccessibleTextRange;

/** */
alias BuildableParser = GtkBuildableParser;

/** */
alias CssLocation = GtkCssLocation;

/** */
alias CssStyleChange = GtkCssStyleChange*;

/** */
alias PageRange = GtkPageRange;

/** */
alias PrintBackend = GtkPrintBackend*;

/** */
alias RequestedSize = GtkRequestedSize;

/** */
alias SvgLocation = GtkSvgLocation;

// Callbacks

/**
    Type of callback used to calculate the next page in a [gid.gtk4.assistant.Assistant].
    
    It’s called both for computing the next page when the user presses the
    “forward” button and for handling the behavior of the “last” button.
    
    See [gid.gtk4.assistant.Assistant.setForwardPageFunc].

    Params:
      currentPage = The page number used to calculate the next page.
    Returns: The next page number
*/
alias AssistantPageFunc = int delegate(int currentPage);

/**
    The type of the callback functions used for iterating over the
    cell renderers and their allocated areas inside a [gid.gtk4.cell_area.CellArea],
    see [gid.gtk4.cell_area.CellArea.foreachAlloc].

    Params:
      renderer = the cell renderer to operate on
      cellArea = the area allocated to renderer inside the rectangle
          provided to [gid.gtk4.cell_area.CellArea.foreachAlloc].
      cellBackground = the background area for renderer inside the
          background area provided to [gid.gtk4.cell_area.CellArea.foreachAlloc].
    Returns: true to stop iterating over cells.

    Deprecated: There is no replacement
*/
alias CellAllocCallback = bool delegate(gid.gtk4.cell_renderer.CellRenderer renderer, gid.gdk4.rectangle.Rectangle cellArea, gid.gdk4.rectangle.Rectangle cellBackground);

/**
    The type of the callback functions used for iterating over
    the cell renderers of a [gid.gtk4.cell_area.CellArea], see [gid.gtk4.cell_area.CellArea.foreach_].

    Params:
      renderer = the cell renderer to operate on
    Returns: true to stop iterating over cells.

    Deprecated: There is no replacement
*/
alias CellCallback = bool delegate(gid.gtk4.cell_renderer.CellRenderer renderer);

/**
    A function which should set the value of cell_layout’s cell renderer(s)
    as appropriate.

    Params:
      cellLayout = a [gid.gtk4.cell_layout.CellLayout]
      cell = the cell renderer whose value is to be set
      treeModel = the model
      iter = a [gid.gtk4.tree_iter.TreeIter] indicating the row to set the value for (modified in place, changes are seen by the caller)

    Deprecated: There is no replacement
*/
alias CellLayoutDataFunc = void delegate(gid.gtk4.cell_layout.CellLayout cellLayout, gid.gtk4.cell_renderer.CellRenderer cell, gid.gtk4.tree_model.TreeModel treeModel, gid.gtk4.tree_iter.TreeIter iter);

/**
    A function to be used by [gid.gtk4.custom_layout.CustomLayout] to allocate a widget.

    Params:
      widget = the widget to allocate
      width = the new width of the widget
      height = the new height of the widget
      baseline = the new baseline of the widget, or -1
*/
alias CustomAllocateFunc = void delegate(gid.gtk4.widget.Widget widget, int width, int height, int baseline);

/**
    User function that is called to determine if the item should be matched.
    
    If the filter matches the item, this function must return true.
    If the item should be filtered out, false must be returned.

    Params:
      item = the item to be matched
    Returns: true to keep the item around
*/
alias CustomFilterFunc = bool delegate(gid.gobject2.object.ObjectWrap item);

/**
    A function to be used by [gid.gtk4.custom_layout.CustomLayout] to measure a widget.

    Params:
      widget = the widget to be measured
      orientation = the direction to be measured
      forSize = the size to be measured for
      minimum = the measured minimum size of the widget
      natural = the measured natural size of the widget
      minimumBaseline = the measured minimum baseline of the widget
      naturalBaseline = the measured natural baseline of the widget
*/
alias CustomMeasureFunc = void delegate(gid.gtk4.widget.Widget widget, gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline);

/**
    Queries a widget for its preferred size request mode.

    Params:
      widget = the widget to be queried
    Returns: the size request mode
*/
alias CustomRequestModeFunc = gid.gtk4.types.SizeRequestMode delegate(gid.gtk4.widget.Widget widget);

/**
    Whenever drawing_area needs to redraw, this function will be called.
    
    This function should exclusively redraw the contents of the drawing area
    and must not call any widget functions that cause changes.

    Params:
      drawingArea = the [gid.gtk4.drawing_area.DrawingArea] to redraw
      cr = the context to draw to (modified in place, changes are seen by the caller)
      width = the actual width of the contents. This value will be at least
          as wide as GtkDrawingArea:width.
      height = the actual height of the contents. This value will be at least
          as wide as GtkDrawingArea:height.
*/
alias DrawingAreaDrawFunc = void delegate(gid.gtk4.drawing_area.DrawingArea drawingArea, gid.cairo1.context.Context cr, int width, int height);

/**
    A function which decides whether the row indicated by iter matches
    a given key, and should be displayed as a possible completion for key.
    
    Note that key is normalized and case-folded (see [gid.glib2.global.utf8Normalize]
    and [gid.glib2.global.utf8Casefold]). If this is not appropriate, match functions
    have access to the unmodified key via
    `gtk_editable_get_text (GTK_EDITABLE (gtk_entry_completion_get_entry ()))`.

    Params:
      completion = the [gid.gtk4.entry_completion.EntryCompletion]
      key = the string to match, normalized and case-folded
      iter = a [gid.gtk4.tree_iter.TreeIter] indicating the row to match (modified in place, changes are seen by the caller)
    Returns: true if iter should be displayed as a possible completion
        for key

    Deprecated: There is no replacement
*/
alias EntryCompletionMatchFunc = bool delegate(gid.gtk4.entry_completion.EntryCompletion completion, string key, gid.gtk4.tree_iter.TreeIter iter);

/**
    Callback called by [gid.gtk4.expression.Expression.watch] when the
    expression value changes.
*/
alias ExpressionNotify = void delegate();

/**
    Called for flow boxes that are bound to a [gid.gio2.list_model.ListModel].
    
    This function is called for each item that gets added to the model.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a [gid.gtk4.widget.Widget] that represents item
*/
alias FlowBoxCreateWidgetFunc = gid.gtk4.widget.Widget delegate(gid.gobject2.object.ObjectWrap item);

/**
    A function that will be called whenever a child changes
    or is added.
    
    It lets you control if the child should be visible or not.

    Params:
      child = a [gid.gtk4.flow_box_child.FlowBoxChild] that may be filtered
    Returns: true if the row should be visible, false otherwise
*/
alias FlowBoxFilterFunc = bool delegate(gid.gtk4.flow_box_child.FlowBoxChild child);

/**
    A function used by [gid.gtk4.flow_box.FlowBox.selectedForeach].
    
    It will be called on every selected child of the box.

    Params:
      box = a [gid.gtk4.flow_box.FlowBox]
      child = a [gid.gtk4.flow_box_child.FlowBoxChild]
*/
alias FlowBoxForeachFunc = void delegate(gid.gtk4.flow_box.FlowBox box, gid.gtk4.flow_box_child.FlowBoxChild child);

/**
    A function to compare two children to determine which
    should come first.

    Params:
      child1 = the first child
      child2 = the second child
    Returns: < 0 if child1 should be before child2, 0 if
        they are equal, and > 0 otherwise
*/
alias FlowBoxSortFunc = int delegate(gid.gtk4.flow_box_child.FlowBoxChild child1, gid.gtk4.flow_box_child.FlowBoxChild child2);

/**
    The type of function that is used for deciding what fonts get
    shown in a [gid.gtk4.font_chooser.FontChooser].
    
    See [gid.gtk4.font_chooser.FontChooser.setFilterFunc].

    Params:
      family = a [gid.pango1.font_family.FontFamily]
      face = a [gid.pango1.font_face.FontFace] belonging to family
    Returns: true if the font should be displayed

    Deprecated: There is no replacement
*/
alias FontFilterFunc = bool delegate(gid.pango1.font_family.FontFamily family, gid.pango1.font_face.FontFace face);

/**
    A function used by [gid.gtk4.icon_view.IconView.selectedForeach] to map all
    selected rows.
    
    It will be called on every selected row in the view.

    Params:
      iconView = a [gid.gtk4.icon_view.IconView]
      path = The [gid.gtk4.tree_path.TreePath] of a selected row (modified in place, changes are seen by the caller)

    Deprecated: There is no replacement.
*/
alias IconViewForeachFunc = void delegate(gid.gtk4.icon_view.IconView iconView, gid.gtk4.tree_path.TreePath path);

/**
    Called for list boxes that are bound to a [gid.gio2.list_model.ListModel] with
    [gid.gtk4.list_box.ListBox.bindModel] for each item that gets added to the model.
    
    If the widget returned is not a #GtkListBoxRow widget, then the widget
    will be inserted as the child of an intermediate #GtkListBoxRow.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a [gid.gtk4.widget.Widget] that represents item
*/
alias ListBoxCreateWidgetFunc = gid.gtk4.widget.Widget delegate(gid.gobject2.object.ObjectWrap item);

/**
    Will be called whenever the row changes or is added and lets you control
    if the row should be visible or not.

    Params:
      row = the row that may be filtered
    Returns: true if the row should be visible, false otherwise
*/
alias ListBoxFilterFunc = bool delegate(gid.gtk4.list_box_row.ListBoxRow row);

/**
    A function used by [gid.gtk4.list_box.ListBox.selectedForeach].
    
    It will be called on every selected child of the box.

    Params:
      box = a [gid.gtk4.list_box.ListBox]
      row = a [gid.gtk4.list_box_row.ListBoxRow]
*/
alias ListBoxForeachFunc = void delegate(gid.gtk4.list_box.ListBox box, gid.gtk4.list_box_row.ListBoxRow row);

/**
    Compare two rows to determine which should be first.

    Params:
      row1 = the first row
      row2 = the second row
    Returns: < 0 if row1 should be before row2, 0 if they are
        equal and > 0 otherwise
*/
alias ListBoxSortFunc = int delegate(gid.gtk4.list_box_row.ListBoxRow row1, gid.gtk4.list_box_row.ListBoxRow row2);

/**
    Whenever row changes or which row is before row changes this
    is called, which lets you update the header on row.
    
    You may remove or set a new one via [gid.gtk4.list_box_row.ListBoxRow.setHeader]
    or just change the state of the current header widget.

    Params:
      row = the row to update
      before = the row before row, or null if it is first
*/
alias ListBoxUpdateHeaderFunc = void delegate(gid.gtk4.list_box_row.ListBoxRow row, gid.gtk4.list_box_row.ListBoxRow before);

/**
    User function that is called to map an item of the original model to
    an item expected by the map model.
    
    The returned items must conform to the item type of the model they are
    used with.

    Params:
      item = The item to map
    Returns: The item to map to
*/
alias MapListModelMapFunc = gid.gobject2.object.ObjectWrap delegate(gid.gobject2.object.ObjectWrap item);

/**
    User-provided callback function to create a popup for a
    [gid.gtk4.menu_button.MenuButton] on demand.
    
    This function is called when the popup of menu_button is shown,
    but none has been provided via [gid.gtk4.menu_button.MenuButton.setPopover]
    or [gid.gtk4.menu_button.MenuButton.setMenuModel].

    Params:
      menuButton = the [gid.gtk4.menu_button.MenuButton]
*/
alias MenuButtonCreatePopupFunc = void delegate(gid.gtk4.menu_button.MenuButton menuButton);

/**
    The type of function that is passed to
    [gid.gtk4.global.printRunPageSetupDialogAsync].
    
    This function will be called when the page setup dialog
    is dismissed, and also serves as destroy notify for data.

    Params:
      pageSetup = the [gid.gtk4.page_setup.PageSetup] that has been passed to
          [gid.gtk4.global.printRunPageSetupDialogAsync]
*/
alias PageSetupDoneFunc = void delegate(gid.gtk4.page_setup.PageSetup pageSetup);

/**
    The type of callback that is passed to [gid.gtk4.print_job.PrintJob.send].
    
    It is called when the print job has been completely sent.

    Params:
      printJob = the [gid.gtk4.print_job.PrintJob]
      error = a [gid.glib2.error.ErrorWrap] that contains error information if the sending
          of the print job failed, otherwise null
*/
alias PrintJobCompleteFunc = void delegate(gid.gtk4.print_job.PrintJob printJob, gid.glib2.error.ErrorWrap error);

/**
    Function called by [gid.gtk4.print_settings.PrintSettings.foreach_] on every key/value pair
    inside a [gid.gtk4.print_settings.PrintSettings].

    Params:
      key = the setting key
      value = the setting value
*/
alias PrintSettingsFunc = void delegate(string key, string value);

/**
    The type of function passed to [gid.gtk4.global.enumeratePrinters].
    
    Note that you need to ref printer, if you want to keep
    a reference to it after the function has returned.

    Params:
      printer = a [gid.gtk4.printer.Printer]
    Returns: true to stop the enumeration, false to continue
*/
alias PrinterFunc = bool delegate(gid.gtk4.printer.Printer printer);

/**
    Function that formats the value of a scale.
    
    See [gid.gtk4.scale.Scale.setFormatValueFunc].

    Params:
      scale = The [gid.gtk4.scale.Scale]
      value = The numeric value to format
    Returns: A newly allocated string describing a textual representation
        of the given numerical value.
*/
alias ScaleFormatValueFunc = string delegate(gid.gtk4.scale.Scale scale, double value);

/**
    Type for shortcuts based on user callbacks.

    Params:
      widget = The widget passed to the activation
      args = The arguments passed to the activation
    Returns: true if the action was successful
*/
alias ShortcutFunc = bool delegate(gid.gtk4.widget.Widget widget, gid.glib2.variant.Variant args);

/**
    A notification callback used by [gid.gtk4.text_buffer.TextBuffer.addCommitNotify].
    
    You may not modify the [gid.gtk4.text_buffer.TextBuffer] from a
    [gid.gtk4.types.TextBufferCommitNotify] callback and that is enforced
    by the [gid.gtk4.text_buffer.TextBuffer] API.
    
    [gid.gtk4.types.TextBufferCommitNotify] may be used to be notified about
    changes to the underlying buffer right before-or-after the changes are
    committed to the underlying B-Tree. This is useful if you want to observe
    changes to the buffer without other signal handlers potentially modifying
    state on the way to the default signal handler.
    
    When flags is [gid.gtk4.types.TextBufferNotifyFlags.BeforeInsert], `position` is set to
    the offset in characters from the start of the buffer where the insertion
    will occur. `length` is set to the number of characters to be inserted.  You
    may not yet retrieve the text until it has been inserted. You may access the
    text from [gid.gtk4.types.TextBufferNotifyFlags.AfterInsert] using
    [gid.gtk4.text_buffer.TextBuffer.getSlice].
    
    When flags is [gid.gtk4.types.TextBufferNotifyFlags.AfterInsert], `position` is set to
    offset in characters where the insertion occurred and `length` is set
    to the number of characters inserted.
    
    When flags is [gid.gtk4.types.TextBufferNotifyFlags.BeforeDelete], `position` is set to
    offset in characters where the deletion will occur and `length` is set
    to the number of characters that will be removed. You may still retrieve
    the text from this handler using `position` and `length`.
    
    When flags is [gid.gtk4.types.TextBufferNotifyFlags.AfterDelete], `length` is set to
    zero to denote that the delete-range has already been committed to the
    underlying B-Tree. You may no longer retrieve the text that has been
    deleted from the [gid.gtk4.text_buffer.TextBuffer].

    Params:
      buffer = the text buffer being notified
      flags = the type of commit notification
      position = the position of the text operation
      length = the length of the text operation in characters
*/
alias TextBufferCommitNotify = void delegate(gid.gtk4.text_buffer.TextBuffer buffer, gid.gtk4.types.TextBufferNotifyFlags flags, uint position, uint length);

/**
    The predicate function used by [gid.gtk4.text_iter.TextIter.forwardFindChar] and
    [gid.gtk4.text_iter.TextIter.backwardFindChar].

    Params:
      ch = a Unicode code point
    Returns: true if the predicate is satisfied, and the iteration should
        stop, and false otherwise
*/
alias TextCharPredicate = bool delegate(dchar ch);

/**
    A function used with [gid.gtk4.text_tag_table.TextTagTable.foreach_],
    to iterate over every [gid.gtk4.text_tag.TextTag] inside a [gid.gtk4.text_tag_table.TextTagTable].

    Params:
      tag = the [gid.gtk4.text_tag.TextTag]
*/
alias TextTagTableForeach = void delegate(gid.gtk4.text_tag.TextTag tag);

/**
    Callback type for adding a function to update animations.
    
    See [gid.gtk4.widget.Widget.addTickCallback].

    Params:
      widget = the widget
      frameClock = the frame clock for the widget
    Returns: [gid.glib2.types.SOURCE_CONTINUE] if the tick callback should continue
        to be called, [gid.glib2.types.SOURCE_REMOVE] if it should be removed
*/
alias TickCallback = bool delegate(gid.gtk4.widget.Widget widget, gid.gdk4.frame_clock.FrameClock frameClock);

/**
    A function to set the properties of a cell instead of just using the
    straight mapping between the cell and the model.
    
    This function is useful for customizing the cell renderer. For example,
    a function might get an* integer from the tree_model, and render it to
    the “text” attribute of “cell” by converting it to its written equivalent.
    
    See also: [gid.gtk4.tree_view_column.TreeViewColumn.setCellDataFunc]

    Params:
      treeColumn = A [gid.gtk4.tree_view_column.TreeViewColumn]
      cell = The [gid.gtk4.cell_renderer.CellRenderer] that is being rendered by tree_column
      treeModel = The [gid.gtk4.tree_model.TreeModel] being rendered
      iter = A [gid.gtk4.tree_iter.TreeIter] of the current row rendered (modified in place, changes are seen by the caller)

    Deprecated: There is no replacement
*/
alias TreeCellDataFunc = void delegate(gid.gtk4.tree_view_column.TreeViewColumn treeColumn, gid.gtk4.cell_renderer.CellRenderer cell, gid.gtk4.tree_model.TreeModel treeModel, gid.gtk4.tree_iter.TreeIter iter);

/**
    A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
    integer if `a` sorts before `b`, `a` sorts with `b`, or `a` sorts after `b`
    respectively.
    
    If two iters compare as equal, their order in the sorted model
    is undefined. In order to ensure that the [gid.gtk4.tree_sortable.TreeSortable] behaves as
    expected, the GtkTreeIterCompareFunc must define a partial order on
    the model, i.e. it must be reflexive, antisymmetric and transitive.
    
    For example, if model is a product catalogue, then a compare function
    for the “price” column could be one which returns
    `price_of(`a`) - price_of(`b`)`.

    Params:
      model = The [gid.gtk4.tree_model.TreeModel] the comparison is within
      a = A [gid.gtk4.tree_iter.TreeIter] in model (modified in place, changes are seen by the caller)
      b = Another [gid.gtk4.tree_iter.TreeIter] in model (modified in place, changes are seen by the caller)
    Returns: a negative integer, zero or a positive integer depending on whether
        `a` sorts before, with or after `b`

    Deprecated: There is no replacement
*/
alias TreeIterCompareFunc = int delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_iter.TreeIter a, gid.gtk4.tree_iter.TreeIter b);

/**
    Prototype of the function called to create new child models when
    [gid.gtk4.tree_list_row.TreeListRow.setExpanded] is called.
    
    This function can return null to indicate that item is guaranteed to be
    a leaf node and will never have children. If it does not have children but
    may get children later, it should return an empty model that is filled once
    children arrive.

    Params:
      item = The item that is being expanded
    Returns: The model tracking the children of
        item or null if item can never have children
*/
alias TreeListModelCreateModelFunc = gid.gio2.list_model.ListModel delegate(gid.gobject2.object.ObjectWrap item);

/**
    A function which calculates display values from raw values in the model.
    It must fill value with the display value for the column column in the
    row indicated by iter.
    
    Since this function is called for each data access, it’s not a
    particularly efficient operation.

    Params:
      model = the [gid.gtk4.tree_model_filter.TreeModelFilter]
      iter = a [gid.gtk4.tree_iter.TreeIter] pointing to the row whose display values are determined (modified in place, changes are seen by the caller)
      value = A [gid.gobject2.value.Value] which is already initialized for
         with the correct type for the column column.
      column = the column whose display value is determined

    Deprecated: There is no replacement
*/
alias TreeModelFilterModifyFunc = void delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_iter.TreeIter iter, out gid.gobject2.value.Value value, int column);

/**
    A function which decides whether the row indicated by iter is visible.

    Params:
      model = the child model of the [gid.gtk4.tree_model_filter.TreeModelFilter]
      iter = a [gid.gtk4.tree_iter.TreeIter] pointing to the row in model whose visibility
          is determined (modified in place, changes are seen by the caller)
    Returns: Whether the row indicated by iter is visible.

    Deprecated: There is no replacement
*/
alias TreeModelFilterVisibleFunc = bool delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_iter.TreeIter iter);

/**
    Type of the callback passed to [gid.gtk4.tree_model.TreeModel.foreach_] to
    iterate over the rows in a tree model.

    Params:
      model = the [gid.gtk4.tree_model.TreeModel] being iterated
      path = the current [gid.gtk4.tree_path.TreePath] (modified in place, changes are seen by the caller)
      iter = the current [gid.gtk4.tree_iter.TreeIter] (modified in place, changes are seen by the caller)
    Returns: true to stop iterating, false to continue

    Deprecated: There is no replacement.
*/
alias TreeModelForeachFunc = bool delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter);

/**
    A function used by [gid.gtk4.tree_selection.TreeSelection.selectedForeach] to map all
    selected rows.  It will be called on every selected row in the view.

    Params:
      model = The [gid.gtk4.tree_model.TreeModel] being viewed
      path = The [gid.gtk4.tree_path.TreePath] of a selected row (modified in place, changes are seen by the caller)
      iter = A [gid.gtk4.tree_iter.TreeIter] pointing to a selected row (modified in place, changes are seen by the caller)

    Deprecated: There is no replacement
*/
alias TreeSelectionForeachFunc = void delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_path.TreePath path, gid.gtk4.tree_iter.TreeIter iter);

/**
    A function used by [gid.gtk4.tree_selection.TreeSelection.setSelectFunction] to filter
    whether or not a row may be selected. It is called whenever a row's
    state might change.
    
    A return value of true indicates to selection that it is okay to
    change the selection.

    Params:
      selection = A [gid.gtk4.tree_selection.TreeSelection]
      model = A [gid.gtk4.tree_model.TreeModel] being viewed
      path = The [gid.gtk4.tree_path.TreePath] of the row in question (modified in place, changes are seen by the caller)
      pathCurrentlySelected = true, if the path is currently selected
    Returns: true, if the selection state of the row can be toggled

    Deprecated: There is no replacement
*/
alias TreeSelectionFunc = bool delegate(gid.gtk4.tree_selection.TreeSelection selection, gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_path.TreePath path, bool pathCurrentlySelected);

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
      treeView = A [gid.gtk4.tree_view.TreeView]
      column = The [gid.gtk4.tree_view_column.TreeViewColumn] being dragged
      prevColumn = A [gid.gtk4.tree_view_column.TreeViewColumn] on one side of column
      nextColumn = A [gid.gtk4.tree_view_column.TreeViewColumn] on the other side of column
    Returns: true, if column can be dropped in this spot

    Deprecated: There is no replacement.
*/
alias TreeViewColumnDropFunc = bool delegate(gid.gtk4.tree_view.TreeView treeView, gid.gtk4.tree_view_column.TreeViewColumn column, gid.gtk4.tree_view_column.TreeViewColumn prevColumn, gid.gtk4.tree_view_column.TreeViewColumn nextColumn);

/**
    Function used for [gid.gtk4.tree_view.TreeView.mapExpandedRows].

    Params:
      treeView = A [gid.gtk4.tree_view.TreeView]
      path = The path that’s expanded (modified in place, changes are seen by the caller)

    Deprecated: There is no replacement.
*/
alias TreeViewMappingFunc = void delegate(gid.gtk4.tree_view.TreeView treeView, gid.gtk4.tree_path.TreePath path);

/**
    Function type for determining whether the row pointed to by iter should
    be rendered as a separator. A common way to implement this is to have a
    boolean column in the model, whose values the [gid.gtk4.types.TreeViewRowSeparatorFunc]
    returns.

    Params:
      model = the [gid.gtk4.tree_model.TreeModel]
      iter = a [gid.gtk4.tree_iter.TreeIter] pointing at a row in model (modified in place, changes are seen by the caller)
    Returns: true if the row is a separator

    Deprecated: There is no replacement.
*/
alias TreeViewRowSeparatorFunc = bool delegate(gid.gtk4.tree_model.TreeModel model, gid.gtk4.tree_iter.TreeIter iter);

/**
    A function used for checking whether a row in model matches
    a search key string entered by the user. Note the return value
    is reversed from what you would normally expect, though it
    has some similarity to strcmp() returning 0 for equal strings.

    Params:
      model = the [gid.gtk4.tree_model.TreeModel] being searched
      column = the search column set by [gid.gtk4.tree_view.TreeView.setSearchColumn]
      key = the key string to compare with
      iter = a [gid.gtk4.tree_iter.TreeIter] pointing the row of model that should be compared
         with key. (modified in place, changes are seen by the caller)
    Returns: false if the row matches, true otherwise.

    Deprecated: There is no replacement.
*/
alias TreeViewSearchEqualFunc = bool delegate(gid.gtk4.tree_model.TreeModel model, int column, string key, gid.gtk4.tree_iter.TreeIter iter);

/**
    The type of the callback functions used for activating
    actions installed with [gid.gtk4.widget_class.WidgetClass.installAction].
    
    The parameter must match the parameter_type of the action.

    Params:
      widget = the widget to which the action belongs
      actionName = the action name
      parameter = parameter for activation
*/
alias WidgetActionActivateFunc = void delegate(gid.gtk4.widget.Widget widget, string actionName, gid.glib2.variant.Variant parameter);

/**
    An attribute for the background color, expressed as an RGB value
    encoded in a string using the format: `{r8},{g8},{b8}`.
*/
enum ACCESSIBLE_ATTRIBUTE_BACKGROUND = "bg-color";

/**
    An attribute for the font family name.
*/
enum ACCESSIBLE_ATTRIBUTE_FAMILY = "family-name";

/**
    An attribute for the foreground color, expressed as an RGB value
    encoded in a string using the format: `{r8},{g8},{b8}`.
*/
enum ACCESSIBLE_ATTRIBUTE_FOREGROUND = "fg-color";

/**
    An attribute for the overline style.
    
    Possible values are:
    
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE]
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE = "overline";

/**
    The "none" overline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE = "none";

/**
    The "single" overline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE = "single";

/**
    An attribute for the font size, expressed in points.
*/
enum ACCESSIBLE_ATTRIBUTE_SIZE = "size";

/**
    An attribute for the font stretch type.
    
    Possible values are:
    
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED]
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH = "stretch";

/**
    The "condensed" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED = "condensed";

/**
    The "expanded" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXPANDED = "expanded";

/**
    The "extra condensed" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED = "extra_condensed";

/**
    The "extra expanded" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_EXPANDED = "extra_expanded";

/**
    The "normal" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_NORMAL = "normal";

/**
    The "semi condensed" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED = "semi_condensed";

/**
    The "semi expanded" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_EXPANDED = "semi_expanded";

/**
    The "ultra condensed" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED = "ultra_condensed";

/**
    The "ultra expanded" stretch value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_EXPANDED = "ultra_expanded";

/**
    An attribute for strikethrough text.
    
    Possible values are `true` or `false`.
*/
enum ACCESSIBLE_ATTRIBUTE_STRIKETHROUGH = "strikethrough";

/**
    An attribute for the font style.
    
    Possible values are:
    
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC]
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE = "style";

/**
    The "italic" style value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC = "italic";

/**
    The "normal" style value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL = "normal";

/**
    The "oblique" style value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE = "oblique";

/**
    An attribute for the underline style.
    
    Possible values are:
    
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR]
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE = "underline";

/**
    The "double" underline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE = "double";

/**
    The "error" underline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR = "error";

/**
    The "none" underline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE = "none";

/**
    The "single" underline value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE = "single";

/**
    An attribute for the font variant.
    
    Possible values are:
    
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE]
    - [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS]
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT = "variant";

/**
    The "all petite caps" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS = "all-petite-caps";

/**
    The "all small caps" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS = "all-small-caps";

/**
    The "petite caps" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS = "petite-caps";

/**
    The "small caps" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS = "small-caps";

/**
    The "title caps" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS = "title-caps";

/**
    The "unicase" variant value for [gid.gtk4.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE = "unicase";

/**
    An attribute for the font weight.
*/
enum ACCESSIBLE_ATTRIBUTE_WEIGHT = "weight";

/**
    An undefined value. The accessible attribute is either unset, or its
    value is undefined.
*/
enum ACCESSIBLE_VALUE_UNDEFINED = -1;

/**
    Like `func@get_binary_age`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum BINARY_AGE = 2204;

/**
    The default name of the extension point.
*/
enum IM_MODULE_EXTENSION_POINT_NAME = "gtk-im-module";

/**
    Constant to return from a signal handler for the ::input
    signal in case of conversion failure.
    
    See [gid.gtk4.spin_button.SpinButton.input].
*/
enum INPUT_ERROR = -1;

/**
    Like `func@get_interface_age`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum INTERFACE_AGE = 4;

/**
    The value used to refer to a guaranteed invalid position
    in a [gid.gio2.list_model.ListModel].
    
    This value may be returned from some functions, others may
    accept it as input. Its interpretation may differ for different
    functions.
    
    Refer to each function's documentation for if this value is
    allowed and what it does.
*/
enum INVALID_LIST_POSITION = 4294967295;

/**
    The name used for the stock full offset included by [gid.gtk4.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_FULL = "full";

/**
    The name used for the stock high offset included by [gid.gtk4.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_HIGH = "high";

/**
    The name used for the stock low offset included by [gid.gtk4.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_LOW = "low";

/**
    Like `func@get_major_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 4;

/**
    Evaluates to the maximum length of a compose sequence.
    
    This macro is longer used by GTK.
*/
enum MAX_COMPOSE_LEN = 7;

/**
    The default extension point name for media file.
*/
enum MEDIA_FILE_EXTENSION_POINT_NAME = "gtk-media-file";

/**
    Like `func@get_micro_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 4;

/**
    Like `func@get_minor_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 22;

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

/**
    The key used by the “Print to file” printer to store whether to collate the
    printed pages.
*/
enum PRINT_SETTINGS_COLLATE = "collate";

/**
    The key used by the “Print to file” printer to store the default source.
*/
enum PRINT_SETTINGS_DEFAULT_SOURCE = "default-source";

/**
    The key used by the “Print to file” printer to store the dither used.
*/
enum PRINT_SETTINGS_DITHER = "dither";

/**
    The key used by the “Print to file” printer to store whether to print the
    output in duplex.
*/
enum PRINT_SETTINGS_DUPLEX = "duplex";

/**
    The key used by the “Print to file” printer to store the finishings.
*/
enum PRINT_SETTINGS_FINISHINGS = "finishings";

/**
    The key used by the “Print to file” printer to store the media type.
    
    The set of media types is defined in PWG 5101.1-2002 PWG.
*/
enum PRINT_SETTINGS_MEDIA_TYPE = "media-type";

/**
    The key used by the “Print to file” printer to store the number of pages per
    sheet.
*/
enum PRINT_SETTINGS_NUMBER_UP = "number-up";

/**
    The key used by the “Print to file” printer to store the number of pages per
    sheet in number-up mode.
*/
enum PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout";

/**
    The key used by the “Print to file” printer to store the number of copies.
*/
enum PRINT_SETTINGS_N_COPIES = "n-copies";

/**
    The key used by the “Print to file” printer to store the orientation.
*/
enum PRINT_SETTINGS_ORIENTATION = "orientation";

/**
    The key used by the “Print to file” printer to store the file
    name of the output without the path to the directory and the
    file extension.
*/
enum PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename";

/**
    The key used by the “Print to file” printer to store the output bin.
*/
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
    to which the output should be written. GTK itself supports
    only “file://” URIs.
*/
enum PRINT_SETTINGS_OUTPUT_URI = "output-uri";

/**
    The key used by the “Print to file” printer to store the array of page ranges
    to print.
*/
enum PRINT_SETTINGS_PAGE_RANGES = "page-ranges";

/**
    The key used by the “Print to file” printer to store the set of pages to print.
*/
enum PRINT_SETTINGS_PAGE_SET = "page-set";

/**
    The key used by the “Print to file” printer to store the page format.
*/
enum PRINT_SETTINGS_PAPER_FORMAT = "paper-format";

/**
    The key used by the “Print to file” printer to store the page height.
*/
enum PRINT_SETTINGS_PAPER_HEIGHT = "paper-height";

/**
    The key used by the “Print to file” printer to store the paper width.
*/
enum PRINT_SETTINGS_PAPER_WIDTH = "paper-width";

/**
    The key used by the “Print to file” printer to store the printer name.
*/
enum PRINT_SETTINGS_PRINTER = "printer";

/**
    The key used by the “Print to file” printer to store the resolution in lines
    per inch.
*/
enum PRINT_SETTINGS_PRINTER_LPI = "printer-lpi";

/**
    The key used by the “Print to file” printer to store which pages to print.
*/
enum PRINT_SETTINGS_PRINT_PAGES = "print-pages";

/**
    The key used by the “Print to file” printer to store the printing quality.
*/
enum PRINT_SETTINGS_QUALITY = "quality";

/**
    The key used by the “Print to file” printer to store the resolution in DPI.
*/
enum PRINT_SETTINGS_RESOLUTION = "resolution";

/**
    The key used by the “Print to file” printer to store the horizontal
    resolution in DPI.
*/
enum PRINT_SETTINGS_RESOLUTION_X = "resolution-x";

/**
    The key used by the “Print to file” printer to store the vertical resolution
    in DPI.
*/
enum PRINT_SETTINGS_RESOLUTION_Y = "resolution-y";

/**
    The key used by the “Print to file” printer to store whether to reverse the
    order of the printed pages.
*/
enum PRINT_SETTINGS_REVERSE = "reverse";

/**
    The key used by the “Print to file” printer to store the scale.
*/
enum PRINT_SETTINGS_SCALE = "scale";

/**
    The key used by the “Print to file” printer to store whether to print with
    colors.
*/
enum PRINT_SETTINGS_USE_COLOR = "use-color";

/**
    The key used by the “Print to file” printer to store 32-bit Windows extra
    driver.
*/
enum PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra";

/**
    The key used by the “Print to file” printer to store the 32-bit Windows
    driver version.
*/
enum PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version";

/**
    Use this priority for functionality related to size allocation.
    
    It is used internally by GTK+ to compute the sizes of widgets.
    This priority is higher than [gid.gdk4.types.PRIORITY_REDRAW] to avoid
    resizing a widget which was just redrawn.
*/
enum PRIORITY_RESIZE = 110;

/**
    A priority that can be used when adding a [gid.gtk4.style_provider.StyleProvider]
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
    via [gid.gtk4.settings.Settings].
    
    This priority is higher than [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_THEME]
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
    `$XDG_CONFIG_HOME/gtk-4.0/gtk.css`.
    
    You should not use priorities higher than this, to
    give the user the last word.
*/
enum STYLE_PROVIDER_PRIORITY_USER = 800;

/**
    The [gid.gtk4.types.SvgFeatures] that are enabled by default.
*/
enum SVG_DEFAULT_FEATURES = 15;

/**
    The priority at which the text view validates onscreen lines
    in an idle job in the background.
*/
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;

/**
    Uses the default sort function in a [gid.gtk4.tree_sortable.TreeSortable].
    
    See also: [gid.gtk4.tree_sortable.TreeSortable.setSortColumnId]

    Deprecated: There is no replacement
*/
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;

/**
    Disables sorting in a [gid.gtk4.tree_sortable.TreeSortable].
    
    See also: [gid.gtk4.tree_sortable.TreeSortable.setSortColumnId]

    Deprecated: There is no replacement
*/
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;
