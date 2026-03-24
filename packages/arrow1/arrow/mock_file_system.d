/// Module for [MockFileSystem] class
module arrow.mock_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class MockFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_mock_file_system_get_type != &gidSymbolNotFound ? garrow_mock_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MockFileSystem self()
  {
    return this;
  }

  /**
  Get builder for [arrow.mock_file_system.MockFileSystem]
  Returns: New builder object
  */
  static MockFileSystemGidBuilder builder()
  {
    return new MockFileSystemGidBuilder;
  }
}

class MockFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.mock_file_system.MockFileSystem]
final class MockFileSystemGidBuilder : MockFileSystemGidBuilderImpl!MockFileSystemGidBuilder
{
  MockFileSystem build()
  {
    return new MockFileSystem(cast(void*)createGObject(MockFileSystem._getGType), No.Take);
  }
}
