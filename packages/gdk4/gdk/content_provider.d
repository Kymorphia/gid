/// Module for [ContentProvider] class
module gdk.content_provider;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.output_stream;
import gio.types;
import glib.bytes;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/**
    A [gdk.content_provider.ContentProvider] is used to provide content for the clipboard or
    for drag-and-drop operations in a number of formats.
    
    To create a [gdk.content_provider.ContentProvider], use [gdk.content_provider.ContentProvider.newForValue]
    or [gdk.content_provider.ContentProvider.newForBytes].
    
    GDK knows how to handle common text and image formats out-of-the-box. See
    [gdk.content_serializer.ContentSerializer] and [gdk.content_deserializer.ContentDeserializer] if you want
    to add support for application-specific data formats.
*/
class ContentProvider : gobject.object.ObjectWrap
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
    return cast(void function())gdk_content_provider_get_type != &gidSymbolNotFound ? gdk_content_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentProvider self()
  {
    return this;
  }

  /**
      Get `formats` property.
      Returns: The possible formats that the provider can provide its data in.
  */
  @property gdk.content_formats.ContentFormats formats()
  {
    return refFormats();
  }

  /**
      Get `storableFormats` property.
      Returns: The subset of formats that clipboard managers should store this provider's data in.
  */
  @property gdk.content_formats.ContentFormats storableFormats()
  {
    return refStorableFormats();
  }

  /**
      Create a content provider that provides the given bytes as data for
      the given mime_type.
  
      Params:
        mimeType = the mime type
        bytes = a [glib.bytes.Bytes] with the data for mime_type
      Returns: a new [gdk.content_provider.ContentProvider]
  */
  static gdk.content_provider.ContentProvider newForBytes(string mimeType, glib.bytes.Bytes bytes)
  {
    GdkContentProvider* _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    _cretval = gdk_content_provider_new_for_bytes(_mimeType, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a content provider that provides the given value.
  
      Params:
        value = a [gobject.value.Value]
      Returns: a new [gdk.content_provider.ContentProvider]
  */
  static gdk.content_provider.ContentProvider newForValue(gobject.value.Value value)
  {
    GdkContentProvider* _cretval;
    _cretval = gdk_content_provider_new_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Emits the ::content-changed signal.
  */
  void contentChanged()
  {
    gdk_content_provider_content_changed(cast(GdkContentProvider*)this._cPtr);
  }

  /**
      Gets the contents of provider stored in value.
      
      The value will have been initialized to the [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] the value should be
      provided in. This given [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] does not need to be listed in the formats
      returned by [gdk.content_provider.ContentProvider.refFormats]. However, if the
      given [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] is not supported, this operation can fail and
      [gio.types.IOErrorEnum.NotSupported] will be reported.
  
      Params:
        value = the [gobject.value.Value] to fill
      Returns: true if the value was set successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  */
  bool getValue(out gobject.value.Value value)
  {
    bool _retval;
    GValue _value;
    GError *_err;
    _retval = cast(bool)gdk_content_provider_get_value(cast(GdkContentProvider*)this._cPtr, &_value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }

  /**
      Gets the formats that the provider can provide its current contents in.
      Returns: The formats of the provider
  */
  gdk.content_formats.ContentFormats refFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_provider_ref_formats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the formats that the provider suggests other applications to store
      the data in.
      
      An example of such an application would be a clipboard manager.
      
      This can be assumed to be a subset of [gdk.content_provider.ContentProvider.refFormats].
      Returns: The storable formats of the provider
  */
  gdk.content_formats.ContentFormats refStorableFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_provider_ref_storable_formats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously writes the contents of provider to stream in the given
      mime_type.
      
      When the operation is finished callback will be called. You must then call
      [gdk.content_provider.ContentProvider.writeMimeTypeFinish] to get the result
      of the operation.
      
      The given mime type does not need to be listed in the formats returned by
      [gdk.content_provider.ContentProvider.refFormats]. However, if the given [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] is
      not supported, [gio.types.IOErrorEnum.NotSupported] will be reported.
      
      The given stream will not be closed.
  
      Params:
        mimeType = the mime type to provide the data in
        stream = the [gio.output_stream.OutputStream] to write to
        ioPriority = I/O priority of the request.
        cancellable = optional [gio.cancellable.Cancellable] object, null to ignore.
        callback = callback to call when the request is satisfied
  */
  void writeMimeTypeAsync(string mimeType, gio.output_stream.OutputStream stream, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_content_provider_write_mime_type_async(cast(GdkContentProvider*)this._cPtr, _mimeType, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous write operation.
      
      See [gdk.content_provider.ContentProvider.writeMimeTypeAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: true if the operation was completed successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  */
  bool writeMimeTypeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_content_provider_write_mime_type_finish(cast(GdkContentProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Connect to `ContentChanged` signal.
  
      Emitted whenever the content provided by this provider has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.content_provider.ContentProvider contentProvider))
  
          `contentProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectContentChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.content_provider.ContentProvider)))
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
    return connectSignalClosure("content-changed", closure, after);
  }
}
