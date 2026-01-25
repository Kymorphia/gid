/// Module for [ColumnViewRow] class
module gtk.column_view_row;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.column_view_row.ColumnViewRow] is used by [gtk.column_view.ColumnView] to allow configuring
    how rows are displayed.
    
    It is not used to set the widgets displayed in the individual cells. For that
    see `method@GtkColumnViewColumn.set_factory` and `class@GtkColumnViewCell`.
*/
class ColumnViewRow : gobject.object.ObjectWrap
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
    return cast(void function())gtk_column_view_row_get_type != &gidSymbolNotFound ? gtk_column_view_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnViewRow self()
  {
    return this;
  }

  /**
      Get `accessibleDescription` property.
      Returns: The accessible description to set on the row.
  */
  @property string accessibleDescription()
  {
    return getAccessibleDescription();
  }

  /**
      Set `accessibleDescription` property.
      Params:
        propval = The accessible description to set on the row.
  */
  @property void accessibleDescription(string propval)
  {
    return setAccessibleDescription(propval);
  }

  /**
      Get `accessibleLabel` property.
      Returns: The accessible label to set on the row.
  */
  @property string accessibleLabel()
  {
    return getAccessibleLabel();
  }

  /**
      Set `accessibleLabel` property.
      Params:
        propval = The accessible label to set on the row.
  */
  @property void accessibleLabel(string propval)
  {
    return setAccessibleLabel(propval);
  }

  /**
      Get `activatable` property.
      Returns: If the row can be activated by the user.
  */
  @property bool activatable()
  {
    return getActivatable();
  }

  /**
      Set `activatable` property.
      Params:
        propval = If the row can be activated by the user.
  */
  @property void activatable(bool propval)
  {
    return setActivatable(propval);
  }

  /**
      Get `focusable` property.
      Returns: If the row can be focused with the keyboard.
  */
  @property bool focusable()
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = If the row can be focused with the keyboard.
  */
  @property void focusable(bool propval)
  {
    return setFocusable(propval);
  }

  /**
      Get `item` property.
      Returns: The item for this row.
  */
  @property gobject.object.ObjectWrap item()
  {
    return getItem();
  }

  /**
      Get `position` property.
      Returns: Position of the row.
  */
  @property uint position()
  {
    return getPosition();
  }

  /**
      Get `selectable` property.
      Returns: If the row can be selected by the user.
  */
  @property bool selectable()
  {
    return getSelectable();
  }

  /**
      Set `selectable` property.
      Params:
        propval = If the row can be selected by the user.
  */
  @property void selectable(bool propval)
  {
    return setSelectable(propval);
  }

  /**
      Get `selected` property.
      Returns: If the item in the row is currently selected.
  */
  @property bool selected()
  {
    return getSelected();
  }

  /**
      Gets the accessible description of self.
      Returns: the accessible description
  */
  string getAccessibleDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_column_view_row_get_accessible_description(cast(GtkColumnViewRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the accessible label of self.
      Returns: the accessible label
  */
  string getAccessibleLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_column_view_row_get_accessible_label(cast(GtkColumnViewRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if the row has been set to be activatable via
      [gtk.column_view_row.ColumnViewRow.setActivatable].
      Returns: true if the row is activatable
  */
  bool getActivatable()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_row_get_activatable(cast(GtkColumnViewRow*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a row item has been set to be focusable via
      [gtk.column_view_row.ColumnViewRow.setFocusable].
      Returns: true if the row is focusable
  */
  bool getFocusable()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_row_get_focusable(cast(GtkColumnViewRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model item that associated with self.
      
      If self is unbound, this function returns null.
      Returns: The item displayed
  */
  gobject.object.ObjectWrap getItem()
  {
    GObject* _cretval;
    _cretval = gtk_column_view_row_get_item(cast(GtkColumnViewRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position in the model that self currently displays.
      
      If self is unbound, [gtk.types.INVALID_LIST_POSITION] is returned.
      Returns: The position of this row
  */
  uint getPosition()
  {
    uint _retval;
    _retval = gtk_column_view_row_get_position(cast(GtkColumnViewRow*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the row has been set to be selectable via
      [gtk.column_view_row.ColumnViewRow.setSelectable].
      
      Do not confuse this function with [gtk.column_view_row.ColumnViewRow.getSelected].
      Returns: true if the row is selectable
  */
  bool getSelectable()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_row_get_selectable(cast(GtkColumnViewRow*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the item is selected that this row corresponds to.
      
      The selected state is maintained by the list widget and its model
      and cannot be set otherwise.
      Returns: true if the item is selected.
  */
  bool getSelected()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_row_get_selected(cast(GtkColumnViewRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets the accessible description for the row,
      which may be used by e.g. screen readers.
  
      Params:
        description = the description
  */
  void setAccessibleDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    gtk_column_view_row_set_accessible_description(cast(GtkColumnViewRow*)this._cPtr, _description);
  }

  /**
      Sets the accessible label for the row,
      which may be used by e.g. screen readers.
  
      Params:
        label = the label
  */
  void setAccessibleLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_column_view_row_set_accessible_label(cast(GtkColumnViewRow*)this._cPtr, _label);
  }

  /**
      Sets self to be activatable.
      
      If a row is activatable, double-clicking on the row, using
      the Return key or calling [gtk.widget.Widget.activate] will activate
      the row. Activating instructs the containing columnview to
      emit the [gtk.column_view.ColumnView.activate] signal.
      
      By default, row are activatable.
  
      Params:
        activatable = if the row should be activatable
  */
  void setActivatable(bool activatable)
  {
    gtk_column_view_row_set_activatable(cast(GtkColumnViewRow*)this._cPtr, activatable);
  }

  /**
      Sets self to be focusable.
      
      If a row is focusable, it can be focused using the keyboard.
      This works similar to [gtk.widget.Widget.setFocusable].
      
      Note that if row are not focusable, the contents of cells can still be focused if
      they are focusable.
      
      By default, rows are focusable.
  
      Params:
        focusable = if the row should be focusable
  */
  void setFocusable(bool focusable)
  {
    gtk_column_view_row_set_focusable(cast(GtkColumnViewRow*)this._cPtr, focusable);
  }

  /**
      Sets self to be selectable.
      
      If a row is selectable, clicking on the row or using the keyboard
      will try to select or unselect the row. Whether this succeeds is up to
      the model to determine, as it is managing the selected state.
      
      Note that this means that making a row non-selectable has no
      influence on the selected state at all. A non-selectable row
      may still be selected.
      
      By default, rows are selectable.
  
      Params:
        selectable = if the row should be selectable
  */
  void setSelectable(bool selectable)
  {
    gtk_column_view_row_set_selectable(cast(GtkColumnViewRow*)this._cPtr, selectable);
  }
}
