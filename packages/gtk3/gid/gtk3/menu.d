/// Module for [Menu] class
module gid.gtk3.menu;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.device;
import gid.gdk3.event;
import gid.gdk3.monitor;
import gid.gdk3.rectangle;
import gid.gdk3.screen;
import gid.gdk3.types;
import gid.gdk3.window;
import gid.gio2.menu_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.accel_group;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu_shell;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkMenu is a #GtkMenuShell that implements a drop down menu
    consisting of a list of #GtkMenuItem objects which can be navigated
    and activated by the user to perform application functions.
    
    A #GtkMenu is most commonly dropped down by activating a
    #GtkMenuItem in a #GtkMenuBar or popped up by activating a
    #GtkMenuItem in another #GtkMenu.
    
    A #GtkMenu can also be popped up by activating a #GtkComboBox.
    Other composite widgets such as the #GtkNotebook can pop up a
    #GtkMenu as well.
    
    Applications can display a #GtkMenu as a popup menu by calling the
    [gid.gtk3.menu.Menu.popup] function.  The example below shows how an application
    can pop up a menu when the 3rd mouse button is pressed.
    
    ## Connecting the popup signal handler.
    
    ```c
      // connect our handler which will popup the menu
      g_signal_connect_swapped (window, "button_press_event",
    G_CALLBACK (my_popup_handler), menu);
    ```
    
    ## Signal handler which displays a popup menu.
    
    ```c
    static gint
    my_popup_handler (GtkWidget *widget, GdkEvent *event)
    {
      GtkMenu *menu;
      GdkEventButton *event_button;
    
      g_return_val_if_fail (widget != NULL, FALSE);
      g_return_val_if_fail (GTK_IS_MENU (widget), FALSE);
      g_return_val_if_fail (event != NULL, FALSE);
    
      // The "widget" is the menu that was supplied when
      // g_signal_connect_swapped() was called.
      menu = GTK_MENU (widget);
    
      if (event->type == GDK_BUTTON_PRESS)
        {
          event_button = (GdkEventButton *) event;
          if (event_button->button == GDK_BUTTON_SECONDARY)
            {
              gtk_menu_popup (menu, NULL, NULL, NULL, NULL,
                              event_button->button, event_button->time);
              return TRUE;
            }
        }
    
      return FALSE;
    }
    ```
    
    # CSS nodes
    
    ```plain
    menu
    ├── arrow.top
    ├── <child>
    ┊
    ├── <child>
    ╰── arrow.bottom
    ```
    
    The main CSS node of GtkMenu has name menu, and there are two subnodes
    with name arrow, for scrolling menu arrows. These subnodes get the
    .top and .bottom style classes.
