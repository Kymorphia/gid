/// Global functions for gstpbutils1 library
module gstpbutils.global;

import gid.gid;
import gst.buffer;
import gst.caps;
import gst.element;
import gst.message;
import gst.tag_list;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.encoding_target;
import gstpbutils.install_plugins_context;
import gstpbutils.types;


/**
    Sets the level and profile on caps if it can be determined from
    audio_config. See [gstpbutils.global.codecUtilsAacGetLevel] and
    [gstpbutils.global.codecUtilsAacGetProfile] for more details on the parameters.
    caps must be audio/mpeg caps with an "mpegversion" field of either 2 or 4.
    If mpegversion is 4, the "base-profile" field is also set in caps.

    Params:
      caps = the #GstCaps to which level and profile fields are to be added
      audioConfig = a pointer to the AudioSpecificConfig
                       as specified in the Elementary Stream Descriptor (esds)
                       in ISO/IEC 14496-1. (See below for more details)
    Returns: true if the level and profile could be set, false otherwise.
*/
bool codecUtilsAacCapsSetLevelAndProfile(gst.caps.Caps caps, ubyte[] audioConfig)
{
  bool _retval;
  uint _len;
  if (audioConfig)
    _len = cast(uint)audioConfig.length;

  auto _audioConfig = cast(const(ubyte)*)audioConfig.ptr;
  _retval = cast(bool)gst_codec_utils_aac_caps_set_level_and_profile(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, _audioConfig, _len);
  return _retval;
}

/**
    Returns the channels of the given AAC stream.

    Params:
      audioConfig = a pointer to the AudioSpecificConfig
                       as specified in the Elementary Stream Descriptor (esds)
                       in ISO/IEC 14496-1.
    Returns: The channels or 0 if the channel could not be determined.
*/
uint codecUtilsAacGetChannels(ubyte[] audioConfig)
{
  uint _retval;
  uint _len;
  if (audioConfig)
    _len = cast(uint)audioConfig.length;

  auto _audioConfig = cast(const(ubyte)*)audioConfig.ptr;
  _retval = gst_codec_utils_aac_get_channels(_audioConfig, _len);
  return _retval;
}

/**
    Translates the sample rate to the index corresponding to it in AAC spec.

    Params:
      rate = Sample rate
    Returns: The AAC index for this sample rate, -1 if the rate is not a
      valid AAC sample rate.
*/
int codecUtilsAacGetIndexFromSampleRate(uint rate)
{
  int _retval;
  _retval = gst_codec_utils_aac_get_index_from_sample_rate(rate);
  return _retval;
}

