/// D types for gstvideo1 library
module gstvideo.types;

import gid.gid;
import glib.error;
import gst.sample;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.video_gltexture_upload_meta;


// Enums

/** */
alias AncillaryMetaField = GstAncillaryMetaField;

/** */
alias ColorBalanceType = GstColorBalanceType;

/** */
alias NavigationCommand = GstNavigationCommand;

/** */
alias NavigationEventType = GstNavigationEventType;

/** */
alias NavigationMessageType = GstNavigationMessageType;

/** */
alias NavigationModifierType = GstNavigationModifierType;

/** */
alias NavigationQueryType = GstNavigationQueryType;

/** */
alias VideoAFDSpec = GstVideoAFDSpec;

/** */
alias VideoAFDValue = GstVideoAFDValue;

/** */
alias VideoAlphaMode = GstVideoAlphaMode;

/** */
alias VideoAncillaryDID = GstVideoAncillaryDID;

/** */
alias VideoAncillaryDID16 = GstVideoAncillaryDID16;

/** */
alias VideoBufferFlags = GstVideoBufferFlags;

/** */
alias VideoCaptionType = GstVideoCaptionType;

/** */
alias VideoChromaFlags = GstVideoChromaFlags;

/** */
alias VideoChromaMethod = GstVideoChromaMethod;

/** */
alias VideoChromaMode = GstVideoChromaMode;

/** */
alias VideoChromaSite = GstVideoChromaSite;

/** */
alias VideoCodecFrameFlags = GstVideoCodecFrameFlags;

/** */
alias VideoColorMatrix = GstVideoColorMatrix;

/** */
alias VideoColorPrimaries = GstVideoColorPrimaries;

/** */
alias VideoColorRange = GstVideoColorRange;

/** */
alias VideoDecoderRequestSyncPointFlags = GstVideoDecoderRequestSyncPointFlags;

/** */
alias VideoDitherFlags = GstVideoDitherFlags;

/** */
alias VideoDitherMethod = GstVideoDitherMethod;

/** */
alias VideoFieldOrder = GstVideoFieldOrder;

/** */
alias VideoFlags = GstVideoFlags;

/** */
alias VideoFormat = GstVideoFormat;

/** */
alias VideoFormatFlags = GstVideoFormatFlags;

/** */
alias VideoFrameFlags = GstVideoFrameFlags;

/** */
alias VideoFrameMapFlags = GstVideoFrameMapFlags;

/** */
alias VideoGLTextureOrientation = GstVideoGLTextureOrientation;

/** */
alias VideoGLTextureType = GstVideoGLTextureType;

/** */
alias VideoGammaMode = GstVideoGammaMode;

/** */
alias VideoInterlaceMode = GstVideoInterlaceMode;

/** */
alias VideoMatrixMode = GstVideoMatrixMode;

/** */
alias VideoMultiviewFlags = GstVideoMultiviewFlags;

/** */
alias VideoMultiviewFramePacking = GstVideoMultiviewFramePacking;

/** */
alias VideoMultiviewMode = GstVideoMultiviewMode;

/** */
alias VideoOrientationMethod = GstVideoOrientationMethod;

/** */
alias VideoOverlayFormatFlags = GstVideoOverlayFormatFlags;

/** */
alias VideoPackFlags = GstVideoPackFlags;

/** */
alias VideoPrimariesMode = GstVideoPrimariesMode;

/** */
alias VideoResamplerFlags = GstVideoResamplerFlags;

/** */
alias VideoResamplerMethod = GstVideoResamplerMethod;

/** */
alias VideoScalerFlags = GstVideoScalerFlags;

/** */
alias VideoTileMode = GstVideoTileMode;

/** */
alias VideoTileType = GstVideoTileType;

/** */
alias VideoTimeCodeFlags = GstVideoTimeCodeFlags;

/** */
alias VideoTransferFunction = GstVideoTransferFunction;

/** */
alias VideoVBIParserResult = GstVideoVBIParserResult;

// Structs

/** */
alias VideoAncillary = GstVideoAncillary;

/** */
alias VideoColorPrimariesInfo = GstVideoColorPrimariesInfo;

/** */
alias VideoMasteringDisplayInfoCoordinates = GstVideoMasteringDisplayInfoCoordinates;

/** */
alias VideoRectangle = GstVideoRectangle;

/** */
alias VideoTileInfo = GstVideoTileInfo;

// Callbacks

/** */
alias VideoConvertSampleCallback = void delegate(gst.sample.Sample sample, glib.error.ErrorWrap error);

