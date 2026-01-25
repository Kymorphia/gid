/// Module for [ContentDeserializer] class
module gdk.content_deserializer;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.input_stream;
import glib.error;
import glib.types;
import gobject.object;
import gobject.types;
import gobject.value;

/**
    A [gdk.content_deserializer.ContentDeserializer] is used to deserialize content received via
    inter-application data transfers.
    
    The [gdk.content_deserializer.ContentDeserializer] transforms serialized content that is
    identified by a mime type into an object identified by a GType.
    
    GTK provides serializers and deserializers for common data types
    such as text, colors, images or file lists. To register your own
    deserialization functions, use `func@content_register_deserializer`.
    
    Also see [gdk.content_serializer.ContentSerializer].
*/
class ContentDeserializer : gobject.object.ObjectWrap, gio.async_result.AsyncResult
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
    return cast(void function())gdk_content_deserializer_get_type != &gidSymbolNotFound ? gdk_content_deserializer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDeserializer self()
  {
    return this;
  }

  mixin AsyncResultT!();

  /**
      Gets the cancellable for the current operation.
      
      This is the [gio.cancellable.Cancellable] that was passed to `funcGdk.content_deserialize_async`.
      Returns: the cancellable for the current operation
  */
  gio.cancellable.Cancellable getCancellable()
  {
    GCancellable* _cretval;
    _cretval = gdk_content_deserializer_get_cancellable(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `GType` to create an instance of.
      Returns: the `GType` for the current operation
  */
  gobject.types.GType getGtype()
  {
    gobject.types.GType _retval;
    _retval = gdk_content_deserializer_get_gtype(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the input stream for the current operation.
      
      This is the stream that was passed to `funcGdk.content_deserialize_async`.
      Returns: the input stream for the current operation
  */
  gio.input_stream.InputStream getInputStream()
  {
    GInputStream* _cretval;
    _cretval = gdk_content_deserializer_get_input_stream(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the mime type to deserialize from.
      Returns: the mime type for the current operation
  */
  string getMimeType()
  {
    const(char)* _cretval;
    _cretval = gdk_content_deserializer_get_mime_type(cast(GdkContentDeserializer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the I/O priority for the current operation.
      
      This is the priority that was passed to `funcGdk.content_deserialize_async`.
      Returns: the I/O priority for the current operation
  */
  int getPriority()
  {
    int _retval;
    _retval = gdk_content_deserializer_get_priority(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the data that was associated with the current operation.
      
      See [gdk.content_deserializer.ContentDeserializer.setTaskData].
      Returns: the task data for deserializer
  */
  void* getTaskData()
  {
    auto _retval = gdk_content_deserializer_get_task_data(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the user data that was passed when the deserializer was registered.
      Returns: the user data for this deserializer
  */
  void* getUserData()
  {
    auto _retval = gdk_content_deserializer_get_user_data(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gobject.value.Value] to store the deserialized object in.
      Returns: the [gobject.value.Value] for the current operation
  */
  gobject.value.Value getValue()
  {
    GValue* _cretval;
    _cretval = gdk_content_deserializer_get_value(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Indicate that the deserialization has ended with an error.
      
      This function consumes error.
  
      Params:
        error = a [glib.error.ErrorWrap]
  */
  void returnError(glib.error.ErrorWrap error)
  {
    gdk_content_deserializer_return_error(cast(GdkContentDeserializer*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Indicate that the deserialization has been successfully completed.
  */
  void returnSuccess()
  {
    gdk_content_deserializer_return_success(cast(GdkContentDeserializer*)this._cPtr);
  }

  /**
      Associate data with the current deserialization operation.
  
      Params:
        data = data to associate with this operation
        notify = destroy notify for data
  */
  void setTaskData(void* data, glib.types.DestroyNotify notify)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    gdk_content_deserializer_set_task_data(cast(GdkContentDeserializer*)this._cPtr, data, _notifyCB);
  }
}
