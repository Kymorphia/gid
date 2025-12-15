/// Module for [Poll] class
module gst.poll;

import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.poll_fd;
import gst.types;

/**
    A #GstPoll keeps track of file descriptors much like fd_set (used with
    select ()) or a struct pollfd array (used with poll ()). Once created with
    [gst.poll.Poll.new_], the set can be used to wait for file descriptors to be
    readable and/or writable. It is possible to make this wait be controlled
    by specifying true for the @controllable flag when creating the set (or
    later calling [gst.poll.Poll.setControllable]).
    
    New file descriptors are added to the set using [gst.poll.Poll.addFd], and
    removed using [gst.poll.Poll.removeFd]. Controlling which file descriptors
    should be waited for to become readable and/or writable are done using
    [gst.poll.Poll.fdCtlRead], [gst.poll.Poll.fdCtlWrite] and [gst.poll.Poll.fdCtlPri].
    
    Use [gst.poll.Poll.wait] to wait for the file descriptors to actually become
    readable and/or writable, or to timeout if no file descriptor is available
    in time. The wait can be controlled by calling [gst.poll.Poll.restart] and
    [gst.poll.Poll.setFlushing].
    
    Once the file descriptor set has been waited for, one can use
    [gst.poll.Poll.fdHasClosed] to see if the file descriptor has been closed,
    [gst.poll.Poll.fdHasError] to see if it has generated an error,
    [gst.poll.Poll.fdCanRead] to see if it is possible to read from the file
    descriptor, and [gst.poll.Poll.fdCanWrite] to see if it is possible to
    write to it.
*/
class Poll
{
  GstPoll* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.poll.Poll");

