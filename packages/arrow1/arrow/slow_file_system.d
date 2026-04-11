/// Module for [SlowFileSystem] class
module arrow.slow_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SlowFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_slow_file_system_get_type != &gidSymbolNotFound ? garrow_slow_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SlowFileSystem self()
  {
    return this;
  }

  /**
      Get builder for [arrow.slow_file_system.SlowFileSystem]
      Returns: New builder object
  */
  static SlowFileSystemGidBuilder builder()
  {
    return new SlowFileSystemGidBuilder;
  }

  /** */
  @property arrow.file_system.FileSystem baseFileSystem()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("base-file-system");
  }

  /**
      The latency is normally distributed with a standard deviation of
      average_latency * 0.1.
      
      The random seed is given by the default random device.
  
      Params:
        baseFileSystem = A #GArrowFileSystem as the base file system.
        averageLatency = The average value of the latency.
      Returns: A newly created #GArrowSlowFileSystem.
  */
  static arrow.slow_file_system.SlowFileSystem newAverageLatency(arrow.file_system.FileSystem baseFileSystem, double averageLatency)
  {
    GArrowSlowFileSystem* _cretval;
    _cretval = garrow_slow_file_system_new_average_latency(baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem._cPtr(No.Dup) : null, averageLatency);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.slow_file_system.SlowFileSystem)(cast(GArrowSlowFileSystem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The latency is normally distributed with a standard deviation of
      average_latency * 0.1.
  
      Params:
        baseFileSystem = A #GArrowFileSystem as the base file system.
        averageLatency = The average value of the latency.
        seed = A random seed.
      Returns: A newly created #GArrowSlowFileSystem.
  */
  static arrow.slow_file_system.SlowFileSystem newAverageLatencyAndSeed(arrow.file_system.FileSystem baseFileSystem, double averageLatency, int seed)
  {
    GArrowSlowFileSystem* _cretval;
    _cretval = garrow_slow_file_system_new_average_latency_and_seed(baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem._cPtr(No.Dup) : null, averageLatency, seed);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.slow_file_system.SlowFileSystem)(cast(GArrowSlowFileSystem*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.slow_file_system.SlowFileSystem]
class SlowFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{

  /** */
  T baseFileSystem(arrow.file_system.FileSystem propval)
  {
    return setProperty("base-file-system", propval);
  }
}

/// Fluent builder for [arrow.slow_file_system.SlowFileSystem]
final class SlowFileSystemGidBuilder : SlowFileSystemGidBuilderImpl!SlowFileSystemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SlowFileSystem build()
  {
    return new SlowFileSystem(cast(void*)createGObject(SlowFileSystem._getGType), No.Take);
  }
}
