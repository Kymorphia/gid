/// Module for [MenuShell] class
module gid.gtk3.menu_shell;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.menu_item;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkMenuShell is the abstract base class used to derive the
    #GtkMenu and #GtkMenuBar subclasses.
    
    A #GtkMenuShell is a container of #GtkMenuItem objects arranged
    in a list which can be navigated, selected, and activated by the
    user to perform application functions. A #GtkMenuItem can have a
    submenu associated with it, allowing for nested hierarchical menus.
    
    # Terminology
    
    A menu item can be “selected”, this means that it is displayed
    in the prelight state, and if it has a submenu, that submenu
    will be popped up.
    
    A menu is “active” when it is visible onscreen and the user
    is selecting from it. A menubar is not active until the user
    clicks on one of its menuitems. When a menu is active,
    passing the mouse over a submenu will pop it up.
    
    There is also is a concept of the current menu and a current
    menu item. The current menu item is the selected menu item
    that is furthest down in the hierarchy. (Every active menu shell
    does not necessarily contain a selected menu item, but if
    it does, then the parent menu shell must also contain
    a selected menu item.) The current menu is the menu that
    contains the current menu item. It will always have a GTK
    grab and receive all key presses.
*/
class MenuShell : gid.gtk3.container.Container
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_shell_get_type != &gidSymbolNotFound ? gtk_menu_shell_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuShell";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuShell self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_shell.MenuShell]
      Returns: New builder object
  */
  static MenuShellGidBuilder builder() nothrow
  {
    return new MenuShellGidBuilder;
  }

  /**
      Get `takeFocus` property.
      Returns: A boolean that determines whether the menu and its submenus grab the
        keyboard focus. See [gid.gtk3.menu_shell.MenuShell.setTakeFocus] and
        [gid.gtk3.menu_shell.MenuShell.getTakeFocus].
  */
  @property bool takeFocus() nothrow
  {
    return getTakeFocus();
  }

  /**
      Set `takeFocus` property.
      Params:
        propval = A boolean that determines whether the menu and its submenus grab the
          keyboard focus. See [gid.gtk3.menu_shell.MenuShell.setTakeFocus] and
          [gid.gtk3.menu_shell.MenuShell.getTakeFocus].
  */
  @property void takeFocus(bool propval) nothrow
  {
    setTakeFocus(propval);
  }

  /** */
  protected void vfuncActivateCurrent(bool forceHide)
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.activateCurrent)
      return;

    _klass.activateCurrent(cast(GtkMenuShell*)this._cPtr, forceHide);
  }

  /**
      Cancels the selection within the menu shell.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCancel` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncCancel()
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.cancel)
      return;

    _klass.cancel(cast(GtkMenuShell*)this._cPtr);
  }

  /**
      Deactivates the menu shell.
      
      Typically this results in the menu shell being erased
      from the screen.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeactivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeactivate()
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.deactivate)
      return;

    _klass.deactivate(cast(GtkMenuShell*)this._cPtr);
  }

  /** */
  protected int vfuncGetPopupDelay()
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.getPopupDelay)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getPopupDelay(cast(GtkMenuShell*)this._cPtr);
    return _retval;
  }

  /**
      Adds a new #GtkMenuItem to the menu shell’s item list
      at the position indicated by position.
  
      Params:
        child = The #GtkMenuItem to add
        position = The position in the item list where child
              is added. Positions are numbered from 0 to n-1
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsert` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncInsert(gid.gtk3.widget.Widget child, int position)
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.insert)
      return;

    _klass.insert(cast(GtkMenuShell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /** */
  protected void vfuncMoveCurrent(gid.gtk3.types.MenuDirectionType direction)
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.moveCurrent)
      return;

    _klass.moveCurrent(cast(GtkMenuShell*)this._cPtr, direction);
  }

  /** */
  protected bool vfuncMoveSelected(int distance)
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.moveSelected)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.moveSelected(cast(GtkMenuShell*)this._cPtr, distance);
    return _retval;
  }

  /**
      Selects the menu item from the menu shell.
  
      Params:
        menuItem = The #GtkMenuItem to select
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectItem` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSelectItem(gid.gtk3.widget.Widget menuItem)
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.selectItem)
      return;

    _klass.selectItem(cast(GtkMenuShell*)this._cPtr, menuItem ? cast(GtkWidget*)menuItem._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncSelectionDone()
  {
    auto _klass = cast(GtkMenuShellClass*)_vfuncClass;
    if (!_klass.selectionDone)
      return;

    _klass.selectionDone(cast(GtkMenuShell*)this._cPtr);
  }

  /**
      Activates the menu item within the menu shell.
  
      Params:
        menuItem = the #GtkMenuItem to activate
        forceDeactivate = if true, force the deactivation of the
              menu shell after the menu item is activated
  */
  void activateItem(gid.gtk3.widget.Widget menuItem, bool forceDeactivate) nothrow
  {
    gtk_menu_shell_activate_item(cast(GtkMenuShell*)this._cPtr, menuItem ? cast(GtkWidget*)menuItem._cPtr(No.Dup) : null, forceDeactivate);
  }

  /**
      Adds a new #GtkMenuItem to the end of the menu shell's
      item list.
  
      Params:
        child = The #GtkMenuItem to add
  */
  void append(gid.gtk3.menu_item.MenuItem child) nothrow
  {
    gtk_menu_shell_append(cast(GtkMenuShell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Establishes a binding between a #GtkMenuShell and a #GMenuModel.
      
      The contents of shell are removed and then refilled with menu items
      according to model.  When model changes, shell is updated.
      Calling this function twice on shell with different model will
      cause the first binding to be replaced with a binding to the new
      model. If model is null then any previous binding is undone and
      all children are removed.
      
      with_separators determines if toplevel items (eg: sections) have
      separators inserted between them.  This is typically desired for
      menus but doesn’t make sense for menubars.
      
      If action_namespace is non-null then the effect is as if all
      actions mentioned in the model have their names prefixed with the
      namespace, plus a dot.  For example, if the action “quit” is
      mentioned and action_namespace is “app” then the effective action
      name is “app.quit”.
      
      This function uses #GtkActionable to define the action name and
      target values on the created menu items.  If you want to use an
      action group other than “app” and “win”, or if you want to use a
      #GtkMenuShell outside of a #GtkApplicationWindow, then you will need
      to attach your own action group to the widget hierarchy using
      [gid.gtk4.widget.Widget.insertActionGroup].  As an example, if you created a
      group with a “quit” action and inserted it with the name “mygroup”
      then you would use the action name “mygroup.quit” in your
      #GMenuModel.
      
      For most cases you are probably better off using
      [gid.gtk3.menu.Menu.newFromModel] or [gid.gtk3.menu_bar.MenuBar.newFromModel] or just
      directly passing the #GMenuModel to [gid.gtk3.application.Application.setAppMenu] or
      [gid.gtk4.application.Application.setMenubar].
  
      Params:
        model = the #GMenuModel to bind to or null to remove
            binding
        actionNamespace = the namespace for actions in model
        withSeparators = true if toplevel items in shell should have
            separators between them
  */
  void bindModel(gid.gio2.menu_model.MenuModel model, string actionNamespace, bool withSeparators) nothrow
  {
    const(char)* _actionNamespace = actionNamespace.toCString!(No.Malloc, Yes.Nullable);
    gtk_menu_shell_bind_model(cast(GtkMenuShell*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null, _actionNamespace, withSeparators);
  }

  /**
      Cancels the selection within the menu shell.
  */
  void cancel() nothrow
  {
    gtk_menu_shell_cancel(cast(GtkMenuShell*)this._cPtr);
  }

  /**
      Deactivates the menu shell.
      
      Typically this results in the menu shell being erased
      from the screen.
  */
  void deactivate() nothrow
  {
    gtk_menu_shell_deactivate(cast(GtkMenuShell*)this._cPtr);
  }

  /**
      Deselects the currently selected item from the menu shell,
      if any.
  */
  void deselect() nothrow
  {
    gtk_menu_shell_deselect(cast(GtkMenuShell*)this._cPtr);
  }

  /**
      Gets the parent menu shell.
      
      The parent menu shell of a submenu is the #GtkMenu or #GtkMenuBar
      from which it was opened up.
      Returns: the parent #GtkMenuShell
  */
  gid.gtk3.widget.Widget getParentShell() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_shell_get_parent_shell(cast(GtkMenuShell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently selected item.
      Returns: the currently selected item
  */
  gid.gtk3.widget.Widget getSelectedItem() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_shell_get_selected_item(cast(GtkMenuShell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if the menu shell will take the keyboard focus on popup.
      Returns: true if the menu shell will take the keyboard focus on popup.
  */
  bool getTakeFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_shell_get_take_focus(cast(GtkMenuShell*)this._cPtr);
    return _retval;
  }

  /**
      Adds a new #GtkMenuItem to the menu shell’s item list
      at the position indicated by position.
  
      Params:
        child = The #GtkMenuItem to add
        position = The position in the item list where child
              is added. Positions are numbered from 0 to n-1
  */
  void insert(gid.gtk3.widget.Widget child, int position) nothrow
  {
    gtk_menu_shell_insert(cast(GtkMenuShell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Adds a new #GtkMenuItem to the beginning of the menu shell's
      item list.
  
      Params:
        child = The #GtkMenuItem to add
  */
  void prepend(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_menu_shell_prepend(cast(GtkMenuShell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Select the first visible or selectable child of the menu shell;
      don’t select tearoff items unless the only item is a tearoff
      item.
  
      Params:
        searchSensitive = if true, search for the first selectable
                             menu item, otherwise select nothing if
                             the first item isn’t sensitive. This
                             should be false if the menu is being
                             popped up initially.
  */
  void selectFirst(bool searchSensitive) nothrow
  {
    gtk_menu_shell_select_first(cast(GtkMenuShell*)this._cPtr, searchSensitive);
  }

  /**
      Selects the menu item from the menu shell.
  
      Params:
        menuItem = The #GtkMenuItem to select
  */
  void selectItem(gid.gtk3.widget.Widget menuItem) nothrow
  {
    gtk_menu_shell_select_item(cast(GtkMenuShell*)this._cPtr, menuItem ? cast(GtkWidget*)menuItem._cPtr(No.Dup) : null);
  }

  /**
      If take_focus is true (the default) the menu shell will take
      the keyboard focus so that it will receive all keyboard events
      which is needed to enable keyboard navigation in menus.
      
      Setting take_focus to false is useful only for special applications
      like virtual keyboard implementations which should not take keyboard
      focus.
      
      The take_focus state of a menu or menu bar is automatically
      propagated to submenus whenever a submenu is popped up, so you
      don’t have to worry about recursively setting it for your entire
      menu hierarchy. Only when programmatically picking a submenu and
      popping it up manually, the take_focus property of the submenu
      needs to be set explicitly.
      
      Note that setting it to false has side-effects:
      
      If the focus is in some other app, it keeps the focus and keynav in
      the menu doesn’t work. Consequently, keynav on the menu will only
      work if the focus is on some toplevel owned by the onscreen keyboard.
      
      To avoid confusing the user, menus with take_focus set to false
      should not display mnemonics or accelerators, since it cannot be
      guaranteed that they will work.
      
      See also [gid.gdk3.global.keyboardGrab]
  
      Params:
        takeFocus = true if the menu shell should take the keyboard
              focus on popup
  */
  void setTakeFocus(bool takeFocus) nothrow
  {
    gtk_menu_shell_set_take_focus(cast(GtkMenuShell*)this._cPtr, takeFocus);
  }

  /**
      Connect to `ActivateCurrent` signal.
  
      An action signal that activates the current menu item within
        the menu shell.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(bool forceHide, gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `forceHide` if true, hide the menu after activating the menu item (optional)
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCurrent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.activateCurrent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-current", closure, after);
  }

  /**
      Connect to `Cancel` signal.
  
      An action signal which cancels the selection within the menu shell.
        Causes the #GtkMenuShell::selection-done signal to be emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancel(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.cancel");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
      Connect to `CycleFocus` signal.
  
      A keybinding signal which moves the focus in the
        given direction.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DirectionType direction, gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `direction` the direction to cycle in (optional)
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCycleFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.cycleFocus");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-focus", closure, after);
  }

  /**
      Connect to `Deactivate` signal.
  
      This signal is emitted when a menu shell is deactivated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeactivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.deactivate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deactivate", closure, after);
  }

  /**
      Connect to `Insert` signal.
  
      The ::insert signal is emitted when a new #GtkMenuItem is added to
        a #GtkMenuShell.  A separate signal is used instead of
        GtkContainer::add because of the need for an additional position
        parameter.
        
        The inverse of this signal is the GtkContainer::removed signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget child, int position, gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `child` the #GtkMenuItem that is being inserted (optional)
  
          `position` the position at which the insert occurs (optional)
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInsert(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.menu_shell.MenuShell)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.insert");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert", closure, after);
  }

  /**
      Connect to `MoveCurrent` signal.
  
      An keybinding signal which moves the current menu item
        in the direction specified by direction.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.MenuDirectionType direction, gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `direction` the direction to move (optional)
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCurrent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MenuDirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.moveCurrent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-current", closure, after);
  }

  /**
      Connect to `MoveSelected` signal.
  
      The ::move-selected signal is emitted to move the selection to
        another item.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int distance, gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `distance` +1 to move to the next item, -1 to move to the previous (optional)
  
          `menuShell` the instance the signal is connected to (optional)
  
          `Returns` true to stop the signal emission, false to continue
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.moveSelected");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-selected", closure, after);
  }

  /**
      Connect to `SelectionDone` signal.
  
      This signal is emitted when a selection has been
        completed within a menu shell.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_shell.MenuShell menuShell)`
  
          `menuShell` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionDone(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_shell.MenuShell)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.selectionDone");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-done", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MenuShell
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.menu_shell.MenuShell), T.stringof ~ " is not derived from gid.gtk3.menu_shell.MenuShell");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateCurrent", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "activate_current");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCancel", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "cancel");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeactivate", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "deactivate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPopupDelay", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "get_popup_delay");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsert", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "insert");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCurrent", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "move_current");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveSelected", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "move_selected");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectItem", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "select_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionDone", true)[0]) == gid.gtk3.menu_shell.MenuShell))
      _installVfunc(klass, "selection_done");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkMenuShellClass*)klass;

    switch (vfunc)
    {
      case "activate_current":
      {
        static extern(C) void _vfuncActivateCurrentTramp(GtkMenuShell* menuShell, gboolean forceHide) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.activateCurrent)
              return (cast(typeof(&_vfuncActivateCurrentTramp))_klass.activateCurrent)(menuShell, forceHide);
            return;
          }

          try
          {
            _obj.vfuncActivateCurrent(cast(bool)forceHide);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncActivateCurrent");
          }
        }

        _klass.activateCurrent = cast(typeof(_klass.activateCurrent))&_vfuncActivateCurrentTramp;
        break;
      }
      case "cancel":
      {
        static extern(C) void _vfuncCancelTramp(GtkMenuShell* menuShell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.cancel)
              return (cast(typeof(&_vfuncCancelTramp))_klass.cancel)(menuShell);
            return;
          }

          try
          {
            _obj.vfuncCancel();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncCancel");
          }
        }

        _klass.cancel = cast(typeof(_klass.cancel))&_vfuncCancelTramp;
        break;
      }
      case "deactivate":
      {
        static extern(C) void _vfuncDeactivateTramp(GtkMenuShell* menuShell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.deactivate)
              return (cast(typeof(&_vfuncDeactivateTramp))_klass.deactivate)(menuShell);
            return;
          }

          try
          {
            _obj.vfuncDeactivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncDeactivate");
          }
        }

        _klass.deactivate = cast(typeof(_klass.deactivate))&_vfuncDeactivateTramp;
        break;
      }
      case "get_popup_delay":
      {
        static extern(C) int _vfuncGetPopupDelayTramp(GtkMenuShell* menuShell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.getPopupDelay)
              return (cast(typeof(&_vfuncGetPopupDelayTramp))_klass.getPopupDelay)(menuShell);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetPopupDelay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncGetPopupDelay");
          }
          return _retval;
        }

        _klass.getPopupDelay = cast(typeof(_klass.getPopupDelay))&_vfuncGetPopupDelayTramp;
        break;
      }
      case "insert":
      {
        static extern(C) void _vfuncInsertTramp(GtkMenuShell* menuShell, GtkWidget* child, int position) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.insert)
              return (cast(typeof(&_vfuncInsertTramp))_klass.insert)(menuShell, child, position);
            return;
          }

          try
          {
            _obj.vfuncInsert(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take), position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncInsert");
          }
        }

        _klass.insert = cast(typeof(_klass.insert))&_vfuncInsertTramp;
        break;
      }
      case "move_current":
      {
        static extern(C) void _vfuncMoveCurrentTramp(GtkMenuShell* menuShell, GtkMenuDirectionType direction) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.moveCurrent)
              return (cast(typeof(&_vfuncMoveCurrentTramp))_klass.moveCurrent)(menuShell, direction);
            return;
          }

          try
          {
            _obj.vfuncMoveCurrent(direction);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncMoveCurrent");
          }
        }

        _klass.moveCurrent = cast(typeof(_klass.moveCurrent))&_vfuncMoveCurrentTramp;
        break;
      }
      case "move_selected":
      {
        static extern(C) gboolean _vfuncMoveSelectedTramp(GtkMenuShell* menuShell, int distance) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.moveSelected)
              return (cast(typeof(&_vfuncMoveSelectedTramp))_klass.moveSelected)(menuShell, distance);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMoveSelected(distance);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncMoveSelected");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.moveSelected = cast(typeof(_klass.moveSelected))&_vfuncMoveSelectedTramp;
        break;
      }
      case "select_item":
      {
        static extern(C) void _vfuncSelectItemTramp(GtkMenuShell* menuShell, GtkWidget* menuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.selectItem)
              return (cast(typeof(&_vfuncSelectItemTramp))_klass.selectItem)(menuShell, menuItem);
            return;
          }

          try
          {
            _obj.vfuncSelectItem(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)menuItem, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncSelectItem");
          }
        }

        _klass.selectItem = cast(typeof(_klass.selectItem))&_vfuncSelectItemTramp;
        break;
      }
      case "selection_done":
      {
        static extern(C) void _vfuncSelectionDoneTramp(GtkMenuShell* menuShell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_shell.MenuShell)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuShell);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuShellClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuShell);
            if (_klass.selectionDone)
              return (cast(typeof(&_vfuncSelectionDoneTramp))_klass.selectionDone)(menuShell);
            return;
          }

          try
          {
            _obj.vfuncSelectionDone();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_shell.MenuShell.vfuncSelectionDone");
          }
        }

        _klass.selectionDone = cast(typeof(_klass.selectionDone))&_vfuncSelectionDoneTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_shell.MenuShell]
class MenuShellGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T
{


  /**
      Set `takeFocus` property.
      Params:
        propval = A boolean that determines whether the menu and its submenus grab the
          keyboard focus. See [gid.gtk3.menu_shell.MenuShell.setTakeFocus] and
          [gid.gtk3.menu_shell.MenuShell.getTakeFocus].
      Returns: Builder instance for fluent chaining
  */
  T takeFocus(bool propval) nothrow
  {
    return setProperty("take-focus", propval);
  }
}

/// Fluent builder for [gid.gtk3.menu_shell.MenuShell]
final class MenuShellGidBuilder : MenuShellGidBuilderImpl!MenuShellGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuShell build() nothrow
  {
    return new MenuShell(cast(void*)createGObject(MenuShell._getGType), Yes.Take);
  }
}
