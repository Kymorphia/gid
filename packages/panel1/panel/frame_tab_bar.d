module panel.frame_tab_bar;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame_header;
import panel.frame_header_mixin;
import panel.types;

/**
    A #PanelFrameHeader that implements switching between tab views in
    a #PanelFrame.
*/
class FrameTabBar : gtk.widget.Widget, panel.frame_header.FrameHeader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_frame_tab_bar_get_type != &gidSymbolNotFound ? panel_frame_tab_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override FrameTabBar self()
  {
    return this;
  }

  mixin FrameHeaderT!();

  /**
      Create a new #PanelFrameTabBar.
      Returns: a newly created #PanelFrameTabBar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_tab_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the tabs automatically hide.
      Returns: the value of the autohide property.
  */
  bool getAutohide()
  {
    bool _retval;
    _retval = panel_frame_tab_bar_get_autohide(cast(PanelFrameTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets whether tabs expand to full width.
      Returns: the value of the expand_tabs property.
  */
  bool getExpandTabs()
  {
    bool _retval;
    _retval = panel_frame_tab_bar_get_expand_tabs(cast(PanelFrameTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets whether tabs use inverted layout.
      Returns: the value of the inverted property.
  */
  bool getInverted()
  {
    bool _retval;
    _retval = panel_frame_tab_bar_get_inverted(cast(PanelFrameTabBar*)cPtr);
    return _retval;
  }

  /**
      Sets whether the tabs automatically hide.
  
      Params:
        autohide = the autohide value
  */
  void setAutohide(bool autohide)
  {
    panel_frame_tab_bar_set_autohide(cast(PanelFrameTabBar*)cPtr, autohide);
  }

  /**
      Sets whether tabs expand to full width.
  
      Params:
        expandTabs = the expand_tabs value
  */
  void setExpandTabs(bool expandTabs)
  {
    panel_frame_tab_bar_set_expand_tabs(cast(PanelFrameTabBar*)cPtr, expandTabs);
  }

  /**
      Sets whether tabs tabs use inverted layout.
  
      Params:
        inverted = the inverted value
  */
  void setInverted(bool inverted)
  {
    panel_frame_tab_bar_set_inverted(cast(PanelFrameTabBar*)cPtr, inverted);
  }
}
