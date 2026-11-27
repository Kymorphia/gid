/// Module for [Window] class
module gid.gtk4.window;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.display;
import gid.gdk4.monitor;
import gid.gio2.list_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.application;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.gtk4.window_group;

/**
    A toplevel window which can contain other widgets.
    
    <picture>
      <source srcset="window-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkWindow" src="window.png">
    </picture>
    
    Windows normally have decorations that are under the control
    of the windowing system and allow the user to manipulate the window
    (resize it, move it, close it,...).
    
    # GtkWindow as GtkBuildable
    
    The [gid.gtk4.window.Window] implementation of the [gid.gtk4.buildable.Buildable] interface supports
    setting a child as the titlebar by specifying “titlebar” as the “type”
    attribute of a `<child>` element.
    
    # Shortcuts and Gestures
    
    [gid.gtk4.window.Window] supports the following keyboard shortcuts:
    
    - <kbd>F10</kbd> activates the menubar, if present.
    - <kbd>Alt</kbd> makes the mnemonics visible while pressed.
    
    The following signals have default keybindings:
    
    - [gid.gtk4.window.Window.activateDefault]
    - [gid.gtk4.window.Window.activateFocus]
    - [gid.gtk4.window.Window.enableDebugging]
    
    # Actions
    
    [gid.gtk4.window.Window] defines a set of built-in actions:
    
    - `default.activate` activates the default widget.
    - `window.minimize` minimizes the window.
    - `window.toggle-maximized` maximizes or restores the window.
    - `window.close` closes the window.
    
    # CSS nodes
    
    ```
    window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
    ├── <child>
    ╰── <titlebar child>.titlebar [.default-decoration]
    ```
    
    [gid.gtk4.window.Window] has a main CSS node with name window and style class .background.
    
    Style classes that are typically used with the main CSS node are .csd (when
    client-side decorations are in use), .solid-csd (for client-side decorations
    without invisible borders), .ssd (used by mutter when rendering server-side
    decorations). GtkWindow also represents window states with the following
    style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
    also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
    
    [gid.gtk4.window.Window] subclasses often add their own discriminating style classes,
    such as .dialog, .popup or .tooltip.
    
    Generally, some CSS properties don't make sense on the toplevel window node,
    such as margins or padding. When client-side decorations without invisible
    borders are in use (i.e. the .solid-csd style class is added to the
    main window node), the CSS border of the toplevel window is used for
    resize drags. In the .csd case, the shadow area outside of the window
    can be used to resize it.
    
    [gid.gtk4.window.Window] adds the .titlebar and .default-decoration style classes to the
    widget that is added as a titlebar child.
    
    # Accessibility
    
    [gid.gtk4.window.Window] uses the [gid.gtk4.types.AccessibleRole.Window] role.
    
    From GTK 4.12 to 4.18, it used the [gid.gtk4.types.AccessibleRole.Application] role.
*/
@gidGir("Window", "WindowClass")
class Window : gid.gtk4.widget.Widget, gid.gtk4.native.Native, gid.gtk4.root.Root, gid.gtk4.shortcut_manager.ShortcutManager
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
    return cast(void function())gtk_window_get_type != &gidSymbolNotFound ? gtk_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override Window self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.window.Window]
      Returns: New builder object
  */
  static WindowGidBuilder builder() nothrow
  {
    return new WindowGidBuilder;
  }

  /**
      Get `application` property.
      Returns: The [gid.gtk4.application.Application] associated with the window.
        
        The application will be kept alive for at least as long as it
        has any windows associated with it (see [gid.gio2.application.Application.hold]
        for a way to keep it alive without windows).
        
        Normally, the connection between the application and the window
        will remain until the window is destroyed, but you can explicitly
        remove it by setting the this property to `NULL`.
  */
  @property gid.gtk4.application.Application application() nothrow
  {
    return getApplication();
  }

  /**
      Set `application` property.
      Params:
        propval = The [gid.gtk4.application.Application] associated with the window.
          
          The application will be kept alive for at least as long as it
          has any windows associated with it (see [gid.gio2.application.Application.hold]
          for a way to keep it alive without windows).
          
          Normally, the connection between the application and the window
          will remain until the window is destroyed, but you can explicitly
          remove it by setting the this property to `NULL`.
  */
  @property void application(gid.gtk4.application.Application propval) nothrow
  {
    setApplication(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `decorated` property.
      Returns: Whether the window should have a frame (also known as *decorations*).
  */
  @property bool decorated() nothrow
  {
    return getDecorated();
  }

  /**
      Set `decorated` property.
      Params:
        propval = Whether the window should have a frame (also known as *decorations*).
  */
  @property void decorated(bool propval) nothrow
  {
    setDecorated(propval);
  }

  /**
      Get `defaultHeight` property.
      Returns: The default height of the window.
  */
  @property int defaultHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("default-height");
  }

  /**
      Set `defaultHeight` property.
      Params:
        propval = The default height of the window.
  */
  @property void defaultHeight(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("default-height", propval);
  }

  /**
      Get `defaultWidget` property.
      Returns: The default widget.
  */
  @property gid.gtk4.widget.Widget defaultWidget() nothrow
  {
    return getDefaultWidget();
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget.
  */
  @property void defaultWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setDefaultWidget(propval);
  }

  /**
      Get `defaultWidth` property.
      Returns: The default width of the window.
  */
  @property int defaultWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("default-width");
  }

  /**
      Set `defaultWidth` property.
      Params:
        propval = The default width of the window.
  */
  @property void defaultWidth(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("default-width", propval);
  }

  /**
      Get `deletable` property.
      Returns: Whether the window frame should have a close button.
  */
  @property bool deletable() nothrow
  {
    return getDeletable();
  }

  /**
      Set `deletable` property.
      Params:
        propval = Whether the window frame should have a close button.
  */
  @property void deletable(bool propval) nothrow
  {
    setDeletable(propval);
  }

  /**
      Get `destroyWithParent` property.
      Returns: If this window should be destroyed when the parent is destroyed.
  */
  @property bool destroyWithParent() nothrow
  {
    return getDestroyWithParent();
  }

  /**
      Set `destroyWithParent` property.
      Params:
        propval = If this window should be destroyed when the parent is destroyed.
  */
  @property void destroyWithParent(bool propval) nothrow
  {
    setDestroyWithParent(propval);
  }

  /**
      Get `display` property.
      Returns: The display that will display this window.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.display.Display)("display");
  }

  /**
      Set `display` property.
      Params:
        propval = The display that will display this window.
  */
  @property void display(gid.gdk4.display.Display propval) nothrow
  {
    setDisplay(propval);
  }

  /**
      Get `focusVisible` property.
      Returns: Whether 'focus rectangles' are currently visible in this window.
        
        This property is maintained by GTK based on user input
        and should not be set by applications.
  */
  @property bool focusVisible() nothrow
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
  @property void focusVisible(bool propval) nothrow
  {
    setFocusVisible(propval);
  }

  /**
      Get `focusWidget` property.
      Returns: The focus widget.
  */
  @property gid.gtk4.widget.Widget focusWidget() nothrow
  {
    return getFocus();
  }

  /**
      Set `focusWidget` property.
      Params:
        propval = The focus widget.
  */
  @property void focusWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setFocus(propval);
  }

  /**
      Get `fullscreened` property.
      Returns: Whether the window is fullscreen.
        
        Setting this property is the equivalent of calling
        [gid.gtk4.window.Window.fullscreen] or [gid.gtk4.window.Window.unfullscreen];
        either operation is asynchronous, which means you will need to
        connect to the ::notify signal in order to know whether the
        operation was successful.
  */
  @property bool fullscreened() nothrow
  {
    return isFullscreen();
  }

  /**
      Set `fullscreened` property.
      Params:
        propval = Whether the window is fullscreen.
          
          Setting this property is the equivalent of calling
          [gid.gtk4.window.Window.fullscreen] or [gid.gtk4.window.Window.unfullscreen];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
  */
  @property void fullscreened(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("fullscreened", propval);
  }

  /**
      Get `gravity` property.
      Returns: The gravity to use when resizing the window programmatically.
        
        Gravity describes which point of the window we want to keep
        fixed (meaning that the window will grow in the opposite direction).
        For example, a gravity of [gid.gtk4.types.WindowGravity.TopRight] means that we
        want the to fix top right corner of the window.
  */
  @property gid.gtk4.types.WindowGravity gravity() nothrow
  {
    return getGravity();
  }

  /**
      Set `gravity` property.
      Params:
        propval = The gravity to use when resizing the window programmatically.
          
          Gravity describes which point of the window we want to keep
          fixed (meaning that the window will grow in the opposite direction).
          For example, a gravity of [gid.gtk4.types.WindowGravity.TopRight] means that we
          want the to fix top right corner of the window.
  */
  @property void gravity(gid.gtk4.types.WindowGravity propval) nothrow
  {
    setGravity(propval);
  }

  /**
      Get `handleMenubarAccel` property.
      Returns: Whether the window frame should handle <kbd>F10</kbd> for activating
        menubars.
  */
  @property bool handleMenubarAccel() nothrow
  {
    return getHandleMenubarAccel();
  }

  /**
      Set `handleMenubarAccel` property.
      Params:
        propval = Whether the window frame should handle <kbd>F10</kbd> for activating
          menubars.
  */
  @property void handleMenubarAccel(bool propval) nothrow
  {
    setHandleMenubarAccel(propval);
  }

  /**
      Get `hideOnClose` property.
      Returns: If this window should be hidden instead of destroyed when the user clicks
        the close button.
  */
  @property bool hideOnClose() nothrow
  {
    return getHideOnClose();
  }

  /**
      Set `hideOnClose` property.
      Params:
        propval = If this window should be hidden instead of destroyed when the user clicks
          the close button.
  */
  @property void hideOnClose(bool propval) nothrow
  {
    setHideOnClose(propval);
  }

  /**
      Get `iconName` property.
      Returns: Specifies the name of the themed icon to use as the window icon.
        
        See [gid.gtk4.icon_theme.IconTheme] for more details.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = Specifies the name of the themed icon to use as the window icon.
          
          See [gid.gtk4.icon_theme.IconTheme] for more details.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `maximized` property.
      Returns: Whether the window is maximized.
        
        Setting this property is the equivalent of calling
        [gid.gtk4.window.Window.maximize] or [gid.gtk4.window.Window.unmaximize];
        either operation is asynchronous, which means you will need to
        connect to the ::notify signal in order to know whether the
        operation was successful.
  */
  @property bool maximized() nothrow
  {
    return isMaximized();
  }

  /**
      Set `maximized` property.
      Params:
        propval = Whether the window is maximized.
          
          Setting this property is the equivalent of calling
          [gid.gtk4.window.Window.maximize] or [gid.gtk4.window.Window.unmaximize];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
  */
  @property void maximized(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("maximized", propval);
  }

  /**
      Get `mnemonicsVisible` property.
      Returns: Whether mnemonics are currently visible in this window.
        
        This property is maintained by GTK based on user input,
        and should not be set by applications.
  */
  @property bool mnemonicsVisible() nothrow
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
  @property void mnemonicsVisible(bool propval) nothrow
  {
    setMnemonicsVisible(propval);
  }

  /**
      Get `modal` property.
      Returns: If true, the window is modal.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = If true, the window is modal.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `resizable` property.
      Returns: If true, users can resize the window.
  */
  @property bool resizable() nothrow
  {
    return getResizable();
  }

  /**
      Set `resizable` property.
      Params:
        propval = If true, users can resize the window.
  */
  @property void resizable(bool propval) nothrow
  {
    setResizable(propval);
  }

  /**
      Set `startupId` property.
      Params:
        propval = A write-only property for setting window's startup notification identifier.
  */
  @property void startupId(string propval) nothrow
  {
    setStartupId(propval);
  }

  /**
      Get `suspended` property.
      Returns: Whether the window is suspended.
        
        See [gid.gtk4.window.Window.isSuspended] for details about what suspended means.
  */
  @property bool suspended() nothrow
  {
    return isSuspended();
  }

  /**
      Get `title` property.
      Returns: The title of the window.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the window.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `titlebar` property.
      Returns: The titlebar widget.
  */
  @property gid.gtk4.widget.Widget titlebar() nothrow
  {
    return getTitlebar();
  }

  /**
      Set `titlebar` property.
      Params:
        propval = The titlebar widget.
  */
  @property void titlebar(gid.gtk4.widget.Widget propval) nothrow
  {
    setTitlebar(propval);
  }

  /**
      Get `transientFor` property.
      Returns: The transient parent of the window.
  */
  @property gid.gtk4.window.Window transientFor() nothrow
  {
    return getTransientFor();
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the window.
  */
  @property void transientFor(gid.gtk4.window.Window propval) nothrow
  {
    setTransientFor(propval);
  }

  mixin NativeT!();
  mixin RootT!();
  mixin ShortcutManagerT!();

  /**
      Creates a new [gid.gtk4.window.Window].
      
      To get an undecorated window (without window borders),
      use [gid.gtk4.window.Window.setDecorated].
      
      All top-level windows created by this function are stored
      in an internal top-level window list. This list can be obtained
      from [gid.gtk4.window.Window.listToplevels]. Due to GTK keeping a
      reference to the window internally, this function does not
      return a reference to the caller.
      
      To delete a [gid.gtk4.window.Window], call [gid.gtk4.window.Window.destroy].
      Returns: a new [gid.gtk4.window.Window]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_window_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Returns the fallback icon name for windows.
      
      The returned string is owned by GTK and should not
      be modified. It is only valid until the next call to
      [gid.gtk4.window.Window.setDefaultIconName].
      Returns: the fallback icon name for windows
  */
  static string getDefaultIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_default_icon_name();
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the list of all existing toplevel windows.
      
      If you want to iterate through the list and perform actions involving
      callbacks that might destroy the widgets or add new ones, be aware that
      the list of toplevels will change and emit the "items-changed" signal.
      Returns: the list
          of toplevel widgets
  */
  static gid.gio2.list_model.ListModel getToplevels() nothrow
  {
    GListModel* _cretval;
    _cretval = gtk_window_get_toplevels();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the list of all existing toplevel windows.
      
      The widgets in the list are not individually referenced.
      If you want to iterate through the list and perform actions
      involving callbacks that might destroy the widgets, you must
      call `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first,
      and then unref all the widgets afterwards.
      Returns: list of
          toplevel widgets
  */
  static gid.gtk4.widget.Widget[] listToplevels() nothrow
  {
    GList* _cretval;
    _cretval = gtk_window_list_toplevels();
    auto _retval = gListToD!(gid.gtk4.widget.Widget, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets whether the window should request startup notification.
      
      By default, after showing the first window, GTK calls
      [gid.gdk4.toplevel.Toplevel.setStartupId]. Call this function
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
  static void setAutoStartupNotification(bool setting) nothrow
  {
    gtk_window_set_auto_startup_notification(setting);
  }

  /**
      Sets an icon to be used as fallback.
      
      The fallback icon is used for windows that
      haven't had [gid.gtk4.window.Window.setIconName]
      called on them.
  
      Params:
        name = the name of the themed icon
  */
  static void setDefaultIconName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_window_set_default_icon_name(_name);
  }

  /**
      Opens or closes the [interactive debugger](running.html#interactive-debugging).
      
      The debugger offers access to the widget hierarchy of the application
      and to useful debugging tools.
      
      This function allows applications that already use
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd>
      (or <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>D</kbd>)
      for their own key shortcuts to add a different shortcut to open the Inspector.
      
      If you are not overriding the default key shortcuts for the Inspector,
      you should not use this function.
  
      Params:
        enable = true to enable interactive debugging
  */
  static void setInteractiveDebugging(bool enable) nothrow
  {
    gtk_window_set_interactive_debugging(enable);
  }

  /**
      Activates the default widget for the window.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivateDefault` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivateDefault()
  {
    auto _klass = cast(GtkWindowClass*)_vfuncClass;
    if (!_klass.activateDefault)
      return;

    _klass.activateDefault(cast(GtkWindow*)this._cPtr);
  }

  /**
      Activates the current focused widget within the window.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivateFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivateFocus()
  {
    auto _klass = cast(GtkWindowClass*)_vfuncClass;
    if (!_klass.activateFocus)
      return;

    _klass.activateFocus(cast(GtkWindow*)this._cPtr);
  }

  /**
      Class handler for the [gid.gtk4.window.Window.closeRequest] signal.
      Returns: Whether the window should be destroyed
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCloseRequest` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCloseRequest()
  {
    auto _klass = cast(GtkWindowClass*)_vfuncClass;
    if (!_klass.closeRequest)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.closeRequest(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Class handler for the `GtkWindow::enable-debugging`
        keybinding signal.
  
      Params:
        toggle = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEnableDebugging` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncEnableDebugging(bool toggle)
  {
    auto _klass = cast(GtkWindowClass*)_vfuncClass;
    if (!_klass.enableDebugging)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.enableDebugging(cast(GtkWindow*)this._cPtr, toggle);
    return _retval;
  }

  /**
      Signal gets emitted when the set of accelerators or
        mnemonics that are associated with window changes.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncKeysChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncKeysChanged()
  {
    auto _klass = cast(GtkWindowClass*)_vfuncClass;
    if (!_klass.keysChanged)
      return;

    _klass.keysChanged(cast(GtkWindow*)this._cPtr);
  }

  /**
      Requests that the window is closed.
      
      This is similar to what happens when a window manager
      close button is clicked.
      
      This function can be used with close buttons in custom
      titlebars.
  */
  void close() nothrow
  {
    gtk_window_close(cast(GtkWindow*)this._cPtr);
  }

  /**
      Drops the internal reference GTK holds on toplevel windows.
  */
  void destroy() nothrow
  {
    gtk_window_destroy(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place the window in the fullscreen state.
      
      Note that you shouldn’t assume the window is definitely fullscreen
      afterward, because other entities (e.g. the user or window manager)
      unfullscreen it again, and not all window managers honor requests
      to fullscreen windows.
      
      If a window is not explicitly fullscreened or unfullscreened before
      it is shown, the initial state is at the window managers discretion.
      
      You can track the result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gid.gtk4.window.Window.fullscreened] property.
  */
  void fullscreen() nothrow
  {
    gtk_window_fullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to place the window in the fullscreen state on the given monitor.
      
      Note that you shouldn't assume the window is definitely fullscreen
      afterward, or that the windowing system allows fullscreen windows on
      any given monitor.
      
      You can track the result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gid.gtk4.window.Window.fullscreened] property.
  
      Params:
        monitor = which monitor to go fullscreen on
  */
  void fullscreenOnMonitor(gid.gdk4.monitor.MonitorWrap monitor) nothrow
  {
    gtk_window_fullscreen_on_monitor(cast(GtkWindow*)this._cPtr, monitor ? cast(GdkMonitor*)monitor._cPtr(No.Dup) : null);
  }

  /**
      Gets the application object associated with the window.
      Returns: the application
  */
  gid.gtk4.application.Application getApplication() nothrow
  {
    GtkApplication* _cretval;
    _cretval = gtk_window_get_application(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.application.Application)(cast(GtkApplication*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child widget of the window.
      Returns: the child widget of window
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_child(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have decorations.
      Returns: true if the window has been set to have decorations
  */
  bool getDecorated() nothrow
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
  void getDefaultSize(out int width, out int height) nothrow
  {
    gtk_window_get_default_size(cast(GtkWindow*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the default widget for window.
      Returns: the default widget
  */
  gid.gtk4.widget.Widget getDefaultWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_default_widget(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has been set to have a close button.
      Returns: true if the window has been set to have a close button
  */
  bool getDeletable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_deletable(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be destroyed with its transient parent.
      Returns: true if the window will be destroyed with its transient parent
  */
  bool getDestroyWithParent() nothrow
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
      not be false for the widget.
      Returns: the currently focused widget
  */
  gid.gtk4.widget.Widget getFocus() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_focus(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether “focus rectangles” are supposed to be visible.
      Returns: true if “focus rectangles” are supposed to be visible
          in this window
  */
  bool getFocusVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_focus_visible(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the gravity that is used when changing the window size programmatically.
      Returns: the gravity
  */
  gid.gtk4.types.WindowGravity getGravity() nothrow
  {
    GtkWindowGravity _cretval;
    _cretval = gtk_window_get_gravity(cast(GtkWindow*)this._cPtr);
    gid.gtk4.types.WindowGravity _retval = cast(gid.gtk4.types.WindowGravity)_cretval;
    return _retval;
  }

  /**
      Returns the group for the window.
      
      If the window has no group, then the default group is returned.
      Returns: the window group for window
          or the default group
  */
  gid.gtk4.window_group.WindowGroup getGroup() nothrow
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_get_group(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window_group.WindowGroup)(cast(GtkWindowGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether this window reacts to <kbd>F10</kbd>
      presses by activating a menubar it contains.
      Returns: true if the window handles <kbd>F10</kbd>
  */
  bool getHandleMenubarAccel() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_handle_menubar_accel(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the window will be hidden instead of destroyed when the close
      button is clicked.
      Returns: true if the window will be hidden
  */
  bool getHideOnClose() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_hide_on_close(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the name of the themed icon for the window.
      Returns: the icon name
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_icon_name(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether mnemonics are supposed to be visible.
      Returns: true if mnemonics are supposed to be visible
          in this window
  */
  bool getMnemonicsVisible() nothrow
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
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_modal(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the user can resize the window.
      Returns: true if the user can resize the window
  */
  bool getResizable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_get_resizable(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the window.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_window_get_title(cast(GtkWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the titlebar that has been set with
      [gid.gtk4.window.Window.setTitlebar].
      Returns: the titlebar
  */
  gid.gtk4.widget.Widget getTitlebar() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_get_titlebar(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the transient parent for this window.
      Returns: the transient parent
  */
  gid.gtk4.window.Window getTransientFor() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_window_get_transient_for(cast(GtkWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the window has an explicit window group.
      Returns: true if window has an explicit window group
  */
  bool hasGroup() nothrow
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
  bool isActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_active(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current fullscreen state of the window.
      
      Note that since fullscreening is ultimately handled by the window
      manager and happens asynchronously to an application request, you
      shouldn’t assume the return value of this function changing
      immediately (or at all), as an effect of calling
      [gid.gtk4.window.Window.fullscreen] or [gid.gtk4.window.Window.unfullscreen].
      
      If the window isn't yet mapped, the value returned will whether the
      initial requested state is fullscreen.
      Returns: whether the window is fullscreen
  */
  bool isFullscreen() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_fullscreen(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current maximized state of the window.
      
      Note that since maximization is ultimately handled by the window
      manager and happens asynchronously to an application request, you
      shouldn’t assume the return value of this function changing
      immediately (or at all), as an effect of calling
      [gid.gtk4.window.Window.maximize] or [gid.gtk4.window.Window.unmaximize].
      
      If the window isn't yet mapped, the value returned will whether the
      initial requested state is maximized.
      Returns: whether the window is maximized
  */
  bool isMaximized() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_maximized(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current suspended state of the window.
      
      A window being suspended means it's currently not visible
      to the user, for example by being on a inactive workspace,
      minimized, obstructed.
      Returns: whether the window is suspended
  */
  bool isSuspended() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_is_suspended(cast(GtkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Asks to maximize the window, so that it fills the screen.
      
      Note that you shouldn’t assume the window is definitely maximized
      afterward, because other entities (e.g. the user or window manager)
      could unmaximize it again, and not all window managers support
      maximization.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be maximized when it appears onscreen
      initially.
      
      If a window is not explicitly maximized or unmaximized before it is
      shown, the initial state is at the window managers discretion. For
      example, it might decide to maximize a window that almost fills the
      screen.
      
      You can track the result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property, or by listening to
      notifications on the [gid.gtk4.window.Window.maximized]
      property.
  */
  void maximize() nothrow
  {
    gtk_window_maximize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to minimize the window.
      
      Note that you shouldn’t assume the window is definitely minimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager)
      could unminimize it again, or there may not be a window manager in
      which case minimization isn’t possible, etc.
      
      It’s permitted to call this function before showing a window,
      in which case the window will be minimized before it ever appears
      onscreen.
      
      You can track result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property.
  */
  void minimize() nothrow
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
  void present() nothrow
  {
    gtk_window_present(cast(GtkWindow*)this._cPtr);
  }

  /**
      Presents a window to the user in response to an user interaction.
      
      See [gid.gtk4.window.Window.present] for more details.
      
      The timestamp should be gathered when the window was requested
      to be shown (when clicking a link for example), rather than once
      the window is ready to be shown.
  
      Params:
        timestamp = the timestamp of the user interaction (typically a
            button or key press event) which triggered this call
  
      Deprecated: Use [gid.gtk4.window.Window.present]
  */
  void presentWithTime(uint timestamp) nothrow
  {
    gtk_window_present_with_time(cast(GtkWindow*)this._cPtr, timestamp);
  }

  /**
      Sets or unsets the application object associated with the window.
      
      The application will be kept alive for at least as long as it has
      any windows associated with it (see [gid.gio2.application.Application.hold]
      for a way to keep it alive without windows).
      
      Normally, the connection between the application and the window will
      remain until the window is destroyed, but you can explicitly remove
      it by setting the application to null.
      
      This is equivalent to calling [gid.gtk4.application.Application.removeWindow]
      and/or [gid.gtk4.application.Application.addWindow] on the old/new applications
      as relevant.
  
      Params:
        application = a [gid.gtk4.application.Application]
  */
  void setApplication(gid.gtk4.application.Application application = null) nothrow
  {
    gtk_window_set_application(cast(GtkWindow*)this._cPtr, application ? cast(GtkApplication*)application._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of the window.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
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
      [gid.gtk4.widget.Widget.show].
      
      On Windows, this function always works, since there’s no window manager
      policy involved.
  
      Params:
        setting = true to decorate the window
  */
  void setDecorated(bool setting) nothrow
  {
    gtk_window_set_decorated(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the default size of a window.
      
      The default size of a window is the size that will be used
      if no other constraints apply.
      
      The default size will be updated whenever the window is resized
      to reflect the new size, unless the window is forced to a size,
      like when it is maximized or fullscreened.
      
      If the window’s minimum size request is larger than
      the default, the default will be ignored.
      
      Setting the default size to a value <= 0 will cause it to be
      ignored and the natural size request will be used instead. It
      is possible to do this while the window is showing to "reset"
      it to its initial size.
      
      Unlike [gid.gtk4.widget.Widget.setSizeRequest], which sets a size
      request for a widget and thus would keep users from shrinking
      the window, this function only sets the initial size, just as
      if the user had resized the window themselves. Users can still
      shrink the window again as they normally would. Setting a default
      size of -1 means to use the “natural” default size (the size request
      of the window).
      
      If you use this function to reestablish a previously saved window size,
      note that the appropriate size to save is the one returned by
      [gid.gtk4.window.Window.getDefaultSize]. Using the window allocation
      directly will not work in all circumstances and can lead to growing
      or shrinking windows.
  
      Params:
        width = width in pixels, or -1 to unset the default width
        height = height in pixels, or -1 to unset the default height
  */
  void setDefaultSize(int width, int height) nothrow
  {
    gtk_window_set_default_size(cast(GtkWindow*)this._cPtr, width, height);
  }

  /**
      Sets the default widget.
      
      The default widget is the widget that is activated
      when the user presses <kbd>Enter</kbd> in a dialog
      (for example).
  
      Params:
        defaultWidget = widget to be the default
  */
  void setDefaultWidget(gid.gtk4.widget.Widget defaultWidget = null) nothrow
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
      so you should call it before calling [gid.gtk4.widget.Widget.show].
      
      On Windows, this function always works, since there’s no window
      manager policy involved.
  
      Params:
        setting = true to decorate the window as deletable
  */
  void setDeletable(bool setting) nothrow
  {
    gtk_window_set_deletable(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets whether to destroy the window when the transient parent is destroyed.
      
      This is useful for dialogs that shouldn’t persist beyond the lifetime
      of the main window they are associated with, for example.
  
      Params:
        setting = whether to destroy the window with its transient parent
  */
  void setDestroyWithParent(bool setting) nothrow
  {
    gtk_window_set_destroy_with_parent(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the display where the window is displayed.
      
      If the window is already mapped, it will be unmapped,
      and then remapped on the new display.
  
      Params:
        display = a display
  */
  void setDisplay(gid.gdk4.display.Display display) nothrow
  {
    gtk_window_set_display(cast(GtkWindow*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the focus widget.
      
      If focus is not the current focus widget, and is focusable,
      sets it as the focus widget for the window. If focus is null,
      unsets the focus widget for this window. To set the focus to a
      particular widget in the toplevel, it is usually more convenient
      to use [gid.gtk4.widget.Widget.grabFocus] instead of this function.
  
      Params:
        focus = the new focus widget
  */
  void setFocus(gid.gtk4.widget.Widget focus = null) nothrow
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
  void setFocusVisible(bool setting) nothrow
  {
    gtk_window_set_focus_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the gravity that is used when changing the window size programmatically.
  
      Params:
        gravity = the new gravity
  */
  void setGravity(gid.gtk4.types.WindowGravity gravity) nothrow
  {
    gtk_window_set_gravity(cast(GtkWindow*)this._cPtr, gravity);
  }

  /**
      Sets whether this window should react to <kbd>F10</kbd>
      presses by activating a menubar it contains.
  
      Params:
        handleMenubarAccel = true to make window handle <kbd>F10</kbd>
  */
  void setHandleMenubarAccel(bool handleMenubarAccel) nothrow
  {
    gtk_window_set_handle_menubar_accel(cast(GtkWindow*)this._cPtr, handleMenubarAccel);
  }

  /**
      Sets whether clicking the close button will hide the window instead
      of destroying it.
  
      Params:
        setting = whether to hide the window when it is closed
  */
  void setHideOnClose(bool setting) nothrow
  {
    gtk_window_set_hide_on_close(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets the icon for the window from a named themed icon.
      
      See the docs for [gid.gtk4.icon_theme.IconTheme] for more details.
      On some platforms, the window icon is not used at all.
      
      Note that this has nothing to do with the WM_ICON_NAME
      property which is mentioned in the ICCCM.
  
      Params:
        name = the name of the themed icon
  */
  void setIconName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_window_set_icon_name(cast(GtkWindow*)this._cPtr, _name);
  }

  /**
      Sets whether mnemonics are supposed to be visible.
      
      This property is maintained by GTK based on user input,
      and should not be set by applications.
  
      Params:
        setting = the new value
  */
  void setMnemonicsVisible(bool setting) nothrow
  {
    gtk_window_set_mnemonics_visible(cast(GtkWindow*)this._cPtr, setting);
  }

  /**
      Sets a window modal or non-modal.
      
      Modal windows prevent interaction with other windows in the same
      application. To keep modal dialogs on top of main application windows,
      use [gid.gtk4.window.Window.setTransientFor] to make the dialog transient
      for the parent; most window managers will then disallow lowering the
      dialog below the parent.
  
      Params:
        modal = whether the window is modal
  */
  void setModal(bool modal) nothrow
  {
    gtk_window_set_modal(cast(GtkWindow*)this._cPtr, modal);
  }

  /**
      Sets whether the user can resize a window.
      
      Windows are user resizable by default.
  
      Params:
        resizable = true if the user can resize this window
  */
  void setResizable(bool resizable) nothrow
  {
    gtk_window_set_resizable(cast(GtkWindow*)this._cPtr, resizable);
  }

  /**
      Sets the startup notification ID.
      
      Startup notification identifiers are used by desktop environment
      to track application startup, to provide user feedback and other
      features. This function changes the corresponding property on the
      underlying [gid.gdk4.surface.Surface].
      
      Normally, startup identifier is managed automatically and you should
      only use this function in special cases like transferring focus from
      other processes. You should use this function before calling
      [gid.gtk4.window.Window.present] or any equivalent function generating
      a window map event.
      
      This function is only useful on Wayland or X11, not with other GDK
      backends.
  
      Params:
        startupId = a string with startup-notification identifier
  */
  void setStartupId(string startupId) nothrow
  {
    const(char)* _startupId = startupId.toCString!(No.Malloc, No.Nullable);
    gtk_window_set_startup_id(cast(GtkWindow*)this._cPtr, _startupId);
  }

  /**
      Sets the title of the window.
      
      The title of a window will be displayed in its title bar; on the
      X Window System, the title bar is rendered by the window manager
      so exactly how the title appears to users may vary according to a
      user’s exact configuration. The title should help a user distinguish
      this window from other windows they may have open. A good title might
      include the application name and current document filename, for example.
      
      Passing `NULL` does the same as setting the title to an empty string.
  
      Params:
        title = title of the window
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    gtk_window_set_title(cast(GtkWindow*)this._cPtr, _title);
  }

  /**
      Sets a custom titlebar for the window.
      
      A typical widget used here is [gid.gtk4.header_bar.HeaderBar], as it
      provides various features expected of a titlebar while allowing
      the addition of child widgets to it.
      
      If you set a custom titlebar, GTK will do its best to convince
      the window manager not to put its own titlebar on the window.
      Depending on the system, this function may not work for a window
      that is already visible, so you set the titlebar before calling
      [gid.gtk4.widget.Widget.show].
  
      Params:
        titlebar = the widget to use as titlebar
  */
  void setTitlebar(gid.gtk4.widget.Widget titlebar = null) nothrow
  {
    gtk_window_set_titlebar(cast(GtkWindow*)this._cPtr, titlebar ? cast(GtkWidget*)titlebar._cPtr(No.Dup) : null);
  }

  /**
      Sets a transient parent for the window.
      
      Dialog windows should be set transient for the main application
      window they were spawned from. This allows window managers to e.g.
      keep the dialog on top of the main window, or center the dialog
      over the main window. [gid.gtk4.dialog.Dialog.newWithButtons] and other
      convenience functions in GTK will sometimes call this function on
      your behalf.
      
      Passing `NULL` for parent unsets the current transient window.
      
      On Windows, this function puts the child window on top of the parent,
      much as the window manager would have done on X.
  
      Params:
        parent = parent window
  */
  void setTransientFor(gid.gtk4.window.Window parent = null) nothrow
  {
    gtk_window_set_transient_for(cast(GtkWindow*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      Asks to remove the fullscreen state for the window, and return to
      its previous state.
      
      Note that you shouldn’t assume the window is definitely not
      fullscreen afterward, because other entities (e.g. the user or
      window manager) could fullscreen it again, and not all window
      managers honor requests to unfullscreen windows; normally the
      window will end up restored to its normal state. Just don’t
      write code that crashes if not.
      
      If a window is not explicitly fullscreened or unfullscreened before
      it is shown, the initial state is at the window managers discretion.
      
      You can track the result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property, or by listening to
      notifications of the [gid.gtk4.window.Window.fullscreened] property.
  */
  void unfullscreen() nothrow
  {
    gtk_window_unfullscreen(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unmaximize the window.
      
      Note that you shouldn’t assume the window is definitely unmaximized
      afterward, because other entities (e.g. the user or window manager)
      maximize it again, and not all window managers honor requests to
      unmaximize.
      
      If a window is not explicitly maximized or unmaximized before it is
      shown, the initial state is at the window managers discretion. For
      example, it might decide to maximize a window that almost fills the
      screen.
      
      You can track the result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property, or by listening to
      notifications on the [gid.gtk4.window.Window.maximized] property.
  */
  void unmaximize() nothrow
  {
    gtk_window_unmaximize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Asks to unminimize the window.
      
      Note that you shouldn’t assume the window is definitely unminimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager)
      could minimize it again, or there may not be a window manager in
      which case minimization isn’t possible, etc.
      
      You can track result of this operation via the
      [gid.gdk4.toplevel.Toplevel.state] property.
  */
  void unminimize() nothrow
  {
    gtk_window_unminimize(cast(GtkWindow*)this._cPtr);
  }

  /**
      Connect to `ActivateDefault` signal.
  
      Emitted when the user activates the default widget.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.window.Window window)`
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateDefault(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.activateDefault");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-default", closure, after);
  }

  /**
      Connect to `ActivateFocus` signal.
  
      Emitted when the user activates the currently focused
        widget of window.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>␣</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.window.Window window)`
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.activateFocus");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-focus", closure, after);
  }

  /**
      Connect to `CloseRequest` signal.
  
      Emitted when the user clicks on the close button of the window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.window.Window window)`
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the signal
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCloseRequest(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.closeRequest");
      }

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
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd> and
        <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>D</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool toggle, gid.gtk4.window.Window window)`
  
          `toggle` toggle the debugger (optional)
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` true if the key binding was handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnableDebugging(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.window.Window)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.enableDebugging");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enable-debugging", closure, after);
  }

  /**
      Connect to `KeysChanged` signal.
  
      Emitted when the set of accelerators or mnemonics that
        are associated with the window changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.window.Window window)`
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gid.gtk4.shortcut.Shortcut] and [gid.gtk4.event_controller.EventController]
          to implement keyboard shortcuts
  */
  gulong connectKeysChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.window.Window)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.keysChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("keys-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Window
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.window.Window), T.stringof ~ " is not derived from gid.gtk4.window.Window");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateDefault", true)[0]) == gid.gtk4.window.Window))
      _installVfunc(klass, "activate_default");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateFocus", true)[0]) == gid.gtk4.window.Window))
      _installVfunc(klass, "activate_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCloseRequest", true)[0]) == gid.gtk4.window.Window))
      _installVfunc(klass, "close_request");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEnableDebugging", true)[0]) == gid.gtk4.window.Window))
      _installVfunc(klass, "enable_debugging");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncKeysChanged", true)[0]) == gid.gtk4.window.Window))
      _installVfunc(klass, "keys_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkWindowClass*)klass;

    switch (vfunc)
    {
      case "activate_default":
      {
        static extern(C) void _vfuncActivateDefaultTramp(GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.window.Window)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GtkWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.activateDefault)
              return (cast(typeof(&_vfuncActivateDefaultTramp))_klass.activateDefault)(window);
            return;
          }

          try
          {
            _obj.vfuncActivateDefault();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.vfuncActivateDefault");
          }
        }

        _klass.activateDefault = cast(typeof(_klass.activateDefault))&_vfuncActivateDefaultTramp;
        break;
      }
      case "activate_focus":
      {
        static extern(C) void _vfuncActivateFocusTramp(GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.window.Window)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GtkWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.activateFocus)
              return (cast(typeof(&_vfuncActivateFocusTramp))_klass.activateFocus)(window);
            return;
          }

          try
          {
            _obj.vfuncActivateFocus();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.vfuncActivateFocus");
          }
        }

        _klass.activateFocus = cast(typeof(_klass.activateFocus))&_vfuncActivateFocusTramp;
        break;
      }
      case "close_request":
      {
        static extern(C) gboolean _vfuncCloseRequestTramp(GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.window.Window)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GtkWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.closeRequest)
              return (cast(typeof(&_vfuncCloseRequestTramp))_klass.closeRequest)(window);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCloseRequest();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.vfuncCloseRequest");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.closeRequest = cast(typeof(_klass.closeRequest))&_vfuncCloseRequestTramp;
        break;
      }
      case "enable_debugging":
      {
        static extern(C) gboolean _vfuncEnableDebuggingTramp(GtkWindow* window, gboolean toggle) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.window.Window)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GtkWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.enableDebugging)
              return (cast(typeof(&_vfuncEnableDebuggingTramp))_klass.enableDebugging)(window, toggle);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEnableDebugging(cast(bool)toggle);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.vfuncEnableDebugging");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.enableDebugging = cast(typeof(_klass.enableDebugging))&_vfuncEnableDebuggingTramp;
        break;
      }
      case "keys_changed":
      {
        static extern(C) void _vfuncKeysChangedTramp(GtkWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.window.Window)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GtkWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.keysChanged)
              return (cast(typeof(&_vfuncKeysChangedTramp))_klass.keysChanged)(window);
            return;
          }

          try
          {
            _obj.vfuncKeysChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.window.Window.vfuncKeysChanged");
          }
        }

        _klass.keysChanged = cast(typeof(_klass.keysChanged))&_vfuncKeysChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.window.Window]
class WindowGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.native.NativeGidBuilderImpl!T, gid.gtk4.root.RootGidBuilderImpl!T, gid.gtk4.shortcut_manager.ShortcutManagerGidBuilderImpl!T
{

  mixin NativeGidBuilderT!();
  mixin RootGidBuilderT!();
  mixin ShortcutManagerGidBuilderT!();

  /**
      Set `application` property.
      Params:
        propval = The [gid.gtk4.application.Application] associated with the window.
          
          The application will be kept alive for at least as long as it
          has any windows associated with it (see [gid.gio2.application.Application.hold]
          for a way to keep it alive without windows).
          
          Normally, the connection between the application and the window
          will remain until the window is destroyed, but you can explicitly
          remove it by setting the this property to `NULL`.
      Returns: Builder instance for fluent chaining
  */
  T application(gid.gtk4.application.Application propval) nothrow
  {
    return setProperty("application", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `decorated` property.
      Params:
        propval = Whether the window should have a frame (also known as *decorations*).
      Returns: Builder instance for fluent chaining
  */
  T decorated(bool propval) nothrow
  {
    return setProperty("decorated", propval);
  }

  /**
      Set `defaultHeight` property.
      Params:
        propval = The default height of the window.
      Returns: Builder instance for fluent chaining
  */
  T defaultHeight(int propval) nothrow
  {
    return setProperty("default-height", propval);
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget.
      Returns: Builder instance for fluent chaining
  */
  T defaultWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("default-widget", propval);
  }

  /**
      Set `defaultWidth` property.
      Params:
        propval = The default width of the window.
      Returns: Builder instance for fluent chaining
  */
  T defaultWidth(int propval) nothrow
  {
    return setProperty("default-width", propval);
  }

  /**
      Set `deletable` property.
      Params:
        propval = Whether the window frame should have a close button.
      Returns: Builder instance for fluent chaining
  */
  T deletable(bool propval) nothrow
  {
    return setProperty("deletable", propval);
  }

  /**
      Set `destroyWithParent` property.
      Params:
        propval = If this window should be destroyed when the parent is destroyed.
      Returns: Builder instance for fluent chaining
  */
  T destroyWithParent(bool propval) nothrow
  {
    return setProperty("destroy-with-parent", propval);
  }

  /**
      Set `display` property.
      Params:
        propval = The display that will display this window.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }

  /**
      Set `focusVisible` property.
      Params:
        propval = Whether 'focus rectangles' are currently visible in this window.
          
          This property is maintained by GTK based on user input
          and should not be set by applications.
      Returns: Builder instance for fluent chaining
  */
  T focusVisible(bool propval) nothrow
  {
    return setProperty("focus-visible", propval);
  }

  /**
      Set `focusWidget` property.
      Params:
        propval = The focus widget.
      Returns: Builder instance for fluent chaining
  */
  T focusWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("focus-widget", propval);
  }

  /**
      Set `fullscreened` property.
      Params:
        propval = Whether the window is fullscreen.
          
          Setting this property is the equivalent of calling
          [gid.gtk4.window.Window.fullscreen] or [gid.gtk4.window.Window.unfullscreen];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
      Returns: Builder instance for fluent chaining
  */
  T fullscreened(bool propval) nothrow
  {
    return setProperty("fullscreened", propval);
  }

  /**
      Set `gravity` property.
      Params:
        propval = The gravity to use when resizing the window programmatically.
          
          Gravity describes which point of the window we want to keep
          fixed (meaning that the window will grow in the opposite direction).
          For example, a gravity of [gid.gtk4.types.WindowGravity.TopRight] means that we
          want the to fix top right corner of the window.
      Returns: Builder instance for fluent chaining
  */
  T gravity(gid.gtk4.types.WindowGravity propval) nothrow
  {
    return setProperty("gravity", propval);
  }

  /**
      Set `handleMenubarAccel` property.
      Params:
        propval = Whether the window frame should handle <kbd>F10</kbd> for activating
          menubars.
      Returns: Builder instance for fluent chaining
  */
  T handleMenubarAccel(bool propval) nothrow
  {
    return setProperty("handle-menubar-accel", propval);
  }

  /**
      Set `hideOnClose` property.
      Params:
        propval = If this window should be hidden instead of destroyed when the user clicks
          the close button.
      Returns: Builder instance for fluent chaining
  */
  T hideOnClose(bool propval) nothrow
  {
    return setProperty("hide-on-close", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = Specifies the name of the themed icon to use as the window icon.
          
          See [gid.gtk4.icon_theme.IconTheme] for more details.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `maximized` property.
      Params:
        propval = Whether the window is maximized.
          
          Setting this property is the equivalent of calling
          [gid.gtk4.window.Window.maximize] or [gid.gtk4.window.Window.unmaximize];
          either operation is asynchronous, which means you will need to
          connect to the ::notify signal in order to know whether the
          operation was successful.
      Returns: Builder instance for fluent chaining
  */
  T maximized(bool propval) nothrow
  {
    return setProperty("maximized", propval);
  }

  /**
      Set `mnemonicsVisible` property.
      Params:
        propval = Whether mnemonics are currently visible in this window.
          
          This property is maintained by GTK based on user input,
          and should not be set by applications.
      Returns: Builder instance for fluent chaining
  */
  T mnemonicsVisible(bool propval) nothrow
  {
    return setProperty("mnemonics-visible", propval);
  }

  /**
      Set `modal` property.
      Params:
        propval = If true, the window is modal.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `resizable` property.
      Params:
        propval = If true, users can resize the window.
      Returns: Builder instance for fluent chaining
  */
  T resizable(bool propval) nothrow
  {
    return setProperty("resizable", propval);
  }

  /**
      Set `startupId` property.
      Params:
        propval = A write-only property for setting window's startup notification identifier.
      Returns: Builder instance for fluent chaining
  */
  T startupId(string propval) nothrow
  {
    return setProperty("startup-id", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the window.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `titlebar` property.
      Params:
        propval = The titlebar widget.
      Returns: Builder instance for fluent chaining
  */
  T titlebar(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("titlebar", propval);
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the window.
      Returns: Builder instance for fluent chaining
  */
  T transientFor(gid.gtk4.window.Window propval) nothrow
  {
    return setProperty("transient-for", propval);
  }
}

/// Fluent builder for [gid.gtk4.window.Window]
final class WindowGidBuilder : WindowGidBuilderImpl!WindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Window build() nothrow
  {
    return new Window(cast(void*)createGObject(Window._getGType), Yes.Take);
  }
}
