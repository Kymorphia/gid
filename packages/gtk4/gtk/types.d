/// D types for gtk4 library
module gtk.types;

import cairo.context;
import gdk.frame_clock;
import gdk.rectangle;
import gid.gid;
import gio.list_model;
import glib.error;
import glib.variant;
import gobject.object;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_layout;
import gtk.cell_renderer;
import gtk.drawing_area;
import gtk.entry_completion;
import gtk.flow_box;
import gtk.flow_box_child;
import gtk.icon_view;
import gtk.list_box;
import gtk.list_box_row;
import gtk.menu_button;
import gtk.page_setup;
import gtk.print_job;
import gtk.printer;
import gtk.scale;
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
alias SymbolicColor = GtkSymbolicColor;

/** */
alias SystemSetting = GtkSystemSetting;

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

// Callbacks

/**
    Type of callback used to calculate the next page in a [gtk.assistant.Assistant].
    
    It’s called both for computing the next page when the user presses the
    “forward” button and for handling the behavior of the “last” button.
    
    See [gtk.assistant.Assistant.setForwardPageFunc].

    Params:
      currentPage = The page number used to calculate the next page.
    Returns: The next page number
*/
alias AssistantPageFunc = int delegate(int currentPage);

/**
    The type of the callback functions used for iterating over the
    cell renderers and their allocated areas inside a [gtk.cell_area.CellArea],
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
    the cell renderers of a [gtk.cell_area.CellArea], see [gtk.cell_area.CellArea.foreach_].

    Params:
      renderer = the cell renderer to operate on
    Returns: true to stop iterating over cells.
*/
alias CellCallback = bool delegate(gtk.cell_renderer.CellRenderer renderer);

