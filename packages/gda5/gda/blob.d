/// Module for [Blob] class
module gda.blob;

import gda.binary;
import gda.blob_op;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    Represents some binary data, accessed through a #GdaBlobOp object.
    @op is generally set up by database providers when giving access to an existing BLOB in
    a database, but can be modified if needed using [gda.blob.Blob.setOp].
*/
class Blob : gobject.boxed.Boxed
{

  /**
      Create a `blob.Blob` boxed type.
      Params:
        op = a pointer to a #GdaBlopOp, or null
  */
  this(gda.blob_op.BlobOp op = gda.blob_op.BlobOp.init)
  {
    super(gMalloc(GdaBlob.sizeof), Yes.Take);
    this.op = op;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_blob_get_type != &gidSymbolNotFound ? gda_blob_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Blob self()
  {
    return this;
  }

  /**
      Get `data` field.
      Returns: data buffer, as a #GdaBinary
  */
  @property gda.binary.Binary data()
  {
    return cToD!(gda.binary.Binary)(cast(void*)&(cast(GdaBlob*)this._cPtr).data);
  }

  /**
      Get `op` field.
      Returns: a pointer to a #GdaBlopOp, or null
  */
  @property gda.blob_op.BlobOp op()
  {
    return cToD!(gda.blob_op.BlobOp)(cast(void*)(cast(GdaBlob*)this._cPtr).op);
  }

  /**
      Set `op` field.
      Params:
        propval = a pointer to a #GdaBlopOp, or null
  */
  @property void op(gda.blob_op.BlobOp propval)
  {
    cValueFree!(gda.blob_op.BlobOp)(cast(void*)(cast(GdaBlob*)this._cPtr).op);
    dToC(propval, cast(void*)&(cast(GdaBlob*)this._cPtr).op);
  }

  /**
      correctly assigns op to blob
  
      Params:
        op = a #GdaBlobOp object, or null
  */
  void setOp(gda.blob_op.BlobOp op = null)
  {
    gda_blob_set_op(cast(GdaBlob*)this._cPtr, op ? cast(GdaBlobOp*)op._cPtr(No.Dup) : null);
  }

  /**
      Converts all the non printable characters of blob->data into the \xxx representation
      where xxx is the octal representation of the byte, and the '\' (backslash) character
      is converted to "\\".
  
      Params:
        maxlen = a maximum len used to truncate, or 0 for no maximum length
      Returns: a new string from blob
  */
  string toString_(uint maxlen)
  {
    char* _cretval;
    _cretval = gda_blob_to_string(cast(GdaBlob*)this._cPtr, maxlen);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new #GdaBlob structure from an existing one.
  
      Params:
        boxed = source to get a copy from.
      Returns: a newly allocated #GdaBlob which contains a copy of information in boxed.
        
        Free-function: gda_blob_free
  */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_blob_copy(boxed);
    return _retval;
  }

  /**
      Deallocates all memory associated to the given #GdaBlob.
  
      Params:
        boxed = #GdaBlob to free.
  */
  static void free(void* boxed = null)
  {
    gda_blob_free(boxed);
  }
}
