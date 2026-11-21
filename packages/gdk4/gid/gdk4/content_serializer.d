/// Module for [ContentSerializer] class
module gid.gdk4.content_serializer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gio2.async_result;
import gid.gio2.async_result_mixin;
import gid.gio2.cancellable;
import gid.gio2.output_stream;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    Serializes content for inter-application data transfers.
    
    The [gid.gdk4.content_serializer.ContentSerializer] transforms an object that is identified
    by a GType into a serialized form (i.e. a byte stream) that is
    identified by a mime type.
    
    GTK provides serializers and deserializers for common data types
    such as text, colors, images or file lists. To register your own
    serialization functions, use `func@Gdk.content_register_serializer`.
    
    Also see [gid.gdk4.content_deserializer.ContentDeserializer].
*/
class ContentSerializer : gid.gobject2.object.ObjectWrap, gid.gio2.async_result.AsyncResult
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
    return cast(void function())gdk_content_serializer_get_type != &gidSymbolNotFound ? gdk_content_serializer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkContentSerializer";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentSerializer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.content_serializer.ContentSerializer]
      Returns: New builder object
  */
  static ContentSerializerGidBuilder builder() nothrow
  {
    return new ContentSerializerGidBuilder;
  }

  mixin AsyncResultT!();

  /**
      Gets the cancellable for the current operation.
      
      This is the [gid.gio2.cancellable.Cancellable] that was passed to `funccontent_serialize_async`.
      Returns: the cancellable for the current operation
  */
  gid.gio2.cancellable.Cancellable getCancellable() nothrow
  {
    GCancellable* _cretval;
    _cretval = gdk_content_serializer_get_cancellable(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `GType` to of the object to serialize.
      Returns: the `GType` for the current operation
  */
  gid.gobject2.types.GType getGtype() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gdk_content_serializer_get_gtype(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the mime type to serialize to.
      Returns: the mime type for the current operation
  */
  string getMimeType() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_content_serializer_get_mime_type(cast(GdkContentSerializer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the output stream for the current operation.
      
      This is the stream that was passed to `funccontent_serialize_async`.
      Returns: the output stream for the current operation
  */
  gid.gio2.output_stream.OutputStream getOutputStream() nothrow
  {
    GOutputStream* _cretval;
    _cretval = gdk_content_serializer_get_output_stream(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the I/O priority for the current operation.
      
      This is the priority that was passed to `funccontent_serialize_async`.
      Returns: the I/O priority for the current operation
  */
  int getPriority() nothrow
  {
    int _retval;
    _retval = gdk_content_serializer_get_priority(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the data that was associated with the current operation.
      
      See [gid.gdk4.content_serializer.ContentSerializer.setTaskData].
      Returns: the task data for serializer
  */
  void* getTaskData() nothrow
  {
    auto _retval = gdk_content_serializer_get_task_data(cast(GdkContentSerializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gobject2.value.Value] to read the object to serialize from.
      Returns: the [gid.gobject2.value.Value] for the current operation
  */
  gid.gobject2.value.Value getValue() nothrow
  {
    const(GValue)* _cretval;
    _cretval = gdk_content_serializer_get_value(cast(GdkContentSerializer*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Indicate that the serialization has ended with an error.
      
      This function consumes error.
  
      Params:
        error = a [gid.glib2.error.ErrorWrap]
  */
  void returnError(gid.glib2.error.ErrorWrap error) nothrow
  {
    gdk_content_serializer_return_error(cast(GdkContentSerializer*)this._cPtr, error ? cast(GError*)error._cPtr(Yes.Dup) : null);
  }

  /**
      Indicate that the serialization has been successfully completed.
  */
  void returnSuccess() nothrow
  {
    gdk_content_serializer_return_success(cast(GdkContentSerializer*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gdk4.content_serializer.ContentSerializer]
class ContentSerializerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.async_result.AsyncResultGidBuilderImpl!T
{

  mixin AsyncResultGidBuilderT!();
}

/// Fluent builder for [gid.gdk4.content_serializer.ContentSerializer]
final class ContentSerializerGidBuilder : ContentSerializerGidBuilderImpl!ContentSerializerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentSerializer build() nothrow
  {
    return new ContentSerializer(cast(void*)createGObject(ContentSerializer._getGType), Yes.Take);
  }
}
