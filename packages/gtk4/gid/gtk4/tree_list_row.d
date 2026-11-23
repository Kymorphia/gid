/// Module for [TreeListRow] class
module gid.gtk4.tree_list_row;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    The type of item used by [gid.gtk4.tree_list_model.TreeListModel].
    
    It allows navigating the model as a tree and modify the state of rows.
    
    [gid.gtk4.tree_list_row.TreeListRow] instances are created by a [gid.gtk4.tree_list_model.TreeListModel] only
    when the [gid.gtk4.tree_list_model.TreeListModel.passthrough] property is not set.
    
    There are various support objects that can make use of [gid.gtk4.tree_list_row.TreeListRow]
    objects, such as the [gid.gtk4.tree_expander.TreeExpander] widget that allows displaying
    an icon to expand or collapse a row or [gid.gtk4.tree_list_row_sorter.TreeListRowSorter] that
    makes it possible to sort trees properly.
*/
class TreeListRow : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_list_row_get_type != &gidSymbolNotFound ? gtk_tree_list_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeListRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.tree_list_row.TreeListRow]
      Returns: New builder object
  */
  static TreeListRowGidBuilder builder() nothrow
  {
    return new TreeListRowGidBuilder;
  }

  /**
      Get `children` property.
      Returns: The model holding the row's children.
  */
  @property gid.gio2.list_model.ListModel children() nothrow
  {
    return getChildren();
  }

  /**
      Get `depth` property.
      Returns: The depth in the tree of this row.
  */
  @property uint depth() nothrow
  {
    return getDepth();
  }

  /**
      Get `expandable` property.
      Returns: If this row can ever be expanded.
  */
  @property bool expandable() nothrow
  {
    return isExpandable();
  }

  /**
      Get `expanded` property.
      Returns: If this row is currently expanded.
  */
  @property bool expanded() nothrow
  {
    return getExpanded();
  }

  /**
      Set `expanded` property.
      Params:
        propval = If this row is currently expanded.
  */
  @property void expanded(bool propval) nothrow
  {
    setExpanded(propval);
  }

  /**
      Get `item` property.
      Returns: The item held in this row.
  */
  @property gid.gobject2.object.ObjectWrap item() nothrow
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
  gid.gtk4.tree_list_row.TreeListRow getChildRow(uint position) nothrow
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_row_get_child_row(cast(GtkTreeListRow*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      If the row is expanded, gets the model holding the children of self.
      
      This model is the model created by the
      [gid.gtk4.types.TreeListModelCreateModelFunc]
      and contains the original items, no matter what value
      [gid.gtk4.tree_list_model.TreeListModel.passthrough] is set to.
      Returns: The model containing the children
  */
  gid.gio2.list_model.ListModel getChildren() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_tree_list_row_get_children(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
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
  uint getDepth() nothrow
  {
    uint _retval;
    _retval = gtk_tree_list_row_get_depth(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets if a row is currently expanded.
      Returns: true if the row is expanded
  */
  bool getExpanded() nothrow
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
  gid.gobject2.object.ObjectWrap getItem() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_tree_list_row_get_item(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
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
  gid.gtk4.tree_list_row.TreeListRow getParent() nothrow
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_list_row_get_parent(cast(GtkTreeListRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the position in the [gid.gtk4.tree_list_model.TreeListModel] that self occupies
      at the moment.
      Returns: The position in the model
  */
  uint getPosition() nothrow
  {
    uint _retval;
    _retval = gtk_tree_list_row_get_position(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a row can be expanded.
      
      This does not mean that the row is actually expanded,
      this can be checked with [gid.gtk4.tree_list_row.TreeListRow.getExpanded].
      
      If a row is expandable never changes until the row is removed
      from its model at which point it will forever return false.
      Returns: true if the row is expandable
  */
  bool isExpandable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_list_row_is_expandable(cast(GtkTreeListRow*)this._cPtr);
    return _retval;
  }

  /**
      Expands or collapses a row.
      
      If a row is expanded, the model of calling the
      [gid.gtk4.types.TreeListModelCreateModelFunc] for the row's
      item will be inserted after this row. If a row is collapsed,
      those items will be removed from the model.
      
      If the row is not expandable, this function does nothing.
  
      Params:
        expanded = true if the row should be expanded
  */
  void setExpanded(bool expanded) nothrow
  {
    gtk_tree_list_row_set_expanded(cast(GtkTreeListRow*)this._cPtr, expanded);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_list_row.TreeListRow]
class TreeListRowGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `expanded` property.
      Params:
        propval = If this row is currently expanded.
      Returns: Builder instance for fluent chaining
  */
  T expanded(bool propval) nothrow
  {
    return setProperty("expanded", propval);
  }
}

/// Fluent builder for [gid.gtk4.tree_list_row.TreeListRow]
final class TreeListRowGidBuilder : TreeListRowGidBuilderImpl!TreeListRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeListRow build() nothrow
  {
    return new TreeListRow(cast(void*)createGObject(TreeListRow._getGType), Yes.Take);
  }
}
