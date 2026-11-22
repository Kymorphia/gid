/// Module for [AudioFormatInfo] class
module gid.gstaudio1.audio_format_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    Information for an audio format.
*/
class AudioFormatInfo : gid.gobject2.boxed.BoxedWrap!(gst_audio_format_info_get_type)
{
  /**
      Create a `audio_format_info.AudioFormatInfo` boxed type.
      Params:
        format = #GstAudioFormat
        flags = #GstAudioFormatFlags
        endianness = the endianness
        width = amount of bits used for one sample
        depth = amount of valid bits in @width
        silence = @width/8 bytes with 1 silent sample
        unpackFormat = the format of the unpacked samples
  */
  this(gid.gstaudio1.types.AudioFormat format = gid.gstaudio1.types.AudioFormat.init, gid.gstaudio1.types.AudioFormatFlags flags = gid.gstaudio1.types.AudioFormatFlags.init, int endianness = int.init, int width = int.init, int depth = int.init, ubyte[8] silence = (ubyte[8]).init, gid.gstaudio1.types.AudioFormat unpackFormat = gid.gstaudio1.types.AudioFormat.init) nothrow
  {
    super(boxedNew!GstAudioFormatInfo(_getGType), Yes.Take);
    this.format = format;
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
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioFormatInfo self() nothrow
  {
    return this;
  }

  /**
      Get `format` field.
      Returns: #GstAudioFormat
  */
  @property gid.gstaudio1.types.AudioFormat format() nothrow
  {
    return cast(gid.gstaudio1.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = #GstAudioFormat
  */
  @property void format(gid.gstaudio1.types.AudioFormat propval) nothrow
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
      Get `description` field.
      Returns: user readable description of the format
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstAudioFormatInfo*)this._cPtr).description);
  }

  /**
      Get `flags` field.
      Returns: #GstAudioFormatFlags
  */
  @property gid.gstaudio1.types.AudioFormatFlags flags() nothrow
  {
    return cast(gid.gstaudio1.types.AudioFormatFlags)(cast(GstAudioFormatInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstAudioFormatFlags
  */
  @property void flags(gid.gstaudio1.types.AudioFormatFlags propval) nothrow
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
  @property gid.gstaudio1.types.AudioFormat unpackFormat() nothrow
  {
    return cast(gid.gstaudio1.types.AudioFormat)(cast(GstAudioFormatInfo*)this._cPtr).unpackFormat;
  }

  /**
      Set `unpackFormat` field.
      Params:
        propval = the format of the unpacked samples
  */
  @property void unpackFormat(gid.gstaudio1.types.AudioFormat propval) nothrow
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

    auto _dest = cast(ubyte*)dest.ptr;
    gst_audio_format_info_fill_silence(cast(const(GstAudioFormatInfo)*)this._cPtr, _dest, _length);
  }
}
