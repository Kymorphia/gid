/// D types for gstaudio1 library
module gstaudio.types;

import gid.gid;
import gst.clock;
import gst.types;
import gstaudio.audio_base_sink;
import gstaudio.audio_ring_buffer;
import gstaudio.c.functions;
import gstaudio.c.types;


// Enums

/** */
alias AudioBaseSinkDiscontReason = GstAudioBaseSinkDiscontReason;

/** */
alias AudioBaseSinkSlaveMethod = GstAudioBaseSinkSlaveMethod;

/** */
alias AudioBaseSrcSlaveMethod = GstAudioBaseSrcSlaveMethod;

/** */
alias AudioCdSrcMode = GstAudioCdSrcMode;

/** */
alias AudioChannelMixerFlags = GstAudioChannelMixerFlags;

/** */
alias AudioChannelPosition = GstAudioChannelPosition;

/** */
alias AudioConverterFlags = GstAudioConverterFlags;

/** */
alias AudioDitherMethod = GstAudioDitherMethod;

/** */
alias AudioFlags = GstAudioFlags;

/** */
alias AudioFormat = GstAudioFormat;

/** */
alias AudioFormatFlags = GstAudioFormatFlags;

/** */
alias AudioLayout = GstAudioLayout;

/** */
alias AudioNoiseShapingMethod = GstAudioNoiseShapingMethod;

/** */
alias AudioPackFlags = GstAudioPackFlags;

/** */
alias AudioQuantizeFlags = GstAudioQuantizeFlags;

/** */
alias AudioResamplerFilterInterpolation = GstAudioResamplerFilterInterpolation;

/** */
alias AudioResamplerFilterMode = GstAudioResamplerFilterMode;

/** */
alias AudioResamplerFlags = GstAudioResamplerFlags;

/** */
alias AudioResamplerMethod = GstAudioResamplerMethod;

/** */
alias AudioRingBufferFormatType = GstAudioRingBufferFormatType;

/** */
alias AudioRingBufferState = GstAudioRingBufferState;

/** */
alias DsdFormat = GstDsdFormat;

/** */
alias StreamVolumeFormat = GstStreamVolumeFormat;

// Structs

/** */
alias AudioSinkClassExtension = GstAudioSinkClassExtension;

// Callbacks

/**
    This function is set with [gstaudio.audio_base_sink.AudioBaseSink.setCustomSlavingCallback]
    and is called during playback. It receives the current time of external and
    internal clocks, which the callback can then use to apply any custom
    slaving/synchronization schemes.
    
    The external clock is the sink's element clock, the internal one is the
    internal audio clock. The internal audio clock's calibration is applied to
    the timestamps before they are passed to the callback. The difference between
    etime and itime is the skew; how much internal and external clock lie apart
    from each other. A skew of 0 means both clocks are perfectly in sync.
    itime > etime means the external clock is going slower, while itime < etime
    means it is going faster than the internal clock. etime and itime are always
    valid timestamps, except for when a discontinuity happens.
    
    requested_skew is an output value the callback can write to. It informs the
    sink of whether or not it should move the playout pointer, and if so, by how
    much. This pointer is only NULL if a discontinuity occurs; otherwise, it is
    safe to write to *requested_skew. The default skew is 0.
    
    The sink may experience discontinuities. If one happens, discont is TRUE,
    itime, etime are set to GST_CLOCK_TIME_NONE, and requested_skew is NULL.
    This makes it possible to reset custom clock slaving algorithms when a
    discontinuity happens.

    Params:
      sink = a #GstAudioBaseSink
      etime = external clock time
      itime = internal clock time
      requestedSkew = skew amount requested by the callback
      discontReason = reason for discontinuity (if any)
*/
alias AudioBaseSinkCustomSlavingCallback = void delegate(gstaudio.audio_base_sink.AudioBaseSink sink, gst.types.ClockTime etime, gst.types.ClockTime itime, out gst.types.ClockTimeDiff requestedSkew, gstaudio.types.AudioBaseSinkDiscontReason discontReason);

/**
    This function will be called whenever the current clock time needs to be
    calculated. If this function returns #GST_CLOCK_TIME_NONE, the last reported
    time will be returned by the clock.

    Params:
      clock = the #GstAudioClock
    Returns: the current time or #GST_CLOCK_TIME_NONE if the previous time should
      be used.
*/
alias AudioClockGetTimeFunc = gst.types.ClockTime delegate(gst.clock.Clock clock);

/**
    This function is set with [gstaudio.audio_ring_buffer.AudioRingBuffer.setCallback] and is
    called to fill the memory at data with len bytes of samples.

    Params:
      rbuf = a #GstAudioRingBuffer
      data = target to fill
*/
alias AudioRingBufferCallback = void delegate(gstaudio.audio_ring_buffer.AudioRingBuffer rbuf, ubyte[] data);

