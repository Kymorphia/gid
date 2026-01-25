/// Module for [EncodingProfile] class
module gstpbutils.encoding_profile;

import gid.gid;
import gobject.object;
import gst.caps;
import gst.structure;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_info;
import gstpbutils.types;

/**
    The opaque base class object for all encoding profiles. This contains generic
    information like name, description, format and preset.
*/
class EncodingProfile : gobject.object.ObjectWrap
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
    return cast(void function())gst_encoding_profile_get_type != &gidSymbolNotFound ? gst_encoding_profile_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EncodingProfile self()
  {
    return this;
  }

  /**
      Get `elementProperties` property.
      Returns: A #GstStructure defining the properties to be set to the element
        the profile represents.
        
        For example for `av1enc`:
        
        ```
        element-properties,row-mt=true, end-usage=vbr
        ```
  */
  @property gst.structure.Structure elementProperties()
  {
    return getElementProperties();
  }

  /**
      Set `elementProperties` property.
      Params:
        propval = A #GstStructure defining the properties to be set to the element
          the profile represents.
          
          For example for `av1enc`:
          
          ```
          element-properties,row-mt=true, end-usage=vbr
          ```
  */
  @property void elementProperties(gst.structure.Structure propval)
  {
    return setElementProperties(propval);
  }

  /** */
  @property gst.caps.Caps restrictionCaps()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.caps.Caps)("restriction-caps");
  }

  /** */
  @property void restrictionCaps(gst.caps.Caps propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.caps.Caps)("restriction-caps", propval);
  }

  /**
      Find the #GstEncodingProfile with the specified name and category.
  
      Params:
        targetname = The name of the target
        profilename = The name of the profile, if null
          provided, it will default to the encoding profile called `default`.
        category = The target category. Can be null
      Returns: The matching #GstEncodingProfile or null.
  */
  static gstpbutils.encoding_profile.EncodingProfile find(string targetname, string profilename = null, string category = null)
  {
    GstEncodingProfile* _cretval;
    const(char)* _targetname = targetname.toCString(No.Alloc);
    const(char)* _profilename = profilename.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gst_encoding_profile_find(_targetname, _profilename, _category);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_profile.EncodingProfile)(cast(GstEncodingProfile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GstEncodingProfile matching the formats from the given
      #GstDiscovererInfo. Streams other than audio or video (eg,
      subtitles), are currently ignored.
  
      Params:
        info = The #GstDiscovererInfo to read from
      Returns: The new #GstEncodingProfile or null.
  */
  static gstpbutils.encoding_profile.EncodingProfile fromDiscoverer(gstpbutils.discoverer_info.DiscovererInfo info)
  {
    GstEncodingProfile* _cretval;
    _cretval = gst_encoding_profile_from_discoverer(info ? cast(GstDiscovererInfo*)info._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_profile.EncodingProfile)(cast(GstEncodingProfile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Makes a deep copy of self
      Returns: The copy of self
  */
  gstpbutils.encoding_profile.EncodingProfile copy()
  {
    GstEncodingProfile* _cretval;
    _cretval = gst_encoding_profile_copy(cast(GstEncodingProfile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.encoding_profile.EncodingProfile)(cast(GstEncodingProfile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get whether the format that has been negotiated in at some point can be renegotiated
      later during the encoding.
      Returns: 
  */
  bool getAllowDynamicOutput()
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_profile_get_allow_dynamic_output(cast(GstEncodingProfile*)this._cPtr);
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_description(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gst.structure.Structure getElementProperties()
  {
    GstStructure* _cretval;
    _cretval = gst_encoding_profile_get_element_properties(cast(GstEncodingProfile*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string getFileExtension()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_file_extension(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gst.caps.Caps getFormat()
  {
    GstCaps* _cretval;
    _cretval = gst_encoding_profile_get_format(cast(GstEncodingProfile*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the full output caps that this profile will be able to consume.
      Returns: The full caps the given profile can consume. Call
        gst_caps_unref() when you are done with the caps.
  */
  gst.caps.Caps getInputCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_encoding_profile_get_input_caps(cast(GstEncodingProfile*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_name(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  uint getPresence()
  {
    uint _retval;
    _retval = gst_encoding_profile_get_presence(cast(GstEncodingProfile*)this._cPtr);
    return _retval;
  }

  /** */
  string getPreset()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_preset(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getPresetName()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_preset_name(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gst.caps.Caps getRestriction()
  {
    GstCaps* _cretval;
    _cretval = gst_encoding_profile_get_restriction(cast(GstEncodingProfile*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  bool getSingleSegment()
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_profile_get_single_segment(cast(GstEncodingProfile*)this._cPtr);
    return _retval;
  }

  /** */
  string getTypeNick()
  {
    const(char)* _cretval;
    _cretval = gst_encoding_profile_get_type_nick(cast(GstEncodingProfile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool isEnabled()
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_profile_is_enabled(cast(GstEncodingProfile*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the two #GstEncodingProfile are equal
  
      Params:
        b = a #GstEncodingProfile
      Returns: true if `a` and `b` are equal, else false.
  */
  bool isEqual(gstpbutils.encoding_profile.EncodingProfile b)
  {
    bool _retval;
    _retval = cast(bool)gst_encoding_profile_is_equal(cast(GstEncodingProfile*)this._cPtr, b ? cast(GstEncodingProfile*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets whether the format that has been negotiated in at some point can be renegotiated
      later during the encoding.
  
      Params:
        allowDynamicOutput = Whether the format that has been negotiated first can be renegotiated
          during the encoding
  */
  void setAllowDynamicOutput(bool allowDynamicOutput)
  {
    gst_encoding_profile_set_allow_dynamic_output(cast(GstEncodingProfile*)this._cPtr, allowDynamicOutput);
  }

  /**
      Set description as the given description for the profile. A copy of
      description will be made internally.
  
      Params:
        description = the description to set on the profile
  */
  void setDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
    gst_encoding_profile_set_description(cast(GstEncodingProfile*)this._cPtr, _description);
  }

  /**
      This allows setting the muxing/encoding element properties.
      
      **Set properties generically**
      
      ``` properties
       [element-properties, boolean-prop=true, string-prop="hi"]
      ```
      
      **Mapping properties with well known element factories**
      
      ``` properties
      element-properties-map, map = {
           [openh264enc, gop-size=32, ],
           [x264enc, key-int-max=32, tune=zerolatency],
       }
      ```
  
      Params:
        elementProperties = A #GstStructure defining the properties
          to be set to the element the profile represents.
  */
  void setElementProperties(gst.structure.Structure elementProperties)
  {
    gst_encoding_profile_set_element_properties(cast(GstEncodingProfile*)this._cPtr, elementProperties ? cast(GstStructure*)elementProperties._cPtr(Yes.Dup) : null);
  }

  /**
      Set whether the profile should be used or not.
  
      Params:
        enabled = false to disable profile, true to enable it
  */
  void setEnabled(bool enabled)
  {
    gst_encoding_profile_set_enabled(cast(GstEncodingProfile*)this._cPtr, enabled);
  }

  /**
      Sets the media format used in the profile.
  
      Params:
        format = the media format to use in the profile.
  */
  void setFormat(gst.caps.Caps format)
  {
    gst_encoding_profile_set_format(cast(GstEncodingProfile*)this._cPtr, format ? cast(GstCaps*)format._cPtr(No.Dup) : null);
  }

  /**
      Set name as the given name for the profile. A copy of name will be made
      internally.
  
      Params:
        name = the name to set on the profile
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_encoding_profile_set_name(cast(GstEncodingProfile*)this._cPtr, _name);
  }

  /**
      Set the number of time the profile is used in its parent
      container profile. If 0, it is not a mandatory stream
  
      Params:
        presence = the number of time the profile can be used
  */
  void setPresence(uint presence)
  {
    gst_encoding_profile_set_presence(cast(GstEncodingProfile*)this._cPtr, presence);
  }

  /**
      Sets the name of the #GstElement that implements the #GstPreset interface
      to use for the profile.
      This is the name that has been set when saving the preset.
  
      Params:
        preset = the element preset to use
  */
  void setPreset(string preset = null)
  {
    const(char)* _preset = preset.toCString(No.Alloc);
    gst_encoding_profile_set_preset(cast(GstEncodingProfile*)this._cPtr, _preset);
  }

  /**
      Sets the name of the #GstPreset's factory to be used in the profile.
  
      Params:
        presetName = The name of the preset to use in this profile.
  */
  void setPresetName(string presetName = null)
  {
    const(char)* _presetName = presetName.toCString(No.Alloc);
    gst_encoding_profile_set_preset_name(cast(GstEncodingProfile*)this._cPtr, _presetName);
  }

  /**
      Set the restriction #GstCaps to apply before the encoder
      that will be used in the profile. See [gstpbutils.encoding_profile.EncodingProfile.getRestriction]
      for more about restrictions. Does not apply to #GstEncodingContainerProfile.
  
      Params:
        restriction = the restriction to apply
  */
  void setRestriction(gst.caps.Caps restriction = null)
  {
    gst_encoding_profile_set_restriction(cast(GstEncodingProfile*)this._cPtr, restriction ? cast(GstCaps*)restriction._cPtr(Yes.Dup) : null);
  }

  /**
      If using a single segment, buffers will be retimestamped and segments will be
      eat so as to appear as one segment.
      
      > *NOTE*: Single segment is not property supported when using
      > #encodebin:avoid-reencoding
  
      Params:
        singleSegment = #TRUE if the stream represented by profile should use a
          single segment before the encoder, #FALSE otherwise.
  */
  void setSingleSegment(bool singleSegment)
  {
    gst_encoding_profile_set_single_segment(cast(GstEncodingProfile*)this._cPtr, singleSegment);
  }
}
