/// Module for [HDFSFileSystem] class
module arrow.hdfsfile_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class HDFSFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_hdfs_file_system_get_type != &gidSymbolNotFound ? garrow_hdfs_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HDFSFileSystem self()
  {
    return this;
  }

  /**
      Get builder for [arrow.hdfsfile_system.HDFSFileSystem]
      Returns: New builder object
  */
  static HDFSFileSystemGidBuilder builder()
  {
    return new HDFSFileSystemGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.hdfsfile_system.HDFSFileSystem]
class HDFSFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.hdfsfile_system.HDFSFileSystem]
final class HDFSFileSystemGidBuilder : HDFSFileSystemGidBuilderImpl!HDFSFileSystemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HDFSFileSystem build()
  {
    return new HDFSFileSystem(cast(void*)createGObject(HDFSFileSystem._getGType), No.Take);
  }
}
