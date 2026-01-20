/// Module for [ToolPalette] class
module gtk.tool_palette;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.types;
import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.selection_data;
import gtk.target_entry;
import gtk.tool_item;
import gtk.tool_item_group;
import gtk.types;
import gtk.widget;

/**
    A #GtkToolPalette allows you to add #GtkToolItems to a palette-like
    container with different categories and drag and drop support.
    
    A #GtkToolPalette is created with a call to [gtk.tool_palette.ToolPalette.new_].
    
    #GtkToolItems cannot be added directly to a #GtkToolPalette -
    instead they are added to a #GtkToolItemGroup which can than be added
    to a #GtkToolPalette. To add a #GtkToolItemGroup to a #GtkToolPalette,
    use [gtk.container.Container.add].
    
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
    [gtk.tool_palette.ToolPalette.addDragDest] with the desired drag source @palette
    and the desired drag target @widget. Then [gtk.tool_palette.ToolPalette.getDragItem]
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
class ToolPalette : gtk.container.Container, gtk.orientable.Orientable, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_tool_palette_get_type != &gidSymbolNotFound ? gtk_tool_palette_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolPalette self()
  {
    return this;
  }

  /**
      Get `iconSize` property.
      Returns: The size of the icons in a tool palette. When this property is set,
        it overrides the default setting.
        
        This should only be used for special-purpose tool palettes, normal
        application tool palettes should respect the user preferences for the
        size of icons.
  */
  @property gtk.types.IconSize iconSize()
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
  @property void iconSize(gtk.types.IconSize propval)
  {
    return setIconSize(propval);
  }

  /**
      Get `iconSizeSet` property.
      Returns: Is true if the #GtkToolPalette:icon-size property has been set.
  */
  @property bool iconSizeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("icon-size-set");
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the #GtkToolPalette:icon-size property has been set.
  */
  @property void iconSizeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("icon-size-set", propval);
  }

  /**
      Get `toolbarStyle` property.
      Returns: The style of items in the tool palette.
  */
  @property gtk.types.ToolbarStyle toolbarStyle()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ToolbarStyle)("toolbar-style");
  }

  /**
      Set `toolbarStyle` property.
      Params:
        propval = The style of items in the tool palette.
  */
  @property void toolbarStyle(gtk.types.ToolbarStyle propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ToolbarStyle)("toolbar-style", propval);
  }

  mixin OrientableT!();
  mixin ScrollableT!();

  /**
      Creates a new tool palette.
      Returns: a new #GtkToolPalette
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_palette_new();
    this(_cretval, No.Take);
  }

  /**
      Get the target entry for a dragged #GtkToolItemGroup.
      Returns: the #GtkTargetEntry for a dragged group
  */
  static gtk.target_entry.TargetEntry getDragTargetGroup()
  {
    const(GtkTargetEntry)* _cretval;
    _cretval = gtk_tool_palette_get_drag_target_group();
    auto _retval = _cretval ? new gtk.target_entry.TargetEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the target entry for a dragged #GtkToolItem.
      Returns: the #GtkTargetEntry for a dragged item.
  */
  static gtk.target_entry.TargetEntry getDragTargetItem()
  {
    const(GtkTargetEntry)* _cretval;
    _cretval = gtk_tool_palette_get_drag_target_item();
    auto _retval = _cretval ? new gtk.target_entry.TargetEntry(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets palette as drag source (see [gtk.tool_palette.ToolPalette.setDragSource])
      and sets widget as a drag destination for drags from palette.
      See [gtk.widget.Widget.dragDestSet].
  
      Params:
        widget = a #GtkWidget which should be a drag destination for palette
        flags = the flags that specify what actions GTK+ should take for drops
              on that widget
        targets = the #GtkToolPaletteDragTargets which the widget
              should support
        actions = the #GdkDragActions which the widget should suppport
  */
  void addDragDest(gtk.widget.Widget widget, gtk.types.DestDefaults flags, gtk.types.ToolPaletteDragTargets targets, gdk.types.DragAction actions)
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
  gtk.widget.Widget getDragItem(gtk.selection_data.SelectionData selection)
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_palette_get_drag_item(cast(GtkToolPalette*)this._cPtr, selection ? cast(const(GtkSelectionData)*)selection._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
  gtk.tool_item_group.ToolItemGroup getDropGroup(int x, int y)
  {
    GtkToolItemGroup* _cretval;
    _cretval = gtk_tool_palette_get_drop_group(cast(GtkToolPalette*)this._cPtr, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_item_group.ToolItemGroup)(cast(GtkToolItemGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the item at position (x, y).
      See [gtk.tool_palette.ToolPalette.getDropGroup].
  
      Params:
        x = the x position
        y = the y position
      Returns: the #GtkToolItem at position or null if there is no such item
  */
  gtk.tool_item.ToolItem getDropItem(int x, int y)
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_palette_get_drop_item(cast(GtkToolPalette*)this._cPtr, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether group is exclusive or not.
      See [gtk.tool_palette.ToolPalette.setExclusive].
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
      Returns: true if group is exclusive
  */
  bool getExclusive(gtk.tool_item_group.ToolItemGroup group)
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_palette_get_exclusive(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether group should be given extra space.
      See [gtk.tool_palette.ToolPalette.setExpand].
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
      Returns: true if group should be given extra space, false otherwise
  */
  bool getExpand(gtk.tool_item_group.ToolItemGroup group)
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_palette_get_expand(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the position of group in palette as index.
      See [gtk.tool_palette.ToolPalette.setGroupPosition].
  
      Params:
        group = a #GtkToolItemGroup
      Returns: the index of group or -1 if group is not a child of palette
  */
  int getGroupPosition(gtk.tool_item_group.ToolItemGroup group)
  {
    int _retval;
    _retval = gtk_tool_palette_get_group_position(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the horizontal adjustment of the tool palette.
      Returns: the horizontal adjustment of palette
  
      Deprecated: Use [gtk.scrollable.Scrollable.getHadjustment]
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tool_palette_get_hadjustment(cast(GtkToolPalette*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size of icons in the tool palette.
      See [gtk.tool_palette.ToolPalette.setIconSize].
      Returns: the #GtkIconSize of icons in the tool palette
  */
  gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_tool_palette_get_icon_size(cast(GtkToolPalette*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  alias getStyle = gtk.widget.Widget.getStyle;

  /**
      Gets the style (icons, text or both) of items in the tool palette.
      Returns: the #GtkToolbarStyle of items in the tool palette.
  */
  gtk.types.ToolbarStyle getStyle()
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_tool_palette_get_style(cast(GtkToolPalette*)this._cPtr);
    gtk.types.ToolbarStyle _retval = cast(gtk.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Gets the vertical adjustment of the tool palette.
      Returns: the vertical adjustment of palette
  
      Deprecated: Use [gtk.scrollable.Scrollable.getVadjustment]
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tool_palette_get_vadjustment(cast(GtkToolPalette*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the tool palette as a drag source.
      Enables all groups and items in the tool palette as drag sources
      on button 1 and button 3 press with copy and move actions.
      See [gtk.widget.Widget.dragSourceSet].
  
      Params:
        targets = the #GtkToolPaletteDragTargets
              which the widget should support
  */
  void setDragSource(gtk.types.ToolPaletteDragTargets targets)
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
  void setExclusive(gtk.tool_item_group.ToolItemGroup group, bool exclusive)
  {
    gtk_tool_palette_set_exclusive(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null, exclusive);
  }

  /**
      Sets whether the group should be given extra space.
  
      Params:
        group = a #GtkToolItemGroup which is a child of palette
        expand = whether the group should be given extra space
  */
  void setExpand(gtk.tool_item_group.ToolItemGroup group, bool expand)
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
  void setGroupPosition(gtk.tool_item_group.ToolItemGroup group, int position)
  {
    gtk_tool_palette_set_group_position(cast(GtkToolPalette*)this._cPtr, group ? cast(GtkToolItemGroup*)group._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the size of icons in the tool palette.
  
      Params:
        iconSize = the #GtkIconSize that icons in the tool
              palette shall have
  */
  void setIconSize(gtk.types.IconSize iconSize)
  {
    gtk_tool_palette_set_icon_size(cast(GtkToolPalette*)this._cPtr, iconSize);
  }

  alias setStyle = gtk.widget.Widget.setStyle;

  /**
      Sets the style (text, icons or both) of items in the tool palette.
  
      Params:
        style = the #GtkToolbarStyle that items in the tool palette shall have
  */
  void setStyle(gtk.types.ToolbarStyle style)
  {
    gtk_tool_palette_set_style(cast(GtkToolPalette*)this._cPtr, style);
  }

  /**
      Unsets the tool palette icon size set with [gtk.tool_palette.ToolPalette.setIconSize],
      so that user preferences will be used to determine the icon size.
  */
  void unsetIconSize()
  {
    gtk_tool_palette_unset_icon_size(cast(GtkToolPalette*)this._cPtr);
  }

  /**
      Unsets a toolbar style set with [gtk.tool_palette.ToolPalette.setStyle],
      so that user preferences will be used to determine the toolbar style.
  */
  void unsetStyle()
  {
    gtk_tool_palette_unset_style(cast(GtkToolPalette*)this._cPtr);
  }
}