/** */
alias VideoGLTextureUpload = bool delegate(gstvideo.video_gltexture_upload_meta.VideoGLTextureUploadMeta meta, uint[] textureId);

/** */
enum BUFFER_POOL_OPTION_VIDEO_AFFINE_TRANSFORMATION_META = "GstBufferPoolOptionVideoAffineTransformation";

/**
    A bufferpool option to enable extra padding. When a bufferpool supports this
    option, [gstvideo.global.bufferPoolConfigSetVideoAlignment] can be called.
    
    When this option is enabled on the bufferpool,
    #GST_BUFFER_POOL_OPTION_VIDEO_META should also be enabled.
*/
enum BUFFER_POOL_OPTION_VIDEO_ALIGNMENT = "GstBufferPoolOptionVideoAlignment";

/**
    An option that can be activated on a bufferpool to request gl texture upload
    meta on buffers from the pool.
    
    When this option is enabled on the bufferpool,
    @GST_BUFFER_POOL_OPTION_VIDEO_META should also be enabled.
*/
enum BUFFER_POOL_OPTION_VIDEO_GL_TEXTURE_UPLOAD_META = "GstBufferPoolOptionVideoGLTextureUploadMeta";

/**
    An option that can be activated on bufferpool to request video metadata
    on buffers from the pool.
*/
enum BUFFER_POOL_OPTION_VIDEO_META = "GstBufferPoolOptionVideoMeta";

/**
    Name of the caps feature indicating that the stream is interlaced.
    
    Currently it is only used for video with 'interlace-mode=alternate'
    to ensure backwards compatibility for this new mode.
    In this mode each buffer carries a single field of interlaced video.
    @GST_VIDEO_BUFFER_FLAG_TOP_FIELD and @GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD
    indicate whether the buffer carries a top or bottom field. The order of
    buffers/fields in the stream and the timestamps on the buffers indicate the
    temporal order of the fields.
    Top and bottom fields are expected to alternate in this mode.
    The frame rate in the caps still signals the frame rate, so the notional field
    rate will be twice the frame rate from the caps
    (see @GST_VIDEO_INFO_FIELD_RATE_N).
*/
enum CAPS_FEATURE_FORMAT_INTERLACED = "format:Interlaced";

/** */
enum CAPS_FEATURE_META_GST_VIDEO_AFFINE_TRANSFORMATION_META = "meta:GstVideoAffineTransformation";

/** */
enum CAPS_FEATURE_META_GST_VIDEO_GL_TEXTURE_UPLOAD_META = "meta:GstVideoGLTextureUploadMeta";

/** */
enum CAPS_FEATURE_META_GST_VIDEO_META = "meta:GstVideoMeta";

/** */
enum CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION = "meta:GstVideoOverlayComposition";

/**
    This metadata stays relevant as long as video colorspace is unchanged.
*/
enum META_TAG_VIDEO_COLORSPACE_STR = "colorspace";

/**
    This metadata stays relevant as long as video orientation is unchanged.
*/
enum META_TAG_VIDEO_ORIENTATION_STR = "orientation";

/**
    This metadata stays relevant as long as video size is unchanged.
*/
enum META_TAG_VIDEO_SIZE_STR = "size";

/**
    This metadata is relevant for video streams.
*/
enum META_TAG_VIDEO_STR = "video";

/** */
enum VIDEO_COLORIMETRY_BT2020 = "bt2020";

/** */
enum VIDEO_COLORIMETRY_BT2020_10 = "bt2020-10";

/** */
enum VIDEO_COLORIMETRY_BT2100_HLG = "bt2100-hlg";

/** */
enum VIDEO_COLORIMETRY_BT2100_PQ = "bt2100-pq";

/** */
enum VIDEO_COLORIMETRY_BT601 = "bt601";

/** */
enum VIDEO_COLORIMETRY_BT709 = "bt709";

/** */
enum VIDEO_COLORIMETRY_SMPTE240M = "smpte240m";

/** */
enum VIDEO_COLORIMETRY_SRGB = "sRGB";

/** */
enum VIDEO_COMP_A = 3;

/** */
enum VIDEO_COMP_B = 2;

/** */
enum VIDEO_COMP_G = 1;

/** */
enum VIDEO_COMP_INDEX = 0;

/** */
enum VIDEO_COMP_PALETTE = 1;

/** */
enum VIDEO_COMP_R = 0;

/** */
enum VIDEO_COMP_U = 1;

/** */
enum VIDEO_COMP_V = 2;

/** */
enum VIDEO_COMP_Y = 0;

