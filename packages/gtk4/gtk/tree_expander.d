/// Module for [TreeExpander] class
module gtk.tree_expander;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.tree_list_row;
import gtk.types;
import gtk.widget;

/**
    [gtk.tree_expander.TreeExpander] is a widget that provides an expander for a list.
    
    It is typically placed as a bottommost child into a [gtk.list_view.ListView]
    to allow users to expand and collapse children in a list with a
    [gtk.tree_list_model.TreeListModel]. [gtk.tree_expander.TreeExpander] provides the common UI
    elements, gestures and keybindings for this purpose.
    
    On top of this, the "listitem.expand", "listitem.collapse" and
    "listitem.toggle-expand" actions are provided to allow adding custom
    UI for managing expanded state.
    
    It is important to mention that you want to set the
    [gtk.list_item.ListItem.focusable] property to FALSE when using this
    widget, as you want the keyboard focus to be in the treexpander, and not
    inside the list to make use of the keybindings.
    
    The [gtk.tree_list_model.TreeListModel] must be set to not be passthrough. Then it
    will provide [gtk.tree_list_row.TreeListRow] items which can be set via
    [gtk.tree_expander.TreeExpander.setListRow] on the expander.
    The expander will then watch that row item automatically.
    [gtk.tree_expander.TreeExpander.setChild] sets the widget that displays
    the actual row contents.
    
    [gtk.tree_expander.TreeExpander] can be modified with properties such as
    `property@Gtk.TreeExpander:indent-for-icon`,
    `property@Gtk.TreeExpander:indent-for-depth`, and
    `property@Gtk.TreeExpander:hide-expander` to achieve a different appearance.
    This can even be done to influence individual rows, for example by binding
    the `property@Gtk.TreeExpander:hide-expander` property to the item count of
    the model of the treelistrow, to hide the expander for rows without children,
    even if the row is expandable.
    
    ## CSS nodes
    
    ```
    treeexpander
    ├── [indent]*
    ├── [expander]
    ╰── <child>
    ```
    
    [gtk.tree_expander.TreeExpander] has zero or one CSS nodes with the name "expander" that
    should display the expander icon. The node will be `:checked` when it
    is expanded. If the node is not expandable, an "indent" node will be
    displayed instead.
    
    For every level of depth, another "indent" node is prepended.
    
    ## Accessibility
    
    Until GTK 4.10, [gtk.tree_expander.TreeExpander] used the [gtk.types.AccessibleRole.Group] role.
    
    Since GTK 4.12, [gtk.tree_expander.TreeExpander] uses the [gtk.types.AccessibleRole.Button] role.
    Toggling it will change the [gtk.types.AccessibleState.Expanded] state.
*/
class TreeExpander : gtk.widget.Widget
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
    return cast(void function())gtk_tree_expander_get_type != &gidSymbolNotFound ? gtk_tree_expander_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeExpander self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget with the actual contents.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget with the actual contents.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `hideExpander` property.
      Returns: Whether the expander icon should be hidden in a GtkTreeListRow.
        Note that this property simply hides the icon.  The actions and keybinding
        (i.e. collapse and expand) are not affected by this property.
        
        A common use for this property would be to bind to the number of children in a
        GtkTreeListRow's model in order to hide the expander when a row has no children.
  */
  @property bool hideExpander()
  {
    return getHideExpander();
  }

  /**
      Set `hideExpander` property.
      Params:
        propval = Whether the expander icon should be hidden in a GtkTreeListRow.
          Note that this property simply hides the icon.  The actions and keybinding
          (i.e. collapse and expand) are not affected by this property.
          
          A common use for this property would be to bind to the number of children in a
          GtkTreeListRow's model in order to hide the expander when a row has no children.
  */
  @property void hideExpander(bool propval)
  {
    return setHideExpander(propval);
  }

  /**
      Get `indentForDepth` property.
      Returns: TreeExpander indents the child according to its depth.
  */
  @property bool indentForDepth()
  {
    return getIndentForDepth();
  }

  /**
      Set `indentForDepth` property.
      Params:
        propval = TreeExpander indents the child according to its depth.
  */
  @property void indentForDepth(bool propval)
  {
    return setIndentForDepth(propval);
  }

  /**
      Get `indentForIcon` property.
      Returns: TreeExpander indents the child by the width of an expander-icon if it is not expandable.
  */
  @property bool indentForIcon()
  {
    return getIndentForIcon();
  }

  /**
      Set `indentForIcon` property.
      Params:
        propval = TreeExpander indents the child by the width of an expander-icon if it is not expandable.
  */
  @property void indentForIcon(bool propval)
  {
    return setIndentForIcon(propval);
  }

  /**
      Get `item` property.
      Returns: The item held by this expander's row.
  */
  @property gobject.object.ObjectWrap item()
  {
    return getItem();
  }

  /**
      Get `listRow` property.
      Returns: The list row to track for expander state.
  */
  @property gtk.tree_list_row.TreeListRow listRow()
  {
    return getListRow();
  }

  /**
      Set `listRow` property.
      Params:
        propval = The list row to track for expander state.
  */
  @property void listRow(gtk.tree_list_row.TreeListRow propval)
  {
    return setListRow(propval);
  }

  /**
      Creates a new [gtk.tree_expander.TreeExpander]
      Returns: a new [gtk.tree_expander.TreeExpander]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_expander_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget displayed by self.
      Returns: The child displayed by self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_expander_get_child(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the TreeExpander should be hidden in a GtkTreeListRow.
      Returns: TRUE if the expander icon should be hidden. Otherwise FALSE.
  */
  bool getHideExpander()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_hide_expander(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      TreeExpander indents each level of depth with an additional indent.
      Returns: TRUE if the child should be indented . Otherwise FALSE.
  */
  bool getIndentForDepth()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_indent_for_depth(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      TreeExpander indents the child by the width of an expander-icon if it is not expandable.
      Returns: TRUE if the child should be indented when not expandable. Otherwise FALSE.
  */
  bool getIndentForIcon()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_indent_for_icon(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      Forwards the item set on the [gtk.tree_list_row.TreeListRow] that self is managing.
      
      This call is essentially equivalent to calling:
      
      ```c
      gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (self));
      ```
      Returns: The item of the row
  */
  gobject.object.ObjectWrap getItem()
  {
    GObject* _cretval;
    _cretval = gtk_tree_expander_get_item(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the list row managed by self.
      Returns: The list row displayed by self
  */
  gtk.tree_list_row.TreeListRow getListRow()
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_expander_get_list_row(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the content widget to display.
  
      Params:
        child = a [gtk.widget.Widget]
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_tree_expander_set_child(cast(GtkTreeExpander*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the expander icon should be visible in a GtkTreeListRow.
  
      Params:
        hideExpander = TRUE if the expander should be hidden. Otherwise FALSE.
  */
  void setHideExpander(bool hideExpander)
  {
    gtk_tree_expander_set_hide_expander(cast(GtkTreeExpander*)this._cPtr, hideExpander);
  }

  /**
      Sets if the TreeExpander should indent the child according to its depth.
  
      Params:
        indentForDepth = TRUE if the child should be indented. Otherwise FALSE.
  */
  void setIndentForDepth(bool indentForDepth)
  {
    gtk_tree_expander_set_indent_for_depth(cast(GtkTreeExpander*)this._cPtr, indentForDepth);
  }

  /**
      Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable.
  
      Params:
        indentForIcon = TRUE if the child should be indented without expander. Otherwise FALSE.
  */
  void setIndentForIcon(bool indentForIcon)
  {
    gtk_tree_expander_set_indent_for_icon(cast(GtkTreeExpander*)this._cPtr, indentForIcon);
  }

  /**
      Sets the tree list row that this expander should manage.
  
      Params:
        listRow = a [gtk.tree_list_row.TreeListRow]
  */
  void setListRow(gtk.tree_list_row.TreeListRow listRow = null)
  {
    gtk_tree_expander_set_list_row(cast(GtkTreeExpander*)this._cPtr, listRow ? cast(GtkTreeListRow*)listRow._cPtr(No.Dup) : null);
  }
}
