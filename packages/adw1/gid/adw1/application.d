/// Module for [Application] class
module gid.adw1.application;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.style_manager;
import gid.adw1.types;
import gid.core.gid;
import gid.gio2.action_group;
import gid.gio2.action_group_mixin;
import gid.gio2.action_map;
import gid.gio2.action_map_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.application;

/**
    A base class for Adwaita applications.
    
    [gid.adw1.application.Application] handles library initialization by calling `func@init` in the
    default [gid.gio2.application.Application.startup] signal handler, in turn chaining up
    as required by [gid.gtk4.application.Application]. Therefore, any subclass of
    [gid.adw1.application.Application] should always chain up its `startup` handler before using
    any Adwaita or GTK API.
    
    ## Automatic Resources
    
    [gid.adw1.application.Application] will automatically load certain resources located in the
    application's resource base path (see
    [gid.gio2.application.Application.setResourceBasePath], if they're present.
    
    ### Shortcuts Dialog
    
    If there's a resource located at `shortcuts-dialog.ui` which defines an
    [gid.adw1.shortcuts_dialog.ShortcutsDialog] with the ID `shortcuts_dialog`, [gid.adw1.application.Application]
    will set up an `app.shortcuts` action that creates and presents this dialog,
    as well as a <kbd>Ctrl</kbd><kbd>?</kbd> accelerator for it.
    
    ### Stylesheet
    
    If there's a resource located at `style.css`, [gid.adw1.application.Application] will load
    styles from it. This can be used to add custom styles to the application.
    
    #### Additional styles (deprecated)
    
    [gid.adw1.application.Application] will also load the following stylesheets conditionally:
    
    - `style-dark.css` when [gid.adw1.style_manager.StyleManager.dark] is `TRUE`.
    
    - `style-hc.css` when the system high contrast preference is enabled.
    
    - `style-hc-dark.css` when the system high contrast preference is enabled and
      [gid.adw1.style_manager.StyleManager.dark] is `TRUE`.
    
    :::warning
        These resources are deprecated since 1.9.
    
        Use `style.css` with the following media queries instead:
    
        - `prefers-color-scheme: dark` for styles used only for dark appearance.
        - `prefers-contrast: more` for styles used only when the system high
          contrast preference is enabled.
*/
class Application : gid.gtk4.application.Application
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
    return cast(void function())adw_application_get_type != &gidSymbolNotFound ? adw_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwApplication";
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /**
      Get `styleManager` property.
      Returns: The style manager for this application.
        
        This is a convenience property allowing to access [gid.adw1.style_manager.StyleManager] through
        property bindings or expressions.
  */
  @property gid.adw1.style_manager.StyleManager styleManager() nothrow
  {
    return getStyleManager();
  }

  /**
      Creates a new [gid.adw1.application.Application].
      
      If `application_id` is not `NULL`, then it must be valid. See
      [gid.gio2.application.Application.idIsValid].
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled.
  
      Params:
        applicationId = The application ID
        flags = The application flags
      Returns: the newly created [gid.adw1.application.Application]
  */
  this(string applicationId, gid.gio2.types.ApplicationFlags flags) nothrow
  {
    AdwApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString!(No.Malloc, Yes.Nullable);
    _cretval = adw_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the style manager for self.
      
      This is a convenience property allowing to access [gid.adw1.style_manager.StyleManager] through
      property bindings or expressions.
      Returns: the style manager
  */
  gid.adw1.style_manager.StyleManager getStyleManager() nothrow
  {
    AdwStyleManager* _cretval;
    _cretval = adw_application_get_style_manager(cast(AdwApplication*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.adw1.application.Application]
class ApplicationGidBuilderImpl(T) : gid.gtk4.application.ApplicationGidBuilderImpl!T
{

}

/// Fluent builder for [gid.adw1.application.Application]
final class ApplicationGidBuilder : ApplicationGidBuilderImpl!ApplicationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Application build() nothrow
  {
    return new Application(cast(void*)createGObject(Application._getGType), Yes.Take);
  }
}
