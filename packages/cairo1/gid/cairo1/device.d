/// Module for [Device] class
module gid.cairo1.device;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.types;
import gid.core.utils;
import gid.gobject2.boxed;

/**
    A #cairo_device_t represents the driver interface for drawing
    operations to a #cairo_surface_t.  There are different subtypes of
    #cairo_device_t for different drawing backends.
    
    The type of a device can be queried with [gid.cairo1.device.Device.getDeviceType].
    
    Memory management of #cairo_device_t is done with
    [gid.cairo1.device.Device.reference] and [gid.cairo1.device.Device.destroy].
*/
class Device : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_device_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Device self() nothrow
  {
    return this;
  }

  /**
      Acquires the device for the current thread. This function will block
      until no other thread has acquired the device.
      
      If the return value is [gid.cairo1.types.Status.Success], you successfully acquired the
      device. From now on your thread owns the device and no other thread will be
      able to acquire it until a matching call to [gid.cairo1.device.Device.release]. It is
      allowed to recursively acquire the device multiple times from the same
      thread.
      
      <note><para>You must never acquire two different devices at the same time
      unless this is explicitly allowed. Otherwise the possibility of deadlocks
      exist.
      
      As various Cairo functions can acquire devices when called, these functions
      may also cause deadlocks when you call them with an acquired device. So you
      must not have a device acquired when calling them. These functions are
      marked in the documentation.
      </para></note>
      Returns: [gid.cairo1.types.Status.Success] on success or an error code if
                      the device is in an error state and could not be
                      acquired. After a successful call to [gid.cairo1.device.Device.acquire],
                      a matching call to [gid.cairo1.device.Device.release] is required.
  */
  gid.cairo1.types.Status acquire() nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_device_acquire(cast(cairo_device_t*)this._cPtr);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      This function finishes the device and drops all references to
      external resources. All surfaces, fonts and other objects created
      for this device will be finished, too.
      Further operations on the device will not affect the device but
      will instead trigger a [gid.cairo1.types.Status.DeviceFinished] error.
      
      When the last call to [gid.cairo1.device.Device.destroy] decreases the
      reference count to zero, cairo will call [gid.cairo1.device.Device.finish] if
      it hasn't been called already, before freeing the resources
      associated with the device.
      
      This function may acquire devices.
  */
  void finish() nothrow
  {
    cairo_device_finish(cast(cairo_device_t*)this._cPtr);
  }

  /**
      Finish any pending operations for the device and also restore any
      temporary modifications cairo has made to the device's state.
      This function must be called before switching from using the
      device with Cairo to operating on it directly with native APIs.
      If the device doesn't support direct access, then this function
      does nothing.
      
      This function may acquire devices.
  */
  void flush() nothrow
  {
    cairo_device_flush(cast(cairo_device_t*)this._cPtr);
  }

  /**
      This function returns the type of the device. See #cairo_device_type_t
      for available types.
      Returns: The type of device.
  */
  gid.cairo1.types.DeviceType getDeviceType() nothrow
  {
    cairo_device_type_t _cretval;
    _cretval = cairo_device_get_type(cast(cairo_device_t*)this._cPtr);
    gid.cairo1.types.DeviceType _retval = cast(gid.cairo1.types.DeviceType)_cretval;
    return _retval;
  }

  /**
      Return user data previously attached to device using the
      specified key.  If no user data has been attached with the given
      key this function returns null.
  
      Params:
        key = the address of the #cairo_user_data_key_t the user data was
          attached to
      Returns: the user data previously attached or null.
  */
  void* getUserData(gid.cairo1.types.UserDataKey key) nothrow
  {
    auto _retval = cairo_device_get_user_data(cast(cairo_device_t*)this._cPtr, cast(const(cairo_user_data_key_t)*)&key);
    return _retval;
  }

  /**
      Returns the total elapsed time of the observation.
      Returns: the elapsed time, in nanoseconds.
  */
  double observerElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Returns the elapsed time of the fill operations.
      Returns: the elapsed time, in nanoseconds.
  */
  double observerFillElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_fill_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Returns the elapsed time of the glyph operations.
      Returns: the elapsed time, in nanoseconds.
  */
  double observerGlyphsElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_glyphs_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Returns the elapsed time of the mask operations.
      Returns: the elapsed time, in nanoseconds
  */
  double observerMaskElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_mask_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Returns the elapsed time of the paint operations.
      Returns: the elapsed time, in nanoseconds.
  */
  double observerPaintElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_paint_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Prints the device log using the given function.
  
      Params:
        writeFunc = the write function
      Returns: the status after the operation
  */
  gid.cairo1.types.Status observerPrint(gid.cairo1.types.WriteFunc writeFunc) nothrow
  {
    extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length) nothrow
    {
      gidAttachThread();
      gid.cairo1.types.Status _dretval;
      auto _dlg = cast(gid.cairo1.types.WriteFunc*)closure;
      ubyte[] _data;
      _data.length = length;
      _data[0 .. length] = data[0 .. length];

      try
      {
        _dretval = (*_dlg)(_data);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.cairo1.types.WriteFunc");
      }
      auto _retval = cast(cairo_status_t)_dretval;

      return _retval;
    }
    auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
    cairo_status_t _cretval;
    auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
    _cretval = cairo_device_observer_print(cast(cairo_device_t*)this._cPtr, _writeFuncCB, _writeFunc);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Returns the elapsed time of the stroke operations.
      Returns: the elapsed time, in nanoseconds.
  */
  double observerStrokeElapsed() nothrow
  {
    double _retval;
    _retval = cairo_device_observer_stroke_elapsed(cast(cairo_device_t*)this._cPtr);
    return _retval;
  }

  /**
      Releases a device previously acquired using [gid.cairo1.device.Device.acquire]. See
      that function for details.
  */
  void release() nothrow
  {
    cairo_device_release(cast(cairo_device_t*)this._cPtr);
  }

  /**
      Checks whether an error has previously occurred for this
      device.
      Returns: [gid.cairo1.types.Status.Success] on success or an error code if
                      the device is in an error state.
  */
  gid.cairo1.types.Status status() nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_device_status(cast(cairo_device_t*)this._cPtr);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }
}
