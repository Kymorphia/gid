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
//!set record[VideoFrame].method[unmap][disable] 1

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

//# Disable this type which is derived from the unsupported Gst.FlagSet fundamental type (FIXME)
//!set class[VideoMultiviewFlagsSet][disable] 1

//# Ignore: deprecated and replaced by gst_video_meta_set_alignment_full
//!set record[VideoMeta].method[set_alignment][ignore] 1

//# Ignore: deprecated and replaced by gst_video_center_rect
//!set class[VideoSink].function[center_rect][ignore] 1

//# Disable callables with arrays with sizes not described by parameters (FIXME)
//!set record[VideoVBIParser].method[add_line][disable] 1
//!set callback[VideoAffineTransformationGetMatrix][disable] 1
//!set callback[VideoFormatPack][disable] 1
//!set callback[VideoFormatUnpack][disable] 1
//!set record[VideoMeta].field[map][disable] 1
//!set record[VideoScaler].method[vertical][disable] 1
//!set record[VideoVBIEncoder].method[write_line][disable] 1
//!set function[video_chroma_resample][disable] 1

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

//# Disable: Fixed size array of plane data pointers
//!set record[VideoFrame].field[data][disable] 1

//# Set array field lengths from their length fields (read-only, set by VideoResampler.init or when adding the meta)
//!set record[VideoResampler].field[offset].type '<array length="1" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[offset][writable] 0
//!set record[VideoResampler].field[phase].type '<array length="1" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[phase][writable] 0
//!set record[VideoResampler].field[n_taps].type '<array length="3" zero-terminated="0" c:type="guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[VideoResampler].field[n_taps][writable] 0
//!set record[VideoSEIUserDataUnregisteredMeta].field[data].type '<array length="3" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[VideoSEIUserDataUnregisteredMeta].field[data][writable] 0

//# Disable: Two dimensional taps array (n_phases * max_taps)
//!set record[VideoResampler].field[taps][disable] 1
