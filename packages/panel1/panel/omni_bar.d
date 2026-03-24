/// Module for [OmniBar] class
module panel.omni_bar;

import gid.gid;
import gio.menu_model;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.popover;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.types;

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
class OmniBar : gtk.widget.Widget, gtk.actionable.Actionable
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
    return cast(void function())panel_omni_bar_get_type != &gidSymbolNotFound ? panel_omni_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OmniBar self()
  {
    return this;
  }

  /**
  Get builder for [panel.omni_bar.OmniBar]
  Returns: New builder object
  */
  static OmniBarGidBuilder builder()
  {
    return new OmniBarGidBuilder;
  }

  /**
      Get `actionTooltip` property.
      Returns: The tooltip for the action.
  */
  @property string actionTooltip()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("action-tooltip");
  }

  /**
      Set `actionTooltip` property.
      Params:
        propval = The tooltip for the action.
  */
  @property void actionTooltip(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("action-tooltip", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon to use.
  */
  @property string iconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to use.
  */
  @property void iconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `menuModel` property.
      Returns: The menu model of the omni bar menu.
  */
  @property gio.menu_model.MenuModel menuModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.menu_model.MenuModel)("menu-model");
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The menu model of the omni bar menu.
  */
  @property void menuModel(gio.menu_model.MenuModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.menu_model.MenuModel)("menu-model", propval);
  }

  /**
      Get `popover` property.
      Returns: The popover to show.
  */
  @property gtk.popover.Popover popover()
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The popover to show.
  */
  @property void popover(gtk.popover.Popover propval)
  {
    setPopover(propval);
  }

  /**
      Get `progress` property.
      Returns: The current progress value.
  */
  @property double progress()
  {
    return getProgress();
  }

  /**
      Set `progress` property.
      Params:
        propval = The current progress value.
  */
  @property void progress(double propval)
  {
    setProgress(propval);
  }

  mixin ActionableT!();

  /**
      Create a new #PanelOmniBar.
      Returns: a newly created #PanelOmniBar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_omni_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Add a widget at the start of the container, ordered by priority.
      The highest the priority, the closest to the start.
  
      Params:
        priority = the priority
        widget = the widget to add at the start.
  */
  void addPrefix(int priority, gtk.widget.Widget widget)
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
  void addSuffix(int priority, gtk.widget.Widget widget)
  {
    panel_omni_bar_add_suffix(cast(PanelOmniBar*)this._cPtr, priority, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the current popover or null if none is setup.
      Returns: a #GtkPopover or null
  */
  gtk.popover.Popover getPopover()
  {
    GtkPopover* _cretval;
    _cretval = panel_omni_bar_get_popover(cast(PanelOmniBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the progress value displayed in the omni bar.
      Returns: the progress value.
  */
  double getProgress()
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
  void remove(gtk.widget.Widget widget)
  {
    panel_omni_bar_remove(cast(PanelOmniBar*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the omnibar popover, that will appear when clicking on the omni bar.
  
      Params:
        popover = a #GtkPopover or null
  */
  void setPopover(gtk.popover.Popover popover = null)
  {
    panel_omni_bar_set_popover(cast(PanelOmniBar*)this._cPtr, popover ? cast(GtkPopover*)popover._cPtr(No.Dup) : null);
  }

  /**
      Sets the progress value displayed in the omni bar.
  
      Params:
        progress = the progress value
  */
  void setProgress(double progress)
  {
    panel_omni_bar_set_progress(cast(PanelOmniBar*)this._cPtr, progress);
  }

  /**
      Starts pulsing the omni bar. Use
      panel_omni_bar_stop_pulsing to stop.
  */
  void startPulsing()
  {
    panel_omni_bar_start_pulsing(cast(PanelOmniBar*)this._cPtr);
  }

  /**
      Stops pulsing the omni bar, that was started with
      panel_omni_bar_start_pulsing.
  */
  void stopPulsing()
  {
    panel_omni_bar_stop_pulsing(cast(PanelOmniBar*)this._cPtr);
  }
}

class OmniBarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `actionTooltip` property.
      Params:
        propval = The tooltip for the action.
      Returns: Builder instance for fluent chaining
  */
  T actionTooltip(string propval)
  {
    return setProperty("action-tooltip", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon to use.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval)
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The menu model of the omni bar menu.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gio.menu_model.MenuModel propval)
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The popover to show.
      Returns: Builder instance for fluent chaining
  */
  T popover(gtk.popover.Popover propval)
  {
    return setProperty("popover", propval);
  }

  /**
      Set `progress` property.
      Params:
        propval = The current progress value.
      Returns: Builder instance for fluent chaining
  */
  T progress(double propval)
  {
    return setProperty("progress", propval);
  }
}

/// Fluent builder for [panel.omni_bar.OmniBar]
final class OmniBarGidBuilder : OmniBarGidBuilderImpl!OmniBarGidBuilder
{
  OmniBar build()
  {
    return new OmniBar(cast(void*)createGObject(OmniBar._getGType), No.Take);
  }
}
