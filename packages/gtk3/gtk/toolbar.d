/// Module for [Toolbar] class
module gtk.toolbar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.tool_item;
import gtk.tool_shell;
import gtk.tool_shell_mixin;
import gtk.types;
import gtk.widget;

/**
    A toolbar is created with a call to [gtk.toolbar.Toolbar.new_].
    
    A toolbar can contain instances of a subclass of #GtkToolItem. To add
    a #GtkToolItem to the a toolbar, use [gtk.toolbar.Toolbar.insert]. To remove
    an item from the toolbar use [gtk.container.Container.remove]. To add a button
    to the toolbar, add an instance of #GtkToolButton.
    
    Toolbar items can be visually grouped by adding instances of
    #GtkSeparatorToolItem to the toolbar. If the GtkToolbar child property
    “expand” is #TRUE and the property #GtkSeparatorToolItem:draw is set to
    #FALSE, the effect is to force all following items to the end of the toolbar.
    
    By default, a toolbar can be shrunk, upon which it will add an arrow button
    to show an overflow menu offering access to any #GtkToolItem child that has
    a proxy menu item. To disable this and request enough size for all children,
    call [gtk.toolbar.Toolbar.setShowArrow] to set #GtkToolbar:show-arrow to false.
    
    Creating a context menu for the toolbar can be done by connecting to
    the #GtkToolbar::popup-context-menu signal.
    
    # CSS nodes
    
    GtkToolbar has a single CSS node with name toolbar.
*/
class Toolbar : gtk.container.Container, gtk.orientable.Orientable, gtk.tool_shell.ToolShell
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
    return cast(void function())gtk_toolbar_get_type != &gidSymbolNotFound ? gtk_toolbar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Toolbar self()
  {
    return this;
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
  @property gtk.types.IconSize iconSize()
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
  @property void iconSize(gtk.types.IconSize propval)
  {
    return setIconSize(propval);
  }

  /**
      Get `iconSizeSet` property.
      Returns: Is true if the icon-size property has been set.
  */
  @property bool iconSizeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("icon-size-set");
  }

  /**
      Set `iconSizeSet` property.
      Params:
        propval = Is true if the icon-size property has been set.
  */
  @property void iconSizeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("icon-size-set", propval);
  }

  /** */
  @property bool showArrow()
  {
    return getShowArrow();
  }

  /** */
  @property void showArrow(bool propval)
  {
    return setShowArrow(propval);
  }

  /** */
  @property gtk.types.ToolbarStyle toolbarStyle()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ToolbarStyle)("toolbar-style");
  }

  /** */
  @property void toolbarStyle(gtk.types.ToolbarStyle propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ToolbarStyle)("toolbar-style", propval);
  }

  mixin OrientableT!();
  mixin ToolShellT!();
  alias getStyle = gtk.widget.Widget.getStyle;

  /**
      Creates a new toolbar.
      Returns: the newly-created toolbar.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_toolbar_new();
    this(_cretval, No.Take);
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
  int getDropIndex(int x, int y)
  {
    int _retval;
    _retval = gtk_toolbar_get_drop_index(cast(GtkToolbar*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Retrieves the icon size for the toolbar. See [gtk.toolbar.Toolbar.setIconSize].
      Returns: the current icon size for the icons on the toolbar.
  */
  gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_toolbar_get_icon_size(cast(GtkToolbar*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Returns the position of item on the toolbar, starting from 0.
      It is an error if item is not a child of the toolbar.
  
      Params:
        item = a #GtkToolItem that is a child of toolbar
      Returns: the position of item on the toolbar.
  */
  int getItemIndex(gtk.tool_item.ToolItem item)
  {
    int _retval;
    _retval = gtk_toolbar_get_item_index(cast(GtkToolbar*)this._cPtr, item ? cast(GtkToolItem*)item._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the number of items on the toolbar.
      Returns: the number of items on the toolbar
  */
  int getNItems()
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
  gtk.tool_item.ToolItem getNthItem(int n)
  {
    GtkToolItem* _cretval;
    _cretval = gtk_toolbar_get_nth_item(cast(GtkToolbar*)this._cPtr, n);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_item.ToolItem)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the relief style of buttons on toolbar. See
      [gtk.button.Button.setRelief].
      Returns: The relief style of buttons on toolbar.
  */
  gtk.types.ReliefStyle getReliefStyle()
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_toolbar_get_relief_style(cast(GtkToolbar*)this._cPtr);
    gtk.types.ReliefStyle _retval = cast(gtk.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Returns whether the toolbar has an overflow menu.
      See [gtk.toolbar.Toolbar.setShowArrow].
      Returns: true if the toolbar has an overflow menu.
  */
  bool getShowArrow()
  {
    bool _retval;
    _retval = cast(bool)gtk_toolbar_get_show_arrow(cast(GtkToolbar*)this._cPtr);
    return _retval;
  }

  alias getStyle = gtk.widget.Widget.getStyle;

  /**
      Retrieves whether the toolbar has text, icons, or both . See
      [gtk.toolbar.Toolbar.setStyle].
      Returns: the current style of toolbar
  */
  gtk.types.ToolbarStyle getStyle()
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_toolbar_get_style(cast(GtkToolbar*)this._cPtr);
    gtk.types.ToolbarStyle _retval = cast(gtk.types.ToolbarStyle)_cretval;
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
  void insert(gtk.tool_item.ToolItem item, int pos)
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
  void setDropHighlightItem(gtk.tool_item.ToolItem toolItem, int index)
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
  void setIconSize(gtk.types.IconSize iconSize)
  {
    gtk_toolbar_set_icon_size(cast(GtkToolbar*)this._cPtr, iconSize);
  }

  /**
      Sets whether to show an overflow menu when toolbar isn’t allocated enough
      size to show all of its items. If true, items which can’t fit in toolbar,
      and which have a proxy menu item set by [gtk.tool_item.ToolItem.setProxyMenuItem]
      or #GtkToolItem::create-menu-proxy, will be available in an overflow menu,
      which can be opened by an added arrow button. If false, toolbar will
      request enough size to fit all of its child items without any overflow.
  
      Params:
        showArrow = Whether to show an overflow menu
  */
  void setShowArrow(bool showArrow)
  {
    gtk_toolbar_set_show_arrow(cast(GtkToolbar*)this._cPtr, showArrow);
  }

  alias setStyle = gtk.widget.Widget.setStyle;

  /**
      Alters the view of toolbar to display either icons only, text only, or both.
  
      Params:
        style = the new style for toolbar.
  */
  void setStyle(gtk.types.ToolbarStyle style)
  {
    gtk_toolbar_set_style(cast(GtkToolbar*)this._cPtr, style);
  }

  /**
      Unsets toolbar icon size set with [gtk.toolbar.Toolbar.setIconSize], so that
      user preferences will be used to determine the icon size.
  */
  void unsetIconSize()
  {
    gtk_toolbar_unset_icon_size(cast(GtkToolbar*)this._cPtr);
  }

  /**
      Unsets a toolbar style set with [gtk.toolbar.Toolbar.setStyle], so that
      user preferences will be used to determine the toolbar style.
  */
  void unsetStyle()
  {
    gtk_toolbar_unset_style(cast(GtkToolbar*)this._cPtr);
  }

  /**
      Connect to `FocusHomeOrEnd` signal.
  
      A keybinding signal used internally by GTK+. This signal can't
        be used in application code
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool focusHome, gtk.toolbar.Toolbar toolbar))
  
          `focusHome` true if the first item should be focused (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled, false if not
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFocusHomeOrEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.toolbar.Toolbar)))
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
    return connectSignalClosure("focus-home-or-end", closure, after);
  }

  /**
      Connect to `OrientationChanged` signal.
  
      Emitted when the orientation of the toolbar changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.Orientation orientation, gtk.toolbar.Toolbar toolbar))
  
          `orientation` the new #GtkOrientation of the toolbar (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOrientationChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.Orientation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.toolbar.Toolbar)))
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
  
          $(D bool callback(int x, int y, int button, gtk.toolbar.Toolbar toolbar))
  
          `x` the x coordinate of the point where the menu should appear (optional)
  
          `y` the y coordinate of the point where the menu should appear (optional)
  
          `button` the mouse button the user pressed, or -1 (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
          `Returns` return true if the signal was handled, false if not
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopupContextMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.toolbar.Toolbar)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.types.ToolbarStyle style, gtk.toolbar.Toolbar toolbar))
  
          `style` the new #GtkToolbarStyle of the toolbar (optional)
  
          `toolbar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStyleChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ToolbarStyle)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.toolbar.Toolbar)))
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
    return connectSignalClosure("style-changed", closure, after);
  }
}
