/// Module for [AudioFormatInfo] class
module gstaudio.audio_format_info;

public import gid.basictypes;
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

  /**
      Create a `audio_format_info.AudioFormatInfo` wrap type.
      Params:
        format = #GstAudioFormat
        name = string representation of the format
        description = user readable description of the format
        flags = #GstAudioFormatFlags
        endianness = the endianness
        width = amount of bits used for one sample
        depth = amount of valid bits in @width
        silence = @width/8 bytes with 1 silent sample
        unpackFormat = the format of the unpacked samples
  */
  this(gstaudio.types.AudioFormat format = gstaudio.types.AudioFormat.init, string name = string.init, string description = string.init, gstaudio.types.AudioFormatFlags flags = gstaudio.types.AudioFormatFlags.init, int endianness = int.init, int width = int.init, int depth = int.init, ubyte[8] silence = (ubyte[8]).init, gstaudio.types.AudioFormat unpackFormat = gstaudio.types.AudioFormat.init) nothrow
  {
    this.format = format;
    this.name = name;
    this.description = description;
    this.flags = flags;
    this.endianness = endianness;
    this.width = width;
    this.depth = depth;
    this.silence = silence;
    this.unpackFormat = unpackFormat;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstAudioFormatInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `format` field.
      Returns: #GstAudioFormat
  */
  @property gstaudio.types.AudioFormat format() nothrow
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = #GstAudioFormat
  */
  @property void format(gstaudio.types.AudioFormat propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).format = cast(GstAudioFormat)propval;
  }

  /**
      Get `name` field.
      Returns: string representation of the format
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = string representation of the format
  */
  @property void name(string propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).name = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `description` field.
      Returns: user readable description of the format
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = user readable description of the format
  */
  @property void description(string propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).description = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `flags` field.
      Returns: #GstAudioFormatFlags
  */
  @property gstaudio.types.AudioFormatFlags flags() nothrow
  {
    return cast(gstaudio.types.AudioFormatFlags)(cast(GstAudioFormatInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstAudioFormatFlags
  */
  @property void flags(gstaudio.types.AudioFormatFlags propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).flags = cast(GstAudioFormatFlags)propval;
  }

  /**
      Get `endianness` field.
      Returns: the endianness
  */
  @property int endianness() nothrow
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).endianness;
  }

  /**
      Set `endianness` field.
      Params:
        propval = the endianness
  */
  @property void endianness(int propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).endianness = propval;
  }

  /**
      Get `width` field.
      Returns: amount of bits used for one sample
  */
  @property int width() nothrow
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = amount of bits used for one sample
  */
  @property void width(int propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).width = propval;
  }

  /**
      Get `depth` field.
      Returns: amount of valid bits in @width
  */
  @property int depth() nothrow
  {
    return (cast(GstAudioFormatInfo*)this._cPtr).depth;
  }

  /**
      Set `depth` field.
      Params:
        propval = amount of valid bits in @width
  */
  @property void depth(int propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).depth = propval;
  }

  /**
      Get `silence` field.
      Returns: @width/8 bytes with 1 silent sample
  */
  @property ubyte[8] silence() nothrow
  {
    return *cast(ubyte[8]*)&(cast(GstAudioFormatInfo*)this._cPtr).silence;
  }

  /**
      Set `silence` field.
      Params:
        propval = @width/8 bytes with 1 silent sample
  */
  @property void silence(ubyte[8] propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).silence = *cast(ubyte[8]*)&propval;
  }

  /**
      Get `unpackFormat` field.
      Returns: the format of the unpacked samples
  */
  @property gstaudio.types.AudioFormat unpackFormat() nothrow
  {
    return cast(gstaudio.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).unpackFormat;
  }

  /**
      Set `unpackFormat` field.
      Params:
        propval = the format of the unpacked samples
  */
  @property void unpackFormat(gstaudio.types.AudioFormat propval) nothrow
  {
    (cast(GstAudioFormatInfo*)this._cPtr).unpackFormat = cast(GstAudioFormat)propval;
  }

  /**
      Fill length bytes in dest with silence samples for info.
  
      Params:
        dest = a destination
            to fill
  */
  void fillSilence(ubyte[] dest) nothrow
  {
    size_t _length;
    if (dest)
      _length = cast(size_t)dest.length;

    auto _dest = dest.ptr ? cast(void*)dest.ptr : [ubyte.init].ptr;
    gst_audio_format_info_fill_silence(cast(const(GstAudioFormatInfo)*)this._cPtr, _dest, _length);
  }
}
