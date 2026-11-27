/// Module for [TreeExpander] class
module gid.gtk4.tree_expander;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.tree_list_row;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Provides an expander for a tree-like list.
    
    It is typically placed as a bottommost child into a [gid.gtk4.list_view.ListView]
    to allow users to expand and collapse children in a list with a
    [gid.gtk4.tree_list_model.TreeListModel]. [gid.gtk4.tree_expander.TreeExpander] provides the common UI
    elements, gestures and keybindings for this purpose.
    
    On top of this, the "listitem.expand", "listitem.collapse" and
    "listitem.toggle-expand" actions are provided to allow adding custom
    UI for managing expanded state.
    
    It is important to mention that you want to set the
    [gid.gtk4.list_item.ListItem.focusable] property to FALSE when using this
    widget, as you want the keyboard focus to be in the treexpander, and not
    inside the list to make use of the keybindings.
    
    The [gid.gtk4.tree_list_model.TreeListModel] must be set to not be passthrough. Then it
    will provide [gid.gtk4.tree_list_row.TreeListRow] items which can be set via
    [gid.gtk4.tree_expander.TreeExpander.setListRow] on the expander.
    The expander will then watch that row item automatically.
    [gid.gtk4.tree_expander.TreeExpander.setChild] sets the widget that displays
    the actual row contents.
    
    [gid.gtk4.tree_expander.TreeExpander] can be modified with properties such as
    [gid.gtk4.tree_expander.TreeExpander.indentForIcon],
    [gid.gtk4.tree_expander.TreeExpander.indentForDepth], and
    [gid.gtk4.tree_expander.TreeExpander.hideExpander] to achieve a different appearance.
    This can even be done to influence individual rows, for example by binding
    the [gid.gtk4.tree_expander.TreeExpander.hideExpander] property to the item count of
    the model of the treelistrow, to hide the expander for rows without children,
    even if the row is expandable.
    
    ## Shortcuts and Gestures
    
    [gid.gtk4.tree_expander.TreeExpander] supports the following keyboard shortcuts:
    
    - <kbd>+</kbd> or <kbd>*</kbd> expands the expander.
    - <kbd>-</kbd> or <kbd>/</kbd> collapses the expander.
    - Left and right arrow keys, when combined with <kbd>Shift</kbd> or
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>, will expand or collapse, depending on
      the locale's text direction.
    - <kbd>Ctrl</kbd>+<kbd>␣</kbd> toggles the expander state.
    
    The row can also expand on drag gestures.
    
    ## Actions
    
    [gid.gtk4.tree_expander.TreeExpander] defines a set of built-in actions:
    
    - `listitem.expand` expands the expander if it can be expanded.
    - `listitem.collapse` collapses the expander.
    - `listitem.toggle-expand` tries to expand the expander if it was collapsed
      or collapses it if it was expanded.
    
    ## CSS nodes
    
    ```
    treeexpander
    ├── [indent]*
    ├── [expander]
    ╰── <child>
    ```
    
    [gid.gtk4.tree_expander.TreeExpander] has zero or one CSS nodes with the name "expander" that
    should display the expander icon. The node will be `:checked` when it
    is expanded. If the node is not expandable, an "indent" node will be
    displayed instead.
    
    For every level of depth, another "indent" node is prepended.
    
    ## Accessibility
    
    Until GTK 4.10, [gid.gtk4.tree_expander.TreeExpander] used the [gid.gtk4.types.AccessibleRole.Group] role.
    
    Since GTK 4.12, [gid.gtk4.tree_expander.TreeExpander] uses the [gid.gtk4.types.AccessibleRole.Button] role.
    Toggling it will change the [gid.gtk4.types.AccessibleState.Expanded] state.
