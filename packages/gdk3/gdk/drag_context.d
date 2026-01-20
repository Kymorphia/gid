/// Module for [DragContext] class
module gdk.drag_context;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/** */
class DragContext : gobject.object.ObjectWrap
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
    return cast(void function())gdk_drag_context_get_type != &gidSymbolNotFound ? gdk_drag_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DragContext self()
  {
    return this;
  }

  /**
      Determines the bitmask of actions proposed by the source if
      [gdk.drag_context.DragContext.getSuggestedAction] returns [gdk.types.DragAction.Ask].
      Returns: the #GdkDragAction flags
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_actions(cast(GdkDragContext*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the destination window for the DND operation.
      Returns: a #GdkWindow
  */
  gdk.window.Window getDestWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_dest_window(cast(GdkDragContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GdkDevice associated to the drag context.
      Returns: The #GdkDevice associated to context.
  */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_drag_context_get_device(cast(GdkDragContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the window on which the drag icon should be rendered
      during the drag operation. Note that the window may not be
      available until the drag operation has begun. GDK will move
      the window in accordance with the ongoing drag operation.
      The window is owned by context and will be destroyed when
      the drag operation is over.
      Returns: the drag window, or null
  */
  gdk.window.Window getDragWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_drag_window(cast(GdkDragContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the drag protocol that is used by this context.
      Returns: the drag protocol
  */
  gdk.types.DragProtocol getProtocol()
  {
    GdkDragProtocol _cretval;
    _cretval = gdk_drag_context_get_protocol(cast(GdkDragContext*)this._cPtr);
    gdk.types.DragProtocol _retval = cast(gdk.types.DragProtocol)_cretval;
    return _retval;
  }

  /**
      Determines the action chosen by the drag destination.
      Returns: a #GdkDragAction value
  */
  gdk.types.DragAction getSelectedAction()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_selected_action(cast(GdkDragContext*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the #GdkWindow where the DND operation started.
      Returns: a #GdkWindow
  */
  gdk.window.Window getSourceWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_source_window(cast(GdkDragContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the suggested drag action of the context.
      Returns: a #GdkDragAction value
  */
  gdk.types.DragAction getSuggestedAction()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_suggested_action(cast(GdkDragContext*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Requests the drag and drop operation to be managed by context.
      When a drag and drop operation becomes managed, the #GdkDragContext
      will internally handle all input and source-side #GdkEventDND events
      as required by the windowing system.
      
      Once the drag and drop operation is managed, the drag context will
      emit the following signals:
      $(LIST
        * The #GdkDragContext::action-changed signal whenever the final action
          to be performed by the drag and drop operation changes.
        * The #GdkDragContext::drop-performed signal after the user performs
          the drag and drop gesture (typically by releasing the mouse button).
        * The #GdkDragContext::dnd-finished signal after the drag and drop
          operation concludes (after all #GdkSelection transfers happen).
        * The #GdkDragContext::cancel signal if the drag and drop operation is
          finished but doesn't happen over an accepting destination, or is
          cancelled through other means.
      )
  
      Params:
        ipcWindow = Window to use for IPC messaging/events
        actions = the actions supported by the drag source
      Returns: #TRUE if the drag and drop operation is managed.
  */
  bool manageDnd(gdk.window.Window ipcWindow, gdk.types.DragAction actions)
  {
    bool _retval;
    _retval = cast(bool)gdk_drag_context_manage_dnd(cast(GdkDragContext*)this._cPtr, ipcWindow ? cast(GdkWindow*)ipcWindow._cPtr(No.Dup) : null, actions);
    return _retval;
  }

  /**
      Associates a #GdkDevice to context, so all Drag and Drop events
      for context are emitted as if they came from this device.
  
      Params:
        device = a #GdkDevice
  */
  void setDevice(gdk.device.Device device)
  {
    gdk_drag_context_set_device(cast(GdkDragContext*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      Sets the position of the drag window that will be kept
      under the cursor hotspot. Initially, the hotspot is at the
      top left corner of the drag window.
  
      Params:
        hotX = x coordinate of the drag window hotspot
        hotY = y coordinate of the drag window hotspot
  */
  void setHotspot(int hotX, int hotY)
  {
    gdk_drag_context_set_hotspot(cast(GdkDragContext*)this._cPtr, hotX, hotY);
  }

  /**
      Connect to `ActionChanged` signal.
  
      A new action is being chosen for the drag and drop operation.
        
        This signal will only be emitted if the #GdkDragContext manages
        the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
        for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.types.DragAction action, gdk.drag_context.DragContext dragContext))
  
          `action` The action currently chosen (optional)
  
          `dragContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.types.DragAction)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag_context.DragContext)))
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
    return connectSignalClosure("action-changed", closure, after);
  }

  /**
      Connect to `Cancel` signal.
  
      The drag and drop operation was cancelled.
        
        This signal will only be emitted if the #GdkDragContext manages
        the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
        for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.types.DragCancelReason reason, gdk.drag_context.DragContext dragContext))
  
          `reason` The reason the context was cancelled (optional)
  
          `dragContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.types.DragCancelReason)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag_context.DragContext)))
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
    return connectSignalClosure("cancel", closure, after);
  }

  /**
      Connect to `DndFinished` signal.
  
      The drag and drop operation was finished, the drag destination
        finished reading all data. The drag source can now free all
        miscellaneous data.
        
        This signal will only be emitted if the #GdkDragContext manages
        the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
        for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_context.DragContext dragContext))
  
          `dragContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDndFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag_context.DragContext)))
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
    return connectSignalClosure("dnd-finished", closure, after);
  }

  /**
      Connect to `DropPerformed` signal.
  
      The drag and drop operation was performed on an accepting client.
        
        This signal will only be emitted if the #GdkDragContext manages
        the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
        for more information.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int time, gdk.drag_context.DragContext dragContext))
  
          `time` the time at which the drop happened. (optional)
  
          `dragContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDropPerformed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag_context.DragContext)))
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
    return connectSignalClosure("drop-performed", closure, after);
  }
}
