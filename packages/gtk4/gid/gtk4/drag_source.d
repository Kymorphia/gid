/// Module for [DragSource] class
module gid.gtk4.drag_source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.content_provider;
import gid.gdk4.drag;
import gid.gdk4.paintable;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.gesture_single;
import gid.gtk4.types;

/**
    An event controller to initiate Drag-And-Drop operations.
    
    [gid.gtk4.drag_source.DragSource] can be set up with the necessary
    ingredients for a DND operation ahead of time. This includes
    the source for the data that is being transferred, in the form
    of a [gid.gdk4.content_provider.ContentProvider], the desired action, and the icon to
    use during the drag operation. After setting it up, the drag
    source must be added to a widget as an event controller, using
    [gid.gtk4.widget.Widget.addController].
    
    ```c
    static void
    my_widget_init (MyWidget *self)
    {
      GtkDragSource *drag_source = gtk_drag_source_new ();
    
      g_signal_connect (drag_source, "prepare", G_CALLBACK (on_drag_prepare), self);
      g_signal_connect (drag_source, "drag-begin", G_CALLBACK (on_drag_begin), self);
    
      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (drag_source));
    }
    ```
    
    Setting up the content provider and icon ahead of time only makes
    sense when the data does not change. More commonly, you will want
    to set them up just in time. To do so, [gid.gtk4.drag_source.DragSource] has
    [gid.gtk4.drag_source.DragSource.prepare] and [gid.gtk4.drag_source.DragSource.dragBegin]
    signals.
    
    The ::prepare signal is emitted before a drag is started, and
    can be used to set the content provider and actions that the
    drag should be started with.
    
    ```c
    static GdkContentProvider *
    on_drag_prepare (GtkDragSource *source,
                     double         x,
                     double         y,
                     MyWidget      *self)
    {
      // This widget supports two types of content: GFile objects
      // and GdkPixbuf objects; GTK will handle the serialization
      // of these types automatically
      GFile *file = my_widget_get_file (self);
      GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);
    
      return gdk_content_provider_new_union ((GdkContentProvider *[2]) {
          gdk_content_provider_new_typed (G_TYPE_FILE, file),
          gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),
        }, 2);
    }
    ```
    
    The ::drag-begin signal is emitted after the [gid.gdk4.drag.Drag] object has
    been created, and can be used to set up the drag icon.
    
    ```c
    static void
    on_drag_begin (GtkDragSource *source,
                   GdkDrag       *drag,
                   MyWidget      *self)
    {
      // Set the widget as the drag icon
      GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));
      gtk_drag_source_set_icon (source, paintable, 0, 0);
      g_object_unref (paintable);
    }
    ```
    
    During the DND operation, [gid.gtk4.drag_source.DragSource] emits signals that
    can be used to obtain updates about the status of the operation,
    but it is not normally necessary to connect to any signals,
    except for one case: when the supported actions include
    [gid.gdk4.types.DragAction.Move], you need to listen for the
    [gid.gtk4.drag_source.DragSource.dragEnd] signal and delete the
    data after it has been transferred.
*/
@gidGir("DragSource", "DragSourceClass")
class DragSource : gid.gtk4.gesture_single.GestureSingle
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_drag_source_get_type != &gidSymbolNotFound ? gtk_drag_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkDragSource";
  }

  /** Returns `this`, for use in `with` statements. */
  override DragSource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.drag_source.DragSource]
      Returns: New builder object
  */
  static DragSourceGidBuilder builder() nothrow
  {
    return new DragSourceGidBuilder;
  }

  /**
      Get `actions` property.
      Returns: The actions that are supported by drag operations from the source.
        
        Note that you must handle the [gid.gtk4.drag_source.DragSource.dragEnd] signal
        if the actions include [gid.gdk4.types.DragAction.Move].
  */
  @property gid.gdk4.types.DragAction actions() nothrow
  {
    return getActions();
  }

  /**
      Set `actions` property.
      Params:
        propval = The actions that are supported by drag operations from the source.
          
          Note that you must handle the [gid.gtk4.drag_source.DragSource.dragEnd] signal
          if the actions include [gid.gdk4.types.DragAction.Move].
  */
  @property void actions(gid.gdk4.types.DragAction propval) nothrow
  {
    setActions(propval);
  }

  /**
      Get `content` property.
      Returns: The data that is offered by drag operations from this source.
  */
  @property gid.gdk4.content_provider.ContentProvider content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The data that is offered by drag operations from this source.
  */
  @property void content(gid.gdk4.content_provider.ContentProvider propval) nothrow
  {
    setContent(propval);
  }

  /**
      Creates a new [gid.gtk4.drag_source.DragSource] object.
      Returns: the new [gid.gtk4.drag_source.DragSource]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkDragSource* _cretval;
      _cretval = gtk_drag_source_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Cancels a currently ongoing drag operation.
  */
  void dragCancel() nothrow
  {
    gtk_drag_source_drag_cancel(cast(GtkDragSource*)this._cPtr);
  }

  /**
      Gets the actions that are currently set on the [gid.gtk4.drag_source.DragSource].
      Returns: the actions set on source
  */
  gid.gdk4.types.DragAction getActions() nothrow
  {
    GdkDragAction _cretval;
    _cretval = gtk_drag_source_get_actions(cast(GtkDragSource*)this._cPtr);
    gid.gdk4.types.DragAction _retval = cast(gid.gdk4.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets the current content provider of a [gid.gtk4.drag_source.DragSource].
      Returns: the [gid.gdk4.content_provider.ContentProvider] of source
  */
  gid.gdk4.content_provider.ContentProvider getContent() nothrow
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_drag_source_get_content(cast(GtkDragSource*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the underlying [gid.gdk4.drag.Drag] object for an ongoing drag.
      Returns: the [gid.gdk4.drag.Drag] of the current
          drag operation
  */
  gid.gdk4.drag.Drag getDrag() nothrow
  {
    GdkDrag* _cretval;
    _cretval = gtk_drag_source_get_drag(cast(GtkDragSource*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.drag.Drag)(cast(GdkDrag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the actions on the [gid.gtk4.drag_source.DragSource].
      
      During a DND operation, the actions are offered to potential
      drop targets. If actions include [gid.gdk4.types.DragAction.Move], you need
      to listen to the [gid.gtk4.drag_source.DragSource.dragEnd] signal and
      handle delete_data being true.
      
      This function can be called before a drag is started,
      or in a handler for the [gid.gtk4.drag_source.DragSource.prepare] signal.
  
      Params:
        actions = the actions to offer
  */
  void setActions(gid.gdk4.types.DragAction actions) nothrow
  {
    gtk_drag_source_set_actions(cast(GtkDragSource*)this._cPtr, actions);
  }

  /**
      Sets a content provider on a [gid.gtk4.drag_source.DragSource].
      
      When the data is requested in the cause of a DND operation,
      it will be obtained from the content provider.
      
      This function can be called before a drag is started,
      or in a handler for the [gid.gtk4.drag_source.DragSource.prepare] signal.
      
      You may consider setting the content provider back to
      null in a [gid.gtk4.drag_source.DragSource.dragEnd] signal handler.
  
      Params:
        content = a [gid.gdk4.content_provider.ContentProvider]
  */
  void setContent(gid.gdk4.content_provider.ContentProvider content = null) nothrow
  {
    gtk_drag_source_set_content(cast(GtkDragSource*)this._cPtr, content ? cast(GdkContentProvider*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets a paintable to use as icon during DND operations.
      
      The hotspot coordinates determine the point on the icon
      that gets aligned with the hotspot of the cursor.
      
      If paintable is null, a default icon is used.
      
      This function can be called before a drag is started, or in
      a [gid.gtk4.drag_source.DragSource.prepare] or
      [gid.gtk4.drag_source.DragSource.dragBegin] signal handler.
  
      Params:
        paintable = the [gid.gdk4.paintable.Paintable] to use as icon
        hotX = the hotspot X coordinate on the icon
        hotY = the hotspot Y coordinate on the icon
  */
  void setIcon(gid.gdk4.paintable.Paintable paintable, int hotX, int hotY) nothrow
  {
    gtk_drag_source_set_icon(cast(GtkDragSource*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null, hotX, hotY);
  }

  /**
      Connect to `DragBegin` signal.
  
      Emitted on the drag source when a drag is started.
        
        It can be used to e.g. set a custom drag icon with
        [gid.gtk4.drag_source.DragSource.setIcon].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.drag.Drag drag, gid.gtk4.drag_source.DragSource dragSource)`
  
          `drag` the [gid.gdk4.drag.Drag] object (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragBegin(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.drag_source.DragSource)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drag_source.DragSource.dragBegin");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Connect to `DragCancel` signal.
  
      Emitted on the drag source when a drag has failed.
        
        The signal handler may handle a failed drag operation based on
        the type of error. It should return true if the failure has been handled
        and the default "drag operation failed" animation should not be shown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gdk4.drag.Drag drag, gid.gdk4.types.DragCancelReason reason, gid.gtk4.drag_source.DragSource dragSource)`
  
          `drag` the [gid.gdk4.drag.Drag] object (optional)
  
          `reason` information on why the drag failed (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
          `Returns` true if the failed drag operation has been already handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragCancel(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk4.types.DragCancelReason)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.drag_source.DragSource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drag_source.DragSource.dragCancel");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-cancel", closure, after);
  }

  /**
      Connect to `DragEnd` signal.
  
      Emitted on the drag source when a drag is finished.
        
        A typical reason to connect to this signal is to undo
        things done in [gid.gtk4.drag_source.DragSource.prepare] or
        [gid.gtk4.drag_source.DragSource.dragBegin] handlers.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.drag.Drag drag, bool deleteData, gid.gtk4.drag_source.DragSource dragSource)`
  
          `drag` the [gid.gdk4.drag.Drag] object (optional)
  
          `deleteData` true if the drag was performing [gid.gdk4.types.DragAction.Move],
               and the data should be deleted (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.drag_source.DragSource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drag_source.DragSource.dragEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Connect to `Prepare` signal.
  
      Emitted when a drag is about to be initiated.
        
        It returns the [gid.gdk4.content_provider.ContentProvider] to use for the drag that is about
        to start. The default handler for this signal returns the value of
        the [gid.gtk4.drag_source.DragSource.content] property, so if you set up that
        property ahead of time, you don't need to connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gdk4.content_provider.ContentProvider callback(double x, double y, gid.gtk4.drag_source.DragSource dragSource)`
  
          `x` the X coordinate of the drag starting point (optional)
  
          `y` the Y coordinate of the drag starting point (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
          `Returns` a [gid.gdk4.content_provider.ContentProvider]
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPrepare(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gdk4.content_provider.ContentProvider)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.drag_source.DragSource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gdk4.content_provider.ContentProvider _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drag_source.DragSource.prepare");
      }

      setVal!(gid.gdk4.content_provider.ContentProvider)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.drag_source.DragSource]
class DragSourceGidBuilderImpl(T) : gid.gtk4.gesture_single.GestureSingleGidBuilderImpl!T
{

  /**
      Set `actions` property.
      Params:
        propval = The actions that are supported by drag operations from the source.
          
          Note that you must handle the [gid.gtk4.drag_source.DragSource.dragEnd] signal
          if the actions include [gid.gdk4.types.DragAction.Move].
      Returns: Builder instance for fluent chaining
  */
  T actions(gid.gdk4.types.DragAction propval) nothrow
  {
    return setProperty("actions", propval);
  }

  /**
      Set `content` property.
      Params:
        propval = The data that is offered by drag operations from this source.
      Returns: Builder instance for fluent chaining
  */
  T content(gid.gdk4.content_provider.ContentProvider propval) nothrow
  {
    return setProperty("content", propval);
  }
}

/// Fluent builder for [gid.gtk4.drag_source.DragSource]
final class DragSourceGidBuilder : DragSourceGidBuilderImpl!DragSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DragSource build() nothrow
  {
    return new DragSource(cast(void*)createGObject(DragSource._getGType), Yes.Take);
  }
}
