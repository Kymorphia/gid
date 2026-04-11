/// Module for [S3FileSystem] class
module arrow.s3_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class S3FileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_s3_file_system_get_type != &gidSymbolNotFound ? garrow_s3_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override S3FileSystem self()
  {
    return this;
  }

  /**
      Get builder for [arrow.s3_file_system.S3FileSystem]
      Returns: New builder object
  */
  static S3FileSystemGidBuilder builder()
  {
    return new S3FileSystemGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.s3_file_system.S3FileSystem]
class S3FileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.s3_file_system.S3FileSystem]
final class S3FileSystemGidBuilder : S3FileSystemGidBuilderImpl!S3FileSystemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  S3FileSystem build()
  {
    return new S3FileSystem(cast(void*)createGObject(S3FileSystem._getGType), No.Take);
  }
}
