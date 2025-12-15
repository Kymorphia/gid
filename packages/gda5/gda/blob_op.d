/// Module for [BlobOp] class
module gda.blob_op;

import gda.blob;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.object;

/** */
class BlobOp : gobject.object.ObjectWrap
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
    return cast(void function())gda_blob_op_get_type != &gidSymbolNotFound ? gda_blob_op_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BlobOp self()
  {
    return this;
  }

  /** */
  glong getLength()
  {
    glong _retval;
    _retval = gda_blob_op_get_length(cast(GdaBlobOp*)this._cPtr);
    return _retval;
  }

  /**
      Reads a chunk of bytes from the BLOB accessible through op into blob.
  
      Params:
        blob = a #GdaBlob to read data to
        offset = offset to read from the start of the blob (starts at 0)
        size = maximum number of bytes to read.
      Returns: the number of bytes actually read. In case of error, -1 is returned and the
        provider should have added an error to the connection.
  */
  glong read(gda.blob.Blob blob, glong offset, glong size)
  {
    glong _retval;
    _retval = gda_blob_op_read(cast(GdaBlobOp*)this._cPtr, blob ? cast(GdaBlob*)blob._cPtr(No.Dup) : null, offset, size);
    return _retval;
  }

  /**
      Reads the whole contents of the blob manipulated by op into blob
  
      Params:
        blob = a #GdaBlob to read data to
      Returns: TRUE if blob->data contains the whole BLOB manipulated by op
  */
  bool readAll(gda.blob.Blob blob)
  {
    bool _retval;
    _retval = cast(bool)gda_blob_op_read_all(cast(GdaBlobOp*)this._cPtr, blob ? cast(GdaBlob*)blob._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Writes a chunk of bytes from a blob to the BLOB accessible through op, blob is unchanged after
      this call.
      
      If blob has an associated #GdaBlobOp (ie. if blob->op is not null) then the data to be written
      using op is the data fetched using blob->op.
  
      Params:
        blob = a #GdaBlob which contains the data to write
        offset = offset to write from the start of the blob (starts at 0)
      Returns: the number of bytes written. In case of error, -1 is returned and the
        provider should have added an error to the connection.
  */
  glong write(gda.blob.Blob blob, glong offset)
  {
    glong _retval;
    _retval = gda_blob_op_write(cast(GdaBlobOp*)this._cPtr, blob ? cast(GdaBlob*)blob._cPtr(No.Dup) : null, offset);
    return _retval;
  }

  /**
      Writes the whole contents of blob into the blob manipulated by op. If necessary the resulting
      blob is truncated from its previous length.
  
      Params:
        blob = a #GdaBlob which contains the data to write
      Returns: TRUE on success
  */
  bool writeAll(gda.blob.Blob blob)
  {
    bool _retval;
    _retval = cast(bool)gda_blob_op_write_all(cast(GdaBlobOp*)this._cPtr, blob ? cast(GdaBlob*)blob._cPtr(No.Dup) : null);
    return _retval;
  }
}
