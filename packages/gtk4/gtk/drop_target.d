/// Module for [DropTarget] class
module gtk.drop_target;

import gdk.content_formats;
import gdk.drop;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.drop_target.DropTarget] is an event controller to receive Drag-and-Drop operations.
    
    The most basic way to use a [gtk.drop_target.DropTarget] to receive drops on a
    widget is to create it via [gtk.drop_target.DropTarget.new_], passing in the
    [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] of the data you want to receive and connect to the
    [gtk.drop_target.DropTarget.drop] signal to receive the data:
    
    ```c
    static gboolean
    on_drop (GtkDropTarget *target,
             const GValue  *value,
             double         x,
             double         y,
             gpointer       data)
    {
      MyWidget *self = data;
    
      // Call the appropriate setter depending on the type of data
      // that we received
      if (G_VALUE_HOLDS (value, G_TYPE_FILE))
        my_widget_set_file (self, g_value_get_object (value));
      else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
        my_widget_set_pixbuf (self, g_value_get_object (value));
      else
        return FALSE;
    
      return TRUE;
    }
    
    static void
    my_widget_init (MyWidget *self)
    {
      GtkDropTarget *target =
        gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
    
      // This widget accepts two types of drop types: GFile objects
      // and GdkPixbuf objects
      gtk_drop_target_set_gtypes (target, (GType [2]) {
        G_TYPE_FILE,
        GDK_TYPE_PIXBUF,
      }, 2);
    
      g_signal_connect (target, "drop", G_CALLBACK (on_drop), self);
      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
    }
    ```
    
    [gtk.drop_target.DropTarget] supports more options, such as:
    
     $(LIST
        * rejecting potential drops via the [gtk.drop_target.DropTarget.accept] signal
          and the [gtk.drop_target.DropTarget.reject] function to let other drop
          targets handle the drop
        * tracking an ongoing drag operation before the drop via the
          [gtk.drop_target.DropTarget.enter], [gtk.drop_target.DropTarget.motion] and
          [gtk.drop_target.DropTarget.leave] signals
        * configuring how to receive data by setting the
          [gtk.drop_target.DropTarget.preload] property and listening for its
          availability via the [gtk.drop_target.DropTarget.value] property
     )
       
    However, [gtk.drop_target.DropTarget] is ultimately modeled in a synchronous way
    and only supports data transferred via [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]. If you want full control
    over an ongoing drop, the [gtk.drop_target_async.DropTargetAsync] object gives you
    this ability.
    
    While a pointer is dragged over the drop target's widget and the drop
    has not been rejected, that widget will receive the
    [gtk.types.StateFlags.DropActive] state, which can be used to style the widget.
    
    If you are not interested in receiving the drop, but just want to update
    UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
    use [gtk.drop_controller_motion.DropControllerMotion].
