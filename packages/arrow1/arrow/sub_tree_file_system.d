/// Module for [SubTreeFileSystem] class
module arrow.sub_tree_file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_system;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SubTreeFileSystem : arrow.file_system.FileSystem
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
    return cast(void function())garrow_sub_tree_file_system_get_type != &gidSymbolNotFound ? garrow_sub_tree_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SubTreeFileSystem self()
  {
    return this;
  }

  /**
  Get builder for [arrow.sub_tree_file_system.SubTreeFileSystem]
  Returns: New builder object
  */
  static SubTreeFileSystemGidBuilder builder()
  {
    return new SubTreeFileSystemGidBuilder;
  }

  /** */
  @property arrow.file_system.FileSystem baseFileSystem()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("base-file-system");
  }

  /** */
  this(string basePath, arrow.file_system.FileSystem baseFileSystem)
  {
    GArrowSubTreeFileSystem* _cretval;
    const(char)* _basePath = basePath.toCString(No.Alloc);
    _cretval = garrow_sub_tree_file_system_new(_basePath, baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class SubTreeFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{

  /** */
  T baseFileSystem(arrow.file_system.FileSystem propval)
  {
    return setProperty("base-file-system", propval);
  }
}

/// Fluent builder for [arrow.sub_tree_file_system.SubTreeFileSystem]
final class SubTreeFileSystemGidBuilder : SubTreeFileSystemGidBuilderImpl!SubTreeFileSystemGidBuilder
{
  SubTreeFileSystem build()
  {
    return new SubTreeFileSystem(cast(void*)createGObject(SubTreeFileSystem._getGType), Yes.Take);
  }
}
