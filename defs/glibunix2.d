//!gir GLibUnix-2.0
//!info description "D binding for the GLibUnix library - Portable API for dynamically loading modules"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~glibunix2/
//!info capi https://docs.gtk.org/glib-unix/

//# Output array of the two pipe file descriptors (annotated as an input array)
//!set function[open_pipe].parameters.parameter[fds][direction] out
//!set function[open_pipe].parameters.parameter[fds][caller-allocates] 1
