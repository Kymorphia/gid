/// Module for [ContentSerializer] class
module gdk.content_serializer;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.output_stream;
import glib.error;
import glib.types;
import gobject.object;
import gobject.types;
import gobject.value;

/**
    A [gdk.content_serializer.ContentSerializer] is used to serialize content for
    inter-application data transfers.
    
    The [gdk.content_serializer.ContentSerializer] transforms an object that is identified
    by a GType into a serialized form (i.e. a byte stream) that is
    identified by a mime type.
    
    GTK provides serializers and deserializers for common data types
    such as text, colors, images or file lists. To register your own
    serialization functions, use `func@Gdk.content_register_serializer`.
    
    Also see [gdk.content_deserializer.ContentDeserializer].
*/
class ContentSerializer : gobject.object.ObjectWrap, gio.async_result.AsyncResult
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
    return cast(void function())gdk_content_serializer_get_type != &gidSymbolNotFound ? gdk_content_serializer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentSerializer self()
  {
    return this;
  }

  mixin AsyncResultT!();

  /**
      Gets the cancellable for the current operation.
      
      This is the [gio.cancellable.Cancellable] that was passed to `funccontent_serialize_async`.
      Returns: the cancellable for the current operation
  */
  gio.cancellable.Cancellable getCancellable()
  {
    GCancellable* _cretval;
    _cretval = gdk_content_serializer_get_cancellable(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `GType` to of the object to serialize.
      Returns: the `GType` for the current operation
  */
  gobject.types.GType getGtype()
  {
    gobject.types.GType _retval;
    _retval = gdk_content_serializer_get_gtype(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the mime type to serialize to.
      Returns: the mime type for the current operation
  */
  string getMimeType()
  {
    const(char)* _cretval;
    _cretval = gdk_content_serializer_get_mime_type(cast(GdkContentSerializer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the output stream for the current operation.
      
      This is the stream that was passed to `funccontent_serialize_async`.
      Returns: the output stream for the current operation
  */
  gio.output_stream.OutputStream getOutputStream()
  {
    GOutputStream* _cretval;
    _cretval = gdk_content_serializer_get_output_stream(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the I/O priority for the current operation.
      
      This is the priority that was passed to `funccontent_serialize_async`.
      Returns: the I/O priority for the current operation
  */
  int getPriority()
  {
    int _retval;
    _retval = gdk_content_serializer_get_priority(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the data that was associated with the current operation.
      
      See [gdk.content_serializer.ContentSerializer.setTaskData].
      Returns: the task data for serializer
  */
  void* getTaskData()
  {
    auto _retval = gdk_content_serializer_get_task_data(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the user data that was passed when the serializer was registered.
      Returns: the user data for this serializer
  */
  void* getUserData()
  {
    auto _retval = gdk_content_serializer_get_user_data(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gobject.value.Value] to read the object to serialize from.
      Returns: the [gobject.value.Value] for the current operation
  */
  gobject.value.Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gdk_content_serializer_get_value(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Indicate that the serialization has ended with an error.
      
      This function consumes error.
  
      Params:
        error = a [glib.error.ErrorWrap]
  */
  void returnError(glib.error.ErrorWrap error)
  {
    gdk_content_serializer_return_error(cast(GdkContentSerializer*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Indicate that the serialization has been successfully completed.
  */
  void returnSuccess()
  {
    gdk_content_serializer_return_success(cast(GdkContentSerializer*)this._cPtr);
  }

  /**
      Associate data with the current serialization operation.
  
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
    gdk_content_serializer_set_task_data(cast(GdkContentSerializer*)this._cPtr, data, _notifyCB);
  }
}
