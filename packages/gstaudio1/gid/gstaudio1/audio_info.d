/// Module for [AudioInfo] class
module gid.gstaudio1.audio_info;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gst1.caps;
import gid.gst1.types;
import gid.gstaudio1.audio_format_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    Information describing audio properties. This information can be filled
    in from GstCaps with [gid.gstaudio1.audio_info.AudioInfo.fromCaps].
    
    Use the provided macros to access the info in this structure.
*/
class AudioInfo : gid.gobject2.boxed.BoxedWrap!(gst_audio_info_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioInfo self() nothrow
  {
    return this;
  }

  /**
      Get `finfo` field.
      Returns: the format info of the audio
  */
  @property gid.gstaudio1.audio_format_info.AudioFormatInfo finfo() nothrow
  {
    return cToD!(gid.gstaudio1.audio_format_info.AudioFormatInfo)(cast(void*)(cast(GstAudioInfo*)this._cPtr).finfo);
  }

  /**
      Get `flags` field.
      Returns: additional audio flags
  */
  @property gid.gstaudio1.types.AudioFlags flags() nothrow
  {
    return cast(gid.gstaudio1.types.AudioFlags)(cast(GstAudioInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = additional audio flags
  */
  @property void flags(gid.gstaudio1.types.AudioFlags propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).flags = cast(GstAudioFlags)propval;
  }

  /**
      Get `layout` field.
      Returns: audio layout
  */
  @property gid.gstaudio1.types.AudioLayout layout() nothrow
  {
    return cast(gid.gstaudio1.types.AudioLayout)(cast(GstAudioInfo*)this._cPtr).layout;
  }

  /**
      Set `layout` field.
      Params:
        propval = audio layout
  */
  @property void layout(gid.gstaudio1.types.AudioLayout propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).layout = cast(GstAudioLayout)propval;
  }

  /**
      Get `rate` field.
      Returns: the audio sample rate
  */
  @property int rate() nothrow
  {
    return (cast(GstAudioInfo*)this._cPtr).rate;
  }

  /**
      Set `rate` field.
      Params:
        propval = the audio sample rate
  */
  @property void rate(int propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).rate = propval;
  }

  /**
      Get `channels` field.
      Returns: the number of channels
  */
  @property int channels() nothrow
  {
    return (cast(GstAudioInfo*)this._cPtr).channels;
  }

  /**
      Set `channels` field.
      Params:
        propval = the number of channels
  */
  @property void channels(int propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).channels = propval;
  }

  /**
      Get `bpf` field.
      Returns: the number of bytes for one frame, this is the size of one
                sample * @channels
  */
  @property int bpf() nothrow
  {
    return (cast(GstAudioInfo*)this._cPtr).bpf;
  }

  /**
      Set `bpf` field.
      Params:
        propval = the number of bytes for one frame, this is the size of one
                  sample * @channels
  */
  @property void bpf(int propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).bpf = propval;
  }

  /**
      Get `position` field.
      Returns: the positions for each channel
  */
  @property gid.gstaudio1.types.AudioChannelPosition[64] position() nothrow
  {
    return *cast(gid.gstaudio1.types.AudioChannelPosition[64]*)&(cast(GstAudioInfo*)this._cPtr).position;
  }

  /**
      Set `position` field.
      Params:
        propval = the positions for each channel
  */
  @property void position(gid.gstaudio1.types.AudioChannelPosition[64] propval) nothrow
  {
    (cast(GstAudioInfo*)this._cPtr).position = *cast(GstAudioChannelPosition[64]*)&propval;
  }

  /**
      Allocate a new #GstAudioInfo that is also initialized with
      [gid.gstaudio1.audio_info.AudioInfo.init_].
      Returns: a new #GstAudioInfo. free with [gid.gstaudio1.audio_info.AudioInfo.free].
  */
  this() nothrow
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parse caps to generate a #GstAudioInfo.
  
      Params:
        caps = a #GstCaps
      Returns: A #GstAudioInfo, or null if caps couldn't be parsed
  */
  static gid.gstaudio1.audio_info.AudioInfo newFromCaps(gid.gst1.caps.Caps caps) nothrow
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_new_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Converts among various #GstFormat types.  This function handles
      GST_FORMAT_BYTES, GST_FORMAT_TIME, and GST_FORMAT_DEFAULT.  For
      raw audio, GST_FORMAT_DEFAULT corresponds to audio frames.  This
      function can be used to handle pad queries of the type GST_QUERY_CONVERT.
  
      Params:
        srcFmt = #GstFormat of the src_val
        srcVal = value to convert
        destFmt = #GstFormat of the dest_val
        destVal = pointer to destination value
      Returns: TRUE if the conversion was successful.
  */
  bool convert(gid.gst1.types.Format srcFmt, long srcVal, gid.gst1.types.Format destFmt, out long destVal) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_info_convert(cast(const(GstAudioInfo)*)this._cPtr, srcFmt, srcVal, destFmt, cast(long*)&destVal);
    return _retval;
  }

  /**
      Copy a GstAudioInfo structure.
      Returns: a new #GstAudioInfo. free with gst_audio_info_free.
  */
  gid.gstaudio1.audio_info.AudioInfo copy() nothrow
  {
    GstAudioInfo* _cretval;
    _cretval = gst_audio_info_copy(cast(const(GstAudioInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two #GstAudioInfo and returns whether they are equal or not
  
      Params:
        other = a #GstAudioInfo
      Returns: true if info and other are equal, else false.
  */
  bool isEqual(gid.gstaudio1.audio_info.AudioInfo other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_info_is_equal(cast(const(GstAudioInfo)*)this._cPtr, other ? cast(const(GstAudioInfo)*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set the default info for the audio info of format and rate and channels.
      
      Note: This initializes info first, no values are preserved.
  
      Params:
        format = the format
        rate = the samplerate
        channels = the number of channels
        position = the channel positions
  */
  void setFormat(gid.gstaudio1.types.AudioFormat format, int rate, int channels, gid.gstaudio1.types.AudioChannelPosition[] position = null) nothrow
  {
    if (position.length > 64) position = position[0 .. 64];
    auto _position = cast(GstAudioChannelPosition*)position.ptr;
    typeof(*_position)[64] _position_fixed = void;
    if (position.length == 0)
      _position = null;
    else if (position.length < 64)
    {
      (cast(ubyte[])_position_fixed[])[] = 0;
      _position_fixed[0 .. position.length] = _position[0 .. position.length];
      _position = _position_fixed.ptr;
    }
    gst_audio_info_set_format(cast(GstAudioInfo*)this._cPtr, format, rate, channels, _position);
  }

  /**
      Convert the values of info into a #GstCaps.
      Returns: the new #GstCaps containing the
                 info of info.
  */
  gid.gst1.caps.Caps toCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_audio_info_to_caps(cast(const(GstAudioInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse caps and update info.
  
      Params:
        info = a #GstAudioInfo
        caps = a #GstCaps
      Returns: TRUE if caps could be parsed
  */
  static bool fromCaps(out gid.gstaudio1.audio_info.AudioInfo info, gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    auto _info = boxedNew!GstAudioInfo(gid.gstaudio1.audio_info.AudioInfo._getGType);
    _retval = cast(bool)gst_audio_info_from_caps(_info, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    info = new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_info, Yes.Take);
    return _retval;
  }

  /**
      Initialize info with default values.
  
      Params:
        info = a #GstAudioInfo
  */
  static void init_(out gid.gstaudio1.audio_info.AudioInfo info) nothrow
  {
    auto _info = boxedNew!GstAudioInfo(gid.gstaudio1.audio_info.AudioInfo._getGType);
    gst_audio_info_init(_info);
    info = new gid.gstaudio1.audio_info.AudioInfo(cast(void*)_info, Yes.Take);
  }
}
