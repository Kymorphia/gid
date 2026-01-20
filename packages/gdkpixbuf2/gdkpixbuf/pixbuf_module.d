/// Module for [PixbufModule] class
module gdkpixbuf.pixbuf_module;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.types;
import gid.gid;
import gmodule.module_;

/**
    A [gdkpixbuf.pixbuf_module.PixbufModule] contains the necessary functions to load and save
    images in a certain file format.
    
    If [gdkpixbuf.pixbuf.Pixbuf] has been compiled with [gmodule.module_.Module] support, it can be extended
    by modules which can load (and perhaps also save) new image and animation
    formats.
    
    ## Implementing modules
    
    The [gdkpixbuf.pixbuf.Pixbuf] interfaces needed for implementing modules are contained in
    `gdk-pixbuf-io.h` (and `gdk-pixbuf-animation.h` if the module supports
    animations). They are not covered by the same stability guarantees as the
    regular GdkPixbuf API. To underline this fact, they are protected by the
    `GDK_PIXBUF_ENABLE_BACKEND` pre-processor symbol.
    
    Each loadable module must contain a [gdkpixbuf.types.PixbufModuleFillVtableFunc] function
    named `fill_vtable`, which will get called when the module
    is loaded and must set the function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule].
    
    In order to make format-checking work before actually loading the modules
    (which may require calling `dlopen` to load image libraries), modules export
    their signatures (and other information) via the `fill_info` function. An
    external utility, `gdk-pixbuf-query-loaders`, uses this to create a text
    file containing a list of all available loaders and  their signatures.
    This file is then read at runtime by [gdkpixbuf.pixbuf.Pixbuf] to obtain the list of
    available loaders and their signatures.
    
    Modules may only implement a subset of the functionality available via
    [gdkpixbuf.pixbuf_module.PixbufModule]. If a particular functionality is not implemented, the
    `fill_vtable` function will simply not set the corresponding
    function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule] structure. If a module supports
    incremental loading (i.e. provides `begin_load`, `stop_load` and
    `load_increment`), it doesn't have to implement `load`, since [gdkpixbuf.pixbuf.Pixbuf]
    can supply a generic `load` implementation wrapping the incremental loading.
    
    ## Installing modules
    
    Installing a module is a two-step process:
    
     $(LIST
        * copy the module file(s) to the loader directory (normally
          `$libdir/gdk-pixbuf-2.0/$version/loaders`, unless overridden by the
          environment variable `GDK_PIXBUF_MODULEDIR`)
        * call `gdk-pixbuf-query-loaders` to update the module file (normally
          `$libdir/gdk-pixbuf-2.0/$version/loaders.cache`, unless overridden
          by the environment variable `GDK_PIXBUF_MODULE_FILE`)
     )
*/
class PixbufModule
{
  GdkPixbufModule _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdkpixbuf.pixbuf_module.PixbufModule");

