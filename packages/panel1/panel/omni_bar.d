module panel.omni_bar;

import gid.gid;
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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_omni_bar_get_type != &gidSymbolNotFound ? panel_omni_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override OmniBar self()
  {
    return this;
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
    panel_omni_bar_add_prefix(cast(PanelOmniBar*)cPtr, priority, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
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
    panel_omni_bar_add_suffix(cast(PanelOmniBar*)cPtr, priority, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Gets the current popover or null if none is setup.
      Returns: a #GtkPopover or null
  */
  gtk.popover.Popover getPopover()
  {
    GtkPopover* _cretval;
    _cretval = panel_omni_bar_get_popover(cast(PanelOmniBar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the progress value displayed in the omni bar.
      Returns: the progress value.
  */
  double getProgress()
  {
    double _retval;
    _retval = panel_omni_bar_get_progress(cast(PanelOmniBar*)cPtr);
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
    panel_omni_bar_remove(cast(PanelOmniBar*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets the omnibar popover, that will appear when clicking on the omni bar.
  
      Params:
        popover = a #GtkPopover or null
  */
  void setPopover(gtk.popover.Popover popover = null)
  {
    panel_omni_bar_set_popover(cast(PanelOmniBar*)cPtr, popover ? cast(GtkPopover*)popover.cPtr(No.Dup) : null);
  }

  /**
      Sets the progress value displayed in the omni bar.
  
      Params:
        progress = the progress value
  */
  void setProgress(double progress)
  {
    panel_omni_bar_set_progress(cast(PanelOmniBar*)cPtr, progress);
  }

  /**
      Starts pulsing the omni bar. Use
      panel_omni_bar_stop_pulsing to stop.
  */
  void startPulsing()
  {
    panel_omni_bar_start_pulsing(cast(PanelOmniBar*)cPtr);
  }

  /**
      Stops pulsing the omni bar, that was started with
      panel_omni_bar_start_pulsing.
  */
  void stopPulsing()
  {
    panel_omni_bar_stop_pulsing(cast(PanelOmniBar*)cPtr);
  }
}
