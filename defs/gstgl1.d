//!gir GstGL-1.0
//!info description "D binding for the GstGL library - OpenGL for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gstgl.html
//!info capi https://gstreamer.freedesktop.org/documentation/gl/index.html

//# Conflicts with copy method
//!set record[GLAllocationParams].field[copy][ignore] 1

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set class[GLShader].method[set_uniform_matrix_2fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_2x3fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_2x4fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_3fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_3x2fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_3x4fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_4fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_4x2fv][unsupported] 1
//!set class[GLShader].method[set_uniform_matrix_4x3fv][unsupported] 1

//# Disable class APIs
//!set class[GLFilter].function[add_rgba_pad_templates][ignore] 1

//# caller-allocated-out-array (Caller allocated output array)
//!set function[gl_swizzle_invert].parameters.parameter[inversion][caller-allocates] 1
//!set function[gl_video_format_swizzle].parameters.parameter[swizzle][caller-allocates] 1
