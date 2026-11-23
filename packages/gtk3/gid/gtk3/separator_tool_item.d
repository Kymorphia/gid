/// Module for [SeparatorToolItem] class
module gid.gtk3.separator_tool_item;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.tool_item;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkSeparatorToolItem is a #GtkToolItem that separates groups of other
    #GtkToolItems. Depending on the theme, a #GtkSeparatorToolItem will
    often look like a vertical line on horizontally docked toolbars.
    
    If the #GtkToolbar child property “expand” is true and the property
    #GtkSeparatorToolItem:draw is false, a #GtkSeparatorToolItem will act as
    a “spring” that forces other items to the ends of the toolbar.
    
    Use [gid.gtk3.separator_tool_item.SeparatorToolItem.new_] to create a new #GtkSeparatorToolItem.
    
    # CSS nodes
    
    GtkSeparatorToolItem has a single CSS node with name separator.
*/
class SeparatorToolItem : gid.gtk3.tool_item.ToolItem
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
    return cast(void function())gtk_separator_tool_item_get_type != &gidSymbolNotFound ? gtk_separator_tool_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSeparatorToolItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override SeparatorToolItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.separator_tool_item.SeparatorToolItem]
      Returns: New builder object
  */
  static SeparatorToolItemGidBuilder builder() nothrow
  {
    return new SeparatorToolItemGidBuilder;
  }

  alias draw = gid.gtk3.widget.Widget.draw;

  /** */
  @property bool draw() nothrow
  {
    return getDraw();
  }

  alias draw = gid.gtk3.widget.Widget.draw;

  /** */
  @property void draw(bool propval) nothrow
  {
    setDraw(propval);
  }

  /**
      Create a new #GtkSeparatorToolItem
      Returns: the new #GtkSeparatorToolItem
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkToolItem* _cretval;
      _cretval = gtk_separator_tool_item_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether item is drawn as a line, or just blank.
      See [gid.gtk3.separator_tool_item.SeparatorToolItem.setDraw].
      Returns: true if item is drawn as a line, or just blank.
  */
  bool getDraw() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_separator_tool_item_get_draw(cast(GtkSeparatorToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Whether item is drawn as a vertical line, or just blank.
      Setting this to false along with [gid.gtk3.tool_item.ToolItem.setExpand] is useful
      to create an item that forces following items to the end of the toolbar.
  
      Params:
        draw = whether item is drawn as a vertical line
  */
  void setDraw(bool draw) nothrow
  {
    gtk_separator_tool_item_set_draw(cast(GtkSeparatorToolItem*)this._cPtr, draw);
  }
}

/// Fluent builder implementation template for [gid.gtk3.separator_tool_item.SeparatorToolItem]
class SeparatorToolItemGidBuilderImpl(T) : gid.gtk3.tool_item.ToolItemGidBuilderImpl!T
{


  /** */
  T draw(bool propval) nothrow
  {
    return setProperty("draw", propval);
  }
}

/// Fluent builder for [gid.gtk3.separator_tool_item.SeparatorToolItem]
final class SeparatorToolItemGidBuilder : SeparatorToolItemGidBuilderImpl!SeparatorToolItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SeparatorToolItem build() nothrow
  {
    return new SeparatorToolItem(cast(void*)createGObject(SeparatorToolItem._getGType), Yes.Take);
  }
}