/**
    Determines the level of a stream as defined in ISO/IEC 14496-3. For AAC LC
    streams, the constraints from the AAC audio profile are applied. For AAC
    Main, LTP, SSR and others, the Main profile is used.
    
    The audio_config parameter follows the following format, starting from the
    most significant bit of the first byte:
    
      $(LIST
          * Bit 0:4 contains the AudioObjectType (if this is 0x5, then the
            real AudioObjectType is carried after the rate and channel data)
          * Bit 5:8 contains the sample frequency index (if this is 0xf, then the
            next 24 bits define the actual sample frequency, and subsequent
            fields are appropriately shifted).
          * Bit 9:12 contains the channel configuration
      )

    Params:
      audioConfig = a pointer to the AudioSpecificConfig
                       as specified in the Elementary Stream Descriptor (esds)
                       in ISO/IEC 14496-1.
    Returns: The level as a const string and null if the level could not be
      determined.
*/
string codecUtilsAacGetLevel(ubyte[] audioConfig)
{
  const(char)* _cretval;
  uint _len;
  if (audioConfig)
    _len = cast(uint)audioConfig.length;

  auto _audioConfig = cast(const(ubyte)*)audioConfig.ptr;
  _cretval = gst_codec_utils_aac_get_level(_audioConfig, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns the profile of the given AAC stream as a string. The profile is
    normally determined using the AudioObjectType field which is in the first
    5 bits of audio_config

    Params:
      audioConfig = a pointer to the AudioSpecificConfig
                       as specified in the Elementary Stream Descriptor (esds)
                       in ISO/IEC 14496-1.
    Returns: The profile as a const string and null if the profile could not be
      determined.
*/
string codecUtilsAacGetProfile(ubyte[] audioConfig)
{
  const(char)* _cretval;
  uint _len;
  if (audioConfig)
    _len = cast(uint)audioConfig.length;

  auto _audioConfig = cast(const(ubyte)*)audioConfig.ptr;
  _cretval = gst_codec_utils_aac_get_profile(_audioConfig, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Translates the sample rate index found in AAC headers to the actual sample
    rate.

    Params:
      audioConfig = a pointer to the AudioSpecificConfig
                       as specified in the Elementary Stream Descriptor (esds)
                       in ISO/IEC 14496-1.
    Returns: The sample rate if sr_idx is valid, 0 otherwise.
*/
uint codecUtilsAacGetSampleRate(ubyte[] audioConfig)
{
  uint _retval;
  uint _len;
  if (audioConfig)
    _len = cast(uint)audioConfig.length;

  auto _audioConfig = cast(const(ubyte)*)audioConfig.ptr;
  _retval = gst_codec_utils_aac_get_sample_rate(_audioConfig, _len);
  return _retval;
}

/**
    Translates the sample rate index found in AAC headers to the actual sample
    rate.

    Params:
      srIdx = Sample rate index as from the AudioSpecificConfig (MPEG-4
                 container) or ADTS frame header
    Returns: The sample rate if sr_idx is valid, 0 otherwise.
*/
uint codecUtilsAacGetSampleRateFromIndex(uint srIdx)
{
  uint _retval;
  _retval = gst_codec_utils_aac_get_sample_rate_from_index(srIdx);
  return _retval;
}

/**
    Converts a RFC 6381 compatible codec string to #GstCaps. More than one codec
    string can be present (separated by `,`).
    
    Registered codecs can be found at http://mp4ra.org/#/codecs

    Params:
      codecsField = A mime codec string field
    Returns: The corresponding #GstCaps or null
*/
gst.caps.Caps codecUtilsCapsFromMimeCodec(string codecsField)
{
  GstCaps* _cretval;
  const(char)* _codecsField = codecsField.toCString(No.Alloc);
  _cretval = gst_codec_utils_caps_from_mime_codec(_codecsField);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Converts caps to a RFC 6381 compatible codec string if possible.
    
    Useful for providing the 'codecs' field inside the 'Content-Type' HTTP
    header for containerized formats, such as mp4 or matroska.
    
    Registered codecs can be found at http://mp4ra.org/#/codecs

    Params:
      caps = A #GstCaps to convert to mime codec
    Returns: a RFC 6381 compatible codec string or null
*/
string codecUtilsCapsGetMimeCodec(gst.caps.Caps caps)
{
  char* _cretval;
  _cretval = gst_codec_utils_caps_get_mime_codec(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Sets the level and profile in caps if it can be determined from sps. See
    [gstpbutils.global.codecUtilsH264GetLevel] and [gstpbutils.global.codecUtilsH264GetProfile]
    for more details on the parameters.

    Params:
      caps = the #GstCaps to which the level and profile are to be added
      sps = Pointer to the sequence parameter set for the stream.
    Returns: true if the level and profile could be set, false otherwise.
*/
bool codecUtilsH264CapsSetLevelAndProfile(gst.caps.Caps caps, ubyte[] sps)
{
  bool _retval;
  uint _len;
  if (sps)
    _len = cast(uint)sps.length;

  auto _sps = cast(const(ubyte)*)sps.ptr;
  _retval = cast(bool)gst_codec_utils_h264_caps_set_level_and_profile(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, _sps, _len);
  return _retval;
}

/**
    Converts the level indication (level_idc) in the stream's
    sequence parameter set into a string. The SPS is expected to have the
    same format as for [gstpbutils.global.codecUtilsH264GetProfile].

    Params:
      sps = Pointer to the sequence parameter set for the stream.
    Returns: The level as a const string, or null if there is an error.
*/
string codecUtilsH264GetLevel(ubyte[] sps)
{
  const(char)* _cretval;
  uint _len;
  if (sps)
    _len = cast(uint)sps.length;

  auto _sps = cast(const(ubyte)*)sps.ptr;
  _cretval = gst_codec_utils_h264_get_level(_sps, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Transform a level string from the caps into the level_idc

    Params:
      level = A level string from caps
    Returns: the level_idc or 0 if the level is unknown
*/
ubyte codecUtilsH264GetLevelIdc(string level)
{
  ubyte _retval;
  const(char)* _level = level.toCString(No.Alloc);
  _retval = gst_codec_utils_h264_get_level_idc(_level);
  return _retval;
}

/**
    Converts the profile indication (profile_idc) in the stream's
    sequence parameter set into a string. The SPS is expected to have the
    following format, as defined in the H.264 specification. The SPS is viewed
    as a bitstream here, with bit 0 being the most significant bit of the first
    byte.
    
    $(LIST
      * Bit 0:7   - Profile indication
      * Bit 8     - constraint_set0_flag
      * Bit 9     - constraint_set1_flag
      * Bit 10    - constraint_set2_flag
      * Bit 11    - constraint_set3_flag
      * Bit 12    - constraint_set3_flag
      * Bit 13:15 - Reserved
      * Bit 16:24 - Level indication
    )

    Params:
      sps = Pointer to the sequence parameter set for the stream.
    Returns: The profile as a const string, or null if there is an error.
*/
string codecUtilsH264GetProfile(ubyte[] sps)
{
  const(char)* _cretval;
  uint _len;
  if (sps)
    _len = cast(uint)sps.length;

  auto _sps = cast(const(ubyte)*)sps.ptr;
  _cretval = gst_codec_utils_h264_get_profile(_sps, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Parses profile, flags, and level from a H264 AVCC extradata/sequence_header.
    These are most commonly retrieved from a video/x-h264 caps with a codec_data
    buffer.
    
    The format of H264 AVCC extradata/sequence_header is documented in the
    ITU-T H.264 specification section 7.3.2.1.1 as well as in ISO/IEC 14496-15
    section 5.3.3.1.2.

    Params:
      codecData = H264 AVCC extradata
      profile = return location for h264 profile_idc or null
      flags = return location for h264 constraint set flags or null
      level = return location h264 level_idc or null
    Returns: true on success, false on failure
*/
bool codecUtilsH264GetProfileFlagsLevel(ubyte[] codecData, out ubyte profile, out ubyte flags, out ubyte level)
{
  bool _retval;
  uint _len;
  if (codecData)
    _len = cast(uint)codecData.length;

  auto _codecData = cast(const(ubyte)*)codecData.ptr;
  _retval = cast(bool)gst_codec_utils_h264_get_profile_flags_level(_codecData, _len, cast(ubyte*)&profile, cast(ubyte*)&flags, cast(ubyte*)&level);
  return _retval;
}

/**
    Sets the level, tier and profile in caps if it can be determined from
    profile_tier_level. See [gstpbutils.global.codecUtilsH265GetLevel],
    [gstpbutils.global.codecUtilsH265GetTier] and [gstpbutils.global.codecUtilsH265GetProfile]
    for more details on the parameters.

    Params:
      caps = the #GstCaps to which the level, tier and profile are to be added
      profileTierLevel = Pointer to the profile_tier_level
          struct
    Returns: true if the level, tier, profile could be set, false otherwise.
*/
bool codecUtilsH265CapsSetLevelTierAndProfile(gst.caps.Caps caps, ubyte[] profileTierLevel)
{
  bool _retval;
  uint _len;
  if (profileTierLevel)
    _len = cast(uint)profileTierLevel.length;

  auto _profileTierLevel = cast(const(ubyte)*)profileTierLevel.ptr;
  _retval = cast(bool)gst_codec_utils_h265_caps_set_level_tier_and_profile(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, _profileTierLevel, _len);
  return _retval;
}

/**
    Converts the level indication (general_level_idc) in the stream's
    profile_tier_level structure into a string. The profiel_tier_level is
    expected to have the same format as for [gstpbutils.global.codecUtilsH264GetProfile].

    Params:
      profileTierLevel = Pointer to the profile_tier_level
          for the stream
    Returns: The level as a const string, or null if there is an error.
*/
string codecUtilsH265GetLevel(ubyte[] profileTierLevel)
{
  const(char)* _cretval;
  uint _len;
  if (profileTierLevel)
    _len = cast(uint)profileTierLevel.length;

  auto _profileTierLevel = cast(const(ubyte)*)profileTierLevel.ptr;
  _cretval = gst_codec_utils_h265_get_level(_profileTierLevel, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Transform a level string from the caps into the level_idc

    Params:
      level = A level string from caps
    Returns: the level_idc or 0 if the level is unknown
*/
ubyte codecUtilsH265GetLevelIdc(string level)
{
  ubyte _retval;
  const(char)* _level = level.toCString(No.Alloc);
  _retval = gst_codec_utils_h265_get_level_idc(_level);
  return _retval;
}

/**
    Converts the profile indication (general_profile_idc) in the stream's
    profile_level_tier structure into a string. The profile_tier_level is
    expected to have the following format, as defined in the H.265
    specification. The profile_tier_level is viewed as a bitstream here,
    with bit 0 being the most significant bit of the first byte.
    
    $(LIST
      * Bit 0:1   - general_profile_space
      * Bit 2     - general_tier_flag
      * Bit 3:7   - general_profile_idc
      * Bit 8:39  - gernal_profile_compatibility_flags
      * Bit 40    - general_progressive_source_flag
      * Bit 41    - general_interlaced_source_flag
      * Bit 42    - general_non_packed_constraint_flag
      * Bit 43    - general_frame_only_constraint_flag
      * Bit 44:87 - See below
      * Bit 88:95 - general_level_idc
    )

    Params:
      profileTierLevel = Pointer to the profile_tier_level
          structure for the stream.
    Returns: The profile as a const string, or null if there is an error.
*/
string codecUtilsH265GetProfile(ubyte[] profileTierLevel)
{
  const(char)* _cretval;
  uint _len;
  if (profileTierLevel)
    _len = cast(uint)profileTierLevel.length;

  auto _profileTierLevel = cast(const(ubyte)*)profileTierLevel.ptr;
  _cretval = gst_codec_utils_h265_get_profile(_profileTierLevel, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts the tier indication (general_tier_flag) in the stream's
    profile_tier_level structure into a string. The profile_tier_level
    is expected to have the same format as for [gstpbutils.global.codecUtilsH264GetProfile].

    Params:
      profileTierLevel = Pointer to the profile_tier_level
          for the stream.
    Returns: The tier as a const string, or null if there is an error.
*/
string codecUtilsH265GetTier(ubyte[] profileTierLevel)
{
  const(char)* _cretval;
  uint _len;
  if (profileTierLevel)
    _len = cast(uint)profileTierLevel.length;

  auto _profileTierLevel = cast(const(ubyte)*)profileTierLevel.ptr;
  _cretval = gst_codec_utils_h265_get_tier(_profileTierLevel, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Sets the level and profile in caps if it can be determined from
    vis_obj_seq. See [gstpbutils.global.codecUtilsMpeg4videoGetLevel] and
    [gstpbutils.global.codecUtilsMpeg4videoGetProfile] for more details on the
    parameters.

    Params:
      caps = the #GstCaps to which the level and profile are to be added
      visObjSeq = Pointer to the visual object
          sequence for the stream.
    Returns: true if the level and profile could be set, false otherwise.
*/
bool codecUtilsMpeg4videoCapsSetLevelAndProfile(gst.caps.Caps caps, ubyte[] visObjSeq)
{
  bool _retval;
  uint _len;
  if (visObjSeq)
    _len = cast(uint)visObjSeq.length;

  auto _visObjSeq = cast(const(ubyte)*)visObjSeq.ptr;
  _retval = cast(bool)gst_codec_utils_mpeg4video_caps_set_level_and_profile(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, _visObjSeq, _len);
  return _retval;
}

/**
    Converts the level indication in the stream's visual object sequence into
    a string. vis_obj_seq is expected to be the data following the visual
    object sequence start code. Only the first byte
    (profile_and_level_indication) is used.

    Params:
      visObjSeq = Pointer to the visual object
          sequence for the stream.
    Returns: The level as a const string, or NULL if there is an error.
*/
string codecUtilsMpeg4videoGetLevel(ubyte[] visObjSeq)
{
  const(char)* _cretval;
  uint _len;
  if (visObjSeq)
    _len = cast(uint)visObjSeq.length;

  auto _visObjSeq = cast(const(ubyte)*)visObjSeq.ptr;
  _cretval = gst_codec_utils_mpeg4video_get_level(_visObjSeq, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts the profile indication in the stream's visual object sequence into
    a string. vis_obj_seq is expected to be the data following the visual
    object sequence start code. Only the first byte
    (profile_and_level_indication) is used.

    Params:
      visObjSeq = Pointer to the visual object
          sequence for the stream.
    Returns: The profile as a const string, or NULL if there is an error.
*/
string codecUtilsMpeg4videoGetProfile(ubyte[] visObjSeq)
{
  const(char)* _cretval;
  uint _len;
  if (visObjSeq)
    _len = cast(uint)visObjSeq.length;

  auto _visObjSeq = cast(const(ubyte)*)visObjSeq.ptr;
  _cretval = gst_codec_utils_mpeg4video_get_profile(_visObjSeq, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Creates Opus caps from the given OpusHead header and comment header
    comments.

    Params:
      header = OpusHead header
      comments = Comment header or NULL
    Returns: The #GstCaps.
*/
gst.caps.Caps codecUtilsOpusCreateCapsFromHeader(gst.buffer.Buffer header, gst.buffer.Buffer comments = null)
{
  GstCaps* _cretval;
  _cretval = gst_codec_utils_opus_create_caps_from_header(header ? cast(GstBuffer*)header._cPtr(No.Dup) : null, comments ? cast(GstBuffer*)comments._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    List all available #GstEncodingTarget for the specified category, or all categories
    if categoryname is null.

    Params:
      categoryname = The category, for ex: #GST_ENCODING_CATEGORY_DEVICE.
        Can be null.
    Returns: The list of #GstEncodingTarget
*/
gstpbutils.encoding_target.EncodingTarget[] encodingListAllTargets(string categoryname = null)
{
  GList* _cretval;
  const(char)* _categoryname = categoryname.toCString(No.Alloc);
  _cretval = gst_encoding_list_all_targets(_categoryname);
  auto _retval = gListToD!(gstpbutils.encoding_target.EncodingTarget, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Lists all #GstEncodingTarget categories present on disk.
    Returns: A list
      of #GstEncodingTarget categories.
*/
string[] encodingListAvailableCategories()
{
  GList* _cretval;
  _cretval = gst_encoding_list_available_categories();
  auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Requests plugin installation without blocking. Once the plugins have been
    installed or installation has failed, func will be called with the result
    of the installation and your provided user_data pointer.
    
    This function requires a running GLib/Gtk main loop. If you are not
    running a GLib/Gtk main loop, make sure to regularly call
    g_main_context_iteration(NULL,FALSE).
    
    The installer strings that make up detail are typically obtained by
    calling [gstpbutils.global.missingPluginMessageGetInstallerDetail] on missing-plugin
    messages that have been caught on a pipeline's bus or created by the
    application via the provided API, such as [gstpbutils.global.missingElementMessageNew].
    
    It is possible to request the installation of multiple missing plugins in
    one go (as might be required if there is a demuxer for a certain format
    installed but no suitable video decoder and no suitable audio decoder).

    Params:
      details = NULL-terminated array
            of installer string details (see below)
      ctx = a #GstInstallPluginsContext, or NULL
      func = the function to call when the installer program returns
    Returns: result code whether an external installer could be started
*/
gstpbutils.types.InstallPluginsReturn installPluginsAsync(string[] details, gstpbutils.install_plugins_context.InstallPluginsContext ctx, gstpbutils.types.InstallPluginsResultFunc func)
{
  extern(C) void _funcCallback(GstInstallPluginsReturn result, void* userData)
  {
    ptrThawGC(userData);
    auto _dlg = cast(gstpbutils.types.InstallPluginsResultFunc*)userData;

    (*_dlg)(result);
  }
  auto _funcCB = func ? &_funcCallback : null;

  GstInstallPluginsReturn _cretval;
  char*[] _tmpdetails;
  foreach (s; details)
    _tmpdetails ~= s.toCString(No.Alloc);
  _tmpdetails ~= null;
  const(char*)* _details = _tmpdetails.ptr;

  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  _cretval = gst_install_plugins_async(_details, ctx ? cast(GstInstallPluginsContext*)ctx._cPtr(No.Dup) : null, _funcCB, _func);
  gstpbutils.types.InstallPluginsReturn _retval = cast(gstpbutils.types.InstallPluginsReturn)_cretval;
  return _retval;
}

/**
    Checks whether plugin installation (initiated by this application only)
    is currently in progress.
    Returns: TRUE if plugin installation is in progress, otherwise FALSE
*/
bool installPluginsInstallationInProgress()
{
  bool _retval;
  _retval = cast(bool)gst_install_plugins_installation_in_progress();
  return _retval;
}

/**
    Checks whether plugin installation is likely to be supported by the
    current environment. This currently only checks whether the helper script
    that is to be provided by the distribution or operating system vendor
    exists.
    Returns: TRUE if plugin installation is likely to be supported.
*/
bool installPluginsSupported()
{
  bool _retval;
  _retval = cast(bool)gst_install_plugins_supported();
  return _retval;
}

/**
    Requests plugin installation and block until the plugins have been
    installed or installation has failed.
    
    This function should almost never be used, it only exists for cases where
    a non-GLib main loop is running and the user wants to run it in a separate
    thread and marshal the result back asynchronously into the main thread
    using the other non-GLib main loop. You should almost always use
    [gstpbutils.global.installPluginsAsync] instead of this function.

    Params:
      details = NULL-terminated array
            of installer string details
      ctx = a #GstInstallPluginsContext, or NULL
    Returns: the result of the installation.
*/
gstpbutils.types.InstallPluginsReturn installPluginsSync(string[] details, gstpbutils.install_plugins_context.InstallPluginsContext ctx = null)
{
  GstInstallPluginsReturn _cretval;
  char*[] _tmpdetails;
  foreach (s; details)
    _tmpdetails ~= s.toCString(No.Alloc);
  _tmpdetails ~= null;
  const(char*)* _details = _tmpdetails.ptr;
  _cretval = gst_install_plugins_sync(_details, ctx ? cast(GstInstallPluginsContext*)ctx._cPtr(No.Dup) : null);
  gstpbutils.types.InstallPluginsReturn _retval = cast(gstpbutils.types.InstallPluginsReturn)_cretval;
  return _retval;
}

/**
    Checks whether msg is a missing plugins message.

    Params:
      msg = a #GstMessage
    Returns: true if msg is a missing-plugins message, otherwise false.
*/
bool isMissingPluginMessage(gst.message.Message msg)
{
  bool _retval;
  _retval = cast(bool)gst_is_missing_plugin_message(msg ? cast(GstMessage*)msg._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions in
    the case where the application knows exactly what kind of plugin it is
    missing.

    Params:
      decodeCaps = the (fixed) caps for which a decoder element is needed
    Returns: a newly-allocated detail string. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingDecoderInstallerDetailNew(gst.caps.Caps decodeCaps)
{
  char* _cretval;
  _cretval = gst_missing_decoder_installer_detail_new(decodeCaps ? cast(const(GstCaps)*)decodeCaps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a missing-plugin message for element to notify the application
    that a decoder element for a particular set of (fixed) caps is missing.
    This function is mainly for use in plugins.

    Params:
      element = the #GstElement posting the message
      decodeCaps = the (fixed) caps for which a decoder element is needed
    Returns: a new #GstMessage
*/
gst.message.Message missingDecoderMessageNew(gst.element.Element element, gst.caps.Caps decodeCaps)
{
  GstMessage* _cretval;
  _cretval = gst_missing_decoder_message_new(element ? cast(GstElement*)element._cPtr(No.Dup) : null, decodeCaps ? cast(const(GstCaps)*)decodeCaps._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions in
    the case where the application knows exactly what kind of plugin it is
    missing.

    Params:
      factoryName = the name of the missing element (element factory),
                   e.g. "videoscale" or "cdparanoiasrc"
    Returns: a newly-allocated detail string. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingElementInstallerDetailNew(string factoryName)
{
  char* _cretval;
  const(char)* _factoryName = factoryName.toCString(No.Alloc);
  _cretval = gst_missing_element_installer_detail_new(_factoryName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a missing-plugin message for element to notify the application
    that a certain required element is missing. This function is mainly for
    use in plugins.

    Params:
      element = the #GstElement posting the message
      factoryName = the name of the missing element (element factory),
                   e.g. "videoscale" or "cdparanoiasrc"
    Returns: a new #GstMessage
*/
gst.message.Message missingElementMessageNew(gst.element.Element element, string factoryName)
{
  GstMessage* _cretval;
  const(char)* _factoryName = factoryName.toCString(No.Alloc);
  _cretval = gst_missing_element_message_new(element ? cast(GstElement*)element._cPtr(No.Dup) : null, _factoryName);
  auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions in
    the case where the application knows exactly what kind of plugin it is
    missing.

    Params:
      encodeCaps = the (fixed) caps for which an encoder element is needed
    Returns: a newly-allocated detail string. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingEncoderInstallerDetailNew(gst.caps.Caps encodeCaps)
{
  char* _cretval;
  _cretval = gst_missing_encoder_installer_detail_new(encodeCaps ? cast(const(GstCaps)*)encodeCaps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a missing-plugin message for element to notify the application
    that an encoder element for a particular set of (fixed) caps is missing.
    This function is mainly for use in plugins.

    Params:
      element = the #GstElement posting the message
      encodeCaps = the (fixed) caps for which an encoder element is needed
    Returns: a new #GstMessage
*/
gst.message.Message missingEncoderMessageNew(gst.element.Element element, gst.caps.Caps encodeCaps)
{
  GstMessage* _cretval;
  _cretval = gst_missing_encoder_message_new(element ? cast(GstElement*)element._cPtr(No.Dup) : null, encodeCaps ? cast(const(GstCaps)*)encodeCaps._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns a localised string describing the missing feature, for use in
    error dialogs and the like. Should never return NULL unless msg is not
    a valid missing-plugin message.
    
    This function is mainly for applications that need a human-readable string
    describing a missing plugin, given a previously collected missing-plugin
    message

    Params:
      msg = a missing-plugin #GstMessage of type #GST_MESSAGE_ELEMENT
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string missingPluginMessageGetDescription(gst.message.Message msg)
{
  char* _cretval;
  _cretval = gst_missing_plugin_message_get_description(msg ? cast(GstMessage*)msg._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions.

    Params:
      msg = a missing-plugin #GstMessage of type #GST_MESSAGE_ELEMENT
    Returns: a newly-allocated detail string, or NULL on error. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingPluginMessageGetInstallerDetail(gst.message.Message msg)
{
  char* _cretval;
  _cretval = gst_missing_plugin_message_get_installer_detail(msg ? cast(GstMessage*)msg._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions in
    the case where the application knows exactly what kind of plugin it is
    missing.

    Params:
      protocol = the URI protocol the missing source needs to implement,
                   e.g. "http" or "mms"
    Returns: a newly-allocated detail string. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingUriSinkInstallerDetailNew(string protocol)
{
  char* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_missing_uri_sink_installer_detail_new(_protocol);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a missing-plugin message for element to notify the application
    that a sink element for a particular URI protocol is missing. This
    function is mainly for use in plugins.

    Params:
      element = the #GstElement posting the message
      protocol = the URI protocol the missing sink needs to implement,
                   e.g. "http" or "smb"
    Returns: a new #GstMessage
*/
gst.message.Message missingUriSinkMessageNew(gst.element.Element element, string protocol)
{
  GstMessage* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_missing_uri_sink_message_new(element ? cast(GstElement*)element._cPtr(No.Dup) : null, _protocol);
  auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns an opaque string containing all the details about the missing
    element to be passed to an external installer called via
    [gstpbutils.global.installPluginsAsync] or [gstpbutils.global.installPluginsSync].
    
    This function is mainly for applications that call external plugin
    installation mechanisms using one of the two above-mentioned functions in
    the case where the application knows exactly what kind of plugin it is
    missing.

    Params:
      protocol = the URI protocol the missing source needs to implement,
                   e.g. "http" or "mms"
    Returns: a newly-allocated detail string. Free string
               with [glib.global.gfree] when not needed any longer.
*/
string missingUriSourceInstallerDetailNew(string protocol)
{
  char* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_missing_uri_source_installer_detail_new(_protocol);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a missing-plugin message for element to notify the application
    that a source element for a particular URI protocol is missing. This
    function is mainly for use in plugins.

    Params:
      element = the #GstElement posting the message
      protocol = the URI protocol the missing source needs to implement,
                   e.g. "http" or "mms"
    Returns: a new #GstMessage
*/
gst.message.Message missingUriSourceMessageNew(gst.element.Element element, string protocol)
{
  GstMessage* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_missing_uri_source_message_new(element ? cast(GstElement*)element._cPtr(No.Dup) : null, _protocol);
  auto _retval = _cretval ? new gst.message.Message(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Adds a codec tag describing the format specified by caps to taglist.

    Params:
      taglist = a #GstTagList
      codecTag = a GStreamer codec tag such as #GST_TAG_AUDIO_CODEC,
                    #GST_TAG_VIDEO_CODEC or #GST_TAG_CODEC. If none is specified,
                    the function will attempt to detect the appropriate category.
      caps = the (fixed) #GstCaps for which a codec tag should be added.
    Returns: TRUE if a codec tag was added, FALSE otherwise.
*/
bool pbUtilsAddCodecDescriptionToTagList(gst.tag_list.TagList taglist, string codecTag, gst.caps.Caps caps)
{
  bool _retval;
  const(char)* _codecTag = codecTag.toCString(No.Alloc);
  _retval = cast(bool)gst_pb_utils_add_codec_description_to_tag_list(taglist ? cast(GstTagList*)taglist._cPtr(No.Dup) : null, _codecTag, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns flags that describe the format of the caps if known. No flags are
    set for unknown caps.

    Params:
      caps = the (fixed) #GstCaps for which flags are requested
    Returns: #GstPbUtilsCapsDescriptionFlags that describe caps, or no flags
               if the caps are unknown.
*/
gstpbutils.types.PbUtilsCapsDescriptionFlags pbUtilsGetCapsDescriptionFlags(gst.caps.Caps caps)
{
  GstPbUtilsCapsDescriptionFlags _cretval;
  _cretval = gst_pb_utils_get_caps_description_flags(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  gstpbutils.types.PbUtilsCapsDescriptionFlags _retval = cast(gstpbutils.types.PbUtilsCapsDescriptionFlags)_cretval;
  return _retval;
}

/**
    Returns a localised (as far as this is possible) string describing the
    media format specified in caps, for use in error dialogs or other messages
    to be seen by the user. Should never return NULL unless caps is invalid.
    
    Also see the convenience function
    [gstpbutils.global.pbUtilsAddCodecDescriptionToTagList].

    Params:
      caps = the (fixed) #GstCaps for which an format description is needed
    Returns: a newly-allocated description string, or NULL on error. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetCodecDescription(gst.caps.Caps caps)
{
  char* _cretval;
  _cretval = gst_pb_utils_get_codec_description(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a localised string describing an decoder for the format specified
    in caps, for use in error dialogs or other messages to be seen by the user.
    
    This function is mainly for internal use, applications would typically
    use [gstpbutils.global.missingPluginMessageGetDescription] to get a description of
    a missing feature from a missing-plugin message.

    Params:
      caps = the (fixed) #GstCaps for which an decoder description is needed
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetDecoderDescription(gst.caps.Caps caps)
{
  char* _cretval;
  _cretval = gst_pb_utils_get_decoder_description(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a localised string describing the given element, for use in
    error dialogs or other messages to be seen by the user.
    
    This function is mainly for internal use, applications would typically
    use [gstpbutils.global.missingPluginMessageGetDescription] to get a description of
    a missing feature from a missing-plugin message.

    Params:
      factoryName = the name of the element, e.g. "giosrc"
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetElementDescription(string factoryName)
{
  char* _cretval;
  const(char)* _factoryName = factoryName.toCString(No.Alloc);
  _cretval = gst_pb_utils_get_element_description(_factoryName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a localised string describing an encoder for the format specified
    in caps, for use in error dialogs or other messages to be seen by the user.
    
    This function is mainly for internal use, applications would typically
    use [gstpbutils.global.missingPluginMessageGetDescription] to get a description of
    a missing feature from a missing-plugin message.

    Params:
      caps = the (fixed) #GstCaps for which an encoder description is needed
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetEncoderDescription(gst.caps.Caps caps)
{
  char* _cretval;
  _cretval = gst_pb_utils_get_encoder_description(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a possible file extension for the given caps, if known.

    Params:
      caps = the (fixed) #GstCaps for which a file extension is needed
    Returns: a newly-allocated file extension string, or NULL on error. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetFileExtensionFromCaps(gst.caps.Caps caps)
{
  char* _cretval;
  _cretval = gst_pb_utils_get_file_extension_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a localised string describing a sink element handling the protocol
    specified in protocol, for use in error dialogs or other messages to be
    seen by the user.
    
    This function is mainly for internal use, applications would typically
    use [gstpbutils.global.missingPluginMessageGetDescription] to get a description of
    a missing feature from a missing-plugin message.

    Params:
      protocol = the protocol the sink element needs to handle, e.g. "http"
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetSinkDescription(string protocol)
{
  char* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_pb_utils_get_sink_description(_protocol);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a localised string describing a source element handling the protocol
    specified in protocol, for use in error dialogs or other messages to be
    seen by the user.
    
    This function is mainly for internal use, applications would typically
    use [gstpbutils.global.missingPluginMessageGetDescription] to get a description of
    a missing feature from a missing-plugin message.

    Params:
      protocol = the protocol the source element needs to handle, e.g. "http"
    Returns: a newly-allocated description string. Free
               string with [glib.global.gfree] when not needed any longer.
*/
string pbUtilsGetSourceDescription(string protocol)
{
  char* _cretval;
  const(char)* _protocol = protocol.toCString(No.Alloc);
  _cretval = gst_pb_utils_get_source_description(_protocol);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Initialises the base utils support library. This function is not
    thread-safe. Applications should call it after calling [gst.global.init_],
    plugins should call it from their plugin_init function.
    
    This function may be called multiple times. It will do nothing if the
    library has already been initialised.
*/
void pbUtilsInit()
{
  gst_pb_utils_init();
}

/**
    Gets the version number of the GStreamer Plugins Base libraries.

    Params:
      major = pointer to a guint to store the major version number, or null
      minor = pointer to a guint to store the minor version number, or null
      micro = pointer to a guint to store the micro version number, or null
      nano = pointer to a guint to store the nano version number, or null
*/
void pluginsBaseVersion(out uint major, out uint minor, out uint micro, out uint nano)
{
  gst_plugins_base_version(cast(uint*)&major, cast(uint*)&minor, cast(uint*)&micro, cast(uint*)&nano);
}

/**
    This function returns a string that is useful for describing this version
    of GStreamer's gst-plugins-base libraries to the outside world: user agent
    strings, logging, about dialogs ...
    Returns: a newly allocated string describing this version of gst-plugins-base
*/
string pluginsBaseVersionString()
{
  char* _cretval;
  _cretval = gst_plugins_base_version_string();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
