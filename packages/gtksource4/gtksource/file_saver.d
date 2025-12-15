/// Module for [FileSaver] class
module gtksource.file_saver;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.types;
import glib.error;
import gobject.object;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.encoding;
import gtksource.file;
import gtksource.types;

/** */
class FileSaver : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_file_saver_get_type != &gidSymbolNotFound ? gtk_source_file_saver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSaver self()
  {
    return this;
  }

  /**
      Get `compressionType` property.
      Returns: The compression type.
  */
  @property gtksource.types.CompressionType compressionType()
  {
    return getCompressionType();
  }

  /**
      Set `compressionType` property.
      Params:
        propval = The compression type.
  */
  @property void compressionType(gtksource.types.CompressionType propval)
  {
    return setCompressionType(propval);
  }

  /**
      Get `encoding` property.
      Returns: The file's encoding.
  */
  @property gtksource.encoding.Encoding encoding()
  {
    return getEncoding();
  }

  /**
      Set `encoding` property.
      Params:
        propval = The file's encoding.
  */
  @property void encoding(gtksource.encoding.Encoding propval)
  {
    return setEncoding(propval);
  }

  /**
      Get `flags` property.
      Returns: File saving flags.
  */
  @property gtksource.types.FileSaverFlags flags()
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = File saving flags.
  */
  @property void flags(gtksource.types.FileSaverFlags propval)
  {
    return setFlags(propval);
  }

  /**
      Get `newlineType` property.
      Returns: The newline type.
  */
  @property gtksource.types.NewlineType newlineType()
  {
    return getNewlineType();
  }

  /**
      Set `newlineType` property.
      Params:
        propval = The newline type.
  */
  @property void newlineType(gtksource.types.NewlineType propval)
  {
    return setNewlineType(propval);
  }

  /**
      Creates a new #GtkSourceFileSaver object. The buffer will be saved to the
      #GtkSourceFile's location.
      
      This constructor is suitable for a simple "save" operation, when the file
      already contains a non-null #GtkSourceFile:location.
  
      Params:
        buffer = the #GtkSourceBuffer to save.
        file = the #GtkSourceFile.
      Returns: a new #GtkSourceFileSaver object.
  */
  this(gtksource.buffer.Buffer buffer, gtksource.file.File file)
  {
    GtkSourceFileSaver* _cretval;
    _cretval = gtk_source_file_saver_new(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkSourceFileSaver object with a target location. When the
      file saving is finished successfully, target_location is set to the file's
      #GtkSourceFile:location property. If an error occurs, the previous valid
      location is still available in #GtkSourceFile.
      
      This constructor is suitable for a "save as" operation, or for saving a new
      buffer for the first time.
  
      Params:
        buffer = the #GtkSourceBuffer to save.
        file = the #GtkSourceFile.
        targetLocation = the #GFile where to save the buffer to.
      Returns: a new #GtkSourceFileSaver object.
  */
  static gtksource.file_saver.FileSaver newWithTarget(gtksource.buffer.Buffer buffer, gtksource.file.File file, gio.file.File targetLocation)
  {
    GtkSourceFileSaver* _cretval;
    _cretval = gtk_source_file_saver_new_with_target(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file._cPtr(No.Dup) : null, targetLocation ? cast(GFile*)(cast(gobject.object.ObjectWrap)targetLocation)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.file_saver.FileSaver)(cast(GtkSourceFileSaver*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_saver_get_buffer(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_saver_get_compression_type(cast(GtkSourceFileSaver*)this._cPtr);
    gtksource.types.CompressionType _retval = cast(gtksource.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  gtksource.encoding.Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_saver_get_encoding(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gtksource.file.File getFile()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_saver_get_file(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.file.File)(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.FileSaverFlags getFlags()
  {
    GtkSourceFileSaverFlags _cretval;
    _cretval = gtk_source_file_saver_get_flags(cast(GtkSourceFileSaver*)this._cPtr);
    gtksource.types.FileSaverFlags _retval = cast(gtksource.types.FileSaverFlags)_cretval;
    return _retval;
  }

  /** */
  gio.file.File getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_saver_get_location(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_saver_get_newline_type(cast(GtkSourceFileSaver*)this._cPtr);
    gtksource.types.NewlineType _retval = cast(gtksource.types.NewlineType)_cretval;
    return _retval;
  }

  /**
      Saves asynchronously the buffer into the file. See the #GAsyncResult
      documentation to know how to use this function.
  
      Params:
        ioPriority = the I/O priority of the request. E.g. `G_PRIORITY_LOW`,
            `G_PRIORITY_DEFAULT` or `G_PRIORITY_HIGH`.
        cancellable = optional #GCancellable object, null to ignore.
        progressCallback = function to call back with
            progress information, or null if progress information is not needed.
        callback = a #GAsyncReadyCallback to call when the request is
            satisfied.
  */
  void saveAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    GDestroyNotify _progressCallbackDestroyCB = progressCallback ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_file_saver_save_async(cast(GtkSourceFileSaver*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
      Finishes a file saving started with [gtksource.file_saver.FileSaver.saveAsync].
      
      If the file has been saved successfully, the following #GtkSourceFile
      properties will be updated: the location, the encoding, the newline type and
      the compression type.
      
      Since the 3.20 version, [gtk.text_buffer.TextBuffer.setModified] is called with false
      if the file has been saved successfully.
  
      Params:
        result = a #GAsyncResult.
      Returns: whether the file was saved successfully.
      Throws: [ErrorWrap]
  */
  bool saveFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_file_saver_save_finish(cast(GtkSourceFileSaver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the compression type. By default the compression type is taken from the
      #GtkSourceFile.
  
      Params:
        compressionType = the new compression type.
  */
  void setCompressionType(gtksource.types.CompressionType compressionType)
  {
    gtk_source_file_saver_set_compression_type(cast(GtkSourceFileSaver*)this._cPtr, compressionType);
  }

  /**
      Sets the encoding. If encoding is null, the UTF-8 encoding will be set.
      By default the encoding is taken from the #GtkSourceFile.
  
      Params:
        encoding = the new encoding, or null for UTF-8.
  */
  void setEncoding(gtksource.encoding.Encoding encoding = null)
  {
    gtk_source_file_saver_set_encoding(cast(GtkSourceFileSaver*)this._cPtr, encoding ? cast(const(GtkSourceEncoding)*)encoding._cPtr(No.Dup) : null);
  }

  /** */
  void setFlags(gtksource.types.FileSaverFlags flags)
  {
    gtk_source_file_saver_set_flags(cast(GtkSourceFileSaver*)this._cPtr, flags);
  }

  /**
      Sets the newline type. By default the newline type is taken from the
      #GtkSourceFile.
  
      Params:
        newlineType = the new newline type.
  */
  void setNewlineType(gtksource.types.NewlineType newlineType)
  {
    gtk_source_file_saver_set_newline_type(cast(GtkSourceFileSaver*)this._cPtr, newlineType);
  }
}
