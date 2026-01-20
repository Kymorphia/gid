/// Module for [Drop] class
module gdk.drop;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.device;
import gdk.display;
import gdk.drag;
import gdk.surface;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.object;
import gobject.types;
import gobject.value;

/**
    The [gdk.drop.Drop] object represents the target of an ongoing DND operation.
    
    Possible drop sites get informed about the status of the ongoing drag
    operation with events of type [gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
    [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart]. The [gdk.drop.Drop] object can be obtained
    from these [gdk.event.Event] types using [gdk.dndevent.DNDEvent.getDrop].
    
    The actual data transfer is initiated from the target side via an async
    read, using one of the [gdk.drop.Drop] methods for this purpose:
    [gdk.drop.Drop.readAsync] or [gdk.drop.Drop.readValueAsync].
    
    GTK provides a higher level abstraction based on top of these functions,
    and so they are not normally needed in GTK applications. See the
    "Drag and Drop" section of the GTK documentation for more information.
*/
class Drop : gobject.object.ObjectWrap
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
    return cast(void function())gdk_drop_get_type != &gidSymbolNotFound ? gdk_drop_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Drop self()
  {
    return this;
  }

  /**
      Get `display` property.
      Returns: The [gdk.display.Display] that the drop belongs to.
  */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /**
      Ends the drag operation after a drop.
      
      The action must be a single action selected from the actions
      available via [gdk.drop.Drop.getActions].
  
      Params:
        action = the action performed by the destination or 0 if the drop failed
  */
  void finish(gdk.types.DragAction action)
  {
    gdk_drop_finish(cast(GdkDrop*)this._cPtr, action);
  }

  /**
      Returns the possible actions for this [gdk.drop.Drop].
      
      If this value contains multiple actions - i.e.
      `funcGdk.DragAction.is_unique` returns false for the result -
      [gdk.drop.Drop.finish] must choose the action to use when
      accepting the drop. This will only happen if you passed
      [gdk.types.DragAction.Ask] as one of the possible actions in
      [gdk.drop.Drop.status]. [gdk.types.DragAction.Ask] itself will not
      be included in the actions returned by this function.
      
      This value may change over the lifetime of the [gdk.drop.Drop]
      both as a response to source side actions as well as to calls to
      [gdk.drop.Drop.status] or [gdk.drop.Drop.finish]. The source
      side will not change this value anymore once a drop has started.
      Returns: The possible `GdkDragActions`
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drop_get_actions(cast(GdkDrop*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gdk.device.Device] performing the drop.
      Returns: The [gdk.device.Device] performing the drop.
  */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_drop_get_device(cast(GdkDrop*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gdk.display.Display] that self was created for.
      Returns: a [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_drop_get_display(cast(GdkDrop*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      If this is an in-app drag-and-drop operation, returns the [gdk.drag.Drag]
      that corresponds to this drop.
      
      If it is not, null is returned.
      Returns: the corresponding [gdk.drag.Drag]
  */
  gdk.drag.Drag getDrag()
  {
    GdkDrag* _cretval;
    _cretval = gdk_drop_get_drag(cast(GdkDrop*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drag.Drag)(cast(GdkDrag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gdk.content_formats.ContentFormats] that the drop offers the data
      to be read in.
      Returns: The possible [gdk.content_formats.ContentFormats]
  */
  gdk.content_formats.ContentFormats getFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_drop_get_formats(cast(GdkDrop*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the [gdk.surface.Surface] performing the drop.
      Returns: The [gdk.surface.Surface] performing the drop.
  */
  gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_drop_get_surface(cast(GdkDrop*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Asynchronously read the dropped data from a [gdk.drop.Drop]
      in a format that complies with one of the mime types.
  
      Params:
        mimeTypes = pointer to an array of mime types
        ioPriority = the I/O priority for the read operation
        cancellable = optional [gio.cancellable.Cancellable] object
        callback = a [gio.types.AsyncReadyCallback] to call when
            the request is satisfied
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
    const(char)*[] _tmpmimeTypes;
    foreach (s; mimeTypes)
      _tmpmimeTypes ~= s.toCString(No.Alloc);
    _tmpmimeTypes ~= null;
    const(char*)* _mimeTypes = _tmpmimeTypes.ptr;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_drop_read_async(cast(GdkDrop*)this._cPtr, _mimeTypes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async drop read operation.
      
      Note that you must not use blocking read calls on the returned stream
      in the GTK thread, since some platforms might require communication with
      GTK to complete the data transfer. You can use async APIs such as
      [gio.input_stream.InputStream.readBytesAsync].
      
      See [gdk.drop.Drop.readAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
        outMimeType = return location for the used mime type
      Returns: the [gio.input_stream.InputStream]
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream readFinish(gio.async_result.AsyncResult result, out string outMimeType)
  {
    GInputStream* _cretval;
    char* _outMimeType;
    GError *_err;
    _cretval = gdk_drop_read_finish(cast(GdkDrop*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_outMimeType, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    outMimeType = _outMimeType.fromCString(No.Free);
    return _retval;
  }

  /**
      Asynchronously request the drag operation's contents converted
      to the given type.
      
      When the operation is finished callback will be called. You must
      then call [gdk.drop.Drop.readValueFinish] to get the resulting
      [gobject.value.Value].
      
      For local drag-and-drop operations that are available in the given
      [gobject.types.TYPE_FLAG_RESERVED_ID_BIT], the value will be copied directly. Otherwise, GDK will
      try to use `funcGdk.content_deserialize_async` to convert the data.
  
      Params:
        type = a [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] to read
        ioPriority = the I/O priority of the request.
        cancellable = optional [gio.cancellable.Cancellable] object, null to ignore.
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
    gdk_drop_read_value_async(cast(GdkDrop*)this._cPtr, type, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async drop read.
      
      See [gdk.drop.Drop.readValueAsync].
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: a [gobject.value.Value] containing the result.
      Throws: [ErrorWrap]
  */
  gobject.value.Value readValueFinish(gio.async_result.AsyncResult result)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gdk_drop_read_value_finish(cast(GdkDrop*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Selects all actions that are potentially supported by the destination.
      
      When calling this function, do not restrict the passed in actions to
      the ones provided by [gdk.drop.Drop.getActions]. Those actions may
      change in the future, even depending on the actions you provide here.
      
      The preferred action is a hint to the drag-and-drop mechanism about which
      action to use when multiple actions are possible.
      
      This function should be called by drag destinations in response to
      [gdk.types.EventType.DragEnter] or [gdk.types.EventType.DragMotion] events. If the destination does
      not yet know the exact actions it supports, it should set any possible
      actions first and then later call this function again.
  
      Params:
        actions = Supported actions of the destination, or 0 to indicate
             that a drop will not be accepted
        preferred = A unique action that's a member of actions indicating the
             preferred action
  */
  void status(gdk.types.DragAction actions, gdk.types.DragAction preferred)
  {
    gdk_drop_status(cast(GdkDrop*)this._cPtr, actions, preferred);
  }
}