*/
class DropTarget : gtk.event_controller.EventController
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
    return cast(void function())gtk_drop_target_get_type != &gidSymbolNotFound ? gtk_drop_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DropTarget self()
  {
    return this;
  }

  /**
      Get `actions` property.
      Returns: The `GdkDragActions` that this drop target supports.
  */
  @property gdk.types.DragAction actions()
  {
    return getActions();
  }

  /**
      Set `actions` property.
      Params:
        propval = The `GdkDragActions` that this drop target supports.
  */
  @property void actions(gdk.types.DragAction propval)
  {
    return setActions(propval);
  }

  /**
      Get `currentDrop` property.
      Returns: The [gdk.drop.Drop] that is currently being performed.
  */
  @property gdk.drop.Drop currentDrop()
  {
    return getCurrentDrop();
  }

  /**
      Get `preload` property.
      Returns: Whether the drop data should be preloaded when the pointer is only
      hovering over the widget but has not been released.
      
      Setting this property allows finer grained reaction to an ongoing
      drop at the cost of loading more data.
      
      The default value for this property is false to avoid downloading
      huge amounts of data by accident.
      
      For example, if somebody drags a full document of gigabytes of text
      from a text editor across a widget with a preloading drop target,
      this data will be downloaded, even if the data is ultimately dropped
      elsewhere.
      
      For a lot of data formats, the amount of data is very small (like
      `GDK_TYPE_RGBA`), so enabling this property does not hurt at all.
      And for local-only Drag-and-Drop operations, no data transfer is done,
      so enabling it there is free.
  */
  @property bool preload()
  {
    return getPreload();
  }

  /**
      Set `preload` property.
      Params:
        propval = Whether the drop data should be preloaded when the pointer is only
        hovering over the widget but has not been released.
        
        Setting this property allows finer grained reaction to an ongoing
        drop at the cost of loading more data.
        
        The default value for this property is false to avoid downloading
        huge amounts of data by accident.
        
        For example, if somebody drags a full document of gigabytes of text
        from a text editor across a widget with a preloading drop target,
        this data will be downloaded, even if the data is ultimately dropped
        elsewhere.
        
        For a lot of data formats, the amount of data is very small (like
        `GDK_TYPE_RGBA`), so enabling this property does not hurt at all.
        And for local-only Drag-and-Drop operations, no data transfer is done,
        so enabling it there is free.
  */
  @property void preload(bool propval)
  {
    return setPreload(propval);
  }

  /**
      Get `value` property.
      Returns: The value for this drop operation.
      
      This is null if the data has not been loaded yet or no drop
      operation is going on.
      
      Data may be available before the [gtk.drop_target.DropTarget.drop]
      signal gets emitted - for example when the [gtk.drop_target.DropTarget.preload]
      property is set. You can use the ::notify signal to be notified
      of available data.
  */
  @property gobject.value.Value value()
  {
    return getValue();
  }

  /**
      Creates a new [gtk.drop_target.DropTarget] object.
      
      If the drop target should support more than 1 type, pass
      `G_TYPE_INVALID` for type and then call
      [gtk.drop_target.DropTarget.setGtypes].
  
      Params:
        type = The supported type or `G_TYPE_INVALID`
        actions = the supported actions
      Returns: the new [gtk.drop_target.DropTarget]
  */
  this(gobject.types.GType type, gdk.types.DragAction actions)
  {
    GtkDropTarget* _cretval;
    _cretval = gtk_drop_target_new(type, actions);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the actions that this drop target supports.
      Returns: the actions that this drop target supports
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gtk_drop_target_get_actions(cast(GtkDropTarget*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets the currently handled drop operation.
      
      If no drop operation is going on, null is returned.
      Returns: The current drop
  */
  gdk.drop.Drop getCurrentDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_target_get_current_drop(cast(GtkDropTarget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently handled drop operation.
      
      If no drop operation is going on, null is returned.
      Returns: The current drop
  
      Deprecated: Use [gtk.drop_target.DropTarget.getCurrentDrop] instead
  */
  gdk.drop.Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_target_get_drop(cast(GtkDropTarget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the data formats that this drop target accepts.
      
      If the result is null, all formats are expected to be supported.
      Returns: the supported data formats
  */
  gdk.content_formats.ContentFormats getFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gtk_drop_target_get_formats(cast(GtkDropTarget*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s that can be dropped on the target.
      
      If no types have been set, `NULL` will be returned.
      Returns: the `G_TYPE_INVALID`-terminated array of types included in
          formats
  */
  gobject.types.GType[] getGtypes()
  {
    const(GType)* _cretval;
    size_t _cretlength;
    _cretval = gtk_drop_target_get_gtypes(cast(GtkDropTarget*)this._cPtr, &_cretlength);
    gobject.types.GType[] _retval;

    if (_cretval)
    {
      _retval = cast(gobject.types.GType[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Gets whether data should be preloaded on hover.
      Returns: true if drop data should be preloaded
  */
  bool getPreload()
  {
    bool _retval;
    _retval = cast(bool)gtk_drop_target_get_preload(cast(GtkDropTarget*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current drop data, as a [gobject.value.Value].
      Returns: The current drop data
  */
  gobject.value.Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gtk_drop_target_get_value(cast(GtkDropTarget*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Rejects the ongoing drop operation.
      
      If no drop operation is ongoing, i.e when `propertyGtk.DropTarget:current-drop`
      is null, this function does nothing.
      
      This function should be used when delaying the decision
      on whether to accept a drag or not until after reading
      the data.
  */
  void reject()
  {
    gtk_drop_target_reject(cast(GtkDropTarget*)this._cPtr);
  }

  /**
      Sets the actions that this drop target supports.
  
      Params:
        actions = the supported actions
  */
  void setActions(gdk.types.DragAction actions)
  {
    gtk_drop_target_set_actions(cast(GtkDropTarget*)this._cPtr, actions);
  }

  /**
      Sets the supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s for this drop target.
  
      Params:
        types = all supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s
            that can be dropped on the target
  */
  void setGtypes(gobject.types.GType[] types = null)
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = cast(GType*)types.ptr;
    gtk_drop_target_set_gtypes(cast(GtkDropTarget*)this._cPtr, _types, _nTypes);
  }

  /**
      Sets whether data should be preloaded on hover.
  
      Params:
        preload = true to preload drop data
  */
  void setPreload(bool preload)
  {
    gtk_drop_target_set_preload(cast(GtkDropTarget*)this._cPtr, preload);
  }

  /**
      Connect to `Accept` signal.
  
      Emitted on the drop site when a drop operation is about to begin.
      
      If the drop is not accepted, false will be returned and the drop target
      will ignore the drop. If true is returned, the drop is accepted for now
      but may be rejected later via a call to [gtk.drop_target.DropTarget.reject]
      or ultimately by returning false from a [gtk.drop_target.DropTarget.drop]
      handler.
      
      The default handler for this signal decides whether to accept the drop
      based on the formats provided by the drop.
      
      If the decision whether the drop will be accepted or rejected depends
      on the data, this function should return true, the
      [gtk.drop_target.DropTarget.preload] property should be set and the value
      should be inspected via the ::notify:value signal, calling
      [gtk.drop_target.DropTarget.reject] if required.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.drop.Drop drop, gtk.drop_target.DropTarget dropTarget))
  
          `drop` the [gdk.drop.Drop] (optional)
  
          `dropTarget` the instance the signal is connected to (optional)
  
          `Returns` true if drop is accepted
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAccept(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drop.Drop)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.drop_target.DropTarget)))
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
    return connectSignalClosure("accept", closure, after);
  }

  /**
      Connect to `Drop` signal.
  
      Emitted on the drop site when the user drops the data onto the widget.
      
      The signal handler must determine whether the pointer position is in
      a drop zone or not. If it is not in a drop zone, it returns false
      and no further processing is necessary.
      
      Otherwise, the handler returns true. In this case, this handler will
      accept the drop. The handler is responsible for using the given value
      and performing the drop operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gobject.value.Value value, double x, double y, gtk.drop_target.DropTarget dropTarget))
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `x` the x coordinate of the current pointer position (optional)
  
          `y` the y coordinate of the current pointer position (optional)
  
          `dropTarget` the instance the signal is connected to (optional)
  
          `Returns` whether the drop was accepted at the given pointer position
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDrop(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gobject.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.drop_target.DropTarget)))
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
    return connectSignalClosure("drop", closure, after);
  }

  /**
      Connect to `Enter` signal.
  
      Emitted on the drop site when the pointer enters the widget.
      
      It can be used to set up custom highlighting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.types.DragAction callback(double x, double y, gtk.drop_target.DropTarget dropTarget))
  
          `x` the x coordinate of the current pointer position (optional)
  
          `y` the y coordinate of the current pointer position (optional)
  
          `dropTarget` the instance the signal is connected to (optional)
  
          `Returns` Preferred action for this drag operation or 0 if
            dropping is not supported at the current `x`,`y` location.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drop_target.DropTarget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Emitted on the drop site when the pointer leaves the widget.
      
      Its main purpose it to undo things done in
      [gtk.drop_target.DropTarget.enter].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.drop_target.DropTarget dropTarget))
  
          `dropTarget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.drop_target.DropTarget)))
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
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      Emitted while the pointer is moving over the drop target.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.types.DragAction callback(double x, double y, gtk.drop_target.DropTarget dropTarget))
  
          `x` the x coordinate of the current pointer position (optional)
  
          `y` the y coordinate of the current pointer position (optional)
  
          `dropTarget` the instance the signal is connected to (optional)
  
          `Returns` Preferred action for this drag operation or 0 if
            dropping is not supported at the current `x`,`y` location.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drop_target.DropTarget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}
