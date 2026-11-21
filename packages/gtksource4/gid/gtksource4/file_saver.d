/// Module for [FileSaver] class
module gid.gtksource4.file_saver;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource4.buffer;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.encoding;
import gid.gtksource4.file;
import gid.gtksource4.types;

/** */
class FileSaver : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_saver_get_type != &gidSymbolNotFound ? gtk_source_file_saver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceFileSaver";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSaver self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.file_saver.FileSaver]
      Returns: New builder object
  */
  static FileSaverGidBuilder builder() nothrow
  {
    return new FileSaverGidBuilder;
  }

  /**
      Get `buffer` property.
      Returns: The #GtkSourceBuffer to save. The #GtkSourceFileSaver object has a
        weak reference to the buffer.
  */
  @property gid.gtksource4.buffer.Buffer buffer() nothrow
  {
    return getBuffer();
  }

  /**
      Get `compressionType` property.
      Returns: The compression type.
  */
  @property gid.gtksource4.types.CompressionType compressionType() nothrow
  {
    return getCompressionType();
  }

  /**
      Set `compressionType` property.
      Params:
        propval = The compression type.
  */
  @property void compressionType(gid.gtksource4.types.CompressionType propval) nothrow
  {
    setCompressionType(propval);
  }

  /**
      Get `encoding` property.
      Returns: The file's encoding.
  */
  @property gid.gtksource4.encoding.Encoding encoding() nothrow
  {
    return getEncoding();
  }

  /**
      Set `encoding` property.
      Params:
        propval = The file's encoding.
  */
  @property void encoding(gid.gtksource4.encoding.Encoding propval) nothrow
  {
    setEncoding(propval);
  }

  /**
      Get `file` property.
      Returns: The #GtkSourceFile. The #GtkSourceFileSaver object has a weak
        reference to the file.
  */
  @property gid.gtksource4.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Get `flags` property.
      Returns: File saving flags.
  */
  @property gid.gtksource4.types.FileSaverFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = File saving flags.
  */
  @property void flags(gid.gtksource4.types.FileSaverFlags propval) nothrow
  {
    setFlags(propval);
  }

  /**
      Get `location` property.
      Returns: The #GFile where to save the buffer. By default the location is taken
        from the #GtkSourceFile at construction time.
  */
  @property gid.gio2.file.File location() nothrow
  {
    return getLocation();
  }

  /**
      Get `newlineType` property.
      Returns: The newline type.
  */
  @property gid.gtksource4.types.NewlineType newlineType() nothrow
  {
    return getNewlineType();
  }

  /**
      Set `newlineType` property.
      Params:
        propval = The newline type.
  */
  @property void newlineType(gid.gtksource4.types.NewlineType propval) nothrow
  {
    setNewlineType(propval);
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
  this(gid.gtksource4.buffer.Buffer buffer, gid.gtksource4.file.File file) nothrow
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
  static gid.gtksource4.file_saver.FileSaver newWithTarget(gid.gtksource4.buffer.Buffer buffer, gid.gtksource4.file.File file, gid.gio2.file.File targetLocation) nothrow
  {
    GtkSourceFileSaver* _cretval;
    _cretval = gtk_source_file_saver_new_with_target(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file._cPtr(No.Dup) : null, targetLocation ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)targetLocation)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.file_saver.FileSaver)(cast(GtkSourceFileSaver*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gid.gtksource4.buffer.Buffer getBuffer() nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_saver_get_buffer(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource4.types.CompressionType getCompressionType() nothrow
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_saver_get_compression_type(cast(GtkSourceFileSaver*)this._cPtr);
    gid.gtksource4.types.CompressionType _retval = cast(gid.gtksource4.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  gid.gtksource4.encoding.Encoding getEncoding() nothrow
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_saver_get_encoding(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = _cretval ? new gid.gtksource4.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gtksource4.file.File getFile() nothrow
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_saver_get_file(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.file.File)(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource4.types.FileSaverFlags getFlags() nothrow
  {
    GtkSourceFileSaverFlags _cretval;
    _cretval = gtk_source_file_saver_get_flags(cast(GtkSourceFileSaver*)this._cPtr);
    gid.gtksource4.types.FileSaverFlags _retval = cast(gid.gtksource4.types.FileSaverFlags)_cretval;
    return _retval;
  }

  /** */
  gid.gio2.file.File getLocation() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_source_file_saver_get_location(cast(GtkSourceFileSaver*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource4.types.NewlineType getNewlineType() nothrow
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_saver_get_newline_type(cast(GtkSourceFileSaver*)this._cPtr);
    gid.gtksource4.types.NewlineType _retval = cast(gid.gtksource4.types.NewlineType)_cretval;
    return _retval;
  }

  /**
      Saves asynchronously the buffer into the file. See the #GAsyncResult
      documentation to know how to use this function.
  
      Params:
        ioPriority = the I/O priority of the request. E.g. [gid.glib2.types.PRIORITY_LOW],
            [gid.glib2.types.PRIORITY_DEFAULT] or [gid.glib2.types.PRIORITY_HIGH].
        cancellable = optional #GCancellable object, null to ignore.
        progressCallback = function to call back with
            progress information, or null if progress information is not needed.
        callback = a #GAsyncReadyCallback to call when the request is
            satisfied.
  */
  void saveAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      auto _dlg = cast(gid.gio2.types.FileProgressCallback*)data;

      try
      {
        (*_dlg)(currentNumBytes, totalNumBytes);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.FileProgressCallback");
      }
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    GDestroyNotify _progressCallbackDestroyCB = progressCallback ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_file_saver_save_async(cast(GtkSourceFileSaver*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
      Finishes a file saving started with [gid.gtksource5.file_saver.FileSaver.saveAsync].
      
      If the file has been saved successfully, the following #GtkSourceFile
      properties will be updated: the location, the encoding, the newline type and
      the compression type.
      
      Since the 3.20 version, [gid.gtk4.text_buffer.TextBuffer.setModified] is called with false
      if the file has been saved successfully.
  
      Params:
        result = a #GAsyncResult.
      Returns: whether the file was saved successfully.
      Throws: [ErrorWrap]
  */
  bool saveFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_file_saver_save_finish(cast(GtkSourceFileSaver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the compression type. By default the compression type is taken from the
      #GtkSourceFile.
  
      Params:
        compressionType = the new compression type.
  */
  void setCompressionType(gid.gtksource4.types.CompressionType compressionType) nothrow
  {
    gtk_source_file_saver_set_compression_type(cast(GtkSourceFileSaver*)this._cPtr, compressionType);
  }

  /**
      Sets the encoding. If encoding is null, the UTF-8 encoding will be set.
      By default the encoding is taken from the #GtkSourceFile.
  
      Params:
        encoding = the new encoding, or null for UTF-8.
  */
  void setEncoding(gid.gtksource4.encoding.Encoding encoding = null) nothrow
  {
    gtk_source_file_saver_set_encoding(cast(GtkSourceFileSaver*)this._cPtr, encoding ? cast(const(GtkSourceEncoding)*)encoding._cPtr(No.Dup) : null);
  }

  /** */
  void setFlags(gid.gtksource4.types.FileSaverFlags flags) nothrow
  {
    gtk_source_file_saver_set_flags(cast(GtkSourceFileSaver*)this._cPtr, flags);
  }

  /**
      Sets the newline type. By default the newline type is taken from the
      #GtkSourceFile.
  
      Params:
        newlineType = the new newline type.
  */
  void setNewlineType(gid.gtksource4.types.NewlineType newlineType) nothrow
  {
    gtk_source_file_saver_set_newline_type(cast(GtkSourceFileSaver*)this._cPtr, newlineType);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.file_saver.FileSaver]
class FileSaverGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `buffer` property.
      Params:
        propval = The #GtkSourceBuffer to save. The #GtkSourceFileSaver object has a
          weak reference to the buffer.
      Returns: Builder instance for fluent chaining
  */
  T buffer(gid.gtksource4.buffer.Buffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /**
      Set `compressionType` property.
      Params:
        propval = The compression type.
      Returns: Builder instance for fluent chaining
  */
  T compressionType(gid.gtksource4.types.CompressionType propval) nothrow
  {
    return setProperty("compression-type", propval);
  }

  /**
      Set `encoding` property.
      Params:
        propval = The file's encoding.
      Returns: Builder instance for fluent chaining
  */
  T encoding(gid.gtksource4.encoding.Encoding propval) nothrow
  {
    return setProperty("encoding", propval);
  }

  /**
      Set `file` property.
      Params:
        propval = The #GtkSourceFile. The #GtkSourceFileSaver object has a weak
          reference to the file.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gtksource4.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = File saving flags.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gtksource4.types.FileSaverFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `location` property.
      Params:
        propval = The #GFile where to save the buffer. By default the location is taken
          from the #GtkSourceFile at construction time.
      Returns: Builder instance for fluent chaining
  */
  T location(gid.gio2.file.File propval) nothrow
  {
    return setProperty("location", propval);
  }

  /**
      Set `newlineType` property.
      Params:
        propval = The newline type.
      Returns: Builder instance for fluent chaining
  */
  T newlineType(gid.gtksource4.types.NewlineType propval) nothrow
  {
    return setProperty("newline-type", propval);
  }
}

/// Fluent builder for [gid.gtksource4.file_saver.FileSaver]
final class FileSaverGidBuilder : FileSaverGidBuilderImpl!FileSaverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileSaver build() nothrow
  {
    return new FileSaver(cast(void*)createGObject(FileSaver._getGType), Yes.Take);
  }
}
