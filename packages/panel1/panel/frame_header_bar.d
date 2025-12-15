/// Module for [FrameHeaderBar] class
module panel.frame_header_bar;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.popover_menu;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame_header;
import panel.frame_header_mixin;
import panel.types;

/**
    A header bar for #PanelFrame. It can optionally show an icon, it
    can have a popover to be displace, and it can also have prefix and
    suffix widgets.
    
    It is an implementation of #PanelFrameHeader
*/
class FrameHeaderBar : gtk.widget.Widget, panel.frame_header.FrameHeader
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
    return cast(void function())panel_frame_header_bar_get_type != &gidSymbolNotFound ? panel_frame_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameHeaderBar self()
  {
    return this;
  }

  /**
      Get `showIcon` property.
      Returns: Whether to show the icon or not.
  */
  @property bool showIcon()
  {
    return getShowIcon();
  }

  /**
      Set `showIcon` property.
      Params:
        propval = Whether to show the icon or not.
  */
  @property void showIcon(bool propval)
  {
    return setShowIcon(propval);
  }

  mixin FrameHeaderT!();

  /**
      Create a new #PanelFrameHeaderBar.
      Returns: a newly created #PanelFrameHeaderBar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the menu popover attached to this menubar.
      Returns: a #GtkPopoverMenu
  */
  gtk.popover_menu.PopoverMenu getMenuPopover()
  {
    GtkPopoverMenu* _cretval;
    _cretval = panel_frame_header_bar_get_menu_popover(cast(PanelFrameHeaderBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover_menu.PopoverMenu)(cast(GtkPopoverMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Tell whether it show the icon or not.
      Returns: whether to show the icon.
  */
  bool getShowIcon()
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
  void setShowIcon(bool showIcon)
  {
    panel_frame_header_bar_set_show_icon(cast(PanelFrameHeaderBar*)this._cPtr, showIcon);
  }
}
