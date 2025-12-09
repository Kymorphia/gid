/// Module for [Plugin] class
module gst.plugin;

import gid.gid;
import glib.error;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.structure;
import gst.types;

/**
    GStreamer is extensible, so #GstElement instances can be loaded at runtime.
    A plugin system can provide one or more of the basic GStreamer
    #GstPluginFeature subclasses.
    
    A plugin should export a symbol `gst_plugin_desc` that is a
    struct of type #GstPluginDesc.
    the plugin loader will check the version of the core library the plugin was
    linked against and will create a new #GstPlugin. It will then call the
    #GstPluginInitFunc function that was provided in the
    `gst_plugin_desc`.
    
    Once you have a handle to a #GstPlugin (e.g. from the #GstRegistry), you
    can add any object that subclasses #GstPluginFeature.
    
    Usually plugins are always automatically loaded so you don't need to call
    [gst.plugin.Plugin.load] explicitly to bring it into memory. There are options to
    statically link plugins to an app or even use GStreamer without a plugin
    repository in which case [gst.plugin.Plugin.load] can be needed to bring the plugin
    into memory.
*/
class Plugin : gst.object.ObjectWrap
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
    return cast(void function())gst_plugin_get_type != &gidSymbolNotFound ? gst_plugin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Plugin self()
  {
    return this;
  }

  /**
      Load the named plugin. Refs the plugin.
  
      Params:
        name = name of plugin to load
      Returns: a reference to a loaded plugin, or
        null on error.
  */
  static gst.plugin.Plugin loadByName(string name)
  {
    GstPlugin* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_plugin_load_by_name(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Loads the given plugin and refs it.  Caller needs to unref after use.
  
      Params:
        filename = the plugin filename to load
      Returns: a reference to the existing loaded GstPlugin, a
        reference to the newly-loaded GstPlugin, or null if an error occurred.
      Throws: [ErrorWrap]
  */
  static gst.plugin.Plugin loadFile(string filename)
  {
    GstPlugin* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_plugin_load_file(_filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers a static plugin, ie. a plugin which is private to an application
      or library and contained within the application or library (as opposed to
      being shipped as a separate module file).
      
      You must make sure that GStreamer has been initialised (with [gst.global.init_] or
      via [gst.global.initGetOptionGroup]) before calling this function.
  
      Params:
        majorVersion = the major version number of the GStreamer core that the
              plugin was compiled for, you can just use GST_VERSION_MAJOR here
        minorVersion = the minor version number of the GStreamer core that the
              plugin was compiled for, you can just use GST_VERSION_MINOR here
        name = a unique name of the plugin (ideally prefixed with an application- or
              library-specific namespace prefix in order to avoid name conflicts in
              case a similar plugin with the same name ever gets added to GStreamer)
        description = description of the plugin
        initFunc = pointer to the init function of this plugin.
        version_ = version string of the plugin
        license = effective license of plugin. Must be one of the approved licenses
              (see #GstPluginDesc above) or the plugin will not be registered.
        source = source module plugin belongs to
        package_ = shipped package plugin belongs to
        origin = URL to provider of plugin
      Returns: true if the plugin was registered correctly, otherwise false.
  */
  static bool registerStatic(int majorVersion, int minorVersion, string name, string description, gst.types.PluginInitFunc initFunc, string version_, string license, string source, string package_, string origin)
  {
    static gst.types.PluginInitFunc _static_initFunc;

    extern(C) bool _initFuncCallback(GstPlugin* plugin)
    {
      bool _retval = _static_initFunc(gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(void*)plugin, No.Take));
      return _retval;
    }
    auto _initFuncCB = initFunc ? &_initFuncCallback : null;

    _static_initFunc = initFunc;
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _version_ = version_.toCString(No.Alloc);
    const(char)* _license = license.toCString(No.Alloc);
    const(char)* _source = source.toCString(No.Alloc);
    const(char)* _package_ = package_.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    _retval = gst_plugin_register_static(majorVersion, minorVersion, _name, _description, _initFuncCB, _version_, _license, _source, _package_, _origin);
    _static_initFunc = null;
    return _retval;
  }

  /**
      Registers a static plugin, ie. a plugin which is private to an application
      or library and contained within the application or library (as opposed to
      being shipped as a separate module file) with a #GstPluginInitFullFunc
      which allows user data to be passed to the callback function (useful
      for bindings).
      
      You must make sure that GStreamer has been initialised (with [gst.global.init_] or
      via [gst.global.initGetOptionGroup]) before calling this function.
  
      Params:
        majorVersion = the major version number of the GStreamer core that the
              plugin was compiled for, you can just use GST_VERSION_MAJOR here
        minorVersion = the minor version number of the GStreamer core that the
              plugin was compiled for, you can just use GST_VERSION_MINOR here
        name = a unique name of the plugin (ideally prefixed with an application- or
              library-specific namespace prefix in order to avoid name conflicts in
              case a similar plugin with the same name ever gets added to GStreamer)
        description = description of the plugin
        initFullFunc = pointer to the init function with user data
              of this plugin.
        version_ = version string of the plugin
        license = effective license of plugin. Must be one of the approved licenses
              (see #GstPluginDesc above) or the plugin will not be registered.
        source = source module plugin belongs to
        package_ = shipped package plugin belongs to
        origin = URL to provider of plugin
      Returns: true if the plugin was registered correctly, otherwise false.
  */
  static bool registerStaticFull(int majorVersion, int minorVersion, string name, string description, gst.types.PluginInitFullFunc initFullFunc, string version_, string license, string source, string package_, string origin)
  {
    extern(C) bool _initFullFuncCallback(GstPlugin* plugin, void* userData)
    {
      auto _dlg = cast(gst.types.PluginInitFullFunc*)userData;

      bool _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(void*)plugin, No.Take));
      return _retval;
    }
    auto _initFullFuncCB = initFullFunc ? &_initFullFuncCallback : null;

    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _version_ = version_.toCString(No.Alloc);
    const(char)* _license = license.toCString(No.Alloc);
    const(char)* _source = source.toCString(No.Alloc);
    const(char)* _package_ = package_.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    auto _initFullFunc = initFullFunc ? cast(void*)&(initFullFunc) : null;
    _retval = gst_plugin_register_static_full(majorVersion, minorVersion, _name, _description, _initFullFuncCB, _version_, _license, _source, _package_, _origin, _initFullFunc);
    return _retval;
  }

  /**
      Make GStreamer aware of external dependencies which affect the feature
      set of this plugin (ie. the elements or typefinders associated with it).
      
      GStreamer will re-inspect plugins with external dependencies whenever any
      of the external dependencies change. This is useful for plugins which wrap
      other plugin systems, e.g. a plugin which wraps a plugin-based visualisation
      library and makes visualisations available as GStreamer elements, or a
      codec loader which exposes elements and/or caps dependent on what external
      codec libraries are currently installed.
  
      Params:
        envVars = null-terminated array of environment variables affecting the
              feature set of the plugin (e.g. an environment variable containing
              paths where to look for additional modules/plugins of a library),
              or null. Environment variable names may be followed by a path component
               which will be added to the content of the environment variable, e.g.
               "HOME/.mystuff/plugins".
        paths = null-terminated array of directories/paths where dependent files
              may be, or null.
        names = null-terminated array of file names (or file name suffixes,
              depending on flags) to be used in combination with the paths from
              paths and/or the paths extracted from the environment variables in
              env_vars, or null.
        flags = optional flags, or #GST_PLUGIN_DEPENDENCY_FLAG_NONE
  */
  void addDependency(string[] envVars, string[] paths, string[] names, gst.types.PluginDependencyFlags flags)
  {
    char*[] _tmpenvVars;
    foreach (s; envVars)
      _tmpenvVars ~= s.toCString(No.Alloc);
    _tmpenvVars ~= null;
    const(char*)* _envVars = _tmpenvVars.ptr;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.Alloc);
    _tmppaths ~= null;
    const(char*)* _paths = _tmppaths.ptr;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    _tmpnames ~= null;
    const(char*)* _names = _tmpnames.ptr;
    gst_plugin_add_dependency(cast(GstPlugin*)this._cPtr, _envVars, _paths, _names, flags);
  }

  /**
      Make GStreamer aware of external dependencies which affect the feature
      set of this plugin (ie. the elements or typefinders associated with it).
      
      GStreamer will re-inspect plugins with external dependencies whenever any
      of the external dependencies change. This is useful for plugins which wrap
      other plugin systems, e.g. a plugin which wraps a plugin-based visualisation
      library and makes visualisations available as GStreamer elements, or a
      codec loader which exposes elements and/or caps dependent on what external
      codec libraries are currently installed.
      
      Convenience wrapper function for [gst.plugin.Plugin.addDependency] which
      takes simple strings as arguments instead of string arrays, with multiple
      arguments separated by predefined delimiters (see above).
  
      Params:
        envVars = one or more environment variables (separated by ':', ';' or ','),
               or null. Environment variable names may be followed by a path component
               which will be added to the content of the environment variable, e.g.
               "HOME/.mystuff/plugins:MYSTUFF_PLUGINS_PATH"
        paths = one ore more directory paths (separated by ':' or ';' or ','),
               or null. Example: "/usr/lib/mystuff/plugins"
        names = one or more file names or file name suffixes (separated by commas),
               or null
        flags = optional flags, or #GST_PLUGIN_DEPENDENCY_FLAG_NONE
  */
  void addDependencySimple(string envVars, string paths, string names, gst.types.PluginDependencyFlags flags)
  {
    const(char)* _envVars = envVars.toCString(No.Alloc);
    const(char)* _paths = paths.toCString(No.Alloc);
    const(char)* _names = names.toCString(No.Alloc);
    gst_plugin_add_dependency_simple(cast(GstPlugin*)this._cPtr, _envVars, _paths, _names, flags);
  }

  /** */
  void addStatusError(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    gst_plugin_add_status_error(cast(GstPlugin*)this._cPtr, _message);
  }

  /** */
  void addStatusInfo(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    gst_plugin_add_status_info(cast(GstPlugin*)this._cPtr, _message);
  }

  /** */
  void addStatusWarning(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    gst_plugin_add_status_warning(cast(GstPlugin*)this._cPtr, _message);
  }

  /**
      Gets the plugin specific data cache. If it is null there is no cached data
      stored. This is the case when the registry is getting rebuilt.
      Returns: The cached data as a
        #GstStructure or null.
  */
  gst.structure.Structure getCacheData()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_plugin_get_cache_data(cast(GstPlugin*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the long descriptive name of the plugin
      Returns: the long name of the plugin
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_description(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      get the filename of the plugin
      Returns: the filename of the plugin
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_filename(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      get the license of the plugin
      Returns: the license of the plugin
  */
  string getLicense()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_license(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the short name of the plugin
      Returns: the name of the plugin
  */
  override string getName()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_name(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      get the URL where the plugin comes from
      Returns: the origin of the plugin
  */
  string getOrigin()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_origin(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      get the package the plugin belongs to.
      Returns: the package of the plugin
  */
  string getPackage()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_package(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the release date (and possibly time) in form of a string, if available.
      
      For normal GStreamer plugin releases this will usually just be a date in
      the form of "YYYY-MM-DD", while pre-releases and builds from git may contain
      a time component after the date as well, in which case the string will be
      formatted like "YYYY-MM-DDTHH:MMZ" (e.g. "2012-04-30T09:30Z").
      
      There may be plugins that do not have a valid release date set on them.
      Returns: the date string of the plugin, or null if not
        available.
  */
  string getReleaseDateString()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_release_date_string(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      get the source module the plugin belongs to.
      Returns: the source of the plugin
  */
  string getSource()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_source(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string[] getStatusErrors()
  {
    char** _cretval;
    _cretval = gst_plugin_get_status_errors(cast(GstPlugin*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  string[] getStatusInfos()
  {
    char** _cretval;
    _cretval = gst_plugin_get_status_infos(cast(GstPlugin*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  string[] getStatusWarnings()
  {
    char** _cretval;
    _cretval = gst_plugin_get_status_warnings(cast(GstPlugin*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      get the version of the plugin
      Returns: the version of the plugin
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = gst_plugin_get_version(cast(GstPlugin*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      queries if the plugin is loaded into memory
      Returns: true is loaded, false otherwise
  */
  bool isLoaded()
  {
    bool _retval;
    _retval = gst_plugin_is_loaded(cast(GstPlugin*)this._cPtr);
    return _retval;
  }

  /**
      Loads plugin. Note that the *return value* is the loaded plugin; plugin is
      untouched. The normal use pattern of this function goes like this:
      
      ```
      GstPlugin *loaded_plugin;
      loaded_plugin = gst_plugin_load (plugin);
      // presumably, we're no longer interested in the potentially-unloaded plugin
      gst_object_unref (plugin);
      plugin = loaded_plugin;
      ```
      Returns: a reference to a loaded plugin, or
        null on error.
  */
  gst.plugin.Plugin load()
  {
    GstPlugin* _cretval;
    _cretval = gst_plugin_load(cast(GstPlugin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.plugin.Plugin)(cast(GstPlugin*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds plugin specific data to cache. Passes the ownership of the structure to
      the plugin.
      
      The cache is flushed every time the registry is rebuilt.
  
      Params:
        cacheData = a structure containing the data to cache
  */
  void setCacheData(gst.structure.Structure cacheData)
  {
    gst_plugin_set_cache_data(cast(GstPlugin*)this._cPtr, cacheData ? cast(GstStructure*)cacheData._cPtr(Yes.Dup) : null);
  }
}
