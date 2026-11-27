/// Module for [Drop] class
module gid.gdk4.drop;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.content_formats;
import gid.gdk4.device;
import gid.gdk4.display;
import gid.gdk4.drag;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    Represents the target of an ongoing DND operation.
    
    Possible drop sites get informed about the status of the ongoing drag
    operation with events of type [gid.gdk4.types.EventType.DragEnter], [gid.gdk4.types.EventType.DragLeave],
    [gid.gdk4.types.EventType.DragMotion] and [gid.gdk4.types.EventType.DropStart]. The [gid.gdk4.drop.Drop] object can be obtained
    from these [gid.gdk4.event.Event] types using [gid.gdk4.dndevent.DNDEvent.getDrop].
    
    The actual data transfer is initiated from the target side via an async
    read, using one of the [gid.gdk4.drop.Drop] methods for this purpose:
    [gid.gdk4.drop.Drop.readAsync] or [gid.gdk4.drop.Drop.readValueAsync].
    
    GTK provides a higher level abstraction based on top of these functions,
    and so they are not normally needed in GTK applications. See the
    "Drag and Drop" section of the GTK documentation for more information.
*/
@gidGir("Drop")
class Drop : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_drop_get_type != &gidSymbolNotFound ? gdk_drop_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDrop";
  }

  /** Returns `this`, for use in `with` statements. */
  override Drop self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.drop.Drop]
      Returns: New builder object
  */
  static DropGidBuilder builder() nothrow
  {
    return new DropGidBuilder;
  }

  /**
      Get `actions` property.
      Returns: The possible actions for this drop
  */
  @property gid.gdk4.types.DragAction actions() nothrow
  {
    return getActions();
  }

  /**
      Get `device` property.
      Returns: The [gid.gdk4.device.Device] performing the drop
  */
  @property gid.gdk4.device.Device device() nothrow
  {
    return getDevice();
  }

  /**
      Get `display` property.
      Returns: The [gid.gdk4.display.Display] that the drop belongs to.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `drag` property.
      Returns: The [gid.gdk4.drag.Drag] that initiated this drop
  */
  @property gid.gdk4.drag.Drag drag() nothrow
  {
    return getDrag();
  }

  /**
      Get `formats` property.
      Returns: The possible formats that the drop can provide its data in.
  */
  @property gid.gdk4.content_formats.ContentFormats formats() nothrow
  {
    return getFormats();
  }

  /**
      Get `surface` property.
      Returns: The [gid.gdk4.surface.Surface] the drop happens on
  */
  @property gid.gdk4.surface.Surface surface() nothrow
  {
    return getSurface();
  }

  /**
      Ends the drag operation after a drop.
      
      The action must be a single action selected from the actions
      available via [gid.gdk4.drop.Drop.getActions].
  
      Params:
        action = the action performed by the destination or [gid.gdk4.types.DragAction.None] if the
            drop failed
  */
  void finish(gid.gdk4.types.DragAction action) nothrow
  {
    gdk_drop_finish(cast(GdkDrop*)this._cPtr, action);
  }

  /**
      Returns the possible actions for this [gid.gdk4.drop.Drop].
      
      If this value contains multiple actions - i.e.
      `funcGdk.DragAction.is_unique` returns false for the result -
      [gid.gdk4.drop.Drop.finish] must choose the action to use when
      accepting the drop. This will only happen if you passed
      [gid.gdk4.types.DragAction.Ask] as one of the possible actions in
      [gid.gdk4.drop.Drop.status]. [gid.gdk4.types.DragAction.Ask] itself will not
      be included in the actions returned by this function.
      
      This value may change over the lifetime of the [gid.gdk4.drop.Drop]
      both as a response to source side actions as well as to calls to
      [gid.gdk4.drop.Drop.status] or [gid.gdk4.drop.Drop.finish]. The source
      side will not change this value anymore once a drop has started.
      Returns: The possible `GdkDragActions`
  */
  gid.gdk4.types.DragAction getActions() nothrow
  {
    GdkDragAction _cretval;
    _cretval = gdk_drop_get_actions(cast(GdkDrop*)this._cPtr);
    gid.gdk4.types.DragAction _retval = cast(gid.gdk4.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gdk4.device.Device] performing the drop.
      Returns: The [gid.gdk4.device.Device] performing the drop.
  */
  gid.gdk4.device.Device getDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_drop_get_device(cast(GdkDrop*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gdk4.display.Display] that self was created for.
      Returns: a [gid.gdk4.display.Display]
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_drop_get_display(cast(GdkDrop*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      If this is an in-app drag-and-drop operation, returns the [gid.gdk4.drag.Drag]
      that corresponds to this drop.
      
      If it is not, `NULL` is returned.
      Returns: the corresponding [gid.gdk4.drag.Drag]
  */
  gid.gdk4.drag.Drag getDrag() nothrow
  {
    GdkDrag* _cretval;
    _cretval = gdk_drop_get_drag(cast(GdkDrop*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.drag.Drag)(cast(GdkDrag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gid.gdk4.content_formats.ContentFormats] that the drop offers the data
      to be read in.
      Returns: The possible [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats getFormats() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_drop_get_formats(cast(GdkDrop*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the [gid.gdk4.surface.Surface] performing the drop.
      Returns: The [gid.gdk4.surface.Surface] performing the drop.
  */
  gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_drop_get_surface(cast(GdkDrop*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Asynchronously read the dropped data from a [gid.gdk4.drop.Drop]
      in a format that complies with one of the mime types.
  
      Params:
        mimeTypes = pointer to an array of mime types
        ioPriority = the I/O priority for the read operation
        cancellable = optional [gid.gio2.cancellable.Cancellable] object
        callback = a [gid.gio2.types.AsyncReadyCallback] to call when
            the request is satisfied
  */
  void readAsync(string[] mimeTypes, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _mimeTypes_arr = new char*[](mimeTypes.length + 1);
    auto _mimeTypes = cast(char**)_mimeTypes_arr.ptr;
    foreach (i, s; mimeTypes) _mimeTypes[i] = s.toCString!(No.Malloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_drop_read_async(cast(GdkDrop*)this._cPtr, _mimeTypes, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async drop read operation.
      
      Note that you must not use blocking read calls on the returned stream
      in the GTK thread, since some platforms might require communication with
      GTK to complete the data transfer. You can use async APIs such as
      [gid.gio2.input_stream.InputStream.readBytesAsync].
      
      See [gid.gdk4.drop.Drop.readAsync].
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
        outMimeType = return location for the used mime type
      Returns: the [gid.gio2.input_stream.InputStream]
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream readFinish(gid.gio2.async_result.AsyncResult result, out string outMimeType)
  {
    GInputStream* _cretval;
    char* _outMimeType;
    GError *_err;
    _cretval = gdk_drop_read_finish(cast(GdkDrop*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_outMimeType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    outMimeType = _outMimeType.fromCString!(No.Free);
    return _retval;
  }

  /**
      Asynchronously request the drag operation's contents converted
      to the given type.
      
      For local drag-and-drop operations that are available in the given
      `GType`, the value will be copied directly. Otherwise, GDK will
      try to use `funcGdk.content_deserialize_async` to convert the data.
  
      Params:
        type = a `GType` to read
        ioPriority = the I/O priority of the request.
        cancellable = optional [gid.gio2.cancellable.Cancellable] object, null to ignore.
        callback = callback to call when the request is satisfied
  */
  void readValueAsync(gid.gobject2.types.GType type, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_drop_read_value_async(cast(GdkDrop*)this._cPtr, type, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async drop read.
      
      See [gid.gdk4.drop.Drop.readValueAsync].
  
      Params:
        result = a [gid.gio2.async_result.AsyncResult]
      Returns: a [gid.gobject2.value.Value] containing the result.
      Throws: [ErrorWrap]
  */
  gid.gobject2.value.Value readValueFinish(gid.gio2.async_result.AsyncResult result)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gdk_drop_read_value_finish(cast(GdkDrop*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Selects all actions that are potentially supported by the destination.
      
      When calling this function, do not restrict the passed in actions to
      the ones provided by [gid.gdk4.drop.Drop.getActions]. Those actions may
      change in the future, even depending on the actions you provide here.
      
      The preferred action is a hint to the drag-and-drop mechanism about which
      action to use when multiple actions are possible.
      
      This function should be called by drag destinations in response to
      [gid.gdk4.types.EventType.DragEnter] or [gid.gdk4.types.EventType.DragMotion] events. If the destination does
      not yet know the exact actions it supports, it should set any possible
      actions first and then later call this function again.
  
      Params:
        actions = Supported actions of the destination, or [gid.gdk4.types.DragAction.None] to
             indicate that a drop will not be accepted
        preferred = A unique action that's a member of actions indicating the
             preferred action
  */
  void status(gid.gdk4.types.DragAction actions, gid.gdk4.types.DragAction preferred) nothrow
  {
    gdk_drop_status(cast(GdkDrop*)this._cPtr, actions, preferred);
  }
}

/// Fluent builder implementation template for [gid.gdk4.drop.Drop]
class DropGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `actions` property.
      Params:
        propval = The possible actions for this drop
      Returns: Builder instance for fluent chaining
  */
  T actions(gid.gdk4.types.DragAction propval) nothrow
  {
    return setProperty("actions", propval);
  }

  /**
      Set `device` property.
      Params:
        propval = The [gid.gdk4.device.Device] performing the drop
      Returns: Builder instance for fluent chaining
  */
  T device(gid.gdk4.device.Device propval) nothrow
  {
    return setProperty("device", propval);
  }

  /**
      Set `drag` property.
      Params:
        propval = The [gid.gdk4.drag.Drag] that initiated this drop
      Returns: Builder instance for fluent chaining
  */
  T drag(gid.gdk4.drag.Drag propval) nothrow
  {
    return setProperty("drag", propval);
  }

  /**
      Set `formats` property.
      Params:
        propval = The possible formats that the drop can provide its data in.
      Returns: Builder instance for fluent chaining
  */
  T formats(gid.gdk4.content_formats.ContentFormats propval) nothrow
  {
    return setProperty("formats", propval);
  }

  /**
      Set `surface` property.
      Params:
        propval = The [gid.gdk4.surface.Surface] the drop happens on
      Returns: Builder instance for fluent chaining
  */
  T surface(gid.gdk4.surface.Surface propval) nothrow
  {
    return setProperty("surface", propval);
  }
}

/// Fluent builder for [gid.gdk4.drop.Drop]
final class DropGidBuilder : DropGidBuilderImpl!DropGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Drop build() nothrow
  {
    return new Drop(cast(void*)createGObject(Drop._getGType), Yes.Take);
  }
}
