/// Module for [FileFormat] class
module arrowdataset.file_format;

import arrow.file_system;
import arrow.output_stream;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_write_options;
import arrowdataset.file_writer;
import arrowdataset.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FileFormat : gobject.object.ObjectWrap
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
    return cast(void function())gadataset_file_format_get_type != &gidSymbolNotFound ? gadataset_file_format_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileFormat self()
  {
    return this;
  }

  /** */
  bool equal(arrowdataset.file_format.FileFormat otherFormat)
  {
    bool _retval;
    _retval = cast(bool)gadataset_file_format_equal(cast(GADatasetFileFormat*)this._cPtr, otherFormat ? cast(GADatasetFileFormat*)otherFormat._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrowdataset.file_write_options.FileWriteOptions getDefaultWriteOptions()
  {
    GADatasetFileWriteOptions* _cretval;
    _cretval = gadataset_file_format_get_default_write_options(cast(GADatasetFileFormat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.file_write_options.FileWriteOptions)(cast(GADatasetFileWriteOptions*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getTypeName()
  {
    char* _cretval;
    _cretval = gadataset_file_format_get_type_name(cast(GADatasetFileFormat*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  arrowdataset.file_writer.FileWriter openWriter(arrow.output_stream.OutputStream destination, arrow.file_system.FileSystem fileSystem, string path, arrow.schema.Schema schema, arrowdataset.file_write_options.FileWriteOptions options)
  {
    GADatasetFileWriter* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gadataset_file_format_open_writer(cast(GADatasetFileFormat*)this._cPtr, destination ? cast(GArrowOutputStream*)destination._cPtr(No.Dup) : null, fileSystem ? cast(GArrowFileSystem*)fileSystem._cPtr(No.Dup) : null, _path, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, options ? cast(GADatasetFileWriteOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowdataset.file_writer.FileWriter)(cast(GADatasetFileWriter*)_cretval, Yes.Take);
    return _retval;
  }
}
