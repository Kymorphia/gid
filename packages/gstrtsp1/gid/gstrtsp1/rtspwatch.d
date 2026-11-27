/// Module for [RTSPWatch] class
module gid.gstrtsp1.rtspwatch;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.main_context;
import gid.glib2.time_val;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspmessage;
import gid.gstrtsp1.types;

/**
    Opaque RTSP watch object that can be used for asynchronous RTSP
    operations.
*/
@gidGir("RTSPWatch")
class RTSPWatch : OpaqueWrap!(GstRTSPWatch*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Adds a #GstRTSPWatch to a context so that it will be executed within that context.
  
      Params:
        context = a GMainContext (if NULL, the default context will be used)
      Returns: the ID (greater than 0) for the watch within the GMainContext.
  */
  uint attach(gid.glib2.main_context.MainContext context = null) nothrow
  {
    uint _retval;
    _retval = gst_rtsp_watch_attach(cast(GstRTSPWatch*)this._cPtr, context ? cast(GMainContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the maximum amount of bytes and messages that will be queued in watch.
      See [gid.gstrtsp1.rtspwatch.RTSPWatch.setSendBacklog].
  
      Params:
        bytes = maximum bytes
        messages = maximum messages
  */
  void getSendBacklog(out size_t bytes, out uint messages) nothrow
  {
    gst_rtsp_watch_get_send_backlog(cast(GstRTSPWatch*)this._cPtr, cast(size_t*)&bytes, cast(uint*)&messages);
  }

  /**
      Reset watch, this is usually called after [gid.gstrtsp1.rtspconnection.RTSPConnection.doTunnel]
      when the file descriptors of the connection might have changed.
  */
  void reset() nothrow
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
  gid.gstrtsp1.types.RTSPResult sendMessage(gid.gstrtsp1.rtspmessage.RTSPMessage message, out uint id) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_send_message(cast(GstRTSPWatch*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, cast(uint*)&id);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
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
  gid.gstrtsp1.types.RTSPResult sendMessages(gid.gstrtsp1.rtspmessage.RTSPMessage[] messages, out uint id) nothrow
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    auto _messages_arr = new GstRTSPMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = obj ? *cast(GstRTSPMessage*)obj._cPtr(No.Dup) : GstRTSPMessage.init;
    _cretval = gst_rtsp_watch_send_messages(cast(GstRTSPWatch*)this._cPtr, _messages, _nMessages, cast(uint*)&id);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      When flushing is true, abort a call to [gid.gstrtsp1.rtspwatch.RTSPWatch.waitBacklog]
      and make sure [gid.gstrtsp1.rtspwatch.RTSPWatch.writeData] returns immediately with
      #GST_RTSP_EINTR. And empty the queue.
  
      Params:
        flushing = new flushing state
  */
  void setFlushing(bool flushing) nothrow
  {
    gst_rtsp_watch_set_flushing(cast(GstRTSPWatch*)this._cPtr, flushing);
  }

  /**
      Set the maximum amount of bytes and messages that will be queued in watch.
      When the maximum amounts are exceeded, [gid.gstrtsp1.rtspwatch.RTSPWatch.writeData] and
      [gid.gstrtsp1.rtspwatch.RTSPWatch.sendMessage] will return #GST_RTSP_ENOMEM.
      
      A value of 0 for bytes or messages means no limits.
  
      Params:
        bytes = maximum bytes
        messages = maximum messages
  */
  void setSendBacklog(size_t bytes, uint messages) nothrow
  {
    gst_rtsp_watch_set_send_backlog(cast(GstRTSPWatch*)this._cPtr, bytes, messages);
  }

  /**
      Wait until there is place in the backlog queue, timeout is reached
      or watch is set to flushing.
      
      If timeout is null this function can block forever. If timeout
      contains a valid timeout, this function will return [gid.gstrtsp1.types.RTSPResult.Etimeout]
      after the timeout expired.
      
      The typically use of this function is when gst_rtsp_watch_write_data
      returns [gid.gstrtsp1.types.RTSPResult.Enomem]. The caller then calls this function to wait for
      free space in the backlog queue and try again.
  
      Params:
        timeout = a GTimeVal timeout
      Returns: [gid.gstrtsp1.types.RTSPResult.Ok] when if there is room in queue.
                 [gid.gstrtsp1.types.RTSPResult.Etimeout] when timeout was reached.
                 [gid.gstrtsp1.types.RTSPResult.Eintr] when watch is flushing
                 [gid.gstrtsp1.types.RTSPResult.Einval] when called with invalid parameters.
  */
  gid.gstrtsp1.types.RTSPResult waitBacklog(gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_wait_backlog(cast(GstRTSPWatch*)this._cPtr, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Wait until there is place in the backlog queue, timeout is reached
      or watch is set to flushing.
      
      If timeout is 0 this function can block forever. If timeout
      contains a valid timeout, this function will return [gid.gstrtsp1.types.RTSPResult.Etimeout]
      after the timeout expired.
      
      The typically use of this function is when gst_rtsp_watch_write_data
      returns [gid.gstrtsp1.types.RTSPResult.Enomem]. The caller then calls this function to wait for
      free space in the backlog queue and try again.
  
      Params:
        timeout = a timeout in microseconds
      Returns: [gid.gstrtsp1.types.RTSPResult.Ok] when if there is room in queue.
                 [gid.gstrtsp1.types.RTSPResult.Etimeout] when timeout was reached.
                 [gid.gstrtsp1.types.RTSPResult.Eintr] when watch is flushing
                 [gid.gstrtsp1.types.RTSPResult.Einval] when called with invalid parameters.
  */
  gid.gstrtsp1.types.RTSPResult waitBacklogUsec(long timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_watch_wait_backlog_usec(cast(GstRTSPWatch*)this._cPtr, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Write data using the connection of the watch. If it cannot be sent
      immediately, it will be queued for transmission in watch. The contents of
      message will then be serialized and transmitted when the connection of the
      watch becomes writable. In case the message is queued, the ID returned in
      id will be non-zero and used as the ID argument in the message_sent
      callback.
      
      This function will take ownership of data and [gid.glib2.global.gfree] it after use.
      
      If the amount of queued data exceeds the limits set with
      [gid.gstrtsp1.rtspwatch.RTSPWatch.setSendBacklog], this function will return
      #GST_RTSP_ENOMEM.
  
      Params:
        data = the data to queue
        id = location for a message ID or null
      Returns: #GST_RTSP_OK on success. #GST_RTSP_ENOMEM when the backlog limits
        are reached. #GST_RTSP_EINTR when watch was flushing.
  */
  gid.gstrtsp1.types.RTSPResult writeData(ubyte[] data, out uint id) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)gMalloc((data.length) * (ubyte).sizeof);
    _data[0 .. data.length] = data[];
    _cretval = gst_rtsp_watch_write_data(cast(GstRTSPWatch*)this._cPtr, _data, _size, cast(uint*)&id);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }
}
