module panel.toggle_button;

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
import panel.dock;
import panel.types;

/**
    The [panel.toggle_button.ToggleButton] is a button used to toggle the visibility
    of a [panel.dock.Dock] area.
    
    <picture>
      <source srcset="toggle-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-button.png" alt="toggle-button">
    </picture>
    
    It will automatically reveal or hide the specified area from
    [panel.toggle_button.ToggleButton.Dock].
*/
class ToggleButton : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_toggle_button_get_type != &gidSymbolNotFound ? panel_toggle_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ToggleButton self()
  {
    return this;
  }

  /**
      Creates a new [panel.toggle_button.ToggleButton] to hide the dock in the area.
  
      Params:
        dock = [panel.dock.Dock] the panel to control
        area = [panel.types.Area] the panel area. A value of
            `enumPanel.Area.CENTER` is invalid.
      Returns: a newly created [panel.toggle_button.ToggleButton]
  */
  this(panel.dock.Dock dock, panel.types.Area area)
  {
    GtkWidget* _cretval;
    _cretval = panel_toggle_button_new(dock ? cast(PanelDock*)dock.cPtr(No.Dup) : null, area);
    this(_cretval, No.Take);
  }
}
