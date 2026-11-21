/// Module for [AppSinkSimpleCallbacks] class
module gid.gstapp1.app_sink_simple_callbacks;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstapp1.app_sink;
import gid.gstapp1.c.functions;
import gid.gstapp1.c.types;
import gid.gstapp1.types;

/**
    A set of callbacks that can be installed on the appsink with
    [gid.gstapp1.app_sink.AppSink.setSimpleCallbacks].
    
    Unlike GstAppSinkCallbacks this can also be used from bindings.
*/
class AppSinkSimpleCallbacks : gid.gobject2.boxed.BoxedWrap!(gst_app_sink_simple_callbacks_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AppSinkSimpleCallbacks self() nothrow
  {
    return this;
  }

  /**
      Creates a new instance of callbacks.
      Returns: New empty GstAppSinkSimpleCallbacks
  */
  this() nothrow
  {
    GstAppSinkSimpleCallbacks* _cretval;
    _cretval = gst_app_sink_simple_callbacks_new();
    this(_cretval, Yes.Take);
  }

  /**
      Sets the EOS callback on cb.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        eosCb = EOS callback
  */
  void setEos(gid.gstapp1.types.AppSinkEosCallback eosCb) nothrow
  {
    extern(C) void _eosCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      auto _dlg = cast(gid.gstapp1.types.AppSinkEosCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSinkEosCallback");
      }
    }
    auto _eosCbCB = eosCb ? &_eosCbCallback : null;
    auto _eosCb = eosCb ? freezeDelegate(cast(void*)&eosCb) : null;
    GDestroyNotify _eosCbDestroyCB = eosCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_eos(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _eosCbCB, _eosCb, _eosCbDestroyCB);
  }

  /**
      Sets the new event callback on cb.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        newEventCb = new event callback
  */
  void setNewEvent(gid.gstapp1.types.AppSinkNewEventCallback newEventCb) nothrow
  {
    extern(C) gboolean _newEventCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gstapp1.types.AppSinkNewEventCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSinkNewEventCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _newEventCbCB = newEventCb ? &_newEventCbCallback : null;
    auto _newEventCb = newEventCb ? freezeDelegate(cast(void*)&newEventCb) : null;
    GDestroyNotify _newEventCbDestroyCB = newEventCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_new_event(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _newEventCbCB, _newEventCb, _newEventCbDestroyCB);
  }

  /**
      Sets the new preroll callback on cb.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        newPrerollCb = new preroll callback
  */
  void setNewPreroll(gid.gstapp1.types.AppSinkNewPrerollCallback newPrerollCb) nothrow
  {
    extern(C) GstFlowReturn _newPrerollCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gstapp1.types.AppSinkNewPrerollCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSinkNewPrerollCallback");
      }
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _newPrerollCbCB = newPrerollCb ? &_newPrerollCbCallback : null;
    auto _newPrerollCb = newPrerollCb ? freezeDelegate(cast(void*)&newPrerollCb) : null;
    GDestroyNotify _newPrerollCbDestroyCB = newPrerollCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_new_preroll(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _newPrerollCbCB, _newPrerollCb, _newPrerollCbDestroyCB);
  }

  /**
      Sets the new sample callback on cb.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        newSampleCb = new sample callback
  */
  void setNewSample(gid.gstapp1.types.AppSinkNewSampleCallback newSampleCb) nothrow
  {
    extern(C) GstFlowReturn _newSampleCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      gid.gst1.types.FlowReturn _dretval;
      auto _dlg = cast(gid.gstapp1.types.AppSinkNewSampleCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSinkNewSampleCallback");
      }
      auto _retval = cast(GstFlowReturn)_dretval;

      return _retval;
    }
    auto _newSampleCbCB = newSampleCb ? &_newSampleCbCallback : null;
    auto _newSampleCb = newSampleCb ? freezeDelegate(cast(void*)&newSampleCb) : null;
    GDestroyNotify _newSampleCbDestroyCB = newSampleCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_new_sample(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _newSampleCbCB, _newSampleCb, _newSampleCbDestroyCB);
  }

  /**
      Sets the new event callback on cb.
      
      Once cb is set on an #GstAppSink it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        proposeAllocationCb = propose allocation callback
  */
  void setProposeAllocation(gid.gstapp1.types.AppSinkProposeAllocationCallback proposeAllocationCb) nothrow
  {
    extern(C) gboolean _proposeAllocationCbCallback(GstAppSink* appsink, GstQuery* query, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gstapp1.types.AppSinkProposeAllocationCallback*)userData;
      auto _query = query ? new gid.gst1.query.Query(cast(void*)query, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_sink.AppSink)(cast(void*)appsink, No.Take), _query);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSinkProposeAllocationCallback");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_query)
        _query._cUnborrow;

      return _retval;
    }
    auto _proposeAllocationCbCB = proposeAllocationCb ? &_proposeAllocationCbCallback : null;
    auto _proposeAllocationCb = proposeAllocationCb ? freezeDelegate(cast(void*)&proposeAllocationCb) : null;
    GDestroyNotify _proposeAllocationCbDestroyCB = proposeAllocationCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_propose_allocation(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _proposeAllocationCbCB, _proposeAllocationCb, _proposeAllocationCbDestroyCB);
  }
}
