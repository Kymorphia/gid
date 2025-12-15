/// Module for [EncodingVideoProfile] class
module gstpbutils.encoding_video_profile;

import gid.gid;
import gst.caps;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.encoding_profile;
import gstpbutils.types;

/**
    Variant of #GstEncodingProfile for video streams, allows specifying the @pass.
*/
class EncodingVideoProfile : gstpbutils.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_video_profile_get_type != &gidSymbolNotFound ? gst_encoding_video_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingVideoProfile self()
  {
    return this;
  }

  /**
      Creates a new #GstEncodingVideoProfile
      
      All provided allocatable arguments will be internally copied, so can be
      safely freed/unreferenced after calling this method.
      
      If you wish to control the pass number (in case of multi-pass scenarios),
      please refer to the [gstpbutils.encoding_video_profile.EncodingVideoProfile.setPass] documentation.
      
      If you wish to use/force a constant framerate please refer to the
      [gstpbutils.encoding_video_profile.EncodingVideoProfile.setVariableframerate] documentation.
  
      Params:
        format = the #GstCaps
        preset = the preset(s) to use on the encoder, can be null
        restriction = the #GstCaps used to restrict the input to the encoder, can be
          NULL. See [gstpbutils.encoding_profile.EncodingProfile.getRestriction] for more details.
        presence = the number of time this stream must be used. 0 means any number of
           times (including never)
      Returns: the newly created #GstEncodingVideoProfile.
  */
  this(gst.caps.Caps format, string preset, gst.caps.Caps restriction, uint presence)
  {
    GstEncodingVideoProfile* _cretval;
    const(char)* _preset = preset.toCString(No.Alloc);
    _cretval = gst_encoding_video_profile_new(format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset, restriction ? cast(GstCaps*)restriction._cPtr(No.Dup) : null, presence);
    this(_cretval, Yes.Take);
  }

  /**
      Get the pass number if this is part of a multi-pass profile.
      Returns: The pass number. Starts at 1 for multi-pass. 0 if this is
        not a multi-pass profile
  */
  uint getPass()
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
  bool getVariableframerate()
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
  void setPass(uint pass)
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
  void setVariableframerate(bool variableframerate)
  {
    gst_encoding_video_profile_set_variableframerate(cast(GstEncodingVideoProfile*)this._cPtr, variableframerate);
  }
}
