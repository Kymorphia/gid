//!gir Gsk-4.0
//!info description "D binding for the Gsk4 library - GTK rendering abstraction library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gsk4/
//!info capi https://docs.gtk.org/gsk4/

//# PathPoint should be opaque
//!set record[PathPoint][opaque] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[RoundedRect].field[bounds][writable] 0
