/// Module for [DsdInfo] class
module gstaudio.dsd_info;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Information describing DSD audio properties.
    
    In DSD, the "sample format" is the bit. Unlike PCM, there are no further
    "sample formats" in DSD. However, in software, DSD bits are grouped into
    bytes (since dealing with individual bits is impractical), and these bytes
    in turn are grouped into words. This becomes relevant when interleaving
    channels and transmitting DSD data through audio APIs. The different
    types of grouping DSD bytes are referred to as the "DSD grouping forma"
    or just "DSD format". #GstDsdFormat has a list of valid ways of grouping
    DSD bytes into words.
    
    DSD rates are equivalent to PCM sample rates, except that they specify
    how many DSD bytes are consumed per second. This refers to the bytes per
    second _per channel_; the rate does not change when the number of channel
    changes. (Strictly speaking, it would be more correct to measure the
    *bits* per second, since the bit is the DSD "sample format", but it is
    more practical to use bytes.) In DSD, bit rates are always an integer
    multiple of the CD audio rate (44100) or the DAT rate (48000). DSD64-44x
    is 44100 * 64 = 2822400 bits per second, or 352800 bytes per second
    (the latter would be used in this info structure). DSD64-48x is
    48000 * 64 = 3072000 bits per second, or 384000 bytes per second.
    #GST_DSD_MAKE_DSD_RATE_44x can be used for specifying DSD-44x rates,
    *and #GST_DSD_MAKE_DSD_RATE_48x can be used for specifying DSD-48x ones.
    Also, since DSD-48x is less well known, when the multiplier is given
    without the 44x/48x specifier, 44x is typically implied.
    
    It is important to know that in DSD, different format widths correspond
    to different playtimes. That is, a word with 32 DSD bits covers two times
    as much playtime as a word with 16 DSD bits. This is in contrast to PCM,
    where one word (= one PCM sample) always covers a time period of 1/samplerate,
    no matter how many bits a PCM sample is made of. For this reason, DSD
    and PCM widths and strides cannot be used the same way.
    
    Multiple channels are arranged in DSD data either interleaved or non-
    interleaved. This is similar to PCM. Interleaved layouts rotate between
    channels and words. First, word 0 of channel 0 is present. Then word
    0 of channel 1 follows. Then word 0 of channel 2 etc. until all
    channels are through, then comes word 1 of channel 0 etc.
    
    Non-interleaved data is planar. First, all words of channel 0 are
    present, then all words of channel 1 etc. Unlike interleaved data,
    non-interleaved data can be sparse, that is, there can be space in
    between the planes. the @positions array specifies the plane offsets.
    
    In uncommon cases, the DSD bits in the data bytes can be stored in reverse
    order. For example, normally, in DSDU8, the first byte contains DSD bits
    0 to 7, and the most significant bit of that byte is DSD bit 0. If this
    order is reversed, then bit 7 is the first one instead. In that ase,
    @reversed_bytes is set to TRUE.
    
    Use the provided macros to access the info in this structure.
