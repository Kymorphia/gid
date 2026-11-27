/// Module for [Paned] class
module gid.gtk4.paned;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Arranges its children in two panes, horizontally or vertically.
    
    <picture>
      <source srcset="panes-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkPaned" src="panes.png">
    </picture>
    
    The division between the two panes is adjustable by the user
    by dragging a handle.
    
    Child widgets are added to the panes of the widget with
    [gid.gtk4.paned.Paned.setStartChild] and [gid.gtk4.paned.Paned.setEndChild].
    The division between the two children is set by default from the size
    requests of the children, but it can be adjusted by the user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a [gid.gtk4.frame.Frame] so that the gutter appears as a
    ridge. No separator is drawn if one of the children is missing.
    
    Each child has two options that can be set, "resize" and "shrink". If
    "resize" is true then, when the [gid.gtk4.paned.Paned] is resized, that child will
    expand or shrink along with the paned widget. If "shrink" is true, then
    that child can be made smaller than its requisition by the user.
    Setting "shrink" to false allows the application to set a minimum size.
    If "resize" is false for both children, then this is treated as if
    "resize" is true for both children.
    
    The application can set the position of the slider as if it were set
    by the user, by calling [gid.gtk4.paned.Paned.setPosition].
    
    # Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.paned.Paned.acceptPosition]
    - [gid.gtk4.paned.Paned.cancelPosition]
    - [gid.gtk4.paned.Paned.cycleChildFocus]
    - [gid.gtk4.paned.Paned.cycleHandleFocus]
    - [gid.gtk4.paned.Paned.moveHandle]
    - [gid.gtk4.paned.Paned.toggleHandleFocus]
    
    # CSS nodes
    
    ```
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ```
    
    [gid.gtk4.paned.Paned] has a main CSS node with name paned, and a subnode for
    the separator with name separator. The subnode gets a .wide style
    class when the paned is supposed to be wide.
    
    In horizontal orientation, the nodes are arranged based on the text
    direction, so in left-to-right mode, :first-child will select the
    leftmost child, while it will select the rightmost child in
    RTL layouts.
    
    ## Creating a paned widget with minimum sizes.
    
    ```c
    GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
    GtkWidget *frame1 = gtk_frame_new (NULL);
    GtkWidget *frame2 = gtk_frame_new (NULL);
    
    gtk_widget_set_size_request (hpaned, 200, -1);
    
    gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);
    gtk_paned_set_resize_start_child (GTK_PANED (hpaned), TRUE);
    gtk_paned_set_shrink_start_child (GTK_PANED (hpaned), FALSE);
    gtk_widget_set_size_request (frame1, 50, -1);
    
    gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);
    gtk_paned_set_resize_end_child (GTK_PANED (hpaned), FALSE);
    gtk_paned_set_shrink_end_child (GTK_PANED (hpaned), FALSE);
    gtk_widget_set_size_request (frame2, 50, -1);
    ```
