/// Module for [ContentProvider] class
module gid.gdk4.content_provider;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.clipboard;
import gid.gdk4.content_formats;
import gid.gdk4.types;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;

/**
    Provides content for the clipboard or for drag-and-drop operations
    in a number of formats.
    
    To create a [gid.gdk4.content_provider.ContentProvider], use [gid.gdk4.content_provider.ContentProvider.newForValue]
    or [gid.gdk4.content_provider.ContentProvider.newForBytes].
    
    GDK knows how to handle common text and image formats out-of-the-box. See
    [gid.gdk4.content_serializer.ContentSerializer] and [gid.gdk4.content_deserializer.ContentDeserializer] if you want
    to add support for application-specific data formats.
*/
class ContentProvider : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_content_provider_get_type != &gidSymbolNotFound ? gdk_content_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkContentProvider";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentProvider self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.content_provider.ContentProvider]
      Returns: New builder object
  */
  static ContentProviderGidBuilder builder() nothrow
  {
    return new ContentProviderGidBuilder;
  }

  /**
      Get `formats` property.
      Returns: The possible formats that the provider can provide its data in.
  */
  @property gid.gdk4.content_formats.ContentFormats formats() nothrow
  {
    return refFormats();
  }

  /**
      Get `storableFormats` property.
      Returns: The subset of formats that clipboard managers should store this provider's data in.
  */
  @property gid.gdk4.content_formats.ContentFormats storableFormats() nothrow
  {
    return refStorableFormats();
  }

  /**
      Create a content provider that provides the given bytes as data for
      the given mime_type.
  
      Params:
        mimeType = the mime type
        bytes = a [gid.glib2.bytes.Bytes] with the data for mime_type
      Returns: a new [gid.gdk4.content_provider.ContentProvider]
  */
  static gid.gdk4.content_provider.ContentProvider newForBytes(string mimeType, gid.glib2.bytes.Bytes bytes) nothrow
  {
    GdkContentProvider* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_content_provider_new_for_bytes(_mimeType, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a content provider that provides the given value.
  
      Params:
        value = a [gid.gobject2.value.Value]
      Returns: a new [gid.gdk4.content_provider.ContentProvider]
  */
  static gid.gdk4.content_provider.ContentProvider newForValue(gid.gobject2.value.Value value) nothrow
  {
    GdkContentProvider* _cretval;
    _cretval = gdk_content_provider_new_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a content provider that represents all the given providers.
      
      Whenever data needs to be written, the union provider will try the given
      providers in the given order and the first one supporting a format will
      be chosen to provide it.
      
      This allows an easy way to support providing data in different formats.
      For example, an image may be provided by its file and by the image
      contents with a call such as
      ```c
      gdk_content_provider_new_union ((GdkContentProvider *[2]) {
                                        gdk_content_provider_new_typed (G_TYPE_FILE, file),
                                        gdk_content_provider_new_typed (GDK_TYPE_TEXTURE, texture)
                                      }, 2);
      ```
  
      Params:
        providers = The [gid.gdk4.content_provider.ContentProvider]s to present the union of
      Returns: a new [gid.gdk4.content_provider.ContentProvider]
  */
  static gid.gdk4.content_provider.ContentProvider newUnion(gid.gdk4.content_provider.ContentProvider[] providers = null) nothrow
  {
    GdkContentProvider* _cretval;
    size_t _nProviders;
    if (providers)
      _nProviders = cast(size_t)providers.length;

    auto _providers = cast(GdkContentProvider**)gMalloc((providers.length) * (GdkContentProvider*).sizeof);
    foreach (i, obj; providers) _providers[i] = obj ? cast(GdkContentProvider*)obj._cPtr(Yes.Dup) : null;
    _cretval = gdk_content_provider_new_union(_providers, _nProviders);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncAttachClipboard(gid.gdk4.clipboard.Clipboard clipboard)
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.attachClipboard)
      return;

    _klass.attachClipboard(cast(GdkContentProvider*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Emits the ::content-changed signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncContentChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncContentChanged()
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.contentChanged)
      return;

    _klass.contentChanged(cast(GdkContentProvider*)this._cPtr);
  }

  /** */
  protected void vfuncDetachClipboard(gid.gdk4.clipboard.Clipboard clipboard)
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.detachClipboard)
      return;

    _klass.detachClipboard(cast(GdkContentProvider*)this._cPtr, clipboard ? cast(GdkClipboard*)clipboard._cPtr(No.Dup) : null);
  }

  /**
      Gets the contents of provider stored in value.
      
      The value will have been initialized to the `GType` the value should be
      provided in. This given `GType` does not need to be listed in the formats
      returned by [gid.gdk4.content_provider.ContentProvider.refFormats]. However, if the
      given `GType` is not supported, this operation can fail and
      [gid.gio2.types.IOErrorEnum.NotSupported] will be reported.
  
      Params:
        value = the [gid.gobject2.value.Value] to fill (modified in place, changes are seen by the caller)
      Returns: true if the value was set successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetValue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetValue(gid.gobject2.value.Value value)
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.getValue)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.getValue(cast(GdkContentProvider*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the formats that the provider can provide its current contents in.
      Returns: The formats of the provider
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRefFormats` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gdk4.content_formats.ContentFormats vfuncRefFormats()
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.refFormats)
      return typeof(return).init;

    GdkContentFormats* _cretval;
    _cretval = _klass.refFormats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the formats that the provider suggests other applications to store
      the data in.
      
      An example of such an application would be a clipboard manager.
      
      This can be assumed to be a subset of [gid.gdk4.content_provider.ContentProvider.refFormats].
      Returns: The storable formats of the provider
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRefStorableFormats` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gdk4.content_formats.ContentFormats vfuncRefStorableFormats()
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.refStorableFormats)
      return typeof(return).init;

    GdkContentFormats* _cretval;
    _cretval = _klass.refStorableFormats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously writes the contents of provider to stream in the given
      mime_type.
      
      The given mime type does not need to be listed in the formats returned by
      [gid.gdk4.content_provider.ContentProvider.refFormats]. However, if the given `GType` is
      not supported, [gid.gio2.types.IOErrorEnum.NotSupported] will be reported.
      
      The given stream will not be closed.
  
      Params:
        mimeType = the mime type to provide the data in
        stream = the [gid.gio2.output_stream.OutputStream] to write to
        ioPriority = I/O priority of the request.
        cancellable = optional [gid.gio2.cancellable.Cancellable] object, null to ignore.
        callback = callback to call when the request is satisfied
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteMimeTypeAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncWriteMimeTypeAsync(string mimeType, gid.gio2.output_stream.OutputStream stream, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.writeMimeTypeAsync)
      return;

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
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.writeMimeTypeAsync(cast(GdkContentProvider*)this._cPtr, _mimeType, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous write operation.
      
      See [gid.gdk4.content_provider.ContentProvider.writeMimeTypeAsync].
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: true if the operation was completed successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWriteMimeTypeFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncWriteMimeTypeFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GdkContentProviderClass*)_vfuncClass;
    if (!_klass.writeMimeTypeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.writeMimeTypeFinish(cast(GdkContentProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Emits the ::content-changed signal.
  */
  void contentChanged() nothrow
  {
    gdk_content_provider_content_changed(cast(GdkContentProvider*)this._cPtr);
  }

  /**
      Gets the contents of provider stored in value.
      
      The value will have been initialized to the `GType` the value should be
      provided in. This given `GType` does not need to be listed in the formats
      returned by [gid.gdk4.content_provider.ContentProvider.refFormats]. However, if the
      given `GType` is not supported, this operation can fail and
      [gid.gio2.types.IOErrorEnum.NotSupported] will be reported.
  
      Params:
        value = the [gid.gobject2.value.Value] to fill
      Returns: true if the value was set successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  */
  bool getValue(gid.gobject2.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_content_provider_get_value(cast(GdkContentProvider*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the formats that the provider can provide its current contents in.
      Returns: The formats of the provider
  */
  gid.gdk4.content_formats.ContentFormats refFormats() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_provider_ref_formats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the formats that the provider suggests other applications to store
      the data in.
      
      An example of such an application would be a clipboard manager.
      
      This can be assumed to be a subset of [gid.gdk4.content_provider.ContentProvider.refFormats].
      Returns: The storable formats of the provider
  */
  gid.gdk4.content_formats.ContentFormats refStorableFormats() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_provider_ref_storable_formats(cast(GdkContentProvider*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Asynchronously writes the contents of provider to stream in the given
      mime_type.
      
      The given mime type does not need to be listed in the formats returned by
      [gid.gdk4.content_provider.ContentProvider.refFormats]. However, if the given `GType` is
      not supported, [gid.gio2.types.IOErrorEnum.NotSupported] will be reported.
      
      The given stream will not be closed.
  
      Params:
        mimeType = the mime type to provide the data in
        stream = the [gid.gio2.output_stream.OutputStream] to write to
        ioPriority = I/O priority of the request.
        cancellable = optional [gid.gio2.cancellable.Cancellable] object, null to ignore.
        callback = callback to call when the request is satisfied
  */
  void writeMimeTypeAsync(string mimeType, gid.gio2.output_stream.OutputStream stream, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
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
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_content_provider_write_mime_type_async(cast(GdkContentProvider*)this._cPtr, _mimeType, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous write operation.
      
      See [gid.gdk4.content_provider.ContentProvider.writeMimeTypeAsync].
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: true if the operation was completed successfully. Otherwise
          error will be set to describe the failure.
      Throws: [ErrorWrap]
  */
  bool writeMimeTypeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_content_provider_write_mime_type_finish(cast(GdkContentProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `ContentChanged` signal.
  
      Emitted whenever the content provided by this provider has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.content_provider.ContentProvider contentProvider)`
  
          `contentProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectContentChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.content_provider.ContentProvider)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.contentChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("content-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ContentProvider
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gdk4.content_provider.ContentProvider), T.stringof ~ " is not derived from gid.gdk4.content_provider.ContentProvider");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAttachClipboard", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "attach_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncContentChanged", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "content_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDetachClipboard", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "detach_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetValue", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "get_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRefFormats", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "ref_formats");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRefStorableFormats", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "ref_storable_formats");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteMimeTypeAsync", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      static assert(0, "Overriding gid.gdk4.content_provider.ContentProvider.vfuncWriteMimeTypeAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWriteMimeTypeFinish", true)[0]) == gid.gdk4.content_provider.ContentProvider))
      _installVfunc(klass, "write_mime_type_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GdkContentProviderClass*)klass;

    switch (vfunc)
    {
      case "attach_clipboard":
      {
        static extern(C) void _vfuncAttachClipboardTramp(GdkContentProvider* provider, GdkClipboard* clipboard) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.attachClipboard)
              return (cast(typeof(&_vfuncAttachClipboardTramp))_klass.attachClipboard)(provider, clipboard);
            return;
          }

          try
          {
            _obj.vfuncAttachClipboard(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(void*)clipboard, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.vfuncAttachClipboard");
          }
        }

        _klass.attachClipboard = cast(typeof(_klass.attachClipboard))&_vfuncAttachClipboardTramp;
        break;
      }
      case "content_changed":
      {
        static extern(C) void _vfuncContentChangedTramp(GdkContentProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.contentChanged)
              return (cast(typeof(&_vfuncContentChangedTramp))_klass.contentChanged)(provider);
            return;
          }

          try
          {
            _obj.vfuncContentChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.vfuncContentChanged");
          }
        }

        _klass.contentChanged = cast(typeof(_klass.contentChanged))&_vfuncContentChangedTramp;
        break;
      }
      case "detach_clipboard":
      {
        static extern(C) void _vfuncDetachClipboardTramp(GdkContentProvider* provider, GdkClipboard* clipboard) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.detachClipboard)
              return (cast(typeof(&_vfuncDetachClipboardTramp))_klass.detachClipboard)(provider, clipboard);
            return;
          }

          try
          {
            _obj.vfuncDetachClipboard(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(void*)clipboard, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.vfuncDetachClipboard");
          }
        }

        _klass.detachClipboard = cast(typeof(_klass.detachClipboard))&_vfuncDetachClipboardTramp;
        break;
      }
      case "get_value":
      {
        static extern(C) gboolean _vfuncGetValueTramp(GdkContentProvider* provider, GValue* value, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.getValue)
              return (cast(typeof(&_vfuncGetValueTramp))_klass.getValue)(provider, value, _err);
            return typeof(return).init;
          }

          bool _dretval;
          auto _value = value ? new gid.gobject2.value.Value(cast(void*)value, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetValue(_value);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;
          if (_value)
            _value._cUnborrow;

          return _retval;
        }

        _klass.getValue = cast(typeof(_klass.getValue))&_vfuncGetValueTramp;
        break;
      }
      case "ref_formats":
      {
        static extern(C) GdkContentFormats* _vfuncRefFormatsTramp(GdkContentProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.refFormats)
              return (cast(typeof(&_vfuncRefFormatsTramp))_klass.refFormats)(provider);
            return typeof(return).init;
          }

          gid.gdk4.content_formats.ContentFormats _dretval;

          try
          {
            _dretval = _obj.vfuncRefFormats();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.vfuncRefFormats");
          }
          auto _retval = _dretval ? cast(GdkContentFormats*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.refFormats = cast(typeof(_klass.refFormats))&_vfuncRefFormatsTramp;
        break;
      }
      case "ref_storable_formats":
      {
        static extern(C) GdkContentFormats* _vfuncRefStorableFormatsTramp(GdkContentProvider* provider) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.refStorableFormats)
              return (cast(typeof(&_vfuncRefStorableFormatsTramp))_klass.refStorableFormats)(provider);
            return typeof(return).init;
          }

          gid.gdk4.content_formats.ContentFormats _dretval;

          try
          {
            _dretval = _obj.vfuncRefStorableFormats();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.content_provider.ContentProvider.vfuncRefStorableFormats");
          }
          auto _retval = _dretval ? cast(GdkContentFormats*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.refStorableFormats = cast(typeof(_klass.refStorableFormats))&_vfuncRefStorableFormatsTramp;
        break;
      }
      case "write_mime_type_finish":
      {
        static extern(C) gboolean _vfuncWriteMimeTypeFinishTramp(GdkContentProvider* provider, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdk4.content_provider.ContentProvider)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GdkContentProviderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider);
            if (_klass.writeMimeTypeFinish)
              return (cast(typeof(&_vfuncWriteMimeTypeFinishTramp))_klass.writeMimeTypeFinish)(provider, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncWriteMimeTypeFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.writeMimeTypeFinish = cast(typeof(_klass.writeMimeTypeFinish))&_vfuncWriteMimeTypeFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gdk4.content_provider.ContentProvider]
class ContentProviderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdk4.content_provider.ContentProvider]
final class ContentProviderGidBuilder : ContentProviderGidBuilderImpl!ContentProviderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentProvider build() nothrow
  {
    return new ContentProvider(cast(void*)createGObject(ContentProvider._getGType), Yes.Take);
  }
}
