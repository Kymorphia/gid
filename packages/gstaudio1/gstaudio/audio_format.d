/// Module for [AudioFormat] enum namespace
module gstaudio.audio_format;

import gid.gid;
import gstaudio.audio_format_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/// Namespace for [AudioFormat] enum
struct AudioFormat
{
  alias Enum = gstaudio.types.AudioFormat; ///

  /**
      Construct a #GstAudioFormat with given parameters.
  
      Params:
        sign = signed or unsigned format
        endianness = G_LITTLE_ENDIAN or G_BIG_ENDIAN
        width = amount of bits used per sample
        depth = amount of used bits in width
      Returns: a #GstAudioFormat or GST_AUDIO_FORMAT_UNKNOWN when no audio format
        exists with the given parameters.
  */
  static gstaudio.types.AudioFormat buildInteger(bool sign, int endianness, int width, int depth)
  {
    GstAudioFormat _cretval;
    _cretval = gst_audio_format_build_integer(sign, endianness, width, depth);
    gstaudio.types.AudioFormat _retval = cast(gstaudio.types.AudioFormat)_cretval;
    return _retval;
  }

  /**
      Fill length bytes in dest with silence samples for info.
  
      Params:
        info = a #GstAudioFormatInfo
        dest = a destination
            to fill
  
      Deprecated: Use [gstaudio.audio_format_info.AudioFormatInfo.fillSilence] instead.
  */
  static void fillSilence(gstaudio.audio_format_info.AudioFormatInfo info, ubyte[] dest)
  {
    size_t _length;
    if (dest)
      _length = cast(size_t)dest.length;

    auto _dest = dest.ptr ? cast(void*)dest.ptr : [ubyte.init].ptr;
    gst_audio_format_fill_silence(info ? cast(const(GstAudioFormatInfo)*)info._cPtr : null, _dest, _length);
  }

  /**
      Convert the format string to its #GstAudioFormat.
  
      Params:
        format = a format string
      Returns: the #GstAudioFormat for format or GST_AUDIO_FORMAT_UNKNOWN when the
        string is not a known format.
  */
  static gstaudio.types.AudioFormat fromString(string format)
  {
    GstAudioFormat _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = gst_audio_format_from_string(_format);
    gstaudio.types.AudioFormat _retval = cast(gstaudio.types.AudioFormat)_cretval;
    return _retval;
  }

  /**
      Get the #GstAudioFormatInfo for format
  
      Params:
        format = a #GstAudioFormat
      Returns: The #GstAudioFormatInfo for format.
  */
  static gstaudio.audio_format_info.AudioFormatInfo getInfo(gstaudio.types.AudioFormat format)
  {
    const(GstAudioFormatInfo)* _cretval;
    _cretval = gst_audio_format_get_info(format);
    auto _retval = _cretval ? new gstaudio.audio_format_info.AudioFormatInfo(cast(GstAudioFormatInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static string toString_(gstaudio.types.AudioFormat format)
  {
    const(char)* _cretval;
    _cretval = gst_audio_format_to_string(format);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