/**
    A function which should set the value of cell_layout’s cell renderer(s)
    as appropriate.

    Params:
      cellLayout = a [gtk.cell_layout.CellLayout]
      cell = the cell renderer whose value is to be set
      treeModel = the model
      iter = a [gtk.tree_iter.TreeIter] indicating the row to set the value for
*/
alias CellLayoutDataFunc = void delegate(gtk.cell_layout.CellLayout cellLayout, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A function to be used by [gtk.custom_layout.CustomLayout] to allocate a widget.

    Params:
      widget = the widget to allocate
      width = the new width of the widget
      height = the new height of the widget
      baseline = the new baseline of the widget, or -1
*/
alias CustomAllocateFunc = void delegate(gtk.widget.Widget widget, int width, int height, int baseline);

/**
    User function that is called to determine if the item should be matched.
    
    If the filter matches the item, this function must return true. If the
    item should be filtered out, false must be returned.

    Params:
      item = The item to be matched
    Returns: true to keep the item around
*/
alias CustomFilterFunc = bool delegate(gobject.object.ObjectWrap item);

/**
    A function to be used by [gtk.custom_layout.CustomLayout] to measure a widget.

    Params:
      widget = the widget to be measured
      orientation = the direction to be measured
      forSize = the size to be measured for
      minimum = the measured minimum size of the widget
      natural = the measured natural size of the widget
      minimumBaseline = the measured minimum baseline of the widget
      naturalBaseline = the measured natural baseline of the widget
*/
alias CustomMeasureFunc = void delegate(gtk.widget.Widget widget, gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline);

/**
    Queries a widget for its preferred size request mode.

    Params:
      widget = the widget to be queried
    Returns: the size request mode
*/
alias CustomRequestModeFunc = gtk.types.SizeRequestMode delegate(gtk.widget.Widget widget);

/**
    Whenever drawing_area needs to redraw, this function will be called.
    
    This function should exclusively redraw the contents of the drawing area
    and must not call any widget functions that cause changes.

    Params:
      drawingArea = the [gtk.drawing_area.DrawingArea] to redraw
      cr = the context to draw to
      width = the actual width of the contents. This value will be at least
          as wide as GtkDrawingArea:width.
      height = the actual height of the contents. This value will be at least
          as wide as GtkDrawingArea:height.
*/
alias DrawingAreaDrawFunc = void delegate(gtk.drawing_area.DrawingArea drawingArea, cairo.context.Context cr, int width, int height);

/**
    A function which decides whether the row indicated by iter matches
    a given key, and should be displayed as a possible completion for key.
    
    Note that key is normalized and case-folded (see [glib.global.utf8Normalize]
    and [glib.global.utf8Casefold]). If this is not appropriate, match functions
    have access to the unmodified key via
    `gtk_editable_get_text (GTK_EDITABLE (gtk_entry_completion_get_entry ()))`.

    Params:
      completion = the [gtk.entry_completion.EntryCompletion]
      key = the string to match, normalized and case-folded
      iter = a [gtk.tree_iter.TreeIter] indicating the row to match
    Returns: true if iter should be displayed as a possible completion
        for key
*/
alias EntryCompletionMatchFunc = bool delegate(gtk.entry_completion.EntryCompletion completion, string key, gtk.tree_iter.TreeIter iter);

/**
    Callback called by [gtk.expression.Expression.watch] when the
    expression value changes.
*/
alias ExpressionNotify = void delegate();

/**
    Called for flow boxes that are bound to a [gio.list_model.ListModel].
    
    This function is called for each item that gets added to the model.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a [gtk.widget.Widget] that represents item
*/
alias FlowBoxCreateWidgetFunc = gtk.widget.Widget delegate(gobject.object.ObjectWrap item);

/**
    A function that will be called whenever a child changes
    or is added.
    
    It lets you control if the child should be visible or not.

    Params:
      child = a [gtk.flow_box_child.FlowBoxChild] that may be filtered
    Returns: true if the row should be visible, false otherwise
*/
alias FlowBoxFilterFunc = bool delegate(gtk.flow_box_child.FlowBoxChild child);

/**
    A function used by [gtk.flow_box.FlowBox.selectedForeach].
    
    It will be called on every selected child of the box.

    Params:
      box = a [gtk.flow_box.FlowBox]
      child = a [gtk.flow_box_child.FlowBoxChild]
*/
alias FlowBoxForeachFunc = void delegate(gtk.flow_box.FlowBox box, gtk.flow_box_child.FlowBoxChild child);

/**
    A function to compare two children to determine which
    should come first.

    Params:
      child1 = the first child
      child2 = the second child
    Returns: < 0 if child1 should be before child2, 0 if
        they are equal, and > 0 otherwise
*/
alias FlowBoxSortFunc = int delegate(gtk.flow_box_child.FlowBoxChild child1, gtk.flow_box_child.FlowBoxChild child2);

/**
    The type of function that is used for deciding what fonts get
    shown in a [gtk.font_chooser.FontChooser].
    
    See [gtk.font_chooser.FontChooser.setFilterFunc].

    Params:
      family = a [pango.font_family.FontFamily]
      face = a [pango.font_face.FontFace] belonging to family
    Returns: true if the font should be displayed
*/
alias FontFilterFunc = bool delegate(pango.font_family.FontFamily family, pango.font_face.FontFace face);

/**
    A function used by [gtk.icon_view.IconView.selectedForeach] to map all
    selected rows.
    
    It will be called on every selected row in the view.

    Params:
      iconView = a [gtk.icon_view.IconView]
      path = The [gtk.tree_path.TreePath] of a selected row
*/
alias IconViewForeachFunc = void delegate(gtk.icon_view.IconView iconView, gtk.tree_path.TreePath path);

/**
    Called for list boxes that are bound to a [gio.list_model.ListModel] with
    [gtk.list_box.ListBox.bindModel] for each item that gets added to the model.
    
    If the widget returned is not a #GtkListBoxRow widget, then the widget
    will be inserted as the child of an intermediate #GtkListBoxRow.

    Params:
      item = the item from the model for which to create a widget for
    Returns: a [gtk.widget.Widget] that represents item
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
      box = a [gtk.list_box.ListBox]
      row = a [gtk.list_box_row.ListBoxRow]
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
    is called, which lets you update the header on row.
    
    You may remove or set a new one via [gtk.list_box_row.ListBoxRow.setHeader]
    or just change the state of the current header widget.

    Params:
      row = the row to update
      before = the row before row, or null if it is first
*/
alias ListBoxUpdateHeaderFunc = void delegate(gtk.list_box_row.ListBoxRow row, gtk.list_box_row.ListBoxRow before);

/**
    User function that is called to map an item of the original model to
    an item expected by the map model.
    
    The returned items must conform to the item type of the model they are
    used with.

    Params:
      item = The item to map
    Returns: The item to map to
*/
alias MapListModelMapFunc = gobject.object.ObjectWrap delegate(gobject.object.ObjectWrap item);

/**
    User-provided callback function to create a popup for a
    [gtk.menu_button.MenuButton] on demand.
    
    This function is called when the popup of menu_button is shown,
    but none has been provided via [gtk.menu_button.MenuButton.setPopover]
    or [gtk.menu_button.MenuButton.setMenuModel].

    Params:
      menuButton = the [gtk.menu_button.MenuButton]
*/
alias MenuButtonCreatePopupFunc = void delegate(gtk.menu_button.MenuButton menuButton);

/**
    The type of function that is passed to
    [gtk.global.printRunPageSetupDialogAsync].
    
    This function will be called when the page setup dialog
    is dismissed, and also serves as destroy notify for data.

    Params:
      pageSetup = the [gtk.page_setup.PageSetup] that has been passed to
          [gtk.global.printRunPageSetupDialogAsync]
*/
alias PageSetupDoneFunc = void delegate(gtk.page_setup.PageSetup pageSetup);

/**
    The type of callback that is passed to [gtk.print_job.PrintJob.send].
    
    It is called when the print job has been completely sent.

    Params:
      printJob = the [gtk.print_job.PrintJob]
      error = a [glib.error.ErrorWrap] that contains error information if the sending
          of the print job failed, otherwise null
*/
alias PrintJobCompleteFunc = void delegate(gtk.print_job.PrintJob printJob, glib.error.ErrorWrap error);

/** */
alias PrintSettingsFunc = void delegate(string key, string value);

/**
    The type of function passed to [gtk.global.enumeratePrinters].
    
    Note that you need to ref printer, if you want to keep
    a reference to it after the function has returned.

    Params:
      printer = a [gtk.printer.Printer]
    Returns: true to stop the enumeration, false to continue
*/
alias PrinterFunc = bool delegate(gtk.printer.Printer printer);

/** */
alias ScaleFormatValueFunc = string delegate(gtk.scale.Scale scale, double value);

/**
    Prototype for shortcuts based on user callbacks.

    Params:
      widget = The widget passed to the activation
      args = The arguments passed to the activation
    Returns: true if the action was successful.
*/
alias ShortcutFunc = bool delegate(gtk.widget.Widget widget, glib.variant.Variant args);

/**
    The predicate function used by [gtk.text_iter.TextIter.forwardFindChar] and
    [gtk.text_iter.TextIter.backwardFindChar].

    Params:
      ch = a Unicode code point
    Returns: true if the predicate is satisfied, and the iteration should
        stop, and false otherwise
*/
alias TextCharPredicate = bool delegate(dchar ch);

/**
    A function used with [gtk.text_tag_table.TextTagTable.foreach_],
    to iterate over every [gtk.text_tag.TextTag] inside a [gtk.text_tag_table.TextTagTable].

    Params:
      tag = the [gtk.text_tag.TextTag]
*/
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
    A function to set the properties of a cell instead of just using the
    straight mapping between the cell and the model.
    
    This function is useful for customizing the cell renderer. For example,
    a function might get an* integer from the tree_model, and render it to
    the “text” attribute of “cell” by converting it to its written equivalent.
    
    See also: [gtk.tree_view_column.TreeViewColumn.setCellDataFunc]

    Params:
      treeColumn = A [gtk.tree_view_column.TreeViewColumn]
      cell = The [gtk.cell_renderer.CellRenderer] that is being rendered by tree_column
      treeModel = The [gtk.tree_model.TreeModel] being rendered
      iter = A [gtk.tree_iter.TreeIter] of the current row rendered
*/
alias TreeCellDataFunc = void delegate(gtk.tree_view_column.TreeViewColumn treeColumn, gtk.cell_renderer.CellRenderer cell, gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter);

/**
    A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
    integer if `a` sorts before `b`, `a` sorts with `b`, or `a` sorts after `b`
    respectively.
    
    If two iters compare as equal, their order in the sorted model
    is undefined. In order to ensure that the [gtk.tree_sortable.TreeSortable] behaves as
    expected, the GtkTreeIterCompareFunc must define a partial order on
    the model, i.e. it must be reflexive, antisymmetric and transitive.
    
    For example, if model is a product catalogue, then a compare function
    for the “price” column could be one which returns
    `price_of(`a`) - price_of(`b`)`.

    Params:
      model = The [gtk.tree_model.TreeModel] the comparison is within
      a = A [gtk.tree_iter.TreeIter] in model
      b = Another [gtk.tree_iter.TreeIter] in model
    Returns: a negative integer, zero or a positive integer depending on whether
        `a` sorts before, with or after `b`
*/
alias TreeIterCompareFunc = int delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter a, gtk.tree_iter.TreeIter b);