/**
    Maximum range of allowed channels, for use in template caps strings.
*/
enum AUDIO_CHANNELS_RANGE = "(int) [ 1, max ]";

/**
    #GstAudioDitherMethod, The dither method to use when
    changing bit depth.
    Default is #GST_AUDIO_DITHER_NONE.
*/
enum AUDIO_CONVERTER_OPT_DITHER_METHOD = "GstAudioConverter.dither-method";

/**
    Threshold for the output bit depth at/below which to apply dithering.
    
    Default is 20 bit.
*/
enum AUDIO_CONVERTER_OPT_DITHER_THRESHOLD = "GstAudioConverter.dither-threshold";

/**
    #GST_TYPE_LIST, The channel mapping matrix.
    
    The matrix coefficients must be between -1 and 1: the number of rows is equal
    to the number of output channels and the number of columns is equal to the
    number of input channels.
    
    ## Example matrix generation code
    To generate the matrix using code:
    
    ```
    GValue v = G_VALUE_INIT;
    GValue v2 = G_VALUE_INIT;
    GValue v3 = G_VALUE_INIT;
    
    g_value_init (&v2, GST_TYPE_ARRAY);
    g_value_init (&v3, G_TYPE_DOUBLE);
    g_value_set_double (&v3, 1);
    gst_value_array_append_value (&v2, &v3);
    g_value_unset (&v3);
    [ Repeat for as many double as your input channels - unset and reinit v3 ]
    g_value_init (&v, GST_TYPE_ARRAY);
    gst_value_array_append_value (&v, &v2);
    g_value_unset (&v2);
    [ Repeat for as many v2's as your output channels - unset and reinit v2]
    g_object_set_property (G_OBJECT (audiomixmatrix), "matrix", &v);
    g_value_unset (&v);
    ```
*/
enum AUDIO_CONVERTER_OPT_MIX_MATRIX = "GstAudioConverter.mix-matrix";

/**
    #GstAudioNoiseShapingMethod, The noise shaping method to use
    to mask noise from quantization errors.
    Default is #GST_AUDIO_NOISE_SHAPING_NONE.
*/
enum AUDIO_CONVERTER_OPT_NOISE_SHAPING_METHOD = "GstAudioConverter.noise-shaping-method";

/**
    #G_TYPE_UINT, The quantization amount. Components will be
    quantized to multiples of this value.
    Default is 1
*/
enum AUDIO_CONVERTER_OPT_QUANTIZATION = "GstAudioConverter.quantization";

/**
    #GstAudioResamplerMethod, The resampler method to use when
    changing sample rates.
    Default is #GST_AUDIO_RESAMPLER_METHOD_BLACKMAN_NUTTALL.
*/
enum AUDIO_CONVERTER_OPT_RESAMPLER_METHOD = "GstAudioConverter.resampler-method";

/**
    Default maximum number of errors tolerated before signaling error.
*/
enum AUDIO_DECODER_MAX_ERRORS = -1;

/**
    The name of the templates for the sink pad.
*/
enum AUDIO_DECODER_SINK_NAME = "sink";

/**
    The name of the templates for the source pad.
*/
enum AUDIO_DECODER_SRC_NAME = "src";

/**
    Standard number of channels used in consumer audio.
*/
enum AUDIO_DEF_CHANNELS = 2;

/**
    Standard format used in consumer audio.
*/
enum AUDIO_DEF_FORMAT = "S16LE";

/**
    Standard sampling rate used in consumer audio.
*/
enum AUDIO_DEF_RATE = 44100;

/**
    the name of the templates for the sink pad
*/
enum AUDIO_ENCODER_SINK_NAME = "sink";

/**
    the name of the templates for the source pad
*/
enum AUDIO_ENCODER_SRC_NAME = "src";

/**
    List of all audio formats, for use in template caps strings.
    
    Formats are sorted by decreasing "quality", using these criteria by priority:
      - depth
      - width
      - Float > Signed > Unsigned
      - native endianness preferred
*/
enum AUDIO_FORMATS_ALL = "{ F64BE, F64LE, F32BE, F32LE, S32BE, S32LE, U32BE, U32LE, S24_32BE, S24_32LE, U24_32BE, U24_32LE, S24BE, S24LE, U24BE, U24LE, S20BE, S20LE, U20BE, U20LE, S18BE, S18LE, U18BE, U18LE, S16BE, S16LE, U16BE, U16LE, S8, U8 }";

/**
    Maximum range of allowed sample rates, for use in template caps strings.
*/
enum AUDIO_RATE_RANGE = "(int) [ 1, max ]";

