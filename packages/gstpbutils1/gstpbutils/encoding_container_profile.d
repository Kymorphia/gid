/// Module for [EncodingContainerProfile] class
module gstpbutils.encoding_container_profile;

import gid.gid;
import gst.caps;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.encoding_profile;
import gstpbutils.types;

/**
    Encoding profiles for containers. Keeps track of a list of #GstEncodingProfile
*/
class EncodingContainerProfile : gstpbutils.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_container_profile_get_type != &gidSymbolNotFound ? gst_encoding_container_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingContainerProfile self()
  {
    return this;
  }

  /**
      Creates a new #GstEncodingContainerProfile.
  
      Params:
        name = The name of the container profile, can be null
        description = The description of the container profile,
              can be null
        format = The format to use for this profile
        preset = The preset to use for this profile.
      Returns: The newly created #GstEncodingContainerProfile.
  */
  this(string name, string description, gst.caps.Caps format, string preset = null)
  {
    GstEncodingContainerProfile* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _preset = preset.toCString(No.Alloc);
    _cretval = gst_encoding_container_profile_new(_name, _description, format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset);
    this(_cretval, Yes.Take);
  }

  /**
      Add a #GstEncodingProfile to the list of profiles handled by container.
      
      No copy of profile will be made, if you wish to use it elsewhere after this
      method you should increment its reference count.
  
      Params:
        profile = the #GstEncodingProfile to add.
      Returns: true if the stream was properly added, else false.
  */
  bool addProfile(gstpbutils.encoding_profile.EncodingProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_container_profile_add_profile(cast(GstEncodingContainerProfile*)this._cPtr, profile ? cast(GstEncodingProfile*)profile._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Checks if container contains a #GstEncodingProfile identical to
      profile.
  
      Params:
        profile = a #GstEncodingProfile
      Returns: true if container contains a #GstEncodingProfile identical
        to profile, else false.
  */
  bool containsProfile(gstpbutils.encoding_profile.EncodingProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_container_profile_contains_profile(cast(GstEncodingContainerProfile*)this._cPtr, profile ? cast(GstEncodingProfile*)profile._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gstpbutils.encoding_profile.EncodingProfile[] getProfiles()
  {
    const(GList)* _cretval;
    _cretval = gst_encoding_container_profile_get_profiles(cast(GstEncodingContainerProfile*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.encoding_profile.EncodingProfile, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
