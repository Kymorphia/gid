/// Module for [FaviconDatabase] class
module gid.webkit6.favicon_database;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.texture;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Provides access to the icons associated with web sites.
    
    WebKit will automatically look for available icons in <link>
    elements on opened pages as well as an existing favicon.ico and
    load the images found into a memory cache if possible. That cache
    is frozen to an on-disk database for persistence.
    
    If #WebKitSettings:enable-private-browsing is true, new icons
    won't be added to the on-disk database and no existing icons will
    be deleted from it. Nevertheless, WebKit will still store them in
    the in-memory cache during the current execution.
*/
class FaviconDatabase : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_favicon_database_get_type != &gidSymbolNotFound ? webkit_favicon_database_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitFaviconDatabase";
  }

  /** Returns `this`, for use in `with` statements. */
  override FaviconDatabase self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.favicon_database.FaviconDatabase]
      Returns: New builder object
  */
  static FaviconDatabaseGidBuilder builder() nothrow
  {
    return new FaviconDatabaseGidBuilder;
  }

  /**
      Clears all icons from the database.
  */
  void clear() nothrow
  {
    webkit_favicon_database_clear(cast(WebKitFaviconDatabase*)this._cPtr);
  }

  /**
      Asynchronously obtains a favicon image.
      
      Asynchronously obtains an image of the favicon for the
      given page URI. It returns the cached icon if it's in the database
      asynchronously waiting for the icon to be read from the database.
      
      This is an asynchronous method. When the operation is finished, callback will
      be invoked. You can then call [gid.webkit6.favicon_database.FaviconDatabase.getFaviconFinish]
      to get the result of the operation.
  
      Params:
        pageUri = URI of the page for which we want to retrieve the favicon
        cancellable = A #GCancellable or null.
        callback = A #GAsyncReadyCallback to call when the request is
                     satisfied or null if you don't care about the result.
  */
  void getFavicon(string pageUri, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _pageUri = pageUri.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_favicon_database_get_favicon(cast(WebKitFaviconDatabase*)this._cPtr, _pageUri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an operation started with [gid.webkit6.favicon_database.FaviconDatabase.getFavicon].
  
      Params:
        result = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gid.webkit6.favicon_database.FaviconDatabase.getFavicon]
      Returns: a new favicon image, or null in case of error.
      Throws: [ErrorWrap]
  */
  gid.gdk4.texture.Texture getFaviconFinish(gid.gio2.async_result.AsyncResult result)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = webkit_favicon_database_get_favicon_finish(cast(WebKitFaviconDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains the URI of the favicon for the given page_uri.
  
      Params:
        pageUri = URI of the page containing the icon
      Returns: a newly allocated URI for the favicon, or null if the
        database doesn't have a favicon for page_uri.
  */
  string getFaviconUri(string pageUri) nothrow
  {
    char* _cretval;
    const(char)* _pageUri = pageUri.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_favicon_database_get_favicon_uri(cast(WebKitFaviconDatabase*)this._cPtr, _pageUri);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Connect to `FaviconChanged` signal.
  
      This signal is emitted when the favicon URI of page_uri has
        been changed to favicon_uri in the database. You can connect
        to this signal and call [gid.webkit6.favicon_database.FaviconDatabase.getFavicon]
        to get the favicon. If you are interested in the favicon of a
        #WebKitWebView it's easier to use the #WebKitWebView:favicon
        property. See [gid.webkit6.web_view.WebView.getFavicon] for more details.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string pageUri, string faviconUri, gid.webkit6.favicon_database.FaviconDatabase faviconDatabase)`
  
          `pageUri` the URI of the Web page containing the icon (optional)
  
          `faviconUri` the URI of the favicon (optional)
  
          `faviconDatabase` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFaviconChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkit6.favicon_database.FaviconDatabase)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.favicon_database.FaviconDatabase.faviconChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("favicon-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.favicon_database.FaviconDatabase]
class FaviconDatabaseGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.favicon_database.FaviconDatabase]
final class FaviconDatabaseGidBuilder : FaviconDatabaseGidBuilderImpl!FaviconDatabaseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FaviconDatabase build() nothrow
  {
    return new FaviconDatabase(cast(void*)createGObject(FaviconDatabase._getGType), Yes.Take);
  }
}