/**
    G_TYPE_DOUBLE, B parameter of the cubic filter.
    Values between 0.0 and 2.0 are accepted. 1.0 is the default.
    
    Below are some values of popular filters:
                       B       C
    Hermite           0.0     0.0
    Spline            1.0     0.0
    Catmull-Rom       0.0     1/2
*/
enum AUDIO_RESAMPLER_OPT_CUBIC_B = "GstAudioResampler.cubic-b";

/**
    G_TYPE_DOUBLE, C parameter of the cubic filter.
    Values between 0.0 and 2.0 are accepted. 0.0 is the default.
    
    See #GST_AUDIO_RESAMPLER_OPT_CUBIC_B for some more common values
*/
enum AUDIO_RESAMPLER_OPT_CUBIC_C = "GstAudioResampler.cubic-c";

/**
    G_TYPE_DOUBLE, Cutoff parameter for the filter. 0.940 is the default.
*/
enum AUDIO_RESAMPLER_OPT_CUTOFF = "GstAudioResampler.cutoff";

/**
    GST_TYPE_AUDIO_RESAMPLER_INTERPOLATION: how the filter coefficients should be
       interpolated.
    GST_AUDIO_RESAMPLER_FILTER_INTERPOLATION_CUBIC is default.
*/
enum AUDIO_RESAMPLER_OPT_FILTER_INTERPOLATION = "GstAudioResampler.filter-interpolation";

/**
    GST_TYPE_AUDIO_RESAMPLER_FILTER_MODE: how the filter tables should be
    constructed.
    GST_AUDIO_RESAMPLER_FILTER_MODE_AUTO is the default.
*/
enum AUDIO_RESAMPLER_OPT_FILTER_MODE = "GstAudioResampler.filter-mode";

/**
    G_TYPE_UINT: the amount of memory to use for full filter tables before
    switching to interpolated filter tables.
    1048576 is the default.
*/
enum AUDIO_RESAMPLER_OPT_FILTER_MODE_THRESHOLD = "GstAudioResampler.filter-mode-threshold";

/**
    G_TYPE_UINT, oversampling to use when interpolating filters
    8 is the default.
*/
enum AUDIO_RESAMPLER_OPT_FILTER_OVERSAMPLE = "GstAudioResampler.filter-oversample";

/**
    G_TYPE_DOUBLE: The maximum allowed phase error when switching sample
    rates.
    0.1 is the default.
*/
enum AUDIO_RESAMPLER_OPT_MAX_PHASE_ERROR = "GstAudioResampler.max-phase-error";

/**
    G_TYPE_INT: the number of taps to use for the filter.
    0 is the default and selects the taps automatically.
*/
enum AUDIO_RESAMPLER_OPT_N_TAPS = "GstAudioResampler.n-taps";

/**
    G_TYPE_DOUBLE, stopband attenuation in decibels. The attenuation
    after the stopband for the kaiser window. 85 dB is the default.
*/
enum AUDIO_RESAMPLER_OPT_STOP_ATTENUATION = "GstAudioResampler.stop-attenutation";

/**
    G_TYPE_DOUBLE, transition bandwidth. The width of the
    transition band for the kaiser window. 0.087 is the default.
*/
enum AUDIO_RESAMPLER_OPT_TRANSITION_BANDWIDTH = "GstAudioResampler.transition-bandwidth";

/** */
enum AUDIO_RESAMPLER_QUALITY_DEFAULT = 4;

/** */
enum AUDIO_RESAMPLER_QUALITY_MAX = 10;

/** */
enum AUDIO_RESAMPLER_QUALITY_MIN = 0;

/**
    List of all DSD formats, for use in template caps strings.
    
    Big endian formats are preferred, since little-endian ones flip around
    the DSD bytes, and most DSD hardware uses big endian formats.
*/
enum DSD_FORMATS_ALL = "{ DSDU32BE, DSDU16BE, DSDU8, DSDU32LE, DSDU16LE }";

/**
    The GStreamer media type for DSD.
*/
enum DSD_MEDIA_TYPE = "audio/x-dsd";

/**
    Silence pattern for DSD data.
    
    In DSD, a nullbyte does not correspond to silence. To fill memory regions
    with "DSD silence", these regions must be filled with byte 0x69 instead
    (this is the DSD silence pattern). This constant provides that pattern
    in a more readable fashion.
*/
enum DSD_SILENCE_PATTERN_BYTE = 105;

/**
    This metadata stays relevant as long as channels are unchanged.
*/
enum META_TAG_AUDIO_CHANNELS_STR = "channels";

/**
    This metadata stays relevant as long as sample rate is unchanged.
*/
enum META_TAG_AUDIO_RATE_STR = "rate";

/**
    This metadata is relevant for audio streams.
*/
enum META_TAG_AUDIO_STR = "audio";

/**
    This metadata stays relevant as long as the DSD plane offsets are unchanged.
*/
enum META_TAG_DSD_PLANE_OFFSETS_STR = "dsdplaneoffsets";
