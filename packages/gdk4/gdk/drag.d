/// Module for [Drag] class
module gdk.drag;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.content_provider;
import gdk.device;
import gdk.display;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The [gdk.drag.Drag] object represents the source of an ongoing DND operation.
    
    A [gdk.drag.Drag] is created when a drag is started, and stays alive for duration of
    the DND operation. After a drag has been started with [gdk.drag.Drag.begin],
    the caller gets informed about the status of the ongoing drag operation
    with signals on the [gdk.drag.Drag] object.
    
    GTK provides a higher level abstraction based on top of these functions,
    and so they are not normally needed in GTK applications. See the
    "Drag and Drop" section of the GTK documentation for more information.
*/
class Drag : gobject.object.ObjectWrap
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
    return cast(void function())gdk_drag_get_type != &gidSymbolNotFound ? gdk_drag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Drag self()
  {
    return this;
  }

  /**
      Get `actions` property.
      Returns: The possible actions of this drag.
  */
  @property gdk.types.DragAction actions()
  {
    return getActions();
  }

  /**
      Set `actions` property.
      Params:
        propval = The possible actions of this drag.
  */
  @property void actions(gdk.types.DragAction propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.types.DragAction)("actions", propval);
  }

  /**
      Get `display` property.
      Returns: The [gdk.display.Display] that the drag belongs to.
  */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /**
      Get `selectedAction` property.
      Returns: The currently selected action of the drag.
  */
  @property gdk.types.DragAction selectedAction()
  {
    return getSelectedAction();
  }

  /**
      Set `selectedAction` property.
      Params:
        propval = The currently selected action of the drag.
  */
  @property void selectedAction(gdk.types.DragAction propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.types.DragAction)("selected-action", propval);
  }

  /**
      Starts a drag and creates a new drag context for it.
      
      This function is called by the drag source. After this call, you
      probably want to set up the drag icon using the surface returned
      by [gdk.drag.Drag.getDragSurface].
      
      This function returns a reference to the [gdk.drag.Drag] object,
      but GTK keeps its own reference as well, as long as the DND operation
      is going on.
      
      Note: if actions include [gdk.types.DragAction.Move], you need to listen for
      the `signalGdk.Drag::dnd-finished` signal and delete the data at
      the source if [gdk.drag.Drag.getSelectedAction] returns
      [gdk.types.DragAction.Move].
  
      Params:
        surface = the source surface for this drag
        device = the device that controls this drag
        content = the offered content
        actions = the actions supported by this drag
        dx = the x offset to device's position where the drag nominally started
        dy = the y offset to device's position where the drag nominally started
      Returns: a newly created [gdk.drag.Drag]
  */
  static gdk.drag.Drag begin(gdk.surface.Surface surface, gdk.device.Device device, gdk.content_provider.ContentProvider content, gdk.types.DragAction actions, double dx, double dy)
  {
    GdkDrag* _cretval;
    _cretval = gdk_drag_begin(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, content ? cast(GdkContentProvider*)content._cPtr(No.Dup) : null, actions, dx, dy);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drag.Drag)(cast(GdkDrag*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Informs GDK that the drop ended.
      
      Passing false for success may trigger a drag cancellation
      animation.
      
      This function is called by the drag source, and should be the
      last call before dropping the reference to the drag.
      
      The [gdk.drag.Drag] will only take the first [gdk.drag.Drag.dropDone]
      call as effective, if this function is called multiple times,
      all subsequent calls will be ignored.
  
      Params:
        success = whether the drag was ultimatively successful
  */
  void dropDone(bool success)
  {
    gdk_drag_drop_done(cast(GdkDrag*)this._cPtr, success);
  }

  /**
      Determines the bitmask of possible actions proposed by the source.
      Returns: the [gdk.types.DragAction] flags
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_get_actions(cast(GdkDrag*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gdk.content_provider.ContentProvider] associated to the [gdk.drag.Drag] object.
      Returns: The [gdk.content_provider.ContentProvider] associated to drag.
  */
  gdk.content_provider.ContentProvider getContent()
  {
    GdkContentProvider* _cretval;
    _cretval = gdk_drag_get_content(cast(GdkDrag*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gdk.device.Device] associated to the [gdk.drag.Drag] object.
      Returns: The [gdk.device.Device] associated to drag.
  */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_drag_get_device(cast(GdkDrag*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gdk.display.Display] that the drag object was created for.
      Returns: a [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_drag_get_display(cast(GdkDrag*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the surface on which the drag icon should be rendered
      during the drag operation.
      
      Note that the surface may not be available until the drag operation
      has begun. GDK will move the surface in accordance with the ongoing
      drag operation. The surface is owned by drag and will be destroyed
      when the drag operation is over.
      Returns: the drag surface
  */
  gdk.surface.Surface getDragSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_drag_get_drag_surface(cast(GdkDrag*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the formats supported by this [gdk.drag.Drag] object.
      Returns: a [gdk.content_formats.ContentFormats]
  */
  gdk.content_formats.ContentFormats getFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_drag_get_formats(cast(GdkDrag*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Determines the action chosen by the drag destination.
      Returns: a [gdk.types.DragAction] value
  */
  gdk.types.DragAction getSelectedAction()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_get_selected_action(cast(GdkDrag*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gdk.surface.Surface] where the drag originates.
      Returns: The [gdk.surface.Surface] where the drag originates
  */
  gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_drag_get_surface(cast(GdkDrag*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the position of the drag surface that will be kept
      under the cursor hotspot.
      
      Initially, the hotspot is at the top left corner of the drag surface.
  
      Params:
        hotX = x coordinate of the drag surface hotspot
        hotY = y coordinate of the drag surface hotspot
  */
  void setHotspot(int hotX, int hotY)
  {
    gdk_drag_set_hotspot(cast(GdkDrag*)this._cPtr, hotX, hotY);
  }

  /**
      Connect to `Cancel` signal.
  
      Emitted when the drag operation is cancelled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.types.DragCancelReason reason, gdk.drag.Drag drag))
  
          `reason` The reason the drag was cancelled (optional)
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.types.DragCancelReason)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag.Drag)))
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
  
      Emitted when the destination side has finished reading all data.
        
        The drag object can now free all miscellaneous data.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag.Drag drag))
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDndFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag.Drag)))
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
  
      Emitted when the drop operation is performed on an accepting client.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag.Drag drag))
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDropPerformed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag.Drag)))
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
    return connectSignalClosure("drop-performed", closure, after);
  }
}
