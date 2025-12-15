/// Module for [CollectPads] class
module gstbase.collect_pads;

import gid.gid;
import gobject.object;
import gst.buffer;
import gst.event;
import gst.object;
import gst.pad;
import gst.query;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.collect_data;
import gstbase.types;

/**
    Manages a set of pads that operate in collect mode. This means that control
    is given to the manager of this object when all pads have data.
    
      $(LIST
          * Collectpads are created with [gstbase.collect_pads.CollectPads.new_]. A callback should then
            be installed with gst_collect_pads_set_function ().
        
          * Pads are added to the collection with [gstbase.collect_pads.CollectPads.addPad]/
            [gstbase.collect_pads.CollectPads.removePad]. The pad has to be a sinkpad. When added,
            the chain, event and query functions of the pad are overridden. The
            element_private of the pad is used to store private information for the
            collectpads.
        
          * For each pad, data is queued in the _chain function or by
            performing a pull_range.
        
          * When data is queued on all pads in waiting mode, the callback function is called.
        
          * Data can be dequeued from the pad with the [gstbase.collect_pads.CollectPads.pop] method.
            One can peek at the data with the [gstbase.collect_pads.CollectPads.peek] function.
            These functions will return null if the pad received an EOS event. When all
            pads return null from a [gstbase.collect_pads.CollectPads.peek], the element can emit an EOS
            event itself.
        
          * Data can also be dequeued in byte units using the [gstbase.collect_pads.CollectPads.available],
            [gstbase.collect_pads.CollectPads.readBuffer] and [gstbase.collect_pads.CollectPads.flush] calls.
        
          * Elements should call [gstbase.collect_pads.CollectPads.start] and [gstbase.collect_pads.CollectPads.stop] in
            their state change functions to start and stop the processing of the collectpads.
            The [gstbase.collect_pads.CollectPads.stop] call should be called before calling the parent
            element state change function in the PAUSED_TO_READY state change to ensure
            no pad is blocked and the element can finish streaming.
        
          * [gstbase.collect_pads.CollectPads.setWaiting] sets a pad to waiting or non-waiting mode.
            CollectPads element is not waiting for data to be collected on non-waiting pads.
            Thus these pads may but need not have data when the callback is called.
            All pads are in waiting mode by default.
      )
*/
class CollectPads : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_collect_pads_get_type != &gidSymbolNotFound ? gst_collect_pads_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CollectPads self()
  {
    return this;
  }

  /**
      Create a new instance of #GstCollectPads.
      
      MT safe.
      Returns: a new #GstCollectPads, or null in case of an error.
  */
  this()
  {
    GstCollectPads* _cretval;
    _cretval = gst_collect_pads_new();
    this(_cretval, Yes.Take);
  }

  /**
      Query how much bytes can be read from each queued buffer. This means
      that the result of this call is the maximum number of bytes that can
      be read from each of the pads.
      
      This function should be called with pads STREAM_LOCK held, such as
      in the callback.
      
      MT safe.
      Returns: The maximum number of bytes queued on all pads. This function
        returns 0 if a pad has no queued buffer.
  */
  uint available()
  {
    uint _retval;
    _retval = gst_collect_pads_available(cast(GstCollectPads*)this._cPtr);
    return _retval;
  }

  /**
      Convenience clipping function that converts incoming buffer's timestamp
      to running time, or clips the buffer if outside configured segment.
      
      Since 1.6, this clipping function also sets the DTS parameter of the
      GstCollectData structure. This version of the running time DTS can be
      negative. G_MININT64 is used to indicate invalid value.
  
      Params:
        cdata = collect data of corresponding pad
        buf = buffer being clipped
        outbuf = output buffer with running time, or NULL if clipped
        userData = user data (unused)
      Returns: 
  */
  gst.types.FlowReturn clipRunningTime(gstbase.collect_data.CollectData cdata, gst.buffer.Buffer buf, out gst.buffer.Buffer outbuf, void* userData = null)
  {
    GstFlowReturn _cretval;
    GstBuffer* _outbuf;
    _cretval = gst_collect_pads_clip_running_time(cast(GstCollectPads*)this._cPtr, cdata ? cast(GstCollectData*)cdata._cPtr : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, &_outbuf, userData);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    outbuf = new gst.buffer.Buffer(cast(void*)_outbuf, Yes.Take);
    return _retval;
  }

  /**
      Default #GstCollectPads event handling that elements should always
      chain up to to ensure proper operation.  Element might however indicate
      event should not be forwarded downstream.
  
      Params:
        data = collect data of corresponding pad
        event = event being processed
        discard = process but do not send event downstream
      Returns: 
  */
  bool eventDefault(gstbase.collect_data.CollectData data, gst.event.Event event, bool discard)
  {
    bool _retval;
    _retval = cast(bool)gst_collect_pads_event_default(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, event ? cast(GstEvent*)event._cPtr(No.Dup) : null, discard);
    return _retval;
  }

  /**
      Flush size bytes from the pad data.
      
      This function should be called with pads STREAM_LOCK held, such as
      in the callback.
      
      MT safe.
  
      Params:
        data = the data to use
        size = the number of bytes to flush
      Returns: The number of bytes flushed This can be less than size and
        is 0 if the pad was end-of-stream.
  */
  uint flush(gstbase.collect_data.CollectData data, uint size)
  {
    uint _retval;
    _retval = gst_collect_pads_flush(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, size);
    return _retval;
  }

  /**
      Peek at the buffer currently queued in data. This function
      should be called with the pads STREAM_LOCK held, such as in the callback
      handler.
      
      MT safe.
  
      Params:
        data = the data to use
      Returns: The buffer in data or null if no
        buffer is queued. should unref the buffer after usage.
  */
  gst.buffer.Buffer peek(gstbase.collect_data.CollectData data)
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_peek(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pop the buffer currently queued in data. This function
      should be called with the pads STREAM_LOCK held, such as in the callback
      handler.
      
      MT safe.
  
      Params:
        data = the data to use
      Returns: The buffer in data or null if no
        buffer was queued. You should unref the buffer after usage.
  */
  gst.buffer.Buffer pop(gstbase.collect_data.CollectData data)
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_pop(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Default #GstCollectPads query handling that elements should always
      chain up to to ensure proper operation.  Element might however indicate
      query should not be forwarded downstream.
  
      Params:
        data = collect data of corresponding pad
        query = query being processed
        discard = process but do not send event downstream
      Returns: 
  */
  bool queryDefault(gstbase.collect_data.CollectData data, gst.query.Query query, bool discard)
  {
    bool _retval;
    _retval = cast(bool)gst_collect_pads_query_default(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null, discard);
    return _retval;
  }

  /**
      Get a subbuffer of size bytes from the given pad data.
      
      This function should be called with pads STREAM_LOCK held, such as in the
      callback.
      
      MT safe.
  
      Params:
        data = the data to use
        size = the number of bytes to read
      Returns: A sub buffer. The size of the buffer can
        be less that requested. A return of null signals that the pad is
        end-of-stream. Unref the buffer after use.
  */
  gst.buffer.Buffer readBuffer(gstbase.collect_data.CollectData data, uint size)
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_read_buffer(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Remove a pad from the collection of collect pads. This function will also
      free the #GstCollectData and all the resources that were allocated with
      [gstbase.collect_pads.CollectPads.addPad].
      
      The pad will be deactivated automatically when pads is stopped.
      
      MT safe.
  
      Params:
        pad = the pad to remove
      Returns: true if the pad could be removed.
  */
  bool removePad(gst.pad.Pad pad)
  {
    bool _retval;
    _retval = cast(bool)gst_collect_pads_remove_pad(cast(GstCollectPads*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set the callback function and user data that will be called with
      the oldest buffer when all pads have been collected, or null on EOS.
      If a buffer is passed, the callback owns a reference and must unref
      it.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setBufferFunction(gstbase.types.CollectPadsBufferFunction func)
  {
    extern(C) GstFlowReturn _funcCallback(GstCollectPads* pads, GstCollectData* data, GstBuffer* buffer, void* userData)
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gstbase.types.CollectPadsBufferFunction*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take), data ? new gstbase.collect_data.CollectData(cast(void*)data, No.Take) : null, buffer ? new gst.buffer.Buffer(cast(void*)buffer, Yes.Take) : null);
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_buffer_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Install a clipping function that is called right after a buffer is received
      on a pad managed by pads. See #GstCollectPadsClipFunction for more info.
  
      Params:
        clipfunc = clip function to install
  */
  void setClipFunction(gstbase.types.CollectPadsClipFunction clipfunc)
  {
    extern(C) GstFlowReturn _clipfuncCallback(GstCollectPads* pads, GstCollectData* data, GstBuffer* inbuffer, GstBuffer** outbuffer, void* userData)
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gstbase.types.CollectPadsClipFunction*)userData;
      auto _outbuffer = new gst.buffer.Buffer(outbuffer, No.Take);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take), data ? new gstbase.collect_data.CollectData(cast(void*)data, No.Take) : null, inbuffer ? new gst.buffer.Buffer(cast(void*)inbuffer, Yes.Take) : null, _outbuffer);
      auto _retval = cast(GstFlowReturn)_dretval;
      *outbuffer = *cast(GstBuffer**)_outbuffer._cPtr;

      return _retval;
    }
    auto _clipfuncCB = clipfunc ? &_clipfuncCallback : null;

    auto _clipfunc = clipfunc ? cast(void*)&(clipfunc) : null;
    gst_collect_pads_set_clip_function(cast(GstCollectPads*)this._cPtr, _clipfuncCB, _clipfunc);
  }

  /**
      Set the timestamp comparison function.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setCompareFunction(gstbase.types.CollectPadsCompareFunction func)
  {
    extern(C) int _funcCallback(GstCollectPads* pads, GstCollectData* data1, GstClockTime timestamp1, GstCollectData* data2, GstClockTime timestamp2, void* userData)
    {
      auto _dlg = cast(gstbase.types.CollectPadsCompareFunction*)userData;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take), data1 ? new gstbase.collect_data.CollectData(cast(void*)data1, No.Take) : null, timestamp1, data2 ? new gstbase.collect_data.CollectData(cast(void*)data2, No.Take) : null, timestamp2);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_compare_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Set the event callback function and user data that will be called when
      collectpads has received an event originating from one of the collected
      pads.  If the event being processed is a serialized one, this callback is
      called with pads STREAM_LOCK held, otherwise not.  As this lock should be
      held when calling a number of CollectPads functions, it should be acquired
      if so (unusually) needed.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setEventFunction(gstbase.types.CollectPadsEventFunction func)
  {
    extern(C) gboolean _funcCallback(GstCollectPads* pads, GstCollectData* pad, GstEvent* event, void* userData)
    {
      auto _dlg = cast(gstbase.types.CollectPadsEventFunction*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take), pad ? new gstbase.collect_data.CollectData(cast(void*)pad, No.Take) : null, event ? new gst.event.Event(cast(void*)event, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_event_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Install a flush function that is called when the internal
      state of all pads should be flushed as part of flushing seek
      handling. See #GstCollectPadsFlushFunction for more info.
  
      Params:
        func = flush function to install
  */
  void setFlushFunction(gstbase.types.CollectPadsFlushFunction func)
  {
    extern(C) void _funcCallback(GstCollectPads* pads, void* userData)
    {
      auto _dlg = cast(gstbase.types.CollectPadsFlushFunction*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_flush_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Change the flushing state of all the pads in the collection. No pad
      is able to accept anymore data when flushing is true. Calling this
      function with flushing false makes pads accept data again.
      Caller must ensure that downstream streaming (thread) is not blocked,
      e.g. by sending a FLUSH_START downstream.
      
      MT safe.
  
      Params:
        flushing = desired state of the pads
  */
  void setFlushing(bool flushing)
  {
    gst_collect_pads_set_flushing(cast(GstCollectPads*)this._cPtr, flushing);
  }

  /**
      CollectPads provides a default collection algorithm that will determine
      the oldest buffer available on all of its pads, and then delegate
      to a configured callback.
      However, if circumstances are more complicated and/or more control
      is desired, this sets a callback that will be invoked instead when
      all the pads added to the collection have buffers queued.
      Evidently, this callback is not compatible with
      [gstbase.collect_pads.CollectPads.setBufferFunction] callback.
      If this callback is set, the former will be unset.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setFunction(gstbase.types.CollectPadsFunction func)
  {
    extern(C) GstFlowReturn _funcCallback(GstCollectPads* pads, void* userData)
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gstbase.types.CollectPadsFunction*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take));
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Set the query callback function and user data that will be called after
      collectpads has received a query originating from one of the collected
      pads.  If the query being processed is a serialized one, this callback is
      called with pads STREAM_LOCK held, otherwise not.  As this lock should be
      held when calling a number of CollectPads functions, it should be acquired
      if so (unusually) needed.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setQueryFunction(gstbase.types.CollectPadsQueryFunction func)
  {
    extern(C) gboolean _funcCallback(GstCollectPads* pads, GstCollectData* pad, GstQuery* query, void* userData)
    {
      auto _dlg = cast(gstbase.types.CollectPadsQueryFunction*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstbase.collect_pads.CollectPads)(cast(void*)pads, No.Take), pad ? new gstbase.collect_data.CollectData(cast(void*)pad, No.Take) : null, query ? new gst.query.Query(cast(void*)query, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gst_collect_pads_set_query_function(cast(GstCollectPads*)this._cPtr, _funcCB, _func);
  }

  /**
      Sets a pad to waiting or non-waiting mode, if at least this pad
      has not been created with locked waiting state,
      in which case nothing happens.
      
      This function should be called with pads STREAM_LOCK held, such as
      in the callback.
      
      MT safe.
  
      Params:
        data = the data to use
        waiting = boolean indicating whether this pad should operate
                    in waiting or non-waiting mode
  */
  void setWaiting(gstbase.collect_data.CollectData data, bool waiting)
  {
    gst_collect_pads_set_waiting(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, waiting);
  }

  /**
      Default #GstCollectPads event handling for the src pad of elements.
      Elements can chain up to this to let flushing seek event handling
      be done by #GstCollectPads.
  
      Params:
        pad = src #GstPad that received the event
        event = event being processed
      Returns: 
  */
  bool srcEventDefault(gst.pad.Pad pad, gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_collect_pads_src_event_default(cast(GstCollectPads*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Starts the processing of data in the collect_pads.
      
      MT safe.
  */
  void start()
  {
    gst_collect_pads_start(cast(GstCollectPads*)this._cPtr);
  }

  /**
      Stops the processing of data in the collect_pads. this function
      will also unblock any blocking operations.
      
      MT safe.
  */
  void stop()
  {
    gst_collect_pads_stop(cast(GstCollectPads*)this._cPtr);
  }

  /**
      Get a subbuffer of size bytes from the given pad data. Flushes the amount
      of read bytes.
      
      This function should be called with pads STREAM_LOCK held, such as in the
      callback.
      
      MT safe.
  
      Params:
        data = the data to use
        size = the number of bytes to read
      Returns: A sub buffer. The size of the buffer can
        be less that requested. A return of null signals that the pad is
        end-of-stream. Unref the buffer after use.
  */
  gst.buffer.Buffer takeBuffer(gstbase.collect_data.CollectData data, uint size)
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_take_buffer(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
