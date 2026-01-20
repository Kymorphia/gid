/// Module for [FileSystemDatasetWriteOptions] class
module arrowdataset.file_system_dataset_write_options;

import arrow.file_system;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_write_options;
import arrowdataset.partitioning;
import arrowdataset.types;
import gid.gid;
import gobject.object;

/** */
class FileSystemDatasetWriteOptions : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_file_system_dataset_write_options_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_write_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSystemDatasetWriteOptions self()
  {
    return this;
  }

  /** */
  @property string baseDir()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("base-dir");
  }

  /** */
  @property void baseDir(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("base-dir", propval);
  }

  /**
      Get `baseNameTemplate` property.
      Returns: Template string used to generate fragment base names. {i} will be
        replaced by an auto incremented integer.
  */
  @property string baseNameTemplate()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("base-name-template");
  }

  /**
      Set `baseNameTemplate` property.
      Params:
        propval = Template string used to generate fragment base names. {i} will be
          replaced by an auto incremented integer.
  */
  @property void baseNameTemplate(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("base-name-template", propval);
  }

  /** */
  @property arrow.file_system.FileSystem fileSystem()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("file-system");
  }

  /** */
  @property void fileSystem(arrow.file_system.FileSystem propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.file_system.FileSystem)("file-system", propval);
  }

  /** */
  @property arrowdataset.file_write_options.FileWriteOptions fileWriteOptions()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.file_write_options.FileWriteOptions)("file-write-options");
  }

  /** */
  @property void fileWriteOptions(arrowdataset.file_write_options.FileWriteOptions propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowdataset.file_write_options.FileWriteOptions)("file-write-options", propval);
  }

  /**
      Get `maxPartitions` property.
      Returns: Maximum number of partitions any batch may be written into.
  */
  @property uint maxPartitions()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("max-partitions");
  }

  /**
      Set `maxPartitions` property.
      Params:
        propval = Maximum number of partitions any batch may be written into.
  */
  @property void maxPartitions(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("max-partitions", propval);
  }

  /**
      Get `partitioning` property.
      Returns: #GADatasetPartitioning used to generate fragment paths.
  */
  @property arrowdataset.partitioning.Partitioning partitioning()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.partitioning.Partitioning)("partitioning");
  }

  /**
      Set `partitioning` property.
      Params:
        propval = #GADatasetPartitioning used to generate fragment paths.
  */
  @property void partitioning(arrowdataset.partitioning.Partitioning propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowdataset.partitioning.Partitioning)("partitioning", propval);
  }

  /** */
  this()
  {
    GADatasetFileSystemDatasetWriteOptions* _cretval;
    _cretval = gadataset_file_system_dataset_write_options_new();
    this(_cretval, Yes.Take);
  }
}
