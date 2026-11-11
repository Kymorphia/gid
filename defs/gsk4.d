//!gir Gsk-4.0
//!info description "D binding for the Gsk4 library - GTK rendering abstraction library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gsk4/
//!info capi https://docs.gtk.org/gsk4/

//# PathPoint: keep opaque so private union fields are not exposed as D properties. gid-c-layout
//# emits the GIR field layout in c/types.d so caller-allocated Out parameters can stack-allocate it.
//!set record[PathPoint][opaque] 1
//!set record[PathPoint][gid-c-layout] 1

//# get_next/get_previous modify the path point in place (stack value); GIR incorrectly marks transfer full
//!set record[Path].method[get_next].parameters.parameter[point][transfer-ownership] none
//!set record[Path].method[get_previous].parameters.parameter[point][transfer-ownership] none

//# These PathPoint Outs are written only when the function returns true (empty path / no closer point)
//!set record[Path].method[get_closest_point].parameters.parameter[result][gid-valid-if-return] 1
//!set record[Path].method[get_end_point].parameters.parameter[result][gid-valid-if-return] 1
//!set record[Path].method[get_start_point].parameters.parameter[result][gid-valid-if-return] 1
//!set record[PathMeasure].method[get_point].parameters.parameter[result][gid-valid-if-return] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[RoundedRect].field[bounds][writable] 0
