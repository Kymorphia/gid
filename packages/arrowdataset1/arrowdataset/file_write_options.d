/// Module for [FileWriteOptions] class
module arrowdataset.file_write_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FileWriteOptions : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_file_write_options_get_type != &gidSymbolNotFound ? gadataset_file_write_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileWriteOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrowdataset.file_write_options.FileWriteOptions]
  Returns: New builder object
  */
  static FileWriteOptionsGidBuilder builder()
  {
    return new FileWriteOptionsGidBuilder;
  }
}

class FileWriteOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T options(void* propval)
  {
    return setProperty("options", propval);
  }
}

/// Fluent builder for [arrowdataset.file_write_options.FileWriteOptions]
final class FileWriteOptionsGidBuilder : FileWriteOptionsGidBuilderImpl!FileWriteOptionsGidBuilder
{
  FileWriteOptions build()
  {
    return new FileWriteOptions(cast(void*)createGObject(FileWriteOptions._getGType), No.Take);
  }
}
