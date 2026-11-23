/// Module for [CellLayout] interface mixin
module gid.gtk3.cell_layout_mixin;

public import gid.core.basictypes;
public import gid.gtk3.cell_layout_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.cell_area;
public import gid.gtk3.cell_renderer;
public import gid.gtk3.tree_iter;
public import gid.gtk3.tree_model;
public import gid.gtk3.types;

/**
    #GtkCellLayout is an interface to be implemented by all objects which
    want to provide a #GtkTreeViewColumn like API for packing cells,
    setting attributes and data funcs.
    
    One of the notable features provided by implementations of
    GtkCellLayout are attributes. Attributes let you set the properties
    in flexible ways. They can just be set to constant values like regular
    properties. But they can also be mapped to a column of the underlying
    tree model with [gid.gtk4.cell_layout.CellLayout.setAttributes], which means that the value
    of the attribute can change from cell to cell as they are rendered by
    the cell renderer. Finally, it is possible to specify a function with
    [gid.gtk4.cell_layout.CellLayout.setCellDataFunc] that is called to determine the
    value of the attribute for each cell that is rendered.
    
    # GtkCellLayouts as GtkBuildable
    
    Implementations of GtkCellLayout which also implement the GtkBuildable
    interface (#GtkCellView, #GtkIconView, #GtkComboBox,
    #GtkEntryCompletion, #GtkTreeViewColumn) accept GtkCellRenderer objects
    as `<child>` elements in UI definitions. They support a custom `<attributes>`
    element for their children, which can contain multiple `<attribute>`
    elements. Each `<attribute>` element has a name attribute which specifies
    a property of the cell renderer; the content of the element is the
    attribute value.
    
    This is an example of a UI definition fragment specifying attributes:
    
    ```xml
    <object class="GtkCellView">
      <child>
        <object class="GtkCellRendererText"/>
        <attributes>
          <attribute name="text">0</attribute>
        </attributes>
      </child>
    </object>
    ```
    
    Furthermore for implementations of GtkCellLayout that use a #GtkCellArea
    to lay out cells (all GtkCellLayouts in GTK+ use a GtkCellArea)
    [cell properties][cell-properties] can also be defined in the format by
    specifying the custom `<cell-packing>` attribute which can contain multiple
    `<property>` elements defined in the normal way.
    
    Here is a UI definition fragment specifying cell properties:
    
    ```xml
    <object class="GtkTreeViewColumn">
      <child>
        <object class="GtkCellRendererText"/>
        <cell-packing>
          <property name="align">True</property>
          <property name="expand">False</property>
        </cell-packing>
      </child>
    </object>
    ```
    
    # Subclassing GtkCellLayout implementations
    
    When subclassing a widget that implements #GtkCellLayout like
    #GtkIconView or #GtkComboBox, there are some considerations related
    to the fact that these widgets internally use a #GtkCellArea.
    The cell area is exposed as a construct-only property by these
    widgets. This means that it is possible to e.g. do
    
    ```c
    combo = g_object_new (GTK_TYPE_COMBO_BOX, "cell-area", my_cell_area, NULL);
    ```
    
    to use a custom cell area with a combo box. But construct properties
    are only initialized after instance init()
    functions have run, which means that using functions which rely on
    the existence of the cell area in your subclass’ init() function will
    cause the default cell area to be instantiated. In this case, a provided
    construct property value will be ignored (with a warning, to alert
    you to the problem).
    
    ```c
    static void
    my_combo_box_init (MyComboBox *b)
    {
      GtkCellRenderer *cell;
    
      cell = gtk_cell_renderer_pixbuf_new ();
      // The following call causes the default cell area for combo boxes,
      // a GtkCellAreaBox, to be instantiated
      gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (b), cell, FALSE);
      ...
    }
    
    GtkWidget *
    my_combo_box_new (GtkCellArea *area)
    {
      // This call is going to cause a warning about area being ignored
      return g_object_new (MY_TYPE_COMBO_BOX, "cell-area", area, NULL);
    }
    ```
    
    If supporting alternative cell areas with your derived widget is
    not important, then this does not have to concern you. If you want
    to support alternative cell areas, you can do so by moving the
    problematic calls out of init() and into a constructor()
    for your class.
*/
template CellLayoutT()
{

  /**
      Adds an attribute mapping to the list in cell_layout.
      
      The column is the column of the model to get a value from, and the
      attribute is the parameter on cell to be set from the value. So for
      example if column 2 of the model contains strings, you could have the
      “text” attribute of a #GtkCellRendererText get its values from column 2.
  
      Params:
        cell = a #GtkCellRenderer
        attribute = an attribute on the renderer
        column = the column position on the model to get the attribute from
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddAttribute`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddAttribute(gid.gtk3.cell_renderer.CellRenderer cell, string attribute, int column)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.addAttribute)
      return;

    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _klass.addAttribute(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, _attribute, column);
  }

  /**
      Unsets all the mappings on all renderers on cell_layout and
      removes all renderers from cell_layout.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncClear`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncClear()
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.clear)
      return;

    _klass.clear(cast(GtkCellLayout*)this._cPtr);
  }

  /**
      Clears all existing attributes previously set with
      [gid.gtk4.cell_layout.CellLayout.setAttributes].
  
      Params:
        cell = a #GtkCellRenderer to clear the attribute mapping on
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncClearAttributes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncClearAttributes(gid.gtk3.cell_renderer.CellRenderer cell)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.clearAttributes)
      return;

    _klass.clearAttributes(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      Returns the underlying #GtkCellArea which might be cell_layout
      if called on a #GtkCellArea or might be null if no #GtkCellArea
      is used by cell_layout.
      Returns: the cell area used by cell_layout,
        or null in case no cell area is used.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetArea`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.cell_area.CellArea vfuncGetArea()
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.getArea)
      return typeof(return).init;

    GtkCellArea* _cretval;
    _cretval = _klass.getArea(cast(GtkCellLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_area.CellArea)(cast(GtkCellArea*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the cell renderers which have been added to cell_layout.
      Returns: a list of cell renderers. The list, but not the renderers has
            been newly allocated and should be freed with [gid.glib2.list.List.free]
            when no longer needed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCells`
      to chain up from an override.
      Overriding it from D is not supported (callback return container type 'List' ownership 'Container' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.cell_renderer.CellRenderer[] vfuncGetCells()
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.getCells)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getCells(cast(GtkCellLayout*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.cell_renderer.CellRenderer, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Adds the cell to the end of cell_layout. If expand is false, then the
      cell is allocated no more space than it needs. Any unused space is
      divided evenly between cells for which expand is true.
      
      Note that reusing the same cell renderer is not supported.
  
      Params:
        cell = a #GtkCellRenderer
        expand = true if cell is to be given extra space allocated to cell_layout
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPackEnd`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPackEnd(gid.gtk3.cell_renderer.CellRenderer cell, bool expand)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.packEnd)
      return;

    _klass.packEnd(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Packs the cell into the beginning of cell_layout. If expand is false,
      then the cell is allocated no more space than it needs. Any unused space
      is divided evenly between cells for which expand is true.
      
      Note that reusing the same cell renderer is not supported.
  
      Params:
        cell = a #GtkCellRenderer
        expand = true if cell is to be given extra space allocated to cell_layout
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPackStart`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPackStart(gid.gtk3.cell_renderer.CellRenderer cell, bool expand)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.packStart)
      return;

    _klass.packStart(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Re-inserts cell at position.
      
      Note that cell has already to be packed into cell_layout
      for this to function properly.
  
      Params:
        cell = a #GtkCellRenderer to reorder
        position = new position to insert cell at
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReorder`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncReorder(gid.gtk3.cell_renderer.CellRenderer cell, int position)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.reorder)
      return;

    _klass.reorder(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the #GtkCellLayoutDataFunc to use for cell_layout.
      
      This function is used instead of the standard attributes mapping
      for setting the column value, and should set the value of cell_layout’s
      cell renderer(s) as appropriate.
      
      func may be null to remove a previously set function.
  
      Params:
        cell = a #GtkCellRenderer
        func = the #GtkCellLayoutDataFunc to use, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCellDataFunc`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'func' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetCellDataFunc(gid.gtk3.cell_renderer.CellRenderer cell, gid.gtk3.types.CellLayoutDataFunc func = null)
  {
    auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.cell_layout.CellLayout._getGType);
    if (!_klass || !_klass.setCellDataFunc)
      return;

    extern(C) void _funcCallback(GtkCellLayout* cellLayout, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.CellLayoutDataFunc*)data;
      auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_layout.CellLayout)(cast(void*)cellLayout, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)treeModel, No.Take), _iter);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.CellLayoutDataFunc");
      }
      if (_iter)
        _iter._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _klass.setCellDataFunc(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Adds an attribute mapping to the list in cell_layout.
      
      The column is the column of the model to get a value from, and the
      attribute is the parameter on cell to be set from the value. So for
      example if column 2 of the model contains strings, you could have the
      “text” attribute of a #GtkCellRendererText get its values from column 2.
  
      Params:
        cell = a #GtkCellRenderer
        attribute = an attribute on the renderer
        column = the column position on the model to get the attribute from
  */
  override void addAttribute(gid.gtk3.cell_renderer.CellRenderer cell, string attribute, int column) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    gtk_cell_layout_add_attribute(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, _attribute, column);
  }

  /**
      Unsets all the mappings on all renderers on cell_layout and
      removes all renderers from cell_layout.
  */
  override void clear() nothrow
  {
    gtk_cell_layout_clear(cast(GtkCellLayout*)this._cPtr);
  }

  /**
      Clears all existing attributes previously set with
      [gid.gtk4.cell_layout.CellLayout.setAttributes].
  
      Params:
        cell = a #GtkCellRenderer to clear the attribute mapping on
  */
  override void clearAttributes(gid.gtk3.cell_renderer.CellRenderer cell) nothrow
  {
    gtk_cell_layout_clear_attributes(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      Returns the underlying #GtkCellArea which might be cell_layout
      if called on a #GtkCellArea or might be null if no #GtkCellArea
      is used by cell_layout.
      Returns: the cell area used by cell_layout,
        or null in case no cell area is used.
  */
  override gid.gtk3.cell_area.CellArea getArea() nothrow
  {
    GtkCellArea* _cretval;
    _cretval = gtk_cell_layout_get_area(cast(GtkCellLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_area.CellArea)(cast(GtkCellArea*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the cell renderers which have been added to cell_layout.
      Returns: a list of cell renderers. The list, but not the renderers has
            been newly allocated and should be freed with [gid.glib2.list.List.free]
            when no longer needed.
  */
  override gid.gtk3.cell_renderer.CellRenderer[] getCells() nothrow
  {
    GList* _cretval;
    _cretval = gtk_cell_layout_get_cells(cast(GtkCellLayout*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.cell_renderer.CellRenderer, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Adds the cell to the end of cell_layout. If expand is false, then the
      cell is allocated no more space than it needs. Any unused space is
      divided evenly between cells for which expand is true.
      
      Note that reusing the same cell renderer is not supported.
  
      Params:
        cell = a #GtkCellRenderer
        expand = true if cell is to be given extra space allocated to cell_layout
  */
  override void packEnd(gid.gtk3.cell_renderer.CellRenderer cell, bool expand) nothrow
  {
    gtk_cell_layout_pack_end(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Packs the cell into the beginning of cell_layout. If expand is false,
      then the cell is allocated no more space than it needs. Any unused space
      is divided evenly between cells for which expand is true.
      
      Note that reusing the same cell renderer is not supported.
  
      Params:
        cell = a #GtkCellRenderer
        expand = true if cell is to be given extra space allocated to cell_layout
  */
  override void packStart(gid.gtk3.cell_renderer.CellRenderer cell, bool expand) nothrow
  {
    gtk_cell_layout_pack_start(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Re-inserts cell at position.
      
      Note that cell has already to be packed into cell_layout
      for this to function properly.
  
      Params:
        cell = a #GtkCellRenderer to reorder
        position = new position to insert cell at
  */
  override void reorder(gid.gtk3.cell_renderer.CellRenderer cell, int position) nothrow
  {
    gtk_cell_layout_reorder(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the #GtkCellLayoutDataFunc to use for cell_layout.
      
      This function is used instead of the standard attributes mapping
      for setting the column value, and should set the value of cell_layout’s
      cell renderer(s) as appropriate.
      
      func may be null to remove a previously set function.
  
      Params:
        cell = a #GtkCellRenderer
        func = the #GtkCellLayoutDataFunc to use, or null
  */
  override void setCellDataFunc(gid.gtk3.cell_renderer.CellRenderer cell, gid.gtk3.types.CellLayoutDataFunc func = null) nothrow
  {
    extern(C) void _funcCallback(GtkCellLayout* cellLayout, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.CellLayoutDataFunc*)data;
      auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_layout.CellLayout)(cast(void*)cellLayout, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)treeModel, No.Take), _iter);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.CellLayoutDataFunc");
      }
      if (_iter)
        _iter._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_cell_layout_set_cell_data_func(cast(GtkCellLayout*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.cell_layout.CellLayout (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_cell_layout_CellLayout(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClear", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetArea", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCells", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPackEnd", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPackStart", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReorder", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCellDataFunc", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.cell_layout.CellLayout vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_cell_layout_CellLayout(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddAttribute", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "add_attribute");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClear", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "clear");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "clear_attributes");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetArea", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "get_area");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCells", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.cell_layout.CellLayout.vfuncGetCells is not supported: callback return container type 'List' ownership 'Container' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPackEnd", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "pack_end");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPackStart", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "pack_start");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReorder", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(iface, "reorder");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCellDataFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.cell_layout.CellLayout.vfuncSetCellDataFunc is not supported: parameter 'func' of kind 'Callback' is not supported");
  }

  private static void _installIfaceVfunc_gid_gtk3_cell_layout_CellLayout(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellLayoutIface*)iface;

    switch (vfunc)
    {
      case "add_attribute":
      {
        static extern(C) void _vfuncAddAttributeTramp(GtkCellLayout* cellLayout, GtkCellRenderer* cell, const(char)* attribute, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.addAttribute)
              return (cast(typeof(&_vfuncAddAttributeTramp))_klass.addAttribute)(cellLayout, cell, attribute, column);
            return;
          }

          string _attribute = attribute.fromCString!(No.Free);

          try
          {
            _obj.vfuncAddAttribute(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), _attribute, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncAddAttribute");
          }
        }

        _klass.addAttribute = cast(typeof(_klass.addAttribute))&_vfuncAddAttributeTramp;
        break;
      }
      case "clear":
      {
        static extern(C) void _vfuncClearTramp(GtkCellLayout* cellLayout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.clear)
              return (cast(typeof(&_vfuncClearTramp))_klass.clear)(cellLayout);
            return;
          }

          try
          {
            _obj.vfuncClear();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncClear");
          }
        }

        _klass.clear = cast(typeof(_klass.clear))&_vfuncClearTramp;
        break;
      }
      case "clear_attributes":
      {
        static extern(C) void _vfuncClearAttributesTramp(GtkCellLayout* cellLayout, GtkCellRenderer* cell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.clearAttributes)
              return (cast(typeof(&_vfuncClearAttributesTramp))_klass.clearAttributes)(cellLayout, cell);
            return;
          }

          try
          {
            _obj.vfuncClearAttributes(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncClearAttributes");
          }
        }

        _klass.clearAttributes = cast(typeof(_klass.clearAttributes))&_vfuncClearAttributesTramp;
        break;
      }
      case "get_area":
      {
        static extern(C) GtkCellArea* _vfuncGetAreaTramp(GtkCellLayout* cellLayout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.getArea)
              return (cast(typeof(&_vfuncGetAreaTramp))_klass.getArea)(cellLayout);
            return typeof(return).init;
          }

          gid.gtk3.cell_area.CellArea _dretval;

          try
          {
            _dretval = _obj.vfuncGetArea();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncGetArea");
          }
          auto _retval = _dretval ? cast(GtkCellArea*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getArea = cast(typeof(_klass.getArea))&_vfuncGetAreaTramp;
        break;
      }
      case "pack_end":
      {
        static extern(C) void _vfuncPackEndTramp(GtkCellLayout* cellLayout, GtkCellRenderer* cell, gboolean expand) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.packEnd)
              return (cast(typeof(&_vfuncPackEndTramp))_klass.packEnd)(cellLayout, cell, expand);
            return;
          }

          try
          {
            _obj.vfuncPackEnd(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), cast(bool)expand);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncPackEnd");
          }
        }

        _klass.packEnd = cast(typeof(_klass.packEnd))&_vfuncPackEndTramp;
        break;
      }
      case "pack_start":
      {
        static extern(C) void _vfuncPackStartTramp(GtkCellLayout* cellLayout, GtkCellRenderer* cell, gboolean expand) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.packStart)
              return (cast(typeof(&_vfuncPackStartTramp))_klass.packStart)(cellLayout, cell, expand);
            return;
          }

          try
          {
            _obj.vfuncPackStart(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), cast(bool)expand);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncPackStart");
          }
        }

        _klass.packStart = cast(typeof(_klass.packStart))&_vfuncPackStartTramp;
        break;
      }
      case "reorder":
      {
        static extern(C) void _vfuncReorderTramp(GtkCellLayout* cellLayout, GtkCellRenderer* cell, int position) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cellLayout);
          if (!_obj)
          {
            auto _klass = cast(GtkCellLayoutIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cellLayout), gid.gtk3.cell_layout.CellLayout._getGType);
            if (_klass && _klass.reorder)
              return (cast(typeof(&_vfuncReorderTramp))_klass.reorder)(cellLayout, cell, position);
            return;
          }

          try
          {
            _obj.vfuncReorder(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_layout.CellLayout.vfuncReorder");
          }
        }

        _klass.reorder = cast(typeof(_klass.reorder))&_vfuncReorderTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_layout.CellLayout]
template CellLayoutGidBuilderT()
{
}
