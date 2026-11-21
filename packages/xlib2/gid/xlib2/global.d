/// Global functions for xlib2 library
module gid.xlib2.global;

import gid.core.gid;
import gid.xlib2.c.functions;
import gid.xlib2.c.types;
import gid.xlib2.types;


/** */
void openDisplay() nothrow
{
  XOpenDisplay();
}
