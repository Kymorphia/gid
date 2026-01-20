/// Module for [Window] class
module gtk.window;

import gdk.display;
import gdk.monitor;
import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.application;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window_group;

/**
    A [gtk.window.Window] is a toplevel window which can contain other widgets.
    
    ![An example GtkWindow](window.png)
    
    Windows normally have decorations that are under the control
    of the windowing system and allow the user to manipulate the window
    (resize it, move it, close it,...).
    
    # GtkWindow as GtkBuildable
    
    The [gtk.window.Window] implementation of the [gtk.buildable.Buildable] interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a `<child>` element.
    
    # CSS nodes
    
    ```
    window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
    ├── <child>
    ╰── <titlebar child>.titlebar [.default-decoration]
    ```
    
    [gtk.window.Window] has a main CSS node with name window and style class .background.
    
    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
    also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
    
    [gtk.window.Window] subclasses often add their own discriminating style classes,
    such as .dialog, .popup or .tooltip.
    
    Generally, some CSS properties don't make sense on the toplevel window node,
    such as margins or padding. When client-side decorations without invisible
    borders are in use (i.e. the .solid-csd style class is added to the
    main window node), the CSS border of the toplevel window is used for
    resize drags. In the .csd case, the shadow area outside of the window
    can be used to resize it.
    
    [gtk.window.Window] adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.window.Window] used the [gtk.types.AccessibleRole.Window] role.
    
    Since GTK 4.12, [gtk.window.Window] uses the [gtk.types.AccessibleRole.Application] role.
    
    # Actions
    
    [gtk.window.Window] defines a set of built-in actions:
    $(LIST
      * `default.activate`: Activate the default widget.
      * `window.minimize`: Minimize the window.
      * `window.toggle-maximized`: Maximize or restore the window.
      * `window.close`: Close the window.
    )
*/
class Window : gtk.widget.Widget, gtk.native.Native, gtk.root.Root, gtk.shortcut_manager.ShortcutManager
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
      Get `application` property.
      Returns: The [gtk.application.Application] associated with the window.
        
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
        propval = The [gtk.application.Application] associated with the window.
          
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
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `decorated` property.
      Returns: Whether the window should have a frame (also known as *decorations*).
  */
  @property bool decorated()
  {
    return getDecorated();
  }

  /**
      Set `decorated` property.
      Params:
        propval = Whether the window should have a frame (also known as *decorations*).
  */
  @property void decorated(bool propval)
  {
    return setDecorated(propval);
  }

  /**
      Get `defaultHeight` property.
      Returns: The default height of the window.
  */
  @property int defaultHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("default-height");
  }

  /**
      Set `defaultHeight` property.
      Params:
        propval = The default height of the window.
  */
  @property void defaultHeight(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("default-height", propval);
  }

  /**
      Get `defaultWidget` property.
      Returns: The default widget.
  */
  @property gtk.widget.Widget defaultWidget()
  {
    return getDefaultWidget();
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget.
  */
  @property void defaultWidget(gtk.widget.Widget propval)
  {
    return setDefaultWidget(propval);
  }

  /**
      Get `defaultWidth` property.
      Returns: The default width of the window.
  */
  @property int defaultWidth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("default-width");
  }

  /**
      Set `defaultWidth` property.
      Params:
        propval = The default width of the window.
  */
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

  /**
      Get `destroyWithParent` property.
      Returns: If this window should be destroyed when the parent is destroyed.
  */
  @property bool destroyWithParent()
  {
    return getDestroyWithParent();
  }

  /**
      Set `destroyWithParent` property.
      Params:
        propval = If this window should be destroyed when the parent is destroyed.
  */
  @property void destroyWithParent(bool propval)
  {
    return setDestroyWithParent(propval);
  }

  /**
      Get `display` property.
      Returns: The display that will display this window.
  */
  @property gdk.display.Display display()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.display.Display)("display");
  }

  /**
      Set `display` property.
      Params:
        propval = The display that will display this window.
  */
  @property void display(gdk.display.Display propval)
  {
    return setDisplay(propval);
  }

  /**
      Get `focusVisible` property.
      Returns: Whether 'focus rectangles' are currently visible in this window.
        
        This property is maintained by GTK based on user input
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
          
          This property is maintained by GTK based on user input
          and should not be set by applications.
  */
  @property void focusVisible(bool propval)
  {
    return setFocusVisible(propval);
  }

  /**
      Get `focusWidget` property.
      Returns: The focus widget.
  */
  @property gtk.widget.Widget focusWidget()
  {
    return getFocus();
  }

  /**
      Set `focusWidget` property.
      Params:
        propval = The focus widget.
  */
  @property void focusWidget(gtk.widget.Widget propval)
  {
    return setFocus(propval);
  }

  /**
      Get `fullscreened` property.
      Returns: Whether the window is fullscreen.
        
        Setting this property is the equivalent of calling
        [gtk.window.Window.fullscreen] or [gtk.window.Window.unfullscreen];
        either operation is asynchronous, which means you will need to
        connect to the ::notify signal in order to know whether the
        operation was successful.
  */
  @property bool fullscreened()
  {
    return isFullscreen();
  }

  /**
      Set `fullscreened` property.
      Params:
        propval = Whether the window is fullscreen.
          
          Setting this property is the equivalent of calling
          [gtk.window.Window.fullscreen] or [gtk.window.Window.unfullscreen];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
  */
  @property void fullscreened(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("fullscreened", propval);
  }

  /**
      Get `handleMenubarAccel` property.
      Returns: Whether the window frame should handle F10 for activating
        menubars.
  */
  @property bool handleMenubarAccel()
  {
    return getHandleMenubarAccel();
  }

  /**
      Set `handleMenubarAccel` property.
      Params:
        propval = Whether the window frame should handle F10 for activating
          menubars.
  */
  @property void handleMenubarAccel(bool propval)
  {
    return setHandleMenubarAccel(propval);
  }

  /**
      Get `hideOnClose` property.
      Returns: If this window should be hidden when the users clicks the close button.
  */
  @property bool hideOnClose()
  {
    return getHideOnClose();
  }

  /**
      Set `hideOnClose` property.
      Params:
        propval = If this window should be hidden when the users clicks the close button.
  */
  @property void hideOnClose(bool propval)
  {
    return setHideOnClose(propval);
  }

  /**
      Get `iconName` property.
      Returns: Specifies the name of the themed icon to use as the window icon.
        
        See [gtk.icon_theme.IconTheme] for more details.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = Specifies the name of the themed icon to use as the window icon.
          
          See [gtk.icon_theme.IconTheme] for more details.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `maximized` property.
      Returns: Whether the window is maximized.
        
        Setting this property is the equivalent of calling
        [gtk.window.Window.maximize] or [gtk.window.Window.unmaximize];
        either operation is asynchronous, which means you will need to
        connect to the ::notify signal in order to know whether the
        operation was successful.
  */
  @property bool maximized()
  {
    return isMaximized();
  }

  /**
      Set `maximized` property.
      Params:
        propval = Whether the window is maximized.
          
          Setting this property is the equivalent of calling
          [gtk.window.Window.maximize] or [gtk.window.Window.unmaximize];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
  */
  @property void maximized(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("maximized", propval);
  }

  /**
      Get `mnemonicsVisible` property.
      Returns: Whether mnemonics are currently visible in this window.
        
        This property is maintained by GTK based on user input,
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
          
          This property is maintained by GTK based on user input,
          and should not be set by applications.
  */
  @property void mnemonicsVisible(bool propval)
  {
    return setMnemonicsVisible(propval);
  }

  /**
      Get `modal` property.
      Returns: If true, the window is modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = If true, the window is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `resizable` property.
      Returns: If true, users can resize the window.
  */
  @property bool resizable()
  {
    return getResizable();
  }

  /**
      Set `resizable` property.
      Params:
        propval = If true, users can resize the window.
  */
  @property void resizable(bool propval)
  {
    return setResizable(propval);
  }

  /**
      Set `startupId` property.
      Params:
        propval = A write-only property for setting window's startup notification identifier.
  */
  @property void startupId(string propval)
  {
    return setStartupId(propval);
  }

  /**
      Get `suspended` property.
      Returns: Whether the window is suspended.
        
        See [gtk.window.Window.isSuspended] for details about what suspended means.
  */
  @property bool suspended()
  {
    return isSuspended();
  }

  /**
      Get `title` property.
      Returns: The title of the window.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the window.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `titlebar` property.
      Returns: The titlebar widget.
  */
  @property gtk.widget.Widget titlebar()
  {
    return getTitlebar();
  }

  /**
      Set `titlebar` property.
      Params:
        propval = The titlebar widget.
  */
  @property void titlebar(gtk.widget.Widget propval)
  {
    return setTitlebar(propval);
  }

  /**
      Get `transientFor` property.
      Returns: The transient parent of the window.
  */
  @property gtk.window.Window transientFor()
  {
    return getTransientFor();
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the window.
  */
  @property void transientFor(gtk.window.Window propval)
  {
    return setTransientFor(propval);
  }

  mixin NativeT!();
  mixin RootT!();
  mixin ShortcutManagerT!();

  /**
      Creates a new [gtk.window.Window].
      
      To get an undecorated window (no window borders), use
      [gtk.window.Window.setDecorated].
      
      All top-level windows created by [gtk.window.Window.new_] are stored
      in an internal top-level window list. This list can be obtained
      from [gtk.window.Window.listToplevels]. Due to GTK keeping a
      reference to the window internally, [gtk.window.Window.new_] does not
      return a reference to the caller.
      
      To delete a [gtk.window.Window], call [gtk.window.Window.destroy].
      Returns: a new [gtk.window.Window].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_new();
    this(_cretval, No.Take);
  }

  /**
      Returns the fallback icon name for windows.
      
      The returned string is owned by GTK and should not
      be modified. It is only valid until the next call to
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
      Returns a list of all existing toplevel windows.
      
      If you want to iterate through the list and perform actions involving
      callbacks that might destroy the widgets or add new ones, be aware that
      the list of toplevels will change and emit the "items-changed" signal.
      Returns: the list
          of toplevel widgets
  */
  static gio.list_model.ListModel getToplevels()
  {
    GListModel* _cretval;
    _cretval = gtk_window_get_toplevels();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of all existing toplevel windows.
      
      The widgets in the list are not individually referenced.
      If you want to iterate through the list and perform actions
      involving callbacks that might destroy the widgets, you must
      call `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first,
      and then unref all the widgets afterwards.
      Returns: list of
          toplevel widgets
  */
  static gtk.widget.Widget[] listToplevels()
  {
    GList* _cretval;
    _cretval = gtk_window_list_toplevels();
    auto _retval = gListToD!(gtk.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets whether the window should request startup notification.
      
      By default, after showing the first [gtk.window.Window], GTK calls
      [gdk.toplevel.Toplevel.setStartupId]. Call this function
      to disable the automatic startup notification. You might do this
      if your first window is a splash screen, and you want to delay
      notification until after your real main window has been shown,
      for example.
      
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
      Sets an icon to be used as fallback.
      
      The fallback icon is used for windows that
      haven't had [gtk.window.Window.setIconName]
      called on them.
  
      Params:
        name = the name of the themed icon
  */
  static void setDefaultIconName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_window_set_default_icon_name(_name);
  }

  /**
      Opens or closes the [interactive debugger](running.html#interactive-debugging).
      
      The debugger offers access to the widget hierarchy of the application
      and to useful debugging tools.
  
      Params:
        enable = true to enable interactive debugging
  */
  static void setInteractiveDebugging(bool enable)
  {
    gtk_window_set_interactive_debugging(enable);
  }

  /**
      Requests that the window is closed.
      
      This is similar to what happens when a window manager
      close button is clicked.
      
      This function can be used with close buttons in custom
      titlebars.
  */
  void close()
  {
    gtk_window_close(cast(GtkWindow*)this._cPtr);
  }

  /**
      Drop the internal reference GTK holds on toplevel windows.
  */
  void destroy()
  {
    gtk_window_destroy(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place window in the fullscreen state.
      
      Note that you shouldn’t assume the window is definitely fullscreen
      afterward, because other entities (e.g. the user or window manager)
      unfullscreen it again, and not all window managers honor requests
      to fullscreen windows.
      
      You can track the result of this operation via the
      [gdk.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gtk.window.Window.fullscreened] property.
  */
  void fullscreen()
  {
    gtk_window_fullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place window in the fullscreen state on the given monitor.
      
      Note that you shouldn't assume the window is definitely fullscreen
      afterward, or that the windowing system allows fullscreen windows on
      any given monitor.
      
      You can track the result of this operation via the
      [gdk.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gtk.window.Window.fullscreened] property.
  
      Params:
        monitor = which monitor to go fullscreen on
  */
  void fullscreenOnMonitor(gdk.monitor.MonitorWrap monitor)
  {
    gtk_window_fullscreen_on_monitor(cast(GtkWindow*)this._cPtr, monitor ? cast(GdkMonitor*)monitor._cPtr(No.Dup) : null);
  }

  /**
      Gets the [gtk.application.Application] associated with the window.
      Returns: a [gtk.application.Application]
  */
  gtk.application.Application getApplication()
  {
    GtkApplication* _cretval;
    _cretval = gtk_window_get_application(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.application.Application)(cast(GtkApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child widget of window.
      Returns: the child widget of window
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_child(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have decorations.
      Returns: true if the window has been set to have decorations
  */
  bool getDecorated()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_decorated(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default size of the window.
      
      A value of 0 for the width or height indicates that a default
      size has not been explicitly set for that dimension, so the
      “natural” size of the window will be used.
      
      This function is the recommended way for [saving window state
      across restarts of applications](https://developer.gnome.org/documentation/tutorials/save-state.html).
  
      Params:
        width = location to store the default width
        height = location to store the default height
  */
  void getDefaultSize(out int width, out int height)
  {
    gtk_window_get_default_size(cast(GtkWindow*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the default widget for window.
      Returns: the default widget
  */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_default_widget(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have a close button.
      Returns: true if the window has been set to have a close button
  */
  bool getDeletable()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_deletable(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be destroyed with its transient parent.
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
      is not focused then `gtk_widget_has_focus (widget)` will
      not be true for the widget.
      Returns: the currently focused widget
  */
  gtk.widget.Widget getFocus()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_focus(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether “focus rectangles” are supposed to be visible.
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
      Returns the group for window.
      
      If the window has no group, then the default group is returned.
      Returns: the [gtk.window_group.WindowGroup] for a window
          or the default group
  */
  gtk.window_group.WindowGroup getGroup()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_get_group(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window_group.WindowGroup)(cast(GtkWindowGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether this window reacts to F10 key presses by
      activating a menubar it contains.
      Returns: true if the window handles F10
  */
  bool getHandleMenubarAccel()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_handle_menubar_accel(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be hidden when the close button is clicked.
      Returns: true if the window will be hidden
  */
  bool getHideOnClose()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_hide_on_close(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the name of the themed icon for the window.
      Returns: the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_icon_name(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether mnemonics are supposed to be visible.
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
      Returns whether the window is modal.
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
      Retrieves the title of the window.
      Returns: the title of the window
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
      Returns: the custom titlebar
  */
  gtk.widget.Widget getTitlebar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_titlebar(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the transient parent for this window.
      Returns: the transient parent for this window
  */
  gtk.window.Window getTransientFor()
  {
    GtkWindow* _cretval;
    _cretval = gtk_window_get_transient_for(cast(GtkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether window has an explicit window group.
      Returns: true if window has an explicit window group.
  */
  bool hasGroup()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_has_group(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window is part of the current active toplevel.
      
      The active toplevel is the window receiving keystrokes.
      
      The return value is true if the window is active toplevel itself.
      You might use this function if you wanted to draw a widget
      differently in an active window from a widget in an inactive window.
      Returns: true if the window part of the current active window.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_active(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current fullscreen state of window.
      
      Note that since fullscreening is ultimately handled by the window
      manager and happens asynchronously to an application request, you
      shouldn’t assume the return value of this function changing
      immediately (or at all), as an effect of calling
      [gtk.window.Window.fullscreen] or [gtk.window.Window.unfullscreen].
      
      If the window isn't yet mapped, the value returned will whether the
      initial requested state is fullscreen.
      Returns: whether the window has a fullscreen state.
  */
  bool isFullscreen()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_fullscreen(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current maximized state of window.
      
      Note that since maximization is ultimately handled by the window
      manager and happens asynchronously to an application request, you
      shouldn’t assume the return value of this function changing
      immediately (or at all), as an effect of calling
      [gtk.window.Window.maximize] or [gtk.window.Window.unmaximize].
      
      If the window isn't yet mapped, the value returned will whether the
      initial requested state is maximized.
      Returns: whether the window has a maximized state.
  */
  bool isMaximized()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_maximized(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current suspended state of window.
      
      A window being suspended means it's currently not visible to the user, for
      example by being on a inactive workspace, minimized, obstructed.
      Returns: whether the window is suspended.
  */
  bool isSuspended()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_suspended(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Asks to maximize window, so that it fills the screen.
      
      Note that you shouldn’t assume the window is definitely maximized
      afterward, because other entities (e.g. the user or window manager)
      could unmaximize it again, and not all window managers support
      maximization.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be maximized when it appears onscreen
      initially.
      
      You can track the result of this operation via the
      [gdk.toplevel.Toplevel.state] property, or by listening to
      notifications on the [gtk.window.Window.maximized]
      property.
  */
  void maximize()
  {
    gtk_window_maximize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to minimize the specified window.
      
      Note that you shouldn’t assume the window is definitely minimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager)
      could unminimize it again, or there may not be a window manager in
      which case minimization isn’t possible, etc.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be minimized before it ever appears
      onscreen.
      
      You can track result of this operation via the
      [gdk.toplevel.Toplevel.state] property.
  */
  void minimize()
  {
    gtk_window_minimize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Presents a window to the user.
      
      This may mean raising the window in the stacking order,
      unminimizing it, moving it to the current desktop and/or
      giving it the keyboard focus (possibly dependent on the user’s
      platform, window manager and preferences).
      
      If window is hidden, this function also makes it visible.
  */
  void present()
  {
    gtk_window_present(cast(GtkWindow*)this._cPtr);
  }

  /**
      Presents a window to the user in response to an user interaction.
      
      See [gtk.window.Window.present] for more details.
      
      The timestamp should be gathered when the window was requested
      to be shown (when clicking a link for example), rather than once
      the window is ready to be shown.
  
      Params:
        timestamp = the timestamp of the user interaction (typically a
            button or key press event) which triggered this call
  
      Deprecated: Use [gtk.window.Window.present]
  */
  void presentWithTime(uint timestamp)
  {
    gtk_window_present_with_time(cast(GtkWindow*)this._cPtr, timestamp);
  }

  /**
      Sets or unsets the [gtk.application.Application] associated with the window.
      
      The application will be kept alive for at least as long as it has
      any windows associated with it (see [gio.application.Application.hold] for a way
      to keep it alive without windows).
      
      Normally, the connection between the application and the window will
      remain until the window is destroyed, but you can explicitly remove
      it by setting the application to null.
      
      This is equivalent to calling [gtk.application.Application.removeWindow]
      and/or [gtk.application.Application.addWindow] on the old/new applications
      as relevant.
  
      Params:
        application = a [gtk.application.Application], or null to unset
  */
  void setApplication(gtk.application.Application application = null)
  {
    gtk_window_set_application(cast(GtkWindow*)this._cPtr, application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of window.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_window_set_child(cast(GtkWindow*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window should be decorated.
      
      By default, windows are decorated with a title bar, resize
      controls, etc. Some window managers allow GTK to disable these
      decorations, creating a borderless window. If you set the decorated
      property to false using this function, GTK will do its best to
      convince the window manager not to decorate the window. Depending on
      the system, this function may not have any effect when called on a
      window that is already visible, so you should call it before calling
      [gtk.widget.Widget.show].
      
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
      Sets the default size of a window.
      
      The default size of a window is the size that will be used if no other constraints apply.
      
      The default size will be updated whenever the window is resized
      to reflect the new size, unless the window is forced to a size,
      like when it is maximized or fullscreened.
      
      If the window’s minimum size request is larger than
      the default, the default will be ignored.
      
      Setting the default size to a value <= 0 will cause it to be
      ignored and the natural size request will be used instead. It
      is possible to do this while the window is showing to "reset"
      it to its initial size.
      
      Unlike [gtk.widget.Widget.setSizeRequest], which sets a size
      request for a widget and thus would keep users from shrinking
      the window, this function only sets the initial size, just as
      if the user had resized the window themselves. Users can still
      shrink the window again as they normally would. Setting a default
      size of -1 means to use the “natural” default size (the size request
      of the window).
      
      If you use this function to reestablish a previously saved window size,
      note that the appropriate size to save is the one returned by
      [gtk.window.Window.getDefaultSize]. Using the window allocation
      directly will not work in all circumstances and can lead to growing
      or shrinking windows.
  
      Params:
        width = width in pixels, or -1 to unset the default width
        height = height in pixels, or -1 to unset the default height
  */
  void setDefaultSize(int width, int height)
  {
    gtk_window_set_default_size(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      Sets the default widget.
      
      The default widget is the widget that is activated when the user
      presses Enter in a dialog (for example).
  
      Params:
        defaultWidget = widget to be the default
            to unset the default widget for the toplevel
  */
  void setDefaultWidget(gtk.widget.Widget defaultWidget = null)
  {
    gtk_window_set_default_widget(cast(GtkWindow*)this._cPtr, defaultWidget ? cast(GtkWidget*)defaultWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the window should be deletable.
      
      By default, windows have a close button in the window frame.
      Some  window managers allow GTK to disable this button. If you
      set the deletable property to false using this function, GTK
      will do its best to convince the window manager not to show a
      close button. Depending on the system, this function may not
      have any effect when called on a window that is already visible,
      so you should call it before calling [gtk.widget.Widget.show].
      
      On Windows, this function always works, since there’s no window
      manager policy involved.
  
      Params:
        setting = true to decorate the window as deletable
  */
  void setDeletable(bool setting)
  {
    gtk_window_set_deletable(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      If setting is true, then destroying the transient parent of window
      will also destroy window itself.
      
      This is useful for dialogs that shouldn’t persist beyond the lifetime
      of the main window they are associated with, for example.
  
      Params:
        setting = whether to destroy window with its transient parent
  */
  void setDestroyWithParent(bool setting)
  {
    gtk_window_set_destroy_with_parent(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the [gdk.display.Display] where the window is displayed.
      
      If the window is already mapped, it will be unmapped,
      and then remapped on the new display.
  
      Params:
        display = a [gdk.display.Display]
  */
  void setDisplay(gdk.display.Display display)
  {
    gtk_window_set_display(cast(GtkWindow*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the focus widget.
      
      If focus is not the current focus widget, and is focusable,
      sets it as the focus widget for the window. If focus is null,
      unsets the focus widget for this window. To set the focus to a
      particular widget in the toplevel, it is usually more convenient
      to use [gtk.widget.Widget.grabFocus] instead of this function.
  
      Params:
        focus = widget to be the new focus widget, or null to unset
            any focus widget for the toplevel window.
  */
  void setFocus(gtk.widget.Widget focus = null)
  {
    gtk_window_set_focus(cast(GtkWindow*)this._cPtr, focus ? cast(GtkWidget*)focus._cPtr(No.Dup) : null);
  }

  /**
      Sets whether “focus rectangles” are supposed to be visible.
      
      This property is maintained by GTK based on user input,
      and should not be set by applications.
  
      Params:
        setting = the new value
  */
  void setFocusVisible(bool setting)
  {
    gtk_window_set_focus_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets whether this window should react to F10 key presses
      by activating a menubar it contains.
  
      Params:
        handleMenubarAccel = true to make window handle F10
  */
  void setHandleMenubarAccel(bool handleMenubarAccel)
  {
    gtk_window_set_handle_menubar_accel(cast(GtkWindow*)this._cPtr, handleMenubarAccel);
  }

  /**
      If setting is true, then clicking the close button on the window
      will not destroy it, but only hide it.
  
      Params:
        setting = whether to hide the window when it is closed
  */
  void setHideOnClose(bool setting)
  {
    gtk_window_set_hide_on_close(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the icon for the window from a named themed icon.
      
      See the docs for [gtk.icon_theme.IconTheme] for more details.
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
      Sets whether mnemonics are supposed to be visible.
      
      This property is maintained by GTK based on user input,
      and should not be set by applications.
  
      Params:
        setting = the new value
  */
  void setMnemonicsVisible(bool setting)
  {
    gtk_window_set_mnemonics_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets a window modal or non-modal.
      
      Modal windows prevent interaction with other windows in the same
      application. To keep modal dialogs on top of main application windows,
      use [gtk.window.Window.setTransientFor] to make the dialog transient
      for the parent; most window managers will then disallow lowering the
      dialog below the parent.
  
      Params:
        modal = whether the window is modal
  */
  void setModal(bool modal)
  {
    gtk_window_set_modal(cast(GtkWindow*)this._cPtr, modal);
  }

  /**
      Sets whether the user can resize a window.
      
      Windows are user resizable by default.
  
      Params:
        resizable = true if the user can resize this window
  */
  void setResizable(bool resizable)
  {
    gtk_window_set_resizable(cast(GtkWindow*)this._cPtr, resizable);
  }

  /**
      Sets the startup notification ID.
      
      Startup notification identifiers are used by desktop environment
      to track application startup, to provide user feedback and other
      features. This function changes the corresponding property on the
      underlying [gdk.surface.Surface].
      
      Normally, startup identifier is managed automatically and you should
      only use this function in special cases like transferring focus from
      other processes. You should use this function before calling
      [gtk.window.Window.present] or any equivalent function generating
      a window map event.
      
      This function is only useful on X11, not with other GTK targets.
  
      Params:
        startupId = a string with startup-notification identifier
  */
  void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gtk_window_set_startup_id(cast(GtkWindow*)this._cPtr, _startupId);
  }

  /**
      Sets the title of the [gtk.window.Window].
      
      The title of a window will be displayed in its title bar; on the
      X Window System, the title bar is rendered by the window manager
      so exactly how the title appears to users may vary according to a
      user’s exact configuration. The title should help a user distinguish
      this window from other windows they may have open. A good title might
      include the application name and current document filename, for example.
      
      Passing null does the same as setting the title to an empty string.
  
      Params:
        title = title of the window
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_window_set_title(cast(GtkWindow*)this._cPtr, _title);
  }

  /**
      Sets a custom titlebar for window.
      
      A typical widget used here is [gtk.header_bar.HeaderBar], as it
      provides various features expected of a titlebar while allowing
      the addition of child widgets to it.
      
      If you set a custom titlebar, GTK will do its best to convince
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
      window they were spawned from. This allows window managers to e.g.
      keep the dialog on top of the main window, or center the dialog
      over the main window. [gtk.dialog.Dialog.newWithButtons] and other
      convenience functions in GTK will sometimes call
      [gtk.window.Window.setTransientFor] on your behalf.
      
      Passing null for parent unsets the current transient window.
      
      On Windows, this function puts the child window on top of the parent,
      much as the window manager would have done on X.
  
      Params:
        parent = parent window
  */
  void setTransientFor(gtk.window.Window parent = null)
  {
    gtk_window_set_transient_for(cast(GtkWindow*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      Asks to remove the fullscreen state for window, and return to
      its previous state.
      
      Note that you shouldn’t assume the window is definitely not
      fullscreen afterward, because other entities (e.g. the user or
      window manager) could fullscreen it again, and not all window
      managers honor requests to unfullscreen windows; normally the
      window will end up restored to its normal state. Just don’t
      write code that crashes if not.
      
      You can track the result of this operation via the
      [gdk.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gtk.window.Window.fullscreened] property.
  */
  void unfullscreen()
  {
    gtk_window_unfullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unmaximize window.
      
      Note that you shouldn’t assume the window is definitely unmaximized
      afterward, because other entities (e.g. the user or window manager)
      maximize it again, and not all window managers honor requests to
      unmaximize.
      
      You can track the result of this operation via the
      [gdk.toplevel.Toplevel.state] property, or by listening to
      notifications on the [gtk.window.Window.maximized] property.
  */
  void unmaximize()
  {
    gtk_window_unmaximize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unminimize the specified window.
      
      Note that you shouldn’t assume the window is definitely unminimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager)
      could minimize it again, or there may not be a window manager in
      which case minimization isn’t possible, etc.
      
      You can track result of this operation via the
      [gdk.toplevel.Toplevel.state] property.
  */
  void unminimize()
  {
    gtk_window_unminimize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Connect to `ActivateDefault` signal.
  
      Emitted when the user activates the default widget
        of window.
        
        This is a [keybinding signal](class.SignalAction.html).
  
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
  
      Emitted when the user activates the currently focused
        widget of window.
        
        This is a [keybinding signal](class.SignalAction.html).
  
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
      Connect to `CloseRequest` signal.
  
      Emitted when the user clicks on the close button of the window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the signal
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCloseRequest(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-request", closure, after);
  }

  /**
      Connect to `EnableDebugging` signal.
  
      Emitted when the user enables or disables interactive debugging.
        
        When toggle is true, interactive debugging is toggled on or off,
        when it is false, the debugger will be pointed at the widget
        under the pointer.
        
        This is a [keybinding signal](class.SignalAction.html).
        
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
  
      emitted when the set of accelerators or mnemonics that
        are associated with window changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.window.Window window))
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gtk.shortcut.Shortcut] and [gtk.event_controller.EventController]
        to implement keyboard shortcuts
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
}
