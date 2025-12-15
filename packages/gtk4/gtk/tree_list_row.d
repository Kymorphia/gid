/// Module for [TreeListRow] class
module gtk.tree_list_row;

import gid.gid;
import gio.list_model;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.tree_list_row.TreeListRow] is used by [gtk.tree_list_model.TreeListModel] to represent items.
    
    It allows navigating the model as a tree and modify the state of rows.
    
    [gtk.tree_list_row.TreeListRow] instances are created by a [gtk.tree_list_model.TreeListModel] only
    when the [gtk.tree_list_model.TreeListModel.passthrough] property is not set.
    
    There are various support objects that can make use of [gtk.tree_list_row.TreeListRow]
    objects, such as the [gtk.tree_expander.TreeExpander] widget that allows displaying
    an icon to expand or collapse a row or [gtk.tree_list_row_sorter.TreeListRowSorter] that
    makes it possible to sort trees properly.
*/
class TreeListRow : gobject.object.ObjectWrap
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
    return cast(void function())gtk_tree_list_row_get_type != &gidSymbolNotFound ? gtk_tree_list_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListRow self()
  {
    return this;
  }

  /**
      Get `children` property.
      Returns: The model holding the row's children.
  */
  @property gio.list_model.ListModel children()
  {
    return getChildren();
  }

  /**
      Get `depth` property.
      Returns: The depth in the tree of this row.
  */
  @property uint depth()
  {
    return getDepth();
  }

  /**
      Get `expandable` property.
      Returns: If this row can ever be expanded.
  */
  @property bool expandable()
  {
    return isExpandable();
  }

  /**
      Get `expanded` property.
      Returns: If this row is currently expanded.
  */
  @property bool expanded()
  {
    return getExpanded();
  }

  /**
      Set `expanded` property.
      Params:
        propval = If this row is currently expanded.
  */
  @property void expanded(bool propval)
  {
    return setExpanded(propval);
  }

  /**
      Get `item` property.
      Returns: The item held in this row.
  */
  @property gobject.object.ObjectWrap item()
  {
    return getItem();
  }

  /**
      If self is not expanded or position is greater than the
      number of children, null is returned.
  
      Params:
        position = position of the child to get
      Returns: the child in position
  */
  gtk.tree_list_row.TreeListRow getChildRow(uint position)
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_row_get_child_row(cast(GtkTreeListRow*)this._cPtr, position);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      If the row is expanded, gets the model holding the children of self.
      
      This model is the model created by the
      [gtk.types.TreeListModelCreateModelFunc]
      and contains the original items, no matter what value
      [gtk.tree_list_model.TreeListModel.passthrough] is set to.
      Returns: The model containing the children
  */
  gio.list_model.ListModel getChildren()
  {
    GListModel* _cretval;
    _cretval = gtk_tree_list_row_get_children(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the depth of this row.
      
      Rows that correspond to items in the root model have a depth
      of zero, rows corresponding to items of models of direct children
      of the root model have a depth of 1 and so on.
      
      The depth of a row never changes until the row is removed from its model
      at which point it will forever return 0.
      Returns: The depth of this row
  */
  uint getDepth()
  {
    uint _retval;
    _retval = gtk_tree_list_row_get_depth(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets if a row is currently expanded.
      Returns: true if the row is expanded
  */
  bool getExpanded()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_list_row_get_expanded(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the item corresponding to this row,
      Returns: The item
          of this row. This function is only marked as nullable for backwards
          compatibility reasons.
  */
  gobject.object.ObjectWrap getItem()
  {
    GObject* _cretval;
    _cretval = gtk_tree_list_row_get_item(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the row representing the parent for self.
      
      That is the row that would need to be collapsed
      to make this row disappear.
      
      If self is a row corresponding to the root model,
      null is returned.
      
      The value returned by this function never changes
      until the row is removed from its model at which point
      it will forever return null.
      Returns: The parent of self
  */
  gtk.tree_list_row.TreeListRow getParent()
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_row_get_parent(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the position in the [gtk.tree_list_model.TreeListModel] that self occupies
      at the moment.
      Returns: The position in the model
  */
  uint getPosition()
  {
    uint _retval;
    _retval = gtk_tree_list_row_get_position(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a row can be expanded.
      
      This does not mean that the row is actually expanded,
      this can be checked with [gtk.tree_list_row.TreeListRow.getExpanded].
      
      If a row is expandable never changes until the row is removed
      from its model at which point it will forever return false.
      Returns: true if the row is expandable
  */
  bool isExpandable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_list_row_is_expandable(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Expands or collapses a row.
      
      If a row is expanded, the model of calling the
      [gtk.types.TreeListModelCreateModelFunc] for the row's
      item will be inserted after this row. If a row is collapsed,
      those items will be removed from the model.
      
      If the row is not expandable, this function does nothing.
  
      Params:
        expanded = true if the row should be expanded
  */
  void setExpanded(bool expanded)
  {
    gtk_tree_list_row_set_expanded(cast(GtkTreeListRow*)this._cPtr, expanded);
  }
}