/**
    Prototype of the function called to create new child models when
    [gtk.tree_list_row.TreeListRow.setExpanded] is called.
    
    This function can return null to indicate that item is guaranteed to be
    a leaf node and will never have children. If it does not have children but
    may get children later, it should return an empty model that is filled once
    children arrive.

    Params:
      item = The item that is being expanded
    Returns: The model tracking the children of
        item or null if item can never have children
*/
alias TreeListModelCreateModelFunc = gio.list_model.ListModel delegate(gobject.object.ObjectWrap item);

/**
    A function which calculates display values from raw values in the model.
    It must fill value with the display value for the column column in the
    row indicated by iter.
    
    Since this function is called for each data access, it’s not a
    particularly efficient operation.

    Params:
      model = the [gtk.tree_model_filter.TreeModelFilter]
      iter = a [gtk.tree_iter.TreeIter] pointing to the row whose display values are determined
      value = A [gobject.value.Value] which is already initialized for
         with the correct type for the column column.
      column = the column whose display value is determined
*/
alias TreeModelFilterModifyFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter, out gobject.value.Value value, int column);

/**
    A function which decides whether the row indicated by iter is visible.

    Params:
      model = the child model of the [gtk.tree_model_filter.TreeModelFilter]
      iter = a [gtk.tree_iter.TreeIter] pointing to the row in model whose visibility
          is determined
    Returns: Whether the row indicated by iter is visible.
*/
alias TreeModelFilterVisibleFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    Type of the callback passed to [gtk.tree_model.TreeModel.foreach_] to
    iterate over the rows in a tree model.

    Params:
      model = the [gtk.tree_model.TreeModel] being iterated
      path = the current [gtk.tree_path.TreePath]
      iter = the current [gtk.tree_iter.TreeIter]
    Returns: true to stop iterating, false to continue
