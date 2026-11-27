/// Module for [EncodingAudioProfile] class
module gid.gstpbutils1.encoding_audio_profile;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.caps;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.encoding_profile;
import gid.gstpbutils1.types;

/**
    Variant of #GstEncodingProfile for audio streams.
*/
@gidGir("EncodingAudioProfile", "EncodingAudioProfileClass")
class EncodingAudioProfile : gid.gstpbutils1.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_audio_profile_get_type != &gidSymbolNotFound ? gst_encoding_audio_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstEncodingAudioProfile";
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingAudioProfile self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.encoding_audio_profile.EncodingAudioProfile]
      Returns: New builder object
  */
  static EncodingAudioProfileGidBuilder builder() nothrow
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
          NULL. See [gid.gstpbutils1.encoding_profile.EncodingProfile.getRestriction] for more details.
        presence = the number of time this stream must be used. 0 means any number of
           times (including never)
      Returns: the newly created #GstEncodingAudioProfile.
  */
  this(gid.gst1.caps.Caps format, string preset, gid.gst1.caps.Caps restriction, uint presence) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstEncodingAudioProfile* _cretval;
      const(char)* _preset = preset.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_encoding_audio_profile_new(format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset, restriction ? cast(GstCaps*)restriction._cPtr(No.Dup) : null, presence);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.encoding_audio_profile.EncodingAudioProfile]
class EncodingAudioProfileGidBuilderImpl(T) : gid.gstpbutils1.encoding_profile.EncodingProfileGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.encoding_audio_profile.EncodingAudioProfile]
final class EncodingAudioProfileGidBuilder : EncodingAudioProfileGidBuilderImpl!EncodingAudioProfileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EncodingAudioProfile build() nothrow
  {
    return new EncodingAudioProfile(cast(void*)createGObject(EncodingAudioProfile._getGType), Yes.Take);
  }
}
