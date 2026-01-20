/// Module for [DragSource] class
module gtk.drag_source;

import gdk.content_provider;
import gdk.drag;
import gdk.paintable;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.drag_source.DragSource] is an event controller to initiate Drag-And-Drop operations.
    
    [gtk.drag_source.DragSource] can be set up with the necessary
    ingredients for a DND operation ahead of time. This includes
    the source for the data that is being transferred, in the form
    of a [gdk.content_provider.ContentProvider], the desired action, and the icon to
    use during the drag operation. After setting it up, the drag
    source must be added to a widget as an event controller, using
    [gtk.widget.Widget.addController].
    
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
    to set them up just in time. To do so, [gtk.drag_source.DragSource] has
    [gtk.drag_source.DragSource.prepare] and `signal@Gtk.DragSource::drag-begin`
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
    
    The ::drag-begin signal is emitted after the [gdk.drag.Drag] object has
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
    
    During the DND operation, [gtk.drag_source.DragSource] emits signals that
    can be used to obtain updates about the status of the operation,
    but it is not normally necessary to connect to any signals,
    except for one case: when the supported actions include
    [gdk.types.DragAction.Move], you need to listen for the
    `signal@Gtk.DragSource::drag-end` signal and delete the
    data after it has been transferred.
*/
class DragSource : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_drag_source_get_type != &gidSymbolNotFound ? gtk_drag_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DragSource self()
  {
    return this;
  }

  /**
      Get `actions` property.
      Returns: The actions that are supported by drag operations from the source.
        
        Note that you must handle the `signal@Gtk.DragSource::drag-end` signal
        if the actions include [gdk.types.DragAction.Move].
  */
  @property gdk.types.DragAction actions()
  {
    return getActions();
  }

  /**
      Set `actions` property.
      Params:
        propval = The actions that are supported by drag operations from the source.
          
          Note that you must handle the `signal@Gtk.DragSource::drag-end` signal
          if the actions include [gdk.types.DragAction.Move].
  */
  @property void actions(gdk.types.DragAction propval)
  {
    return setActions(propval);
  }

  /**
      Get `content` property.
      Returns: The data that is offered by drag operations from this source.
  */
  @property gdk.content_provider.ContentProvider content()
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The data that is offered by drag operations from this source.
  */
  @property void content(gdk.content_provider.ContentProvider propval)
  {
    return setContent(propval);
  }

  /**
      Creates a new [gtk.drag_source.DragSource] object.
      Returns: the new [gtk.drag_source.DragSource]
  */
  this()
  {
    GtkDragSource* _cretval;
    _cretval = gtk_drag_source_new();
    this(_cretval, Yes.Take);
  }

  /**
      Cancels a currently ongoing drag operation.
  */
  void dragCancel()
  {
    gtk_drag_source_drag_cancel(cast(GtkDragSource*)this._cPtr);
  }

  /**
      Gets the actions that are currently set on the [gtk.drag_source.DragSource].
      Returns: the actions set on source
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gtk_drag_source_get_actions(cast(GtkDragSource*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets the current content provider of a [gtk.drag_source.DragSource].
      Returns: the [gdk.content_provider.ContentProvider] of source
  */
  gdk.content_provider.ContentProvider getContent()
  {
    GdkContentProvider* _cretval;
    _cretval = gtk_drag_source_get_content(cast(GtkDragSource*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.content_provider.ContentProvider)(cast(GdkContentProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the underlying [gdk.drag.Drag] object for an ongoing drag.
      Returns: the [gdk.drag.Drag] of the current
          drag operation
  */
  gdk.drag.Drag getDrag()
  {
    GdkDrag* _cretval;
    _cretval = gtk_drag_source_get_drag(cast(GtkDragSource*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drag.Drag)(cast(GdkDrag*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the actions on the [gtk.drag_source.DragSource].
      
      During a DND operation, the actions are offered to potential
      drop targets. If actions include [gdk.types.DragAction.Move], you need
      to listen to the `signalGtk.DragSource::drag-end` signal and
      handle delete_data being true.
      
      This function can be called before a drag is started,
      or in a handler for the [gtk.drag_source.DragSource.prepare] signal.
  
      Params:
        actions = the actions to offer
  */
  void setActions(gdk.types.DragAction actions)
  {
    gtk_drag_source_set_actions(cast(GtkDragSource*)this._cPtr, actions);
  }

  /**
      Sets a content provider on a [gtk.drag_source.DragSource].
      
      When the data is requested in the cause of a DND operation,
      it will be obtained from the content provider.
      
      This function can be called before a drag is started,
      or in a handler for the [gtk.drag_source.DragSource.prepare] signal.
      
      You may consider setting the content provider back to
      null in a `signalGtk.DragSource::drag-end` signal handler.
  
      Params:
        content = a [gdk.content_provider.ContentProvider]
  */
  void setContent(gdk.content_provider.ContentProvider content = null)
  {
    gtk_drag_source_set_content(cast(GtkDragSource*)this._cPtr, content ? cast(GdkContentProvider*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets a paintable to use as icon during DND operations.
      
      The hotspot coordinates determine the point on the icon
      that gets aligned with the hotspot of the cursor.
      
      If paintable is null, a default icon is used.
      
      This function can be called before a drag is started, or in
      a [gtk.drag_source.DragSource.prepare] or
      `signalGtk.DragSource::drag-begin` signal handler.
  
      Params:
        paintable = the [gdk.paintable.Paintable] to use as icon
        hotX = the hotspot X coordinate on the icon
        hotY = the hotspot Y coordinate on the icon
  */
  void setIcon(gdk.paintable.Paintable paintable, int hotX, int hotY)
  {
    gtk_drag_source_set_icon(cast(GtkDragSource*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null, hotX, hotY);
  }

  /**
      Connect to `DragBegin` signal.
  
      Emitted on the drag source when a drag is started.
        
        It can be used to e.g. set a custom drag icon with
        [gtk.drag_source.DragSource.setIcon].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag.Drag drag, gtk.drag_source.DragSource dragSource))
  
          `drag` the [gdk.drag.Drag] object (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.drag_source.DragSource)))
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
  
          $(D bool callback(gdk.drag.Drag drag, gdk.types.DragCancelReason reason, gtk.drag_source.DragSource dragSource))
  
          `drag` the [gdk.drag.Drag] object (optional)
  
          `reason` information on why the drag failed (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
          `Returns` true if the failed drag operation has been already handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragCancel(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.types.DragCancelReason)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drag_source.DragSource)))
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
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-cancel", closure, after);
  }

  /**
      Connect to `DragEnd` signal.
  
      Emitted on the drag source when a drag is finished.
        
        A typical reason to connect to this signal is to undo
        things done in [gtk.drag_source.DragSource.prepare] or
        `signalGtk.DragSource::drag-begin` handlers.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag.Drag drag, bool deleteData, gtk.drag_source.DragSource dragSource))
  
          `drag` the [gdk.drag.Drag] object (optional)
  
          `deleteData` true if the drag was performing [gdk.types.DragAction.Move],
               and the data should be deleted (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.drag.Drag)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drag_source.DragSource)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Connect to `Prepare` signal.
  
      Emitted when a drag is about to be initiated.
        
        It returns the [gdk.content_provider.ContentProvider] to use for the drag that is about
        to start. The default handler for this signal returns the value of
        the [gtk.drag_source.DragSource.content] property, so if you set up that
        property ahead of time, you don't need to connect to this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.content_provider.ContentProvider callback(double x, double y, gtk.drag_source.DragSource dragSource))
  
          `x` the X coordinate of the drag starting point (optional)
  
          `y` the Y coordinate of the drag starting point (optional)
  
          `dragSource` the instance the signal is connected to (optional)
  
          `Returns` a [gdk.content_provider.ContentProvider]
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrepare(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gdk.content_provider.ContentProvider)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drag_source.DragSource)))
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
      setVal!(gdk.content_provider.ContentProvider)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }
}
