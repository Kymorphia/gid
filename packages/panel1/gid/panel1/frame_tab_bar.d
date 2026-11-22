/// Module for [FrameTabBar] class
module gid.panel1.frame_tab_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame_header;
import gid.panel1.frame_header_mixin;
import gid.panel1.types;

/**
    A #PanelFrameHeader that implements switching between tab views in
    a #PanelFrame.
*/
class FrameTabBar : gid.gtk4.widget.Widget, gid.panel1.frame_header.FrameHeader
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
    return cast(void function())panel_frame_tab_bar_get_type != &gidSymbolNotFound ? panel_frame_tab_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelFrameTabBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameTabBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.frame_tab_bar.FrameTabBar]
      Returns: New builder object
  */
  static FrameTabBarGidBuilder builder() nothrow
  {
    return new FrameTabBarGidBuilder;
  }

  /**
      Get `autohide` property.
      Returns: Whether the tabs automatically hide.
  */
  @property bool autohide() nothrow
  {
    return getAutohide();
  }

  /**
      Set `autohide` property.
      Params:
        propval = Whether the tabs automatically hide.
  */
  @property void autohide(bool propval) nothrow
  {
    setAutohide(propval);
  }

  /**
      Get `expandTabs` property.
      Returns: Whether tabs expand to full width.
  */
  @property bool expandTabs() nothrow
  {
    return getExpandTabs();
  }

  /**
      Set `expandTabs` property.
      Params:
        propval = Whether tabs expand to full width.
  */
  @property void expandTabs(bool propval) nothrow
  {
    setExpandTabs(propval);
  }

  /**
      Get `inverted` property.
      Returns: Whether tabs use inverted layout.
  */
  @property bool inverted() nothrow
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether tabs use inverted layout.
  */
  @property void inverted(bool propval) nothrow
  {
    setInverted(propval);
  }

  mixin FrameHeaderT!();

  /**
      Create a new #PanelFrameTabBar.
      Returns: a newly created #PanelFrameTabBar
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_frame_tab_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the tabs automatically hide.
      Returns: the value of the autohide property.
  */
  bool getAutohide() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_tab_bar_get_autohide(cast(PanelFrameTabBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether tabs expand to full width.
      Returns: the value of the expand_tabs property.
  */
  bool getExpandTabs() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_tab_bar_get_expand_tabs(cast(PanelFrameTabBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether tabs use inverted layout.
      Returns: the value of the inverted property.
  */
  bool getInverted() nothrow
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
  void setAutohide(bool autohide) nothrow
  {
    panel_frame_tab_bar_set_autohide(cast(PanelFrameTabBar*)this._cPtr, autohide);
  }

  /**
      Sets whether tabs expand to full width.
  
      Params:
        expandTabs = the expand_tabs value
  */
  void setExpandTabs(bool expandTabs) nothrow
  {
    panel_frame_tab_bar_set_expand_tabs(cast(PanelFrameTabBar*)this._cPtr, expandTabs);
  }

  /**
      Sets whether tabs tabs use inverted layout.
  
      Params:
        inverted = the inverted value
  */
  void setInverted(bool inverted) nothrow
  {
    panel_frame_tab_bar_set_inverted(cast(PanelFrameTabBar*)this._cPtr, inverted);
  }
}

/// Fluent builder implementation template for [gid.panel1.frame_tab_bar.FrameTabBar]
class FrameTabBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.panel1.frame_header.FrameHeaderGidBuilderImpl!T
{

  mixin FrameHeaderGidBuilderT!();

  /**
      Set `autohide` property.
      Params:
        propval = Whether the tabs automatically hide.
      Returns: Builder instance for fluent chaining
  */
  T autohide(bool propval) nothrow
  {
    return setProperty("autohide", propval);
  }

  /**
      Set `expandTabs` property.
      Params:
        propval = Whether tabs expand to full width.
      Returns: Builder instance for fluent chaining
  */
  T expandTabs(bool propval) nothrow
  {
    return setProperty("expand-tabs", propval);
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether tabs use inverted layout.
      Returns: Builder instance for fluent chaining
  */
  T inverted(bool propval) nothrow
  {
    return setProperty("inverted", propval);
  }
}

/// Fluent builder for [gid.panel1.frame_tab_bar.FrameTabBar]
final class FrameTabBarGidBuilder : FrameTabBarGidBuilderImpl!FrameTabBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FrameTabBar build() nothrow
  {
    return new FrameTabBar(cast(void*)createGObject(FrameTabBar._getGType), Yes.Take);
  }
}
