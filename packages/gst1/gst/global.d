/// Global functions for gst1 library
module gst.global;

import gid.gid;
import glib.error;
import glib.types;
import gobject.object;
import gobject.param_spec;
import gobject.types;
import gobject.value;
import gobject.value_array;
import gst.bin;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.caps_features;
import gst.debug_category;
import gst.debug_message;
import gst.element;
import gst.parse_context;
import gst.plugin;
import gst.structure;
import gst.tracer;
import gst.types;


/**
* Initializes the GStreamer library, setting up internal path lists,
* registering built-in elements, and loading standard plugins.
*
* Unless the plugin registry is disabled at compile time, the registry will be
* loaded. By default this will also check if the registry cache needs to be
* updated and rescan all plugins if needed. See gst_update_registry() for
* details and section
* &lt;link linkend="gst-running"&gt;Running GStreamer Applications&lt;/link&gt;
* for how to disable automatic registry updates.
*
* WARNING: This function will terminate your program if it was unable to
* initialize GStreamer for some reason. If you want your program to fall back,
* use gst_init_check() instead.
*
* Params:
*   argv = Array of program arguments or null to not process them.
*/
void init_(ref string[] argv)
{
  int _argc = cast(int)argv.length;
  char** _argv = cast(char**)gMalloc(_argc * (char*).sizeof);
  scope(exit) gFree(_argv);

  foreach (i, a; argv)
    _argv[i] = toCString(a, No.Alloc);

  gst_init(&_argc, &_argv);

  argv.length = _argc;
  foreach (i; 0 .. _argc)
    argv[i] = fromCString(_argv[i], No.Free);
}

/**
* Initializes the GStreamer library, setting up internal path lists,
* registering built-in elements, and loading standard plugins.
*
* This function will return %FALSE if GStreamer could not be initialized
* for some reason.  If you want your program to fail fatally,
* use gst_init() instead.
*
* Params:
*   argv = Array of program arguments or null to not process them.
* Returns: true if GStreamer could be initialized.
* Throws: [ErrorWrap]
*/
bool initCheck(ref string[] argv)
{
  int _argc = cast(int)argv.length;
  char** _argv = cast(char**)gMalloc(_argc * (char*).sizeof);
  scope(exit) gFree(_argv);

  foreach (i, a; argv)
    _argv[i] = toCString(a, No.Alloc);

  GError *_err;
  gboolean _retval = gst_init_check(&_argc, &_argv, &_err);

  if (_err)
    throw new ErrorWrap(_err);

  argv.length = _argc;
  foreach (i; 0 .. _argc)
    argv[i] = fromCString(_argv[i], No.Free);

  return cast(bool)_retval;
}


/**
    Adds the logging function to the list of logging functions.
    Be sure to use #G_GNUC_NO_INSTRUMENT on that function, it is needed.

    Params:
      func = the function to use
*/
void debugAddLogFunction(gst.types.LogFunction func)
{
  extern(C) void _funcCallback(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message, void* userData)
  {
    auto _dlg = cast(gst.types.LogFunction*)userData;
    string _file = file.fromCString(No.Free);
    string _function_ = function_.fromCString(No.Free);

    (*_dlg)(category ? new gst.debug_category.DebugCategory(cast(void*)category, No.Take) : null, level, _file, _function_, line, gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)object, No.Take), message ? new gst.debug_message.DebugMessage(cast(void*)message, No.Take) : null);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  gst_debug_add_log_function(_funcCB, _func, _funcDestroyCB);
}

/**
    Adds a memory ringbuffer based debug logger that stores up to
    max_size_per_thread bytes of logs per thread and times out threads after
    thread_timeout seconds of inactivity.
    
    Logs can be fetched with [gst.global.debugRingBufferLoggerGetLogs] and the
    logger can be removed again with [gst.global.debugRemoveRingBufferLogger].
    Only one logger at a time is possible.

    Params:
      maxSizePerThread = Maximum size of log per thread in bytes
      threadTimeout = Timeout for threads in seconds
*/
void debugAddRingBufferLogger(uint maxSizePerThread, uint threadTimeout)
{
  gst_debug_add_ring_buffer_logger(maxSizePerThread, threadTimeout);
}

