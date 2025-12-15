/// Module for [ToolItem] class
module gtk.tool_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.size_group;
import gtk.types;
import gtk.widget;
import pango.types;

/**
    #GtkToolItems are widgets that can appear on a toolbar. To
    create a toolbar item that contain something else than a button, use
    [gtk.tool_item.ToolItem.new_]. Use [gtk.container.Container.add] to add a child
    widget to the tool item.
    
    For toolbar items that contain buttons, see the #GtkToolButton,
    #GtkToggleToolButton and #GtkRadioToolButton classes.
    
    See the #GtkToolbar class for a description of the toolbar widget, and
    #GtkToolShell for a description of the tool shell interface.
*/
class ToolItem : gtk.bin.Bin, gtk.activatable.Activatable
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
    return cast(void function())gtk_tool_item_get_type != &gidSymbolNotFound ? gtk_tool_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolItem self()
  {
    return this;
  }

  /** */
  @property bool isImportant()
  {
    return getIsImportant();
  }

  /** */
  @property void isImportant(bool propval)
  {
    return setIsImportant(propval);
  }

  /** */
  @property bool visibleHorizontal()
  {
    return getVisibleHorizontal();
  }

  /** */
  @property void visibleHorizontal(bool propval)
  {
    return setVisibleHorizontal(propval);
  }

  /** */
  @property bool visibleVertical()
  {
    return getVisibleVertical();
  }

  /** */
  @property void visibleVertical(bool propval)
  {
    return setVisibleVertical(propval);
  }

  mixin ActivatableT!();

  /**
      Creates a new #GtkToolItem
      Returns: the new #GtkToolItem
  */
  this()
  {
    GtkToolItem* _cretval;
    _cretval = gtk_tool_item_new();
    this(_cretval, No.Take);
  }

  /**
      Returns the ellipsize mode used for tool_item. Custom subclasses of
      #GtkToolItem should call this function to find out how text should
      be ellipsized.
      Returns: a #PangoEllipsizeMode indicating how text in tool_item
        should be ellipsized.
  */
  pango.types.EllipsizeMode getEllipsizeMode()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_tool_item_get_ellipsize_mode(cast(GtkToolItem*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Returns whether tool_item is allocated extra space.
      See [gtk.tool_item.ToolItem.setExpand].
      Returns: true if tool_item is allocated extra space.
  */
  bool getExpand()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_expand(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether tool_item is the same size as other homogeneous
      items. See [gtk.tool_item.ToolItem.setHomogeneous].
      Returns: true if the item is the same size as other homogeneous
        items.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_homogeneous(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns the icon size used for tool_item. Custom subclasses of
      #GtkToolItem should call this function to find out what size icons
      they should use.
      Returns: a #GtkIconSize indicating the icon size
        used for tool_item
  */
  gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_tool_item_get_icon_size(cast(GtkToolItem*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Returns whether tool_item is considered important. See
      [gtk.tool_item.ToolItem.setIsImportant]
      Returns: true if tool_item is considered important.
  */
  bool getIsImportant()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_is_important(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns the orientation used for tool_item. Custom subclasses of
      #GtkToolItem should call this function to find out what size icons
      they should use.
      Returns: a #GtkOrientation indicating the orientation
        used for tool_item
  */
  gtk.types.Orientation getOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_item_get_orientation(cast(GtkToolItem*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      If menu_item_id matches the string passed to
      [gtk.tool_item.ToolItem.setProxyMenuItem] return the corresponding #GtkMenuItem.
      
      Custom subclasses of #GtkToolItem should use this function to
      update their menu item when the #GtkToolItem changes. That the
      menu_item_ids must match ensures that a #GtkToolItem
      will not inadvertently change a menu item that they did not create.
  
      Params:
        menuItemId = a string used to identify the menu item
      Returns: The #GtkMenuItem passed to
            [gtk.tool_item.ToolItem.setProxyMenuItem], if the menu_item_ids
            match.
  */
  gtk.widget.Widget getProxyMenuItem(string menuItemId)
  {
    GtkWidget* _cretval;
    const(char)* _menuItemId = menuItemId.toCString(No.Alloc);
    _cretval = gtk_tool_item_get_proxy_menu_item(cast(GtkToolItem*)this._cPtr, _menuItemId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the relief style of tool_item. See [gtk.button.Button.setRelief].
      Custom subclasses of #GtkToolItem should call this function in the handler
      of the #GtkToolItem::toolbar_reconfigured signal to find out the
      relief style of buttons.
      Returns: a #GtkReliefStyle indicating the relief style used
        for tool_item.
  */
  gtk.types.ReliefStyle getReliefStyle()
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_tool_item_get_relief_style(cast(GtkToolItem*)this._cPtr);
    gtk.types.ReliefStyle _retval = cast(gtk.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Returns the text alignment used for tool_item. Custom subclasses of
      #GtkToolItem should call this function to find out how text should
      be aligned.
      Returns: a #gfloat indicating the horizontal text alignment
        used for tool_item
  */
  float getTextAlignment()
  {
    float _retval;
    _retval = gtk_tool_item_get_text_alignment(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns the text orientation used for tool_item. Custom subclasses of
      #GtkToolItem should call this function to find out how text should
      be orientated.
      Returns: a #GtkOrientation indicating the text orientation
        used for tool_item
  */
  gtk.types.Orientation getTextOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_item_get_text_orientation(cast(GtkToolItem*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the size group used for labels in tool_item.
      Custom subclasses of #GtkToolItem should call this function
      and use the size group for labels.
      Returns: a #GtkSizeGroup
  */
  gtk.size_group.SizeGroup getTextSizeGroup()
  {
    GtkSizeGroup* _cretval;
    _cretval = gtk_tool_item_get_text_size_group(cast(GtkToolItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.size_group.SizeGroup)(cast(GtkSizeGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the toolbar style used for tool_item. Custom subclasses of
      #GtkToolItem should call this function in the handler of the
      GtkToolItem::toolbar_reconfigured signal to find out in what style
      the toolbar is displayed and change themselves accordingly
      
      Possibilities are:
      $(LIST
        * [gtk.types.ToolbarStyle.Both], meaning the tool item should show
          both an icon and a label, stacked vertically
        * [gtk.types.ToolbarStyle.Icons], meaning the toolbar shows only icons
        * [gtk.types.ToolbarStyle.Text], meaning the tool item should only show text
        * [gtk.types.ToolbarStyle.BothHoriz], meaning the tool item should show
          both an icon and a label, arranged horizontally
      )
      Returns: A #GtkToolbarStyle indicating the toolbar style used
        for tool_item.
  */
  gtk.types.ToolbarStyle getToolbarStyle()
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_tool_item_get_toolbar_style(cast(GtkToolItem*)this._cPtr);
    gtk.types.ToolbarStyle _retval = cast(gtk.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Returns whether tool_item has a drag window. See
      [gtk.tool_item.ToolItem.setUseDragWindow].
      Returns: true if tool_item uses a drag window.
  */
  bool getUseDragWindow()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_use_drag_window(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the tool_item is visible on toolbars that are
      docked horizontally.
      Returns: true if tool_item is visible on toolbars that are
        docked horizontally.
  */
  bool getVisibleHorizontal()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_visible_horizontal(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether tool_item is visible when the toolbar is docked vertically.
      See [gtk.tool_item.ToolItem.setVisibleVertical].
      Returns: Whether tool_item is visible when the toolbar is docked vertically
  */
  bool getVisibleVertical()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_item_get_visible_vertical(cast(GtkToolItem*)this._cPtr);
    return _retval;
  }

  /**
      Calling this function signals to the toolbar that the
      overflow menu item for tool_item has changed. If the
      overflow menu is visible when this function it called,
      the menu will be rebuilt.
      
      The function must be called when the tool item changes what it
      will do in response to the #GtkToolItem::create-menu-proxy signal.
  */
  void rebuildMenu()
  {
    gtk_tool_item_rebuild_menu(cast(GtkToolItem*)this._cPtr);
  }

  /**
      Returns the #GtkMenuItem that was last set by
      [gtk.tool_item.ToolItem.setProxyMenuItem], ie. the #GtkMenuItem
      that is going to appear in the overflow menu.
      Returns: The #GtkMenuItem that is going to appear in the
        overflow menu for tool_item.
  */
  gtk.widget.Widget retrieveProxyMenuItem()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_item_retrieve_proxy_menu_item(cast(GtkToolItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether tool_item is allocated extra space when there
      is more room on the toolbar then needed for the items. The
      effect is that the item gets bigger when the toolbar gets bigger
      and smaller when the toolbar gets smaller.
  
      Params:
        expand = Whether tool_item is allocated extra space
  */
  void setExpand(bool expand)
  {
    gtk_tool_item_set_expand(cast(GtkToolItem*)this._cPtr, expand);
  }

  /**
      Sets whether tool_item is to be allocated the same size as other
      homogeneous items. The effect is that all homogeneous items will have
      the same width as the widest of the items.
  
      Params:
        homogeneous = whether tool_item is the same size as other homogeneous items
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_tool_item_set_homogeneous(cast(GtkToolItem*)this._cPtr, homogeneous);
  }

  /**
      Sets whether tool_item should be considered important. The #GtkToolButton
      class uses this property to determine whether to show or hide its label
      when the toolbar style is [gtk.types.ToolbarStyle.BothHoriz]. The result is that
      only tool buttons with the “is_important” property set have labels, an
      effect known as “priority text”
  
      Params:
        isImportant = whether the tool item should be considered important
  */
  void setIsImportant(bool isImportant)
  {
    gtk_tool_item_set_is_important(cast(GtkToolItem*)this._cPtr, isImportant);
  }

  /**
      Sets the #GtkMenuItem used in the toolbar overflow menu. The
      menu_item_id is used to identify the caller of this function and
      should also be used with [gtk.tool_item.ToolItem.getProxyMenuItem].
      
      See also #GtkToolItem::create-menu-proxy.
  
      Params:
        menuItemId = a string used to identify menu_item
        menuItem = a #GtkMenuItem to use in the overflow menu, or null
  */
  void setProxyMenuItem(string menuItemId, gtk.widget.Widget menuItem = null)
  {
    const(char)* _menuItemId = menuItemId.toCString(No.Alloc);
    gtk_tool_item_set_proxy_menu_item(cast(GtkToolItem*)this._cPtr, _menuItemId, menuItem ? cast(GtkWidget*)menuItem._cPtr(No.Dup) : null);
  }

  /**
      Sets the markup text to be displayed as tooltip on the item.
      See [gtk.widget.Widget.setTooltipMarkup].
  
      Params:
        markup = markup text to be used as tooltip for tool_item
  */
  override void setTooltipMarkup(string markup)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_tool_item_set_tooltip_markup(cast(GtkToolItem*)this._cPtr, _markup);
  }

  /**
      Sets the text to be displayed as tooltip on the item.
      See [gtk.widget.Widget.setTooltipText].
  
      Params:
        text = text to be used as tooltip for tool_item
  */
  override void setTooltipText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_tool_item_set_tooltip_text(cast(GtkToolItem*)this._cPtr, _text);
  }

  /**
      Sets whether tool_item has a drag window. When true the
      toolitem can be used as a drag source through [gtk.widget.Widget.dragSourceSet].
      When tool_item has a drag window it will intercept all events,
      even those that would otherwise be sent to a child of tool_item.
  
      Params:
        useDragWindow = Whether tool_item has a drag window.
  */
  void setUseDragWindow(bool useDragWindow)
  {
    gtk_tool_item_set_use_drag_window(cast(GtkToolItem*)this._cPtr, useDragWindow);
  }

  /**
      Sets whether tool_item is visible when the toolbar is docked horizontally.
  
      Params:
        visibleHorizontal = Whether tool_item is visible when in horizontal mode
  */
  void setVisibleHorizontal(bool visibleHorizontal)
  {
    gtk_tool_item_set_visible_horizontal(cast(GtkToolItem*)this._cPtr, visibleHorizontal);
  }

  /**
      Sets whether tool_item is visible when the toolbar is docked
      vertically. Some tool items, such as text entries, are too wide to be
      useful on a vertically docked toolbar. If visible_vertical is false
      tool_item will not appear on toolbars that are docked vertically.
  
      Params:
        visibleVertical = whether tool_item is visible when the toolbar
          is in vertical mode
  */
  void setVisibleVertical(bool visibleVertical)
  {
    gtk_tool_item_set_visible_vertical(cast(GtkToolItem*)this._cPtr, visibleVertical);
  }

  /**
      Emits the signal #GtkToolItem::toolbar_reconfigured on tool_item.
      #GtkToolbar and other #GtkToolShell implementations use this function
      to notify children, when some aspect of their configuration changes.
  */
  void toolbarReconfigured()
  {
    gtk_tool_item_toolbar_reconfigured(cast(GtkToolItem*)this._cPtr);
  }

  /**
      Connect to `CreateMenuProxy` signal.
  
      This signal is emitted when the toolbar needs information from tool_item
      about whether the item should appear in the toolbar overflow menu. In
      response the tool item should either
      
      $(LIST
        * call [gtk.tool_item.ToolItem.setProxyMenuItem] with a null
          pointer and return true to indicate that the item should not appear
          in the overflow menu
        
        * call [gtk.tool_item.ToolItem.setProxyMenuItem] with a new menu
          item and return true, or
        
        * return false to indicate that the signal was not handled by the item.
          This means that the item will not appear in the overflow menu unless
          a later handler installs a menu item.
      )
        
      The toolbar may cache the result of this signal. When the tool item changes
      how it will respond to this signal it must call [gtk.tool_item.ToolItem.rebuildMenu]
      to invalidate the cache and ensure that the toolbar rebuilds its overflow
      menu.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tool_item.ToolItem toolItem))
  
          `toolItem` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled, false if not
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateMenuProxy(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tool_item.ToolItem)))
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
    return connectSignalClosure("create-menu-proxy", closure, after);
  }

  /**
      Connect to `ToolbarReconfigured` signal.
  
      This signal is emitted when some property of the toolbar that the
      item is a child of changes. For custom subclasses of #GtkToolItem,
      the default handler of this signal use the functions
      $(LIST
        * [gtk.tool_shell.ToolShell.toolShellGetOrientation]
        * [gtk.tool_shell.ToolShell.getStyle]
        * [gtk.tool_shell.ToolShell.getIconSize]
        * [gtk.tool_shell.ToolShell.getReliefStyle]
      )
      to find out what the toolbar should look like and change
      themselves accordingly.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tool_item.ToolItem toolItem))
  
          `toolItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToolbarReconfigured(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tool_item.ToolItem)))
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
    return connectSignalClosure("toolbar-reconfigured", closure, after);
  }
}
