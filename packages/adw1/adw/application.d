/// Module for [Application] class
module adw.application;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.style_manager;
import adw.types;
import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.action_map;
import gio.action_map_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;
import gtk.application;

/**
    A base class for Adwaita applications.
    
    [adw.application.Application] handles library initialization by calling `func@init` in the
    default [gio.application.Application.startup] signal handler, in turn chaining up
    as required by [gtk.application.Application]. Therefore, any subclass of
    [adw.application.Application] should always chain up its `startup` handler before using
    any Adwaita or GTK API.
    
    ## Automatic Resources
    
    [adw.application.Application] will automatically load certain resources located in the
    application's resource base path (see
    [gio.application.Application.setResourceBasePath], if they're present.
    
    ### Shortcuts Dialog
    
    If there's a resource located at `shortcuts-dialog.ui` which defines an
    [adw.shortcuts_dialog.ShortcutsDialog] with the ID `shortcuts_dialog`, [adw.application.Application]
    will set up an `app.shortcuts` action that creates and presents this dialog,
    as well as a <kbd>Ctrl</kbd><kbd>?</kbd> accelerator for it.
    
    ### Stylesheet
    
    If there's a resource located at `style.css`, [adw.application.Application] will load
    styles from it. This can be used to add custom styles to the application.
    
    #### Additional styles (deprecated)
    
    [adw.application.Application] will also load the following stylesheets conditionally:
    
    - `style-dark.css` when [adw.style_manager.StyleManager.dark] is `TRUE`.
    
    - `style-hc.css` when the system high contrast preference is enabled.
    
    - `style-hc-dark.css` when the system high contrast preference is enabled and
      [adw.style_manager.StyleManager.dark] is `TRUE`.
    
    :::warning
        These resources are deprecated since 1.9.
    
        Use `style.css` with the following media queries instead:
    
        - `prefers-color-scheme: dark` for styles used only for dark appearance.
        - `prefers-contrast: more` for styles used only when the system high
          contrast preference is enabled.
*/
class Application : gtk.application.Application
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_application_get_type != &gidSymbolNotFound ? adw_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.application.Application]
      Returns: New builder object
  */
  static ApplicationGidBuilder builder() nothrow
  {
    return new ApplicationGidBuilder;
  }

  /**
      Get `styleManager` property.
      Returns: The style manager for this application.
        
        This is a convenience property allowing to access [adw.style_manager.StyleManager] through
        property bindings or expressions.
  */
  @property adw.style_manager.StyleManager styleManager() nothrow
  {
    return getStyleManager();
  }

  /**
      Creates a new [adw.application.Application].
      
      If `application_id` is not `NULL`, then it must be valid. See
      [gio.application.Application.idIsValid].
      
      If no application ID is given then some features (most notably application
      uniqueness) will be disabled.
  
      Params:
        applicationId = The application ID
        flags = The application flags
      Returns: the newly created [adw.application.Application]
  */
  this(string applicationId, gio.types.ApplicationFlags flags) nothrow
  {
    AdwApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString!(No.Malloc, Yes.Nullable);
    _cretval = adw_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the style manager for self.
      
      This is a convenience property allowing to access [adw.style_manager.StyleManager] through
      property bindings or expressions.
      Returns: the style manager
  */
  adw.style_manager.StyleManager getStyleManager() nothrow
  {
    AdwStyleManager* _cretval;
    _cretval = adw_application_get_style_manager(cast(AdwApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [adw.application.Application]
class ApplicationGidBuilderImpl(T) : gtk.application.ApplicationGidBuilderImpl!T
{

}

/// Fluent builder for [adw.application.Application]
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
