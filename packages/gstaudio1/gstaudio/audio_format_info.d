/// Module for [AudioFormatInfo] class
module gstaudio.audio_format_info;

import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Information for an audio format.
*/
class AudioFormatInfo
{
  GstAudioFormatInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_format_info.AudioFormatInfo");

    _cInstance = *cast(GstAudioFormatInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `format` field.
      Returns: #GstAudioFormat
  */
  @property gstaudio.types.AudioFormat format()
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = #GstAudioFormat
  */
  @property void format(gstaudio.types.AudioFormat propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).format = cast(GstAudioFormat)propval;
  }

  /**
      Get `name` field.
      Returns: string representation of the format
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = string representation of the format
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GstAudioFormatInfo*)this._cPtr).name);
  }

  /**
      Get `description` field.
      Returns: user readable description of the format
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = user readable description of the format
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GstAudioFormatInfo*)this._cPtr).description);
  }

  /**
      Get `flags` field.
      Returns: #GstAudioFormatFlags
  */
  @property gstaudio.types.AudioFormatFlags flags()
  {
    return cast(gstaudio.types.AudioFormatFlags)(cast(GstAudioFormatInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstAudioFormatFlags
  */
  @property void flags(gstaudio.types.AudioFormatFlags propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).flags = cast(GstAudioFormatFlags)propval;
  }

  /**
      Get `endianness` field.
      Returns: the endianness
  */
  @property int endianness()
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).endianness;
  }

  /**
      Set `endianness` field.
      Params:
        propval = the endianness
  */
  @property void endianness(int propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).endianness = propval;
  }

  /**
      Get `width` field.
      Returns: amount of bits used for one sample
  */
  @property int width()
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = amount of bits used for one sample
  */
  @property void width(int propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).width = propval;
  }

  /**
      Get `depth` field.
      Returns: amount of valid bits in @width
  */
  @property int depth()
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).depth;
  }

  /**
      Set `depth` field.
      Params:
        propval = amount of valid bits in @width
  */
  @property void depth(int propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).depth = propval;
  }

  /**
      Get `unpackFormat` field.
      Returns: the format of the unpacked samples
  */
  @property gstaudio.types.AudioFormat unpackFormat()
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).unpackFormat;
  }

  /**
      Set `unpackFormat` field.
      Params:
        propval = the format of the unpacked samples
  */
  @property void unpackFormat(gstaudio.types.AudioFormat propval)
  {
    (cast(GstAudioFormatInfo*)this._cPtr).unpackFormat = cast(GstAudioFormat)propval;
  }

  /**
      Fill length bytes in dest with silence samples for info.
  
      Params:
        dest = a destination
            to fill
  */
  void fillSilence(ubyte[] dest)
  {
    size_t _length;
    if (dest)
      _length = cast(size_t)dest.length;

    auto _dest = cast(void*)dest.ptr;
    gst_audio_format_info_fill_silence(cast(const(GstAudioFormatInfo)*)this._cPtr, _dest, _length);
  }
}
