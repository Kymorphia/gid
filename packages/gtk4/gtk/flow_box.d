/// Module for [FlowBox] class
module gtk.flow_box;

import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.flow_box_child;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

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
class FlowBox : gtk.widget.Widget, gtk.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_flow_box_get_type != &gidSymbolNotFound ? gtk_flow_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBox self()
  {
    return this;
  }

  /** */
  @property bool acceptUnpairedRelease()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("accept-unpaired-release");
  }

  /** */
  @property void acceptUnpairedRelease(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("accept-unpaired-release", propval);
  }

  /**
      Get `activateOnSingleClick` property.
      Returns: Determines whether children can be activated with a single
        click, or require a double-click.
  */
  @property bool activateOnSingleClick()
  {
    return getActivateOnSingleClick();
  }

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = Determines whether children can be activated with a single
          click, or require a double-click.
  */
  @property void activateOnSingleClick(bool propval)
  {
    return setActivateOnSingleClick(propval);
  }

  /**
      Get `columnSpacing` property.
      Returns: The amount of horizontal space between two children.
  */
  @property uint columnSpacing()
  {
    return getColumnSpacing();
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The amount of horizontal space between two children.
  */
  @property void columnSpacing(uint propval)
  {
    return setColumnSpacing(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Determines whether all children should be allocated the
        same size.
  */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Determines whether all children should be allocated the
          same size.
  */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /**
      Get `maxChildrenPerLine` property.
      Returns: The maximum amount of children to request space for consecutively
        in the given orientation.
  */
  @property uint maxChildrenPerLine()
  {
    return getMaxChildrenPerLine();
  }

  /**
      Set `maxChildrenPerLine` property.
      Params:
        propval = The maximum amount of children to request space for consecutively
          in the given orientation.
  */
  @property void maxChildrenPerLine(uint propval)
  {
    return setMaxChildrenPerLine(propval);
  }

  /**
      Get `minChildrenPerLine` property.
      Returns: The minimum number of children to allocate consecutively
        in the given orientation.
        
        Setting the minimum children per line ensures
        that a reasonably small height will be requested
        for the overall minimum width of the box.
  */
  @property uint minChildrenPerLine()
  {
    return getMinChildrenPerLine();
  }

  /**
      Set `minChildrenPerLine` property.
      Params:
        propval = The minimum number of children to allocate consecutively
          in the given orientation.
          
          Setting the minimum children per line ensures
          that a reasonably small height will be requested
          for the overall minimum width of the box.
  */
  @property void minChildrenPerLine(uint propval)
  {
    return setMinChildrenPerLine(propval);
  }

  /**
      Get `rowSpacing` property.
      Returns: The amount of vertical space between two children.
  */
  @property uint rowSpacing()
  {
    return getRowSpacing();
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The amount of vertical space between two children.
  */
  @property void rowSpacing(uint propval)
  {
    return setRowSpacing(propval);
  }

  /**
      Get `selectionMode` property.
      Returns: The selection mode used by the flow box.
  */
  @property gtk.types.SelectionMode selectionMode()
  {
    return getSelectionMode();
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The selection mode used by the flow box.
  */
  @property void selectionMode(gtk.types.SelectionMode propval)
  {
    return setSelectionMode(propval);
  }

  mixin OrientableT!();

  /**
      Creates a [gtk.flow_box.FlowBox].
      Returns: a new [gtk.flow_box.FlowBox]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_new();
    this(_cretval, No.Take);
  }

  /**
      Adds child to the end of self.
      
      If a sort function is set, the widget will
      actually be inserted at the calculated position.
      
      See also: [gtk.flow_box.FlowBox.insert].
  
      Params:
        child = the [gtk.widget.Widget] to add
  */
  void append(gtk.widget.Widget child)
  {
    gtk_flow_box_append(cast(GtkFlowBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Binds model to box.
      
      If box was already bound to a model, that previous binding is
      destroyed.
      
      The contents of box are cleared and then filled with widgets that
      represent items from model. box is updated whenever model changes.
      If model is null, box is left empty.
      
      It is undefined to add or remove widgets directly (for example, with
      [gtk.flow_box.FlowBox.insert]) while box is bound to a model.
      
      Note that using a model is incompatible with the filtering and sorting
      functionality in [gtk.flow_box.FlowBox]. When using a model, filtering and sorting
      should be implemented by the model.
  
      Params:
        model = the [gio.list_model.ListModel] to be bound to box
        createWidgetFunc = a function that creates widgets for items
  */
  void bindModel(gio.list_model.ListModel model, gtk.types.FlowBoxCreateWidgetFunc createWidgetFunc)
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(GObject* item, void* userData)
    {
      gtk.widget.Widget _dretval;
      auto _dlg = cast(gtk.types.FlowBoxCreateWidgetFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, No.Take));
      auto _retval = cast(GtkWidget*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _createWidgetFuncCB = createWidgetFunc ? &_createWidgetFuncCallback : null;
    auto _createWidgetFunc = createWidgetFunc ? freezeDelegate(cast(void*)&createWidgetFunc) : null;
    GDestroyNotify _createWidgetFuncDestroyCB = createWidgetFunc ? &thawDelegate : null;
    gtk_flow_box_bind_model(cast(GtkFlowBox*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, _createWidgetFuncCB, _createWidgetFunc, _createWidgetFuncDestroyCB);
  }

  /**
      Returns whether children activate on single clicks.
      Returns: true if children are activated on single click,
          false otherwise
  */
  bool getActivateOnSingleClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_flow_box_get_activate_on_single_click(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the nth child in the box.
  
      Params:
        idx = the position of the child
      Returns: the child widget, which will
          always be a [gtk.flow_box_child.FlowBoxChild] or null in case no child widget
          with the given index exists.
  */
  gtk.flow_box_child.FlowBoxChild getChildAtIndex(int idx)
  {
    GtkFlowBoxChild* _cretval;
    _cretval = gtk_flow_box_get_child_at_index(cast(GtkFlowBox*)this._cPtr, idx);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(GtkFlowBoxChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child in the (`x`, `y`) position.
      
      Both `x` and `y` are assumed to be relative to the origin of box.
  
      Params:
        x = the x coordinate of the child
        y = the y coordinate of the child
      Returns: the child widget, which will
          always be a [gtk.flow_box_child.FlowBoxChild] or null in case no child widget
          exists for the given x and y coordinates.
  */
  gtk.flow_box_child.FlowBoxChild getChildAtPos(int x, int y)
  {
    GtkFlowBoxChild* _cretval;
    _cretval = gtk_flow_box_get_child_at_pos(cast(GtkFlowBox*)this._cPtr, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(GtkFlowBoxChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal spacing.
      Returns: the horizontal spacing
  */
  uint getColumnSpacing()
  {
    uint _retval;
    _retval = gtk_flow_box_get_column_spacing(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the box is homogeneous.
      Returns: true if the box is homogeneous.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_flow_box_get_homogeneous(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum number of children per line.
      Returns: the maximum number of children per line
  */
  uint getMaxChildrenPerLine()
  {
    uint _retval;
    _retval = gtk_flow_box_get_max_children_per_line(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum number of children per line.
      Returns: the minimum number of children per line
  */
  uint getMinChildrenPerLine()
  {
    uint _retval;
    _retval = gtk_flow_box_get_min_children_per_line(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the vertical spacing.
      Returns: the vertical spacing
  */
  uint getRowSpacing()
  {
    uint _retval;
    _retval = gtk_flow_box_get_row_spacing(cast(GtkFlowBox*)this._cPtr);
    return _retval;
  }

  /**
      Creates a list of all selected children.
      Returns: A [glib.list.List] containing the [gtk.widget.Widget] for each selected child.
          Free with [glib.list.List.free] when done.
  */
  gtk.flow_box_child.FlowBoxChild[] getSelectedChildren()
  {
    GList* _cretval;
    _cretval = gtk_flow_box_get_selected_children(cast(GtkFlowBox*)this._cPtr);
    auto _retval = gListToD!(gtk.flow_box_child.FlowBoxChild, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of box.
      Returns: the [gtk.types.SelectionMode]
  */
  gtk.types.SelectionMode getSelectionMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_flow_box_get_selection_mode(cast(GtkFlowBox*)this._cPtr);
    gtk.types.SelectionMode _retval = cast(gtk.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Inserts the widget into box at position.
      
      If a sort function is set, the widget will actually be inserted
      at the calculated position.
      
      If position is -1, or larger than the total number of children
      in the box, then the widget will be appended to the end.
  
      Params:
        widget = the [gtk.widget.Widget] to add
        position = the position to insert child in
  */
  void insert(gtk.widget.Widget widget, int position)
  {
    gtk_flow_box_insert(cast(GtkFlowBox*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, position);
  }

  /**
      Updates the filtering for all children.
      
      Call this function when the result of the filter
      function on the box is changed due to an external
      factor. For instance, this would be used if the
      filter function just looked for a specific search
      term, and the entry with the string has changed.
  */
  void invalidateFilter()
  {
    gtk_flow_box_invalidate_filter(cast(GtkFlowBox*)this._cPtr);
  }

  /**
      Updates the sorting for all children.
      
      Call this when the result of the sort function on
      box is changed due to an external factor.
  */
  void invalidateSort()
  {
    gtk_flow_box_invalidate_sort(cast(GtkFlowBox*)this._cPtr);
  }

  /**
      Adds child to the start of self.
      
      If a sort function is set, the widget will
      actually be inserted at the calculated position.
      
      See also: [gtk.flow_box.FlowBox.insert].
  
      Params:
        child = the [gtk.widget.Widget] to add
  */
  void prepend(gtk.widget.Widget child)
  {
    gtk_flow_box_prepend(cast(GtkFlowBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from box.
  
      Params:
        widget = the child widget to remove
  */
  void remove(gtk.widget.Widget widget)
  {
    gtk_flow_box_remove(cast(GtkFlowBox*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Removes all children from box.
      
      This function does nothing if box is backed by a model.
  */
  void removeAll()
  {
    gtk_flow_box_remove_all(cast(GtkFlowBox*)this._cPtr);
  }

  /**
      Select all children of box, if the selection
      mode allows it.
  */
  void selectAll()
  {
    gtk_flow_box_select_all(cast(GtkFlowBox*)this._cPtr);
  }

  /**
      Selects a single child of box, if the selection
      mode allows it.
  
      Params:
        child = a child of box
  */
  void selectChild(gtk.flow_box_child.FlowBoxChild child)
  {
    gtk_flow_box_select_child(cast(GtkFlowBox*)this._cPtr, child ? cast(GtkFlowBoxChild*)child._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected child.
      
      Note that the selection cannot be modified from within
      this function.
  
      Params:
        func = the function to call for each selected child
  */
  void selectedForeach(gtk.types.FlowBoxForeachFunc func)
  {
    extern(C) void _funcCallback(GtkFlowBox* box, GtkFlowBoxChild* child, void* userData)
    {
      auto _dlg = cast(gtk.types.FlowBoxForeachFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.flow_box.FlowBox)(cast(void*)box, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_flow_box_selected_foreach(cast(GtkFlowBox*)this._cPtr, _funcCB, _func);
  }

  /**
      If single is true, children will be activated when you click
      on them, otherwise you need to double-click.
  
      Params:
        single = true to emit child-activated on a single click
  */
  void setActivateOnSingleClick(bool single)
  {
    gtk_flow_box_set_activate_on_single_click(cast(GtkFlowBox*)this._cPtr, single);
  }

  /**
      Sets the horizontal space to add between children.
  
      Params:
        spacing = the spacing to use
  */
  void setColumnSpacing(uint spacing)
  {
    gtk_flow_box_set_column_spacing(cast(GtkFlowBox*)this._cPtr, spacing);
  }

  /**
      By setting a filter function on the box one can decide dynamically
      which of the children to show.
      
      For instance, to implement a search function that only shows the
      children matching the search terms.
      
      The filter_func will be called for each child after the call, and
      it will continue to be called each time a child changes (via
      [gtk.flow_box_child.FlowBoxChild.changed]) or when
      [gtk.flow_box.FlowBox.invalidateFilter] is called.
      
      Note that using a filter function is incompatible with using a model
      (see [gtk.flow_box.FlowBox.bindModel]).
  
      Params:
        filterFunc = callback that
            lets you filter which children to show
  */
  void setFilterFunc(gtk.types.FlowBoxFilterFunc filterFunc = null)
  {
    extern(C) gboolean _filterFuncCallback(GtkFlowBoxChild* child, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.FlowBoxFilterFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _filterFuncCB = filterFunc ? &_filterFuncCallback : null;
    auto _filterFunc = filterFunc ? freezeDelegate(cast(void*)&filterFunc) : null;
    GDestroyNotify _filterFuncDestroyCB = filterFunc ? &thawDelegate : null;
    gtk_flow_box_set_filter_func(cast(GtkFlowBox*)this._cPtr, _filterFuncCB, _filterFunc, _filterFuncDestroyCB);
  }

  /**
      Hooks up an adjustment to focus handling in box.
      
      The adjustment is also used for autoscrolling during
      rubberband selection. See [gtk.scrolled_window.ScrolledWindow.getHadjustment]
      for a typical way of obtaining the adjustment, and
      [gtk.flow_box.FlowBox.setVadjustment] for setting the vertical
      adjustment.
      
      The adjustments have to be in pixel units and in the same
      coordinate system as the allocation for immediate children
      of the box.
  
      Params:
        adjustment = an adjustment which should be adjusted
             when the focus is moved among the descendents of container
  */
  void setHadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_flow_box_set_hadjustment(cast(GtkFlowBox*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets whether or not all children of box are given
      equal space in the box.
  
      Params:
        homogeneous = true to create equal allotments,
            false for variable allotments
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_flow_box_set_homogeneous(cast(GtkFlowBox*)this._cPtr, homogeneous);
  }

  /**
      Sets the maximum number of children to request and
      allocate space for in box’s orientation.
      
      Setting the maximum number of children per line
      limits the overall natural size request to be no more
      than n_children children long in the given orientation.
  
      Params:
        nChildren = the maximum number of children per line
  */
  void setMaxChildrenPerLine(uint nChildren)
  {
    gtk_flow_box_set_max_children_per_line(cast(GtkFlowBox*)this._cPtr, nChildren);
  }

  /**
      Sets the minimum number of children to line up
      in box’s orientation before flowing.
  
      Params:
        nChildren = the minimum number of children per line
  */
  void setMinChildrenPerLine(uint nChildren)
  {
    gtk_flow_box_set_min_children_per_line(cast(GtkFlowBox*)this._cPtr, nChildren);
  }

  /**
      Sets the vertical space to add between children.
  
      Params:
        spacing = the spacing to use
  */
  void setRowSpacing(uint spacing)
  {
    gtk_flow_box_set_row_spacing(cast(GtkFlowBox*)this._cPtr, spacing);
  }

  /**
      Sets how selection works in box.
  
      Params:
        mode = the new selection mode
  */
  void setSelectionMode(gtk.types.SelectionMode mode)
  {
    gtk_flow_box_set_selection_mode(cast(GtkFlowBox*)this._cPtr, mode);
  }

  /**
      By setting a sort function on the box, one can dynamically
      reorder the children of the box, based on the contents of
      the children.
      
      The sort_func will be called for each child after the call,
      and will continue to be called each time a child changes (via
      [gtk.flow_box_child.FlowBoxChild.changed]) and when
      [gtk.flow_box.FlowBox.invalidateSort] is called.
      
      Note that using a sort function is incompatible with using a model
      (see [gtk.flow_box.FlowBox.bindModel]).
  
      Params:
        sortFunc = the sort function
  */
  void setSortFunc(gtk.types.FlowBoxSortFunc sortFunc = null)
  {
    extern(C) int _sortFuncCallback(GtkFlowBoxChild* child1, GtkFlowBoxChild* child2, void* userData)
    {
      auto _dlg = cast(gtk.types.FlowBoxSortFunc*)userData;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child1, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child2, No.Take));
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_flow_box_set_sort_func(cast(GtkFlowBox*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Hooks up an adjustment to focus handling in box.
      
      The adjustment is also used for autoscrolling during
      rubberband selection. See [gtk.scrolled_window.ScrolledWindow.getVadjustment]
      for a typical way of obtaining the adjustment, and
      [gtk.flow_box.FlowBox.setHadjustment] for setting the horizontal
      adjustment.
      
      The adjustments have to be in pixel units and in the same
      coordinate system as the allocation for immediate children
      of the box.
  
      Params:
        adjustment = an adjustment which should be adjusted
             when the focus is moved among the descendents of container
  */
  void setVadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_flow_box_set_vadjustment(cast(GtkFlowBox*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Unselect all children of box, if the selection
      mode allows it.
  */
  void unselectAll()
  {
    gtk_flow_box_unselect_all(cast(GtkFlowBox*)this._cPtr);
  }

  /**
      Unselects a single child of box, if the selection
      mode allows it.
  
      Params:
        child = a child of box
  */
  void unselectChild(gtk.flow_box_child.FlowBoxChild child)
  {
    gtk_flow_box_unselect_child(cast(GtkFlowBox*)this._cPtr, child ? cast(GtkFlowBoxChild*)child._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ActivateCursorChild` signal.
  
      Emitted when the user activates the box.
        
        This is a [keybinding signal](class.SignalAction.html).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box.FlowBox flowBox))
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateCursorChild(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-child", closure, after);
  }

  /**
      Connect to `ChildActivated` signal.
  
      Emitted when a child has been activated by the user.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box_child.FlowBoxChild child, gtk.flow_box.FlowBox flowBox))
  
          `child` the child that is activated (optional)
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChildActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box_child.FlowBoxChild)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-activated", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Emitted when the user initiates a cursor movement.
        
        This is a [keybinding signal](class.SignalAction.html).
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal come in two variants,
        the variant with the Shift modifier extends the selection,
        the variant without the Shift modifier does not.
        There are too many key combinations to list them all here.
        
        $(LIST
          * <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
            move by individual children
          * <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
          * <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages
        )
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.MovementStep step, int count, bool extend, bool modify, gtk.flow_box.FlowBox flowBox))
  
          `step` the granularity of the move, as a [gtk.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extend` whether to extend the selection (optional)
  
          `modify` whether to modify the selection (optional)
  
          `flowBox` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
            false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      Emitted to select all children of the box,
        if the selection mode permits it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box.FlowBox flowBox))
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectedChildrenChanged` signal.
  
      Emitted when the set of selected children changes.
        
        Use [gtk.flow_box.FlowBox.selectedForeach] or
        [gtk.flow_box.FlowBox.getSelectedChildren] to obtain the
        selected children.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box.FlowBox flowBox))
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectedChildrenChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selected-children-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorChild` signal.
  
      Emitted to toggle the selection of the child that has the focus.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>Space</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box.FlowBox flowBox))
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleCursorChild(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-child", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      Emitted to unselect all children of the box,
        if the selection mode permits it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal is <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box.FlowBox flowBox))
  
          `flowBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box.FlowBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}
