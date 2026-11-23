/// Module for [EncodingVideoProfile] class
module gid.gstpbutils1.encoding_video_profile;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.caps;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.encoding_profile;
import gid.gstpbutils1.types;

/**
    Variant of #GstEncodingProfile for video streams, allows specifying the @pass.
*/
class EncodingVideoProfile : gid.gstpbutils1.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_video_profile_get_type != &gidSymbolNotFound ? gst_encoding_video_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstEncodingVideoProfile";
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingVideoProfile self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.encoding_video_profile.EncodingVideoProfile]
      Returns: New builder object
  */
  static EncodingVideoProfileGidBuilder builder() nothrow
  {
    return new EncodingVideoProfileGidBuilder;
  }

  /**
      Creates a new #GstEncodingVideoProfile
      
      All provided allocatable arguments will be internally copied, so can be
      safely freed/unreferenced after calling this method.
      
      If you wish to control the pass number (in case of multi-pass scenarios),
      please refer to the [gid.gstpbutils1.encoding_video_profile.EncodingVideoProfile.setPass] documentation.
      
      If you wish to use/force a constant framerate please refer to the
      [gid.gstpbutils1.encoding_video_profile.EncodingVideoProfile.setVariableframerate] documentation.
  
      Params:
        format = the #GstCaps
        preset = the preset(s) to use on the encoder, can be null
        restriction = the #GstCaps used to restrict the input to the encoder, can be
          NULL. See [gid.gstpbutils1.encoding_profile.EncodingProfile.getRestriction] for more details.
        presence = the number of time this stream must be used. 0 means any number of
           times (including never)
      Returns: the newly created #GstEncodingVideoProfile.
  */
  this(gid.gst1.caps.Caps format, string preset, gid.gst1.caps.Caps restriction, uint presence) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstEncodingVideoProfile* _cretval;
      const(char)* _preset = preset.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_encoding_video_profile_new(format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset, restriction ? cast(GstCaps*)restriction._cPtr(No.Dup) : null, presence);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Get the pass number if this is part of a multi-pass profile.
      Returns: The pass number. Starts at 1 for multi-pass. 0 if this is
        not a multi-pass profile
  */
  uint getPass() nothrow
  {
    uint _retval;
    _retval = gst_encoding_video_profile_get_pass(cast(GstEncodingVideoProfile*)this._cPtr);
    return _retval;
  }

  /**
      > *NOTE*: Fixed framerate won't be enforced when #encodebin:avoid-reencoding
      > is set.
      Returns: Whether non-constant video framerate is allowed for encoding.
  */
  bool getVariableframerate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_video_profile_get_variableframerate(cast(GstEncodingVideoProfile*)this._cPtr);
    return _retval;
  }

  /**
      Sets the pass number of this video profile. The first pass profile should have
      this value set to 1. If this video profile isn't part of a multi-pass profile,
      you may set it to 0 (the default value).
  
      Params:
        pass = the pass number for this profile
  */
  void setPass(uint pass) nothrow
  {
    gst_encoding_video_profile_set_pass(cast(GstEncodingVideoProfile*)this._cPtr, pass);
  }

  /**
      If set to true, then the incoming stream will be allowed to have non-constant
      framerate. If set to false (default value), then the incoming stream will
      be normalized by dropping/duplicating frames in order to produce a
      constance framerate.
  
      Params:
        variableframerate = a boolean
  */
  void setVariableframerate(bool variableframerate) nothrow
  {
    gst_encoding_video_profile_set_variableframerate(cast(GstEncodingVideoProfile*)this._cPtr, variableframerate);
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.encoding_video_profile.EncodingVideoProfile]
class EncodingVideoProfileGidBuilderImpl(T) : gid.gstpbutils1.encoding_profile.EncodingProfileGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.encoding_video_profile.EncodingVideoProfile]
final class EncodingVideoProfileGidBuilder : EncodingVideoProfileGidBuilderImpl!EncodingVideoProfileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EncodingVideoProfile build() nothrow
  {
    return new EncodingVideoProfile(cast(void*)createGObject(EncodingVideoProfile._getGType), Yes.Take);
  }
}