/**
    To aid debugging applications one can use this method to obtain the whole
    network of gstreamer elements that form the pipeline into a dot file.
    This data can be processed with graphviz to get an image.

    Params:
      bin = the top-level pipeline that should be analyzed
      details = type of #GstDebugGraphDetails to use
    Returns: a string containing the pipeline in graphviz
      dot format.
*/
string debugBinToDotData(gst.bin.Bin bin, gst.types.DebugGraphDetails details)
{
  char* _cretval;
  _cretval = gst_debug_bin_to_dot_data(bin ? cast(GstBin*)bin._cPtr(No.Dup) : null, details);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    To aid debugging applications one can use this method to write out the whole
    network of gstreamer elements that form the pipeline into a dot file.
    This file can be processed with graphviz to get an image.
    
    ``` shell
     dot -Tpng -oimage.png graph_lowlevel.dot
    ```

    Params:
      bin = the top-level pipeline that should be analyzed
      details = type of #GstDebugGraphDetails to use
      fileName = output base filename (e.g. "myplayer")
*/
void debugBinToDotFile(gst.bin.Bin bin, gst.types.DebugGraphDetails details, string fileName)
{
  const(char)* _fileName = fileName.toCString(No.Alloc);
  gst_debug_bin_to_dot_file(bin ? cast(GstBin*)bin._cPtr(No.Dup) : null, details, _fileName);
}

/**
    This works like [gst.global.debugBinToDotFile], but adds the current timestamp
    to the filename, so that it can be used to take multiple snapshots.

    Params:
      bin = the top-level pipeline that should be analyzed
      details = type of #GstDebugGraphDetails to use
      fileName = output base filename (e.g. "myplayer")
*/
void debugBinToDotFileWithTs(gst.bin.Bin bin, gst.types.DebugGraphDetails details, string fileName)
{
  const(char)* _fileName = fileName.toCString(No.Alloc);
  gst_debug_bin_to_dot_file_with_ts(bin ? cast(GstBin*)bin._cPtr(No.Dup) : null, details, _fileName);
}

/**
    Constructs a string that can be used for getting the desired color in color
    terminals.
    You need to free the string after use.

    Params:
      colorinfo = the color info
    Returns: a string containing the color
          definition
*/
string debugConstructTermColor(uint colorinfo)
{
  char* _cretval;
  _cretval = gst_debug_construct_term_color(colorinfo);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Constructs an integer that can be used for getting the desired color in
    windows' terminals (cmd.exe). As there is no mean to underline, we simply
    ignore this attribute.
    
    This function returns 0 on non-windows machines.

    Params:
      colorinfo = the color info
    Returns: an integer containing the color definition
*/
int debugConstructWinColor(uint colorinfo)
{
  int _retval;
  _retval = gst_debug_construct_win_color(colorinfo);
  return _retval;
}

/**
    Changes the coloring mode for debug output.
    Returns: see GstDebugColorMode for possible values.
*/
gst.types.DebugColorMode debugGetColorMode()
{
  GstDebugColorMode _cretval;
  _cretval = gst_debug_get_color_mode();
  gst.types.DebugColorMode _retval = cast(gst.types.DebugColorMode)_cretval;
  return _retval;
}

/**
    Returns the default threshold that is used for new categories.
    Returns: the default threshold level
*/
gst.types.DebugLevel debugGetDefaultThreshold()
{
  GstDebugLevel _cretval;
  _cretval = gst_debug_get_default_threshold();
  gst.types.DebugLevel _retval = cast(gst.types.DebugLevel)_cretval;
  return _retval;
}

/** */
string debugGetStackTrace(gst.types.StackTraceFlags flags)
{
  char* _cretval;
  _cretval = gst_debug_get_stack_trace(flags);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Checks if debugging output is activated.
    Returns: true, if debugging is activated
*/
bool debugIsActive()
{
  bool _retval;
  _retval = cast(bool)gst_debug_is_active();
  return _retval;
}

/**
    Checks if the debugging output should be colored.
    Returns: true, if the debug output should be colored.
*/
bool debugIsColored()
{
  bool _retval;
  _retval = cast(bool)gst_debug_is_colored();
  return _retval;
}

/**
    The default logging handler used by GStreamer. Logging functions get called
    whenever a macro like GST_DEBUG or similar is used. By default this function
    is setup to output the message and additional info to stderr (or the log file
    specified via the GST_DEBUG_FILE environment variable) as received via
    user_data.
    
    You can add other handlers by using [gst.global.debugAddLogFunction].
    And you can remove this handler by calling
    gst_debug_remove_log_function(gst_debug_log_default);

    Params:
      category = category to log
      level = level of the message
      file = the file that emitted the message, usually the __FILE__ identifier
      function_ = the function that emitted the message
      line = the line from that the message was emitted, usually __LINE__
      object = the object this message relates to,
            or null if none
      message = the actual message
      userData = the FILE* to log to
*/
void debugLogDefault(gst.debug_category.DebugCategory category, gst.types.DebugLevel level, string file, string function_, int line, gobject.object.ObjectWrap object, gst.debug_message.DebugMessage message, void* userData = null)
{
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _function_ = function_.toCString(No.Alloc);
  gst_debug_log_default(category ? cast(GstDebugCategory*)category._cPtr : null, level, _file, _function_, line, object ? cast(GObject*)object._cPtr(No.Dup) : null, message ? cast(GstDebugMessage*)message._cPtr : null, userData);
}

/**
    Returns the string representation for the specified debug log message
    formatted in the same way as [gst.global.debugLogDefault] (the default handler),
    without color. The purpose is to make it easy for custom log output
    handlers to get a log output that is identical to what the default handler
    would write out.

    Params:
      category = category to log
      level = level of the message
      file = the file that emitted the message, usually the __FILE__ identifier
      function_ = the function that emitted the message
      line = the line from that the message was emitted, usually __LINE__
      object = the object this message relates to,
            or null if none
      message = the actual message
    Returns: 
*/
string debugLogGetLine(gst.debug_category.DebugCategory category, gst.types.DebugLevel level, string file, string function_, int line, gobject.object.ObjectWrap object, gst.debug_message.DebugMessage message)
{
  char* _cretval;
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _function_ = function_.toCString(No.Alloc);
  _cretval = gst_debug_log_get_line(category ? cast(GstDebugCategory*)category._cPtr : null, level, _file, _function_, line, object ? cast(GObject*)object._cPtr(No.Dup) : null, message ? cast(GstDebugMessage*)message._cPtr : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Logs the given message using the currently registered debugging handlers.

    Params:
      category = category to log
      level = level of the message is in
      file = the file that emitted the message, usually the __FILE__ identifier
      function_ = the function that emitted the message
      line = the line from that the message was emitted, usually __LINE__
      id = the identifier of the object this message relates to
           or null if none
      messageString = a message string
*/
void debugLogIdLiteral(gst.debug_category.DebugCategory category, gst.types.DebugLevel level, string file, string function_, int line, string id, string messageString)
{
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _function_ = function_.toCString(No.Alloc);
  const(char)* _id = id.toCString(No.Alloc);
  const(char)* _messageString = messageString.toCString(No.Alloc);
  gst_debug_log_id_literal(category ? cast(GstDebugCategory*)category._cPtr : null, level, _file, _function_, line, _id, _messageString);
}

/**
    Logs the given message using the currently registered debugging handlers.

    Params:
      category = category to log
      level = level of the message is in
      file = the file that emitted the message, usually the __FILE__ identifier
      function_ = the function that emitted the message
      line = the line from that the message was emitted, usually __LINE__
      object = the object this message relates to,
            or null if none
      messageString = a message string
*/
void debugLogLiteral(gst.debug_category.DebugCategory category, gst.types.DebugLevel level, string file, string function_, int line, gobject.object.ObjectWrap object, string messageString)
{
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _function_ = function_.toCString(No.Alloc);
  const(char)* _messageString = messageString.toCString(No.Alloc);
  gst_debug_log_literal(category ? cast(GstDebugCategory*)category._cPtr : null, level, _file, _function_, line, object ? cast(GObject*)object._cPtr(No.Dup) : null, _messageString);
}

/**
    If libunwind, glibc backtrace or DbgHelp are present
    a stack trace is printed.
*/
void debugPrintStackTrace()
{
  gst_debug_print_stack_trace();
}

/**
    Removes all registered instances of the given logging functions.

    Params:
      func = the log function to remove, or null to
            remove the default log function
    Returns: How many instances of the function were removed
*/
uint debugRemoveLogFunction(gst.types.LogFunction func = null)
{
  extern(C) void _funcCallback(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message, void* userData)
  {
    auto _dlg = cast(gst.types.LogFunction*)userData;
    string _file = file.fromCString(No.Free);
    string _function_ = function_.fromCString(No.Free);

    (*_dlg)(category ? new gst.debug_category.DebugCategory(cast(void*)category, No.Take) : null, level, _file, _function_, line, gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)object, No.Take), message ? new gst.debug_message.DebugMessage(cast(void*)message, No.Take) : null);
  }
  auto _funcCB = func ? &_funcCallback : null;
  uint _retval;
  _retval = gst_debug_remove_log_function(_funcCB);
  return _retval;
}

/**
    Removes all registered instances of log functions with the given user data.

    Params:
      data = user data of the log function to remove
    Returns: How many instances of the function were removed
*/
uint debugRemoveLogFunctionByData(void* data = null)
{
  uint _retval;
  _retval = gst_debug_remove_log_function_by_data(data);
  return _retval;
}

/**
    Removes any previously added ring buffer logger with
    [gst.global.debugAddRingBufferLogger].
*/
void debugRemoveRingBufferLogger()
{
  gst_debug_remove_ring_buffer_logger();
}

/**
    Fetches the current logs per thread from the ring buffer logger. See
    [gst.global.debugAddRingBufferLogger] for details.
    Returns: NULL-terminated array of
      strings with the debug output per thread
*/
string[] debugRingBufferLoggerGetLogs()
{
  char** _cretval;
  _cretval = gst_debug_ring_buffer_logger_get_logs();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    If activated, debugging messages are sent to the debugging
    handlers.
    It makes sense to deactivate it for speed issues.
    > This function is not threadsafe. It makes sense to only call it
    during initialization.

    Params:
      active = Whether to use debugging output or not
*/
void debugSetActive(bool active)
{
  gst_debug_set_active(active);
}

/**
    Changes the coloring mode for debug output.
    
    This function may be called before [gst.global.init_].

    Params:
      mode = The coloring mode for debug output. See GstDebugColorMode.
*/
void debugSetColorMode(gst.types.DebugColorMode mode)
{
  gst_debug_set_color_mode(mode);
}

/**
    Changes the coloring mode for debug output.
    
    This function may be called before [gst.global.init_].

    Params:
      mode = The coloring mode for debug output. One of the following:
        "on", "auto", "off", "disable", "unix".
*/
void debugSetColorModeFromString(string mode)
{
  const(char)* _mode = mode.toCString(No.Alloc);
  gst_debug_set_color_mode_from_string(_mode);
}

/**
    Sets or unsets the use of coloured debugging output.
    Same as gst_debug_set_color_mode () with the argument being
    being GST_DEBUG_COLOR_MODE_ON or GST_DEBUG_COLOR_MODE_OFF.
    
    This function may be called before [gst.global.init_].

    Params:
      colored = Whether to use colored output or not
*/
void debugSetColored(bool colored)
{
  gst_debug_set_colored(colored);
}

/**
    Sets the default threshold to the given level and updates all categories to
    use this threshold.
    
    This function may be called before [gst.global.init_].

    Params:
      level = level to set
*/
void debugSetDefaultThreshold(gst.types.DebugLevel level)
{
  gst_debug_set_default_threshold(level);
}

/**
    Sets all categories which match the given glob style pattern to the given
    level.

    Params:
      name = name of the categories to set
      level = level to set them to
*/
void debugSetThresholdForName(string name, gst.types.DebugLevel level)
{
  const(char)* _name = name.toCString(No.Alloc);
  gst_debug_set_threshold_for_name(_name, level);
}

/**
    Sets the debug logging wanted in the same form as with the GST_DEBUG
    environment variable. You can use wildcards such as `*`, but note that
    the order matters when you use wild cards, e.g. `foosrc:6,*src:3,*:2` sets
    everything to log level 2.

    Params:
      list = comma-separated list of "category:level" pairs to be used
            as debug logging levels
      reset = true to clear all previously-set debug levels before setting
            new thresholds
        false if adding the threshold described by list to the one already set.
*/
void debugSetThresholdFromString(string list, bool reset)
{
  const(char)* _list = list.toCString(No.Alloc);
  gst_debug_set_threshold_from_string(_list, reset);
}

/**
    Resets all categories with the given name back to the default level.

    Params:
      name = name of the categories to set
*/
void debugUnsetThresholdForName(string name)
{
  const(char)* _name = name.toCString(No.Alloc);
  gst_debug_unset_threshold_for_name(_name);
}

/**
    Clean up any resources created by GStreamer in [gst.global.init_].
    
    It is normally not needed to call this function in a normal application
    as the resources will automatically be freed when the program terminates.
    This function is therefore mostly used by testsuites and other memory
    profiling tools.
    
    After this call GStreamer (including this method) should not be used anymore.
*/
void deinit()
{
  gst_deinit();
}

/**
    Registers a new #GstDynamicTypeFactory in the registry

    Params:
      plugin = The #GstPlugin to register dyn_type for
      type = The #GType to register dynamically
    Returns: 
*/
bool dynamicTypeRegister(gst.plugin.Plugin plugin, gobject.types.GType type)
{
  bool _retval;
  _retval = cast(bool)gst_dynamic_type_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, type);
  return _retval;
}

/**
    Get a string describing the error message in the current locale.

    Params:
      domain = the GStreamer error domain this error belongs to.
      code = the error code belonging to the domain.
    Returns: a newly allocated string describing
          the error message (in UTF-8 encoding)
*/
string errorGetMessage(glib.types.Quark domain, int code)
{
  char* _cretval;
  _cretval = gst_error_get_message(domain, code);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Similar to [glib.global.filenameToUri], but attempts to handle relative file paths
    as well. Before converting filename into an URI, it will be prefixed by
    the current working directory if it is a relative path, and then the path
    will be canonicalised so that it doesn't contain any './' or '../' segments.
    
    On Windows filename should be in UTF-8 encoding.

    Params:
      filename = absolute or relative file name path
    Returns: newly-allocated URI string, or NULL on error. The caller must
        free the URI string with [glib.global.gfree] when no longer needed.
    Throws: [ErrorWrap]
*/
string filenameToUri(string filename)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  GError *_err;
  _cretval = gst_filename_to_uri(_filename, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets a string representing the given flow return.

    Params:
      ret = a #GstFlowReturn to get the name of.
    Returns: a static string with the name of the flow return.
*/
string flowGetName(gst.types.FlowReturn ret)
{
  const(char)* _cretval;
  _cretval = gst_flow_get_name(ret);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the unique quark for the given GstFlowReturn.

    Params:
      ret = a #GstFlowReturn to get the quark of.
    Returns: the quark associated with the flow return or 0 if an
      invalid return was specified.
*/
glib.types.Quark flowToQuark(gst.types.FlowReturn ret)
{
  glib.types.Quark _retval;
  _retval = gst_flow_to_quark(ret);
  return _retval;
}

/**
    See if the given format is inside the format array.

    Params:
      formats = The format array to search
      format = the format to find
    Returns: true if the format is found inside the array
*/
bool formatsContains(gst.types.Format[] formats, gst.types.Format format)
{
  bool _retval;
  auto _formats = cast(const(GstFormat)*)(formats ~ GstFormat.init).ptr;
  _retval = cast(bool)gst_formats_contains(_formats, format);
  return _retval;
}

/**
    This helper is mostly helpful for plugins that need to
    inspect the folder of the main executable to determine
    their set of features.
    
    When a plugin is initialized from the gst-plugin-scanner
    external process, the returned path will be the same as from the
    parent process.
    Returns: The path of the executable that
        initialized GStreamer, or null if it could not be determined.
*/
string getMainExecutablePath()
{
  const(char)* _cretval;
  _cretval = gst_get_main_executable_path();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Checks if obj is a #GstCapsFeatures

    Params:
      obj = 
    Returns: true if obj is a #GstCapsFeatures false otherwise
*/
bool isCapsFeatures(const(void)* obj = null)
{
  bool _retval;
  _retval = cast(bool)gst_is_caps_features(obj);
  return _retval;
}

/**
    Use this function to check if GStreamer has been initialized with [gst.global.init_]
    or [gst.global.initCheck].
    Returns: true if initialization has been done, false otherwise.
*/
bool isInitialized()
{
  bool _retval;
  _retval = cast(bool)gst_is_initialized();
  return _retval;
}

/**
    This function creates a GstArray GParamSpec for use by objects/elements
    that want to expose properties of GstArray type. This function is
    typically * used in connection with [gobject.object_class.ObjectClass.installProperty] in a
    GObjects's instance_init function.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      elementSpec = GParamSpec of the array
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gobject.param_spec.ParamSpec paramSpecArray(string name, string nick, string blurb, gobject.param_spec.ParamSpec elementSpec, gobject.types.ParamFlags flags)
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _nick = nick.toCString(No.Alloc);
  const(char)* _blurb = blurb.toCString(No.Alloc);
  _cretval = gst_param_spec_array(_name, _nick, _blurb, elementSpec ? cast(GParamSpec*)elementSpec._cPtr(No.Dup) : null, flags);
  auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    This function creates a fraction GParamSpec for use by objects/elements
    that want to expose properties of fraction type. This function is typically
    used in connection with [gobject.object_class.ObjectClass.installProperty] in a GObjects's
    instance_init function.

    Params:
      name = canonical name of the property specified
      nick = nick name for the property specified
      blurb = description of the property specified
      minNum = minimum value (fraction numerator)
      minDenom = minimum value (fraction denominator)
      maxNum = maximum value (fraction numerator)
      maxDenom = maximum value (fraction denominator)
      defaultNum = default value (fraction numerator)
      defaultDenom = default value (fraction denominator)
      flags = flags for the property specified
    Returns: a newly created parameter specification
*/
gobject.param_spec.ParamSpec paramSpecFraction(string name, string nick, string blurb, int minNum, int minDenom, int maxNum, int maxDenom, int defaultNum, int defaultDenom, gobject.types.ParamFlags flags)
{
  GParamSpec* _cretval;
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _nick = nick.toCString(No.Alloc);
  const(char)* _blurb = blurb.toCString(No.Alloc);
  _cretval = gst_param_spec_fraction(_name, _nick, _blurb, minNum, minDenom, maxNum, maxDenom, defaultNum, defaultDenom, flags);
  auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
gobject.types.GType parentBufferMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_parent_buffer_meta_api_get_type();
  return _retval;
}

/**
    This is a convenience wrapper around [gst.global.parseLaunch] to create a
    #GstBin from a gst-launch-style pipeline description. See
    [gst.global.parseLaunch] and the gst-launch man page for details about the
    syntax. Ghost pads on the bin for unlinked source or sink pads
    within the bin can automatically be created (but only a maximum of
    one ghost pad for each direction will be created; if you expect
    multiple unlinked source pads or multiple unlinked sink pads
    and want them all ghosted, you will have to create the ghost pads
    yourself).

    Params:
      binDescription = command line describing the bin
      ghostUnlinkedPads = whether to automatically create ghost pads
            for unlinked source or sink pads within the bin
    Returns: a
        newly-created bin, or null if an error occurred.
    Throws: [ErrorWrap]
*/
gst.bin.Bin parseBinFromDescription(string binDescription, bool ghostUnlinkedPads)
{
  GstElement* _cretval;
  const(char)* _binDescription = binDescription.toCString(No.Alloc);
  GError *_err;
  _cretval = gst_parse_bin_from_description(_binDescription, ghostUnlinkedPads, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.bin.Bin)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    This is a convenience wrapper around [gst.global.parseLaunch] to create a
    #GstBin from a gst-launch-style pipeline description. See
    [gst.global.parseLaunch] and the gst-launch man page for details about the
    syntax. Ghost pads on the bin for unlinked source or sink pads
    within the bin can automatically be created (but only a maximum of
    one ghost pad for each direction will be created; if you expect
    multiple unlinked source pads or multiple unlinked sink pads
    and want them all ghosted, you will have to create the ghost pads
    yourself).

    Params:
      binDescription = command line describing the bin
      ghostUnlinkedPads = whether to automatically create ghost pads
            for unlinked source or sink pads within the bin
      context = a parse context allocated with
            [gst.parse_context.ParseContext.new_], or null
      flags = parsing options, or #GST_PARSE_FLAG_NONE
    Returns: a newly-created
        element, which is guaranteed to be a bin unless
        #GST_PARSE_FLAG_NO_SINGLE_ELEMENT_BINS was passed, or null if an error
        occurred.
    Throws: [ErrorWrap]
*/
gst.element.Element parseBinFromDescriptionFull(string binDescription, bool ghostUnlinkedPads, gst.parse_context.ParseContext context, gst.types.ParseFlags flags)
{
  GstElement* _cretval;
  const(char)* _binDescription = binDescription.toCString(No.Alloc);
  GError *_err;
  _cretval = gst_parse_bin_from_description_full(_binDescription, ghostUnlinkedPads, context ? cast(GstParseContext*)context._cPtr(No.Dup) : null, flags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    Create a new pipeline based on command line syntax.
    Please note that you might get a return value that is not null even though
    the error is set. In this case there was a recoverable parsing error and you
    can try to play the pipeline.
    
    To create a sub-pipeline (bin) for embedding into an existing pipeline
    use [gst.global.parseBinFromDescription].

    Params:
      pipelineDescription = the command line describing the pipeline
    Returns: a new element on success, null on
        failure. If more than one toplevel element is specified by the
        pipeline_description, all elements are put into a #GstPipeline, which
        than is returned.
    Throws: [ErrorWrap]
*/
gst.element.Element parseLaunch(string pipelineDescription)
{
  GstElement* _cretval;
  const(char)* _pipelineDescription = pipelineDescription.toCString(No.Alloc);
  GError *_err;
  _cretval = gst_parse_launch(_pipelineDescription, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    Create a new pipeline based on command line syntax.
    Please note that you might get a return value that is not null even though
    the error is set. In this case there was a recoverable parsing error and you
    can try to play the pipeline.
    
    To create a sub-pipeline (bin) for embedding into an existing pipeline
    use [gst.global.parseBinFromDescriptionFull].

    Params:
      pipelineDescription = the command line describing the pipeline
      context = a parse context allocated with
             [gst.parse_context.ParseContext.new_], or null
      flags = parsing options, or #GST_PARSE_FLAG_NONE
    Returns: a new element on success, null on
         failure. If more than one toplevel element is specified by the
         pipeline_description, all elements are put into a #GstPipeline, which
         then is returned (unless the GST_PARSE_FLAG_PLACE_IN_BIN flag is set, in
         which case they are put in a #GstBin instead).
    Throws: [ErrorWrap]
*/
gst.element.Element parseLaunchFull(string pipelineDescription, gst.parse_context.ParseContext context, gst.types.ParseFlags flags)
{
  GstElement* _cretval;
  const(char)* _pipelineDescription = pipelineDescription.toCString(No.Alloc);
  GError *_err;
  _cretval = gst_parse_launch_full(_pipelineDescription, context ? cast(GstParseContext*)context._cPtr(No.Dup) : null, flags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    Create a new element based on command line syntax.
    error will contain an error message if an erroneous pipeline is specified.
    An error does not mean that the pipeline could not be constructed.

    Params:
      argv = null-terminated array of arguments
    Returns: a new element on success and null
      on failure.
    Throws: [ErrorWrap]
*/
gst.element.Element parseLaunchv(string[] argv)
{
  GstElement* _cretval;
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  const(char*)* _argv = _tmpargv.ptr;

  GError *_err;
  _cretval = gst_parse_launchv(_argv, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    Create a new element based on command line syntax.
    error will contain an error message if an erroneous pipeline is specified.
    An error does not mean that the pipeline could not be constructed.

    Params:
      argv = null-terminated array of arguments
      context = a parse context allocated with
            [gst.parse_context.ParseContext.new_], or null
      flags = parsing options, or #GST_PARSE_FLAG_NONE
    Returns: a new element on success; on
        failure, either null or a partially-constructed bin or element will be
        returned and error will be set (unless you passed
        #GST_PARSE_FLAG_FATAL_ERRORS in flags, then null will always be returned
        on failure)
    Throws: [ErrorWrap]
*/
gst.element.Element parseLaunchvFull(string[] argv, gst.parse_context.ParseContext context, gst.types.ParseFlags flags)
{
  GstElement* _cretval;
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  const(char*)* _argv = _tmpargv.ptr;

  GError *_err;
  _cretval = gst_parse_launchv_full(_argv, context ? cast(GstParseContext*)context._cPtr(No.Dup) : null, flags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
  return _retval;
}

/**
    Iterates the supplied list of UUIDs and checks the GstRegistry for
    all the decryptors supporting one of the supplied UUIDs.

    Params:
      systemIdentifiers = A null terminated array of strings that contains the UUID values of each
        protection system that is to be checked.
    Returns: A null terminated array containing all
      the system_identifiers supported by the set of available decryptors, or
      null if no matches were found.
*/
string[] protectionFilterSystemsByAvailableDecryptors(string[] systemIdentifiers)
{
  char** _cretval;
  char*[] _tmpsystemIdentifiers;
  foreach (s; systemIdentifiers)
    _tmpsystemIdentifiers ~= s.toCString(No.Alloc);
  _tmpsystemIdentifiers ~= null;
  const(char*)* _systemIdentifiers = _tmpsystemIdentifiers.ptr;

  _cretval = gst_protection_filter_systems_by_available_decryptors(_systemIdentifiers);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/** */
gobject.types.GType protectionMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_protection_meta_api_get_type();
  return _retval;
}

/**
    Iterates the supplied list of UUIDs and checks the GstRegistry for
    an element that supports one of the supplied UUIDs. If more than one
    element matches, the system ID of the highest ranked element is selected.

    Params:
      systemIdentifiers = A null terminated array of strings
        that contains the UUID values of each protection system that is to be
        checked.
    Returns: One of the strings from
      system_identifiers that indicates the highest ranked element that
      implements the protection system indicated by that system ID, or null if no
      element has been found.
*/
string protectionSelectSystem(string[] systemIdentifiers)
{
  const(char)* _cretval;
  char*[] _tmpsystemIdentifiers;
  foreach (s; systemIdentifiers)
    _tmpsystemIdentifiers ~= s.toCString(No.Alloc);
  _tmpsystemIdentifiers ~= null;
  const(char*)* _systemIdentifiers = _tmpsystemIdentifiers.ptr;

  _cretval = gst_protection_select_system(_systemIdentifiers);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/** */
gobject.types.GType referenceTimestampMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_reference_timestamp_meta_api_get_type();
  return _retval;
}

/**
    Some functions in the GStreamer core might install a custom SIGSEGV handler
    to better catch and report errors to the application. Currently this feature
    is enabled by default when loading plugins.
    
    Applications might want to disable this behaviour with the
    [gst.global.segtrapSetEnabled] function. This is typically done if the application
    wants to install its own handler without GStreamer interfering.
    Returns: true if GStreamer is allowed to install a custom SIGSEGV handler.
*/
bool segtrapIsEnabled()
{
  bool _retval;
  _retval = cast(bool)gst_segtrap_is_enabled();
  return _retval;
}

/**
    Applications might want to disable/enable the SIGSEGV handling of
    the GStreamer core. See [gst.global.segtrapIsEnabled] for more information.

    Params:
      enabled = whether a custom SIGSEGV handler should be installed.
*/
void segtrapSetEnabled(bool enabled)
{
  gst_segtrap_set_enabled(enabled);
}

/** */
gobject.types.GType staticCapsGetType()
{
  gobject.types.GType _retval;
  _retval = gst_static_caps_get_type();
  return _retval;
}

/** */
gobject.types.GType staticPadTemplateGetType()
{
  gobject.types.GType _retval;
  _retval = gst_static_pad_template_get_type();
  return _retval;
}

/**
    Checks if the given type is already registered.

    Params:
      tag = name of the tag
    Returns: true if the type is already registered
*/
bool tagExists(string tag)
{
  bool _retval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _retval = cast(bool)gst_tag_exists(_tag);
  return _retval;
}

/**
    Returns the human-readable description of this tag, You must not change or
    free this string.

    Params:
      tag = the tag
    Returns: the human-readable description of this tag
*/
string tagGetDescription(string tag)
{
  const(char)* _cretval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _cretval = gst_tag_get_description(_tag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the flag of tag.

    Params:
      tag = the tag
    Returns: the flag of this tag.
*/
gst.types.TagFlag tagGetFlag(string tag)
{
  GstTagFlag _cretval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _cretval = gst_tag_get_flag(_tag);
  gst.types.TagFlag _retval = cast(gst.types.TagFlag)_cretval;
  return _retval;
}

/**
    Returns the human-readable name of this tag, You must not change or free
    this string.

    Params:
      tag = the tag
    Returns: the human-readable name of this tag
*/
string tagGetNick(string tag)
{
  const(char)* _cretval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _cretval = gst_tag_get_nick(_tag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the #GType used for this tag.

    Params:
      tag = the tag
    Returns: the #GType of this tag
*/
gobject.types.GType tagGetType(string tag)
{
  gobject.types.GType _retval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _retval = gst_tag_get_type(_tag);
  return _retval;
}

/**
    Checks if the given tag is fixed. A fixed tag can only contain one value.
    Unfixed tags can contain lists of values.

    Params:
      tag = tag to check
    Returns: true, if the given tag is fixed.
*/
bool tagIsFixed(string tag)
{
  bool _retval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _retval = cast(bool)gst_tag_is_fixed(_tag);
  return _retval;
}

/**
    This is a convenience function for the func argument of [gst.global.tagRegister].
    It concatenates all given strings using a comma. The tag must be registered
    as a G_TYPE_STRING or this function will fail.

    Params:
      dest = uninitialized GValue to store result in
      src = GValue to copy from
*/
void tagMergeStringsWithComma(out gobject.value.Value dest, gobject.value.Value src)
{
  GValue _dest;
  gst_tag_merge_strings_with_comma(&_dest, src ? cast(const(GValue)*)src._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
}

/**
    This is a convenience function for the func argument of [gst.global.tagRegister].
    It creates a copy of the first value from the list.

    Params:
      dest = uninitialized GValue to store result in
      src = GValue to copy from
*/
void tagMergeUseFirst(out gobject.value.Value dest, gobject.value.Value src)
{
  GValue _dest;
  gst_tag_merge_use_first(&_dest, src ? cast(const(GValue)*)src._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
}

/**
    Get a list of all active tracer objects owned by the tracing framework for
    the entirety of the run-time of the process or till [gst.global.deinit] is called.
    Returns: A #GList of
      #GstTracer objects
*/
gst.tracer.Tracer[] tracingGetActiveTracers()
{
  GList* _cretval;
  _cretval = gst_tracing_get_active_tracers();
  auto _retval = gListToD!(gst.tracer.Tracer, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/** */
gobject.types.GType typeFindGetType()
{
  gobject.types.GType _retval;
  _retval = gst_type_find_get_type();
  return _retval;
}

/**
    Checks if type is plugin API. See [gst.global.typeMarkAsPluginApi] for
    details.

    Params:
      type = a GType
      flags = What #GstPluginAPIFlags the plugin was marked with
    Returns: true if type is plugin API or false otherwise.
*/
bool typeIsPluginApi(gobject.types.GType type, out gst.types.PluginAPIFlags flags)
{
  bool _retval;
  _retval = cast(bool)gst_type_is_plugin_api(type, &flags);
  return _retval;
}

/**
    Marks type as plugin API. This should be called in `class_init` of
    elements that expose new types (i.e. enums, flags or internal GObjects) via
    properties, signals or pad templates.
    
    Types exposed by plugins are not automatically added to the documentation
    as they might originate from another library and should in that case be
    documented via that library instead.
    
    By marking a type as plugin API it will be included in the documentation of
    the plugin that defines it.

    Params:
      type = a GType
      flags = a set of #GstPluginAPIFlags to further inform cache generation.
*/
void typeMarkAsPluginApi(gobject.types.GType type, gst.types.PluginAPIFlags flags)
{
  gst_type_mark_as_plugin_api(type, flags);
}

/**
    Forces GStreamer to re-scan its plugin paths and update the default
    plugin registry.
    
    Applications will almost never need to call this function, it is only
    useful if the application knows new plugins have been installed (or old
    ones removed) since the start of the application (or, to be precise, the
    first call to [gst.global.init_]) and the application wants to make use of any
    newly-installed plugins without restarting the application.
    
    Applications should assume that the registry update is neither atomic nor
    thread-safe and should therefore not have any dynamic pipelines running
    (including the playbin and decodebin elements) and should also not create
    any elements or access the GStreamer registry while the update is in
    progress.
    
    Note that this function may block for a significant amount of time.
    Returns: true if the registry has been updated successfully (does not
               imply that there were changes), otherwise false.
*/
bool updateRegistry()
{
  bool _retval;
  _retval = cast(bool)gst_update_registry();
  return _retval;
}

/**
    Searches inside array for search_data by using the comparison function
    search_func. array must be sorted ascending.
    
    As search_data is always passed as second argument to search_func it's
    not required that search_data has the same type as the array elements.
    
    The complexity of this search function is O(log (num_elements)).

    Params:
      array = the sorted input array
      numElements = number of elements in the array
      elementSize = size of every element in bytes
      searchFunc = function to compare two elements, search_data will always be passed as second argument
      mode = search mode that should be used
      searchData = element that should be found
    Returns: The address of the found
      element or null if nothing was found
*/
void* utilArrayBinarySearch(void* array, uint numElements, size_t elementSize, glib.types.CompareDataFunc searchFunc, gst.types.SearchMode mode, const(void)* searchData = null)
{
  extern(C) int _searchFuncCallback(const(void)* a, const(void)* b, void* userData)
  {
    auto _dlg = cast(glib.types.CompareDataFunc*)userData;

    int _retval = (*_dlg)(a, b);
    return _retval;
  }
  auto _searchFuncCB = searchFunc ? &_searchFuncCallback : null;
  auto _searchFunc = searchFunc ? cast(void*)&(searchFunc) : null;
  auto _retval = gst_util_array_binary_search(array, numElements, elementSize, _searchFuncCB, mode, searchData, _searchFunc);
  return _retval;
}

/**
    Return a max num of log2.

    Params:
      v = a #guint32 value.
    Returns: a computed #guint val.
*/
uint utilCeilLog2(uint v)
{
  uint _retval;
  _retval = gst_util_ceil_log2(v);
  return _retval;
}

/**
    Transforms a #gdouble to a fraction and simplifies
    the result.

    Params:
      src = #gdouble to transform
      destN = pointer to a #gint to hold the result numerator
      destD = pointer to a #gint to hold the result denominator
*/
void utilDoubleToFraction(double src, out int destN, out int destD)
{
  gst_util_double_to_fraction(src, cast(int*)&destN, cast(int*)&destD);
}

/**
    Dumps the buffer memory into a hex representation. Useful for debugging.

    Params:
      buf = a #GstBuffer whose memory to dump
*/
void utilDumpBuffer(gst.buffer.Buffer buf)
{
  gst_util_dump_buffer(buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
}

/**
    Dumps the memory block into a hex representation. Useful for debugging.

    Params:
      mem = a pointer to the memory to dump
*/
void utilDumpMem(ubyte[] mem)
{
  uint _size;
  if (mem)
    _size = cast(uint)mem.length;

  auto _mem = cast(const(ubyte)*)mem.ptr;
  gst_util_dump_mem(_mem, _size);
}

/**
    Compares the given filenames using natural ordering.

    Params:
      a = a filename to compare with `b`
      b = a filename to compare with `a`
    Returns: 
*/
int utilFilenameCompare(string a, string b)
{
  int _retval;
  const(char)* _a = a.toCString(No.Alloc);
  const(char)* _b = b.toCString(No.Alloc);
  _retval = gst_util_filename_compare(_a, _b);
  return _retval;
}

/**
    Adds the fractions a_n/a_d and b_n/b_d and stores
    the result in res_n and res_d.

    Params:
      aN = Numerator of first value
      aD = Denominator of first value
      bN = Numerator of second value
      bD = Denominator of second value
      resN = Pointer to #gint to hold the result numerator
      resD = Pointer to #gint to hold the result denominator
    Returns: false on overflow, true otherwise.
*/
bool utilFractionAdd(int aN, int aD, int bN, int bD, out int resN, out int resD)
{
  bool _retval;
  _retval = cast(bool)gst_util_fraction_add(aN, aD, bN, bD, cast(int*)&resN, cast(int*)&resD);
  return _retval;
}

/**
    Compares the fractions a_n/a_d and b_n/b_d and returns
    -1 if a < b, 0 if a = b and 1 if a > b.

    Params:
      aN = Numerator of first value
      aD = Denominator of first value
      bN = Numerator of second value
      bD = Denominator of second value
    Returns: -1 if a < b; 0 if a = b; 1 if a > b.
*/
int utilFractionCompare(int aN, int aD, int bN, int bD)
{
  int _retval;
  _retval = gst_util_fraction_compare(aN, aD, bN, bD);
  return _retval;
}

/**
    Multiplies the fractions a_n/a_d and b_n/b_d and stores
    the result in res_n and res_d.

    Params:
      aN = Numerator of first value
      aD = Denominator of first value
      bN = Numerator of second value
      bD = Denominator of second value
      resN = Pointer to #gint to hold the result numerator
      resD = Pointer to #gint to hold the result denominator
    Returns: false on overflow, true otherwise.
*/
bool utilFractionMultiply(int aN, int aD, int bN, int bD, out int resN, out int resD)
{
  bool _retval;
  _retval = cast(bool)gst_util_fraction_multiply(aN, aD, bN, bD, cast(int*)&resN, cast(int*)&resD);
  return _retval;
}

/**
    Transforms a fraction to a #gdouble.

    Params:
      srcN = Fraction numerator as #gint
      srcD = Fraction denominator #gint
      dest = pointer to a #gdouble for the result
*/
void utilFractionToDouble(int srcN, int srcD, out double dest)
{
  gst_util_fraction_to_double(srcN, srcD, cast(double*)&dest);
}

/** */
ulong utilGdoubleToGuint64(double value)
{
  ulong _retval;
  _retval = gst_util_gdouble_to_guint64(value);
  return _retval;
}

/**
    Get a property of type `GST_TYPE_ARRAY` and transform it into a
    #GValueArray. This allow language bindings to get GST_TYPE_ARRAY
    properties which are otherwise not an accessible type.

    Params:
      object = the object to set the array to
      name = the name of the property to set
      array = a return #GValueArray
    Returns: 
*/
bool utilGetObjectArray(gobject.object.ObjectWrap object, string name, out gobject.value_array.ValueArray array)
{
  bool _retval;
  const(char)* _name = name.toCString(No.Alloc);
  GValueArray* _array;
  _retval = cast(bool)gst_util_get_object_array(object ? cast(GObject*)object._cPtr(No.Dup) : null, _name, &_array);
  array = new gobject.value_array.ValueArray(cast(void*)_array, Yes.Take);
  return _retval;
}

/**
    Get a timestamp as GstClockTime to be used for interval measurements.
    The timestamp should not be interpreted in any other way.
    Returns: the timestamp
*/
gst.types.ClockTime utilGetTimestamp()
{
  gst.types.ClockTime _retval;
  _retval = gst_util_get_timestamp();
  return _retval;
}

/**
    Calculates the greatest common divisor of `a`
    and `b`.

    Params:
      a = First value as #gint
      b = Second value as #gint
    Returns: Greatest common divisor of `a` and `b`
*/
int utilGreatestCommonDivisor(int a, int b)
{
  int _retval;
  _retval = gst_util_greatest_common_divisor(a, b);
  return _retval;
}

/**
    Calculates the greatest common divisor of `a`
    and `b`.

    Params:
      a = First value as #gint64
      b = Second value as #gint64
    Returns: Greatest common divisor of `a` and `b`
*/
long utilGreatestCommonDivisorInt64(long a, long b)
{
  long _retval;
  _retval = gst_util_greatest_common_divisor_int64(a, b);
  return _retval;
}

/**
    Return a constantly incrementing group id.
    
    This function is used to generate a new group-id for the
    stream-start event.
    
    This function never returns `GST_GROUP_ID_INVALID` (which is 0)
    Returns: A constantly incrementing unsigned integer, which might
      overflow back to 0 at some point.
*/
uint utilGroupIdNext()
{
  uint _retval;
  _retval = gst_util_group_id_next();
  return _retval;
}

/** */
double utilGuint64ToGdouble(ulong value)
{
  double _retval;
  _retval = gst_util_guint64_to_gdouble(value);
  return _retval;
}

/**
    Compare two sequence numbers, handling wraparound.
    
    The current implementation just returns (gint32)(s1 - s2).

    Params:
      s1 = A sequence number.
      s2 = Another sequence number.
    Returns: A negative number if s1 is before s2, 0 if they are equal, or a
      positive number if s1 is after s2.
*/
int utilSeqnumCompare(uint s1, uint s2)
{
  int _retval;
  _retval = gst_util_seqnum_compare(s1, s2);
  return _retval;
}

/**
    Return a constantly incrementing sequence number.
    
    This function is used internally to GStreamer to be able to determine which
    events and messages are "the same". For example, elements may set the seqnum
    on a segment-done message to be the same as that of the last seek event, to
    indicate that event and the message correspond to the same segment.
    
    This function never returns `GST_SEQNUM_INVALID` (which is 0).
    Returns: A constantly incrementing 32-bit unsigned integer, which might
      overflow at some point. Use [gst.global.utilSeqnumCompare] to make sure
      you handle wraparound correctly.
*/
uint utilSeqnumNext()
{
  uint _retval;
  _retval = gst_util_seqnum_next();
  return _retval;
}

/**
    Converts the string value to the type of the objects argument and
    sets the argument with it.
    
    Note that this function silently returns if object has no property named
    name or when value cannot be converted to the type of the property.

    Params:
      object = the object to set the argument of
      name = the name of the argument to set
      value = the string value to set
*/
void utilSetObjectArg(gobject.object.ObjectWrap object, string name, string value)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  gst_util_set_object_arg(object ? cast(GObject*)object._cPtr(No.Dup) : null, _name, _value);
}

/**
    Transfer a #GValueArray to `GST_TYPE_ARRAY` and set this value on the
    specified property name. This allow language bindings to set GST_TYPE_ARRAY
    properties which are otherwise not an accessible type.

    Params:
      object = the object to set the array to
      name = the name of the property to set
      array = a #GValueArray containing the values
    Returns: 
*/
bool utilSetObjectArray(gobject.object.ObjectWrap object, string name, gobject.value_array.ValueArray array)
{
  bool _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = cast(bool)gst_util_set_object_array(object ? cast(GObject*)object._cPtr(No.Dup) : null, _name, array ? cast(const(GValueArray)*)array._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Converts the string to the type of the value and
    sets the value with it.
    
    Note that this function is dangerous as it does not return any indication
    if the conversion worked or not.

    Params:
      value = the value to set
      valueStr = the string to get the value from
*/
void utilSetValueFromString(out gobject.value.Value value, string valueStr)
{
  GValue _value;
  const(char)* _valueStr = valueStr.toCString(No.Alloc);
  gst_util_set_value_from_string(&_value, _valueStr);
  value = new gobject.value.Value(cast(void*)&_value, No.Take);
}

/**
    Calculates the simpler representation of numerator and denominator and
    update both values with the resulting simplified fraction.
    
    Simplify a fraction using a simple continued fraction decomposition.
    The idea here is to convert fractions such as 333333/10000000 to 1/30
    using 32 bit arithmetic only. The algorithm is not perfect and relies
    upon two arbitrary parameters to remove non-significative terms from
    the simple continued fraction decomposition. Using 8 and 333 for
    n_terms and threshold respectively seems to give nice results.

    Params:
      numerator = First value as #gint
      denominator = Second value as #gint
      nTerms = non-significative terms (typical value: 8)
      threshold = threshold (typical value: 333)
*/
void utilSimplifyFraction(ref int numerator, ref int denominator, uint nTerms, uint threshold)
{
  gst_util_simplify_fraction(cast(int*)&numerator, cast(int*)&denominator, nTerms, threshold);
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.
    
    This function can potentially be very slow if val and num are both
    greater than G_MAXUINT32.

    Params:
      val = the number to scale
      num = the numerator of the scale ratio
      denom = the denominator of the scale ratio
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer it is truncated.  See also
      [gst.global.utilUint64ScaleRound], [gst.global.utilUint64ScaleCeil],
      [gst.global.utilUint64ScaleInt], [gst.global.utilUint64ScaleIntRound],
      [gst.global.utilUint64ScaleIntCeil].
*/
ulong utilUint64Scale(ulong val, ulong num, ulong denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale(val, num, denom);
  return _retval;
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.
    
    This function can potentially be very slow if val and num are both
    greater than G_MAXUINT32.

    Params:
      val = the number to scale
      num = the numerator of the scale ratio
      denom = the denominator of the scale ratio
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer, it is rounded up.  See also
      [gst.global.utilUint64Scale], [gst.global.utilUint64ScaleRound],
      [gst.global.utilUint64ScaleInt], [gst.global.utilUint64ScaleIntRound],
      [gst.global.utilUint64ScaleIntCeil].
*/
ulong utilUint64ScaleCeil(ulong val, ulong num, ulong denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale_ceil(val, num, denom);
  return _retval;
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.  num must be non-negative and
    denom must be positive.

    Params:
      val = guint64 (such as a #GstClockTime) to scale.
      num = numerator of the scale factor.
      denom = denominator of the scale factor.
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer, it is truncated.  See also
      [gst.global.utilUint64ScaleIntRound], [gst.global.utilUint64ScaleIntCeil],
      [gst.global.utilUint64Scale], [gst.global.utilUint64ScaleRound],
      [gst.global.utilUint64ScaleCeil].
*/
ulong utilUint64ScaleInt(ulong val, int num, int denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale_int(val, num, denom);
  return _retval;
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.  num must be non-negative and
    denom must be positive.

    Params:
      val = guint64 (such as a #GstClockTime) to scale.
      num = numerator of the scale factor.
      denom = denominator of the scale factor.
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer, it is rounded up.  See also
      [gst.global.utilUint64ScaleInt], [gst.global.utilUint64ScaleIntRound],
      [gst.global.utilUint64Scale], [gst.global.utilUint64ScaleRound],
      [gst.global.utilUint64ScaleCeil].
*/
ulong utilUint64ScaleIntCeil(ulong val, int num, int denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale_int_ceil(val, num, denom);
  return _retval;
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.  num must be non-negative and
    denom must be positive.

    Params:
      val = guint64 (such as a #GstClockTime) to scale.
      num = numerator of the scale factor.
      denom = denominator of the scale factor.
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer, it is rounded to the nearest integer
      (half-way cases are rounded up).  See also [gst.global.utilUint64ScaleInt],
      [gst.global.utilUint64ScaleIntCeil], [gst.global.utilUint64Scale],
      [gst.global.utilUint64ScaleRound], [gst.global.utilUint64ScaleCeil].
*/
ulong utilUint64ScaleIntRound(ulong val, int num, int denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale_int_round(val, num, denom);
  return _retval;
}

/**
    Scale val by the rational number num / denom, avoiding overflows and
    underflows and without loss of precision.
    
    This function can potentially be very slow if val and num are both
    greater than G_MAXUINT32.

    Params:
      val = the number to scale
      num = the numerator of the scale ratio
      denom = the denominator of the scale ratio
    Returns: val * num / denom.  In the case of an overflow, this
      function returns G_MAXUINT64.  If the result is not exactly
      representable as an integer, it is rounded to the nearest integer
      (half-way cases are rounded up).  See also [gst.global.utilUint64Scale],
      [gst.global.utilUint64ScaleCeil], [gst.global.utilUint64ScaleInt],
      [gst.global.utilUint64ScaleIntRound], [gst.global.utilUint64ScaleIntCeil].
*/
ulong utilUint64ScaleRound(ulong val, ulong num, ulong denom)
{
  ulong _retval;
  _retval = gst_util_uint64_scale_round(val, num, denom);
  return _retval;
}

/**
    Determines if value1 and value2 can be compared.

    Params:
      value1 = a value to compare
      value2 = another value to compare
    Returns: true if the values can be compared
*/
bool valueCanCompare(gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  _retval = cast(bool)gst_value_can_compare(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Determines if intersecting two values will produce a valid result.
    Two values will produce a valid intersection if they have the same
    type.

    Params:
      value1 = a value to intersect
      value2 = another value to intersect
    Returns: true if the values can intersect
*/
bool valueCanIntersect(gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  _retval = cast(bool)gst_value_can_intersect(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if it's possible to subtract subtrahend from minuend.

    Params:
      minuend = the value to subtract from
      subtrahend = the value to subtract
    Returns: true if a subtraction is possible
*/
bool valueCanSubtract(gobject.value.Value minuend, gobject.value.Value subtrahend)
{
  bool _retval;
  _retval = cast(bool)gst_value_can_subtract(minuend ? cast(const(GValue)*)minuend._cPtr(No.Dup) : null, subtrahend ? cast(const(GValue)*)subtrahend._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Determines if value1 and value2 can be non-trivially unioned.
    Any two values can be trivially unioned by adding both of them
    to a GstValueList.  However, certain types have the possibility
    to be unioned in a simpler way.  For example, an integer range
    and an integer can be unioned if the integer is a subset of the
    integer range.  If there is the possibility that two values can
    be unioned, this function returns true.

    Params:
      value1 = a value to union
      value2 = another value to union
    Returns: true if there is a function allowing the two values to
      be unioned.
*/
bool valueCanUnion(gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  _retval = cast(bool)gst_value_can_union(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Compares value1 and value2.  If value1 and value2 cannot be
    compared, the function returns GST_VALUE_UNORDERED.  Otherwise,
    if value1 is greater than value2, GST_VALUE_GREATER_THAN is returned.
    If value1 is less than value2, GST_VALUE_LESS_THAN is returned.
    If the values are equal, GST_VALUE_EQUAL is returned.

    Params:
      value1 = a value to compare
      value2 = another value to compare
    Returns: comparison result
*/
int valueCompare(gobject.value.Value value1, gobject.value.Value value2)
{
  int _retval;
  _retval = gst_value_compare(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tries to deserialize a string into the type specified by the given GValue.
    If the operation succeeds, true is returned, false otherwise.

    Params:
      dest = #GValue to fill with contents of
            deserialization
      src = string to deserialize
    Returns: true on success
*/
bool valueDeserialize(out gobject.value.Value dest, string src)
{
  bool _retval;
  GValue _dest;
  const(char)* _src = src.toCString(No.Alloc);
  _retval = cast(bool)gst_value_deserialize(&_dest, _src);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
  return _retval;
}

/**
    Tries to deserialize a string into the type specified by the given GValue.
    pspec may be used to guide the deserializing of nested members.
    If the operation succeeds, true is returned, false otherwise.

    Params:
      dest = #GValue to fill with contents of
            deserialization
      src = string to deserialize
      pspec = the #GParamSpec describing the expected value
    Returns: true on success
*/
bool valueDeserializeWithPspec(out gobject.value.Value dest, string src, gobject.param_spec.ParamSpec pspec = null)
{
  bool _retval;
  GValue _dest;
  const(char)* _src = src.toCString(No.Alloc);
  _retval = cast(bool)gst_value_deserialize_with_pspec(&_dest, _src, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
  return _retval;
}

/**
    Fixate src into a new value dest.
    For ranges, the first element is taken. For lists and arrays, the
    first item is fixated and returned.
    If src is already fixed, this function returns false.

    Params:
      dest = the #GValue destination
      src = the #GValue to fixate
    Returns: true if dest contains a fixated version of src.
*/
bool valueFixate(gobject.value.Value dest, gobject.value.Value src)
{
  bool _retval;
  _retval = cast(bool)gst_value_fixate(dest ? cast(GValue*)dest._cPtr(No.Dup) : null, src ? cast(const(GValue)*)src._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Multiplies the two #GValue items containing a #GST_TYPE_FRACTION and sets
    product to the product of the two fractions.

    Params:
      product = a GValue initialized to #GST_TYPE_FRACTION
      factor1 = a GValue initialized to #GST_TYPE_FRACTION
      factor2 = a GValue initialized to #GST_TYPE_FRACTION
    Returns: false in case of an error (like integer overflow), true otherwise.
*/
bool valueFractionMultiply(gobject.value.Value product, gobject.value.Value factor1, gobject.value.Value factor2)
{
  bool _retval;
  _retval = cast(bool)gst_value_fraction_multiply(product ? cast(GValue*)product._cPtr(No.Dup) : null, factor1 ? cast(const(GValue)*)factor1._cPtr(No.Dup) : null, factor2 ? cast(const(GValue)*)factor2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Subtracts the subtrahend from the minuend and sets dest to the result.

    Params:
      dest = a GValue initialized to #GST_TYPE_FRACTION
      minuend = a GValue initialized to #GST_TYPE_FRACTION
      subtrahend = a GValue initialized to #GST_TYPE_FRACTION
    Returns: false in case of an error (like integer overflow), true otherwise.
*/
bool valueFractionSubtract(gobject.value.Value dest, gobject.value.Value minuend, gobject.value.Value subtrahend)
{
  bool _retval;
  _retval = cast(bool)gst_value_fraction_subtract(dest ? cast(GValue*)dest._cPtr(No.Dup) : null, minuend ? cast(const(GValue)*)minuend._cPtr(No.Dup) : null, subtrahend ? cast(const(GValue)*)subtrahend._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the bitmask specified by value.

    Params:
      value = a GValue initialized to #GST_TYPE_BITMASK
    Returns: the bitmask.
*/
ulong valueGetBitmask(gobject.value.Value value)
{
  ulong _retval;
  _retval = gst_value_get_bitmask(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the contents of value. The reference count of the returned
    #GstCaps will not be modified, therefore the caller must take one
    before getting rid of the value.

    Params:
      value = a GValue initialized to GST_TYPE_CAPS
    Returns: the contents of value
*/
gst.caps.Caps valueGetCaps(gobject.value.Value value)
{
  const(GstCaps)* _cretval;
  _cretval = gst_value_get_caps(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Gets the contents of value.

    Params:
      value = a GValue initialized to GST_TYPE_CAPS_FEATURES
    Returns: the contents of value
*/
gst.caps_features.CapsFeatures valueGetCapsFeatures(gobject.value.Value value)
{
  const(GstCapsFeatures)* _cretval;
  _cretval = gst_value_get_caps_features(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.caps_features.CapsFeatures(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Gets the maximum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_DOUBLE_RANGE
    Returns: the maximum of the range
*/
double valueGetDoubleRangeMax(gobject.value.Value value)
{
  double _retval;
  _retval = gst_value_get_double_range_max(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the minimum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_DOUBLE_RANGE
    Returns: the minimum of the range
*/
double valueGetDoubleRangeMin(gobject.value.Value value)
{
  double _retval;
  _retval = gst_value_get_double_range_min(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Retrieve the flags field of a GstFlagSet value.

    Params:
      value = a GValue initialized to #GST_TYPE_FLAG_SET
    Returns: the flags field of the flagset instance.
*/
uint valueGetFlagsetFlags(gobject.value.Value value)
{
  uint _retval;
  _retval = gst_value_get_flagset_flags(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Retrieve the mask field of a GstFlagSet value.

    Params:
      value = a GValue initialized to #GST_TYPE_FLAG_SET
    Returns: the mask field of the flagset instance.
*/
uint valueGetFlagsetMask(gobject.value.Value value)
{
  uint _retval;
  _retval = gst_value_get_flagset_mask(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the denominator of the fraction specified by value.

    Params:
      value = a GValue initialized to #GST_TYPE_FRACTION
    Returns: the denominator of the fraction.
*/
int valueGetFractionDenominator(gobject.value.Value value)
{
  int _retval;
  _retval = gst_value_get_fraction_denominator(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the numerator of the fraction specified by value.

    Params:
      value = a GValue initialized to #GST_TYPE_FRACTION
    Returns: the numerator of the fraction.
*/
int valueGetFractionNumerator(gobject.value.Value value)
{
  int _retval;
  _retval = gst_value_get_fraction_numerator(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the maximum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_FRACTION_RANGE
    Returns: the maximum of the range
*/
gobject.value.Value valueGetFractionRangeMax(gobject.value.Value value)
{
  const(GValue)* _cretval;
  _cretval = gst_value_get_fraction_range_max(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Gets the minimum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_FRACTION_RANGE
    Returns: the minimum of the range
*/
gobject.value.Value valueGetFractionRangeMin(gobject.value.Value value)
{
  const(GValue)* _cretval;
  _cretval = gst_value_get_fraction_range_min(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Gets the maximum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT64_RANGE
    Returns: the maximum of the range
*/
long valueGetInt64RangeMax(gobject.value.Value value)
{
  long _retval;
  _retval = gst_value_get_int64_range_max(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the minimum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT64_RANGE
    Returns: the minimum of the range
*/
long valueGetInt64RangeMin(gobject.value.Value value)
{
  long _retval;
  _retval = gst_value_get_int64_range_min(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the step of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT64_RANGE
    Returns: the step of the range
*/
long valueGetInt64RangeStep(gobject.value.Value value)
{
  long _retval;
  _retval = gst_value_get_int64_range_step(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the maximum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT_RANGE
    Returns: the maximum of the range
*/
int valueGetIntRangeMax(gobject.value.Value value)
{
  int _retval;
  _retval = gst_value_get_int_range_max(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the minimum of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT_RANGE
    Returns: the minimum of the range
*/
int valueGetIntRangeMin(gobject.value.Value value)
{
  int _retval;
  _retval = gst_value_get_int_range_min(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the step of the range specified by value.

    Params:
      value = a GValue initialized to GST_TYPE_INT_RANGE
    Returns: the step of the range
*/
int valueGetIntRangeStep(gobject.value.Value value)
{
  int _retval;
  _retval = gst_value_get_int_range_step(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the contents of value.

    Params:
      value = a GValue initialized to GST_TYPE_STRUCTURE
    Returns: the contents of value
*/
gst.structure.Structure valueGetStructure(gobject.value.Value value)
{
  const(GstStructure)* _cretval;
  _cretval = gst_value_get_structure(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Initialises the target value to be of the same type as source and then copies
    the contents from source to target.

    Params:
      dest = the target value
      src = the source value
*/
void valueInitAndCopy(out gobject.value.Value dest, gobject.value.Value src)
{
  GValue _dest;
  gst_value_init_and_copy(&_dest, src ? cast(const(GValue)*)src._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
}

/**
    Calculates the intersection of two values.  If the values have
    a non-empty intersection, the value representing the intersection
    is placed in dest, unless null.  If the intersection is non-empty,
    dest is not modified.

    Params:
      dest = a uninitialized #GValue that will hold the calculated
          intersection value. May be null if the resulting set if not
          needed.
      value1 = a value to intersect
      value2 = another value to intersect
    Returns: true if the intersection is non-empty
*/
bool valueIntersect(out gobject.value.Value dest, gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  GValue _dest;
  _retval = cast(bool)gst_value_intersect(&_dest, value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, Yes.Take);
  return _retval;
}

/**
    Tests if the given GValue, if available in a GstStructure (or any other
    container) contains a "fixed" (which means: one value) or an "unfixed"
    (which means: multiple possible values, such as data lists or data
    ranges) value.

    Params:
      value = the #GValue to check
    Returns: true if the value is "fixed".
*/
bool valueIsFixed(gobject.value.Value value)
{
  bool _retval;
  _retval = cast(bool)gst_value_is_fixed(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Check that value1 is a subset of value2.

    Params:
      value1 = a #GValue
      value2 = a #GValue
    Returns: true is value1 is a subset of value2
*/
bool valueIsSubset(gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  _retval = cast(bool)gst_value_is_subset(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Registers functions to perform calculations on #GValue items of a given
    type. Each type can only be added once.

    Params:
      table = structure containing functions to register
*/
void valueRegister(gst.types.ValueTable table)
{
  gst_value_register(&table);
}

/**
    tries to transform the given value into a string representation that allows
    getting back this string later on using [gst.global.valueDeserialize].
    
    Free-function: g_free

    Params:
      value = a #GValue to serialize
    Returns: the serialization for value
      or null if none exists
*/
string valueSerialize(gobject.value.Value value)
{
  char* _cretval;
  _cretval = gst_value_serialize(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Sets value to the bitmask specified by bitmask.

    Params:
      value = a GValue initialized to #GST_TYPE_BITMASK
      bitmask = the bitmask
*/
void valueSetBitmask(gobject.value.Value value, ulong bitmask)
{
  gst_value_set_bitmask(value ? cast(GValue*)value._cPtr(No.Dup) : null, bitmask);
}

/**
    Sets the contents of value to caps. A reference to the
    provided caps will be taken by the value.

    Params:
      value = a GValue initialized to GST_TYPE_CAPS
      caps = the caps to set the value to
*/
void valueSetCaps(gobject.value.Value value, gst.caps.Caps caps)
{
  gst_value_set_caps(value ? cast(GValue*)value._cPtr(No.Dup) : null, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
}

/**
    Sets the contents of value to features.

    Params:
      value = a GValue initialized to GST_TYPE_CAPS_FEATURES
      features = the features to set the value to
*/
void valueSetCapsFeatures(gobject.value.Value value, gst.caps_features.CapsFeatures features)
{
  gst_value_set_caps_features(value ? cast(GValue*)value._cPtr(No.Dup) : null, features ? cast(const(GstCapsFeatures)*)features._cPtr(No.Dup) : null);
}

/**
    Sets value to the range specified by start and end.

    Params:
      value = a GValue initialized to GST_TYPE_DOUBLE_RANGE
      start = the start of the range
      end = the end of the range
*/
void valueSetDoubleRange(gobject.value.Value value, double start, double end)
{
  gst_value_set_double_range(value ? cast(GValue*)value._cPtr(No.Dup) : null, start, end);
}

/**
    Sets value to the flags and mask values provided in flags and mask.
    The flags value indicates the values of flags, the mask represents
    which bits in the flag value have been set, and which are "don't care"

    Params:
      value = a GValue initialized to `GST_TYPE_FLAG_SET`
      flags = The value of the flags set or unset
      mask = The mask indicate which flags bits must match for comparisons
*/
void valueSetFlagset(gobject.value.Value value, uint flags, uint mask)
{
  gst_value_set_flagset(value ? cast(GValue*)value._cPtr(No.Dup) : null, flags, mask);
}

/**
    Sets value to the fraction specified by numerator over denominator.
    The fraction gets reduced to the smallest numerator and denominator,
    and if necessary the sign is moved to the numerator.

    Params:
      value = a GValue initialized to #GST_TYPE_FRACTION
      numerator = the numerator of the fraction
      denominator = the denominator of the fraction
*/
void valueSetFraction(gobject.value.Value value, int numerator, int denominator)
{
  gst_value_set_fraction(value ? cast(GValue*)value._cPtr(No.Dup) : null, numerator, denominator);
}

/**
    Sets value to the range specified by start and end.

    Params:
      value = a GValue initialized to GST_TYPE_FRACTION_RANGE
      start = the start of the range (a GST_TYPE_FRACTION GValue)
      end = the end of the range (a GST_TYPE_FRACTION GValue)
*/
void valueSetFractionRange(gobject.value.Value value, gobject.value.Value start, gobject.value.Value end)
{
  gst_value_set_fraction_range(value ? cast(GValue*)value._cPtr(No.Dup) : null, start ? cast(const(GValue)*)start._cPtr(No.Dup) : null, end ? cast(const(GValue)*)end._cPtr(No.Dup) : null);
}

/**
    Sets value to the range specified by numerator_start/denominator_start
    and numerator_end/denominator_end.

    Params:
      value = a GValue initialized to GST_TYPE_FRACTION_RANGE
      numeratorStart = the numerator start of the range
      denominatorStart = the denominator start of the range
      numeratorEnd = the numerator end of the range
      denominatorEnd = the denominator end of the range
*/
void valueSetFractionRangeFull(gobject.value.Value value, int numeratorStart, int denominatorStart, int numeratorEnd, int denominatorEnd)
{
  gst_value_set_fraction_range_full(value ? cast(GValue*)value._cPtr(No.Dup) : null, numeratorStart, denominatorStart, numeratorEnd, denominatorEnd);
}

/**
    Sets value to the range specified by start and end.

    Params:
      value = a GValue initialized to GST_TYPE_INT64_RANGE
      start = the start of the range
      end = the end of the range
*/
void valueSetInt64Range(gobject.value.Value value, long start, long end)
{
  gst_value_set_int64_range(value ? cast(GValue*)value._cPtr(No.Dup) : null, start, end);
}

/**
    Sets value to the range specified by start, end and step.

    Params:
      value = a GValue initialized to GST_TYPE_INT64_RANGE
      start = the start of the range
      end = the end of the range
      step = the step of the range
*/
void valueSetInt64RangeStep(gobject.value.Value value, long start, long end, long step)
{
  gst_value_set_int64_range_step(value ? cast(GValue*)value._cPtr(No.Dup) : null, start, end, step);
}

/**
    Sets value to the range specified by start and end.

    Params:
      value = a GValue initialized to GST_TYPE_INT_RANGE
      start = the start of the range
      end = the end of the range
*/
void valueSetIntRange(gobject.value.Value value, int start, int end)
{
  gst_value_set_int_range(value ? cast(GValue*)value._cPtr(No.Dup) : null, start, end);
}

/**
    Sets value to the range specified by start, end and step.

    Params:
      value = a GValue initialized to GST_TYPE_INT_RANGE
      start = the start of the range
      end = the end of the range
      step = the step of the range
*/
void valueSetIntRangeStep(gobject.value.Value value, int start, int end, int step)
{
  gst_value_set_int_range_step(value ? cast(GValue*)value._cPtr(No.Dup) : null, start, end, step);
}

/**
    Sets the contents of value to structure.

    Params:
      value = a GValue initialized to GST_TYPE_STRUCTURE
      structure = the structure to set the value to
*/
void valueSetStructure(gobject.value.Value value, gst.structure.Structure structure)
{
  gst_value_set_structure(value ? cast(GValue*)value._cPtr(No.Dup) : null, structure ? cast(const(GstStructure)*)structure._cPtr(No.Dup) : null);
}

/**
    Subtracts subtrahend from minuend and stores the result in dest.
    Note that this means subtraction as in sets, not as in mathematics.

    Params:
      dest = the destination value
            for the result if the subtraction is not empty. May be null,
            in which case the resulting set will not be computed, which can
            give a fair speedup.
      minuend = the value to subtract from
      subtrahend = the value to subtract
    Returns: true if the subtraction is not empty
*/
bool valueSubtract(out gobject.value.Value dest, gobject.value.Value minuend, gobject.value.Value subtrahend)
{
  bool _retval;
  GValue _dest;
  _retval = cast(bool)gst_value_subtract(&_dest, minuend ? cast(const(GValue)*)minuend._cPtr(No.Dup) : null, subtrahend ? cast(const(GValue)*)subtrahend._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
  return _retval;
}

/**
    Creates a GValue corresponding to the union of value1 and value2.

    Params:
      dest = the destination value
      value1 = a value to union
      value2 = another value to union
    Returns: true if the union succeeded.
*/
bool valueUnion(out gobject.value.Value dest, gobject.value.Value value1, gobject.value.Value value2)
{
  bool _retval;
  GValue _dest;
  _retval = cast(bool)gst_value_union(&_dest, value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  dest = new gobject.value.Value(cast(void*)&_dest, No.Take);
  return _retval;
}

/**
    Gets the version number of the GStreamer library.

    Params:
      major = pointer to a guint to store the major version number
      minor = pointer to a guint to store the minor version number
      micro = pointer to a guint to store the micro version number
      nano = pointer to a guint to store the nano version number
*/
void version_(out uint major, out uint minor, out uint micro, out uint nano)
{
  gst_version(cast(uint*)&major, cast(uint*)&minor, cast(uint*)&micro, cast(uint*)&nano);
}

/**
    This function returns a string that is useful for describing this version
    of GStreamer to the outside world: user agent strings, logging, ...
    Returns: a newly allocated string describing this version
          of GStreamer.
*/
string versionString()
{
  char* _cretval;
  _cretval = gst_version_string();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
