/// Module for [AudioSrc] class
module gid.gstaudio1.audio_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.types;
import gid.gstaudio1.audio_base_src;
import gid.gstaudio1.audio_ring_buffer_spec;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    This is the most simple base class for audio sources that only requires
    subclasses to implement a set of simple functions:
    
    * `open()` :Open the device.
    * `prepare()` :Configure the device with the specified format.
    * `read()` :Read samples from the device.
    * `reset()` :Unblock reads and flush the device.
    * `delay()` :Get the number of samples in the device but not yet read.
    * `unprepare()` :Undo operations done by prepare.
    * `close()` :Close the device.
    
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSrc using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
class AudioSrc : gid.gstaudio1.audio_base_src.AudioBaseSrc
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_src_get_type != &gidSymbolNotFound ? gst_audio_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_src.AudioSrc]
      Returns: New builder object
  */
  static AudioSrcGidBuilder builder() nothrow
  {
    return new AudioSrcGidBuilder;
  }

  /**
      close the device
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncClose()
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.close)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.close(cast(GstAudioSrc*)this._cPtr);
    return _retval;
  }

  /**
      the number of frames queued in the device
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDelay` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncDelay()
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.delay)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.delay(cast(GstAudioSrc*)this._cPtr);
    return _retval;
  }

  /**
      open the device with the specified caps
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncOpen()
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.open(cast(GstAudioSrc*)this._cPtr);
    return _retval;
  }

  /**
      configure device with format
  
      Params:
        spec =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncPrepare(gid.gstaudio1.audio_ring_buffer_spec.AudioRingBufferSpec spec)
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.prepare)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.prepare(cast(GstAudioSrc*)this._cPtr, spec ? cast(GstAudioRingBufferSpec*)spec._cPtr : null);
    return _retval;
  }

  /**
      Read samples from the device.
  
      Params:
        data = the sample data
        timestamp = a #GstClockTime
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRead` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected uint vfuncRead(ubyte[] data, out gid.gst1.types.ClockTime timestamp)
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.read)
      return typeof(return).init;

    uint _retval;
    uint _length;
    if (data)
      _length = cast(uint)data.length;

    auto _data = cast(void**)data.ptr;
    _retval = _klass.read(cast(GstAudioSrc*)this._cPtr, _data, _length, cast(GstClockTime*)&timestamp);
    return _retval;
  }

  /**
      unblock a read to the device and reset.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(GstAudioSrc*)this._cPtr);
  }

  /**
      undo the configuration
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnprepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncUnprepare()
  {
    auto _klass = cast(GstAudioSrcClass*)_vfuncClass;
    if (!_klass.unprepare)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.unprepare(cast(GstAudioSrc*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_src.AudioSrc), T.stringof ~ " is not derived from gid.gstaudio1.audio_src.AudioSrc");

    gid.gstaudio1.audio_base_src.AudioBaseSrc._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDelay", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "delay");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepare", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "prepare");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRead", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "read");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnprepare", true)[0]) == gid.gstaudio1.audio_src.AudioSrc))
      _installVfunc(klass, "unprepare");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioSrcClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) gboolean _vfuncCloseTramp(GstAudioSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncClose");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "delay":
      {
        static extern(C) uint _vfuncDelayTramp(GstAudioSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.delay)
              return (cast(typeof(&_vfuncDelayTramp))_klass.delay)(src);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncDelay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncDelay");
          }
          return _retval;
        }

        _klass.delay = cast(typeof(_klass.delay))&_vfuncDelayTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstAudioSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "prepare":
      {
        static extern(C) gboolean _vfuncPrepareTramp(GstAudioSrc* src, GstAudioRingBufferSpec* spec) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.prepare)
              return (cast(typeof(&_vfuncPrepareTramp))_klass.prepare)(src, spec);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncPrepare");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.prepare = cast(typeof(_klass.prepare))&_vfuncPrepareTramp;
        break;
      }
      case "read":
      {
        static extern(C) uint _vfuncReadTramp(GstAudioSrc* src, void* data, uint length, GstClockTime* timestamp) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.read)
              return (cast(typeof(&_vfuncReadTramp))_klass.read)(src, data, length, timestamp);
            return typeof(return).init;
          }

          uint _retval;
          ubyte[] _data;
          _data.length = length;
          _data[0 .. length] = (cast(const(ubyte)*)data)[0 .. length];

          try
          {
            _retval = _obj.vfuncRead(_data, *timestamp);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncRead");
          }
          return _retval;
        }

        _klass.read = cast(typeof(_klass.read))&_vfuncReadTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GstAudioSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(src);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "unprepare":
      {
        static extern(C) gboolean _vfuncUnprepareTramp(GstAudioSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_src.AudioSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.unprepare)
              return (cast(typeof(&_vfuncUnprepareTramp))_klass.unprepare)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncUnprepare();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_src.AudioSrc.vfuncUnprepare");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.unprepare = cast(typeof(_klass.unprepare))&_vfuncUnprepareTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_src.AudioSrc]
class AudioSrcGidBuilderImpl(T) : gid.gstaudio1.audio_base_src.AudioBaseSrcGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_src.AudioSrc]
final class AudioSrcGidBuilder : AudioSrcGidBuilderImpl!AudioSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioSrc build() nothrow
  {
    return new AudioSrc(cast(void*)createGObject(AudioSrc._getGType), Yes.Take);
  }
}
