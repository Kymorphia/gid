/// Module for [Application] class
module adw.application;

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
    
    [adw.application.Application] will automatically load stylesheets located in the
    application's resource base path (see
    [gio.application.Application.setResourceBasePath], if they're present.
    
    They can be used to add custom styles to the application, as follows:
    
    $(LIST
      * `style.css` contains styles that are always present.
      
      * `style-dark.css` contains styles only used when
    )
    `property@StyleManager:dark` is `TRUE`.
    
    $(LIST
      * `style-hc.css` contains styles used when the system high contrast
        preference is enabled.
      
      * `style-hc-dark.css` contains styles used when the system high contrast
        preference is enabled and `property@StyleManager:dark` is `TRUE`.
    )
*/
class Application : gtk.application.Application
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
    return cast(void function())adw_application_get_type != &gidSymbolNotFound ? adw_application_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Application self()
  {
    return this;
  }

  /**
      Get `styleManager` property.
      Returns: The style manager for this application.
        
        This is a convenience property allowing to access [adw.style_manager.StyleManager] through
        property bindings or expressions.
  */
  @property adw.style_manager.StyleManager styleManager()
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
  this(string applicationId, gio.types.ApplicationFlags flags)
  {
    AdwApplication* _cretval;
    const(char)* _applicationId = applicationId.toCString(No.Alloc);
    _cretval = adw_application_new(_applicationId, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the style manager for self.
      
      This is a convenience property allowing to access [adw.style_manager.StyleManager] through
      property bindings or expressions.
      Returns: the style manager
  */
  adw.style_manager.StyleManager getStyleManager()
  {
    AdwStyleManager* _cretval;
    _cretval = adw_application_get_style_manager(cast(AdwApplication*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }
}
