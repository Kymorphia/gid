//!gir GstVideo-1.0
//!info description "D binding for the GstVideo library - Video library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstvideo1/
//!info capi https://gstreamer.freedesktop.org/documentation/video/index.html

// Map functions return a MapScope which unmaps the structure (explicit unmap or scope exit), the unmap function is
// only used by the MapScope (unmapping a MapScope structure directly would unmap it twice)
//!set record[VideoFrame].function[map][gid-unmap] gst_video_frame_unmap
//!set record[VideoFrame].function[map][gid-map-source] buffer
//!set record[VideoFrame].function[map_id][gid-unmap] gst_video_frame_unmap
//!set record[VideoFrame].function[map_id][gid-map-source] buffer
//!set record[VideoFrame].method[unmap][ignore] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_ancillary_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_afd_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_affine_transformation_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_bar_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_caption_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_codec_alpha_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_meta_full].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_overlay_composition_meta].return-value[][gid-borrow] buf
//!set function[buffer_add_video_region_of_interest_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_region_of_interest_meta_id].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_sei_user_data_unregistered_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_time_code_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_video_time_code_meta_full].return-value[][gid-borrow] buffer
//!set function[buffer_get_video_meta].return-value[][gid-borrow] buffer
//!set function[buffer_get_video_meta_id].return-value[][gid-borrow] buffer
//!set function[buffer_get_video_region_of_interest_meta_id].return-value[][gid-borrow] buffer
//!set enumeration[VideoFormat].function[get_info].return-value[][gid-borrow] static

//# Ignore: Fundamental GValue type derived from Gst.FlagSet, bound as a D value type in gstvideo.types instead
//!set class[VideoMultiviewFlagsSet][ignore] 1

//# Ignore: deprecated and replaced by gst_video_meta_set_alignment_full
//!set record[VideoMeta].method[set_alignment][ignore] 1

//# Ignore: Plane map virtual function pointer for meta implementers, use the VideoMeta.map and VideoMeta.unmap
//# methods which call it
//!set record[VideoMeta].field[map][ignore] 1

//# Ignore: deprecated and replaced by gst_video_center_rect
//!set class[VideoSink].function[center_rect][ignore] 1

//# Disable callables with arrays with sizes not described by parameters (FIXME)
//!set callback[VideoAffineTransformationGetMatrix][disable] 1
//!set callback[VideoFormatPack][disable] 1
//!set callback[VideoFormatUnpack][disable] 1
//!set record[VideoScaler].method[vertical][disable] 1
//!set function[video_chroma_resample][disable] 1

//# Hand-written below: VBI lines with a size from the format and pixel width given when creating the encoder/parser
//# (opaque structures, the D wrapper keeps the line size)
//!set record[VideoVBIEncoder].constructor[new][ignore] 1
//!set record[VideoVBIEncoder].method[copy][ignore] 1
//!set record[VideoVBIEncoder].method[write_line][ignore] 1
//!set record[VideoVBIParser].constructor[new][ignore] 1
//!set record[VideoVBIParser].method[copy][ignore] 1
//!set record[VideoVBIParser].method[add_line][ignore] 1

//# Parameters with fixed size arrays
//!set callback[VideoGLTextureUpload].parameters.parameter[texture_id].type '<array zero-terminated="0" fixed-size="4" c:type="guint*"><type name="guint" c:type="guint"/></array>'
//!set record[VideoGLTextureUploadMeta].method[upload].parameters.parameter[texture_id].type '<array zero-terminated="0" fixed-size="4" c:type="guint*"><type name="guint" c:type="guint"/></array>'
//!set function[buffer_add_video_gl_texture_upload_meta].parameters.parameter[texture_type].type '<array zero-terminated="0" fixed-size="4" c:type="GstVideoGLTextureType*"><type name="VideoGLTextureType" c:type="GstVideoGLTextureType"/></array>'