/**
    #GstVideoAlphaMode, the alpha mode to use.
    Default is #GST_VIDEO_ALPHA_MODE_COPY.
*/
enum VIDEO_CONVERTER_OPT_ALPHA_MODE = "GstVideoConverter.alpha-mode";

/**
    #G_TYPE_DOUBLE, the alpha color value to use.
    Default to 1.0
*/
enum VIDEO_CONVERTER_OPT_ALPHA_VALUE = "GstVideoConverter.alpha-value";

/**
    #G_TYPE_BOOLEAN, whether [gstvideo.video_converter.VideoConverter.frame] will return immediately
    without waiting for the conversion to complete.  A subsequent
    [gstvideo.video_converter.VideoConverter.frameFinish] must be performed to ensure completion of the
    conversion before subsequent use.  Default false
*/
enum VIDEO_CONVERTER_OPT_ASYNC_TASKS = "GstVideoConverter.async-tasks";

/**
    #G_TYPE_UINT, the border color to use if #GST_VIDEO_CONVERTER_OPT_FILL_BORDER
    is set to true. The color is in ARGB format.
    Default 0xff000000
*/
enum VIDEO_CONVERTER_OPT_BORDER_ARGB = "GstVideoConverter.border-argb";

/**
    #GstVideoChromaMode, set the chroma resample mode subsampled
    formats. Default is #GST_VIDEO_CHROMA_MODE_FULL.
*/
enum VIDEO_CONVERTER_OPT_CHROMA_MODE = "GstVideoConverter.chroma-mode";

/**
    #GstVideoChromaMethod, The resampler method to use for
    chroma resampling. Other options for the resampler can be used, see
    the #GstVideoResampler. Default is #GST_VIDEO_RESAMPLER_METHOD_LINEAR
*/
enum VIDEO_CONVERTER_OPT_CHROMA_RESAMPLER_METHOD = "GstVideoConverter.chroma-resampler-method";

/**
    #G_TYPE_INT, height in the destination frame, default destination height
*/
enum VIDEO_CONVERTER_OPT_DEST_HEIGHT = "GstVideoConverter.dest-height";

/**
    #G_TYPE_INT, width in the destination frame, default destination width
*/
enum VIDEO_CONVERTER_OPT_DEST_WIDTH = "GstVideoConverter.dest-width";

/**
    #G_TYPE_INT, x position in the destination frame, default 0
*/
enum VIDEO_CONVERTER_OPT_DEST_X = "GstVideoConverter.dest-x";

/**
    #G_TYPE_INT, y position in the destination frame, default 0
*/
enum VIDEO_CONVERTER_OPT_DEST_Y = "GstVideoConverter.dest-y";

/**
    #GstVideoDitherMethod, The dither method to use when
    changing bit depth.
    Default is #GST_VIDEO_DITHER_BAYER.
*/
enum VIDEO_CONVERTER_OPT_DITHER_METHOD = "GstVideoConverter.dither-method";

/**
    #G_TYPE_UINT, The quantization amount to dither to. Components will be
    quantized to multiples of this value.
    Default is 1
*/
enum VIDEO_CONVERTER_OPT_DITHER_QUANTIZATION = "GstVideoConverter.dither-quantization";

/**
    #G_TYPE_BOOLEAN, if the destination rectangle does not fill the complete
    destination image, render a border with
    #GST_VIDEO_CONVERTER_OPT_BORDER_ARGB. Otherwise the unusded pixels in the
    destination are untouched. Default true.
*/
enum VIDEO_CONVERTER_OPT_FILL_BORDER = "GstVideoConverter.fill-border";

/**
    #GstVideoGammaMode, set the gamma mode.
    Default is #GST_VIDEO_GAMMA_MODE_NONE.
*/
enum VIDEO_CONVERTER_OPT_GAMMA_MODE = "GstVideoConverter.gamma-mode";

/**
    #GstVideoMatrixMode, set the color matrix conversion mode for
    converting between Y'PbPr and non-linear RGB (R'G'B').
    Default is #GST_VIDEO_MATRIX_MODE_FULL.
*/
enum VIDEO_CONVERTER_OPT_MATRIX_MODE = "GstVideoConverter.matrix-mode";

/**
    #GstVideoPrimariesMode, set the primaries conversion mode.
    Default is #GST_VIDEO_PRIMARIES_MODE_NONE.
*/
enum VIDEO_CONVERTER_OPT_PRIMARIES_MODE = "GstVideoConverter.primaries-mode";

/**
    #GstVideoResamplerMethod, The resampler method to use for
    resampling. Other options for the resampler can be used, see
    the #GstVideoResampler. Default is #GST_VIDEO_RESAMPLER_METHOD_CUBIC
*/
enum VIDEO_CONVERTER_OPT_RESAMPLER_METHOD = "GstVideoConverter.resampler-method";

