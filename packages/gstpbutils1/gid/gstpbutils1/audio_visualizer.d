/// Module for [AudioVisualizer] class
module gid.gstpbutils1.audio_visualizer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.element;
import gid.gst1.query;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.types;
import gid.gstvideo1.video_frame;

/**
    A baseclass for scopes (visualizers). It takes care of re-fitting the
    audio-rate to video-rate and handles renegotiation (downstream video size
    changes).
    
    It also provides several background shading effects. These effects are
    applied to a previous picture before the `render()` implementation can draw a
    new frame.
*/
class AudioVisualizer : gid.gst1.element.Element
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
    return cast(void function())gst_audio_visualizer_get_type != &gidSymbolNotFound ? gst_audio_visualizer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioVisualizer";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioVisualizer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.audio_visualizer.AudioVisualizer]
      Returns: New builder object
  */
  static AudioVisualizerGidBuilder builder() nothrow
  {
    return new AudioVisualizerGidBuilder;
  }

  /** */
  @property uint shadeAmount() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("shade-amount");
  }

  /** */
  @property void shadeAmount(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("shade-amount", propval);
  }

  /** */
  @property gid.gstpbutils1.types.AudioVisualizerShader shader() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstpbutils1.types.AudioVisualizerShader)("shader");
  }

  /** */
  @property void shader(gid.gstpbutils1.types.AudioVisualizerShader propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstpbutils1.types.AudioVisualizerShader)("shader", propval);
  }

  /** */
  protected bool vfuncDecideAllocation(gid.gst1.query.Query query)
  {
    auto _klass = cast(GstAudioVisualizerClass*)_vfuncClass;
    if (!_klass.decideAllocation)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.decideAllocation(cast(GstAudioVisualizer*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  protected bool vfuncRender(gid.gst1.buffer.Buffer audio, gid.gstvideo1.video_frame.VideoFrame video)
  {
    auto _klass = cast(GstAudioVisualizerClass*)_vfuncClass;
    if (!_klass.render)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.render(cast(GstAudioVisualizer*)this._cPtr, audio ? cast(GstBuffer*)audio._cPtr(No.Dup) : null, video ? cast(GstVideoFrame*)video._cPtr : null);
    return _retval;
  }

  /** */
  protected bool vfuncSetup()
  {
    auto _klass = cast(GstAudioVisualizerClass*)_vfuncClass;
    if (!_klass.setup)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setup(cast(GstAudioVisualizer*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioVisualizer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstpbutils1.audio_visualizer.AudioVisualizer), T.stringof ~ " is not derived from gid.gstpbutils1.audio_visualizer.AudioVisualizer");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecideAllocation", true)[0]) == gid.gstpbutils1.audio_visualizer.AudioVisualizer))
      _installVfunc(klass, "decide_allocation");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRender", true)[0]) == gid.gstpbutils1.audio_visualizer.AudioVisualizer))
      _installVfunc(klass, "render");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetup", true)[0]) == gid.gstpbutils1.audio_visualizer.AudioVisualizer))
      _installVfunc(klass, "setup");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioVisualizerClass*)klass;

    switch (vfunc)
    {
      case "decide_allocation":
      {
        static extern(C) gboolean _vfuncDecideAllocationTramp(GstAudioVisualizer* scope_, GstQuery* query) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.audio_visualizer.AudioVisualizer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scope_);
          if (!_obj)
          {
            auto _klass = cast(GstAudioVisualizerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scope_);
            if (_klass.decideAllocation)
              return (cast(typeof(&_vfuncDecideAllocationTramp))_klass.decideAllocation)(scope_, query);
            return typeof(return).init;
          }

          bool _dretval;
          auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncDecideAllocation(_query);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.audio_visualizer.AudioVisualizer.vfuncDecideAllocation");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_query)
            _query._cUnborrow;

          return _retval;
        }

        _klass.decideAllocation = cast(typeof(_klass.decideAllocation))&_vfuncDecideAllocationTramp;
        break;
      }
      case "render":
      {
        static extern(C) gboolean _vfuncRenderTramp(GstAudioVisualizer* scope_, GstBuffer* audio, GstVideoFrame* video) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.audio_visualizer.AudioVisualizer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scope_);
          if (!_obj)
          {
            auto _klass = cast(GstAudioVisualizerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scope_);
            if (_klass.render)
              return (cast(typeof(&_vfuncRenderTramp))_klass.render)(scope_, audio, video);
            return typeof(return).init;
          }

          bool _dretval;
          auto _audio = audio ? new gid.gst1.buffer.Buffer(cast(void*)audio, Yes.Take)._cBorrow : null;
          auto _video = video ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)video, null) : null;

          try
          {
            _dretval = _obj.vfuncRender(_audio, _video);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.audio_visualizer.AudioVisualizer.vfuncRender");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_audio)
            _audio._cUnborrow;

          return _retval;
        }

        _klass.render = cast(typeof(_klass.render))&_vfuncRenderTramp;
        break;
      }
      case "setup":
      {
        static extern(C) gboolean _vfuncSetupTramp(GstAudioVisualizer* scope_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstpbutils1.audio_visualizer.AudioVisualizer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scope_);
          if (!_obj)
          {
            auto _klass = cast(GstAudioVisualizerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scope_);
            if (_klass.setup)
              return (cast(typeof(&_vfuncSetupTramp))_klass.setup)(scope_);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstpbutils1.audio_visualizer.AudioVisualizer.vfuncSetup");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setup = cast(typeof(_klass.setup))&_vfuncSetupTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.audio_visualizer.AudioVisualizer]
class AudioVisualizerGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{

  /** */
  T shadeAmount(uint propval) nothrow
  {
    return setProperty("shade-amount", propval);
  }

  /** */
  T shader(gid.gstpbutils1.types.AudioVisualizerShader propval) nothrow
  {
    return setProperty("shader", propval);
  }
}

/// Fluent builder for [gid.gstpbutils1.audio_visualizer.AudioVisualizer]
final class AudioVisualizerGidBuilder : AudioVisualizerGidBuilderImpl!AudioVisualizerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioVisualizer build() nothrow
  {
    return new AudioVisualizer(cast(void*)createGObject(AudioVisualizer._getGType), Yes.Take);
  }
}