//# Ignore interface APIs
//!set interface[VideoOverlay].function[install_properties][ignore] 1

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[VideoCodecFrame].field[input_buffer][owned] 1
//!set record[VideoCodecFrame].field[output_buffer][owned] 1
//!set record[VideoCodecState].field[caps][owned] 1
//!set record[VideoCodecState].field[allocation_caps][owned] 1
//!set record[VideoCodecState].field[codec_data][owned] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[AncillaryMeta].field[meta][writable] 0
//!set record[AncillaryMeta].field[data][writable] 0
//!set record[VideoAFDMeta].field[meta][writable] 0
//!set record[VideoAffineTransformationMeta].field[meta][writable] 0
//!set record[VideoBarMeta].field[meta][writable] 0
//!set record[VideoCaptionMeta].field[meta][writable] 0
//!set record[VideoCaptionMeta].field[data][writable] 0
//!set record[VideoCodecAlphaMeta].field[meta][writable] 0
//!set record[VideoCodecState].field[info][writable] 0
//!set record[VideoCodecState].field[mastering_display_info][writable] 0
//!set record[VideoCodecState].field[content_light_level][writable] 0
//!set record[VideoCropMeta].field[meta][writable] 0
//!set record[VideoFrame].field[info][writable] 0
//!set record[VideoGLTextureUploadMeta].field[meta][writable] 0
//!set record[VideoInfo].field[finfo][writable] 0
//!set record[VideoInfoDmaDrm].field[vinfo][writable] 0
//!set record[VideoMeta].field[meta][writable] 0
//!set record[VideoOverlayCompositionMeta].field[meta][writable] 0
//!set record[VideoRegionOfInterestMeta].field[meta][writable] 0
//!set record[VideoRegionOfInterestMeta].field[params][writable] 0
//!set record[VideoSEIUserDataUnregisteredMeta].field[meta][writable] 0
//!set record[VideoTimeCode].field[config][writable] 0
//!set record[VideoTimeCodeMeta].field[meta][writable] 0
//!set record[VideoTimeCodeMeta].field[tc][writable] 0

//# Ignore: Deprecated API with a replacement
//!set function[buffer_add_video_gl_texture_upload_meta][ignore] 1

//# Ignore: Internal/implementation-only API, not useful from D
//!set record[VideoFormatInfo].field[unpack_func][ignore] 1
//!set record[VideoFormatInfo].field[pack_func][ignore] 1

//# Ignore: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[VideoFrame].field[meta][ignore] 1

//# Ignore: Fixed size array of plane data pointers (use VideoFrame.planeData)
//!set record[VideoFrame].field[data][ignore] 1

//# Set array field lengths from their length fields (read-only, set by VideoResampler.init or when adding the meta)
//!set record[VideoResampler].field[offset].type '<array length="1" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[offset][writable] 0
//!set record[VideoResampler].field[phase].type '<array length="1" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[phase][writable] 0
//!set record[VideoResampler].field[n_taps].type '<array length="3" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[n_taps][writable] 0
//!set record[VideoSEIUserDataUnregisteredMeta].field[data].type '<array length="3" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[VideoSEIUserDataUnregisteredMeta].field[data][writable] 0

//# Hand-written below: Two dimensional taps array (n_phases * max_taps), max_taps is set by gst_video_resampler_init
//!set record[VideoResampler].field[taps][ignore] 1
//!set record[VideoResampler].field[max_taps][writable] 0

//# Hand-written below: gst_video_resampler_clear() frees the arrays without clearing the pointers (array field getters
//# would read freed memory)
//!set record[VideoResampler].method[clear][ignore] 1

//# VideoMultiviewFlagsSet D value type (GstVideoMultiviewFlagsSet GValue flag set type, see gst1-types.d)
//!class types pre

import gobject.c.types;
import gst.c.functions;

/**
    Multiview flag set value type (GstVideoMultiviewFlagsSet), a [gst.types.FlagSet] of
    [gstvideo.types.VideoMultiviewFlags], such as the caps `multiview-flags` field.
*/
struct VideoMultiviewFlagsSet
{
  VideoMultiviewFlags flags; /// The flags
  VideoMultiviewFlags mask; /// Mask of the flags which are relevant

  /// Get the GType of GstVideoMultiviewFlagsSet values.
  static GType _gidValueGType() nothrow
  {
    return gst_video_multiview_flagset_get_type();
  }

