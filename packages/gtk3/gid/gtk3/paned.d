/// Module for [Paned] class
module gid.gtk3.paned;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.window;
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
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkPaned has two panes, arranged either
    horizontally or vertically. The division between
    the two panes is adjustable by the user by dragging
    a handle.
    
    Child widgets are
    added to the panes of the widget with [gid.gtk3.paned.Paned.pack1] and
    [gid.gtk3.paned.Paned.pack2]. The division between the two children is set by default
    from the size requests of the children, but it can be adjusted by the
    user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a #GtkFrame with the shadow type set to [gid.gtk3.types.ShadowType.In]
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
    by the user, by calling [gid.gtk4.paned.Paned.setPosition].
    
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
class Paned : gid.gtk3.container.Container, gid.gtk3.orientable.Orientable
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
    return cast(void function())gtk_paned_get_type != &gidSymbolNotFound ? gtk_paned_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPaned";
  }

  /** Returns `this`, for use in `with` statements. */
  override Paned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.paned.Paned]
      Returns: New builder object
  */
  static PanedGidBuilder builder() nothrow
  {
    return new PanedGidBuilder;
  }

  /**
      Get `maxPosition` property.
      Returns: The largest possible value for the position property.
        This property is derived from the size and shrinkability
        of the widget's children.
  */
  @property int maxPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-position");
  }

  /**
      Get `minPosition` property.
      Returns: The smallest possible value for the position property.
        This property is derived from the size and shrinkability
        of the widget's children.
  */
  @property int minPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("min-position");
  }

  /** */
  @property int position() nothrow
  {
    return getPosition();
  }

  /** */
  @property void position(int propval) nothrow
  {
    setPosition(propval);
  }

  /** */
  @property bool positionSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("position-set");
  }

  /** */
  @property void positionSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("position-set", propval);
  }

  /**
      Get `wideHandle` property.
      Returns: Setting this property to true indicates that the paned needs
        to provide stronger visual separation (e.g. because it separates
        between two notebooks, whose tab rows would otherwise merge visually).
  */
  @property bool wideHandle() nothrow
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
  @property void wideHandle(bool propval) nothrow
  {
    setWideHandle(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkPaned widget.
  
      Params:
        orientation = the paned’s orientation.
      Returns: a new #GtkPaned.
  */
  this(gid.gtk3.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_paned_new(orientation);
      this(_cretval, No.Take);
    }
  }

  /** */
  protected bool vfuncAcceptPosition()
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.acceptPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.acceptPosition(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /** */
  protected bool vfuncCancelPosition()
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.cancelPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.cancelPosition(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /** */
  protected bool vfuncCycleChildFocus(bool reverse)
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.cycleChildFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.cycleChildFocus(cast(GtkPaned*)this._cPtr, reverse);
    return _retval;
  }

  /** */
  protected bool vfuncCycleHandleFocus(bool reverse)
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.cycleHandleFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.cycleHandleFocus(cast(GtkPaned*)this._cPtr, reverse);
    return _retval;
  }

  /** */
  protected bool vfuncMoveHandle(gid.gtk3.types.ScrollType scroll)
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.moveHandle)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.moveHandle(cast(GtkPaned*)this._cPtr, scroll);
    return _retval;
  }

  /** */
  protected bool vfuncToggleHandleFocus()
  {
    auto _klass = cast(GtkPanedClass*)_vfuncClass;
    if (!_klass.toggleHandleFocus)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.toggleHandleFocus(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Adds a child to the top or left pane with default parameters. This is
      equivalent to
      `gtk_paned_pack1 (paned, child, FALSE, TRUE)`.
  
      Params:
        child = the child to add
  */
  void add1(gid.gtk3.widget.Widget child) nothrow
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
  void add2(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_paned_add2(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Obtains the first child of the paned widget.
      Returns: first child, or null if it is not set.
  */
  gid.gtk3.widget.Widget getChild1() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_child1(cast(GtkPaned*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the second child of the paned widget.
      Returns: second child, or null if it is not set.
  */
  gid.gtk3.widget.Widget getChild2() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_child2(cast(GtkPaned*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkWindow of the handle. This function is
      useful when handling button or motion events because it
      enables the callback to distinguish between the window
      of the paned, a child and the handle.
      Returns: the paned’s handle window.
  */
  gid.gdk3.window.Window getHandleWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_paned_get_handle_window(cast(GtkPaned*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the divider between the two panes.
      Returns: position of the divider
  */
  int getPosition() nothrow
  {
    int _retval;
    _retval = gtk_paned_get_position(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GtkPaned:wide-handle property.
      Returns: true if the paned should have a wide handle
  */
  bool getWideHandle() nothrow
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
  void pack1(gid.gtk3.widget.Widget child, bool resize, bool shrink) nothrow
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
  void pack2(gid.gtk3.widget.Widget child, bool resize, bool shrink) nothrow
  {
    gtk_paned_pack2(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, resize, shrink);
  }

  /**
      Sets the position of the divider between the two panes.
  
      Params:
        position = pixel position of divider, a negative value means that the position
                     is unset.
  */
  void setPosition(int position) nothrow
  {
    gtk_paned_set_position(cast(GtkPaned*)this._cPtr, position);
  }

  /**
      Sets the #GtkPaned:wide-handle property.
  
      Params:
        wide = the new value for the #GtkPaned:wide-handle property
  */
  void setWideHandle(bool wide) nothrow
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
  
          `bool callback(gid.gtk3.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAcceptPosition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.acceptPosition");
      }

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
  
          `bool callback(gid.gtk3.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancelPosition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.cancelPosition");
      }

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
  
          `bool callback(bool reversed, gid.gtk3.paned.Paned paned)`
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCycleChildFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.cycleChildFocus");
      }

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
  
          `bool callback(bool reversed, gid.gtk3.paned.Paned paned)`
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCycleHandleFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.cycleHandleFocus");
      }

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
  
          `bool callback(gid.gtk3.types.ScrollType scrollType, gid.gtk3.paned.Paned paned)`
  
          `scrollType` a #GtkScrollType (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveHandle(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.moveHandle");
      }

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
  
          `bool callback(gid.gtk3.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleHandleFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.toggleHandleFocus");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-handle-focus", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Paned
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.paned.Paned), T.stringof ~ " is not derived from gid.gtk3.paned.Paned");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcceptPosition", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "accept_position");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCancelPosition", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "cancel_position");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCycleChildFocus", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "cycle_child_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCycleHandleFocus", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "cycle_handle_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveHandle", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "move_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleHandleFocus", true)[0]) == gid.gtk3.paned.Paned))
      _installVfunc(klass, "toggle_handle_focus");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkPanedClass*)klass;

    switch (vfunc)
    {
      case "accept_position":
      {
        static extern(C) gboolean _vfuncAcceptPositionTramp(GtkPaned* paned) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.acceptPosition)
              return (cast(typeof(&_vfuncAcceptPositionTramp))_klass.acceptPosition)(paned);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAcceptPosition();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncAcceptPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.acceptPosition = cast(typeof(_klass.acceptPosition))&_vfuncAcceptPositionTramp;
        break;
      }
      case "cancel_position":
      {
        static extern(C) gboolean _vfuncCancelPositionTramp(GtkPaned* paned) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.cancelPosition)
              return (cast(typeof(&_vfuncCancelPositionTramp))_klass.cancelPosition)(paned);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCancelPosition();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncCancelPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.cancelPosition = cast(typeof(_klass.cancelPosition))&_vfuncCancelPositionTramp;
        break;
      }
      case "cycle_child_focus":
      {
        static extern(C) gboolean _vfuncCycleChildFocusTramp(GtkPaned* paned, gboolean reverse) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.cycleChildFocus)
              return (cast(typeof(&_vfuncCycleChildFocusTramp))_klass.cycleChildFocus)(paned, reverse);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCycleChildFocus(cast(bool)reverse);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncCycleChildFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.cycleChildFocus = cast(typeof(_klass.cycleChildFocus))&_vfuncCycleChildFocusTramp;
        break;
      }
      case "cycle_handle_focus":
      {
        static extern(C) gboolean _vfuncCycleHandleFocusTramp(GtkPaned* paned, gboolean reverse) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.cycleHandleFocus)
              return (cast(typeof(&_vfuncCycleHandleFocusTramp))_klass.cycleHandleFocus)(paned, reverse);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCycleHandleFocus(cast(bool)reverse);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncCycleHandleFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.cycleHandleFocus = cast(typeof(_klass.cycleHandleFocus))&_vfuncCycleHandleFocusTramp;
        break;
      }
      case "move_handle":
      {
        static extern(C) gboolean _vfuncMoveHandleTramp(GtkPaned* paned, GtkScrollType scroll) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.moveHandle)
              return (cast(typeof(&_vfuncMoveHandleTramp))_klass.moveHandle)(paned, scroll);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMoveHandle(scroll);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncMoveHandle");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.moveHandle = cast(typeof(_klass.moveHandle))&_vfuncMoveHandleTramp;
        break;
      }
      case "toggle_handle_focus":
      {
        static extern(C) gboolean _vfuncToggleHandleFocusTramp(GtkPaned* paned) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.paned.Paned)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paned);
          if (!_obj)
          {
            auto _klass = cast(GtkPanedClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paned);
            if (_klass.toggleHandleFocus)
              return (cast(typeof(&_vfuncToggleHandleFocusTramp))_klass.toggleHandleFocus)(paned);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncToggleHandleFocus();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.paned.Paned.vfuncToggleHandleFocus");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.toggleHandleFocus = cast(typeof(_klass.toggleHandleFocus))&_vfuncToggleHandleFocusTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.paned.Paned]
class PanedGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /** */
  T position(int propval) nothrow
  {
    return setProperty("position", propval);
  }

  /** */
  T positionSet(bool propval) nothrow
  {
    return setProperty("position-set", propval);
  }

  /**
      Set `wideHandle` property.
      Params:
        propval = Setting this property to true indicates that the paned needs
          to provide stronger visual separation (e.g. because it separates
          between two notebooks, whose tab rows would otherwise merge visually).
      Returns: Builder instance for fluent chaining
  */
  T wideHandle(bool propval) nothrow
  {
    return setProperty("wide-handle", propval);
  }
}

/// Fluent builder for [gid.gtk3.paned.Paned]
final class PanedGidBuilder : PanedGidBuilderImpl!PanedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Paned build() nothrow
  {
    return new Paned(cast(void*)createGObject(Paned._getGType), Yes.Take);
  }
}
