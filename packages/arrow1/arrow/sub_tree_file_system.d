/// Module for [SubTreeFileSystem] class
module arrow.sub_tree_file_system;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sub_tree_file_system_get_type != &gidSymbolNotFound ? garrow_sub_tree_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SubTreeFileSystem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.sub_tree_file_system.SubTreeFileSystem]
      Returns: New builder object
  */
  static SubTreeFileSystemGidBuilder builder() nothrow
  {
    return new SubTreeFileSystemGidBuilder;
  }

  /** */
  @property arrow.file_system.FileSystem baseFileSystem() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("base-file-system");
  }

  /** */
  this(string basePath, arrow.file_system.FileSystem baseFileSystem) nothrow
  {
    GArrowSubTreeFileSystem* _cretval;
    const(char)* _basePath = basePath.toCString!(No.Malloc, No.Nullable);
    _cretval = garrow_sub_tree_file_system_new(_basePath, baseFileSystem ? cast(GArrowFileSystem*)baseFileSystem._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.sub_tree_file_system.SubTreeFileSystem]
class SubTreeFileSystemGidBuilderImpl(T) : arrow.file_system.FileSystemGidBuilderImpl!T
{

  /** */
  T baseFileSystem(arrow.file_system.FileSystem propval) nothrow
  {
    return setProperty("base-file-system", propval);
  }
}

/// Fluent builder for [arrow.sub_tree_file_system.SubTreeFileSystem]
final class SubTreeFileSystemGidBuilder : SubTreeFileSystemGidBuilderImpl!SubTreeFileSystemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SubTreeFileSystem build() nothrow
  {
    return new SubTreeFileSystem(cast(void*)createGObject(SubTreeFileSystem._getGType), Yes.Take);
  }
}
