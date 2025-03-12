module gtksource.file_loader;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.object;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.encoding;
import gtksource.file;
import gtksource.types;

/**
    Load a file into a GtkSourceBuffer.
  
  A [gtksource.file_loader.FileLoader] object permits to load the contents of a [gio.file.File] or a
  [gio.input_stream.InputStream] into a `class@Buffer`.
  
  A file loader should be used only for one load operation, including errors
  handling. If an error occurs, you can reconfigure the loader and relaunch the
  operation with [gtksource.file_loader.FileLoader.loadAsync].
  
  Running a [gtksource.file_loader.FileLoader] is an undoable action for the
  `class@Buffer`.
  
  After a file loading, the buffer is reset to the contents provided by the
  [gio.file.File] or [gio.input_stream.InputStream], so the buffer is set as “unmodified”, that is,
  [gtk.text_buffer.TextBuffer.setModified] is called with false. If the contents isn't
  saved somewhere (for example if you load from stdin), then you should
  probably call [gtk.text_buffer.TextBuffer.setModified] with true after calling
  [gtksource.file_loader.FileLoader.loadFinish].
*/
class FileLoader : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_loader_get_type != &gidSymbolNotFound ? gtk_source_file_loader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override FileLoader self()
  {
    return this;
  }

  /**
      Creates a new [gtksource.file_loader.FileLoader] object. The contents is read from the
    `classFile`'s location.
    
    If not already done, call [gtksource.file.File.setLocation] before calling this constructor.
    The previous location is anyway not needed, because as soon as the file loading begins,
    the buffer is emptied.
    Params:
      buffer =       the #GtkSourceBuffer to load the contents into.
      file =       the #GtkSourceFile.
    Returns:     a new #GtkSourceFileLoader object.
  */
  this(gtksource.buffer.Buffer buffer, gtksource.file.File file)
  {
    GtkSourceFileLoader* _cretval;
    _cretval = gtk_source_file_loader_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkSourceFileLoader object. The contents is read from stream.
    Params:
      buffer =       the #GtkSourceBuffer to load the contents into.
      file =       the #GtkSourceFile.
      stream =       the #GInputStream to load, e.g. stdin.
    Returns:     a new #GtkSourceFileLoader object.
  */
  static gtksource.file_loader.FileLoader newFromStream(gtksource.buffer.Buffer buffer, gtksource.file.File file, gio.input_stream.InputStream stream)
  {
    GtkSourceFileLoader* _cretval;
    _cretval = gtk_source_file_loader_new_from_stream(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null, stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.file_loader.FileLoader)(cast(GtkSourceFileLoader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_loader_get_buffer(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_loader_get_compression_type(cast(GtkSourceFileLoader*)cPtr);
    gtksource.types.CompressionType _retval = cast(gtksource.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  gtksource.encoding.Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_loader_get_encoding(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gtksource.file.File getFile()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_loader_get_file(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.file.File)(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gio.input_stream.InputStream getInputStream()
  {
    GInputStream* _cretval;
    _cretval = gtk_source_file_loader_get_input_stream(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gio.file.File getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_loader_get_location(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_loader_get_newline_type(cast(GtkSourceFileLoader*)cPtr);
    gtksource.types.NewlineType _retval = cast(gtksource.types.NewlineType)_cretval;
    return _retval;
  }

  /**
      Loads asynchronously the file or input stream contents into the `classBuffer`.
    
    See the [gio.async_result.AsyncResult] documentation to know how to use this
    function.
    Params:
      ioPriority =       the I/O priority of the request. E.g. `G_PRIORITY_LOW`,
          `G_PRIORITY_DEFAULT` or `G_PRIORITY_HIGH`.
      cancellable =       optional #GCancellable object, null to ignore.
      progressCallback =       function to call back with
          progress information, or null if progress information is not needed.
      callback =       a #GAsyncReadyCallback to call when the request is
          satisfied.
  */
  void loadAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.FileProgressCallback progressCallback = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(gio.types.FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    GDestroyNotify _progressCallbackDestroyCB = progressCallback ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_file_loader_load_async(cast(GtkSourceFileLoader*)cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
      Finishes a file loading started with [gtksource.file_loader.FileLoader.loadAsync].
    
    If the contents has been loaded, the following `classFile` properties will
    be updated: the location, the encoding, the newline type and the compression
    type.
    Params:
      result =       a #GAsyncResult.
    Returns:     whether the contents has been loaded successfully.
  */
  bool loadFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_file_loader_load_finish(cast(GtkSourceFileLoader*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets the candidate encodings for the file loading.
    
    The encodings are tried in the same order as the list.
    
    For convenience, candidate_encodings can contain duplicates. Only the first
    occurrence of a duplicated encoding is kept in the list.
    
    By default the candidate encodings are (in that order in the list):
    
    1. If set, the `classFile`'s encoding as returned by [gtksource.file.File.getEncoding].
    2. The default candidates as returned by [gtksource.encoding.Encoding.getDefaultCandidates].
    Params:
      candidateEncodings =       a list of
          #GtkSourceEncoding<!-- -->s.
  */
  void setCandidateEncodings(gtksource.encoding.Encoding[] candidateEncodings)
  {
    auto _candidateEncodings = gSListFromD!(gtksource.encoding.Encoding)(candidateEncodings);
    scope(exit) containerFree!(GSList*, gtksource.encoding.Encoding, GidOwnership.None)(_candidateEncodings);
    gtk_source_file_loader_set_candidate_encodings(cast(GtkSourceFileLoader*)cPtr, _candidateEncodings);
  }
}
