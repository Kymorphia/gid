/// C types for gstaudio1 library
module gstaudio.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;
public import gstbase.c.types;

/**
    Different possible reasons for discontinuities. This enum is useful for the custom
    slave method.
*/
enum GstAudioBaseSinkDiscontReason
{
  /**
      No discontinuity occurred
  */
  NoDiscont = 0,

  /**
      New caps are set, causing renegotiotion
  */
  NewCaps = 1,

  /**
      Samples have been flushed
  */
  Flush = 2,

  /**
      Sink was synchronized to the estimated latency (occurs during initialization)
  */
  SyncLatency = 3,

  /**
      Aligning buffers failed because the timestamps are too discontinuous
  */
  Alignment = 4,

  /**
      Audio output device experienced and recovered from an error but introduced latency in the process (see also [gstaudio.audio_base_sink.AudioBaseSink.reportDeviceFailure])
  */
  DeviceFailure = 5,
}

/**
    Different possible clock slaving algorithms used when the internal audio
    clock is not selected as the pipeline master clock.
*/
enum GstAudioBaseSinkSlaveMethod
{
  /**
      Resample to match the master clock
  */
  Resample = 0,

  /**
      Adjust playout pointer when master clock
      drifts too much.
  */
  Skew = 1,

  /**
      No adjustment is done.
  */
  None = 2,

  /**
      Use custom clock slaving algorithm (Since: 1.6)
  */
  Custom = 3,
}

/**
    Different possible clock slaving algorithms when the internal audio clock was
    not selected as the pipeline clock.
*/
enum GstAudioBaseSrcSlaveMethod
{
  /**
      Resample to match the master clock.
  */
  Resample = 0,

  /**
      Retimestamp output buffers with master
      clock time.
  */
  ReTimestamp = 1,

  /**
      Adjust capture pointer when master clock
      drifts too much.
  */
  Skew = 2,

  /**
      No adjustment is done.
  */
  None = 3,
}

/**
    Mode in which the CD audio source operates. Influences timestamping,
    EOS handling and seeking.
*/
enum GstAudioCdSrcMode
{
  /**
      each single track is a stream
  */
  Normal = 0,

  /**
      the entire disc is a single stream
  */
  Continuous = 1,
}

/**
    Flags passed to [gstaudio.audio_channel_mixer.AudioChannelMixer.new_]
*/
enum GstAudioChannelMixerFlags : uint
{
  /**
      no flag
  */
  None = 0,

  /**
      input channels are not interleaved
  */
  NonInterleavedIn = 1,

  /**
      output channels are not interleaved
  */
  NonInterleavedOut = 2,

  /**
      input channels are explicitly unpositioned
  */
  UnpositionedIn = 4,

  /**
      output channels are explicitly unpositioned
  */
  UnpositionedOut = 8,
}

/**
    Audio channel positions.
    
    These are the channels defined in SMPTE 2036-2-2008
    Table 1 for 22.2 audio systems with the Surround and Wide channels from
    DTS Coherent Acoustics (v.1.3.1) and 10.2 and 7.1 layouts. In the caps the
    actual channel layout is expressed with a channel count and a channel mask,
    which describes the existing channels. The positions in the bit mask correspond
    to the enum values.
    For negotiation it is allowed to have more bits set in the channel mask than
    the number of channels to specify the allowed channel positions but this is
    not allowed in negotiated caps. It is not allowed in any situation other
    than the one mentioned below to have less bits set in the channel mask than
    the number of channels.
    
    @GST_AUDIO_CHANNEL_POSITION_MONO can only be used with a single mono channel that
    has no direction information and would be mixed into all directional channels.
    This is expressed in caps by having a single channel and no channel mask.
    
    @GST_AUDIO_CHANNEL_POSITION_NONE can only be used if all channels have this position.
    This is expressed in caps by having a channel mask with no bits set.
    
    As another special case it is allowed to have two channels without a channel mask.
    This implicitly means that this is a stereo stream with a front left and front right
    channel.
*/
enum GstAudioChannelPosition
{
  /**
      used for position-less channels, e.g.
          from a sound card that records 1024 channels; mutually exclusive with
          any other channel position
  */
  None = -3,

  /**
      Mono without direction;
          can only be used with 1 channel
  */
  Mono = -2,

  /**
      invalid position
  */
  Invalid = -1,

  /**
      Front left
  */
  FrontLeft = 0,

  /**
      Front right
  */
  FrontRight = 1,

  /**
      Front center
  */
  FrontCenter = 2,

  /**
      Low-frequency effects 1 (subwoofer)
  */
  Lfe1 = 3,

  /**
      Rear left
  */
  RearLeft = 4,

  /**
      Rear right
  */
  RearRight = 5,

  /**
      Front left of center
  */
  FrontLeftOfCenter = 6,

  /**
      Front right of center
  */
  FrontRightOfCenter = 7,

  /**
      Rear center
  */
  RearCenter = 8,

  /**
      Low-frequency effects 2 (subwoofer)
  */
  Lfe2 = 9,

  /**
      Side left
  */
  SideLeft = 10,

  /**
      Side right
  */
  SideRight = 11,

  /**
      Top front left
  */
  TopFrontLeft = 12,

  /**
      Top front right
  */
  TopFrontRight = 13,

  /**
      Top front center
  */
  TopFrontCenter = 14,

  /**
      Top center
  */
  TopCenter = 15,

  /**
      Top rear left
  */
  TopRearLeft = 16,

  /**
      Top rear right
  */
  TopRearRight = 17,

  /**
      Top side right
  */
  TopSideLeft = 18,

  /**
      Top rear right
  */
  TopSideRight = 19,

  /**
      Top rear center
  */
  TopRearCenter = 20,

  /**
      Bottom front center
  */
  BottomFrontCenter = 21,

  /**
      Bottom front left
  */
  BottomFrontLeft = 22,

  /**
      Bottom front right
  */
  BottomFrontRight = 23,

  /**
      Wide left (between front left and side left)
  */
  WideLeft = 24,

  /**
      Wide right (between front right and side right)
  */
  WideRight = 25,

  /**
      Surround left (between rear left and side left)
  */
  SurroundLeft = 26,

  /**
      Surround right (between rear right and side right)
  */
  SurroundRight = 27,
}

/**
    Extra flags passed to [gstaudio.audio_converter.AudioConverter.new_] and [gstaudio.audio_converter.AudioConverter.samples].
*/
enum GstAudioConverterFlags : uint
{
  /**
      no flag
  */
  None = 0,

  /**
      the input sample arrays are writable and can be
         used as temporary storage during conversion.
  */
  InWritable = 1,

  /**
      allow arbitrary rate updates with
         [gstaudio.audio_converter.AudioConverter.updateConfig].
  */
  VariableRate = 2,
}

/**
    Set of available dithering methods.
*/
enum GstAudioDitherMethod
{
  /**
      No dithering
  */
  None = 0,

  /**
      Rectangular dithering
  */
  Rpdf = 1,

  /**
      Triangular dithering (default)
  */
  Tpdf = 2,

  /**
      High frequency triangular dithering
  */
  TpdfHf = 3,
}

/**
    Extra audio flags
*/
enum GstAudioFlags : uint
{
  /**
      no valid flag
  */
  None = 0,

  /**
      the position array explicitly
          contains unpositioned channels.
  */
  Unpositioned = 1,
}

/**
    Enum value describing the most common audio formats.
*/
enum GstAudioFormat
{
  /**
      unknown or unset audio format
  */
  Unknown = 0,

  /**
      encoded audio format
  */
  Encoded = 1,

  /**
      8 bits in 8 bits, signed
  */
  S8 = 2,

  /**
      8 bits in 8 bits, unsigned
  */
  U8 = 3,

  /**
      16 bits in 16 bits, signed, little endian
  */
  S16le = 4,

  /**
      16 bits in 16 bits, signed, big endian
  */
  S16be = 5,

  /**
      16 bits in 16 bits, unsigned, little endian
  */
  U16le = 6,

  /**
      16 bits in 16 bits, unsigned, big endian
  */
  U16be = 7,

  /**
      24 bits in 32 bits, signed, little endian
  */
  S2432le = 8,

  /**
      24 bits in 32 bits, signed, big endian
  */
  S2432be = 9,

