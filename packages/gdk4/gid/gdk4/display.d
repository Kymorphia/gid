/// Module for [Display] class
module gid.gdk4.display;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.app_launch_context;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.clipboard;
import gid.gdk4.device;
import gid.gdk4.dmabuf_formats;
import gid.gdk4.event;
import gid.gdk4.glcontext;
import gid.gdk4.monitor;
import gid.gdk4.seat;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gio2.list_model;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;

/**
    A representation of a workstation.
    
    Their purpose are two-fold:
    
    - To manage and provide information about input devices (pointers, keyboards, etc)
    - To manage and provide information about output devices (monitors, projectors, etc)
    
    Most of the input device handling has been factored out into separate
    [gid.gdk4.seat.Seat] objects. Every display has a one or more seats, which
    can be accessed with [gid.gdk4.display.Display.getDefaultSeat] and
    [gid.gdk4.display.Display.listSeats].
    
    Output devices are represented by [gid.gdk4.monitor.MonitorWrap] objects, which can
    be accessed with [gid.gdk4.display.Display.getMonitorAtSurface] and similar APIs.
*/
class Display : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_display_get_type != &gidSymbolNotFound ? gdk_display_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDisplay";
  }

  /** Returns `this`, for use in `with` statements. */
  override Display self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.display.Display]
      Returns: New builder object
  */
  static DisplayGidBuilder builder() nothrow
  {
    return new DisplayGidBuilder;
  }

  /**
      Get `composited` property.
      Returns: true if the display properly composites the alpha channel.
  */
  @property bool composited() nothrow
  {
    return isComposited();
  }

  /**
      Get `dmabufFormats` property.
      Returns: The dma-buf formats that are supported on this display
  */
  @property gid.gdk4.dmabuf_formats.DmabufFormats dmabufFormats() nothrow
  {
    return getDmabufFormats();
  }

  /**
      Get `inputShapes` property.
      Returns: true if the display supports input shapes.
  */
  @property bool inputShapes() nothrow
  {
    return supportsInputShapes();
  }

  /**
      Get `rgba` property.
      Returns: true if the display supports an alpha channel.
  */
  @property bool rgba() nothrow
  {
    return isRgba();
  }

  /**
      Get `shadowWidth` property.
      Returns: true if the display supports extensible frames.
  */
  @property bool shadowWidth() nothrow
  {
    return supportsShadowWidth();
  }

  /**
      Gets the default [gid.gdk4.display.Display].
      
      This is a convenience function for:
      
          gdk_display_manager_get_default_display (gdk_display_manager_get ())
      Returns: a [gid.gdk4.display.Display], or null if
          there is no default display
  */
  static gid.gdk4.display.Display getDefault() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Opens a display.
      
      If opening the display fails, `NULL` is returned.
  
      Params:
        displayName = the name of the display to open
      Returns: a [gid.gdk4.display.Display]
  */
  static gid.gdk4.display.Display open(string displayName = null) nothrow
  {
    GdkDisplay* _cretval;
    const(char)* _displayName = displayName.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gdk_display_open(_displayName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits a short beep on display
  */
  void beep() nothrow
  {
    gdk_display_beep(cast(GdkDisplay*)this._cPtr);
  }

  /**
      Closes the connection to the windowing system for the given display.
      
      This cleans up associated resources.
  */
  void close() nothrow
  {
    gdk_display_close(cast(GdkDisplay*)this._cPtr);
  }

  /**
      Creates a new [gid.gdk4.glcontext.GLContext] for the [gid.gdk4.display.Display].
      
      The context is disconnected from any particular surface or surface
      and cannot be used to draw to any surface. It can only be used to
      draw to non-surface framebuffers like textures.
      
      If the creation of the [gid.gdk4.glcontext.GLContext] failed, error will be set.
      Before using the returned [gid.gdk4.glcontext.GLContext], you will need to
      call [gid.gdk4.glcontext.GLContext.makeCurrent] or [gid.gdk4.glcontext.GLContext.realize].
      Returns: the newly created [gid.gdk4.glcontext.GLContext]
      Throws: [ErrorWrap]
  */
  gid.gdk4.glcontext.GLContext createGlContext()
  {
    GdkGLContext* _cretval;
    GError *_err;
    _cretval = gdk_display_create_gl_context(cast(GdkDisplay*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.glcontext.GLContext)(cast(GdkGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns true if there is an ongoing grab on device for display.
  
      Params:
        device = a [gid.gdk4.device.Device]
      Returns: true if there is a grab in effect for device.
  */
  bool deviceIsGrabbed(gid.gdk4.device.Device device) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_device_is_grabbed(cast(GdkDisplay*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Flushes any requests queued for the windowing system.
      
      This happens automatically when the main loop blocks waiting for new events,
      but if your application is drawing without returning control to the main loop,
      you may need to call this function explicitly. A common case where this function
      needs to be called is when an application is executing drawing commands
      from a thread other than the thread where the main loop is running.
      
      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing.
  */
  void flush() nothrow
  {
    gdk_display_flush(cast(GdkDisplay*)this._cPtr);
  }

  /**
      Returns a [gid.gdk4.app_launch_context.AppLaunchContext] suitable for launching
      applications on the given display.
      Returns: a new [gid.gdk4.app_launch_context.AppLaunchContext] for display
  */
  gid.gdk4.app_launch_context.AppLaunchContext getAppLaunchContext() nothrow
  {
    GdkAppLaunchContext* _cretval;
    _cretval = gdk_display_get_app_launch_context(cast(GdkDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.app_launch_context.AppLaunchContext)(cast(GdkAppLaunchContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the clipboard used for copy/paste operations.
      Returns: the display's clipboard
  */
  gid.gdk4.clipboard.Clipboard getClipboard() nothrow
  {
    GdkClipboard* _cretval;
    _cretval = gdk_display_get_clipboard(cast(GdkDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the default [gid.gdk4.seat.Seat] for this display.
      
      Note that a display may not have a seat. In this case,
      this function will return null.
      Returns: the default seat.
  */
  gid.gdk4.seat.Seat getDefaultSeat() nothrow
  {
    GdkSeat* _cretval;
    _cretval = gdk_display_get_default_seat(cast(GdkDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the dma-buf formats that are supported on this display.
      
      GTK may use OpenGL or Vulkan to support some formats.
      Calling this function will then initialize them if they aren't yet.
      
      The formats returned by this function can be used for negotiating
      buffer formats with producers such as v4l, pipewire or GStreamer.
      
      To learn more about dma-bufs, see [gid.gdk4.dmabuf_texture_builder.DmabufTextureBuilder].
      
      This function is threadsafe. It can be called from any thread.
      Returns: a [gid.gdk4.dmabuf_formats.DmabufFormats] object
  */
  gid.gdk4.dmabuf_formats.DmabufFormats getDmabufFormats() nothrow
  {
    GdkDmabufFormats* _cretval;
    _cretval = gdk_display_get_dmabuf_formats(cast(GdkDisplay*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.dmabuf_formats.DmabufFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the monitor in which the largest area of surface
      resides.
  
      Params:
        surface = a [gid.gdk4.surface.Surface]
      Returns: the monitor with the largest
          overlap with surface
  */
  gid.gdk4.monitor.MonitorWrap getMonitorAtSurface(gid.gdk4.surface.Surface surface) nothrow
  {
    GdkMonitor* _cretval;
    _cretval = gdk_display_get_monitor_at_surface(cast(GdkDisplay*)this._cPtr, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.monitor.MonitorWrap)(cast(GdkMonitor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the list of monitors associated with this display.
      
      Subsequent calls to this function will always return the
      same list for the same display.
      
      You can listen to the GListModel::items-changed signal on
      this list to monitor changes to the monitor of this display.
      Returns: a [gid.gio2.list_model.ListModel] of [gid.gdk4.monitor.MonitorWrap]
  */
  gid.gio2.list_model.ListModel getMonitors() nothrow
  {
    GListModel* _cretval;
    _cretval = gdk_display_get_monitors(cast(GdkDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the display.
      Returns: a string representing the display name. This string is owned
          by GDK and should not be modified or freed.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_display_get_name(cast(GdkDisplay*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the clipboard used for the primary selection.
      
      On backends where the primary clipboard is not supported natively,
      GDK emulates this clipboard locally.
      Returns: the primary clipboard
  */
  gid.gdk4.clipboard.Clipboard getPrimaryClipboard() nothrow
  {
    GdkClipboard* _cretval;
    _cretval = gdk_display_get_primary_clipboard(cast(GdkDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.clipboard.Clipboard)(cast(GdkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves a desktop-wide setting such as double-click time
      for the display.
  
      Params:
        name = the name of the setting
        value = location to store the value of the setting
      Returns: true if the setting existed and a value was stored
          in value, false otherwise
  */
  bool getSetting(string name, gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gdk_display_get_setting(cast(GdkDisplay*)this._cPtr, _name, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the startup notification ID for a Wayland display, or null
      if no ID has been defined.
      Returns: the startup notification ID for display
  */
  string getStartupNotificationId() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_display_get_startup_notification_id(cast(GdkDisplay*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Finds out if the display has been closed.
      Returns: true if the display is closed.
  */
  bool isClosed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_is_closed(cast(GdkDisplay*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether surfaces can reasonably be expected to have
      their alpha channel drawn correctly on the screen.
      
      Check [gid.gdk4.display.Display.isRgba] for whether the display
      supports an alpha channel.
      
      On X11 this function returns whether a compositing manager is
      compositing on display.
      
      On modern displays, this value is always true.
      Returns: Whether surfaces with RGBA visuals can reasonably
          be expected to have their alpha channels drawn correctly
          on the screen.
  */
  bool isComposited() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_is_composited(cast(GdkDisplay*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether surfaces on this display are created with an
      alpha channel.
      
      Even if a true is returned, it is possible that the
      surface’s alpha channel won’t be honored when displaying the
      surface on the screen: in particular, for X an appropriate
      windowing manager and compositing manager must be running to
      provide appropriate display. Use [gid.gdk4.display.Display.isComposited]
      to check if that is the case.
      
      On modern displays, this value is always true.
      Returns: true if surfaces are created with an alpha channel or
          false if the display does not support this functionality.
  */
  bool isRgba() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_is_rgba(cast(GdkDisplay*)this._cPtr);
    return _retval;
  }

  /**
      Returns the list of seats known to display.
      Returns: the
          list of seats known to the [gid.gdk4.display.Display]
  */
  gid.gdk4.seat.Seat[] listSeats() nothrow
  {
    GList* _cretval;
    _cretval = gdk_display_list_seats(cast(GdkDisplay*)this._cPtr);
    auto _retval = gListToD!(gid.gdk4.seat.Seat, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the keyvals bound to keycode.
      
      The Nth [gid.gdk4.types.KeymapKey] in keys is bound to the Nth keyval in keyvals.
      
      When a keycode is pressed by the user, the keyval from
      this list of entries is selected by considering the effective
      keyboard group and level.
      
      Free the returned arrays with [gid.glib2.global.gfree].
  
      Params:
        keycode = a keycode
        keys = return
            location for array of [gid.gdk4.types.KeymapKey]
        keyvals = return
            location for array of keyvals
      Returns: true if there were any entries
  */
  bool mapKeycode(uint keycode, out gid.gdk4.types.KeymapKey[] keys, out uint[] keyvals) nothrow
  {
    bool _retval;
    int _nEntries;
    GdkKeymapKey* _keys;
    uint* _keyvals;
    _retval = cast(bool)gdk_display_map_keycode(cast(GdkDisplay*)this._cPtr, keycode, &_keys, &_keyvals, &_nEntries);
    keys.length = _nEntries;
    keys[0 .. $] = (cast(gid.gdk4.types.KeymapKey*)_keys)[0 .. _nEntries];
    gFree(cast(void*)_keys);
    keyvals.length = _nEntries;
    keyvals[0 .. $] = (cast(uint*)_keyvals)[0 .. _nEntries];
    gFree(cast(void*)_keyvals);
    return _retval;
  }

  /**
      Obtains a list of keycode/group/level combinations that will
      generate keyval.
      
      Groups and levels are two kinds of keyboard mode; in general, the level
      determines whether the top or bottom symbol on a key is used, and the
      group determines whether the left or right symbol is used.
      
      On US keyboards, the shift key changes the keyboard level, and there
      are no groups. A group switch key might convert a keyboard between
      Hebrew to English modes, for example.
      
      [gid.gdk3.event_key.EventKey] contains a `group` field that indicates the active
      keyboard group. The level is computed from the modifier mask.
      
      The returned array should be freed with [gid.glib2.global.gfree].
  
      Params:
        keyval = a keyval, such as [gid.gdk4.types.KEY_a], [gid.gdk4.types.KEY_Up], [gid.gdk4.types.KEY_Return], etc.
        keys = return location
            for an array of [gid.gdk4.types.KeymapKey]
      Returns: true if keys were found and returned
  */
  bool mapKeyval(uint keyval, out gid.gdk4.types.KeymapKey[] keys) nothrow
  {
    bool _retval;
    int _nKeys;
    GdkKeymapKey* _keys;
    _retval = cast(bool)gdk_display_map_keyval(cast(GdkDisplay*)this._cPtr, keyval, &_keys, &_nKeys);
    keys.length = _nKeys;
    keys[0 .. $] = (cast(gid.gdk4.types.KeymapKey*)_keys)[0 .. _nKeys];
    gFree(cast(void*)_keys);
    return _retval;
  }

  /**
      Indicates to the GUI environment that the application has
      finished loading, using a given identifier.
      
      GTK will call this function automatically for [GtkWindow](../gtk4/class.Window.html)
      with custom startup-notification identifier unless
      [[gid.gtk4.window.Window.setAutoStartupNotification]](../gtk4/method.Window.set_auto_startup_notification.html)
      is called to disable that feature.
  
      Params:
        startupId = a startup-notification identifier, for which
            notification process should be completed
  
      Deprecated: Using [gid.gdk4.toplevel.Toplevel.setStartupId] is sufficient
  */
  void notifyStartupComplete(string startupId) nothrow
  {
    const(char)* _startupId = startupId.toCString!(No.Malloc, No.Nullable);
    gdk_display_notify_startup_complete(cast(GdkDisplay*)this._cPtr, _startupId);
  }

  /**
      Checks that OpenGL is available for self and ensures that it is
      properly initialized.
      When this fails, an error will be set describing the error and this
      function returns false.
      
      Note that even if this function succeeds, creating a [gid.gdk4.glcontext.GLContext]
      may still fail.
      
      This function is idempotent. Calling it multiple times will just
      return the same value or error.
      
      You never need to call this function, GDK will call it automatically
      as needed. But you can use it as a check when setting up code that
      might make use of OpenGL.
      Returns: true if the display supports OpenGL
      Throws: [ErrorWrap]
  */
  bool prepareGl()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_display_prepare_gl(cast(GdkDisplay*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Adds the given event to the event queue for display.
  
      Params:
        event = a [gid.gdk4.event.Event]
  
      Deprecated: This function is only useful in very
        special situations and should not be used by applications.
  */
  void putEvent(gid.gdk4.event.Event event) nothrow
  {
    gdk_display_put_event(cast(GdkDisplay*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Returns true if the display supports input shapes.
      
      This means that [gid.gdk4.surface.Surface.setInputRegion] can
      be used to modify the input shape of surfaces on display.
      
      On modern displays, this value is always true.
      Returns: true if surfaces with modified input shape are supported
  */
  bool supportsInputShapes() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_supports_input_shapes(cast(GdkDisplay*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether it's possible for a surface to draw outside of the window area.
      
      If true is returned the application decides if it wants to draw shadows.
      If false is returned, the compositor decides if it wants to draw shadows.
      Returns: true if surfaces can draw shadows or
          false if the display does not support this functionality.
  */
  bool supportsShadowWidth() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_supports_shadow_width(cast(GdkDisplay*)this._cPtr);
    return _retval;
  }

  /**
      Flushes any requests queued for the windowing system and waits until all
      requests have been handled.
      
      This is often used for making sure that the display is synchronized
      with the current state of the program. Calling [gid.gdk4.display.Display.sync]
      before `methodGdkX11.Display.error_trap_pop` makes sure that any errors
      generated from earlier requests are handled before the error trap is removed.
      
      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing.
  */
  void sync() nothrow
  {
    gdk_display_sync(cast(GdkDisplay*)this._cPtr);
  }

  /**
      Translates the contents of a [gid.gdk3.event_key.EventKey] into a keyval, effective group,
      and level.
      
      Modifiers that affected the translation and are thus unavailable for
      application use are returned in consumed_modifiers.
      
      The effective_group is the group that was actually used for the
      translation; some keys such as Enter are not affected by the active
      keyboard group. The level is derived from state.
      
      consumed_modifiers gives modifiers that should be masked out
      from state when comparing this key press to a keyboard shortcut.
      For instance, on a US keyboard, the `plus` symbol is shifted, so
      when comparing a key press to a `<Control>plus` accelerator `<Shift>`
      should be masked out.
      
      This function should rarely be needed, since [gid.gdk3.event_key.EventKey] already
      contains the translated keyval. It is exported for the benefit of
      virtualized test environments.
  
      Params:
        keycode = a keycode
        state = a modifier state
        group = active keyboard group
        keyval = return location for keyval
        effectiveGroup = return location for effective group
        level = return location for level
        consumed = return location for modifiers that were used
            to determine the group or level
      Returns: true if there was a keyval bound to keycode/state/group.
  */
  bool translateKey(uint keycode, gid.gdk4.types.ModifierType state, int group, out uint keyval, out int effectiveGroup, out int level, out gid.gdk4.types.ModifierType consumed) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_display_translate_key(cast(GdkDisplay*)this._cPtr, keycode, state, group, cast(uint*)&keyval, cast(int*)&effectiveGroup, cast(int*)&level, &consumed);
    return _retval;
  }

  /**
      Connect to `Closed` signal.
  
      Emitted when the connection to the windowing system for display is closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool isError, gid.gdk4.display.Display display)`
  
          `isError` true if the display was closed due to an error (optional)
  
          `display` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.display.Display)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display.Display.closed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
      Connect to `Opened` signal.
  
      Emitted when the connection to the windowing system for display is opened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.display.Display display)`
  
          `display` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectOpened(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.display.Display)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display.Display.opened");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("opened", closure, after);
  }

  /**
      Connect to `SeatAdded` signal.
  
      Emitted whenever a new seat is made known to the windowing system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.seat.Seat seat, gid.gdk4.display.Display display)`
  
          `seat` the seat that was just added (optional)
  
          `display` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSeatAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.seat.Seat)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.display.Display)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display.Display.seatAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seat-added", closure, after);
  }

  /**
      Connect to `SeatRemoved` signal.
  
      Emitted whenever a seat is removed by the windowing system.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.seat.Seat seat, gid.gdk4.display.Display display)`
  
          `seat` the seat that was just removed (optional)
  
          `display` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSeatRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.seat.Seat)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.display.Display)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display.Display.seatRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seat-removed", closure, after);
  }

  /**
      Connect to `SettingChanged` signal.
  
      Emitted whenever a setting changes its value.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string setting, gid.gdk4.display.Display display)`
  
          `setting` the name of the setting that changed (optional)
  
          `display` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSettingChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.display.Display)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display.Display.settingChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setting-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.display.Display]
class DisplayGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdk4.display.Display]
final class DisplayGidBuilder : DisplayGidBuilderImpl!DisplayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Display build() nothrow
  {
    return new Display(cast(void*)createGObject(Display._getGType), Yes.Take);
  }
}
