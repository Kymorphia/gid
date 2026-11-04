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

// GdkEvent union members are copied with gdk_event_copy() (refs window/device, copies axes, strings, etc), the kind
// override keeps them Wrap structures (a free-function otherwise makes a record opaque)
//!set record[EventAny][copy-function] gdk_event_copy
//!set record[EventAny][free-function] gdk_event_free
//!kind EventAny Wrap
//!set record[EventButton][copy-function] gdk_event_copy
//!set record[EventButton][free-function] gdk_event_free
//!kind EventButton Wrap
//!set record[EventConfigure][copy-function] gdk_event_copy
//!set record[EventConfigure][free-function] gdk_event_free
//!kind EventConfigure Wrap
//!set record[EventCrossing][copy-function] gdk_event_copy
//!set record[EventCrossing][free-function] gdk_event_free
//!kind EventCrossing Wrap
//!set record[EventDND][copy-function] gdk_event_copy
//!set record[EventDND][free-function] gdk_event_free
//!kind EventDND Wrap
//!set record[EventExpose][copy-function] gdk_event_copy
//!set record[EventExpose][free-function] gdk_event_free
//!kind EventExpose Wrap
//!set record[EventFocus][copy-function] gdk_event_copy
//!set record[EventFocus][free-function] gdk_event_free
//!kind EventFocus Wrap
//!set record[EventGrabBroken][copy-function] gdk_event_copy
//!set record[EventGrabBroken][free-function] gdk_event_free
//!kind EventGrabBroken Wrap
//!set record[EventKey][copy-function] gdk_event_copy
//!set record[EventKey][free-function] gdk_event_free
//!kind EventKey Wrap
//!set record[EventMotion][copy-function] gdk_event_copy
//!set record[EventMotion][free-function] gdk_event_free
//!kind EventMotion Wrap
//!set record[EventOwnerChange][copy-function] gdk_event_copy
//!set record[EventOwnerChange][free-function] gdk_event_free
//!kind EventOwnerChange Wrap
//!set record[EventPadAxis][copy-function] gdk_event_copy
//!set record[EventPadAxis][free-function] gdk_event_free
//!kind EventPadAxis Wrap
//!set record[EventPadButton][copy-function] gdk_event_copy
//!set record[EventPadButton][free-function] gdk_event_free
//!kind EventPadButton Wrap
//!set record[EventPadGroupMode][copy-function] gdk_event_copy
//!set record[EventPadGroupMode][free-function] gdk_event_free
//!kind EventPadGroupMode Wrap
//!set record[EventProperty][copy-function] gdk_event_copy
//!set record[EventProperty][free-function] gdk_event_free
//!kind EventProperty Wrap
//!set record[EventProximity][copy-function] gdk_event_copy
//!set record[EventProximity][free-function] gdk_event_free
//!kind EventProximity Wrap
//!set record[EventScroll][copy-function] gdk_event_copy
//!set record[EventScroll][free-function] gdk_event_free
//!kind EventScroll Wrap
//!set record[EventSelection][copy-function] gdk_event_copy
//!set record[EventSelection][free-function] gdk_event_free
//!kind EventSelection Wrap
//!set record[EventSetting][copy-function] gdk_event_copy
//!set record[EventSetting][free-function] gdk_event_free
//!kind EventSetting Wrap
//!set record[EventTouch][copy-function] gdk_event_copy
//!set record[EventTouch][free-function] gdk_event_free
//!kind EventTouch Wrap
//!set record[EventTouchpadPinch][copy-function] gdk_event_copy
//!set record[EventTouchpadPinch][free-function] gdk_event_free
//!kind EventTouchpadPinch Wrap
//!set record[EventTouchpadSwipe][copy-function] gdk_event_copy
//!set record[EventTouchpadSwipe][free-function] gdk_event_free
//!kind EventTouchpadSwipe Wrap
//!set record[EventVisibility][copy-function] gdk_event_copy
//!set record[EventVisibility][free-function] gdk_event_free
//!kind EventVisibility Wrap
//!set record[EventWindowState][copy-function] gdk_event_copy
//!set record[EventWindowState][free-function] gdk_event_free
//!kind EventWindowState Wrap
//!set record[EventSelection].field[target][writable] 0
//!set record[EventSelection].field[property][writable] 0

//# Disable: Internal/implementation-only API, not useful from D
//!set callback[FilterFunc][ignore] 1

//# Disable: Axes array fields with a length from the device (number of axes)
//!set record[EventButton].field[axes][disable] 1
//!set record[EventMotion].field[axes][disable] 1
//!set record[EventTouch].field[axes][disable] 1
