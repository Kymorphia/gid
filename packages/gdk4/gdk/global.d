/// Global functions for gdk4 library
module gdk.global;

import cairo.context;
import cairo.region;
import cairo.surface;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.rectangle;
import gdk.rgba;
import gdk.surface;
import gdk.texture;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.input_stream;
import gio.output_stream;
import gio.types;
import glib.error;
import gobject.object;
import gobject.types;
import gobject.value;


/**
    The main way to not draw GL content in GTK.
    
    It takes a render buffer ID (source_type == GL_RENDERBUFFER) or a texture
    id (source_type == GL_TEXTURE) and draws it onto cr with an OVER operation,
    respecting the current clip. The top left corner of the rectangle specified
    by `x`, `y`, width and height will be drawn at the current (0,0) position of
    the [cairo.context.Context].
    
    This will work for *all* [cairo.context.Context], as long as surface is realized, but the
    fallback implementation that reads back the pixels from the buffer may be
    used in the general case. In the case of direct drawing to a surface with
    no special effects applied to cr it will however use a more efficient
    approach.
    
    For GL_RENDERBUFFER the code will always fall back to software for buffers
    with alpha components, so make sure you use GL_TEXTURE if using alpha.
    
    Calling this may change the current GL context.

    Params:
      cr = a cairo context
      surface = The surface we're rendering for (not necessarily into)
      source = The GL ID of the source buffer
      sourceType = The type of the source
      bufferScale = The scale-factor that the source buffer is allocated for
      x = The source x position in source to start copying from in GL coordinates
      y = The source y position in source to start copying from in GL coordinates
      width = The width of the region to draw
      height = The height of the region to draw

    Deprecated: The function is overly complex and produces broken output
        in various combinations of arguments. If you want to draw with GL textures
        in GTK, use [gdk.gltexture.GLTexture.new_]; if you want to use that texture in
        Cairo, use [gdk.texture.Texture.download] to download the data into a Cairo
        image surface.
*/
void cairoDrawFromGl(cairo.context.Context cr, gdk.surface.Surface surface, int source, int sourceType, int bufferScale, int x, int y, int width, int height)
{
  gdk_cairo_draw_from_gl(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, source, sourceType, bufferScale, x, y, width, height);
}

/**
    Adds the given rectangle to the current path of cr.

    Params:
      cr = a cairo context
      rectangle = a [gtk.types.Rectangle]
*/
void cairoRectangle(cairo.context.Context cr, gdk.rectangle.Rectangle rectangle)
{
  gdk_cairo_rectangle(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&rectangle);
}

