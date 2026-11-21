/// Module for [UriLauncher] class
module gid.gtk4.uri_launcher;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Asynchronous API to open a uri with an application.
    
    [gid.gtk4.uri_launcher.UriLauncher] collects the arguments that are needed to open the uri.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gid.gtk4.uri_launcher.UriLauncher.launch] function.
    
    To launch a file, use [gid.gtk4.file_launcher.FileLauncher].
*/
class UriLauncher : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_uri_launcher_get_type != &gidSymbolNotFound ? gtk_uri_launcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkUriLauncher";
  }

  /** Returns `this`, for use in `with` statements. */
  override UriLauncher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.uri_launcher.UriLauncher]
      Returns: New builder object
  */
  static UriLauncherGidBuilder builder() nothrow
  {
    return new UriLauncherGidBuilder;
  }

  /**
      Get `uri` property.
      Returns: The uri to launch.
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The uri to launch.
  */
  @property void uri(string propval) nothrow
  {
    setUri(propval);
  }

  /**
      Creates a new [gid.gtk4.uri_launcher.UriLauncher] object.
  
      Params:
        uri = the uri to open
      Returns: the new [gid.gtk4.uri_launcher.UriLauncher]
  */
  this(string uri = null) nothrow
  {
    GtkUriLauncher* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_uri_launcher_new(_uri);
    this(_cretval, Yes.Take);
  }

  /**
      Returns whether the launcher is likely to succeed
      in launching an application for its uri.
      
      This can be used to disable controls that trigger
      the launcher when they are known not to work.
  
      Params:
        parent = the parent window
      Returns: false if the launcher is known not to support
          the uri, true otherwise
  */
  bool canLaunch(gid.gtk4.window.Window parent = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_uri_launcher_can_launch(cast(GtkUriLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the uri that will be opened.
      Returns: the uri
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_uri_launcher_get_uri(cast(GtkUriLauncher*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Launches an application to open the uri.
      
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
    gtk_uri_launcher_launch(cast(GtkUriLauncher*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.uri_launcher.UriLauncher.launch] call and
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
    _retval = cast(bool)gtk_uri_launcher_launch_finish(cast(GtkUriLauncher*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the uri that will be opened.
  
      Params:
        uri = the uri
  */
  void setUri(string uri = null) nothrow
  {
    const(char)* _uri = uri.toCString!(No.Malloc, Yes.Nullable);
    gtk_uri_launcher_set_uri(cast(GtkUriLauncher*)this._cPtr, _uri);
  }
}

/// Fluent builder implementation template for [gid.gtk4.uri_launcher.UriLauncher]
class UriLauncherGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `uri` property.
      Params:
        propval = The uri to launch.
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval) nothrow
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [gid.gtk4.uri_launcher.UriLauncher]
final class UriLauncherGidBuilder : UriLauncherGidBuilderImpl!UriLauncherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UriLauncher build() nothrow
  {
    return new UriLauncher(cast(void*)createGObject(UriLauncher._getGType), Yes.Take);
  }
}
