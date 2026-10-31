/// C types for glibunix2 library
module glibunix.c.types;

public import gid.basictypes;
public import glib.c.types;

/**
    Mnemonic constants for the ends of a Unix pipe.
*/
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
struct GUnixPipe
{
  /**
      A pair of file descriptors, each negative if closed or not yet opened.
       The file descriptor with index [glibunix.types.PipeEnd.Read] is readable.
       The file descriptor with index [glibunix.types.PipeEnd.Write] is writable.
  */
  int[2] fds;
}

alias extern(C) gboolean function(int fd, GIOCondition condition, void* userData) GUnixFDSourceFunc;