/**
    #G_TYPE_UINT, The number of taps for the resampler.
    Default is 0: let the resampler choose a good value.
*/
enum VIDEO_CONVERTER_OPT_RESAMPLER_TAPS = "GstVideoConverter.resampler-taps";

/**
    #G_TYPE_INT, source height to convert, default source height
*/
enum VIDEO_CONVERTER_OPT_SRC_HEIGHT = "GstVideoConverter.src-height";

/**
    #G_TYPE_INT, source width to convert, default source width
*/
enum VIDEO_CONVERTER_OPT_SRC_WIDTH = "GstVideoConverter.src-width";

/**
    #G_TYPE_INT, source x position to start conversion, default 0
*/
enum VIDEO_CONVERTER_OPT_SRC_X = "GstVideoConverter.src-x";

/**
    #G_TYPE_INT, source y position to start conversion, default 0
*/
enum VIDEO_CONVERTER_OPT_SRC_Y = "GstVideoConverter.src-y";

/**
    #G_TYPE_UINT, maximum number of threads to use. Default 1, 0 for the number
    of cores.
*/
enum VIDEO_CONVERTER_OPT_THREADS = "GstVideoConverter.threads";

/**
    Default maximum number of errors tolerated before signaling error.
*/
enum VIDEO_DECODER_MAX_ERRORS = -1;

/**
    The name of the templates for the sink pad.
*/
enum VIDEO_DECODER_SINK_NAME = "sink";

/**
    The name of the templates for the source pad.
*/
enum VIDEO_DECODER_SRC_NAME = "src";

/**
    Generic caps string for video wit DMABuf(GST_CAPS_FEATURE_MEMORY_DMABUF)
    feature, for use in pad templates. As drm-format is supposed to be defined
    at run-time it's not predefined here.
*/
enum VIDEO_DMA_DRM_CAPS_MAKE = "video/x-raw(memory:DMABuf), format = (string) DMA_DRM, width = ";

/**
    The name of the templates for the sink pad.
*/
enum VIDEO_ENCODER_SINK_NAME = "sink";

/**
    The name of the templates for the source pad.
*/
enum VIDEO_ENCODER_SRC_NAME = "src";

/**
    List of all video formats, for use in template caps strings.
    
    Formats are sorted by decreasing "quality", using these criteria by priority:
      $(LIST
          * number of components
          * depth
          * subsampling factor of the width
          * subsampling factor of the height
          * number of planes
          * native endianness preferred
          * pixel stride
          * poffset
          * prefer non-complex formats
          * prefer YUV formats over RGB ones
          * prefer I420 over YV12
          * format name
      )
*/
enum VIDEO_FORMATS_ALL = "{ ";

/**
    Declare all video formats as a string.
    
    Formats are sorted by decreasing "quality", using these criteria by priority:
      $(LIST
          * number of components
          * depth
          * subsampling factor of the width
          * subsampling factor of the height
          * number of planes
          * native endianness preferred
          * pixel stride
          * poffset
          * prefer non-complex formats
          * prefer YUV formats over RGB ones
          * prefer I420 over YV12
          * format name
      )
*/
enum VIDEO_FORMATS_ALL_STR = "A444_16BE, A444_16LE, AYUV64, ARGB64, RGBA64_BE, ARGB64_BE, BGRA64_BE, ABGR64_BE, RGBA64_LE, ARGB64_LE, BGRA64_LE, ABGR64_LE, A422_16BE, A422_16LE, A420_16BE, A420_16LE, A444_12BE, GBRA_12BE, A444_12LE, GBRA_12LE, Y412_BE, Y412_LE, A422_12BE, A422_12LE, A420_12BE, A420_12LE, A444_10BE, GBRA_10BE, A444_10LE, GBRA_10LE, A422_10BE, A422_10LE, A420_10BE, A420_10LE, BGR10A2_LE, Y410, RGB10A2_LE, A444, GBRA, AYUV, VUYA, RGBA, RBGA, ARGB, BGRA, ABGR, A422, A420, AV12, Y444_16BE, GBR_16BE, Y444_16LE, GBR_16LE, v216, P016_BE, P016_LE, Y444_12BE, GBR_12BE, Y444_12LE, GBR_12LE, I422_12BE, I422_12LE, Y212_BE, Y212_LE, I420_12BE, I420_12LE, P012_BE, P012_LE, Y444_10BE, GBR_10BE, Y444_10LE, GBR_10LE, r210, I422_10BE, I422_10LE, NV16_10LE32, Y210, UYVP, v210, I420_10BE, I420_10LE, P010_10BE, MT2110R, MT2110T, NV12_10BE_8L128, NV12_10LE40_4L4, P010_10LE, NV12_10LE40, NV12_10LE32, Y444, BGRP, GBR, RGBP, NV24, v308, IYU2, RGBx, xRGB, BGRx, xBGR, RGB, BGR, Y42B, NV16, NV61, YUY2, YVYU, UYVY, VYUY, I420, YV12, NV12, NV21, NV12_16L32S, NV12_32L32, NV12_4L4, NV12_64Z32, NV12_8L128, Y41B, IYU1, YUV9, YVU9, BGR16, RGB16, BGR15, RGB15, RGB8P, GRAY16_BE, GRAY16_LE, GRAY10_LE32, GRAY8";

