/// Module for [SystemClock] class
module gid.gst1.system_clock;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.clock;
import gid.gst1.types;

/**
    The GStreamer core provides a GstSystemClock based on the system time.
    Asynchronous callbacks are scheduled from an internal thread.
    
    Clock implementors are encouraged to subclass this systemclock as it
    implements the async notification.
    
    Subclasses can however override all of the important methods for sync and
    async notifications to implement their own callback methods or blocking
    wait operations.
*/
class SystemClock : gid.gst1.clock.Clock
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
    return cast(void function())gst_system_clock_get_type != &gidSymbolNotFound ? gst_system_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstSystemClock";
  }

  /** Returns `this`, for use in `with` statements. */
  override SystemClock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.system_clock.SystemClock]
      Returns: New builder object
  */
  static SystemClockGidBuilder builder() nothrow
  {
    return new SystemClockGidBuilder;
  }

  /** */
  @property gid.gst1.types.ClockType clockType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.types.ClockType)("clock-type");
  }

  /** */
  @property void clockType(gid.gst1.types.ClockType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.types.ClockType)("clock-type", propval);
  }

  /**
      Get a handle to the default system clock. The refcount of the
      clock will be increased so you need to unref the clock after
      usage.
      Returns: the default clock.
        
        MT safe.
  */
  static gid.gst1.clock.Clock obtain() nothrow
  {
    GstClock* _cretval;
    _cretval = gst_system_clock_obtain();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the default system clock that can be obtained with
      [gid.gst1.system_clock.SystemClock.obtain].
      
      This is mostly used for testing and debugging purposes when you
      want to have control over the time reported by the default system
      clock.
      
      MT safe.
  
      Params:
        newClock = a #GstClock
  */
  static void setDefault(gid.gst1.clock.Clock newClock = null) nothrow
  {
    gst_system_clock_set_default(newClock ? cast(GstClock*)newClock._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gst1.system_clock.SystemClock]
class SystemClockGidBuilderImpl(T) : gid.gst1.clock.ClockGidBuilderImpl!T
{

  /** */
  T clockType(gid.gst1.types.ClockType propval) nothrow
  {
    return setProperty("clock-type", propval);
  }
}

/// Fluent builder for [gid.gst1.system_clock.SystemClock]
final class SystemClockGidBuilder : SystemClockGidBuilderImpl!SystemClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SystemClock build() nothrow
  {
    return new SystemClock(cast(void*)createGObject(SystemClock._getGType), Yes.Take);
  }
}