*/
class DsdInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_dsd_info_get_type != &gidSymbolNotFound ? gst_dsd_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DsdInfo self()
  {
    return this;
  }

  /**
      Get `format` field.
      Returns: DSD grouping format
  */
  @property gstaudio.types.DsdFormat format()
  {
    return cast(gstaudio.types.DsdFormat)(cast(GstDsdInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = DSD grouping format
  */
  @property void format(gstaudio.types.DsdFormat propval)
  {
    (cast(GstDsdInfo*)this._cPtr).format = cast(GstDsdFormat)propval;
  }

  /**
      Get `rate` field.
      Returns: DSD rate
  */
  @property int rate()
  {
    return (cast(GstDsdInfo*)this._cPtr).rate;
  }

  /**
      Set `rate` field.
      Params:
        propval = DSD rate
  */
  @property void rate(int propval)
  {
    (cast(GstDsdInfo*)this._cPtr).rate = propval;
  }

  /**
      Get `channels` field.
      Returns: number of channels (must be at least 1)
  */
  @property int channels()
  {
    return (cast(GstDsdInfo*)this._cPtr).channels;
  }

  /**
      Set `channels` field.
      Params:
        propval = number of channels (must be at least 1)
  */
  @property void channels(int propval)
  {
    (cast(GstDsdInfo*)this._cPtr).channels = propval;
  }

  /**
      Get `layout` field.
      Returns: audio layout
  */
  @property gstaudio.types.AudioLayout layout()
  {
    return cast(gstaudio.types.AudioLayout)(cast(GstDsdInfo*)this._cPtr).layout;
  }

  /**
      Set `layout` field.
      Params:
        propval = audio layout
  */
  @property void layout(gstaudio.types.AudioLayout propval)
  {
    (cast(GstDsdInfo*)this._cPtr).layout = cast(GstAudioLayout)propval;
  }

  /**
      Get `reversedBytes` field.
      Returns: true if the DSD bits in the data bytes are reversed,
        that is, the least significant bit comes first
  */
  @property bool reversedBytes()
  {
    return cast(bool)(cast(GstDsdInfo*)this._cPtr).reversedBytes;
  }

  /**
      Set `reversedBytes` field.
      Params:
        propval = true if the DSD bits in the data bytes are reversed,
          that is, the least significant bit comes first
  */
  @property void reversedBytes(bool propval)
  {
    (cast(GstDsdInfo*)this._cPtr).reversedBytes = propval;
  }

  /** */
  @property gstaudio.types.AudioFlags flags()
  {
    return cast(gstaudio.types.AudioFlags)(cast(GstDsdInfo*)this._cPtr).flags;
  }

  /** */
  @property void flags(gstaudio.types.AudioFlags propval)
  {
    (cast(GstDsdInfo*)this._cPtr).flags = cast(GstAudioFlags)propval;
  }

  /**
      Allocate a new #GstDsdInfo that is also initialized with
      [gstaudio.dsd_info.DsdInfo.init_].
      Returns: a new #GstDsdInfo. free with [gstaudio.dsd_info.DsdInfo.free].
  */
  this()
  {
    GstDsdInfo* _cretval;
    _cretval = gst_dsd_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Parse caps to generate a #GstDsdInfo.
  
      Params:
        caps = a #GstCaps
      Returns: A #GstDsdInfo, or null if caps couldn't be parsed
  */
  static gstaudio.dsd_info.DsdInfo newFromCaps(gst.caps.Caps caps)
  {
    GstDsdInfo* _cretval;
    _cretval = gst_dsd_info_new_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstaudio.dsd_info.DsdInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copy a GstDsdInfo structure.
      Returns: a new #GstDsdInfo. free with gst_dsd_info_free.
  */
  gstaudio.dsd_info.DsdInfo copy()
  {
    GstDsdInfo* _cretval;
    _cretval = gst_dsd_info_copy(cast(const(GstDsdInfo)*)this._cPtr);
    auto _retval = _cretval ? new gstaudio.dsd_info.DsdInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two #GstDsdInfo and returns whether they are equal or not
  
      Params:
        other = a #GstDsdInfo
      Returns: true if info and other are equal, else false.
  */
  bool isEqual(gstaudio.dsd_info.DsdInfo other)
  {
    bool _retval;
    _retval = cast(bool)gst_dsd_info_is_equal(cast(const(GstDsdInfo)*)this._cPtr, other ? cast(const(GstDsdInfo)*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set the default info for the DSD info of format and rate and channels.
      
      Note: This initializes info first, no values are preserved.
  
      Params:
        format = the format
        rate = the DSD rate
        channels = the number of channels
        positions = the channel positions
  */
  void setFormat(gstaudio.types.DsdFormat format, int rate, int channels, gstaudio.types.AudioChannelPosition[] positions = null)
  {
    assert(!positions || positions.length == 64);
    auto _positions = cast(const(GstAudioChannelPosition)*)positions.ptr;
    gst_dsd_info_set_format(cast(GstDsdInfo*)this._cPtr, format, rate, channels, _positions);
  }

  /**
      Convert the values of info into a #GstCaps.
      Returns: the new #GstCaps containing the
                 info of info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_dsd_info_to_caps(cast(const(GstDsdInfo)*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse caps and update info.
  
      Params:
        info = a #GstDsdInfo
        caps = a #GstCaps
      Returns: TRUE if caps could be parsed
  */
  static bool fromCaps(out gstaudio.dsd_info.DsdInfo info, gst.caps.Caps caps)
  {
    bool _retval;
    GstDsdInfo _info;
    _retval = cast(bool)gst_dsd_info_from_caps(&_info, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    info = new gstaudio.dsd_info.DsdInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Initialize info with default values.
  
      Params:
        info = a #GstDsdInfo
  */
  static void init_(out gstaudio.dsd_info.DsdInfo info)
  {
    GstDsdInfo _info;
    gst_dsd_info_init(&_info);
    info = new gstaudio.dsd_info.DsdInfo(cast(void*)&_info, No.Take);
  }
}
