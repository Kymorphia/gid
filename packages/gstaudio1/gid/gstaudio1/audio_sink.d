/// Module for [AudioSink] class
module gid.gstaudio1.audio_sink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstaudio1.audio_base_sink;
import gid.gstaudio1.audio_ring_buffer_spec;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.base_sink;

/**
    This is the most simple base class for audio sinks that only requires
    subclasses to implement a set of simple functions:
    
    * `open()` :Open the device.
    
    * `prepare()` :Configure the device with the specified format.
    
    * `write()` :Write samples to the device.
    
    * `reset()` :Unblock writes and flush the device.
    
    * `delay()` :Get the number of samples written but not yet played
    by the device.
    
    * `unprepare()` :Undo operations done by prepare.
    
    * `close()` :Close the device.
    
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSink using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
@gidGir("AudioSink", "AudioSinkClass")
class AudioSink : gid.gstaudio1.audio_base_sink.AudioBaseSink
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_sink_get_type != &gidSymbolNotFound ? gst_audio_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_sink.AudioSink]
      Returns: New builder object
  */
  static AudioSinkGidBuilder builder() nothrow
  {
    return new AudioSinkGidBuilder;
  }

  /**
      Close the device.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncClose()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstAudioSink*)this._cPtr);
    return _retval;
  }

  /**
      Return how many frames are still in the device. Participates in
              computing the time for audio clocks and drives the synchronisation.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDelay` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected uint vfuncDelay()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.delay)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.delay(cast(GstAudioSink*)this._cPtr);
    return _retval;
  }

  /**
      Open the device. No configuration needs to be done at this point.
             This function is also used to check if the device is available.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncOpen()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstAudioSink*)this._cPtr);
    return _retval;
  }

  /**
      Pause the device and unblock write as fast as possible.
              For retro compatibility, the audio sink will fallback
              to calling reset if this vmethod is not provided. Since: 1.18
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPause` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPause()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.pause)
      return;

    _klass.pause(cast(GstAudioSink*)this._cPtr);
  }

  alias vfuncPrepare = gid.gstbase1.base_sink.BaseSink.vfuncPrepare;

  /**
      Prepare the device to operate with the specified parameters.
  
      Params:
        spec =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPrepare(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.prepare)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.prepare(cast(GstAudioSink*)this._cPtr, spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
    return _retval;
  }

  /**
      Returns as quickly as possible from a write and flush any pending
              samples from the device.
              This vmethod is deprecated. Please provide pause and stop instead.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(GstAudioSink*)this._cPtr);
  }

  /**
      Resume the device. Since: 1.18
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncResume` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncResume()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.resume)
      return;

    _klass.resume(cast(GstAudioSink*)this._cPtr);
  }

  alias vfuncStop = gid.gstbase1.base_sink.BaseSink.vfuncStop;

  /**
      Stop the device and unblock write as fast as possible.
             Pending samples are flushed from the device.
             For retro compatibility, the audio sink will fallback
             to calling reset if this vmethod is not provided. Since: 1.18
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncStop()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.stop)
      return;

    _klass.stop(cast(GstAudioSink*)this._cPtr);
  }

  /**
      Undo operations done in prepare.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnprepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncUnprepare()
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.unprepare)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unprepare(cast(GstAudioSink*)this._cPtr);
    return _retval;
  }

  /**
      Write samples to the device.
  
      Params:
        data = the sample data
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncWrite(ubyte[] data)
  {
    auto _klass = cast(GstAudioSinkClass*)_vfuncClass;
    if (!_klass.write)
      return typeof(return).init;

    int _retval;
    uint _length;
    if (data)
      _length = cast(uint)data.length;

    auto _data = cast(void**)data.ptr;
    _retval = _klass.write(cast(GstAudioSink*)this._cPtr, _data, _length);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioSink
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_sink.AudioSink), T.stringof ~ " is not derived from gid.gstaudio1.audio_sink.AudioSink");

    gid.gstaudio1.audio_base_sink.AudioBaseSink._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDelay", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "delay");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPause", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "pause");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepare", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "prepare");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResume", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "resume");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnprepare", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "unprepare");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWrite", true)[0]) == gid.gstaudio1.audio_sink.AudioSink))
      _installVfunc(klass, "write");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioSinkClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "delay":
      {
        static extern(C) uint _vfuncDelayTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.delay)
              return (cast(typeof(&_vfuncDelayTramp))_klass.delay)(sink);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncDelay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncDelay");
          }
          return _retval;
        }

        _klass.delay = cast(typeof(_klass.delay))&_vfuncDelayTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "pause":
      {
        static extern(C) void _vfuncPauseTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.pause)
              return (cast(typeof(&_vfuncPauseTramp))_klass.pause)(sink);
            return;
          }

          try
          {
            _obj.vfuncPause();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncPause");
          }
        }

        _klass.pause = cast(typeof(_klass.pause))&_vfuncPauseTramp;
        break;
      }
      case "prepare":
      {
        static extern(C) gboolean _vfuncPrepareTramp(GstAudioSink* sink, GstAudioRingBufferSpec* spec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.prepare)
              return (cast(typeof(&_vfuncPrepareTramp))_klass.prepare)(sink, spec);
            return typeof(return).init;
          }

          bool _dretval;
          auto _spec = spec ? new gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec(cast(void*)spec, null) : null;

          try
          {
            _dretval = _obj.vfuncPrepare(_spec);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncPrepare");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.prepare = cast(typeof(_klass.prepare))&_vfuncPrepareTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(sink);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "resume":
      {
        static extern(C) void _vfuncResumeTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.resume)
              return (cast(typeof(&_vfuncResumeTramp))_klass.resume)(sink);
            return;
          }

          try
          {
            _obj.vfuncResume();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncResume");
          }
        }

        _klass.resume = cast(typeof(_klass.resume))&_vfuncResumeTramp;
        break;
      }
      case "stop":
      {
        static extern(C) void _vfuncStopTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(sink);
            return;
          }

          try
          {
            _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncStop");
          }
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      case "unprepare":
      {
        static extern(C) gboolean _vfuncUnprepareTramp(GstAudioSink* sink) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.unprepare)
              return (cast(typeof(&_vfuncUnprepareTramp))_klass.unprepare)(sink);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnprepare();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncUnprepare");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unprepare = cast(typeof(_klass.unprepare))&_vfuncUnprepareTramp;
        break;
      }
      case "write":
      {
        static extern(C) int _vfuncWriteTramp(GstAudioSink* sink, void* data, uint length) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_sink.AudioSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)sink);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sink);
            if (_klass.write)
              return (cast(typeof(&_vfuncWriteTramp))_klass.write)(sink, data, length);
            return typeof(return).init;
          }

          int _retval;
          ubyte[] _data;
          _data.length = length;
          _data[0 .. length] = (cast(const(ubyte)*)data)[0 .. length];

          try
          {
            _retval = _obj.vfuncWrite(_data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_sink.AudioSink.vfuncWrite");
          }
          return _retval;
        }

        _klass.write = cast(typeof(_klass.write))&_vfuncWriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_sink.AudioSink]
class AudioSinkGidBuilderImpl(T) : gid.gstaudio1.audio_base_sink.AudioBaseSinkGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_sink.AudioSink]
final class AudioSinkGidBuilder : AudioSinkGidBuilderImpl!AudioSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioSink build() nothrow
  {
    return new AudioSink(cast(void*)createGObject(AudioSink._getGType), Yes.Take);
  }
}