  /**
      24 bits in 32 bits, unsigned, little endian
  */
  U2432le = 10,

  /**
      24 bits in 32 bits, unsigned, big endian
  */
  U2432be = 11,

  /**
      32 bits in 32 bits, signed, little endian
  */
  S32le = 12,

  /**
      32 bits in 32 bits, signed, big endian
  */
  S32be = 13,

  /**
      32 bits in 32 bits, unsigned, little endian
  */
  U32le = 14,

  /**
      32 bits in 32 bits, unsigned, big endian
  */
  U32be = 15,

  /**
      24 bits in 24 bits, signed, little endian
  */
  S24le = 16,

  /**
      24 bits in 24 bits, signed, big endian
  */
  S24be = 17,

  /**
      24 bits in 24 bits, unsigned, little endian
  */
  U24le = 18,

  /**
      24 bits in 24 bits, unsigned, big endian
  */
  U24be = 19,

  /**
      20 bits in 24 bits, signed, little endian
  */
  S20le = 20,

  /**
      20 bits in 24 bits, signed, big endian
  */
  S20be = 21,

  /**
      20 bits in 24 bits, unsigned, little endian
  */
  U20le = 22,

  /**
      20 bits in 24 bits, unsigned, big endian
  */
  U20be = 23,

  /**
      18 bits in 24 bits, signed, little endian
  */
  S18le = 24,

  /**
      18 bits in 24 bits, signed, big endian
  */
  S18be = 25,

  /**
      18 bits in 24 bits, unsigned, little endian
  */
  U18le = 26,

  /**
      18 bits in 24 bits, unsigned, big endian
  */
  U18be = 27,

  /**
      32-bit floating point samples, little endian
  */
  F32le = 28,

  /**
      32-bit floating point samples, big endian
  */
  F32be = 29,

  /**
      64-bit floating point samples, little endian
  */
  F64le = 30,

  /**
      64-bit floating point samples, big endian
  */
  F64be = 31,

  /**
      16 bits in 16 bits, signed, native endianness
  */
  S16 = 4,

  /**
      16 bits in 16 bits, unsigned, native endianness
  */
  U16 = 6,

  /**
      24 bits in 32 bits, signed, native endianness
  */
  S2432 = 8,

  /**
      24 bits in 32 bits, unsigned, native endianness
  */
  U2432 = 10,

  /**
      32 bits in 32 bits, signed, native endianness
  */
  S32 = 12,

  /**
      32 bits in 32 bits, unsigned, native endianness
  */
  U32 = 14,

  /**
      24 bits in 24 bits, signed, native endianness
  */
  S24 = 16,

  /**
      24 bits in 24 bits, unsigned, native endianness
  */
  U24 = 18,

  /**
      20 bits in 24 bits, signed, native endianness
  */
  S20 = 20,

  /**
      20 bits in 24 bits, unsigned, native endianness
  */
  U20 = 22,

  /**
      18 bits in 24 bits, signed, native endianness
  */
  S18 = 24,

  /**
      18 bits in 24 bits, unsigned, native endianness
  */
  U18 = 26,

  /**
      32-bit floating point samples, native endianness
  */
  F32 = 28,

  /**
      64-bit floating point samples, native endianness
  */
  F64 = 30,
}

/**
    The different audio flags that a format info can have.
*/
enum GstAudioFormatFlags : uint
{
  /**
      integer samples
  */
  Integer = 1,

  /**
      float samples
  */
  Float = 2,

  /**
      signed samples
  */
  Signed = 4,

  /**
      complex layout
  */
  Complex = 16,

  /**
      the format can be used in
      #GstAudioFormatUnpack and #GstAudioFormatPack functions
  */
  Unpack = 32,
}

/**
    Layout of the audio samples for the different channels.
*/
enum GstAudioLayout
{
  /**
      interleaved audio
  */
  Interleaved = 0,

  /**
      non-interleaved audio
  */
  NonInterleaved = 1,
}

/**
    Set of available noise shaping methods
*/
enum GstAudioNoiseShapingMethod
{
  /**
      No noise shaping (default)
  */
  None = 0,

  /**
      Error feedback
  */
  ErrorFeedback = 1,

  /**
      Simple 2-pole noise shaping
  */
  Simple = 2,

  /**
      Medium 5-pole noise shaping
  */
  Medium = 3,

  /**
      High 8-pole noise shaping
  */
  High = 4,
}

/**
    The different flags that can be used when packing and unpacking.
*/
enum GstAudioPackFlags : uint
{
  /**
      No flag
  */
  None = 0,

  /**
      When the source has a smaller depth
        than the target format, set the least significant bits of the target
        to 0. This is likely slightly faster but less accurate. When this flag
        is not specified, the most significant bits of the source are duplicated
        in the least significant bits of the destination.
  */
  TruncateRange = 1,
}

/**
    Extra flags that can be passed to [gstaudio.audio_quantize.AudioQuantize.new_]
*/
enum GstAudioQuantizeFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      samples are non-interleaved
  */
  NonInterleaved = 1,
}

/**
    The different filter interpolation methods.
*/
enum GstAudioResamplerFilterInterpolation
{
  /**
      no interpolation
  */
  None = 0,

  /**
      linear interpolation of the
        filter coefficients.
  */
  Linear = 1,

  /**
      cubic interpolation of the
        filter coefficients.
  */
  Cubic = 2,
}

/**
    Select for the filter tables should be set up.
*/
enum GstAudioResamplerFilterMode
{
  /**
      Use interpolated filter tables. This
          uses less memory but more CPU and is slightly less accurate but it allows for more
          efficient variable rate resampling with [gstaudio.audio_resampler.AudioResampler.update].
  */
  Interpolated = 0,

  /**
      Use full filter table. This uses more memory
          but less CPU.
  */
  Full = 1,

  /**
      Automatically choose between interpolated
          and full filter tables.
  */
  Auto = 2,
}

/**
    Different resampler flags.
*/
enum GstAudioResamplerFlags : uint
{
  /**
      no flags
  */
  None = 0,

  /**
      input samples are non-interleaved.
         an array of blocks of samples, one for each channel, should be passed to the
         resample function.
  */
  NonInterleavedIn = 1,

  /**
      output samples are non-interleaved.
         an array of blocks of samples, one for each channel, should be passed to the
         resample function.
  */
  NonInterleavedOut = 2,

  /**
      optimize for dynamic updates of the sample
         rates with [gstaudio.audio_resampler.AudioResampler.update]. This will select an interpolating filter
         when #GST_AUDIO_RESAMPLER_FILTER_MODE_AUTO is configured.
  */
  VariableRate = 4,
}

/**
    Different subsampling and upsampling methods
*/
enum GstAudioResamplerMethod
{
  /**
      Duplicates the samples when
         upsampling and drops when downsampling
  */
  Nearest = 0,

  /**
      Uses linear interpolation to reconstruct
         missing samples and averaging to downsample
  */
  Linear = 1,

  /**
      Uses cubic interpolation
  */
  Cubic = 2,

  /**
      Uses Blackman-Nuttall windowed sinc interpolation
  */
  BlackmanNuttall = 3,

  /**
      Uses Kaiser windowed sinc interpolation
  */
  Kaiser = 4,
}

/**
    The format of the samples in the ringbuffer.
*/
enum GstAudioRingBufferFormatType
{
  /**
      samples in linear or float
  */
  Raw = 0,

  /**
      samples in mulaw
  */
  MuLaw = 1,

  /**
      samples in alaw
  */
  ALaw = 2,

  /**
      samples in ima adpcm
  */
  ImaAdpcm = 3,

  /**
      samples in mpeg audio (but not AAC) format
  */
  Mpeg = 4,

  /**
      samples in gsm format
  */
  Gsm = 5,

  /**
      samples in IEC958 frames (e.g. AC3)
  */
  Iec958 = 6,

  /**
      samples in AC3 format
  */
  Ac3 = 7,

  /**
      samples in EAC3 format
  */
  Eac3 = 8,

  /**
      samples in DTS format
  */
  Dts = 9,

  /**
      samples in MPEG-2 AAC ADTS format
  */
  Mpeg2Aac = 10,

