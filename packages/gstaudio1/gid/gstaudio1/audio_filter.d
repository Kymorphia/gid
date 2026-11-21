/// Module for [AudioFilter] class
module gid.gstaudio1.audio_filter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.base_transform;

/**
    #GstAudioFilter is a #GstBaseTransform<!-- -->-derived base class for simple audio
    filters, ie. those that output the same format that they get as input.
    
    #GstAudioFilter will parse the input format for you (with error checking)
    before calling your setup function. Also, elements deriving from
    #GstAudioFilter may use [gid.gstaudio1.audio_filter_class.AudioFilterClass.addPadTemplates] from
    their class_init function to easily configure the set of caps/formats that
    the element is able to handle.
    
    Derived classes should override the #GstAudioFilterClass.setup() and
    #GstBaseTransformClass.transform_ip() and/or
    #GstBaseTransformClass.transform()
    virtual functions in their class_init function.
*/
class AudioFilter : gid.gstbase1.base_transform.BaseTransform
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
    return cast(void function())gst_audio_filter_get_type != &gidSymbolNotFound ? gst_audio_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_filter.AudioFilter]
      Returns: New builder object
  */
  static AudioFilterGidBuilder builder() nothrow
  {
    return new AudioFilterGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_filter.AudioFilter]
class AudioFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_filter.AudioFilter]
final class AudioFilterGidBuilder : AudioFilterGidBuilderImpl!AudioFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioFilter build() nothrow
  {
    return new AudioFilter(cast(void*)createGObject(AudioFilter._getGType), Yes.Take);
  }
}
