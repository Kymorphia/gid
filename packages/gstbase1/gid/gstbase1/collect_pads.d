/// Module for [CollectPads] class
module gid.gstbase1.collect_pads;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.event;
import gid.gst1.object;
import gid.gst1.pad;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.collect_data;
import gid.gstbase1.types;

/**
    Manages a set of pads that operate in collect mode. This means that control
    is given to the manager of this object when all pads have data.
    
      * Collectpads are created with [gid.gstbase1.collect_pads.CollectPads.new_]. A callback should then
        be installed with gst_collect_pads_set_function ().
    
      * Pads are added to the collection with [gid.gstbase1.collect_pads.CollectPads.addPad]/
        [gid.gstbase1.collect_pads.CollectPads.removePad]. The pad has to be a sinkpad. When added,
        the chain, event and query functions of the pad are overridden. The
        element_private of the pad is used to store private information for the
        collectpads.
    
      * For each pad, data is queued in the _chain function or by
        performing a pull_range.
    
      * When data is queued on all pads in waiting mode, the callback function is called.
    
      * Data can be dequeued from the pad with the [gid.gstbase1.collect_pads.CollectPads.pop] method.
        One can peek at the data with the [gid.gstbase1.collect_pads.CollectPads.peek] function.
        These functions will return null if the pad received an EOS event. When all
        pads return null from a [gid.gstbase1.collect_pads.CollectPads.peek], the element can emit an EOS
        event itself.
    
      * Data can also be dequeued in byte units using the [gid.gstbase1.collect_pads.CollectPads.available],
        [gid.gstbase1.collect_pads.CollectPads.readBuffer] and [gid.gstbase1.collect_pads.CollectPads.flush] calls.
    
      * Elements should call [gid.gstbase1.collect_pads.CollectPads.start] and [gid.gstbase1.collect_pads.CollectPads.stop] in
        their state change functions to start and stop the processing of the collectpads.
        The [gid.gstbase1.collect_pads.CollectPads.stop] call should be called before calling the parent
        element state change function in the PAUSED_TO_READY state change to ensure
        no pad is blocked and the element can finish streaming.
    
      * [gid.gstbase1.collect_pads.CollectPads.setWaiting] sets a pad to waiting or non-waiting mode.
        CollectPads element is not waiting for data to be collected on non-waiting pads.
        Thus these pads may but need not have data when the callback is called.
        All pads are in waiting mode by default.
*/
@gidGir("CollectPads", "CollectPadsClass")
class CollectPads : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_collect_pads_get_type != &gidSymbolNotFound ? gst_collect_pads_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstCollectPads";
  }

  /** Returns `this`, for use in `with` statements. */
  override CollectPads self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.collect_pads.CollectPads]
      Returns: New builder object
  */
  static CollectPadsGidBuilder builder() nothrow
  {
    return new CollectPadsGidBuilder;
  }

  /**
      Create a new instance of #GstCollectPads.
      
      MT safe.
      Returns: a new #GstCollectPads, or null in case of an error.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstCollectPads* _cretval;
      _cretval = gst_collect_pads_new();
      this(_cretval, Yes.Take);
    }
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
  uint available() nothrow
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
  gid.gst1.types.FlowReturn clipRunningTime(gid.gstbase1.collect_data.CollectData cdata, gid.gst1.buffer.Buffer buf, out gid.gst1.buffer.Buffer outbuf, void* userData = null) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _outbuf;
    _cretval = gst_collect_pads_clip_running_time(cast(GstCollectPads*)this._cPtr, cdata ? cast(GstCollectData*)cdata._cPtr : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, &_outbuf, userData);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_outbuf)
      outbuf = new gid.gst1.buffer.Buffer(cast(void*)_outbuf, Yes.Take);
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
  bool eventDefault(gid.gstbase1.collect_data.CollectData data, gid.gst1.event.Event event, bool discard) nothrow
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
  uint flush(gid.gstbase1.collect_data.CollectData data, uint size) nothrow
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
  gid.gst1.buffer.Buffer peek(gid.gstbase1.collect_data.CollectData data) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_peek(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  gid.gst1.buffer.Buffer pop(gid.gstbase1.collect_data.CollectData data) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_pop(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  bool queryDefault(gid.gstbase1.collect_data.CollectData data, gid.gst1.query.Query query, bool discard) nothrow
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
  gid.gst1.buffer.Buffer readBuffer(gid.gstbase1.collect_data.CollectData data, uint size) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_read_buffer(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, size);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Remove a pad from the collection of collect pads. This function will also
      free the #GstCollectData and all the resources that were allocated with
      [gid.gstbase1.collect_pads.CollectPads.addPad].
      
      The pad will be deactivated automatically when pads is stopped.
      
      MT safe.
  
      Params:
        pad = the pad to remove
      Returns: true if the pad could be removed.
  */
  bool removePad(gid.gst1.pad.Pad pad) nothrow
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
  void setBufferFunction(gid.gstbase1.types.CollectPadsBufferFunction func) nothrow
  {
    extern(C) GstFlowReturn _funcCallback(GstCollectPads* pads, GstCollectData* data, GstBuffer* buffer, void* userData) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsBufferFunction*)userData;
      auto _data = data ? new gid.gstbase1.collect_data.CollectData(cast(void*)data, null) : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take), _data, buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsBufferFunction");
      }
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
  void setClipFunction(gid.gstbase1.types.CollectPadsClipFunction clipfunc) nothrow
  {
    extern(C) GstFlowReturn _clipfuncCallback(GstCollectPads* pads, GstCollectData* data, GstBuffer* inbuffer, GstBuffer** outbuffer, void* userData) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsClipFunction*)userData;
      auto _data = data ? new gid.gstbase1.collect_data.CollectData(cast(void*)data, null) : null;
      gid.gst1.buffer.Buffer _outbuffer;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take), _data, inbuffer ? new gid.gst1.buffer.Buffer(cast(void*)inbuffer, Yes.Take) : null, _outbuffer);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsClipFunction");
      }
      auto _retval = cast(GstFlowReturn)_dretval;
      *outbuffer = _outbuffer ? cast(GstBuffer*)_outbuffer._cPtr(Yes.Dup) : null;

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
  void setCompareFunction(gid.gstbase1.types.CollectPadsCompareFunction func) nothrow
  {
    extern(C) int _funcCallback(GstCollectPads* pads, GstCollectData* data1, GstClockTime timestamp1, GstCollectData* data2, GstClockTime timestamp2, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsCompareFunction*)userData;
      auto _data1 = data1 ? new gid.gstbase1.collect_data.CollectData(cast(void*)data1, null) : null;
      auto _data2 = data2 ? new gid.gstbase1.collect_data.CollectData(cast(void*)data2, null) : null;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take), _data1, timestamp1, _data2, timestamp2);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsCompareFunction");
      }
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
  void setEventFunction(gid.gstbase1.types.CollectPadsEventFunction func) nothrow
  {
    extern(C) gboolean _funcCallback(GstCollectPads* pads, GstCollectData* pad, GstEvent* event, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsEventFunction*)userData;
      auto _pad = pad ? new gid.gstbase1.collect_data.CollectData(cast(void*)pad, null) : null;
      auto _event = event ? new gid.gst1.event.Event(cast(void*)event, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take), _pad, _event);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsEventFunction");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_event)
        _event._cUnborrow;

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
  void setFlushFunction(gid.gstbase1.types.CollectPadsFlushFunction func) nothrow
  {
    extern(C) void _funcCallback(GstCollectPads* pads, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstbase1.types.CollectPadsFlushFunction*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsFlushFunction");
      }
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
  void setFlushing(bool flushing) nothrow
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
      [gid.gstbase1.collect_pads.CollectPads.setBufferFunction] callback.
      If this callback is set, the former will be unset.
      
      MT safe.
  
      Params:
        func = the function to set
  */
  void setFunction(gid.gstbase1.types.CollectPadsFunction func) nothrow
  {
    extern(C) GstFlowReturn _funcCallback(GstCollectPads* pads, void* userData) nothrow
    {
      gidAttachThread();
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsFunction*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsFunction");
      }
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
  void setQueryFunction(gid.gstbase1.types.CollectPadsQueryFunction func) nothrow
  {
    extern(C) gboolean _funcCallback(GstCollectPads* pads, GstCollectData* pad, GstQuery* query, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gstbase1.types.CollectPadsQueryFunction*)userData;
      auto _pad = pad ? new gid.gstbase1.collect_data.CollectData(cast(void*)pad, null) : null;
      auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)pads, No.Take), _pad, _query);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.CollectPadsQueryFunction");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_query)
        _query._cUnborrow;

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
  void setWaiting(gid.gstbase1.collect_data.CollectData data, bool waiting) nothrow
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
  bool srcEventDefault(gid.gst1.pad.Pad pad, gid.gst1.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_collect_pads_src_event_default(cast(GstCollectPads*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, event ? cast(GstEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Starts the processing of data in the collect_pads.
      
      MT safe.
  */
  void start() nothrow
  {
    gst_collect_pads_start(cast(GstCollectPads*)this._cPtr);
  }

  /**
      Stops the processing of data in the collect_pads. this function
      will also unblock any blocking operations.
      
      MT safe.
  */
  void stop() nothrow
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
  gid.gst1.buffer.Buffer takeBuffer(gid.gstbase1.collect_data.CollectData data, uint size) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_collect_pads_take_buffer(cast(GstCollectPads*)this._cPtr, data ? cast(GstCollectData*)data._cPtr : null, size);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstbase1.collect_pads.CollectPads]
class CollectPadsGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstbase1.collect_pads.CollectPads]
final class CollectPadsGidBuilder : CollectPadsGidBuilderImpl!CollectPadsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CollectPads build() nothrow
  {
    return new CollectPads(cast(void*)createGObject(CollectPads._getGType), Yes.Take);
  }
}
