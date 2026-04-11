/// Module for [SystemClock] class
module gst.system_clock;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.clock;
import gst.types;

/**
    The GStreamer core provides a GstSystemClock based on the system time.
    Asynchronous callbacks are scheduled from an internal thread.
    
    Clock implementors are encouraged to subclass this systemclock as it
    implements the async notification.
    
    Subclasses can however override all of the important methods for sync and
    async notifications to implement their own callback methods or blocking
    wait operations.
*/
class SystemClock : gst.clock.Clock
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
    return cast(void function())gst_system_clock_get_type != &gidSymbolNotFound ? gst_system_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SystemClock self()
  {
    return this;
  }

  /**
      Get builder for [gst.system_clock.SystemClock]
      Returns: New builder object
  */
  static SystemClockGidBuilder builder()
  {
    return new SystemClockGidBuilder;
  }

  /** */
  @property gst.types.ClockType clockType()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.ClockType)("clock-type");
  }

  /** */
  @property void clockType(gst.types.ClockType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.types.ClockType)("clock-type", propval);
  }

  /**
      Get a handle to the default system clock. The refcount of the
      clock will be increased so you need to unref the clock after
      usage.
      Returns: the default clock.
        
        MT safe.
  */
  static gst.clock.Clock obtain()
  {
    GstClock* _cretval;
    _cretval = gst_system_clock_obtain();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the default system clock that can be obtained with
      [gst.system_clock.SystemClock.obtain].
      
      This is mostly used for testing and debugging purposes when you
      want to have control over the time reported by the default system
      clock.
      
      MT safe.
  
      Params:
        newClock = a #GstClock
  */
  static void setDefault(gst.clock.Clock newClock = null)
  {
    gst_system_clock_set_default(newClock ? cast(GstClock*)newClock._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gst.system_clock.SystemClock]
class SystemClockGidBuilderImpl(T) : gst.clock.ClockGidBuilderImpl!T
{

  /** */
  T clockType(gst.types.ClockType propval)
  {
    return setProperty("clock-type", propval);
  }
}

/// Fluent builder for [gst.system_clock.SystemClock]
final class SystemClockGidBuilder : SystemClockGidBuilderImpl!SystemClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SystemClock build()
  {
    return new SystemClock(cast(void*)createGObject(SystemClock._getGType), No.Take);
  }
}