*/
@gidGir("Paned")
class Paned : gid.gtk4.widget.Widget, gid.gtk4.accessible_range.AccessibleRange, gid.gtk4.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
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
      Get builder for [gid.gtk4.paned.Paned]
      Returns: New builder object
  */
  static PanedGidBuilder builder() nothrow
  {
    return new PanedGidBuilder;
  }

  /**
      Get `endChild` property.
      Returns: The second child.
  */
  @property gid.gtk4.widget.Widget endChild() nothrow
  {
    return getEndChild();
  }

  /**
      Set `endChild` property.
      Params:
        propval = The second child.
  */
  @property void endChild(gid.gtk4.widget.Widget propval) nothrow
  {
    setEndChild(propval);
  }

  /**
      Get `maxPosition` property.
      Returns: The largest possible value for the [gid.gtk4.paned.Paned.position]
        property.
        
        This property is derived from the size and shrinkability
        of the widget's children.
  */
  @property int maxPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-position");
  }

  /**
      Get `minPosition` property.
      Returns: The smallest possible value for the [gid.gtk4.paned.Paned.position]
        property.
        
        This property is derived from the size and shrinkability
        of the widget's children.
  */
  @property int minPosition() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("min-position");
  }

  /**
      Get `position` property.
      Returns: Position of the separator in pixels, from the left/top.
  */
  @property int position() nothrow
  {
    return getPosition();
  }

  /**
      Set `position` property.
      Params:
        propval = Position of the separator in pixels, from the left/top.
  */
  @property void position(int propval) nothrow
  {
    setPosition(propval);
  }

  /**
      Get `positionSet` property.
      Returns: Whether the [gid.gtk4.paned.Paned.position] property has been set.
  */
  @property bool positionSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("position-set");
  }

  /**
      Set `positionSet` property.
      Params:
        propval = Whether the [gid.gtk4.paned.Paned.position] property has been set.
  */
  @property void positionSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("position-set", propval);
  }

  /**
      Get `resizeEndChild` property.
      Returns: Determines whether the second child expands and shrinks
        along with the paned widget.
  */
  @property bool resizeEndChild() nothrow
  {
    return getResizeEndChild();
  }

  /**
      Set `resizeEndChild` property.
      Params:
        propval = Determines whether the second child expands and shrinks
          along with the paned widget.
  */
  @property void resizeEndChild(bool propval) nothrow
  {
    setResizeEndChild(propval);
  }

  /**
      Get `resizeStartChild` property.
      Returns: Determines whether the first child expands and shrinks
        along with the paned widget.
  */
  @property bool resizeStartChild() nothrow
  {
    return getResizeStartChild();
  }

  /**
      Set `resizeStartChild` property.
      Params:
        propval = Determines whether the first child expands and shrinks
          along with the paned widget.
  */
  @property void resizeStartChild(bool propval) nothrow
  {
    setResizeStartChild(propval);
  }

  /**
      Get `shrinkEndChild` property.
      Returns: Determines whether the second child can be made smaller
        than its requisition.
  */
  @property bool shrinkEndChild() nothrow
  {
    return getShrinkEndChild();
  }

  /**
      Set `shrinkEndChild` property.
      Params:
        propval = Determines whether the second child can be made smaller
          than its requisition.
  */
  @property void shrinkEndChild(bool propval) nothrow
  {
    setShrinkEndChild(propval);
  }

  /**
      Get `shrinkStartChild` property.
      Returns: Determines whether the first child can be made smaller
        than its requisition.
  */
  @property bool shrinkStartChild() nothrow
  {
    return getShrinkStartChild();
  }

  /**
      Set `shrinkStartChild` property.
      Params:
        propval = Determines whether the first child can be made smaller
          than its requisition.
  */
  @property void shrinkStartChild(bool propval) nothrow
  {
    setShrinkStartChild(propval);
  }

  /**
      Get `startChild` property.
      Returns: The first child.
  */
  @property gid.gtk4.widget.Widget startChild() nothrow
  {
    return getStartChild();
  }

  /**
      Set `startChild` property.
      Params:
        propval = The first child.
  */
  @property void startChild(gid.gtk4.widget.Widget propval) nothrow
  {
    setStartChild(propval);
  }

  /**
      Get `wideHandle` property.
      Returns: Whether the [gid.gtk4.paned.Paned] should provide a stronger visual separation.
        
        For example, this could be set when a paned contains two
        [gid.gtk4.notebook.Notebook]s, whose tab rows would otherwise merge visually.
  */
  @property bool wideHandle() nothrow
  {
    return getWideHandle();
  }

  /**
      Set `wideHandle` property.
      Params:
        propval = Whether the [gid.gtk4.paned.Paned] should provide a stronger visual separation.
          
          For example, this could be set when a paned contains two
          [gid.gtk4.notebook.Notebook]s, whose tab rows would otherwise merge visually.
  */
  @property void wideHandle(bool propval) nothrow
  {
    setWideHandle(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.paned.Paned] widget.
  
      Params:
        orientation = the paned’s orientation.
      Returns: the newly created paned widget
  */
  this(gid.gtk4.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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

  /**
      Retrieves the end child of the given [gid.gtk4.paned.Paned].
      Returns: the end child widget
  */
  gid.gtk4.widget.Widget getEndChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_end_child(cast(GtkPaned*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the divider between the two panes.
      Returns: the position of the divider, in pixels
  */
  int getPosition() nothrow
  {
    int _retval;
    _retval = gtk_paned_get_position(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.paned.Paned.endChild] can be resized.
      Returns: true if the end child is resizable
  */
  bool getResizeEndChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_resize_end_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.paned.Paned.startChild] can be resized.
      Returns: true if the start child is resizable
  */
  bool getResizeStartChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_resize_start_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.paned.Paned.endChild] can shrink.
      Returns: true if the end child is shrinkable
  */
  bool getShrinkEndChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_shrink_end_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the [gid.gtk4.paned.Paned.startChild] can shrink.
      Returns: true if the start child is shrinkable
  */
  bool getShrinkStartChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_shrink_start_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the start child of the given [gid.gtk4.paned.Paned].
      Returns: the start child widget
  */
  gid.gtk4.widget.Widget getStartChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_start_child(cast(GtkPaned*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the separator should be wide.
      Returns: true if the paned should have a wide handle
  */
  bool getWideHandle() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_wide_handle(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Sets the end child of paned to child.
      
      If child is `NULL`, the existing child will be removed.
  
      Params:
        child = the widget to add
  */
  void setEndChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_paned_set_end_child(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the position of the divider between the two panes.
  
      Params:
        position = pixel position of divider, a negative value means that the position
            is unset
  */
  void setPosition(int position) nothrow
  {
    gtk_paned_set_position(cast(GtkPaned*)this._cPtr, position);
  }

  /**
      Sets whether the [gid.gtk4.paned.Paned.endChild] can be resized.
  
      Params:
        resize = true to let the end child be resized
  */
  void setResizeEndChild(bool resize) nothrow
  {
    gtk_paned_set_resize_end_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the [gid.gtk4.paned.Paned.startChild] can be resized.
  
      Params:
        resize = true to let the start child be resized
  */
  void setResizeStartChild(bool resize) nothrow
  {
    gtk_paned_set_resize_start_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the [gid.gtk4.paned.Paned.endChild] can shrink.
  
      Params:
        resize = true to let the end child be shrunk
  */
  void setShrinkEndChild(bool resize) nothrow
  {
    gtk_paned_set_shrink_end_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the [gid.gtk4.paned.Paned.startChild] can shrink.
  
      Params:
        resize = true to let the start child be shrunk
  */
  void setShrinkStartChild(bool resize) nothrow
  {
    gtk_paned_set_shrink_start_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets the start child of paned to child.
      
      If child is `NULL`, the existing child will be removed.
  
      Params:
        child = the widget to add
  */
  void setStartChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_paned_set_start_child(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the separator should be wide.
  
      Params:
        wide = the new value for the [gid.gtk4.paned.Paned.wideHandle] property
  */
  void setWideHandle(bool wide) nothrow
  {
    gtk_paned_set_wide_handle(cast(GtkPaned*)this._cPtr, wide);
  }

  /**
      Connect to `AcceptPosition` signal.
  
      Emitted to accept the current position of the handle when
        moving it using key bindings.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Return</kbd> or
        <kbd>Space</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether the position was accepted
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAcceptPosition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.acceptPosition");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-position", closure, after);
  }

  /**
      Connect to `CancelPosition` signal.
  
      Emitted to cancel moving the position of the handle using key
        bindings.
        
        The position of the handle will be reset to the value prior to
        moving it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Escape</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether the position was canceled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancelPosition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.cancelPosition");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel-position", closure, after);
  }

  /**
      Connect to `CycleChildFocus` signal.
  
      Emitted to cycle the focus between the children of the paned.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding is <kbd>F6</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool reversed, gid.gtk4.paned.Paned paned)`
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether the behavior was cycled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCycleChildFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.cycleChildFocus");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-child-focus", closure, after);
  }

  /**
      Connect to `CycleHandleFocus` signal.
  
      Emitted to cycle whether the paned should grab focus to allow
        the user to change position of the handle by using key bindings.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>F8</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool reversed, gid.gtk4.paned.Paned paned)`
  
          `reversed` whether cycling backward or forward (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether the behavior was cycled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCycleHandleFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.cycleHandleFocus");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cycle-handle-focus", closure, after);
  }

  /**
      Connect to `MoveHandle` signal.
  
      Emitted to move the handle with key bindings.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are
        <kbd>Ctrl</kbd>+<kbd>←</kbd>, <kbd>←</kbd>,
        <kbd>Ctrl</kbd>+<kbd>→</kbd>, <kbd>→</kbd>,
        <kbd>Ctrl</kbd>+<kbd>↑</kbd>, <kbd>↑</kbd>,
        <kbd>Ctrl</kbd>+<kbd>↓</kbd>, <kbd>↓</kbd>,
        <kbd>PgUp</kbd>, <kbd>PgDn</kbd>, <kbd>Home</kbd>, <kbd>End</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.types.ScrollType scrollType, gid.gtk4.paned.Paned paned)`
  
          `scrollType` a [gid.gtk4.types.ScrollType] (optional)
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether the handle was moved
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveHandle(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.moveHandle");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-handle", closure, after);
  }

  /**
      Connect to `ToggleHandleFocus` signal.
  
      Emitted to accept the current position of the handle and then
        move focus to the next widget in the focus chain.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding is <kbd>Tab</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.paned.Paned paned)`
  
          `paned` the instance the signal is connected to (optional)
  
          `Returns` whether handle focus was toggled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleHandleFocus(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.paned.Paned)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.paned.Paned.toggleHandleFocus");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-handle-focus", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.paned.Paned]
class PanedGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_range.AccessibleRangeGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin AccessibleRangeGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /**
      Set `endChild` property.
      Params:
        propval = The second child.
      Returns: Builder instance for fluent chaining
  */
  T endChild(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("end-child", propval);
  }

  /**
      Set `position` property.
      Params:
        propval = Position of the separator in pixels, from the left/top.
      Returns: Builder instance for fluent chaining
  */
  T position(int propval) nothrow
  {
    return setProperty("position", propval);
  }

  /**
      Set `positionSet` property.
      Params:
        propval = Whether the [gid.gtk4.paned.Paned.position] property has been set.
      Returns: Builder instance for fluent chaining
  */
  T positionSet(bool propval) nothrow
  {
    return setProperty("position-set", propval);
  }

  /**
      Set `resizeEndChild` property.
      Params:
        propval = Determines whether the second child expands and shrinks
          along with the paned widget.
      Returns: Builder instance for fluent chaining
  */
  T resizeEndChild(bool propval) nothrow
  {
    return setProperty("resize-end-child", propval);
  }

  /**
      Set `resizeStartChild` property.
      Params:
        propval = Determines whether the first child expands and shrinks
          along with the paned widget.
      Returns: Builder instance for fluent chaining
  */
  T resizeStartChild(bool propval) nothrow
  {
    return setProperty("resize-start-child", propval);
  }

  /**
      Set `shrinkEndChild` property.
      Params:
        propval = Determines whether the second child can be made smaller
          than its requisition.
      Returns: Builder instance for fluent chaining
  */
  T shrinkEndChild(bool propval) nothrow
  {
    return setProperty("shrink-end-child", propval);
  }

  /**
      Set `shrinkStartChild` property.
      Params:
        propval = Determines whether the first child can be made smaller
          than its requisition.
      Returns: Builder instance for fluent chaining
  */
  T shrinkStartChild(bool propval) nothrow
  {
    return setProperty("shrink-start-child", propval);
  }

  /**
      Set `startChild` property.
      Params:
        propval = The first child.
      Returns: Builder instance for fluent chaining
  */
  T startChild(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("start-child", propval);
  }

  /**
      Set `wideHandle` property.
      Params:
        propval = Whether the [gid.gtk4.paned.Paned] should provide a stronger visual separation.
          
          For example, this could be set when a paned contains two
          [gid.gtk4.notebook.Notebook]s, whose tab rows would otherwise merge visually.
      Returns: Builder instance for fluent chaining
  */
  T wideHandle(bool propval) nothrow
  {
    return setProperty("wide-handle", propval);
  }
}

/// Fluent builder for [gid.gtk4.paned.Paned]
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
