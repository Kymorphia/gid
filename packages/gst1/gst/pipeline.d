/// Module for [Pipeline] class
module gst.pipeline;

import gid.gid;
import gobject.object;
import gst.bin;
import gst.bus;
import gst.c.functions;
import gst.c.types;
import gst.child_proxy;
import gst.child_proxy_mixin;
import gst.clock;
import gst.types;

/**
    A #GstPipeline is a special #GstBin used as the toplevel container for
    the filter graph. The #GstPipeline will manage the selection and
    distribution of a global #GstClock as well as provide a #GstBus to the
    application.
    
    [gst.pipeline.Pipeline.new_] is used to create a pipeline. when you are done with
    the pipeline, use [gst.object.ObjectWrap.unref] to free its resources including all
    added #GstElement objects (if not otherwise referenced).
    
    Elements are added and removed from the pipeline using the #GstBin
    methods like [gst.bin.Bin.add] and [gst.bin.Bin.remove] (see #GstBin).
    
    Before changing the state of the #GstPipeline (see #GstElement) a #GstBus
    should be retrieved with [gst.pipeline.Pipeline.getBus]. This #GstBus should then
    be used to receive #GstMessage from the elements in the pipeline. Listening
    to the #GstBus is necessary for retrieving error messages from the
    #GstPipeline and otherwise the #GstPipeline might stop without any
    indication, why. Furthermore, the #GstPipeline posts messages even if
    nobody listens on the #GstBus, which will pile up and use up memory.
    
    By default, a #GstPipeline will automatically flush the pending #GstBus
    messages when going to the NULL state to ensure that no circular
    references exist when no messages are read from the #GstBus. This
    behaviour can be changed with [gst.pipeline.Pipeline.setAutoFlushBus].
    
    When the #GstPipeline performs the PAUSED to PLAYING state change it will
    select a clock for the elements. The clock selection algorithm will by
    default select a clock provided by an element that is most upstream
    (closest to the source). For live pipelines (ones that return
    #GST_STATE_CHANGE_NO_PREROLL from the [gst.element.Element.setState] call) this
    will select the clock provided by the live source. For normal pipelines
    this will select a clock provided by the sinks (most likely the audio
    sink). If no element provides a clock, a default #GstSystemClock is used.
    
    The clock selection can be controlled with the [gst.pipeline.Pipeline.useClock]
    method, which will enforce a given clock on the pipeline. With
    [gst.pipeline.Pipeline.autoClock] the default clock selection algorithm can be
    restored.
    
    A #GstPipeline maintains a running time for the elements. The running
    time is defined as the difference between the current clock time and
    the base time. When the pipeline goes to READY or a flushing seek is
    performed on it, the running time is reset to 0. When the pipeline is
    set from PLAYING to PAUSED, the current clock time is sampled and used to
    configure the base time for the elements when the pipeline is set
    to PLAYING again. The effect is that the running time (as the difference
    between the clock time and the base time) will count how much time was spent
    in the PLAYING state. This default behaviour can be changed with the
    [gst.element.Element.setStartTime] method.
*/
class Pipeline : gst.bin.Bin
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
    return cast(void function())gst_pipeline_get_type != &gidSymbolNotFound ? gst_pipeline_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Pipeline self()
  {
    return this;
  }

  /**
      Get `autoFlushBus` property.
      Returns: Whether or not to automatically flush all messages on the
        pipeline's bus when going from READY to NULL state. Please see
        [gst.pipeline.Pipeline.setAutoFlushBus] for more information on this option.
  */
  @property bool autoFlushBus()
  {
    return getAutoFlushBus();
  }

  /**
      Set `autoFlushBus` property.
      Params:
        propval = Whether or not to automatically flush all messages on the
          pipeline's bus when going from READY to NULL state. Please see
          [gst.pipeline.Pipeline.setAutoFlushBus] for more information on this option.
  */
  @property void autoFlushBus(bool propval)
  {
    return setAutoFlushBus(propval);
  }

  /**
      Get `delay` property.
      Returns: The expected delay needed for elements to spin up to the
        PLAYING state expressed in nanoseconds.
        see [gst.pipeline.Pipeline.setDelay] for more information on this option.
  */
  @property ulong delay()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("delay");
  }

  /**
      Set `delay` property.
      Params:
        propval = The expected delay needed for elements to spin up to the
          PLAYING state expressed in nanoseconds.
          see [gst.pipeline.Pipeline.setDelay] for more information on this option.
  */
  @property void delay(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("delay", propval);
  }

  /**
      Get `latency` property.
      Returns: Latency to configure on the pipeline. See [gst.pipeline.Pipeline.setLatency].
  */
  @property ulong latency()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("latency");
  }

  /**
      Set `latency` property.
      Params:
        propval = Latency to configure on the pipeline. See [gst.pipeline.Pipeline.setLatency].
  */
  @property void latency(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("latency", propval);
  }

  /**
      Create a new pipeline with the given name.
  
      Params:
        name = name of new pipeline
      Returns: newly created GstPipeline
        
        MT safe.
  */
  this(string name = null)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_pipeline_new(_name);
    this(_cretval, No.Take);
  }

  /**
      Let pipeline select a clock automatically. This is the default
      behaviour.
      
      Use this function if you previous forced a fixed clock with
      [gst.pipeline.Pipeline.useClock] and want to restore the default
      pipeline clock selection algorithm.
      
      MT safe.
  */
  void autoClock()
  {
    gst_pipeline_auto_clock(cast(GstPipeline*)this._cPtr);
  }

  /**
      Check if pipeline will automatically flush messages when going to
      the NULL state.
      Returns: whether the pipeline will automatically flush its bus when
        going from READY to NULL state or not.
        
        MT safe.
  */
  bool getAutoFlushBus()
  {
    bool _retval;
    _retval = cast(bool)gst_pipeline_get_auto_flush_bus(cast(GstPipeline*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GstBus of pipeline. The bus allows applications to receive
      #GstMessage packets.
      Returns: a #GstBus, unref after usage.
        
        MT safe.
  */
  override gst.bus.Bus getBus()
  {
    GstBus* _cretval;
    _cretval = gst_pipeline_get_bus(cast(GstPipeline*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.bus.Bus)(cast(GstBus*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Return the configured latency on pipeline.
      Returns: pipeline configured latency, or `GST_CLOCK_TIME_NONE` if none has been configured
        because pipeline did not reach the PLAYING state yet.
        
        MT safe.
  */
  gst.types.ClockTime getConfiguredLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_pipeline_get_configured_latency(cast(GstPipeline*)this._cPtr);
    return _retval;
  }

  /**
      Get the configured delay (see [gst.pipeline.Pipeline.setDelay]).
      Returns: The configured delay.
        
        MT safe.
  */
  gst.types.ClockTime getDelay()
  {
    gst.types.ClockTime _retval;
    _retval = gst_pipeline_get_delay(cast(GstPipeline*)this._cPtr);
    return _retval;
  }

  /**
      Gets the latency that should be configured on the pipeline. See
      [gst.pipeline.Pipeline.setLatency].
      Returns: Latency to configure on the pipeline or GST_CLOCK_TIME_NONE
  */
  gst.types.ClockTime getLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_pipeline_get_latency(cast(GstPipeline*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current clock used by pipeline.
      
      Unlike [gst.element.Element.getClock], this function will always return a
      clock, even if the pipeline is not in the PLAYING state.
      Returns: a #GstClock, unref after usage.
  */
  gst.clock.Clock getPipelineClock()
  {
    GstClock* _cretval;
    _cretval = gst_pipeline_get_pipeline_clock(cast(GstPipeline*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Check if pipeline is live.
      Returns: true if pipeline is live, false if not or if it did not reach the PAUSED state yet.
        
        MT safe.
  */
  bool isLive()
  {
    bool _retval;
    _retval = cast(bool)gst_pipeline_is_live(cast(GstPipeline*)this._cPtr);
    return _retval;
  }

  /**
      Usually, when a pipeline goes from READY to NULL state, it automatically
      flushes all pending messages on the bus, which is done for refcounting
      purposes, to break circular references.
      
      This means that applications that update state using (async) bus messages
      (e.g. do certain things when a pipeline goes from PAUSED to READY) might
      not get to see messages when the pipeline is shut down, because they might
      be flushed before they can be dispatched in the main thread. This behaviour
      can be disabled using this function.
      
      It is important that all messages on the bus are handled when the
      automatic flushing is disabled else memory leaks will be introduced.
      
      MT safe.
  
      Params:
        autoFlush = whether or not to automatically flush the bus when
          the pipeline goes from READY to NULL state
  */
  void setAutoFlushBus(bool autoFlush)
  {
    gst_pipeline_set_auto_flush_bus(cast(GstPipeline*)this._cPtr, autoFlush);
  }

  /**
      Set the expected delay needed for all elements to perform the
      PAUSED to PLAYING state change. delay will be added to the
      base time of the elements so that they wait an additional delay
      amount of time before starting to process buffers and cannot be
      #GST_CLOCK_TIME_NONE.
      
      This option is used for tuning purposes and should normally not be
      used.
      
      MT safe.
  
      Params:
        delay = the delay
  */
  void setDelay(gst.types.ClockTime delay)
  {
    gst_pipeline_set_delay(cast(GstPipeline*)this._cPtr, delay);
  }

  /**
      Sets the latency that should be configured on the pipeline. Setting
      GST_CLOCK_TIME_NONE will restore the default behaviour of using the minimum
      latency from the LATENCY query. Setting this is usually not required and
      the pipeline will figure out an appropriate latency automatically.
      
      Setting a too low latency, especially lower than the minimum latency from
      the LATENCY query, will most likely cause the pipeline to fail.
  
      Params:
        latency = latency to configure
  */
  void setLatency(gst.types.ClockTime latency)
  {
    gst_pipeline_set_latency(cast(GstPipeline*)this._cPtr, latency);
  }

  /**
      Force pipeline to use the given clock. The pipeline will
      always use the given clock even if new clock providers are added
      to this pipeline.
      
      If clock is null all clocking will be disabled which will make
      the pipeline run as fast as possible.
      
      MT safe.
  
      Params:
        clock = the clock to use
  */
  void useClock(gst.clock.Clock clock = null)
  {
    gst_pipeline_use_clock(cast(GstPipeline*)this._cPtr, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null);
  }
}
