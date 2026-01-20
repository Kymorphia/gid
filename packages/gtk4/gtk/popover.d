/// Module for [Popover] class
module gtk.popover;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.popover.Popover] is a bubble-like context popup.
    
    ![An example GtkPopover](popover.png)
    
    It is primarily meant to provide context-dependent information
    or options. Popovers are attached to a parent widget. By default,
    they point to the whole widget area, although this behavior can be
    changed with [gtk.popover.Popover.setPointingTo].
    
    The position of a popover relative to the widget it is attached to
    can also be changed with [gtk.popover.Popover.setPosition]
    
    By default, [gtk.popover.Popover] performs a grab, in order to ensure input
    events get redirected to it while it is shown, and also so the popover
    is dismissed in the expected situations (clicks outside the popover,
    or the Escape key being pressed). If no such modal behavior is desired
    on a popover, [gtk.popover.Popover.setAutohide] may be called on it to
    tweak its behavior.
    
    ## GtkPopover as menu replacement
    
    [gtk.popover.Popover] is often used to replace menus. The best was to do this
    is to use the [gtk.popover_menu.PopoverMenu] subclass which supports being
    populated from a [gio.menu_model.MenuModel] with [gtk.popover_menu.PopoverMenu.newFromModel].
    
    ```xml
    <section>
      <attribute name="display-hint">horizontal-buttons</attribute>
      <item>
        <attribute name="label">Cut</attribute>
        <attribute name="action">app.cut</attribute>
        <attribute name="verb-icon">edit-cut-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Copy</attribute>
        <attribute name="action">app.copy</attribute>
        <attribute name="verb-icon">edit-copy-symbolic</attribute>
      </item>
      <item>
        <attribute name="label">Paste</attribute>
        <attribute name="action">app.paste</attribute>
        <attribute name="verb-icon">edit-paste-symbolic</attribute>
      </item>
    </section>
    ```
    
    # CSS nodes
    
    ```
    popover.background[.menu]
    ├── arrow
    ╰── contents
        ╰── <child>
    ```
    
    [gtk.popover.Popover] has a main node with name `popover`, an arrow with name `arrow`,
    and another node for the content named `contents`. The `popover` node always
    gets the `.background` style class. It also gets the `.menu` style class
    if the popover is menu-like, e.g. is a [gtk.popover_menu.PopoverMenu].
    
    Particular uses of [gtk.popover.Popover], such as touch selection popups or
    magnifiers in [gtk.entry.Entry] or [gtk.text_view.TextView] get style classes like
    `.touch-selection` or `.magnifier` to differentiate from plain popovers.
    
    When styling a popover directly, the `popover` node should usually
    not have any background. The visible part of the popover can have
    a shadow. To specify it in CSS, set the box-shadow of the `contents` node.
    
    Note that, in order to accomplish appropriate arrow visuals, [gtk.popover.Popover]
    uses custom drawing for the `arrow` node. This makes it possible for the
    arrow to change its shape dynamically, but it also limits the possibilities
    of styling it using CSS. In particular, the `arrow` gets drawn over the
    `content` node's border and shadow, so they look like one shape, which
    means that the border width of the `content` node and the `arrow` node should
    be the same. The arrow also does not support any border shape other than
    solid, no border-radius, only one border width (border-bottom-width is
    used) and no box-shadow.
