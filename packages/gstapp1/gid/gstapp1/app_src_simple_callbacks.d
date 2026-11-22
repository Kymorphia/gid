/// Module for [AppSrcSimpleCallbacks] class
module gid.gstapp1.app_src_simple_callbacks;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gstapp1.app_src;
import gid.gstapp1.c.functions;
import gid.gstapp1.c.types;
import gid.gstapp1.types;

/**
    A set of callbacks that can be installed on the appsink with
    [gid.gstapp1.app_sink.AppSink.setSimpleCallbacks].
    
    Unlike GstAppSrcCallbacks this can also be used from bindings.
*/
class AppSrcSimpleCallbacks : gid.gobject2.boxed.BoxedWrap!(gst_app_src_simple_callbacks_get_type)
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
  void setEnoughData(gid.gstapp1.types.AppSrcEnoughDataCallback enoughDataCb) nothrow
  {
    extern(C) void _enoughDataCbCallback(GstAppSrc* appsrc, void* userData) nothrow
    {
      auto _dlg = cast(gid.gstapp1.types.AppSrcEnoughDataCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_src.AppSrc)(cast(void*)appsrc, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSrcEnoughDataCallback");
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
  void setNeedData(gid.gstapp1.types.AppSrcNeedDataCallback needDataCb) nothrow
  {
    extern(C) void _needDataCbCallback(GstAppSrc* appsrc, uint length, void* userData) nothrow
    {
      auto _dlg = cast(gid.gstapp1.types.AppSrcNeedDataCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_src.AppSrc)(cast(void*)appsrc, No.Take), length);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSrcNeedDataCallback");
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
  void setSeekData(gid.gstapp1.types.AppSrcSeekDataCallback seekDataCb) nothrow
  {
    extern(C) gboolean _seekDataCbCallback(GstAppSrc* appsrc, ulong offset, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gstapp1.types.AppSrcSeekDataCallback*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstapp1.app_src.AppSrc)(cast(void*)appsrc, No.Take), offset);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstapp1.types.AppSrcSeekDataCallback");
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
