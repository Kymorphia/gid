/// Module for [AppSinkSimpleCallbacks] class
module gstapp.app_sink_simple_callbacks;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gst.query;
import gst.types;
import gstapp.app_sink;
import gstapp.c.functions;
import gstapp.c.types;
import gstapp.types;

/**
    A set of callbacks that can be installed on the appsink with
    [gstapp.app_sink.AppSink.setSimpleCallbacks].
    
    Unlike GstAppSinkCallbacks this can also be used from bindings.
*/
class AppSinkSimpleCallbacks : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_app_sink_simple_callbacks_get_type != &gidSymbolNotFound ? gst_app_sink_simple_callbacks_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
  void setEos(gstapp.types.AppSinkEosCallback eosCb) nothrow
  {
    extern(C) void _eosCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      auto _dlg = cast(gstapp.types.AppSinkEosCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSinkEosCallback");
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
  void setNewEvent(gstapp.types.AppSinkNewEventCallback newEventCb) nothrow
  {
    extern(C) gboolean _newEventCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gstapp.types.AppSinkNewEventCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSinkNewEventCallback");
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
  void setNewPreroll(gstapp.types.AppSinkNewPrerollCallback newPrerollCb) nothrow
  {
    extern(C) GstFlowReturn _newPrerollCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gstapp.types.AppSinkNewPrerollCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSinkNewPrerollCallback");
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
  void setNewSample(gstapp.types.AppSinkNewSampleCallback newSampleCb) nothrow
  {
    extern(C) GstFlowReturn _newSampleCbCallback(GstAppSink* appsink, void* userData) nothrow
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gstapp.types.AppSinkNewSampleCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_sink.AppSink)(cast(void*)appsink, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSinkNewSampleCallback");
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
  void setProposeAllocation(gstapp.types.AppSinkProposeAllocationCallback proposeAllocationCb) nothrow
  {
    extern(C) gboolean _proposeAllocationCbCallback(GstAppSink* appsink, GstQuery* query, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gstapp.types.AppSinkProposeAllocationCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_sink.AppSink)(cast(void*)appsink, No.Take), query ? new gst.query.Query(cast(void*)query, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSinkProposeAllocationCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _proposeAllocationCbCB = proposeAllocationCb ? &_proposeAllocationCbCallback : null;
    auto _proposeAllocationCb = proposeAllocationCb ? freezeDelegate(cast(void*)&proposeAllocationCb) : null;
    GDestroyNotify _proposeAllocationCbDestroyCB = proposeAllocationCb ? &thawDelegate : null;
    gst_app_sink_simple_callbacks_set_propose_allocation(cast(GstAppSinkSimpleCallbacks*)this._cPtr, _proposeAllocationCbCB, _proposeAllocationCb, _proposeAllocationCbDestroyCB);
  }
}
