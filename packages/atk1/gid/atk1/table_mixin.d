/// Module for [Table] interface mixin
module gid.atk1.table_mixin;

public import gid.core.basictypes;
public import gid.atk1.table_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.object;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

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
template TableT()
{

  /**
      Adds the specified column to the selection.
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column was successfully added to
        the selection, or 0 if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddColumnSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncAddColumnSelection(int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.addColumnSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.addColumnSelection(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Adds the specified row to the selection.
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if row was successfully added to selection,
        or 0 if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddRowSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncAddRowSelection(int row)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.addRowSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.addRowSelection(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncColumnDeleted(int column, int numDeleted)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.columnDeleted)
      return;

    _klass.columnDeleted(cast(AtkTable*)this._cPtr, column, numDeleted);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncColumnInserted(int column, int numInserted)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.columnInserted)
      return;

    _klass.columnInserted(cast(AtkTable*)this._cPtr, column, numInserted);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncColumnReordered()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.columnReordered)
      return;

    _klass.columnReordered(cast(AtkTable*)this._cPtr);
  }

  /**
      Gets the caption for the table.
      Returns: a AtkObject* representing the
        table caption, or null if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCaption`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncGetCaption()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getCaption)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getCaption(cast(AtkTable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the column at the specified index_.
  
      Params:
        index = a #gint representing an index in table
      Returns: a gint representing the column at the specified index,
        or -1 if the table does not implement this method.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnAtIndex`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetColumnAtIndex(int index)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getColumnAtIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getColumnAtIndex(cast(AtkTable*)this._cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified column in the table
  
      Params:
        column = a #gint representing a column in table
      Returns: a gchar* representing the column description, or null
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnDescription`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetColumnDescription(int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getColumnDescription)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getColumnDescription(cast(AtkTable*)this._cPtr, column);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of columns occupied by the accessible object
      at the specified row and column in the table.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gint representing the column extent at specified position, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnExtentAt`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetColumnExtentAt(int row, int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getColumnExtentAt)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getColumnExtentAt(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the column header of a specified column in an accessible table.
  
      Params:
        column = a #gint representing a column in the table
      Returns: a AtkObject* representing the
        specified column header, or null if value does not implement this
        interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetColumnHeader`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncGetColumnHeader(int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getColumnHeader)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getColumnHeader(cast(AtkTable*)this._cPtr, column);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the index at the specified row and
      column.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a #gint representing the index at specified position.
        The value -1 is returned if the object at row,column is not a child
        of table or table does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIndexAt`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12. Use [gid.atk1.table.Table.refAt] in order to get the
        accessible that represents the cell at (row, column)
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetIndexAt(int row, int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getIndexAt)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getIndexAt(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the number of columns in the table.
      Returns: a gint representing the number of columns, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNColumns`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNColumns()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getNColumns)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNColumns(cast(AtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of rows in the table.
      Returns: a gint representing the number of rows, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNRows`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNRows()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getNRows)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNRows(cast(AtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #gint representing the row at the specified index_.
  
      Params:
        index = a #gint representing an index in table
      Returns: a gint representing the row at the specified index,
        or -1 if the table does not implement this method.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowAtIndex`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: since 2.12.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetRowAtIndex(int index)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getRowAtIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getRowAtIndex(cast(AtkTable*)this._cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified row in the table
  
      Params:
        row = a #gint representing a row in table
      Returns: a gchar* representing the row description, or
        null if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowDescription`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetRowDescription(int row)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getRowDescription)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getRowDescription(cast(AtkTable*)this._cPtr, row);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of rows occupied by the accessible object
      at a specified row and column in the table.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gint representing the row extent at specified position, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowExtentAt`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetRowExtentAt(int row, int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getRowExtentAt)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getRowExtentAt(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the row header of a specified row in an accessible table.
  
      Params:
        row = a #gint representing a row in the table
      Returns: a AtkObject* representing the
        specified row header, or null if value does not implement this
        interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetRowHeader`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncGetRowHeader(int row)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getRowHeader)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getRowHeader(cast(AtkTable*)this._cPtr, row);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the summary description of the table.
      Returns: a AtkObject* representing a summary description
        of the table, or zero if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSummary`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncGetSummary()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.getSummary)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getSummary(cast(AtkTable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified column
      is selected
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column is selected, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsColumnSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsColumnSelected(int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.isColumnSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isColumnSelected(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified row
      is selected
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if the row is selected, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsRowSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsRowSelected(int row)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.isRowSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isRowSelected(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the accessible object
      at the specified row and column is selected
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gboolean representing if the cell is selected, or 0
        if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsSelected`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsSelected(int row, int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.isSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSelected(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncModelChanged()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.modelChanged)
      return;

    _klass.modelChanged(cast(AtkTable*)this._cPtr);
  }

  /**
      Get a reference to the table cell at row, column. This cell
      should implement the interface #AtkTableCell
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: an #AtkObject representing the referred
        to accessible
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRefAt`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap vfuncRefAt(int row, int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.refAt)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.refAt(cast(AtkTable*)this._cPtr, row, column);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds the specified column to the selection.
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column was successfully removed from
        the selection, or 0 if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveColumnSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRemoveColumnSelection(int column)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.removeColumnSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.removeColumnSelection(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Removes the specified row from the selection.
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if the row was successfully removed from
        the selection, or 0 if value does not implement this interface.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveRowSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRemoveRowSelection(int row)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.removeRowSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.removeRowSelection(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowDeleted(int row, int numDeleted)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.rowDeleted)
      return;

    _klass.rowDeleted(cast(AtkTable*)this._cPtr, row, numDeleted);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowInserted(int row, int numInserted)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.rowInserted)
      return;

    _klass.rowInserted(cast(AtkTable*)this._cPtr, row, numInserted);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRowReordered()
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.rowReordered)
      return;

    _klass.rowReordered(cast(AtkTable*)this._cPtr);
  }

  /**
      Sets the caption for the table.
  
      Params:
        caption = a #AtkObject representing the caption to set for table
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCaption`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetCaption(gid.atk1.object.ObjectWrap caption)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setCaption)
      return;

    _klass.setCaption(cast(AtkTable*)this._cPtr, caption ? cast(AtkObject*)caption._cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified column of the table.
  
      Params:
        column = a #gint representing a column in table
        description = a #gchar representing the description text
          to set for the specified column of the table
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetColumnDescription`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetColumnDescription(int column, string description)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setColumnDescription)
      return;

    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    _klass.setColumnDescription(cast(AtkTable*)this._cPtr, column, _description);
  }

  /**
      Sets the specified column header to header.
  
      Params:
        column = a #gint representing a column in table
        header = an #AtkTable
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetColumnHeader`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetColumnHeader(int column, gid.atk1.object.ObjectWrap header)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setColumnHeader)
      return;

    _klass.setColumnHeader(cast(AtkTable*)this._cPtr, column, header ? cast(AtkObject*)header._cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified row of table.
  
      Params:
        row = a #gint representing a row in table
        description = a #gchar representing the description text
          to set for the specified row of table
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetRowDescription`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetRowDescription(int row, string description)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setRowDescription)
      return;

    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    _klass.setRowDescription(cast(AtkTable*)this._cPtr, row, _description);
  }

  /**
      Sets the specified row header to header.
  
      Params:
        row = a #gint representing a row in table
        header = an #AtkTable
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetRowHeader`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetRowHeader(int row, gid.atk1.object.ObjectWrap header)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setRowHeader)
      return;

    _klass.setRowHeader(cast(AtkTable*)this._cPtr, row, header ? cast(AtkObject*)header._cPtr(No.Dup) : null);
  }

  /**
      Sets the summary description of the table.
  
      Params:
        accessible = an #AtkObject representing the summary description
          to set for table
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSummary`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetSummary(gid.atk1.object.ObjectWrap accessible)
  {
    auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.table.Table._getGType);
    if (!_klass || !_klass.setSummary)
      return;

    _klass.setSummary(cast(AtkTable*)this._cPtr, accessible ? cast(AtkObject*)accessible._cPtr(No.Dup) : null);
  }

  /**
      Adds the specified column to the selection.
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column was successfully added to
        the selection, or 0 if value does not implement this interface.
  */
  override bool addColumnSelection(int column) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_add_column_selection(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Adds the specified row to the selection.
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if row was successfully added to selection,
        or 0 if value does not implement this interface.
  */
  override bool addRowSelection(int row) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_add_row_selection(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /**
      Gets the caption for the table.
      Returns: a AtkObject* representing the
        table caption, or null if value does not implement this interface.
  */
  override gid.atk1.object.ObjectWrap getCaption() nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_caption(cast(AtkTable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the column at the specified index_.
  
      Params:
        index = a #gint representing an index in table
      Returns: a gint representing the column at the specified index,
        or -1 if the table does not implement this method.
  
      Deprecated: Since 2.12.
  */
  override int getColumnAtIndex(int index) nothrow
  {
    int _retval;
    _retval = atk_table_get_column_at_index(cast(AtkTable*)this._cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified column in the table
  
      Params:
        column = a #gint representing a column in table
      Returns: a gchar* representing the column description, or null
        if value does not implement this interface.
  */
  override string getColumnDescription(int column) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_table_get_column_description(cast(AtkTable*)this._cPtr, column);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of columns occupied by the accessible object
      at the specified row and column in the table.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gint representing the column extent at specified position, or 0
        if value does not implement this interface.
  */
  override int getColumnExtentAt(int row, int column) nothrow
  {
    int _retval;
    _retval = atk_table_get_column_extent_at(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the column header of a specified column in an accessible table.
  
      Params:
        column = a #gint representing a column in the table
      Returns: a AtkObject* representing the
        specified column header, or null if value does not implement this
        interface.
  */
  override gid.atk1.object.ObjectWrap getColumnHeader(int column) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_column_header(cast(AtkTable*)this._cPtr, column);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the index at the specified row and
      column.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a #gint representing the index at specified position.
        The value -1 is returned if the object at row,column is not a child
        of table or table does not implement this interface.
  
      Deprecated: Since 2.12. Use [gid.atk1.table.Table.refAt] in order to get the
        accessible that represents the cell at (row, column)
  */
  override int getIndexAt(int row, int column) nothrow
  {
    int _retval;
    _retval = atk_table_get_index_at(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the number of columns in the table.
      Returns: a gint representing the number of columns, or 0
        if value does not implement this interface.
  */
  override int getNColumns() nothrow
  {
    int _retval;
    _retval = atk_table_get_n_columns(cast(AtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of rows in the table.
      Returns: a gint representing the number of rows, or 0
        if value does not implement this interface.
  */
  override int getNRows() nothrow
  {
    int _retval;
    _retval = atk_table_get_n_rows(cast(AtkTable*)this._cPtr);
    return _retval;
  }

  /**
      Gets a #gint representing the row at the specified index_.
  
      Params:
        index = a #gint representing an index in table
      Returns: a gint representing the row at the specified index,
        or -1 if the table does not implement this method.
  
      Deprecated: since 2.12.
  */
  override int getRowAtIndex(int index) nothrow
  {
    int _retval;
    _retval = atk_table_get_row_at_index(cast(AtkTable*)this._cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified row in the table
  
      Params:
        row = a #gint representing a row in table
      Returns: a gchar* representing the row description, or
        null if value does not implement this interface.
  */
  override string getRowDescription(int row) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_table_get_row_description(cast(AtkTable*)this._cPtr, row);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of rows occupied by the accessible object
      at a specified row and column in the table.
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gint representing the row extent at specified position, or 0
        if value does not implement this interface.
  */
  override int getRowExtentAt(int row, int column) nothrow
  {
    int _retval;
    _retval = atk_table_get_row_extent_at(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Gets the row header of a specified row in an accessible table.
  
      Params:
        row = a #gint representing a row in the table
      Returns: a AtkObject* representing the
        specified row header, or null if value does not implement this
        interface.
  */
  override gid.atk1.object.ObjectWrap getRowHeader(int row) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_row_header(cast(AtkTable*)this._cPtr, row);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selected columns of the table by initializing **selected with
      the selected column numbers. This array should be freed by the caller.
  
      Params:
        selected = a #gint** that is to contain the selected columns numbers
  */
  override void getSelectedColumns(out int[] selected) nothrow
  {
    int* _selected;
    auto _ret_length = atk_table_get_selected_columns(cast(AtkTable*)this._cPtr, &_selected);
    selected.length = _ret_length;
    selected[0 .. $] = (cast(int*)_selected)[0 .. _ret_length];
    gFree(cast(void*)_selected);
  }

  /**
      Gets the selected rows of the table by initializing **selected with
      the selected row numbers. This array should be freed by the caller.
  
      Params:
        selected = a #gint** that is to contain the selected row numbers
  */
  override void getSelectedRows(out int[] selected) nothrow
  {
    int* _selected;
    auto _ret_length = atk_table_get_selected_rows(cast(AtkTable*)this._cPtr, &_selected);
    selected.length = _ret_length;
    selected[0 .. $] = (cast(int*)_selected)[0 .. _ret_length];
    gFree(cast(void*)_selected);
  }

  /**
      Gets the summary description of the table.
      Returns: a AtkObject* representing a summary description
        of the table, or zero if value does not implement this interface.
  */
  override gid.atk1.object.ObjectWrap getSummary() nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_summary(cast(AtkTable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified column
      is selected
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column is selected, or 0
        if value does not implement this interface.
  */
  override bool isColumnSelected(int column) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_is_column_selected(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified row
      is selected
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if the row is selected, or 0
        if value does not implement this interface.
  */
  override bool isRowSelected(int row) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_is_row_selected(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the accessible object
      at the specified row and column is selected
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: a gboolean representing if the cell is selected, or 0
        if value does not implement this interface.
  */
  override bool isSelected(int row, int column) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_is_selected(cast(AtkTable*)this._cPtr, row, column);
    return _retval;
  }

  /**
      Get a reference to the table cell at row, column. This cell
      should implement the interface #AtkTableCell
  
      Params:
        row = a #gint representing a row in table
        column = a #gint representing a column in table
      Returns: an #AtkObject representing the referred
        to accessible
  */
  override gid.atk1.object.ObjectWrap refAt(int row, int column) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_table_ref_at(cast(AtkTable*)this._cPtr, row, column);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds the specified column to the selection.
  
      Params:
        column = a #gint representing a column in table
      Returns: a gboolean representing if the column was successfully removed from
        the selection, or 0 if value does not implement this interface.
  */
  override bool removeColumnSelection(int column) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_remove_column_selection(cast(AtkTable*)this._cPtr, column);
    return _retval;
  }

  /**
      Removes the specified row from the selection.
  
      Params:
        row = a #gint representing a row in table
      Returns: a gboolean representing if the row was successfully removed from
        the selection, or 0 if value does not implement this interface.
  */
  override bool removeRowSelection(int row) nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_table_remove_row_selection(cast(AtkTable*)this._cPtr, row);
    return _retval;
  }

  /**
      Sets the caption for the table.
  
      Params:
        caption = a #AtkObject representing the caption to set for table
  */
  override void setCaption(gid.atk1.object.ObjectWrap caption) nothrow
  {
    atk_table_set_caption(cast(AtkTable*)this._cPtr, caption ? cast(AtkObject*)caption._cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified column of the table.
  
      Params:
        column = a #gint representing a column in table
        description = a #gchar representing the description text
          to set for the specified column of the table
  */
  override void setColumnDescription(int column, string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    atk_table_set_column_description(cast(AtkTable*)this._cPtr, column, _description);
  }

  /**
      Sets the specified column header to header.
  
      Params:
        column = a #gint representing a column in table
        header = an #AtkTable
  */
  override void setColumnHeader(int column, gid.atk1.object.ObjectWrap header) nothrow
  {
    atk_table_set_column_header(cast(AtkTable*)this._cPtr, column, header ? cast(AtkObject*)header._cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified row of table.
  
      Params:
        row = a #gint representing a row in table
        description = a #gchar representing the description text
          to set for the specified row of table
  */
  override void setRowDescription(int row, string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    atk_table_set_row_description(cast(AtkTable*)this._cPtr, row, _description);
  }

  /**
      Sets the specified row header to header.
  
      Params:
        row = a #gint representing a row in table
        header = an #AtkTable
  */
  override void setRowHeader(int row, gid.atk1.object.ObjectWrap header) nothrow
  {
    atk_table_set_row_header(cast(AtkTable*)this._cPtr, row, header ? cast(AtkObject*)header._cPtr(No.Dup) : null);
  }

  /**
      Sets the summary description of the table.
  
      Params:
        accessible = an #AtkObject representing the summary description
          to set for table
  */
  override void setSummary(gid.atk1.object.ObjectWrap accessible) nothrow
  {
    atk_table_set_summary(cast(AtkTable*)this._cPtr, accessible ? cast(AtkObject*)accessible._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ColumnDeleted` signal.
  
      The "column-deleted" signal is emitted by an object which
        implements the AtkTable interface when a column is deleted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, gid.atk1.table.Table table)`
  
          `arg1` The index of the first column deleted. (optional)
  
          `arg2` The number of columns deleted. (optional)
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColumnDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.columnDeleted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-deleted", closure, after);
  }

  /**
      Connect to `ColumnInserted` signal.
  
      The "column-inserted" signal is emitted by an object which
        implements the AtkTable interface when a column is inserted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, gid.atk1.table.Table table)`
  
          `arg1` The index of the column inserted. (optional)
  
          `arg2` The number of colums inserted. (optional)
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColumnInserted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.columnInserted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-inserted", closure, after);
  }

  /**
      Connect to `ColumnReordered` signal.
  
      The "column-reordered" signal is emitted by an object which
        implements the AtkTable interface when the columns are
        reordered.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.table.Table table)`
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectColumnReordered(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.columnReordered");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-reordered", closure, after);
  }

  /**
      Connect to `ModelChanged` signal.
  
      The "model-changed" signal is emitted by an object which
        implements the AtkTable interface when the model displayed by
        the table changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.table.Table table)`
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectModelChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.modelChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("model-changed", closure, after);
  }

  /**
      Connect to `RowDeleted` signal.
  
      The "row-deleted" signal is emitted by an object which
        implements the AtkTable interface when a row is deleted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, gid.atk1.table.Table table)`
  
          `arg1` The index of the first row deleted. (optional)
  
          `arg2` The number of rows deleted. (optional)
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.rowDeleted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-deleted", closure, after);
  }

  /**
      Connect to `RowInserted` signal.
  
      The "row-inserted" signal is emitted by an object which
        implements the AtkTable interface when a row is inserted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, int arg2, gid.atk1.table.Table table)`
  
          `arg1` The index of the first row inserted. (optional)
  
          `arg2` The number of rows inserted. (optional)
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowInserted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.rowInserted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-inserted", closure, after);
  }

  /**
      Connect to `RowReordered` signal.
  
      The "row-reordered" signal is emitted by an object which
        implements the AtkTable interface when the rows are
        reordered.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.table.Table table)`
  
          `table` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowReordered(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.table.Table)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.rowReordered");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-reordered", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.table.Table (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_table_Table(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddColumnSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddRowSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnInserted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnReordered", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaption", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnAtIndex", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnExtentAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeader", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIndexAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNColumns", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNRows", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowAtIndex", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowExtentAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeader", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSummary", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsColumnSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsRowSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncModelChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveColumnSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveRowSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowInserted", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowReordered", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaption", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetColumnDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetColumnHeader", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetRowDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetRowHeader", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSummary", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.table.Table vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_table_Table(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddColumnSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "add_column_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddRowSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "add_row_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "column_deleted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnInserted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "column_inserted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncColumnReordered", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "column_reordered");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaption", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_caption");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnAtIndex", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_column_at_index");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.table.Table.vfuncGetColumnDescription is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnExtentAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_column_extent_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeader", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_column_header");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIndexAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_index_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNColumns", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_n_columns");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNRows", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_n_rows");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowAtIndex", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_row_at_index");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.table.Table.vfuncGetRowDescription is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowExtentAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_row_extent_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeader", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_row_header");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSummary", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "get_summary");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsColumnSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "is_column_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsRowSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "is_row_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "is_selected");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncModelChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "model_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRefAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "ref_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveColumnSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "remove_column_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveRowSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "remove_row_selection");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowDeleted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "row_deleted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowInserted", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "row_inserted");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRowReordered", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "row_reordered");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaption", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_caption");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetColumnDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_column_description");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetColumnHeader", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_column_header");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetRowDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_row_description");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetRowHeader", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_row_header");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSummary", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_table_Table(iface, "set_summary");
  }

  private static void _installIfaceVfunc_gid_atk1_table_Table(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkTableIface*)iface;

    switch (vfunc)
    {
      case "add_column_selection":
      {
        static extern(C) gboolean _vfuncAddColumnSelectionTramp(AtkTable* table, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.addColumnSelection)
              return (cast(typeof(&_vfuncAddColumnSelectionTramp))_klass.addColumnSelection)(table, column);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAddColumnSelection(column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncAddColumnSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addColumnSelection = cast(typeof(_klass.addColumnSelection))&_vfuncAddColumnSelectionTramp;
        break;
      }
      case "add_row_selection":
      {
        static extern(C) gboolean _vfuncAddRowSelectionTramp(AtkTable* table, int row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.addRowSelection)
              return (cast(typeof(&_vfuncAddRowSelectionTramp))_klass.addRowSelection)(table, row);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAddRowSelection(row);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncAddRowSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addRowSelection = cast(typeof(_klass.addRowSelection))&_vfuncAddRowSelectionTramp;
        break;
      }
      case "column_deleted":
      {
        static extern(C) void _vfuncColumnDeletedTramp(AtkTable* table, int column, int numDeleted) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.columnDeleted)
              return (cast(typeof(&_vfuncColumnDeletedTramp))_klass.columnDeleted)(table, column, numDeleted);
            return;
          }

          try
          {
            _obj.vfuncColumnDeleted(column, numDeleted);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncColumnDeleted");
          }
        }

        _klass.columnDeleted = cast(typeof(_klass.columnDeleted))&_vfuncColumnDeletedTramp;
        break;
      }
      case "column_inserted":
      {
        static extern(C) void _vfuncColumnInsertedTramp(AtkTable* table, int column, int numInserted) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.columnInserted)
              return (cast(typeof(&_vfuncColumnInsertedTramp))_klass.columnInserted)(table, column, numInserted);
            return;
          }

          try
          {
            _obj.vfuncColumnInserted(column, numInserted);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncColumnInserted");
          }
        }

        _klass.columnInserted = cast(typeof(_klass.columnInserted))&_vfuncColumnInsertedTramp;
        break;
      }
      case "column_reordered":
      {
        static extern(C) void _vfuncColumnReorderedTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.columnReordered)
              return (cast(typeof(&_vfuncColumnReorderedTramp))_klass.columnReordered)(table);
            return;
          }

          try
          {
            _obj.vfuncColumnReordered();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncColumnReordered");
          }
        }

        _klass.columnReordered = cast(typeof(_klass.columnReordered))&_vfuncColumnReorderedTramp;
        break;
      }
      case "get_caption":
      {
        static extern(C) AtkObject* _vfuncGetCaptionTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getCaption)
              return (cast(typeof(&_vfuncGetCaptionTramp))_klass.getCaption)(table);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetCaption();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetCaption");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getCaption = cast(typeof(_klass.getCaption))&_vfuncGetCaptionTramp;
        break;
      }
      case "get_column_at_index":
      {
        static extern(C) int _vfuncGetColumnAtIndexTramp(AtkTable* table, int index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getColumnAtIndex)
              return (cast(typeof(&_vfuncGetColumnAtIndexTramp))_klass.getColumnAtIndex)(table, index);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetColumnAtIndex(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetColumnAtIndex");
          }
          return _retval;
        }

        _klass.getColumnAtIndex = cast(typeof(_klass.getColumnAtIndex))&_vfuncGetColumnAtIndexTramp;
        break;
      }
      case "get_column_extent_at":
      {
        static extern(C) int _vfuncGetColumnExtentAtTramp(AtkTable* table, int row, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getColumnExtentAt)
              return (cast(typeof(&_vfuncGetColumnExtentAtTramp))_klass.getColumnExtentAt)(table, row, column);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetColumnExtentAt(row, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetColumnExtentAt");
          }
          return _retval;
        }

        _klass.getColumnExtentAt = cast(typeof(_klass.getColumnExtentAt))&_vfuncGetColumnExtentAtTramp;
        break;
      }
      case "get_column_header":
      {
        static extern(C) AtkObject* _vfuncGetColumnHeaderTramp(AtkTable* table, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getColumnHeader)
              return (cast(typeof(&_vfuncGetColumnHeaderTramp))_klass.getColumnHeader)(table, column);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetColumnHeader(column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetColumnHeader");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getColumnHeader = cast(typeof(_klass.getColumnHeader))&_vfuncGetColumnHeaderTramp;
        break;
      }
      case "get_index_at":
      {
        static extern(C) int _vfuncGetIndexAtTramp(AtkTable* table, int row, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getIndexAt)
              return (cast(typeof(&_vfuncGetIndexAtTramp))_klass.getIndexAt)(table, row, column);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetIndexAt(row, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetIndexAt");
          }
          return _retval;
        }

        _klass.getIndexAt = cast(typeof(_klass.getIndexAt))&_vfuncGetIndexAtTramp;
        break;
      }
      case "get_n_columns":
      {
        static extern(C) int _vfuncGetNColumnsTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getNColumns)
              return (cast(typeof(&_vfuncGetNColumnsTramp))_klass.getNColumns)(table);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNColumns();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetNColumns");
          }
          return _retval;
        }

        _klass.getNColumns = cast(typeof(_klass.getNColumns))&_vfuncGetNColumnsTramp;
        break;
      }
      case "get_n_rows":
      {
        static extern(C) int _vfuncGetNRowsTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getNRows)
              return (cast(typeof(&_vfuncGetNRowsTramp))_klass.getNRows)(table);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNRows();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetNRows");
          }
          return _retval;
        }

        _klass.getNRows = cast(typeof(_klass.getNRows))&_vfuncGetNRowsTramp;
        break;
      }
      case "get_row_at_index":
      {
        static extern(C) int _vfuncGetRowAtIndexTramp(AtkTable* table, int index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getRowAtIndex)
              return (cast(typeof(&_vfuncGetRowAtIndexTramp))_klass.getRowAtIndex)(table, index);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetRowAtIndex(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetRowAtIndex");
          }
          return _retval;
        }

        _klass.getRowAtIndex = cast(typeof(_klass.getRowAtIndex))&_vfuncGetRowAtIndexTramp;
        break;
      }
      case "get_row_extent_at":
      {
        static extern(C) int _vfuncGetRowExtentAtTramp(AtkTable* table, int row, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getRowExtentAt)
              return (cast(typeof(&_vfuncGetRowExtentAtTramp))_klass.getRowExtentAt)(table, row, column);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetRowExtentAt(row, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetRowExtentAt");
          }
          return _retval;
        }

        _klass.getRowExtentAt = cast(typeof(_klass.getRowExtentAt))&_vfuncGetRowExtentAtTramp;
        break;
      }
      case "get_row_header":
      {
        static extern(C) AtkObject* _vfuncGetRowHeaderTramp(AtkTable* table, int row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getRowHeader)
              return (cast(typeof(&_vfuncGetRowHeaderTramp))_klass.getRowHeader)(table, row);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetRowHeader(row);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetRowHeader");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getRowHeader = cast(typeof(_klass.getRowHeader))&_vfuncGetRowHeaderTramp;
        break;
      }
      case "get_summary":
      {
        static extern(C) AtkObject* _vfuncGetSummaryTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.getSummary)
              return (cast(typeof(&_vfuncGetSummaryTramp))_klass.getSummary)(table);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetSummary();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncGetSummary");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getSummary = cast(typeof(_klass.getSummary))&_vfuncGetSummaryTramp;
        break;
      }
      case "is_column_selected":
      {
        static extern(C) gboolean _vfuncIsColumnSelectedTramp(AtkTable* table, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.isColumnSelected)
              return (cast(typeof(&_vfuncIsColumnSelectedTramp))_klass.isColumnSelected)(table, column);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsColumnSelected(column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncIsColumnSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isColumnSelected = cast(typeof(_klass.isColumnSelected))&_vfuncIsColumnSelectedTramp;
        break;
      }
      case "is_row_selected":
      {
        static extern(C) gboolean _vfuncIsRowSelectedTramp(AtkTable* table, int row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.isRowSelected)
              return (cast(typeof(&_vfuncIsRowSelectedTramp))_klass.isRowSelected)(table, row);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsRowSelected(row);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncIsRowSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isRowSelected = cast(typeof(_klass.isRowSelected))&_vfuncIsRowSelectedTramp;
        break;
      }
      case "is_selected":
      {
        static extern(C) gboolean _vfuncIsSelectedTramp(AtkTable* table, int row, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.isSelected)
              return (cast(typeof(&_vfuncIsSelectedTramp))_klass.isSelected)(table, row, column);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSelected(row, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncIsSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSelected = cast(typeof(_klass.isSelected))&_vfuncIsSelectedTramp;
        break;
      }
      case "model_changed":
      {
        static extern(C) void _vfuncModelChangedTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.modelChanged)
              return (cast(typeof(&_vfuncModelChangedTramp))_klass.modelChanged)(table);
            return;
          }

          try
          {
            _obj.vfuncModelChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncModelChanged");
          }
        }

        _klass.modelChanged = cast(typeof(_klass.modelChanged))&_vfuncModelChangedTramp;
        break;
      }
      case "ref_at":
      {
        static extern(C) AtkObject* _vfuncRefAtTramp(AtkTable* table, int row, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.refAt)
              return (cast(typeof(&_vfuncRefAtTramp))_klass.refAt)(table, row, column);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncRefAt(row, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRefAt");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.refAt = cast(typeof(_klass.refAt))&_vfuncRefAtTramp;
        break;
      }
      case "remove_column_selection":
      {
        static extern(C) gboolean _vfuncRemoveColumnSelectionTramp(AtkTable* table, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.removeColumnSelection)
              return (cast(typeof(&_vfuncRemoveColumnSelectionTramp))_klass.removeColumnSelection)(table, column);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRemoveColumnSelection(column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRemoveColumnSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.removeColumnSelection = cast(typeof(_klass.removeColumnSelection))&_vfuncRemoveColumnSelectionTramp;
        break;
      }
      case "remove_row_selection":
      {
        static extern(C) gboolean _vfuncRemoveRowSelectionTramp(AtkTable* table, int row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.removeRowSelection)
              return (cast(typeof(&_vfuncRemoveRowSelectionTramp))_klass.removeRowSelection)(table, row);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRemoveRowSelection(row);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRemoveRowSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.removeRowSelection = cast(typeof(_klass.removeRowSelection))&_vfuncRemoveRowSelectionTramp;
        break;
      }
      case "row_deleted":
      {
        static extern(C) void _vfuncRowDeletedTramp(AtkTable* table, int row, int numDeleted) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.rowDeleted)
              return (cast(typeof(&_vfuncRowDeletedTramp))_klass.rowDeleted)(table, row, numDeleted);
            return;
          }

          try
          {
            _obj.vfuncRowDeleted(row, numDeleted);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRowDeleted");
          }
        }

        _klass.rowDeleted = cast(typeof(_klass.rowDeleted))&_vfuncRowDeletedTramp;
        break;
      }
      case "row_inserted":
      {
        static extern(C) void _vfuncRowInsertedTramp(AtkTable* table, int row, int numInserted) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.rowInserted)
              return (cast(typeof(&_vfuncRowInsertedTramp))_klass.rowInserted)(table, row, numInserted);
            return;
          }

          try
          {
            _obj.vfuncRowInserted(row, numInserted);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRowInserted");
          }
        }

        _klass.rowInserted = cast(typeof(_klass.rowInserted))&_vfuncRowInsertedTramp;
        break;
      }
      case "row_reordered":
      {
        static extern(C) void _vfuncRowReorderedTramp(AtkTable* table) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.rowReordered)
              return (cast(typeof(&_vfuncRowReorderedTramp))_klass.rowReordered)(table);
            return;
          }

          try
          {
            _obj.vfuncRowReordered();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncRowReordered");
          }
        }

        _klass.rowReordered = cast(typeof(_klass.rowReordered))&_vfuncRowReorderedTramp;
        break;
      }
      case "set_caption":
      {
        static extern(C) void _vfuncSetCaptionTramp(AtkTable* table, AtkObject* caption) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setCaption)
              return (cast(typeof(&_vfuncSetCaptionTramp))_klass.setCaption)(table, caption);
            return;
          }

          try
          {
            _obj.vfuncSetCaption(gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(void*)caption, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetCaption");
          }
        }

        _klass.setCaption = cast(typeof(_klass.setCaption))&_vfuncSetCaptionTramp;
        break;
      }
      case "set_column_description":
      {
        static extern(C) void _vfuncSetColumnDescriptionTramp(AtkTable* table, int column, const(char)* description) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setColumnDescription)
              return (cast(typeof(&_vfuncSetColumnDescriptionTramp))_klass.setColumnDescription)(table, column, description);
            return;
          }

          string _description = description.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetColumnDescription(column, _description);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetColumnDescription");
          }
        }

        _klass.setColumnDescription = cast(typeof(_klass.setColumnDescription))&_vfuncSetColumnDescriptionTramp;
        break;
      }
      case "set_column_header":
      {
        static extern(C) void _vfuncSetColumnHeaderTramp(AtkTable* table, int column, AtkObject* header) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setColumnHeader)
              return (cast(typeof(&_vfuncSetColumnHeaderTramp))_klass.setColumnHeader)(table, column, header);
            return;
          }

          try
          {
            _obj.vfuncSetColumnHeader(column, gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(void*)header, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetColumnHeader");
          }
        }

        _klass.setColumnHeader = cast(typeof(_klass.setColumnHeader))&_vfuncSetColumnHeaderTramp;
        break;
      }
      case "set_row_description":
      {
        static extern(C) void _vfuncSetRowDescriptionTramp(AtkTable* table, int row, const(char)* description) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setRowDescription)
              return (cast(typeof(&_vfuncSetRowDescriptionTramp))_klass.setRowDescription)(table, row, description);
            return;
          }

          string _description = description.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetRowDescription(row, _description);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetRowDescription");
          }
        }

        _klass.setRowDescription = cast(typeof(_klass.setRowDescription))&_vfuncSetRowDescriptionTramp;
        break;
      }
      case "set_row_header":
      {
        static extern(C) void _vfuncSetRowHeaderTramp(AtkTable* table, int row, AtkObject* header) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setRowHeader)
              return (cast(typeof(&_vfuncSetRowHeaderTramp))_klass.setRowHeader)(table, row, header);
            return;
          }

          try
          {
            _obj.vfuncSetRowHeader(row, gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(void*)header, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetRowHeader");
          }
        }

        _klass.setRowHeader = cast(typeof(_klass.setRowHeader))&_vfuncSetRowHeaderTramp;
        break;
      }
      case "set_summary":
      {
        static extern(C) void _vfuncSetSummaryTramp(AtkTable* table, AtkObject* accessible) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)table);
          if (!_obj)
          {
            auto _klass = cast(AtkTableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)table), gid.atk1.table.Table._getGType);
            if (_klass && _klass.setSummary)
              return (cast(typeof(&_vfuncSetSummaryTramp))_klass.setSummary)(table, accessible);
            return;
          }

          try
          {
            _obj.vfuncSetSummary(gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(void*)accessible, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.table.Table.vfuncSetSummary");
          }
        }

        _klass.setSummary = cast(typeof(_klass.setSummary))&_vfuncSetSummaryTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.table.Table]
template TableGidBuilderT()
{
}
