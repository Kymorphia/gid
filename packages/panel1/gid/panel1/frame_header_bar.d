/// Module for [FrameHeaderBar] class
module gid.panel1.frame_header_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.popover_menu;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame_header;
import gid.panel1.frame_header_mixin;
import gid.panel1.types;

/**
    A header bar for #PanelFrame. It can optionally show an icon, it
    can have a popover to be displace, and it can also have prefix and
    suffix widgets.
    
    It is an implementation of #PanelFrameHeader
*/
class FrameHeaderBar : gid.gtk4.widget.Widget, gid.panel1.frame_header.FrameHeader
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
    return cast(void function())panel_frame_header_bar_get_type != &gidSymbolNotFound ? panel_frame_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelFrameHeaderBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameHeaderBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.frame_header_bar.FrameHeaderBar]
      Returns: New builder object
  */
  static FrameHeaderBarGidBuilder builder() nothrow
  {
    return new FrameHeaderBarGidBuilder;
  }

  /**
      Get `showIcon` property.
      Returns: Whether to show the icon or not.
  */
  @property bool showIcon() nothrow
  {
    return getShowIcon();
  }

  /**
      Set `showIcon` property.
      Params:
        propval = Whether to show the icon or not.
  */
  @property void showIcon(bool propval) nothrow
  {
    setShowIcon(propval);
  }

  mixin FrameHeaderT!();

  /**
      Create a new #PanelFrameHeaderBar.
      Returns: a newly created #PanelFrameHeaderBar
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the menu popover attached to this menubar.
      Returns: a #GtkPopoverMenu
  */
  gid.gtk4.popover_menu.PopoverMenu getMenuPopover() nothrow
  {
    GtkPopoverMenu* _cretval;
    _cretval = panel_frame_header_bar_get_menu_popover(cast(PanelFrameHeaderBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover_menu.PopoverMenu)(cast(GtkPopoverMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Tell whether it show the icon or not.
      Returns: whether to show the icon.
  */
  bool getShowIcon() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_header_bar_get_show_icon(cast(PanelFrameHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Set whether to show the icon or not.
  
      Params:
        showIcon = whether to show the icon
  */
  void setShowIcon(bool showIcon) nothrow
  {
    panel_frame_header_bar_set_show_icon(cast(PanelFrameHeaderBar*)this._cPtr, showIcon);
  }
}

/// Fluent builder implementation template for [gid.panel1.frame_header_bar.FrameHeaderBar]
class FrameHeaderBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.panel1.frame_header.FrameHeaderGidBuilderImpl!T
{

  mixin FrameHeaderGidBuilderT!();

  /**
      Set `showIcon` property.
      Params:
        propval = Whether to show the icon or not.
      Returns: Builder instance for fluent chaining
  */
  T showIcon(bool propval) nothrow
  {
    return setProperty("show-icon", propval);
  }
}

/// Fluent builder for [gid.panel1.frame_header_bar.FrameHeaderBar]
final class FrameHeaderBarGidBuilder : FrameHeaderBarGidBuilderImpl!FrameHeaderBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FrameHeaderBar build() nothrow
  {
    return new FrameHeaderBar(cast(void*)createGObject(FrameHeaderBar._getGType), Yes.Take);
  }
}
