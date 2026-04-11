/// Module for [AzureFileSystem] class
module arrow.azure_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class AzureFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_azure_file_system_get_type != &gidSymbolNotFound ? garrow_azure_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AzureFileSystem self()
  {
    return this;
  }

  /**
      Get builder for [arrow.azure_file_system.AzureFileSystem]
      Returns: New builder object
  */
  static AzureFileSystemGidBuilder builder()
  {
    return new AzureFileSystemGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.azure_file_system.AzureFileSystem]
class AzureFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.azure_file_system.AzureFileSystem]
final class AzureFileSystemGidBuilder : AzureFileSystemGidBuilderImpl!AzureFileSystemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AzureFileSystem build()
  {
    return new AzureFileSystem(cast(void*)createGObject(AzureFileSystem._getGType), No.Take);
  }
}
