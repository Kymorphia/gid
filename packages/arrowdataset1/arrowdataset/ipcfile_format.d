/// Module for [IPCFileFormat] class
module arrowdataset.ipcfile_format;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_ipc_file_format_get_type != &gidSymbolNotFound ? gadataset_ipc_file_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IPCFileFormat self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowdataset.ipcfile_format.IPCFileFormat]
      Returns: New builder object
  */
  static IPCFileFormatGidBuilder builder() nothrow
  {
    return new IPCFileFormatGidBuilder;
  }

  /** */
  this() nothrow
  {
    GADatasetIPCFileFormat* _cretval;
    _cretval = gadataset_ipc_file_format_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrowdataset.ipcfile_format.IPCFileFormat]
class IPCFileFormatGidBuilderImpl(T) : arrowdataset.file_format.FileFormatGidBuilderImpl!T
{
}

/// Fluent builder for [arrowdataset.ipcfile_format.IPCFileFormat]
final class IPCFileFormatGidBuilder : IPCFileFormatGidBuilderImpl!IPCFileFormatGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IPCFileFormat build() nothrow
  {
    return new IPCFileFormat(cast(void*)createGObject(IPCFileFormat._getGType), Yes.Take);
  }
}
