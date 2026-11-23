/// Module for [CellAccessibleParent] interface mixin
module gid.gtk3.cell_accessible_parent_mixin;

public import gid.core.basictypes;
public import gid.gtk3.cell_accessible_parent_iface_proxy;
public import gid.atk1.object;
public import gid.atk1.relation_set;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gdk3.rectangle;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.cell_accessible;
public import gid.gtk3.types;

/** */
template CellAccessibleParentT()
{

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActivate(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.activate)
      return;

    _klass.activate(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEdit(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.edit)
      return;

    _klass.edit(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncExpandCollapse(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.expandCollapse)
      return;

    _klass.expandCollapse(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetCellArea(gid.gtk3.cell_accessible.CellAccessible cell, out gid.gdk3.rectangle.Rectangle cellRect)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getCellArea)
      return;

    _klass.getCellArea(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(GdkRectangle*)&cellRect);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetCellExtents(gid.gtk3.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getCellExtents)
      return;

    _klass.getCellExtents(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetCellPosition(gid.gtk3.cell_accessible.CellAccessible cell, out int row, out int column)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getCellPosition)
      return;

    _klass.getCellPosition(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&row, cast(int*)&column);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetChildIndex(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getChildIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getChildIndex(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap[] vfuncGetColumnHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getColumnHeaderCells)
      return typeof(return).init;

    GPtrArray* _cretval;
    _cretval = _klass.getColumnHeaderCells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.CellRendererState vfuncGetRendererState(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getRendererState)
      return typeof(return).init;

    GtkCellRendererState _cretval;
    _cretval = _klass.getRendererState(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    gid.gtk3.types.CellRendererState _retval = cast(gid.gtk3.types.CellRendererState)_cretval;
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.object.ObjectWrap[] vfuncGetRowHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.getRowHeaderCells)
      return typeof(return).init;

    GPtrArray* _cretval;
    _cretval = _klass.getRowHeaderCells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCellAccessibleParentGrabFocus(gid.gtk3.cell_accessible.CellAccessible cell)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.grabFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.grabFocus(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUpdateRelationset(gid.gtk3.cell_accessible.CellAccessible cell, gid.atk1.relation_set.RelationSet relationset)
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
    if (!_klass || !_klass.updateRelationset)
      return;

    _klass.updateRelationset(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, relationset ? cast(AtkRelationSet*)relationset._cPtr(No.Dup) : null);
  }

  /** */
  override void activate(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_activate(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void edit(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_edit(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void expandCollapse(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    gtk_cell_accessible_parent_expand_collapse(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
  }

  /** */
  override void getCellArea(gid.gtk3.cell_accessible.CellAccessible cell, out gid.gdk3.rectangle.Rectangle cellRect) nothrow
  {
    gtk_cell_accessible_parent_get_cell_area(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(GdkRectangle*)&cellRect);
  }

  /** */
  override void getCellExtents(gid.gtk3.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, gid.atk1.types.CoordType coordType) nothrow
  {
    gtk_cell_accessible_parent_get_cell_extents(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /** */
  override void getCellPosition(gid.gtk3.cell_accessible.CellAccessible cell, out int row, out int column) nothrow
  {
    gtk_cell_accessible_parent_get_cell_position(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, cast(int*)&row, cast(int*)&column);
  }

  /** */
  override int getChildIndex(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    int _retval;
    _retval = gtk_cell_accessible_parent_get_child_index(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override gid.atk1.object.ObjectWrap[] getColumnHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_column_header_cells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override gid.gtk3.types.CellRendererState getRendererState(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GtkCellRendererState _cretval;
    _cretval = gtk_cell_accessible_parent_get_renderer_state(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    gid.gtk3.types.CellRendererState _retval = cast(gid.gtk3.types.CellRendererState)_cretval;
    return _retval;
  }

  /** */
  override gid.atk1.object.ObjectWrap[] getRowHeaderCells(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_row_header_cells(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    auto _retval = gPtrArrayToD!(gid.atk1.object.ObjectWrap, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override bool grabFocus(gid.gtk3.cell_accessible.CellAccessible cell) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_accessible_parent_grab_focus(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override void updateRelationset(gid.gtk3.cell_accessible.CellAccessible cell, gid.atk1.relation_set.RelationSet relationset) nothrow
  {
    gtk_cell_accessible_parent_update_relationset(cast(GtkCellAccessibleParent*)this._cPtr, cell ? cast(GtkCellAccessible*)cell._cPtr(No.Dup) : null, relationset ? cast(AtkRelationSet*)relationset._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.cell_accessible_parent.CellAccessibleParent (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_cell_accessible_parent_CellAccessibleParent(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEdit", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncExpandCollapse", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellArea", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildIndex", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRendererState", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCellAccessibleParentGrabFocus", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUpdateRelationset", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.cell_accessible_parent.CellAccessibleParent vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_cell_accessible_parent_CellAccessibleParent(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "activate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEdit", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "edit");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncExpandCollapse", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "expand_collapse");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellArea", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_cell_area");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_cell_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCellPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_cell_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetChildIndex", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_child_index");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetColumnHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_column_header_cells");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRendererState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_renderer_state");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetRowHeaderCells", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "get_row_header_cells");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCellAccessibleParentGrabFocus", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "grab_focus");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUpdateRelationset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(iface, "update_relationset");
  }

  private static void _installIfaceVfunc_gid_gtk3_cell_accessible_parent_CellAccessibleParent(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellAccessibleParentIface*)iface;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(parent, cell);
            return;
          }

          try
          {
            _obj.vfuncActivate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "edit":
      {
        static extern(C) void _vfuncEditTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.edit)
              return (cast(typeof(&_vfuncEditTramp))_klass.edit)(parent, cell);
            return;
          }

          try
          {
            _obj.vfuncEdit(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncEdit");
          }
        }

        _klass.edit = cast(typeof(_klass.edit))&_vfuncEditTramp;
        break;
      }
      case "expand_collapse":
      {
        static extern(C) void _vfuncExpandCollapseTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.expandCollapse)
              return (cast(typeof(&_vfuncExpandCollapseTramp))_klass.expandCollapse)(parent, cell);
            return;
          }

          try
          {
            _obj.vfuncExpandCollapse(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncExpandCollapse");
          }
        }

        _klass.expandCollapse = cast(typeof(_klass.expandCollapse))&_vfuncExpandCollapseTramp;
        break;
      }
      case "get_cell_area":
      {
        static extern(C) void _vfuncGetCellAreaTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, GdkRectangle* cellRect) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getCellArea)
              return (cast(typeof(&_vfuncGetCellAreaTramp))_klass.getCellArea)(parent, cell, cellRect);
            return;
          }

          try
          {
            _obj.vfuncGetCellArea(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take), *cast(gid.gdk3.rectangle.Rectangle*)cellRect);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetCellArea");
          }
        }

        _klass.getCellArea = cast(typeof(_klass.getCellArea))&_vfuncGetCellAreaTramp;
        break;
      }
      case "get_cell_extents":
      {
        static extern(C) void _vfuncGetCellExtentsTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, int* x, int* y, int* width, int* height, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getCellExtents)
              return (cast(typeof(&_vfuncGetCellExtentsTramp))_klass.getCellExtents)(parent, cell, x, y, width, height, coordType);
            return;
          }

          try
          {
            _obj.vfuncGetCellExtents(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take), *x, *y, *width, *height, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetCellExtents");
          }
        }

        _klass.getCellExtents = cast(typeof(_klass.getCellExtents))&_vfuncGetCellExtentsTramp;
        break;
      }
      case "get_cell_position":
      {
        static extern(C) void _vfuncGetCellPositionTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, int* row, int* column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getCellPosition)
              return (cast(typeof(&_vfuncGetCellPositionTramp))_klass.getCellPosition)(parent, cell, row, column);
            return;
          }

          try
          {
            _obj.vfuncGetCellPosition(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take), *row, *column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetCellPosition");
          }
        }

        _klass.getCellPosition = cast(typeof(_klass.getCellPosition))&_vfuncGetCellPositionTramp;
        break;
      }
      case "get_child_index":
      {
        static extern(C) int _vfuncGetChildIndexTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getChildIndex)
              return (cast(typeof(&_vfuncGetChildIndexTramp))_klass.getChildIndex)(parent, cell);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetChildIndex(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetChildIndex");
          }
          return _retval;
        }

        _klass.getChildIndex = cast(typeof(_klass.getChildIndex))&_vfuncGetChildIndexTramp;
        break;
      }
      case "get_column_header_cells":
      {
        static extern(C) GPtrArray* _vfuncGetColumnHeaderCellsTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getColumnHeaderCells)
              return (cast(typeof(&_vfuncGetColumnHeaderCellsTramp))_klass.getColumnHeaderCells)(parent, cell);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetColumnHeaderCells(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetColumnHeaderCells");
          }
          auto _retval = gPtrArrayFromD!(gid.atk1.object.ObjectWrap, false)(_dretval);

          return _retval;
        }

        _klass.getColumnHeaderCells = cast(typeof(_klass.getColumnHeaderCells))&_vfuncGetColumnHeaderCellsTramp;
        break;
      }
      case "get_renderer_state":
      {
        static extern(C) GtkCellRendererState _vfuncGetRendererStateTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getRendererState)
              return (cast(typeof(&_vfuncGetRendererStateTramp))_klass.getRendererState)(parent, cell);
            return typeof(return).init;
          }

          gid.gtk3.types.CellRendererState _dretval;

          try
          {
            _dretval = _obj.vfuncGetRendererState(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetRendererState");
          }
          auto _retval = cast(GtkCellRendererState)_dretval;

          return _retval;
        }

        _klass.getRendererState = cast(typeof(_klass.getRendererState))&_vfuncGetRendererStateTramp;
        break;
      }
      case "get_row_header_cells":
      {
        static extern(C) GPtrArray* _vfuncGetRowHeaderCellsTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.getRowHeaderCells)
              return (cast(typeof(&_vfuncGetRowHeaderCellsTramp))_klass.getRowHeaderCells)(parent, cell);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetRowHeaderCells(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncGetRowHeaderCells");
          }
          auto _retval = gPtrArrayFromD!(gid.atk1.object.ObjectWrap, false)(_dretval);

          return _retval;
        }

        _klass.getRowHeaderCells = cast(typeof(_klass.getRowHeaderCells))&_vfuncGetRowHeaderCellsTramp;
        break;
      }
      case "grab_focus":
      {
        static extern(C) gboolean _vfuncCellAccessibleParentGrabFocusTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.grabFocus)
              return (cast(typeof(&_vfuncCellAccessibleParentGrabFocusTramp))_klass.grabFocus)(parent, cell);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCellAccessibleParentGrabFocus(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncCellAccessibleParentGrabFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.grabFocus = cast(typeof(_klass.grabFocus))&_vfuncCellAccessibleParentGrabFocusTramp;
        break;
      }
      case "update_relationset":
      {
        static extern(C) void _vfuncUpdateRelationsetTramp(GtkCellAccessibleParent* parent, GtkCellAccessible* cell, AtkRelationSet* relationset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)parent);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleParentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)parent), gid.gtk3.cell_accessible_parent.CellAccessibleParent._getGType);
            if (_klass && _klass.updateRelationset)
              return (cast(typeof(&_vfuncUpdateRelationsetTramp))_klass.updateRelationset)(parent, cell, relationset);
            return;
          }

          try
          {
            _obj.vfuncUpdateRelationset(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_accessible.CellAccessible)(cast(void*)cell, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.relation_set.RelationSet)(cast(void*)relationset, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible_parent.CellAccessibleParent.vfuncUpdateRelationset");
          }
        }

        _klass.updateRelationset = cast(typeof(_klass.updateRelationset))&_vfuncUpdateRelationsetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_accessible_parent.CellAccessibleParent]
template CellAccessibleParentGidBuilderT()
{
}
