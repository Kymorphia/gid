/// Module for [GeolocationManager] class
module webkit.geolocation_manager;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.geolocation_position;
import webkit.types;

/**
    Geolocation manager.
    
    WebKitGeolocationManager provides API to get the geographical position of the user.
    Once a #WebKitGeolocationPermissionRequest is allowed, when WebKit needs to know the
    user location #WebKitGeolocationManager::start signal is emitted. If the signal is handled
    and returns true, the application is responsible for providing the position every time it's
    updated by calling [webkit.geolocation_manager.GeolocationManager.updatePosition]. The signal #WebKitGeolocationManager::stop
    will be emitted when location updates are no longer needed.
*/
class GeolocationManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_geolocation_manager_get_type != &gidSymbolNotFound ? webkit_geolocation_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GeolocationManager self()
  {
    return this;
  }

  /**
      Get `enableHighAccuracy` property.
      Returns: Whether high accuracy is enabled. This is a read-only property that will be
        set to true when a #WebKitGeolocationManager needs to get accurate position updates.
        You can connect to notify::enable-high-accuracy signal to monitor it.
  */
  @property bool enableHighAccuracy()
  {
    return getEnableHighAccuracy();
  }

  /**
      Notify manager that determining the position failed.
  
      Params:
        errorMessage = the error message
  */
  void failed(string errorMessage)
  {
    const(char)* _errorMessage = errorMessage.toCString(No.Alloc);
    webkit_geolocation_manager_failed(cast(WebKitGeolocationManager*)this._cPtr, _errorMessage);
  }

  /**
      Get whether high accuracy is enabled.
      Returns: Whether the setting is enabled.
  */
  bool getEnableHighAccuracy()
  {
    bool _retval;
    _retval = cast(bool)webkit_geolocation_manager_get_enable_high_accuracy(cast(WebKitGeolocationManager*)this._cPtr);
    return _retval;
  }

  /**
      Notify manager that position has been updated to position.
  
      Params:
        position = a #WebKitGeolocationPosition
  */
  void updatePosition(webkit.geolocation_position.GeolocationPosition position)
  {
    webkit_geolocation_manager_update_position(cast(WebKitGeolocationManager*)this._cPtr, position ? cast(WebKitGeolocationPosition*)position._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Start` signal.
  
      The signal is emitted to notify that manager needs to start receiving
        position updates. After this signal is emitted the user should provide
        the updates using [webkit.geolocation_manager.GeolocationManager.updatePosition] every time
        the position changes, or use [webkit.geolocation_manager.GeolocationManager.failed] in case
        it isn't possible to determine the current position.
        
        If the signal is not handled, WebKit will try to determine the position
        using GeoClue if available.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.geolocation_manager.GeolocationManager geolocationManager))
  
          `geolocationManager` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStart(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.geolocation_manager.GeolocationManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("start", closure, after);
  }

  /**
      Connect to `Stop` signal.
  
      The signal is emitted to notify that manager doesn't need to receive
        position updates anymore.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.geolocation_manager.GeolocationManager geolocationManager))
  
          `geolocationManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStop(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.geolocation_manager.GeolocationManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop", closure, after);
  }
}
