/// Module for [FileLauncher] class
module gtk.file_launcher;

public import gid.basictypes;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    A [gtk.file_launcher.FileLauncher] object collects the arguments that are needed to open a
    file with an application.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gtk.file_launcher.FileLauncher.launch] function.
    This API follows the GIO async pattern, and the result can be obtained by
    calling [gtk.file_launcher.FileLauncher.launchFinish].
    
    To launch uris that don't represent files, use [gtk.uri_launcher.UriLauncher].
*/
class FileLauncher : gobject.object.ObjectWrap
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
    return cast(void function())gtk_file_launcher_get_type != &gidSymbolNotFound ? gtk_file_launcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileLauncher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.file_launcher.FileLauncher]
      Returns: New builder object
  */
  static FileLauncherGidBuilder builder() nothrow
  {
    return new FileLauncherGidBuilder;
  }

  /**
      Get `alwaysAsk` property.
      Returns: Whether to ask the user to choose an app for opening the file. If `FALSE`,
        the file might be opened with a default app or the previous choice.
  */
  @property bool alwaysAsk() nothrow
  {
    return getAlwaysAsk();
  }

  /**
      Set `alwaysAsk` property.
      Params:
        propval = Whether to ask the user to choose an app for opening the file. If `FALSE`,
          the file might be opened with a default app or the previous choice.
  */
  @property void alwaysAsk(bool propval) nothrow
  {
    setAlwaysAsk(propval);
  }

  /**
      Get `file` property.
      Returns: The file to launch.
  */
  @property gio.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file to launch.
  */
  @property void file(gio.file.File propval) nothrow
  {
    setFile(propval);
  }

  /**
      Get `writable` property.
      Returns: Whether to make the file writable for the handler.
  */
  @property bool writable() nothrow
  {
    return getWritable();
  }

  /**
      Set `writable` property.
      Params:
        propval = Whether to make the file writable for the handler.
  */
  @property void writable(bool propval) nothrow
  {
    setWritable(propval);
  }

  /**
      Creates a new [gtk.file_launcher.FileLauncher] object.
  
      Params:
        file = the file to open
      Returns: the new [gtk.file_launcher.FileLauncher]
  */
  this(gio.file.File file = null) nothrow
  {
    GtkFileLauncher* _cretval;
    _cretval = gtk_file_launcher_new(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether to ask the user to choose an app for opening the file.
      Returns: `TRUE` if always asking for app
  */
  bool getAlwaysAsk() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_launcher_get_always_ask(cast(GtkFileLauncher*)this._cPtr);
    return _retval;
  }

  /**
      Gets the file that will be opened.
      Returns: the file
  */
  gio.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_file_launcher_get_file(cast(GtkFileLauncher*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether to make the file writable for the handler.
      Returns: `TRUE` if the file will be made writable
  */
  bool getWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_launcher_get_writable(cast(GtkFileLauncher*)this._cPtr);
    return _retval;
  }

  /**
      Launch an application to open the file.
      
      This may present an app chooser dialog to the user.
      
      The callback will be called when the operation is completed.
      It should call [gtk.file_launcher.FileLauncher.launchFinish] to obtain
      the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void launch(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_launch(cast(GtkFileLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_launcher.FileLauncher.launch] call and
      returns the result.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: `TRUE` if an application was launched,
            or `FALSE` and error is set
      Throws: [ErrorWrap]
  */
  bool launchFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_launcher_launch_finish(cast(GtkFileLauncher*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Launch a file manager to show the file in its parent directory.
      
      This is only supported native files. It will fail if file
      is e.g. a http:// uri.
      
      The callback will be called when the operation is completed.
      It should call [gtk.file_launcher.FileLauncher.openContainingFolderFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void openContainingFolder(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_open_containing_folder(cast(GtkFileLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.file_launcher.FileLauncher.openContainingFolder]
      call and returns the result.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: `TRUE` if an application was launched,
            or `FALSE` and error is set
      Throws: [ErrorWrap]
  */
  bool openContainingFolderFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_launcher_open_containing_folder_finish(cast(GtkFileLauncher*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets whether to awlays ask the user to choose an app for opening the file.
      If `FALSE`, the file might be opened with a default app or the previous choice.
  
      Params:
        alwaysAsk = a `gboolean`
  */
  void setAlwaysAsk(bool alwaysAsk) nothrow
  {
    gtk_file_launcher_set_always_ask(cast(GtkFileLauncher*)this._cPtr, alwaysAsk);
  }

  /**
      Sets the file that will be opened.
  
      Params:
        file = a [gio.file.File]
  */
  void setFile(gio.file.File file = null) nothrow
  {
    gtk_file_launcher_set_file(cast(GtkFileLauncher*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to make the file writable for the handler.
  
      Params:
        writable = a `gboolean`
  */
  void setWritable(bool writable) nothrow
  {
    gtk_file_launcher_set_writable(cast(GtkFileLauncher*)this._cPtr, writable);
  }
}

/// Fluent builder implementation template for [gtk.file_launcher.FileLauncher]
class FileLauncherGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `alwaysAsk` property.
      Params:
        propval = Whether to ask the user to choose an app for opening the file. If `FALSE`,
          the file might be opened with a default app or the previous choice.
      Returns: Builder instance for fluent chaining
  */
  T alwaysAsk(bool propval) nothrow
  {
    return setProperty("always-ask", propval);
  }

  /**
      Set `file` property.
      Params:
        propval = The file to launch.
      Returns: Builder instance for fluent chaining
  */
  T file(gio.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `writable` property.
      Params:
        propval = Whether to make the file writable for the handler.
      Returns: Builder instance for fluent chaining
  */
  T writable(bool propval) nothrow
  {
    return setProperty("writable", propval);
  }
}

/// Fluent builder for [gtk.file_launcher.FileLauncher]
final class FileLauncherGidBuilder : FileLauncherGidBuilderImpl!FileLauncherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileLauncher build() nothrow
  {
    return new FileLauncher(cast(void*)createGObject(FileLauncher._getGType), Yes.Take);
  }
}
