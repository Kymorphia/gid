/// Module for [TableCell] interface mixin
module gid.atk1.table_cell_mixin;

public import gid.core.basictypes;
public import gid.atk1.table_cell_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.object;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface implemented for a cell inside a two-dimentional #AtkTable
    
    Being #AtkTable a component which present elements ordered via rows
    and columns, an #AtkTableCell is the interface which each of those
    elements, so "cells" should implement.
    
    See `iface@AtkTable`
*/
template TableCellT()
{

  /**
      Returns the column headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the column header cells.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnHeaderCells`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap[] vfuncGetColumnHeaderCells()
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getColumnHeaderCells)
      return typeof(return).init;

    GPtrArray* _cretval;
    _cretval = _klass.getColumnHeaderCells(cast(AtkTableCell*)this._cPtr);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Returns the number of columns occupied by this cell accessible.
      Returns: a gint representing the number of columns occupied by this cell,
        or 0 if the cell does not implement this method.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnSpan`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetColumnSpan()
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getColumnSpan)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getColumnSpan(cast(AtkTableCell*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the tabular position of this cell.
  
      Params:
        row = the row of the given cell.
        column = the column of the given cell.
      Returns: TRUE if successful; FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncTableCellGetPosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncTableCellGetPosition(out int row, out int column)
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getPosition(cast(AtkTableCell*)this._cPtr, cast(int*)&row, cast(int*)&column);
    return _retval;
  }

  /**
      Gets the row and column indexes and span of this cell accessible.
      
      Note: If the object does not implement this function, then, by default, atk
      will implement this function by calling get_row_span and get_column_span
      on the object.
  
      Params:
        row = the row index of the given cell.
        column = the column index of the given cell.
        rowSpan = the number of rows occupied by this cell.
        columnSpan = the number of columns occupied by this cell.
      Returns: TRUE if successful; FALSE otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowColumnSpan`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetRowColumnSpan(out int row, out int column, out int rowSpan, out int columnSpan)
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getRowColumnSpan)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getRowColumnSpan(cast(AtkTableCell*)this._cPtr, cast(int*)&row, cast(int*)&column, cast(int*)&rowSpan, cast(int*)&columnSpan);
    return _retval;
  }

  /**
      Returns the row headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the row header cells.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowHeaderCells`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap[] vfuncGetRowHeaderCells()
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getRowHeaderCells)
      return typeof(return).init;

    GPtrArray* _cretval;
    _cretval = _klass.getRowHeaderCells(cast(AtkTableCell*)this._cPtr);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Returns the number of rows occupied by this cell accessible.
      Returns: a gint representing the number of rows occupied by this cell,
        or 0 if the cell does not implement this method.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowSpan`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetRowSpan()
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getRowSpan)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getRowSpan(cast(AtkTableCell*)this._cPtr);
    return _retval;
  }

  /**
      Returns a reference to the accessible of the containing table.
      Returns: the atk object for the containing table.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncGetTable()
  {
    auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table_cell.TableCell._getGType);
    if (!_klass || !_klass.getTable)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getTable(cast(AtkTableCell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the column headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the column header cells.
  */
  override gid.atk1.object.ObjectWrap[] getColumnHeaderCells() nothrow
  {
    GPtrArray* _cretval;
    _cretval = atk_table_cell_get_column_header_cells(cast(AtkTableCell*)this._cPtr);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Returns the number of columns occupied by this cell accessible.
      Returns: a gint representing the number of columns occupied by this cell,
        or 0 if the cell does not implement this method.
  */
  override int getColumnSpan() nothrow
  {
    int _retval;
    _retval = atk_table_cell_get_column_span(cast(AtkTableCell*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the tabular position of this cell.
  
      Params:
        row = the row of the given cell.
        column = the column of the given cell.
      Returns: TRUE if successful; FALSE otherwise.
  */
  override bool getPosition(out int row, out int column) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_cell_get_position(cast(AtkTableCell*)this._cPtr, cast(int*)&row, cast(int*)&column);
    return _retval;
  }

  /**
      Gets the row and column indexes and span of this cell accessible.
      
      Note: If the object does not implement this function, then, by default, atk
      will implement this function by calling get_row_span and get_column_span
      on the object.
  
      Params:
        row = the row index of the given cell.
        column = the column index of the given cell.
        rowSpan = the number of rows occupied by this cell.
        columnSpan = the number of columns occupied by this cell.
      Returns: TRUE if successful; FALSE otherwise.
  */
  override bool getRowColumnSpan(out int row, out int column, out int rowSpan, out int columnSpan) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_cell_get_row_column_span(cast(AtkTableCell*)this._cPtr, cast(int*)&row, cast(int*)&column, cast(int*)&rowSpan, cast(int*)&columnSpan);
    return _retval;
  }

  /**
      Returns the row headers as an array of cell accessibles.
      Returns: a GPtrArray of AtkObjects
        representing the row header cells.
  */
  override gid.atk1.object.ObjectWrap[] getRowHeaderCells() nothrow
  {
    GPtrArray* _cretval;
    _cretval = atk_table_cell_get_row_header_cells(cast(AtkTableCell*)this._cPtr);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Returns the number of rows occupied by this cell accessible.
      Returns: a gint representing the number of rows occupied by this cell,
        or 0 if the cell does not implement this method.
  */
  override int getRowSpan() nothrow
  {
    int _retval;
    _retval = atk_table_cell_get_row_span(cast(AtkTableCell*)this._cPtr);
    return _retval;
  }

  /**
      Returns a reference to the accessible of the containing table.
      Returns: the atk object for the containing table.
  */
  override gid.atk1.object.ObjectWrap getTable() nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_cell_get_table(cast(AtkTableCell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.table_cell.TableCell (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_table_cell_TableCell(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnSpan", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTableCellGetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowColumnSpan", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowSpan", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTable", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.table_cell.TableCell vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_table_cell_TableCell(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_column_header_cells");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnSpan", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_column_span");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncTableCellGetPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowColumnSpan", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_row_column_span");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_row_header_cells");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowSpan", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_row_span");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_cell_TableCell(iface, "get_table");
  }

  private static void _installIfaceVfunc_gid_atk1_table_cell_TableCell(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkTableCellIface*)iface;

    switch (vfunc)
    {
      case "get_column_header_cells":
      {
        static extern(C) GPtrArray* _vfuncGetColumnHeaderCellsTramp(AtkTableCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getColumnHeaderCells)
              return (cast(typeof(&_vfuncGetColumnHeaderCellsTramp))_klass.getColumnHeaderCells)(cell);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetColumnHeaderCells();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetColumnHeaderCells");
          }
          auto _retval = gPtrArrayFromD!(gid.atk1.object.ObjectWrap, false)(_dretval);

          return _retval;
        }

        _klass.getColumnHeaderCells = cast(typeof(_klass.getColumnHeaderCells))&_vfuncGetColumnHeaderCellsTramp;
        break;
      }
      case "get_column_span":
      {
        static extern(C) int _vfuncGetColumnSpanTramp(AtkTableCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getColumnSpan)
              return (cast(typeof(&_vfuncGetColumnSpanTramp))_klass.getColumnSpan)(cell);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetColumnSpan();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetColumnSpan");
          }
          return _retval;
        }

        _klass.getColumnSpan = cast(typeof(_klass.getColumnSpan))&_vfuncGetColumnSpanTramp;
        break;
      }
      case "get_position":
      {
        static extern(C) gboolean _vfuncTableCellGetPositionTramp(AtkTableCell* cell, int* row, int* column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getPosition)
              return (cast(typeof(&_vfuncTableCellGetPositionTramp))_klass.getPosition)(cell, row, column);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncTableCellGetPosition(*row, *column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncTableCellGetPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getPosition = cast(typeof(_klass.getPosition))&_vfuncTableCellGetPositionTramp;
        break;
      }
      case "get_row_column_span":
      {
        static extern(C) gboolean _vfuncGetRowColumnSpanTramp(AtkTableCell* cell, int* row, int* column, int* rowSpan, int* columnSpan) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getRowColumnSpan)
              return (cast(typeof(&_vfuncGetRowColumnSpanTramp))_klass.getRowColumnSpan)(cell, row, column, rowSpan, columnSpan);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetRowColumnSpan(*row, *column, *rowSpan, *columnSpan);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetRowColumnSpan");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getRowColumnSpan = cast(typeof(_klass.getRowColumnSpan))&_vfuncGetRowColumnSpanTramp;
        break;
      }
      case "get_row_header_cells":
      {
        static extern(C) GPtrArray* _vfuncGetRowHeaderCellsTramp(AtkTableCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getRowHeaderCells)
              return (cast(typeof(&_vfuncGetRowHeaderCellsTramp))_klass.getRowHeaderCells)(cell);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetRowHeaderCells();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetRowHeaderCells");
          }
          auto _retval = gPtrArrayFromD!(gid.atk1.object.ObjectWrap, false)(_dretval);

          return _retval;
        }

        _klass.getRowHeaderCells = cast(typeof(_klass.getRowHeaderCells))&_vfuncGetRowHeaderCellsTramp;
        break;
      }
      case "get_row_span":
      {
        static extern(C) int _vfuncGetRowSpanTramp(AtkTableCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getRowSpan)
              return (cast(typeof(&_vfuncGetRowSpanTramp))_klass.getRowSpan)(cell);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetRowSpan();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetRowSpan");
          }
          return _retval;
        }

        _klass.getRowSpan = cast(typeof(_klass.getRowSpan))&_vfuncGetRowSpanTramp;
        break;
      }
      case "get_table":
      {
        static extern(C) AtkObject* _vfuncGetTableTramp(AtkTableCell* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(AtkTableCellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell), gid.atk1.table_cell.TableCell._getGType);
            if (_klass && _klass.getTable)
              return (cast(typeof(&_vfuncGetTableTramp))_klass.getTable)(cell);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetTable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table_cell.TableCell.vfuncGetTable");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getTable = cast(typeof(_klass.getTable))&_vfuncGetTableTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.table_cell.TableCell]
template TableCellGidBuilderT()
{
}
