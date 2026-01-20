/// Module for [MemoryPressureSettings] class
module webkit.memory_pressure_settings;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    A boxed type representing the settings for the memory pressure handler
    
    #WebKitMemoryPressureSettings is a boxed type that can be used to provide some custom settings
    to control how the memory pressure situations are handled by the different processes.
    
    The memory pressure system implemented inside the different process will try to keep the memory usage
    under the defined memory limit. In order to do that, it will check the used memory with a user defined
    frequency and decide whether it should try to release memory. The thresholds passed will define how urgent
    is to release that memory.
    
    Take into account that badly defined parameters can greatly reduce the performance of the engine. For
    example, setting memory limit too low with a fast poll interval can cause the process to constantly
    be trying to release memory.
    
    A #WebKitMemoryPressureSettings can be passed to a #WebKitWebContext constructor, and the settings will
    be applied to all the web processes created by that context.
    
    A #WebKitMemoryPressureSettings can be passed to webkit_website_data_manager_set_memory_pressure_settings(),
    and the settings will be applied to all the network processes created after that call by any instance of
    #WebKitWebsiteDataManager.
*/
class MemoryPressureSettings : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_memory_pressure_settings_get_type != &gidSymbolNotFound ? webkit_memory_pressure_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryPressureSettings self()
  {
    return this;
  }

  /**
      Create a new #WebKitMemoryPressureSettings with the default values.
      Returns: A new #WebKitMemoryPressureSettings instance filled with the default values.
  */
  this()
  {
    WebKitMemoryPressureSettings* _cretval;
    _cretval = webkit_memory_pressure_settings_new();
    this(_cretval, Yes.Take);
  }

  /**
      Make a copy of settings.
      Returns: A copy of of the passed #WebKitMemoryPressureSettings.
  */
  webkit.memory_pressure_settings.MemoryPressureSettings copy()
  {
    WebKitMemoryPressureSettings* _cretval;
    _cretval = webkit_memory_pressure_settings_copy(cast(WebKitMemoryPressureSettings*)this._cPtr);
    auto _retval = _cretval ? new webkit.memory_pressure_settings.MemoryPressureSettings(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the conservative memory usage threshold.
      Returns: value in the `(0, 1)` range.
  */
  double getConservativeThreshold()
  {
    double _retval;
    _retval = webkit_memory_pressure_settings_get_conservative_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the kill memory usage threshold.
      Returns: positive value, can be zero.
  */
  double getKillThreshold()
  {
    double _retval;
    _retval = webkit_memory_pressure_settings_get_kill_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the memory usage limit.
      Returns: current value, in megabytes.
  */
  uint getMemoryLimit()
  {
    uint _retval;
    _retval = webkit_memory_pressure_settings_get_memory_limit(cast(WebKitMemoryPressureSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the interval at which memory usage is checked.
      Returns: current interval value, in seconds.
  */
  double getPollInterval()
  {
    double _retval;
    _retval = webkit_memory_pressure_settings_get_poll_interval(cast(WebKitMemoryPressureSettings*)this._cPtr);
    return _retval;
  }

  /**
      Gets the strict memory usage threshold.
      Returns: value in the `(0, 1)` range.
  */
  double getStrictThreshold()
  {
    double _retval;
    _retval = webkit_memory_pressure_settings_get_strict_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr);
    return _retval;
  }

  /**
      Sets the memory limit for the conservative policy to start working.
      
      Sets value as the fraction of the defined memory limit where the conservative
      policy starts working. This policy will try to reduce the memory footprint by
      releasing non critical memory.
      
      The threshold must be bigger than 0 and smaller than 1, and it must be smaller
      than the strict threshold defined in settings. The default value is 0.33.
  
      Params:
        value = fraction of the memory limit where the conservative policy starts working.
  */
  void setConservativeThreshold(double value)
  {
    webkit_memory_pressure_settings_set_conservative_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr, value);
  }

  /**
      Sets value as the fraction of the defined memory limit where the process will be
      killed.
      
      The threshold must be a value bigger or equal to 0. A value of 0 means that the process
      is never killed. If the threshold is not 0, then it must be bigger than the strict threshold
      defined in settings. The threshold can also have values bigger than 1. The default value is 0.
  
      Params:
        value = fraction of the memory limit where the process will be killed because
            of excessive memory usage.
  */
  void setKillThreshold(double value)
  {
    webkit_memory_pressure_settings_set_kill_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr, value);
  }

  /**
      Sets memory_limit the memory limit value to settings.
      
      The default value is the system's RAM size with a maximum of 3GB.
  
      Params:
        memoryLimit = amount of memory (in MB) that the process is allowed to use.
  */
  void setMemoryLimit(uint memoryLimit)
  {
    webkit_memory_pressure_settings_set_memory_limit(cast(WebKitMemoryPressureSettings*)this._cPtr, memoryLimit);
  }

  /**
      Sets value as the poll interval used by settings.
      
      The poll interval value must be bigger than 0. The default value is 30 seconds.
  
      Params:
        value = period (in seconds) between memory usage measurements.
  */
  void setPollInterval(double value)
  {
    webkit_memory_pressure_settings_set_poll_interval(cast(WebKitMemoryPressureSettings*)this._cPtr, value);
  }

  /**
      Sets the memory limit for the strict policy to start working.
      
      Sets value as the fraction of the defined memory limit where the strict
      policy starts working. This policy will try to reduce the memory footprint by
      releasing critical memory.
      
      The threshold must be bigger than 0 and smaller than 1. Also, it must be bigger
      than the conservative threshold defined in settings, and smaller than the kill
      threshold if the latter is not 0. The default value is 0.5.
  
      Params:
        value = fraction of the memory limit where the strict policy starts working.
  */
  void setStrictThreshold(double value)
  {
    webkit_memory_pressure_settings_set_strict_threshold(cast(WebKitMemoryPressureSettings*)this._cPtr, value);
  }
}
