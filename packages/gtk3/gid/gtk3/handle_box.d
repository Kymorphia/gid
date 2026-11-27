/// Module for [HandleBox] class
module gid.gtk3.handle_box;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.gtk3.widget;

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
    so the snap edge should be set to [gid.gtk4.types.PositionType.Bottom].
    
    > #GtkHandleBox has been deprecated. It is very specialized, lacks features
    > to make it useful and most importantly does not fit well into modern
    > application design. Do not use it. There is no replacement.
*/
@gidGir("HandleBox", "HandleBoxClass")
class HandleBox : gid.gtk3.bin.Bin
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
    return cast(void function())gtk_handle_box_get_type != &gidSymbolNotFound ? gtk_handle_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHandleBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override HandleBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.handle_box.HandleBox]
      Returns: New builder object
  */
  static HandleBoxGidBuilder builder() nothrow
  {
    return new HandleBoxGidBuilder;
  }

  /** */
  @property bool childDetached() nothrow
  {
    return getChildDetached();
  }

  /** */
  @property gid.gtk3.types.PositionType handlePosition() nothrow
  {
    return getHandlePosition();
  }

  /** */
  @property void handlePosition(gid.gtk3.types.PositionType propval) nothrow
  {
    setHandlePosition(propval);
  }

  /** */
  @property gid.gtk3.types.ShadowType shadowType() nothrow
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    setShadowType(propval);
  }

  /** */
  @property gid.gtk3.types.PositionType snapEdge() nothrow
  {
    return getSnapEdge();
  }

  /** */
  @property void snapEdge(gid.gtk3.types.PositionType propval) nothrow
  {
    setSnapEdge(propval);
  }

  /** */
  @property bool snapEdgeSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("snap-edge-set");
  }

  /** */
  @property void snapEdgeSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("snap-edge-set", propval);
  }

  /**
      Create a new handle box.
      Returns: a new #GtkHandleBox.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_handle_box_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Signal emitted when the contents of the handlebox
         are reattached to the main window. Deprecated: 3.4.
  
      Params:
        child = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChildAttached` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChildAttached(gid.gtk3.widget.Widget child)
  {
    auto _klass = cast(GtkHandleBoxClass*)_vfuncClass;
    if (!_klass.childAttached)
      return;

    _klass.childAttached(cast(GtkHandleBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Signal emitted when the contents of the handlebox
         are detached from the main window. Deprecated: 3.4.
  
      Params:
        child = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChildDetached` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncChildDetached(gid.gtk3.widget.Widget child)
  {
    auto _klass = cast(GtkHandleBoxClass*)_vfuncClass;
    if (!_klass.childDetached)
      return;

    _klass.childDetached(cast(GtkHandleBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Whether the handlebox’s child is currently detached.
      Returns: true if the child is currently detached, otherwise false
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  bool getChildDetached() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_handle_box_get_child_detached(cast(GtkHandleBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the handle position of the handle box. See
      [gid.gtk3.handle_box.HandleBox.setHandlePosition].
      Returns: the current handle position.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gid.gtk3.types.PositionType getHandlePosition() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_handle_position(cast(GtkHandleBox*)this._cPtr);
    gid.gtk3.types.PositionType _retval = cast(gid.gtk3.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Gets the type of shadow drawn around the handle box. See
      [gid.gtk3.handle_box.HandleBox.setShadowType].
      Returns: the type of shadow currently drawn around the handle box.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gid.gtk3.types.ShadowType getShadowType() nothrow
  {
    GtkShadowType _cretval;
    _cretval = gtk_handle_box_get_shadow_type(cast(GtkHandleBox*)this._cPtr);
    gid.gtk3.types.ShadowType _retval = cast(gid.gtk3.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Gets the edge used for determining reattachment of the handle box.
      See [gid.gtk3.handle_box.HandleBox.setSnapEdge].
      Returns: the edge used for determining reattachment, or
          (GtkPositionType)-1 if this is determined (as per default)
          from the handle position.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gid.gtk3.types.PositionType getSnapEdge() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_handle_box_get_snap_edge(cast(GtkHandleBox*)this._cPtr);
    gid.gtk3.types.PositionType _retval = cast(gid.gtk3.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Sets the side of the handlebox where the handle is drawn.
  
      Params:
        position = the side of the handlebox where the handle should be drawn.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  void setHandlePosition(gid.gtk3.types.PositionType position) nothrow
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
  void setShadowType(gid.gtk3.types.ShadowType type) nothrow
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
      handle position is [gid.gtk4.types.PositionType.Right] or [gid.gtk4.types.PositionType.Left],
      then the snap edge will be [gid.gtk4.types.PositionType.Top], otherwise
      it will be [gid.gtk4.types.PositionType.Left].
  
      Params:
        edge = the snap edge, or -1 to unset the value; in which
            case GTK+ will try to guess an appropriate value
            in the future.
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  void setSnapEdge(gid.gtk3.types.PositionType edge) nothrow
  {
    gtk_handle_box_set_snap_edge(cast(GtkHandleBox*)this._cPtr, edge);
  }

  /**
      Connect to `ChildAttached` signal.
  
      This signal is emitted when the contents of the
        handlebox are reattached to the main window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.widget.Widget widget, gid.gtk3.handle_box.HandleBox handleBox)`
  
          `widget` the child widget of the handlebox.
              (this argument provides no extra information
              and is here only for backwards-compatibility) (optional)
  
          `handleBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gulong connectChildAttached(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.handle_box.HandleBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.handle_box.HandleBox.childAttached");
      }
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
  
          `void callback(gid.gtk3.widget.Widget widget, gid.gtk3.handle_box.HandleBox handleBox)`
  
          `widget` the child widget of the handlebox.
              (this argument provides no extra information
              and is here only for backwards-compatibility) (optional)
  
          `handleBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: #GtkHandleBox has been deprecated.
  */
  gulong connectChildDetached(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.handle_box.HandleBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.handle_box.HandleBox.childDetached");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-detached", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from HandleBox
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.handle_box.HandleBox), T.stringof ~ " is not derived from gid.gtk3.handle_box.HandleBox");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChildAttached", true)[0]) == gid.gtk3.handle_box.HandleBox))
      _installVfunc(klass, "child_attached");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChildDetached", true)[0]) == gid.gtk3.handle_box.HandleBox))
      _installVfunc(klass, "child_detached");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkHandleBoxClass*)klass;

    switch (vfunc)
    {
      case "child_attached":
      {
        static extern(C) void _vfuncChildAttachedTramp(GtkHandleBox* handleBox, GtkWidget* child) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.handle_box.HandleBox)(cast(void*)handleBox);
          if (!_obj)
          {
            auto _klass = cast(GtkHandleBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)handleBox);
            if (_klass.childAttached)
              return (cast(typeof(&_vfuncChildAttachedTramp))_klass.childAttached)(handleBox, child);
            return;
          }

          try
          {
            _obj.vfuncChildAttached(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.handle_box.HandleBox.vfuncChildAttached");
          }
        }

        _klass.childAttached = cast(typeof(_klass.childAttached))&_vfuncChildAttachedTramp;
        break;
      }
      case "child_detached":
      {
        static extern(C) void _vfuncChildDetachedTramp(GtkHandleBox* handleBox, GtkWidget* child) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.handle_box.HandleBox)(cast(void*)handleBox);
          if (!_obj)
          {
            auto _klass = cast(GtkHandleBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)handleBox);
            if (_klass.childDetached)
              return (cast(typeof(&_vfuncChildDetachedTramp))_klass.childDetached)(handleBox, child);
            return;
          }

          try
          {
            _obj.vfuncChildDetached(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)child, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.handle_box.HandleBox.vfuncChildDetached");
          }
        }

        _klass.childDetached = cast(typeof(_klass.childDetached))&_vfuncChildDetachedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.handle_box.HandleBox]
class HandleBoxGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{


  /** */
  T handlePosition(gid.gtk3.types.PositionType propval) nothrow
  {
    return setProperty("handle-position", propval);
  }

  /** */
  T shadowType(gid.gtk3.types.ShadowType propval) nothrow
  {
    return setProperty("shadow-type", propval);
  }

  /** */
  T snapEdge(gid.gtk3.types.PositionType propval) nothrow
  {
    return setProperty("snap-edge", propval);
  }

  /** */
  T snapEdgeSet(bool propval) nothrow
  {
    return setProperty("snap-edge-set", propval);
  }
}

/// Fluent builder for [gid.gtk3.handle_box.HandleBox]
final class HandleBoxGidBuilder : HandleBoxGidBuilderImpl!HandleBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HandleBox build() nothrow
  {
    return new HandleBox(cast(void*)createGObject(HandleBox._getGType), Yes.Take);
  }
}
