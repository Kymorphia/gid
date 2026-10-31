//!gir GstVideo-1.0
//!info description "D binding for the GstVideo library - Video library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstvideo1/
//!info capi https://gstreamer.freedesktop.org/documentation/video/index.html

//# Ignore this type which is derived from Gst.FlagSet which is a fundamental type with limited usage and no clear way to bind it
//!set class[VideoMultiviewFlagsSet][ignore] 1

//!set record[VideoMeta].method[set_alignment][unsupported] 1
//!set class[VideoSink].function[center_rect][unsupported] 1

//# Disable callables with arrays with sizes not described by parameters (FIXME)
//!set record[VideoVBIParser].method[add_line][unsupported] 1
//!set callback[VideoAffineTransformationGetMatrix][unsupported] 1
//!set callback[VideoFormatPack][unsupported] 1
//!set callback[VideoFormatUnpack][unsupported] 1
//!set record[VideoMeta].field[map][unsupported] 1
//!set record[VideoScaler].method[vertical][unsupported] 1
//!set record[VideoVBIEncoder].method[write_line][unsupported] 1
//!set function[video_chroma_resample][unsupported] 1

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