*/
@gidGir("TreeExpander", "TreeExpanderClass")
class TreeExpander : gid.gtk4.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_expander_get_type != &gidSymbolNotFound ? gtk_tree_expander_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeExpander";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeExpander self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.tree_expander.TreeExpander]
      Returns: New builder object
  */
  static TreeExpanderGidBuilder builder() nothrow
  {
    return new TreeExpanderGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget with the actual contents.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget with the actual contents.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `hideExpander` property.
      Returns: Whether the expander icon should be hidden in a GtkTreeListRow.
        Note that this property simply hides the icon.  The actions and keybinding
        (i.e. collapse and expand) are not affected by this property.
        
        A common use for this property would be to bind to the number of children in a
        GtkTreeListRow's model in order to hide the expander when a row has no children.
  */
  @property bool hideExpander() nothrow
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
  @property void hideExpander(bool propval) nothrow
  {
    setHideExpander(propval);
  }

  /**
      Get `indentForDepth` property.
      Returns: TreeExpander indents the child according to its depth.
  */
  @property bool indentForDepth() nothrow
  {
    return getIndentForDepth();
  }

  /**
      Set `indentForDepth` property.
      Params:
        propval = TreeExpander indents the child according to its depth.
  */
  @property void indentForDepth(bool propval) nothrow
  {
    setIndentForDepth(propval);
  }

  /**
      Get `indentForIcon` property.
      Returns: TreeExpander indents the child by the width of an expander-icon if it is not expandable.
  */
  @property bool indentForIcon() nothrow
  {
    return getIndentForIcon();
  }

  /**
      Set `indentForIcon` property.
      Params:
        propval = TreeExpander indents the child by the width of an expander-icon if it is not expandable.
  */
  @property void indentForIcon(bool propval) nothrow
  {
    setIndentForIcon(propval);
  }

  /**
      Get `item` property.
      Returns: The item held by this expander's row.
  */
  @property gid.gobject2.object.ObjectWrap item() nothrow
  {
    return getItem();
  }

  /**
      Get `listRow` property.
      Returns: The list row to track for expander state.
  */
  @property gid.gtk4.tree_list_row.TreeListRow listRow() nothrow
  {
    return getListRow();
  }

  /**
      Set `listRow` property.
      Params:
        propval = The list row to track for expander state.
  */
  @property void listRow(gid.gtk4.tree_list_row.TreeListRow propval) nothrow
  {
    setListRow(propval);
  }

  /**
      Creates a new [gid.gtk4.tree_expander.TreeExpander]
      Returns: a new [gid.gtk4.tree_expander.TreeExpander]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_tree_expander_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the child widget displayed by self.
      Returns: The child displayed by self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_expander_get_child(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the TreeExpander should be hidden in a GtkTreeListRow.
      Returns: TRUE if the expander icon should be hidden. Otherwise FALSE.
  */
  bool getHideExpander() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_hide_expander(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      TreeExpander indents each level of depth with an additional indent.
      Returns: TRUE if the child should be indented . Otherwise FALSE.
  */
  bool getIndentForDepth() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_indent_for_depth(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      TreeExpander indents the child by the width of an expander-icon if it is not expandable.
      Returns: TRUE if the child should be indented when not expandable. Otherwise FALSE.
  */
  bool getIndentForIcon() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_expander_get_indent_for_icon(cast(GtkTreeExpander*)this._cPtr);
    return _retval;
  }

  /**
      Forwards the item set on the [gid.gtk4.tree_list_row.TreeListRow] that self is managing.
      
      This call is essentially equivalent to calling:
      
      ```c
      gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (self));
      ```
      Returns: The item of the row
  */
  gid.gobject2.object.ObjectWrap getItem() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_tree_expander_get_item(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the list row managed by self.
      Returns: The list row displayed by self
  */
  gid.gtk4.tree_list_row.TreeListRow getListRow() nothrow
  {
    GtkTreeListRow* _cretval;
    _cretval = gtk_tree_expander_get_list_row(cast(GtkTreeExpander*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_list_row.TreeListRow)(cast(GtkTreeListRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the content widget to display.
  
      Params:
        child = a [gid.gtk4.widget.Widget]
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_tree_expander_set_child(cast(GtkTreeExpander*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the expander icon should be visible in a GtkTreeListRow.
  
      Params:
        hideExpander = TRUE if the expander should be hidden. Otherwise FALSE.
  */
  void setHideExpander(bool hideExpander) nothrow
  {
    gtk_tree_expander_set_hide_expander(cast(GtkTreeExpander*)this._cPtr, hideExpander);
  }

  /**
      Sets if the TreeExpander should indent the child according to its depth.
  
      Params:
        indentForDepth = TRUE if the child should be indented. Otherwise FALSE.
  */
  void setIndentForDepth(bool indentForDepth) nothrow
  {
    gtk_tree_expander_set_indent_for_depth(cast(GtkTreeExpander*)this._cPtr, indentForDepth);
  }

  /**
      Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable.
  
      Params:
        indentForIcon = TRUE if the child should be indented without expander. Otherwise FALSE.
  */
  void setIndentForIcon(bool indentForIcon) nothrow
  {
    gtk_tree_expander_set_indent_for_icon(cast(GtkTreeExpander*)this._cPtr, indentForIcon);
  }

  /**
      Sets the tree list row that this expander should manage.
  
      Params:
        listRow = a [gid.gtk4.tree_list_row.TreeListRow]
  */
  void setListRow(gid.gtk4.tree_list_row.TreeListRow listRow = null) nothrow
  {
    gtk_tree_expander_set_list_row(cast(GtkTreeExpander*)this._cPtr, listRow ? cast(GtkTreeListRow*)listRow._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_expander.TreeExpander]
class TreeExpanderGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget with the actual contents.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `hideExpander` property.
      Params:
        propval = Whether the expander icon should be hidden in a GtkTreeListRow.
          Note that this property simply hides the icon.  The actions and keybinding
          (i.e. collapse and expand) are not affected by this property.
          
          A common use for this property would be to bind to the number of children in a
          GtkTreeListRow's model in order to hide the expander when a row has no children.
      Returns: Builder instance for fluent chaining
  */
  T hideExpander(bool propval) nothrow
  {
    return setProperty("hide-expander", propval);
  }

  /**
      Set `indentForDepth` property.
      Params:
        propval = TreeExpander indents the child according to its depth.
      Returns: Builder instance for fluent chaining
  */
  T indentForDepth(bool propval) nothrow
  {
    return setProperty("indent-for-depth", propval);
  }

  /**
      Set `indentForIcon` property.
      Params:
        propval = TreeExpander indents the child by the width of an expander-icon if it is not expandable.
      Returns: Builder instance for fluent chaining
  */
  T indentForIcon(bool propval) nothrow
  {
    return setProperty("indent-for-icon", propval);
  }

  /**
      Set `listRow` property.
      Params:
        propval = The list row to track for expander state.
      Returns: Builder instance for fluent chaining
  */
  T listRow(gid.gtk4.tree_list_row.TreeListRow propval) nothrow
  {
    return setProperty("list-row", propval);
  }
}

/// Fluent builder for [gid.gtk4.tree_expander.TreeExpander]
final class TreeExpanderGidBuilder : TreeExpanderGidBuilderImpl!TreeExpanderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeExpander build() nothrow
  {
    return new TreeExpander(cast(void*)createGObject(TreeExpander._getGType), Yes.Take);
  }
}