    cInstancePtr = cast(GstPoll*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Add a file descriptor to the file descriptor set.
  
      Params:
        fd = a file descriptor.
      Returns: true if the file descriptor was successfully added to the set.
  */
  bool addFd(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_add_fd(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Check if fd in set has data to be read.
  
      Params:
        fd = a file descriptor.
      Returns: true if the descriptor has data to be read.
  */
  bool fdCanRead(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_can_read(cast(const(GstPoll)*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Check if fd in set can be used for writing.
  
      Params:
        fd = a file descriptor.
      Returns: true if the descriptor can be used for writing.
  */
  bool fdCanWrite(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_can_write(cast(const(GstPoll)*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Control whether the descriptor fd in set will be monitored for
      exceptional conditions (POLLPRI).
      
      Not implemented on Windows (will just return false there).
  
      Params:
        fd = a file descriptor.
        active = a new status.
      Returns: true if the descriptor was successfully updated.
  */
  bool fdCtlPri(gst.poll_fd.PollFD fd, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_ctl_pri(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null, active);
    return _retval;
  }

  /**
      Control whether the descriptor fd in set will be monitored for
      readability.
  
      Params:
        fd = a file descriptor.
        active = a new status.
      Returns: true if the descriptor was successfully updated.
  */
  bool fdCtlRead(gst.poll_fd.PollFD fd, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_ctl_read(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null, active);
    return _retval;
  }

  /**
      Control whether the descriptor fd in set will be monitored for
      writability.
  
      Params:
        fd = a file descriptor.
        active = a new status.
      Returns: true if the descriptor was successfully updated.
  */
  bool fdCtlWrite(gst.poll_fd.PollFD fd, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_ctl_write(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null, active);
    return _retval;
  }

  /**
      Check if fd in set has closed the connection.
  
      Params:
        fd = a file descriptor.
      Returns: true if the connection was closed.
  */
  bool fdHasClosed(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_has_closed(cast(const(GstPoll)*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Check if fd in set has an error.
  
      Params:
        fd = a file descriptor.
      Returns: true if the descriptor has an error.
  */
  bool fdHasError(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_has_error(cast(const(GstPoll)*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Check if fd in set has an exceptional condition (POLLPRI).
      
      Not implemented on Windows (will just return false there).
  
      Params:
        fd = a file descriptor.
      Returns: true if the descriptor has an exceptional condition.
  */
  bool fdHasPri(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_fd_has_pri(cast(const(GstPoll)*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Mark fd as ignored so that the next call to [gst.poll.Poll.wait] will yield
      the same result for fd as last time. This function must be called if no
      operation (read/write/recv/send/etc.) will be performed on fd before
      the next call to [gst.poll.Poll.wait].
      
      The reason why this is needed is because the underlying implementation
      might not allow querying the fd more than once between calls to one of
      the re-enabling operations.
  
      Params:
        fd = a file descriptor.
  */
  void fdIgnored(gst.poll_fd.PollFD fd)
  {
    gst_poll_fd_ignored(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
  }

  /**
      Get a GPollFD for the reading part of the control socket. This is useful when
      integrating with a GSource and GMainLoop.
  
      Params:
        fd = a #GPollFD
  */
  void getReadGpollfd(glib.types.PollFD fd)
  {
    gst_poll_get_read_gpollfd(cast(GstPoll*)this._cPtr, &fd);
  }

  /**
      Read a byte from the control socket of the controllable set.
      
      This function only works for timer #GstPoll objects created with
      [gst.poll.Poll.newTimer].
      Returns: true on success. false when when there was no byte to read or
        reading the byte failed. If there was no byte to read, and only then, errno
        will contain EWOULDBLOCK or EAGAIN. For all other values of errno this always signals a
        critical error.
  */
  bool readControl()
  {
    bool _retval;
    _retval = cast(bool)gst_poll_read_control(cast(GstPoll*)this._cPtr);
    return _retval;
  }

  /**
      Remove a file descriptor from the file descriptor set.
  
      Params:
        fd = a file descriptor.
      Returns: true if the file descriptor was successfully removed from the set.
  */
  bool removeFd(gst.poll_fd.PollFD fd)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_remove_fd(cast(GstPoll*)this._cPtr, fd ? cast(GstPollFD*)fd._cPtr : null);
    return _retval;
  }

  /**
      Restart any [gst.poll.Poll.wait] that is in progress. This function is typically
      used after adding or removing descriptors to set.
      
      If set is not controllable, then this call will have no effect.
      
      This function only works for non-timer #GstPoll objects created with
      [gst.poll.Poll.new_].
  */
  void restart()
  {
    gst_poll_restart(cast(GstPoll*)this._cPtr);
  }

  /**
      When controllable is true, this function ensures that future calls to
      [gst.poll.Poll.wait] will be affected by [gst.poll.Poll.restart] and
      [gst.poll.Poll.setFlushing].
      
      This function only works for non-timer #GstPoll objects created with
      [gst.poll.Poll.new_].
  
      Params:
        controllable = new controllable state.
      Returns: true if the controllability of set could be updated.
  */
  bool setControllable(bool controllable)
  {
    bool _retval;
    _retval = cast(bool)gst_poll_set_controllable(cast(GstPoll*)this._cPtr, controllable);
    return _retval;
  }

  /**
      When flushing is true, this function ensures that current and future calls
      to [gst.poll.Poll.wait] will return -1, with errno set to EBUSY.
      
      Unsetting the flushing state will restore normal operation of set.
      
      This function only works for non-timer #GstPoll objects created with
      [gst.poll.Poll.new_].
  
      Params:
        flushing = new flushing state.
  */
  void setFlushing(bool flushing)
  {
    gst_poll_set_flushing(cast(GstPoll*)this._cPtr, flushing);
  }

  /**
      Wait for activity on the file descriptors in set. This function waits up to
      the specified timeout.  A timeout of #GST_CLOCK_TIME_NONE waits forever.
      
      For #GstPoll objects created with [gst.poll.Poll.new_], this function can only be
      called from a single thread at a time.  If called from multiple threads,
      -1 will be returned with errno set to EPERM.
      
      This is not true for timer #GstPoll objects created with
      [gst.poll.Poll.newTimer], where it is allowed to have multiple threads waiting
      simultaneously.
  
      Params:
        timeout = a timeout in nanoseconds.
      Returns: The number of #GstPollFD in set that have activity or 0 when no
        activity was detected after timeout. If an error occurs, -1 is returned
        and errno is set.
  */
  int wait(gst.types.ClockTime timeout)
  {
    int _retval;
    _retval = gst_poll_wait(cast(GstPoll*)this._cPtr, timeout);
    return _retval;
  }

  /**
      Write a byte to the control socket of the controllable set.
      This function is mostly useful for timer #GstPoll objects created with
      [gst.poll.Poll.newTimer].
      
      It will make any current and future [gst.poll.Poll.wait] function return with
      1, meaning the control socket is set. After an equal amount of calls to
      [gst.poll.Poll.readControl] have been performed, calls to [gst.poll.Poll.wait] will
      block again until their timeout expired.
      
      This function only works for timer #GstPoll objects created with
      [gst.poll.Poll.newTimer].
      Returns: true on success. false when when the byte could not be written.
        errno contains the detailed error code but will never be EAGAIN, EINTR or
        EWOULDBLOCK. false always signals a critical error.
  */
  bool writeControl()
  {
    bool _retval;
    _retval = cast(bool)gst_poll_write_control(cast(GstPoll*)this._cPtr);
    return _retval;
  }
}