  /// Get a VideoMultiviewFlagsSet from a GValue.
  static VideoMultiviewFlagsSet _gidValueGet(const(GValue)* gval) nothrow
  {
    auto flags = cast(VideoMultiviewFlags)gst_value_get_flagset_flags(gval);
    auto mask = cast(VideoMultiviewFlags)gst_value_get_flagset_mask(gval);
    return VideoMultiviewFlagsSet(flags, mask);
  }

  /// Set a GValue to the VideoMultiviewFlagsSet.
  void _gidValueSet(GValue* gval) const nothrow
  {
    gst_value_set_flagset(gval, cast(uint)flags, cast(uint)mask);
  }
}
//!class VideoFrame

  /**
      Get the data of a plane of a mapped video frame.
      The returned slice references the mapped memory of the frame and is only valid while the frame is mapped (see
      [gstvideo.video_frame.VideoFrame.map]). Writing to it modifies the frame if it was mapped for writing.
      For formats which are not tiled the length is the plane stride times the plane height, otherwise it extends to
      the end of the mapped memory. Use the stride of the plane from [gstvideo.video_frame.VideoFrame.info] to access
      rows.
      Params:
        plane = the plane index (less than the number of planes of the video format)
      Returns: the plane data or null if the frame is not mapped or plane is out of range
  */
  ubyte[] planeData(uint plane) nothrow
  {
    auto frame = cast(GstVideoFrame*)this._cPtr;
    auto finfo = frame.info.finfo;

    if (!finfo || plane >= finfo.nPlanes || plane >= frame.data.length || !frame.data[plane])
      return null;

    auto data = cast(ubyte*)frame.data[plane];
    auto mapIndex = frame.meta ? plane : 0; // Each plane has its own memory map when mapped with a VideoMeta
    auto mapInfo = &frame.map[mapIndex];

    if (!mapInfo.data || data < mapInfo.data || data >= mapInfo.data + mapInfo.size)
      return null;

    size_t size = mapInfo.data + mapInfo.size - data; // Remaining mapped bytes from the plane start
    auto stride = frame.info.stride[plane];

    if (!(finfo.flags & GstVideoFormatFlags.Tiled) && stride > 0)
    {
      int height = frame.info.height;

      if (frame.info.interlaceMode == GstVideoInterlaceMode.Alternate) // One field per buffer
        height = (height + 1) / 2;

      foreach (comp; 0 .. finfo.nComponents) // Scale the height by the vertical subsampling of a component in the plane
      {
        if (finfo.plane[comp] == plane)
        {
          height = -((-height) >> finfo.hSub[comp]);
          break;
        }
      }

      if (height >= 0 && cast(size_t)stride * height < size)
        size = cast(size_t)stride * height;
    }

    return data[0 .. size];
  }
//!class VideoResampler

  /**
      Get `taps` field.
      Returns: the taps (copied), one row of maxTaps taps for each phase, or null if the resampler is not initialized
  */
  @property double[][] taps() nothrow
  {
    auto resampler = cast(GstVideoResampler*)this._cPtr;

    if (!resampler.taps || resampler.nPhases == 0 || resampler.maxTaps == 0)
      return null;

    auto _retval = new double[][](resampler.nPhases);

    foreach (i, ref row; _retval)
      row = resampler.taps[i * resampler.maxTaps .. (i + 1) * resampler.maxTaps].dup;

    return _retval;
  }

  /**
      Clear a previously initialized #GstVideoResampler resampler. The arrays are freed and their fields are reset, so
      the resampler can be initialized again.
  */
  void clear() nothrow
  {
    auto resampler = cast(GstVideoResampler*)this._cPtr;
    gst_video_resampler_clear(resampler);
    resampler.offset = null;
    resampler.phase = null;
    resampler.nTaps = null;
    resampler.taps = null;
    resampler.outSize = 0;
    resampler.nPhases = 0;
    resampler.maxTaps = 0;
  }

//!class VideoVBIEncoder pre

