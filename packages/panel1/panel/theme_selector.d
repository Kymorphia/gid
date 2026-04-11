/// Module for [ThemeSelector] class
module panel.theme_selector;

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
import panel.types;

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
class ThemeSelector : gtk.widget.Widget
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
    return cast(void function())panel_theme_selector_get_type != &gidSymbolNotFound ? panel_theme_selector_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThemeSelector self()
  {
    return this;
  }

  /**
      Get builder for [panel.theme_selector.ThemeSelector]
      Returns: New builder object
  */
  static ThemeSelectorGidBuilder builder()
  {
    return new ThemeSelectorGidBuilder;
  }

  /**
      Get `actionName` property.
      Returns: The name of the action activated on activation.
  */
  @property string actionName()
  {
    return getActionName();
  }

  /**
      Set `actionName` property.
      Params:
        propval = The name of the action activated on activation.
  */
  @property void actionName(string propval)
  {
    setActionName(propval);
  }

  /**
      Create a new #ThemeSelector.
      Returns: a newly created #PanelThemeSelector.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_theme_selector_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the name of the action that will be activated.
      Returns: the name of the action.
  */
  string getActionName()
  {
    const(char)* _cretval;
    _cretval = panel_theme_selector_get_action_name(cast(PanelThemeSelector*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the name of the action that will be activated.
  
      Params:
        actionName = the action name.
  */
  void setActionName(string actionName)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    panel_theme_selector_set_action_name(cast(PanelThemeSelector*)this._cPtr, _actionName);
  }
}

/// Fluent builder implementation template for [panel.theme_selector.ThemeSelector]
class ThemeSelectorGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `actionName` property.
      Params:
        propval = The name of the action activated on activation.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval)
  {
    return setProperty("action-name", propval);
  }
}

/// Fluent builder for [panel.theme_selector.ThemeSelector]
final class ThemeSelectorGidBuilder : ThemeSelectorGidBuilderImpl!ThemeSelectorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThemeSelector build()
  {
    return new ThemeSelector(cast(void*)createGObject(ThemeSelector._getGType), No.Take);
  }
}
