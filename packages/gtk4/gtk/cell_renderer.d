module gtk.cell_renderer;

import gdk.event;
import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.requisition;
import gtk.snapshot;
import gtk.types;
import gtk.widget;

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
  just prior to use using [gobject.object.ObjectG]s property system.  Then, the
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

  Deprecated:     List views use widgets for displaying their
      contents
*/
class CellRenderer : gobject.initially_unowned.InitiallyUnowned
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_get_type != &gidSymbolNotFound ? gtk_cell_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Passes an activate event to the cell renderer for possible processing.
    Some cell renderers may use events; for example, [gtk.cell_renderer_toggle.CellRendererToggle]
    toggles when it gets a mouse click.
    Params:
      event =       a [gdk.event.Event]
      widget =       widget that received the event
      path =       widget-dependent string representation of the event location;
           e.g. for [gtk.tree_view.TreeView], a string representation of [gtk.tree_path.TreePath]
      backgroundArea =       background area as passed to [gtk.cell_renderer.CellRenderer.render]
      cellArea =       cell area as passed to [gtk.cell_renderer.CellRenderer.render]
      flags =       render flags
    Returns:     true if the event was consumed/handled
  */
  bool activate(gdk.event.Event event, gtk.widget.Widget widget, string path, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = gtk_cell_renderer_activate(cast(GtkCellRenderer*)cPtr, event ? cast(GdkEvent*)event.cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, _path, backgroundArea ? cast(const(GdkRectangle)*)backgroundArea.cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea.cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Gets the aligned area used by cell inside cell_area. Used for finding
    the appropriate edit and focus rectangle.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      flags =       render flags
      cellArea =       cell area which would be passed to [gtk.cell_renderer.CellRenderer.render]
      alignedArea =       the return location for the space inside cell_area
                       that would actually be used to render.
  */
  void getAlignedArea(gtk.widget.Widget widget, gtk.types.CellRendererState flags, gdk.rectangle.Rectangle cellArea, out gdk.rectangle.Rectangle alignedArea)
  {
    GdkRectangle _alignedArea;
    gtk_cell_renderer_get_aligned_area(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, flags, cellArea ? cast(const(GdkRectangle)*)cellArea.cPtr(No.Dup) : null, &_alignedArea);
    alignedArea = new gdk.rectangle.Rectangle(cast(void*)&_alignedArea, No.Take);
  }

  /**
      Fills in xalign and yalign with the appropriate values of cell.
    Params:
      xalign =       location to fill in with the x alignment of the cell
      yalign =       location to fill in with the y alignment of the cell
  */
  void getAlignment(out float xalign, out float yalign)
  {
    gtk_cell_renderer_get_alignment(cast(GtkCellRenderer*)cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
      Fills in width and height with the appropriate size of cell.
    Params:
      width =       location to fill in with the fixed width of the cell
      height =       location to fill in with the fixed height of the cell
  */
  void getFixedSize(out int width, out int height)
  {
    gtk_cell_renderer_get_fixed_size(cast(GtkCellRenderer*)cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Checks whether the given [gtk.cell_renderer.CellRenderer] is expanded.
    Returns:     true if the cell renderer is expanded
  */
  bool getIsExpanded()
  {
    bool _retval;
    _retval = gtk_cell_renderer_get_is_expanded(cast(GtkCellRenderer*)cPtr);
    return _retval;
  }

  /**
      Checks whether the given [gtk.cell_renderer.CellRenderer] is an expander.
    Returns:     true if cell is an expander, and false otherwise
  */
  bool getIsExpander()
  {
    bool _retval;
    _retval = gtk_cell_renderer_get_is_expander(cast(GtkCellRenderer*)cPtr);
    return _retval;
  }

  /**
      Fills in xpad and ypad with the appropriate values of cell.
    Params:
      xpad =       location to fill in with the x padding of the cell
      ypad =       location to fill in with the y padding of the cell
  */
  void getPadding(out int xpad, out int ypad)
  {
    gtk_cell_renderer_get_padding(cast(GtkCellRenderer*)cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      minimumSize =       location to store the minimum size
      naturalSize =       location to store the natural size
  */
  void getPreferredHeight(gtk.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    gtk_cell_renderer_get_preferred_height(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural height if it were rendered to
    widget with the specified width.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      width =       the size which is available for allocation
      minimumHeight =       location for storing the minimum size
      naturalHeight =       location for storing the preferred size
  */
  void getPreferredHeightForWidth(gtk.widget.Widget widget, int width, out int minimumHeight, out int naturalHeight)
  {
    gtk_cell_renderer_get_preferred_height_for_width(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, width, cast(int*)&minimumHeight, cast(int*)&naturalHeight);
  }

  /**
      Retrieves the minimum and natural size of a cell taking
    into account the widget’s preference for height-for-width management.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      minimumSize =       location for storing the minimum size
      naturalSize =       location for storing the natural size
  */
  void getPreferredSize(gtk.widget.Widget widget, out gtk.requisition.Requisition minimumSize, out gtk.requisition.Requisition naturalSize)
  {
    GtkRequisition _minimumSize;
    GtkRequisition _naturalSize;
    gtk_cell_renderer_get_preferred_size(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, &_minimumSize, &_naturalSize);
    minimumSize = new gtk.requisition.Requisition(cast(void*)&_minimumSize, No.Take);
    naturalSize = new gtk.requisition.Requisition(cast(void*)&_naturalSize, No.Take);
  }

  /**
      Retrieves a renderer’s natural size when rendered to widget.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      minimumSize =       location to store the minimum size
      naturalSize =       location to store the natural size
  */
  void getPreferredWidth(gtk.widget.Widget widget, out int minimumSize, out int naturalSize)
  {
    gtk_cell_renderer_get_preferred_width(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, cast(int*)&minimumSize, cast(int*)&naturalSize);
  }

  /**
      Retrieves a cell renderers’s minimum and natural width if it were rendered to
    widget with the specified height.
    Params:
      widget =       the [gtk.widget.Widget] this cell will be rendering to
      height =       the size which is available for allocation
      minimumWidth =       location for storing the minimum size
      naturalWidth =       location for storing the preferred size
  */
  void getPreferredWidthForHeight(gtk.widget.Widget widget, int height, out int minimumWidth, out int naturalWidth)
  {
    gtk_cell_renderer_get_preferred_width_for_height(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, height, cast(int*)&minimumWidth, cast(int*)&naturalWidth);
  }

  /**
      Gets whether the cell renderer prefers a height-for-width layout
    or a width-for-height layout.
    Returns:     The [gtk.types.SizeRequestMode] preferred by this renderer.
  */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_cell_renderer_get_request_mode(cast(GtkCellRenderer*)cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Returns the cell renderer’s sensitivity.
    Returns:     true if the cell renderer is sensitive
  */
  bool getSensitive()
  {
    bool _retval;
    _retval = gtk_cell_renderer_get_sensitive(cast(GtkCellRenderer*)cPtr);
    return _retval;
  }

  /**
      Translates the cell renderer state to [gtk.types.StateFlags],
    based on the cell renderer and widget sensitivity, and
    the given [gtk.cell_renderer.CellRenderer]State.
    Params:
      widget =       a [gtk.widget.Widget]
      cellState =       cell renderer state
    Returns:     the widget state flags applying to cell
  */
  gtk.types.StateFlags getState(gtk.widget.Widget widget, gtk.types.CellRendererState cellState)
  {
    GtkStateFlags _cretval;
    _cretval = gtk_cell_renderer_get_state(cast(GtkCellRenderer*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, cellState);
    gtk.types.StateFlags _retval = cast(gtk.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns the cell renderer’s visibility.
    Returns:     true if the cell renderer is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_cell_renderer_get_visible(cast(GtkCellRenderer*)cPtr);
    return _retval;
  }

  /**
      Checks whether the cell renderer can do something when activated.
    Returns:     true if the cell renderer can do anything when activated
  */
  bool isActivatable()
  {
    bool _retval;
    _retval = gtk_cell_renderer_is_activatable(cast(GtkCellRenderer*)cPtr);
    return _retval;
  }

  /**
      Sets the renderer’s alignment within its available space.
    Params:
      xalign =       the x alignment of the cell renderer
      yalign =       the y alignment of the cell renderer
  */
  void setAlignment(float xalign, float yalign)
  {
    gtk_cell_renderer_set_alignment(cast(GtkCellRenderer*)cPtr, xalign, yalign);
  }

  /**
      Sets the renderer size to be explicit, independent of the properties set.
    Params:
      width =       the width of the cell renderer, or -1
      height =       the height of the cell renderer, or -1
  */
  void setFixedSize(int width, int height)
  {
    gtk_cell_renderer_set_fixed_size(cast(GtkCellRenderer*)cPtr, width, height);
  }

  /**
      Sets whether the given [gtk.cell_renderer.CellRenderer] is expanded.
    Params:
      isExpanded =       whether cell should be expanded
  */
  void setIsExpanded(bool isExpanded)
  {
    gtk_cell_renderer_set_is_expanded(cast(GtkCellRenderer*)cPtr, isExpanded);
  }

  /**
      Sets whether the given [gtk.cell_renderer.CellRenderer] is an expander.
    Params:
      isExpander =       whether cell is an expander
  */
  void setIsExpander(bool isExpander)
  {
    gtk_cell_renderer_set_is_expander(cast(GtkCellRenderer*)cPtr, isExpander);
  }

  /**
      Sets the renderer’s padding.
    Params:
      xpad =       the x padding of the cell renderer
      ypad =       the y padding of the cell renderer
  */
  void setPadding(int xpad, int ypad)
  {
    gtk_cell_renderer_set_padding(cast(GtkCellRenderer*)cPtr, xpad, ypad);
  }

  /**
      Sets the cell renderer’s sensitivity.
    Params:
      sensitive =       the sensitivity of the cell
  */
  void setSensitive(bool sensitive)
  {
    gtk_cell_renderer_set_sensitive(cast(GtkCellRenderer*)cPtr, sensitive);
  }

  /**
      Sets the cell renderer’s visibility.
    Params:
      visible =       the visibility of the cell
  */
  void setVisible(bool visible)
  {
    gtk_cell_renderer_set_visible(cast(GtkCellRenderer*)cPtr, visible);
  }

  /**
      Invokes the virtual render function of the [gtk.cell_renderer.CellRenderer]. The three
    passed-in rectangles are areas in cr. Most renderers will draw within
    cell_area; the xalign, yalign, xpad, and ypad fields of the [gtk.cell_renderer.CellRenderer]
    should be honored with respect to cell_area. background_area includes the
    blank space around the cell, and also the area containing the tree expander;
    so the background_area rectangles for all cells tile to cover the entire
    window.
    Params:
      snapshot =       a [gtk.snapshot.Snapshot] to draw to
      widget =       the widget owning window
      backgroundArea =       entire cell area (including tree expanders and maybe
           padding on the sides)
      cellArea =       area normally rendered by a cell renderer
      flags =       flags that affect rendering
  */
  void snapshot(gtk.snapshot.Snapshot snapshot, gtk.widget.Widget widget, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags)
  {
    gtk_cell_renderer_snapshot(cast(GtkCellRenderer*)cPtr, snapshot ? cast(GtkSnapshot*)snapshot.cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, backgroundArea ? cast(const(GdkRectangle)*)backgroundArea.cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea.cPtr(No.Dup) : null, flags);
  }

  /**
      Starts editing the contents of this cell, through a new [gtk.cell_editable.CellEditable]
    widget created by the [gtk.cell_renderer.CellRenderer]Class.start_editing virtual function.
    Params:
      event =       a [gdk.event.Event]
      widget =       widget that received the event
      path =       widget-dependent string representation of the event location;
           e.g. for [gtk.tree_view.TreeView], a string representation of [gtk.tree_path.TreePath]
      backgroundArea =       background area as passed to [gtk.cell_renderer.CellRenderer.render]
      cellArea =       cell area as passed to [gtk.cell_renderer.CellRenderer.render]
      flags =       render flags
    Returns:     A new [gtk.cell_editable.CellEditable] for editing this
        cell, or null if editing is not possible
  */
  gtk.cell_editable.CellEditable startEditing(gdk.event.Event event, gtk.widget.Widget widget, string path, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.types.CellRendererState flags)
  {
    GtkCellEditable* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gtk_cell_renderer_start_editing(cast(GtkCellRenderer*)cPtr, event ? cast(GdkEvent*)event.cPtr(No.Dup) : null, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, _path, backgroundArea ? cast(const(GdkRectangle)*)backgroundArea.cPtr(No.Dup) : null, cellArea ? cast(const(GdkRectangle)*)cellArea.cPtr(No.Dup) : null, flags);
    auto _retval = ObjectG.getDObject!(gtk.cell_editable.CellEditable)(cast(GtkCellEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Informs the cell renderer that the editing is stopped.
    If canceled is true, the cell renderer will emit the
    [gtk.cell_renderer.CellRenderer]::editing-canceled signal.
    
    This function should be called by cell renderer implementations
    in response to the `GtkCellEditable::editing-done` signal of
    [gtk.cell_editable.CellEditable].
    Params:
      canceled =       true if the editing has been canceled
  */
  void stopEditing(bool canceled)
  {
    gtk_cell_renderer_stop_editing(cast(GtkCellRenderer*)cPtr, canceled);
  }

  /**
      This signal gets emitted when the user cancels the process of editing a
    cell.  For example, an editable cell renderer could be written to cancel
    editing when the user presses Escape.
    
    See also: [gtk.cell_renderer.CellRenderer.stopEditing].
  
    ## Parameters
    $(LIST
      * $(B cellRenderer) the instance the signal is connected to
    )
  */
  alias EditingCanceledCallbackDlg = void delegate(gtk.cell_renderer.CellRenderer cellRenderer);

  /** ditto */
  alias EditingCanceledCallbackFunc = void function(gtk.cell_renderer.CellRenderer cellRenderer);

  /**
    Connect to EditingCanceled signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEditingCanceled(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EditingCanceledCallbackDlg) || is(T : EditingCanceledCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRenderer = getVal!(gtk.cell_renderer.CellRenderer)(_paramVals);
      _dClosure.dlg(cellRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-canceled", closure, after);
  }

  /**
      This signal gets emitted when a cell starts to be edited.
    The intended use of this signal is to do special setup
    on editable, e.g. adding a [gtk.entry_completion.EntryCompletion] or setting
    up additional columns in a [gtk.combo_box.ComboBox].
    
    See [gtk.cell_editable.CellEditable.startEditing] for information on the lifecycle of
    the editable and a way to do setup that doesn’t depend on the renderer.
    
    Note that GTK doesn't guarantee that cell renderers will
    continue to use the same kind of widget for editing in future
    releases, therefore you should check the type of editable
    before doing any specific setup, as in the following example:
    ```c
    static void
    text_editing_started (GtkCellRenderer *cell,
                          GtkCellEditable *editable,
                          const char      *path,
                          gpointer         data)
    {
      if (GTK_IS_ENTRY (editable))
        {
          GtkEntry *entry = GTK_ENTRY (editable);
    
          // ... create a GtkEntryCompletion
    
          gtk_entry_set_completion (entry, completion);
        }
    }
    ```
  
    ## Parameters
    $(LIST
      * $(B editable)       the [gtk.cell_editable.CellEditable]
      * $(B path)       the path identifying the edited cell
      * $(B cellRenderer) the instance the signal is connected to
    )
  */
  alias EditingStartedCallbackDlg = void delegate(gtk.cell_editable.CellEditable editable, string path, gtk.cell_renderer.CellRenderer cellRenderer);

  /** ditto */
  alias EditingStartedCallbackFunc = void function(gtk.cell_editable.CellEditable editable, string path, gtk.cell_renderer.CellRenderer cellRenderer);

  /**
    Connect to EditingStarted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEditingStarted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EditingStartedCallbackDlg) || is(T : EditingStartedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRenderer = getVal!(gtk.cell_renderer.CellRenderer)(_paramVals);
      auto editable = getVal!(gtk.cell_editable.CellEditable)(&_paramVals[1]);
      auto path = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(editable, path, cellRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("editing-started", closure, after);
  }
}
