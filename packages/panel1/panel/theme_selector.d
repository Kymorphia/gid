module panel.theme_selector;

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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_theme_selector_get_type != &gidSymbolNotFound ? panel_theme_selector_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ThemeSelector self()
  {
    return this;
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
    _cretval = panel_theme_selector_get_action_name(cast(PanelThemeSelector*)cPtr);
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
    panel_theme_selector_set_action_name(cast(PanelThemeSelector*)cPtr, _actionName);
  }
}
