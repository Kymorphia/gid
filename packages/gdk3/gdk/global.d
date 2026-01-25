/// Global functions for gdk3 library
module gdk.global;

import cairo.context;
import cairo.region;
import cairo.surface;
import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.color;
import gdk.cursor;
import gdk.display;
import gdk.drag_context;
import gdk.drawing_context;
import gdk.event;
import gdk.rectangle;
import gdk.rgba;
import gdk.screen;
import gdk.types;
import gdk.visual;
import gdk.window;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.option_group;
import glib.types;
import gobject.object;
import gobject.value;
import pango.context;


/**
    Appends gdk option entries to the passed in option group. This is
    not public API and must not be used by applications.

    Params:
      group = An option group.

    Deprecated: This symbol was never meant to be used outside
        of GTK+
*/
void addOptionEntriesLibgtkOnly(glib.option_group.OptionGroup group)
{
  gdk_add_option_entries_libgtk_only(group ? cast(GOptionGroup*)group._cPtr(No.Dup) : null);
}

/**
    Emits a short beep on the default display.
*/
void beep()
{
  gdk_beep();
}

/**
    Creates a Cairo context for drawing to window.
    
    Note that calling [cairo.context.Context.resetClip] on the resulting #cairo_t will
    produce undefined results, so avoid it at all costs.
    
    Typically, this function is used to draw on a #GdkWindow out of the paint
    cycle of the toolkit; this should be avoided, as it breaks various assumptions
    and optimizations.
    
    If you are drawing on a native #GdkWindow in response to a [gdk.types.EventType.Expose] event
    you should use [gdk.window.Window.beginDrawFrame] and [gdk.drawing_context.DrawingContext.getCairoContext]
    instead. GTK will automatically do this for you when drawing a widget.

    Params:
      window = a #GdkWindow
    Returns: A newly created Cairo context. Free with
       [cairo.global.destroy] when you are done drawing.

    Deprecated: Use [gdk.window.Window.beginDrawFrame] and
        [gdk.drawing_context.DrawingContext.getCairoContext] instead
*/
cairo.context.Context cairoCreate(gdk.window.Window window)
{
  cairo_t* _cretval;
  _cretval = gdk_cairo_create(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.context.Context(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    This is the main way to draw GL content in GTK+. It takes a render buffer ID
    (source_type == #GL_RENDERBUFFER) or a texture id (source_type == #GL_TEXTURE)
    and draws it onto cr with an OVER operation, respecting the current clip.
    The top left corner of the rectangle specified by `x`, `y`, width and height
    will be drawn at the current (0,0) position of the cairo_t.
    
    This will work for *all* cairo_t, as long as window is realized, but the
    fallback implementation that reads back the pixels from the buffer may be
    used in the general case. In the case of direct drawing to a window with
    no special effects applied to cr it will however use a more efficient
    approach.
    
    For #GL_RENDERBUFFER the code will always fall back to software for buffers
    with alpha components, so make sure you use #GL_TEXTURE if using alpha.
    
    Calling this may change the current GL context.

    Params:
      cr = a cairo context
      window = The window we're rendering for (not necessarily into)
      source = The GL ID of the source buffer
      sourceType = The type of the source
      bufferScale = The scale-factor that the source buffer is allocated for
      x = The source x position in source to start copying from in GL coordinates
      y = The source y position in source to start copying from in GL coordinates
      width = The width of the region to draw
      height = The height of the region to draw
*/
void cairoDrawFromGl(cairo.context.Context cr, gdk.window.Window window, int source, int sourceType, int bufferScale, int x, int y, int width, int height)
{
  gdk_cairo_draw_from_gl(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, source, sourceType, bufferScale, x, y, width, height);
}

/**
    This is a convenience function around [cairo.context.Context.clipExtents].
    It rounds the clip extents to integer coordinates and returns
    a boolean indicating if a clip area exists.

    Params:
      cr = a cairo context
      rect = return location for the clip, or null
    Returns: true if a clip rectangle exists, false if all of cr is
          clipped and all drawing can be skipped
*/
bool cairoGetClipRectangle(cairo.context.Context cr, out gdk.rectangle.Rectangle rect)
{
  bool _retval;
  _retval = cast(bool)gdk_cairo_get_clip_rectangle(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(GdkRectangle*)&rect);
  return _retval;
}

/**
    Retrieves the #GdkDrawingContext that created the Cairo
    context cr.

    Params:
      cr = a Cairo context
    Returns: a #GdkDrawingContext, if any is set
*/
gdk.drawing_context.DrawingContext cairoGetDrawingContext(cairo.context.Context cr)
{
  GdkDrawingContext* _cretval;
  _cretval = gdk_cairo_get_drawing_context(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drawing_context.DrawingContext)(cast(GdkDrawingContext*)_cretval, No.Take);
  return _retval;
}

/**
    Adds the given rectangle to the current path of cr.

    Params:
      cr = a cairo context
      rectangle = a #GdkRectangle
*/
void cairoRectangle(cairo.context.Context cr, gdk.rectangle.Rectangle rectangle)
{
  gdk_cairo_rectangle(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&rectangle);
}

/**
    Adds the given region to the current path of cr.

    Params:
      cr = a cairo context
      region = a #cairo_region_t
*/
void cairoRegion(cairo.context.Context cr, cairo.region.Region region)
{
  gdk_cairo_region(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
}

/**
    Creates region that describes covers the area where the given
    surface is more than 50% opaque.
    
    This function takes into account device offsets that might be
    set with [cairo.surface.Surface.setDeviceOffset].

    Params:
      surface = a cairo surface
    Returns: A #cairo_region_t; must be freed with [cairo.region.Region.destroy]
*/
cairo.region.Region cairoRegionCreateFromSurface(cairo.surface.Surface surface)
{
  cairo_region_t* _cretval;
  _cretval = gdk_cairo_region_create_from_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Sets the specified #GdkColor as the source color of cr.

    Params:
      cr = a cairo context
      color = a #GdkColor

    Deprecated: Use [gdk.global.cairoSetSourceRgba] instead
*/
void cairoSetSourceColor(cairo.context.Context cr, gdk.color.Color color)
{
  gdk_cairo_set_source_color(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(const(GdkColor)*)&color);
}

/**
    Sets the given pixbuf as the source pattern for cr.
    
    The pattern has an extend mode of [cairo.types.Extend.None] and is aligned
    so that the origin of pixbuf is pixbuf_x, pixbuf_y.

    Params:
      cr = a cairo context
      pixbuf = a #GdkPixbuf
      pixbufX = X coordinate of location to place upper left corner of pixbuf
      pixbufY = Y coordinate of location to place upper left corner of pixbuf
*/
void cairoSetSourcePixbuf(cairo.context.Context cr, gdkpixbuf.pixbuf.Pixbuf pixbuf, double pixbufX, double pixbufY)
{
  gdk_cairo_set_source_pixbuf(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, pixbuf ? cast(const(GdkPixbuf)*)pixbuf._cPtr(No.Dup) : null, pixbufX, pixbufY);
}

/**
    Sets the specified #GdkRGBA as the source color of cr.

    Params:
      cr = a cairo context
      rgba = a #GdkRGBA
*/
void cairoSetSourceRgba(cairo.context.Context cr, gdk.rgba.RGBA rgba)
{
  gdk_cairo_set_source_rgba(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, cast(const(GdkRGBA)*)&rgba);
}

/**
    Sets the given window as the source pattern for cr.
    
    The pattern has an extend mode of [cairo.types.Extend.None] and is aligned
    so that the origin of window is `x`, `y`. The window contains all its
    subwindows when rendering.
    
    Note that the contents of window are undefined outside of the
    visible part of window, so use this function with care.

    Params:
      cr = a cairo context
      window = a #GdkWindow
      x = X coordinate of location to place upper left corner of window
      y = Y coordinate of location to place upper left corner of window
*/
void cairoSetSourceWindow(cairo.context.Context cr, gdk.window.Window window, double x, double y)
{
  gdk_cairo_set_source_window(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, x, y);
}

/**
    Creates an image surface with the same contents as
    the pixbuf.

    Params:
      pixbuf = a #GdkPixbuf
      scale = the scale of the new surface, or 0 to use same as window
      forWindow = The window this will be drawn to, or null
    Returns: a new cairo surface, must be freed with [cairo.surface.Surface.destroy]
*/
cairo.surface.Surface cairoSurfaceCreateFromPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf, int scale, gdk.window.Window forWindow = null)
{
  cairo_surface_t* _cretval;
  _cretval = gdk_cairo_surface_create_from_pixbuf(pixbuf ? cast(const(GdkPixbuf)*)pixbuf._cPtr(No.Dup) : null, scale, forWindow ? cast(GdkWindow*)forWindow._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Disables multidevice support in GDK. This call must happen prior
    to [gdk.display.Display.open], [gtk.global.init_], [gtk.global.initWithArgs] or
    [gtk.global.initCheck] in order to take effect.
    
    Most common GTK+ applications won’t ever need to call this. Only
    applications that do mixed GDK/Xlib calls could want to disable
    multidevice support if such Xlib code deals with input devices in
    any way and doesn’t observe the presence of XInput 2.
*/
void disableMultidevice()
{
  gdk_disable_multidevice();
}

/**
    Aborts a drag without dropping.
    
    This function is called by the drag source.
    
    This function does not need to be called in managed drag and drop
    operations. See [gdk.drag_context.DragContext.manageDnd] for more information.

    Params:
      context = a #GdkDragContext
      time = the timestamp for this operation
*/
void dragAbort(gdk.drag_context.DragContext context, uint time)
{
  gdk_drag_abort(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, time);
}

/**
    Drops on the current destination.
    
    This function is called by the drag source.
    
    This function does not need to be called in managed drag and drop
    operations. See [gdk.drag_context.DragContext.manageDnd] for more information.

    Params:
      context = a #GdkDragContext
      time = the timestamp for this operation
*/
void dragDrop(gdk.drag_context.DragContext context, uint time)
{
  gdk_drag_drop(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, time);
}

/**
    Inform GDK if the drop ended successfully. Passing false
    for success may trigger a drag cancellation animation.
    
    This function is called by the drag source, and should
    be the last call before dropping the reference to the
    context.
    
    The #GdkDragContext will only take the first [gdk.drag.Drag.dropDone]
    call as effective, if this function is called multiple times,
    all subsequent calls will be ignored.

    Params:
      context = a #GdkDragContext
      success = whether the drag was ultimatively successful
*/
void dragDropDone(gdk.drag_context.DragContext context, bool success)
{
  gdk_drag_drop_done(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, success);
}

/**
    Returns whether the dropped data has been successfully
    transferred. This function is intended to be used while
    handling a [gdk.types.EventType.DropFinished] event, its return value is
    meaningless at other times.

    Params:
      context = a #GdkDragContext
    Returns: true if the drop was successful.
*/
bool dragDropSucceeded(gdk.drag_context.DragContext context)
{
  bool _retval;
  _retval = cast(bool)gdk_drag_drop_succeeded(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Finds the destination window and DND protocol to use at the
    given pointer position.
    
    This function is called by the drag source to obtain the
    dest_window and protocol parameters for [gdk.global.dragMotion].

    Params:
      context = a #GdkDragContext
      dragWindow = a window which may be at the pointer position, but
            should be ignored, since it is put up by the drag source as an icon
      screen = the screen where the destination window is sought
      xRoot = the x position of the pointer in root coordinates
      yRoot = the y position of the pointer in root coordinates
      destWindow = location to store the destination window in
      protocol = location to store the DND protocol in
*/
void dragFindWindowForScreen(gdk.drag_context.DragContext context, gdk.window.Window dragWindow, gdk.screen.Screen screen, int xRoot, int yRoot, out gdk.window.Window destWindow, out gdk.types.DragProtocol protocol)
{
  GdkWindow* _destWindow;
  gdk_drag_find_window_for_screen(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, dragWindow ? cast(GdkWindow*)dragWindow._cPtr(No.Dup) : null, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, xRoot, yRoot, &_destWindow, &protocol);
  destWindow = new gdk.window.Window(cast(void*)_destWindow, Yes.Take);
}

/**
    Returns the selection atom for the current source window.

    Params:
      context = a #GdkDragContext.
    Returns: the selection atom, or `GDK_NONE`
*/
gdk.atom.Atom dragGetSelection(gdk.drag_context.DragContext context)
{
  GdkAtom _cretval;
  _cretval = gdk_drag_get_selection(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
  return _retval;
}

/**
    Updates the drag context when the pointer moves or the
    set of actions changes.
    
    This function is called by the drag source.
    
    This function does not need to be called in managed drag and drop
    operations. See [gdk.drag_context.DragContext.manageDnd] for more information.

    Params:
      context = a #GdkDragContext
      destWindow = the new destination window, obtained by
            gdk_drag_find_window()
      protocol = the DND protocol in use, obtained by gdk_drag_find_window()
      xRoot = the x position of the pointer in root coordinates
      yRoot = the y position of the pointer in root coordinates
      suggestedAction = the suggested action
      possibleActions = the possible actions
      time = the timestamp for this operation
    Returns: 
*/
bool dragMotion(gdk.drag_context.DragContext context, gdk.window.Window destWindow, gdk.types.DragProtocol protocol, int xRoot, int yRoot, gdk.types.DragAction suggestedAction, gdk.types.DragAction possibleActions, uint time)
{
  bool _retval;
  _retval = cast(bool)gdk_drag_motion(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, destWindow ? cast(GdkWindow*)destWindow._cPtr(No.Dup) : null, protocol, xRoot, yRoot, suggestedAction, possibleActions, time);
  return _retval;
}

/**
    Selects one of the actions offered by the drag source.
    
    This function is called by the drag destination in response to
    [gdk.global.dragMotion] called by the drag source.

    Params:
      context = a #GdkDragContext
      action = the selected action which will be taken when a drop happens,
           or 0 to indicate that a drop will not be accepted
      time = the timestamp for this operation
*/
void dragStatus(gdk.drag_context.DragContext context, gdk.types.DragAction action, uint time)
{
  gdk_drag_status(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, action, time);
}

/**
    Ends the drag operation after a drop.
    
    This function is called by the drag destination.

    Params:
      context = a #GdkDragContext
      success = true if the data was successfully received
      time = the timestamp for this operation
*/
void dropFinish(gdk.drag_context.DragContext context, bool success, uint time)
{
  gdk_drop_finish(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, success, time);
}

/**
    Accepts or rejects a drop.
    
    This function is called by the drag destination in response
    to a drop initiated by the drag source.

    Params:
      context = a #GdkDragContext
      accepted = true if the drop is accepted
      time = the timestamp for this operation
*/
void dropReply(gdk.drag_context.DragContext context, bool accepted, uint time)
{
  gdk_drop_reply(context ? cast(GdkDragContext*)context._cPtr(No.Dup) : null, accepted, time);
}

/**
    Removes an error trap pushed with [gdk.global.errorTrapPush].
    May block until an error has been definitively received
    or not received from the X server. [gdk.global.errorTrapPopIgnored]
    is preferred if you don’t need to know whether an error
    occurred, because it never has to block. If you don't
    need the return value of [gdk.global.errorTrapPop], use
    [gdk.global.errorTrapPopIgnored].
    
    Prior to GDK 3.0, this function would not automatically
    sync for you, so you had to [gdk.global.flush] if your last
    call to Xlib was not a blocking round trip.
    Returns: X error code or 0 on success
*/
int errorTrapPop()
{
  int _retval;
  _retval = gdk_error_trap_pop();
  return _retval;
}

/**
    Removes an error trap pushed with [gdk.global.errorTrapPush], but
    without bothering to wait and see whether an error occurred.  If an
    error arrives later asynchronously that was triggered while the
    trap was pushed, that error will be ignored.
*/
void errorTrapPopIgnored()
{
  gdk_error_trap_pop_ignored();
}

/**
    This function allows X errors to be trapped instead of the normal
    behavior of exiting the application. It should only be used if it
    is not possible to avoid the X error in any other way. Errors are
    ignored on all #GdkDisplay currently known to the
    #GdkDisplayManager. If you don’t care which error happens and just
    want to ignore everything, pop with [gdk.global.errorTrapPopIgnored].
    If you need the error code, use [gdk.global.errorTrapPop] which may have
    to block and wait for the error to arrive from the X server.
    
    This API exists on all platforms but only does anything on X.
    
    You can use gdk_x11_display_error_trap_push() to ignore errors
    on only a single display.
    
    ## Trapping an X error
    
    ```c
    gdk_error_trap_push ();
    
     // ... Call the X function which may cause an error here ...
    
    
    if (gdk_error_trap_pop ())
     {
       // ... Handle the error here ...
     }
    ```
*/
void errorTrapPush()
{
  gdk_error_trap_push();
}

/**
    If both events contain X/Y information, this function will return true
    and return in angle the relative angle from event1 to event2. The rotation
    direction for positive angles is from the positive X axis towards the positive
    Y axis.

    Params:
      event1 = first #GdkEvent
      event2 = second #GdkEvent
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
    If both events contain X/Y information, the center of both coordinates
    will be returned in `x` and `y`.

    Params:
      event1 = first #GdkEvent
      event2 = second #GdkEvent
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
    If both events have X/Y information, the distance between both coordinates
    (as in a straight line going from event1 to event2) will be returned.

    Params:
      event1 = first #GdkEvent
      event2 = second #GdkEvent
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
    Checks if any events are ready to be processed for any display.
    Returns: true if any events are pending.
*/
bool eventsPending()
{
  bool _retval;
  _retval = cast(bool)gdk_events_pending();
  return _retval;
}

/**
    Flushes the output buffers of all display connections and waits
    until all requests have been processed.
    This is rarely needed by applications.
*/
void flush()
{
  gdk_flush();
}

/**
    Obtains the root window (parent all other windows are inside)
    for the default display and screen.
    Returns: the default root window
*/
gdk.window.Window getDefaultRootWindow()
{
  GdkWindow* _cretval;
  _cretval = gdk_get_default_root_window();
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
  return _retval;
}

/**
    Gets the name of the display, which usually comes from the
    `DISPLAY` environment variable or the
    `--display` command line option.
    Returns: the name of the display.

    Deprecated: Call gdk_display_get_name (gdk_display_get_default ()))
         instead.
*/
string getDisplay()
{
  char* _cretval;
  _cretval = gdk_get_display();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the display name specified in the command line arguments passed
    to [gdk.global.init_] or [gdk.global.parseArgs], if any.
    Returns: the display name, if specified explicitly,
        otherwise null this string is owned by GTK+ and must not be
        modified or freed.
*/
string getDisplayArgName()
{
  const(char)* _cretval;
  _cretval = gdk_get_display_arg_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the program class. Unless the program class has explicitly
    been set with [gdk.global.setProgramClass] or with the `--class`
    commandline option, the default value is the program name (determined
    with [glib.global.getPrgname]) with the first character converted to uppercase.
    Returns: the program class.
*/
string getProgramClass()
{
  const(char)* _cretval;
  _cretval = gdk_get_program_class();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets whether event debugging output is enabled.
    Returns: true if event debugging output is enabled.
*/
bool getShowEvents()
{
  bool _retval;
  _retval = cast(bool)gdk_get_show_events();
  return _retval;
}

/**
    Grabs the keyboard so that all events are passed to this
    application until the keyboard is ungrabbed with [gdk.global.keyboardUngrab].
    This overrides any previous keyboard grab by this client.
    
    If you set up anything at the time you take the grab that needs to be cleaned
    up when the grab ends, you should handle the #GdkEventGrabBroken events that
    are emitted when the grab ends unvoluntarily.

    Params:
      window = the #GdkWindow which will own the grab (the grab window).
      ownerEvents = if false then all keyboard events are reported with respect to
          window. If true then keyboard events for this application are
          reported as normal, but keyboard events outside this application
          are reported with respect to window. Both key press and key
          release events are always reported, independant of the event mask
          set by the application.
      time = a timestamp from a #GdkEvent, or [gdk.types.CURRENT_TIME] if no timestamp is
          available.
    Returns: [gdk.types.GrabStatus.Success] if the grab was successful.

    Deprecated: Use [gdk.device.Device.grab] instead.
*/
gdk.types.GrabStatus keyboardGrab(gdk.window.Window window, bool ownerEvents, uint time)
{
  GdkGrabStatus _cretval;
  _cretval = gdk_keyboard_grab(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, ownerEvents, time);
  gdk.types.GrabStatus _retval = cast(gdk.types.GrabStatus)_cretval;
  return _retval;
}

/**
    Ungrabs the keyboard on the default display, if it is grabbed by this
    application.

    Params:
      time = a timestamp from a #GdkEvent, or [gdk.types.CURRENT_TIME] if no
               timestamp is available.

    Deprecated: Use [gdk.device.Device.ungrab], together with [gdk.device.Device.grab]
                  instead.
*/
void keyboardUngrab(uint time)
{
  gdk_keyboard_ungrab(time);
}

/**
    Obtains the upper- and lower-case versions of the keyval symbol.
    Examples of keyvals are #GDK_KEY_a, #GDK_KEY_Enter, #GDK_KEY_F1, etc.

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
    Returns: the corresponding key value, or [gdk.types.KEY_VoidSymbol]
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
          of the key, or null if keyval is not a valid key. The string
          should not be modified.
*/
string keyvalName(uint keyval)
{
  char* _cretval;
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
    Convert from a GDK key symbol to the corresponding ISO10646 (Unicode)
    character.

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
    Lists the available visuals for the default screen.
    (See [gdk.screen.Screen.listVisuals])
    A visual describes a hardware image data format.
    For example, a visual might support 24-bit color, or 8-bit color,
    and might expect pixels to be in a certain format.
    
    Call [glib.list.List.free] on the return value when you’re finished with it.
    Returns: a list of visuals; the list must be freed, but not its contents

    Deprecated: Use gdk_screen_list_visuals (gdk_screen_get_default ()).
*/
gdk.visual.Visual[] listVisuals()
{
  GList* _cretval;
  _cretval = gdk_list_visuals();
  auto _retval = gListToD!(gdk.visual.Visual, GidOwnership.Container)(cast(GList*)_cretval);
  return _retval;
}

/**
    Indicates to the GUI environment that the application has finished
    loading. If the applications opens windows, this function is
    normally called after opening the application’s initial set of
    windows.
    
    GTK+ will call this function automatically after opening the first
    #GtkWindow unless [gtk.window.Window.setAutoStartupNotification] is called
    to disable that feature.
*/
void notifyStartupComplete()
{
  gdk_notify_startup_complete();
}

/**
    Indicates to the GUI environment that the application has
    finished loading, using a given identifier.
    
    GTK+ will call this function automatically for #GtkWindow
    with custom startup-notification identifier unless
    [gtk.window.Window.setAutoStartupNotification] is called to
    disable that feature.

    Params:
      startupId = a startup-notification identifier, for which
            notification process should be completed
*/
void notifyStartupCompleteWithId(string startupId)
{
  const(char)* _startupId = startupId.toCString(No.Alloc);
  gdk_notify_startup_complete_with_id(_startupId);
}

/**
    Gets the window that window is embedded in.

    Params:
      window = a #GdkWindow
    Returns: the embedding #GdkWindow, or
          null if window is not an mbedded offscreen window
*/
gdk.window.Window offscreenWindowGetEmbedder(gdk.window.Window window)
{
  GdkWindow* _cretval;
  _cretval = gdk_offscreen_window_get_embedder(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
  return _retval;
}

/**
    Gets the offscreen surface that an offscreen window renders into.
    If you need to keep this around over window resizes, you need to
    add a reference to it.

    Params:
      window = a #GdkWindow
    Returns: The offscreen surface, or
        null if not offscreen
*/
cairo.surface.Surface offscreenWindowGetSurface(gdk.window.Window window)
{
  cairo_surface_t* _cretval;
  _cretval = gdk_offscreen_window_get_surface(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Sets window to be embedded in embedder.
    
    To fully embed an offscreen window, in addition to calling this
    function, it is also necessary to handle the #GdkWindow::pick-embedded-child
    signal on the embedder and the #GdkWindow::to-embedder and
    #GdkWindow::from-embedder signals on window.

    Params:
      window = a #GdkWindow
      embedder = the #GdkWindow that window gets embedded in
*/
void offscreenWindowSetEmbedder(gdk.window.Window window, gdk.window.Window embedder)
{
  gdk_offscreen_window_set_embedder(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, embedder ? cast(GdkWindow*)embedder._cPtr(No.Dup) : null);
}

/**
    Creates a #PangoContext for the default GDK screen.
    
    The context must be freed when you’re finished with it.
    
    When using GTK+, normally you should use [gtk.widget.Widget.getPangoContext]
    instead of this function, to get the appropriate context for
    the widget you intend to render text onto.
    
    The newly created context will have the default font options (see
    #cairo_font_options_t) for the default screen; if these options
    change it will not be updated. Using [gtk.widget.Widget.getPangoContext]
    is more convenient if you want to keep a context around and track
    changes to the screen’s font rendering settings.
    Returns: a new #PangoContext for the default display
*/
pango.context.Context pangoContextGet()
{
  PangoContext* _cretval;
  _cretval = gdk_pango_context_get();
  auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a #PangoContext for display.
    
    The context must be freed when you’re finished with it.
    
    When using GTK+, normally you should use [gtk.widget.Widget.getPangoContext]
    instead of this function, to get the appropriate context for
    the widget you intend to render text onto.
    
    The newly created context will have the default font options
    (see #cairo_font_options_t) for the display; if these options
    change it will not be updated. Using [gtk.widget.Widget.getPangoContext]
    is more convenient if you want to keep a context around and track
    changes to the font rendering settings.

    Params:
      display = the #GdkDisplay for which the context is to be created
    Returns: a new #PangoContext for display
*/
pango.context.Context pangoContextGetForDisplay(gdk.display.Display display)
{
  PangoContext* _cretval;
  _cretval = gdk_pango_context_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a #PangoContext for screen.
    
    The context must be freed when you’re finished with it.
    
    When using GTK+, normally you should use [gtk.widget.Widget.getPangoContext]
    instead of this function, to get the appropriate context for
    the widget you intend to render text onto.
    
    The newly created context will have the default font options
    (see #cairo_font_options_t) for the screen; if these options
    change it will not be updated. Using [gtk.widget.Widget.getPangoContext]
    is more convenient if you want to keep a context around and track
    changes to the screen’s font rendering settings.

    Params:
      screen = the #GdkScreen for which the context is to be created.
    Returns: a new #PangoContext for screen
*/
pango.context.Context pangoContextGetForScreen(gdk.screen.Screen screen)
{
  PangoContext* _cretval;
  _cretval = gdk_pango_context_get_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(pango.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
  return _retval;
}

/**
    Transfers image data from a #cairo_surface_t and converts it to an RGB(A)
    representation inside a #GdkPixbuf. This allows you to efficiently read
    individual pixels from cairo surfaces. For #GdkWindows, use
    [gdk.global.pixbufGetFromWindow] instead.
    
    This function will create an RGB pixbuf with 8 bits per channel.
    The pixbuf will contain an alpha channel if the surface contains one.

    Params:
      surface = surface to copy from
      srcX = Source X coordinate within surface
      srcY = Source Y coordinate within surface
      width = Width in pixels of region to get
      height = Height in pixels of region to get
    Returns: A newly-created pixbuf with a
          reference count of 1, or null on error
*/
gdkpixbuf.pixbuf.Pixbuf pixbufGetFromSurface(cairo.surface.Surface surface, int srcX, int srcY, int width, int height)
{
  GdkPixbuf* _cretval;
  _cretval = gdk_pixbuf_get_from_surface(surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, srcX, srcY, width, height);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
  return _retval;
}

/**
    Transfers image data from a #GdkWindow and converts it to an RGB(A)
    representation inside a #GdkPixbuf.
    
    In other words, copies image data from a server-side drawable to a
    client-side RGB(A) buffer. This allows you to efficiently read
    individual pixels on the client side.
    
    This function will create an RGB pixbuf with 8 bits per channel with
    the size specified by the width and height arguments scaled by the
    scale factor of window. The pixbuf will contain an alpha channel if
    the window contains one.
    
    If the window is off the screen, then there is no image data in the
    obscured/offscreen regions to be placed in the pixbuf. The contents of
    portions of the pixbuf corresponding to the offscreen region are
    undefined.
    
    If the window you’re obtaining data from is partially obscured by
    other windows, then the contents of the pixbuf areas corresponding
    to the obscured regions are undefined.
    
    If the window is not mapped (typically because it’s iconified/minimized
    or not on the current workspace), then null will be returned.
    
    If memory can’t be allocated for the return value, null will be returned
    instead.
    
    In short, there are several ways this function can fail, and if it fails
    it returns null; so check the return value.
    
    You should rarely, if ever, need to call this function.

    Params:
      window = Source window
      srcX = Source X coordinate within window
      srcY = Source Y coordinate within window
      width = Width in pixels of region to get
      height = Height in pixels of region to get
    Returns: A newly-created pixbuf with a
        reference count of 1, or null on error
*/
gdkpixbuf.pixbuf.Pixbuf pixbufGetFromWindow(gdk.window.Window window, int srcX, int srcY, int width, int height)
{
  GdkPixbuf* _cretval;
  _cretval = gdk_pixbuf_get_from_window(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, srcX, srcY, width, height);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
  return _retval;
}

/**
    Grabs the pointer (usually a mouse) so that all events are passed to this
    application until the pointer is ungrabbed with [gdk.global.pointerUngrab], or
    the grab window becomes unviewable.
    This overrides any previous pointer grab by this client.
    
    Pointer grabs are used for operations which need complete control over mouse
    events, even if the mouse leaves the application.
    For example in GTK+ it is used for Drag and Drop, for dragging the handle in
    the #GtkHPaned and #GtkVPaned widgets.
    
    Note that if the event mask of an X window has selected both button press and
    button release events, then a button press event will cause an automatic
    pointer grab until the button is released.
    X does this automatically since most applications expect to receive button
    press and release events in pairs.
    It is equivalent to a pointer grab on the window with owner_events set to
    true.
    
    If you set up anything at the time you take the grab that needs to be cleaned
    up when the grab ends, you should handle the #GdkEventGrabBroken events that
    are emitted when the grab ends unvoluntarily.

    Params:
      window = the #GdkWindow which will own the grab (the grab window).
      ownerEvents = if false then all pointer events are reported with respect to
                       window and are only reported if selected by event_mask. If true then pointer
                       events for this application are reported as normal, but pointer events outside
                       this application are reported with respect to window and only if selected by
                       event_mask. In either mode, unreported events are discarded.
      eventMask = specifies the event mask, which is used in accordance with
                     owner_events. Note that only pointer events (i.e. button and motion events)
                     may be selected.
      confineTo = If non-null, the pointer will be confined to this
                     window during the grab. If the pointer is outside confine_to, it will
                     automatically be moved to the closest edge of confine_to and enter
                     and leave events will be generated as necessary.
      cursor = the cursor to display while the grab is active. If this is null then
                 the normal cursors are used for window and its descendants, and the cursor
                 for window is used for all other windows.
      time = the timestamp of the event which led to this pointer grab. This usually
                comes from a #GdkEventButton struct, though [gdk.types.CURRENT_TIME] can be used if
                the time isn’t known.
    Returns: [gdk.types.GrabStatus.Success] if the grab was successful.

    Deprecated: Use [gdk.device.Device.grab] instead.
*/
gdk.types.GrabStatus pointerGrab(gdk.window.Window window, bool ownerEvents, gdk.types.EventMask eventMask, gdk.window.Window confineTo, gdk.cursor.Cursor cursor, uint time)
{
  GdkGrabStatus _cretval;
  _cretval = gdk_pointer_grab(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, ownerEvents, eventMask, confineTo ? cast(GdkWindow*)confineTo._cPtr(No.Dup) : null, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null, time);
  gdk.types.GrabStatus _retval = cast(gdk.types.GrabStatus)_cretval;
  return _retval;
}

/**
    Returns true if the pointer on the default display is currently
    grabbed by this application.
    
    Note that this does not take the inmplicit pointer grab on button
    presses into account.
    Returns: true if the pointer is currently grabbed by this application.

    Deprecated: Use [gdk.display.Display.deviceIsGrabbed] instead.
*/
bool pointerIsGrabbed()
{
  bool _retval;
  _retval = cast(bool)gdk_pointer_is_grabbed();
  return _retval;
}

/**
    Ungrabs the pointer on the default display, if it is grabbed by this
    application.

    Params:
      time = a timestamp from a #GdkEvent, or [gdk.types.CURRENT_TIME] if no
         timestamp is available.

    Deprecated: Use [gdk.device.Device.ungrab], together with [gdk.device.Device.grab]
                  instead.
*/
void pointerUngrab(uint time)
{
  gdk_pointer_ungrab(time);
}

/**
    Prepare for parsing command line arguments for GDK. This is not
    public API and should not be used in application code.

    Deprecated: This symbol was never meant to be used outside
        of GTK+
*/
void preParseLibgtkOnly()
{
  gdk_pre_parse_libgtk_only();
}

/**
    Deletes a property from a window.

    Params:
      window = a #GdkWindow
      property = the property to delete
*/
void propertyDelete(gdk.window.Window window, gdk.atom.Atom property)
{
  gdk_property_delete(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, property ? cast(GdkAtom)property._cPtr : null);
}

/**
    Retrieves a portion of the contents of a property. If the
    property does not exist, then the function returns false,
    and `GDK_NONE` will be stored in actual_property_type.
    
    The XGetWindowProperty() function that [gdk.global.propertyGet]
    uses has a very confusing and complicated set of semantics.
    Unfortunately, [gdk.global.propertyGet] makes the situation
    worse instead of better (the semantics should be considered
    undefined), and also prints warnings to stderr in cases where it
    should return a useful error to the program. You are advised to use
    XGetWindowProperty() directly until a replacement function for
    [gdk.global.propertyGet] is provided.

    Params:
      window = a #GdkWindow
      property = the property to retrieve
      type = the desired property type, or `GDK_NONE`, if any type of data
          is acceptable. If this does not match the actual
          type, then actual_format and actual_length will
          be filled in, a warning will be printed to stderr
          and no data will be returned.
      offset = the offset into the property at which to begin
          retrieving data, in 4 byte units.
      length = the length of the data to retrieve in bytes.  Data is
          considered to be retrieved in 4 byte chunks, so length
          will be rounded up to the next highest 4 byte boundary
          (so be careful not to pass a value that might overflow
          when rounded up).
      pdelete = if true, delete the property after retrieving the
          data.
      actualPropertyType = location to store the
          actual type of the property.
      actualFormat = location to store the actual return format of the
          data; either 8, 16 or 32 bits.
      data = location
          to store a pointer to the data. The retrieved data should be
          freed with [glib.global.gfree] when you are finished using it.
    Returns: true if data was successfully received and stored
        in data, otherwise false.
*/
bool propertyGet(gdk.window.Window window, gdk.atom.Atom property, gdk.atom.Atom type, gulong offset, gulong length, int pdelete, out gdk.atom.Atom actualPropertyType, out int actualFormat, out ubyte[] data)
{
  bool _retval;
  GdkAtom _actualPropertyType;
  int _actualLength;
  ubyte* _data;
  _retval = cast(bool)gdk_property_get(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, property ? cast(GdkAtom)property._cPtr : null, type ? cast(GdkAtom)type._cPtr : null, offset, length, pdelete, &_actualPropertyType, cast(int*)&actualFormat, &_actualLength, &_data);
  actualPropertyType = new gdk.atom.Atom(cast(void*)&_actualPropertyType, No.Take);
  data.length = _actualLength;
  data[0 .. $] = (cast(ubyte*)_data)[0 .. _actualLength];
  gFree(cast(void*)_data);
  return _retval;
}

/**
    This function returns the available bit depths for the default
    screen. It’s equivalent to listing the visuals
    ([gdk.global.listVisuals]) and then looking at the depth field in each
    visual, removing duplicates.
    
    The array returned by this function should not be freed.

    Params:
      depths = return
            location for available depths

    Deprecated: Visual selection should be done using
          [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
*/
void queryDepths(out int[] depths)
{
  int _count;
  int* _depths;
  gdk_query_depths(&_depths, &_count);
  depths.length = _count;
  depths[0 .. $] = (cast(int*)_depths)[0 .. _count];
}

/**
    This function returns the available visual types for the default
    screen. It’s equivalent to listing the visuals
    ([gdk.global.listVisuals]) and then looking at the type field in each
    visual, removing duplicates.
    
    The array returned by this function should not be freed.

    Params:
      visualTypes = return
            location for the available visual types

    Deprecated: Visual selection should be done using
          [gdk.screen.Screen.getSystemVisual] and [gdk.screen.Screen.getRgbaVisual]
*/
void queryVisualTypes(out gdk.types.VisualType[] visualTypes)
{
  int _count;
  GdkVisualType* _visualTypes;
  gdk_query_visual_types(&_visualTypes, &_count);
  visualTypes.length = _count;
  visualTypes[0 .. $] = (cast(gdk.types.VisualType*)_visualTypes)[0 .. _count];
}

/**
    Retrieves the contents of a selection in a given
    form.

    Params:
      requestor = a #GdkWindow.
      selection = an atom identifying the selection to get the
          contents of.
      target = the form in which to retrieve the selection.
      time = the timestamp to use when retrieving the
          selection. The selection owner may refuse the
          request if it did not own the selection at
          the time indicated by the timestamp.
*/
void selectionConvert(gdk.window.Window requestor, gdk.atom.Atom selection, gdk.atom.Atom target, uint time)
{
  gdk_selection_convert(requestor ? cast(GdkWindow*)requestor._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, target ? cast(GdkAtom)target._cPtr : null, time);
}

/**
    Determines the owner of the given selection.

    Params:
      selection = an atom indentifying a selection.
    Returns: if there is a selection owner
        for this window, and it is a window known to the current process,
        the #GdkWindow that owns the selection, otherwise null. Note
        that the return value may be owned by a different process if a
        foreign window was previously created for that window, but a new
        foreign window will never be created by this call.
*/
gdk.window.Window selectionOwnerGet(gdk.atom.Atom selection)
{
  GdkWindow* _cretval;
  _cretval = gdk_selection_owner_get(selection ? cast(GdkAtom)selection._cPtr : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
  return _retval;
}

/**
    Determine the owner of the given selection.
    
    Note that the return value may be owned by a different
    process if a foreign window was previously created for that
    window, but a new foreign window will never be created by this call.

    Params:
      display = a #GdkDisplay
      selection = an atom indentifying a selection
    Returns: if there is a selection owner
         for this window, and it is a window known to the current
         process, the #GdkWindow that owns the selection, otherwise
         null.
*/
gdk.window.Window selectionOwnerGetForDisplay(gdk.display.Display display, gdk.atom.Atom selection)
{
  GdkWindow* _cretval;
  _cretval = gdk_selection_owner_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
  return _retval;
}

/**
    Sets the owner of the given selection.

    Params:
      owner = a #GdkWindow or null to indicate that the
          the owner for the given should be unset.
      selection = an atom identifying a selection.
      time = timestamp to use when setting the selection.
          If this is older than the timestamp given last
          time the owner was set for the given selection, the
          request will be ignored.
      sendEvent = if true, and the new owner is different
          from the current owner, the current owner
          will be sent a SelectionClear event.
    Returns: true if the selection owner was successfully
        changed to owner, otherwise false.
*/
bool selectionOwnerSet(gdk.window.Window owner, gdk.atom.Atom selection, uint time, bool sendEvent)
{
  bool _retval;
  _retval = cast(bool)gdk_selection_owner_set(owner ? cast(GdkWindow*)owner._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, time, sendEvent);
  return _retval;
}

/**
    Sets the #GdkWindow owner as the current owner of the selection selection.

    Params:
      display = the #GdkDisplay
      owner = a #GdkWindow or null to indicate that the owner for
                the given should be unset
      selection = an atom identifying a selection
      time = timestamp to use when setting the selection
                If this is older than the timestamp given last time the owner was
                set for the given selection, the request will be ignored
      sendEvent = if true, and the new owner is different from the current
                     owner, the current owner will be sent a SelectionClear event
    Returns: true if the selection owner was successfully changed to owner,
         otherwise false.
*/
bool selectionOwnerSetForDisplay(gdk.display.Display display, gdk.window.Window owner, gdk.atom.Atom selection, uint time, bool sendEvent)
{
  bool _retval;
  _retval = cast(bool)gdk_selection_owner_set_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, owner ? cast(GdkWindow*)owner._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, time, sendEvent);
  return _retval;
}

/**
    Sends a response to SelectionRequest event.

    Params:
      requestor = window to which to deliver response.
      selection = selection that was requested.
      target = target that was selected.
      property = property in which the selection owner stored the
          data, or `GDK_NONE` to indicate that the request
          was rejected.
      time = timestamp.
*/
void selectionSendNotify(gdk.window.Window requestor, gdk.atom.Atom selection, gdk.atom.Atom target, gdk.atom.Atom property, uint time)
{
  gdk_selection_send_notify(requestor ? cast(GdkWindow*)requestor._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, target ? cast(GdkAtom)target._cPtr : null, property ? cast(GdkAtom)property._cPtr : null, time);
}

/**
    Send a response to SelectionRequest event.

    Params:
      display = the #GdkDisplay where requestor is realized
      requestor = window to which to deliver response
      selection = selection that was requested
      target = target that was selected
      property = property in which the selection owner stored the data,
                   or `GDK_NONE` to indicate that the request was rejected
      time = timestamp
*/
void selectionSendNotifyForDisplay(gdk.display.Display display, gdk.window.Window requestor, gdk.atom.Atom selection, gdk.atom.Atom target, gdk.atom.Atom property, uint time)
{
  gdk_selection_send_notify_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, requestor ? cast(GdkWindow*)requestor._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null, target ? cast(GdkAtom)target._cPtr : null, property ? cast(GdkAtom)property._cPtr : null, time);
}

/**
    Sets a list of backends that GDK should try to use.
    
    This can be be useful if your application does not
    work with certain GDK backends.
    
    By default, GDK tries all included backends.
    
    For example,
    ```c
    gdk_set_allowed_backends ("wayland,quartz,*");
    ```
    instructs GDK to try the Wayland backend first,
    followed by the Quartz backend, and then all
    others.
    
    If the `GDK_BACKEND` environment variable
    is set, it determines what backends are tried in what
    order, while still respecting the set of allowed backends
    that are specified by this function.
    
    The possible backend names are x11, win32, quartz,
    broadway, wayland. You can also include a * in the
    list to try all remaining backends.
    
    This call must happen prior to [gdk.display.Display.open],
    [gtk.global.init_], [gtk.global.initWithArgs] or [gtk.global.initCheck]
    in order to take effect.

    Params:
      backends = a comma-separated list of backends
*/
void setAllowedBackends(string backends)
{
  const(char)* _backends = backends.toCString(No.Alloc);
  gdk_set_allowed_backends(_backends);
}

/**
    Set the double click time for the default display. See
    [gdk.display.Display.setDoubleClickTime].
    See also [gdk.display.Display.setDoubleClickDistance].
    Applications should not set this, it is a
    global user-configured setting.

    Params:
      msec = double click time in milliseconds (thousandths of a second)
*/
void setDoubleClickTime(uint msec)
{
  gdk_set_double_click_time(msec);
}

/**
    Sets the program class. The X11 backend uses the program class to set
    the class name part of the `WM_CLASS` property on
    toplevel windows; see the ICCCM.
    
    The program class can still be overridden with the --class command
    line option.

    Params:
      programClass = a string.
*/
void setProgramClass(string programClass)
{
  const(char)* _programClass = programClass.toCString(No.Alloc);
  gdk_set_program_class(_programClass);
}

/**
    Sets whether a trace of received events is output.
    Note that GTK+ must be compiled with debugging (that is,
    configured using the `--enable-debug` option)
    to use this option.

    Params:
      showEvents = true to output event debugging information.
*/
void setShowEvents(bool showEvents)
{
  gdk_set_show_events(showEvents);
}

/**
    Obtains a desktop-wide setting, such as the double-click time,
    for the default screen. See [gdk.screen.Screen.getSetting].

    Params:
      name = the name of the setting.
      value = location to store the value of the setting.
    Returns: true if the setting existed and a value was stored
        in value, false otherwise.
*/
bool settingGet(string name, gobject.value.Value value)
{
  bool _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = cast(bool)gdk_setting_get(_name, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  return _retval;
}

/** */
void synthesizeWindowState(gdk.window.Window window, gdk.types.WindowState unsetFlags, gdk.types.WindowState setFlags)
{
  gdk_synthesize_window_state(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, unsetFlags, setFlags);
}

/**
    Retrieves a pixel from window to force the windowing
    system to carry out any pending rendering commands.
    
    This function is intended to be used to synchronize with rendering
    pipelines, to benchmark windowing system rendering operations.

    Params:
      window = a mapped #GdkWindow
*/
void testRenderSync(gdk.window.Window window)
{
  gdk_test_render_sync(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
}

/**
    This function is intended to be used in GTK+ test programs.
    It will warp the mouse pointer to the given (`x`,`y`) coordinates
    within window and simulate a button press or release event.
    Because the mouse pointer needs to be warped to the target
    location, use of this function outside of test programs that
    run in their own virtual windowing system (e.g. Xvfb) is not
    recommended.
    
    Also, [gdk.global.testSimulateButton] is a fairly low level function,
    for most testing purposes, [gtk.global.testWidgetClick] is the right
    function to call which will generate a button press event followed
    by its accompanying button release event.

    Params:
      window = a #GdkWindow to simulate a button event for
      x = x coordinate within window for the button event
      y = y coordinate within window for the button event
      button = Number of the pointer button for the event, usually 1, 2 or 3
      modifiers = Keyboard modifiers the event is setup with
      buttonPressrelease = either [gdk.types.EventType.ButtonPress] or [gdk.types.EventType.ButtonRelease]
    Returns: whether all actions necessary for a button event simulation
          were carried out successfully
*/
bool testSimulateButton(gdk.window.Window window, int x, int y, uint button, gdk.types.ModifierType modifiers, gdk.types.EventType buttonPressrelease)
{
  bool _retval;
  _retval = cast(bool)gdk_test_simulate_button(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, x, y, button, modifiers, buttonPressrelease);
  return _retval;
}

/**
    This function is intended to be used in GTK+ test programs.
    If (`x`,`y`) are > (-1,-1), it will warp the mouse pointer to
    the given (`x`,`y`) coordinates within window and simulate a
    key press or release event.
    
    When the mouse pointer is warped to the target location, use
    of this function outside of test programs that run in their
    own virtual windowing system (e.g. Xvfb) is not recommended.
    If (`x`,`y`) are passed as (-1,-1), the mouse pointer will not
    be warped and window origin will be used as mouse pointer
    location for the event.
    
    Also, [gdk.global.testSimulateKey] is a fairly low level function,
    for most testing purposes, [gtk.global.testWidgetSendKey] is the
    right function to call which will generate a key press event
    followed by its accompanying key release event.

    Params:
      window = a #GdkWindow to simulate a key event for
      x = x coordinate within window for the key event
      y = y coordinate within window for the key event
      keyval = A GDK keyboard value
      modifiers = Keyboard modifiers the event is setup with
      keyPressrelease = either [gdk.types.EventType.KeyPress] or [gdk.types.EventType.KeyRelease]
    Returns: whether all actions necessary for a key event simulation
          were carried out successfully
*/
bool testSimulateKey(gdk.window.Window window, int x, int y, uint keyval, gdk.types.ModifierType modifiers, gdk.types.EventType keyPressrelease)
{
  bool _retval;
  _retval = cast(bool)gdk_test_simulate_key(window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, x, y, keyval, modifiers, keyPressrelease);
  return _retval;
}

/**
    Converts a text property in the given encoding to
    a list of UTF-8 strings.

    Params:
      display = a #GdkDisplay
      encoding = an atom representing the encoding of the text
      format = the format of the property
      text = the text to convert
      list = location to store the list
                   of strings or null. The list should be freed with
                   [glib.global.strfreev].
    Returns: the number of strings in the resulting list
*/
int textPropertyToUtf8ListForDisplay(gdk.display.Display display, gdk.atom.Atom encoding, int format, ubyte[] text, out string[] list)
{
  int _retval;
  int _length;
  if (text)
    _length = cast(int)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  char** _list;
  _retval = gdk_text_property_to_utf8_list_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, encoding ? cast(GdkAtom)encoding._cPtr : null, format, _text, _length, &_list);
  uint _lenlist;
  if (_list)
  {
    for (; _list[_lenlist] !is null; _lenlist++)
    {
    }
  }

  list.length = _lenlist;
  foreach (i; 0 .. _lenlist)
    list[i] = _list[i].fromCString(Yes.Free);
  gFree(cast(void*)_list);
  return _retval;
}

/**
    Adds a function to be called whenever there are no higher priority
    events pending.  If the function returns false it is automatically
    removed from the list of event sources and will not be called again.
    
    This variant of [glib.global.idleAddFull] calls function with the GDK lock
    held. It can be thought of a MT-safe version for GTK+ widgets for the
    following use case, where you have to worry about idle_callback()
    running in thread A and accessing self after it has been finalized
    in thread B:
    
    ```c
    static gboolean
    idle_callback (gpointer data)
    {
       // gdk_threads_enter(); would be needed for g_idle_add()
    
       SomeWidget *self = data;
       // do stuff with self
    
       self->idle_id = 0;
    
       // gdk_threads_leave(); would be needed for g_idle_add()
       return FALSE;
    }
    
    static void
    some_widget_do_stuff_later (SomeWidget *self)
    {
       self->idle_id = gdk_threads_add_idle (idle_callback, self)
       // using g_idle_add() here would require thread protection in the callback
    }
    
    static void
    some_widget_finalize (GObject *object)
    {
       SomeWidget *self = SOME_WIDGET (object);
       if (self->idle_id)
         g_source_remove (self->idle_id);
       G_OBJECT_CLASS (parent_class)->finalize (object);
    }
    ```

    Params:
      priority = the priority of the idle source. Typically this will be in the
                   range between #G_PRIORITY_DEFAULT_IDLE and #G_PRIORITY_HIGH_IDLE
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint threadsAddIdle(int priority, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = gdk_threads_add_idle_full(priority, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Sets a function to be called at regular intervals holding the GDK lock,
    with the given priority.  The function is called repeatedly until it
    returns false, at which point the timeout is automatically destroyed
    and the function will not be called again.  The notify function is
    called when the timeout is destroyed.  The first call to the
    function will be at the end of the first interval.
    
    Note that timeout functions may be delayed, due to the processing of other
    event sources. Thus they should not be relied on for precise timing.
    After each call to the timeout function, the time of the next
    timeout is recalculated based on the current time and the given interval
    (it does not try to “catch up” time lost in delays).
    
    This variant of [glib.global.timeoutAddFull] can be thought of a MT-safe version
    for GTK+ widgets for the following use case:
    
    ```c
    static gboolean timeout_callback (gpointer data)
    {
       SomeWidget *self = data;
       
       // do stuff with self
       
       self->timeout_id = 0;
       
       return G_SOURCE_REMOVE;
    }
     
    static void some_widget_do_stuff_later (SomeWidget *self)
    {
       self->timeout_id = g_timeout_add (timeout_callback, self)
    }
     
    static void some_widget_finalize (GObject *object)
    {
       SomeWidget *self = SOME_WIDGET (object);
       
       if (self->timeout_id)
         g_source_remove (self->timeout_id);
       
       G_OBJECT_CLASS (parent_class)->finalize (object);
    }
    ```

    Params:
      priority = the priority of the timeout source. Typically this will be in the
                   range between #G_PRIORITY_DEFAULT_IDLE and #G_PRIORITY_HIGH_IDLE.
      interval = the time between calls to the function, in milliseconds
                    (1/1000ths of a second)
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint threadsAddTimeout(int priority, uint interval, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = gdk_threads_add_timeout_full(priority, interval, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    A variant of [gdk.global.threadsAddTimeoutFull] with second-granularity.
    See [glib.global.timeoutAddSecondsFull] for a discussion of why it is
    a good idea to use this function if you don’t need finer granularity.

    Params:
      priority = the priority of the timeout source. Typically this will be in the
                   range between #G_PRIORITY_DEFAULT_IDLE and #G_PRIORITY_HIGH_IDLE.
      interval = the time between calls to the function, in seconds
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint threadsAddTimeoutSeconds(int priority, uint interval, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = gdk_threads_add_timeout_seconds_full(priority, interval, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    This function marks the beginning of a critical section in which
    GDK and GTK+ functions can be called safely and without causing race
    conditions. Only one thread at a time can be in such a critial
    section.

    Deprecated: All GDK and GTK+ calls should be made from the main
          thread
*/
void threadsEnter()
{
  gdk_threads_enter();
}

/**
    Initializes GDK so that it can be used from multiple threads
    in conjunction with [gdk.global.threadsEnter] and [gdk.global.threadsLeave].
    
    This call must be made before any use of the main loop from
    GTK+; to be safe, call it before [gtk.global.init_].

    Deprecated: All GDK and GTK+ calls should be made from the main
          thread
*/
void threadsInit()
{
  gdk_threads_init();
}

/**
    Leaves a critical region begun with [gdk.global.threadsEnter].

    Deprecated: All GDK and GTK+ calls should be made from the main
          thread
*/
void threadsLeave()
{
  gdk_threads_leave();
}

/**
    Convert from a ISO10646 character to a key symbol.

    Params:
      wc = a ISO10646 encoded character
    Returns: the corresponding GDK key symbol, if one exists.
                    or, if there is no corresponding symbol,
                    wc | 0x01000000
*/
uint unicodeToKeyval(uint wc)
{
  uint _retval;
  _retval = gdk_unicode_to_keyval(wc);
  return _retval;
}

/**
    Converts an UTF-8 string into the best possible representation
    as a STRING. The representation of characters not in STRING
    is not specified; it may be as pseudo-escape sequences
    \x{ABCD}, or it may be in some other form of approximation.

    Params:
      str = a UTF-8 string
    Returns: the newly-allocated string, or null if the
               conversion failed. (It should not fail for any properly
               formed UTF-8 string unless system limits like memory or
               file descriptors are exceeded.)
*/
string utf8ToStringTarget(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = gdk_utf8_to_string_target(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
