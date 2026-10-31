/// D types for glibunix2 library
module glibunix.types;

import gid.gid;
import glib.types;
import glibunix.c.functions;
import glibunix.c.types;


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
alias FDSourceFunc = bool delegate(int fd, glib.types.IOCondition condition);
