//!gir GdkPixbuf-2.0
//!info description "D binding for the GdkPixbuf library - Image loading library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gdkpixbuf.html
//!info capi https://docs.gtk.org/gdk-pixbuf/

//# Set basic parameters to out
//!set callback[PixbufModuleSizeFunc].parameters.parameter[width][direction] out
//!set callback[PixbufModuleSizeFunc].parameters.parameter[height][direction] out

//# string-array-null-term (String array null terminated)
//!set callback[PixbufModuleSaveCallbackFunc].parameters.parameter[option_keys].array[][zero-terminated] 1
//!set callback[PixbufModuleSaveCallbackFunc].parameters.parameter[option_values].array[][zero-terminated] 1
