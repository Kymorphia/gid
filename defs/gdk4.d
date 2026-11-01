//!gir Gdk-4.0
//!info description "D binding for the Gdk4 library - Graphics Drawing Toolkit part of Gtk4"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gdk4/
//!info capi https://docs.gtk.org/gdk4/

//# Conflicts with undocumented Phobos object.Object.Monitor interface
//!subtype Monitor MonitorWrap


//# Disable: Internal/implementation-only API, not useful from D
//!set class[ContentDeserializer].method[set_task_data][ignore] 1
//!set class[ContentSerializer].method[set_task_data][ignore] 1

//# Texture release callbacks have no user_data, mark the GDestroyNotify data parameter as its closure
//!set class[GLTexture].constructor[new].parameters.parameter[destroy][closure] 5
//!set class[GLTextureBuilder].method[build].parameters.parameter[destroy][closure] 1
//!set class[DmabufTextureBuilder].method[build].parameters.parameter[destroy][closure] 1
