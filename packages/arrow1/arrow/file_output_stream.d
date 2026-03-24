/// Module for [FileOutputStream] class
module arrow.file_output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class FileOutputStream : arrow.output_stream.OutputStream
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
    return cast(void function())garrow_file_output_stream_get_type != &gidSymbolNotFound ? garrow_file_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileOutputStream self()
  {
    return this;
  }

  /**
  Get builder for [arrow.file_output_stream.FileOutputStream]
  Returns: New builder object
  */
  static FileOutputStreamGidBuilder builder()
  {
    return new FileOutputStreamGidBuilder;
  }

  /** */
  this(string path, bool append)
  {
    GArrowFileOutputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_output_stream_new(_path, append, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class FileOutputStreamGidBuilderImpl(T) : arrow.output_stream.OutputStreamGidBuilderImpl!T
{

}

/// Fluent builder for [arrow.file_output_stream.FileOutputStream]
final class FileOutputStreamGidBuilder : FileOutputStreamGidBuilderImpl!FileOutputStreamGidBuilder
{
  FileOutputStream build()
  {
    return new FileOutputStream(cast(void*)createGObject(FileOutputStream._getGType), Yes.Take);
  }
}
