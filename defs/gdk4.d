//!gir Gdk-4.0
//!info description "D binding for the Gdk4 library - Graphics Drawing Toolkit part of Gtk4"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gdk4/
//!info capi https://docs.gtk.org/gdk4/

//# Conflicts with undocumented Phobos object.Object.Monitor interface
//!subtype Monitor MonitorWrap


//# Ignore: Internal/implementation-only API, not useful from D
//!set class[ContentDeserializer].method[set_task_data][ignore] 1
//!set class[ContentSerializer].method[set_task_data][ignore] 1

//# Texture release callbacks have no user_data, mark the GDestroyNotify data parameter as its closure
//!set class[GLTexture].constructor[new].parameters.parameter[destroy][closure] 5
//!set class[GLTextureBuilder].method[build].parameters.parameter[destroy][closure] 1
//!set class[DmabufTextureBuilder].method[build].parameters.parameter[destroy][closure] 1

//# Hand-written below: Global (de)serializer registration callbacks have no closure data parameter, the delegate is
//# passed as the registration data (gdk_content_serializer_get_user_data/gdk_content_deserializer_get_user_data)
//!set function[content_register_deserializer][ignore] 1
//!set function[content_register_serializer][ignore] 1

//# Ignore: The user data of the (de)serializer is the registered D delegate (use the delegate context instead)
//!set class[ContentDeserializer].method[get_user_data][ignore] 1
//!set class[ContentSerializer].method[get_user_data][ignore] 1

//# Ignore: Output data arrays with length computed from stride and height, use TextureDownloader.downloadBytes
//!set class[Texture].method[download][ignore] 1
//!set record[TextureDownloader].method[download_into][ignore] 1

//# Arg should be inout caller-allocates GValue, not out
//!set class[ContentProvider].method[get_value].parameters.parameter[value][direction] inout
//# The virtual method gets the caller initialized GValue to set (in place), so that D overrides can set it
//!set class[ContentProvider].virtual-method[get_value].parameters.parameter[value][direction] in

//!class global pre

import gid.gdk4.content_deserializer;
import gid.gdk4.content_serializer;

private extern(C) void _contentSerializeCallback(GdkContentSerializer* serializer) nothrow
{
  gidAttachThread();
  auto _dlg = cast(gid.gdk4.types.ContentSerializeFunc*)gdk_content_serializer_get_user_data(serializer);

  try
  {
    (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_serializer.ContentSerializer)(cast(void*)serializer, No.Take));
  }
  catch (Exception e)
  {
    gidInvokeCallbackExceptionHandler(e, "gid.gdk4.types.ContentSerializeFunc");
  }
}

private extern(C) void _contentDeserializeCallback(GdkContentDeserializer* deserializer) nothrow
{
  gidAttachThread();
  auto _dlg = cast(gid.gdk4.types.ContentDeserializeFunc*)gdk_content_deserializer_get_user_data(deserializer);

  try
  {
    (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_deserializer.ContentDeserializer)(cast(void*)deserializer, No.Take));
  }
  catch (Exception e)
  {
    gidInvokeCallbackExceptionHandler(e, "gid.gdk4.types.ContentDeserializeFunc");
  }
}

/**
    Registers a function to serialize objects of a given type.
    The delegate is called with the [gid.gdk4.content_serializer.ContentSerializer] of the operation, it must call
    [gid.gdk4.content_serializer.ContentSerializer.returnSuccess] or
    [gid.gdk4.content_serializer.ContentSerializer.returnError] when done (possibly asynchronously). The registration is
    permanent, the delegate is kept alive for the lifetime of the process.
    Params:
      type = the type of objects that the function can serialize
      mimeType = the mime type to serialize to
      serialize = the delegate to call to serialize
*/
void contentRegisterSerializer(gid.gobject2.types.GType type, string mimeType, gid.gdk4.types.ContentSerializeFunc serialize) nothrow
{
  import gid.glib2.c.functions : g_log;
  import gid.glib2.c.types : GLogLevelFlags;

  if (!mimeType || !serialize)
  {
    g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gdk4.global.contentRegisterSerializer: assertion 'mimeType && serialize' failed");
    return;
  }

  const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
  auto _serialize = freezeDelegate(cast(void*)&serialize);
  gdk_content_register_serializer(type, _mimeType, &_contentSerializeCallback, _serialize, &thawDelegate);
}

/**
    Registers a function to deserialize object of a given type.
    The delegate is called with the [gid.gdk4.content_deserializer.ContentDeserializer] of the operation, it must set the
    value ([gid.gdk4.content_deserializer.ContentDeserializer.setValue]) and call
    [gid.gdk4.content_deserializer.ContentDeserializer.returnSuccess] or
    [gid.gdk4.content_deserializer.ContentDeserializer.returnError] when done (possibly asynchronously). The registration
    is permanent, the delegate is kept alive for the lifetime of the process.
    Params:
      mimeType = the mime type which the function can deserialize from
      type = the type of objects that the function creates
      deserialize = the delegate to call to deserialize
*/
void contentRegisterDeserializer(string mimeType, gid.gobject2.types.GType type, gid.gdk4.types.ContentDeserializeFunc deserialize) nothrow
{
  import gid.glib2.c.functions : g_log;
  import gid.glib2.c.types : GLogLevelFlags;

  if (!mimeType || !deserialize)
  {
    g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gdk4.global.contentRegisterDeserializer: assertion 'mimeType && deserialize' failed");
    return;
  }

  const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
  auto _deserialize = freezeDelegate(cast(void*)&deserialize);
  gdk_content_register_deserializer(_mimeType, type, &_contentDeserializeCallback, _deserialize, &thawDelegate);
}
//!class ContentDeserializer

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
