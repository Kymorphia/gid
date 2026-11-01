//!gir Gdk-3.0
//!info description "D binding for the Gdk3 library - Graphics Drawing Toolkit part of Gtk3"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gdk3/
//!info capi https://docs.gtk.org/gdk3/

//# Conflicts with undocumented Phobos object.Object.Monitor interface
//!subtype Monitor MonitorWrap


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set union[Event].field[any][writable] 0
//!set union[Event].field[expose][writable] 0
//!set union[Event].field[visibility][writable] 0
//!set union[Event].field[motion][writable] 0
//!set union[Event].field[button][writable] 0
//!set union[Event].field[touch][writable] 0
//!set union[Event].field[scroll][writable] 0
//!set union[Event].field[key][writable] 0
//!set union[Event].field[crossing][writable] 0
//!set union[Event].field[focus_change][writable] 0
//!set union[Event].field[configure][writable] 0
//!set union[Event].field[property][writable] 0
//!set union[Event].field[selection][writable] 0
//!set union[Event].field[owner_change][writable] 0
//!set union[Event].field[proximity][writable] 0
//!set union[Event].field[dnd][writable] 0
//!set union[Event].field[window_state][writable] 0
//!set union[Event].field[setting][writable] 0
//!set union[Event].field[grab_broken][writable] 0
//!set union[Event].field[touchpad_swipe][writable] 0
//!set union[Event].field[touchpad_pinch][writable] 0
//!set union[Event].field[pad_button][writable] 0
//!set union[Event].field[pad_axis][writable] 0
//!set union[Event].field[pad_group_mode][writable] 0
//!set record[EventOwnerChange].field[selection][writable] 0
//!set record[EventProperty].field[atom][writable] 0
//!set record[EventSelection].field[selection][writable] 0
//!set record[EventSelection].field[target][writable] 0
//!set record[EventSelection].field[property][writable] 0

//# Disable: Internal/implementation-only API, not useful from D
//!set callback[FilterFunc][ignore] 1
