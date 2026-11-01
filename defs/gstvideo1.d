//!gir GstVideo-1.0
//!info description "D binding for the GstVideo library - Video library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstvideo1/
//!info capi https://gstreamer.freedesktop.org/documentation/video/index.html

//# Disable this type which is derived from the unsupported Gst.FlagSet fundamental type (FIXME)
//!set class[VideoMultiviewFlagsSet][disable] 1

//!set record[VideoMeta].method[set_alignment][disable] 1
//!set class[VideoSink].function[center_rect][disable] 1

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

//# Disable interface APIs
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

//# Disable: Deprecated API with a replacement
//!set function[buffer_add_video_gl_texture_upload_meta][ignore] 1

//# Disable: Internal/implementation-only API, not useful from D
//!set record[VideoFormatInfo].field[unpack_func][ignore] 1
//!set record[VideoFormatInfo].field[pack_func][ignore] 1

//# Disable: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[VideoFrame].field[meta][ignore] 1
