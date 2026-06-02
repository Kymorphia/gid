/// Global functions for xlib2 library
module xlib.global;

import gid.gid;
import xlib.c.functions;
import xlib.c.types;
import xlib.types;


/** */
void openDisplay() nothrow
{
  XOpenDisplay();
}
