/// Module for [ToolItemGroup] class
module gtk.tool_item_group;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.tool_item;
import gtk.tool_shell;
import gtk.tool_shell_mixin;
import gtk.types;
import gtk.widget;
import pango.types;

/**
    A #GtkToolItemGroup is used together with #GtkToolPalette to add
    #GtkToolItems to a palette like container with different
    categories and drag and drop support.
    
    # CSS nodes
    
    GtkToolItemGroup has a single CSS node named toolitemgroup.
*/
class ToolItemGroup : gtk.container.Container, gtk.tool_shell.ToolShell
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
    return cast(void function())gtk_tool_item_group_get_type != &gidSymbolNotFound ? gtk_tool_item_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolItemGroup self()
  {
    return this;
  }

  /** */
  @property bool collapsed()
  {
    return getCollapsed();
  }

  /** */
  @property void collapsed(bool propval)
  {
    return setCollapsed(propval);
  }

  /** */
  @property pango.types.EllipsizeMode ellipsize()
  {
    return getEllipsize();
  }

  /** */
  @property void ellipsize(pango.types.EllipsizeMode propval)
  {
    return setEllipsize(propval);
  }

  /** */
  @property gtk.types.ReliefStyle headerRelief()
  {
    return getHeaderRelief();
  }

  /** */
  @property void headerRelief(gtk.types.ReliefStyle propval)
  {
    return setHeaderRelief(propval);
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /** */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /** */
  @property void labelWidget(gtk.widget.Widget propval)
  {
    return setLabelWidget(propval);
  }

  mixin ToolShellT!();
  alias getStyle = gtk.widget.Widget.getStyle;

  /**
      Creates a new tool item group with label label.
  
      Params:
        label = the label of the new group
      Returns: a new #GtkToolItemGroup.
  */
  this(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_tool_item_group_new(_label);
    this(_cretval, No.Take);
  }

  /**
      Gets whether group is collapsed or expanded.
      Returns: true if group is collapsed, false if it is expanded
  */
  bool getCollapsed()
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
  gtk.tool_item.ToolItem getDropItem(int x, int y)
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_item_group_get_drop_item(cast(GtkToolItemGroup*)this._cPtr, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the ellipsization mode of group.
      Returns: the #PangoEllipsizeMode of group
  */
  pango.types.EllipsizeMode getEllipsize()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_tool_item_group_get_ellipsize(cast(GtkToolItemGroup*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Gets the relief mode of the header button of group.
      Returns: the #GtkReliefStyle
  */
  gtk.types.ReliefStyle getHeaderRelief()
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_tool_item_group_get_header_relief(cast(GtkToolItemGroup*)this._cPtr);
    gtk.types.ReliefStyle _retval = cast(gtk.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Gets the position of item in group as index.
  
      Params:
        item = a #GtkToolItem
      Returns: the index of item in group or -1 if item is no child of group
  */
  int getItemPosition(gtk.tool_item.ToolItem item)
  {
    int _retval;
    _retval = gtk_tool_item_group_get_item_position(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the label of group.
      Returns: the label of group. The label is an internal string of group
            and must not be modified. Note that null is returned if a custom
            label has been set with [gtk.tool_item_group.ToolItemGroup.setLabelWidget]
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_tool_item_group_get_label(cast(GtkToolItemGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the label widget of group.
      See [gtk.tool_item_group.ToolItemGroup.setLabelWidget].
      Returns: the label widget of group
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_item_group_get_label_widget(cast(GtkToolItemGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of tool items in group.
      Returns: the number of tool items in group
  */
  uint getNItems()
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
  gtk.tool_item.ToolItem getNthItem(uint index)
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_item_group_get_nth_item(cast(GtkToolItemGroup*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts item at position in the list of children of group.
  
      Params:
        item = the #GtkToolItem to insert into group
        position = the position of item in group, starting with 0.
              The position -1 means end of list.
  */
  void insert(gtk.tool_item.ToolItem item, int position)
  {
    gtk_tool_item_group_insert(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Sets whether the group should be collapsed or expanded.
  
      Params:
        collapsed = whether the group should be collapsed or expanded
  */
  void setCollapsed(bool collapsed)
  {
    gtk_tool_item_group_set_collapsed(cast(GtkToolItemGroup*)this._cPtr, collapsed);
  }

  /**
      Sets the ellipsization mode which should be used by labels in group.
  
      Params:
        ellipsize = the #PangoEllipsizeMode labels in group should use
  */
  void setEllipsize(pango.types.EllipsizeMode ellipsize)
  {
    gtk_tool_item_group_set_ellipsize(cast(GtkToolItemGroup*)this._cPtr, ellipsize);
  }

  /**
      Set the button relief of the group header.
      See [gtk.button.Button.setRelief] for details.
  
      Params:
        style = the #GtkReliefStyle
  */
  void setHeaderRelief(gtk.types.ReliefStyle style)
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
  void setItemPosition(gtk.tool_item.ToolItem item, int position)
  {
    gtk_tool_item_group_set_item_position(cast(GtkToolItemGroup*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the label of the tool item group. The label is displayed in the header
      of the group.
  
      Params:
        label = the new human-readable label of of the group
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_tool_item_group_set_label(cast(GtkToolItemGroup*)this._cPtr, _label);
  }

  /**
      Sets the label of the tool item group.
      The label widget is displayed in the header of the group, in place
      of the usual label.
  
      Params:
        labelWidget = the widget to be displayed in place of the usual label
  */
  void setLabelWidget(gtk.widget.Widget labelWidget)
  {
    gtk_tool_item_group_set_label_widget(cast(GtkToolItemGroup*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }
}