*/
class Menu : gid.gtk3.menu_shell.MenuShell
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
    return cast(void function())gtk_menu_get_type != &gidSymbolNotFound ? gtk_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenu";
  }

  /** Returns `this`, for use in `with` statements. */
  override Menu self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu.Menu]
      Returns: New builder object
  */
  static MenuGidBuilder builder() nothrow
  {
    return new MenuGidBuilder;
  }

  /**
      Get `accelGroup` property.
      Returns: The accel group holding accelerators for the menu.
  */
  @property gid.gtk3.accel_group.AccelGroup accelGroup() nothrow
  {
    return getAccelGroup();
  }

  /**
      Set `accelGroup` property.
      Params:
        propval = The accel group holding accelerators for the menu.
  */
  @property void accelGroup(gid.gtk3.accel_group.AccelGroup propval) nothrow
  {
    setAccelGroup(propval);
  }

  /**
      Get `accelPath` property.
      Returns: An accel path used to conveniently construct accel paths of child items.
  */
  @property string accelPath() nothrow
  {
    return getAccelPath();
  }

  /**
      Set `accelPath` property.
      Params:
        propval = An accel path used to conveniently construct accel paths of child items.
  */
  @property void accelPath(string propval) nothrow
  {
    setAccelPath(propval);
  }

  /**
      Get `active` property.
      Returns: The index of the currently selected menu item, or -1 if no
        menu item is selected.
  */
  @property int active() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("active");
  }

  /**
      Set `active` property.
      Params:
        propval = The index of the currently selected menu item, or -1 if no
          menu item is selected.
  */
  @property void active(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("active", propval);
  }

  /**
      Get `anchorHints` property.
      Returns: Positioning hints for aligning the menu relative to a rectangle.
        
        These hints determine how the menu should be positioned in the case that
        the menu would fall off-screen if placed in its ideal position.
        
        ![](popup-flip.png)
        
        For example, [gid.gdk4.types.AnchorHints.FlipY] will replace [gid.gdk4.types.Gravity.NorthWest] with
        [gid.gdk4.types.Gravity.SouthWest] and vice versa if the menu extends beyond the
        bottom edge of the monitor.
        
        See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
        gtk_menu_popup_at_pointer (), #GtkMenu:rect-anchor-dx,
        #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property gid.gdk3.types.AnchorHints anchorHints() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.AnchorHints)("anchor-hints");
  }

  /**
      Set `anchorHints` property.
      Params:
        propval = Positioning hints for aligning the menu relative to a rectangle.
          
          These hints determine how the menu should be positioned in the case that
          the menu would fall off-screen if placed in its ideal position.
          
          ![](popup-flip.png)
          
          For example, [gid.gdk4.types.AnchorHints.FlipY] will replace [gid.gdk4.types.Gravity.NorthWest] with
          [gid.gdk4.types.Gravity.SouthWest] and vice versa if the menu extends beyond the
          bottom edge of the monitor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:rect-anchor-dx,
          #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property void anchorHints(gid.gdk3.types.AnchorHints propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.types.AnchorHints)("anchor-hints", propval);
  }

  /**
      Get `attachWidget` property.
      Returns: The widget the menu is attached to. Setting this property attaches
        the menu without a #GtkMenuDetachFunc. If you need to use a detacher,
        use [gid.gtk3.menu.Menu.attachToWidget] directly.
  */
  @property gid.gtk3.widget.Widget attachWidget() nothrow
  {
    return getAttachWidget();
  }

  /**
      Set `attachWidget` property.
      Params:
        propval = The widget the menu is attached to. Setting this property attaches
          the menu without a #GtkMenuDetachFunc. If you need to use a detacher,
          use [gid.gtk3.menu.Menu.attachToWidget] directly.
  */
  @property void attachWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.widget.Widget)("attach-widget", propval);
  }

  /**
      Get `menuTypeHint` property.
      Returns: The #GdkWindowTypeHint to use for the menu's #GdkWindow.
        
        See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
        gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
        #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and #GtkMenu::popped-up.
  */
  @property gid.gdk3.types.WindowTypeHint menuTypeHint() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.WindowTypeHint)("menu-type-hint");
  }

  /**
      Set `menuTypeHint` property.
      Params:
        propval = The #GdkWindowTypeHint to use for the menu's #GdkWindow.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and #GtkMenu::popped-up.
  */
  @property void menuTypeHint(gid.gdk3.types.WindowTypeHint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.types.WindowTypeHint)("menu-type-hint", propval);
  }

  /**
      Get `monitor` property.
      Returns: The monitor the menu will be popped up on.
  */
  @property int monitor() nothrow
  {
    return getMonitor();
  }

  /**
      Set `monitor` property.
      Params:
        propval = The monitor the menu will be popped up on.
  */
  @property void monitor(int propval) nothrow
  {
    setMonitor(propval);
  }

  /**
      Get `rectAnchorDx` property.
      Returns: Horizontal offset to apply to the menu, i.e. the rectangle or widget
        anchor.
        
        See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
        gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
        #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property int rectAnchorDx() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("rect-anchor-dx");
  }

  /**
      Set `rectAnchorDx` property.
      Params:
        propval = Horizontal offset to apply to the menu, i.e. the rectangle or widget
          anchor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property void rectAnchorDx(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("rect-anchor-dx", propval);
  }

  /**
      Get `rectAnchorDy` property.
      Returns: Vertical offset to apply to the menu, i.e. the rectangle or widget anchor.
        
        See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
        gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
        #GtkMenu:rect-anchor-dx, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property int rectAnchorDy() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("rect-anchor-dy");
  }

  /**
      Set `rectAnchorDy` property.
      Params:
        propval = Vertical offset to apply to the menu, i.e. the rectangle or widget anchor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dx, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
  */
  @property void rectAnchorDy(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("rect-anchor-dy", propval);
  }

  /**
      Get `reserveToggleSize` property.
      Returns: A boolean that indicates whether the menu reserves space for
        toggles and icons, regardless of their actual presence.
        
        This property should only be changed from its default value
        for special-purposes such as tabular menus. Regular menus that
        are connected to a menu bar or context menus should reserve
        toggle space for consistency.
  */
  @property bool reserveToggleSize() nothrow
  {
    return getReserveToggleSize();
  }

  /**
      Set `reserveToggleSize` property.
      Params:
        propval = A boolean that indicates whether the menu reserves space for
          toggles and icons, regardless of their actual presence.
          
          This property should only be changed from its default value
          for special-purposes such as tabular menus. Regular menus that
          are connected to a menu bar or context menus should reserve
          toggle space for consistency.
  */
  @property void reserveToggleSize(bool propval) nothrow
  {
    setReserveToggleSize(propval);
  }

  /**
      Get `tearoffState` property.
      Returns: A boolean that indicates whether the menu is torn-off.
  */
  @property bool tearoffState() nothrow
  {
    return getTearoffState();
  }

  /**
      Set `tearoffState` property.
      Params:
        propval = A boolean that indicates whether the menu is torn-off.
  */
  @property void tearoffState(bool propval) nothrow
  {
    setTearoffState(propval);
  }

  /**
      Get `tearoffTitle` property.
      Returns: A title that may be displayed by the window manager when this
        menu is torn-off.
  */
  @property string tearoffTitle() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("tearoff-title");
  }

  /**
      Set `tearoffTitle` property.
      Params:
        propval = A title that may be displayed by the window manager when this
          menu is torn-off.
  */
  @property void tearoffTitle(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("tearoff-title", propval);
  }

  /**
  Attaches the menu to the widget and provides a callback function that will be invoked when the menu calls
  [gid.gtk3.menu.Menu.detach] during its destruction.
  If the menu is attached to the widget then it will be destroyed when the widget is destroyed, as if it was a
  child widget. An attached menu will also move between screens correctly if the widgets moves between screens.
  Params:
  attachWidget = the widget that the menu will be attached to
  detacher = the user supplied callback function that will be called when the menu calls
  [gid.gtk3.menu.Menu.detach] (kept alive by the menu), or null
  */
  void attachToWidget(gid.gtk3.widget.Widget attachWidget, gid.gtk3.types.MenuDetachFunc detacher = null) nothrow
  {
    import gid.gobject2.c.functions : g_object_get_data, g_object_set_data_full;
    import gid.gobject2.c.types : GObject;

    static extern(C) void _detacherCallback(GtkWidget* attachWidget, GtkMenu* menu) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.MenuDetachFunc*)g_object_get_data(cast(GObject*)menu, "gid-menu-detacher");

      if (!_dlg || !*_dlg)
        return;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)attachWidget, No.Take),
        gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(void*)menu, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.MenuDetachFunc");
      }
    }

    // The detacher has no closure data, the frozen delegate is owned by the menu object data (replaced or freed with the menu)
    g_object_set_data_full(cast(GObject*)this._cPtr, "gid-menu-detacher", detacher ? freezeDelegate(cast(void*)&detacher) : null,
    detacher ? cast(GDestroyNotify)&thawPtrDestroyFunc : null);
    gtk_menu_attach_to_widget(cast(GtkMenu*)this._cPtr, attachWidget ? cast(GtkWidget*)attachWidget._cPtr(No.Dup) : null,
    detacher ? &_detacherCallback : null);
  }

  /**
      Creates a new #GtkMenu
      Returns: a new #GtkMenu
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_menu_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a #GtkMenu and populates it with menu items and
      submenus according to model.
      
      The created menu items are connected to actions found in the
      #GtkApplicationWindow to which the menu belongs - typically
      by means of being attached to a widget (see [gid.gtk3.menu.Menu.attachToWidget])
      that is contained within the #GtkApplicationWindows widget hierarchy.
      
      Actions can also be added using [gid.gtk4.widget.Widget.insertActionGroup] on the menu's
      attach widget or on any of its parent widgets.
  
      Params:
        model = a #GMenuModel
      Returns: a new #GtkMenu
  */
  static gid.gtk3.menu.Menu newFromModel(gid.gio2.menu_model.MenuModel model) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a list of the menus which are attached to this widget.
      This list is owned by GTK+ and must not be modified.
  
      Params:
        widget = a #GtkWidget
      Returns: the list
            of menus attached to his widget.
  */
  static gid.gtk3.widget.Widget[] getForAttachWidget(gid.gtk3.widget.Widget widget) nothrow
  {
    GList* _cretval;
    _cretval = gtk_menu_get_for_attach_widget(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    auto _retval = gListToD!(gid.gtk3.widget.Widget, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Adds a new #GtkMenuItem to a (table) menu. The number of “cells” that
      an item will occupy is specified by left_attach, right_attach,
      top_attach and bottom_attach. These each represent the leftmost,
      rightmost, uppermost and lower column and row numbers of the table.
      (Columns and rows are indexed from zero).
      
      Note that this function is not related to [gid.gtk3.menu.Menu.detach].
  
      Params:
        child = a #GtkMenuItem
        leftAttach = The column number to attach the left side of the item to
        rightAttach = The column number to attach the right side of the item to
        topAttach = The row number to attach the top of the item to
        bottomAttach = The row number to attach the bottom of the item to
  */
  void attach(gid.gtk3.widget.Widget child, uint leftAttach, uint rightAttach, uint topAttach, uint bottomAttach) nothrow
  {
    gtk_menu_attach(cast(GtkMenu*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, leftAttach, rightAttach, topAttach, bottomAttach);
  }

  /**
      Detaches the menu from the widget to which it had been attached.
      This function will call the callback function, detacher, provided
      when the [gid.gtk3.menu.Menu.attachToWidget] function was called.
  */
  void detach() nothrow
  {
    gtk_menu_detach(cast(GtkMenu*)this._cPtr);
  }

  /**
      Gets the #GtkAccelGroup which holds global accelerators for the
      menu. See [gid.gtk3.menu.Menu.setAccelGroup].
      Returns: the #GtkAccelGroup associated with the menu
  */
  gid.gtk3.accel_group.AccelGroup getAccelGroup() nothrow
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_menu_get_accel_group(cast(GtkMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.accel_group.AccelGroup)(cast(GtkAccelGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the accelerator path set on the menu.
      Returns: the accelerator path set on the menu.
  */
  string getAccelPath() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_get_accel_path(cast(GtkMenu*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the selected menu item from the menu.  This is used by the
      #GtkComboBox.
      Returns: the #GtkMenuItem that was last selected
                 in the menu.  If a selection has not yet been made, the
                 first menu item is selected.
  */
  gid.gtk3.widget.Widget getActive() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_get_active(cast(GtkMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkWidget that the menu is attached to.
      Returns: the #GtkWidget that the menu is attached to
  */
  gid.gtk3.widget.Widget getAttachWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_get_attach_widget(cast(GtkMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the number of the monitor on which to show the menu.
      Returns: the number of the monitor on which the menu should
           be popped up or -1, if no monitor has been set
  */
  int getMonitor() nothrow
  {
    int _retval;
    _retval = gtk_menu_get_monitor(cast(GtkMenu*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the menu reserves space for toggles and
      icons, regardless of their actual presence.
      Returns: Whether the menu reserves toggle space
  */
  bool getReserveToggleSize() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_get_reserve_toggle_size(cast(GtkMenu*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the menu is torn off.
      See [gid.gtk3.menu.Menu.setTearoffState].
      Returns: true if the menu is currently torn off.
  */
  bool getTearoffState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_get_tearoff_state(cast(GtkMenu*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title of the menu. See [gid.gtk3.menu.Menu.setTitle].
      Returns: the title of the menu, or null if the menu
            has no title set on it. This string is owned by GTK+
            and should not be modified or freed.
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_get_title(cast(GtkMenu*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Places menu on the given monitor.
  
      Params:
        monitor = the monitor to place the menu on
  */
  void placeOnMonitor(gid.gdk3.monitor.MonitorWrap monitor) nothrow
  {
    gtk_menu_place_on_monitor(cast(GtkMenu*)this._cPtr, monitor ? cast(GdkMonitor*)monitor._cPtr(No.Dup) : null);
  }

  /**
      Removes the menu from the screen.
  */
  void popdown() nothrow
  {
    gtk_menu_popdown(cast(GtkMenu*)this._cPtr);
  }

  /**
      Displays a menu and makes it available for selection.
      
      Applications can use this function to display context-sensitive
      menus, and will typically supply null for the parent_menu_shell,
      parent_menu_item, func and data parameters. The default menu
      positioning function will position the menu at the current mouse
      cursor position.
      
      The button parameter should be the mouse button pressed to initiate
      the menu popup. If the menu popup was initiated by something other
      than a mouse button press, such as a mouse button release or a keypress,
      button should be 0.
      
      The activate_time parameter is used to conflict-resolve initiation
      of concurrent requests for mouse/keyboard grab requests. To function
      properly, this needs to be the timestamp of the user event (such as
      a mouse click or key press) that caused the initiation of the popup.
      Only if no such event is available, [gid.gtk3.global.getCurrentEventTime] can
      be used instead.
      
      Note that this function does not work very well on GDK backends that
      do not have global coordinates, such as Wayland or Mir. You should
      probably use one of the gtk_menu_popup_at_ variants, which do not
      have this problem.
  
      Params:
        parentMenuShell = the menu shell containing the
              triggering menu item, or null
        parentMenuItem = the menu item whose activation
              triggered the popup, or null
        func = a user supplied function used to position
              the menu, or null
        button = the mouse button which was pressed to initiate the event.
        activateTime = the time at which the activation event occurred.
  
      Deprecated: Please use [gid.gtk3.menu.Menu.popupAtWidget],
            [gid.gtk3.menu.Menu.popupAtPointer]. or [gid.gtk3.menu.Menu.popupAtRect] instead
  */
  void popup(gid.gtk3.widget.Widget parentMenuShell, gid.gtk3.widget.Widget parentMenuItem, gid.gtk3.types.MenuPositionFunc func, uint button, uint activateTime) nothrow
  {
    extern(C) void _funcCallback(GtkMenu* menu, int* x, int* y, gboolean* pushIn, void* userData) nothrow
    {
      gidAttachThread();
      ptrThawGC(userData);
      auto _dlg = cast(gid.gtk3.types.MenuPositionFunc*)userData;
      bool _pushIn;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(void*)menu, No.Take), *x, *y, _pushIn);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.MenuPositionFunc");
      }
      *pushIn = _pushIn;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    gtk_menu_popup(cast(GtkMenu*)this._cPtr, parentMenuShell ? cast(GtkWidget*)parentMenuShell._cPtr(No.Dup) : null, parentMenuItem ? cast(GtkWidget*)parentMenuItem._cPtr(No.Dup) : null, _funcCB, _func, button, activateTime);
  }

  /**
      Displays menu and makes it available for selection.
      
      See gtk_menu_popup_at_widget () to pop up a menu at a widget.
      gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
      rectangle.
      
      menu will be positioned at the pointer associated with trigger_event.
      
      Properties that influence the behaviour of this function are
      #GtkMenu:anchor-hints, #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and
      #GtkMenu:menu-type-hint. Connect to the #GtkMenu::popped-up signal to find
      out how it was actually positioned.
  
      Params:
        triggerEvent = the #GdkEvent that initiated this request or
                          null if it's the current event
  */
  void popupAtPointer(gid.gdk3.event.Event triggerEvent = null) nothrow
  {
    gtk_menu_popup_at_pointer(cast(GtkMenu*)this._cPtr, triggerEvent ? cast(const(GdkEvent)*)triggerEvent._cPtr(No.Dup) : null);
  }

  /**
      Displays menu and makes it available for selection.
      
      See gtk_menu_popup_at_widget () and gtk_menu_popup_at_pointer (), which
      handle more common cases for popping up menus.
      
      menu will be positioned at rect, aligning their anchor points. rect is
      relative to the top-left corner of rect_window. rect_anchor and
      menu_anchor determine anchor points on rect and menu to pin together.
      menu can optionally be offset by #GtkMenu:rect-anchor-dx and
      #GtkMenu:rect-anchor-dy.
      
      Anchors should be specified under the assumption that the text direction is
      left-to-right; they will be flipped horizontally automatically if the text
      direction is right-to-left.
      
      Other properties that influence the behaviour of this function are
      #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
      #GtkMenu::popped-up signal to find out how it was actually positioned.
  
      Params:
        rectWindow = the #GdkWindow rect is relative to
        rect = the #GdkRectangle to align menu with
        rectAnchor = the point on rect to align with menu's anchor point
        menuAnchor = the point on menu to align with rect's anchor point
        triggerEvent = the #GdkEvent that initiated this request or
                          null if it's the current event
  */
  void popupAtRect(gid.gdk3.window.Window rectWindow, gid.gdk3.rectangle.Rectangle rect, gid.gdk3.types.Gravity rectAnchor, gid.gdk3.types.Gravity menuAnchor, gid.gdk3.event.Event triggerEvent = null) nothrow
  {
    gtk_menu_popup_at_rect(cast(GtkMenu*)this._cPtr, rectWindow ? cast(GdkWindow*)rectWindow._cPtr(No.Dup) : null, cast(const(GdkRectangle)*)&rect, rectAnchor, menuAnchor, triggerEvent ? cast(const(GdkEvent)*)triggerEvent._cPtr(No.Dup) : null);
  }

  /**
      Displays menu and makes it available for selection.
      
      See gtk_menu_popup_at_pointer () to pop up a menu at the master pointer.
      gtk_menu_popup_at_rect () also allows you to position a menu at an arbitrary
      rectangle.
      
      ![](popup-anchors.png)
      
      menu will be positioned at widget, aligning their anchor points.
      widget_anchor and menu_anchor determine anchor points on widget and menu
      to pin together. menu can optionally be offset by #GtkMenu:rect-anchor-dx
      and #GtkMenu:rect-anchor-dy.
      
      Anchors should be specified under the assumption that the text direction is
      left-to-right; they will be flipped horizontally automatically if the text
      direction is right-to-left.
      
      Other properties that influence the behaviour of this function are
      #GtkMenu:anchor-hints and #GtkMenu:menu-type-hint. Connect to the
      #GtkMenu::popped-up signal to find out how it was actually positioned.
  
      Params:
        widget = the #GtkWidget to align menu with
        widgetAnchor = the point on widget to align with menu's anchor point
        menuAnchor = the point on menu to align with widget's anchor point
        triggerEvent = the #GdkEvent that initiated this request or
                          null if it's the current event
  */
  void popupAtWidget(gid.gtk3.widget.Widget widget, gid.gdk3.types.Gravity widgetAnchor, gid.gdk3.types.Gravity menuAnchor, gid.gdk3.event.Event triggerEvent = null) nothrow
  {
    gtk_menu_popup_at_widget(cast(GtkMenu*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, widgetAnchor, menuAnchor, triggerEvent ? cast(const(GdkEvent)*)triggerEvent._cPtr(No.Dup) : null);
  }

  /**
      Displays a menu and makes it available for selection.
      
      Applications can use this function to display context-sensitive menus,
      and will typically supply null for the parent_menu_shell,
      parent_menu_item, func, data and destroy parameters. The default
      menu positioning function will position the menu at the current position
      of device (or its corresponding pointer).
      
      The button parameter should be the mouse button pressed to initiate
      the menu popup. If the menu popup was initiated by something other than
      a mouse button press, such as a mouse button release or a keypress,
      button should be 0.
      
      The activate_time parameter is used to conflict-resolve initiation of
      concurrent requests for mouse/keyboard grab requests. To function
      properly, this needs to be the time stamp of the user event (such as
      a mouse click or key press) that caused the initiation of the popup.
      Only if no such event is available, [gid.gtk3.global.getCurrentEventTime] can
      be used instead.
      
      Note that this function does not work very well on GDK backends that
      do not have global coordinates, such as Wayland or Mir. You should
      probably use one of the gtk_menu_popup_at_ variants, which do not
      have this problem.
  
      Params:
        device = a #GdkDevice
        parentMenuShell = the menu shell containing the triggering
              menu item, or null
        parentMenuItem = the menu item whose activation triggered
              the popup, or null
        func = a user supplied function used to position the menu,
              or null
        button = the mouse button which was pressed to initiate the event
        activateTime = the time at which the activation event occurred
  
      Deprecated: Please use [gid.gtk3.menu.Menu.popupAtWidget],
            [gid.gtk3.menu.Menu.popupAtPointer]. or [gid.gtk3.menu.Menu.popupAtRect] instead
  */
  void popupForDevice(gid.gdk3.device.Device device, gid.gtk3.widget.Widget parentMenuShell, gid.gtk3.widget.Widget parentMenuItem, gid.gtk3.types.MenuPositionFunc func, uint button, uint activateTime) nothrow
  {
    extern(C) void _funcCallback(GtkMenu* menu, int* x, int* y, gboolean* pushIn, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.MenuPositionFunc*)userData;
      bool _pushIn;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(void*)menu, No.Take), *x, *y, _pushIn);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.MenuPositionFunc");
      }
      *pushIn = _pushIn;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_menu_popup_for_device(cast(GtkMenu*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, parentMenuShell ? cast(GtkWidget*)parentMenuShell._cPtr(No.Dup) : null, parentMenuItem ? cast(GtkWidget*)parentMenuItem._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB, button, activateTime);
  }

  /**
      Moves child to a new position in the list of menu
      children.
  
      Params:
        child = the #GtkMenuItem to move
        position = the new position to place child.
              Positions are numbered from 0 to n - 1
  */
  void reorderChild(gid.gtk3.widget.Widget child, int position) nothrow
  {
    gtk_menu_reorder_child(cast(GtkMenu*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Repositions the menu according to its position function.
  */
  void reposition() nothrow
  {
    gtk_menu_reposition(cast(GtkMenu*)this._cPtr);
  }

  /**
      Set the #GtkAccelGroup which holds global accelerators for the
      menu.  This accelerator group needs to also be added to all windows
      that this menu is being used in with [gid.gtk3.window.Window.addAccelGroup],
      in order for those windows to support all the accelerators
      contained in this group.
  
      Params:
        accelGroup = the #GtkAccelGroup to be associated
                        with the menu.
  */
  void setAccelGroup(gid.gtk3.accel_group.AccelGroup accelGroup = null) nothrow
  {
    gtk_menu_set_accel_group(cast(GtkMenu*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  alias setAccelPath = gid.gtk3.widget.Widget.setAccelPath;

  /**
      Sets an accelerator path for this menu from which accelerator paths
      for its immediate children, its menu items, can be constructed.
      The main purpose of this function is to spare the programmer the
      inconvenience of having to call [gid.gtk3.menu_item.MenuItem.setAccelPath] on
      each menu item that should support runtime user changable accelerators.
      Instead, by just calling [gid.gtk3.menu.Menu.setAccelPath] on their parent,
      each menu item of this menu, that contains a label describing its
      purpose, automatically gets an accel path assigned.
      
      For example, a menu containing menu items “New” and “Exit”, will, after
      `gtk_menu_set_accel_path (menu, "<Gnumeric-Sheet>/File");` has been
      called, assign its items the accel paths: `"<Gnumeric-Sheet>/File/New"`
      and `"<Gnumeric-Sheet>/File/Exit"`.
      
      Assigning accel paths to menu items then enables the user to change
      their accelerators at runtime. More details about accelerator paths
      and their default setups can be found at [gid.gtk3.accel_map.AccelMap.addEntry].
      
      Note that accel_path string will be stored in a #GQuark. Therefore,
      if you pass a static string, you can save some memory by interning
      it first with [gid.glib2.global.internStaticString].
  
      Params:
        accelPath = a valid accelerator path, or null to unset the path
  */
  void setAccelPath(string accelPath = null) nothrow
  {
    const(char)* _accelPath = accelPath.toCString!(No.Malloc, Yes.Nullable);
    gtk_menu_set_accel_path(cast(GtkMenu*)this._cPtr, _accelPath);
  }

  /**
      Selects the specified menu item within the menu.  This is used by
      the #GtkComboBox and should not be used by anyone else.
  
      Params:
        index = the index of the menu item to select.  Index values are
                  from 0 to n-1
  */
  void setActive(uint index) nothrow
  {
    gtk_menu_set_active(cast(GtkMenu*)this._cPtr, index);
  }

  /**
      Informs GTK+ on which monitor a menu should be popped up.
      See [gid.gdk4.monitor.MonitorWrap.getGeometry].
      
      This function should be called from a #GtkMenuPositionFunc
      if the menu should not appear on the same monitor as the pointer.
      This information can’t be reliably inferred from the coordinates
      returned by a #GtkMenuPositionFunc, since, for very long menus,
      these coordinates may extend beyond the monitor boundaries or even
      the screen boundaries.
  
      Params:
        monitorNum = the number of the monitor on which the menu should
             be popped up
  */
  void setMonitor(int monitorNum) nothrow
  {
    gtk_menu_set_monitor(cast(GtkMenu*)this._cPtr, monitorNum);
  }

  /**
      Sets whether the menu should reserve space for drawing toggles
      or icons, regardless of their actual presence.
  
      Params:
        reserveToggleSize = whether to reserve size for toggles
  */
  void setReserveToggleSize(bool reserveToggleSize) nothrow
  {
    gtk_menu_set_reserve_toggle_size(cast(GtkMenu*)this._cPtr, reserveToggleSize);
  }

  /**
      Sets the #GdkScreen on which the menu will be displayed.
  
      Params:
        screen = a #GdkScreen, or null if the screen should be
                   determined by the widget the menu is attached to
  */
  void setScreen(gid.gdk3.screen.Screen screen = null) nothrow
  {
    gtk_menu_set_screen(cast(GtkMenu*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Changes the tearoff state of the menu.  A menu is normally
      displayed as drop down menu which persists as long as the menu is
      active.  It can also be displayed as a tearoff menu which persists
      until it is closed or reattached.
  
      Params:
        tornOff = If true, menu is displayed as a tearoff menu.
  */
  void setTearoffState(bool tornOff) nothrow
  {
    gtk_menu_set_tearoff_state(cast(GtkMenu*)this._cPtr, tornOff);
  }

  /**
      Sets the title string for the menu.
      
      The title is displayed when the menu is shown as a tearoff
      menu. If title is null, the menu will see if it is attached
      to a parent menu item, and if so it will try to use the same
      text as that menu item’s label.
  
      Params:
        title = a string containing the title for the menu, or null to
            inherit the title of the parent menu item, if any
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    gtk_menu_set_title(cast(GtkMenu*)this._cPtr, _title);
  }

  /**
      Connect to `MoveScroll` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ScrollType scrollType, gid.gtk3.menu.Menu menu)`
  
          `scrollType` a #GtkScrollType (optional)
  
          `menu` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveScroll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu.Menu)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu.Menu.moveScroll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-scroll", closure, after);
  }

  /**
      Connect to `PoppedUp` signal.
  
      Emitted when the position of menu is finalized after being popped up
        using gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (), or
        gtk_menu_popup_at_pointer ().
        
        menu might be flipped over the anchor rectangle in order to keep it
        on-screen, in which case flipped_x and flipped_y will be set to true
        accordingly.
        
        flipped_rect is the ideal position of menu after any possible flipping,
        but before any possible sliding. final_rect is flipped_rect, but possibly
        translated in the case that flipping is still ineffective in keeping menu
        on-screen.
        
        ![](popup-slide.png)
        
        The blue menu is menu's ideal position, the green menu is flipped_rect,
        and the red menu is final_rect.
        
        See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
        gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
        #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and
        #GtkMenu:menu-type-hint.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(void* flippedRect, void* finalRect, bool flippedX, bool flippedY, gid.gtk3.menu.Menu menu)`
  
          `flippedRect` the position of menu after any possible
                           flipping or null if the backend can't obtain it (optional)
  
          `finalRect` the final position of menu or null if the
                         backend can't obtain it (optional)
  
          `flippedX` true if the anchors were flipped horizontally (optional)
  
          `flippedY` true if the anchors were flipped vertically (optional)
  
          `menu` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPoppedUp(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk3.menu.Menu)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu.Menu.poppedUp");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popped-up", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu.Menu]
class MenuGidBuilderImpl(T) : gid.gtk3.menu_shell.MenuShellGidBuilderImpl!T
{


  /**
      Set `accelGroup` property.
      Params:
        propval = The accel group holding accelerators for the menu.
      Returns: Builder instance for fluent chaining
  */
  T accelGroup(gid.gtk3.accel_group.AccelGroup propval) nothrow
  {
    return setProperty("accel-group", propval);
  }

  /**
      Set `accelPath` property.
      Params:
        propval = An accel path used to conveniently construct accel paths of child items.
      Returns: Builder instance for fluent chaining
  */
  T accelPath(string propval) nothrow
  {
    return setProperty("accel-path", propval);
  }

  /**
      Set `active` property.
      Params:
        propval = The index of the currently selected menu item, or -1 if no
          menu item is selected.
      Returns: Builder instance for fluent chaining
  */
  T active(int propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `anchorHints` property.
      Params:
        propval = Positioning hints for aligning the menu relative to a rectangle.
          
          These hints determine how the menu should be positioned in the case that
          the menu would fall off-screen if placed in its ideal position.
          
          ![](popup-flip.png)
          
          For example, [gid.gdk4.types.AnchorHints.FlipY] will replace [gid.gdk4.types.Gravity.NorthWest] with
          [gid.gdk4.types.Gravity.SouthWest] and vice versa if the menu extends beyond the
          bottom edge of the monitor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:rect-anchor-dx,
          #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
      Returns: Builder instance for fluent chaining
  */
  T anchorHints(gid.gdk3.types.AnchorHints propval) nothrow
  {
    return setProperty("anchor-hints", propval);
  }

  /**
      Set `attachWidget` property.
      Params:
        propval = The widget the menu is attached to. Setting this property attaches
          the menu without a #GtkMenuDetachFunc. If you need to use a detacher,
          use [gid.gtk3.menu.Menu.attachToWidget] directly.
      Returns: Builder instance for fluent chaining
  */
  T attachWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("attach-widget", propval);
  }

  /**
      Set `menuTypeHint` property.
      Params:
        propval = The #GdkWindowTypeHint to use for the menu's #GdkWindow.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dx, #GtkMenu:rect-anchor-dy, and #GtkMenu::popped-up.
      Returns: Builder instance for fluent chaining
  */
  T menuTypeHint(gid.gdk3.types.WindowTypeHint propval) nothrow
  {
    return setProperty("menu-type-hint", propval);
  }

  /**
      Set `monitor` property.
      Params:
        propval = The monitor the menu will be popped up on.
      Returns: Builder instance for fluent chaining
  */
  T monitor(int propval) nothrow
  {
    return setProperty("monitor", propval);
  }

  /**
      Set `rectAnchorDx` property.
      Params:
        propval = Horizontal offset to apply to the menu, i.e. the rectangle or widget
          anchor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dy, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
      Returns: Builder instance for fluent chaining
  */
  T rectAnchorDx(int propval) nothrow
  {
    return setProperty("rect-anchor-dx", propval);
  }

  /**
      Set `rectAnchorDy` property.
      Params:
        propval = Vertical offset to apply to the menu, i.e. the rectangle or widget anchor.
          
          See gtk_menu_popup_at_rect (), gtk_menu_popup_at_widget (),
          gtk_menu_popup_at_pointer (), #GtkMenu:anchor-hints,
          #GtkMenu:rect-anchor-dx, #GtkMenu:menu-type-hint, and #GtkMenu::popped-up.
      Returns: Builder instance for fluent chaining
  */
  T rectAnchorDy(int propval) nothrow
  {
    return setProperty("rect-anchor-dy", propval);
  }

  /**
      Set `reserveToggleSize` property.
      Params:
        propval = A boolean that indicates whether the menu reserves space for
          toggles and icons, regardless of their actual presence.
          
          This property should only be changed from its default value
          for special-purposes such as tabular menus. Regular menus that
          are connected to a menu bar or context menus should reserve
          toggle space for consistency.
      Returns: Builder instance for fluent chaining
  */
  T reserveToggleSize(bool propval) nothrow
  {
    return setProperty("reserve-toggle-size", propval);
  }

  /**
      Set `tearoffState` property.
      Params:
        propval = A boolean that indicates whether the menu is torn-off.
      Returns: Builder instance for fluent chaining
  */
  T tearoffState(bool propval) nothrow
  {
    return setProperty("tearoff-state", propval);
  }

  /**
      Set `tearoffTitle` property.
      Params:
        propval = A title that may be displayed by the window manager when this
          menu is torn-off.
      Returns: Builder instance for fluent chaining
  */
  T tearoffTitle(string propval) nothrow
  {
    return setProperty("tearoff-title", propval);
  }
}

/// Fluent builder for [gid.gtk3.menu.Menu]
final class MenuGidBuilder : MenuGidBuilderImpl!MenuGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Menu build() nothrow
  {
    return new Menu(cast(void*)createGObject(Menu._getGType), Yes.Take);
  }
}
