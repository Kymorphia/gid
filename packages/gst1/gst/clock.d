/// Module for [Clock] class
module gst.clock;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    GStreamer uses a global clock to synchronize the plugins in a pipeline.
    Different clock implementations are possible by implementing this abstract
    base class or, more conveniently, by subclassing #GstSystemClock.
    
    The #GstClock returns a monotonically increasing time with the method
    [gst.clock.Clock.getTime]. Its accuracy and base time depend on the specific
    clock implementation but time is always expressed in nanoseconds. Since the
    baseline of the clock is undefined, the clock time returned is not
    meaningful in itself, what matters are the deltas between two clock times.
    The time returned by a clock is called the absolute time.
    
    The pipeline uses the clock to calculate the running time. Usually all
    renderers synchronize to the global clock using the buffer timestamps, the
    #GST_EVENT_SEGMENT events and the element's base time, see #GstPipeline.
    
    A clock implementation can support periodic and single shot clock
    notifications both synchronous and asynchronous.
    
    One first needs to create a #GstClockID for the periodic or single shot
    notification using [gst.clock.Clock.newSingleShotId] or
    [gst.clock.Clock.newPeriodicId].
    
    To perform a blocking wait for the specific time of the #GstClockID use
    [gst.clock.Clock.idWait]. To receive a callback when the specific time is reached
    in the clock use [gst.clock.Clock.idWaitAsync]. Both these calls can be
    interrupted with the [gst.clock.Clock.idUnschedule] call. If the blocking wait is
    unscheduled a return value of #GST_CLOCK_UNSCHEDULED is returned.
    
    Periodic callbacks scheduled async will be repeatedly called automatically
    until they are unscheduled. To schedule a sync periodic callback,
    [gst.clock.Clock.idWait] should be called repeatedly.
    
    The async callbacks can happen from any thread, either provided by the core
    or from a streaming thread. The application should be prepared for this.
    
    A #GstClockID that has been unscheduled cannot be used again for any wait
    operation, a new #GstClockID should be created and the old unscheduled one
    should be destroyed with [gst.clock.Clock.idUnref].
    
    It is possible to perform a blocking wait on the same #GstClockID from
    multiple threads. However, registering the same #GstClockID for multiple
    async notifications is not possible, the callback will only be called for
    the thread registering the entry last.
    
    None of the wait operations unref the #GstClockID, the owner is responsible
    for unreffing the ids itself. This holds for both periodic and single shot
    notifications. The reason being that the owner of the #GstClockID has to
    keep a handle to the #GstClockID to unblock the wait on FLUSHING events or
    state changes and if the entry would be unreffed automatically, the handle
    might become invalid without any notification.
    
    These clock operations do not operate on the running time, so the callbacks
    will also occur when not in PLAYING state as if the clock just keeps on
    running. Some clocks however do not progress when the element that provided
    the clock is not PLAYING.
    
    When a clock has the #GST_CLOCK_FLAG_CAN_SET_MASTER flag set, it can be
    slaved to another #GstClock with [gst.clock.Clock.setMaster]. The clock will
    then automatically be synchronized to this master clock by repeatedly
    sampling the master clock and the slave clock and recalibrating the slave
    clock with [gst.clock.Clock.setCalibration]. This feature is mostly useful for
    plugins that have an internal clock but must operate with another clock
    selected by the #GstPipeline.  They can track the offset and rate difference
    of their internal clock relative to the master clock by using the
    [gst.clock.Clock.getCalibration] function.
    
    The master/slave synchronisation can be tuned with the #GstClock:timeout,
    #GstClock:window-size and #GstClock:window-threshold properties.
    The #GstClock:timeout property defines the interval to sample the master
    clock and run the calibration functions. #GstClock:window-size defines the
    number of samples to use when calibrating and #GstClock:window-threshold
    defines the minimum number of samples before the calibration is performed.
