/// Module for [GeolocationPosition] class
module webkit.geolocation_position;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    An opaque struct to provide position updates to a #WebKitGeolocationManager.
    
    WebKitGeolocationPosition is an opaque struct used to provide position updates to a
    #WebKitGeolocationManager using [webkit.geolocation_manager.GeolocationManager.updatePosition].
*/
class GeolocationPosition : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_geolocation_position_get_type != &gidSymbolNotFound ? webkit_geolocation_position_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GeolocationPosition self()
  {
    return this;
  }

  /**
      Create a new #WebKitGeolocationPosition.
  
      Params:
        latitude = a valid latitude in degrees
        longitude = a valid longitude in degrees
        accuracy = accuracy of location in meters
      Returns: a newly created #WebKitGeolocationPosition
  */
  this(double latitude, double longitude, double accuracy)
  {
    WebKitGeolocationPosition* _cretval;
    _cretval = webkit_geolocation_position_new(latitude, longitude, accuracy);
    this(_cretval, Yes.Take);
  }

  /**
      Make a copy of the #WebKitGeolocationPosition.
      Returns: a copy of position
  */
  webkit.geolocation_position.GeolocationPosition copy()
  {
    WebKitGeolocationPosition* _cretval;
    _cretval = webkit_geolocation_position_copy(cast(WebKitGeolocationPosition*)this._cPtr);
    auto _retval = _cretval ? new webkit.geolocation_position.GeolocationPosition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the position altitude.
  
      Params:
        altitude = altitude in meters
  */
  void setAltitude(double altitude)
  {
    webkit_geolocation_position_set_altitude(cast(WebKitGeolocationPosition*)this._cPtr, altitude);
  }

  /**
      Set the accuracy of position altitude.
  
      Params:
        altitudeAccuracy = accuracy of position altitude in meters
  */
  void setAltitudeAccuracy(double altitudeAccuracy)
  {
    webkit_geolocation_position_set_altitude_accuracy(cast(WebKitGeolocationPosition*)this._cPtr, altitudeAccuracy);
  }

  /**
      Set the position heading.
      
      Set the position heading, as a positive angle between the direction of movement and the North
      direction, in clockwise direction.
  
      Params:
        heading = heading in degrees
  */
  void setHeading(double heading)
  {
    webkit_geolocation_position_set_heading(cast(WebKitGeolocationPosition*)this._cPtr, heading);
  }

  /**
      Set the position speed.
  
      Params:
        speed = speed in meters per second
  */
  void setSpeed(double speed)
  {
    webkit_geolocation_position_set_speed(cast(WebKitGeolocationPosition*)this._cPtr, speed);
  }

  /**
      Set the position timestamp.
      
      By default it's the time when the position was created.
  
      Params:
        timestamp = timestamp in seconds since the epoch, or 0 to use current time
  */
  void setTimestamp(ulong timestamp)
  {
    webkit_geolocation_position_set_timestamp(cast(WebKitGeolocationPosition*)this._cPtr, timestamp);
  }
}
