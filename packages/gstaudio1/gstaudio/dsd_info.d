/// Module for [DsdInfo] struct
module gstaudio.dsd_info;

import gid.gid;
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
struct DsdInfo
{
  /**
      DSD grouping format
  */
  DsdFormat format;

  /**
      DSD rate
  */
  int rate;

  /**
      number of channels (must be at least 1)
  */
  int channels;

  /**
      audio layout
  */
  AudioLayout layout;

  /**
      true if the DSD bits in the data bytes are reversed,
        that is, the least significant bit comes first
  */
  gboolean reversedBytes;

  /**
      positions for each channel
  */
  GstAudioChannelPosition[64] positions;

  /** */
  AudioFlags flags;

  /** */
  void*[4] GstReserved;

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_dsd_info_get_type != &gidSymbolNotFound ? gst_dsd_info_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      Copy a GstDsdInfo structure.
      Returns: a new #GstDsdInfo. free with gst_dsd_info_free.
  */
  gstaudio.dsd_info.DsdInfo copy()
  {
    GstDsdInfo* _cretval;
    _cretval = gst_dsd_info_copy(cast(const(GstDsdInfo)*)&this);
    gstaudio.dsd_info.DsdInfo _retval;
    if (_cretval)
      _retval = *cast(gstaudio.dsd_info.DsdInfo*)_cretval;
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
    _retval = cast(bool)gst_dsd_info_is_equal(cast(const(GstDsdInfo)*)&this, cast(const(GstDsdInfo)*)&other);
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
    gst_dsd_info_set_format(cast(GstDsdInfo*)&this, format, rate, channels, _positions);
  }

  /**
      Convert the values of info into a #GstCaps.
      Returns: the new #GstCaps containing the
                 info of info.
  */
  gst.caps.Caps toCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_dsd_info_to_caps(cast(const(GstDsdInfo)*)&this);
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
    _retval = cast(bool)gst_dsd_info_from_caps(cast(GstDsdInfo*)&info, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Initialize info with default values.
  
      Params:
        info = a #GstDsdInfo
  */
  static void init_(out gstaudio.dsd_info.DsdInfo info)
  {
    gst_dsd_info_init(cast(GstDsdInfo*)&info);
  }
}