    _cInstance = *cast(GdkPixbufModule*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `moduleName` field.
      Returns: the name of the module, usually the same as the
         usual file extension for images of this type, eg. "xpm", "jpeg" or "png".
  */
  @property string moduleName()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).moduleName);
  }

  /**
      Set `moduleName` field.
      Params:
        propval = the name of the module, usually the same as the
           usual file extension for images of this type, eg. "xpm", "jpeg" or "png".
  */
  @property void moduleName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).moduleName);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)this._cPtr).moduleName);
  }

  /**
      Get `modulePath` field.
      Returns: the path from which the module is loaded.
  */
  @property string modulePath()
  {
    return cToD!(string)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).modulePath);
  }

  /**
      Set `modulePath` field.
      Params:
        propval = the path from which the module is loaded.
  */
  @property void modulePath(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).modulePath);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)this._cPtr).modulePath);
  }

  /**
      Get `module_` field.
      Returns: the loaded [gmodule.module_.Module].
  */
  @property gmodule.module_.Module module_()
  {
    return new gmodule.module_.Module(cast(ModuleC*)(cast(GdkPixbufModule*)this._cPtr).module_, No.Take);
  }

  /**
      Get `info` field.
      Returns: a [gdkpixbuf.pixbuf_format.PixbufFormat] holding information about the module.
  */
  @property gdkpixbuf.pixbuf_format.PixbufFormat info()
  {
    return cToD!(gdkpixbuf.pixbuf_format.PixbufFormat)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).info);
  }

  /**
      Set `info` field.
      Params:
        propval = a [gdkpixbuf.pixbuf_format.PixbufFormat] holding information about the module.
  */
  @property void info(gdkpixbuf.pixbuf_format.PixbufFormat propval)
  {
    cValueFree!(gdkpixbuf.pixbuf_format.PixbufFormat)(cast(void*)(cast(GdkPixbufModule*)this._cPtr).info);
    dToC(propval, cast(void*)&(cast(GdkPixbufModule*)this._cPtr).info);
  }

  /**
      Get `load` field.
      Returns: loads an image from a file.
  */
  @property GdkPixbufModuleLoadFunc load()
  {
    return (cast(GdkPixbufModule*)this._cPtr).load;
  }

  /**
      Set `load` field.
      Params:
        propval = loads an image from a file.
  */

  @property void load(GdkPixbufModuleLoadFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).load = propval;
  }

  /**
      Get `loadXpmData` field.
      Returns: loads an image from data in memory.
  */
  @property GdkPixbufModuleLoadXpmDataFunc loadXpmData()
  {
    return (cast(GdkPixbufModule*)this._cPtr).loadXpmData;
  }

  /**
      Set `loadXpmData` field.
      Params:
        propval = loads an image from data in memory.
  */

  @property void loadXpmData(GdkPixbufModuleLoadXpmDataFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).loadXpmData = propval;
  }

  /**
      Get `stopLoad` field.
      Returns: stops an incremental load.
  */
  @property GdkPixbufModuleStopLoadFunc stopLoad()
  {
    return (cast(GdkPixbufModule*)this._cPtr).stopLoad;
  }

  /**
      Set `stopLoad` field.
      Params:
        propval = stops an incremental load.
  */

  @property void stopLoad(GdkPixbufModuleStopLoadFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).stopLoad = propval;
  }

  /**
      Get `loadIncrement` field.
      Returns: continues an incremental load.
  */
  @property GdkPixbufModuleIncrementLoadFunc loadIncrement()
  {
    return (cast(GdkPixbufModule*)this._cPtr).loadIncrement;
  }

  /**
      Set `loadIncrement` field.
      Params:
        propval = continues an incremental load.
  */

  @property void loadIncrement(GdkPixbufModuleIncrementLoadFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).loadIncrement = propval;
  }

  /**
      Get `loadAnimation` field.
      Returns: loads an animation from a file.
  */
  @property GdkPixbufModuleLoadAnimationFunc loadAnimation()
  {
    return (cast(GdkPixbufModule*)this._cPtr).loadAnimation;
  }

  /**
      Set `loadAnimation` field.
      Params:
        propval = loads an animation from a file.
  */

  @property void loadAnimation(GdkPixbufModuleLoadAnimationFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).loadAnimation = propval;
  }

  /**
      Get `save` field.
      Returns: saves a [gdkpixbuf.pixbuf.Pixbuf] to a file.
  */
  @property GdkPixbufModuleSaveFunc save()
  {
    return (cast(GdkPixbufModule*)this._cPtr).save;
  }

  /**
      Set `save` field.
      Params:
        propval = saves a [gdkpixbuf.pixbuf.Pixbuf] to a file.
  */

  @property void save(GdkPixbufModuleSaveFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).save = propval;
  }

  /**
      Get `isSaveOptionSupported` field.
      Returns: returns whether a save option key is supported by the module
  */
  @property GdkPixbufModuleSaveOptionSupportedFunc isSaveOptionSupported()
  {
    return (cast(GdkPixbufModule*)this._cPtr).isSaveOptionSupported;
  }

  /**
      Set `isSaveOptionSupported` field.
      Params:
        propval = returns whether a save option key is supported by the module
  */

  @property void isSaveOptionSupported(GdkPixbufModuleSaveOptionSupportedFunc propval)
  {
    (cast(GdkPixbufModule*)this._cPtr).isSaveOptionSupported = propval;
  }
}
