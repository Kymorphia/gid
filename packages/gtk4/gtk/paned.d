/// Module for [Paned] class
module gtk.paned;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    A widget with two panes, arranged either horizontally or vertically.
    
    ![An example GtkPaned](panes.png)
    
    The division between the two panes is adjustable by the user
    by dragging a handle.
    
    Child widgets are added to the panes of the widget with
    [gtk.paned.Paned.setStartChild] and [gtk.paned.Paned.setEndChild].
    The division between the two children is set by default from the size
    requests of the children, but it can be adjusted by the user.
    
    A paned widget draws a separator between the two child widgets and a
    small handle that the user can drag to adjust the division. It does not
    draw any relief around the children or around the separator. (The space
    in which the separator is called the gutter.) Often, it is useful to put
    each child inside a [gtk.frame.Frame] so that the gutter appears as a
    ridge. No separator is drawn if one of the children is missing.
    
    Each child has two options that can be set, "resize" and "shrink". If
    "resize" is true then, when the [gtk.paned.Paned] is resized, that child will
    expand or shrink along with the paned widget. If "shrink" is true, then
    that child can be made smaller than its requisition by the user.
    Setting "shrink" to false allows the application to set a minimum size.
    If "resize" is false for both children, then this is treated as if
    "resize" is true for both children.
    
    The application can set the position of the slider as if it were set
    by the user, by calling [gtk.paned.Paned.setPosition].
    
    # CSS nodes
    
    ```
    paned
    ├── <child>
    ├── separator[.wide]
    ╰── <child>
    ```
    
    [gtk.paned.Paned] has a main CSS node with name paned, and a subnode for
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
class Paned : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
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
      Get `endChild` property.
      Returns: The second child.
  */
  @property gtk.widget.Widget endChild()
  {
    return getEndChild();
  }

  /**
      Set `endChild` property.
      Params:
        propval = The second child.
  */
  @property void endChild(gtk.widget.Widget propval)
  {
    return setEndChild(propval);
  }

  /**
      Get `maxPosition` property.
      Returns: The largest possible value for the [gtk.paned.Paned.position]
      property.
      
      This property is derived from the size and shrinkability
      of the widget's children.
  */
  @property int maxPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-position");
  }

  /**
      Get `minPosition` property.
      Returns: The smallest possible value for the [gtk.paned.Paned.position]
      property.
      
      This property is derived from the size and shrinkability
      of the widget's children.
  */
  @property int minPosition()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("min-position");
  }

  /**
      Get `position` property.
      Returns: Position of the separator in pixels, from the left/top.
  */
  @property int position()
  {
    return getPosition();
  }

  /**
      Set `position` property.
      Params:
        propval = Position of the separator in pixels, from the left/top.
  */
  @property void position(int propval)
  {
    return setPosition(propval);
  }

  /**
      Get `positionSet` property.
      Returns: Whether the [gtk.paned.Paned.position] property has been set.
  */
  @property bool positionSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("position-set");
  }

  /**
      Set `positionSet` property.
      Params:
        propval = Whether the [gtk.paned.Paned.position] property has been set.
  */
  @property void positionSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("position-set", propval);
  }

  /**
      Get `resizeEndChild` property.
      Returns: Determines whether the second child expands and shrinks
      along with the paned widget.
  */
  @property bool resizeEndChild()
  {
    return getResizeEndChild();
  }

  /**
      Set `resizeEndChild` property.
      Params:
        propval = Determines whether the second child expands and shrinks
        along with the paned widget.
  */
  @property void resizeEndChild(bool propval)
  {
    return setResizeEndChild(propval);
  }

  /**
      Get `resizeStartChild` property.
      Returns: Determines whether the first child expands and shrinks
      along with the paned widget.
  */
  @property bool resizeStartChild()
  {
    return getResizeStartChild();
  }

  /**
      Set `resizeStartChild` property.
      Params:
        propval = Determines whether the first child expands and shrinks
        along with the paned widget.
  */
  @property void resizeStartChild(bool propval)
  {
    return setResizeStartChild(propval);
  }

  /**
      Get `shrinkEndChild` property.
      Returns: Determines whether the second child can be made smaller
      than its requisition.
  */
  @property bool shrinkEndChild()
  {
    return getShrinkEndChild();
  }

  /**
      Set `shrinkEndChild` property.
      Params:
        propval = Determines whether the second child can be made smaller
        than its requisition.
  */
  @property void shrinkEndChild(bool propval)
  {
    return setShrinkEndChild(propval);
  }

  /**
      Get `shrinkStartChild` property.
      Returns: Determines whether the first child can be made smaller
      than its requisition.
  */
  @property bool shrinkStartChild()
  {
    return getShrinkStartChild();
  }

  /**
      Set `shrinkStartChild` property.
      Params:
        propval = Determines whether the first child can be made smaller
        than its requisition.
  */
  @property void shrinkStartChild(bool propval)
  {
    return setShrinkStartChild(propval);
  }

  /**
      Get `startChild` property.
      Returns: The first child.
  */
  @property gtk.widget.Widget startChild()
  {
    return getStartChild();
  }

  /**
      Set `startChild` property.
      Params:
        propval = The first child.
  */
  @property void startChild(gtk.widget.Widget propval)
  {
    return setStartChild(propval);
  }

  /**
      Get `wideHandle` property.
      Returns: Whether the [gtk.paned.Paned] should provide a stronger visual separation.
      
      For example, this could be set when a paned contains two
      [gtk.notebook.Notebook]s, whose tab rows would otherwise merge visually.
  */
  @property bool wideHandle()
  {
    return getWideHandle();
  }

  /**
      Set `wideHandle` property.
      Params:
        propval = Whether the [gtk.paned.Paned] should provide a stronger visual separation.
        
        For example, this could be set when a paned contains two
        [gtk.notebook.Notebook]s, whose tab rows would otherwise merge visually.
  */
  @property void wideHandle(bool propval)
  {
    return setWideHandle(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new [gtk.paned.Paned] widget.
  
      Params:
        orientation = the paned’s orientation.
      Returns: the newly created paned widget
  */
  this(gtk.types.Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_new(orientation);
    this(_cretval, No.Take);
  }

  /**
      Retrieves the end child of the given [gtk.paned.Paned].
      Returns: the end child widget
  */
  gtk.widget.Widget getEndChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_end_child(cast(GtkPaned*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the divider between the two panes.
      Returns: the position of the divider, in pixels
  */
  int getPosition()
  {
    int _retval;
    _retval = gtk_paned_get_position(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the `propertyGtk.Paned:end-child` can be resized.
      Returns: true if the end child is resizable
  */
  bool getResizeEndChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_resize_end_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the `propertyGtk.Paned:start-child` can be resized.
      Returns: true if the start child is resizable
  */
  bool getResizeStartChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_resize_start_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the `propertyGtk.Paned:end-child` can shrink.
      Returns: true if the end child is shrinkable
  */
  bool getShrinkEndChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_shrink_end_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the `propertyGtk.Paned:start-child` can shrink.
      Returns: true if the start child is shrinkable
  */
  bool getShrinkStartChild()
  {
    bool _retval;
    _retval = cast(bool)gtk_paned_get_shrink_start_child(cast(GtkPaned*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the start child of the given [gtk.paned.Paned].
      Returns: the start child widget
  */
  gtk.widget.Widget getStartChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_paned_get_start_child(cast(GtkPaned*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the separator should be wide.
      Returns: true if the paned should have a wide handle
  */
  bool getWideHandle()
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
  void setEndChild(gtk.widget.Widget child = null)
  {
    gtk_paned_set_end_child(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the position of the divider between the two panes.
  
      Params:
        position = pixel position of divider, a negative value means that the position
            is unset
  */
  void setPosition(int position)
  {
    gtk_paned_set_position(cast(GtkPaned*)this._cPtr, position);
  }

  /**
      Sets whether the `propertyGtk.Paned:end-child` can be resized.
  
      Params:
        resize = true to let the end child be resized
  */
  void setResizeEndChild(bool resize)
  {
    gtk_paned_set_resize_end_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the `propertyGtk.Paned:start-child` can be resized.
  
      Params:
        resize = true to let the start child be resized
  */
  void setResizeStartChild(bool resize)
  {
    gtk_paned_set_resize_start_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the `propertyGtk.Paned:end-child` can shrink.
  
      Params:
        resize = true to let the end child be shrunk
  */
  void setShrinkEndChild(bool resize)
  {
    gtk_paned_set_shrink_end_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets whether the `propertyGtk.Paned:start-child` can shrink.
  
      Params:
        resize = true to let the start child be shrunk
  */
  void setShrinkStartChild(bool resize)
  {
    gtk_paned_set_shrink_start_child(cast(GtkPaned*)this._cPtr, resize);
  }

  /**
      Sets the start child of paned to child.
      
      If child is `NULL`, the existing child will be removed.
  
      Params:
        child = the widget to add
  */
  void setStartChild(gtk.widget.Widget child = null)
  {
    gtk_paned_set_start_child(cast(GtkPaned*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the separator should be wide.
  
      Params:
        wide = the new value for the `propertyGtk.Paned:wide-handle` property
  */
  void setWideHandle(bool wide)
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
  
      Emitted to cancel moving the position of the handle using key
      bindings.
      
      The position of the handle will be reset to the value prior to
      moving it.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default binding for this signal is <kbd>Escape</kbd>.
  
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
  
      Emitted to cycle the focus between the children of the paned.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default binding is <kbd>F6</kbd>.
  
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
  
      Emitted to cycle whether the paned should grab focus to allow
      the user to change position of the handle by using key bindings.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default binding for this signal is <kbd>F8</kbd>.
  
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
  
      Emitted to move the handle with key bindings.
      
      This is a [keybinding signal](class.SignalAction.html).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.ScrollType scrollType, gtk.paned.Paned paned))
  
          `scrollType` a [gtk.types.ScrollType] (optional)
  
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
  
      Emitted to accept the current position of the handle and then
      move focus to the next widget in the focus chain.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default binding is <kbd>Tab</kbd>.
  
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
