/// Module for [FileLauncher] class
module gid.gtk4.file_launcher;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.file;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Asynchronous API to open a file with an application.
    
    [gid.gtk4.file_launcher.FileLauncher] collects the arguments that are needed to open the file.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gid.gtk4.file_launcher.FileLauncher.launch] function.
    
    To launch uris that don't represent files, use [gid.gtk4.uri_launcher.UriLauncher].
*/
class FileLauncher : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_file_launcher_get_type != &gidSymbolNotFound ? gtk_file_launcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFileLauncher";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileLauncher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.file_launcher.FileLauncher]
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
  @property gid.gio2.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file to launch.
  */
  @property void file(gid.gio2.file.File propval) nothrow
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
      Creates a new [gid.gtk4.file_launcher.FileLauncher] object.
  
      Params:
        file = the file to open
      Returns: the new [gid.gtk4.file_launcher.FileLauncher]
  */
  this(gid.gio2.file.File file = null) nothrow
  {
    GtkFileLauncher* _cretval;
    _cretval = gtk_file_launcher_new(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether to ask the user which app to use.
      Returns: true if always asking the user
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
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_file_launcher_get_file(cast(GtkFileLauncher*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether to make the file writable for the handler.
      Returns: true if the file will be made writable
  */
  bool getWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_file_launcher_get_writable(cast(GtkFileLauncher*)this._cPtr);
    return _retval;
  }

  /**
      Launches an application to open the file.
      
      This may present an app chooser dialog to the user.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void launch(gid.gtk4.window.Window parent = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_launch(cast(GtkFileLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.file_launcher.FileLauncher.launch] call and
      returns the result.
  
      Params:
        result = the result
      Returns: true if an application was launched
      Throws: [ErrorWrap]
  */
  bool launchFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_launcher_launch_finish(cast(GtkFileLauncher*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Launches a file manager to show the file in its parent directory.
      
      This is only supported for native files. It will fail if file
      is e.g. a http:// uri.
  
      Params:
        parent = the parent window
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void openContainingFolder(gid.gtk4.window.Window parent = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_open_containing_folder(cast(GtkFileLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.file_launcher.FileLauncher.openContainingFolder]
      call and returns the result.
  
      Params:
        result = the result
      Returns: true if an application was launched
      Throws: [ErrorWrap]
  */
  bool openContainingFolderFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_file_launcher_open_containing_folder_finish(cast(GtkFileLauncher*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets whether to always ask the user which app to use.
      
      If false, the file might be opened with a default app
      or the previous choice.
  
      Params:
        alwaysAsk = whether to always ask
  */
  void setAlwaysAsk(bool alwaysAsk) nothrow
  {
    gtk_file_launcher_set_always_ask(cast(GtkFileLauncher*)this._cPtr, alwaysAsk);
  }

  /**
      Sets the file that will be opened.
  
      Params:
        file = the file
  */
  void setFile(gid.gio2.file.File file = null) nothrow
  {
    gtk_file_launcher_set_file(cast(GtkFileLauncher*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to make the file writable for the handler.
  
      Params:
        writable = whether to make the file writable
  */
  void setWritable(bool writable) nothrow
  {
    gtk_file_launcher_set_writable(cast(GtkFileLauncher*)this._cPtr, writable);
  }
}

/// Fluent builder implementation template for [gid.gtk4.file_launcher.FileLauncher]
class FileLauncherGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
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
  T file(gid.gio2.file.File propval) nothrow
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

/// Fluent builder for [gid.gtk4.file_launcher.FileLauncher]
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
