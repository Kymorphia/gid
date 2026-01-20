/// Module for [Window] class
module gtk.window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event_key;
import gdk.rectangle;
import gdk.screen;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.accel_group;
import gtk.application;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;
import gtk.window_group;

/**
    A GtkWindow is a toplevel window which can contain other widgets.
    Windows normally have decorations that are under the control
    of the windowing system and allow the user to manipulate the window
    (resize it, move it, close it,...).
    
    # GtkWindow as GtkBuildable
    
    The GtkWindow implementation of the #GtkBuildable interface supports a
    custom `<accel-groups>` element, which supports any number of `<group>`
    elements representing the #GtkAccelGroup objects you want to add to
    your window (synonymous with [gtk.window.Window.addAccelGroup].
    
    It also supports the `<initial-focus>` element, whose name property names
    the widget to receive the focus when the window is mapped.
    
    An example of a UI definition fragment with accel groups:
    
    ```xml
    <object class="GtkWindow">
      <accel-groups>
        <group name="accelgroup1"/>
      </accel-groups>
      <initial-focus name="thunderclap"/>
    </object>
    
    ...
    
    <object class="GtkAccelGroup" id="accelgroup1"/>
    ```
    
    The GtkWindow implementation of the #GtkBuildable interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a `<child>` element.
    
    # CSS nodes
    
    ```plain
    window.background
    ├── decoration
    ├── <titlebar child>.titlebar [.default-decoration]
    ╰── <child>
    ```
    
    GtkWindow has a main CSS node with name window and style class .background,
    and a subnode with name decoration.
    
    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .tiled, .maximized, .fullscreen. Specialized
    types of window often add their own discriminating style classes, such as
    .popup or .tooltip.
    
    GtkWindow adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.
*/
class Window : gtk.bin.Bin
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
    return cast(void function())gtk_window_get_type != &gidSymbolNotFound ? gtk_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Window self()
  {
    return this;
  }

  /**
      Get `acceptFocus` property.
      Returns: Whether the window should receive the input focus.
  */
  @property bool acceptFocus()
  {
    return getAcceptFocus();
  }

  /**
      Set `acceptFocus` property.
      Params:
        propval = Whether the window should receive the input focus.
  */
  @property void acceptFocus(bool propval)
  {
    return setAcceptFocus(propval);
  }

  /**
      Get `application` property.
      Returns: The #GtkApplication associated with the window.
        
        The application will be kept alive for at least as long as it
        has any windows associated with it (see [gio.application.Application.hold]
        for a way to keep it alive without windows).
        
        Normally, the connection between the application and the window
        will remain until the window is destroyed, but you can explicitly
        remove it by setting the :application property to null.
  */
  @property gtk.application.Application application()
  {
    return getApplication();
  }

  /**
      Set `application` property.
      Params:
        propval = The #GtkApplication associated with the window.
          
          The application will be kept alive for at least as long as it
          has any windows associated with it (see [gio.application.Application.hold]
          for a way to keep it alive without windows).
          
          Normally, the connection between the application and the window
          will remain until the window is destroyed, but you can explicitly
          remove it by setting the :application property to null.
  */
  @property void application(gtk.application.Application propval)
  {
    return setApplication(propval);
  }

  /**
      Get `attachedTo` property.
      Returns: The widget to which this window is attached.
        See [gtk.window.Window.setAttachedTo].
        
        Examples of places where specifying this relation is useful are
        for instance a #GtkMenu created by a #GtkComboBox, a completion
        popup window created by #GtkEntry or a typeahead search entry
        created by #GtkTreeView.
  */
  @property gtk.widget.Widget attachedTo()
  {
    return getAttachedTo();
  }

  /**
      Set `attachedTo` property.
      Params:
        propval = The widget to which this window is attached.
          See [gtk.window.Window.setAttachedTo].
          
          Examples of places where specifying this relation is useful are
          for instance a #GtkMenu created by a #GtkComboBox, a completion
          popup window created by #GtkEntry or a typeahead search entry
          created by #GtkTreeView.
  */
  @property void attachedTo(gtk.widget.Widget propval)
  {
    return setAttachedTo(propval);
  }

  /**
      Get `decorated` property.
      Returns: Whether the window should be decorated by the window manager.
  */
  @property bool decorated()
  {
    return getDecorated();
  }

  /**
      Set `decorated` property.
      Params:
        propval = Whether the window should be decorated by the window manager.
  */
  @property void decorated(bool propval)
  {
    return setDecorated(propval);
  }

  /** */
  @property int defaultHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("default-height");
  }

  /** */
  @property void defaultHeight(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("default-height", propval);
  }

  /** */
  @property int defaultWidth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("default-width");
  }

  /** */
  @property void defaultWidth(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("default-width", propval);
  }

  /**
      Get `deletable` property.
      Returns: Whether the window frame should have a close button.
  */
  @property bool deletable()
  {
    return getDeletable();
  }

  /**
      Set `deletable` property.
      Params:
        propval = Whether the window frame should have a close button.
  */
  @property void deletable(bool propval)
  {
    return setDeletable(propval);
  }

  /** */
  @property bool destroyWithParent()
  {
    return getDestroyWithParent();
  }

  /** */
  @property void destroyWithParent(bool propval)
  {
    return setDestroyWithParent(propval);
  }

  /**
      Get `focusOnMap` property.
      Returns: Whether the window should receive the input focus when mapped.
  */
  @property bool focusOnMap()
  {
    return getFocusOnMap();
  }

  /**
      Set `focusOnMap` property.
      Params:
        propval = Whether the window should receive the input focus when mapped.
  */
  @property void focusOnMap(bool propval)
  {
    return setFocusOnMap(propval);
  }

  /**
      Get `focusVisible` property.
      Returns: Whether 'focus rectangles' are currently visible in this window.
        
        This property is maintained by GTK+ based on user input
        and should not be set by applications.
  */
  @property bool focusVisible()
  {
    return getFocusVisible();
  }

  /**
      Set `focusVisible` property.
      Params:
        propval = Whether 'focus rectangles' are currently visible in this window.
          
          This property is maintained by GTK+ based on user input
          and should not be set by applications.
  */
  @property void focusVisible(bool propval)
  {
    return setFocusVisible(propval);
  }

  /**
      Get `gravity` property.
      Returns: The window gravity of the window. See [gtk.window.Window.move] and #GdkGravity for
        more details about window gravity.
  */
  @property gdk.types.Gravity gravity()
  {
    return getGravity();
  }

  /**
      Set `gravity` property.
      Params:
        propval = The window gravity of the window. See [gtk.window.Window.move] and #GdkGravity for
          more details about window gravity.
  */
  @property void gravity(gdk.types.Gravity propval)
  {
    return setGravity(propval);
  }

  /**
      Get `hasResizeGrip` property.
      Returns: Whether the window has a corner resize grip.
        
        Note that the resize grip is only shown if the window is
        actually resizable and not maximized. Use
        #GtkWindow:resize-grip-visible to find out if the resize
        grip is currently shown.
  
      Deprecated: Resize grips have been removed.
  */
  @property bool hasResizeGrip()
  {
    return getHasResizeGrip();
  }

  /**
      Set `hasResizeGrip` property.
      Params:
        propval = Whether the window has a corner resize grip.
          
          Note that the resize grip is only shown if the window is
          actually resizable and not maximized. Use
          #GtkWindow:resize-grip-visible to find out if the resize
          grip is currently shown.
  
      Deprecated: Resize grips have been removed.
  */
  @property void hasResizeGrip(bool propval)
  {
    return setHasResizeGrip(propval);
  }

  /**
      Get `hideTitlebarWhenMaximized` property.
      Returns: Whether the titlebar should be hidden during maximization.
  */
  @property bool hideTitlebarWhenMaximized()
  {
    return getHideTitlebarWhenMaximized();
  }

  /**
      Set `hideTitlebarWhenMaximized` property.
      Params:
        propval = Whether the titlebar should be hidden during maximization.
  */
  @property void hideTitlebarWhenMaximized(bool propval)
  {
    return setHideTitlebarWhenMaximized(propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf icon()
  {
    return getIcon();
  }

  /** */
  @property void icon(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    return setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The :icon-name property specifies the name of the themed icon to
        use as the window icon. See #GtkIconTheme for more details.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The :icon-name property specifies the name of the themed icon to
          use as the window icon. See #GtkIconTheme for more details.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `mnemonicsVisible` property.
      Returns: Whether mnemonics are currently visible in this window.
        
        This property is maintained by GTK+ based on user input,
        and should not be set by applications.
  */
  @property bool mnemonicsVisible()
  {
    return getMnemonicsVisible();
  }

  /**
      Set `mnemonicsVisible` property.
      Params:
        propval = Whether mnemonics are currently visible in this window.
          
          This property is maintained by GTK+ based on user input,
          and should not be set by applications.
  */
  @property void mnemonicsVisible(bool propval)
  {
    return setMnemonicsVisible(propval);
  }

  /** */
  @property bool modal()
  {
    return getModal();
  }

  /** */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /** */
  @property bool resizable()
  {
    return getResizable();
  }

  /** */
  @property void resizable(bool propval)
  {
    return setResizable(propval);
  }

  /**
      Get `resizeGripVisible` property.
      Returns: Whether a corner resize grip is currently shown.
  
      Deprecated: Resize grips have been removed.
  */
  @property bool resizeGripVisible()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("resize-grip-visible");
  }

  /** */
  @property string role()
  {
    return getRole();
  }

  /** */
  @property void role(string propval)
  {
    return setRole(propval);
  }

  /** */
  @property gdk.screen.Screen screen()
  {
    return getScreen();
  }

  /** */
  @property void screen(gdk.screen.Screen propval)
  {
    return setScreen(propval);
  }

  /** */
  @property bool skipPagerHint()
  {
    return getSkipPagerHint();
  }

  /** */
  @property void skipPagerHint(bool propval)
  {
    return setSkipPagerHint(propval);
  }

  /** */
  @property bool skipTaskbarHint()
  {
    return getSkipTaskbarHint();
  }

  /** */
  @property void skipTaskbarHint(bool propval)
  {
    return setSkipTaskbarHint(propval);
  }

  /**
      Set `startupId` property.
      Params:
        propval = The :startup-id is a write-only property for setting window's
          startup notification identifier. See [gtk.window.Window.setStartupId]
          for more details.
  */
  @property void startupId(string propval)
  {
    return setStartupId(propval);
  }

  /** */
  @property string title()
  {
    return getTitle();
  }

  /** */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `transientFor` property.
      Returns: The transient parent of the window. See [gtk.window.Window.setTransientFor] for
        more details about transient windows.
  */
  @property gtk.window.Window transientFor()
  {
    return getTransientFor();
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the window. See [gtk.window.Window.setTransientFor] for
          more details about transient windows.
  */
  @property void transientFor(gtk.window.Window propval)
  {
    return setTransientFor(propval);
  }

  /** */
  @property gdk.types.WindowTypeHint typeHint()
  {
    return getTypeHint();
  }

  /** */
  @property void typeHint(gdk.types.WindowTypeHint propval)
  {
    return setTypeHint(propval);
  }

  /** */
  @property bool urgencyHint()
  {
    return getUrgencyHint();
  }

  /** */
  @property void urgencyHint(bool propval)
  {
    return setUrgencyHint(propval);
  }

  /** */
  @property gtk.types.WindowPosition windowPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.WindowPosition)("window-position");
  }

  /** */
  @property void windowPosition(gtk.types.WindowPosition propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.WindowPosition)("window-position", propval);
  }

  /**
      Creates a new #GtkWindow, which is a toplevel window that can
      contain other widgets. Nearly always, the type of the window should
      be #GTK_WINDOW_TOPLEVEL. If you’re implementing something like a
      popup menu from scratch (which is a bad idea, just use #GtkMenu),
      you might use #GTK_WINDOW_POPUP. #GTK_WINDOW_POPUP is not for
      dialogs, though in some other toolkits dialogs are called “popups”.
      In GTK+, #GTK_WINDOW_POPUP means a pop-up menu or pop-up tooltip.
      On X11, popup windows are not controlled by the
      [window manager][gtk-X11-arch].
      
      If you simply want an undecorated window (no window borders), use
      [gtk.window.Window.setDecorated], don’t use #GTK_WINDOW_POPUP.
      
      All top-level windows created by [gtk.window.Window.new_] are stored in
      an internal top-level window list.  This list can be obtained from
      [gtk.window.Window.listToplevels].  Due to Gtk+ keeping a reference to
      the window internally, [gtk.window.Window.new_] does not return a reference
      to the caller.
      
      To delete a #GtkWindow, call [gtk.widget.Widget.destroy].
  
      Params:
        type = type of window
      Returns: a new #GtkWindow.
  */
  this(gtk.types.WindowType type)
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_new(type);
    this(_cretval, No.Take);
  }

  /**
      Gets the value set by [gtk.window.Window.setDefaultIconList].
      The list is a copy and should be freed with [glib.list.List.free],
      but the pixbufs in the list have not had their reference count
      incremented.
      Returns: copy of default icon list
  */
  static gdkpixbuf.pixbuf.Pixbuf[] getDefaultIconList()
  {
    GList* _cretval;
    _cretval = gtk_window_get_default_icon_list();
    auto _retval = gListToD!(gdkpixbuf.pixbuf.Pixbuf, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the fallback icon name for windows that has been set
      with [gtk.window.Window.setDefaultIconName]. The returned
      string is owned by GTK+ and should not be modified. It
      is only valid until the next call to
      [gtk.window.Window.setDefaultIconName].
      Returns: the fallback icon name for windows
  */
  static string getDefaultIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_default_icon_name();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns a list of all existing toplevel windows. The widgets
      in the list are not individually referenced. If you want
      to iterate through the list and perform actions involving
      callbacks that might destroy the widgets, you must call
      `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first, and
      then unref all the widgets afterwards.
      Returns: list of toplevel widgets
  */
  static gtk.widget.Widget[] listToplevels()
  {
    GList* _cretval;
    _cretval = gtk_window_list_toplevels();
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      By default, after showing the first #GtkWindow, GTK+ calls
      [gdk.global.notifyStartupComplete].  Call this function to disable
      the automatic startup notification. You might do this if your
      first window is a splash screen, and you want to delay notification
      until after your real main window has been shown, for example.
      
      In that example, you would disable startup notification
      temporarily, show your splash screen, then re-enable it so that
      showing the main window would automatically result in notification.
  
      Params:
        setting = true to automatically do startup notification
  */
  static void setAutoStartupNotification(bool setting)
  {
    gtk_window_set_auto_startup_notification(setting);
  }

  /**
      Sets an icon to be used as fallback for windows that haven't
      had [gtk.window.Window.setIcon] called on them from a pixbuf.
  
      Params:
        icon = the icon
  */
  static void setDefaultIcon(gdkpixbuf.pixbuf.Pixbuf icon)
  {
    gtk_window_set_default_icon(icon ? cast(GdkPixbuf*)icon._cPtr(No.Dup) : null);
  }

  /**
      Sets an icon to be used as fallback for windows that haven't
      had [gtk.window.Window.setIconList] called on them from a file
      on disk. Warns on failure if err is null.
  
      Params:
        filename = location of icon file
      Returns: true if setting the icon succeeded.
      Throws: [ErrorWrap]
  */
  static bool setDefaultIconFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_window_set_default_icon_from_file(_filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets an icon to be used as fallback for windows that haven't
      had [gtk.window.Window.setIconList] called on them from a named
      themed icon, see [gtk.window.Window.setIconName].
  
      Params:
        name = the name of the themed icon
  */
  static void setDefaultIconName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_window_set_default_icon_name(_name);
  }

  /**
      Opens or closes the [interactive debugger][interactive-debugging],
      which offers access to the widget hierarchy of the application
      and to useful debugging tools.
  
      Params:
        enable = true to enable interactive debugging
  */
  static void setInteractiveDebugging(bool enable)
  {
    gtk_window_set_interactive_debugging(enable);
  }

  /**
      Activates the default widget for the window, unless the current
      focused widget has been configured to receive the default action
      (see [gtk.widget.Widget.setReceivesDefault]), in which case the
      focused widget is activated.
      Returns: true if a widget got activated.
  */
  bool activateDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_activate_default(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Activates the current focused widget within the window.
      Returns: true if a widget got activated.
  */
  bool activateFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_activate_focus(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Activates mnemonics and accelerators for this #GtkWindow. This is normally
      called by the default ::key_press_event handler for toplevel windows,
      however in some cases it may be useful to call this directly when
      overriding the standard key handling for a toplevel window.
  
      Params:
        event = a #GdkEventKey
      Returns: true if a mnemonic or accelerator was found and activated.
  */
  bool activateKey(gdk.event_key.EventKey event)
  {
    bool _retval;
    _retval = cast(bool)gtk_window_activate_key(cast(GtkWindow*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr : null);
    return _retval;
  }

  /**
      Associate accel_group with window, such that calling
      [gtk.global.accelGroupsActivate] on window will activate accelerators
      in accel_group.
  
      Params:
        accelGroup = a #GtkAccelGroup
  */
  void addAccelGroup(gtk.accel_group.AccelGroup accelGroup)
  {
    gtk_window_add_accel_group(cast(GtkWindow*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Adds a mnemonic to this window.
  
      Params:
        keyval = the mnemonic
        target = the widget that gets activated by the mnemonic
  */
  void addMnemonic(uint keyval, gtk.widget.Widget target)
  {
    gtk_window_add_mnemonic(cast(GtkWindow*)this._cPtr, keyval, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null);
  }

  /**
      Starts moving a window. This function is used if an application has
      window movement grips. When GDK can support it, the window movement
      will be done using the standard mechanism for the
      [window manager][gtk-X11-arch] or windowing
      system. Otherwise, GDK will try to emulate window movement,
      potentially not all that well, depending on the windowing system.
  
      Params:
        button = mouse button that initiated the drag
        rootX = X position where the user clicked to initiate the drag, in root window coordinates
        rootY = Y position where the user clicked to initiate the drag
        timestamp = timestamp from the click event that initiated the drag
  */
  void beginMoveDrag(int button, int rootX, int rootY, uint timestamp)
  {
    gtk_window_begin_move_drag(cast(GtkWindow*)this._cPtr, button, rootX, rootY, timestamp);
  }

  /**
      Starts resizing a window. This function is used if an application
      has window resizing controls. When GDK can support it, the resize
      will be done using the standard mechanism for the
      [window manager][gtk-X11-arch] or windowing
      system. Otherwise, GDK will try to emulate window resizing,
      potentially not all that well, depending on the windowing system.
  
      Params:
        edge = position of the resize control
        button = mouse button that initiated the drag
        rootX = X position where the user clicked to initiate the drag, in root window coordinates
        rootY = Y position where the user clicked to initiate the drag
        timestamp = timestamp from the click event that initiated the drag
  */
  void beginResizeDrag(gdk.types.WindowEdge edge, int button, int rootX, int rootY, uint timestamp)
  {
    gtk_window_begin_resize_drag(cast(GtkWindow*)this._cPtr, edge, button, rootX, rootY, timestamp);
  }

  /**
      Requests that the window is closed, similar to what happens
      when a window manager close button is clicked.
      
      This function can be used with close buttons in custom
      titlebars.
  */
  void close()
  {
    gtk_window_close(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to deiconify (i.e. unminimize) the specified window. Note
      that you shouldn’t assume the window is definitely deiconified
      afterward, because other entities (e.g. the user or
      [window manager][gtk-X11-arch])) could iconify it
      again before your code which assumes deiconification gets to run.
      
      You can track iconification via the “window-state-event” signal
      on #GtkWidget.
  */
  void deiconify()
  {
    gtk_window_deiconify(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place window in the fullscreen state. Note that you
      shouldn’t assume the window is definitely full screen afterward,
      because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could unfullscreen it
      again, and not all window managers honor requests to fullscreen
      windows. But normally the window will end up fullscreen. Just
      don’t write code that crashes if not.
      
      You can track the fullscreen state via the “window-state-event” signal
      on #GtkWidget.
  */
  void fullscreen()
  {
    gtk_window_fullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place window in the fullscreen state. Note that you shouldn't assume
      the window is definitely full screen afterward.
      
      You can track the fullscreen state via the "window-state-event" signal
      on #GtkWidget.
  
      Params:
        screen = a #GdkScreen to draw to
        monitor = which monitor to go fullscreen on
  */
  void fullscreenOnMonitor(gdk.screen.Screen screen, int monitor)
  {
    gtk_window_fullscreen_on_monitor(cast(GtkWindow*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, monitor);
  }

  /**
      Gets the value set by [gtk.window.Window.setAcceptFocus].
      Returns: true if window should receive the input focus
  */
  bool getAcceptFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_accept_focus(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkApplication associated with the window (if any).
      Returns: a #GtkApplication, or null
  */
  gtk.application.Application getApplication()
  {
    GtkApplication* _cretval;
    _cretval = gtk_window_get_application(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.application.Application)(cast(GtkApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the attach widget for this window. See
      [gtk.window.Window.setAttachedTo].
      Returns: the widget where the window
        is attached, or null if the window is not attached to any widget.
  */
  gtk.widget.Widget getAttachedTo()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_attached_to(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have decorations
      such as a title bar via [gtk.window.Window.setDecorated].
      Returns: true if the window has been set to have decorations
  */
  bool getDecorated()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_decorated(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default size of the window. A value of -1 for the width or
      height indicates that a default size has not been explicitly set
      for that dimension, so the “natural” size of the window will be
      used.
  
      Params:
        width = location to store the default width, or null
        height = location to store the default height, or null
  */
  void getDefaultSize(out int width, out int height)
  {
    gtk_window_get_default_size(cast(GtkWindow*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the default widget for window. See
      [gtk.window.Window.setDefault] for more details.
      Returns: the default widget, or null
        if there is none.
  */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_default_widget(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have a close button
      via [gtk.window.Window.setDeletable].
      Returns: true if the window has been set to have a close button
  */
  bool getDeletable()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_deletable(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be destroyed with its transient parent. See
      gtk_window_set_destroy_with_parent ().
      Returns: true if the window will be destroyed with its transient parent.
  */
  bool getDestroyWithParent()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_destroy_with_parent(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current focused widget within the window.
      Note that this is the widget that would have the focus
      if the toplevel window focused; if the toplevel window
      is not focused then  `gtk_widget_has_focus (widget)` will
      not be true for the widget.
      Returns: the currently focused widget,
        or null if there is none.
  */
  gtk.widget.Widget getFocus()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_focus(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setFocusOnMap].
      Returns: true if window should receive the input focus when
        mapped.
  */
  bool getFocusOnMap()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_focus_on_map(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkWindow:focus-visible property.
      Returns: true if “focus rectangles” are supposed to be visible
            in this window.
  */
  bool getFocusVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_focus_visible(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setGravity].
      Returns: window gravity
  */
  gdk.types.Gravity getGravity()
  {
    GdkGravity _cretval;
    _cretval = gtk_window_get_gravity(cast(GtkWindow*)this._cPtr);
    gdk.types.Gravity _retval = cast(gdk.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Returns the group for window or the default group, if
      window is null or if window does not have an explicit
      window group.
      Returns: the #GtkWindowGroup for a window or the default group
  */
  gtk.window_group.WindowGroup getGroup()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_get_group(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window_group.WindowGroup)(cast(GtkWindowGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the window may have a resize grip.
      Returns: true if the window has a resize grip
  
      Deprecated: Resize grips have been removed.
  */
  bool getHasResizeGrip()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_has_resize_grip(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window has requested to have its titlebar hidden
      when maximized. See gtk_window_set_hide_titlebar_when_maximized ().
      Returns: true if the window has requested to have its titlebar
                      hidden when maximized
  */
  bool getHideTitlebarWhenMaximized()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_hide_titlebar_when_maximized(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setIcon] (or if you've
      called [gtk.window.Window.setIconList], gets the first icon in
      the icon list).
      Returns: icon for window or null if none
  */
  gdkpixbuf.pixbuf.Pixbuf getIcon()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_window_get_icon(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the list of icons set by [gtk.window.Window.setIconList].
      The list is copied, but the reference count on each
      member won’t be incremented.
      Returns: copy of window’s icon list
  */
  gdkpixbuf.pixbuf.Pixbuf[] getIconList()
  {
    GList* _cretval;
    _cretval = gtk_window_get_icon_list(cast(GtkWindow*)this._cPtr);
    auto _retval = gListToD!(gdkpixbuf.pixbuf.Pixbuf, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the name of the themed icon for the window,
      see [gtk.window.Window.setIconName].
      Returns: the icon name or null if the window has
        no themed icon
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_icon_name(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the mnemonic modifier for this window. See
      [gtk.window.Window.setMnemonicModifier].
      Returns: the modifier mask used to activate
                      mnemonics on this window.
  */
  gdk.types.ModifierType getMnemonicModifier()
  {
    GdkModifierType _cretval;
    _cretval = gtk_window_get_mnemonic_modifier(cast(GtkWindow*)this._cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Gets the value of the #GtkWindow:mnemonics-visible property.
      Returns: true if mnemonics are supposed to be visible
        in this window.
  */
  bool getMnemonicsVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_mnemonics_visible(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window is modal. See [gtk.window.Window.setModal].
      Returns: true if the window is set to be modal and
                      establishes a grab when shown
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_modal(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the requested opacity for this window. See
      [gtk.window.Window.setOpacity].
      Returns: the requested opacity for this window.
  
      Deprecated: Use gtk_widget_get_opacity instead.
  */
  override double getOpacity()
  {
    double _retval;
    _retval = gtk_window_get_opacity(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the position you need to pass to
      [gtk.window.Window.move] to keep window in its current position.
      This means that the meaning of the returned value varies with
      window gravity. See [gtk.window.Window.move] for more details.
      
      The reliability of this function depends on the windowing system
      currently in use. Some windowing systems, such as Wayland, do not
      support a global coordinate system, and thus the position of the
      window will always be (0, 0). Others, like X11, do not have a reliable
      way to obtain the geometry of the decorations of a window if they are
      provided by the window manager. Additionally, on X11, window manager
      have been known to mismanage window gravity, which result in windows
      moving even if you use the coordinates of the current position as
      returned by this function.
      
      If you haven’t changed the window gravity, its gravity will be
      #GDK_GRAVITY_NORTH_WEST. This means that [gtk.window.Window.getPosition]
      gets the position of the top-left corner of the window manager
      frame for the window. [gtk.window.Window.move] sets the position of this
      same top-left corner.
      
      If a window has gravity #GDK_GRAVITY_STATIC the window manager
      frame is not relevant, and thus [gtk.window.Window.getPosition] will
      always produce accurate results. However you can’t use static
      gravity to do things like place a window in a corner of the screen,
      because static gravity ignores the window manager decorations.
      
      Ideally, this function should return appropriate values if the
      window has client side decorations, assuming that the windowing
      system supports global coordinates.
      
      In practice, saving the window position should not be left to
      applications, as they lack enough knowledge of the windowing
      system and the window manager state to effectively do so. The
      appropriate way to implement saving the window position is to
      use a platform-specific protocol, wherever that is available.
  
      Params:
        rootX = return location for X coordinate of
              gravity-determined reference point, or null
        rootY = return location for Y coordinate of
              gravity-determined reference point, or null
  */
  void getPosition(out int rootX, out int rootY)
  {
    gtk_window_get_position(cast(GtkWindow*)this._cPtr, cast(int*)&rootX, cast(int*)&rootY);
  }

  /**
      Gets the value set by [gtk.window.Window.setResizable].
      Returns: true if the user can resize the window
  */
  bool getResizable()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_resizable(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      If a window has a resize grip, this will retrieve the grip
      position, width and height into the specified #GdkRectangle.
  
      Params:
        rect = a pointer to a #GdkRectangle which we should store
              the resize grip area
      Returns: true if the resize grip’s area was retrieved
  
      Deprecated: Resize grips have been removed.
  */
  bool getResizeGripArea(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_resize_grip_area(cast(GtkWindow*)this._cPtr, cast(GdkRectangle*)&rect);
    return _retval;
  }

  /**
      Returns the role of the window. See [gtk.window.Window.setRole] for
      further explanation.
      Returns: the role of the window if set, or null. The
        returned is owned by the widget and must not be modified or freed.
  */
  string getRole()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_role(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the #GdkScreen associated with window.
      Returns: a #GdkScreen.
  */
  override gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_window_get_screen(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the current size of window.
      
      If window is not visible on screen, this function return the size GTK+
      will suggest to the [window manager][gtk-X11-arch] for the initial window
      size (but this is not reliably the same as the size the window manager
      will actually select). See: [gtk.window.Window.setDefaultSize].
      
      Depending on the windowing system and the window manager constraints,
      the size returned by this function may not match the size set using
      [gtk.window.Window.resize]; additionally, since [gtk.window.Window.resize] may be
      implemented as an asynchronous operation, GTK+ cannot guarantee in any
      way that this code:
      
      ```c
        // width and height are set elsewhere
        gtk_window_resize (window, width, height);
      
        int new_width, new_height;
        gtk_window_get_size (window, &new_width, &new_height);
      ```
      
      will result in `new_width` and `new_height` matching `width` and
      `height`, respectively.
      
      This function will return the logical size of the #GtkWindow,
      excluding the widgets used in client side decorations; there is,
      however, no guarantee that the result will be completely accurate
      because client side decoration may include widgets that depend on
      the user preferences and that may not be visibile at the time you
      call this function.
      
      The dimensions returned by this function are suitable for being
      stored across sessions; use [gtk.window.Window.setDefaultSize] to
      restore them when before showing the window.
      
      To avoid potential race conditions, you should only call this
      function in response to a size change notification, for instance
      inside a handler for the #GtkWidget::size-allocate signal, or
      inside a handler for the #GtkWidget::configure-event signal:
      
      ```c
      static void
      on_size_allocate (GtkWidget *widget, GtkAllocation *allocation)
      {
        int new_width, new_height;
      
        gtk_window_get_size (GTK_WINDOW (widget), &new_width, &new_height);
      
        ...
      }
      ```
      
      Note that, if you connect to the #GtkWidget::size-allocate signal,
      you should not use the dimensions of the #GtkAllocation passed to
      the signal handler, as the allocation may contain client side
      decorations added by GTK+, depending on the windowing system in
      use.
      
      If you are getting a window size in order to position the window
      on the screen, you should, instead, simply set the window’s semantic
      type with [gtk.window.Window.setTypeHint], which allows the window manager
      to e.g. center dialogs. Also, if you set the transient parent of
      dialogs with [gtk.window.Window.setTransientFor] window managers will
      often center the dialog over its parent window. It's much preferred
      to let the window manager handle these cases rather than doing it
      yourself, because all apps will behave consistently and according to
      user or system preferences, if the window manager handles it. Also,
      the window manager can take into account the size of the window
      decorations and border that it may add, and of which GTK+ has no
      knowledge. Additionally, positioning windows in global screen coordinates
      may not be allowed by the windowing system. For more information,
      see: [gtk.window.Window.setPosition].
  
      Params:
        width = return location for width, or null
        height = return location for height, or null
  */
  void getSize(out int width, out int height)
  {
    gtk_window_get_size(cast(GtkWindow*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Gets the value set by [gtk.window.Window.setSkipPagerHint].
      Returns: true if window shouldn’t be in pager
  */
  bool getSkipPagerHint()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_skip_pager_hint(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setSkipTaskbarHint]
      Returns: true if window shouldn’t be in taskbar
  */
  bool getSkipTaskbarHint()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_skip_taskbar_hint(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the window. See [gtk.window.Window.setTitle].
      Returns: the title of the window, or null if none has
        been set explicitly. The returned string is owned by the widget
        and must not be modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_title(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the custom titlebar that has been set with
      [gtk.window.Window.setTitlebar].
      Returns: the custom titlebar, or null
  */
  gtk.widget.Widget getTitlebar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_titlebar(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the transient parent for this window. See
      [gtk.window.Window.setTransientFor].
      Returns: the transient parent for this
        window, or null if no transient parent has been set.
  */
  gtk.window.Window getTransientFor()
  {
    GtkWindow* _cretval;
    _cretval = gtk_window_get_transient_for(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the type hint for this window. See [gtk.window.Window.setTypeHint].
      Returns: the type hint for window.
  */
  gdk.types.WindowTypeHint getTypeHint()
  {
    GdkWindowTypeHint _cretval;
    _cretval = gtk_window_get_type_hint(cast(GtkWindow*)this._cPtr);
    gdk.types.WindowTypeHint _retval = cast(gdk.types.WindowTypeHint)_cretval;
    return _retval;
  }

  /**
      Gets the value set by [gtk.window.Window.setUrgencyHint]
      Returns: true if window is urgent
  */
  bool getUrgencyHint()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_urgency_hint(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of the window. See #GtkWindowType.
      Returns: the type of the window
  */
  gtk.types.WindowType getWindowType()
  {
    GtkWindowType _cretval;
    _cretval = gtk_window_get_window_type(cast(GtkWindow*)this._cPtr);
    gtk.types.WindowType _retval = cast(gtk.types.WindowType)_cretval;
    return _retval;
  }

  /**
      Returns whether window has an explicit window group.
      Returns: true if window has an explicit window group.
        
        Since 2.22
  */
  bool hasGroup()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_has_group(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the input focus is within this GtkWindow.
      For real toplevel windows, this is identical to [gtk.window.Window.isActive],
      but for embedded windows, like #GtkPlug, the results will differ.
      Returns: true if the input focus is within this GtkWindow
  */
  bool hasToplevelFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_has_toplevel_focus(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Asks to iconify (i.e. minimize) the specified window. Note that
      you shouldn’t assume the window is definitely iconified afterward,
      because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could deiconify it
      again, or there may not be a window manager in which case
      iconification isn’t possible, etc. But normally the window will end
      up iconified. Just don’t write code that crashes if not.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be iconified before it ever appears
      onscreen.
      
      You can track iconification via the “window-state-event” signal
      on #GtkWidget.
  */
  void iconify()
  {
    gtk_window_iconify(cast(GtkWindow*)this._cPtr);
  }

  /**
      Returns whether the window is part of the current active toplevel.
      (That is, the toplevel window receiving keystrokes.)
      The return value is true if the window is active toplevel
      itself, but also if it is, say, a #GtkPlug embedded in the active toplevel.
      You might use this function if you wanted to draw a widget
      differently in an active window from a widget in an inactive window.
      See [gtk.window.Window.hasToplevelFocus]
      Returns: true if the window part of the current active window.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_active(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current maximized state of window.
      
      Note that since maximization is ultimately handled by the window
      manager and happens asynchronously to an application request, you
      shouldn’t assume the return value of this function changing
      immediately (or at all), as an effect of calling
      [gtk.window.Window.maximize] or [gtk.window.Window.unmaximize].
      Returns: whether the window has a maximized state.
  */
  bool isMaximized()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_maximized(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Asks to maximize window, so that it becomes full-screen. Note that
      you shouldn’t assume the window is definitely maximized afterward,
      because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could unmaximize it
      again, and not all window managers support maximization. But
      normally the window will end up maximized. Just don’t write code
      that crashes if not.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be maximized when it appears onscreen
      initially.
      
      You can track maximization via the “window-state-event” signal
      on #GtkWidget, or by listening to notifications on the
      #GtkWindow:is-maximized property.
  */
  void maximize()
  {
    gtk_window_maximize(cast(GtkWindow*)this._cPtr);
  }

  alias mnemonicActivate = gtk.widget.Widget.mnemonicActivate;

  /**
      Activates the targets associated with the mnemonic.
  
      Params:
        keyval = the mnemonic
        modifier = the modifiers
      Returns: true if the activation is done.
  */
  bool mnemonicActivate(uint keyval, gdk.types.ModifierType modifier)
  {
    bool _retval;
    _retval = cast(bool)gtk_window_mnemonic_activate(cast(GtkWindow*)this._cPtr, keyval, modifier);
    return _retval;
  }

  /**
      Asks the [window manager][gtk-X11-arch] to move
      window to the given position.  Window managers are free to ignore
      this; most window managers ignore requests for initial window
      positions (instead using a user-defined placement algorithm) and
      honor requests after the window has already been shown.
      
      Note: the position is the position of the gravity-determined
      reference point for the window. The gravity determines two things:
      first, the location of the reference point in root window
      coordinates; and second, which point on the window is positioned at
      the reference point.
      
      By default the gravity is #GDK_GRAVITY_NORTH_WEST, so the reference
      point is simply the `x`, `y` supplied to [gtk.window.Window.move]. The
      top-left corner of the window decorations (aka window frame or
      border) will be placed at `x`, `y`.  Therefore, to position a window
      at the top left of the screen, you want to use the default gravity
      (which is #GDK_GRAVITY_NORTH_WEST) and move the window to 0,0.
      
      To position a window at the bottom right corner of the screen, you
      would set #GDK_GRAVITY_SOUTH_EAST, which means that the reference
      point is at `x` + the window width and `y` + the window height, and
      the bottom-right corner of the window border will be placed at that
      reference point. So, to place a window in the bottom right corner
      you would first set gravity to south east, then write:
      `gtk_window_move (window, gdk_screen_width () - window_width,
      gdk_screen_height () - window_height)` (note that this
      example does not take multi-head scenarios into account).
      
      The [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec)
      has a nice table of gravities in the “implementation notes” section.
      
      The [gtk.window.Window.getPosition] documentation may also be relevant.
  
      Params:
        x = X coordinate to move window to
        y = Y coordinate to move window to
  */
  void move(int x, int y)
  {
    gtk_window_move(cast(GtkWindow*)this._cPtr, x, y);
  }

  /**
      Parses a standard X Window System geometry string - see the
      manual page for X (type “man X”) for details on this.
      [gtk.window.Window.parseGeometry] does work on all GTK+ ports
      including Win32 but is primarily intended for an X environment.
      
      If either a size or a position can be extracted from the
      geometry string, [gtk.window.Window.parseGeometry] returns true
      and calls [gtk.window.Window.setDefaultSize] and/or [gtk.window.Window.move]
      to resize/move the window.
      
      If [gtk.window.Window.parseGeometry] returns true, it will also
      set the #GDK_HINT_USER_POS and/or #GDK_HINT_USER_SIZE hints
      indicating to the window manager that the size/position of
      the window was user-specified. This causes most window
      managers to honor the geometry.
      
      Note that for [gtk.window.Window.parseGeometry] to work as expected, it has
      to be called when the window has its “final” size, i.e. after calling
      [gtk.widget.Widget.showAll] on the contents and [gtk.window.Window.setGeometryHints]
      on the window.
      ```c
      #include <gtk/gtk.h>
      
      static void
      fill_with_content (GtkWidget *vbox)
      {
        // fill with content...
      }
      
      int
      main (int argc, char *argv[])
      {
        GtkWidget *window, *vbox;
        GdkGeometry size_hints = {
          100, 50, 0, 0, 100, 50, 10,
          10, 0.0, 0.0, GDK_GRAVITY_NORTH_WEST
        };
      
        gtk_init (&argc, &argv);
      
        window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
        vbox = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
      
        gtk_container_add (GTK_CONTAINER (window), vbox);
        fill_with_content (vbox);
        gtk_widget_show_all (vbox);
      
        gtk_window_set_geometry_hints (GTK_WINDOW (window),
      	  			    NULL,
      				    &size_hints,
      				    GDK_HINT_MIN_SIZE |
      				    GDK_HINT_BASE_SIZE |
      				    GDK_HINT_RESIZE_INC);
      
        if (argc > 1)
          {
            gboolean res;
            res = gtk_window_parse_geometry (GTK_WINDOW (window),
                                             argv[1]);
            if (! res)
              fprintf (stderr,
                       "Failed to parse “%s”\n",
                       argv[1]);
          }
      
        gtk_widget_show_all (window);
        gtk_main ();
      
        return 0;
      }
      ```
  
      Params:
        geometry = geometry string
      Returns: true if string was parsed successfully
  
      Deprecated: Geometry handling in GTK is deprecated.
  */
  bool parseGeometry(string geometry)
  {
    bool _retval;
    const(char)* _geometry = geometry.toCString(No.Alloc);
    _retval = cast(bool)gtk_window_parse_geometry(cast(GtkWindow*)this._cPtr, _geometry);
    return _retval;
  }

  /**
      Presents a window to the user. This function should not be used
      as when it is called, it is too late to gather a valid timestamp
      to allow focus stealing prevention to work correctly.
  */
  void present()
  {
    gtk_window_present(cast(GtkWindow*)this._cPtr);
  }

  /**
      Presents a window to the user. This may mean raising the window
      in the stacking order, deiconifying it, moving it to the current
      desktop, and/or giving it the keyboard focus, possibly dependent
      on the user’s platform, window manager, and preferences.
      
      If window is hidden, this function calls [gtk.widget.Widget.show]
      as well.
      
      This function should be used when the user tries to open a window
      that’s already open. Say for example the preferences dialog is
      currently open, and the user chooses Preferences from the menu
      a second time; use [gtk.window.Window.present] to move the already-open dialog
      where the user can see it.
      
      Presents a window to the user in response to a user interaction. The
      timestamp should be gathered when the window was requested to be shown
      (when clicking a link for example), rather than once the window is
      ready to be shown.
  
      Params:
        timestamp = the timestamp of the user interaction (typically a
            button or key press event) which triggered this call
  */
  void presentWithTime(uint timestamp)
  {
    gtk_window_present_with_time(cast(GtkWindow*)this._cPtr, timestamp);
  }

  /**
      Propagate a key press or release event to the focus widget and
      up the focus container chain until a widget handles event.
      This is normally called by the default ::key_press_event and
      ::key_release_event handlers for toplevel windows,
      however in some cases it may be useful to call this directly when
      overriding the standard key handling for a toplevel window.
  
      Params:
        event = a #GdkEventKey
      Returns: true if a widget in the focus chain handled the event.
  */
  bool propagateKeyEvent(gdk.event_key.EventKey event)
  {
    bool _retval;
    _retval = cast(bool)gtk_window_propagate_key_event(cast(GtkWindow*)this._cPtr, event ? cast(GdkEventKey*)event._cPtr : null);
    return _retval;
  }

  /**
      Reverses the effects of [gtk.window.Window.addAccelGroup].
  
      Params:
        accelGroup = a #GtkAccelGroup
  */
  void removeAccelGroup(gtk.accel_group.AccelGroup accelGroup)
  {
    gtk_window_remove_accel_group(cast(GtkWindow*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Removes a mnemonic from this window.
  
      Params:
        keyval = the mnemonic
        target = the widget that gets activated by the mnemonic
  */
  void removeMnemonic(uint keyval, gtk.widget.Widget target)
  {
    gtk_window_remove_mnemonic(cast(GtkWindow*)this._cPtr, keyval, target ? cast(GtkWidget*)target._cPtr(No.Dup) : null);
  }

  /**
      Hides window, then reshows it, resetting the
      default size and position of the window. Used
      by GUI builders only.
  
      Deprecated: GUI builders can call [gtk.widget.Widget.hide],
          [gtk.widget.Widget.unrealize] and then [gtk.widget.Widget.show] on window
          themselves, if they still need this functionality.
  */
  void reshowWithInitialSize()
  {
    gtk_window_reshow_with_initial_size(cast(GtkWindow*)this._cPtr);
  }

  /**
      Resizes the window as if the user had done so, obeying geometry
      constraints. The default geometry constraint is that windows may
      not be smaller than their size request; to override this
      constraint, call [gtk.widget.Widget.setSizeRequest] to set the window's
      request to a smaller value.
      
      If [gtk.window.Window.resize] is called before showing a window for the
      first time, it overrides any default size set with
      [gtk.window.Window.setDefaultSize].
      
      Windows may not be resized smaller than 1 by 1 pixels.
      
      When using client side decorations, GTK+ will do its best to adjust
      the given size so that the resulting window size matches the
      requested size without the title bar, borders and shadows added for
      the client side decorations, but there is no guarantee that the
      result will be totally accurate because these widgets added for
      client side decorations depend on the theme and may not be realized
      or visible at the time [gtk.window.Window.resize] is issued.
      
      If the GtkWindow has a titlebar widget (see [gtk.window.Window.setTitlebar]), then
      typically, [gtk.window.Window.resize] will compensate for the height of the titlebar
      widget only if the height is known when the resulting GtkWindow configuration
      is issued.
      For example, if new widgets are added after the GtkWindow configuration
      and cause the titlebar widget to grow in height, this will result in a
      window content smaller that specified by [gtk.window.Window.resize] and not
      a larger window.
  
      Params:
        width = width in pixels to resize the window to
        height = height in pixels to resize the window to
  */
  void resize(int width, int height)
  {
    gtk_window_resize(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      Determines whether a resize grip is visible for the specified window.
      Returns: true if a resize grip exists and is visible
  
      Deprecated: Resize grips have been removed.
  */
  bool resizeGripIsVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_resize_grip_is_visible(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Like [gtk.window.Window.resize], but width and height are interpreted
      in terms of the base size and increment set with
      gtk_window_set_geometry_hints.
  
      Params:
        width = width in resize increments to resize the window to
        height = height in resize increments to resize the window to
  
      Deprecated: This function does nothing. Use
           [gtk.window.Window.resize] and compute the geometry yourself.
  */
  void resizeToGeometry(int width, int height)
  {
    gtk_window_resize_to_geometry(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      Windows may set a hint asking the desktop environment not to receive
      the input focus. This function sets this hint.
  
      Params:
        setting = true to let this window receive input focus
  */
  void setAcceptFocus(bool setting)
  {
    gtk_window_set_accept_focus(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets or unsets the #GtkApplication associated with the window.
      
      The application will be kept alive for at least as long as it has any windows
      associated with it (see [gio.application.Application.hold] for a way to keep it alive
      without windows).
      
      Normally, the connection between the application and the window will remain
      until the window is destroyed, but you can explicitly remove it by setting
      the application to null.
      
      This is equivalent to calling [gtk.application.Application.removeWindow] and/or
      [gtk.application.Application.addWindow] on the old/new applications as relevant.
  
      Params:
        application = a #GtkApplication, or null to unset
  */
  void setApplication(gtk.application.Application application = null)
  {
    gtk_window_set_application(cast(GtkWindow*)this._cPtr, application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
  }

  /**
      Marks window as attached to attach_widget. This creates a logical binding
      between the window and the widget it belongs to, which is used by GTK+ to
      propagate information such as styling or accessibility to window as if it
      was a children of attach_widget.
      
      Examples of places where specifying this relation is useful are for instance
      a #GtkMenu created by a #GtkComboBox, a completion popup window
      created by #GtkEntry or a typeahead search entry created by #GtkTreeView.
      
      Note that this function should not be confused with
      [gtk.window.Window.setTransientFor], which specifies a window manager relation
      between two toplevels instead.
      
      Passing null for attach_widget detaches the window.
  
      Params:
        attachWidget = a #GtkWidget, or null
  */
  void setAttachedTo(gtk.widget.Widget attachWidget = null)
  {
    gtk_window_set_attached_to(cast(GtkWindow*)this._cPtr, attachWidget ? cast(GtkWidget*)attachWidget._cPtr(No.Dup) : null);
  }

  /**
      By default, windows are decorated with a title bar, resize
      controls, etc.  Some [window managers][gtk-X11-arch]
      allow GTK+ to disable these decorations, creating a
      borderless window. If you set the decorated property to false
      using this function, GTK+ will do its best to convince the window
      manager not to decorate the window. Depending on the system, this
      function may not have any effect when called on a window that is
      already visible, so you should call it before calling [gtk.widget.Widget.show].
      
      On Windows, this function always works, since there’s no window manager
      policy involved.
  
      Params:
        setting = true to decorate the window
  */
  void setDecorated(bool setting)
  {
    gtk_window_set_decorated(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      The default widget is the widget that’s activated when the user
      presses Enter in a dialog (for example). This function sets or
      unsets the default widget for a #GtkWindow. When setting (rather
      than unsetting) the default widget it’s generally easier to call
      [gtk.widget.Widget.grabDefault] on the widget. Before making a widget
      the default widget, you must call [gtk.widget.Widget.setCanDefault] on
      the widget you’d like to make the default.
  
      Params:
        defaultWidget = widget to be the default, or null
              to unset the default widget for the toplevel
  */
  void setDefault(gtk.widget.Widget defaultWidget = null)
  {
    gtk_window_set_default(cast(GtkWindow*)this._cPtr, defaultWidget ? cast(GtkWidget*)defaultWidget._cPtr(No.Dup) : null);
  }

  /**
      Like [gtk.window.Window.setDefaultSize], but width and height are interpreted
      in terms of the base size and increment set with
      gtk_window_set_geometry_hints.
  
      Params:
        width = width in resize increments, or -1 to unset the default width
        height = height in resize increments, or -1 to unset the default height
  
      Deprecated: This function does nothing. If you want to set a default
            size, use [gtk.window.Window.setDefaultSize] instead.
  */
  void setDefaultGeometry(int width, int height)
  {
    gtk_window_set_default_geometry(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      Sets the default size of a window. If the window’s “natural” size
      (its size request) is larger than the default, the default will be
      ignored. More generally, if the default size does not obey the
      geometry hints for the window ([gtk.window.Window.setGeometryHints] can
      be used to set these explicitly), the default size will be clamped
      to the nearest permitted size.
      
      Unlike [gtk.widget.Widget.setSizeRequest], which sets a size request for
      a widget and thus would keep users from shrinking the window, this
      function only sets the initial size, just as if the user had
      resized the window themselves. Users can still shrink the window
      again as they normally would. Setting a default size of -1 means to
      use the “natural” default size (the size request of the window).
      
      For more control over a window’s initial size and how resizing works,
      investigate [gtk.window.Window.setGeometryHints].
      
      For some uses, [gtk.window.Window.resize] is a more appropriate function.
      [gtk.window.Window.resize] changes the current size of the window, rather
      than the size to be used on initial display. [gtk.window.Window.resize] always
      affects the window itself, not the geometry widget.
      
      The default size of a window only affects the first time a window is
      shown; if a window is hidden and re-shown, it will remember the size
      it had prior to hiding, rather than using the default size.
      
      Windows can’t actually be 0x0 in size, they must be at least 1x1, but
      passing 0 for width and height is OK, resulting in a 1x1 default size.
      
      If you use this function to reestablish a previously saved window size,
      note that the appropriate size to save is the one returned by
      [gtk.window.Window.getSize]. Using the window allocation directly will not
      work in all circumstances and can lead to growing or shrinking windows.
  
      Params:
        width = width in pixels, or -1 to unset the default width
        height = height in pixels, or -1 to unset the default height
  */
  void setDefaultSize(int width, int height)
  {
    gtk_window_set_default_size(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      By default, windows have a close button in the window frame. Some
      [window managers][gtk-X11-arch] allow GTK+ to
      disable this button. If you set the deletable property to false
      using this function, GTK+ will do its best to convince the window
      manager not to show a close button. Depending on the system, this
      function may not have any effect when called on a window that is
      already visible, so you should call it before calling [gtk.widget.Widget.show].
      
      On Windows, this function always works, since there’s no window manager
      policy involved.
  
      Params:
        setting = true to decorate the window as deletable
  */
  void setDeletable(bool setting)
  {
    gtk_window_set_deletable(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      If setting is true, then destroying the transient parent of window
      will also destroy window itself. This is useful for dialogs that
      shouldn’t persist beyond the lifetime of the main window they're
      associated with, for example.
  
      Params:
        setting = whether to destroy window with its transient parent
  */
  void setDestroyWithParent(bool setting)
  {
    gtk_window_set_destroy_with_parent(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      If focus is not the current focus widget, and is focusable, sets
      it as the focus widget for the window. If focus is null, unsets
      the focus widget for this window. To set the focus to a particular
      widget in the toplevel, it is usually more convenient to use
      [gtk.widget.Widget.grabFocus] instead of this function.
  
      Params:
        focus = widget to be the new focus widget, or null to unset
            any focus widget for the toplevel window.
  */
  void setFocus(gtk.widget.Widget focus = null)
  {
    gtk_window_set_focus(cast(GtkWindow*)this._cPtr, focus ? cast(GtkWidget*)focus._cPtr(No.Dup) : null);
  }

  /**
      Windows may set a hint asking the desktop environment not to receive
      the input focus when the window is mapped.  This function sets this
      hint.
  
      Params:
        setting = true to let this window receive input focus on map
  */
  void setFocusOnMap(bool setting)
  {
    gtk_window_set_focus_on_map(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the #GtkWindow:focus-visible property.
  
      Params:
        setting = the new value
  */
  void setFocusVisible(bool setting)
  {
    gtk_window_set_focus_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      This function sets up hints about how a window can be resized by
      the user.  You can set a minimum and maximum size; allowed resize
      increments (e.g. for xterm, you can only resize by the size of a
      character); aspect ratios; and more. See the #GdkGeometry struct.
  
      Params:
        geometryWidget = widget the geometry hints used to be applied to
            or null. Since 3.20 this argument is ignored and GTK behaves as if null was
            set.
        geometry = struct containing geometry information or null
        geomMask = mask indicating which struct fields should be paid attention to
  */
  void setGeometryHints(gtk.widget.Widget geometryWidget, gdk.types.Geometry geometry, gdk.types.WindowHints geomMask)
  {
    gtk_window_set_geometry_hints(cast(GtkWindow*)this._cPtr, geometryWidget ? cast(GtkWidget*)geometryWidget._cPtr(No.Dup) : null, &geometry, geomMask);
  }

  /**
      Window gravity defines the meaning of coordinates passed to
      [gtk.window.Window.move]. See [gtk.window.Window.move] and #GdkGravity for
      more details.
      
      The default window gravity is #GDK_GRAVITY_NORTH_WEST which will
      typically “do what you mean.”
  
      Params:
        gravity = window gravity
  */
  void setGravity(gdk.types.Gravity gravity)
  {
    gtk_window_set_gravity(cast(GtkWindow*)this._cPtr, gravity);
  }

  /**
      Sets whether window has a corner resize grip.
      
      Note that the resize grip is only shown if the window
      is actually resizable and not maximized. Use
      [gtk.window.Window.resizeGripIsVisible] to find out if the
      resize grip is currently shown.
  
      Params:
        value = true to allow a resize grip
  
      Deprecated: Resize grips have been removed.
  */
  void setHasResizeGrip(bool value)
  {
    gtk_window_set_has_resize_grip(cast(GtkWindow*)this._cPtr, value);
  }

  /**
      Tells GTK+ whether to drop its extra reference to the window
      when [gtk.widget.Widget.destroy] is called.
      
      This function is only exported for the benefit of language
      bindings which may need to keep the window alive until their
      wrapper object is garbage collected. There is no justification
      for ever calling this function in an application.
  
      Params:
        setting = the new value
  */
  void setHasUserRefCount(bool setting)
  {
    gtk_window_set_has_user_ref_count(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      If setting is true, then window will request that it’s titlebar
      should be hidden when maximized.
      This is useful for windows that don’t convey any information other
      than the application name in the titlebar, to put the available
      screen space to better use. If the underlying window system does not
      support the request, the setting will not have any effect.
      
      Note that custom titlebars set with [gtk.window.Window.setTitlebar] are
      not affected by this. The application is in full control of their
      content and visibility anyway.
  
      Params:
        setting = whether to hide the titlebar when window is maximized
  */
  void setHideTitlebarWhenMaximized(bool setting)
  {
    gtk_window_set_hide_titlebar_when_maximized(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets up the icon representing a #GtkWindow. This icon is used when
      the window is minimized (also known as iconified).  Some window
      managers or desktop environments may also place it in the window
      frame, or display it in other contexts. On others, the icon is not
      used at all, so your mileage may vary.
      
      The icon should be provided in whatever size it was naturally
      drawn; that is, don’t scale the image before passing it to
      GTK+. Scaling is postponed until the last minute, when the desired
      final size is known, to allow best quality.
      
      If you have your icon hand-drawn in multiple sizes, use
      [gtk.window.Window.setIconList]. Then the best size will be used.
      
      This function is equivalent to calling [gtk.window.Window.setIconList]
      with a 1-element list.
      
      See also [gtk.window.Window.setDefaultIconList] to set the icon
      for all windows in your application in one go.
  
      Params:
        icon = icon image, or null
  */
  void setIcon(gdkpixbuf.pixbuf.Pixbuf icon = null)
  {
    gtk_window_set_icon(cast(GtkWindow*)this._cPtr, icon ? cast(GdkPixbuf*)icon._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon for window.
      Warns on failure if err is null.
      
      This function is equivalent to calling [gtk.window.Window.setIcon]
      with a pixbuf created by loading the image from filename.
  
      Params:
        filename = location of icon file
      Returns: true if setting the icon succeeded.
      Throws: [ErrorWrap]
  */
  bool setIconFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gtk_window_set_icon_from_file(cast(GtkWindow*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets up the icon representing a #GtkWindow. The icon is used when
      the window is minimized (also known as iconified).  Some window
      managers or desktop environments may also place it in the window
      frame, or display it in other contexts. On others, the icon is not
      used at all, so your mileage may vary.
      
      [gtk.window.Window.setIconList] allows you to pass in the same icon in
      several hand-drawn sizes. The list should contain the natural sizes
      your icon is available in; that is, don’t scale the image before
      passing it to GTK+. Scaling is postponed until the last minute,
      when the desired final size is known, to allow best quality.
      
      By passing several sizes, you may improve the final image quality
      of the icon, by reducing or eliminating automatic image scaling.
      
      Recommended sizes to provide: 16x16, 32x32, 48x48 at minimum, and
      larger images (64x64, 128x128) if you have them.
      
      See also [gtk.window.Window.setDefaultIconList] to set the icon
      for all windows in your application in one go.
      
      Note that transient windows (those who have been set transient for another
      window using [gtk.window.Window.setTransientFor]) will inherit their
      icon from their transient parent. So there’s no need to explicitly
      set the icon on transient windows.
  
      Params:
        list = list of #GdkPixbuf
  */
  void setIconList(gdkpixbuf.pixbuf.Pixbuf[] list)
  {
    auto _list = gListFromD!(gdkpixbuf.pixbuf.Pixbuf)(list);
    scope(exit) containerFree!(GList*, gdkpixbuf.pixbuf.Pixbuf, GidOwnership.None)(_list);
    gtk_window_set_icon_list(cast(GtkWindow*)this._cPtr, _list);
  }

  /**
      Sets the icon for the window from a named themed icon.
      See the docs for #GtkIconTheme for more details.
      On some platforms, the window icon is not used at all.
      
      Note that this has nothing to do with the WM_ICON_NAME
      property which is mentioned in the ICCCM.
  
      Params:
        name = the name of the themed icon
  */
  void setIconName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_window_set_icon_name(cast(GtkWindow*)this._cPtr, _name);
  }

  /**
      Asks to keep window above, so that it stays on top. Note that
      you shouldn’t assume the window is definitely above afterward,
      because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could not keep it above,
      and not all window managers support keeping windows above. But
      normally the window will end kept above. Just don’t write code
      that crashes if not.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be kept above when it appears onscreen
      initially.
      
      You can track the above state via the “window-state-event” signal
      on #GtkWidget.
      
      Note that, according to the
      [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec),
      the above state is mainly meant for user preferences and should not
      be used by applications e.g. for drawing attention to their
      dialogs.
  
      Params:
        setting = whether to keep window above other windows
  */
  void setKeepAbove(bool setting)
  {
    gtk_window_set_keep_above(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Asks to keep window below, so that it stays in bottom. Note that
      you shouldn’t assume the window is definitely below afterward,
      because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could not keep it below,
      and not all window managers support putting windows below. But
      normally the window will be kept below. Just don’t write code
      that crashes if not.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be kept below when it appears onscreen
      initially.
      
      You can track the below state via the “window-state-event” signal
      on #GtkWidget.
      
      Note that, according to the
      [Extended Window Manager Hints Specification](http://www.freedesktop.org/Standards/wm-spec),
      the above state is mainly meant for user preferences and should not
      be used by applications e.g. for drawing attention to their
      dialogs.
  
      Params:
        setting = whether to keep window below other windows
  */
  void setKeepBelow(bool setting)
  {
    gtk_window_set_keep_below(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the mnemonic modifier for this window.
  
      Params:
        modifier = the modifier mask used to activate
                        mnemonics on this window.
  */
  void setMnemonicModifier(gdk.types.ModifierType modifier)
  {
    gtk_window_set_mnemonic_modifier(cast(GtkWindow*)this._cPtr, modifier);
  }

  /**
      Sets the #GtkWindow:mnemonics-visible property.
  
      Params:
        setting = the new value
  */
  void setMnemonicsVisible(bool setting)
  {
    gtk_window_set_mnemonics_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets a window modal or non-modal. Modal windows prevent interaction
      with other windows in the same application. To keep modal dialogs
      on top of main application windows, use
      [gtk.window.Window.setTransientFor] to make the dialog transient for the
      parent; most [window managers][gtk-X11-arch]
      will then disallow lowering the dialog below the parent.
  
      Params:
        modal = whether the window is modal
  */
  void setModal(bool modal)
  {
    gtk_window_set_modal(cast(GtkWindow*)this._cPtr, modal);
  }

  /**
      Request the windowing system to make window partially transparent,
      with opacity 0 being fully transparent and 1 fully opaque. (Values
      of the opacity parameter are clamped to the [0,1] range.) On X11
      this has any effect only on X screens with a compositing manager
      running. See [gtk.widget.Widget.isComposited]. On Windows it should work
      always.
      
      Note that setting a window’s opacity after the window has been
      shown causes it to flicker once on Windows.
  
      Params:
        opacity = desired opacity, between 0 and 1
  
      Deprecated: Use gtk_widget_set_opacity instead.
  */
  override void setOpacity(double opacity)
  {
    gtk_window_set_opacity(cast(GtkWindow*)this._cPtr, opacity);
  }

  /**
      Sets a position constraint for this window. If the old or new
      constraint is [gtk.types.WindowPosition.CenterAlways], this will also cause
      the window to be repositioned to satisfy the new constraint.
  
      Params:
        position = a position constraint.
  */
  void setPosition(gtk.types.WindowPosition position)
  {
    gtk_window_set_position(cast(GtkWindow*)this._cPtr, position);
  }

  /**
      Sets whether the user can resize a window. Windows are user resizable
      by default.
  
      Params:
        resizable = true if the user can resize this window
  */
  void setResizable(bool resizable)
  {
    gtk_window_set_resizable(cast(GtkWindow*)this._cPtr, resizable);
  }

  /**
      This function is only useful on X11, not with other GTK+ targets.
      
      In combination with the window title, the window role allows a
      [window manager][gtk-X11-arch] to identify "the
      same" window when an application is restarted. So for example you
      might set the “toolbox” role on your app’s toolbox window, so that
      when the user restarts their session, the window manager can put
      the toolbox back in the same place.
      
      If a window already has a unique title, you don’t need to set the
      role, since the WM can use the title to identify the window when
      restoring the session.
  
      Params:
        role = unique identifier for the window to be used when restoring a session
  */
  void setRole(string role)
  {
    const(char)* _role = role.toCString(No.Alloc);
    gtk_window_set_role(cast(GtkWindow*)this._cPtr, _role);
  }

  /**
      Sets the #GdkScreen where the window is displayed; if
      the window is already mapped, it will be unmapped, and
      then remapped on the new screen.
  
      Params:
        screen = a #GdkScreen.
  */
  void setScreen(gdk.screen.Screen screen)
  {
    gtk_window_set_screen(cast(GtkWindow*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Windows may set a hint asking the desktop environment not to display
      the window in the pager. This function sets this hint.
      (A "pager" is any desktop navigation tool such as a workspace
      switcher that displays a thumbnail representation of the windows
      on the screen.)
  
      Params:
        setting = true to keep this window from appearing in the pager
  */
  void setSkipPagerHint(bool setting)
  {
    gtk_window_set_skip_pager_hint(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Windows may set a hint asking the desktop environment not to display
      the window in the task bar. This function sets this hint.
  
      Params:
        setting = true to keep this window from appearing in the task bar
  */
  void setSkipTaskbarHint(bool setting)
  {
    gtk_window_set_skip_taskbar_hint(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Startup notification identifiers are used by desktop environment to
      track application startup, to provide user feedback and other
      features. This function changes the corresponding property on the
      underlying GdkWindow. Normally, startup identifier is managed
      automatically and you should only use this function in special cases
      like transferring focus from other processes. You should use this
      function before calling [gtk.window.Window.present] or any equivalent
      function generating a window map event.
      
      This function is only useful on X11, not with other GTK+ targets.
  
      Params:
        startupId = a string with startup-notification identifier
  */
  void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gtk_window_set_startup_id(cast(GtkWindow*)this._cPtr, _startupId);
  }

  /**
      Sets the title of the #GtkWindow. The title of a window will be
      displayed in its title bar; on the X Window System, the title bar
      is rendered by the [window manager][gtk-X11-arch],
      so exactly how the title appears to users may vary
      according to a user’s exact configuration. The title should help a
      user distinguish this window from other windows they may have
      open. A good title might include the application name and current
      document filename, for example.
  
      Params:
        title = title of the window
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_window_set_title(cast(GtkWindow*)this._cPtr, _title);
  }

  /**
      Sets a custom titlebar for window.
      
      A typical widget used here is #GtkHeaderBar, as it provides various features
      expected of a titlebar while allowing the addition of child widgets to it.
      
      If you set a custom titlebar, GTK+ will do its best to convince
      the window manager not to put its own titlebar on the window.
      Depending on the system, this function may not work for a window
      that is already visible, so you set the titlebar before calling
      [gtk.widget.Widget.show].
  
      Params:
        titlebar = the widget to use as titlebar
  */
  void setTitlebar(gtk.widget.Widget titlebar = null)
  {
    gtk_window_set_titlebar(cast(GtkWindow*)this._cPtr, titlebar ? cast(GtkWidget*)titlebar._cPtr(No.Dup) : null);
  }

  /**
      Dialog windows should be set transient for the main application
      window they were spawned from. This allows
      [window managers][gtk-X11-arch] to e.g. keep the
      dialog on top of the main window, or center the dialog over the
      main window. [gtk.dialog.Dialog.newWithButtons] and other convenience
      functions in GTK+ will sometimes call
      [gtk.window.Window.setTransientFor] on your behalf.
      
      Passing null for parent unsets the current transient window.
      
      On Wayland, this function can also be used to attach a new
      #GTK_WINDOW_POPUP to a #GTK_WINDOW_TOPLEVEL parent already mapped
      on screen so that the #GTK_WINDOW_POPUP will be created as a
      subsurface-based window #GDK_WINDOW_SUBSURFACE which can be
      positioned at will relatively to the #GTK_WINDOW_TOPLEVEL surface.
      
      On Windows, this function puts the child window on top of the parent,
      much as the window manager would have done on X.
  
      Params:
        parent = parent window, or null
  */
  void setTransientFor(gtk.window.Window parent = null)
  {
    gtk_window_set_transient_for(cast(GtkWindow*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      By setting the type hint for the window, you allow the window
      manager to decorate and handle the window in a way which is
      suitable to the function of the window in your application.
      
      This function should be called before the window becomes visible.
      
      [gtk.dialog.Dialog.newWithButtons] and other convenience functions in GTK+
      will sometimes call [gtk.window.Window.setTypeHint] on your behalf.
  
      Params:
        hint = the window type
  */
  void setTypeHint(gdk.types.WindowTypeHint hint)
  {
    gtk_window_set_type_hint(cast(GtkWindow*)this._cPtr, hint);
  }

  /**
      Windows may set a hint asking the desktop environment to draw
      the users attention to the window. This function sets this hint.
  
      Params:
        setting = true to mark this window as urgent
  */
  void setUrgencyHint(bool setting)
  {
    gtk_window_set_urgency_hint(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Don’t use this function. It sets the X Window System “class” and
      “name” hints for a window.  According to the ICCCM, you should
      always set these to the same value for all windows in an
      application, and GTK+ sets them to that value by default, so calling
      this function is sort of pointless. However, you may want to call
      [gtk.window.Window.setRole] on each window in your application, for the
      benefit of the session manager. Setting the role allows the window
      manager to restore window positions when loading a saved session.
  
      Params:
        wmclassName = window name hint
        wmclassClass = window class hint
  */
  void setWmclass(string wmclassName, string wmclassClass)
  {
    const(char)* _wmclassName = wmclassName.toCString(No.Alloc);
    const(char)* _wmclassClass = wmclassClass.toCString(No.Alloc);
    gtk_window_set_wmclass(cast(GtkWindow*)this._cPtr, _wmclassName, _wmclassClass);
  }

  /**
      Asks to stick window, which means that it will appear on all user
      desktops. Note that you shouldn’t assume the window is definitely
      stuck afterward, because other entities (e.g. the user or
      [window manager][gtk-X11-arch] could unstick it
      again, and some window managers do not support sticking
      windows. But normally the window will end up stuck. Just don't
      write code that crashes if not.
      
      It’s permitted to call this function before showing a window.
      
      You can track stickiness via the “window-state-event” signal
      on #GtkWidget.
  */
  void stick()
  {
    gtk_window_stick(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to toggle off the fullscreen state for window. Note that you
      shouldn’t assume the window is definitely not full screen
      afterward, because other entities (e.g. the user or
      [window manager][gtk-X11-arch]) could fullscreen it
      again, and not all window managers honor requests to unfullscreen
      windows. But normally the window will end up restored to its normal
      state. Just don’t write code that crashes if not.
      
      You can track the fullscreen state via the “window-state-event” signal
      on #GtkWidget.
  */
  void unfullscreen()
  {
    gtk_window_unfullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unmaximize window. Note that you shouldn’t assume the
      window is definitely unmaximized afterward, because other entities
      (e.g. the user or [window manager][gtk-X11-arch])
      could maximize it again, and not all window
      managers honor requests to unmaximize. But normally the window will
      end up unmaximized. Just don’t write code that crashes if not.
      
      You can track maximization via the “window-state-event” signal
      on #GtkWidget.
  */
  void unmaximize()
  {
    gtk_window_unmaximize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unstick window, which means that it will appear on only
      one of the user’s desktops. Note that you shouldn’t assume the
      window is definitely unstuck afterward, because other entities
      (e.g. the user or [window manager][gtk-X11-arch]) could
      stick it again. But normally the window will
      end up unstuck. Just don’t write code that crashes if not.
      
      You can track stickiness via the “window-state-event” signal
      on #GtkWidget.
  */
  void unstick()
  {
    gtk_window_unstick(cast(GtkWindow*)this._cPtr);
  }

  /**
      Connect to `ActivateDefault` signal.
  
      The ::activate-default signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user activates the default widget
        of window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateDefault(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-default", closure, after);
  }

  /**
      Connect to `ActivateFocus` signal.
  
      The ::activate-focus signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user activates the currently
        focused widget of window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-focus", closure, after);
  }

  /**
      Connect to `EnableDebugging` signal.
  
      The ::enable-debugging signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted when the user enables or disables interactive
        debugging. When toggle is true, interactive debugging is toggled
        on or off, when it is false, the debugger will be pointed at the
        widget under the pointer.
        
        The default bindings for this signal are Ctrl-Shift-I
        and Ctrl-Shift-D.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool toggle, gtk.window.Window window))
  
          `toggle` toggle the debugger (optional)
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` true if the key binding was handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnableDebugging(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.window.Window)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enable-debugging", closure, after);
  }

  /**
      Connect to `KeysChanged` signal.
  
      The ::keys-changed signal gets emitted when the set of accelerators
        or mnemonics that are associated with window changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeysChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keys-changed", closure, after);
  }

  /**
      Connect to `SetFocus` signal.
  
      This signal is emitted whenever the currently focused widget in
        this window changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget, gtk.window.Window window))
  
          `widget` the newly focused widget (or null for no focus) (optional)
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSetFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.window.Window)))
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
    return connectSignalClosure("set-focus", closure, after);
  }
}
