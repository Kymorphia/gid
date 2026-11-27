/// Module for [Drag] class
module gid.gdk4.drag;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.content_formats;
import gid.gdk4.content_provider;
import gid.gdk4.device;
import gid.gdk4.display;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Represents the source of an ongoing DND operation.
    
    A [gid.gdk4.drag.Drag] is created when a drag is started, and stays alive for duration of
    the DND operation. After a drag has been started with [gid.gdk4.drag.Drag.begin],
    the caller gets informed about the status of the ongoing drag operation
    with signals on the [gid.gdk4.drag.Drag] object.
    
    GTK provides a higher level abstraction based on top of these functions,
    and so they are not normally needed in GTK applications. See the
    "Drag and Drop" section of the GTK documentation for more information.
*/
@gidGir("Drag")
class Drag : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_drag_get_type != &gidSymbolNotFound ? gdk_drag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDrag";
  }

  /** Returns `this`, for use in `with` statements. */
  override Drag self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.drag.Drag]
      Returns: New builder object
  */
  static DragGidBuilder builder() nothrow
  {
    return new DragGidBuilder;
  }

  /**
      Get `actions` property.
      Returns: The possible actions of this drag.
  */
  @property gid.gdk4.types.DragAction actions() nothrow
  {
    return getActions();
  }

  /**
      Set `actions` property.
      Params:
        propval = The possible actions of this drag.
  */
  @property void actions(gid.gdk4.types.DragAction propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.types.DragAction)("actions", propval);
  }

  /**
      Get `content` property.
      Returns: The [gid.gdk4.content_provider.ContentProvider].
  */
  @property gid.gdk4.content_provider.ContentProvider content() nothrow
  {
    return getContent();
  }

  /**
      Get `device` property.
      Returns: The [gid.gdk4.device.Device] that is performing the drag.
  */
  @property gid.gdk4.device.Device device() nothrow
  {
    return getDevice();
  }

  /**
      Get `display` property.
      Returns: The [gid.gdk4.display.Display] that the drag belongs to.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `formats` property.
      Returns: The possible formats that the drag can provide its data in.
  */
  @property gid.gdk4.content_formats.ContentFormats formats() nothrow
  {
    return getFormats();
  }

  /**
      Get `selectedAction` property.
      Returns: The currently selected action of the drag.
  */
  @property gid.gdk4.types.DragAction selectedAction() nothrow
  {
    return getSelectedAction();
  }

  /**
      Set `selectedAction` property.
      Params:
        propval = The currently selected action of the drag.
  */
  @property void selectedAction(gid.gdk4.types.DragAction propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.types.DragAction)("selected-action", propval);
  }

  /**
      Get `surface` property.
      Returns: The surface where the drag originates.
  */
  @property gid.gdk4.surface.Surface surface() nothrow
  {
    return getSurface();
  }

  /**
      Starts a drag and creates a new drag context for it.
      
      This function is called by the drag source. After this call, you
      probably want to set up the drag icon using the surface returned
      by [gid.gdk4.drag.Drag.getDragSurface].
      
      This function returns a reference to the [gid.gdk4.drag.Drag] object,
      but GTK keeps its own reference as well, as long as the DND operation
      is going on.
      
      Note: if actions include [gid.gdk4.types.DragAction.Move], you need to listen for
      the [gid.gdk4.drag.Drag.dndFinished] signal and delete the data at
      the source if [gid.gdk4.drag.Drag.getSelectedAction] returns
      [gid.gdk4.types.DragAction.Move].
  
      Params:
        surface = the source surface for this drag
        device = the device that controls this drag
        content = the offered content
        actions = the actions supported by this drag
        dx = the x offset to device's position where the drag nominally started
        dy = the y offset to device's position where the drag nominally started
      Returns: a newly created [gid.gdk4.drag.Drag]
  */
  static gid.gdk4.drag.Drag begin(gid.gdk4.surface.Surface surface, gid.gdk4.device.Device device, gid.gdk4.content_provider.ContentProvider content, gid.gdk4.types.DragAction actions, double dx, double dy) nothrow
  {
    GdkDrag* _cretval;
    _cretval = gdk_drag_begin(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, content ? cast(GdkContentProvider*)content._cPtr(No.Dup) : null, actions, dx, dy);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.drag.Drag)(cast(GdkDrag*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Informs GDK that the drop ended.
      
      Passing false for success may trigger a drag cancellation
      animation.
      
      This function is called by the drag source, and should be the
      last call before dropping the reference to the drag.
      
      The [gid.gdk4.drag.Drag] will only take the first [gid.gdk4.drag.Drag.dropDone]
      call as effective, if this function is called multiple times,
      all subsequent calls will be ignored.
  
      Params:
        success = whether the drag was ultimatively successful
  */
  void dropDone(bool success) nothrow
  {
    gdk_drag_drop_done(cast(GdkDrag*)this._cPtr, success);
  }

  /**
      Determines the bitmask of possible actions proposed by the source.
      Returns: the [gid.gdk4.types.DragAction] flags
  */
  gid.gdk4.types.DragAction getActions() nothrow
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_get_actions(cast(GdkDrag*)this._cPtr);
    gid.gdk4.types.DragAction _retval = cast(gid.gdk4.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gdk4.content_provider.ContentProvider] associated to the [gid.gdk4.drag.Drag] object.
      Returns: The [gid.gdk4.content_provider.ContentProvider] associated to drag.
  */
  gid.gdk4.content_provider.ContentProvider getContent() nothrow
  {
    GdkContentProvider* _cretval;
    _cretval = gdk_drag_get_content(cast(GdkDrag*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gid.gdk4.device.Device] associated to the [gid.gdk4.drag.Drag] object.
      Returns: The [gid.gdk4.device.Device] associated to drag.
  */
  gid.gdk4.device.Device getDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_drag_get_device(cast(GdkDrag*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gdk4.display.Display] that the drag object was created for.
      Returns: a [gid.gdk4.display.Display]
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_drag_get_display(cast(GdkDrag*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
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
  gid.gdk4.surface.Surface getDragSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_drag_get_drag_surface(cast(GdkDrag*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the formats supported by this [gid.gdk4.drag.Drag] object.
      Returns: a [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats getFormats() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_drag_get_formats(cast(GdkDrag*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Determines the action chosen by the drag destination.
      Returns: a [gid.gdk4.types.DragAction] value
  */
  gid.gdk4.types.DragAction getSelectedAction() nothrow
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_get_selected_action(cast(GdkDrag*)this._cPtr);
    gid.gdk4.types.DragAction _retval = cast(gid.gdk4.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gdk4.surface.Surface] where the drag originates.
      Returns: The [gid.gdk4.surface.Surface] where the drag originates
  */
  gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_drag_get_surface(cast(GdkDrag*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
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
  void setHotspot(int hotX, int hotY) nothrow
  {
    gdk_drag_set_hotspot(cast(GdkDrag*)this._cPtr, hotX, hotY);
  }

  /**
      Connect to `Cancel` signal.
  
      Emitted when the drag operation is cancelled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.types.DragCancelReason reason, gid.gdk4.drag.Drag drag)`
  
          `reason` The reason the drag was cancelled (optional)
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancel(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk4.types.DragCancelReason)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.drag.Drag)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.drag.Drag.cancel");
      }
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
  
          `void callback(gid.gdk4.drag.Drag drag)`
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDndFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.drag.Drag)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.drag.Drag.dndFinished");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("dnd-finished", closure, after);
  }

  /**
      Connect to `DropPerformed` signal.
  
      Emitted when the drop operation is performed on an accepting client.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.drag.Drag drag)`
  
          `drag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDropPerformed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.drag.Drag)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.drag.Drag.dropPerformed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop-performed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.drag.Drag]
class DragGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `actions` property.
      Params:
        propval = The possible actions of this drag.
      Returns: Builder instance for fluent chaining
  */
  T actions(gid.gdk4.types.DragAction propval) nothrow
  {
    return setProperty("actions", propval);
  }

  /**
      Set `content` property.
      Params:
        propval = The [gid.gdk4.content_provider.ContentProvider].
      Returns: Builder instance for fluent chaining
  */
  T content(gid.gdk4.content_provider.ContentProvider propval) nothrow
  {
    return setProperty("content", propval);
  }

  /**
      Set `device` property.
      Params:
        propval = The [gid.gdk4.device.Device] that is performing the drag.
      Returns: Builder instance for fluent chaining
  */
  T device(gid.gdk4.device.Device propval) nothrow
  {
    return setProperty("device", propval);
  }

  /**
      Set `formats` property.
      Params:
        propval = The possible formats that the drag can provide its data in.
      Returns: Builder instance for fluent chaining
  */
  T formats(gid.gdk4.content_formats.ContentFormats propval) nothrow
  {
    return setProperty("formats", propval);
  }

  /**
      Set `selectedAction` property.
      Params:
        propval = The currently selected action of the drag.
      Returns: Builder instance for fluent chaining
  */
  T selectedAction(gid.gdk4.types.DragAction propval) nothrow
  {
    return setProperty("selected-action", propval);
  }

  /**
      Set `surface` property.
      Params:
        propval = The surface where the drag originates.
      Returns: Builder instance for fluent chaining
  */
  T surface(gid.gdk4.surface.Surface propval) nothrow
  {
    return setProperty("surface", propval);
  }
}

/// Fluent builder for [gid.gdk4.drag.Drag]
final class DragGidBuilder : DragGidBuilderImpl!DragGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Drag build() nothrow
  {
    return new Drag(cast(void*)createGObject(Drag._getGType), Yes.Take);
  }
}
