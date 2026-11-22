/// Module for [AudioVisualizer] class
module gid.gstpbutils1.audio_visualizer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.types;

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
