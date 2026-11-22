/// D types for glibunix2 library
module gid.glibunix2.types;

import gid.core.utils;
import gid.glib2.types;
import gid.glibunix2.c.functions;
import gid.glibunix2.c.types;


// Enums

/** */
alias PipeEnd = GUnixPipeEnd;

// Structs

/** */
alias Pipe = GUnixPipe;

// Callbacks

/**
    The type of functions to be called when a UNIX fd watch source
    triggers.

    Params:
      fd = the fd that triggered the event
      condition = the IO conditions reported on fd
    Returns: false if the source should be removed
*/
alias FDSourceFunc = bool delegate(int fd, gid.glib2.types.IOCondition condition);
