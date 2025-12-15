/// Module for [FileSystemDatasetFactory] class
module arrowdataset.file_system_dataset_factory;

import arrow.file_system;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.dataset_factory;
import arrowdataset.file_format;
import arrowdataset.file_system_dataset;
import arrowdataset.finish_options;
import arrowdataset.partitioning;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FileSystemDatasetFactory : arrowdataset.dataset_factory.DatasetFactory
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
    return cast(void function())gadataset_file_system_dataset_factory_get_type != &gidSymbolNotFound ? gadataset_file_system_dataset_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSystemDatasetFactory self()
  {
    return this;
  }

  /**
      Get `fileSystem` property.
      Returns: File system passed to #GADatasetFileSystemDataset.
  */
  @property arrow.file_system.FileSystem fileSystem()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.file_system.FileSystem)("file-system");
  }

  /**
      Get `partitionBaseDir` property.
      Returns: Partition base directory used by #GADatasetFileSystemDataset.
  */
  @property string partitionBaseDir()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("partition-base-dir");
  }

  /**
      Set `partitionBaseDir` property.
      Params:
        propval = Partition base directory used by #GADatasetFileSystemDataset.
  */
  @property void partitionBaseDir(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("partition-base-dir", propval);
  }

  /**
      Get `partitioning` property.
      Returns: Partitioning used by #GADatasetFileSystemDataset.
  */
  @property arrowdataset.partitioning.Partitioning partitioning()
  {
    return gobject.object.ObjectWrap.getProperty!(arrowdataset.partitioning.Partitioning)("partitioning");
  }

  /**
      Set `partitioning` property.
      Params:
        propval = Partitioning used by #GADatasetFileSystemDataset.
  */
  @property void partitioning(arrowdataset.partitioning.Partitioning propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrowdataset.partitioning.Partitioning)("partitioning", propval);
  }

  /** */
  this(arrowdataset.file_format.FileFormat fileFormat)
  {
    GADatasetFileSystemDatasetFactory* _cretval;
    _cretval = gadataset_file_system_dataset_factory_new(fileFormat ? cast(GADatasetFileFormat*)fileFormat._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool addPath(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gadataset_file_system_dataset_factory_add_path(cast(GADatasetFileSystemDatasetFactory*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  override arrowdataset.file_system_dataset.FileSystemDataset finish(arrowdataset.finish_options.FinishOptions options = null)
  {
    GADatasetFileSystemDataset* _cretval;
    GError *_err;
    _cretval = gadataset_file_system_dataset_factory_finish(cast(GADatasetFileSystemDatasetFactory*)this._cPtr, options ? cast(GADatasetFinishOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.file_system_dataset.FileSystemDataset)(cast(GADatasetFileSystemDataset*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool setFileSystem(arrow.file_system.FileSystem fileSystem)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gadataset_file_system_dataset_factory_set_file_system(cast(GADatasetFileSystemDatasetFactory*)this._cPtr, fileSystem ? cast(GArrowFileSystem*)fileSystem._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool setFileSystemUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gadataset_file_system_dataset_factory_set_file_system_uri(cast(GADatasetFileSystemDatasetFactory*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