  /**
      samples in MPEG-4 AAC ADTS format
  */
  Mpeg4Aac = 11,

  /**
      samples in MPEG-2 AAC raw format (Since: 1.12)
  */
  Mpeg2AacRaw = 12,

  /**
      samples in MPEG-4 AAC raw format (Since: 1.12)
  */
  Mpeg4AacRaw = 13,

  /**
      samples in FLAC format (Since: 1.12)
  */
  Flac = 14,

  /**
      samples in DSD format (Since: 1.24)
  */
  Dsd = 15,
}

/**
    The state of the ringbuffer.
*/
enum GstAudioRingBufferState
{
  /**
      The ringbuffer is stopped
  */
  Stopped = 0,

  /**
      The ringbuffer is paused
  */
  Paused = 1,

  /**
      The ringbuffer is started
  */
  Started = 2,

  /**
      The ringbuffer has encountered an
          error after it has been started, e.g. because the device was
          disconnected (Since: 1.2)
  */
  Error = 3,
}

/**
    Enum value describing how DSD bits are grouped.
*/
enum GstDsdFormat
{
  /**
      unknown / invalid DSD format
  */
  DsdFormatUnknown = 0,

  /**
      8 DSD bits in 1 byte
  */
  DsdFormatU8 = 1,

  /**
      16 DSD bits in 2 bytes, little endian order
  */
  DsdFormatU16le = 2,

  /**
      16 DSD bits in 2 bytes, big endian order
  */
  DsdFormatU16be = 3,

  /**
      32 DSD bits in 4 bytes, little endian order
  */
  DsdFormatU32le = 4,

  /**
      32 DSD bits in 4 bytes, big endian order
  */
  DsdFormatU32be = 5,

  /**
      number of valid DSD formats
  */
  NumDsdFormats = 6,

  /**
      16 DSD bits in 2 bytes, native endianness
  */
  DsdFormatU16 = 2,

  /**
      32 DSD bits in 4 bytes, native endianness
  */
  DsdFormatU32 = 4,
}

/**
    Different representations of a stream volume. [gstaudio.stream_volume.StreamVolume.convertVolume]
    allows to convert between the different representations.
    
    Formulas to convert from a linear to a cubic or dB volume are
    cbrt(val) and 20 * log10 (val).
*/
enum GstStreamVolumeFormat
{
  /**
      Linear scale factor, 1.0 = 100%
  */
  Linear = 0,

  /**
      Cubic volume scale
  */
  Cubic = 1,

  /**
      Logarithmic volume scale (dB, amplitude not power)
  */
  Db = 2,
}

/**
    Subclasses must use (a subclass of) #GstAudioAggregatorPad for both
    their source and sink pads,
    [gst.element_class.ElementClass.addStaticPadTemplateWithGtype] is a convenient
    helper.
    
    #GstAudioAggregator can perform conversion on the data arriving
    on its sink pads, based on the format expected downstream: in order
    to enable that behaviour, the GType of the sink pads must either be
    a (subclass of) #GstAudioAggregatorConvertPad to use the default
    #GstAudioConverter implementation, or a subclass of #GstAudioAggregatorPad
    implementing #GstAudioAggregatorPadClass.convert_buffer.
    
    To allow for the output caps to change, the mechanism is the same as
    above, with the GType of the source pad.
    
    See #GstAudioMixer for an example.
    
    When conversion is enabled, #GstAudioAggregator will accept
    any type of raw audio caps and perform conversion
    on the data arriving on its sink pads, with whatever downstream
    expects as the target format.
    
    In case downstream caps are not fully fixated, it will use
    the first configured sink pad to finish fixating its source pad
    caps.
    
    A notable exception for now is the sample rate, sink pads must
    have the same sample rate as either the downstream requirement,
    or the first configured pad, or a combination of both (when
    downstream specifies a range or a set of acceptable rates).
    
    The #GstAggregator::samples-selected signal is provided with some
    additional information about the output buffer:
    $(LIST
      * "offset"  G_TYPE_UINT64   Offset in samples since segment start
        for the position that is next to be filled in the output buffer.
      * "frames"  G_TYPE_UINT   Number of frames per output buffer.
    )
      
    In addition the [gstbase.aggregator.Aggregator.peekNextSample] function returns
    additional information in the info #GstStructure of the returned sample:
    $(LIST
      * "output-offset"  G_TYPE_UINT64   Sample offset in output segment relative to
        the output segment's start where the current position of this input
        buffer would be placed
      * "position"  G_TYPE_UINT   current position in the input buffer in samples
      * "size"  G_TYPE_UINT   size of the input buffer in samples
    )
*/
struct GstAudioAggregator
{
  /** */
  GstAggregator parent;

  /**
      The caps set by the subclass
  */
  GstCaps* currentCaps;

  /** */
  GstAudioAggregatorPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioAggregatorClass
{
  /** */
  GstAggregatorClass parentClass;

  /**
      Create a new output buffer contains num_frames frames.
  */
  extern(C) GstBuffer* function(GstAudioAggregator* aagg, uint numFrames) createOutputBuffer;

  /**
      Aggregates one input buffer to the output
       buffer.  The in_offset and out_offset are in "frames", which is
       the size of a sample times the number of channels. Returns TRUE if
       any non-silence was added to the buffer
  */
  extern(C) gboolean function(GstAudioAggregator* aagg, GstAudioAggregatorPad* pad, GstBuffer* inbuf, uint inOffset, GstBuffer* outbuf, uint outOffset, uint numFrames) aggregateOneBuffer;

  /** */
  void*[20] GstReserved;
}

/**
    An implementation of GstPad that can be used with #GstAudioAggregator.
    
    See #GstAudioAggregator for more details.
*/
struct GstAudioAggregatorConvertPad
{
  /** */
  GstAudioAggregatorPad parent;

