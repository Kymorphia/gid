/// Module for [ComboBox] class
module gtk.combo_box;

import gdk.device;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;
import gtk.widget;

/**
    A [gtk.combo_box.ComboBox] is a widget that allows the user to choose from a list of
    valid choices.
    
    ![An example GtkComboBox](combo-box.png)
    
    The [gtk.combo_box.ComboBox] displays the selected choice; when activated, the
    [gtk.combo_box.ComboBox] displays a popup which allows the user to make a new choice.
    
    The [gtk.combo_box.ComboBox] uses the model-view pattern; the list of valid choices
    is specified in the form of a tree model, and the display of the choices
    can be adapted to the data in the model by using cell renderers, as you
    would in a tree view. This is possible since [gtk.combo_box.ComboBox] implements the
    [gtk.cell_layout.CellLayout] interface. The tree model holding the valid
    choices is not restricted to a flat list, it can be a real tree, and the
    popup will reflect the tree structure.
    
    To allow the user to enter values not in the model, the
    `property@Gtk.ComboBox:has-entry` property allows the [gtk.combo_box.ComboBox] to
    contain a [gtk.entry.Entry]. This entry can be accessed by calling
    [gtk.combo_box.ComboBox.getChild] on the combo box.
    
    For a simple list of textual choices, the model-view API of [gtk.combo_box.ComboBox]
    can be a bit overwhelming. In this case, [gtk.combo_box_text.ComboBoxText] offers
    a simple alternative. Both [gtk.combo_box.ComboBox] and [gtk.combo_box_text.ComboBoxText] can contain
    an entry.
    
    ## CSS nodes
    
    ```
    combobox
    ├── box.linked
    │   ╰── button.combo
    │       ╰── box
    │           ├── cellview
    │           ╰── arrow
    ╰── window.popup
    ```
    
    A normal combobox contains a box with the .linked class, a button
    with the .combo class and inside those buttons, there are a cellview and
    an arrow.
    
    ```
    combobox
    ├── box.linked
    │   ├── entry.combo
    │   ╰── button.combo
    │       ╰── box
    │           ╰── arrow
    ╰── window.popup
    ```
    
    A [gtk.combo_box.ComboBox] with an entry has a single CSS node with name combobox.
    It contains a box with the .linked class. That box contains an entry and
    a button, both with the .combo class added. The button also contains another
    node with name arrow.
    
    ## Accessibility
    
    [gtk.combo_box.ComboBox] uses the [gtk.types.AccessibleRole.ComboBox] role.

    Deprecated: Use [gtk.drop_down.DropDown] instead
*/
class ComboBox : gtk.widget.Widget, gtk.cell_editable.CellEditable, gtk.cell_layout.CellLayout
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
    return cast(void function())gtk_combo_box_get_type != &gidSymbolNotFound ? gtk_combo_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ComboBox self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: The item which is currently active.
        
        If the model is a non-flat treemodel, and the active item is not an
        immediate child of the root of the tree, this property has the value
        `gtk_tree_path_get_indices (path)[0]`, where `path` is the
        [gtk.tree_path.TreePath] of the active item.
  */
  @property int active()
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = The item which is currently active.
          
          If the model is a non-flat treemodel, and the active item is not an
          immediate child of the root of the tree, this property has the value
          `gtk_tree_path_get_indices (path)[0]`, where `path` is the
          [gtk.tree_path.TreePath] of the active item.
  */
  @property void active(int propval)
  {
    return setActive(propval);
  }

  /**
      Get `activeId` property.
      Returns: The value of the ID column of the active row.
  */
  @property string activeId()
  {
    return getActiveId();
  }

  /**
      Set `activeId` property.
      Params:
        propval = The value of the ID column of the active row.
  */
  @property void activeId(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("active-id", propval);
  }

  /**
      Get `buttonSensitivity` property.
      Returns: Whether the dropdown button is sensitive when
        the model is empty.
  */
  @property gtk.types.SensitivityType buttonSensitivity()
  {
    return getButtonSensitivity();
  }

  /**
      Set `buttonSensitivity` property.
      Params:
        propval = Whether the dropdown button is sensitive when
          the model is empty.
  */
  @property void buttonSensitivity(gtk.types.SensitivityType propval)
  {
    return setButtonSensitivity(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `entryTextColumn` property.
      Returns: The model column to associate with strings from the entry.
        
        This is property only relevant if the combo was created with
        `property@Gtk.ComboBox:has-entry` is true.
  */
  @property int entryTextColumn()
  {
    return getEntryTextColumn();
  }

  /**
      Set `entryTextColumn` property.
      Params:
        propval = The model column to associate with strings from the entry.
          
          This is property only relevant if the combo was created with
          `property@Gtk.ComboBox:has-entry` is true.
  */
  @property void entryTextColumn(int propval)
  {
    return setEntryTextColumn(propval);
  }

  /**
      Get `hasFrame` property.
      Returns: The `has-frame` property controls whether a frame is drawn around the entry.
  */
  @property bool hasFrame()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("has-frame");
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = The `has-frame` property controls whether a frame is drawn around the entry.
  */
  @property void hasFrame(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("has-frame", propval);
  }

  /**
      Get `idColumn` property.
      Returns: The model column that provides string IDs for the values
        in the model, if != -1.
  */
  @property int idColumn()
  {
    return getIdColumn();
  }

  /**
      Set `idColumn` property.
      Params:
        propval = The model column that provides string IDs for the values
          in the model, if != -1.
  */
  @property void idColumn(int propval)
  {
    return setIdColumn(propval);
  }

  /**
      Get `model` property.
      Returns: The model from which the combo box takes its values.
  */
  @property gtk.tree_model.TreeModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model from which the combo box takes its values.
  */
  @property void model(gtk.tree_model.TreeModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `popupFixedWidth` property.
      Returns: Whether the popup's width should be a fixed width matching the
        allocated width of the combo box.
  */
  @property bool popupFixedWidth()
  {
    return getPopupFixedWidth();
  }

  /**
      Set `popupFixedWidth` property.
      Params:
        propval = Whether the popup's width should be a fixed width matching the
          allocated width of the combo box.
  */
  @property void popupFixedWidth(bool propval)
  {
    return setPopupFixedWidth(propval);
  }

  /**
      Get `popupShown` property.
      Returns: Whether the combo boxes dropdown is popped up.
        
        Note that this property is mainly useful, because
        it allows you to connect to notify::popup-shown.
  */
  @property bool popupShown()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("popup-shown");
  }

  mixin CellEditableT!();
  mixin CellLayoutT!();

  /**
      Creates a new empty [gtk.combo_box.ComboBox].
      Returns: A new [gtk.combo_box.ComboBox]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new empty [gtk.combo_box.ComboBox] with an entry.
      
      In order to use a combo box with entry, you need to tell it
      which column of the model contains the text for the entry
      by calling [gtk.combo_box.ComboBox.setEntryTextColumn].
      Returns: A new [gtk.combo_box.ComboBox]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  static gtk.combo_box.ComboBox newWithEntry()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_entry();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.combo_box.ComboBox] with a model.
  
      Params:
        model = a [gtk.tree_model.TreeModel]
      Returns: A new [gtk.combo_box.ComboBox]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  static gtk.combo_box.ComboBox newWithModel(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_model(model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new empty [gtk.combo_box.ComboBox] with an entry and a model.
      
      See also [gtk.combo_box.ComboBox.newWithEntry].
  
      Params:
        model = A [gtk.tree_model.TreeModel]
      Returns: A new [gtk.combo_box.ComboBox]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  static gtk.combo_box.ComboBox newWithModelAndEntry(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_model_and_entry(model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the index of the currently active item.
      
      If the model is a non-flat treemodel, and the active item is not
      an immediate child of the root of the tree, this function returns
      `gtk_tree_path_get_indices (path)[0]`, where `path` is the
      [gtk.tree_path.TreePath] of the active item.
      Returns: An integer which is the index of the currently active item,
          or -1 if there’s no active item
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  int getActive()
  {
    int _retval;
    _retval = gtk_combo_box_get_active(cast(GtkComboBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns the ID of the active row of combo_box.
      
      This value is taken from the active row and the column specified
      by the `propertyGtk.ComboBox:id-column` property of combo_box
      (see [gtk.combo_box.ComboBox.setIdColumn]).
      
      The returned value is an interned string which means that you can
      compare the pointer by value to other interned strings and that you
      must not free it.
      
      If the `propertyGtk.ComboBox:id-column` property of combo_box is
      not set, or if no row is active, or if the active row has a null
      ID value, then null is returned.
      Returns: the ID of the active row
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  string getActiveId()
  {
    const(char)* _cretval;
    _cretval = gtk_combo_box_get_active_id(cast(GtkComboBox*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets iter to point to the currently active item.
      
      If no item is active, iter is left unchanged.
  
      Params:
        iter = A [gtk.tree_iter.TreeIter]
      Returns: true if iter was set, false otherwise
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  bool getActiveIter(out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_combo_box_get_active_iter(cast(GtkComboBox*)this._cPtr, cast(GtkTreeIter*)&iter);
    return _retval;
  }

  /**
      Returns whether the combo box sets the dropdown button
      sensitive or not when there are no items in the model.
      Returns: [gtk.types.SensitivityType.On] if the dropdown button
          is sensitive when the model is empty, [gtk.types.SensitivityType.Off]
          if the button is always insensitive or [gtk.types.SensitivityType.Auto]
          if it is only sensitive as long as the model has one item to
          be selected.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  gtk.types.SensitivityType getButtonSensitivity()
  {
    GtkSensitivityType _cretval;
    _cretval = gtk_combo_box_get_button_sensitivity(cast(GtkComboBox*)this._cPtr);
    gtk.types.SensitivityType _retval = cast(gtk.types.SensitivityType)_cretval;
    return _retval;
  }

  /**
      Gets the child widget of combo_box.
      Returns: the child widget of combo_box
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_get_child(cast(GtkComboBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the column which combo_box is using to get the strings
      from to display in the internal entry.
      Returns: A column in the data source model of combo_box.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  int getEntryTextColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_entry_text_column(cast(GtkComboBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the combo box has an entry.
      Returns: whether there is an entry in combo_box.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  bool getHasEntry()
  {
    bool _retval;
    _retval = cast(bool)gtk_combo_box_get_has_entry(cast(GtkComboBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column which combo_box is using to get string IDs
      for values from.
      Returns: A column in the data source model of combo_box.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  int getIdColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_id_column(cast(GtkComboBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gtk.tree_model.TreeModel] of combo_box.
      Returns: A [gtk.tree_model.TreeModel] which was passed
          during construction.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_combo_box_get_model(cast(GtkComboBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the popup uses a fixed width.
      Returns: true if the popup uses a fixed width
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  bool getPopupFixedWidth()
  {
    bool _retval;
    _retval = cast(bool)gtk_combo_box_get_popup_fixed_width(cast(GtkComboBox*)this._cPtr);
    return _retval;
  }

  /**
      Hides the menu or dropdown list of combo_box.
      
      This function is mostly intended for use by accessibility technologies;
      applications should have little use for it.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void popdown()
  {
    gtk_combo_box_popdown(cast(GtkComboBox*)this._cPtr);
  }

  /**
      Pops up the menu or dropdown list of combo_box.
      
      This function is mostly intended for use by accessibility technologies;
      applications should have little use for it.
      
      Before calling this, combo_box must be mapped, or nothing will happen.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void popup()
  {
    gtk_combo_box_popup(cast(GtkComboBox*)this._cPtr);
  }

  /**
      Pops up the menu of combo_box.
      
      Note that currently this does not do anything with the device, as it was
      previously only used for list-mode combo boxes, and those were removed
      in GTK 4. However, it is retained in case similar functionality is added
      back later.
  
      Params:
        device = a [gdk.device.Device]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void popupForDevice(gdk.device.Device device)
  {
    gtk_combo_box_popup_for_device(cast(GtkComboBox*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      Sets the active item of combo_box to be the item at index.
  
      Params:
        index = An index in the model passed during construction,
            or -1 to have no active item
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setActive(int index)
  {
    gtk_combo_box_set_active(cast(GtkComboBox*)this._cPtr, index);
  }

  /**
      Changes the active row of combo_box to the one that has an ID equal to
      active_id.
      
      If active_id is null, the active row is unset. Rows having
      a null ID string cannot be made active by this function.
      
      If the `propertyGtk.ComboBox:id-column` property of combo_box is
      unset or if no row has the given ID then the function does nothing
      and returns false.
  
      Params:
        activeId = the ID of the row to select
      Returns: true if a row with a matching ID was found. If a null
          active_id was given to unset the active row, the function
          always returns true.
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  bool setActiveId(string activeId = null)
  {
    bool _retval;
    const(char)* _activeId = activeId.toCString(No.Alloc);
    _retval = cast(bool)gtk_combo_box_set_active_id(cast(GtkComboBox*)this._cPtr, _activeId);
    return _retval;
  }

  /**
      Sets the current active item to be the one referenced by iter.
      
      If iter is null, the active item is unset.
  
      Params:
        iter = The [gtk.tree_iter.TreeIter]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setActiveIter(gtk.tree_iter.TreeIter iter)
  {
    gtk_combo_box_set_active_iter(cast(GtkComboBox*)this._cPtr, cast(GtkTreeIter*)&iter);
  }

  /**
      Sets whether the dropdown button of the combo box should update
      its sensitivity depending on the model contents.
  
      Params:
        sensitivity = specify the sensitivity of the dropdown button
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setButtonSensitivity(gtk.types.SensitivityType sensitivity)
  {
    gtk_combo_box_set_button_sensitivity(cast(GtkComboBox*)this._cPtr, sensitivity);
  }

  /**
      Sets the child widget of combo_box.
  
      Params:
        child = the child widget
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_combo_box_set_child(cast(GtkComboBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the model column which combo_box should use to get strings
      from to be text_column.
      
      For this column no separate
      [gtk.cell_renderer.CellRenderer] is needed.
      
      The column text_column in the model of combo_box must be of
      type `G_TYPE_STRING`.
      
      This is only relevant if combo_box has been created with
      `propertyGtk.ComboBox:has-entry` as true.
  
      Params:
        textColumn = A column in model to get the strings from for
            the internal entry
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setEntryTextColumn(int textColumn)
  {
    gtk_combo_box_set_entry_text_column(cast(GtkComboBox*)this._cPtr, textColumn);
  }

  /**
      Sets the model column which combo_box should use to get string IDs
      for values from.
      
      The column id_column in the model of combo_box must be of type
      `G_TYPE_STRING`.
  
      Params:
        idColumn = A column in model to get string IDs for values from
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setIdColumn(int idColumn)
  {
    gtk_combo_box_set_id_column(cast(GtkComboBox*)this._cPtr, idColumn);
  }

  /**
      Sets the model used by combo_box to be model.
      
      Will unset a previously set model (if applicable). If model is null,
      then it will unset the model.
      
      Note that this function does not clear the cell renderers, you have to
      call [gtk.cell_layout.CellLayout.clear] yourself if you need to set up different
      cell renderers for the new model.
  
      Params:
        model = A [gtk.tree_model.TreeModel]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_combo_box_set_model(cast(GtkComboBox*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Specifies whether the popup’s width should be a fixed width.
      
      If fixed is true, the popup's width is set to match the
      allocated width of the combo box.
  
      Params:
        fixed = whether to use a fixed popup width
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setPopupFixedWidth(bool fixed)
  {
    gtk_combo_box_set_popup_fixed_width(cast(GtkComboBox*)this._cPtr, fixed);
  }

  /**
      Sets the row separator function, which is used to determine
      whether a row should be drawn as a separator.
      
      If the row separator function is null, no separators are drawn.
      This is the default value.
  
      Params:
        func = a [gtk.types.TreeViewRowSeparatorFunc]
  
      Deprecated: Use [gtk.drop_down.DropDown]
  */
  void setRowSeparatorFunc(gtk.types.TreeViewRowSeparatorFunc func = null)
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeViewRowSeparatorFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), *cast(gtk.tree_iter.TreeIter*)iter);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_combo_box_set_row_separator_func(cast(GtkComboBox*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the combo box is activated.
        
        The `::activate` signal on [gtk.combo_box.ComboBox] is an action signal and
        emitting it causes the combo box to pop up its dropdown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.combo_box.ComboBox comboBox))
  
          `comboBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.combo_box.ComboBox)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the active item is changed.
        
        The can be due to the user selecting a different item from the list,
        or due to a call to [gtk.combo_box.ComboBox.setActiveIter]. It will
        also be emitted while typing into the entry of a combo box with an entry.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.combo_box.ComboBox comboBox))
  
          `comboBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.combo_box.ComboBox)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `FormatEntryText` signal.
  
      Emitted to allow changing how the text in a combo box's entry is displayed.
        
        See `propertyGtk.ComboBox:has-entry`.
        
        Connect a signal handler which returns an allocated string representing
        path. That string will then be used to set the text in the combo box's
        entry. The default signal handler uses the text from the
        `propertyGtk.ComboBox:entry-text-column` model column.
        
        Here's an example signal handler which fetches data from the model and
        displays it in the entry.
        ```c
        static char *
        format_entry_text_callback (GtkComboBox *combo,
                                    const char *path,
                                    gpointer     user_data)
        {
          GtkTreeIter iter;
          GtkTreeModel model;
          double       value;
        
          model = gtk_combo_box_get_model (combo);
        
          gtk_tree_model_get_iter_from_string (model, &iter, path);
          gtk_tree_model_get (model, &iter,
                              THE_DOUBLE_VALUE_COLUMN, &value,
                              -1);
        
          return g_strdup_printf ("%g", value);
        }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D string callback(string path, gtk.combo_box.ComboBox comboBox))
  
          `path` the [gtk.tree_path.TreePath] string from the combo box's current model
              to format text for (optional)
  
          `comboBox` the instance the signal is connected to (optional)
  
          `Returns` a newly allocated string representing path
              for the current [gtk.combo_box.ComboBox] model.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFormatEntryText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.combo_box.ComboBox)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-entry-text", closure, after);
  }

  /**
      Connect to `MoveActive` signal.
  
      Emitted to move the active selection.
        
        This is an [keybinding signal](class.SignalAction.html).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollType scrollType, gtk.combo_box.ComboBox comboBox))
  
          `scrollType` a [gtk.types.ScrollType] (optional)
  
          `comboBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveActive(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.combo_box.ComboBox)))
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
    return connectSignalClosure("move-active", closure, after);
  }

  /**
      Connect to `Popdown` signal.
  
      Emitted to popdown the combo box list.
        
        This is an [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are Alt+Up and Escape.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.combo_box.ComboBox comboBox))
  
          `comboBox` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopdown(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.combo_box.ComboBox)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popdown", closure, after);
  }

  /**
      Connect to `Popup` signal.
  
      Emitted to popup the combo box list.
        
        This is an [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is Alt+Down.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.combo_box.ComboBox comboBox))
  
          `comboBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.combo_box.ComboBox)))
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
    return connectSignalClosure("popup", closure, after);
  }
}
