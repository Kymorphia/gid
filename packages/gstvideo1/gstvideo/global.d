/// Global functions for gstvideo1 library
module gstvideo.global;

import gid.gid;
import glib.date_time;
import glib.error;
import glib.types;
import gobject.types;
import gobject.value;
import gst.buffer;
import gst.caps;
import gst.caps_features;
import gst.event;
import gst.message;
import gst.sample;
import gst.structure;
import gst.types;
import gstvideo.ancillary_meta;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_afdmeta;
import gstvideo.video_affine_transformation_meta;
import gstvideo.video_alignment;
import gstvideo.video_bar_meta;
import gstvideo.video_caption_meta;
import gstvideo.video_codec_alpha_meta;
import gstvideo.video_frame;
import gstvideo.video_info;
import gstvideo.video_meta;
import gstvideo.video_overlay_composition;
import gstvideo.video_overlay_composition_meta;
import gstvideo.video_region_of_interest_meta;
import gstvideo.video_seiuser_data_unregistered_meta;
import gstvideo.video_time_code;
import gstvideo.video_time_code_meta;


/** */
gobject.types.GType ancillaryMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_ancillary_meta_api_get_type();
  return _retval;
}

/**
    Adds a new #GstAncillaryMeta to the buffer. The caller is responsible for setting the appropriate
    fields.

    Params:
      buffer = A #GstBuffer
    Returns: A new #GstAncillaryMeta, or null if an error happened.
*/
gstvideo.ancillary_meta.AncillaryMeta bufferAddAncillaryMeta(gst.buffer.Buffer buffer)
{
  GstAncillaryMeta* _cretval;
  _cretval = gst_buffer_add_ancillary_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstvideo.ancillary_meta.AncillaryMeta(cast(GstAncillaryMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoAFDMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      field = 0 for progressive or field 1 and 1 for field 2
      spec = #GstVideoAFDSpec that applies to AFD value
      afd = #GstVideoAFDValue AFD enumeration
    Returns: the #GstVideoAFDMeta on buffer.
*/
gstvideo.video_afdmeta.VideoAFDMeta bufferAddVideoAfdMeta(gst.buffer.Buffer buffer, ubyte field, gstvideo.types.VideoAFDSpec spec, gstvideo.types.VideoAFDValue afd)
{
  GstVideoAFDMeta* _cretval;
  _cretval = gst_buffer_add_video_afd_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, field, spec, afd);
  auto _retval = _cretval ? new gstvideo.video_afdmeta.VideoAFDMeta(cast(GstVideoAFDMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches GstVideoAffineTransformationMeta metadata to buffer with
    the given parameters.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstVideoAffineTransformationMeta on buffer.
*/
gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta bufferAddVideoAffineTransformationMeta(gst.buffer.Buffer buffer)
{
  GstVideoAffineTransformationMeta* _cretval;
  _cretval = gst_buffer_add_video_affine_transformation_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta(cast(GstVideoAffineTransformationMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoBarMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      field = 0 for progressive or field 1 and 1 for field 2
      isLetterbox = if true then bar data specifies letterbox, otherwise pillarbox
      barData1 = If is_letterbox is true, then the value specifies the
             last line of a horizontal letterbox bar area at top of reconstructed frame.
             Otherwise, it specifies the last horizontal luminance sample of a vertical pillarbox
             bar area at the left side of the reconstructed frame
      barData2 = If is_letterbox is true, then the value specifies the
             first line of a horizontal letterbox bar area at bottom of reconstructed frame.
             Otherwise, it specifies the first horizontal
             luminance sample of a vertical pillarbox bar area at the right side of the reconstructed frame.
    Returns: the #GstVideoBarMeta on buffer.
      
      See Table 6.11 Bar Data Syntax
      
      https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
*/
gstvideo.video_bar_meta.VideoBarMeta bufferAddVideoBarMeta(gst.buffer.Buffer buffer, ubyte field, bool isLetterbox, uint barData1, uint barData2)
{
  GstVideoBarMeta* _cretval;
  _cretval = gst_buffer_add_video_bar_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, field, isLetterbox, barData1, barData2);
  auto _retval = _cretval ? new gstvideo.video_bar_meta.VideoBarMeta(cast(GstVideoBarMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoCaptionMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      captionType = The type of Closed Caption to add
      data = The Closed Caption data
    Returns: the #GstVideoCaptionMeta on buffer.
*/
gstvideo.video_caption_meta.VideoCaptionMeta bufferAddVideoCaptionMeta(gst.buffer.Buffer buffer, gstvideo.types.VideoCaptionType captionType, ubyte[] data)
{
  GstVideoCaptionMeta* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = gst_buffer_add_video_caption_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, captionType, _data, _size);
  auto _retval = _cretval ? new gstvideo.video_caption_meta.VideoCaptionMeta(cast(GstVideoCaptionMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches a #GstVideoCodecAlphaMeta metadata to buffer with
    the given alpha buffer.

    Params:
      buffer = a #GstBuffer
      alphaBuffer = a #GstBuffer
    Returns: the #GstVideoCodecAlphaMeta on buffer.
*/
gstvideo.video_codec_alpha_meta.VideoCodecAlphaMeta bufferAddVideoCodecAlphaMeta(gst.buffer.Buffer buffer, gst.buffer.Buffer alphaBuffer)
{
  GstVideoCodecAlphaMeta* _cretval;
  _cretval = gst_buffer_add_video_codec_alpha_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, alphaBuffer ? cast(GstBuffer*)alphaBuffer._cPtr(Yes.Dup) : null);
  auto _retval = _cretval ? new gstvideo.video_codec_alpha_meta.VideoCodecAlphaMeta(cast(GstVideoCodecAlphaMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches GstVideoMeta metadata to buffer with the given parameters and the
    default offsets and strides for format and width x height.
    
    This function calculates the default offsets and strides and then calls
    [gstvideo.global.bufferAddVideoMetaFull] with them.

    Params:
      buffer = a #GstBuffer
      flags = #GstVideoFrameFlags
      format = a #GstVideoFormat
      width = the width
      height = the height
    Returns: the #GstVideoMeta on buffer.
*/
gstvideo.video_meta.VideoMeta bufferAddVideoMeta(gst.buffer.Buffer buffer, gstvideo.types.VideoFrameFlags flags, gstvideo.types.VideoFormat format, uint width, uint height)
{
  GstVideoMeta* _cretval;
  _cretval = gst_buffer_add_video_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, format, width, height);
  auto _retval = _cretval ? new gstvideo.video_meta.VideoMeta(cast(GstVideoMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches GstVideoMeta metadata to buffer with the given parameters.

    Params:
      buffer = a #GstBuffer
      flags = #GstVideoFrameFlags
      format = a #GstVideoFormat
      width = the width
      height = the height
      nPlanes = number of planes
      offset = offset of each plane
      stride = stride of each plane
    Returns: the #GstVideoMeta on buffer.
*/
gstvideo.video_meta.VideoMeta bufferAddVideoMetaFull(gst.buffer.Buffer buffer, gstvideo.types.VideoFrameFlags flags, gstvideo.types.VideoFormat format, uint width, uint height, uint nPlanes, size_t[] offset, int[] stride)
{
  GstVideoMeta* _cretval;
  assert(!offset || offset.length == 4);
  auto _offset = cast(const(size_t)*)offset.ptr;
  assert(!stride || stride.length == 4);
  auto _stride = cast(const(int)*)stride.ptr;
  _cretval = gst_buffer_add_video_meta_full(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, format, width, height, nPlanes, _offset, _stride);
  auto _retval = _cretval ? new gstvideo.video_meta.VideoMeta(cast(GstVideoMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Sets an overlay composition on a buffer. The buffer will obtain its own
    reference to the composition, meaning this function does not take ownership
    of comp.

    Params:
      buf = a #GstBuffer
      comp = a #GstVideoOverlayComposition
    Returns: a #GstVideoOverlayCompositionMeta
*/
gstvideo.video_overlay_composition_meta.VideoOverlayCompositionMeta bufferAddVideoOverlayCompositionMeta(gst.buffer.Buffer buf, gstvideo.video_overlay_composition.VideoOverlayComposition comp = null)
{
  GstVideoOverlayCompositionMeta* _cretval;
  _cretval = gst_buffer_add_video_overlay_composition_meta(buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, comp ? cast(GstVideoOverlayComposition*)comp._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstvideo.video_overlay_composition_meta.VideoOverlayCompositionMeta(cast(GstVideoOverlayCompositionMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoRegionOfInterestMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      roiType = Type of the region of interest (e.g. "face")
      x = X position
      y = Y position
      w = width
      h = height
    Returns: the #GstVideoRegionOfInterestMeta on buffer.
*/
gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta bufferAddVideoRegionOfInterestMeta(gst.buffer.Buffer buffer, string roiType, uint x, uint y, uint w, uint h)
{
  GstVideoRegionOfInterestMeta* _cretval;
  const(char)* _roiType = roiType.toCString(No.Alloc);
  _cretval = gst_buffer_add_video_region_of_interest_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _roiType, x, y, w, h);
  auto _retval = _cretval ? new gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta(cast(GstVideoRegionOfInterestMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoRegionOfInterestMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      roiType = Type of the region of interest (e.g. "face")
      x = X position
      y = Y position
      w = width
      h = height
    Returns: the #GstVideoRegionOfInterestMeta on buffer.
*/
gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta bufferAddVideoRegionOfInterestMetaId(gst.buffer.Buffer buffer, glib.types.Quark roiType, uint x, uint y, uint w, uint h)
{
  GstVideoRegionOfInterestMeta* _cretval;
  _cretval = gst_buffer_add_video_region_of_interest_meta_id(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, roiType, x, y, w, h);
  auto _retval = _cretval ? new gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta(cast(GstVideoRegionOfInterestMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoSEIUserDataUnregisteredMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      uuid = User Data Unregistered UUID
      data = SEI User Data Unregistered buffer
    Returns: the #GstVideoSEIUserDataUnregisteredMeta on buffer.
*/
gstvideo.video_seiuser_data_unregistered_meta.VideoSEIUserDataUnregisteredMeta bufferAddVideoSeiUserDataUnregisteredMeta(gst.buffer.Buffer buffer, ubyte[] uuid, ubyte[] data)
{
  GstVideoSEIUserDataUnregisteredMeta* _cretval;
  assert(!uuid || uuid.length == 16);
  auto _uuid = cast(ubyte*)uuid.ptr;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  _cretval = gst_buffer_add_video_sei_user_data_unregistered_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _uuid, _data, _size);
  auto _retval = _cretval ? new gstvideo.video_seiuser_data_unregistered_meta.VideoSEIUserDataUnregisteredMeta(cast(GstVideoSEIUserDataUnregisteredMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoTimeCodeMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      tc = a #GstVideoTimeCode
    Returns: the #GstVideoTimeCodeMeta on buffer, or
      (since 1.16) null if the timecode was invalid.
*/
gstvideo.video_time_code_meta.VideoTimeCodeMeta bufferAddVideoTimeCodeMeta(gst.buffer.Buffer buffer, gstvideo.video_time_code.VideoTimeCode tc)
{
  GstVideoTimeCodeMeta* _cretval;
  _cretval = gst_buffer_add_video_time_code_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, tc ? cast(const(GstVideoTimeCode)*)tc._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstvideo.video_time_code_meta.VideoTimeCodeMeta(cast(GstVideoTimeCodeMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Attaches #GstVideoTimeCodeMeta metadata to buffer with the given
    parameters.

    Params:
      buffer = a #GstBuffer
      fpsN = framerate numerator
      fpsD = framerate denominator
      latestDailyJam = a #GDateTime for the latest daily jam
      flags = a #GstVideoTimeCodeFlags
      hours = hours since the daily jam
      minutes = minutes since the daily jam
      seconds = seconds since the daily jam
      frames = frames since the daily jam
      fieldCount = fields since the daily jam
    Returns: the #GstVideoTimeCodeMeta on buffer, or
      (since 1.16) null if the timecode was invalid.
*/
gstvideo.video_time_code_meta.VideoTimeCodeMeta bufferAddVideoTimeCodeMetaFull(gst.buffer.Buffer buffer, uint fpsN, uint fpsD, glib.date_time.DateTime latestDailyJam, gstvideo.types.VideoTimeCodeFlags flags, uint hours, uint minutes, uint seconds, uint frames, uint fieldCount)
{
  GstVideoTimeCodeMeta* _cretval;
  _cretval = gst_buffer_add_video_time_code_meta_full(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, fpsN, fpsD, latestDailyJam ? cast(GDateTime*)latestDailyJam._cPtr(No.Dup) : null, flags, hours, minutes, seconds, frames, fieldCount);
  auto _retval = _cretval ? new gstvideo.video_time_code_meta.VideoTimeCodeMeta(cast(GstVideoTimeCodeMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Find the #GstVideoMeta on buffer with the lowest id.
    
    Buffers can contain multiple #GstVideoMeta metadata items when dealing with
    multiview buffers.

    Params:
      buffer = a #GstBuffer
    Returns: the #GstVideoMeta with lowest id (usually 0) or null when there
      is no such metadata on buffer.
*/
gstvideo.video_meta.VideoMeta bufferGetVideoMeta(gst.buffer.Buffer buffer)
{
  GstVideoMeta* _cretval;
  _cretval = gst_buffer_get_video_meta(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstvideo.video_meta.VideoMeta(cast(GstVideoMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Find the #GstVideoMeta on buffer with the given id.
    
    Buffers can contain multiple #GstVideoMeta metadata items when dealing with
    multiview buffers.

    Params:
      buffer = a #GstBuffer
      id = a metadata id
    Returns: the #GstVideoMeta with id or null when there is no such metadata
      on buffer.
*/
gstvideo.video_meta.VideoMeta bufferGetVideoMetaId(gst.buffer.Buffer buffer, int id)
{
  GstVideoMeta* _cretval;
  _cretval = gst_buffer_get_video_meta_id(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, id);
  auto _retval = _cretval ? new gstvideo.video_meta.VideoMeta(cast(GstVideoMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Find the #GstVideoRegionOfInterestMeta on buffer with the given id.
    
    Buffers can contain multiple #GstVideoRegionOfInterestMeta metadata items if
    multiple regions of interests are marked on a frame.

    Params:
      buffer = a #GstBuffer
      id = a metadata id
    Returns: the #GstVideoRegionOfInterestMeta with id or null when there is
      no such metadata on buffer.
*/
gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta bufferGetVideoRegionOfInterestMetaId(gst.buffer.Buffer buffer, int id)
{
  GstVideoRegionOfInterestMeta* _cretval;
  _cretval = gst_buffer_get_video_region_of_interest_meta_id(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, id);
  auto _retval = _cretval ? new gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta(cast(GstVideoRegionOfInterestMeta*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Get the video alignment from the bufferpool configuration config in
    in align

    Params:
      config = a #GstStructure
      align_ = a #GstVideoAlignment
    Returns: true if config could be parsed correctly.
*/
bool bufferPoolConfigGetVideoAlignment(gst.structure.Structure config, gstvideo.video_alignment.VideoAlignment align_)
{
  bool _retval;
  _retval = cast(bool)gst_buffer_pool_config_get_video_alignment(cast(GstStructure*)&config, cast(GstVideoAlignment*)&align_);
  return _retval;
}

/**
    Set the video alignment in align to the bufferpool configuration
    config

    Params:
      config = a #GstStructure
      align_ = a #GstVideoAlignment
*/
void bufferPoolConfigSetVideoAlignment(gst.structure.Structure config, gstvideo.video_alignment.VideoAlignment align_)
{
  gst_buffer_pool_config_set_video_alignment(cast(GstStructure*)&config, cast(const(GstVideoAlignment)*)&align_);
}

/**
    Convenience function to check if the given message is a
    "prepare-window-handle" message from a #GstVideoOverlay.

    Params:
      msg = a #GstMessage
    Returns: whether msg is a "prepare-window-handle" message
*/
bool isVideoOverlayPrepareWindowHandleMessage(gst.message.Message msg)
{
  bool _retval;
  _retval = cast(bool)gst_is_video_overlay_prepare_window_handle_message(msg ? cast(GstMessage*)msg._cPtr(No.Dup) : null);
  return _retval;
}

/** */
gobject.types.GType videoAfdMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_afd_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType videoAffineTransformationMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_affine_transformation_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType videoBarMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_bar_meta_api_get_type();
  return _retval;
}

/**
    Lets you blend the src image into the dest image

    Params:
      dest = The #GstVideoFrame where to blend src in
      src = the #GstVideoFrame that we want to blend into
      x = The x offset in pixel where the src image should be blended
      y = the y offset in pixel where the src image should be blended
      globalAlpha = the global_alpha each per-pixel alpha value is multiplied
                       with
    Returns: 
*/
bool videoBlend(gstvideo.video_frame.VideoFrame dest, gstvideo.video_frame.VideoFrame src, int x, int y, float globalAlpha)
{
  bool _retval;
  _retval = cast(bool)gst_video_blend(dest ? cast(GstVideoFrame*)dest._cPtr : null, src ? cast(GstVideoFrame*)src._cPtr : null, x, y, globalAlpha);
  return _retval;
}

/**
    Scales a buffer containing RGBA (or AYUV) video. This is an internal
    helper function which is used to scale subtitle overlays, and may be
    deprecated in the near future. Use #GstVideoScaler to scale video buffers
    instead.

    Params:
      src = the #GstVideoInfo describing the video data in src_buffer
      srcBuffer = the source buffer containing video pixels to scale
      destHeight = the height in pixels to scale the video data in src_buffer to
      destWidth = the width in pixels to scale the video data in src_buffer to
      dest = pointer to a #GstVideoInfo structure that will be filled in
            with the details for dest_buffer
      destBuffer = a pointer to a #GstBuffer variable, which will be
            set to a newly-allocated buffer containing the scaled pixels.
*/
void videoBlendScaleLinearRGBA(gstvideo.video_info.VideoInfo src, gst.buffer.Buffer srcBuffer, int destHeight, int destWidth, out gstvideo.video_info.VideoInfo dest, out gst.buffer.Buffer destBuffer)
{
  GstVideoInfo _dest;
  GstBuffer* _destBuffer;
  gst_video_blend_scale_linear_RGBA(src ? cast(GstVideoInfo*)src._cPtr(No.Dup) : null, srcBuffer ? cast(GstBuffer*)srcBuffer._cPtr(No.Dup) : null, destHeight, destWidth, &_dest, &_destBuffer);
  dest = new gstvideo.video_info.VideoInfo(cast(void*)&_dest, No.Take);
  destBuffer = new gst.buffer.Buffer(cast(void*)_destBuffer, Yes.Take);
}

/**
    Given the Pixel Aspect Ratio and size of an input video frame, and the
    pixel aspect ratio of the intended display device, calculates the actual
    display ratio the video will be rendered with.

    Params:
      darN = Numerator of the calculated display_ratio
      darD = Denominator of the calculated display_ratio
      videoWidth = Width of the video frame in pixels
      videoHeight = Height of the video frame in pixels
      videoParN = Numerator of the pixel aspect ratio of the input video.
      videoParD = Denominator of the pixel aspect ratio of the input video.
      displayParN = Numerator of the pixel aspect ratio of the display device
      displayParD = Denominator of the pixel aspect ratio of the display device
    Returns: A boolean indicating success and a calculated Display Ratio in the
      dar_n and dar_d parameters.
      The return value is FALSE in the case of integer overflow or other error.
*/
bool videoCalculateDisplayRatio(out uint darN, out uint darD, uint videoWidth, uint videoHeight, uint videoParN, uint videoParD, uint displayParN, uint displayParD)
{
  bool _retval;
  _retval = cast(bool)gst_video_calculate_display_ratio(cast(uint*)&darN, cast(uint*)&darD, videoWidth, videoHeight, videoParN, videoParD, displayParN, displayParD);
  return _retval;
}

/** */
gobject.types.GType videoCaptionMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_caption_meta_api_get_type();
  return _retval;
}

/**
    Takes src rectangle and position it at the center of dst rectangle with or
    without scaling. It handles clipping if the src rectangle is bigger than
    the dst one and scaling is set to FALSE.

    Params:
      src = a pointer to #GstVideoRectangle describing the source area
      dst = a pointer to #GstVideoRectangle describing the destination area
      result = a pointer to a #GstVideoRectangle which will receive the result area
      scaling = a #gboolean indicating if scaling should be applied or not
*/
void videoCenterRect(gstvideo.types.VideoRectangle src, gstvideo.types.VideoRectangle dst, out gstvideo.types.VideoRectangle result, bool scaling)
{
  gst_video_center_rect(&src, &dst, &result, scaling);
}

/**
    Convert `s` to a #GstVideoChromaSite

    Params:
      s = a chromasite string
    Returns: a #GstVideoChromaSite or [gstvideo.types.VideoChromaSite.Unknown] when `s` does
      not contain a valid chroma description.

    Deprecated: Use [gstvideo.global.videoChromaSiteFromString] instead.
*/
gstvideo.types.VideoChromaSite videoChromaFromString(string s)
{
  GstVideoChromaSite _cretval;
  const(char)* _s = s.toCString(No.Alloc);
  _cretval = gst_video_chroma_from_string(_s);
  gstvideo.types.VideoChromaSite _retval = cast(gstvideo.types.VideoChromaSite)_cretval;
  return _retval;
}

/**
    Converts site to its string representation.

    Params:
      site = a #GstVideoChromaSite
    Returns: a string describing site.

    Deprecated: Use [gstvideo.global.videoChromaSiteToString] instead.
*/
string videoChromaToString(gstvideo.types.VideoChromaSite site)
{
  const(char)* _cretval;
  _cretval = gst_video_chroma_to_string(site);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/** */
gobject.types.GType videoCodecAlphaMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_codec_alpha_meta_api_get_type();
  return _retval;
}

/** */
double videoColorTransferDecode(gstvideo.types.VideoTransferFunction func, double val)
{
  double _retval;
  _retval = gst_video_color_transfer_decode(func, val);
  return _retval;
}

/** */
double videoColorTransferEncode(gstvideo.types.VideoTransferFunction func, double val)
{
  double _retval;
  _retval = gst_video_color_transfer_encode(func, val);
  return _retval;
}

/**
    Converts a raw video buffer into the specified output caps.
    
    The output caps can be any raw video formats or any image formats (jpeg, png, ...).
    
    The width, height and pixel-aspect-ratio can also be specified in the output caps.

    Params:
      sample = a #GstSample
      toCaps = the #GstCaps to convert to
      timeout = the maximum amount of time allowed for the processing.
    Returns: The converted #GstSample, or null if an error happened (in which case err
      will point to the #GError).
    Throws: [ErrorWrap]
*/
gst.sample.Sample videoConvertSample(gst.sample.Sample sample, gst.caps.Caps toCaps, gst.types.ClockTime timeout)
{
  GstSample* _cretval;
  GError *_err;
  _cretval = gst_video_convert_sample(sample ? cast(GstSample*)sample._cPtr(No.Dup) : null, toCaps ? cast(const(GstCaps)*)toCaps._cPtr(No.Dup) : null, timeout, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Converts a raw video buffer into the specified output caps.
    
    The output caps can be any raw video formats or any image formats (jpeg, png, ...).
    
    The width, height and pixel-aspect-ratio can also be specified in the output caps.
    
    callback will be called after conversion, when an error occurred or if conversion didn't
    finish after timeout. callback will always be called from the thread default
    [glib.main_context.MainContext], see [glib.main_context.MainContext.getThreadDefault]. If GLib before 2.22 is used,
    this will always be the global default main context.
    
    destroy_notify will be called after the callback was called and user_data is not needed
    anymore.

    Params:
      sample = a #GstSample
      toCaps = the #GstCaps to convert to
      timeout = the maximum amount of time allowed for the processing.
      callback = [gstvideo.types.VideoConvertSampleCallback] that will be called after conversion.
*/
void videoConvertSampleAsync(gst.sample.Sample sample, gst.caps.Caps toCaps, gst.types.ClockTime timeout, gstvideo.types.VideoConvertSampleCallback callback)
{
  extern(C) void _callbackCallback(GstSample* sample, GError* error, void* userData)
  {
    auto _dlg = cast(gstvideo.types.VideoConvertSampleCallback*)userData;

    (*_dlg)(sample ? new gst.sample.Sample(cast(void*)sample, No.Take) : null, error ? new glib.error.ErrorWrap(cast(void*)error, No.Take) : null);
  }
  auto _callbackCB = callback ? &_callbackCallback : null;
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
  gst_video_convert_sample_async(sample ? cast(GstSample*)sample._cPtr(No.Dup) : null, toCaps ? cast(const(GstCaps)*)toCaps._cPtr(No.Dup) : null, timeout, _callbackCB, _callback, _callbackDestroyCB);
}

/** */
gobject.types.GType videoCropMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_crop_meta_api_get_type();
  return _retval;
}

/**
    Converting the video format into dma drm fourcc. If no
    matching fourcc found, then DRM_FORMAT_INVALID is returned.

    Params:
      format = a #GstVideoFormat
    Returns: the DRM_FORMAT_* corresponding to the format.
*/
uint videoDmaDrmFourccFromFormat(gstvideo.types.VideoFormat format)
{
  uint _retval;
  _retval = gst_video_dma_drm_fourcc_from_format(format);
  return _retval;
}

/**
    Convert the format_str string into the drm fourcc value. The modifier is
    also parsed if we want. Please note that the format_str should follow the
    fourcc:modifier kind style, such as NV12:0x0100000000000002

    Params:
      formatStr = a drm format string
      modifier = Return the modifier in format or null
        to ignore.
    Returns: The drm fourcc value or DRM_FORMAT_INVALID if format_str is
      invalid.
*/
uint videoDmaDrmFourccFromString(string formatStr, out ulong modifier)
{
  uint _retval;
  const(char)* _formatStr = formatStr.toCString(No.Alloc);
  _retval = gst_video_dma_drm_fourcc_from_string(_formatStr, cast(ulong*)&modifier);
  return _retval;
}

/**
    Converting a dma drm fourcc into the video format. If no matching
    video format found, then GST_VIDEO_FORMAT_UNKNOWN is returned.

    Params:
      fourcc = the dma drm value.
    Returns: the GST_VIDEO_FORMAT_* corresponding to the fourcc.
*/
gstvideo.types.VideoFormat videoDmaDrmFourccToFormat(uint fourcc)
{
  GstVideoFormat _cretval;
  _cretval = gst_video_dma_drm_fourcc_to_format(fourcc);
  gstvideo.types.VideoFormat _retval = cast(gstvideo.types.VideoFormat)_cretval;
  return _retval;
}

/**
    Returns a string containing drm kind format, such as
    NV12:0x0100000000000002, or NULL otherwise.

    Params:
      fourcc = a drm fourcc value.
      modifier = the associated modifier value.
    Returns: the drm kind string composed
        of to fourcc and modifier.
*/
string videoDmaDrmFourccToString(uint fourcc, ulong modifier)
{
  char* _cretval;
  _cretval = gst_video_dma_drm_fourcc_to_string(fourcc, modifier);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Checks if an event is a force key unit event. Returns true for both upstream
    and downstream force key unit events.

    Params:
      event = A #GstEvent to check
    Returns: true if the event is a valid force key unit event
*/
bool videoEventIsForceKeyUnit(gst.event.Event event)
{
  bool _retval;
  _retval = cast(bool)gst_video_event_is_force_key_unit(event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Creates a new downstream force key unit event. A downstream force key unit
    event can be sent down the pipeline to request downstream elements to produce
    a key unit. A downstream force key unit event must also be sent when handling
    an upstream force key unit event to notify downstream that the latter has been
    handled.
    
    To parse an event created by [gstvideo.global.videoEventNewDownstreamForceKeyUnit] use
    [gstvideo.global.videoEventParseDownstreamForceKeyUnit].

    Params:
      timestamp = the timestamp of the buffer that starts a new key unit
      streamTime = the stream_time of the buffer that starts a new key unit
      runningTime = the running_time of the buffer that starts a new key unit
      allHeaders = true to produce headers when starting a new key unit
      count = integer that can be used to number key units
    Returns: The new GstEvent
*/
gst.event.Event videoEventNewDownstreamForceKeyUnit(gst.types.ClockTime timestamp, gst.types.ClockTime streamTime, gst.types.ClockTime runningTime, bool allHeaders, uint count)
{
  GstEvent* _cretval;
  _cretval = gst_video_event_new_downstream_force_key_unit(timestamp, streamTime, runningTime, allHeaders, count);
  auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new Still Frame event. If in_still is true, then the event
    represents the start of a still frame sequence. If it is false, then
    the event ends a still frame sequence.
    
    To parse an event created by [gstvideo.global.videoEventNewStillFrame] use
    [gstvideo.global.videoEventParseStillFrame].

    Params:
      inStill = boolean value for the still-frame state of the event.
    Returns: The new GstEvent
*/
gst.event.Event videoEventNewStillFrame(bool inStill)
{
  GstEvent* _cretval;
  _cretval = gst_video_event_new_still_frame(inStill);
  auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new upstream force key unit event. An upstream force key unit event
    can be sent to request upstream elements to produce a key unit.
    
    running_time can be set to request a new key unit at a specific
    running_time. If set to GST_CLOCK_TIME_NONE, upstream elements will produce a
    new key unit as soon as possible.
    
    To parse an event created by [gstvideo.global.videoEventNewDownstreamForceKeyUnit] use
    [gstvideo.global.videoEventParseDownstreamForceKeyUnit].

    Params:
      runningTime = the running_time at which a new key unit should be produced
      allHeaders = true to produce headers when starting a new key unit
      count = integer that can be used to number key units
    Returns: The new GstEvent
*/
gst.event.Event videoEventNewUpstreamForceKeyUnit(gst.types.ClockTime runningTime, bool allHeaders, uint count)
{
  GstEvent* _cretval;
  _cretval = gst_video_event_new_upstream_force_key_unit(runningTime, allHeaders, count);
  auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get timestamp, stream-time, running-time, all-headers and count in the force
    key unit event. See [gstvideo.global.videoEventNewDownstreamForceKeyUnit] for a
    full description of the downstream force key unit event.
    
    running_time will be adjusted for any pad offsets of pads it was passing through.

    Params:
      event = A #GstEvent to parse
      timestamp = A pointer to the timestamp in the event
      streamTime = A pointer to the stream-time in the event
      runningTime = A pointer to the running-time in the event
      allHeaders = A pointer to the all_headers flag in the event
      count = A pointer to the count field of the event
    Returns: true if the event is a valid downstream force key unit event.
*/
bool videoEventParseDownstreamForceKeyUnit(gst.event.Event event, out gst.types.ClockTime timestamp, out gst.types.ClockTime streamTime, out gst.types.ClockTime runningTime, out bool allHeaders, out uint count)
{
  bool _retval;
  gboolean _allHeaders;
  _retval = cast(bool)gst_video_event_parse_downstream_force_key_unit(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(GstClockTime*)&timestamp, cast(GstClockTime*)&streamTime, cast(GstClockTime*)&runningTime, &_allHeaders, cast(uint*)&count);
  allHeaders = cast(bool)_allHeaders;
  return _retval;
}

/**
    Parse a #GstEvent, identify if it is a Still Frame event, and
    return the still-frame state from the event if it is.
    If the event represents the start of a still frame, the in_still
    variable will be set to TRUE, otherwise FALSE. It is OK to pass NULL for the
    in_still variable order to just check whether the event is a valid still-frame
    event.
    
    Create a still frame event using [gstvideo.global.videoEventNewStillFrame]

    Params:
      event = A #GstEvent to parse
      inStill = A boolean to receive the still-frame status from the event, or NULL
    Returns: true if the event is a valid still-frame event. false if not
*/
bool videoEventParseStillFrame(gst.event.Event event, out bool inStill)
{
  bool _retval;
  gboolean _inStill;
  _retval = cast(bool)gst_video_event_parse_still_frame(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, &_inStill);
  inStill = cast(bool)_inStill;
  return _retval;
}

/**
    Get running-time, all-headers and count in the force key unit event. See
    [gstvideo.global.videoEventNewUpstreamForceKeyUnit] for a full description of the
    upstream force key unit event.
    
    Create an upstream force key unit event using  [gstvideo.global.videoEventNewUpstreamForceKeyUnit]
    
    running_time will be adjusted for any pad offsets of pads it was passing through.

    Params:
      event = A #GstEvent to parse
      runningTime = A pointer to the running_time in the event
      allHeaders = A pointer to the all_headers flag in the event
      count = A pointer to the count field in the event
    Returns: true if the event is a valid upstream force-key-unit event. false if not
*/
bool videoEventParseUpstreamForceKeyUnit(gst.event.Event event, out gst.types.ClockTime runningTime, out bool allHeaders, out uint count)
{
  bool _retval;
  gboolean _allHeaders;
  _retval = cast(bool)gst_video_event_parse_upstream_force_key_unit(event ? cast(GstEvent*)event._cPtr(No.Dup) : null, cast(GstClockTime*)&runningTime, &_allHeaders, cast(uint*)&count);
  allHeaders = cast(bool)_allHeaders;
  return _retval;
}

/**
    Return all the raw video formats supported by GStreamer including
    special opaque formats such as [gstvideo.types.VideoFormat.DmaDrm] for which
    no software conversion exists. This should be use for passthrough
    template cpas.
    Returns: an array of #GstVideoFormat
*/
gstvideo.types.VideoFormat[] videoFormatsAny()
{
  const(GstVideoFormat)* _cretval;
  uint _cretlength;
  _cretval = gst_video_formats_any(&_cretlength);
  gstvideo.types.VideoFormat[] _retval;

  if (_cretval)
  {
    _retval = new gstvideo.types.VideoFormat[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = cast(gstvideo.types.VideoFormat)(_cretval[i]);
  }
  return _retval;
}

/**
    Return all the raw video formats supported by GStreamer.
    Returns: an array of #GstVideoFormat
*/
gstvideo.types.VideoFormat[] videoFormatsRaw()
{
  const(GstVideoFormat)* _cretval;
  uint _cretlength;
  _cretval = gst_video_formats_raw(&_cretlength);
  gstvideo.types.VideoFormat[] _retval;

  if (_cretval)
  {
    _retval = new gstvideo.types.VideoFormat[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = cast(gstvideo.types.VideoFormat)(_cretval[i]);
  }
  return _retval;
}

/** */
gobject.types.GType videoGlTextureUploadMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_gl_texture_upload_meta_api_get_type();
  return _retval;
}

/**
    Given the nominal duration of one video frame,
    this function will check some standard framerates for
    a close match (within 0.1%) and return one if possible,
    
    It will calculate an arbitrary framerate if no close
    match was found, and return false.
    
    It returns false if a duration of 0 is passed.

    Params:
      duration = Nominal duration of one frame
      destN = Numerator of the calculated framerate
      destD = Denominator of the calculated framerate
    Returns: true if a close "standard" framerate was
      recognised, and false otherwise.
*/
bool videoGuessFramerate(gst.types.ClockTime duration, out int destN, out int destD)
{
  bool _retval;
  _retval = cast(bool)gst_video_guess_framerate(duration, cast(int*)&destN, cast(int*)&destD);
  return _retval;
}

/**
    Given a frame's dimensions and pixel aspect ratio, this function will
    calculate the frame's aspect ratio and compare it against a set of
    common well-known "standard" aspect ratios.

    Params:
      width = Width of the video frame
      height = Height of the video frame
      parN = Pixel aspect ratio numerator
      parD = Pixel aspect ratio denominator
    Returns: true if a known "standard" aspect ratio was
      recognised, and false otherwise.
*/
bool videoIsCommonAspectRatio(int width, int height, int parN, int parD)
{
  bool _retval;
  _retval = cast(bool)gst_video_is_common_aspect_ratio(width, height, parN, parD);
  return _retval;
}

/**
    Check whether the caps is a dma drm kind caps. Please note that
    the caps should be fixed.

    Params:
      caps = a #GstCaps
    Returns: true if the caps is a dma drm caps.
*/
bool videoIsDmaDrmCaps(gst.caps.Caps caps)
{
  bool _retval;
  _retval = cast(bool)gst_video_is_dma_drm_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Return a generic raw video caps for formats defined in formats.
    If formats is null returns a caps for all the supported raw video formats,
    see [gstvideo.global.videoFormatsRaw].

    Params:
      formats = an array of raw #GstVideoFormat, or null
    Returns: a video GstCaps
*/
gst.caps.Caps videoMakeRawCaps(gstvideo.types.VideoFormat[] formats = null)
{
  GstCaps* _cretval;
  uint _len;
  if (formats)
    _len = cast(uint)formats.length;

  auto _formats = cast(const(GstVideoFormat)*)formats.ptr;
  _cretval = gst_video_make_raw_caps(_formats, _len);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Return a generic raw video caps for formats defined in formats with features
    features.
    If formats is null returns a caps for all the supported video formats,
    see [gstvideo.global.videoFormatsRaw].

    Params:
      formats = an array of raw #GstVideoFormat, or null
      features = the #GstCapsFeatures to set on the caps
    Returns: a video GstCaps
*/
gst.caps.Caps videoMakeRawCapsWithFeatures(gstvideo.types.VideoFormat[] formats = null, gst.caps_features.CapsFeatures features = null)
{
  GstCaps* _cretval;
  uint _len;
  if (formats)
    _len = cast(uint)formats.length;

  auto _formats = cast(const(GstVideoFormat)*)formats.ptr;
  _cretval = gst_video_make_raw_caps_with_features(_formats, _len, features ? cast(GstCapsFeatures*)features._cPtr(Yes.Dup) : null);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/** */
gobject.types.GType videoMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_meta_api_get_type();
  return _retval;
}

/** */
gobject.value.Value videoMultiviewGetDoubledHeightModes()
{
  const(GValue)* _cretval;
  _cretval = gst_video_multiview_get_doubled_height_modes();
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.value.Value videoMultiviewGetDoubledSizeModes()
{
  const(GValue)* _cretval;
  _cretval = gst_video_multiview_get_doubled_size_modes();
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.value.Value videoMultiviewGetDoubledWidthModes()
{
  const(GValue)* _cretval;
  _cretval = gst_video_multiview_get_doubled_width_modes();
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.value.Value videoMultiviewGetMonoModes()
{
  const(GValue)* _cretval;
  _cretval = gst_video_multiview_get_mono_modes();
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gobject.value.Value videoMultiviewGetUnpackedModes()
{
  const(GValue)* _cretval;
  _cretval = gst_video_multiview_get_unpacked_modes();
  auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/** */
bool videoMultiviewGuessHalfAspect(gstvideo.types.VideoMultiviewMode mvMode, uint width, uint height, uint parN, uint parD)
{
  bool _retval;
  _retval = cast(bool)gst_video_multiview_guess_half_aspect(mvMode, width, height, parN, parD);
  return _retval;
}

/**
    Utility function that transforms the width/height/PAR
    and multiview mode and flags of a #GstVideoInfo into
    the requested mode.

    Params:
      info = A #GstVideoInfo structure to operate on
      outMviewMode = A #GstVideoMultiviewMode value
      outMviewFlags = A set of #GstVideoMultiviewFlags
*/
void videoMultiviewVideoInfoChangeMode(gstvideo.video_info.VideoInfo info, gstvideo.types.VideoMultiviewMode outMviewMode, gstvideo.types.VideoMultiviewFlags outMviewFlags)
{
  gst_video_multiview_video_info_change_mode(info ? cast(GstVideoInfo*)info._cPtr(No.Dup) : null, outMviewMode, outMviewFlags);
}

/** */
gobject.types.GType videoOverlayCompositionMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_overlay_composition_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType videoRegionOfInterestMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_region_of_interest_meta_api_get_type();
  return _retval;
}

/** */
gobject.types.GType videoSeiUserDataUnregisteredMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_sei_user_data_unregistered_meta_api_get_type();
  return _retval;
}

/**
    Parses and returns the Precision Time Stamp (ST 0604) from the SEI User Data Unregistered buffer

    Params:
      userData = a #GstVideoSEIUserDataUnregisteredMeta
      status = User Data Unregistered UUID
      precisionTimeStamp = The parsed Precision Time Stamp SEI
    Returns: True if data is a Precision Time Stamp and it was parsed correctly
*/
bool videoSeiUserDataUnregisteredParsePrecisionTimeStamp(gstvideo.video_seiuser_data_unregistered_meta.VideoSEIUserDataUnregisteredMeta userData, out ubyte status, out ulong precisionTimeStamp)
{
  bool _retval;
  _retval = cast(bool)gst_video_sei_user_data_unregistered_parse_precision_time_stamp(userData ? cast(GstVideoSEIUserDataUnregisteredMeta*)userData._cPtr : null, cast(ubyte*)&status, cast(ulong*)&precisionTimeStamp);
  return _retval;
}

/**
    Get the tile index of the tile at coordinates `x` and `y` in the tiled
    image of `x`_tiles by `y`_tiles.
    
    Use this method when mode is of type [gstvideo.types.VideoTileType.Indexed].

    Params:
      mode = a #GstVideoTileMode
      x = x coordinate
      y = y coordinate
      xTiles = number of horizintal tiles
      yTiles = number of vertical tiles
    Returns: the index of the tile at `x` and `y` in the tiled image of
        `x`_tiles by `y`_tiles.
*/
uint videoTileGetIndex(gstvideo.types.VideoTileMode mode, int x, int y, int xTiles, int yTiles)
{
  uint _retval;
  _retval = gst_video_tile_get_index(mode, x, y, xTiles, yTiles);
  return _retval;
}

/** */
gobject.types.GType videoTimeCodeMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_video_time_code_meta_api_get_type();
  return _retval;
}
