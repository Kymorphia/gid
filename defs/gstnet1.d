//!gir GstNet-1.0
//!info description "D binding for the GstNet library - Network classes for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstnet1/
//!info capi https://gstreamer.freedesktop.org/documentation/net/index.html


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[NetAddressMeta].field[meta][writable] 0
//!set record[NetControlMessageMeta].field[meta][writable] 0
