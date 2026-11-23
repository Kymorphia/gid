/// Module for [ToolPalette] class
module gid.gtk3.tool_palette;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.selection_data;
import gid.gtk3.target_entry;
import gid.gtk3.tool_item;
import gid.gtk3.tool_item_group;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkToolPalette allows you to add #GtkToolItems to a palette-like
    container with different categories and drag and drop support.
    
    A #GtkToolPalette is created with a call to [gid.gtk3.tool_palette.ToolPalette.new_].
    
    #GtkToolItems cannot be added directly to a #GtkToolPalette -
    instead they are added to a #GtkToolItemGroup which can than be added
    to a #GtkToolPalette. To add a #GtkToolItemGroup to a #GtkToolPalette,
    use [gid.gtk3.container.Container.add].
    
    ```c
    GtkWidget *palette, *group;
    GtkToolItem *item;
    
    palette = gtk_tool_palette_new ();
    group = gtk_tool_item_group_new (_("Test Category"));
    gtk_container_add (GTK_CONTAINER (palette), group);
    
    item = gtk_tool_button_new (NULL, _("_Open"));
    gtk_tool_button_set_icon_name (GTK_TOOL_BUTTON (item), "document-open");
    gtk_tool_item_group_insert (GTK_TOOL_ITEM_GROUP (group), item, -1);
    ```
    
    The easiest way to use drag and drop with #GtkToolPalette is to call
    [gid.gtk3.tool_palette.ToolPalette.addDragDest] with the desired drag source @palette
    and the desired drag target @widget. Then [gid.gtk3.tool_palette.ToolPalette.getDragItem]
    can be used to get the dragged item in the #GtkWidget::drag-data-received
    signal handler of the drag target.
    
    ```c
    static void
    passive_canvas_drag_data_received (GtkWidget        *widget,
                                       GdkDragContext   *context,
                                       gint              x,
                                       gint              y,
                                       GtkSelectionData *selection,
                                       guint             info,
                                       guint             time,
                                       gpointer          data)
    {
      GtkWidget *palette;
      GtkWidget *item;
    
      // Get the dragged item
      palette = gtk_widget_get_ancestor (gtk_drag_get_source_widget (context),
                                         GTK_TYPE_TOOL_PALETTE);
      if (palette != NULL)
        item = gtk_tool_palette_get_drag_item (GTK_TOOL_PALETTE (palette),
                                               selection);
    
      // Do something with item
    }
    
    GtkWidget *target, palette;
    
    palette = gtk_tool_palette_new ();
    target = gtk_drawing_area_new ();
    
    g_signal_connect (G_OBJECT (target), "drag-data-received",
                      G_CALLBACK (passive_canvas_drag_data_received), NULL);
    gtk_tool_palette_add_drag_dest (GTK_TOOL_PALETTE (palette), target,
                                    GTK_DEST_DEFAULT_ALL,
                                    GTK_TOOL_PALETTE_DRAG_ITEMS,
                                    GDK_ACTION_COPY);
    ```
    
    # CSS nodes
    
    GtkToolPalette has a single CSS node named toolpalette.
