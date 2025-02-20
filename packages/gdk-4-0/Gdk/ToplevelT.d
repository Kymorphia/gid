module Gdk.ToplevelT;

public import Gdk.ToplevelIfaceProxy;
public import GObject.DClosure;
public import Gdk.Device;
public import Gdk.Event;
public import Gdk.Surface;
public import Gdk.Texture;
public import Gdk.ToplevelLayout;
public import Gdk.ToplevelSize;
public import Gdk.Types;
public import Gdk.c.functions;
public import Gdk.c.types;
public import Gid.gid;

/**
 * A `GdkToplevel` is a freestanding toplevel surface.
 * The `GdkToplevel` interface provides useful APIs for interacting with
 * the windowing system, such as controlling maximization and size of the
 * surface, setting icons and transient parents for dialogs.
 */
template ToplevelT()
{

  /**
   * Begins an interactive move operation.
   * You might use this function to implement draggable titlebars.
   * Params:
   *   device = the device used for the operation
   *   button = the button being used to drag, or 0 for a keyboard-initiated drag
   *   x = surface X coordinate of mouse click that began the drag
   *   y = surface Y coordinate of mouse click that began the drag
   *   timestamp = timestamp of mouse click that began the drag $(LPAREN)use
   *     [Gdk.Event.getTime]$(RPAREN)
   */
  override void beginMove(Device device, int button, double x, double y, uint timestamp)
  {
    gdk_toplevel_begin_move(cast(GdkToplevel*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null, button, x, y, timestamp);
  }

  /**
   * Begins an interactive resize operation.
   * You might use this function to implement a “window resize grip.”
   * Params:
   *   edge = the edge or corner from which the drag is started
   *   device = the device used for the operation
   *   button = the button being used to drag, or 0 for a keyboard-initiated drag
   *   x = surface X coordinate of mouse click that began the drag
   *   y = surface Y coordinate of mouse click that began the drag
   *   timestamp = timestamp of mouse click that began the drag $(LPAREN)use
   *     [Gdk.Event.getTime]$(RPAREN)
   */
  override void beginResize(SurfaceEdge edge, Device device, int button, double x, double y, uint timestamp)
  {
    gdk_toplevel_begin_resize(cast(GdkToplevel*)cPtr, edge, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null, button, x, y, timestamp);
  }

  /**
   * Sets keyboard focus to surface.
   * In most cases, [[Gtk.Window.presentWithTime]](../gtk4/method.Window.present_with_time.html)
   * should be used on a [GtkWindow](../gtk4/class.Window.html), rather than
   * calling this function.
   * Params:
   *   timestamp = timestamp of the event triggering the surface focus
   */
  override void focus(uint timestamp)
  {
    gdk_toplevel_focus(cast(GdkToplevel*)cPtr, timestamp);
  }

  /**
   * Gets the bitwise or of the currently active surface state flags,
   * from the `GdkToplevelState` enumeration.
   * Returns: surface state bitfield
   */
  override ToplevelState getState()
  {
    GdkToplevelState _cretval;
    _cretval = gdk_toplevel_get_state(cast(GdkToplevel*)cPtr);
    ToplevelState _retval = cast(ToplevelState)_cretval;
    return _retval;
  }

  /**
   * Requests that the toplevel inhibit the system shortcuts.
   * This is asking the desktop environment/windowing system to let all
   * keyboard events reach the surface, as long as it is focused, instead
   * of triggering system actions.
   * If granted, the rerouting remains active until the default shortcuts
   * processing is restored with [Gdk.Toplevel.restoreSystemShortcuts],
   * or the request is revoked by the desktop environment, windowing system
   * or the user.
   * A typical use case for this API is remote desktop or virtual machine
   * viewers which need to inhibit the default system keyboard shortcuts
   * so that the remote session or virtual host gets those instead of the
   * local environment.
   * The windowing system or desktop environment may ask the user to grant
   * or deny the request or even choose to ignore the request entirely.
   * The caller can be notified whenever the request is granted or revoked
   * by listening to the propertyGdk.Toplevel:shortcuts-inhibited property.
   * Params:
   *   event = the `GdkEvent` that is triggering the inhibit
   *     request, or %NULL if none is available
   */
  override void inhibitSystemShortcuts(Event event)
  {
    gdk_toplevel_inhibit_system_shortcuts(cast(GdkToplevel*)cPtr, event ? cast(GdkEvent*)event.cPtr(No.Dup) : null);
  }

  /**
   * Asks to lower the toplevel below other windows.
   * The windowing system may choose to ignore the request.
   * Returns: %TRUE if the surface was lowered
   */
  override bool lower()
  {
    bool _retval;
    _retval = gdk_toplevel_lower(cast(GdkToplevel*)cPtr);
    return _retval;
  }

  /**
   * Asks to minimize the toplevel.
   * The windowing system may choose to ignore the request.
   * Returns: %TRUE if the surface was minimized
   */
  override bool minimize()
  {
    bool _retval;
    _retval = gdk_toplevel_minimize(cast(GdkToplevel*)cPtr);
    return _retval;
  }

  /**
   * Present toplevel after having processed the `GdkToplevelLayout` rules.
   * If the toplevel was previously not showing, it will be showed,
   * otherwise it will change layout according to layout.
   * GDK may emit the signalGdk.Toplevel::compute-size signal to let
   * the user of this toplevel compute the preferred size of the toplevel
   * surface.
   * Presenting is asynchronous and the specified layout parameters are not
   * guaranteed to be respected.
   * Params:
   *   layout = the `GdkToplevelLayout` object used to layout
   */
  override void present(ToplevelLayout layout)
  {
    gdk_toplevel_present(cast(GdkToplevel*)cPtr, layout ? cast(GdkToplevelLayout*)layout.cPtr(No.Dup) : null);
  }

  /**
   * Restore default system keyboard shortcuts which were previously
   * inhibited.
   * This undoes the effect of [Gdk.Toplevel.inhibitSystemShortcuts].
   */
  override void restoreSystemShortcuts()
  {
    gdk_toplevel_restore_system_shortcuts(cast(GdkToplevel*)cPtr);
  }

  /**
   * Sets the toplevel to be decorated.
   * Setting decorated to %FALSE hints the desktop environment
   * that the surface has its own, client-side decorations and
   * does not need to have window decorations added.
   * Params:
   *   decorated = %TRUE to request decorations
   */
  override void setDecorated(bool decorated)
  {
    gdk_toplevel_set_decorated(cast(GdkToplevel*)cPtr, decorated);
  }

  /**
   * Sets the toplevel to be deletable.
   * Setting deletable to %TRUE hints the desktop environment
   * that it should offer the user a way to close the surface.
   * Params:
   *   deletable = %TRUE to request a delete button
   */
  override void setDeletable(bool deletable)
  {
    gdk_toplevel_set_deletable(cast(GdkToplevel*)cPtr, deletable);
  }

  /**
   * Sets a list of icons for the surface.
   * One of these will be used to represent the surface in iconic form.
   * The icon may be shown in window lists or task bars. Which icon
   * size is shown depends on the window manager. The window manager
   * can scale the icon but setting several size icons can give better
   * image quality.
   * Note that some platforms don't support surface icons.
   * Params:
   *   surfaces = A list of textures to use as icon, of different sizes
   */
  override void setIconList(Texture[] surfaces)
  {
    auto _surfaces = gListFromD!(Texture)(surfaces);
    scope(exit) containerFree!(GList*, Texture, GidOwnership.None)(_surfaces);
    gdk_toplevel_set_icon_list(cast(GdkToplevel*)cPtr, _surfaces);
  }

  /**
   * Sets the toplevel to be modal.
   * The application can use this hint to tell the
   * window manager that a certain surface has modal
   * behaviour. The window manager can use this information
   * to handle modal surfaces in a special way.
   * You should only use this on surfaces for which you have
   * previously called [Gdk.Toplevel.setTransientFor].
   * Params:
   *   modal = %TRUE if the surface is modal, %FALSE otherwise.
   */
  override void setModal(bool modal)
  {
    gdk_toplevel_set_modal(cast(GdkToplevel*)cPtr, modal);
  }

  /**
   * Sets the startup notification ID.
   * When using GTK, typically you should use
   * [[Gtk.Window.setStartupId]](../gtk4/method.Window.set_startup_id.html)
   * instead of this low-level function.
   * Params:
   *   startupId = a string with startup-notification identifier
   */
  override void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gdk_toplevel_set_startup_id(cast(GdkToplevel*)cPtr, _startupId);
  }

  /**
   * Sets the title of a toplevel surface.
   * The title maybe be displayed in the titlebar,
   * in lists of windows, etc.
   * Params:
   *   title = title of surface
   */
  override void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gdk_toplevel_set_title(cast(GdkToplevel*)cPtr, _title);
  }

  /**
   * Sets a transient-for parent.
   * Indicates to the window manager that surface is a transient
   * dialog associated with the application surface parent. This
   * allows the window manager to do things like center surface
   * on parent and keep surface above parent.
   * See [[Gtk.Window.setTransientFor]](../gtk4/method.Window.set_transient_for.html)
   * if you’re using [GtkWindow](../gtk4/class.Window.html).
   * Params:
   *   parent = another toplevel `GdkSurface`
   */
  override void setTransientFor(Surface parent)
  {
    gdk_toplevel_set_transient_for(cast(GdkToplevel*)cPtr, parent ? cast(GdkSurface*)parent.cPtr(No.Dup) : null);
  }

  /**
   * Asks the windowing system to show the window menu.
   * The window menu is the menu shown when right-clicking the titlebar
   * on traditional windows managed by the window manager. This is useful
   * for windows using client-side decorations, activating it with a
   * right-click on the window decorations.
   * Params:
   *   event = a `GdkEvent` to show the menu for
   * Returns: %TRUE if the window menu was shown and %FALSE otherwise.
   */
  override bool showWindowMenu(Event event)
  {
    bool _retval;
    _retval = gdk_toplevel_show_window_menu(cast(GdkToplevel*)cPtr, event ? cast(GdkEvent*)event.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Returns whether the desktop environment supports
   * tiled window states.
   * Returns: %TRUE if the desktop environment supports tiled window states
   */
  override bool supportsEdgeConstraints()
  {
    bool _retval;
    _retval = gdk_toplevel_supports_edge_constraints(cast(GdkToplevel*)cPtr);
    return _retval;
  }

  override bool titlebarGesture(TitlebarGesture gesture)
  {
    bool _retval;
    _retval = gdk_toplevel_titlebar_gesture(cast(GdkToplevel*)cPtr, gesture);
    return _retval;
  }

  /**
   * Emitted when the size for the surface needs to be computed, when
   * it is present.
   * This signal will normally be emitted during or after a call to
   * [Gdk.Toplevel.present], depending on the configuration
   * received by the windowing system. It may also be emitted at any
   * other point in time, in response to the windowing system
   * spontaneously changing the configuration of the toplevel surface.
   * It is the responsibility of the toplevel user to handle this signal
   * and compute the desired size of the toplevel, given the information
   * passed via the [Gdk.ToplevelSize] object. Failing to do so
   * will result in an arbitrary size being used as a result.
   * Params
   *   size = a `GdkToplevelSize`
   *   toplevel = the instance the signal is connected to
   */
  alias ComputeSizeCallbackDlg = void delegate(ToplevelSize size, Toplevel toplevel);
  alias ComputeSizeCallbackFunc = void function(ToplevelSize size, Toplevel toplevel);

  /**
   * Connect to ComputeSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ComputeSizeCallbackDlg) || is(T : ComputeSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto toplevel = getVal!Toplevel(_paramVals);
      auto size = getVal!ToplevelSize(&_paramVals[1]);
      _dClosure.dlg(size, toplevel);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("compute-size", closure, after);
  }
}
