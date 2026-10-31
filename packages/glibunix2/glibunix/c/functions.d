/// C functions for glibunix2 library
module glibunix.c.functions;

public import gid.basictypes;
import gid.loader;
import glibunix.c.types;
public import glib.c.types;

private immutable LIBS = ["gobject-2.0_0", "glib-2.0_0"];

__gshared extern(C) nothrow
{
  // global
  int function(int lowfd) c_g_closefrom; ///
  GQuark function() c_g_unix_error_quark; ///
  uint function(int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData) c_g_unix_fd_add; ///
  uint function(int priority, int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData, GDestroyNotify notify) c_g_unix_fd_add_full; ///
  char* function(int fd, GError** _err) c_g_unix_fd_query_path; ///
  GSource* function(int fd, GIOCondition condition) c_g_unix_fd_source_new; ///
  int function(int lowfd) c_g_fdwalk_set_cloexec; ///
  void* function(const(char)* userName, GError** _err) c_g_unix_get_passwd_entry; ///
  gboolean function(int* fds, int flags, GError** _err) c_g_unix_open_pipe; ///
  gboolean function(int fd, gboolean nonblock, GError** _err) c_g_unix_set_fd_nonblocking; ///
  uint function(int signum, GSourceFunc handler, void* userData) c_g_unix_signal_add; ///
  uint function(int priority, int signum, GSourceFunc handler, void* userData, GDestroyNotify notify) c_g_unix_signal_add_full; ///
  GSource* function(int signum) c_g_unix_signal_source_new; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
