/// Module for [Toolbar] class
module gid.gtk3.toolbar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.tool_item;
import gid.gtk3.tool_shell;
import gid.gtk3.tool_shell_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A toolbar is created with a call to [gid.gtk3.toolbar.Toolbar.new_].
    
    A toolbar can contain instances of a subclass of #GtkToolItem. To add
    a #GtkToolItem to the a toolbar, use [gid.gtk3.toolbar.Toolbar.insert]. To remove
    an item from the toolbar use [gid.gtk3.container.Container.remove]. To add a button
    to the toolbar, add an instance of #GtkToolButton.
    
    Toolbar items can be visually grouped by adding instances of
    #GtkSeparatorToolItem to the toolbar. If the GtkToolbar child property
    “expand” is #TRUE and the property #GtkSeparatorToolItem:draw is set to
    #FALSE, the effect is to force all following items to the end of the toolbar.
    
    By default, a toolbar can be shrunk, upon which it will add an arrow button
    to show an overflow menu offering access to any #GtkToolItem child that has
    a proxy menu item. To disable this and request enough size for all children,
    call [gid.gtk3.toolbar.Toolbar.setShowArrow] to set #GtkToolbar:show-arrow to false.
    
    Creating a context menu for the toolbar can be done by connecting to
    the #GtkToolbar::popup-context-menu signal.
    
    # CSS nodes
    
    GtkToolbar has a single CSS node with name toolbar.