*/
class ToolPalette : gid.gtk3.container.Container, gid.gtk3.orientable.Orientable, gid.gtk3.scrollable.Scrollable
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
    return cast(void function())gtk_tool_palette_get_type != &gidSymbolNotFound ? gtk_tool_palette_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToolPalette";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolPalette self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tool_palette.ToolPalette]
      Returns: New builder object
  */
  static ToolPaletteGidBuilder builder() nothrow
  {
    return new ToolPaletteGidBuilder;
  }

  /**
      Get `iconSize` property.
      Returns: The size of the icons in a tool palette. When this property is set,
        it overrides the default setting.
        
        This should only be used for special-purpose tool palettes, normal
        application tool palettes should respect the user preferences for the
        size of icons.
  */
  @property gid.gtk3.types.IconSize iconSize() nothrow
  {
    return getIconSize();
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The size of the icons in a tool palette. When this property is set,
          it overrides the default setting.
          
          This should only be used for special-purpose tool palettes, normal
          application tool palettes should respect the user preferences for the
          size of icons.
  */
  @property void iconSize(gid.gtk3.types.IconSize propval) nothrow
  {
    setIconSize(propval);
  }

  /**
      Get `iconSizeSet` property.
      Returns: Is true if the #GtkToolPalette:icon-size property has been set.
  */
  @property bool iconSizeSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("icon-size-set");
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the #GtkToolPalette:icon-size property has been set.
  */
  @property void iconSizeSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("icon-size-set", propval);
  }

  /**
      Get `toolbarStyle` property.
      Returns: The style of items in the tool palette.
  */
  @property gid.gtk3.types.ToolbarStyle toolbarStyle() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ToolbarStyle)("toolbar-style");
  }

  /**
      Set `toolbarStyle` property.
      Params:
        propval = The style of items in the tool palette.
  */
  @property void toolbarStyle(gid.gtk3.types.ToolbarStyle propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ToolbarStyle)("toolbar-style", propval);
  }

  mixin OrientableT!();
  mixin ScrollableT!();

  /**
      Creates a new tool palette.
      Returns: a new #GtkToolPalette
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
      _cretval = gtk_tool_palette_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Get the target entry for a dragged #GtkToolItemGroup.
      Returns: the #GtkTargetEntry for a dragged group
  */
  static gid.gtk3.target_entry.TargetEntry getDragTargetGroup() nothrow
  {
    const(GtkTargetEntry)* _cretval;
    _cretval = gtk_tool_palette_get_drag_target_group();
    auto _retval = _cretval ? new gid.gtk3.target_entry.TargetEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the target entry for a dragged #GtkToolItem.
      Returns: the #GtkTargetEntry for a dragged item.
  */
  static gid.gtk3.target_entry.TargetEntry getDragTargetItem() nothrow
  {
    const(GtkTargetEntry)* _cretval;
    _cretval = gtk_tool_palette_get_drag_target_item();
    auto _retval = _cretval ? new gid.gtk3.target_entry.TargetEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets palette as drag source (see [gid.gtk3.tool_palette.ToolPalette.setDragSource])
      and sets widget as a drag destination for drags from palette.
      See [gid.gtk3.widget.Widget.dragDestSet].
  
      Params:
        widget = a #GtkWidget which should be a drag destination for palette
        flags = the flags that specify what actions GTK+ should take for drops
              on that widget
        targets = the #GtkToolPaletteDragTargets which the widget
              should support
        actions = the #GdkDragActions which the widget should suppport
  */
  void addDragDest(gid.gtk3.widget.Widget widget, gid.gtk3.types.DestDefaults flags, gid.gtk3.types.ToolPaletteDragTargets targets, gid.gdk3.types.DragAction actions) nothrow
  {
    gtk_tool_palette_add_drag_dest(cast(GtkToolPalette*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags, targets, actions);
  }

  /**
      Get the dragged item from the selection.
      This could be a #GtkToolItem or a #GtkToolItemGroup.
  
      Params:
        selection = a #GtkSelectionData
      Returns: the dragged item in selection
  */
  gid.gtk3.widget.Widget getDragItem(gid.gtk3.selection_data.SelectionData selection) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_palette_get_drag_item(cast(GtkToolPalette*)this._cPtr, selection ? cast(const(GtkSelectionData)*)selection._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the group at position (x, y).
  
      Params:
        x = the x position
        y = the y position
      Returns: the #GtkToolItemGroup at position
        or null if there is no such group
  */
  gid.gtk3.tool_item_group.ToolItemGroup getDropGroup(int x, int y) nothrow
  {
    GtkToolItemGroup* _cretval;
    _cretval = gtk_tool_palette_get_drop_group(cast(GtkToolPalette*)this._cPtr, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tool_item_group.ToolItemGroup)(cast(GtkToolItemGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the item at position (x, y).
      See [gid.gtk3.tool_palette.ToolPalette.getDropGroup].
  
      Params:
        x = the x position
        y = the y position
      Returns: the #GtkToolItem at position or null if there is no such item
  */
  gid.gtk3.tool_item.ToolItem getDropItem(int x, int y) nothrow
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_palette_get_drop_item(cast(GtkToolPalette*)this._cPtr, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether group is exclusive or not.
      See [gid.gtk3.tool_palette.ToolPalette.setExclusive].
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
      Returns: true if group is exclusive
  */
  bool getExclusive(gid.gtk3.tool_item_group.ToolItemGroup group) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_palette_get_exclusive(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether group should be given extra space.
      See [gid.gtk3.tool_palette.ToolPalette.setExpand].
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
      Returns: true if group should be given extra space, false otherwise
  */
  bool getExpand(gid.gtk3.tool_item_group.ToolItemGroup group) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_palette_get_expand(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the position of group in palette as index.
      See [gid.gtk3.tool_palette.ToolPalette.setGroupPosition].
  
      Params:
        group = a #GtkToolItemGroup
      Returns: the index of group or -1 if group is not a child of palette
  */
  int getGroupPosition(gid.gtk3.tool_item_group.ToolItemGroup group) nothrow
  {
    int _retval;
    _retval = gtk_tool_palette_get_group_position(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the horizontal adjustment of the tool palette.
      Returns: the horizontal adjustment of palette
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getHadjustment]
  */
  gid.gtk3.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tool_palette_get_hadjustment(cast(GtkToolPalette*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size of icons in the tool palette.
      See [gid.gtk3.tool_palette.ToolPalette.setIconSize].
      Returns: the #GtkIconSize of icons in the tool palette
  */
  gid.gtk3.types.IconSize getIconSize() nothrow
  {
    GtkIconSize _cretval;
    _cretval = gtk_tool_palette_get_icon_size(cast(GtkToolPalette*)this._cPtr);
    gid.gtk3.types.IconSize _retval = cast(gid.gtk3.types.IconSize)_cretval;
    return _retval;
  }

  alias getStyle = gid.gtk3.widget.Widget.getStyle;

  /**
      Gets the style (icons, text or both) of items in the tool palette.
      Returns: the #GtkToolbarStyle of items in the tool palette.
  */
  gid.gtk3.types.ToolbarStyle getStyle() nothrow
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_tool_palette_get_style(cast(GtkToolPalette*)this._cPtr);
    gid.gtk3.types.ToolbarStyle _retval = cast(gid.gtk3.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Gets the vertical adjustment of the tool palette.
      Returns: the vertical adjustment of palette
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getVadjustment]
  */
  gid.gtk3.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tool_palette_get_vadjustment(cast(GtkToolPalette*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the tool palette as a drag source.
      Enables all groups and items in the tool palette as drag sources
      on button 1 and button 3 press with copy and move actions.
      See [gid.gtk3.widget.Widget.dragSourceSet].
  
      Params:
        targets = the #GtkToolPaletteDragTargets
              which the widget should support
  */
  void setDragSource(gid.gtk3.types.ToolPaletteDragTargets targets) nothrow
  {
    gtk_tool_palette_set_drag_source(cast(GtkToolPalette*)this._cPtr, targets);
  }

  /**
      Sets whether the group should be exclusive or not.
      If an exclusive group is expanded all other groups are collapsed.
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
        exclusive = whether the group should be exclusive or not
  */
  void setExclusive(gid.gtk3.tool_item_group.ToolItemGroup group, bool exclusive) nothrow
  {
    gtk_tool_palette_set_exclusive(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null, exclusive);
  }

  /**
      Sets whether the group should be given extra space.
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
        expand = whether the group should be given extra space
  */
  void setExpand(gid.gtk3.tool_item_group.ToolItemGroup group, bool expand) nothrow
  {
    gtk_tool_palette_set_expand(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null, expand);
  }

  /**
      Sets the position of the group as an index of the tool palette.
      If position is 0 the group will become the first child, if position is
      -1 it will become the last child.
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
        position = a new index for group
  */
  void setGroupPosition(gid.gtk3.tool_item_group.ToolItemGroup group, int position) nothrow
  {
    gtk_tool_palette_set_group_position(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the size of icons in the tool palette.
  
      Params:
        iconSize = the #GtkIconSize that icons in the tool
              palette shall have
  */
  void setIconSize(gid.gtk3.types.IconSize iconSize) nothrow
  {
    gtk_tool_palette_set_icon_size(cast(GtkToolPalette*)this._cPtr, iconSize);
  }

  alias setStyle = gid.gtk3.widget.Widget.setStyle;

  /**
      Sets the style (text, icons or both) of items in the tool palette.
  
      Params:
        style = the #GtkToolbarStyle that items in the tool palette shall have
  */
  void setStyle(gid.gtk3.types.ToolbarStyle style) nothrow
  {
    gtk_tool_palette_set_style(cast(GtkToolPalette*)this._cPtr, style);
  }

  /**
      Unsets the tool palette icon size set with [gid.gtk3.tool_palette.ToolPalette.setIconSize],
      so that user preferences will be used to determine the icon size.
  */
  void unsetIconSize() nothrow
  {
    gtk_tool_palette_unset_icon_size(cast(GtkToolPalette*)this._cPtr);
  }

  /**
      Unsets a toolbar style set with [gid.gtk3.tool_palette.ToolPalette.setStyle],
      so that user preferences will be used to determine the toolbar style.
  */
  void unsetStyle() nothrow
  {
    gtk_tool_palette_unset_style(cast(GtkToolPalette*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gtk3.tool_palette.ToolPalette]
class ToolPaletteGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
  mixin ScrollableGidBuilderT!();

  /**
      Set `iconSize` property.
      Params:
        propval = The size of the icons in a tool palette. When this property is set,
          it overrides the default setting.
          
          This should only be used for special-purpose tool palettes, normal
          application tool palettes should respect the user preferences for the
          size of icons.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(gid.gtk3.types.IconSize propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the #GtkToolPalette:icon-size property has been set.
      Returns: Builder instance for fluent chaining
  */
  T iconSizeSet(bool propval) nothrow
  {
    return setProperty("icon-size-set", propval);
  }

  /**
      Set `toolbarStyle` property.
      Params:
        propval = The style of items in the tool palette.
      Returns: Builder instance for fluent chaining
  */
  T toolbarStyle(gid.gtk3.types.ToolbarStyle propval) nothrow
  {
    return setProperty("toolbar-style", propval);
  }
}

/// Fluent builder for [gid.gtk3.tool_palette.ToolPalette]
final class ToolPaletteGidBuilder : ToolPaletteGidBuilderImpl!ToolPaletteGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToolPalette build() nothrow
  {
    return new ToolPalette(cast(void*)createGObject(ToolPalette._getGType), Yes.Take);
  }
}
