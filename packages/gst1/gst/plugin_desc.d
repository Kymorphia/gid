/// Module for [PluginDesc] class
module gst.plugin_desc;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A plugin should export a variable of this type called plugin_desc. The plugin
    loader will use the data provided there to initialize the plugin.
    
    The @licence parameter must be one of: LGPL, GPL, QPL, GPL/QPL, MPL,
    BSD, MIT/X11, Proprietary, unknown.
*/
class PluginDesc
{
  GstPluginDesc _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.plugin_desc.PluginDesc");

    _cInstance = *cast(GstPluginDesc*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `majorVersion` field.
      Returns: the major version number of core that plugin was compiled for
  */
  @property int majorVersion()
  {
    return (cast(GstPluginDesc*)this._cPtr).majorVersion;
  }

  /**
      Set `majorVersion` field.
      Params:
        propval = the major version number of core that plugin was compiled for
  */
  @property void majorVersion(int propval)
  {
    (cast(GstPluginDesc*)this._cPtr).majorVersion = propval;
  }

  /**
      Get `minorVersion` field.
      Returns: the minor version number of core that plugin was compiled for
  */
  @property int minorVersion()
  {
    return (cast(GstPluginDesc*)this._cPtr).minorVersion;
  }

  /**
      Set `minorVersion` field.
      Params:
        propval = the minor version number of core that plugin was compiled for
  */
  @property void minorVersion(int propval)
  {
    (cast(GstPluginDesc*)this._cPtr).minorVersion = propval;
  }

  /**
      Get `name` field.
      Returns: a unique name of the plugin
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = a unique name of the plugin
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).name);
  }

  /**
      Get `description` field.
      Returns: description of plugin
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = description of plugin
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).description);
  }

  /**
      Get `pluginInit` field.
      Returns: pointer to the init function of this plugin.
  */
  @property GstPluginInitFunc pluginInit()
  {
    return (cast(GstPluginDesc*)this._cPtr).pluginInit;
  }

  /**
      Set `pluginInit` field.
      Params:
        propval = pointer to the init function of this plugin.
  */

  @property void pluginInit(GstPluginInitFunc propval)
  {
    (cast(GstPluginDesc*)this._cPtr).pluginInit = propval;
  }

  /**
      Get `version_` field.
      Returns: version of the plugin
  */
  @property string version_()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).version_);
  }

  /**
      Set `version_` field.
      Params:
        propval = version of the plugin
  */
  @property void version_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).version_);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).version_);
  }

  /**
      Get `license` field.
      Returns: effective license of plugin
  */
  @property string license()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).license);
  }

  /**
      Set `license` field.
      Params:
        propval = effective license of plugin
  */
  @property void license(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).license);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).license);
  }

  /**
      Get `source` field.
      Returns: source module plugin belongs to
  */
  @property string source()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).source);
  }

  /**
      Set `source` field.
      Params:
        propval = source module plugin belongs to
  */
  @property void source(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).source);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).source);
  }

  /**
      Get `package_` field.
      Returns: shipped package plugin belongs to
  */
  @property string package_()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).package_);
  }

  /**
      Set `package_` field.
      Params:
        propval = shipped package plugin belongs to
  */
  @property void package_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).package_);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).package_);
  }

  /**
      Get `origin` field.
      Returns: URL to provider of plugin
  */
  @property string origin()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = URL to provider of plugin
  */
  @property void origin(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).origin);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).origin);
  }

  /**
      Get `releaseDatetime` field.
      Returns: date time string in ISO 8601
            format (or rather, a subset thereof), or null. Allowed are the
            following formats: "YYYY-MM-DD" and "YYY-MM-DDTHH:MMZ" (with
            'T' a separator and 'Z' indicating UTC/Zulu time). This field
            should be set via the GST_PACKAGE_RELEASE_DATETIME
            preprocessor macro.
  */
  @property string releaseDatetime()
  {
    return cToD!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).releaseDatetime);
  }

  /**
      Set `releaseDatetime` field.
      Params:
        propval = date time string in ISO 8601
              format (or rather, a subset thereof), or null. Allowed are the
              following formats: "YYYY-MM-DD" and "YYY-MM-DDTHH:MMZ" (with
              'T' a separator and 'Z' indicating UTC/Zulu time). This field
              should be set via the GST_PACKAGE_RELEASE_DATETIME
              preprocessor macro.
  */
  @property void releaseDatetime(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstPluginDesc*)this._cPtr).releaseDatetime);
    dToC(propval, cast(void*)&(cast(GstPluginDesc*)this._cPtr).releaseDatetime);
  }
}
