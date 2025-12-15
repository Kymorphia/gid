/// Module for [FileSystemDataset] class
module arrowdataset.file_system_dataset;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset;
import arrowdataset.file_system_dataset_write_options;
import arrowdataset.scanner;
import arrowdataset.types;
import gid.gid;
import glib.error;

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
