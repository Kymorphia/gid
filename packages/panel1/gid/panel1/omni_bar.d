/// Module for [OmniBar] class
module gid.panel1.omni_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.popover;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/**
    A multi-use widget for user interaction in the window header bar.
    You can add widgets, a popover to provide action items, an icon,
    updates on progress and pulse the main widget.
    
    There is also a prefix and suffix area that can contain more
    widgets.
    
    <picture>
      <source srcset="omni-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="omni-bar.png" alt="omni-bar">
    </picture>
*/
class OmniBar : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())panel_omni_bar_get_type != &gidSymbolNotFound ? panel_omni_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelOmniBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override OmniBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.omni_bar.OmniBar]
      Returns: New builder object
  */
  static OmniBarGidBuilder builder() nothrow
  {
    return new OmniBarGidBuilder;
  }

  /**
      Get `actionTooltip` property.
      Returns: The tooltip for the action.
  */
  @property string actionTooltip() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("action-tooltip");
  }

  /**
      Set `actionTooltip` property.
      Params:
        propval = The tooltip for the action.
  */
  @property void actionTooltip(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("action-tooltip", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon to use.
  */
  @property string iconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to use.
  */
  @property void iconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `menuModel` property.
      Returns: The menu model of the omni bar menu.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.menu_model.MenuModel)("menu-model");
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The menu model of the omni bar menu.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.menu_model.MenuModel)("menu-model", propval);
  }

  /**
      Get `popover` property.
      Returns: The popover to show.
  */
  @property gid.gtk4.popover.Popover popover() nothrow
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The popover to show.
  */
  @property void popover(gid.gtk4.popover.Popover propval) nothrow
  {
    setPopover(propval);
  }

  /**
      Get `progress` property.
      Returns: The current progress value.
  */
  @property double progress() nothrow
  {
    return getProgress();
  }

  /**
      Set `progress` property.
      Params:
        propval = The current progress value.
  */
  @property void progress(double propval) nothrow
  {
    setProgress(propval);
  }

  mixin ActionableT!();

  /**
      Create a new #PanelOmniBar.
      Returns: a newly created #PanelOmniBar
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_omni_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Add a widget at the start of the container, ordered by priority.
      The highest the priority, the closest to the start.
  
      Params:
        priority = the priority
        widget = the widget to add at the start.
  */
  void addPrefix(int priority, gid.gtk4.widget.Widget widget) nothrow
  {
    panel_omni_bar_add_prefix(cast(PanelOmniBar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Add a widget towards the end of the container, ordered by priority.
      The highest the priority, the closest to the start.
  
      Params:
        priority = the priority
        widget = the widget to add toward the end.
  */
  void addSuffix(int priority, gid.gtk4.widget.Widget widget) nothrow
  {
    panel_omni_bar_add_suffix(cast(PanelOmniBar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the current popover or null if none is setup.
      Returns: a #GtkPopover or null
  */
  gid.gtk4.popover.Popover getPopover() nothrow
  {
    GtkPopover* _cretval;
    _cretval = panel_omni_bar_get_popover(cast(PanelOmniBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the progress value displayed in the omni bar.
      Returns: the progress value.
  */
  double getProgress() nothrow
  {
    double _retval;
    _retval = panel_omni_bar_get_progress(cast(PanelOmniBar*)this._cPtr);
    return _retval;
  }

  /**
      Removes a widget from the omni bar. Currently only prefix or suffix
      widgets are supported.
  
      Params:
        widget = The widget to remove.
  */
  void remove(gid.gtk4.widget.Widget widget) nothrow
  {
    panel_omni_bar_remove(cast(PanelOmniBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the omnibar popover, that will appear when clicking on the omni bar.
  
      Params:
        popover = a #GtkPopover or null
  */
  void setPopover(gid.gtk4.popover.Popover popover = null) nothrow
  {
    panel_omni_bar_set_popover(cast(PanelOmniBar*)this._cPtr, popover ? cast(GtkPopover*)popover._cPtr(No.Dup) : null);
  }

  /**
      Sets the progress value displayed in the omni bar.
  
      Params:
        progress = the progress value
  */
  void setProgress(double progress) nothrow
  {
    panel_omni_bar_set_progress(cast(PanelOmniBar*)this._cPtr, progress);
  }

  /**
      Starts pulsing the omni bar. Use
      panel_omni_bar_stop_pulsing to stop.
  */
  void startPulsing() nothrow
  {
    panel_omni_bar_start_pulsing(cast(PanelOmniBar*)this._cPtr);
  }

  /**
      Stops pulsing the omni bar, that was started with
      panel_omni_bar_start_pulsing.
  */
  void stopPulsing() nothrow
  {
    panel_omni_bar_stop_pulsing(cast(PanelOmniBar*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.panel1.omni_bar.OmniBar]
class OmniBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `actionTooltip` property.
      Params:
        propval = The tooltip for the action.
      Returns: Builder instance for fluent chaining
  */
  T actionTooltip(string propval) nothrow
  {
    return setProperty("action-tooltip", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to use.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The menu model of the omni bar menu.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The popover to show.
      Returns: Builder instance for fluent chaining
  */
  T popover(gid.gtk4.popover.Popover propval) nothrow
  {
    return setProperty("popover", propval);
  }

  /**
      Set `progress` property.
      Params:
        propval = The current progress value.
      Returns: Builder instance for fluent chaining
  */
  T progress(double propval) nothrow
  {
    return setProperty("progress", propval);
  }
}

/// Fluent builder for [gid.panel1.omni_bar.OmniBar]
final class OmniBarGidBuilder : OmniBarGidBuilderImpl!OmniBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OmniBar build() nothrow
  {
    return new OmniBar(cast(void*)createGObject(OmniBar._getGType), Yes.Take);
  }
}
