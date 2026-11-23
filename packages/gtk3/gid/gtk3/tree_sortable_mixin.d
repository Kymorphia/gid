/// Module for [TreeSortable] interface mixin
module gid.gtk3.tree_sortable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.tree_sortable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.tree_iter;
public import gid.gtk3.tree_model;
public import gid.gtk3.types;

/**
    #GtkTreeSortable is an interface to be implemented by tree models which
    support sorting. The #GtkTreeView uses the methods provided by this interface
    to sort the model.
*/
template TreeSortableT()
{

  /**
      Fills in sort_column_id and order with the current sort column and the
      order. It returns true unless the sort_column_id is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID] or
      [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID].
  
      Params:
        sortColumnId = The sort column id to be filled in
        order = The #GtkSortType to be filled in
      Returns: true if the sort column is not one of the special sort
          column ids.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSortColumnId`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetSortColumnId(out int sortColumnId, out gid.gtk3.types.SortType order)
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.getSortColumnId)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getSortColumnId(cast(GtkTreeSortable*)this._cPtr, cast(int*)&sortColumnId, &order);
    return _retval;
  }

  /**
      Returns true if the model has a default sort function. This is used
      primarily by GtkTreeViewColumns in order to determine if a model can
      go back to the default state, or not.
      Returns: true, if the model has a default sort function
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHasDefaultSortFunc`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncHasDefaultSortFunc()
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.hasDefaultSortFunc)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.hasDefaultSortFunc(cast(GtkTreeSortable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the default comparison function used when sorting to be sort_func.
      If the current sort column id of sortable is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], then the model will sort using
      this function.
      
      If sort_func is null, then there will be no default comparison function.
      This means that once the model  has been sorted, it can’t go back to the
      default state. In this case, when the current sort column id of sortable
      is [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], the model will be unsorted.
  
      Params:
        sortFunc = The comparison function
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetDefaultSortFunc`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'sort_func' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetDefaultSortFunc(gid.gtk3.types.TreeIterCompareFunc sortFunc)
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.setDefaultSortFunc)
      return;

    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.TreeIterCompareFunc*)userData;
      auto _a = a ? new gid.gtk3.tree_iter.TreeIter(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.tree_iter.TreeIter(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeIterCompareFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    _klass.setDefaultSortFunc(cast(GtkTreeSortable*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Sets the current sort column to be sort_column_id. The sortable will
      resort itself to reflect this change, after emitting a
      #GtkTreeSortable::sort-column-changed signal. sort_column_id may either be
      a regular column id, or one of the following special values:
      
      - [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function
        will be used, if it is set
      
      - [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur
  
      Params:
        sortColumnId = the sort column id to set
        order = The sort order of the column
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSortColumnId`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetSortColumnId(int sortColumnId, gid.gtk3.types.SortType order)
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.setSortColumnId)
      return;

    _klass.setSortColumnId(cast(GtkTreeSortable*)this._cPtr, sortColumnId, order);
  }

  /**
      Sets the comparison function used when sorting to be sort_func. If the
      current sort column id of sortable is the same as sort_column_id, then
      the model will sort using this function.
  
      Params:
        sortColumnId = the sort column id to set the function for
        sortFunc = The comparison function
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSortFunc`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'sort_func' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetSortFunc(int sortColumnId, gid.gtk3.types.TreeIterCompareFunc sortFunc)
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.setSortFunc)
      return;

    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.TreeIterCompareFunc*)userData;
      auto _a = a ? new gid.gtk3.tree_iter.TreeIter(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.tree_iter.TreeIter(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeIterCompareFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    _klass.setSortFunc(cast(GtkTreeSortable*)this._cPtr, sortColumnId, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Emits a #GtkTreeSortable::sort-column-changed signal on sortable.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSortColumnChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSortColumnChanged()
  {
    auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tree_sortable.TreeSortable._getGType);
    if (!_klass || !_klass.sortColumnChanged)
      return;

    _klass.sortColumnChanged(cast(GtkTreeSortable*)this._cPtr);
  }

  /**
      Fills in sort_column_id and order with the current sort column and the
      order. It returns true unless the sort_column_id is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID] or
      [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID].
  
      Params:
        sortColumnId = The sort column id to be filled in
        order = The #GtkSortType to be filled in
      Returns: true if the sort column is not one of the special sort
          column ids.
  */
  override bool getSortColumnId(out int sortColumnId, out gid.gtk3.types.SortType order) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_sortable_get_sort_column_id(cast(GtkTreeSortable*)this._cPtr, cast(int*)&sortColumnId, &order);
    return _retval;
  }

  /**
      Returns true if the model has a default sort function. This is used
      primarily by GtkTreeViewColumns in order to determine if a model can
      go back to the default state, or not.
      Returns: true, if the model has a default sort function
  */
  override bool hasDefaultSortFunc() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_sortable_has_default_sort_func(cast(GtkTreeSortable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the default comparison function used when sorting to be sort_func.
      If the current sort column id of sortable is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], then the model will sort using
      this function.
      
      If sort_func is null, then there will be no default comparison function.
      This means that once the model  has been sorted, it can’t go back to the
      default state. In this case, when the current sort column id of sortable
      is [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], the model will be unsorted.
  
      Params:
        sortFunc = The comparison function
  */
  override void setDefaultSortFunc(gid.gtk3.types.TreeIterCompareFunc sortFunc) nothrow
  {
    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.TreeIterCompareFunc*)userData;
      auto _a = a ? new gid.gtk3.tree_iter.TreeIter(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.tree_iter.TreeIter(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeIterCompareFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_tree_sortable_set_default_sort_func(cast(GtkTreeSortable*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Sets the current sort column to be sort_column_id. The sortable will
      resort itself to reflect this change, after emitting a
      #GtkTreeSortable::sort-column-changed signal. sort_column_id may either be
      a regular column id, or one of the following special values:
      
      - [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function
        will be used, if it is set
      
      - [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur
  
      Params:
        sortColumnId = the sort column id to set
        order = The sort order of the column
  */
  override void setSortColumnId(int sortColumnId, gid.gtk3.types.SortType order) nothrow
  {
    gtk_tree_sortable_set_sort_column_id(cast(GtkTreeSortable*)this._cPtr, sortColumnId, order);
  }

  /**
      Sets the comparison function used when sorting to be sort_func. If the
      current sort column id of sortable is the same as sort_column_id, then
      the model will sort using this function.
  
      Params:
        sortColumnId = the sort column id to set the function for
        sortFunc = The comparison function
  */
  override void setSortFunc(int sortColumnId, gid.gtk3.types.TreeIterCompareFunc sortFunc) nothrow
  {
    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.TreeIterCompareFunc*)userData;
      auto _a = a ? new gid.gtk3.tree_iter.TreeIter(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.tree_iter.TreeIter(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeIterCompareFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_tree_sortable_set_sort_func(cast(GtkTreeSortable*)this._cPtr, sortColumnId, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Emits a #GtkTreeSortable::sort-column-changed signal on sortable.
  */
  override void sortColumnChanged() nothrow
  {
    gtk_tree_sortable_sort_column_changed(cast(GtkTreeSortable*)this._cPtr);
  }

  /**
      Connect to `SortColumnChanged` signal.
  
      The ::sort-column-changed signal is emitted when the sort column
        or sort order of sortable is changed. The signal is emitted before
        the contents of sortable are resorted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.tree_sortable.TreeSortable treeSortable)`
  
          `treeSortable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSortColumnChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.tree_sortable.TreeSortable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_sortable.TreeSortable.sortColumnChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sort-column-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.tree_sortable.TreeSortable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_tree_sortable_TreeSortable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortColumnId", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasDefaultSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDefaultSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortColumnId", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSortColumnChanged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.tree_sortable.TreeSortable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_tree_sortable_TreeSortable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSortColumnId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_sortable_TreeSortable(iface, "get_sort_column_id");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasDefaultSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_sortable_TreeSortable(iface, "has_default_sort_func");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetDefaultSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.tree_sortable.TreeSortable.vfuncSetDefaultSortFunc is not supported: parameter 'sort_func' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortColumnId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_sortable_TreeSortable(iface, "set_sort_column_id");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.tree_sortable.TreeSortable.vfuncSetSortFunc is not supported: parameter 'sort_func' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSortColumnChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tree_sortable_TreeSortable(iface, "sort_column_changed");
  }

  private static void _installIfaceVfunc_gid_gtk3_tree_sortable_TreeSortable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeSortableIface*)iface;

    switch (vfunc)
    {
      case "get_sort_column_id":
      {
        static extern(C) gboolean _vfuncGetSortColumnIdTramp(GtkTreeSortable* sortable, int* sortColumnId, GtkSortType* order) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sortable);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sortable), gid.gtk3.tree_sortable.TreeSortable._getGType);
            if (_klass && _klass.getSortColumnId)
              return (cast(typeof(&_vfuncGetSortColumnIdTramp))_klass.getSortColumnId)(sortable, sortColumnId, order);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetSortColumnId(*sortColumnId, *order);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_sortable.TreeSortable.vfuncGetSortColumnId");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getSortColumnId = cast(typeof(_klass.getSortColumnId))&_vfuncGetSortColumnIdTramp;
        break;
      }
      case "has_default_sort_func":
      {
        static extern(C) gboolean _vfuncHasDefaultSortFuncTramp(GtkTreeSortable* sortable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sortable);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sortable), gid.gtk3.tree_sortable.TreeSortable._getGType);
            if (_klass && _klass.hasDefaultSortFunc)
              return (cast(typeof(&_vfuncHasDefaultSortFuncTramp))_klass.hasDefaultSortFunc)(sortable);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHasDefaultSortFunc();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_sortable.TreeSortable.vfuncHasDefaultSortFunc");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasDefaultSortFunc = cast(typeof(_klass.hasDefaultSortFunc))&_vfuncHasDefaultSortFuncTramp;
        break;
      }
      case "set_sort_column_id":
      {
        static extern(C) void _vfuncSetSortColumnIdTramp(GtkTreeSortable* sortable, int sortColumnId, GtkSortType order) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sortable);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sortable), gid.gtk3.tree_sortable.TreeSortable._getGType);
            if (_klass && _klass.setSortColumnId)
              return (cast(typeof(&_vfuncSetSortColumnIdTramp))_klass.setSortColumnId)(sortable, sortColumnId, order);
            return;
          }

          try
          {
            _obj.vfuncSetSortColumnId(sortColumnId, order);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_sortable.TreeSortable.vfuncSetSortColumnId");
          }
        }

        _klass.setSortColumnId = cast(typeof(_klass.setSortColumnId))&_vfuncSetSortColumnIdTramp;
        break;
      }
      case "sort_column_changed":
      {
        static extern(C) void _vfuncSortColumnChangedTramp(GtkTreeSortable* sortable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sortable);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeSortableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sortable), gid.gtk3.tree_sortable.TreeSortable._getGType);
            if (_klass && _klass.sortColumnChanged)
              return (cast(typeof(&_vfuncSortColumnChangedTramp))_klass.sortColumnChanged)(sortable);
            return;
          }

          try
          {
            _obj.vfuncSortColumnChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_sortable.TreeSortable.vfuncSortColumnChanged");
          }
        }

        _klass.sortColumnChanged = cast(typeof(_klass.sortColumnChanged))&_vfuncSortColumnChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.tree_sortable.TreeSortable]
template TreeSortableGidBuilderT()
{
}
