/// C types for glibunix2 library
module gid.glibunix2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "GLibUnix";

/// GIR namespace version of the binding
enum string _gidGirVersion = "2.0";

/// C headers of the binding library (included by the C headers of D libraries using its types)
enum string[] _gidGirCIncludes = ["glib-unix.h", "glib.h"];

/**
    Mnemonic constants for the ends of a Unix pipe.
*/
@gidGir("PipeEnd")
enum GUnixPipeEnd
{
  /**
      The readable file descriptor 0
  */
  Read = 0,

  /**
      The writable file descriptor 1
  */
  Write = 1,
}

/**
    A Unix pipe. The advantage of this type over `int[2]` is that it can
    be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`,
    on compilers that support that feature.
*/
@gidGir("Pipe")
struct GUnixPipe
{
  /**
      A pair of file descriptors, each negative if closed or not yet opened.
       The file descriptor with index [gid.glibunix2.types.PipeEnd.Read] is readable.
       The file descriptor with index [gid.glibunix2.types.PipeEnd.Write] is writable.
  */
  int[2] fds;
}

alias extern(C) gboolean function(int fd, GIOCondition condition, void* userData) GUnixFDSourceFunc;