package uint _vbiLineSize(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
{
  auto info = gst_video_info_new();
  scope(exit) gst_video_info_free(info);

  if (!gst_video_info_set_format(info, cast(GstVideoFormat)format, pixelWidth, 1) || info.stride[0] <= 0)
    return 0;

  return cast(uint)info.stride[0];
}

//!class VideoVBIEncoder

  private uint _lineSize; // Line size in bytes from the format and pixel width, 0 if unknown

  /**
      Create a new #GstVideoVBIEncoder for the specified format and pixelWidth.

      Params:
        format = a #GstVideoFormat
        pixelWidth = The width in pixel to use
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
  {
    auto _cretval = gst_video_vbi_encoder_new(cast(GstVideoFormat)format, pixelWidth);
    this(_cretval, Yes.Take);

    if (_cretval)
      _lineSize = _vbiLineSize(format, pixelWidth);
  }

  /**
      Copy the encoder.
      Returns: a copy of the encoder
  */
  gstvideo.video_vbiencoder.VideoVBIEncoder copy() nothrow
  {
    auto _cretval = gst_video_vbi_encoder_copy(cast(const(GstVideoVBIEncoder)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiencoder.VideoVBIEncoder(cast(void*)_cretval, Yes.Take) : null;

    if (_retval)
      _retval._lineSize = _lineSize;

    return _retval;
  }

  /**
      Get the size in bytes of a line of the format and pixel width the encoder was created with.
      Returns: the line size in bytes, or 0 if unknown (the wrapper was not created with the constructor or copy)
  */
  @property uint lineSize() nothrow
  {
    return _lineSize;
  }

  /**
      Write the pending ancillary data as a line of the format and pixel width the encoder was created with.
      Params:
        data = the line to write to, its length must be at least [gstvideo.video_vbiencoder.VideoVBIEncoder.lineSize]
  */
  void writeLine(ubyte[] data) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (_lineSize == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiencoder.VideoVBIEncoder.writeLine line size unknown (not created with the constructor or copy)");
      return;
    }

    if (data.length < _lineSize)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiencoder.VideoVBIEncoder.writeLine data length %d is less than the line size %u",
        cast(int)data.length, _lineSize);
      return;
    }

    gst_video_vbi_encoder_write_line(cast(GstVideoVBIEncoder*)this._cPtr, data.ptr);
  }

//!class VideoVBIParser pre

import gstvideo.video_vbiencoder : _vbiLineSize;

//!class VideoVBIParser

  private uint _lineSize; // Line size in bytes from the format and pixel width, 0 if unknown

  /**
      Create a new #GstVideoVBIParser for the specified format and pixelWidth.

      Params:
        format = a #GstVideoFormat
        pixelWidth = The width in pixel to use
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
  {
    auto _cretval = gst_video_vbi_parser_new(cast(GstVideoFormat)format, pixelWidth);
    this(_cretval, Yes.Take);

    if (_cretval)
      _lineSize = _vbiLineSize(format, pixelWidth);
  }

  /**
      Copy the parser.
      Returns: a copy of the parser
  */
  gstvideo.video_vbiparser.VideoVBIParser copy() nothrow
  {
    auto _cretval = gst_video_vbi_parser_copy(cast(const(GstVideoVBIParser)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiparser.VideoVBIParser(cast(void*)_cretval, Yes.Take) : null;

    if (_retval)
      _retval._lineSize = _lineSize;

    return _retval;
  }

  /**
      Get the size in bytes of a line of the format and pixel width the parser was created with.
      Returns: the line size in bytes, or 0 if unknown (the wrapper was not created with the constructor or copy)
  */
  @property uint lineSize() nothrow
  {
    return _lineSize;
  }

  /**
      Provide a new line of data to the parser. Call [gstvideo.video_vbiparser.VideoVBIParser.getAncillary] to get the
      Ancillary data that might be present on that line.
      Params:
        data = the line of data to parse, its length must be at least
          [gstvideo.video_vbiparser.VideoVBIParser.lineSize]
  */
  void addLine(ubyte[] data) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (_lineSize == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiparser.VideoVBIParser.addLine line size unknown (not created with the constructor or copy)");
      return;
    }

    if (data.length < _lineSize)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiparser.VideoVBIParser.addLine data length %d is less than the line size %u",
        cast(int)data.length, _lineSize);
      return;
    }

    gst_video_vbi_parser_add_line(cast(GstVideoVBIParser*)this._cPtr, data.ptr);
  }