*/
class Clock : gst.object.ObjectWrap
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
    return cast(void function())gst_clock_get_type != &gidSymbolNotFound ? gst_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Clock self()
  {
    return this;
  }

  /** */
  @property ulong timeout()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("timeout");
  }

  /** */
  @property void timeout(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("timeout", propval);
  }

  /** */
  @property int windowSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("window-size");
  }

  /** */
  @property void windowSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("window-size", propval);
  }

  /** */
  @property int windowThreshold()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("window-threshold");
  }

  /** */
  @property void windowThreshold(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("window-threshold", propval);
  }

  /**
      Compares the two #GstClockID instances. This function can be used
      as a GCompareFunc when sorting ids.
  
      Params:
        id1 = A #GstClockID
        id2 = A #GstClockID to compare with
      Returns: negative value if `a < b`; zero if `a = b`; positive value if `a > b`
  */
  static int idCompareFunc(const(void)* id1 = null, const(void)* id2 = null)
  {
    int _retval;
    _retval = gst_clock_id_compare_func(id1, id2);
    return _retval;
  }

  /**
      This function returns the underlying clock.
  
      Params:
        id = a #GstClockID
      Returns: a #GstClock or null when the
            underlying clock has been freed.
  */
  static gst.clock.Clock idGetClock(gst.types.ClockID id)
  {
    GstClock* _cretval;
    _cretval = gst_clock_id_get_clock(id);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the time of the clock ID
  
      Params:
        id = The #GstClockID to query
      Returns: the time of the given clock id.
  */
  static gst.types.ClockTime idGetTime(gst.types.ClockID id)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_id_get_time(id);
    return _retval;
  }

  /**
      Increases the refcount of given id.
  
      Params:
        id = The #GstClockID to ref
      Returns: The same #GstClockID with increased refcount.
  */
  static gst.types.ClockID idRef(gst.types.ClockID id)
  {
    gst.types.ClockID _retval;
    _retval = gst_clock_id_ref(id);
    return _retval;
  }

  /**
      Unrefs given id. When the refcount reaches 0 the
      #GstClockID will be freed.
  
      Params:
        id = The #GstClockID to unref
  */
  static void idUnref(gst.types.ClockID id)
  {
    gst_clock_id_unref(id);
  }

  /**
      Cancels an outstanding request with id. This can either
      be an outstanding async notification or a pending sync notification.
      After this call, id cannot be used anymore to receive sync or
      async notifications, you need to create a new #GstClockID.
  
      Params:
        id = The id to unschedule
  */
  static void idUnschedule(gst.types.ClockID id)
  {
    gst_clock_id_unschedule(id);
  }

  /**
      This function returns whether id uses clock as the underlying clock.
      clock can be NULL, in which case the return value indicates whether
      the underlying clock has been freed.  If this is the case, the id is
      no longer usable and should be freed.
  
      Params:
        id = a #GstClockID to check
        clock = a #GstClock to compare against
      Returns: whether the clock id uses the same underlying #GstClock clock.
  */
  static bool idUsesClock(gst.types.ClockID id, gst.clock.Clock clock)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_id_uses_clock(id, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Performs a blocking wait on id.
      id should have been created with [gst.clock.Clock.newSingleShotId]
      or [gst.clock.Clock.newPeriodicId] and should not have been unscheduled
      with a call to [gst.clock.Clock.idUnschedule].
      
      If the jitter argument is not null and this function returns #GST_CLOCK_OK
      or #GST_CLOCK_EARLY, it will contain the difference
      against the clock and the time of id when this method was
      called.
      Positive values indicate how late id was relative to the clock
      (in which case this function will return #GST_CLOCK_EARLY).
      Negative values indicate how much time was spent waiting on the clock
      before this function returned.
  
      Params:
        id = The #GstClockID to wait on
        jitter = a pointer that will contain the jitter,
              can be null.
      Returns: the result of the blocking wait. #GST_CLOCK_EARLY will be returned
        if the current clock time is past the time of id, #GST_CLOCK_OK if
        id was scheduled in time. #GST_CLOCK_UNSCHEDULED if id was
        unscheduled with [gst.clock.Clock.idUnschedule].
  */
  static gst.types.ClockReturn idWait(gst.types.ClockID id, out gst.types.ClockTimeDiff jitter)
  {
    GstClockReturn _cretval;
    _cretval = gst_clock_id_wait(id, cast(GstClockTimeDiff*)&jitter);
    gst.types.ClockReturn _retval = cast(gst.types.ClockReturn)_cretval;
    return _retval;
  }

  /**
      Registers a callback on the given #GstClockID id with the given
      function and user_data. When passing a #GstClockID with an invalid
      time to this function, the callback will be called immediately
      with  a time set to [gst.types.CLOCK_TIME_NONE]. The callback will
      be called when the time of id has been reached.
      
      The callback func can be invoked from any thread, either provided by the
      core or from a streaming thread. The application should be prepared for this.
  
      Params:
        id = a #GstClockID to wait on
        func = The callback function
      Returns: the result of the non blocking wait.
  */
  static gst.types.ClockReturn idWaitAsync(gst.types.ClockID id, gst.types.ClockCallback func)
  {
    extern(C) gboolean _funcCallback(GstClock* clock, GstClockTime time, GstClockID id, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.ClockCallback*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(void*)clock, No.Take), time, id);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstClockReturn _cretval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _cretval = gst_clock_id_wait_async(id, _funcCB, _func, _funcDestroyCB);
    gst.types.ClockReturn _retval = cast(gst.types.ClockReturn)_cretval;
    return _retval;
  }

  /**
      The time master of the master clock and the time slave of the slave
      clock are added to the list of observations. If enough observations
      are available, a linear regression algorithm is run on the
      observations and clock is recalibrated.
      
      If this functions returns true, r_squared will contain the
      correlation coefficient of the interpolation. A value of 1.0
      means a perfect regression was performed. This value can
      be used to control the sampling frequency of the master and slave
      clocks.
  
      Params:
        slave = a time on the slave
        master = a time on the master
        rSquared = a pointer to hold the result
      Returns: true if enough observations were added to run the
        regression algorithm.
  */
  bool addObservation(gst.types.ClockTime slave, gst.types.ClockTime master, out double rSquared)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_add_observation(cast(GstClock*)this._cPtr, slave, master, cast(double*)&rSquared);
    return _retval;
  }

  /**
      Add a clock observation to the internal slaving algorithm the same as
      [gst.clock.Clock.addObservation], and return the result of the master clock
      estimation, without updating the internal calibration.
      
      The caller can then take the results and call [gst.clock.Clock.setCalibration]
      with the values, or some modified version of them.
  
      Params:
        slave = a time on the slave
        master = a time on the master
        rSquared = a pointer to hold the result
        internal = a location to store the internal time
        external = a location to store the external time
        rateNum = a location to store the rate numerator
        rateDenom = a location to store the rate denominator
      Returns: true if enough observations were added to run the
        regression algorithm.
  */
  bool addObservationUnapplied(gst.types.ClockTime slave, gst.types.ClockTime master, out double rSquared, out gst.types.ClockTime internal, out gst.types.ClockTime external, out gst.types.ClockTime rateNum, out gst.types.ClockTime rateDenom)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_add_observation_unapplied(cast(GstClock*)this._cPtr, slave, master, cast(double*)&rSquared, cast(GstClockTime*)&internal, cast(GstClockTime*)&external, cast(GstClockTime*)&rateNum, cast(GstClockTime*)&rateDenom);
    return _retval;
  }

  /**
      Converts the given internal clock time to the external time, adjusting for the
      rate and reference time set with [gst.clock.Clock.setCalibration] and making sure
      that the returned time is increasing. This function should be called with the
      clock's OBJECT_LOCK held and is mainly used by clock subclasses.
      
      This function is the reverse of [gst.clock.Clock.unadjustUnlocked].
  
      Params:
        internal = a clock time
      Returns: the converted time of the clock.
  */
  gst.types.ClockTime adjustUnlocked(gst.types.ClockTime internal)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_adjust_unlocked(cast(GstClock*)this._cPtr, internal);
    return _retval;
  }

  /**
      Converts the given internal_target clock time to the external time,
      using the passed calibration parameters. This function performs the
      same calculation as [gst.clock.Clock.adjustUnlocked] when called using the
      current calibration parameters, but doesn't ensure a monotonically
      increasing result as [gst.clock.Clock.adjustUnlocked] does.
      
      Note: The clock parameter is unused and can be NULL
  
      Params:
        internalTarget = a clock time
        cinternal = a reference internal time
        cexternal = a reference external time
        cnum = the numerator of the rate of the clock relative to its
                 internal time
        cdenom = the denominator of the rate of the clock
      Returns: the converted time of the clock.
  */
  gst.types.ClockTime adjustWithCalibration(gst.types.ClockTime internalTarget, gst.types.ClockTime cinternal, gst.types.ClockTime cexternal, gst.types.ClockTime cnum, gst.types.ClockTime cdenom)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_adjust_with_calibration(cast(GstClock*)this._cPtr, internalTarget, cinternal, cexternal, cnum, cdenom);
    return _retval;
  }

  /**
      Gets the internal rate and reference time of clock. See
      [gst.clock.Clock.setCalibration] for more information.
      
      internal, external, rate_num, and rate_denom can be left null if the
      caller is not interested in the values.
  
      Params:
        internal = a location to store the internal time
        external = a location to store the external time
        rateNum = a location to store the rate numerator
        rateDenom = a location to store the rate denominator
  */
  void getCalibration(out gst.types.ClockTime internal, out gst.types.ClockTime external, out gst.types.ClockTime rateNum, out gst.types.ClockTime rateDenom)
  {
    gst_clock_get_calibration(cast(GstClock*)this._cPtr, cast(GstClockTime*)&internal, cast(GstClockTime*)&external, cast(GstClockTime*)&rateNum, cast(GstClockTime*)&rateDenom);
  }

  /**
      Gets the current internal time of the given clock. The time is returned
      unadjusted for the offset and the rate.
      Returns: the internal time of the clock. Or [gst.types.CLOCK_TIME_NONE] when
        given invalid input.
  */
  gst.types.ClockTime getInternalTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_get_internal_time(cast(GstClock*)this._cPtr);
    return _retval;
  }

  /**
      Gets the master clock that clock is slaved to or null when the clock is
      not slaved to any master clock.
      Returns: a master #GstClock or null
            when this clock is not slaved to a master clock.
  */
  gst.clock.Clock getMaster()
  {
    GstClock* _cretval;
    _cretval = gst_clock_get_master(cast(GstClock*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the accuracy of the clock. The accuracy of the clock is the granularity
      of the values returned by [gst.clock.Clock.getTime].
      Returns: the resolution of the clock in units of #GstClockTime.
  */
  gst.types.ClockTime getResolution()
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_get_resolution(cast(GstClock*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current time of the given clock. The time is always
      monotonically increasing and adjusted according to the current
      offset and rate.
      Returns: the time of the clock. Or [gst.types.CLOCK_TIME_NONE] when
        given invalid input.
  */
  gst.types.ClockTime getTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_get_time(cast(GstClock*)this._cPtr);
    return _retval;
  }

  /**
      Gets the amount of time that master and slave clocks are sampled.
      Returns: the interval between samples.
  */
  gst.types.ClockTime getTimeout()
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_get_timeout(cast(GstClock*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the clock is currently synced, by looking at whether
      [gst.types.ClockFlags.NeedsStartupSync] is set.
      Returns: true if the clock is currently synced
  */
  bool isSynced()
  {
    bool _retval;
    _retval = cast(bool)gst_clock_is_synced(cast(GstClock*)this._cPtr);
    return _retval;
  }

  /**
      Gets an ID from clock to trigger a periodic notification.
      The periodic notifications will start at time start_time and
      will then be fired with the given interval.
  
      Params:
        startTime = the requested start time
        interval = the requested interval
      Returns: a #GstClockID that can be used to request the
            time notification.
  */
  gst.types.ClockID newPeriodicId(gst.types.ClockTime startTime, gst.types.ClockTime interval)
  {
    gst.types.ClockID _retval;
    _retval = gst_clock_new_periodic_id(cast(GstClock*)this._cPtr, startTime, interval);
    return _retval;
  }

  /**
      Gets a #GstClockID from clock to trigger a single shot
      notification at the requested time.
  
      Params:
        time = the requested time
      Returns: a #GstClockID that can be used to request the
            time notification.
  */
  gst.types.ClockID newSingleShotId(gst.types.ClockTime time)
  {
    gst.types.ClockID _retval;
    _retval = gst_clock_new_single_shot_id(cast(GstClock*)this._cPtr, time);
    return _retval;
  }

  /**
      Reinitializes the provided periodic id to the provided start time and
      interval. Does not modify the reference count.
  
      Params:
        id = a #GstClockID
        startTime = the requested start time
        interval = the requested interval
      Returns: true if the GstClockID could be reinitialized to the provided
        time, else false.
  */
  bool periodicIdReinit(gst.types.ClockID id, gst.types.ClockTime startTime, gst.types.ClockTime interval)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_periodic_id_reinit(cast(GstClock*)this._cPtr, id, startTime, interval);
    return _retval;
  }

  /**
      Adjusts the rate and time of clock. A rate of 1/1 is the normal speed of
      the clock. Values bigger than 1/1 make the clock go faster.
      
      internal and external are calibration parameters that arrange that
      [gst.clock.Clock.getTime] should have been external at internal time internal.
      This internal time should not be in the future; that is, it should be less
      than the value of [gst.clock.Clock.getInternalTime] when this function is called.
      
      Subsequent calls to [gst.clock.Clock.getTime] will return clock times computed as
      follows:
      
      ``` C
        time = (internal_time - internal) * rate_num / rate_denom + external
      ```
      
      This formula is implemented in [gst.clock.Clock.adjustUnlocked]. Of course, it
      tries to do the integer arithmetic as precisely as possible.
      
      Note that [gst.clock.Clock.getTime] always returns increasing values so when you
      move the clock backwards, [gst.clock.Clock.getTime] will report the previous value
      until the clock catches up.
  
      Params:
        internal = a reference internal time
        external = a reference external time
        rateNum = the numerator of the rate of the clock relative to its
                     internal time
        rateDenom = the denominator of the rate of the clock
  */
  void setCalibration(gst.types.ClockTime internal, gst.types.ClockTime external, gst.types.ClockTime rateNum, gst.types.ClockTime rateDenom)
  {
    gst_clock_set_calibration(cast(GstClock*)this._cPtr, internal, external, rateNum, rateDenom);
  }

  /**
      Sets master as the master clock for clock. clock will be automatically
      calibrated so that [gst.clock.Clock.getTime] reports the same time as the
      master clock.
      
      A clock provider that slaves its clock to a master can get the current
      calibration values with [gst.clock.Clock.getCalibration].
      
      master can be null in which case clock will not be slaved anymore. It will
      however keep reporting its time adjusted with the last configured rate
      and time offsets.
  
      Params:
        master = a master #GstClock
      Returns: true if the clock is capable of being slaved to a master clock.
        Trying to set a master on a clock without the
        #GST_CLOCK_FLAG_CAN_SET_MASTER flag will make this function return false.
  */
  bool setMaster(gst.clock.Clock master = null)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_set_master(cast(GstClock*)this._cPtr, master ? cast(GstClock*)master._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the accuracy of the clock. Some clocks have the possibility to operate
      with different accuracy at the expense of more resource usage. There is
      normally no need to change the default resolution of a clock. The resolution
      of a clock can only be changed if the clock has the
      #GST_CLOCK_FLAG_CAN_SET_RESOLUTION flag set.
  
      Params:
        resolution = The resolution to set
      Returns: the new resolution of the clock.
  */
  gst.types.ClockTime setResolution(gst.types.ClockTime resolution)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_set_resolution(cast(GstClock*)this._cPtr, resolution);
    return _retval;
  }

  /**
      Sets clock to synced and emits the #GstClock::synced signal, and wakes up any
      thread waiting in [gst.clock.Clock.waitForSync].
      
      This function must only be called if [gst.types.ClockFlags.NeedsStartupSync]
      is set on the clock, and is intended to be called by subclasses only.
  
      Params:
        synced = if the clock is synced
  */
  void setSynced(bool synced)
  {
    gst_clock_set_synced(cast(GstClock*)this._cPtr, synced);
  }

  /**
      Sets the amount of time, in nanoseconds, to sample master and slave
      clocks
  
      Params:
        timeout = a timeout
  */
  void setTimeout(gst.types.ClockTime timeout)
  {
    gst_clock_set_timeout(cast(GstClock*)this._cPtr, timeout);
  }

  /**
      Reinitializes the provided single shot id to the provided time. Does not
      modify the reference count.
  
      Params:
        id = a #GstClockID
        time = The requested time.
      Returns: true if the GstClockID could be reinitialized to the provided
        time, else false.
  */
  bool singleShotIdReinit(gst.types.ClockID id, gst.types.ClockTime time)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_single_shot_id_reinit(cast(GstClock*)this._cPtr, id, time);
    return _retval;
  }

  /**
      Converts the given external clock time to the internal time of clock,
      using the rate and reference time set with [gst.clock.Clock.setCalibration].
      This function should be called with the clock's OBJECT_LOCK held and
      is mainly used by clock subclasses.
      
      This function is the reverse of [gst.clock.Clock.adjustUnlocked].
  
      Params:
        external = an external clock time
      Returns: the internal time of the clock corresponding to external.
  */
  gst.types.ClockTime unadjustUnlocked(gst.types.ClockTime external)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_unadjust_unlocked(cast(GstClock*)this._cPtr, external);
    return _retval;
  }

  /**
      Converts the given external_target clock time to the internal time,
      using the passed calibration parameters. This function performs the
      same calculation as [gst.clock.Clock.unadjustUnlocked] when called using the
      current calibration parameters.
      
      Note: The clock parameter is unused and can be NULL
  
      Params:
        externalTarget = a clock time
        cinternal = a reference internal time
        cexternal = a reference external time
        cnum = the numerator of the rate of the clock relative to its
                 internal time
        cdenom = the denominator of the rate of the clock
      Returns: the converted time of the clock.
  */
  gst.types.ClockTime unadjustWithCalibration(gst.types.ClockTime externalTarget, gst.types.ClockTime cinternal, gst.types.ClockTime cexternal, gst.types.ClockTime cnum, gst.types.ClockTime cdenom)
  {
    gst.types.ClockTime _retval;
    _retval = gst_clock_unadjust_with_calibration(cast(GstClock*)this._cPtr, externalTarget, cinternal, cexternal, cnum, cdenom);
    return _retval;
  }

  /**
      Waits until clock is synced for reporting the current time. If timeout
      is [gst.types.CLOCK_TIME_NONE] it will wait forever, otherwise it will time out
      after timeout nanoseconds.
      
      For asynchronous waiting, the #GstClock::synced signal can be used.
      
      This returns immediately with true if [gst.types.ClockFlags.NeedsStartupSync]
      is not set on the clock, or if the clock is already synced.
  
      Params:
        timeout = timeout for waiting or [gst.types.CLOCK_TIME_NONE]
      Returns: true if waiting was successful, or false on timeout
  */
  bool waitForSync(gst.types.ClockTime timeout)
  {
    bool _retval;
    _retval = cast(bool)gst_clock_wait_for_sync(cast(GstClock*)this._cPtr, timeout);
    return _retval;
  }

  /**
      Connect to `Synced` signal.
  
      Signaled on clocks with [gst.types.ClockFlags.NeedsStartupSync] set once
        the clock is synchronized, or when it completely lost synchronization.
        This signal will not be emitted on clocks without the flag.
        
        This signal will be emitted from an arbitrary thread, most likely not
        the application's main thread.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(bool synced, gst.clock.Clock clock))
  
          `synced` if the clock is synced now (optional)
  
          `clock` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSynced(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.clock.Clock)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("synced", closure, after);
  }
}
