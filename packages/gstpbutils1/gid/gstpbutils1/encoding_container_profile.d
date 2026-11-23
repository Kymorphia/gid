/// Module for [EncodingContainerProfile] class
module gid.gstpbutils1.encoding_container_profile;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.caps;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.encoding_profile;
import gid.gstpbutils1.types;

/**
    Encoding profiles for containers. Keeps track of a list of #GstEncodingProfile
*/
class EncodingContainerProfile : gid.gstpbutils1.encoding_profile.EncodingProfile
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
    return cast(void function())gst_encoding_container_profile_get_type != &gidSymbolNotFound ? gst_encoding_container_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstEncodingContainerProfile";
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingContainerProfile self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.encoding_container_profile.EncodingContainerProfile]
      Returns: New builder object
  */
  static EncodingContainerProfileGidBuilder builder() nothrow
  {
    return new EncodingContainerProfileGidBuilder;
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
  this(string name, string description, gid.gst1.caps.Caps format, string preset = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstEncodingContainerProfile* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _preset = preset.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_encoding_container_profile_new(_name, _description, format ? cast(GstCaps*)format._cPtr(No.Dup) : null, _preset);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Add a #GstEncodingProfile to the list of profiles handled by container.
      
      No copy of profile will be made, if you wish to use it elsewhere after this
      method you should increment its reference count.
  
      Params:
        profile = the #GstEncodingProfile to add.
      Returns: true if the stream was properly added, else false.
  */
  bool addProfile(gid.gstpbutils1.encoding_profile.EncodingProfile profile) nothrow
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
  bool containsProfile(gid.gstpbutils1.encoding_profile.EncodingProfile profile) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_container_profile_contains_profile(cast(GstEncodingContainerProfile*)this._cPtr, profile ? cast(GstEncodingProfile*)profile._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gid.gstpbutils1.encoding_profile.EncodingProfile[] getProfiles() nothrow
  {
    const(GList)* _cretval;
    _cretval = gst_encoding_container_profile_get_profiles(cast(GstEncodingContainerProfile*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.encoding_profile.EncodingProfile, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.encoding_container_profile.EncodingContainerProfile]
class EncodingContainerProfileGidBuilderImpl(T) : gid.gstpbutils1.encoding_profile.EncodingProfileGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.encoding_container_profile.EncodingContainerProfile]
final class EncodingContainerProfileGidBuilder : EncodingContainerProfileGidBuilderImpl!EncodingContainerProfileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EncodingContainerProfile build() nothrow
  {
    return new EncodingContainerProfile(cast(void*)createGObject(EncodingContainerProfile._getGType), Yes.Take);
  }
}
