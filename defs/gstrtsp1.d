//!gir GstRtsp-1.0
//!info description "D binding for the GstRtsp library - RTSP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstrtsp1/
//!info capi https://gstreamer.freedesktop.org/documentation/rtsplib/index.html

//# Seems to use the wrong type (gchar**), but there are no docs, so not positive..
//!set interface[RTSPExtension].method[get_transports].parameters.parameter[transport].type[][c:type] gchar*

//# Set arrays to be zero-terminated=1
//!set record[RTSPMessage].method[parse_auth_credentials].return-value.array[][zero-terminated] 1

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[RTSPUrl].field[user][owned] 1
//!set record[RTSPUrl].field[passwd][owned] 1
//!set record[RTSPUrl].field[host][owned] 1
//!set record[RTSPUrl].field[abspath][owned] 1
//!set record[RTSPUrl].field[query][owned] 1

//# Takes a NULL-terminated array of credentials, not a single one
//!set function[rtsp_auth_credentials_free][disable] 1
