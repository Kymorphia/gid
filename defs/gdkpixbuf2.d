//!gir GdkPixbuf-2.0
//!info description "D binding for the GdkPixbuf library - Image loading library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gdkpixbuf2/
//!info capi https://docs.gtk.org/gdk-pixbuf/

//# Set basic parameters to out
//!set callback[PixbufModuleSizeFunc].parameters.parameter[width][direction] out
//!set callback[PixbufModuleSizeFunc].parameters.parameter[height][direction] out

//# string-array-null-term (String array null terminated)
//!set callback[PixbufModuleSaveCallbackFunc].parameters.parameter[option_keys].array[][zero-terminated] 1
//!set callback[PixbufModuleSaveCallbackFunc].parameters.parameter[option_values].array[][zero-terminated] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[PixbufFormat].field[signature][writable] 0
//!set record[PixbufFormat].field[mime_types][writable] 0
//!set record[PixbufFormat].field[extensions][writable] 0
//!set record[PixbufModule].field[module][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[PixbufFormat].field[name][writable] 0
//!set record[PixbufFormat].field[domain][writable] 0
//!set record[PixbufFormat].field[description][writable] 0
//!set record[PixbufFormat].field[license][writable] 0

//# Disable: Redundant with another API (e.g. GBytes variant, simpler setter or accessor methods)
//!set callback[PixbufDestroyNotify][ignore] 1
//!set class[Pixbuf].constructor[new_from_data][ignore] 1
