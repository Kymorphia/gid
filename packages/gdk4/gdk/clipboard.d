/// Module for [Clipboard] class
module gdk.clipboard;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.content_provider;
import gdk.display;
import gdk.texture;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;

/**
    The [gdk.clipboard.Clipboard] object represents data shared between applications or
    inside an application.
    
    To get a [gdk.clipboard.Clipboard] object, use [gdk.display.Display.getClipboard] or
    [gdk.display.Display.getPrimaryClipboard]. You can find out about the data
    that is currently available in a clipboard using
    [gdk.clipboard.Clipboard.getFormats].
    
    To make text or image data available in a clipboard, use
    [gdk.clipboard.Clipboard.setText] or [gdk.clipboard.Clipboard.setTexture].
    For other data, you can use [gdk.clipboard.Clipboard.setContent], which
    takes a [gdk.content_provider.ContentProvider] object.
    
    To read textual or image data from a clipboard, use
    [gdk.clipboard.Clipboard.readTextAsync] or
    [gdk.clipboard.Clipboard.readTextureAsync]. For other data, use
    [gdk.clipboard.Clipboard.readAsync], which provides a [gio.input_stream.InputStream] object.
*/
class Clipboard : gobject.object.ObjectWrap
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
    return cast(void function())gdk_clipboard_get_type != &gidSymbolNotFound ? gdk_clipboard_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Clipboard self()
  {
    return this;
  }

  /**
      Get `content` property.
      Returns: The [gdk.content_provider.ContentProvider] or null if the clipboard is empty or contents are
        provided otherwise.
  */
  @property gdk.content_provider.ContentProvider content()
  {
    return getContent();
  }

  /**
      Get `formats` property.
      Returns: The possible formats that the clipboard can provide its data in.
  */
  @property gdk.content_formats.ContentFormats formats()
  {
    return getFormats();
  }

  /**
      Get `local` property.
      Returns: true if the contents of the clipboard are owned by this process.
  */
  @property bool local()
  {
    return isLocal();
  }

  /**
      Returns the [gdk.content_provider.ContentProvider] currently set on clipboard.
      
      If the clipboard is empty or its contents are not owned by the
      current process, null will be returned.
      Returns: The content of a clipboard
          if the clipboard does not maintain any content
  */
  gdk.content_provider.ContentProvider getContent()
  {
    GdkContentProvider* _cretval;
    _cretval = gdk_clipboard_get_content(cast(GdkClipboard*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gdk.display.Display] that the clipboard was created for.
      Returns: a [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_clipboard_get_display(cast(GdkClipboard*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the formats that the clipboard can provide its current contents in.
      Returns: The formats of the clipboard
  */
  gdk.content_formats.ContentFormats getFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_clipboard_get_formats(cast(GdkClipboard*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns if the clipboard is local.
      
      A clipboard is considered local if it was last claimed
      by the running application.
      
      Note that [gdk.clipboard.Clipboard.getContent] may return null
      even on a local clipboard. In this case the clipboard is empty.
      Returns: true if the clipboard is local
  */
  bool isLocal()
  {
    bool _retval;
    _retval = cast(bool)gdk_clipboard_is_local(cast(GdkClipboard*)this._cPtr);
    return _retval;
  }

  /**
      Asynchronously requests an input stream to read the clipboard's
      contents from.
      
      When the operation is finished callback will be called. You must then
      call [gdk.clipboard.Clipboard.readFinish] to get the result of the operation.
      
      The clipboard will choose the most suitable mime type from the given list
      to fulfill the request, preferring the ones listed first.
  
      Params:
        mimeTypes = a null-terminated array of mime types to choose from
        ioPriority = the I/O priority of the request
        cancellable = optional [gio.cancellable.Cancellable] object
        callback = callback to call when the request is satisfied
  */
  void readAsync(string[] mimeTypes, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    char*[] _tmpmimeTypes;
    foreach (s; mimeTypes)
      _tmpmimeTypes ~= s.toCString(No.Alloc);
    _tmpmimeTypes ~= null;
    const(char*)* _mimeTypes = _tmpmimeTypes.ptr;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_clipboard_read_async(cast(GdkClipboard*)this._cPtr, _mimeTypes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous clipboard read.
      
      See [gdk.clipboard.Clipboard.readAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
        outMimeType = location to store
            the chosen mime type
      Returns: a [gio.input_stream.InputStream]
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream readFinish(gio.async_result.AsyncResult result, out string outMimeType)
  {
    GInputStream* _cretval;
    char* _outMimeType;
    GError *_err;
    _cretval = gdk_clipboard_read_finish(cast(GdkClipboard*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_outMimeType, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    outMimeType = _outMimeType.fromCString(No.Free);
    return _retval;
  }

  /**
      Asynchronously request the clipboard contents converted to a string.
      
      When the operation is finished callback will be called. You must then
      call [gdk.clipboard.Clipboard.readTextFinish] to get the result.
      
      This is a simple wrapper around [gdk.clipboard.Clipboard.readValueAsync].
      Use that function or [gdk.clipboard.Clipboard.readAsync] directly if you
      need more control over the operation.
  
      Params:
        cancellable = optional [gio.cancellable.Cancellable] object
        callback = callback to call when the request is satisfied
  */
  void readTextAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_clipboard_read_text_async(cast(GdkClipboard*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous clipboard read.
      
      See [gdk.clipboard.Clipboard.readTextAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: a new string
      Throws: [ErrorWrap]
  */
  string readTextFinish(gio.async_result.AsyncResult result)
  {
    char* _cretval;
    GError *_err;
    _cretval = gdk_clipboard_read_text_finish(cast(GdkClipboard*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Asynchronously request the clipboard contents converted to a [gdkpixbuf.pixbuf.Pixbuf].
      
      When the operation is finished callback will be called. You must then
      call [gdk.clipboard.Clipboard.readTextureFinish] to get the result.
      
      This is a simple wrapper around [gdk.clipboard.Clipboard.readValueAsync].
      Use that function or [gdk.clipboard.Clipboard.readAsync] directly if you
      need more control over the operation.
  
      Params:
        cancellable = optional [gio.cancellable.Cancellable] object, null to ignore.
        callback = callback to call when the request is satisfied
  */
  void readTextureAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_clipboard_read_texture_async(cast(GdkClipboard*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous clipboard read.
      
      See [gdk.clipboard.Clipboard.readTextureAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: a new [gdk.texture.Texture]
      Throws: [ErrorWrap]
  */
  gdk.texture.Texture readTextureFinish(gio.async_result.AsyncResult result)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = gdk_clipboard_read_texture_finish(cast(GdkClipboard*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously request the clipboard contents converted to the given
      type.
      
      When the operation is finished callback will be called. You must then call
      [gdk.clipboard.Clipboard.readValueFinish] to get the resulting [gobject.value.Value].
      
      For local clipboard contents that are available in the given [gobject.types.TYPE_FLAG_RESERVED_ID_BIT],
      the value will be copied directly. Otherwise, GDK will try to use
      `funccontent_deserialize_async` to convert the clipboard's data.
  
      Params:
        type = a [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] to read
        ioPriority = the I/O priority of the request
        cancellable = optional [gio.cancellable.Cancellable] object
        callback = callback to call when the request is satisfied
  */
  void readValueAsync(gobject.types.GType type, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_clipboard_read_value_async(cast(GdkClipboard*)this._cPtr, type, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous clipboard read.
      
      See [gdk.clipboard.Clipboard.readValueAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: a [gobject.value.Value] containing the result.
      Throws: [ErrorWrap]
  */
  gobject.value.Value readValueFinish(gio.async_result.AsyncResult result)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gdk_clipboard_read_value_finish(cast(GdkClipboard*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets a new content provider on clipboard.
      
      The clipboard will claim the [gdk.display.Display]'s resources and advertise
      these new contents to other applications.
      
      In the rare case of a failure, this function will return false. The
      clipboard will then continue reporting its old contents and ignore
      provider.
      
      If the contents are read by either an external application or the
      clipboard's read functions, clipboard will select the best format to
      transfer the contents and then request that format from provider.
  
      Params:
        provider = the new contents of clipboard
            or null to clear the clipboard
      Returns: true if setting the clipboard succeeded
  */
  bool setContent(gdk.content_provider.ContentProvider provider = null)
  {
    bool _retval;
    _retval = cast(bool)gdk_clipboard_set_content(cast(GdkClipboard*)this._cPtr, provider ? cast(GdkContentProvider*)provider._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the clipboard to contain the given value.
  
      Params:
        value = a [gobject.value.Value] to set
  */
  void set(gobject.value.Value value)
  {
    gdk_clipboard_set_value(cast(GdkClipboard*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Asynchronously instructs the clipboard to store its contents remotely.
      
      If the clipboard is not local, this function does nothing but report success.
      
      The callback must call [gdk.clipboard.Clipboard.storeFinish].
      
      The purpose of this call is to preserve clipboard contents beyond the
      lifetime of an application, so this function is typically called on
      exit. Depending on the platform, the functionality may not be available
      unless a "clipboard manager" is running.
      
      This function is called automatically when a
      [GtkApplication](../gtk4/class.Application.html)
      is shut down, so you likely don't need to call it.
  
      Params:
        ioPriority = the I/O priority of the request
        cancellable = optional [gio.cancellable.Cancellable] object
        callback = callback to call when the request is satisfied
  */
  void storeAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_clipboard_store_async(cast(GdkClipboard*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous clipboard store.
      
      See [gdk.clipboard.Clipboard.storeAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: true if storing was successful.
      Throws: [ErrorWrap]
  */
  bool storeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_clipboard_store_finish(cast(GdkClipboard*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the clipboard changes ownership.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.clipboard.Clipboard clipboard))
  
          `clipboard` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.clipboard.Clipboard)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