*/
alias TreeModelForeachFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.selectedForeach] to map all
    selected rows.  It will be called on every selected row in the view.

    Params:
      model = The [gtk.tree_model.TreeModel] being viewed
      path = The [gtk.tree_path.TreePath] of a selected row
      iter = A [gtk.tree_iter.TreeIter] pointing to a selected row
*/
alias TreeSelectionForeachFunc = void delegate(gtk.tree_model.TreeModel model, gtk.tree_path.TreePath path, gtk.tree_iter.TreeIter iter);

/**
    A function used by [gtk.tree_selection.TreeSelection.setSelectFunction] to filter
    whether or not a row may be selected. It is called whenever a row's
    state might change.
    
    A return value of true indicates to selection that it is okay to
    change the selection.

    Params:
      selection = A [gtk.tree_selection.TreeSelection]
      model = A [gtk.tree_model.TreeModel] being viewed
      path = The [gtk.tree_path.TreePath] of the row in question
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
      treeView = A [gtk.tree_view.TreeView]
      column = The [gtk.tree_view_column.TreeViewColumn] being dragged
      prevColumn = A [gtk.tree_view_column.TreeViewColumn] on one side of column
      nextColumn = A [gtk.tree_view_column.TreeViewColumn] on the other side of column
    Returns: true, if column can be dropped in this spot
*/
alias TreeViewColumnDropFunc = bool delegate(gtk.tree_view.TreeView treeView, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn prevColumn, gtk.tree_view_column.TreeViewColumn nextColumn);

