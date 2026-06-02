/// Module for [FileSelector] class
module arrow.file_selector;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FileSelector : gobject.object.ObjectWrap
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
    return cast(void function())garrow_file_selector_get_type != &gidSymbolNotFound ? garrow_file_selector_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSelector self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.file_selector.FileSelector]
      Returns: New builder object
  */
  static FileSelectorGidBuilder builder() nothrow
  {
    return new FileSelectorGidBuilder;
  }

  /**
      Get `allowNotFound` property.
      Returns: The behavior if `base_dir` isn't found in the file system.
        If false, an error is returned.  If true, an empty selection is returned.
  */
  @property bool allowNotFound() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-not-found");
  }

  /**
      Set `allowNotFound` property.
      Params:
        propval = The behavior if `base_dir` isn't found in the file system.
          If false, an error is returned.  If true, an empty selection is returned.
  */
  @property void allowNotFound(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-not-found", propval);
  }

  /**
      Get `baseDir` property.
      Returns: The directory in which to select files.
        If the path exists but doesn't point to a directory, this should
        be an error.
  */
  @property string baseDir() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("base-dir");
  }

  /**
      Set `baseDir` property.
      Params:
        propval = The directory in which to select files.
          If the path exists but doesn't point to a directory, this should
          be an error.
  */
  @property void baseDir(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("base-dir", propval);
  }

  /**
      Get `maxRecursion` property.
      Returns: The maximum number of subdirectories to recurse into.
  */
  @property int maxRecursion() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-recursion");
  }

  /**
      Set `maxRecursion` property.
      Params:
        propval = The maximum number of subdirectories to recurse into.
  */
  @property void maxRecursion(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-recursion", propval);
  }

  /**
      Get `recursive` property.
      Returns: Whether to recurse into subdirectories.
  */
  @property bool recursive() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("recursive");
  }

  /**
      Set `recursive` property.
      Params:
        propval = Whether to recurse into subdirectories.
  */
  @property void recursive(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("recursive", propval);
  }
}

/// Fluent builder implementation template for [arrow.file_selector.FileSelector]
class FileSelectorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `allowNotFound` property.
      Params:
        propval = The behavior if `base_dir` isn't found in the file system.
          If false, an error is returned.  If true, an empty selection is returned.
      Returns: Builder instance for fluent chaining
  */
  T allowNotFound(bool propval) nothrow
  {
    return setProperty("allow-not-found", propval);
  }

  /**
      Set `baseDir` property.
      Params:
        propval = The directory in which to select files.
          If the path exists but doesn't point to a directory, this should
          be an error.
      Returns: Builder instance for fluent chaining
  */
  T baseDir(string propval) nothrow
  {
    return setProperty("base-dir", propval);
  }

  /**
      Set `maxRecursion` property.
      Params:
        propval = The maximum number of subdirectories to recurse into.
      Returns: Builder instance for fluent chaining
  */
  T maxRecursion(int propval) nothrow
  {
    return setProperty("max-recursion", propval);
  }

  /**
      Set `recursive` property.
      Params:
        propval = Whether to recurse into subdirectories.
      Returns: Builder instance for fluent chaining
  */
  T recursive(bool propval) nothrow
  {
    return setProperty("recursive", propval);
  }
}

/// Fluent builder for [arrow.file_selector.FileSelector]
final class FileSelectorGidBuilder : FileSelectorGidBuilderImpl!FileSelectorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileSelector build() nothrow
  {
    return new FileSelector(cast(void*)createGObject(FileSelector._getGType), No.Take);
  }
}
