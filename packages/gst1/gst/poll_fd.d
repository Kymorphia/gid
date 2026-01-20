/// Module for [PollFD] struct
module gst.poll_fd;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

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
  void init_()
  {
    gst_poll_fd_init(cast(GstPollFD*)&this);
  }
}
