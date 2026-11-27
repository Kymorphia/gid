/// Module for [AudioAggregatorPad] class
module gid.gstaudio1.audio_aggregator_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gstaudio1.audio_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.aggregator_pad;

/**
    The default implementation of GstPad used with #GstAudioAggregator
*/
@gidGir("AudioAggregatorPad", "AudioAggregatorPadClass")
class AudioAggregatorPad : gid.gstbase1.aggregator_pad.AggregatorPad
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
    return cast(void function())gst_audio_aggregator_pad_get_type != &gidSymbolNotFound ? gst_audio_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioAggregatorPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioAggregatorPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad]
      Returns: New builder object
  */
  static AudioAggregatorPadGidBuilder builder() nothrow
  {
    return new AudioAggregatorPadGidBuilder;
  }

  /**
      Get `qosMessages` property.
      Returns: Emit QoS messages when dropping buffers.
  */
  @property bool qosMessages() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("qos-messages");
  }

  /**
      Set `qosMessages` property.
      Params:
        propval = Emit QoS messages when dropping buffers.
  */
  @property void qosMessages(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("qos-messages", propval);
  }

  /**
      Convert a buffer from one format to another.
  
      Params:
        inInfo =  (modified in place, changes are seen by the caller)
        outInfo =  (modified in place, changes are seen by the caller)
        buffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncConvertBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncConvertBuffer(gid.gstaudio1.audio_info.AudioInfo inInfo, gid.gstaudio1.audio_info.AudioInfo outInfo, gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstAudioAggregatorPadClass*)_vfuncClass;
    if (!_klass.convertBuffer)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.convertBuffer(cast(GstAudioAggregatorPad*)this._cPtr, inInfo ? cast(GstAudioInfo*)inInfo._cPtr(No.Dup) : null, outInfo ? cast(GstAudioInfo*)outInfo._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Called when either the input or output
       formats have changed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUpdateConversionInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUpdateConversionInfo()
  {
    auto _klass = cast(GstAudioAggregatorPadClass*)_vfuncClass;
    if (!_klass.updateConversionInfo)
      return;

    _klass.updateConversionInfo(cast(GstAudioAggregatorPad*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioAggregatorPad
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad), T.stringof ~ " is not derived from gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad");

    gid.gstbase1.aggregator_pad.AggregatorPad._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncConvertBuffer", true)[0]) == gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad))
      _installVfunc(klass, "convert_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateConversionInfo", true)[0]) == gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad))
      _installVfunc(klass, "update_conversion_info");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioAggregatorPadClass*)klass;

    switch (vfunc)
    {
      case "convert_buffer":
      {
        static extern(C) GstBuffer* _vfuncConvertBufferTramp(GstAudioAggregatorPad* pad, GstAudioInfo* inInfo, GstAudioInfo* outInfo, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad)(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstAudioAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.convertBuffer)
              return (cast(typeof(&_vfuncConvertBufferTramp))_klass.convertBuffer)(pad, inInfo, outInfo, buffer);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;
          auto _inInfo = inInfo ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)inInfo, Yes.Take)._cBorrow : null;
          auto _outInfo = outInfo ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)outInfo, Yes.Take)._cBorrow : null;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncConvertBuffer(_inInfo, _outInfo, _buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad.vfuncConvertBuffer");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;
          if (_inInfo)
            _inInfo._cUnborrow;
          if (_outInfo)
            _outInfo._cUnborrow;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.convertBuffer = cast(typeof(_klass.convertBuffer))&_vfuncConvertBufferTramp;
        break;
      }
      case "update_conversion_info":
      {
        static extern(C) void _vfuncUpdateConversionInfoTramp(GstAudioAggregatorPad* pad) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad)(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstAudioAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.updateConversionInfo)
              return (cast(typeof(&_vfuncUpdateConversionInfoTramp))_klass.updateConversionInfo)(pad);
            return;
          }

          try
          {
            _obj.vfuncUpdateConversionInfo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad.vfuncUpdateConversionInfo");
          }
        }

        _klass.updateConversionInfo = cast(typeof(_klass.updateConversionInfo))&_vfuncUpdateConversionInfoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad]
class AudioAggregatorPadGidBuilderImpl(T) : gid.gstbase1.aggregator_pad.AggregatorPadGidBuilderImpl!T
{

  /**
      Set `qosMessages` property.
      Params:
        propval = Emit QoS messages when dropping buffers.
      Returns: Builder instance for fluent chaining
  */
  T qosMessages(bool propval) nothrow
  {
    return setProperty("qos-messages", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_aggregator_pad.AudioAggregatorPad]
final class AudioAggregatorPadGidBuilder : AudioAggregatorPadGidBuilderImpl!AudioAggregatorPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioAggregatorPad build() nothrow
  {
    return new AudioAggregatorPad(cast(void*)createGObject(AudioAggregatorPad._getGType), Yes.Take);
  }
}
