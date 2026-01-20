/// Module for [FileSelector] class
module arrow.file_selector;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FileSelector : gobject.object.ObjectWrap
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
    return cast(void function())garrow_file_selector_get_type != &gidSymbolNotFound ? garrow_file_selector_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSelector self()
  {
    return this;
  }

  /**
      Get `allowNotFound` property.
      Returns: The behavior if `base_dir` isn't found in the file system.
        If false, an error is returned.  If true, an empty selection is returned.
  */
  @property bool allowNotFound()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-not-found");
  }

  /**
      Set `allowNotFound` property.
      Params:
        propval = The behavior if `base_dir` isn't found in the file system.
          If false, an error is returned.  If true, an empty selection is returned.
  */
  @property void allowNotFound(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-not-found", propval);
  }

  /**
      Get `baseDir` property.
      Returns: The directory in which to select files.
        If the path exists but doesn't point to a directory, this should
        be an error.
  */
  @property string baseDir()
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
  @property void baseDir(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("base-dir", propval);
  }

  /**
      Get `maxRecursion` property.
      Returns: The maximum number of subdirectories to recurse into.
  */
  @property int maxRecursion()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-recursion");
  }

  /**
      Set `maxRecursion` property.
      Params:
        propval = The maximum number of subdirectories to recurse into.
  */
  @property void maxRecursion(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-recursion", propval);
  }

  /**
      Get `recursive` property.
      Returns: Whether to recurse into subdirectories.
  */
  @property bool recursive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("recursive");
  }

  /**
      Set `recursive` property.
      Params:
        propval = Whether to recurse into subdirectories.
  */
  @property void recursive(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("recursive", propval);
  }
}
