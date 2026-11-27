/// Module for [SelectionModel] interface mixin
module gid.gtk4.selection_model_mixin;

public import gid.core.basictypes;
public import gid.gtk4.selection_model;
public import gid.gtk4.selection_model_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.bitset;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface that adds support for selection to list models.
    
    This support is then used by widgets using list models to add the ability
    to select and unselect various items.
    
    GTK provides default implementations of the most common selection modes such
    as [gid.gtk4.single_selection.SingleSelection], so you will only need to implement this
    interface if you want detailed control about how selections should be handled.
    
    A [gid.gtk4.selection_model.SelectionModel] supports a single boolean per item indicating if an item is
    selected or not. This can be queried via [gid.gtk4.selection_model.SelectionModel.isSelected].
    When the selected state of one or more items changes, the model will emit the
    [gid.gtk4.selection_model.SelectionModel.selectionChanged] signal by calling the
    [gid.gtk4.selection_model.SelectionModel.selectionChanged] function. The positions given
    in that signal may have their selection state changed, though that is not a
    requirement. If new items added to the model via the
    [gid.gio2.list_model.ListModel.itemsChanged] signal are selected or not is up to the
    implementation.
    
    Note that items added via [gid.gio2.list_model.ListModel.itemsChanged] may already
    be selected and no [gid.gtk4.selection_model.SelectionModel.selectionChanged] will be
    emitted for them. So to track which items are selected, it is necessary to
    listen to both signals.
    
    Additionally, the interface can expose functionality to select and unselect
    items. If these functions are implemented, GTK's list widgets will allow users
    to select and unselect items. However, [gid.gtk4.selection_model.SelectionModel]s are free to only
    implement them partially or not at all. In that case the widgets will not
    support the unimplemented operations.
    
    When selecting or unselecting is supported by a model, the return values of
    the selection functions do *not* indicate if selection or unselection happened.
    They are only meant to indicate complete failure, like when this mode of
    selecting is not supported by the model.
    
    Selections may happen asynchronously, so the only reliable way to find out
    when an item was selected is to listen to the signals that indicate selection.
