/// Module for [RTSPWatch] class
module gstrtsp.rtspwatch;

import gid.gid;
import glib.main_context;
import glib.time_val;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtspmessage;
import gstrtsp.types;

/**
    Opaque RTSP watch object that can be used for asynchronous RTSP
    operations.
*/
class RTSPWatch
{
  GstRTSPWatch* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtsp.rtspwatch.RTSPWatch");

    _cInstancePtr = cast(GstRTSPWatch*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Adds a #GstRTSPWatch to a context so that it will be executed within that context.
  
      Params:
        context = a GMainContext (if NULL, the default context will be used)
      Returns: the ID (greater than 0) for the watch within the GMainContext.
  */
  uint attach(glib.main_context.MainContext context = null)
  {
    uint _retval;
    _retval = gst_rtsp_watch_attach(cast(GstRTSPWatch*)this._cPtr, context ? cast(GMainContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the maximum amount of bytes and messages that will be queued in watch.
      See [gstrtsp.rtspwatch.RTSPWatch.setSendBacklog].
  
      Params:
        bytes = maximum bytes
        messages = maximum messages
  */
  void getSendBacklog(out size_t bytes, out uint messages)
  {
    gst_rtsp_watch_get_send_backlog(cast(GstRTSPWatch*)this._cPtr, cast(size_t*)&bytes, cast(uint*)&messages);
  }

  /**
      Reset watch, this is usually called after [gstrtsp.rtspconnection.RTSPConnection.doTunnel]
      when the file descriptors of the connection might have changed.
  */
  void reset()
  {
    gst_rtsp_watch_reset(cast(GstRTSPWatch*)this._cPtr);
  }

  /**
      Send a message using the connection of the watch. If it cannot be sent
      immediately, it will be queued for transmission in watch. The contents of
      message will then be serialized and transmitted when the connection of the
      watch becomes writable. In case the message is queued, the ID returned in
      id will be non-zero and used as the ID argument in the message_sent
      callback.
  
      Params:
        message = a #GstRTSPMessage
        id = location for a message ID or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult sendMessage(gstrtsp.rtspmessage.RTSPMessage message, out uint id)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_send_message(cast(GstRTSPWatch*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, cast(uint*)&id);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Sends messages using the connection of the watch. If they cannot be sent
      immediately, they will be queued for transmission in watch. The contents of
      messages will then be serialized and transmitted when the connection of the
      watch becomes writable. In case the messages are queued, the ID returned in
      id will be non-zero and used as the ID argument in the message_sent
      callback once the last message is sent. The callback will only be called
      once for the last message.
  
      Params:
        messages = the messages to send
        id = location for a message ID or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult sendMessages(gstrtsp.rtspmessage.RTSPMessage[] messages, out uint id)
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    GstRTSPMessage[] _tmpmessages;
    foreach (obj; messages)
      _tmpmessages ~= *cast(GstRTSPMessage*)obj._cPtr;
    GstRTSPMessage* _messages = _tmpmessages.ptr;

    _cretval = gst_rtsp_watch_send_messages(cast(GstRTSPWatch*)this._cPtr, _messages, _nMessages, cast(uint*)&id);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      When flushing is true, abort a call to [gstrtsp.rtspwatch.RTSPWatch.waitBacklog]
      and make sure [gstrtsp.rtspwatch.RTSPWatch.writeData] returns immediately with
      #GST_RTSP_EINTR. And empty the queue.
  
      Params:
        flushing = new flushing state
  */
  void setFlushing(bool flushing)
  {
    gst_rtsp_watch_set_flushing(cast(GstRTSPWatch*)this._cPtr, flushing);
  }

  /**
      Set the maximum amount of bytes and messages that will be queued in watch.
      When the maximum amounts are exceeded, [gstrtsp.rtspwatch.RTSPWatch.writeData] and
      [gstrtsp.rtspwatch.RTSPWatch.sendMessage] will return #GST_RTSP_ENOMEM.
      
      A value of 0 for bytes or messages means no limits.
  
      Params:
        bytes = maximum bytes
        messages = maximum messages
  */
  void setSendBacklog(size_t bytes, uint messages)
  {
    gst_rtsp_watch_set_send_backlog(cast(GstRTSPWatch*)this._cPtr, bytes, messages);
  }

  /**
      Wait until there is place in the backlog queue, timeout is reached
      or watch is set to flushing.
      
      If timeout is null this function can block forever. If timeout
      contains a valid timeout, this function will return [gstrtsp.types.RTSPResult.Etimeout]
      after the timeout expired.
      
      The typically use of this function is when gst_rtsp_watch_write_data
      returns [gstrtsp.types.RTSPResult.Enomem]. The caller then calls this function to wait for
      free space in the backlog queue and try again.
  
      Params:
        timeout = a GTimeVal timeout
      Returns: [gstrtsp.types.RTSPResult.Ok] when if there is room in queue.
                 [gstrtsp.types.RTSPResult.Etimeout] when timeout was reached.
                 [gstrtsp.types.RTSPResult.Eintr] when watch is flushing
                 [gstrtsp.types.RTSPResult.Einval] when called with invalid parameters.
  */
  gstrtsp.types.RTSPResult waitBacklog(glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_wait_backlog(cast(GstRTSPWatch*)this._cPtr, cast(GTimeVal*)&timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Wait until there is place in the backlog queue, timeout is reached
      or watch is set to flushing.
      
      If timeout is 0 this function can block forever. If timeout
      contains a valid timeout, this function will return [gstrtsp.types.RTSPResult.Etimeout]
      after the timeout expired.
      
      The typically use of this function is when gst_rtsp_watch_write_data
      returns [gstrtsp.types.RTSPResult.Enomem]. The caller then calls this function to wait for
      free space in the backlog queue and try again.
  
      Params:
        timeout = a timeout in microseconds
      Returns: [gstrtsp.types.RTSPResult.Ok] when if there is room in queue.
                 [gstrtsp.types.RTSPResult.Etimeout] when timeout was reached.
                 [gstrtsp.types.RTSPResult.Eintr] when watch is flushing
                 [gstrtsp.types.RTSPResult.Einval] when called with invalid parameters.
  */
  gstrtsp.types.RTSPResult waitBacklogUsec(long timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_wait_backlog_usec(cast(GstRTSPWatch*)this._cPtr, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }
}
