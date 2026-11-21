/// Module for [ToolItemGroup] class
module gid.gtk3.tool_item_group;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.tool_item;
import gid.gtk3.tool_shell;
import gid.gtk3.tool_shell_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.types;

/**
    A #GtkToolItemGroup is used together with #GtkToolPalette to add
    #GtkToolItems to a palette like container with different
    categories and drag and drop support.
    
    # CSS nodes
    
    GtkToolItemGroup has a single CSS node named toolitemgroup.
*/
class ToolItemGroup : gid.gtk3.container.Container, gid.gtk3.tool_shell.ToolShell
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
    return cast(void function())gtk_tool_item_group_get_type != &gidSymbolNotFound ? gtk_tool_item_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToolItemGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolItemGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tool_item_group.ToolItemGroup]
      Returns: New builder object
  */
  static ToolItemGroupGidBuilder builder() nothrow
  {
    return new ToolItemGroupGidBuilder;
  }

  /** */
  @property bool collapsed() nothrow
  {
    return getCollapsed();
  }

  /** */
  @property void collapsed(bool propval) nothrow
  {
    setCollapsed(propval);
  }

  /** */
  @property gid.pango1.types.EllipsizeMode ellipsize() nothrow
  {
    return getEllipsize();
  }

  /** */
  @property void ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    setEllipsize(propval);
  }

  /** */
  @property gid.gtk3.types.ReliefStyle headerRelief() nothrow
  {
    return getHeaderRelief();
  }

  /** */
  @property void headerRelief(gid.gtk3.types.ReliefStyle propval) nothrow
  {
    setHeaderRelief(propval);
  }

  /** */
  @property string label() nothrow
  {
    return getLabel();
  }

  /** */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /** */
  @property gid.gtk3.widget.Widget labelWidget() nothrow
  {
    return getLabelWidget();
  }

  /** */
  @property void labelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    setLabelWidget(propval);
  }

  mixin ToolShellT!();
  alias getStyle = gid.gtk3.widget.Widget.getStyle;

  /**
      Creates a new tool item group with label label.
  
      Params:
        label = the label of the new group
      Returns: a new #GtkToolItemGroup.
  */
  this(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_tool_item_group_new(_label);
    this(_cretval, No.Take);
  }

  /**
      Gets whether group is collapsed or expanded.
      Returns: true if group is collapsed, false if it is expanded
  */
  bool getCollapsed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_group_get_collapsed(cast(GtkToolItemGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tool item at position (x, y).
  
      Params:
        x = the x position
        y = the y position
      Returns: the #GtkToolItem at position (x, y)
  */
  gid.gtk3.tool_item.ToolItem getDropItem(int x, int y) nothrow
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_item_group_get_drop_item(cast(GtkToolItemGroup*)this._cPtr, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the ellipsization mode of group.
      Returns: the #PangoEllipsizeMode of group
  */
  gid.pango1.types.EllipsizeMode getEllipsize() nothrow
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_tool_item_group_get_ellipsize(cast(GtkToolItemGroup*)this._cPtr);
    gid.pango1.types.EllipsizeMode _retval = cast(gid.pango1.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Gets the relief mode of the header button of group.
      Returns: the #GtkReliefStyle
  */
  gid.gtk3.types.ReliefStyle getHeaderRelief() nothrow
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_tool_item_group_get_header_relief(cast(GtkToolItemGroup*)this._cPtr);
    gid.gtk3.types.ReliefStyle _retval = cast(gid.gtk3.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Gets the position of item in group as index.
  
      Params:
        item = a #GtkToolItem
      Returns: the index of item in group or -1 if item is no child of group
  */
  int getItemPosition(gid.gtk3.tool_item.ToolItem item) nothrow
  {
    int _retval;
    _retval = gtk_tool_item_group_get_item_position(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the label of group.
      Returns: the label of group. The label is an internal string of group
            and must not be modified. Note that null is returned if a custom
            label has been set with [gid.gtk3.tool_item_group.ToolItemGroup.setLabelWidget]
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_tool_item_group_get_label(cast(GtkToolItemGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the label widget of group.
      See [gid.gtk3.tool_item_group.ToolItemGroup.setLabelWidget].
      Returns: the label widget of group
  */
  gid.gtk3.widget.Widget getLabelWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_item_group_get_label_widget(cast(GtkToolItemGroup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of tool items in group.
      Returns: the number of tool items in group
  */
  uint getNItems() nothrow
  {
    uint _retval;
    _retval = gtk_tool_item_group_get_n_items(cast(GtkToolItemGroup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tool item at index in group.
  
      Params:
        index = the index
      Returns: the #GtkToolItem at index
  */
  gid.gtk3.tool_item.ToolItem getNthItem(uint index) nothrow
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_item_group_get_nth_item(cast(GtkToolItemGroup*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts item at position in the list of children of group.
  
      Params:
        item = the #GtkToolItem to insert into group
        position = the position of item in group, starting with 0.
              The position -1 means end of list.
  */
  void insert(gid.gtk3.tool_item.ToolItem item, int position) nothrow
  {
    gtk_tool_item_group_insert(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Sets whether the group should be collapsed or expanded.
  
      Params:
        collapsed = whether the group should be collapsed or expanded
  */
  void setCollapsed(bool collapsed) nothrow
  {
    gtk_tool_item_group_set_collapsed(cast(GtkToolItemGroup*)this._cPtr, collapsed);
  }

  /**
      Sets the ellipsization mode which should be used by labels in group.
  
      Params:
        ellipsize = the #PangoEllipsizeMode labels in group should use
  */
  void setEllipsize(gid.pango1.types.EllipsizeMode ellipsize) nothrow
  {
    gtk_tool_item_group_set_ellipsize(cast(GtkToolItemGroup*)this._cPtr, ellipsize);
  }

  /**
      Set the button relief of the group header.
      See [gid.gtk3.button.Button.setRelief] for details.
  
      Params:
        style = the #GtkReliefStyle
  */
  void setHeaderRelief(gid.gtk3.types.ReliefStyle style) nothrow
  {
    gtk_tool_item_group_set_header_relief(cast(GtkToolItemGroup*)this._cPtr, style);
  }

  /**
      Sets the position of item in the list of children of group.
  
      Params:
        item = the #GtkToolItem to move to a new position, should
              be a child of group.
        position = the new position of item in group, starting with 0.
              The position -1 means end of list.
  */
  void setItemPosition(gid.gtk3.tool_item.ToolItem item, int position) nothrow
  {
    gtk_tool_item_group_set_item_position(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the label of the tool item group. The label is displayed in the header
      of the group.
  
      Params:
        label = the new human-readable label of of the group
  */
  void setLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_tool_item_group_set_label(cast(GtkToolItemGroup*)this._cPtr, _label);
  }

  /**
      Sets the label of the tool item group.
      The label widget is displayed in the header of the group, in place
      of the usual label.
  
      Params:
        labelWidget = the widget to be displayed in place of the usual label
  */
  void setLabelWidget(gid.gtk3.widget.Widget labelWidget) nothrow
  {
    gtk_tool_item_group_set_label_widget(cast(GtkToolItemGroup*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.tool_item_group.ToolItemGroup]
class ToolItemGroupGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.tool_shell.ToolShellGidBuilderImpl!T
{

  mixin ToolShellGidBuilderT!();

  /** */
  T collapsed(bool propval) nothrow
  {
    return setProperty("collapsed", propval);
  }

  /** */
  T ellipsize(gid.pango1.types.EllipsizeMode propval) nothrow
  {
    return setProperty("ellipsize", propval);
  }

  /** */
  T headerRelief(gid.gtk3.types.ReliefStyle propval) nothrow
  {
    return setProperty("header-relief", propval);
  }

  /** */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /** */
  T labelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("label-widget", propval);
  }
}

/// Fluent builder for [gid.gtk3.tool_item_group.ToolItemGroup]
final class ToolItemGroupGidBuilder : ToolItemGroupGidBuilderImpl!ToolItemGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToolItemGroup build() nothrow
  {
    return new ToolItemGroup(cast(void*)createGObject(ToolItemGroup._getGType), Yes.Take);
  }
}