*/
class Popover : gtk.widget.Widget, gtk.native.Native, gtk.shortcut_manager.ShortcutManager
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
    return cast(void function())gtk_popover_get_type != &gidSymbolNotFound ? gtk_popover_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Popover self()
  {
    return this;
  }

  /**
      Get `autohide` property.
      Returns: Whether to dismiss the popover on outside clicks.
  */
  @property bool autohide()
  {
    return getAutohide();
  }

  /**
      Set `autohide` property.
      Params:
        propval = Whether to dismiss the popover on outside clicks.
  */
  @property void autohide(bool propval)
  {
    return setAutohide(propval);
  }

  /**
      Get `cascadePopdown` property.
      Returns: Whether the popover pops down after a child popover.
        
        This is used to implement the expected behavior of submenus.
  */
  @property bool cascadePopdown()
  {
    return getCascadePopdown();
  }

  /**
      Set `cascadePopdown` property.
      Params:
        propval = Whether the popover pops down after a child popover.
          
          This is used to implement the expected behavior of submenus.
  */
  @property void cascadePopdown(bool propval)
  {
    return setCascadePopdown(propval);
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
      Get `defaultWidget` property.
      Returns: The default widget inside the popover.
  */
  @property gtk.widget.Widget defaultWidget()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("default-widget");
  }

  /**
      Set `defaultWidget` property.
      Params:
        propval = The default widget inside the popover.
  */
  @property void defaultWidget(gtk.widget.Widget propval)
  {
    return setDefaultWidget(propval);
  }

  /**
      Get `hasArrow` property.
      Returns: Whether to draw an arrow.
  */
  @property bool hasArrow()
  {
    return getHasArrow();
  }

  /**
      Set `hasArrow` property.
      Params:
        propval = Whether to draw an arrow.
  */
  @property void hasArrow(bool propval)
  {
    return setHasArrow(propval);
  }

  /**
      Get `mnemonicsVisible` property.
      Returns: Whether mnemonics are currently visible in this popover.
  */
  @property bool mnemonicsVisible()
  {
    return getMnemonicsVisible();
  }

  /**
      Set `mnemonicsVisible` property.
      Params:
        propval = Whether mnemonics are currently visible in this popover.
  */
  @property void mnemonicsVisible(bool propval)
  {
    return setMnemonicsVisible(propval);
  }

  /**
      Get `pointingTo` property.
      Returns: Rectangle in the parent widget that the popover points to.
  */
  @property gdk.rectangle.Rectangle pointingTo()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rectangle.Rectangle)("pointing-to");
  }

  /**
      Set `pointingTo` property.
      Params:
        propval = Rectangle in the parent widget that the popover points to.
  */
  @property void pointingTo(gdk.rectangle.Rectangle propval)
  {
    return setPointingTo(propval);
  }

  /**
      Get `position` property.
      Returns: How to place the popover, relative to its parent.
  */
  @property gtk.types.PositionType position()
  {
    return getPosition();
  }

  /**
      Set `position` property.
      Params:
        propval = How to place the popover, relative to its parent.
  */
  @property void position(gtk.types.PositionType propval)
  {
    return setPosition(propval);
  }

  mixin NativeT!();
  mixin ShortcutManagerT!();

  /**
      Creates a new [gtk.popover.Popover].
      Returns: the new [gtk.popover.Popover]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_new();
    this(_cretval, No.Take);
  }

  /**
      Returns whether the popover is modal.
      
      See [gtk.popover.Popover.setAutohide] for the
      implications of this.
      Returns: true if popover is modal
  */
  bool getAutohide()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_autohide(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the popover will close after a modal child is closed.
      Returns: true if popover will close after a modal child.
  */
  bool getCascadePopdown()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_cascade_popdown(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of popover.
      Returns: the child widget of popover
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_get_child(cast(GtkPopover*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether this popover is showing an arrow
      pointing at the widget that it is relative to.
      Returns: whether the popover has an arrow
  */
  bool getHasArrow()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_has_arrow(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether mnemonics are visible.
      Returns: true if mnemonics are supposed to be visible
          in this popover
  */
  bool getMnemonicsVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_mnemonics_visible(cast(GtkPopover*)this._cPtr);
    return _retval;
  }

  /**
      Gets the offset previous set with [gtk.popover.Popover.setOffset].
  
      Params:
        xOffset = a location for the x_offset
        yOffset = a location for the y_offset
  */
  void getOffset(out int xOffset, out int yOffset)
  {
    gtk_popover_get_offset(cast(GtkPopover*)this._cPtr, cast(int*)&xOffset, cast(int*)&yOffset);
  }

  /**
      Gets the rectangle that the popover points to.
      
      If a rectangle to point to has been set, this function will
      return true and fill in rect with such rectangle, otherwise
      it will return false and fill in rect with the parent
      widget coordinates.
  
      Params:
        rect = location to store the rectangle
      Returns: true if a rectangle to point to was set.
  */
  bool getPointingTo(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_get_pointing_to(cast(GtkPopover*)this._cPtr, cast(GdkRectangle*)&rect);
    return _retval;
  }

  /**
      Returns the preferred position of popover.
      Returns: The preferred position.
  */
  gtk.types.PositionType getPosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_popover_get_position(cast(GtkPopover*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Pops popover down.
      
      This may have the side-effect of closing a parent popover
      as well. See `propertyGtk.Popover:cascade-popdown`.
  */
  void popdown()
  {
    gtk_popover_popdown(cast(GtkPopover*)this._cPtr);
  }

  /**
      Pops popover up.
  */
  void popup()
  {
    gtk_popover_popup(cast(GtkPopover*)this._cPtr);
  }

  /**
      Allocate a size for the [gtk.popover.Popover].
      
      This function needs to be called in size-allocate by widgets
      who have a [gtk.popover.Popover] as child. When using a layout manager,
      this is happening automatically.
      
      To make a popover appear on screen, use [gtk.popover.Popover.popup].
  */
  void present()
  {
    gtk_popover_present(cast(GtkPopover*)this._cPtr);
  }

  /**
      Sets whether popover is modal.
      
      A modal popover will grab the keyboard focus on it when being
      displayed. Focus will wrap around within the popover. Clicking
      outside the popover area or pressing Esc will dismiss the popover.
      
      Called this function on an already showing popup with a new
      autohide value different from the current one, will cause the
      popup to be hidden.
  
      Params:
        autohide = true to dismiss the popover on outside clicks
  */
  void setAutohide(bool autohide)
  {
    gtk_popover_set_autohide(cast(GtkPopover*)this._cPtr, autohide);
  }

  /**
      If cascade_popdown is true, the popover will be
      closed when a child modal popover is closed.
      
      If false, popover will stay visible.
  
      Params:
        cascadePopdown = true if the popover should follow a child closing
  */
  void setCascadePopdown(bool cascadePopdown)
  {
    gtk_popover_set_cascade_popdown(cast(GtkPopover*)this._cPtr, cascadePopdown);
  }

  /**
      Sets the child widget of popover.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_popover_set_child(cast(GtkPopover*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the default widget of a [gtk.popover.Popover].
      
      The default widget is the widget that’s activated when the user
      presses Enter in a dialog (for example). This function sets or
      unsets the default widget for a [gtk.popover.Popover].
  
      Params:
        widget = a child widget of popover to set as
            the default, or null to unset the default widget for the popover
  */
  void setDefaultWidget(gtk.widget.Widget widget = null)
  {
    gtk_popover_set_default_widget(cast(GtkPopover*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether this popover should draw an arrow
      pointing at the widget it is relative to.
  
      Params:
        hasArrow = true to draw an arrow
  */
  void setHasArrow(bool hasArrow)
  {
    gtk_popover_set_has_arrow(cast(GtkPopover*)this._cPtr, hasArrow);
  }

  /**
      Sets whether mnemonics should be visible.
  
      Params:
        mnemonicsVisible = the new value
  */
  void setMnemonicsVisible(bool mnemonicsVisible)
  {
    gtk_popover_set_mnemonics_visible(cast(GtkPopover*)this._cPtr, mnemonicsVisible);
  }

  /**
      Sets the offset to use when calculating the position
      of the popover.
      
      These values are used when preparing the [gdk.popup_layout.PopupLayout]
      for positioning the popover.
  
      Params:
        xOffset = the x offset to adjust the position by
        yOffset = the y offset to adjust the position by
  */
  void setOffset(int xOffset, int yOffset)
  {
    gtk_popover_set_offset(cast(GtkPopover*)this._cPtr, xOffset, yOffset);
  }

  /**
      Sets the rectangle that popover points to.
      
      This is in the coordinate space of the popover parent.
  
      Params:
        rect = rectangle to point to
  */
  void setPointingTo(gdk.rectangle.Rectangle rect)
  {
    gtk_popover_set_pointing_to(cast(GtkPopover*)this._cPtr, cast(const(GdkRectangle)*)&rect);
  }

  /**
      Sets the preferred position for popover to appear.
      
      If the popover is currently visible, it will be immediately
      updated.
      
      This preference will be respected where possible, although
      on lack of space (eg. if close to the window edges), the
      [gtk.popover.Popover] may choose to appear on the opposite side.
  
      Params:
        position = preferred popover position
  */
  void setPosition(gtk.types.PositionType position)
  {
    gtk_popover_set_position(cast(GtkPopover*)this._cPtr, position);
  }

  /**
      Connect to `ActivateDefault` signal.
  
      Emitted whend the user activates the default widget.
        
        This is a [keybinding signal](class.SignalAction.html).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.popover.Popover popover))
  
          `popover` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateDefault(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.popover.Popover)))
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
      Connect to `Closed` signal.
  
      Emitted when the popover is closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.popover.Popover popover))
  
          `popover` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.popover.Popover)))
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
    return connectSignalClosure("closed", closure, after);
  }
}
