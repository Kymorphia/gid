/// Module for [Paned] class
module gtk.paned;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
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
import gtk.types;
import gtk.widget;

/**
    #GtkPaned has two panes, arranged either
    horizontally or vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle.
    
    Child widgets are
    added to the panes of the widget with [gtk.paned.Paned.pack1] and
    [gtk.paned.Paned.pack2]. The division between the two children is set by default
    from the size requests of the children, but it can be adjusted by the
    user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a #GtkFrame with the shadow type set to [gtk.types.ShadowType.In]
    so that the gutter appears as a ridge. No separator is drawn if one of
    the children is missing.
    
    Each child has two options that can be set, @resize and @shrink. If
    @resize is true, then when the #GtkPaned is resized, that child will
    expand or shrink along with the paned widget. If @shrink is true, then
    that child can be made smaller than its requisition by the user.
    Setting @shrink to false allows the application to set a minimum size.
    If @resize is false for both children, then this is treated as if
    @resize is true for both children.
    
    The application can set the position of the slider as if it were set
    by the user, by calling [gtk.paned.Paned.setPosition].
    
    # CSS nodes
    
    ```plain
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ```
    
    GtkPaned has a main CSS node with name paned, and a subnode for
    the separator with name separator. The subnode gets a .wide style
    class when the paned is supposed to be wide.
    
    In horizontal orientation, the nodes of the children are always arranged
    from left to right. So :first-child will always select the leftmost child,
    regardless of text direction.
    
    ## Creating a paned widget with minimum sizes.
    
    ```c
    GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
    GtkWidget *frame1 = gtk_frame_new (NULL);
    GtkWidget *frame2 = gtk_frame_new (NULL);
    gtk_frame_set_shadow_type (GTK_FRAME (frame1), GTK_SHADOW_IN);
    gtk_frame_set_shadow_type (GTK_FRAME (frame2), GTK_SHADOW_IN);
    
    gtk_widget_set_size_request (hpaned, 200, -1);
    
    gtk_paned_pack1 (GTK_PANED (hpaned), frame1, TRUE, FALSE);
    gtk_widget_set_size_request (frame1, 50, -1);
    
    gtk_paned_pack2 (GTK_PANED (hpaned), frame2, FALSE, FALSE);
    gtk_widget_set_size_request (frame2, 50, -1);
    ```
*/
class Paned : gtk.container.Container, gtk.orientable.Orientable
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
    return cast(void function())gtk_paned_get_type != &gidSymbolNotFound ? gtk_paned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Paned self()
  {
    return this;
  }

  /**
      Get `maxPosition` property.
      Returns: The largest possible value for the position property.
      This property is derived from the size and shrinkability
      of the widget's children.
  */
  @property int maxPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-position");
  }

  /**
      Get `minPosition` property.
      Returns: The smallest possible value for the position property.
      This property is derived from the size and shrinkability
      of the widget's children.
  */
  @property int minPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("min-position");
  }

  /** */
  @property int position()
  {
    return getPosition();
  }

  /** */
  @property void position(int propval)
  {
    return setPosition(propval);
  }

  /** */
  @property bool positionSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("position-set");
  }

  /** */
  @property void positionSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("position-set", propval);
  }

  /**
      Get `wideHandle` property.
      Returns: Setting this property to true indicates that the paned needs
      to provide stronger visual separation (e.g. because it separates
      between two notebooks, whose tab rows would otherwise merge visually).
  */
  @property bool wideHandle()
  {
    return getWideHandle();
  }

  /**
      Set `wideHandle` property.
      Params:
        propval = Setting this property to true indicates that the paned needs
        to provide stronger visual separation (e.g. because it separates
        between two notebooks, whose tab rows would otherwise merge visually).
  */
  @property void wideHandle(bool propval)
  {
    return setWideHandle(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkPaned widget.
  
      Params:
        orientation = the paned’s orientation.
      Returns: a new #GtkPaned.
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_new(orientation);
    this(_cretval, No.Take);
  }

  /**
      Adds a child to the top or left pane with default parameters. This is
      equivalent to
      `gtk_paned_pack1 (paned, child, FALSE, TRUE)`.
  
      Params:
        child = the child to add
  */
  void add1(gtk.widget.Widget child)
  {
    gtk_paned_add1(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds a child to the bottom or right pane with default parameters. This
      is equivalent to
      `gtk_paned_pack2 (paned, child, TRUE, TRUE)`.
  
      Params:
        child = the child to add
  */
  void add2(gtk.widget.Widget child)
  {
    gtk_paned_add2(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Obtains the first child of the paned widget.
      Returns: first child, or null if it is not set.
  */
  gtk.widget.Widget getChild1()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_child1(cast(GtkPaned*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the second child of the paned widget.
      Returns: second child, or null if it is not set.
  */
  gtk.widget.Widget getChild2()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_child2(cast(GtkPaned*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkWindow of the handle. This function is
      useful when handling button or motion events because it
      enables the callback to distinguish between the window
      of the paned, a child and the handle.
      Returns: the paned’s handle window.
  */
  gdk.window.Window getHandleWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_paned_get_handle_window(cast(GtkPaned*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the divider between the two panes.
      Returns: position of the divider
  */
  int getPosition()
  {
    int _retval;
    _retval = gtk_paned_get_position(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkPaned:wide-handle property.
      Returns: true if the paned should have a wide handle
  */
  bool getWideHandle()
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_wide_handle(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Adds a child to the top or left pane.
  
      Params:
        child = the child to add
        resize = should this child expand when the paned widget is resized.
        shrink = can this child be made smaller than its requisition.
  */
  void pack1(gtk.widget.Widget child, bool resize, bool shrink)
  {
    gtk_paned_pack1(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, resize, shrink);
  }

  /**
      Adds a child to the bottom or right pane.
  
      Params:
        child = the child to add
        resize = should this child expand when the paned widget is resized.
        shrink = can this child be made smaller than its requisition.
  */
  void pack2(gtk.widget.Widget child, bool resize, bool shrink)
  {
    gtk_paned_pack2(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, resize, shrink);
  }

  /**
      Sets the position of the divider between the two panes.
  
      Params:
        position = pixel position of divider, a negative value means that the position
                     is unset.
  */
  void setPosition(int position)
  {
    gtk_paned_set_position(cast(GtkPaned*)this._cPtr, position);
  }

  /**
      Sets the #GtkPaned:wide-handle property.
  
      Params:
        wide = the new value for the #GtkPaned:wide-handle property
  */
  void setWideHandle(bool wide)
  {
    gtk_paned_set_wide_handle(cast(GtkPaned*)this._cPtr, wide);
  }

  /**
      Connect to `AcceptPosition` signal.
  
      The ::accept-position signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to accept the current position of the handle when
      moving it using key bindings.
      
      The default binding for this signal is Return or Space.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.paned.Paned paned))
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAcceptPosition(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.paned.Paned)))
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
    return connectSignalClosure("accept-position", closure, after);
  }

  /**
      Connect to `CancelPosition` signal.
  
      The ::cancel-position signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to cancel moving the position of the handle using key
      bindings. The position of the handle will be reset to the value prior to
      moving it.
      
      The default binding for this signal is Escape.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.paned.Paned paned))
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancelPosition(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.paned.Paned)))
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
    return connectSignalClosure("cancel-position", closure, after);
  }

  /**
      Connect to `CycleChildFocus` signal.
  
      The ::cycle-child-focus signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to cycle the focus between the children of the paned.
      
      The default binding is f6.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool reversed, gtk.paned.Paned paned))
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCycleChildFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.paned.Paned)))
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
    return connectSignalClosure("cycle-child-focus", closure, after);
  }

  /**
      Connect to `CycleHandleFocus` signal.
  
      The ::cycle-handle-focus signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to cycle whether the paned should grab focus to allow
      the user to change position of the handle by using key bindings.
      
      The default binding for this signal is f8.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool reversed, gtk.paned.Paned paned))
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCycleHandleFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.paned.Paned)))
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
    return connectSignalClosure("cycle-handle-focus", closure, after);
  }

  /**
      Connect to `MoveHandle` signal.
  
      The ::move-handle signal is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to move the handle when the user is using key bindings
      to move it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.ScrollType scrollType, gtk.paned.Paned paned))
  
          `scrollType` a #GtkScrollType (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveHandle(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.paned.Paned)))
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
    return connectSignalClosure("move-handle", closure, after);
  }

  /**
      Connect to `ToggleHandleFocus` signal.
  
      The ::toggle-handle-focus is a
      [keybinding signal][GtkBindingSignal]
      which gets emitted to accept the current position of the handle and then
      move focus to the next widget in the focus chain.
      
      The default binding is Tab.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.paned.Paned paned))
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleHandleFocus(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.paned.Paned)))
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
    return connectSignalClosure("toggle-handle-focus", closure, after);
  }
}
