/// Module for [HandleBox] class
module gtk.handle_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    The #GtkHandleBox widget allows a portion of a window to be "torn
    off". It is a bin widget which displays its child and a handle that
    the user can drag to tear off a separate window (the “float
    window”) containing the child widget. A thin
    “ghost” is drawn in the original location of the
    handlebox. By dragging the separate window back to its original
    location, it can be reattached.
    
    When reattaching, the ghost and float window, must be aligned
    along one of the edges, the “snap edge”.
    This either can be specified by the application programmer
    explicitly, or GTK+ will pick a reasonable default based
    on the handle position.
    
    To make detaching and reattaching the handlebox as minimally confusing
    as possible to the user, it is important to set the snap edge so that
    the snap edge does not move when the handlebox is deattached. For
    instance, if the handlebox is packed at the bottom of a VBox, then
    when the handlebox is detached, the bottom edge of the handlebox's
    allocation will remain fixed as the height of the handlebox shrinks,
    so the snap edge should be set to [gtk.types.PositionType.Bottom].
    
    > #GtkHandleBox has been deprecated. It is very specialized, lacks features
    > to make it useful and most importantly does not fit well into modern
    > application design. Do not use it. There is no replacement.
*/
class HandleBox : gtk.bin.Bin
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
    return cast(void function())gtk_handle_box_get_type != &gidSymbolNotFound ? gtk_handle_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HandleBox self()
  {
    return this;
  }

  /** */
  @property bool childDetached()
  {
    return getChildDetached();
  }

  /** */
  @property gtk.types.PositionType handlePosition()
  {
    return getHandlePosition();
  }

  /** */
  @property void handlePosition(gtk.types.PositionType propval)
  {
    return setHandlePosition(propval);
  }

  /** */
  @property gtk.types.ShadowType shadowType()
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gtk.types.ShadowType propval)
  {
    return setShadowType(propval);
  }

  /** */
  @property gtk.types.PositionType snapEdge()
  {
    return getSnapEdge();
  }

  /** */
  @property void snapEdge(gtk.types.PositionType propval)
  {
    return setSnapEdge(propval);
  }

  /** */
  @property bool snapEdgeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("snap-edge-set");
  }

  /** */
  @property void snapEdgeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("snap-edge-set", propval);
  }

  /**
      Create a new handle box.
      Returns: a new #GtkHandleBox.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_handle_box_new();
    this(_cretval, No.Take);
  }

  /**
      Whether the handlebox’s child is currently detached.
      Returns: true if the child is currently detached, otherwise false
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  bool getChildDetached()
  {
    bool _retval;
    _retval = cast(bool)gtk_handle_box_get_child_detached(cast(GtkHandleBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the handle position of the handle box. See
      [gtk.handle_box.HandleBox.setHandlePosition].
      Returns: the current handle position.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gtk.types.PositionType getHandlePosition()
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_handle_position(cast(GtkHandleBox*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Gets the type of shadow drawn around the handle box. See
      [gtk.handle_box.HandleBox.setShadowType].
      Returns: the type of shadow currently drawn around the handle box.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_handle_box_get_shadow_type(cast(GtkHandleBox*)this._cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Gets the edge used for determining reattachment of the handle box.
      See [gtk.handle_box.HandleBox.setSnapEdge].
      Returns: the edge used for determining reattachment, or
          (GtkPositionType)-1 if this is determined (as per default)
          from the handle position.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gtk.types.PositionType getSnapEdge()
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_snap_edge(cast(GtkHandleBox*)this._cPtr);
    gtk.types.PositionType _retval = cast(gtk.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Sets the side of the handlebox where the handle is drawn.
  
      Params:
        position = the side of the handlebox where the handle should be drawn.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  void setHandlePosition(gtk.types.PositionType position)
  {
    gtk_handle_box_set_handle_position(cast(GtkHandleBox*)this._cPtr, position);
  }

  /**
      Sets the type of shadow to be drawn around the border
      of the handle box.
  
      Params:
        type = the shadow type.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_handle_box_set_shadow_type(cast(GtkHandleBox*)this._cPtr, type);
  }

  /**
      Sets the snap edge of a handlebox. The snap edge is
      the edge of the detached child that must be aligned
      with the corresponding edge of the “ghost” left
      behind when the child was detached to reattach
      the torn-off window. Usually, the snap edge should
      be chosen so that it stays in the same place on
      the screen when the handlebox is torn off.
      
      If the snap edge is not set, then an appropriate value
      will be guessed from the handle position. If the
      handle position is [gtk.types.PositionType.Right] or [gtk.types.PositionType.Left],
      then the snap edge will be [gtk.types.PositionType.Top], otherwise
      it will be [gtk.types.PositionType.Left].
  
      Params:
        edge = the snap edge, or -1 to unset the value; in which
            case GTK+ will try to guess an appropriate value
            in the future.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  void setSnapEdge(gtk.types.PositionType edge)
  {
    gtk_handle_box_set_snap_edge(cast(GtkHandleBox*)this._cPtr, edge);
  }

  /**
      Connect to `ChildAttached` signal.
  
      This signal is emitted when the contents of the
      handlebox are reattached to the main window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox))
  
          `widget` the child widget of the handlebox.
            (this argument provides no extra information
            and is here only for backwards-compatibility) (optional)
  
          `handleBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  ulong connectChildAttached(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.handle_box.HandleBox)))
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
    return connectSignalClosure("child-attached", closure, after);
  }

  /**
      Connect to `ChildDetached` signal.
  
      This signal is emitted when the contents of the
      handlebox are detached from the main window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.widget.Widget widget, gtk.handle_box.HandleBox handleBox))
  
          `widget` the child widget of the handlebox.
            (this argument provides no extra information
            and is here only for backwards-compatibility) (optional)
  
          `handleBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  ulong connectChildDetached(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.handle_box.HandleBox)))
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
    return connectSignalClosure("child-detached", closure, after);
  }
}
