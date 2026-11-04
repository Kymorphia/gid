//!gir GstGL-1.0
//!info description "D binding for the GstGL library - OpenGL for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstgl1/
//!info capi https://gstreamer.freedesktop.org/documentation/gl/index.html

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_gl_sync_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_gl_sync_meta_full].return-value[][gid-borrow] buffer

//# Conflicts with copy method
//!set record[GLAllocationParams].field[copy][ignore] 1

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set class[GLShader].method[set_uniform_matrix_2fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_2x3fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_2x4fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_3fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_3x2fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_3x4fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_4fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_4x2fv][disable] 1
//!set class[GLShader].method[set_uniform_matrix_4x3fv][disable] 1

//# Disable class APIs
//!set class[GLFilter].function[add_rgba_pad_templates][ignore] 1

//# caller-allocated-out-array (Caller allocated output array)
//!set function[gl_swizzle_invert].parameters.parameter[inversion][caller-allocates] 1
//!set function[gl_video_format_swizzle].parameters.parameter[swizzle][caller-allocates] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[GLAllocationParams].field[alloc_params][writable] 0
//!set record[GLBaseMemory].field[mem][writable] 0
//!set record[GLBaseMemory].field[query][writable] 0
//!set record[GLBuffer].field[mem][writable] 0
//!set record[GLBufferAllocationParams].field[parent][writable] 0
//!set record[GLMemory].field[mem][writable] 0
//!set record[GLMemory].field[info][writable] 0
//!set record[GLSyncMeta].field[parent][writable] 0
//!set record[GLVideoAllocationParams].field[parent][writable] 0
//!set record[GLVideoAllocationParams].field[valign][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[GLAllocationParams].field[context][writable] 0
//!set record[GLBaseMemory].field[context][writable] 0
//!set record[GLVideoAllocationParams].field[v_info][writable] 0

//# Disable: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[GLAllocationParams].field[user_data][ignore] 1
//!set record[GLAllocationParams].field[wrapped_data][ignore] 1
//!set record[GLAllocationParams].field[gl_handle][ignore] 1
//!set record[GLBaseMemory].field[data][ignore] 1
//!set record[GLSyncMeta].field[data][ignore] 1

//# Disable: Use D native synchronization primitives instead (GLib Mutex/RecMutex/Cond/Private are disabled)
//!set record[GLBaseMemory].field[lock][ignore] 1

//# Closure parameter is named 'stuff' and not detected automatically
//!set callback[GLFramebufferFunc].parameters.parameter[stuff][closure] 0

//# Wrapped memory release callbacks have no user_data, mark the GDestroyNotify data parameter as its closure
//!set record[GLRenderbufferAllocationParams].constructor[new_wrapped].parameters.parameter[notify][closure] 6
//!set record[GLVideoAllocationParams].constructor[new_wrapped_data].parameters.parameter[notify][closure] 8
//!set record[GLVideoAllocationParams].constructor[new_wrapped_gl_handle].parameters.parameter[notify][closure] 8
//!set record[GLVideoAllocationParams].constructor[new_wrapped_texture].parameters.parameter[notify][closure] 8

//# Ignore: GLDisplay window lookup using a GCompareFunc with positional data (find_window is deprecated), rarely useful outside of GL elements
//!set class[GLDisplay].method[find_window][ignore] 1
//!set class[GLDisplay].method[retrieve_window][ignore] 1

//# Ignore: Low-level memory initializers for allocator implementations, not useful from D
//!set record[GLBaseMemory].method[init][ignore] 1
//!set record[GLMemory].method[init][ignore] 1