/**
    Function used for [gtk.tree_view.TreeView.mapExpandedRows].

    Params:
      treeView = A [gtk.tree_view.TreeView]
      path = The path that’s expanded
*/
alias TreeViewMappingFunc = void delegate(gtk.tree_view.TreeView treeView, gtk.tree_path.TreePath path);

/**
    Function type for determining whether the row pointed to by iter should
    be rendered as a separator. A common way to implement this is to have a
    boolean column in the model, whose values the [gtk.types.TreeViewRowSeparatorFunc]
    returns.

    Params:
      model = the [gtk.tree_model.TreeModel]
      iter = a [gtk.tree_iter.TreeIter] pointing at a row in model
    Returns: true if the row is a separator
*/
alias TreeViewRowSeparatorFunc = bool delegate(gtk.tree_model.TreeModel model, gtk.tree_iter.TreeIter iter);

/**
    A function used for checking whether a row in model matches
    a search key string entered by the user. Note the return value
    is reversed from what you would normally expect, though it
    has some similarity to strcmp() returning 0 for equal strings.

    Params:
      model = the [gtk.tree_model.TreeModel] being searched
      column = the search column set by [gtk.tree_view.TreeView.setSearchColumn]
      key = the key string to compare with
      iter = a [gtk.tree_iter.TreeIter] pointing the row of model that should be compared
         with key.
    Returns: false if the row matches, true otherwise.
*/
alias TreeViewSearchEqualFunc = bool delegate(gtk.tree_model.TreeModel model, int column, string key, gtk.tree_iter.TreeIter iter);

/**
    The type of the callback functions used for activating
    actions installed with [gtk.widget_class.WidgetClass.installAction].
    
    The parameter must match the parameter_type of the action.

    Params:
      widget = the widget to which the action belongs
      actionName = the action name
      parameter = parameter for activation
*/
alias WidgetActionActivateFunc = void delegate(gtk.widget.Widget widget, string actionName, glib.variant.Variant parameter);

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
    
    $(LIST
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE]
    )
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE = "overline";

/**
    The "none" overline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE = "none";

/**
    The "single" overline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_OVERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_OVERLINE_SINGLE = "single";

/**
    An attribute for the font size, expressed in points.
*/
enum ACCESSIBLE_ATTRIBUTE_SIZE = "size";

/**
    An attribute for the font stretch type.
    
    Possible values are:
    
    $(LIST
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED]
    )
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH = "stretch";

/**
    The "condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_CONDENSED = "condensed";

/**
    The "expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXPANDED = "expanded";

/**
    The "extra condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_CONDENSED = "extra_condensed";

/**
    The "extra expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_EXTRA_EXPANDED = "extra_expanded";

/**
    The "normal" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_NORMAL = "normal";

/**
    The "semi condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_CONDENSED = "semi_condensed";

/**
    The "semi expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_SEMI_EXPANDED = "semi_expanded";

/**
    The "ultra condensed" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
*/
enum ACCESSIBLE_ATTRIBUTE_STRETCH_ULTRA_CONDENSED = "ultra_condensed";