/**
    Adds the given region to the current path of cr.

    Params:
      cr = a cairo context
      region = a [cairo.region.Region]
*/
void cairoRegion(cairo.context.Context cr, cairo.region.Region region)
{
  gdk_cairo_region(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
}

/**
    Creates region that covers the area where the given
    surface is more than 50% opaque.
    
    This function takes into account device offsets that might be
    set with [cairo.surface.Surface.setDeviceOffset].

    Params:
      surface = a cairo surface
    Returns: A [cairo.region.Region]
*/
cairo.region.Region cairoRegionCreateFromSurface(cairo.surface.Surface surface)
{
  cairo_region_t* _cretval;
  _cretval = gdk_cairo_region_create_from_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Sets the given pixbuf as the source pattern for cr.
    
    The pattern has an extend mode of [cairo.types.Extend.None] and is aligned
    so that the origin of pixbuf is pixbuf_x, pixbuf_y.

    Params:
      cr = a cairo context
      pixbuf = a [gdkpixbuf.pixbuf.Pixbuf]
      pixbufX = X coordinate of location to place upper left corner of pixbuf
      pixbufY = Y coordinate of location to place upper left corner of pixbuf
*/
void cairoSetSourcePixbuf(cairo.context.Context cr, gdkpixbuf.pixbuf.Pixbuf pixbuf, double pixbufX, double pixbufY)
{
  gdk_cairo_set_source_pixbuf(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, pixbuf ? cast(const(GdkPixbuf)*)pixbuf._cPtr(No.Dup) : null, pixbufX, pixbufY);
}

/**
    Sets the specified [gdk.rgba.RGBA] as the source color of cr.

    Params:
      cr = a cairo context
      rgba = a [gdk.rgba.RGBA]
*/
void cairoSetSourceRgba(cairo.context.Context cr, gdk.rgba.RGBA rgba)
{
  gdk_cairo_set_source_rgba(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(const(GdkRGBA)*)&rgba);
}

/**
    Read content from the given input stream and deserialize it, asynchronously.
    
    The default I/O priority is `G_PRIORITY_DEFAULT` (i.e. 0), and lower numbers
    indicate a higher priority.
    
    When the operation is finished, callback will be called. You must then
    call `funcGdk.content_deserialize_finish` to get the result of the operation.

    Params:
      stream = a [gio.input_stream.InputStream] to read the serialized content from
      mimeType = the mime type to deserialize from
      type = the GType to deserialize from
      ioPriority = the I/O priority of the operation
      cancellable = optional [gio.cancellable.Cancellable] object
      callback = callback to call when the operation is done
*/
void contentDeserializeAsync(gio.input_stream.InputStream stream, string mimeType, gobject.types.GType type, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
  gdk_content_deserialize_async(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, _mimeType, type, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Finishes a content deserialization operation.

    Params:
      result = the [gio.async_result.AsyncResult]
      value = return location for the result of the operation
    Returns: true if the operation was successful. In this case,
        value is set. false if an error occurred. In this case,
        error is set
    Throws: [ErrorWrap]
*/
bool contentDeserializeFinish(gio.async_result.AsyncResult result, out gobject.value.Value value)
{
  bool _retval;
  GValue _value;
  GError *_err;
  _retval = cast(bool)gdk_content_deserialize_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_value, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  value = new gobject.value.Value(cast(void*)&_value, No.Take);
  return _retval;
}

/**
    Serialize content and write it to the given output stream, asynchronously.
    
    The default I/O priority is `G_PRIORITY_DEFAULT` (i.e. 0), and lower numbers
    indicate a higher priority.
    
    When the operation is finished, callback will be called. You must then
    call `funcGdk.content_serialize_finish` to get the result of the operation.

    Params:
      stream = a [gio.output_stream.OutputStream] to write the serialized content to
      mimeType = the mime type to serialize to
      value = the content to serialize
      ioPriority = the I/O priority of the operation
      cancellable = optional [gio.cancellable.Cancellable] object
      callback = callback to call when the operation is done
*/
void contentSerializeAsync(gio.output_stream.OutputStream stream, string mimeType, gobject.value.Value value, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
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
  gdk_content_serialize_async(stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, _mimeType, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Finishes a content serialization operation.

    Params:
      result = the [gio.async_result.AsyncResult]
    Returns: true if the operation was successful, false if an
        error occurred. In this case, error is set
    Throws: [ErrorWrap]
*/
bool contentSerializeFinish(gio.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)gdk_content_serialize_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/** */
gobject.types.GType dragSurfaceSizeGetType()
{
  gobject.types.GType _retval;
  _retval = gdk_drag_surface_size_get_type();
  return _retval;
}

/**
    Returns the relative angle from event1 to event2.
    
    The relative angle is the angle between the X axis and the line
    through both events' positions. The rotation direction for positive
    angles is from the positive X axis towards the positive Y axis.
    
    This assumes that both events have X/Y information.
    If not, this function returns false.

    Params:
      event1 = first [gdk.event.Event]
      event2 = second [gdk.event.Event]
      angle = return location for the relative angle between both events
    Returns: true if the angle could be calculated.
*/
bool eventsGetAngle(gdk.event.Event event1, gdk.event.Event event2, out double angle)
{
  bool _retval;
  _retval = cast(bool)gdk_events_get_angle(event1 ? cast(GdkEvent*)event1._cPtr(No.Dup) : null, event2 ? cast(GdkEvent*)event2._cPtr(No.Dup) : null, cast(double*)&angle);
  return _retval;
}

/**
    Returns the point halfway between the events' positions.
    
    This assumes that both events have X/Y information.
    If not, this function returns false.

    Params:
      event1 = first [gdk.event.Event]
      event2 = second [gdk.event.Event]
      x = return location for the X coordinate of the center
      y = return location for the Y coordinate of the center
    Returns: true if the center could be calculated.
*/
bool eventsGetCenter(gdk.event.Event event1, gdk.event.Event event2, out double x, out double y)
{
  bool _retval;
  _retval = cast(bool)gdk_events_get_center(event1 ? cast(GdkEvent*)event1._cPtr(No.Dup) : null, event2 ? cast(GdkEvent*)event2._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
  return _retval;
}

/**
    Returns the distance between the event locations.
    
    This assumes that both events have X/Y information.
    If not, this function returns false.

    Params:
      event1 = first [gdk.event.Event]
      event2 = second [gdk.event.Event]
      distance = return location for the distance
    Returns: true if the distance could be calculated.
*/
bool eventsGetDistance(gdk.event.Event event1, gdk.event.Event event2, out double distance)
{
  bool _retval;
  _retval = cast(bool)gdk_events_get_distance(event1 ? cast(GdkEvent*)event1._cPtr(No.Dup) : null, event2 ? cast(GdkEvent*)event2._cPtr(No.Dup) : null, cast(double*)&distance);
  return _retval;
}

/**
    Canonicalizes the given mime type and interns the result.
    
    If string is not a valid mime type, null is returned instead.
    See RFC 2048 for the syntax if mime types.

    Params:
      string_ = string of a potential mime type
    Returns: An interned string for the canonicalized
        mime type or null if the string wasn't a valid mime type
*/
string internMimeType(string string_)
{
  const(char)* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = gdk_intern_mime_type(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Obtains the upper- and lower-case versions of the keyval symbol.
    
    Examples of keyvals are `GDK_KEY_a`, `GDK_KEY_Enter`, `GDK_KEY_F1`, etc.

    Params:
      symbol = a keyval
      lower = return location for lowercase version of symbol
      upper = return location for uppercase version of symbol
*/
void keyvalConvertCase(uint symbol, out uint lower, out uint upper)
{
  gdk_keyval_convert_case(symbol, cast(uint*)&lower, cast(uint*)&upper);
}

/**
    Converts a key name to a key value.
    
    The names are the same as those in the
    `gdk/gdkkeysyms.h` header file
    but without the leading “GDK_KEY_”.

    Params:
      keyvalName = a key name
    Returns: the corresponding key value, or `GDK_KEY_VoidSymbol`
        if the key name is not a valid key
*/
uint keyvalFromName(string keyvalName)
{
  uint _retval;
  const(char)* _keyvalName = keyvalName.toCString(No.Alloc);
  _retval = gdk_keyval_from_name(_keyvalName);
  return _retval;
}

/**
    Returns true if the given key value is in lower case.

    Params:
      keyval = a key value.
    Returns: true if keyval is in lower case, or if keyval is not
        subject to case conversion.
*/
bool keyvalIsLower(uint keyval)
{
  bool _retval;
  _retval = cast(bool)gdk_keyval_is_lower(keyval);
  return _retval;
}

/**
    Returns true if the given key value is in upper case.

    Params:
      keyval = a key value.
    Returns: true if keyval is in upper case, or if keyval is not subject to
       case conversion.
*/
bool keyvalIsUpper(uint keyval)
{
  bool _retval;
  _retval = cast(bool)gdk_keyval_is_upper(keyval);
  return _retval;
}

/**
    Converts a key value into a symbolic name.
    
    The names are the same as those in the
    `gdk/gdkkeysyms.h` header file
    but without the leading “GDK_KEY_”.

    Params:
      keyval = a key value
    Returns: a string containing the name
        of the key
*/
string keyvalName(uint keyval)
{
  const(char)* _cretval;
  _cretval = gdk_keyval_name(keyval);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts a key value to lower case, if applicable.

    Params:
      keyval = a key value.
    Returns: the lower case form of keyval, or keyval itself if it is already
       in lower case or it is not subject to case conversion.
*/
uint keyvalToLower(uint keyval)
{
  uint _retval;
  _retval = gdk_keyval_to_lower(keyval);
  return _retval;
}

/**
    Convert from a GDK key symbol to the corresponding Unicode
    character.
    
    Note that the conversion does not take the current locale
    into consideration, which might be expected for particular
    keyvals, such as `GDK_KEY_KP_Decimal`.

    Params:
      keyval = a GDK key symbol
    Returns: the corresponding unicode character, or 0 if there
        is no corresponding character.
*/
uint keyvalToUnicode(uint keyval)
{
  uint _retval;
  _retval = gdk_keyval_to_unicode(keyval);
  return _retval;
}

/**
    Converts a key value to upper case, if applicable.

    Params:
      keyval = a key value.
    Returns: the upper case form of keyval, or keyval itself if it is already
        in upper case or it is not subject to case conversion.
*/
uint keyvalToUpper(uint keyval)
{
  uint _retval;
  _retval = gdk_keyval_to_upper(keyval);
  return _retval;
}

/**
    Transfers image data from a [cairo.surface.Surface] and converts it
    to a [gdkpixbuf.pixbuf.Pixbuf].
    
    This allows you to efficiently read individual pixels from cairo surfaces.
    
    This function will create an RGB pixbuf with 8 bits per channel.
    The pixbuf will contain an alpha channel if the surface contains one.

    Params:
      surface = surface to copy from
      srcX = Source X coordinate within surface
      srcY = Source Y coordinate within surface
      width = Width in pixels of region to get
      height = Height in pixels of region to get
    Returns: A newly-created pixbuf with a
        reference count of 1

    Deprecated: Use [gdk.texture.Texture] and subclasses instead
        cairo surfaces and pixbufs
*/
gdkpixbuf.pixbuf.Pixbuf pixbufGetFromSurface(cairo.surface.Surface surface, int srcX, int srcY, int width, int height)
{
  GdkPixbuf* _cretval;
  _cretval = gdk_pixbuf_get_from_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, srcX, srcY, width, height);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a new pixbuf from texture.
    
    This should generally not be used in newly written code as later
    stages will almost certainly convert the pixbuf back into a texture
    to draw it on screen.

    Params:
      texture = a [gdk.texture.Texture]
    Returns: a new [gdkpixbuf.pixbuf.Pixbuf]

    Deprecated: Use [gdk.texture.Texture] and subclasses instead
        cairo surfaces and pixbufs
*/
gdkpixbuf.pixbuf.Pixbuf pixbufGetFromTexture(gdk.texture.Texture texture)
{
  GdkPixbuf* _cretval;
  _cretval = gdk_pixbuf_get_from_texture(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
  return _retval;
}

/**
    Sets a list of backends that GDK should try to use.
    
    This can be useful if your application does not
    work with certain GDK backends.
    
    By default, GDK tries all included backends.
    
    For example:
    
    ```c
    gdk_set_allowed_backends ("wayland,macos,*");
    ```
    
    instructs GDK to try the Wayland backend first, followed by the
    MacOs backend, and then all others.
    
    If the `GDK_BACKEND` environment variable is set, it determines
    what backends are tried in what order, while still respecting the
    set of allowed backends that are specified by this function.
    
    The possible backend names are:
    
      $(LIST
          * `broadway`
          * `macos`
          * `wayland`.
          * `win32`
          * `x11`
      )
        
    You can also include a `*` in the list to try all remaining backends.
    
    This call must happen prior to functions that open a display, such
    as [gdk.display.Display.open], `[gtk.global.init_]`, or `[gtk.global.initCheck]`
    in order to take effect.

    Params:
      backends = a comma-separated list of backends
*/
void setAllowedBackends(string backends)
{
  const(char)* _backends = backends.toCString(No.Alloc);
  gdk_set_allowed_backends(_backends);
}

/** */
gobject.types.GType toplevelSizeGetType()
{
  gobject.types.GType _retval;
  _retval = gdk_toplevel_size_get_type();
  return _retval;
}

/**
    Convert from a Unicode character to a key symbol.

    Params:
      wc = a Unicode character
    Returns: the corresponding GDK key symbol, if one exists.
        or, if there is no corresponding symbol, wc | 0x01000000
*/
uint unicodeToKeyval(uint wc)
{
  uint _retval;
  _retval = gdk_unicode_to_keyval(wc);
  return _retval;
}
