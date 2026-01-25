//!gir GstPbutils-1.0
//!info description "D binding for the GstPbutils library - Base utils library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gstpbutils.html
//!info capi https://gstreamer.freedesktop.org/documentation/pbutils/index.html

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set function[codec_utils_opus_create_caps][unsupported] 1
//!set function[codec_utils_opus_create_header][unsupported] 1

//# caller-allocated-out-array (Caller allocated output array)
//!set function[codec_utils_opus_parse_caps].parameters.parameter[channel_mapping][caller-allocates] 1
//!set function[codec_utils_opus_parse_header].parameters.parameter[channel_mapping][caller-allocates] 1