*/
template SelectionModelT()
{

  /**
      Gets the set of selected items in a range.
      
      This function is an optimization for
      [gid.gtk4.selection_model.SelectionModel.getSelection] when you are only
      interested in part of the model's selected state. A common use
      case is in response to the [gid.gtk4.selection_model.SelectionModel.selectionChanged]
      signal.
  
      Params:
        position = start of the queried range
        nItems = number of items in the queried range
      Returns: A [gid.gtk4.bitset.Bitset] that matches the selection state
          for the given range with all other values being undefined.
          The bitset must not be modified.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSelectionInRange`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.bitset.Bitset vfuncGetSelectionInRange(uint position, uint nItems)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.getSelectionInRange)
      return typeof(return).init;

    GtkBitset* _cretval;
    _cretval = _klass.getSelectionInRange(cast(GtkSelectionModel*)this._cPtr, position, nItems);
    auto _retval = _cretval ? new gid.gtk4.bitset.Bitset(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if the given item is selected.
  
      Params:
        position = the position of the item to query
      Returns: true if the item is selected
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsSelected(uint position)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.isSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSelected(cast(GtkSelectionModel*)this._cPtr, position);
    return _retval;
  }

  /**
      Requests to select all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now selected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectAll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectAll()
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.selectAll)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectAll(cast(GtkSelectionModel*)this._cPtr);
    return _retval;
  }

  /**
      Requests to select an item in the model.
  
      Params:
        position = the position of the item to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was selected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectItem`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectItem(uint position, bool unselectRest)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.selectItem)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectItem(cast(GtkSelectionModel*)this._cPtr, position, unselectRest);
    return _retval;
  }

  /**
      Requests to select a range of items in the model.
  
      Params:
        position = the first item to select
        nItems = the number of items to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was selected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectRange`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectRange(uint position, uint nItems, bool unselectRest)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.selectRange)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.selectRange(cast(GtkSelectionModel*)this._cPtr, position, nItems, unselectRest);
    return _retval;
  }

  /**
      Make selection changes.
      
      This is the most advanced selection updating method that allows
      the most fine-grained control over selection changes. If you can,
      you should try the simpler versions, as implementations are more
      likely to implement support for those.
      
      Requests that the selection state of all positions set in mask
      be updated to the respective value in the selected bitmask.
      
      In pseudocode, it would look something like this:
      
      ```c
      for (i = 0; i < n_items; i++)
        {
          // don't change values not in the mask
          if (!gtk_bitset_contains (mask, i))
            continue;
      
          if (gtk_bitset_contains (selected, i))
            select_item (i);
          else
            unselect_item (i);
        }
      
      gtk_selection_model_selection_changed (model,
                                             first_changed_item,
                                             n_changed_items);
      ```
      
      mask and selected must not be modified. They may refer to the
      same bitset, which would mean that every item in the set should
      be selected.
  
      Params:
        selected = bitmask specifying if items should be selected or unselected (modified in place, changes are seen by the caller)
        mask = bitmask specifying which items should be updated (modified in place, changes are seen by the caller)
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items were updated according
          to the inputs.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetSelection(gid.gtk4.bitset.Bitset selected, gid.gtk4.bitset.Bitset mask)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.setSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setSelection(cast(GtkSelectionModel*)this._cPtr, selected ? cast(GtkBitset*)selected._cPtr(No.Dup) : null, mask ? cast(GtkBitset*)mask._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Requests to unselect all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now unselected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnselectAll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnselectAll()
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.unselectAll)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unselectAll(cast(GtkSelectionModel*)this._cPtr);
    return _retval;
  }

  /**
      Requests to unselect an item in the model.
  
      Params:
        position = the position of the item to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was unselected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnselectItem`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnselectItem(uint position)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.unselectItem)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unselectItem(cast(GtkSelectionModel*)this._cPtr, position);
    return _retval;
  }

  /**
      Requests to unselect a range of items in the model.
  
      Params:
        position = the first item to unselect
        nItems = the number of items to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was unselected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnselectRange`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncUnselectRange(uint position, uint nItems)
  {
    auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.selection_model.SelectionModel._getGType);
    if (!_klass || !_klass.unselectRange)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unselectRange(cast(GtkSelectionModel*)this._cPtr, position, nItems);
    return _retval;
  }

  /**
      Gets the set containing all currently selected items in the model.
      
      This function may be slow, so if you are only interested in single item,
      consider using [gid.gtk4.selection_model.SelectionModel.isSelected] or if you are only
      interested in a few, consider [gid.gtk4.selection_model.SelectionModel.getSelectionInRange].
      Returns: a [gid.gtk4.bitset.Bitset] containing all the values currently
          selected in model. If no items are selected, the bitset is empty.
          The bitset must not be modified.
  */
  override gid.gtk4.bitset.Bitset getSelection() nothrow
  {
    GtkBitset* _cretval;
    _cretval = gtk_selection_model_get_selection(cast(GtkSelectionModel*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.bitset.Bitset(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the set of selected items in a range.
      
      This function is an optimization for
      [gid.gtk4.selection_model.SelectionModel.getSelection] when you are only
      interested in part of the model's selected state. A common use
      case is in response to the [gid.gtk4.selection_model.SelectionModel.selectionChanged]
      signal.
  
      Params:
        position = start of the queried range
        nItems = number of items in the queried range
      Returns: A [gid.gtk4.bitset.Bitset] that matches the selection state
          for the given range with all other values being undefined.
          The bitset must not be modified.
  */
  override gid.gtk4.bitset.Bitset getSelectionInRange(uint position, uint nItems) nothrow
  {
    GtkBitset* _cretval;
    _cretval = gtk_selection_model_get_selection_in_range(cast(GtkSelectionModel*)this._cPtr, position, nItems);
    auto _retval = _cretval ? new gid.gtk4.bitset.Bitset(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if the given item is selected.
  
      Params:
        position = the position of the item to query
      Returns: true if the item is selected
  */
  override bool isSelected(uint position) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_is_selected(cast(GtkSelectionModel*)this._cPtr, position);
    return _retval;
  }

  /**
      Requests to select all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now selected.
  */
  override bool selectAll() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_select_all(cast(GtkSelectionModel*)this._cPtr);
    return _retval;
  }

  /**
      Requests to select an item in the model.
  
      Params:
        position = the position of the item to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was selected.
  */
  override bool selectItem(uint position, bool unselectRest) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_select_item(cast(GtkSelectionModel*)this._cPtr, position, unselectRest);
    return _retval;
  }

  /**
      Requests to select a range of items in the model.
  
      Params:
        position = the first item to select
        nItems = the number of items to select
        unselectRest = whether previously selected items should be unselected
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was selected.
  */
  override bool selectRange(uint position, uint nItems, bool unselectRest) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_select_range(cast(GtkSelectionModel*)this._cPtr, position, nItems, unselectRest);
    return _retval;
  }

  /**
      Helper function for implementations of [gid.gtk4.selection_model.SelectionModel].
      
      Call this when the selection changes to emit the
      [gid.gtk4.selection_model.SelectionModel.selectionChanged] signal.
  
      Params:
        position = the first changed item
        nItems = the number of changed items
  */
  override void selectionChanged(uint position, uint nItems) nothrow
  {
    gtk_selection_model_selection_changed(cast(GtkSelectionModel*)this._cPtr, position, nItems);
  }

  /**
      Make selection changes.
      
      This is the most advanced selection updating method that allows
      the most fine-grained control over selection changes. If you can,
      you should try the simpler versions, as implementations are more
      likely to implement support for those.
      
      Requests that the selection state of all positions set in mask
      be updated to the respective value in the selected bitmask.
      
      In pseudocode, it would look something like this:
      
      ```c
      for (i = 0; i < n_items; i++)
        {
          // don't change values not in the mask
          if (!gtk_bitset_contains (mask, i))
            continue;
      
          if (gtk_bitset_contains (selected, i))
            select_item (i);
          else
            unselect_item (i);
        }
      
      gtk_selection_model_selection_changed (model,
                                             first_changed_item,
                                             n_changed_items);
      ```
      
      mask and selected must not be modified. They may refer to the
      same bitset, which would mean that every item in the set should
      be selected.
  
      Params:
        selected = bitmask specifying if items should be selected or unselected
        mask = bitmask specifying which items should be updated
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items were updated according
          to the inputs.
  */
  override bool setSelection(gid.gtk4.bitset.Bitset selected, gid.gtk4.bitset.Bitset mask) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_set_selection(cast(GtkSelectionModel*)this._cPtr, selected ? cast(GtkBitset*)selected._cPtr(No.Dup) : null, mask ? cast(GtkBitset*)mask._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Requests to unselect all items in the model.
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean that all items are now unselected.
  */
  override bool unselectAll() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_unselect_all(cast(GtkSelectionModel*)this._cPtr);
    return _retval;
  }

  /**
      Requests to unselect an item in the model.
  
      Params:
        position = the position of the item to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the item was unselected.
  */
  override bool unselectItem(uint position) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_unselect_item(cast(GtkSelectionModel*)this._cPtr, position);
    return _retval;
  }

  /**
      Requests to unselect a range of items in the model.
  
      Params:
        position = the first item to unselect
        nItems = the number of items to unselect
      Returns: true if this action was supported and no fallback should be
          tried. This does not mean the range was unselected.
  */
  override bool unselectRange(uint position, uint nItems) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_model_unselect_range(cast(GtkSelectionModel*)this._cPtr, position, nItems);
    return _retval;
  }

  /**
      Connect to `SelectionChanged` signal.
  
      Emitted when the selection state of some of the items in model changes.
        
        Note that this signal does not specify the new selection state of the
        items, they need to be queried manually. It is also not necessary for
        a model to change the selection state of any of the items in the selection
        model, though it would be rather useless to emit such a signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, uint nItems, gid.gtk4.selection_model.SelectionModel selectionModel)`
  
          `position` The first item that may have changed (optional)
  
          `nItems` number of items with changes (optional)
  
          `selectionModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.selection_model.SelectionModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.selection_model.SelectionModel (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_selection_model_SelectionModel(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelectionInRange", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectItem", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectRange", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectAll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectItem", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectRange", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.selection_model.SelectionModel vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_selection_model_SelectionModel(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelectionInRange", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "get_selection_in_range");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "is_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "select_all");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectItem", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "select_item");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectRange", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "select_range");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "set_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectAll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "unselect_all");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectItem", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "unselect_item");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectRange", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(iface, "unselect_range");
  }

  private static void _installIfaceVfunc_gid_gtk4_selection_model_SelectionModel(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSelectionModelInterface*)iface;

    switch (vfunc)
    {
      case "get_selection_in_range":
      {
        static extern(C) GtkBitset* _vfuncGetSelectionInRangeTramp(GtkSelectionModel* model, uint position, uint nItems) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.getSelectionInRange)
              return (cast(typeof(&_vfuncGetSelectionInRangeTramp))_klass.getSelectionInRange)(model, position, nItems);
            return typeof(return).init;
          }

          gid.gtk4.bitset.Bitset _dretval;

          try
          {
            _dretval = _obj.vfuncGetSelectionInRange(position, nItems);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncGetSelectionInRange");
          }
          auto _retval = _dretval ? cast(GtkBitset*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getSelectionInRange = cast(typeof(_klass.getSelectionInRange))&_vfuncGetSelectionInRangeTramp;
        break;
      }
      case "is_selected":
      {
        static extern(C) gboolean _vfuncIsSelectedTramp(GtkSelectionModel* model, uint position) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.isSelected)
              return (cast(typeof(&_vfuncIsSelectedTramp))_klass.isSelected)(model, position);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSelected(position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncIsSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSelected = cast(typeof(_klass.isSelected))&_vfuncIsSelectedTramp;
        break;
      }
      case "select_all":
      {
        static extern(C) gboolean _vfuncSelectAllTramp(GtkSelectionModel* model) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.selectAll)
              return (cast(typeof(&_vfuncSelectAllTramp))_klass.selectAll)(model);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncSelectAll");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectAll = cast(typeof(_klass.selectAll))&_vfuncSelectAllTramp;
        break;
      }
      case "select_item":
      {
        static extern(C) gboolean _vfuncSelectItemTramp(GtkSelectionModel* model, uint position, gboolean unselectRest) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.selectItem)
              return (cast(typeof(&_vfuncSelectItemTramp))_klass.selectItem)(model, position, unselectRest);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectItem(position, cast(bool)unselectRest);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncSelectItem");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectItem = cast(typeof(_klass.selectItem))&_vfuncSelectItemTramp;
        break;
      }
      case "select_range":
      {
        static extern(C) gboolean _vfuncSelectRangeTramp(GtkSelectionModel* model, uint position, uint nItems, gboolean unselectRest) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.selectRange)
              return (cast(typeof(&_vfuncSelectRangeTramp))_klass.selectRange)(model, position, nItems, unselectRest);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSelectRange(position, nItems, cast(bool)unselectRest);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncSelectRange");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectRange = cast(typeof(_klass.selectRange))&_vfuncSelectRangeTramp;
        break;
      }
      case "set_selection":
      {
        static extern(C) gboolean _vfuncSetSelectionTramp(GtkSelectionModel* model, GtkBitset* selected, GtkBitset* mask) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.setSelection)
              return (cast(typeof(&_vfuncSetSelectionTramp))_klass.setSelection)(model, selected, mask);
            return typeof(return).init;
          }

          bool _dretval;
          auto _selected = selected ? new gid.gtk4.bitset.Bitset(cast(void*)selected, Yes.Take)._cBorrow : null;
          auto _mask = mask ? new gid.gtk4.bitset.Bitset(cast(void*)mask, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetSelection(_selected, _mask);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncSetSelection");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_selected)
            _selected._cUnborrow;
          if (_mask)
            _mask._cUnborrow;

          return _retval;
        }

        _klass.setSelection = cast(typeof(_klass.setSelection))&_vfuncSetSelectionTramp;
        break;
      }
      case "unselect_all":
      {
        static extern(C) gboolean _vfuncUnselectAllTramp(GtkSelectionModel* model) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.unselectAll)
              return (cast(typeof(&_vfuncUnselectAllTramp))_klass.unselectAll)(model);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnselectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncUnselectAll");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unselectAll = cast(typeof(_klass.unselectAll))&_vfuncUnselectAllTramp;
        break;
      }
      case "unselect_item":
      {
        static extern(C) gboolean _vfuncUnselectItemTramp(GtkSelectionModel* model, uint position) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.unselectItem)
              return (cast(typeof(&_vfuncUnselectItemTramp))_klass.unselectItem)(model, position);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnselectItem(position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncUnselectItem");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unselectItem = cast(typeof(_klass.unselectItem))&_vfuncUnselectItemTramp;
        break;
      }
      case "unselect_range":
      {
        static extern(C) gboolean _vfuncUnselectRangeTramp(GtkSelectionModel* model, uint position, uint nItems) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GtkSelectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model), gid.gtk4.selection_model.SelectionModel._getGType);
            if (_klass && _klass.unselectRange)
              return (cast(typeof(&_vfuncUnselectRangeTramp))_klass.unselectRange)(model, position, nItems);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnselectRange(position, nItems);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.selection_model.SelectionModel.vfuncUnselectRange");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unselectRange = cast(typeof(_klass.unselectRange))&_vfuncUnselectRangeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.selection_model.SelectionModel]
template SelectionModelGidBuilderT()
{
}
