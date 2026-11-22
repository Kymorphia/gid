/// C functions for glibunix2 library
module gid.glibunix2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.glibunix2.c.types;
public import gid.glib2.c.types;

private immutable LIBS = ["gobject-2.0_0", "glib-2.0_0"];

// global
private alias c_g_closefromFn = extern(C) int function(int lowfd) nothrow;
__gshared c_g_closefromFn c_g_closefrom; ///
private alias c_g_unix_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_unix_error_quarkFn c_g_unix_error_quark; ///
private alias c_g_unix_fd_addFn = extern(C) uint function(int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData) nothrow;
__gshared c_g_unix_fd_addFn c_g_unix_fd_add; ///
private alias c_g_unix_fd_add_fullFn = extern(C) uint function(int priority, int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_unix_fd_add_fullFn c_g_unix_fd_add_full; ///
private alias c_g_unix_fd_query_pathFn = extern(C) char* function(int fd, GError** _err) nothrow;
__gshared c_g_unix_fd_query_pathFn c_g_unix_fd_query_path; ///
private alias c_g_unix_fd_source_newFn = extern(C) GSource* function(int fd, GIOCondition condition) nothrow;
__gshared c_g_unix_fd_source_newFn c_g_unix_fd_source_new; ///
private alias c_g_fdwalk_set_cloexecFn = extern(C) int function(int lowfd) nothrow;
__gshared c_g_fdwalk_set_cloexecFn c_g_fdwalk_set_cloexec; ///
private alias c_g_unix_get_passwd_entryFn = extern(C) void* function(const(char)* userName, GError** _err) nothrow;
__gshared c_g_unix_get_passwd_entryFn c_g_unix_get_passwd_entry; ///
private alias c_g_unix_open_pipeFn = extern(C) gboolean function(int* fds, int flags, GError** _err) nothrow;
__gshared c_g_unix_open_pipeFn c_g_unix_open_pipe; ///
private alias c_g_unix_set_fd_nonblockingFn = extern(C) gboolean function(int fd, gboolean nonblock, GError** _err) nothrow;
__gshared c_g_unix_set_fd_nonblockingFn c_g_unix_set_fd_nonblocking; ///
private alias c_g_unix_signal_addFn = extern(C) uint function(int signum, GSourceFunc handler, void* userData) nothrow;
__gshared c_g_unix_signal_addFn c_g_unix_signal_add; ///
private alias c_g_unix_signal_add_fullFn = extern(C) uint function(int priority, int signum, GSourceFunc handler, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_unix_signal_add_fullFn c_g_unix_signal_add_full; ///
private alias c_g_unix_signal_source_newFn = extern(C) GSource* function(int signum) nothrow;
__gshared c_g_unix_signal_source_newFn c_g_unix_signal_source_new; ///

// global

/** */
alias g_closefrom = c_g_closefrom;

/** */
alias g_unix_error_quark = c_g_unix_error_quark;

/** */
alias g_unix_fd_add = c_g_unix_fd_add;

/** */
alias g_unix_fd_add_full = c_g_unix_fd_add_full;

/** */
alias g_unix_fd_query_path = c_g_unix_fd_query_path;

/** */
alias g_unix_fd_source_new = c_g_unix_fd_source_new;

/** */
alias g_fdwalk_set_cloexec = c_g_fdwalk_set_cloexec;

/** */
alias g_unix_get_passwd_entry = c_g_unix_get_passwd_entry;

/** */
alias g_unix_open_pipe = c_g_unix_open_pipe;

/** */
alias g_unix_set_fd_nonblocking = c_g_unix_set_fd_nonblocking;

/** */
alias g_unix_signal_add = c_g_unix_signal_add;

/** */
alias g_unix_signal_add_full = c_g_unix_signal_add_full;

/** */
alias g_unix_signal_source_new = c_g_unix_signal_source_new;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.glibunix2");

  // global
  gidLink(cast(void**)&g_closefrom, "g_closefrom", libs);
  gidLink(cast(void**)&g_unix_error_quark, "g_unix_error_quark", libs);
  gidLink(cast(void**)&g_unix_fd_add, "g_unix_fd_add", libs);
  gidLink(cast(void**)&g_unix_fd_add_full, "g_unix_fd_add_full", libs);
  gidLink(cast(void**)&g_unix_fd_query_path, "g_unix_fd_query_path", libs);
  gidLink(cast(void**)&g_unix_fd_source_new, "g_unix_fd_source_new", libs);
  gidLink(cast(void**)&g_fdwalk_set_cloexec, "g_fdwalk_set_cloexec", libs);
  gidLink(cast(void**)&g_unix_get_passwd_entry, "g_unix_get_passwd_entry", libs);
  gidLink(cast(void**)&g_unix_open_pipe, "g_unix_open_pipe", libs);
  gidLink(cast(void**)&g_unix_set_fd_nonblocking, "g_unix_set_fd_nonblocking", libs);
  gidLink(cast(void**)&g_unix_signal_add, "g_unix_signal_add", libs);
  gidLink(cast(void**)&g_unix_signal_add_full, "g_unix_signal_add_full", libs);
  gidLink(cast(void**)&g_unix_signal_source_new, "g_unix_signal_source_new", libs);
}
