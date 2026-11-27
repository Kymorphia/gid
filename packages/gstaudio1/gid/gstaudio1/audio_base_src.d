/// Module for [AudioBaseSrc] class
module gid.gstaudio1.audio_base_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gstaudio1.audio_ring_buffer;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.push_src;

/**
    This is the base class for audio sources. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    reading samples from the ringbuffer, synchronisation and flushing.
*/
@gidGir("AudioBaseSrc", "AudioBaseSrcClass")
class AudioBaseSrc : gid.gstbase1.push_src.PushSrc
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
    return cast(void function())gst_audio_base_src_get_type != &gidSymbolNotFound ? gst_audio_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioBaseSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioBaseSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_base_src.AudioBaseSrc]
      Returns: New builder object
  */
  static AudioBaseSrcGidBuilder builder() nothrow
  {
    return new AudioBaseSrcGidBuilder;
  }

  /**
      Get `actualBufferTime` property.
      Returns: Actual configured size of audio buffer in microseconds.
  */
  @property long actualBufferTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("actual-buffer-time");
  }

  /**
      Get `actualLatencyTime` property.
      Returns: Actual configured audio latency in microseconds.
  */
  @property long actualLatencyTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("actual-latency-time");
  }

  /** */
  @property long bufferTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("buffer-time");
  }

  /** */
  @property void bufferTime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("buffer-time", propval);
  }

  /** */
  @property long latencyTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("latency-time");
  }

  /** */
  @property void latencyTime(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("latency-time", propval);
  }

  alias provideClock = gid.gst1.element.Element.provideClock;

  /** */
  @property bool provideClock() nothrow
  {
    return getProvideClock();
  }

  alias provideClock = gid.gst1.element.Element.provideClock;

  /** */
  @property void provideClock(bool propval) nothrow
  {
    setProvideClock(propval);
  }

  /** */
  @property gid.gstaudio1.types.AudioBaseSrcSlaveMethod slaveMethod() nothrow
  {
    return getSlaveMethod();
  }

  /** */
  @property void slaveMethod(gid.gstaudio1.types.AudioBaseSrcSlaveMethod propval) nothrow
  {
    setSlaveMethod(propval);
  }

  /**
      Create and return the #GstAudioRingBuffer for src. This function will call
      the ::create_ringbuffer vmethod and will set src as the parent of the
      returned buffer (see [gid.gst1.object.ObjectWrap.setParent]).
      Returns: The new ringbuffer of src.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateRingbuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gstaudio1.audio_ring_buffer.AudioRingBuffer vfuncCreateRingbuffer()
  {
    auto _klass = cast(GstAudioBaseSrcClass*)_vfuncClass;
    if (!_klass.createRingbuffer)
      return typeof(return).init;

    GstAudioRingBuffer* _cretval;
    _cretval = _klass.createRingbuffer(cast(GstAudioBaseSrc*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create and return the #GstAudioRingBuffer for src. This function will call
      the ::create_ringbuffer vmethod and will set src as the parent of the
      returned buffer (see [gid.gst1.object.ObjectWrap.setParent]).
      Returns: The new ringbuffer of src.
  */
  gid.gstaudio1.audio_ring_buffer.AudioRingBuffer createRingbuffer() nothrow
  {
    GstAudioRingBuffer* _cretval;
    _cretval = gst_audio_base_src_create_ringbuffer(cast(GstAudioBaseSrc*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstaudio1.audio_ring_buffer.AudioRingBuffer)(cast(GstAudioRingBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries whether src will provide a clock or not. See also
      gst_audio_base_src_set_provide_clock.
      Returns: true if src will provide a clock.
  */
  bool getProvideClock() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_base_src_get_provide_clock(cast(GstAudioBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      Get the current slave method used by src.
      Returns: The current slave method used by src.
  */
  gid.gstaudio1.types.AudioBaseSrcSlaveMethod getSlaveMethod() nothrow
  {
    GstAudioBaseSrcSlaveMethod _cretval;
    _cretval = gst_audio_base_src_get_slave_method(cast(GstAudioBaseSrc*)this._cPtr);
    gid.gstaudio1.types.AudioBaseSrcSlaveMethod _retval = cast(gid.gstaudio1.types.AudioBaseSrcSlaveMethod)_cretval;
    return _retval;
  }

  /**
      Controls whether src will provide a clock or not. If provide is true,
      [gid.gst1.element.Element.provideClock] will return a clock that reflects the datarate
      of src. If provide is false, [gid.gst1.element.Element.provideClock] will return NULL.
  
      Params:
        provide = new state
  */
  void setProvideClock(bool provide) nothrow
  {
    gst_audio_base_src_set_provide_clock(cast(GstAudioBaseSrc*)this._cPtr, provide);
  }

  /**
      Controls how clock slaving will be performed in src.
  
      Params:
        method = the new slave method
  */
  void setSlaveMethod(gid.gstaudio1.types.AudioBaseSrcSlaveMethod method) nothrow
  {
    gst_audio_base_src_set_slave_method(cast(GstAudioBaseSrc*)this._cPtr, method);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioBaseSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_base_src.AudioBaseSrc), T.stringof ~ " is not derived from gid.gstaudio1.audio_base_src.AudioBaseSrc");

    gid.gstbase1.push_src.PushSrc._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateRingbuffer", true)[0]) == gid.gstaudio1.audio_base_src.AudioBaseSrc))
      _installVfunc(klass, "create_ringbuffer");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioBaseSrcClass*)klass;

    switch (vfunc)
    {
      case "create_ringbuffer":
      {
        static extern(C) GstAudioRingBuffer* _vfuncCreateRingbufferTramp(GstAudioBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_base_src.AudioBaseSrc)(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.createRingbuffer)
              return (cast(typeof(&_vfuncCreateRingbufferTramp))_klass.createRingbuffer)(src);
            return typeof(return).init;
          }

          gid.gstaudio1.audio_ring_buffer.AudioRingBuffer _dretval;

          try
          {
            _dretval = _obj.vfuncCreateRingbuffer();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_base_src.AudioBaseSrc.vfuncCreateRingbuffer");
          }
          auto _retval = _dretval ? cast(GstAudioRingBuffer*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.createRingbuffer = cast(typeof(_klass.createRingbuffer))&_vfuncCreateRingbufferTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_base_src.AudioBaseSrc]
class AudioBaseSrcGidBuilderImpl(T) : gid.gstbase1.push_src.PushSrcGidBuilderImpl!T
{

  /** */
  T bufferTime(long propval) nothrow
  {
    return setProperty("buffer-time", propval);
  }

  /** */
  T latencyTime(long propval) nothrow
  {
    return setProperty("latency-time", propval);
  }

  /** */
  T provideClock(bool propval) nothrow
  {
    return setProperty("provide-clock", propval);
  }

  /** */
  T slaveMethod(gid.gstaudio1.types.AudioBaseSrcSlaveMethod propval) nothrow
  {
    return setProperty("slave-method", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_base_src.AudioBaseSrc]
final class AudioBaseSrcGidBuilder : AudioBaseSrcGidBuilderImpl!AudioBaseSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioBaseSrc build() nothrow
  {
    return new AudioBaseSrc(cast(void*)createGObject(AudioBaseSrc._getGType), Yes.Take);
  }
}
