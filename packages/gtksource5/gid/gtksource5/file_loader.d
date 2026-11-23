/// Module for [FileLoader] class
module gid.gtksource5.file_loader;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.encoding;
import gid.gtksource5.file;
import gid.gtksource5.types;

/**
    Load a file into a GtkSourceBuffer.
    
    A [gid.gtksource5.file_loader.FileLoader] object permits to load the contents of a [gid.gio2.file.File] or a
    [gid.gio2.input_stream.InputStream] into a [gid.gtksource5.buffer.Buffer].
    
    A file loader should be used only for one load operation, including errors
    handling. If an error occurs, you can reconfigure the loader and relaunch the
    operation with [gid.gtksource5.file_loader.FileLoader.loadAsync].
    
    Running a [gid.gtksource5.file_loader.FileLoader] is an undoable action for the
    [gid.gtksource5.buffer.Buffer].
    
    After a file loading, the buffer is reset to the contents provided by the
    [gid.gio2.file.File] or [gid.gio2.input_stream.InputStream], so the buffer is set as “unmodified”, that is,
    [gid.gtk4.text_buffer.TextBuffer.setModified] is called with false. If the contents isn't
    saved somewhere (for example if you load from stdin), then you should
    probably call [gid.gtk4.text_buffer.TextBuffer.setModified] with true after calling
    [gid.gtksource5.file_loader.FileLoader.loadFinish].
*/
class FileLoader : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_loader_get_type != &gidSymbolNotFound ? gtk_source_file_loader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceFileLoader";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileLoader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.file_loader.FileLoader]
      Returns: New builder object
  */
  static FileLoaderGidBuilder builder() nothrow
  {
    return new FileLoaderGidBuilder;
  }

  /**
      Get `buffer` property.
      Returns: The #GtkSourceBuffer to load the contents into. The
        #GtkSourceFileLoader object has a weak reference to the buffer.
  */
  @property gid.gtksource5.buffer.Buffer buffer() nothrow
  {
    return getBuffer();
  }

  /**
      Get `file` property.
      Returns: The #GtkSourceFile. The #GtkSourceFileLoader object has a weak
        reference to the file.
  */
  @property gid.gtksource5.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Get `inputStream` property.
      Returns: The #GInputStream to load. Useful for reading stdin. If this property
        is set, the #GtkSourceFileLoader:location property is ignored.
  */
  @property gid.gio2.input_stream.InputStream inputStream() nothrow
  {
    return getInputStream();
  }

  /**
      Get `location` property.
      Returns: The #GFile to load. If the #GtkSourceFileLoader:input-stream is
        null, by default the location is taken from the #GtkSourceFile at
        construction time.
  */
  @property gid.gio2.file.File location() nothrow
  {
    return getLocation();
  }

  /**
      Creates a new [gid.gtksource5.file_loader.FileLoader] object. The contents is read from the
      [gid.gtksource5.file.File]'s location.
      
      If not already done, call [gid.gtksource5.file.File.setLocation] before calling this constructor.
      The previous location is anyway not needed, because as soon as the file loading begins,
      the buffer is emptied.
  
      Params:
        buffer = the #GtkSourceBuffer to load the contents into.
        file = the #GtkSourceFile.
      Returns: a new #GtkSourceFileLoader object.
  */
  this(gid.gtksource5.buffer.Buffer buffer, gid.gtksource5.file.File file) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkSourceFileLoader* _cretval;
      _cretval = gtk_source_file_loader_new(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #GtkSourceFileLoader object. The contents is read from stream.
  
      Params:
        buffer = the #GtkSourceBuffer to load the contents into.
        file = the #GtkSourceFile.
        stream = the #GInputStream to load, e.g. stdin.
      Returns: a new #GtkSourceFileLoader object.
  */
  static gid.gtksource5.file_loader.FileLoader newFromStream(gid.gtksource5.buffer.Buffer buffer, gid.gtksource5.file.File file, gid.gio2.input_stream.InputStream stream) nothrow
  {
    GtkSourceFileLoader* _cretval;
    _cretval = gtk_source_file_loader_new_from_stream(buffer ? cast(GtkSourceBuffer*)buffer._cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file._cPtr(No.Dup) : null, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.file_loader.FileLoader)(cast(GtkSourceFileLoader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gid.gtksource5.buffer.Buffer getBuffer() nothrow
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_loader_get_buffer(cast(GtkSourceFileLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource5.types.CompressionType getCompressionType() nothrow
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_loader_get_compression_type(cast(GtkSourceFileLoader*)this._cPtr);
    gid.gtksource5.types.CompressionType _retval = cast(gid.gtksource5.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  gid.gtksource5.encoding.Encoding getEncoding() nothrow
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_loader_get_encoding(cast(GtkSourceFileLoader*)this._cPtr);
    auto _retval = _cretval ? new gid.gtksource5.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gtksource5.file.File getFile() nothrow
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_loader_get_file(cast(GtkSourceFileLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.file.File)(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gio2.input_stream.InputStream getInputStream() nothrow
  {
    GInputStream* _cretval;
    _cretval = gtk_source_file_loader_get_input_stream(cast(GtkSourceFileLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gio2.file.File getLocation() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_source_file_loader_get_location(cast(GtkSourceFileLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gtksource5.types.NewlineType getNewlineType() nothrow
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_loader_get_newline_type(cast(GtkSourceFileLoader*)this._cPtr);
    gid.gtksource5.types.NewlineType _retval = cast(gid.gtksource5.types.NewlineType)_cretval;
    return _retval;
  }

  /**
      Loads asynchronously the file or input stream contents into the [gid.gtksource5.buffer.Buffer].
      
      See the [gid.gio2.async_result.AsyncResult] documentation to know how to use this
      function.
  
      Params:
        ioPriority = the I/O priority of the request. E.g. [gid.glib2.types.PRIORITY_LOW],
            [gid.glib2.types.PRIORITY_DEFAULT] or [gid.glib2.types.PRIORITY_HIGH].
        cancellable = optional #GCancellable object, null to ignore.
        progressCallback = function to call back with progress information, or null if progress
            information is not needed.
        callback = a #GAsyncReadyCallback to call when the request is
            satisfied.
  */
  void loadAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.FileProgressCallback progressCallback = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data) nothrow
    {
      gidAttachThread();
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
      gidAttachThread();
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
    gtk_source_file_loader_load_async(cast(GtkSourceFileLoader*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
      Finishes a file loading started with [gid.gtksource5.file_loader.FileLoader.loadAsync].
      
      If the contents has been loaded, the following [gid.gtksource5.file.File] properties will
      be updated: the location, the encoding, the newline type and the compression
      type.
  
      Params:
        result = a #GAsyncResult.
      Returns: whether the contents has been loaded successfully.
      Throws: [ErrorWrap]
  */
  bool loadFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_file_loader_load_finish(cast(GtkSourceFileLoader*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the candidate encodings for the file loading.
      
      The encodings are tried in the same order as the list.
      
      For convenience, candidate_encodings can contain duplicates. Only the first
      occurrence of a duplicated encoding is kept in the list.
      
      By default the candidate encodings are (in that order in the list):
      
      1. If set, the [gid.gtksource5.file.File]'s encoding as returned by [gid.gtksource5.file.File.getEncoding].
      2. The default candidates as returned by [gid.gtksource5.encoding.Encoding.getDefaultCandidates].
  
      Params:
        candidateEncodings = a list of
            #GtkSourceEncoding<!-- -->s.
  */
  void setCandidateEncodings(gid.gtksource5.encoding.Encoding[] candidateEncodings) nothrow
  {
    auto _candidateEncodings = gSListFromD!(gid.gtksource5.encoding.Encoding)(candidateEncodings);
    scope(exit) containerFree!(GSList*, gid.gtksource5.encoding.Encoding, GidOwnership.None)(_candidateEncodings);
    gtk_source_file_loader_set_candidate_encodings(cast(GtkSourceFileLoader*)this._cPtr, _candidateEncodings);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.file_loader.FileLoader]
class FileLoaderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `buffer` property.
      Params:
        propval = The #GtkSourceBuffer to load the contents into. The
          #GtkSourceFileLoader object has a weak reference to the buffer.
      Returns: Builder instance for fluent chaining
  */
  T buffer(gid.gtksource5.buffer.Buffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /**
      Set `file` property.
      Params:
        propval = The #GtkSourceFile. The #GtkSourceFileLoader object has a weak
          reference to the file.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gtksource5.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `inputStream` property.
      Params:
        propval = The #GInputStream to load. Useful for reading stdin. If this property
          is set, the #GtkSourceFileLoader:location property is ignored.
      Returns: Builder instance for fluent chaining
  */
  T inputStream(gid.gio2.input_stream.InputStream propval) nothrow
  {
    return setProperty("input-stream", propval);
  }

  /**
      Set `location` property.
      Params:
        propval = The #GFile to load. If the #GtkSourceFileLoader:input-stream is
          null, by default the location is taken from the #GtkSourceFile at
          construction time.
      Returns: Builder instance for fluent chaining
  */
  T location(gid.gio2.file.File propval) nothrow
  {
    return setProperty("location", propval);
  }
}

/// Fluent builder for [gid.gtksource5.file_loader.FileLoader]
final class FileLoaderGidBuilder : FileLoaderGidBuilderImpl!FileLoaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileLoader build() nothrow
  {
    return new FileLoader(cast(void*)createGObject(FileLoader._getGType), Yes.Take);
  }
}
