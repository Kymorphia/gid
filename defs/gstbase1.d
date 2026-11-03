//!gir GstBase-1.0
//!info description "D binding for the GstBase library - Base and Utility classes for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstbase1/
//!info capi https://gstreamer.freedesktop.org/documentation/base/index.html

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set record[BitWriter].method[free_and_get_data][disable] 1
//!set record[BitWriter].method[get_data][disable] 1
//!set record[BitWriter].method[reset_and_get_data][disable] 1
//!set record[ByteWriter].method[reset_and_get_data][disable] 1

//# Set length of array parameters
//!set record[BitWriter].method[put_bytes].parameters.parameter[data].array[][length] 1

//# Set arrays to be zero-terminated=1
//!set record[ByteReader].method[dup_string_utf16].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteReader].method[dup_string_utf32].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf16].parameters.parameter[data].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf32].parameters.parameter[data].array[][zero-terminated] 1

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[BaseParseFrame].field[buffer][owned] 1
//!set record[BaseParseFrame].field[out_buffer][owned] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[BitReader].field[data][writable] 0
//!set record[ByteReader].field[data][writable] 0
//!set record[ByteWriter].field[parent][writable] 0

//# Ignore: CollectPads is deprecated in favor of Aggregator and add_pad requires a raw structure size and destroy notify
//!set class[CollectPads].method[add_pad][ignore] 1

//# Ignore: Free the stack/inline writer and return its data, redundant with the non-freeing accessors in D
//!set record[BitWriter].method[free_and_get_buffer][ignore] 1
//!set record[ByteWriter].method[free_and_get_buffer][ignore] 1
//!set record[ByteWriter].method[free_and_get_data][ignore] 1

//# Disable: Data array field with a length in bits (bit_size)
//!set record[BitWriter].field[data][disable] 1
