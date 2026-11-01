//!gir GstCheck-1.0
//!info description "D binding for the GstCheck library - Check Unit Testing for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstcheck1/
//!info capi https://gstreamer.freedesktop.org/documentation/check/index.html

//# This function is missing its C type "Suite", remove it from the XML
//!del function[check_run_suite]

//# Set basic parameters to out
//!set function[check_init].parameters.parameter[argc][direction] inout
//!set function[check_init].parameters.parameter[argv][direction] inout
//!set function[check_init].parameters.parameter[argv].type '<array length="0" c:type="char***"><type name="utf8" c:type="char**"/></array>'


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[Harness].field[src_harness][writable] 0
//!set record[Harness].field[sink_harness][writable] 0

//# Disable: Internal/implementation-only API, not useful from D
//!set function[check_init][ignore] 1
