/// Module for [IPCFileFormat] class
module arrowdataset.ipcfile_format;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_format;
import arrowdataset.types;
import gid.gid;
import gobject.gid_builder;

/** */
class IPCFileFormat : arrowdataset.file_format.FileFormat
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
    return cast(void function())gadataset_ipc_file_format_get_type != &gidSymbolNotFound ? gadataset_ipc_file_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IPCFileFormat self()
  {
    return this;
  }

  /**
  Get builder for [arrowdataset.ipcfile_format.IPCFileFormat]
  Returns: New builder object
  */
  static IPCFileFormatGidBuilder builder()
  {
    return new IPCFileFormatGidBuilder;
  }

  /** */
  this()
  {
    GADatasetIPCFileFormat* _cretval;
    _cretval = gadataset_ipc_file_format_new();
    this(_cretval, Yes.Take);
  }
}

class IPCFileFormatGidBuilderImpl(T) : arrowdataset.file_format.FileFormatGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.ipcfile_format.IPCFileFormat]
final class IPCFileFormatGidBuilder : IPCFileFormatGidBuilderImpl!IPCFileFormatGidBuilder
{
  IPCFileFormat build()
  {
    return new IPCFileFormat(cast(void*)createGObject(IPCFileFormat._getGType), Yes.Take);
  }
}
