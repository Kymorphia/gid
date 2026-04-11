/// Module for [FileSystemDataset] class
module arrowdataset.file_system_dataset;

import arrow.file_system;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.file_format;
import arrowdataset.file_system_dataset_write_options;
import arrowdataset.partitioning;
import arrowdataset.scanner;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class FileSystemDataset : arrowdataset.dataset.Dataset
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
    return cast(void function())gadataset_file_system_dataset_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSystemDataset self()
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.file_system_dataset.FileSystemDataset]
      Returns: New builder object
  */
  static FileSystemDatasetGidBuilder builder()
  {
    return new FileSystemDatasetGidBuilder;
  }

  /**
      Get `fileSystem` property.
      Returns: File system of the dataset.
  */
  @property arrow.file_system.FileSystem fileSystem()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("file-system");
  }

  /**
      Get `format` property.
      Returns: Format of the dataset.
  */
  @property arrowdataset.file_format.FileFormat format()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.file_format.FileFormat)("format");
  }

  /**
      Get `partitioning` property.
      Returns: Partitioning of the dataset.
  */
  @property arrowdataset.partitioning.Partitioning partitioning()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.partitioning.Partitioning)("partitioning");
  }

  /** */
  static bool writeScanner(arrowdataset.scanner.Scanner scanner, arrowdataset.file_system_dataset_write_options.FileSystemDatasetWriteOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_file_system_dataset_write_scanner(scanner ? cast(GADatasetScanner*)scanner._cPtr(No.Dup) : null, options ? cast(GADatasetFileSystemDatasetWriteOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowdataset.file_system_dataset.FileSystemDataset]
class FileSystemDatasetGidBuilderImpl(T) : arrowdataset.dataset.DatasetGidBuilderImpl!T
{

  /**
      Set `fileSystem` property.
      Params:
        propval = File system of the dataset.
      Returns: Builder instance for fluent chaining
  */
  T fileSystem(arrow.file_system.FileSystem propval)
  {
    return setProperty("file-system", propval);
  }

  /**
      Set `format` property.
      Params:
        propval = Format of the dataset.
      Returns: Builder instance for fluent chaining
  */
  T format(arrowdataset.file_format.FileFormat propval)
  {
    return setProperty("format", propval);
  }

  /**
      Set `partitioning` property.
      Params:
        propval = Partitioning of the dataset.
      Returns: Builder instance for fluent chaining
  */
  T partitioning(arrowdataset.partitioning.Partitioning propval)
  {
    return setProperty("partitioning", propval);
  }
}

/// Fluent builder for [arrowdataset.file_system_dataset.FileSystemDataset]
final class FileSystemDatasetGidBuilder : FileSystemDatasetGidBuilderImpl!FileSystemDatasetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileSystemDataset build()
  {
    return new FileSystemDataset(cast(void*)createGObject(FileSystemDataset._getGType), No.Take);
  }
}