  /** */
  GstAudioAggregatorConvertPadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioAggregatorConvertPadClass
{
  /** */
  GstAudioAggregatorPadClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioAggregatorConvertPadPrivate;

/**
    The default implementation of GstPad used with #GstAudioAggregator
*/
struct GstAudioAggregatorPad
{
  /** */
  GstAggregatorPad parent;

  /**
      The audio info for this pad set from the incoming caps
  */
  GstAudioInfo info;

  /** */
  GstAudioAggregatorPadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioAggregatorPadClass
{
  /** */
  GstAggregatorPadClass parentClass;

  /**
      Convert a buffer from one format to another.
  */
  extern(C) GstBuffer* function(GstAudioAggregatorPad* pad, GstAudioInfo* inInfo, GstAudioInfo* outInfo, GstBuffer* buffer) convertBuffer;

  /**
      Called when either the input or output
       formats have changed.
  */
  extern(C) void function(GstAudioAggregatorPad* pad) updateConversionInfo;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstAudioAggregatorPadPrivate;

/** */
struct GstAudioAggregatorPrivate;

/**
    This is the base class for audio sinks. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    writing samples to the ringbuffer, synchronisation, clipping and flushing.
*/
struct GstAudioBaseSink
{
  /** */
  GstBaseSink element;

  /** */
  GstAudioRingBuffer* ringbuffer;

  /** */
  ulong bufferTime;

  /** */
  ulong latencyTime;

  /** */
  ulong nextSample;

  /** */
  GstClock* providedClock;

  /** */
  gboolean eosRendering;

  /** */
  GstAudioBaseSinkPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    #GstAudioBaseSink class. Override the vmethod to implement
    functionality.
*/
struct GstAudioBaseSinkClass
{
  /**
      the parent class.
  */
  GstBaseSinkClass parentClass;

  /**
      create and return a #GstAudioRingBuffer to write to.
  */
  extern(C) GstAudioRingBuffer* function(GstAudioBaseSink* sink) createRingbuffer;

  /**
      payload data in a format suitable to write to the sink. If no
                payloading is required, returns a reffed copy of the original
                buffer, else returns the payloaded buffer with all other metadata
                copied.
  */
  extern(C) GstBuffer* function(GstAudioBaseSink* sink, GstBuffer* buffer) payload;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioBaseSinkPrivate;

/**
    This is the base class for audio sources. Subclasses need to implement the
    ::create_ringbuffer vmethod. This base class will then take care of
    reading samples from the ringbuffer, synchronisation and flushing.
*/
struct GstAudioBaseSrc
{
  /** */
  GstPushSrc element;

  /** */
  GstAudioRingBuffer* ringbuffer;

  /** */
  GstClockTime bufferTime;

  /** */
  GstClockTime latencyTime;

  /** */
  ulong nextSample;

  /** */
  GstClock* clock;

  /** */
  GstAudioBaseSrcPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    #GstAudioBaseSrc class. Override the vmethod to implement
    functionality.
*/
struct GstAudioBaseSrcClass
{
  /**
      the parent class.
  */
  GstPushSrcClass parentClass;

  /**
      create and return a #GstAudioRingBuffer to read from.
  */
  extern(C) GstAudioRingBuffer* function(GstAudioBaseSrc* src) createRingbuffer;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioBaseSrcPrivate;

/**
    A structure containing the result of an audio buffer map operation,
    which is executed with [gstaudio.audio_buffer.AudioBuffer.map]. For non-interleaved (planar)
    buffers, the beginning of each channel in the buffer has its own pointer in
    the @planes array. For interleaved buffers, the @planes array only contains
    one item, which is the pointer to the beginning of the buffer, and @n_planes
    equals 1.
    
    The different channels in @planes are always in the GStreamer channel order.
*/
struct GstAudioBuffer
{
  /**
      a #GstAudioInfo describing the audio properties of this buffer
  */
  GstAudioInfo info;

  /**
      the size of the buffer in samples
  */
  size_t nSamples;

  /**
      the number of planes available
  */
  int nPlanes;

  /**
      an array of @n_planes pointers pointing to the start of each
        plane in the mapped buffer
  */
  void** planes;

  /**
      the mapped buffer
  */
  GstBuffer* buffer;

  /** */
  GstMapInfo* mapInfos;

  /** */
  void*[8] privPlanesArr;

  /** */
  GstMapInfo[8] privMapInfosArr;

  /** */
  void*[4] GstReserved;
}

/**
    Provides a base class for CD digital audio (CDDA) sources, which handles
    things like seeking, querying, discid calculation, tags, and buffer
    timestamping.
    
    ## Using GstAudioCdSrc-based elements in applications
    
    GstAudioCdSrc registers two #GstFormat<!-- -->s of its own, namely
    the "track" format and the "sector" format. Applications will usually
    only find the "track" format interesting. You can retrieve that #GstFormat
    for use in seek events or queries with gst_format_get_by_nick("track").
    
    In order to query the number of tracks, for example, an application would
    set the CDDA source element to READY or PAUSED state and then query the
    the number of tracks via [gst.element.Element.queryDuration] using the track
    format acquired above. Applications can query the currently playing track
    in the same way.
    
    Alternatively, applications may retrieve the currently playing track and
    the total number of tracks from the taglist that will posted on the bus
    whenever the CD is opened or the currently playing track changes. The
    taglist will contain GST_TAG_TRACK_NUMBER and GST_TAG_TRACK_COUNT tags.
    
    Applications playing back CD audio using playbin and cdda://n URIs should
    issue a seek command in track format to change between tracks, rather than
    setting a new cdda://n+1 URI on playbin (as setting a new URI on playbin
    involves closing and re-opening the CD device, which is much much slower).
    
    ## Tags and meta-information
    
    CDDA sources will automatically emit a number of tags, details about which
    can be found in the libgsttag documentation. Those tags are:
    #GST_TAG_CDDA_CDDB_DISCID, #GST_TAG_CDDA_CDDB_DISCID_FULL,
    #GST_TAG_CDDA_MUSICBRAINZ_DISCID, #GST_TAG_CDDA_MUSICBRAINZ_DISCID_FULL,
    among others.
    
    ## Tracks and Table of Contents (TOC)
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus. The #GstToc will contain a #GstTocEntry for
    each track, with information about each track. The duration for each
    track can be retrieved via the #GST_TAG_DURATION tag from each entry's
    tag list, or calculated via [gst.toc_entry.TocEntry.getStartStopTimes].
    The track entries in the TOC will be sorted by track number.
*/
struct GstAudioCdSrc
{
  /** */
  GstPushSrc pushsrc;

  /** */
  GstTagList* tags;

  /** */
  GstAudioCdSrcPrivate* priv;

  /** */
  uint[2] GstReserved1;

  /** */
  void*[2] GstReserved2;
}

/**
    Audio CD source base class.
*/
struct GstAudioCdSrcClass
{
  /**
      the parent class
  */
  GstPushSrcClass pushsrcClass;

  /**
      opening the device
  */
  extern(C) gboolean function(GstAudioCdSrc* src, const(char)* device) open;

  /**
      closing the device
  */
  extern(C) void function(GstAudioCdSrc* src) close;

  /**
      reading a sector
  */
  extern(C) GstBuffer* function(GstAudioCdSrc* src, int sector) readSector;

  /** */
  void*[20] GstReserved;
}

/** */
struct GstAudioCdSrcPrivate;

/**
    CD track abstraction to communicate TOC entries to the base class.
    
    This structure is only for use by sub-classed in connection with
    [gstaudio.audio_cd_src.AudioCdSrc.addTrack].
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus instead.
*/
struct GstAudioCdSrcTrack
{
  /**
      Whether this is an audio track
  */
  gboolean isAudio;

  /**
      Track number in TOC (usually starts from 1, but not always)
  */
  uint num;

  /**
      The first sector of this track (LBA)
  */
  uint start;

  /**
      The last sector of this track (LBA)
  */
  uint end;

  /**
      Track-specific tags (e.g. from cd-text information), or NULL
  */
  GstTagList* tags;

  /** */
  uint[2] GstReserved1;

  /** */
  void*[2] GstReserved2;
}

/** */
struct GstAudioChannelMixer;

/**
    Extra buffer metadata describing how much audio has to be clipped from
    the start or end of a buffer. This is used for compressed formats, where
    the first frame usually has some additional samples due to encoder and
    decoder delays, and the last frame usually has some additional samples to
    be able to fill the complete last frame.
    
    This is used to ensure that decoded data in the end has the same amount of
    samples, and multiply decoded streams can be gaplessly concatenated.
    
    Note: If clipping of the start is done by adjusting the segment, this meta
    has to be dropped from buffers as otherwise clipping could happen twice.
*/
struct GstAudioClippingMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
  */
  GstFormat format;

  /**
      Amount of audio to clip from start of buffer
  */
  ulong start;

  /**
      Amount of  to clip from end of buffer
  */
  ulong end;
}

/**
    #GstAudioClock makes it easy for elements to implement a #GstClock, they
    simply need to provide a function that returns the current clock time.
    
    This object is internally used to implement the clock in #GstAudioBaseSink.
*/
struct GstAudioClock
{
  /** */
  GstSystemClock clock;

  /** */
  GstAudioClockGetTimeFunc func;

  /** */
  void* userData;

  /** */
  GDestroyNotify destroyNotify;

  /** */
  GstClockTime lastTime;

  /** */
  GstClockTimeDiff timeOffset;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioClockClass
{
  /** */
  GstSystemClockClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    This object is used to convert audio samples from one format to another.
    The object can perform conversion of:
    
     $(LIST
        * audio format with optional dithering and noise shaping
       
        * audio samplerate
       
        * audio channels and channel layout
     )
*/
struct GstAudioConverter;

/**
    This base class is for audio decoders turning encoded data into
    raw audio samples.
    
    GstAudioDecoder and subclass should cooperate as follows.
    
    ## Configuration
    
      $(LIST
          * Initially, GstAudioDecoder calls @start when the decoder element
            is activated, which allows subclass to perform any global setup.
            Base class (context) parameters can already be set according to subclass
            capabilities (or possibly upon receive more information in subsequent
            @set_format).
          * GstAudioDecoder calls @set_format to inform subclass of the format
            of input audio data that it is about to receive.
            While unlikely, it might be called more than once, if changing input
            parameters require reconfiguration.
          * GstAudioDecoder calls @stop at end of all processing.
      )
        
    As of configuration stage, and throughout processing, GstAudioDecoder
    provides various (context) parameters, e.g. describing the format of
    output audio data (valid when output caps have been set) or current parsing state.
    Conversely, subclass can and should configure context to inform
    base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
        $(LIST
              * Base class gathers input data, and optionally allows subclass
                to parse this into subsequently manageable (as defined by subclass)
                chunks.  Such chunks are subsequently referred to as 'frames',
                though they may or may not correspond to 1 (or more) audio format frame.
              * Input frame is provided to subclass' @handle_frame.
              * If codec processing results in decoded data, subclass should call
                @gst_audio_decoder_finish_frame to have decoded data pushed
                downstream.
              * Just prior to actually pushing a buffer downstream,
                it is passed to @pre_push.  Subclass should either use this callback
                to arrange for additional downstream pushing or otherwise ensure such
                custom pushing occurs after at least a method call has finished since
                setting src pad caps.
              * During the parsing process GstAudioDecoderClass will handle both
                srcpad and sinkpad events. Sink events will be passed to subclass
                if @event callback has been provided.
        )
          
    ## Shutdown phase
    
      $(LIST
          * GstAudioDecoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to set the fixed caps on srcpad, when the format is ensured.  This
    is typically when base class calls subclass' @set_format function, though
    it might be delayed until calling @gst_audio_decoder_finish_frame.
    
    In summary, above process should have subclass concentrating on
    codec data processing while leaving other matters to base class,
    such as most notably timestamp handling.  While it may exert more control
    in this area (see e.g. @pre_push), it is very much not recommended.
    
    In particular, base class will try to arrange for perfect output timestamps
    as much as possible while tracking upstream timestamps.
    To this end, if deviation between the next ideal expected perfect timestamp
    and upstream exceeds #GstAudioDecoder:tolerance, then resync to upstream
    occurs (which would happen always if the tolerance mechanism is disabled).
    
    In non-live pipelines, baseclass can also (configurably) arrange for
    output buffer aggregation which may help to redue large(r) numbers of
    small(er) buffers being pushed and processed downstream. Note that this
    feature is only available if the buffer layout is interleaved. For planar
    buffers, the decoder implementation is fully responsible for the output
    buffer size.
    
    On the other hand, it should be noted that baseclass only provides limited
    seeking support (upon explicit subclass request), as full-fledged support
    should rather be left to upstream demuxer, parser or alike.  This simple
    approach caters for seeking and duration reporting using estimated input
    bitrates.
    
    Things that subclass need to take care of:
    
      $(LIST
          * Provide pad templates
          * Set source pad caps when appropriate
          * Set user-configurable properties to sane defaults for format and
             implementing codec at hand, and convey some subclass capabilities and
             expectations in context.
        
          * Accept data in @handle_frame and provide encoded results to
             @gst_audio_decoder_finish_frame.  If it is prepared to perform
             PLC, it should also accept NULL data in @handle_frame and provide for
             data for indicated duration.
      )
*/
struct GstAudioDecoder
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  GRecMutex streamLock;

  /** */
  GstSegment inputSegment;

  /** */
  GstSegment outputSegment;

  /** */
  GstAudioDecoderPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum @handle_frame (and likely @set_format) needs to be
    overridden.
*/
struct GstAudioDecoderClass
{
  /**
      The parent class structure
  */
  GstElementClass elementClass;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstAudioDecoder* dec) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstAudioDecoder* dec) stop;

  /**
      Notifies subclass of incoming data format (caps).
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstCaps* caps) setFormat;

  /**
      Optional.
                       Allows chopping incoming data into manageable units (frames)
                       for subsequent decoding.  This division is at subclass
                       discretion and may or may not correspond to 1 (or more)
                       frames as defined by audio format.
  */
  extern(C) GstFlowReturn function(GstAudioDecoder* dec, GstAdapter* adapter, int* offset, int* length) parse;

  /**
      Provides input data (or NULL to clear any remaining data)
                       to subclass.  Input data ref management is performed by
                       base class, subclass should not care or intervene,
                       and input data is only valid until next call to base class,
                       most notably a call to [gstaudio.audio_decoder.AudioDecoder.finishFrame].
  */
  extern(C) GstFlowReturn function(GstAudioDecoder* dec, GstBuffer* buffer) handleFrame;

  /**
      Optional.
                       Instructs subclass to clear any codec caches and discard
                       any pending samples and not yet returned decoded data.
                       @hard indicates whether a FLUSH is being processed,
                       or otherwise a DISCONT (or conceptually similar).
  */
  extern(C) void function(GstAudioDecoder* dec, gboolean hard) flush;

  /**
      Optional.
                       Called just prior to pushing (encoded data) buffer downstream.
                       Subclass has full discretionary access to buffer,
                       and a not OK flow return will abort downstream pushing.
  */
  extern(C) GstFlowReturn function(GstAudioDecoder* dec, GstBuffer** buffer) prePush;

  /**
      Optional.
                       Event handler on the sink pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the src pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstEvent* event) srcEvent;

  /**
      Optional.
                       Called when the element changes to GST_STATE_READY.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstAudioDecoder* dec) open;

  /**
      Optional.
                       Called when the element changes to GST_STATE_NULL.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstAudioDecoder* dec) close;

  /**
      Optional.
                       Negotiate with downstream and configure buffer pools, etc.
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstAudioDecoder* dec) negotiate;

  /**
      Optional.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
                          Subclasses should chain up to the parent implementation to
                          invoke the default handler.
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstQuery* query) decideAllocation;

  /**
      Optional.
                           Propose buffer allocation parameters for upstream elements.
                           Subclasses should chain up to the parent implementation to
                           invoke the default handler.
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstQuery* query) proposeAllocation;

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstQuery* query) sinkQuery;

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  */
  extern(C) gboolean function(GstAudioDecoder* dec, GstQuery* query) srcQuery;

  /**
      Optional.
                       Allows for a custom sink getcaps implementation.
                       If not implemented,
                       default returns gst_audio_decoder_proxy_getcaps
                       applied to sink template caps.
  */
  extern(C) GstCaps* function(GstAudioDecoder* dec, GstCaps* filter) getcaps;

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method copies all meta without
                       tags and meta with only the "audio" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  */
  extern(C) gboolean function(GstAudioDecoder* enc, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) transformMeta;

  /** */
  void*[16] GstReserved;
}

/** */
struct GstAudioDecoderPrivate;

/**
    Extra buffer metadata describing audio downmixing matrix. This metadata is
    attached to audio buffers and contains a matrix to downmix the buffer number
    of channels to @channels.
    
    @matrix is an two-dimensional array of @to_channels times @from_channels
    coefficients, i.e. the i-th output channels is constructed by multiplicating
    the input channels with the coefficients in @matrix[i] and taking the sum
    of the results.
*/
struct GstAudioDownmixMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the channel positions of the source
  */
  GstAudioChannelPosition* fromPosition;

  /**
      the channel positions of the destination
  */
  GstAudioChannelPosition* toPosition;

  /**
      the number of channels of the source
  */
  int fromChannels;

  /**
      the number of channels of the destination
  */
  int toChannels;

  /**
      the matrix coefficients.
  */
  float** matrix;
}

/**
    This base class is for audio encoders turning raw audio samples into
    encoded audio data.
    
    GstAudioEncoder and subclass should cooperate as follows.
    
    ## Configuration
    
      $(LIST
          * Initially, GstAudioEncoder calls @start when the encoder element
            is activated, which allows subclass to perform any global setup.
        
          * GstAudioEncoder calls @set_format to inform subclass of the format
            of input audio data that it is about to receive.  Subclass should
            setup for encoding and configure various base class parameters
            appropriately, notably those directing desired input data handling.
            While unlikely, it might be called more than once, if changing input
            parameters require reconfiguration.
        
          * GstAudioEncoder calls @stop at end of all processing.
      )
        
    As of configuration stage, and throughout processing, GstAudioEncoder
    maintains various parameters that provide required context,
    e.g. describing the format of input audio data.
    Conversely, subclass can and should configure these context parameters
    to inform base class of its expectation w.r.t. buffer handling.
    
    ## Data processing
    
        $(LIST
              * Base class gathers input sample data (as directed by the context's
                frame_samples and frame_max) and provides this to subclass' @handle_frame.
              * If codec processing results in encoded data, subclass should call
                [gstaudio.audio_encoder.AudioEncoder.finishFrame] to have encoded data pushed
                downstream. Alternatively, it might also call
                [gstaudio.audio_encoder.AudioEncoder.finishFrame] (with a NULL buffer and some number of
                dropped samples) to indicate dropped (non-encoded) samples.
              * Just prior to actually pushing a buffer downstream,
                it is passed to @pre_push.
              * During the parsing process GstAudioEncoderClass will handle both
                srcpad and sinkpad events. Sink events will be passed to subclass
                if @event callback has been provided.
        )
          
    ## Shutdown phase
    
      $(LIST
          * GstAudioEncoder class calls @stop to inform the subclass that data
            parsing will be stopped.
      )
        
    Subclass is responsible for providing pad template caps for
    source and sink pads. The pads need to be named "sink" and "src". It also
    needs to set the fixed caps on srcpad, when the format is ensured.  This
    is typically when base class calls subclass' @set_format function, though
    it might be delayed until calling @gst_audio_encoder_finish_frame.
    
    In summary, above process should have subclass concentrating on
    codec data processing while leaving other matters to base class,
    such as most notably timestamp handling.  While it may exert more control
    in this area (see e.g. @pre_push), it is very much not recommended.
    
    In particular, base class will either favor tracking upstream timestamps
    (at the possible expense of jitter) or aim to arrange for a perfect stream of
    output timestamps, depending on #GstAudioEncoder:perfect-timestamp.
    However, in the latter case, the input may not be so perfect or ideal, which
    is handled as follows.  An input timestamp is compared with the expected
    timestamp as dictated by input sample stream and if the deviation is less
    than #GstAudioEncoder:tolerance, the deviation is discarded.
    Otherwise, it is considered a discontuinity and subsequent output timestamp
    is resynced to the new position after performing configured discontinuity
    processing.  In the non-perfect-timestamp case, an upstream variation
    exceeding tolerance only leads to marking DISCONT on subsequent outgoing
    (while timestamps are adjusted to upstream regardless of variation).
    While DISCONT is also marked in the perfect-timestamp case, this one
    optionally (see #GstAudioEncoder:hard-resync)
    performs some additional steps, such as clipping of (early) input samples
    or draining all currently remaining input data, depending on the direction
    of the discontuinity.
    
    If perfect timestamps are arranged, it is also possible to request baseclass
    (usually set by subclass) to provide additional buffer metadata (in OFFSET
    and OFFSET_END) fields according to granule defined semantics currently
    needed by oggmux.  Specifically, OFFSET is set to granulepos (= sample count
    including buffer) and OFFSET_END to corresponding timestamp (as determined
    by same sample count and sample rate).
    
    Things that subclass need to take care of:
    
      $(LIST
          * Provide pad templates
          * Set source pad caps when appropriate
          * Inform base class of buffer processing needs using context's
             frame_samples and frame_bytes.
          * Set user-configurable properties to sane defaults for format and
             implementing codec at hand, e.g. those controlling timestamp behaviour
             and discontinuity processing.
          * Accept data in @handle_frame and provide encoded results to
             [gstaudio.audio_encoder.AudioEncoder.finishFrame].
      )
*/
struct GstAudioEncoder
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  GRecMutex streamLock;

  /** */
  GstSegment inputSegment;

  /** */
  GstSegment outputSegment;

  /** */
  GstAudioEncoderPrivate* priv;

  /** */
  void*[20] GstReserved;
}

/**
    Subclasses can override any of the available virtual methods or not, as
    needed. At minimum @set_format and @handle_frame needs to be overridden.
*/
struct GstAudioEncoderClass
{
  /**
      The parent class structure
  */
  GstElementClass elementClass;

  /**
      Optional.
                       Called when the element starts processing.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstAudioEncoder* enc) start;

  /**
      Optional.
                       Called when the element stops processing.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstAudioEncoder* enc) stop;

  /**
      Notifies subclass of incoming data format.
                       GstAudioInfo contains the format according to provided caps.
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstAudioInfo* info) setFormat;

  /**
      Provides input samples (or NULL to clear any remaining data)
                       according to directions as configured by the subclass
                       using the API.  Input data ref management is performed
                       by base class, subclass should not care or intervene,
                       and input data is only valid until next call to base class,
                       most notably a call to [gstaudio.audio_encoder.AudioEncoder.finishFrame].
  */
  extern(C) GstFlowReturn function(GstAudioEncoder* enc, GstBuffer* buffer) handleFrame;

  /**
      Optional.
                       Instructs subclass to clear any codec caches and discard
                       any pending samples and not yet returned encoded data.
  */
  extern(C) void function(GstAudioEncoder* enc) flush;

  /**
      Optional.
                       Called just prior to pushing (encoded data) buffer downstream.
                       Subclass has full discretionary access to buffer,
                       and a not OK flow return will abort downstream pushing.
  */
  extern(C) GstFlowReturn function(GstAudioEncoder* enc, GstBuffer** buffer) prePush;

  /**
      Optional.
                       Event handler on the sink pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstEvent* event) sinkEvent;

  /**
      Optional.
                       Event handler on the src pad. Subclasses should chain up to
                       the parent implementation to invoke the default handler.
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstEvent* event) srcEvent;

  /**
      Optional.
                       Allows for a custom sink getcaps implementation (e.g.
                       for multichannel input specification).  If not implemented,
                       default returns gst_audio_encoder_proxy_getcaps
                       applied to sink template caps.
  */
  extern(C) GstCaps* function(GstAudioEncoder* enc, GstCaps* filter) getcaps;

  /**
      Optional.
                       Called when the element changes to GST_STATE_READY.
                       Allows opening external resources.
  */
  extern(C) gboolean function(GstAudioEncoder* enc) open;

  /**
      Optional.
                       Called when the element changes to GST_STATE_NULL.
                       Allows closing external resources.
  */
  extern(C) gboolean function(GstAudioEncoder* enc) close;

  /**
      Optional.
                       Negotiate with downstream and configure buffer pools, etc.
                       Subclasses should chain up to the parent implementation to
                       invoke the default handler.
  */
  extern(C) gboolean function(GstAudioEncoder* enc) negotiate;

  /**
      Optional.
                          Setup the allocation parameters for allocating output
                          buffers. The passed in query contains the result of the
                          downstream allocation query.
                          Subclasses should chain up to the parent implementation to
                          invoke the default handler.
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstQuery* query) decideAllocation;

  /**
      Optional.
                           Propose buffer allocation parameters for upstream elements.
                           Subclasses should chain up to the parent implementation to
                           invoke the default handler.
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstQuery* query) proposeAllocation;

  /**
      Optional. Transform the metadata on the input buffer to the
                       output buffer. By default this method copies all meta without
                       tags and meta with only the "audio" tag. subclasses can
                       implement this method and return true if the metadata is to be
                       copied. Since: 1.6
  */
  extern(C) gboolean function(GstAudioEncoder* enc, GstBuffer* outbuf, GstMeta* meta, GstBuffer* inbuf) transformMeta;

  /**
      Optional.
                       Query handler on the sink pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  */
  extern(C) gboolean function(GstAudioEncoder* encoder, GstQuery* query) sinkQuery;

  /**
      Optional.
                       Query handler on the source pad. This function should
                       return TRUE if the query could be performed. Subclasses
                       should chain up to the parent implementation to invoke the
                       default handler. Since: 1.6
  */
  extern(C) gboolean function(GstAudioEncoder* encoder, GstQuery* query) srcQuery;

  /** */
  void*[17] GstReserved;
}

/** */
struct GstAudioEncoderPrivate;

/**
    #GstAudioFilter is a #GstBaseTransform<!-- -->-derived base class for simple audio
    filters, ie. those that output the same format that they get as input.
    
    #GstAudioFilter will parse the input format for you (with error checking)
    before calling your setup function. Also, elements deriving from
    #GstAudioFilter may use [gstaudio.audio_filter_class.AudioFilterClass.addPadTemplates] from
    their class_init function to easily configure the set of caps/formats that
    the element is able to handle.
    
    Derived classes should override the #GstAudioFilterClass.setup() and
    #GstBaseTransformClass.transform_ip() and/or
    #GstBaseTransformClass.transform()
    virtual functions in their class_init function.
*/
struct GstAudioFilter
{
  /** */
  GstBaseTransform basetransform;

  /** */
  GstAudioInfo info;

  /** */
  void*[4] GstReserved;
}

/**
    In addition to the @setup virtual function, you should also override the
    GstBaseTransform::transform and/or GstBaseTransform::transform_ip virtual
    function.
*/
struct GstAudioFilterClass
{
  /**
      parent class
  */
  GstBaseTransformClass basetransformclass;

  /**
      virtual function called whenever the format changes
  */
  extern(C) gboolean function(GstAudioFilter* filter, const(GstAudioInfo)* info) setup;

  /** */
  void*[4] GstReserved;
}

/**
    Information for an audio format.
*/
struct GstAudioFormatInfo
{
  /**
      #GstAudioFormat
  */
  GstAudioFormat format;

  /**
      string representation of the format
  */
  const(char)* name;

  /**
      user readable description of the format
  */
  const(char)* description;

  /**
      #GstAudioFormatFlags
  */
  GstAudioFormatFlags flags;

  /**
      the endianness
  */
  int endianness;

  /**
      amount of bits used for one sample
  */
  int width;

  /**
      amount of valid bits in @width
  */
  int depth;

  /**
      @width/8 bytes with 1 silent sample
  */
  ubyte[8] silence;

  /**
      the format of the unpacked samples
  */
  GstAudioFormat unpackFormat;

  /**
      function to unpack samples
  */
  GstAudioFormatUnpack unpackFunc;

  /**
      function to pack samples
  */
  GstAudioFormatPack packFunc;

  /** */
  void*[4] GstReserved;
}

/**
    Information describing audio properties. This information can be filled
    in from GstCaps with [gstaudio.audio_info.AudioInfo.fromCaps].
    
    Use the provided macros to access the info in this structure.
*/
struct GstAudioInfo
{
  /**
      the format info of the audio
  */
  const(GstAudioFormatInfo)* finfo;

  /**
      additional audio flags
  */
  GstAudioFlags flags;

  /**
      audio layout
  */
  GstAudioLayout layout;

  /**
      the audio sample rate
  */
  int rate;

  /**
      the number of channels
  */
  int channels;

  /**
      the number of bytes for one frame, this is the size of one
              sample * @channels
  */
  int bpf;

  /**
      the positions for each channel
  */
  GstAudioChannelPosition[64] position;

  /** */
  void*[4] GstReserved;
}

/**
    Meta containing Audio Level Indication: https://tools.ietf.org/html/rfc6464
*/
struct GstAudioLevelMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the -dBov from 0-127 (127 is silence).
  */
  ubyte level;

  /**
      whether the buffer contains voice activity
  */
  gboolean voiceActivity;
}

/**
    #GstAudioDownmixMeta defines an audio downmix matrix to be send along with
    audio buffers. These functions in this module help to create and attach the
    meta as well as extracting it.
*/
struct GstAudioMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the audio properties of the buffer
  */
  GstAudioInfo info;

  /**
      the number of valid samples in the buffer
  */
  size_t samples;

  /**
      the offsets (in bytes) where each channel plane starts in the
        buffer or null if the buffer has interleaved layout; if not null, this
        is guaranteed to be an array of @info.channels elements
  */
  size_t* offsets;

  /** */
  size_t[8] privOffsetsArr;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioQuantize;

/**
    #GstAudioResampler is a structure which holds the information
    required to perform various kinds of resampling filtering.
*/
struct GstAudioResampler;

/**
    This object is the base class for audio ringbuffers used by the base
    audio source and sink classes.
    
    The ringbuffer abstracts a circular buffer of data. One reader and
    one writer can operate on the data from different threads in a lockfree
    manner. The base class is sufficiently flexible to be used as an
    abstraction for DMA based ringbuffers as well as a pure software
    implementations.
*/
struct GstAudioRingBuffer
{
  /** */
  GstObject object;

  /**
      used to signal start/stop/pause/resume actions
  */
  GCond cond;

  /**
      boolean indicating that the ringbuffer is open
  */
  gboolean open;

  /**
      boolean indicating that the ringbuffer is acquired
  */
  gboolean acquired;

  /**
      data in the ringbuffer
  */
  ubyte* memory;

  /**
      size of data in the ringbuffer
  */
  size_t size;

  /** */
  GstClockTime* timestamps;

  /**
      format and layout of the ringbuffer data
  */
  GstAudioRingBufferSpec spec;

  /**
      number of samples in one segment
  */
  int samplesPerSeg;

  /**
      pointer to memory holding one segment of silence samples
  */
  ubyte* emptySeg;

  /**
      state of the buffer
  */
  int state;

  /**
      readpointer in the ringbuffer
  */
  int segdone;

  /**
      segment corresponding to segment 0 (unused)
  */
  int segbase;

  /**
      is a reader or writer waiting for a free segment
  */
  int waiting;

  /** */
  GstAudioRingBufferCallback callback;

  /** */
  void* cbData;

  /** */
  gboolean needReorder;

  /** */
  int[64] channelReorderMap;

  /** */
  gboolean flushing;

  /** */
  int mayStart;

  /** */
  gboolean active;

  /** */
  GDestroyNotify cbDataNotify;

  /** */
  void*[3] GstReserved;
}

/**
    The vmethods that subclasses can override to implement the ringbuffer.
*/
struct GstAudioRingBufferClass
{
  /**
      parent class
  */
  GstObjectClass parentClass;

  /**
      open the device, don't set any params or allocate anything
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) openDevice;

  /**
      allocate the resources for the ringbuffer using the given spec
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf, GstAudioRingBufferSpec* spec) acquire;

  /**
      free resources of the ringbuffer
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) release;

  /**
      close the device
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) closeDevice;

  /**
      start processing of samples
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) start;

  /**
      pause processing of samples
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) pause;

  /**
      resume processing of samples after pause
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) resume;

  /**
      stop processing of samples
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf) stop;

  /**
      get number of frames queued in device
  */
  extern(C) uint function(GstAudioRingBuffer* buf) delay;

  /**
      activate the thread that starts pulling and monitoring the
      consumed segments in the device.
  */
  extern(C) gboolean function(GstAudioRingBuffer* buf, gboolean active) activate;

  /**
      write samples into the ringbuffer
  */
  extern(C) uint function(GstAudioRingBuffer* buf, ulong* sample, ubyte* data, int inSamples, int outSamples, int* accum) commit;

  /**
      Optional.
                  Clear the entire ringbuffer.
                  Subclasses should chain up to the parent implementation to
                  invoke the default handler.
  */
  extern(C) void function(GstAudioRingBuffer* buf) clearAll;

  /** */
  void*[4] GstReserved;
}

/**
    The structure containing the format specification of the ringbuffer.
    
    When @type is GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD, the @dsd_format
    is valid (otherwise it is unused). Also, when DSD is the sample type,
    only the rate, channels, position, and bpf fields in @info are populated.
*/
struct GstAudioRingBufferSpec
{
  /**
      The caps that generated the Spec.
  */
  GstCaps* caps;

  /**
      the sample type
  */
  GstAudioRingBufferFormatType type;

  /**
      the #GstAudioInfo
  */
  GstAudioInfo info;

  /**
      the latency in microseconds
  */
  ulong latencyTime;

  /**
      the total buffer size in microseconds
  */
  ulong bufferTime;

  /**
      the size of one segment in bytes
  */
  int segsize;

  /**
      the total number of segments
  */
  int segtotal;

  /**
      number of segments queued in the lower level device,
       defaults to segtotal
  */
  int seglatency;

  /** */
  /** */
  union ABIType
  {
    /** */
    /** */
    struct AbiType
    {
      /** */
      GstDsdFormat dsdFormat;
    }

    AbiType abi;

    /** */
    void*[4] GstReserved;
  }

  ABIType ABI;
}

/**
    This is the most simple base class for audio sinks that only requires
    subclasses to implement a set of simple functions:
    
    $(LIST
      * `open()` :Open the device.
      
      * `prepare()` :Configure the device with the specified format.
      
      * `write()` :Write samples to the device.
      
      * `reset()` :Unblock writes and flush the device.
      
      * `delay()` :Get the number of samples written but not yet played
    )
    by the device.
    
    $(LIST
      * `unprepare()` :Undo operations done by prepare.
      
      * `close()` :Close the device.
    )
      
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSink using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
struct GstAudioSink
{
  /** */
  GstAudioBaseSink element;

  /** */
  GThread* thread;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstAudioSinkClass
{
  /**
      the parent class structure.
  */
  GstAudioBaseSinkClass parentClass;

  /**
      Open the device. No configuration needs to be done at this point.
             This function is also used to check if the device is available.
  */
  extern(C) gboolean function(GstAudioSink* sink) open;

  /**
      Prepare the device to operate with the specified parameters.
  */
  extern(C) gboolean function(GstAudioSink* sink, GstAudioRingBufferSpec* spec) prepare;

  /**
      Undo operations done in prepare.
  */
  extern(C) gboolean function(GstAudioSink* sink) unprepare;

  /**
      Close the device.
  */
  extern(C) gboolean function(GstAudioSink* sink) close;

  /**
      Write data to the device.
              This vmethod is allowed to block until all the data is written.
              If such is the case then it is expected that pause, stop and
              reset will unblock the write when called.
  */
  extern(C) int function(GstAudioSink* sink, void* data, uint length) write;

  /**
      Return how many frames are still in the device. Participates in
              computing the time for audio clocks and drives the synchronisation.
  */
  extern(C) uint function(GstAudioSink* sink) delay;

  /**
      Returns as quickly as possible from a write and flush any pending
              samples from the device.
              This vmethod is deprecated. Please provide pause and stop instead.
  */
  extern(C) void function(GstAudioSink* sink) reset;

  /**
      Pause the device and unblock write as fast as possible.
              For retro compatibility, the audio sink will fallback
              to calling reset if this vmethod is not provided. Since: 1.18
  */
  extern(C) void function(GstAudioSink* sink) pause;

  /**
      Resume the device. Since: 1.18
  */
  extern(C) void function(GstAudioSink* sink) resume;

  /**
      Stop the device and unblock write as fast as possible.
             Pending samples are flushed from the device.
             For retro compatibility, the audio sink will fallback
             to calling reset if this vmethod is not provided. Since: 1.18
  */
  extern(C) void function(GstAudioSink* sink) stop;

  /**
      class extension structure. Since: 1.18
  */
  GstAudioSinkClassExtension* extension;
}

/** */
struct GstAudioSinkClassExtension
{
  /** */
  extern(C) void function(GstAudioSink* sink) clearAll;
}

/**
    This is the most simple base class for audio sources that only requires
    subclasses to implement a set of simple functions:
    
    $(LIST
      * `open()` :Open the device.
      * `prepare()` :Configure the device with the specified format.
      * `read()` :Read samples from the device.
      * `reset()` :Unblock reads and flush the device.
      * `delay()` :Get the number of samples in the device but not yet read.
      * `unprepare()` :Undo operations done by prepare.
      * `close()` :Close the device.
    )
      
    All scheduling of samples and timestamps is done in this base class
    together with #GstAudioBaseSrc using a default implementation of a
    #GstAudioRingBuffer that uses threads.
*/
struct GstAudioSrc
{
  /** */
  GstAudioBaseSrc element;

  /** */
  GThread* thread;

  /** */
  void*[4] GstReserved;
}

/**
    #GstAudioSrc class. Override the vmethod to implement
    functionality.
*/
struct GstAudioSrcClass
{
  /**
      the parent class.
  */
  GstAudioBaseSrcClass parentClass;

  /**
      open the device with the specified caps
  */
  extern(C) gboolean function(GstAudioSrc* src) open;

  /**
      configure device with format
  */
  extern(C) gboolean function(GstAudioSrc* src, GstAudioRingBufferSpec* spec) prepare;

  /**
      undo the configuration
  */
  extern(C) gboolean function(GstAudioSrc* src) unprepare;

  /**
      close the device
  */
  extern(C) gboolean function(GstAudioSrc* src) close;

  /**
      read samples from the audio device
  */
  extern(C) uint function(GstAudioSrc* src, void* data, uint length, GstClockTime* timestamp) read;

  /**
      the number of frames queued in the device
  */
  extern(C) uint function(GstAudioSrc* src) delay;

  /**
      unblock a read to the device and reset.
  */
  extern(C) void function(GstAudioSrc* src) reset;

  /** */
  void*[4] GstReserved;
}

/**
    #GstAudioStreamAlign provides a helper object that helps tracking audio
    stream alignment and discontinuities, and detects discontinuities if
    possible.
    
    See [gstaudio.audio_stream_align.AudioStreamAlign.new_] for a description of its parameters and
    [gstaudio.audio_stream_align.AudioStreamAlign.process] for the details of the processing.
*/
struct GstAudioStreamAlign;

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
struct GstDsdInfo
{
  /**
      DSD grouping format
  */
  GstDsdFormat format;

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
  GstAudioLayout layout;

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
  GstAudioFlags flags;

  /** */
  void*[4] GstReserved;
}

/**
    Buffer metadata describing planar DSD contents in the buffer. This is not needed
    for interleaved DSD data, and is required for non-interleaved (= planar) data.
    
    The different channels in @offsets are always in the GStreamer channel order.
    Zero-copy channel reordering can be implemented by swapping the values in
    @offsets.
    
    It is not allowed for channels to overlap in memory,
    i.e. for each i in [0, channels), the range
    [@offsets[i], @offsets[i] + @num_bytes_per_channel) must not overlap
    with any other such range.
    
    It is, however, allowed to have parts of the buffer memory unused, by using
    @offsets and @num_bytes_per_channel in such a way that leave gaps on it.
    This is used to implement zero-copy clipping in non-interleaved buffers.
    
    Obviously, due to the above, it is not safe to infer the
    number of valid bytes from the size of the buffer. You should always
    use the @num_bytes_per_channel variable of this metadata.
*/
struct GstDsdPlaneOffsetMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      number of channels in the DSD data
  */
  int numChannels;

  /**
      the number of valid bytes per channel in the buffer
  */
  size_t numBytesPerChannel;

  /**
      the offsets (in bytes) where each channel plane starts in the buffer
  */
  size_t* offsets;

  /** */
  size_t[8] privOffsetsArr;

  /** */
  void*[4] GstReserved;
}

/**
    This interface is implemented by elements that provide a stream volume. Examples for
    such elements are #volume and #playbin.
    
    Applications can use this interface to get or set the current stream volume. For this
    the "volume" #GObject property can be used or the helper functions [gstaudio.stream_volume.StreamVolume.setVolume]
    and [gstaudio.stream_volume.StreamVolume.getVolume]. This volume is always a linear factor, i.e. 0.0 is muted
    1.0 is 100%. For showing the volume in a GUI it might make sense to convert it to
    a different format by using [gstaudio.stream_volume.StreamVolume.convertVolume]. Volume sliders should usually
    use a cubic volume.
    
    Separate from the volume the stream can also be muted by the "mute" #GObject property or
    [gstaudio.stream_volume.StreamVolume.setMute] and [gstaudio.stream_volume.StreamVolume.getMute].
    
    Elements that provide some kind of stream volume should implement the "volume" and
    "mute" #GObject properties and handle setting and getting of them properly.
    The volume property is defined to be a linear volume factor.
*/
struct GstStreamVolume;

/** */
struct GstStreamVolumeInterface
{
  /** */
  GTypeInterface iface;
}

alias extern(C) void function(GstAudioBaseSink* sink, GstClockTime etime, GstClockTime itime, GstClockTimeDiff* requestedSkew, GstAudioBaseSinkDiscontReason discontReason, void* userData) GstAudioBaseSinkCustomSlavingCallback;

alias extern(C) GstClockTime function(GstClock* clock, void* userData) GstAudioClockGetTimeFunc;

alias extern(C) void function(const(GstAudioFormatInfo)* info, GstAudioPackFlags flags, const(void)* src, void* data, int length) GstAudioFormatPack;

alias extern(C) void function(const(GstAudioFormatInfo)* info, GstAudioPackFlags flags, void* dest, const(void)* data, int length) GstAudioFormatUnpack;

alias extern(C) void function(GstAudioRingBuffer* rbuf, ubyte* data, uint len, void* userData) GstAudioRingBufferCallback;

