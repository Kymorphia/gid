//!gir GstNet-1.0
//!info description "D binding for the GstNet library - Network classes for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstnet1/
//!info capi https://gstreamer.freedesktop.org/documentation/net/index.html

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_net_address_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_net_control_message_meta].return-value[][gid-borrow] buffer
//!set function[buffer_get_net_address_meta].return-value[][gid-borrow] buffer


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[NetAddressMeta].field[meta][writable] 0
//!set record[NetControlMessageMeta].field[meta][writable] 0