*/
class Toolbar : gid.gtk3.container.Container, gid.gtk3.orientable.Orientable, gid.gtk3.tool_shell.ToolShell
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
    return cast(void function())gtk_toolbar_get_type != &gidSymbolNotFound ? gtk_toolbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToolbar";
  }

  /** Returns `this`, for use in `with` statements. */
  override Toolbar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.toolbar.Toolbar]
      Returns: New builder object
  */
  static ToolbarGidBuilder builder() nothrow
  {
    return new ToolbarGidBuilder;
  }

  /**
      Get `iconSize` property.
      Returns: The size of the icons in a toolbar is normally determined by
        the toolbar-icon-size setting. When this property is set, it
        overrides the setting.
        
        This should only be used for special-purpose toolbars, normal
        application toolbars should respect the user preferences for the
        size of icons.
  */
  @property gid.gtk3.types.IconSize iconSize() nothrow
  {
    return getIconSize();
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The size of the icons in a toolbar is normally determined by
          the toolbar-icon-size setting. When this property is set, it
          overrides the setting.
          
          This should only be used for special-purpose toolbars, normal
          application toolbars should respect the user preferences for the
          size of icons.
  */
  @property void iconSize(gid.gtk3.types.IconSize propval) nothrow
  {
    setIconSize(propval);
  }

  /**
      Get `iconSizeSet` property.
      Returns: Is true if the icon-size property has been set.
  */
  @property bool iconSizeSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("icon-size-set");
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the icon-size property has been set.
  */
  @property void iconSizeSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("icon-size-set", propval);
  }

  /** */
  @property bool showArrow() nothrow
  {
    return getShowArrow();
  }

  /** */
  @property void showArrow(bool propval) nothrow
  {
    setShowArrow(propval);
  }

  /** */
  @property gid.gtk3.types.ToolbarStyle toolbarStyle() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ToolbarStyle)("toolbar-style");
  }

  /** */
  @property void toolbarStyle(gid.gtk3.types.ToolbarStyle propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ToolbarStyle)("toolbar-style", propval);
  }

  mixin OrientableT!();
  mixin ToolShellT!();
  alias getStyle = gid.gtk3.widget.Widget.getStyle;

  /**
      Creates a new toolbar.
      Returns: the newly-created toolbar.
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
      _cretval = gtk_toolbar_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncOrientationChanged(gid.gtk3.types.Orientation orientation)
  {
    auto _klass = cast(GtkToolbarClass*)_vfuncClass;
    if (!_klass.orientationChanged)
      return;

    _klass.orientationChanged(cast(GtkToolbar*)this._cPtr, orientation);
  }

  /** */
  protected bool vfuncPopupContextMenu(int x, int y, int buttonNumber)
  {
    auto _klass = cast(GtkToolbarClass*)_vfuncClass;
    if (!_klass.popupContextMenu)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.popupContextMenu(cast(GtkToolbar*)this._cPtr, x, y, buttonNumber);
    return _retval;
  }

  /** */
  protected void vfuncStyleChanged(gid.gtk3.types.ToolbarStyle style)
  {
    auto _klass = cast(GtkToolbarClass*)_vfuncClass;
    if (!_klass.styleChanged)
      return;

    _klass.styleChanged(cast(GtkToolbar*)this._cPtr, style);
  }

  /**
      Returns the position corresponding to the indicated point on
      toolbar. This is useful when dragging items to the toolbar:
      this function returns the position a new item should be
      inserted.
      
      `x` and `y` are in toolbar coordinates.
  
      Params:
        x = x coordinate of a point on the toolbar
        y = y coordinate of a point on the toolbar
      Returns: The position corresponding to the point (`x`, `y`) on the toolbar.
  */
  int getDropIndex(int x, int y) nothrow
  {
    int _retval;
    _retval = gtk_toolbar_get_drop_index(cast(GtkToolbar*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Retrieves the icon size for the toolbar. See [gid.gtk3.toolbar.Toolbar.setIconSize].
      Returns: the current icon size for the icons on the toolbar.
  */
  gid.gtk3.types.IconSize getIconSize() nothrow
  {
    GtkIconSize _cretval;
    _cretval = gtk_toolbar_get_icon_size(cast(GtkToolbar*)this._cPtr);
    gid.gtk3.types.IconSize _retval = cast(gid.gtk3.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Returns the position of item on the toolbar, starting from 0.
      It is an error if item is not a child of the toolbar.
  
      Params:
        item = a #GtkToolItem that is a child of toolbar
      Returns: the position of item on the toolbar.
  */
  int getItemIndex(gid.gtk3.tool_item.ToolItem item) nothrow
  {
    int _retval;
    _retval = gtk_toolbar_get_item_index(cast(GtkToolbar*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the number of items on the toolbar.
      Returns: the number of items on the toolbar
  */
  int getNItems() nothrow
  {
    int _retval;
    _retval = gtk_toolbar_get_n_items(cast(GtkToolbar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `n`'th item on toolbar, or null if the
      toolbar does not contain an `n`'th item.
  
      Params:
        n = A position on the toolbar
      Returns: The `n`'th #GtkToolItem on toolbar,
            or null if there isn’t an `n`'th item.
  */
  gid.gtk3.tool_item.ToolItem getNthItem(int n) nothrow
  {
    GtkToolItem* _cretval;
    _cretval = gtk_toolbar_get_nth_item(cast(GtkToolbar*)this._cPtr, n);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the relief style of buttons on toolbar. See
      [gid.gtk3.button.Button.setRelief].
      Returns: The relief style of buttons on toolbar.
  */
  gid.gtk3.types.ReliefStyle getReliefStyle() nothrow
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_toolbar_get_relief_style(cast(GtkToolbar*)this._cPtr);
    gid.gtk3.types.ReliefStyle _retval = cast(gid.gtk3.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Returns whether the toolbar has an overflow menu.
      See [gid.gtk3.toolbar.Toolbar.setShowArrow].
      Returns: true if the toolbar has an overflow menu.
  */
  bool getShowArrow() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_toolbar_get_show_arrow(cast(GtkToolbar*)this._cPtr);
    return _retval;
  }

  alias getStyle = gid.gtk3.widget.Widget.getStyle;

  /**
      Retrieves whether the toolbar has text, icons, or both . See
      [gid.gtk3.toolbar.Toolbar.setStyle].
      Returns: the current style of toolbar
  */
  gid.gtk3.types.ToolbarStyle getStyle() nothrow
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_toolbar_get_style(cast(GtkToolbar*)this._cPtr);
    gid.gtk3.types.ToolbarStyle _retval = cast(gid.gtk3.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Insert a #GtkToolItem into the toolbar at position pos. If pos is
      0 the item is prepended to the start of the toolbar. If pos is
      negative, the item is appended to the end of the toolbar.
  
      Params:
        item = a #GtkToolItem
        pos = the position of the new item
  */
  void insert(gid.gtk3.tool_item.ToolItem item, int pos) nothrow
  {
    gtk_toolbar_insert(cast(GtkToolbar*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null, pos);
  }

  /**
      Highlights toolbar to give an idea of what it would look like
      if item was added to toolbar at the position indicated by index_.
      If item is null, highlighting is turned off. In that case index_
      is ignored.
      
      The tool_item passed to this function must not be part of any widget
      hierarchy. When an item is set as drop highlight item it can not
      added to any widget hierarchy or used as highlight item for another
      toolbar.
  
      Params:
        toolItem = a #GtkToolItem, or null to turn of highlighting
        index = a position on toolbar
  */
  void setDropHighlightItem(gid.gtk3.tool_item.ToolItem toolItem, int index) nothrow
  {
    gtk_toolbar_set_drop_highlight_item(cast(GtkToolbar*)this._cPtr, toolItem ? cast(GtkToolItem*)toolItem._cPtr(No.Dup) : null, index);
  }

  /**
      This function sets the size of stock icons in the toolbar. You
      can call it both before you add the icons and after they’ve been
      added. The size you set will override user preferences for the default
      icon size.
      
      This should only be used for special-purpose toolbars, normal
      application toolbars should respect the user preferences for the
      size of icons.
  
      Params:
        iconSize = The #GtkIconSize that stock icons in the toolbar shall have.
  */
  void setIconSize(gid.gtk3.types.IconSize iconSize) nothrow
  {
    gtk_toolbar_set_icon_size(cast(GtkToolbar*)this._cPtr, iconSize);
  }

  /**
      Sets whether to show an overflow menu when toolbar isn’t allocated enough
      size to show all of its items. If true, items which can’t fit in toolbar,
      and which have a proxy menu item set by [gid.gtk3.tool_item.ToolItem.setProxyMenuItem]
      or #GtkToolItem::create-menu-proxy, will be available in an overflow menu,
      which can be opened by an added arrow button. If false, toolbar will
      request enough size to fit all of its child items without any overflow.
  
      Params:
        showArrow = Whether to show an overflow menu
  */
  void setShowArrow(bool showArrow) nothrow
  {
    gtk_toolbar_set_show_arrow(cast(GtkToolbar*)this._cPtr, showArrow);
  }

  alias setStyle = gid.gtk3.widget.Widget.setStyle;

  /**
      Alters the view of toolbar to display either icons only, text only, or both.
  
      Params:
        style = the new style for toolbar.
  */
  void setStyle(gid.gtk3.types.ToolbarStyle style) nothrow
  {
    gtk_toolbar_set_style(cast(GtkToolbar*)this._cPtr, style);
  }

  /**
      Unsets toolbar icon size set with [gid.gtk3.toolbar.Toolbar.setIconSize], so that
      user preferences will be used to determine the icon size.
  */
  void unsetIconSize() nothrow
  {
    gtk_toolbar_unset_icon_size(cast(GtkToolbar*)this._cPtr);
  }

  /**
      Unsets a toolbar style set with [gid.gtk3.toolbar.Toolbar.setStyle], so that
      user preferences will be used to determine the toolbar style.
  */
  void unsetStyle() nothrow
  {
    gtk_toolbar_unset_style(cast(GtkToolbar*)this._cPtr);
  }

  /**
      Connect to `FocusHomeOrEnd` signal.
  
      A keybinding signal used internally by GTK+. This signal can't
        be used in application code
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool focusHome, gid.gtk3.toolbar.Toolbar toolbar)`
  
          `focusHome` true if the first item should be focused (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled, false if not
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFocusHomeOrEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.toolbar.Toolbar)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.focusHomeOrEnd");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-home-or-end", closure, after);
  }

  /**
      Connect to `OrientationChanged` signal.
  
      Emitted when the orientation of the toolbar changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.Orientation orientation, gid.gtk3.toolbar.Toolbar toolbar)`
  
          `orientation` the new #GtkOrientation of the toolbar (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectOrientationChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.Orientation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.toolbar.Toolbar)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.orientationChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("orientation-changed", closure, after);
  }

  /**
      Connect to `PopupContextMenu` signal.
  
      Emitted when the user right-clicks the toolbar or uses the
        keybinding to display a popup menu.
        
        Application developers should handle this signal if they want
        to display a context menu on the toolbar. The context-menu should
        appear at the coordinates given by `x` and `y`. The mouse button
        number is given by the button parameter. If the menu was popped
        up using the keybaord, button is -1.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int x, int y, int button, gid.gtk3.toolbar.Toolbar toolbar)`
  
          `x` the x coordinate of the point where the menu should appear (optional)
  
          `y` the y coordinate of the point where the menu should appear (optional)
  
          `button` the mouse button the user pressed, or -1 (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
          `Returns` return true if the signal was handled, false if not
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopupContextMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gtk3.toolbar.Toolbar)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.popupContextMenu");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup-context-menu", closure, after);
  }

  /**
      Connect to `StyleChanged` signal.
  
      Emitted when the style of the toolbar changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ToolbarStyle style, gid.gtk3.toolbar.Toolbar toolbar)`
  
          `style` the new #GtkToolbarStyle of the toolbar (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStyleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ToolbarStyle)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.toolbar.Toolbar)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.styleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("style-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Toolbar
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.toolbar.Toolbar), T.stringof ~ " is not derived from gid.gtk3.toolbar.Toolbar");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOrientationChanged", true)[0]) == gid.gtk3.toolbar.Toolbar))
      _installVfunc(klass, "orientation_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPopupContextMenu", true)[0]) == gid.gtk3.toolbar.Toolbar))
      _installVfunc(klass, "popup_context_menu");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStyleChanged", true)[0]) == gid.gtk3.toolbar.Toolbar))
      _installVfunc(klass, "style_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkToolbarClass*)klass;

    switch (vfunc)
    {
      case "orientation_changed":
      {
        static extern(C) void _vfuncOrientationChangedTramp(GtkToolbar* toolbar, GtkOrientation orientation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.toolbar.Toolbar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)toolbar);
          if (!_obj)
          {
            auto _klass = cast(GtkToolbarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)toolbar);
            if (_klass.orientationChanged)
              return (cast(typeof(&_vfuncOrientationChangedTramp))_klass.orientationChanged)(toolbar, orientation);
            return;
          }

          try
          {
            _obj.vfuncOrientationChanged(orientation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.vfuncOrientationChanged");
          }
        }

        _klass.orientationChanged = cast(typeof(_klass.orientationChanged))&_vfuncOrientationChangedTramp;
        break;
      }
      case "popup_context_menu":
      {
        static extern(C) gboolean _vfuncPopupContextMenuTramp(GtkToolbar* toolbar, int x, int y, int buttonNumber) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.toolbar.Toolbar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)toolbar);
          if (!_obj)
          {
            auto _klass = cast(GtkToolbarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)toolbar);
            if (_klass.popupContextMenu)
              return (cast(typeof(&_vfuncPopupContextMenuTramp))_klass.popupContextMenu)(toolbar, x, y, buttonNumber);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPopupContextMenu(x, y, buttonNumber);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.vfuncPopupContextMenu");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.popupContextMenu = cast(typeof(_klass.popupContextMenu))&_vfuncPopupContextMenuTramp;
        break;
      }
      case "style_changed":
      {
        static extern(C) void _vfuncStyleChangedTramp(GtkToolbar* toolbar, GtkToolbarStyle style) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.toolbar.Toolbar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)toolbar);
          if (!_obj)
          {
            auto _klass = cast(GtkToolbarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)toolbar);
            if (_klass.styleChanged)
              return (cast(typeof(&_vfuncStyleChangedTramp))_klass.styleChanged)(toolbar, style);
            return;
          }

          try
          {
            _obj.vfuncStyleChanged(style);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.toolbar.Toolbar.vfuncStyleChanged");
          }
        }

        _klass.styleChanged = cast(typeof(_klass.styleChanged))&_vfuncStyleChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.toolbar.Toolbar]
class ToolbarGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T, gid.gtk3.tool_shell.ToolShellGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();
  mixin ToolShellGidBuilderT!();

  /**
      Set `iconSize` property.
      Params:
        propval = The size of the icons in a toolbar is normally determined by
          the toolbar-icon-size setting. When this property is set, it
          overrides the setting.
          
          This should only be used for special-purpose toolbars, normal
          application toolbars should respect the user preferences for the
          size of icons.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(gid.gtk3.types.IconSize propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the icon-size property has been set.
      Returns: Builder instance for fluent chaining
  */
  T iconSizeSet(bool propval) nothrow
  {
    return setProperty("icon-size-set", propval);
  }

  /** */
  T showArrow(bool propval) nothrow
  {
    return setProperty("show-arrow", propval);
  }

  /** */
  T toolbarStyle(gid.gtk3.types.ToolbarStyle propval) nothrow
  {
    return setProperty("toolbar-style", propval);
  }
}

/// Fluent builder for [gid.gtk3.toolbar.Toolbar]
final class ToolbarGidBuilder : ToolbarGidBuilderImpl!ToolbarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Toolbar build() nothrow
  {
    return new Toolbar(cast(void*)createGObject(Toolbar._getGType), Yes.Take);
  }
}
