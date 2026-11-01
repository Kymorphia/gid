/// Module for [AppSrcSimpleCallbacks] class
module gstapp.app_src_simple_callbacks;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gstapp.app_src;
import gstapp.c.functions;
import gstapp.c.types;
import gstapp.types;

/**
    A set of callbacks that can be installed on the appsink with
    [gstapp.app_sink.AppSink.setSimpleCallbacks].
    
    Unlike GstAppSrcCallbacks this can also be used from bindings.
*/
class AppSrcSimpleCallbacks : gobject.boxed.BoxedWrap!(gst_app_src_simple_callbacks_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AppSrcSimpleCallbacks self() nothrow
  {
    return this;
  }

  /**
      Creates a new instance of callbacks.
      Returns: New empty GstAppSrcSimpleCallbacks
  */
  this() nothrow
  {
    GstAppSrcSimpleCallbacks* _cretval;
    _cretval = gst_app_src_simple_callbacks_new();
    this(_cretval, Yes.Take);
  }

  /**
      Sets the enough data callback on cb.
      
      Once cb is set on an #GstAppSrc it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        enoughDataCb = EOS callback
  */
  void setEnoughData(gstapp.types.AppSrcEnoughDataCallback enoughDataCb) nothrow
  {
    extern(C) void _enoughDataCbCallback(GstAppSrc* appsrc, void* userData) nothrow
    {
      auto _dlg = cast(gstapp.types.AppSrcEnoughDataCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_src.AppSrc)(cast(void*)appsrc, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSrcEnoughDataCallback");
      }
    }
    auto _enoughDataCbCB = enoughDataCb ? &_enoughDataCbCallback : null;
    auto _enoughDataCb = enoughDataCb ? freezeDelegate(cast(void*)&enoughDataCb) : null;
    GDestroyNotify _enoughDataCbDestroyCB = enoughDataCb ? &thawDelegate : null;
    gst_app_src_simple_callbacks_set_enough_data(cast(GstAppSrcSimpleCallbacks*)this._cPtr, _enoughDataCbCB, _enoughDataCb, _enoughDataCbDestroyCB);
  }

  /**
      Sets the need data callback on cb.
      
      Once cb is set on an #GstAppSrc it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        needDataCb = EOS callback
  */
  void setNeedData(gstapp.types.AppSrcNeedDataCallback needDataCb) nothrow
  {
    extern(C) void _needDataCbCallback(GstAppSrc* appsrc, uint length, void* userData) nothrow
    {
      auto _dlg = cast(gstapp.types.AppSrcNeedDataCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_src.AppSrc)(cast(void*)appsrc, No.Take), length);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSrcNeedDataCallback");
      }
    }
    auto _needDataCbCB = needDataCb ? &_needDataCbCallback : null;
    auto _needDataCb = needDataCb ? freezeDelegate(cast(void*)&needDataCb) : null;
    GDestroyNotify _needDataCbDestroyCB = needDataCb ? &thawDelegate : null;
    gst_app_src_simple_callbacks_set_need_data(cast(GstAppSrcSimpleCallbacks*)this._cPtr, _needDataCbCB, _needDataCb, _needDataCbDestroyCB);
  }

  /**
      Sets the seek data callback on cb.
      
      Once cb is set on an #GstAppSrc it is not possible anymore to change any of
      the callbacks inside it.
  
      Params:
        seekDataCb = EOS callback
  */
  void setSeekData(gstapp.types.AppSrcSeekDataCallback seekDataCb) nothrow
  {
    extern(C) gboolean _seekDataCbCallback(GstAppSrc* appsrc, ulong offset, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gstapp.types.AppSrcSeekDataCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstapp.app_src.AppSrc)(cast(void*)appsrc, No.Take), offset);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstapp.types.AppSrcSeekDataCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _seekDataCbCB = seekDataCb ? &_seekDataCbCallback : null;
    auto _seekDataCb = seekDataCb ? freezeDelegate(cast(void*)&seekDataCb) : null;
    GDestroyNotify _seekDataCbDestroyCB = seekDataCb ? &thawDelegate : null;
    gst_app_src_simple_callbacks_set_seek_data(cast(GstAppSrcSimpleCallbacks*)this._cPtr, _seekDataCbCB, _seekDataCb, _seekDataCbDestroyCB);
  }
}
