/// Module for [EncodingAudioProfile] class
module gstpbutils.encoding_audio_profile;

import gid.gid;
import gobject.gid_builder;
import gst.caps;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.encoding_profile;
import gstpbutils.types;

/**
    Variant of #GstEncodingProfile for audio streams.
*/
class EncodingAudioProfile : gstpbutils.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_audio_profile_get_type != &gidSymbolNotFound ? gst_encoding_audio_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingAudioProfile self()
  {
    return this;
  }

  /**
      Get builder for [gstpbutils.encoding_audio_profile.EncodingAudioProfile]
      Returns: New builder object
  */
  static EncodingAudioProfileGidBuilder builder()
  {
    return new EncodingAudioProfileGidBuilder;
  }

  /**
      Creates a new #GstEncodingAudioProfile
      
      All provided allocatable arguments will be internally copied, so can be
      safely freed/unreferenced after calling this method.
  
      Params:
        format = the #GstCaps
        preset = the preset(s) to use on the encoder, can be null
        restriction = the #GstCaps used to restrict the input to the encoder, can be
          NULL. See [gstpbutils.encoding_profile.EncodingProfile.getRestriction] for more details.
        presence = the number of time this stream must be used. 0 means any number of
           times (including never)
      Returns: the newly created #GstEncodingAudioProfile.
  */
  this(gst.caps.Caps format, string preset, gst.caps.Caps restriction, uint presence)
  {
    GstEncodingAudioProfile* _cretval;
    const(char)* _preset = preset.toCString(No.Alloc);
    _cretval = gst_encoding_audio_profile_new(format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset, restriction ? cast(GstCaps*)restriction._cPtr(No.Dup) : null, presence);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstpbutils.encoding_audio_profile.EncodingAudioProfile]
class EncodingAudioProfileGidBuilderImpl(T) : gstpbutils.encoding_profile.EncodingProfileGidBuilderImpl!T
{
}

/// Fluent builder for [gstpbutils.encoding_audio_profile.EncodingAudioProfile]
final class EncodingAudioProfileGidBuilder : EncodingAudioProfileGidBuilderImpl!EncodingAudioProfileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EncodingAudioProfile build()
  {
    return new EncodingAudioProfile(cast(void*)createGObject(EncodingAudioProfile._getGType), Yes.Take);
  }
}
