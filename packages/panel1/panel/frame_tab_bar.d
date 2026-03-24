/// Module for [FrameTabBar] class
module panel.frame_tab_bar;

import gid.gid;
import gobject.gid_builder;
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_frame_tab_bar_get_type != &gidSymbolNotFound ? panel_frame_tab_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameTabBar self()
  {
    return this;
  }

  /**
  Get builder for [panel.frame_tab_bar.FrameTabBar]
  Returns: New builder object
  */
  static FrameTabBarGidBuilder builder()
  {
    return new FrameTabBarGidBuilder;
  }

  /**
      Get `autohide` property.
      Returns: Whether the tabs automatically hide.
  */
  @property bool autohide()
  {
    return getAutohide();
  }

  /**
      Set `autohide` property.
      Params:
        propval = Whether the tabs automatically hide.
  */
  @property void autohide(bool propval)
  {
    setAutohide(propval);
  }

  /**
      Get `expandTabs` property.
      Returns: Whether tabs expand to full width.
  */
  @property bool expandTabs()
  {
    return getExpandTabs();
  }

  /**
      Set `expandTabs` property.
      Params:
        propval = Whether tabs expand to full width.
  */
  @property void expandTabs(bool propval)
  {
    setExpandTabs(propval);
  }

  /**
      Get `inverted` property.
      Returns: Whether tabs use inverted layout.
  */
  @property bool inverted()
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether tabs use inverted layout.
  */
  @property void inverted(bool propval)
  {
    setInverted(propval);
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
    _retval = cast(bool)panel_frame_tab_bar_get_autohide(cast(PanelFrameTabBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether tabs expand to full width.
      Returns: the value of the expand_tabs property.
  */
  bool getExpandTabs()
  {
    bool _retval;
    _retval = cast(bool)panel_frame_tab_bar_get_expand_tabs(cast(PanelFrameTabBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether tabs use inverted layout.
      Returns: the value of the inverted property.
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)panel_frame_tab_bar_get_inverted(cast(PanelFrameTabBar*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the tabs automatically hide.
  
      Params:
        autohide = the autohide value
  */
  void setAutohide(bool autohide)
  {
    panel_frame_tab_bar_set_autohide(cast(PanelFrameTabBar*)this._cPtr, autohide);
  }

  /**
      Sets whether tabs expand to full width.
  
      Params:
        expandTabs = the expand_tabs value
  */
  void setExpandTabs(bool expandTabs)
  {
    panel_frame_tab_bar_set_expand_tabs(cast(PanelFrameTabBar*)this._cPtr, expandTabs);
  }

  /**
      Sets whether tabs tabs use inverted layout.
  
      Params:
        inverted = the inverted value
  */
  void setInverted(bool inverted)
  {
    panel_frame_tab_bar_set_inverted(cast(PanelFrameTabBar*)this._cPtr, inverted);
  }
}

class FrameTabBarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, panel.frame_header.FrameHeaderGidBuilderImpl!T
{

  mixin FrameHeaderGidBuilderT!();

  /**
      Set `autohide` property.
      Params:
        propval = Whether the tabs automatically hide.
      Returns: Builder instance for fluent chaining
  */
  T autohide(bool propval)
  {
    return setProperty("autohide", propval);
  }

  /**
      Set `expandTabs` property.
      Params:
        propval = Whether tabs expand to full width.
      Returns: Builder instance for fluent chaining
  */
  T expandTabs(bool propval)
  {
    return setProperty("expand-tabs", propval);
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether tabs use inverted layout.
      Returns: Builder instance for fluent chaining
  */
  T inverted(bool propval)
  {
    return setProperty("inverted", propval);
  }
}

/// Fluent builder for [panel.frame_tab_bar.FrameTabBar]
final class FrameTabBarGidBuilder : FrameTabBarGidBuilderImpl!FrameTabBarGidBuilder
{
  FrameTabBar build()
  {
    return new FrameTabBar(cast(void*)createGObject(FrameTabBar._getGType), No.Take);
  }
}
