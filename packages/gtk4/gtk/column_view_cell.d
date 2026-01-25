/// Module for [ColumnViewCell] class
module gtk.column_view_cell;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.list_item;
import gtk.types;
import gtk.widget;

/**
    [gtk.column_view_cell.ColumnViewCell] is used by [gtk.column_view_column.ColumnViewColumn] to represent items
    in a cell in [gtk.column_view.ColumnView].
    
    The [gtk.column_view_cell.ColumnViewCell]s are managed by the columnview widget (with its factory)
    and cannot be created by applications, but they need to be populated
    by application code. This is done by calling [gtk.column_view_cell.ColumnViewCell.setChild].
    
    [gtk.column_view_cell.ColumnViewCell]s exist in 2 stages:
    
    1. The unbound stage where the listitem is not currently connected to
       an item in the list. In that case, the [gtk.column_view_cell.ColumnViewCell.item]
       property is set to null.
    
    2. The bound stage where the listitem references an item from the list.
       The [gtk.column_view_cell.ColumnViewCell.item] property is not null.
*/
class ColumnViewCell : gtk.list_item.ListItem
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
    return cast(void function())gtk_column_view_cell_get_type != &gidSymbolNotFound ? gtk_column_view_cell_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnViewCell self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: Widget used for display.
  */
  override @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
  */
  override @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `focusable` property.
      Returns: If the item can be focused with the keyboard.
  */
  override @property bool focusable()
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = If the item can be focused with the keyboard.
  */
  override @property void focusable(bool propval)
  {
    return setFocusable(propval);
  }

  /**
      Get `item` property.
      Returns: Displayed item.
  */
  override @property gobject.object.ObjectWrap item()
  {
    return getItem();
  }

  /**
      Get `position` property.
      Returns: Position of the item.
  */
  override @property uint position()
  {
    return getPosition();
  }

  /**
      Get `selected` property.
      Returns: If the item is currently selected.
  */
  override @property bool selected()
  {
    return getSelected();
  }

  /**
      Gets the child previously set via [gtk.column_view_cell.ColumnViewCell.setChild] or
      null if none was set.
      Returns: The child
  */
  override gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_column_view_cell_get_child(cast(GtkColumnViewCell*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a list item has been set to be focusable via
      [gtk.column_view_cell.ColumnViewCell.setFocusable].
      Returns: true if the item is focusable
  */
  override bool getFocusable()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_cell_get_focusable(cast(GtkColumnViewCell*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model item that associated with self.
      
      If self is unbound, this function returns null.
      Returns: The item displayed
  */
  override gobject.object.ObjectWrap getItem()
  {
    GObject* _cretval;
    _cretval = gtk_column_view_cell_get_item(cast(GtkColumnViewCell*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position in the model that self currently displays.
      
      If self is unbound, [gtk.types.INVALID_LIST_POSITION] is returned.
      Returns: The position of this item
  */
  override uint getPosition()
  {
    uint _retval;
    _retval = gtk_column_view_cell_get_position(cast(GtkColumnViewCell*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the item is displayed as selected.
      
      The selected state is maintained by the liste widget and its model
      and cannot be set otherwise.
      Returns: true if the item is selected.
  */
  override bool getSelected()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_cell_get_selected(cast(GtkColumnViewCell*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child to be used for this listitem.
      
      This function is typically called by applications when
      setting up a listitem so that the widget can be reused when
      binding it multiple times.
  
      Params:
        child = The list item's child or null to unset
  */
  override void setChild(gtk.widget.Widget child = null)
  {
    gtk_column_view_cell_set_child(cast(GtkColumnViewCell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets self to be focusable.
      
      If an item is focusable, it can be focused using the keyboard.
      This works similar to [gtk.widget.Widget.setFocusable].
      
      Note that if items are not focusable, the keyboard cannot be used to activate
      them and selecting only works if one of the listitem's children is focusable.
      
      By default, list items are focusable.
  
      Params:
        focusable = if the item should be focusable
  */
  override void setFocusable(bool focusable)
  {
    gtk_column_view_cell_set_focusable(cast(GtkColumnViewCell*)this._cPtr, focusable);
  }
}
