//!gir GstRtsp-1.0
//!info description "D binding for the GstRtsp library - RTSP library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstrtsp1/
//!info capi https://gstreamer.freedesktop.org/documentation/rtsplib/index.html

// Disabled: fill a structure with C allocated members (freed by gst_rtsp_transport_free), which a D copy would leak
// or double free (needs an owned C allocated wrapper without a copy function)
//!set record[RTSPTransport].function[new][disable] 1
//!set record[RTSPTransport].function[init][disable] 1
//!set record[RTSPTransport].function[parse][disable] 1

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
//!set function[rtsp_auth_credentials_free][ignore] 1


//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[RTSPAuthCredential].field[authorization][writable] 0
//!set record[RTSPAuthParam].field[name][writable] 0
//!set record[RTSPAuthParam].field[value][writable] 0

//# Set NULL-terminated array field (read-only, parsed credentials)
//!set record[RTSPAuthCredential].field[params].type '<array zero-terminated="1" c:type="GstRTSPAuthParam**"><type name="RTSPAuthParam" c:type="GstRTSPAuthParam*"/></array>'
//!set record[RTSPAuthCredential].field[params][writable] 0
