/// Module for [PollFD] struct
module gid.gst1.poll_fd;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    A file descriptor object.
*/
struct PollFD
{
  /**
      a file descriptor
  */
  int fd;

  /** */
  int idx;

  /**
      Initializes fd. Alternatively you can initialize it with
      #GST_POLL_FD_INIT.
  */
  void init_() nothrow
  {
    gst_poll_fd_init(cast(GstPollFD*)&this);
  }
}