/**
    This is similar to [gstvideo.types.VIDEO_FORMATS_ALL] but includes formats like DMA_DRM
    that do not have a software converter. This should be used for passthrough
    template caps.
*/
enum VIDEO_FORMATS_ANY = "{ ";

/**
    This is similar to [gstvideo.types.VIDEO_FORMATS_ALL_STR] but includes formats like
    DMA_DRM for which no software converter exists. This should be used for
    passthrough template caps.
*/
enum VIDEO_FORMATS_ANY_STR = "DMA_DRM, ";

/** */
enum VIDEO_FPS_RANGE = "(fraction) [ 0, max ]";

/** */
enum VIDEO_MAX_COMPONENTS = 4;

/** */
enum VIDEO_MAX_PLANES = 4;

/**
    G_TYPE_DOUBLE, B parameter of the cubic filter. The B
    parameter controls the bluriness. Values between 0.0 and
    2.0 are accepted. 1/3 is the default.
    
    Below are some values of popular filters:
                       B       C
    Hermite           0.0     0.0
    Spline            1.0     0.0
    Catmull-Rom       0.0     1/2
    Mitchell          1/3     1/3
    Robidoux          0.3782  0.3109
    Robidoux
     Sharp            0.2620  0.3690
    Robidoux
     Soft             0.6796  0.1602
*/
enum VIDEO_RESAMPLER_OPT_CUBIC_B = "GstVideoResampler.cubic-b";

/**
    G_TYPE_DOUBLE, C parameter of the cubic filter. The C
    parameter controls the Keys alpha value. Values between 0.0 and
    2.0 are accepted. 1/3 is the default.
    
    See #GST_VIDEO_RESAMPLER_OPT_CUBIC_B for some more common values
*/
enum VIDEO_RESAMPLER_OPT_CUBIC_C = "GstVideoResampler.cubic-c";

/**
    G_TYPE_DOUBLE, specifies the size of filter envelope for
    @GST_VIDEO_RESAMPLER_METHOD_LANCZOS. values are clamped between
    1.0 and 5.0. 2.0 is the default.
*/
enum VIDEO_RESAMPLER_OPT_ENVELOPE = "GstVideoResampler.envelope";

/**
    G_TYPE_INT, limits the maximum number of taps to use.
    16 is the default.
*/
enum VIDEO_RESAMPLER_OPT_MAX_TAPS = "GstVideoResampler.max-taps";

/**
    G_TYPE_DOUBLE, specifies sharpening of the filter for
    @GST_VIDEO_RESAMPLER_METHOD_LANCZOS. values are clamped between
    0.0 and 1.0. 0.0 is the default.
*/
enum VIDEO_RESAMPLER_OPT_SHARPEN = "GstVideoResampler.sharpen";

/**
    G_TYPE_DOUBLE, specifies sharpness of the filter for
    @GST_VIDEO_RESAMPLER_METHOD_LANCZOS. values are clamped between
    0.5 and 1.5. 1.0 is the default.
*/
enum VIDEO_RESAMPLER_OPT_SHARPNESS = "GstVideoResampler.sharpness";

/**
    #GstVideoDitherMethod, The dither method to use for propagating
    quatization errors.
*/
enum VIDEO_SCALER_OPT_DITHER_METHOD = "GstVideoScaler.dither-method";

/** */
enum VIDEO_SIZE_RANGE = "(int) [ 1, max ]";

/** */
enum VIDEO_TILE_TYPE_MASK = 65535;

/** */
enum VIDEO_TILE_TYPE_SHIFT = 16;

/** */
enum VIDEO_TILE_X_TILES_MASK = 65535;

/** */
enum VIDEO_TILE_Y_TILES_SHIFT = 16;
