/// Module for [AudioFilter] class
module gstaudio.audio_filter;

import gid.gid;
import gobject.gid_builder;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.base_transform;

/**
    #GstAudioFilter is a #GstBaseTransform<!-- -->-derived base class for simple audio
    filters, ie. those that output the same format that they get as input.
    
    #GstAudioFilter will parse the input format for you (with error checking)
    before calling your setup function. Also, elements deriving from
    #GstAudioFilter may use [gstaudio.audio_filter_class.AudioFilterClass.addPadTemplates] from
    their class_init function to easily configure the set of caps/formats that
    the element is able to handle.
    
    Derived classes should override the #GstAudioFilterClass.setup() and
    #GstBaseTransformClass.transform_ip() and/or
    #GstBaseTransformClass.transform()
    virtual functions in their class_init function.
*/
class AudioFilter : gstbase.base_transform.BaseTransform
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
    return cast(void function())gst_audio_filter_get_type != &gidSymbolNotFound ? gst_audio_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioFilter self()
  {
    return this;
  }

  /**
  Get builder for [gstaudio.audio_filter.AudioFilter]
  Returns: New builder object
  */
  static AudioFilterGidBuilder builder()
  {
    return new AudioFilterGidBuilder;
  }
}

class AudioFilterGidBuilderImpl(T) : gstbase.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gstaudio.audio_filter.AudioFilter]
final class AudioFilterGidBuilder : AudioFilterGidBuilderImpl!AudioFilterGidBuilder
{
  AudioFilter build()
  {
    return new AudioFilter(cast(void*)createGObject(AudioFilter._getGType), No.Take);
  }
}