/**
    The "ultra expanded" stretch value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STRETCH].
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
    
    $(LIST
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC]
    )
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE = "style";

/**
    The "italic" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_ITALIC = "italic";

/**
    The "normal" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_NORMAL = "normal";

/**
    The "oblique" style value for [gtk.types.ACCESSIBLE_ATTRIBUTE_STYLE].
*/
enum ACCESSIBLE_ATTRIBUTE_STYLE_OBLIQUE = "oblique";

/**
    An attribute for the underline style.
    
    Possible values are:
    
    $(LIST
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR]
    )
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE = "underline";

/**
    The "double" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_DOUBLE = "double";

/**
    The "error" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_ERROR = "error";

/**
    The "none" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_NONE = "none";

/**
    The "single" underline value for [gtk.types.ACCESSIBLE_ATTRIBUTE_UNDERLINE].
*/
enum ACCESSIBLE_ATTRIBUTE_UNDERLINE_SINGLE = "single";

/**
    An attribute for the font variant.
    
    Possible values are:
    
    $(LIST
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_UNICASE]
      * [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS]
    )
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT = "variant";

/**
    The "all petite caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_PETITE_CAPS = "all-petite-caps";

/**
    The "all small caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_ALL_SMALL_CAPS = "all-small-caps";

/**
    The "petite caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_PETITE_CAPS = "petite-caps";

/**
    The "small caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_SMALL_CAPS = "small-caps";

/**
    The "title caps" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
*/
enum ACCESSIBLE_ATTRIBUTE_VARIANT_TITLE_CAPS = "title-caps";

/**
    The "unicase" variant value for [gtk.types.ACCESSIBLE_ATTRIBUTE_VARIANT].
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
enum BINARY_AGE = 1402;

/** */
enum IM_MODULE_EXTENSION_POINT_NAME = "gtk-im-module";

/**
    Constant to return from a signal handler for the ::input
    signal in case of conversion failure.
    
    See [gtk.spin_button.SpinButton.input].
*/
enum INPUT_ERROR = -1;

/**
    Like `func@get_interface_age`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum INTERFACE_AGE = 2;

/**
    The value used to refer to a guaranteed invalid position
    in a [gio.list_model.ListModel].
    
    This value may be returned from some functions, others may
    accept it as input. Its interpretation may differ for different
    functions.
    
    Refer to each function's documentation for if this value is
    allowed and what it does.
*/
enum INVALID_LIST_POSITION = 4294967295;

/**
    The name used for the stock full offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_FULL = "full";

/**
    The name used for the stock high offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_HIGH = "high";

/**
    The name used for the stock low offset included by [gtk.level_bar.LevelBar].
*/
enum LEVEL_BAR_OFFSET_LOW = "low";

/**
    Like `func@get_major_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 4;

/** */
enum MAX_COMPOSE_LEN = 7;

/** */
enum MEDIA_FILE_EXTENSION_POINT_NAME = "gtk-media-file";

/**
    Like `func@get_micro_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 2;

/**
    Like `func@get_minor_version`, but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 14;

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
    to which the output should be written. GTK itself supports
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
    A priority that can be used when adding a [gtk.style_provider.StyleProvider]
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
    via [gtk.settings.Settings].
    
    This priority is higher than [gtk.types.STYLE_PROVIDER_PRIORITY_THEME]
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
    The priority at which the text view validates onscreen lines
    in an idle job in the background.
*/
enum TEXT_VIEW_PRIORITY_VALIDATE = 125;

/**
    Uses the default sort function in a [gtk.tree_sortable.TreeSortable].
    
    See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1;

/**
    Disables sorting in a [gtk.tree_sortable.TreeSortable].
    
    See also: [gtk.tree_sortable.TreeSortable.setSortColumnId]
*/
enum TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2;
