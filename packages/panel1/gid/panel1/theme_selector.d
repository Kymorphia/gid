/// Module for [ThemeSelector] class
module gid.panel1.theme_selector;

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
import gid.panel1.types;

/**
    A widget that allow selecting theme preference between "dark",
    "light" and "follow" the system preference.
    
    <picture>
      <source srcset="theme-selector-dark.png" media="(prefers-color-scheme: dark)">
      <img src="theme-selector.png" alt="theme-selector">
    </picture>
    
    Upon activation it will activate the named action in
    #PanelThemeSelector:action-name.
*/
@gidGir("ThemeSelector", "ThemeSelectorClass")
class ThemeSelector : gid.gtk4.widget.Widget
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
    return cast(void function())panel_theme_selector_get_type != &gidSymbolNotFound ? panel_theme_selector_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelThemeSelector";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThemeSelector self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.theme_selector.ThemeSelector]
      Returns: New builder object
  */
  static ThemeSelectorGidBuilder builder() nothrow
  {
    return new ThemeSelectorGidBuilder;
  }

  /**
      Get `actionName` property.
      Returns: The name of the action activated on activation.
  */
  @property string actionName() nothrow
  {
    return getActionName();
  }

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action activated on activation.
  */
  @property void actionName(string propval) nothrow
  {
    setActionName(propval);
  }

  /**
      Create a new #ThemeSelector.
      Returns: a newly created #PanelThemeSelector.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_theme_selector_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the name of the action that will be activated.
      Returns: the name of the action.
  */
  string getActionName() nothrow
  {
    const(char)* _cretval;
    _cretval = panel_theme_selector_get_action_name(cast(PanelThemeSelector*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the name of the action that will be activated.
  
      Params:
        actionName = the action name.
  */
  void setActionName(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    panel_theme_selector_set_action_name(cast(PanelThemeSelector*)this._cPtr, _actionName);
  }
}

/// Fluent builder implementation template for [gid.panel1.theme_selector.ThemeSelector]
class ThemeSelectorGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `actionName` property.
      Params:
        propval = The name of the action activated on activation.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }
}

/// Fluent builder for [gid.panel1.theme_selector.ThemeSelector]
final class ThemeSelectorGidBuilder : ThemeSelectorGidBuilderImpl!ThemeSelectorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThemeSelector build() nothrow
  {
    return new ThemeSelector(cast(void*)createGObject(ThemeSelector._getGType), Yes.Take);
  }
}
