/// Module for [ContentDeserializer] class
module gid.gdk4.content_deserializer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gio2.async_result;
import gid.gio2.async_result_mixin;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    Deserializes content received via inter-application data transfers.
    
    The [gid.gdk4.content_deserializer.ContentDeserializer] transforms serialized content that is
    identified by a mime type into an object identified by a GType.
    
    GTK provides serializers and deserializers for common data types
    such as text, colors, images or file lists. To register your own
    deserialization functions, use `func@content_register_deserializer`.
    
    Also see [gid.gdk4.content_serializer.ContentSerializer].
*/
class ContentDeserializer : gid.gobject2.object.ObjectWrap, gid.gio2.async_result.AsyncResult
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
    return cast(void function())gdk_content_deserializer_get_type != &gidSymbolNotFound ? gdk_content_deserializer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkContentDeserializer";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDeserializer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.content_deserializer.ContentDeserializer]
      Returns: New builder object
  */
  static ContentDeserializerGidBuilder builder() nothrow
  {
    return new ContentDeserializerGidBuilder;
  }

  mixin AsyncResultT!();

  /**
  Set the deserialized value of the current operation ([gid.gdk4.content_deserializer.ContentDeserializer.getValue]
  returns a copy, so changes to it are not seen by the operation).
  Params:
  value = the deserialized value, its type must be compatible with the type of the operation
  ([gid.gdk4.content_deserializer.ContentDeserializer.getGtype])
  */
  void setValue(gid.gobject2.value.Value value) nothrow
  {
    import gid.gobject2.c.functions : g_value_copy;

    if (!value)
    {
      import gid.glib2.c.functions : g_log;
      import gid.glib2.c.types : GLogLevelFlags;
      g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gdk4.content_deserializer.ContentDeserializer.setValue: assertion 'value' failed");
      return;
    }

    g_value_copy(cast(const(GValue)*)value._cPtr(No.Dup), gdk_content_deserializer_get_value(cast(GdkContentDeserializer*)this._cPtr));
  }

  /**
      Gets the cancellable for the current operation.
      
      This is the [gid.gio2.cancellable.Cancellable] that was passed to `funcGdk.content_deserialize_async`.
      Returns: the cancellable for the current operation
  */
  gid.gio2.cancellable.Cancellable getCancellable() nothrow
  {
    GCancellable* _cretval;
    _cretval = gdk_content_deserializer_get_cancellable(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `GType` to create an instance of.
      Returns: the `GType` for the current operation
  */
  gid.gobject2.types.GType getGtype() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gdk_content_deserializer_get_gtype(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the input stream for the current operation.
      
      This is the stream that was passed to `funcGdk.content_deserialize_async`.
      Returns: the input stream for the current operation
  */
  gid.gio2.input_stream.InputStream getInputStream() nothrow
  {
    GInputStream* _cretval;
    _cretval = gdk_content_deserializer_get_input_stream(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the mime type to deserialize from.
      Returns: the mime type for the current operation
  */
  string getMimeType() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_content_deserializer_get_mime_type(cast(GdkContentDeserializer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the I/O priority for the current operation.
      
      This is the priority that was passed to `funcGdk.content_deserialize_async`.
      Returns: the I/O priority for the current operation
  */
  int getPriority() nothrow
  {
    int _retval;
    _retval = gdk_content_deserializer_get_priority(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the data that was associated with the current operation.
      
      See [gid.gdk4.content_deserializer.ContentDeserializer.setTaskData].
      Returns: the task data for deserializer
  */
  void* getTaskData() nothrow
  {
    auto _retval = gdk_content_deserializer_get_task_data(cast(GdkContentDeserializer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gobject2.value.Value] to store the deserialized object in.
      Returns: the [gid.gobject2.value.Value] for the current operation
  */
  gid.gobject2.value.Value getValue() nothrow
  {
    GValue* _cretval;
    _cretval = gdk_content_deserializer_get_value(cast(GdkContentDeserializer*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Indicate that the deserialization has ended with an error.
      
      This function consumes error.
  
      Params:
        error = a [gid.glib2.error.ErrorWrap]
  */
  void returnError(gid.glib2.error.ErrorWrap error) nothrow
  {
    gdk_content_deserializer_return_error(cast(GdkContentDeserializer*)this._cPtr, error ? cast(GError*)error._cPtr(Yes.Dup) : null);
  }

  /**
      Indicate that the deserialization has been successfully completed.
  */
  void returnSuccess() nothrow
  {
    gdk_content_deserializer_return_success(cast(GdkContentDeserializer*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gdk4.content_deserializer.ContentDeserializer]
class ContentDeserializerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.async_result.AsyncResultGidBuilderImpl!T
{

  mixin AsyncResultGidBuilderT!();
}

/// Fluent builder for [gid.gdk4.content_deserializer.ContentDeserializer]
final class ContentDeserializerGidBuilder : ContentDeserializerGidBuilderImpl!ContentDeserializerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentDeserializer build() nothrow
  {
    return new ContentDeserializer(cast(void*)createGObject(ContentDeserializer._getGType), Yes.Take);
  }
}
