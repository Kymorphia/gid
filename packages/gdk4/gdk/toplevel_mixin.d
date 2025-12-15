/// Module for [Toplevel] interface mixin
module gdk.toplevel_mixin;

public import gdk.toplevel_iface_proxy;
public import gdk.c.functions;
public import gdk.c.types;
public import gdk.device;
public import gdk.event;
public import gdk.surface;
public import gdk.texture;
public import gdk.toplevel_layout;
public import gdk.toplevel_size;
public import gdk.types;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;

/**
    A [gdk.toplevel.Toplevel] is a freestanding toplevel surface.
    
    The [gdk.toplevel.Toplevel] interface provides useful APIs for interacting with
    the windowing system, such as controlling maximization and size of the
    surface, setting icons and transient parents for dialogs.
*/
template ToplevelT()
{

  /**
      Get `decorated` property.
      Returns: Whether the window manager should add decorations.
  */
  @property bool decorated()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("decorated");
  }

  /**
      Set `decorated` property.
      Params:
        propval = Whether the window manager should add decorations.
  */
  @property void decorated(bool propval)
  {
    return setDecorated(propval);
  }

  /**
      Get `deletable` property.
      Returns: Whether the window manager should allow to close the surface.
  */
  @property bool deletable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("deletable");
  }

  /**
      Set `deletable` property.
      Params:
        propval = Whether the window manager should allow to close the surface.
  */
  @property void deletable(bool propval)
  {
    return setDeletable(propval);
  }

  /**
      Get `fullscreenMode` property.
      Returns: The fullscreen mode of the surface.
  */
  @property gdk.types.FullscreenMode fullscreenMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.types.FullscreenMode)("fullscreen-mode");
  }

  /**
      Set `fullscreenMode` property.
      Params:
        propval = The fullscreen mode of the surface.
  */
  @property void fullscreenMode(gdk.types.FullscreenMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.types.FullscreenMode)("fullscreen-mode", propval);
  }

  /**
      Get `iconList` property.
      Returns: A list of textures to use as icon.
  */
  @property void* iconList()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("icon-list");
  }

  /**
      Set `iconList` property.
      Params:
        propval = A list of textures to use as icon.
  */
  @property void iconList(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("icon-list", propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the surface is modal.
  */
  @property bool modal()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("modal");
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the surface is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `shortcutsInhibited` property.
      Returns: Whether the surface should inhibit keyboard shortcuts.
  */
  @property bool shortcutsInhibited()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("shortcuts-inhibited");
  }

  /**
      Get `startupId` property.
      Returns: The startup ID of the surface.
      
      See [gdk.app_launch_context.AppLaunchContext] for more information about
      startup feedback.
  */
  @property string startupId()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("startup-id");
  }

  /**
      Set `startupId` property.
      Params:
        propval = The startup ID of the surface.
        
        See [gdk.app_launch_context.AppLaunchContext] for more information about
        startup feedback.
  */
  @property void startupId(string propval)
  {
    return setStartupId(propval);
  }

  /**
      Get `state` property.
      Returns: The state of the toplevel.
  */
  @property gdk.types.ToplevelState state()
  {
    return getState();
  }

  /**
      Get `title` property.
      Returns: The title of the surface.
  */
  @property string title()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the surface.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `transientFor` property.
      Returns: The transient parent of the surface.
  */
  @property gdk.surface.Surface transientFor()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.surface.Surface)("transient-for");
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the surface.
  */
  @property void transientFor(gdk.surface.Surface propval)
  {
    return setTransientFor(propval);
  }

  /**
      Begins an interactive move operation.
      
      You might use this function to implement draggable titlebars.
  
      Params:
        device = the device used for the operation
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        x = surface X coordinate of mouse click that began the drag
        y = surface Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag (use
            [gdk.event.Event.getTime])
  */
  override void beginMove(gdk.device.Device device, int button, double x, double y, uint timestamp)
  {
    gdk_toplevel_begin_move(cast(GdkToplevel*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, button, x, y, timestamp);
  }

  /**
      Begins an interactive resize operation.
      
      You might use this function to implement a “window resize grip.”
  
      Params:
        edge = the edge or corner from which the drag is started
        device = the device used for the operation
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        x = surface X coordinate of mouse click that began the drag
        y = surface Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag (use
            [gdk.event.Event.getTime])
  */
  override void beginResize(gdk.types.SurfaceEdge edge, gdk.device.Device device, int button, double x, double y, uint timestamp)
  {
    gdk_toplevel_begin_resize(cast(GdkToplevel*)this._cPtr, edge, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, button, x, y, timestamp);
  }

  /**
      Sets keyboard focus to surface.
      
      In most cases, [[gtk.window.Window.presentWithTime]](../gtk4/method.Window.present_with_time.html)
      should be used on a [GtkWindow](../gtk4/class.Window.html), rather than
      calling this function.
  
      Params:
        timestamp = timestamp of the event triggering the surface focus
  */
  override void focus(uint timestamp)
  {
    gdk_toplevel_focus(cast(GdkToplevel*)this._cPtr, timestamp);
  }

  /**
      Gets the bitwise or of the currently active surface state flags,
      from the [gdk.types.ToplevelState] enumeration.
      Returns: surface state bitfield
  */
  override gdk.types.ToplevelState getState()
  {
    GdkToplevelState _cretval;
    _cretval = gdk_toplevel_get_state(cast(GdkToplevel*)this._cPtr);
    gdk.types.ToplevelState _retval = cast(gdk.types.ToplevelState)_cretval;
    return _retval;
  }

  /**
      Requests that the toplevel inhibit the system shortcuts.
      
      This is asking the desktop environment/windowing system to let all
      keyboard events reach the surface, as long as it is focused, instead
      of triggering system actions.
      
      If granted, the rerouting remains active until the default shortcuts
      processing is restored with [gdk.toplevel.Toplevel.restoreSystemShortcuts],
      or the request is revoked by the desktop environment, windowing system
      or the user.
      
      A typical use case for this API is remote desktop or virtual machine
      viewers which need to inhibit the default system keyboard shortcuts
      so that the remote session or virtual host gets those instead of the
      local environment.
      
      The windowing system or desktop environment may ask the user to grant
      or deny the request or even choose to ignore the request entirely.
      
      The caller can be notified whenever the request is granted or revoked
      by listening to the `propertyGdk.Toplevel:shortcuts-inhibited` property.
  
      Params:
        event = the [gdk.event.Event] that is triggering the inhibit
            request, or null if none is available
  */
  override void inhibitSystemShortcuts(gdk.event.Event event = null)
  {
    gdk_toplevel_inhibit_system_shortcuts(cast(GdkToplevel*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
  }

  /**
      Asks to lower the toplevel below other windows.
      
      The windowing system may choose to ignore the request.
      Returns: true if the surface was lowered
  */
  override bool lower()
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_lower(cast(GdkToplevel*)this._cPtr);
    return _retval;
  }

  /**
      Asks to minimize the toplevel.
      
      The windowing system may choose to ignore the request.
      Returns: true if the surface was minimized
  */
  override bool minimize()
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_minimize(cast(GdkToplevel*)this._cPtr);
    return _retval;
  }

  /**
      Present toplevel after having processed the [gdk.toplevel_layout.ToplevelLayout] rules.
      
      If the toplevel was previously not showing, it will be showed,
      otherwise it will change layout according to layout.
      
      GDK may emit the `signalGdk.Toplevel::compute-size` signal to let
      the user of this toplevel compute the preferred size of the toplevel
      surface.
      
      Presenting is asynchronous and the specified layout parameters are not
      guaranteed to be respected.
  
      Params:
        layout = the [gdk.toplevel_layout.ToplevelLayout] object used to layout
  */
  override void present(gdk.toplevel_layout.ToplevelLayout layout)
  {
    gdk_toplevel_present(cast(GdkToplevel*)this._cPtr, layout ? cast(GdkToplevelLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Restore default system keyboard shortcuts which were previously
      inhibited.
      
      This undoes the effect of [gdk.toplevel.Toplevel.inhibitSystemShortcuts].
  */
  override void restoreSystemShortcuts()
  {
    gdk_toplevel_restore_system_shortcuts(cast(GdkToplevel*)this._cPtr);
  }

  /**
      Sets the toplevel to be decorated.
      
      Setting decorated to false hints the desktop environment
      that the surface has its own, client-side decorations and
      does not need to have window decorations added.
  
      Params:
        decorated = true to request decorations
  */
  override void setDecorated(bool decorated)
  {
    gdk_toplevel_set_decorated(cast(GdkToplevel*)this._cPtr, decorated);
  }

  /**
      Sets the toplevel to be deletable.
      
      Setting deletable to true hints the desktop environment
      that it should offer the user a way to close the surface.
  
      Params:
        deletable = true to request a delete button
  */
  override void setDeletable(bool deletable)
  {
    gdk_toplevel_set_deletable(cast(GdkToplevel*)this._cPtr, deletable);
  }

  /**
      Sets a list of icons for the surface.
      
      One of these will be used to represent the surface in iconic form.
      The icon may be shown in window lists or task bars. Which icon
      size is shown depends on the window manager. The window manager
      can scale the icon but setting several size icons can give better
      image quality.
      
      Note that some platforms don't support surface icons.
  
      Params:
        surfaces = A list of textures to use as icon, of different sizes
  */
  override void setIconList(gdk.texture.Texture[] surfaces)
  {
    auto _surfaces = gListFromD!(gdk.texture.Texture)(surfaces);
    scope(exit) containerFree!(GList*, gdk.texture.Texture, GidOwnership.None)(_surfaces);
    gdk_toplevel_set_icon_list(cast(GdkToplevel*)this._cPtr, _surfaces);
  }

  /**
      Sets the toplevel to be modal.
      
      The application can use this hint to tell the
      window manager that a certain surface has modal
      behaviour. The window manager can use this information
      to handle modal surfaces in a special way.
      
      You should only use this on surfaces for which you have
      previously called [gdk.toplevel.Toplevel.setTransientFor].
  
      Params:
        modal = true if the surface is modal, false otherwise.
  */
  override void setModal(bool modal)
  {
    gdk_toplevel_set_modal(cast(GdkToplevel*)this._cPtr, modal);
  }

  /**
      Sets the startup notification ID.
      
      When using GTK, typically you should use
      [[gtk.window.Window.setStartupId]](../gtk4/method.Window.set_startup_id.html)
      instead of this low-level function.
  
      Params:
        startupId = a string with startup-notification identifier
  */
  override void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gdk_toplevel_set_startup_id(cast(GdkToplevel*)this._cPtr, _startupId);
  }

  /**
      Sets the title of a toplevel surface.
      
      The title maybe be displayed in the titlebar,
      in lists of windows, etc.
  
      Params:
        title = title of surface
  */
  override void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gdk_toplevel_set_title(cast(GdkToplevel*)this._cPtr, _title);
  }

  /**
      Sets a transient-for parent.
      
      Indicates to the window manager that surface is a transient
      dialog associated with the application surface parent. This
      allows the window manager to do things like center surface
      on parent and keep surface above parent.
      
      See [[gtk.window.Window.setTransientFor]](../gtk4/method.Window.set_transient_for.html)
      if you’re using [GtkWindow](../gtk4/class.Window.html).
  
      Params:
        parent = another toplevel [gdk.surface.Surface]
  */
  override void setTransientFor(gdk.surface.Surface parent)
  {
    gdk_toplevel_set_transient_for(cast(GdkToplevel*)this._cPtr, parent ? cast(GdkSurface*)parent._cPtr(No.Dup) : null);
  }

  /**
      Asks the windowing system to show the window menu.
      
      The window menu is the menu shown when right-clicking the titlebar
      on traditional windows managed by the window manager. This is useful
      for windows using client-side decorations, activating it with a
      right-click on the window decorations.
  
      Params:
        event = a [gdk.event.Event] to show the menu for
      Returns: true if the window menu was shown and false otherwise.
  */
  override bool showWindowMenu(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_show_window_menu(cast(GdkToplevel*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns whether the desktop environment supports
      tiled window states.
      Returns: true if the desktop environment supports tiled window states
  */
  override bool supportsEdgeConstraints()
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_supports_edge_constraints(cast(GdkToplevel*)this._cPtr);
    return _retval;
  }

  /** */
  override bool titlebarGesture(gdk.types.TitlebarGesture gesture)
  {
    bool _retval;
    _retval = cast(bool)gdk_toplevel_titlebar_gesture(cast(GdkToplevel*)this._cPtr, gesture);
    return _retval;
  }

  /**
      Connect to `ComputeSize` signal.
  
      Emitted when the size for the surface needs to be computed, when
      it is present.
      
      This signal will normally be emitted during or after a call to
      [gdk.toplevel.Toplevel.present], depending on the configuration
      received by the windowing system. It may also be emitted at any
      other point in time, in response to the windowing system
      spontaneously changing the configuration of the toplevel surface.
      
      It is the responsibility of the toplevel user to handle this signal
      and compute the desired size of the toplevel, given the information
      passed via the [gdk.toplevel_size.ToplevelSize] object. Failing to do so
      will result in an arbitrary size being used as a result.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.toplevel_size.ToplevelSize size, gdk.toplevel.Toplevel toplevel))
  
          `size` a [gdk.toplevel_size.ToplevelSize] (optional)
  
          `toplevel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.toplevel_size.ToplevelSize)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.toplevel.Toplevel)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("compute-size", closure, after);
  }
}
