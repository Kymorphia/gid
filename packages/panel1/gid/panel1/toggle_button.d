/// Module for [ToggleButton] class
module gid.panel1.toggle_button;

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
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.dock;
import gid.panel1.types;

/**
    The [gid.panel1.toggle_button.ToggleButton] is a button used to toggle the visibility
    of a [gid.panel1.dock.Dock] area.
    
    <picture>
      <source srcset="toggle-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toggle-button.png" alt="toggle-button">
    </picture>
    
    It will automatically reveal or hide the specified area from
    [gid.panel1.toggle_button.ToggleButton.dock].
*/
class ToggleButton : gid.gtk4.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_toggle_button_get_type != &gidSymbolNotFound ? panel_toggle_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelToggleButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToggleButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.toggle_button.ToggleButton]
      Returns: New builder object
  */
  static ToggleButtonGidBuilder builder() nothrow
  {
    return new ToggleButtonGidBuilder;
  }

  /**
      Get `area` property.
      Returns: The area this button will reveal.
  */
  @property gid.panel1.types.Area area() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.panel1.types.Area)("area");
  }

  /**
      Get `dock` property.
      Returns: The associated [gid.panel1.dock.Dock]
  */
  @property gid.panel1.dock.Dock dock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.panel1.dock.Dock)("dock");
  }

  /**
      Set `dock` property.
      Params:
        propval = The associated [gid.panel1.dock.Dock]
  */
  @property void dock(gid.panel1.dock.Dock propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.panel1.dock.Dock)("dock", propval);
  }

  /**
      Creates a new [gid.panel1.toggle_button.ToggleButton] to hide the dock in the area.
  
      Params:
        dock = [gid.panel1.dock.Dock] the panel to control
        area = [gid.panel1.types.Area] the panel area. A value of
            `enumPanel.Area.CENTER` is invalid.
      Returns: a newly created [gid.panel1.toggle_button.ToggleButton]
  */
  this(gid.panel1.dock.Dock dock, gid.panel1.types.Area area) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_toggle_button_new(dock ? cast(PanelDock*)dock._cPtr(No.Dup) : null, area);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.toggle_button.ToggleButton]
class ToggleButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `area` property.
      Params:
        propval = The area this button will reveal.
      Returns: Builder instance for fluent chaining
  */
  T area(gid.panel1.types.Area propval) nothrow
  {
    return setProperty("area", propval);
  }

  /**
      Set `dock` property.
      Params:
        propval = The associated [gid.panel1.dock.Dock]
      Returns: Builder instance for fluent chaining
  */
  T dock(gid.panel1.dock.Dock propval) nothrow
  {
    return setProperty("dock", propval);
  }
}

/// Fluent builder for [gid.panel1.toggle_button.ToggleButton]
final class ToggleButtonGidBuilder : ToggleButtonGidBuilderImpl!ToggleButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToggleButton build() nothrow
  {
    return new ToggleButton(cast(void*)createGObject(ToggleButton._getGType), Yes.Take);
  }
}
