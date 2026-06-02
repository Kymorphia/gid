/// Module for [AudioVisualizer] class
module gstpbutils.audio_visualizer;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.element;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.types;

/**
    A baseclass for scopes (visualizers). It takes care of re-fitting the
    audio-rate to video-rate and handles renegotiation (downstream video size
    changes).
    
    It also provides several background shading effects. These effects are
    applied to a previous picture before the `render()` implementation can draw a
    new frame.
*/
class AudioVisualizer : gst.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_visualizer_get_type != &gidSymbolNotFound ? gst_audio_visualizer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioVisualizer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstpbutils.audio_visualizer.AudioVisualizer]
      Returns: New builder object
  */
  static AudioVisualizerGidBuilder builder() nothrow
  {
    return new AudioVisualizerGidBuilder;
  }

  /** */
  @property uint shadeAmount() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("shade-amount");
  }

  /** */
  @property void shadeAmount(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("shade-amount", propval);
  }

  /** */
  @property gstpbutils.types.AudioVisualizerShader shader() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gstpbutils.types.AudioVisualizerShader)("shader");
  }

  /** */
  @property void shader(gstpbutils.types.AudioVisualizerShader propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gstpbutils.types.AudioVisualizerShader)("shader", propval);
  }
}

/// Fluent builder implementation template for [gstpbutils.audio_visualizer.AudioVisualizer]
class AudioVisualizerGidBuilderImpl(T) : gst.element.ElementGidBuilderImpl!T
{

  /** */
  T shadeAmount(uint propval) nothrow
  {
    return setProperty("shade-amount", propval);
  }

  /** */
  T shader(gstpbutils.types.AudioVisualizerShader propval) nothrow
  {
    return setProperty("shader", propval);
  }
}

/// Fluent builder for [gstpbutils.audio_visualizer.AudioVisualizer]
final class AudioVisualizerGidBuilder : AudioVisualizerGidBuilderImpl!AudioVisualizerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioVisualizer build() nothrow
  {
    return new AudioVisualizer(cast(void*)createGObject(AudioVisualizer._getGType), No.Take);
  }
}
